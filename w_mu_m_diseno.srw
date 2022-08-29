HA$PBExportHeader$w_mu_m_diseno.srw
forward
global type w_mu_m_diseno from w_simple
end type
end forward

global type w_mu_m_diseno from w_simple
string title = "Dise$$HEX1$$f100$$ENDHEX$$os de muestras"
end type
global w_mu_m_diseno w_mu_m_diseno

on w_mu_m_diseno.create
call super::create
end on

on w_mu_m_diseno.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_general from w_simple`dw_general within w_mu_m_diseno
string dataobject = "d_mu_m_diseno"
end type

type gb_general from w_simple`gb_general within w_mu_m_diseno
end type

