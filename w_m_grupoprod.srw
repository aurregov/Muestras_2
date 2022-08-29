HA$PBExportHeader$w_m_grupoprod.srw
forward
global type w_m_grupoprod from w_simple
end type
type cb_1 from commandbutton within w_m_grupoprod
end type
end forward

global type w_m_grupoprod from w_simple
integer width = 1902
integer height = 1528
string title = "Grupos de Tipo de Producto"
cb_1 cb_1
end type
global w_m_grupoprod w_m_grupoprod

on w_m_grupoprod.create
int iCurrent
call super::create
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
end on

on w_m_grupoprod.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
end on

event open;call super::open;this.x = 1
this.y = 1
end event

type dw_general from w_simple`dw_general within w_m_grupoprod
integer x = 27
integer y = 92
integer width = 1797
integer height = 1116
string dataobject = "d_m_grupoprod"
boolean hscrollbar = true
end type

type gb_general from w_simple`gb_general within w_m_grupoprod
integer x = 9
integer y = 48
integer width = 1833
integer height = 1308
end type

type cb_1 from commandbutton within w_m_grupoprod
integer x = 1417
integer y = 1236
integer width = 407
integer height = 100
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Guardar Como..."
end type

event clicked;//dw_general.Object.DataWindow.Print.Paper.Size = '1'
//
//dw_general.Object.DataWindow.Export.PDF.Method = Distill!
//
////dw_general.Object.DataWindow.Printer = "\\prntsrvr\pr-6"
//
//dw_general.Object.DataWindow.Export.PDF.Distill.CustomPostScript="No"
//
dw_general.saveAs()
end event

