HA$PBExportHeader$w_mu_m_calibre_chab.srw
forward
global type w_mu_m_calibre_chab from w_simple
end type
end forward

global type w_mu_m_calibre_chab from w_simple
integer width = 1577
string title = "Calibres de chablones"
end type
global w_mu_m_calibre_chab w_mu_m_calibre_chab

on w_mu_m_calibre_chab.create
call super::create
end on

on w_mu_m_calibre_chab.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_general from w_simple`dw_general within w_mu_m_calibre_chab
integer width = 1367
string dataobject = "d_mu_m_calibre_chab"
boolean livescroll = false
end type

type gb_general from w_simple`gb_general within w_mu_m_calibre_chab
integer width = 1435
end type

