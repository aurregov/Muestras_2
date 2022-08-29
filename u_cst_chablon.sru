HA$PBExportHeader$u_cst_chablon.sru
$PBExportComments$Objeto visible personalizado~r~nSe requiere para que el mantenimiento de chablones se pueda utilizar en una ventana como las que se tienen y en una response en caso de busquedas/creaci$$HEX1$$f300$$ENDHEX$$n
forward
global type u_cst_chablon from userobject
end type
type cb_buscar from u_cb_application within u_cst_chablon
end type
type dw_chablon from u_dw_application within u_cst_chablon
end type
type dw_busqueda from u_dw_application within u_cst_chablon
end type
type gb_busqueda from u_gb_base within u_cst_chablon
end type
type gb_chablon from u_gb_base within u_cst_chablon
end type
end forward

global type u_cst_chablon from userobject
integer width = 2363
integer height = 1848
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_save ( )
cb_buscar cb_buscar
dw_chablon dw_chablon
dw_busqueda dw_busqueda
gb_busqueda gb_busqueda
gb_chablon gb_chablon
end type
global u_cst_chablon u_cst_chablon

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:15:37
---------------------------------------------------
---------------------------------------------------*/
PROTECTED:
	Long il_chablon,il_fila
	Integer ii_operario=0
	Boolean 	ib_cambios, &
				ib_perm_desa=False //Permiso al desarrollador para la adici$$HEX1$$f300$$ENDHEX$$n de registros en la orden
	String is_operario='', is_where
end variables

forward prototypes
public function integer of_asignar_consecutivo ()
public function integer of_buscar ()
public function integer of_guardar ()
public function integer of_getid ()
public function integer of_activar ()
public function integer of_redraw (boolean ab_redrawing)
public function integer of_reset ()
public function integer of_carga_objtr ()
public function integer of_error_chablon ()
public function integer of_ok_chablon ()
public function integer of_newid_chablon ()
public function integer of_avi_operario (integer ai_operario)
public function integer of_cargar_dw ()
public function integer of_verificar ()
public function string of_getoper ()
public function integer of_filtro (string as_filtro)
public function integer of_sel_fila (long al_fila)
public function integer of_set_activo (boolean ab_activo)
public function integer of_set_operario (integer ai_operario)
public function integer of_set_perm_desa (boolean ab_perm)
public function boolean of_get_cambios ()
end prototypes

event ue_save();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:11:05
---------------------------------------------------
---------------------------------------------------*/
If of_verificar()<>1 Then
	Return
End If

of_Redraw(False)
If of_guardar()<>1 Then
	of_Redraw(True)
	Return
End If
// Acepta los cambios en la BD. si todo sale bien
of_ok_chablon()
//***********************************************
MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Registro de Chablon(es) satisfactorio.")
of_Redraw(True)
ib_cambios=False
//of_buscar()
//---------------------------------------------------------------------------

end event

public function integer of_asignar_consecutivo ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:12:20
---------------------------------------------------
Description from Design Model:
Es para crear un nuevo consecutivo.
En este caso se busca el m$$HEX1$$e100$$ENDHEX$$ximo de la tabla y se el suma 1
Generaci$$HEX1$$f300$$ENDHEX$$n del consecutivo. Devuelve -1 si el proceso no fu$$HEX1$$e900$$ENDHEX$$
exitoso.
----------------------------------------------------
Consulta del consecutivo
El codigo para los chablones ser$$HEX2$$e1002000$$ENDHEX$$para el 
ID '33'<--- creada en tiempo de dise$$HEX1$$f100$$ENDHEX$$o
Log del registro :
Table  : cf_consecutivos@crydes
Fields : co_fabrica 		= 2
			id_documento 	= 33
			cs_documento 	= *(ini)
			ob_documento 	= Chablones/Gr$$HEX1$$e100$$ENDHEX$$ficos Antideslizantes-Programaci$$HEX1$$f300$$ENDHEX$$n
			sw_replica		= 0
			instancia		= crydes01/nicdes01
