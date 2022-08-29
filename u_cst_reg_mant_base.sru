HA$PBExportHeader$u_cst_reg_mant_base.sru
$PBExportComments$Objeto visible personalizado base para el registro de los elementos que componen el mantenimiento de la programaci$$HEX1$$f300$$ENDHEX$$n de muestras.
forward
global type u_cst_reg_mant_base from userobject
end type
type cb_buscar from u_cb_application within u_cst_reg_mant_base
end type
type dw_detalle from u_dw_application within u_cst_reg_mant_base
end type
type dw_busqueda from u_dw_application within u_cst_reg_mant_base
end type
type gb_busqueda from u_gb_base within u_cst_reg_mant_base
end type
type gb_detalle from u_gb_base within u_cst_reg_mant_base
end type
end forward

global type u_cst_reg_mant_base from userobject
integer width = 2057
integer height = 3060
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_save ( )
cb_buscar cb_buscar
dw_detalle dw_detalle
dw_busqueda dw_busqueda
gb_busqueda gb_busqueda
gb_detalle gb_detalle
end type
global u_cst_reg_mant_base u_cst_reg_mant_base

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:15:37
---------------------------------------------------
---------------------------------------------------*/
PROTECTED:
	Long 		il_item,il_fila			//Variable con el codigo del item
	Integer	ii_id_documento//Dato del id documento para el consecutivo del item
	Boolean 	ib_cambios
	String  	is_msj  			//Mensaje que se mostrara en la condicion de ejecuci$$HEX1$$f300$$ENDHEX$$n en la funci$$HEX1$$f300$$ENDHEX$$n
	String  	is_nro_item 	//Nombre del campo que tiene el dato devuelto de la cuenta del nuevo consecutivo &
	String  	is_d_nro_item 	//Nombre del DWO que contiene la consulta de la cuenta del nuevo consecutivo &
	String  	is_filtro		//Expresion de filtro para los item sin consecutivos
	String  	is_item			//Descripcion del item que se manejar$$HEX2$$e1002000$$ENDHEX$$en el registro
	String  	is_id_item		//Nombre del campo para el item dentro del dw detalle
end variables

forward prototypes
public function integer of_asignar_consecutivo ()
public function integer of_buscar ()
public function integer of_guardar ()
public function integer of_activar ()
public function integer of_redraw (boolean ab_redrawing)
public function integer of_reset ()
public function integer of_carga_objtr ()
public function integer of_cargar_dw ()
public function integer of_verificar ()
public function integer of_newid ()
public function integer of_ok_registro ()
public function integer of_error_registro ()
public function integer of_filtro (string as_filtro)
public function long of_getid ()
public function integer of_sel_fila (long al_fila)
public function integer of_set_activo (boolean ab_activo)
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
of_ok_registro()
//***********************************************
MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Registro de "+is_item+" satisfactorio.")
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
El codigo para el item ser$$HEX2$$e1002000$$ENDHEX$$#Cod<--- creada en tiempo de dise$$HEX1$$f100$$ENDHEX$$o
Log del registro :
Table  : cf_consecutivos@crydes
Fields : co_fabrica 		= 2
			id_documento 	= #Cod
			cs_documento 	= *(ini)
			ob_documento 	= #Descripci$$HEX1$$f300$$ENDHEX$$nItem
			sw_replica		= 0
			instancia		= crydes01/nicdes01
---------------------------------------------------*/
Boolean lb_continuar
Long ll_cantidad
n_ds_application lds_cant_item
//--------------------------------------------------
lds_cant_item = CREATE n_ds_application
lds_cant_item.of_load(is_d_nro_item)
lds_cant_item.of_conexion(n_cst_application.itr_appl,True)
	
