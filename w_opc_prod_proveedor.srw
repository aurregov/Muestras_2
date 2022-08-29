HA$PBExportHeader$w_opc_prod_proveedor.srw
$PBExportComments$Parametros para la consulta de productios
forward
global type w_opc_prod_proveedor from w_response
end type
type dw_param from u_dw_application within w_opc_prod_proveedor
end type
type cb_cancelar from commandbutton within w_opc_prod_proveedor
end type
type cb_aceptar from commandbutton within w_opc_prod_proveedor
end type
type gb_1 from groupbox within w_opc_prod_proveedor
end type
end forward

global type w_opc_prod_proveedor from w_response
integer width = 1015
integer height = 908
string title = "Selecci$$HEX1$$f300$$ENDHEX$$n de Par$$HEX1$$e100$$ENDHEX$$metros "
boolean center = true
dw_param dw_param
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
gb_1 gb_1
end type
global w_opc_prod_proveedor w_opc_prod_proveedor

type variables
DataWindowChild idc_talla


end variables

on w_opc_prod_proveedor.create
int iCurrent
call super::create
this.dw_param=create dw_param
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_param
this.Control[iCurrent+2]=this.cb_cancelar
this.Control[iCurrent+3]=this.cb_aceptar
this.Control[iCurrent+4]=this.gb_1
end on

on w_opc_prod_proveedor.destroy
call super::destroy
destroy(this.dw_param)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.gb_1)
end on

event open;/*
* ============================================================================
* MODIFICADO: Mayos 06 de 2010 - ohlondon
* ----------------------------------------------------------------------------
* Ventana de seleccion de Parametros de busqueda para productos
* ============================================================================
*/
dw_param.SetTransObject(n_cst_application.itr_appl)
dw_param.GetChild("talla",idc_talla)
idc_talla.SetTransObject(n_cst_application.itr_appl)

idc_talla.InsertRow(0)

dw_param.InsertRow(0)



end event

type dw_param from u_dw_application within w_opc_prod_proveedor
integer x = 50
integer y = 68
integer width = 905
integer height = 536
string dataobject = "d_ext_producto"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;// override
end event

type cb_cancelar from commandbutton within w_opc_prod_proveedor
integer x = 507
integer y = 684
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancelar"
end type

event clicked;Close(Parent)
end event

type cb_aceptar from commandbutton within w_opc_prod_proveedor
integer x = 155
integer y = 684
integer width = 343
integer height = 100
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;/*
* ============================================================================
* MODIFICADO: Mayos 06 de 2010 - ohlondon
* ----------------------------------------------------------------------------
* Se cargan en la estructura lou_param los datos seleccionados. Se valida que 
* se seleccione al menos un parametro
* ============================================================================
*/
n_cst_param lou_param

If dw_param.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

// Se capturan los datos digitados 
lou_param.il_vector[1] = dw_param.GetItemNumber(1,"co_producto_mp")
lou_param.il_vector[2] = dw_param.GetItemNumber(1,"calidad_mp")
lou_param.il_vector[3] = dw_param.GetItemNumber(1,"co_matiz_mp")
lou_param.il_vector[4] = dw_param.GetItemNumber(1,"co_caracteristi_mp")
lou_param.il_vector[5] = dw_param.GetItemNumber(1,"co_color_mp")

lou_param.is_vector[1] = dw_param.GetItemString(1,"de_producto")

// Se valida que se haya digitado minimo uno de los parametros
If IsNull(lou_param.il_vector[1]) and IsNull(lou_param.il_vector[2]) and &
   IsNull(lou_param.il_vector[3]) and IsNull(lou_param.il_vector[4]) and &
	IsNull(lou_param.il_vector[5]) and IsNull(lou_param.is_vector[1]) Then
	MessageBox("$$HEX1$$a100$$ENDHEX$$Atenci$$HEX1$$f300$$ENDHEX$$n!", "Debe digitar por lo menos un p$$HEX1$$e100$$ENDHEX$$rametro para la b$$HEX1$$fa00$$ENDHEX$$squeda.")
	dw_param.SetColumn('co_producto')
	RETURN 1
End If
 
CloseWithReturn(Parent,lou_param)
end event

type gb_1 from groupbox within w_opc_prod_proveedor
integer x = 27
integer width = 946
integer height = 636
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