---------------------------------------------------*/
Boolean lb_continuar
Long ll_cantidad
n_ds_application lds_cant_chablon
//--------------------------------------------------
lds_cant_chablon = CREATE n_ds_application
lds_cant_chablon.of_load('d_nro_chablon')
lds_cant_chablon.of_conexion(n_cst_application.itr_appl,True)
	
lb_continuar=True
DO WHILE lb_continuar //*
	il_chablon = n_cst_application.of_consecutive(n_cst_application.ii_fabrica,33,n_cst_application.itr_appl)
   If il_chablon<=0 Then
		il_chablon=0
		MessageBox("Advertencia!","Error al determinar el consecutivo del chablon para el registro.",StopSign!)
		Return -1
	End If
	
	ll_cantidad = lds_cant_chablon.Retrieve(il_chablon)
	If ll_cantidad<= 0 Then
			MessageBox("Advertencia!","Error recuperando la cuenta del c$$HEX1$$f300$$ENDHEX$$digo del chablon.",StopSign!)		
			Return -1						
	End If
	ll_cantidad = lds_cant_chablon.GetItemNumber(1,'nro_chablon')
	If ll_cantidad=0 Then
		lb_continuar=False
	End If
LOOP //*
DESTROY lds_cant_chablon
//<------
//MessageBox('INFO','# consecutivo de actividad:'+String(il_chablon),Information!)
If il_chablon>0 Then
	Return 1
End If
//
Return -1
end function

public function integer of_buscar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:12:22
---------------------------------------------------
Description from Design Model:
Permite que el usuario busque con un criterio, debe modificar el where en el dw.
*Para el graficador buscar por descripci$$HEX1$$f300$$ENDHEX$$n.
*Para el desarrollo de chablon, buscar por descripci$$HEX1$$f300$$ENDHEX$$n, cantidad chab, calibre.
---------------------------------------------------*/
Long ll_resultado, ll_i,ll_pos
String ls_msj='',ls_cad_campo,ls_sel_ini,ls_modString,ls_origen
n_cst_comun_orden lo_comun
//-------------------------------------------------------------------------------------------------
If ib_cambios Then
	ll_resultado=MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
	If ll_resultado=2 Then
		Return -2
	End If
End If
ib_cambios=False
//-------------------------------------------------------------------------------------------------
If dw_busqueda.RowCount()<=0 Then
			of_Reset()
			Return -1
End If
//-------------------------------------------------------------------------------------------------
/*****************************************-------------------------------------
Construcci$$HEX1$$f300$$ENDHEX$$n del where de la consulta del detalle
*****************************************-----------------------------------*/
ls_origen=dw_chablon.Describe("DataWindow.Table.Select")
is_where="where ("
Choose Case ii_operario
	Case 1 // Desallador Graficador
		//If dw_busqueda.DataObject='d_ext_chab_graf' Then
			ls_cad_campo=String(dw_busqueda.GetItemString(1,"de_grafico"))
			If Not IsNull(ls_cad_campo) Then
				is_where+="Upper(de_chablon) LIKE ~~'%"+Upper(ls_cad_campo)+"%~~' )"
			End If
//		Else
//			MessageBox('Advertencia','Error en la asignaci$$HEX1$$f300$$ENDHEX$$n del objeto de b$$HEX1$$fa00$$ENDHEX$$squeda para el '+is_operario)
//		End If
	Case 2 // Desarrollador Chablones
