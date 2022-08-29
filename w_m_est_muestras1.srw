HA$PBExportHeader$w_m_est_muestras1.srw
$PBExportComments$Para los estados de los colores de la muestra
forward
global type w_m_est_muestras1 from w_simple
end type
end forward

global type w_m_est_muestras1 from w_simple
integer width = 1787
integer height = 1284
string title = "Estados de color de Desarrollo"
end type
global w_m_est_muestras1 w_m_est_muestras1

on w_m_est_muestras1.create
call super::create
end on

on w_m_est_muestras1.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;this.x = 1
this.y = 1
end event

type dw_general from w_simple`dw_general within w_m_est_muestras1
integer width = 1550
integer height = 944
string dataobject = "d_m_estado_muestra"
end type

type gb_general from w_simple`gb_general within w_m_est_muestras1
integer y = 52
integer width = 1646
integer height = 1040
end type

