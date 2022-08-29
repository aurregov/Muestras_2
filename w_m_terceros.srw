HA$PBExportHeader$w_m_terceros.srw
forward
global type w_m_terceros from w_simple
end type
end forward

global type w_m_terceros from w_simple
integer width = 3662
string title = "Partes B$$HEX1$$e100$$ENDHEX$$sicas"
end type
global w_m_terceros w_m_terceros

on w_m_terceros.create
call super::create
end on

on w_m_terceros.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;this.x = 1
this.y = 1
end event

type dw_general from w_simple`dw_general within w_m_terceros
integer x = 101
integer y = 80
integer width = 3479
integer height = 940
string dataobject = "dw_m_terceros"
boolean hscrollbar = true
end type

type gb_general from w_simple`gb_general within w_m_terceros
integer x = 32
integer y = 24
integer width = 3602
integer height = 1036
end type

