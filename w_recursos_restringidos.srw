HA$PBExportHeader$w_recursos_restringidos.srw
$PBExportComments$Para los estados de los colores de la muestra
forward
global type w_recursos_restringidos from w_simple
end type
end forward

global type w_recursos_restringidos from w_simple
integer width = 2341
integer height = 1828
string title = "Recursos Restringidos"
end type
global w_recursos_restringidos w_recursos_restringidos

on w_recursos_restringidos.create
call super::create
end on

on w_recursos_restringidos.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_general from w_simple`dw_general within w_recursos_restringidos
integer width = 2158
integer height = 1488
string dataobject = "dgr_m_operaciones"
boolean hscrollbar = true
end type

type gb_general from w_simple`gb_general within w_recursos_restringidos
integer width = 2249
integer height = 1576
end type

