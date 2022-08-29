HA$PBExportHeader$w_m_tipo_tejido.srw
forward
global type w_m_tipo_tejido from w_simple
end type
type cb_1 from commandbutton within w_m_tipo_tejido
end type
end forward

global type w_m_tipo_tejido from w_simple
integer width = 2103
integer height = 1640
string title = "Tipos de Tejido"
cb_1 cb_1
end type
global w_m_tipo_tejido w_m_tipo_tejido

on w_m_tipo_tejido.create
int iCurrent
call super::create
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
end on

on w_m_tipo_tejido.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
end on

event open;call super::open;this.x = 1
this.y = 1
end event

type dw_general from w_simple`dw_general within w_m_tipo_tejido
integer x = 87
integer y = 60
integer width = 1934
integer height = 1184
string dataobject = "d_m_ttejidos"
end type

type gb_general from w_simple`gb_general within w_m_tipo_tejido
integer x = 32
integer y = 4
integer width = 2021
integer height = 1324
end type

type cb_1 from commandbutton within w_m_tipo_tejido
integer x = 1518
integer y = 1360
integer width = 343
integer height = 100
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Bajar Plano"
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

