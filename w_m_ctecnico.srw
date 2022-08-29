HA$PBExportHeader$w_m_ctecnico.srw
$PBExportComments$Para crear funcionarios de control tecnico
forward
global type w_m_ctecnico from w_simple
end type
end forward

global type w_m_ctecnico from w_simple
integer width = 2688
integer height = 1580
string title = "Usuario de control t$$HEX1$$e900$$ENDHEX$$cnico"
end type
global w_m_ctecnico w_m_ctecnico

on w_m_ctecnico.create
call super::create
end on

on w_m_ctecnico.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_general from w_simple`dw_general within w_m_ctecnico
integer x = 73
integer y = 144
integer width = 2546
integer height = 1200
string dataobject = "d_m_ctecnico"
boolean hscrollbar = true
end type

type gb_general from w_simple`gb_general within w_m_ctecnico
integer x = 50
integer y = 92
integer width = 2587
integer height = 1296
end type

