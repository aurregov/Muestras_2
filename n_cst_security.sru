HA$PBExportHeader$n_cst_security.sru
$PBExportComments$Objeto para manejar niveles de acceso en aplicaciones Power con la conexi$$HEX1$$f300$$ENDHEX$$n a seguridad
forward
global type n_cst_security from nonvisualobject
end type
end forward

global type n_cst_security from nonvisualobject autoinstantiate
end type

type variables
n_ds_application ids_recursos
//lista de los recursos permitidos

// SA-57749. se declara propiedad para almacenar Nombre completo del empleado JCMR 17-11-2017
String is_de_usuario // 
end variables

forward prototypes
public function integer of_verificatag (long a_tag, String a_ventana)
public function integer of_seguridad (menu a_menu, string a_ventana)
public function integer of_seguridad (commandbutton a_boton, string a_ventana)
public function integer of_iniciar (long a_aplicacion, string a_usuario, transaction a_transaction)
end prototypes

public function integer of_verificatag (long a_tag, String a_ventana);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 11 de Octubre de 2003 HORA 09:59:04:006
// 
// Se verifica si el tag existe, dependiendo de la ventana, para determinar
// si se deshabilita la opcion
//////////////////////////////////////////////////////////////////////////
long ll_pos


ll_pos=ids_recursos.find("co_ventana='"+a_ventana+"' and co_opcion="+String(a_tag),&
                         1, ids_recursos.RowCount())

If ll_pos>0 Then
	Return 1
Else
	Return -1
End If



end function

public function integer of_seguridad (menu a_menu, string a_ventana);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 8 de Octubre de 2003 HORA 09:54:11:661
// 
// Verifica la seguridad de un men$$HEX1$$fa00$$ENDHEX$$
//////////////////////////////////////////////////////////////////////////
long i,ll_tot,ll_tag

ll_tot = UpperBound( a_menu.item )

For i = 1 TO ll_tot
	ll_tag=Long(a_menu.item[i].tag)
	
	If IsNull(ll_tag) Then ll_tag=0
	
//////////////////////////////////////////////////////////////////////////
// solo se verifica seguridad para los elementos que tengan tag, los que
// no permanecen en el estado inicial
//
// Solo se deshabilitan hojas
//////////////////////////////////////////////////////////////////////////
	
	If ll_tag>0 Then
		If of_verificaTag(ll_tag,a_ventana)<>1 And UpperBound( a_menu.item[i].item ) = 0 Then
			a_menu.item[i].enabled=False
			a_menu.item[i].visible=False
			a_menu.item[i].toolbaritemvisible=False
		End If
	End If
//////////////////////////////////////////////////////////////////////////
// Se hace una busqueda recursiva en las opciones de los submenu
// se verifica que la opcion sea visible y este habilidada
//////////////////////////////////////////////////////////////////////////
	
	If UpperBound( a_menu.item[i].item ) > 0  AND &
      a_menu.item[i].visible = True AND &
      a_menu.item[i].enabled= True Then

		of_seguridad( a_menu.item[i],a_ventana )
	End If	
		
	
Next

Return 1
end function

public function integer of_seguridad (commandbutton a_boton, string a_ventana);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 11 de Octubre de 2003 HORA 10:21:28:374
// 
// Para el manejo de seguridad en men$$HEX1$$fa00$$ENDHEX$$
//////////////////////////////////////////////////////////////////////////

long ll_tag


ll_tag=Long(a_boton.tag)
If IsNull(ll_tag) Then ll_tag=0
	
//////////////////////////////////////////////////////////////////////////
// solo se verifica seguridad para los elementos que tengan tag, los que
// no permanecen en el estado inicial
//////////////////////////////////////////////////////////////////////////
	
If ll_tag>0 Then
	If of_verificaTag(ll_tag,a_ventana)<>1 Then
		a_boton.enabled=False
		a_boton.visible=False
	end If
End If

Return 1
end function

public function integer of_iniciar (long a_aplicacion, string a_usuario, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// 
// Se carga la lista de usuarios
//////////////////////////////////////////////////////////////////////////

long ll_tot
n_ds_base lds_usuario

ids_recursos.SetTransObject(a_transaction)

ll_tot=ids_recursos.Retrieve(a_aplicacion,a_usuario)

//Messagebox('Var','a_aplicacion='+String(a_aplicacion)+'~n'+&
//'a_usuario='+String(a_usuario)+'~n'+&
//'ll_tot='+String(ll_tot)+'~n')
////////////////////////////////////////////////////////////////////////////
// Si no encuentra algun recurso, saca al usuario por no tener acceso
// 
//////////////////////////////////////////////////////////////////////////
If ll_tot=-1 Then
	MessageBox("Advertencia!","Error en la informaci$$HEX1$$f300$$ENDHEX$$n de niveles de acceso.",StopSign!)
	Halt Close
	Return -1
End If

If ll_tot=0 Then
	MessageBox("Advertencia!","Usuario no est$$HEX2$$e1002000$$ENDHEX$$autorizado para esta aplicaci$$HEX1$$f300$$ENDHEX$$n.",Exclamation!)
	Return -1
End If


/********************************************************************************************
SA-57749
Comentario:	Se adiciono al titulo de aplicativo; servidor, base de datos, usuario y nombre de usuario
para poder identificar exactamente si se esta corriendo en desarrollo o produccion y como es que 
carga los permisos y maneja la seguridad del aplicativo.  
Aqui solo se almacena el nombde del usuario.	JCMR 17-11-2017
*********************************************************************************************/
lds_usuario = Create  n_ds_base
lds_usuario.of_load("d_gr_sq_seleccion_users")
lds_usuario.SetTransObject(a_transaction)
If lds_usuario.Retrieve(a_usuario) > 0 Then
	is_de_usuario = Trim(lds_usuario.GetItemString(1, 'de_usuario'))
End If

Destroy lds_usuario;

Return 1
end function

on n_cst_security.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_security.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;//////////////////////////////////////////////////////////////////////////
//// Se crea el datastore
//////////////////////////////////////////////////////////////////////////

ids_recursos = create n_ds_application
ids_recursos.dataobject="d_recursos_permitidos"


end event