lb_continuar=True
DO WHILE lb_continuar //*
	il_item = n_cst_application.of_consecutive(n_cst_application.ii_fabrica,ii_id_documento,n_cst_application.itr_appl)
   If il_item<=0 Then
		il_item=0
		MessageBox("Advertencia!","No se pudo determinar el consecutivo de "+is_item+" para el registro.",StopSign!)
		Return -1
	End If
	
	ll_cantidad = lds_cant_item.Retrieve(il_item)
	If ll_cantidad<= 0 Then
			MessageBox("Advertencia!","Error recuperando la cuenta del c$$HEX1$$f300$$ENDHEX$$digo de "+is_item+"(ds).",StopSign!)		
			Return -1						
	End If
	ll_cantidad = lds_cant_item.GetItemNumber(1,is_nro_item)
	If ll_cantidad=0 Then
		lb_continuar=False
	End If
LOOP //*
DESTROY lds_cant_item
//<------
//MessageBox('INFO','# consecutivo del Item:'+String(il_item),Information!)
If il_item>0 Then
	Return 1
End If
//
Return -1

end function

public function integer of_buscar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:12:22
---------------------------------------------------*/
Return 1
end function

public function integer of_guardar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:11:59	
-------------------------------------------------------------------------------
Description from Design Model:
Almacena los cambios en DB
------------------------------------------------------------------------------*/
Long ll_i
DateTime ldt_fecha
String ls_usuario,ls_instancia
////-------------------------------------------------------------------------------
If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If
//-------------------------------------------------------------------------------
of_newid() // Asignaci$$HEX1$$f300$$ENDHEX$$n de los consecutivos
dw_detalle.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)
//-------------------------------------------------------------------------------
If dw_detalle.Update(True,False)<>1 Then 
	of_error_registro()
	Return -1
End If
//---------------------------------------------------------------------------------
dw_detalle.ResetUpdate()
Return 1
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
If dw_detalle.RowCount()<=0 then
	Return -1
End If
//--------------------------------------------------
ll_pos=dw_detalle.GetRow()
If ll_pos>0 Then
	If dw_detalle.GetItemString(ll_pos,'activo')='N' Then
		dw_detalle.SetItem(ll_pos,'activo','S')
	Else
		MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n',is_msj,Information!)
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
dw_detalle.SetRedraw(ab_redrawing)
//-------------------------------------------------
Return 1
end function

public function integer of_reset ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:12:21
---------------------------------------------------
---------------------------------------------------*/
dw_busqueda.Reset()
dw_detalle.Reset()
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
dw_detalle.of_conexion(n_cst_application.itr_appl,True)
Return 1

end function

public function integer of_cargar_dw ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:18:10
---------------------------------------------------
Asignaci$$HEX1$$f300$$ENDHEX$$n de los DW
---------------------------------------------------*/
of_carga_objtr()
dw_busqueda.InsertRow(0)
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
If dw_detalle.RowCount()<=0 Then
	Return -1
End If
//--------------------------------------------------------
If dw_detalle.AcceptText()<>1 Then
	//MessageBox("Advertencia!",is_msj,StopSign!)
	dw_detalle.SetFocus()
	Return -1
End If
//----------------------------------------------------------------------------------------
If Not dw_detalle.of_completedata() Then
	dw_detalle.SetFocus()
	Return -1
End If
//----------------------------------------------------------------------------------------
Return 1
end function

public function integer of_newid ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:14:32
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n que asigna los nuevos consecutivos a l(os) nuevo(s)
registros
---------------------------------------------------*/
Long ll_i
//--------------------------------------------------
dw_detalle.SetFilter(is_filtro)
dw_detalle.Filter()
If dw_detalle.RowCount()>0 Then
	For ll_i=1 To dw_detalle.RowCount()
		If of_asignar_consecutivo()<>1 Then
			Return -1
		End If
		dw_detalle.SetItem(ll_i,is_id_item,il_item)		
	Next
End If
dw_detalle.SetFilter("")
dw_detalle.Filter()
dw_detalle.Sort()
//---------------------------------------------------
Return 1



end function

public function integer of_ok_registro ();/*-------------------------------------------------
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

public function integer of_error_registro ();/*-------------------------------------------------
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

public function integer of_filtro (string as_filtro);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:11:21
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n para el filtro del dw del detalle seg$$HEX1$$fa00$$ENDHEX$$n el criterio
---------------------------------------------------*/
//---------------------------------------------------
dw_detalle.SetFilter(as_filtro)
dw_detalle.Filter()
//---------------------------------------------------
Return 1
end function

