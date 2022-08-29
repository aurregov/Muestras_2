HA$PBExportHeader$w_m_tipo_procesos.srw
forward
global type w_m_tipo_procesos from w_simple
end type
end forward

global type w_m_tipo_procesos from w_simple
string title = "Tipos de Procesos"
end type
global w_m_tipo_procesos w_m_tipo_procesos

on w_m_tipo_procesos.create
call super::create
end on

on w_m_tipo_procesos.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;this.x = 1
this.y = 1
end event

type dw_general from w_simple`dw_general within w_m_tipo_procesos
string dataobject = "dw_m_tipo_procesos"
end type

type gb_general from w_simple`gb_general within w_m_tipo_procesos
end type

