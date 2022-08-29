HA$PBExportHeader$w_mu_m_puno.srw
forward
global type w_mu_m_puno from w_simple
end type
end forward

global type w_mu_m_puno from w_simple
string title = "Pu$$HEX1$$f100$$ENDHEX$$os de muestras"
end type
global w_mu_m_puno w_mu_m_puno

on w_mu_m_puno.create
call super::create
end on

on w_mu_m_puno.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_general from w_simple`dw_general within w_mu_m_puno
string dataobject = "d_mu_m_puno"
end type

type gb_general from w_simple`gb_general within w_mu_m_puno
end type

