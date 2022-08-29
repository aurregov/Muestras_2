HA$PBExportHeader$w_bus_bordado.srw
$PBExportComments$Ventana de b$$HEX1$$fa00$$ENDHEX$$squeda para los bordados
forward
global type w_bus_bordado from w_base_busqueda
end type
end forward

global type w_bus_bordado from w_base_busqueda
string tag = "B$$HEX1$$fa00$$ENDHEX$$squeda de Bordados"
integer width = 1600
integer height = 1420
string title = "B$$HEX1$$fa00$$ENDHEX$$squeda de Bordados"
end type
global w_bus_bordado w_bus_bordado

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 02 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
Public:
n_cst_param_orden iou_param,iou_retorno
n_ds_application ids_var
end variables

forward prototypes
public function integer of_retorno ()
public function integer of_adic_inact ()
end prototypes

public function integer of_retorno ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:17:48
---------------------------------------------------
---------------------------------------------------*/
iou_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"id_bordado")
iou_retorno.is_vector[1]=dw_1.GetItemString(il_fila,"de_bordado")

Return 1
end function

public function integer of_adic_inact ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 02 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
Long ll_res,ll_i
String ls_cad
n_cst_param_orden lou_param
//-------------------------------------------------
//OJO hacer que se muestren todos y no filtrarlos
ids_var=iou_param.ids_vector[1]				
ll_res=ids_var.RowCount()
If ids_var.RowCount()>0 Then
	dw_1.SetFilter("activo='N'")
	dw_1.Filter()
	For ll_i=1 to dw_1.RowCount()
		ls_cad='id_bordado='+String(dw_1.GetItemNumber(ll_i,'id_bordado'))
		ll_res=ids_var.Find(ls_cad,1,ids_var.RowCount()+1)
		If ll_res<=0 Then//si no estan en las solicitudes
			dw_1.SetItem(ll_i,'id_bordado',0)
		End If
	Next
	dw_1.SetFilter("")
	dw_1.Filter()
	dw_1.SetFilter("id_bordado<>0")
	dw_1.Filter()
Else
	dw_1.SetFilter("activo='S'")
	dw_1.Filter()
End If
dw_1.RowsDiscard(1,dw_1.FilteredCount(),Filter!)
//------------------------------------
Return 1
end function

on w_bus_bordado.create
call super::create
end on

on w_bus_bordado.destroy
call super::destroy
end on

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:17:12
---------------------------------------------------
--------------------------------------------------*/
Long ll_res
//-------------------------------------------------
dw_1.of_conexion(n_cst_application.itr_appl,True)
ll_res = dw_1.Retrieve()
Choose Case ll_res
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos para la selecci$$HEX1$$f300$$ENDHEX$$n de bordados.",StopSign!)		
		Return -1
	Case 0
		MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","No hay datos para la selecci$$HEX1$$f300$$ENDHEX$$n de bordados.",Information!)	
		Return -1
End Choose
//----------------------------------------------------------------------
If IsValid(Message.PowerObjectParm) Then
	iou_param = Message.PowerObjectParm
	If IsValid(iou_param.ids_vector[1]) Then
		of_adic_inact ()
	End If
End If
//------------------------------------------------------------------------------
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_bordado
integer width = 777
integer limit = 40
end type

event sle_1::modified;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:17:23	
---------------------------------------------------
---------------------------------------------------*/
If of_validarcadena(Text)<>1 Then Return -1
of_filtro("Match(Upper(de_bordado),Upper('"+text+"'))")
//dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_bordado
string text = "Digite descripci$$HEX1$$f300$$ENDHEX$$n :"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_bordado
integer x = 434
end type

event cb_aceptar::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 02 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------

If il_fila<=0 Then
	MessageBox("Advertencia!","Seleccione una fila.",StopSign!)
	Return -1
End If

of_retorno()

CloseWithReturn(Parent,iou_retorno)
end event

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_bordado
integer x = 786
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_bordado
integer x = 69
integer width = 1445
string dataobject = "d_lista_bordado"
boolean hscrollbar = true
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_bordado
integer width = 1527
string text = "Lista de Bordados"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_bordado
integer width = 1527
string text = "Bordado"
end type

