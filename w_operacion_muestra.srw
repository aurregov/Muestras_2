HA$PBExportHeader$w_operacion_muestra.srw
$PBExportComments$para seleccionar las operaciones de una muestra
forward
global type w_operacion_muestra from w_response
end type
type cb_1 from commandbutton within w_operacion_muestra
end type
type cbx_1 from checkbox within w_operacion_muestra
end type
type dw_1 from u_dw_application within w_operacion_muestra
end type
type gb_1 from groupbox within w_operacion_muestra
end type
end forward

global type w_operacion_muestra from w_response
integer width = 1897
integer height = 1640
string title = "Operaciones"
cb_1 cb_1
cbx_1 cbx_1
dw_1 dw_1
gb_1 gb_1
end type
global w_operacion_muestra w_operacion_muestra

on w_operacion_muestra.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cbx_1=create cbx_1
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cbx_1
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.gb_1
end on

on w_operacion_muestra.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cbx_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;call super::open;w_sheet_muestras1.dw_operaciones.ShareData(dw_1)
end event

type cb_1 from commandbutton within w_operacion_muestra
integer x = 741
integer y = 1428
integer width = 343
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(Parent)
end event

type cbx_1 from checkbox within w_operacion_muestra
integer x = 1280
integer y = 1244
integer width = 343
integer height = 72
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todos"
boolean lefttext = true
end type

event clicked;long ll_tot,i,ll_val

If Checked Then
	ll_val=1
Else
	ll_val=0
End If

ll_tot = dw_1.RowCount()

For i=1 to ll_tot
	dw_1.SetItem(i,"check",ll_val)
Next
end event

type dw_1 from u_dw_application within w_operacion_muestra
integer x = 59
integer y = 92
integer width = 1664
integer height = 1128
string dataobject = "d_m_operac_muestra_sel"
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// overwrite!!
// 
//////////////////////////////////////////////////////////////////////////

end event

type gb_1 from groupbox within w_operacion_muestra
integer x = 27
integer y = 16
integer width = 1769
integer height = 1344
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Operaciones"
end type

