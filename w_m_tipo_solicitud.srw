HA$PBExportHeader$w_m_tipo_solicitud.srw
forward
global type w_m_tipo_solicitud from w_simple
end type
end forward

global type w_m_tipo_solicitud from w_simple
integer width = 1586
string title = "Tipos de Solicitud"
end type
global w_m_tipo_solicitud w_m_tipo_solicitud

on w_m_tipo_solicitud.create
call super::create
end on

on w_m_tipo_solicitud.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;this.x = 1
this.y = 1
end event

type dw_general from w_simple`dw_general within w_m_tipo_solicitud
integer width = 1431
string dataobject = "dw_m_tipo_solicitud"
end type

type gb_general from w_simple`gb_general within w_m_tipo_solicitud
integer y = 60
integer width = 1490
integer height = 940
end type