//		If dw_busqueda.DataObject='d_ext_chab_chab' Then
			ls_cad_campo=String(dw_busqueda.GetItemString(1,"de_chablon"))
			If Not IsNull(ls_cad_campo) Then
				is_where+="Upper(de_chablon) LIKE ~~'%"+Upper(ls_cad_campo)+"%~~' and "
			End If
			ls_cad_campo=String(dw_busqueda.GetItemNumber(1,"cantidad"))
			If Not IsNull(ls_cad_campo) Then
				is_where+="cantidad="+ls_cad_campo+" and "
			End If
			ls_cad_campo=String(dw_busqueda.GetItemNumber(1,"calibre"))
			If Not IsNull(ls_cad_campo) Then
				is_where+="id_calibre="+ls_cad_campo+" and "
			End If
			If Right(is_where,4)="and " Then
				is_where=left(is_where, len(is_where) - 4)+")"
			End If
//		Else
//			MessageBox('Advertencia','Error en la asignaci$$HEX1$$f300$$ENDHEX$$n del objeto de b$$HEX1$$fa00$$ENDHEX$$squeda para el '+is_operario)
//		End If
End Choose		
//-------------------------------------------------
If Right(is_where,1)=")" Then	
	ls_sel_ini=dw_chablon.Describe("DataWindow.Table.Select")
	ll_pos=Pos(ls_sel_ini,"where")
	If ll_pos>0 Then
		ls_sel_ini=Left(ls_sel_ini, ll_pos -1)
	End If
	ls_modString="DataWindow.Table.Select='"+ ls_sel_ini + is_where + "'"
	dw_chablon.Modify(ls_modString)
End If
//-------------------------------------------------------------------------------------------------
// Retrieve a los datos de la tabla de chablones 'mu_m_chablon'
ll_resultado = dw_chablon.Retrieve()
Choose Case ll_resultado
	Case Is < 0 
			Choose Case ii_operario
				Case 1 // Desarrollador Graficos
					MessageBox("Advertencia!","Error recuperando datos de los gr$$HEX1$$e100$$ENDHEX$$ficos.",StopSign!)
				Case 2 // Desarrollador Chablones
					MessageBox("Advertencia!","Error recuperando datos de los chablones.",StopSign!)
			End Choose		
			Return -1
	Case 0
			Choose Case ii_operario
					Case 1 // Desarrollador Graficos
						MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Criterio de b$$HEX1$$fa00$$ENDHEX$$squeda no encontr$$HEX2$$f3002000$$ENDHEX$$ning$$HEX1$$fa00$$ENDHEX$$n registro de gr$$HEX1$$e100$$ENDHEX$$ficos.",Information!)			
					Case 2 // Desarrollador Chablones
						MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Criterio de b$$HEX1$$fa00$$ENDHEX$$squeda no encontr$$HEX2$$f3002000$$ENDHEX$$ning$$HEX1$$fa00$$ENDHEX$$n registro de chablones.",Information!)			
			End Choose		
			//Return -1
	Case Else
		of_sel_fila (1)
		dw_chablon.SetFocus()
End Choose
//-------------------------------------------------------------------------------------------------
dw_chablon.Modify("DataWindow.Table.Select='"+ls_origen+"'")
of_redraw(True)
Return 1
end function

public function integer of_guardar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:12:23	
-------------------------------------------------------------------------------
Description from Design Model:
Almacena los cambios en DB
-------------------------------------------------------------------------------*/
Long ll_i
DateTime ldt_fecha
String ls_usuario,ls_instancia
////-------------------------------------------------------------------------------
If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If
//-------------------------------------------------------------------------------
of_newid_chablon() // Asignaci$$HEX1$$f300$$ENDHEX$$n de los consecutivos
dw_chablon.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)
//-------------------------------------------------------------------------------
If dw_chablon.Update(True,False)<>1 Then 
	of_error_chablon()
	Return -1
End If
//---------------------------------------------------------------------------------
dw_chablon.ResetUpdate()
Return 1
end function

public function integer of_getid ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:12:26
---------------------------------------------------
Description from Design Model:
Retorna el c$$HEX1$$f300$$ENDHEX$$digo del chablon seleccionado
---------------------------------------------------*/
Long ll_pos
//-------------------------------------------------
If dw_chablon.RowCount()<=0 then
	Return -1
