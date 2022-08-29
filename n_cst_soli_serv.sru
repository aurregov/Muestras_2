HA$PBExportHeader$n_cst_soli_serv.sru
$PBExportComments$Objecto encargado de centralizar le manejo de las nuevas solicitudes de servicio
forward
global type n_cst_soli_serv from nonvisualobject
end type
end forward

global type n_cst_soli_serv from nonvisualobject autoinstantiate
end type

type variables
//constantes para el manejo de las actividades
private :

long il_MU_TENIDO_HILAZA, il_MU_DLLO_COL_HZA,&
     il_MU_DESARROLLO_COLOR, il_mu_dllo_tinta_anti
	  
String is_descripcion_tarea, is_tarea_x_color,&
       is_sw_pares,is_sw_ajuste_maq,&
		 is_sw_ajustexcol, is_de_estado,is_sw_genera_ss 

long il_estado,il_criterio_tiempo,il_co_clase_ss
end variables

forward prototypes
public function string of_get_descripcion_estado ()
public function string of_get_sw_pares ()
public function string of_get_sw_ajuste_maq ()
public function string of_get_sw_ajustexcol ()
public function string of_get_tarea_x_color ()
public function long of_get_estado ()
public function long of_get_criterio_tiempo ()
public function long of_cargar_constantes ()
public function long of_es_desarrollo_color (long al_clase_solicitud)
public function long of_es_tenido_hilaza (long al_clase_solicitud)
public function long of_requiere_info_adicional (long al_clase_ss)
public function string of_get_descripcion_tarea ()
public function string of_get_de_estado ()
public function string of_get_sw_genera_ss ()
public function long of_get_co_clase_ss ()
public function integer of_cargar_info_tarea (string as_col, long al_id_tarea, long al_tipoprod)
public function long of_es_tinta_antideslizante (long al_clase_solicitud)
public function integer of_recuperar_color_hilaza (long a_nu_orden, long a_id_actividad, string as_col, ref string as_de_color)
end prototypes

public function string of_get_descripcion_estado ();return is_de_estado

end function

public function string of_get_sw_pares ();return is_sw_pares

end function

public function string of_get_sw_ajuste_maq ();return is_sw_ajuste_maq


end function

public function string of_get_sw_ajustexcol ();return is_sw_ajustexcol
end function

public function string of_get_tarea_x_color ();return is_tarea_x_color


end function

public function long of_get_estado ();return il_estado

end function

public function long of_get_criterio_tiempo ();return il_criterio_tiempo

end function

public function long of_cargar_constantes ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Viernes 12 de Agosto de 2005 HORA 14:36:43:812
// 
// Permite cargar las constantes para el manejo de las solicitudes de servicio
//////////////////////////////////////////////////////////////////////////

long ll_res
n_cst_comun lo_c

ll_res=lo_c.of_valorconstante( "MU_DLLO_COL_HILAZA",n_cst_application.itr_appl )

If ll_res=1 Then
	il_MU_DLLO_COL_HZA =Long(lo_c.of_getDecimal(1))
Else
	il_MU_DLLO_COL_HZA=-1
	MessageBox("Advertencia!","No encontr$$HEX2$$f3002000$$ENDHEX$$la constante MU_DLLO_COL_HILAZA.",StopSign!)
	Return -1
End If

ll_res=lo_c.of_valorconstante( "MU_TENIDO_HILAZA",n_cst_application.itr_appl )

If ll_res=1 Then
	il_MU_TENIDO_HILAZA=Long(lo_c.of_getDecimal(1))
Else
	il_MU_TENIDO_HILAZA=-1
	MessageBox("Advertencia!","No encontr$$HEX2$$f3002000$$ENDHEX$$la constante MU_TENIDO_HILAZA.",StopSign!)
	Return -1
End If

ll_res=lo_c.of_valorconstante( "MU_DLLO_TINTA_ANTI",n_cst_application.itr_appl )

If ll_res=1 Then
	il_mu_dllo_tinta_anti=Long(lo_c.of_getDecimal(1))
Else
	il_mu_dllo_tinta_anti=-1
	MessageBox("Advertencia!","No encontr$$HEX2$$f3002000$$ENDHEX$$la constante MU_DLLO_TINTA_ANTI.",StopSign!)
	Return -1
End If



