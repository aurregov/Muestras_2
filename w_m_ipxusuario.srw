HA$PBExportHeader$w_m_ipxusuario.srw
forward
global type w_m_ipxusuario from w_simple
end type
end forward

global type w_m_ipxusuario from w_simple
integer width = 1943
integer height = 1208
string title = "Direcci$$HEX1$$f300$$ENDHEX$$n IP por Usuario"
end type
global w_m_ipxusuario w_m_ipxusuario

on w_m_ipxusuario.create
call super::create
end on

on w_m_ipxusuario.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;this.x = 1
this.y = 1


end event

type dw_general from w_simple`dw_general within w_m_ipxusuario
integer x = 50
integer y = 52
integer width = 1829
integer height = 928
string dataobject = "d_m_ip_x_usuario"
end type

type gb_general from w_simple`gb_general within w_m_ipxusuario
integer x = 27
integer y = 0
integer width = 1874
integer height = 1012
end type

