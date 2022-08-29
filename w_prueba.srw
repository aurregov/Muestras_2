HA$PBExportHeader$w_prueba.srw
forward
global type w_prueba from w_simple
end type
end forward

global type w_prueba from w_simple
boolean TitleBar=true
string Title="Prueba"
string MenuName="m_prueba"
end type
global w_prueba w_prueba

on w_prueba.create
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_prueba" then this.MenuID = create m_prueba
end on

on w_prueba.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_general from w_simple`dw_general within w_prueba
boolean BringToTop=true
string DataObject="d_centros_hza"
end type

