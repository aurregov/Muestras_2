HA$PBExportHeader$w_mu_m_clase_ss.srw
forward
global type w_mu_m_clase_ss from w_simple
end type
end forward

global type w_mu_m_clase_ss from w_simple
integer width = 1673
string title = "Clasificaci$$HEX1$$f300$$ENDHEX$$n de Solicitudes de servicio"
end type
global w_mu_m_clase_ss w_mu_m_clase_ss

on w_mu_m_clase_ss.create
call super::create
end on

on w_mu_m_clase_ss.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_general from w_simple`dw_general within w_mu_m_clase_ss
integer width = 1472
string dataobject = "d_mu_m_clase_ss"
end type

type gb_general from w_simple`gb_general within w_mu_m_clase_ss
integer width = 1554
end type

