HA$PBExportHeader$w_m_tipo_tejido_bk.srw
forward
global type w_m_tipo_tejido_bk from w_simple
end type
type cb_1 from commandbutton within w_m_tipo_tejido_bk
end type
end forward

global type w_m_tipo_tejido_bk from w_simple
integer width = 1376
string title = "Tipos de Tejido"
cb_1 cb_1
end type
global w_m_tipo_tejido_bk w_m_tipo_tejido_bk

on w_m_tipo_tejido_bk.create
int iCurrent
call super::create
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
end on

on w_m_tipo_tejido_bk.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
end on

event open;call super::open;this.x = 1
this.y = 1
end event

type dw_general from w_simple`dw_general within w_m_tipo_tejido_bk
integer y = 104
integer width = 1051
integer height = 864
string dataobject = "d_m_ttejidos"
end type

type gb_general from w_simple`gb_general within w_m_tipo_tejido_bk
integer width = 1230
end type

type cb_1 from commandbutton within w_m_tipo_tejido_bk
integer x = 841
integer y = 844
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
string text = "none"
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

