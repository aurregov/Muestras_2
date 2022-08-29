HA$PBExportHeader$w_mu_m_largo.srw
forward
global type w_mu_m_largo from w_simple
end type
end forward

global type w_mu_m_largo from w_simple
string title = "Largo de muestras"
end type
global w_mu_m_largo w_mu_m_largo

on w_mu_m_largo.create
call super::create
end on

on w_mu_m_largo.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_general from w_simple`dw_general within w_mu_m_largo
string dataobject = "d_mu_m_largo"
end type

type gb_general from w_simple`gb_general within w_mu_m_largo
end type