public function long of_getid ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:12:26
---------------------------------------------------
Description from Design Model:
Retorna el valor seleccionado en caso de haber varios en pantalla
---------------------------------------------------*/
Long ll_pos
//-------------------------------------------------
If dw_detalle.RowCount()<=0 then
	Return -1
End If
//---------------------------------------------------
If il_fila>0 Then
	il_item=dw_detalle.GetItemNumber(il_fila,is_id_item)
Else
	Return -1
End If
Return il_item

end function

public function integer of_sel_fila (long al_fila);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:11:21
---------------------------------------------------
--------------------------------------------------*/
il_fila=al_fila
dw_detalle.SelectRow(0,False)
dw_detalle.SelectRow(il_fila,True)
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
If Not dw_detalle.of_existcolumn('activo') Then Return -1

If ab_activo Then
	dw_detalle.Modify("activo.TabSequence=0")
Else
	dw_detalle.Modify('activo.TabSequence=1000')
End If
//----------------------------------------
Return 1
end function

public function boolean of_get_cambios ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 05 de Noviembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
Return ib_cambios
end function

on u_cst_reg_mant_base.create
this.cb_buscar=create cb_buscar
this.dw_detalle=create dw_detalle
this.dw_busqueda=create dw_busqueda
this.gb_busqueda=create gb_busqueda
this.gb_detalle=create gb_detalle
this.Control[]={this.cb_buscar,&
this.dw_detalle,&
this.dw_busqueda,&
this.gb_busqueda,&
this.gb_detalle}
end on

on u_cst_reg_mant_base.destroy
destroy(this.cb_buscar)
destroy(this.dw_detalle)
destroy(this.dw_busqueda)
destroy(this.gb_busqueda)
destroy(this.gb_detalle)
end on

event constructor;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:11:21
---------------------------------------------------
---------------------------------------------------*/
of_carga_objtr()
//---------------------------------------------------
If dw_busqueda.DataObject<>'' OR Not IsNull(dw_busqueda.DataObject) Then
	dw_busqueda.InsertRow(0)
End If
end event

type cb_buscar from u_cb_application within u_cst_reg_mant_base
integer x = 1646
integer y = 384
integer taborder = 20
string text = "&Buscar"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:15:23
---------------------------------------------------
---------------------------------------------------*/
If dw_busqueda.RowCount()<=0 Then
	Return
End If
of_redraw(False)
of_buscar()
of_redraw(True)
//-------------------------------------------------------

end event

type dw_detalle from u_dw_application within u_cst_reg_mant_base
integer x = 73
integer y = 640
integer width = 1865
integer height = 2304
integer taborder = 30
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:11:18
---------------------------------------------------
---------------------------------------------------*/
ib_cambios=True
end event

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:11:18
---------------------------------------------------
---------------------------------------------------*/
gb_detalle.of_color(True)
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:11:18
---------------------------------------------------
---------------------------------------------------*/
gb_detalle.of_color(False)
end event

event ue_insertrow;/*-------------------------------------------------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:11:12
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------*/
Long ll_i
//-------------------------------------------------------------------------------------------
Super::Event ue_insertRow()
ll_i = This.GetRow()
This.SetItem(ll_i,is_id_item,0)
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

type dw_busqueda from u_dw_application within u_cst_reg_mant_base
integer x = 110
integer y = 160
integer width = 1829
integer height = 160
boolean vscrollbar = false
boolean livescroll = false
end type

event itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:11:56
---------------------------------------------------
Overwrite!
---------------------------------------------------*/

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

type gb_busqueda from u_gb_base within u_cst_reg_mant_base
integer x = 37
integer y = 64
integer width = 1975
integer height = 448
integer taborder = 0
end type

type gb_detalle from u_gb_base within u_cst_reg_mant_base
integer x = 37
integer y = 544
integer width = 1975
integer height = 2464
integer taborder = 0
end type

