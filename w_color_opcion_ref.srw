HA$PBExportHeader$w_color_opcion_ref.srw
$PBExportComments$Ventana para seleccionar el color y la opcion para la copia
forward
global type w_color_opcion_ref from w_response
end type
type cb_2 from commandbutton within w_color_opcion_ref
end type
type cb_1 from commandbutton within w_color_opcion_ref
end type
type dw_1 from u_dw_application within w_color_opcion_ref
end type
type gb_1 from groupbox within w_color_opcion_ref
end type
end forward

global type w_color_opcion_ref from w_response
integer width = 942
integer height = 552
string title = "Copia Color"
boolean controlmenu = false
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_color_opcion_ref w_color_opcion_ref

on w_color_opcion_ref.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.gb_1
end on

on w_color_opcion_ref.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;call super::open;n_cst_param lo_param

lo_param=Message.PowerObjectParm


dw_1.InsertRow(0)

If IsValid(lo_param) Then
	dw_1.SetItem(1,"color",lo_param.il_vector[1])
End If


end event

type cb_2 from commandbutton within w_color_opcion_ref
integer x = 439
integer y = 328
integer width = 320
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancelar"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type cb_1 from commandbutton within w_color_opcion_ref
integer x = 110
integer y = 328
integer width = 320
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;n_cst_param lo_param

If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If


lo_param.il_vector[1]=dw_1.GetItemnumber(1,"color")

CloseWithReturn(Parent,lo_param)
end event

event getfocus;default=True
end event

event losefocus;default=false
end event

type dw_1 from u_dw_application within w_color_opcion_ref
integer x = 133
integer y = 76
integer width = 599
integer height = 176
string dataobject = "d_ext_color_opcion_REF"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 07 de Mayo de 2003 HORA 08:01:44:234
// 
// overwrite
//////////////////////////////////////////////////////////////////////////

end event

type gb_1 from groupbox within w_color_opcion_ref
integer x = 9
integer y = 20
integer width = 809
integer height = 248
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Copia de color"
end type

