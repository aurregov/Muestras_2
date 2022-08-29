HA$PBExportHeader$w_sel_color_copia.srw
$PBExportComments$para seleccionar los colores que se van a copiar
forward
global type w_sel_color_copia from w_response
end type
type cb_4 from commandbutton within w_sel_color_copia
end type
type cb_3 from commandbutton within w_sel_color_copia
end type
type cb_2 from commandbutton within w_sel_color_copia
end type
type cb_1 from commandbutton within w_sel_color_copia
end type
type dw_1 from u_dw_application within w_sel_color_copia
end type
type gb_1 from groupbox within w_sel_color_copia
end type
end forward

global type w_sel_color_copia from w_response
integer width = 1335
integer height = 1588
string title = "Selecci$$HEX1$$f300$$ENDHEX$$n de colores a copiar"
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_sel_color_copia w_sel_color_copia

on w_sel_color_copia.create
int iCurrent
call super::create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_4
this.Control[iCurrent+2]=this.cb_3
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.dw_1
this.Control[iCurrent+6]=this.gb_1
end on

on w_sel_color_copia.destroy
call super::destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;call super::open;Datawindow ldw_1



ldw_1=message.PowerObjectParm

ldw_1.shareData(dw_1)
end event

type cb_4 from commandbutton within w_sel_color_copia
integer x = 933
integer y = 572
integer width = 343
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(parent)
end event

type cb_3 from commandbutton within w_sel_color_copia
integer x = 933
integer y = 456
integer width = 343
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;close(parent)


end event

type cb_2 from commandbutton within w_sel_color_copia
integer x = 933
integer y = 232
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ninguno"
end type

event clicked;long i

For i=1 to dw_1.RowCount()
	dw_1.setItem(i,"chk",0)
Next
end event

type cb_1 from commandbutton within w_sel_color_copia
integer x = 933
integer y = 116
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Todos"
end type

type dw_1 from u_dw_application within w_sel_color_copia
integer x = 87
integer y = 88
integer width = 773
integer height = 1256
string dataobject = "d_ext_copia_color"
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 31 de Julio de 2003 HORA 10:36:27:011
// 
// Overwrite!!!
//////////////////////////////////////////////////////////////////////////

end event

event itemchanged;call super::itemchanged;//long ll_row
//
//For ll_row = 1 to This.RowCount()
//	This.setItem(ll_row,"chk",0)
//Next
//
//IF data = '1' THEN
//	This.setItem(row,"chk",1) 
//ELSE 
//	This.setItem(row,"chk",0)
//END IF
end event

type gb_1 from groupbox within w_sel_color_copia
integer x = 55
integer y = 20
integer width = 827
integer height = 1400
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Colores"
end type