//MU_DESARROLLO_COLOR

ll_res=lo_c.of_valorconstante( "MU_DESARROLLO_COLOR",n_cst_application.itr_appl )

If ll_res=1 Then
	il_MU_DESARROLLO_COLOR=Long(lo_c.of_getDecimal(1))
Else
	il_MU_DESARROLLO_COLOR=-1
	MessageBox("Advertencia!","No encontr$$HEX2$$f3002000$$ENDHEX$$la constante MU_DESARROLLO_COLOR.",StopSign!)
	Return -1
End If


Return 1
end function

public function long of_es_desarrollo_color (long al_clase_solicitud);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Lunes 15 de Agosto de 2005 HORA 11:13:53:234
// 
// retorna 1 si es desarrollo de color
// -1 si no lo es
//////////////////////////////////////////////////////////////////////////


If al_clase_solicitud=il_MU_DESARROLLO_COLOR Then
	Return 1
Else
	Return -1
End IF

end function

public function long of_es_tenido_hilaza (long al_clase_solicitud);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Viernes 12 de Agosto de 2005 HORA 16:59:18:140
// 
// Determina si una clase de solicitud es de te$$HEX1$$f100$$ENDHEX$$ido de hilaza.
// 1 si es 
// -1 si no es
//////////////////////////////////////////////////////////////////////////


If al_clase_solicitud=il_MU_TENIDO_HILAZA or &
   al_clase_solicitud=il_MU_DLLO_COL_HZA then 
	Return 1
Else
	Return -1
End IF

end function

public function long of_requiere_info_adicional (long al_clase_ss);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Viernes 12 de Agosto de 2005 HORA 15:59:34:593
// 
// Para determinar si una clase de solicitud requiere informaci$$HEX1$$f300$$ENDHEX$$n adicional
// 1 si requiere
// -1 si no requiere
// la idea es colocar aca todas las que requieren, 
// por ahora solo estan las de tenido de hilaza
//////////////////////////////////////////////////////////////////////////
long ll_retorno

ll_retorno=-1

If of_es_tenido_hilaza(al_clase_ss /*long al_clase_ss */)=1 Then
	ll_retorno=1
End If

If of_es_tinta_antideslizante(al_clase_ss /*long al_clase_ss */)=1 Then
	ll_retorno=1
End If

Return ll_retorno

end function

public function string of_get_descripcion_tarea ();return is_descripcion_tarea
end function

public function string of_get_de_estado ();Return is_de_estado
end function

public function string of_get_sw_genera_ss ();return is_sw_genera_ss


end function

public function long of_get_co_clase_ss ();return il_co_clase_ss

end function

public function integer of_cargar_info_tarea (string as_col, long al_id_tarea, long al_tipoprod);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Lunes 15 de Agosto (Festivo) de 2005 HORA 11:49:50:015
// 
// 
//////////////////////////////////////////////////////////////////////////


long ll_res
String ls_dwo,ls_de_actoper,ls_objeto
n_cst_comun_orden lo_comun
n_ds_application lds_actoper

//ASIGNA LOS VALORES DE LA ACTIVIDAD/OPERACI$$HEX1$$d300$$ENDHEX$$N SEG$$HEX1$$da00$$ENDHEX$$N EL NOMBRE COLUMNA
Choose Case as_col
	Case 'co_operacion'
		ls_dwo='d_m_operac_muestra2'
		ls_de_actoper='de_operacion'
		ls_objeto='Operaci$$HEX1$$f300$$ENDHEX$$n'
	Case 'id_actividad'

		ls_dwo='d_mu_m_actividad'
		ls_de_actoper='de_actividad'
		ls_objeto='Actividad'
	Case Else
		Return -1
End Choose

lds_actoper = CREATE n_ds_application
lds_actoper.of_load(ls_dwo)
lds_actoper.of_conexion(n_cst_application.itr_appl,True)

Choose Case as_col
	Case 'co_operacion'
 		ll_res=lds_actoper.Retrieve(al_id_tarea, al_tipoprod )
	Case 'id_actividad'
		ll_res=lds_actoper.Retrieve(al_id_tarea)
End Choose

