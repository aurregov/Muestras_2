HA$PBExportHeader$w_rep_configuracion.srw
forward
global type w_rep_configuracion from w_report
end type
end forward

global type w_rep_configuracion from w_report
integer width = 3662
integer height = 1900
string title = ""
string menuname = "m_reporte_simple"
end type
global w_rep_configuracion w_rep_configuracion

on w_rep_configuracion.create
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_reporte_simple" then this.MenuID = create m_reporte_simple
end on

on w_rep_configuracion.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;this.x = 1
this.y = 1

dw_report.SetTransObject(n_cst_application.itr_appl)

CHOOSE CASE sw_rep
	CASE 1
		w_rep_configuracion.Title = "Tipos de Proceso"
		dw_report.DataObject = "dw_rep_m_tipo_proceso"
	CASE 2
		w_rep_configuracion.Title = "Tipos de Tejido"
		dw_report.DataObject = "dw_rep_m_tipo_tejido"
	CASE 3
		w_rep_configuracion.Title = "Tipos de Solicitud"
		dw_report.DataObject = "dw_rep_m_tipo_solicitud"
	CASE 4
		w_rep_configuracion.Title = "Estados de la Solicitud"
		dw_report.DataObject = "dw_rep_m_est_solicitud"
	CASE 5
		w_rep_configuracion.Title = "Partes B$$HEX1$$e100$$ENDHEX$$sicas"
		dw_report.DataObject = "dw_rep_m_partebas"
	CASE 6
		w_rep_configuracion.Title = "Terceros"
		dw_report.DataObject = "dw_rep_m_terceros"
END CHOOSE

dw_report.SetTransObject(n_cst_application.itr_appl)

dw_report.Retrieve(2,gs_usuario)


end event

type dw_report from w_report`dw_report within w_rep_configuracion
integer width = 3589
integer height = 1704
end type

