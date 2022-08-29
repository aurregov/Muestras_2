HA$PBExportHeader$w_mu_m_base.srw
$PBExportComments$Para los estados de los colores de la muestra
forward
global type w_mu_m_base from w_simple
end type
end forward

global type w_mu_m_base from w_simple
integer width = 1627
string title = "Bases para tintas"
end type
global w_mu_m_base w_mu_m_base

on w_mu_m_base.create
call super::create
end on

on w_mu_m_base.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_general from w_simple`dw_general within w_mu_m_base
integer width = 1422
string dataobject = "d_mu_m_base"
end type

type gb_general from w_simple`gb_general within w_mu_m_base
integer width = 1495
end type