End If
//---------------------------------------------------
If il_fila>0 Then
	il_chablon=dw_chablon.GetItemNumber(il_fila,'id_chablon')
Else
	Return -1
End If
//---------------------------------------------------
Return il_chablon
end function

public function integer of_activar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:12:28
---------------------------------------------------
Description from Design Model:
Cuando se aprueba la operacion,el sistema cambia el campo
activo de N a S
---------------------------------------------------*/
Long ll_pos
//-------------------------------------------------
If dw_chablon.RowCount()<=0 then
	Return -1
End If
//--------------------------------------------------
If il_fila>0 Then
	If dw_chablon.GetItemString(il_fila,'activo')='N' Then
		dw_chablon.SetItem(il_fila,'activo','S')
	Else
		MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','El chablon seleccionado ya se encuentra activo.',Information!)
	End If
Else
	Return -1
End If
//--------------------------------------------------
Return 1


end function

public function integer of_redraw (boolean ab_redrawing);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:12:12
---------------------------------------------------
---------------------------------------------------*/
dw_busqueda.SetRedraw(ab_redrawing)
dw_chablon.SetRedraw(ab_redrawing)
//-------------------------------------------------
Return 1
end function

public function integer of_reset ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:12:21
---------------------------------------------------
---------------------------------------------------*/
dw_busqueda.Reset()
dw_chablon.Reset()
//-------------------------------------------------
Return 1

end function

public function integer of_carga_objtr ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:15:47
---------------------------------------------------
Carga los obj. de transacci$$HEX1$$f300$$ENDHEX$$n
---------------------------------------------------*/
dw_busqueda.of_conexion(n_cst_application.itr_appl,True)
dw_chablon.of_conexion(n_cst_application.itr_appl,True)

Return 1

end function

public function integer of_error_chablon ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:13:58
---------------------------------------------------
Acepta los cambios hechos a la bd.
---------------------------------------------------*/
//*****************************************
ROLLBACK USING n_cst_application.itr_appl ;
//*****************************************
Return 1
end function

public function integer of_ok_chablon ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:13:58
---------------------------------------------------
Acepta los cambios hechos a la bd.
---------------------------------------------------*/
//*****************************************
COMMIT USING n_cst_application.itr_appl ;
//*****************************************
Return 1
end function

public function integer of_newid_chablon ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:14:32
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n que asigna los nuevos consecutivos al(os) nuevo(s)
chablon(es) que aparezcan en el registro
---------------------------------------------------*/
Long ll_i
//--------------------------------------------------
dw_chablon.SetFilter("id_chablon=0")
dw_chablon.Filter()
If dw_chablon.RowCount()>0 Then
	For ll_i=1 To dw_chablon.RowCount()
		If of_asignar_consecutivo()<>1 Then
			Return -1
		End If
		dw_chablon.SetItem(ll_i,"id_chablon",il_chablon)		
	Next
End If
dw_chablon.SetFilter("")
dw_chablon.Filter()
dw_chablon.Sort()
//---------------------------------------------------
Return 1


end function

public function integer of_avi_operario (integer ai_operario);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:18:30
---------------------------------------------------
Asignacion del valor de la var. instancia operario
que realizar$$HEX2$$e1002000$$ENDHEX$$la funci$$HEX1$$f300$$ENDHEX$$n del registro de la operacion
0=Graficador, 1=Desarrollador
---------------------------------------------------*/
ii_operario=ai_operario
Choose Case ii_operario
	Case 1
		is_operario='Graficador'
	Case 2
		is_operario='Desarrollador Chablon'
	Case Else
		MessageBox('Advertencia','Error en la asignaci$$HEX1$$f300$$ENDHEX$$n de la descripci$$HEX1$$f300$$ENDHEX$$n del operador.',StopSign!)
		is_operario=''
		Return -1
End Choose
Return 1
end function

