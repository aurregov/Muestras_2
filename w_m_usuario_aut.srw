HA$PBExportHeader$w_m_usuario_aut.srw
forward
global type w_m_usuario_aut from w_simple
end type
end forward

global type w_m_usuario_aut from w_simple
integer width = 2263
integer height = 1528
string title = "Usuarios por Tipo de Producto"
end type
global w_m_usuario_aut w_m_usuario_aut

on w_m_usuario_aut.create
call super::create
end on

on w_m_usuario_aut.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;this.x = 1
this.y = 1
end event

type dw_general from w_simple`dw_general within w_m_usuario_aut
integer x = 50
integer y = 124
integer width = 2126
integer height = 1156
string dataobject = "d_m_usuario"
end type

type gb_general from w_simple`gb_general within w_m_usuario_aut
integer x = 18
integer y = 48
integer width = 2167
integer height = 1308
end type