Choose Case ll_res
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando los datos de la "+Lower(ls_objeto)+" <"+String(al_id_tarea)+"> selecionada para realizar su estimaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)		
		Return -1
	Case 0
		MessageBox("Advertencia!","La "+Lower(ls_objeto)+" <"+String(al_id_tarea)+"> no fu$$HEX2$$e9002000$$ENDHEX$$encontrada en el registro para realizar su estimaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
		Return -1	
End Choose

ls_de_actoper=lds_actoper.GetItemString(1,ls_de_actoper)
is_descripcion_tarea = Trim(ls_de_actoper)
il_estado=lds_actoper.GetItemNumber(1,'co_estado')
If IsNull(il_estado) Then
	MessageBox("Advertencia!","El c$$HEX1$$f300$$ENDHEX$$digo de estado de la "+ls_objeto+" no es v$$HEX1$$e100$$ENDHEX$$lido o no est$$HEX2$$e1002000$$ENDHEX$$asignado.",StopSign!)
	Return -1	
End If
//Carga la condici$$HEX1$$f300$$ENDHEX$$n si el estado de la oper/act. es por color o no
If lo_comun.of_x_color_estado(il_estado,n_cst_application.itr_appl) = -1 Then
	MessageBox("Advertencia!","Error en la recuperaci$$HEX1$$f300$$ENDHEX$$n del criterio de color para el estado de la "+ls_objeto,StopSign!)
	Return -1	
End If		
is_tarea_x_color= lo_comun.of_getString(1)

is_sw_pares = lds_actoper.GetItemString(1,'sw_pares')

is_sw_ajuste_maq = lds_actoper.GetItemString(1,'sw_ajuste_maq')

is_sw_ajustexcol=lds_actoper.GetItemString(1,'sw_ajustexcol')

il_criterio_tiempo=lds_actoper.GetItemNumber(1,'criterio_tiempo')

is_de_estado=Trim(Upper(lds_actoper.GetItemString(1,'de_estado')))

If as_col='id_actividad' Then
	il_co_clase_ss=lds_actoper.GetItemNumber(1,"co_clase")
	is_sw_genera_ss=lds_actoper.GetItemString(1,'sw_generass')
End If

Return 1
end function

public function long of_es_tinta_antideslizante (long al_clase_solicitud);/////////////////////////////////////////////////////////
If al_clase_solicitud=il_mu_dllo_tinta_anti then
   Return 1
Else
	Return -1
End IF

end function

public function integer of_recuperar_color_hilaza (long a_nu_orden, long a_id_actividad, string as_col, ref string as_de_color);long ll_res
String ls_dwo,ls_de_actoper,ls_objeto
n_ds_application lds_colorhil

//ASIGNA LOS VALORES DE LA ACTIVIDAD/OPERACI$$HEX1$$d300$$ENDHEX$$N SEG$$HEX1$$da00$$ENDHEX$$N EL NOMBRE COLUMNA
Choose Case as_col
	Case 'co_operacion'
		ls_dwo='d_m_operac_muestra2'
		ls_de_actoper='de_operacion'
		ls_objeto='Operaci$$HEX1$$f300$$ENDHEX$$n'
	Case 'id_actividad'

		ls_dwo='d_color_hilaza_x_actividad'
		ls_de_actoper='de_actividad'
		ls_objeto='Actividad'
	Case Else
		Return -1
End Choose

lds_colorhil = CREATE n_ds_application
lds_colorhil.of_load(ls_dwo)
lds_colorhil.of_conexion(n_cst_application.itr_appl,True)

Choose Case as_col
	Case 'co_operacion'
 		ll_res=lds_colorhil.Retrieve(a_nu_orden, a_id_actividad )
	Case 'id_actividad'
		ll_res=lds_colorhil.Retrieve(a_nu_orden, a_id_actividad)
End Choose

Choose Case ll_res
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando los datos de la "+Lower(ls_objeto)+" <"+String(a_id_actividad)+"> selecionada para realizar su estimaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)		
		Return -1
	Case 0
		MessageBox("Advertencia!","La "+Lower(ls_objeto)+" <"+String(a_id_actividad)+"> no fu$$HEX2$$e9002000$$ENDHEX$$encontrada en el registro para realizar su estimaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
		Return -1	
End Choose
 
as_de_color= lds_colorhil.GetItemString(1,"de_color")

Return 1
end function

on n_cst_soli_serv.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_soli_serv.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