public function integer of_cargar_dw ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:18:10
---------------------------------------------------
Asignaci$$HEX1$$f300$$ENDHEX$$n de los DW para el registro del chablon seg$$HEX1$$fa00$$ENDHEX$$n
el operario registrado en el sistema
---------------------------------------------------*/
Choose Case ii_operario
	Case 1 // Operario: Graficador
		dw_busqueda.of_load('d_ext_chab_graf')
		dw_chablon.of_load('d_mu_m_chablon_graf')		
	Case 2 // Operario: Desarrollador
		dw_busqueda.of_load('d_ext_chab_chab')
		dw_chablon.of_load('d_mu_m_chablon_chab')
	Case Else
		Return -1
End Choose
of_carga_objtr()
dw_busqueda.InsertRow(0)
dw_busqueda.SetFocus()
dw_busqueda.SetColumn(1)
//---------------------------------------------------
Return 1

end function

public function integer of_verificar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:10:56
---------------------------------------------------
Verificaci$$HEX1$$f300$$ENDHEX$$n de los datos antes de grabar
---------------------------------------------------*/
Long ll_pos
//---------------------------------------------------------------------------------------------
If dw_busqueda.RowCount()<=0 Then
	Return -1
End If
If dw_chablon.RowCount()<=0 Then
	Return -1
End If
//--------------------------------------------------------
If dw_chablon.AcceptText()<>1 Then
	//MessageBox("Advertencia!","Los datos de los chablones no son v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	dw_chablon.SetFocus()
	Return -1
End If
//----------------------------------------------------------------------------------------
If Not dw_chablon.of_completedata() Then
	dw_chablon.SetFocus()
	Return -1
End If
//----------------------------------------------------------------------------------------
Return 1
end function

public function string of_getoper ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:12:31
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n que devuelve la descripci$$HEX1$$f300$$ENDHEX$$n del operario
---------------------------------------------------*/
If is_operario='' Then
 Return 'Desconocido'
Else
 Return is_operario
End If
//--------------------------------------------------
end function

public function integer of_filtro (string as_filtro);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:11:21
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n para el filtro del dw de chablon seg$$HEX1$$fa00$$ENDHEX$$n el criterio
---------------------------------------------------*/
//---------------------------------------------------
dw_chablon.SetFilter(as_filtro)
dw_chablon.Filter()
//---------------------------------------------------
Return 1
end function

public function integer of_sel_fila (long al_fila);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:11:21
---------------------------------------------------
--------------------------------------------------*/
il_fila=al_fila
dw_chablon.SelectRow(0,False)
dw_chablon.SelectRow(il_fila,True)
//---------------------------------------------------
Return 1
end function

public function integer of_set_activo (boolean ab_activo);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:11:21
---------------------------------------------------
Funcion que activa/bloquea el cambio del campo de activo
para los registros del objeto
---------------------------------------------------*/
//---------------------------------------------------
If ab_activo Then
	dw_chablon.Modify("activo.TabSequence=0")
Else
	dw_chablon.Modify('activo.TabSequence=40')
End If
//----------------------------------------
Return 1
end function

public function integer of_set_operario (integer ai_operario);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:11:21
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n para asignar el c$$HEX1$$f300$$ENDHEX$$digo del operario
---------------------------------------------------*/
If Not IsNull(ai_operario) OR (ai_operario>0 AND ai_operario<3)Then
	ii_operario=ai_operario
Else
	MessageBox('Advertencia','C$$HEX1$$f300$$ENDHEX$$digo del operario err$$HEX1$$f300$$ENDHEX$$neo(param)')
	Return -1
End If
//---------------------------------------------------
Return 1
end function

public function integer of_set_perm_desa (boolean ab_perm);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:11:21
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n para asignar permiso al desarrollador de adicionar registros
---------------------------------------------------*/
If Not IsNull(ab_perm) Then
	ib_perm_desa=ab_perm
Else
	MessageBox('Advertencia','Error en el permiso del Desarrollador',StopSign!)
	Return -1
End If
Return 1
//---------------------------------------------------
end function

