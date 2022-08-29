HA$PBExportHeader$w_ficha.srw
$PBExportComments$ficha con el resumen para todos los colores
forward
global type w_ficha from w_report
end type
end forward

global type w_ficha from w_report
end type
global w_ficha w_ficha

on w_ficha.create
call super::create
end on

on w_ficha.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_report from w_report`dw_report within w_ficha
end type

