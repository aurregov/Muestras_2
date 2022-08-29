HA$PBExportHeader$w_actividad_sel_muestra.srw
$PBExportComments$WinObj. para seleccionar las actividades de una muestra
forward
global type w_actividad_sel_muestra from w_response
end type
type cbx_todos from u_cbx_base within w_actividad_sel_muestra
end type
type cb_cerrar from u_cb_application within w_actividad_sel_muestra
end type
type dw_actividades from u_dw_application within w_actividad_sel_muestra
end type
type gb_actividades from u_gb_base within w_actividad_sel_muestra
end type
end forward

global type w_actividad_sel_muestra from w_response
integer width = 2286
integer height = 1656
string title = "Actividades"
cbx_todos cbx_todos
cb_cerrar cb_cerrar
dw_actividades dw_actividades
gb_actividades gb_actividades
end type
global w_actividad_sel_muestra w_actividad_sel_muestra

on w_actividad_sel_muestra.create
int iCurrent
call super::create
this.cbx_todos=create cbx_todos
this.cb_cerrar=create cb_cerrar
this.dw_actividades=create dw_actividades
this.gb_actividades=create gb_actividades
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_todos
this.Control[iCurrent+2]=this.cb_cerrar
this.Control[iCurrent+3]=this.dw_actividades
this.Control[iCurrent+4]=this.gb_actividades
end on

on w_actividad_sel_muestra.destroy
call super::destroy
destroy(this.cbx_todos)
destroy(this.cb_cerrar)
destroy(this.dw_actividades)
destroy(this.gb_actividades)
end on

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 10 de Noviembre de 2004.H::
---------------------------------------------------
Evento que registra alg$$HEX1$$fa00$$ENDHEX$$n error en la compartici$$HEX1$$f300$$ENDHEX$$n de datos
actividades
---------------------------------------------------*/
If w_sheet_muestras1.dw_actividades.ShareData(dw_actividades)<>1 Then
	MessageBox('Advertencia','M$$HEX1$$f300$$ENDHEX$$dulo de datos err$$HEX1$$f300$$ENDHEX$$neo para actividades en el registro de muestras.')
End If
//---------------------------------------------------

end event

type cbx_todos from u_cbx_base within w_actividad_sel_muestra
integer x = 1947
integer y = 1328
integer width = 270
integer taborder = 20
string text = "Todos"
boolean lefttext = true
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 10 de Noviembre de 2004.H:10:40
---------------------------------------------------
---------------------------------------------------*/
Long ll_tot,ll_i,ll_val
//---------------------------------------------------
If This.Checked Then
	ll_val=1
Else
	ll_val=0
End If
//---------------------------------------------------
ll_tot = dw_actividades.RowCount()
For ll_i=1 to ll_tot
	dw_actividades.SetItem(ll_i,"check",ll_val)
Next
//---------------------------------------------------
end event

type cb_cerrar from u_cb_application within w_actividad_sel_muestra
integer x = 933
integer y = 1452
integer width = 293
integer height = 96
integer taborder = 30
string text = "&Cerrar"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mircoles 10 de Noviembre de 2004.H:11:14
---------------------------------------------------
---------------------------------------------------*/
Close(Parent)
end event

type dw_actividades from u_dw_application within w_actividad_sel_muestra
integer x = 69
integer y = 96
integer width = 2139
integer height = 1216
string dataobject = "d_mu_m_actividad_sel"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 10 de Noviembre de 2004.H:11:05
---------------------------------------------------
Overwrite!
---------------------------------------------------*/
end event

type gb_actividades from u_gb_base within w_actividad_sel_muestra
integer x = 37
integer y = 32
integer width = 2208
integer height = 1384
integer taborder = 0
integer weight = 400
string text = "Actividades"
end type

