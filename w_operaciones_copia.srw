HA$PBExportHeader$w_operaciones_copia.srw
forward
global type w_operaciones_copia from w_response
end type
type cbx_1 from checkbox within w_operaciones_copia
end type
type cb_1 from commandbutton within w_operaciones_copia
end type
type dw_1 from u_dw_application within w_operaciones_copia
end type
type gb_1 from groupbox within w_operaciones_copia
end type
end forward

global type w_operaciones_copia from w_response
integer width = 3168
integer height = 1524
string title = "Operaciones a copiar"
cbx_1 cbx_1
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_operaciones_copia w_operaciones_copia

on w_operaciones_copia.create
int iCurrent
call super::create
this.cbx_1=create cbx_1
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_1
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.gb_1
end on

on w_operaciones_copia.destroy
call super::destroy
destroy(this.cbx_1)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;call super::open;u_dw_application l_param

l_param=message.PowerObjectParm

l_param.ShareData(dw_1)
end event

type cbx_1 from checkbox within w_operaciones_copia
integer x = 2706
integer y = 1248
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todos"
boolean checked = true
end type

event clicked;long ll_chk,i,ll_tot

If Checked Then
	ll_chk=1
Else
	ll_chk=0
End If


ll_tot=dw_1.RowCount()

For i=1 To ll_tot
	dw_1.SetItem(i,"chk",ll_chk)
Next
end event

type cb_1 from commandbutton within w_operaciones_copia
integer x = 1376
integer y = 1292
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(parent)
end event

type dw_1 from u_dw_application within w_operaciones_copia
integer x = 50
integer y = 68
integer width = 3003
integer height = 1120
string dataobject = "d_m_preref1"
end type

event getfocus;//
end event

type gb_1 from groupbox within w_operaciones_copia
integer x = 14
integer y = 12
integer width = 3063
integer height = 1228
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Operaciones a copiar"
end type

