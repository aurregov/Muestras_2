HA$PBExportHeader$w_m_est_solicitud.srw
forward
global type w_m_est_solicitud from w_simple
end type
end forward

global type w_m_est_solicitud from w_simple
integer width = 1518
string title = "Estados de Solicitud"
end type
global w_m_est_solicitud w_m_est_solicitud

on w_m_est_solicitud.create
call super::create
end on

on w_m_est_solicitud.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;this.x = 1
this.y = 1

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Estos estados no se est$$HEX1$$e100$$ENDHEX$$n utlizando, se manejan los de color de desarrollo.")
MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Estos estados no se est$$HEX1$$e100$$ENDHEX$$n utlizando, se manejan los de color de desarrollo.")
MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Estos estados no se est$$HEX1$$e100$$ENDHEX$$n utlizando, se manejan los de color de desarrollo.")

end event

type dw_general from w_simple`dw_general within w_m_est_solicitud
integer width = 1381
string dataobject = "dw_m_est_solicitud"
end type

type gb_general from w_simple`gb_general within w_m_est_solicitud
integer y = 52
integer width = 1413
integer height = 948
end type