public function boolean of_get_cambios ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 05 de Noviembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
Return ib_cambios
end function

on u_cst_chablon.create
this.cb_buscar=create cb_buscar
this.dw_chablon=create dw_chablon
this.dw_busqueda=create dw_busqueda
this.gb_busqueda=create gb_busqueda
this.gb_chablon=create gb_chablon
this.Control[]={this.cb_buscar,&
this.dw_chablon,&
this.dw_busqueda,&
this.gb_busqueda,&
this.gb_chablon}
end on

on u_cst_chablon.destroy
destroy(this.cb_buscar)
destroy(this.dw_chablon)
destroy(this.dw_busqueda)
destroy(this.gb_busqueda)
destroy(this.gb_chablon)
end on

event constructor;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:11:21
---------------------------------------------------
---------------------------------------------------*/
of_carga_objtr()
//---------------------------------------------------


end event

type cb_buscar from u_cb_application within u_cst_chablon
integer x = 1646
integer y = 320
integer taborder = 20
string text = "&Buscar"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:08:12
---------------------------------------------------
---------------------------------------------------*/
If dw_busqueda.RowCount()<=0 Then
	Return
End If
If dw_busqueda.AcceptText()<>1 Then
	//MessageBox("Advertencia!","Los datos de la b$$HEX1$$fa00$$ENDHEX$$squeda del chablon no son v$$HEX1$$e100$$ENDHEX$$lidos.Verifique.",StopSign!)
	cb_buscar.Event LoseFocus()
	dw_busqueda.SetFocus()
	Return -1
End If
of_redraw(False)
of_buscar()
of_redraw(True)
//-------------------------------------------------------

end event

type dw_chablon from u_dw_application within u_cst_chablon
integer x = 110
integer y = 576
integer width = 2121
integer height = 1184
integer taborder = 30
string dataobject = "d_mu_m_chablon_chab"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:11:18
---------------------------------------------------
---------------------------------------------------*/
String ls_coltype
Long ll_pos
n_cst_comun_orden lou_desc

//---------------------------------------------------
ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	If Trim(Data)='' AND NOt IsNull(Data) Then
		MessageBox('Advertencia','Texto del campo descripci$$HEX1$$f300$$ENDHEX$$n no es v$$HEX1$$e100$$ENDHEX$$lido.S$$HEX1$$f300$$ENDHEX$$lo hay espacios en blanco',StopSign!)
		Return 1
	End If
	If This.of_validarcadena(Data)<>1 Then 
		Return 1
	End If
End If
//---------------------------------------------------
If dwo.name='de_chablon' Then
	ll_pos=Find('Upper(Trim(de_chablon))=Upper(Trim(~''+Data+'~'))',1,RowCount())
	If ll_pos>0 Then
		MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','La descripci$$HEX1$$f300$$ENDHEX$$n ~''+Data+'~' ya se encuentra ingresada en el registro nro. '+String(ll_pos),Information!)
		Return 1
	End If
	lou_desc.of_validardescripcion(Data,1/*para chablones*/,n_cst_application.itr_appl)
	ll_pos=lou_desc.of_getlong(1)
	If ll_pos<>0 AND GetItemNumber(row,'id_chablon')<>ll_pos Then
		MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','La descripci$$HEX1$$f300$$ENDHEX$$n ~''+Data+'~' ya se encuentra registrada para el chablon de c$$HEX1$$f300$$ENDHEX$$d. ~''+String(ll_pos)+'~'.',Information!)
		Return 1
	End If	
End If
//---------------------------------------------------
ib_cambios=True
end event

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:11:18
---------------------------------------------------
---------------------------------------------------*/
gb_chablon.of_color(True)
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:11:18
---------------------------------------------------
---------------------------------------------------*/
gb_chablon.of_color(False)
end event

