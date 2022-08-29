HA$PBExportHeader$w_inf_dias_orden.srw
forward
global type w_inf_dias_orden from w_simple
end type
type cb_aceptar from commandbutton within w_inf_dias_orden
end type
type cb_cancelar from commandbutton within w_inf_dias_orden
end type
type dw_dias_ordenes from datawindow within w_inf_dias_orden
end type
end forward

global type w_inf_dias_orden from w_simple
integer width = 1257
integer height = 684
string title = "$$HEX1$$d300$$ENDHEX$$rdenes Completas"
string menuname = ""
boolean minbox = false
cb_aceptar cb_aceptar
cb_cancelar cb_cancelar
dw_dias_ordenes dw_dias_ordenes
end type
global w_inf_dias_orden w_inf_dias_orden

on w_inf_dias_orden.create
int iCurrent
call super::create
this.cb_aceptar=create cb_aceptar
this.cb_cancelar=create cb_cancelar
this.dw_dias_ordenes=create dw_dias_ordenes
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_aceptar
this.Control[iCurrent+2]=this.cb_cancelar
this.Control[iCurrent+3]=this.dw_dias_ordenes
end on

on w_inf_dias_orden.destroy
call super::destroy
destroy(this.cb_aceptar)
destroy(this.cb_cancelar)
destroy(this.dw_dias_ordenes)
end on

event open;// Override 
 

dw_general.Insertrow(0)
end event

event closequery;//Override
end event

type dw_general from w_simple`dw_general within w_inf_dias_orden
integer y = 92
integer width = 1125
integer height = 220
string dataobject = "d_ext_dias_orden"
boolean vscrollbar = false
boolean livescroll = false
end type

type gb_general from w_simple`gb_general within w_inf_dias_orden
integer x = 14
integer y = 0
integer width = 1198
integer height = 412
end type

type cb_aceptar from commandbutton within w_inf_dias_orden
integer x = 270
integer y = 452
integer width = 343
integer height = 100
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;datetime	ldt_fecha_inicial, ldt_fecha_final 
INTEGER	li_exito	
STRING	ls_mensaje
Long 		ll_filas

dw_general.AcceptText()
dw_dias_ordenes.DataObject = 'd_dias_orden_excel'
dw_dias_ordenes.SetTransobject(n_cst_application.itr_appl)
s_base_parametros ls_parametro

ls_parametro.cadena[1] = 'Plano Ordenes Completas'
ls_parametro.cadena[2] = 'Generando cuadro en Excel... por favor espere.'
ls_parametro.cadena[3] = 'reloj'

OpenWithParm(w_retroalimentacion, ls_parametro)

ldt_fecha_inicial = dw_general.Getitemdatetime(1,"fecha_inicial")
ldt_fecha_final	= dw_general.Getitemdatetime(1,"fecha_final")

ll_filas = dw_dias_ordenes.Retrieve( ldt_fecha_inicial , ldt_fecha_final)

CHOOSE CASE ll_filas
	CASE 0
		// NO hay registros para el rango de fechas
		MessageBox("Advertencia","No hay registros "+&
					  " para el rango de fechas especificado "+".~n~n"+SQLCA.SqlErrText)
	  close(w_retroalimentacion)
	CASE -1	

		// Ocurrio un error
		
		MessageBox("Error", "Ocurri$$HEX2$$f3002000$$ENDHEX$$un error al ejecutar el"+&
								  " la seleccion de datos  "+".~n~n"+SQLCA.SqlErrText, StopSign!)
 		close(w_retroalimentacion)
	CASE ELSE
		// Se lleva a excel
		
		close(w_retroalimentacion)
		ll_filas = dw_dias_ordenes.RowCount()
		IF ll_filas > 0 THEN
			 ll_filas = dw_dias_ordenes.SaveAs()
		END IF
END CHOOSE


end event

type cb_cancelar from commandbutton within w_inf_dias_orden
integer x = 631
integer y = 452
integer width = 343
integer height = 100
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancelar"
end type

event clicked;CLOSE(PARENT)
end event

type dw_dias_ordenes from datawindow within w_inf_dias_orden
boolean visible = false
integer x = 1033
integer y = 424
integer width = 686
integer height = 400
integer taborder = 40
boolean bringtotop = true
boolean titlebar = true
string title = "dw_dias_ordenes"
string dataobject = "d_dias_orden_excel"
boolean resizable = true
boolean border = false
boolean livescroll = true
end type