event ue_insertrow;/*-------------------------------------------------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:11:12
---------------------------------------------------------------------------------------------
Se debe tener en cuenta--> S$$HEX1$$f300$$ENDHEX$$lo los operarios graficadores 
pueden adicionar nuevos registros para los chablones; en graficado.
---------------------------------------------------------------------------------------------*/
Long ll_i
//-------------------------------------------------------------------------------------------
If ii_operario <> 1 AND Not ib_perm_desa Then
	MessageBox('Advertencia','Solo los operarios Graficadores pueden '+&
					'adicionar chablones.~nOperador actual: '+is_operario)
					Return
End If
//---------------------------------------------------------------------------------------------
Super::Event ue_insertRow()
ll_i = This.GetRow()
This.SetItem(ll_i,"id_chablon",0)
This.SetColumn('de_chablon')
This.SetItemStatus(ll_i,0,Primary!,New!)

end event

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:11:21
---------------------------------------------------
---------------------------------------------------*/
If Row=0 Then Return
//---------------------------------------------------
of_Sel_fila(Row)
//---------------------------------------------------
end event

event itemfocuschanged;call super::itemfocuschanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:12:01
---------------------------------------------------
---------------------------------------------------*/
If Row=0 Then Return
//---------------------------------------------------
of_Sel_fila(Row)
//---------------------------------------------------
end event

event rowfocuschanged;call super::rowfocuschanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:12:01
---------------------------------------------------
---------------------------------------------------*/
If CurrentRow=0 Then Return
//---------------------------------------------------
of_Sel_fila(CurrentRow)
//---------------------------------------------------
end event

event itemerror;call super::itemerror;String ls_coltype
Int li_null
//-------------------------------------------------
ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	of_sel_fila(row)
	Return 1
End If

If dwo.name='cantidad' OR dwo.name='calibre' Then
	If Long(Data)=0 Then
		SetNull(li_null)		
		This.SetItem(row,String(dwo.name),li_null)
		Return 3
	End If	
End If
end event

type dw_busqueda from u_dw_application within u_cst_chablon
integer x = 110
integer y = 128
integer width = 1829
integer height = 256
string dataobject = "d_ext_chab_chab"
boolean vscrollbar = false
boolean livescroll = false
end type

event itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:11:56
---------------------------------------------------
---------------------------------------------------*/
String ls_coltype
ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	If Trim(Data)='' AND NOt IsNull(Data) Then
		MessageBox('Advertencia','Texto del campo de descripci$$HEX1$$f300$$ENDHEX$$n no es v$$HEX1$$e100$$ENDHEX$$lido.S$$HEX1$$f300$$ENDHEX$$lo hay espacios en blanco',StopSign!)		
		Return 1
	End If
	If This.of_validarcadena(Data)<>1 Then 
		Return 1
	End If
End If
end event

event getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:11:18
---------------------------------------------------
---------------------------------------------------*/
gb_busqueda.of_color(True)
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:11:18
---------------------------------------------------
---------------------------------------------------*/
gb_busqueda.of_color(False)
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:11:56
---------------------------------------------------
Overwrite!
---------------------------------------------------*/

end event

event ue_deleterow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:14:03
---------------------------------------------------
Overwrite!
---------------------------------------------------*/
end event

event itemerror;call super::itemerror;String ls_coltype
Int li_null
//-------------------------------------------------
ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	Return 1
End If

If dwo.name='cantidad' OR dwo.name='calibre' Then
	If Long(Data)=0 Then
		SetNull(li_null)		
		This.SetItem(row,String(dwo.name),li_null)
		Return 3
	End If	
End If
end event

type gb_busqueda from u_gb_base within u_cst_chablon
integer x = 37
integer y = 32
integer width = 2267
integer height = 416
integer taborder = 0
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda del Chablon/Grafico Antideslizante (Ctrl+1)"
end type

type gb_chablon from u_gb_base within u_cst_chablon
integer x = 37
integer y = 480
integer width = 2267
integer height = 1344
integer taborder = 0
string text = "Chablones/Graficos Antideslizantes (Ctrl+2)"
end type

