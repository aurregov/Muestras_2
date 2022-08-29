HA$PBExportHeader$w_sel_planat.srw
$PBExportComments$Para seleccionar la planta que se va a emplear al copiar na referencia
forward
global type w_sel_planat from w_response
end type
type cb_2 from commandbutton within w_sel_planat
end type
type cb_1 from commandbutton within w_sel_planat
end type
type dw_1 from u_dw_application within w_sel_planat
end type
type gb_1 from groupbox within w_sel_planat
end type
end forward

global type w_sel_planat from w_response
integer width = 1285
integer height = 676
string title = "Planta"
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_sel_planat w_sel_planat

on w_sel_planat.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.gb_1
end on

on w_sel_planat.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 07 de Noviembre de 2002 HORA 10:00:10:093
// 
// Solo se muestran las plantas de la fabrica en la que se va a 
// copiar la referencia
//
// Se envia como parametro la fabrica
//////////////////////////////////////////////////////////////////////////

Long ll_fab

ll_fab=message.DoubleParm


DataWindowChild ldc_planta

dw_1.SetTransObject(n_cst_application.itr_appl)
dw_1.GetChild("co_planta",ldc_planta)
ldc_planta.SetTransObject(n_cst_application.itr_appl)

ldc_planta.Retrieve(ll_fab)

dw_1.InsertRow(0)



end event

type cb_2 from commandbutton within w_sel_planat
integer x = 274
integer y = 396
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Planta no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	Return
End If


long ll_planta

ll_planta=dw_1.GetItemNumber(1,1)

CloseWithReturn(Parent,ll_planta)

end event

type cb_1 from commandbutton within w_sel_planat
integer x = 626
integer y = 396
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type dw_1 from u_dw_application within w_sel_planat
integer x = 174
integer y = 108
integer width = 910
integer height = 144
string dataobject = "d_ext_planta"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// OverWrite
// 
//////////////////////////////////////////////////////////////////////////

end event

type gb_1 from groupbox within w_sel_planat
integer x = 55
integer y = 24
integer width = 1143
integer height = 292
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione la planta"
borderstyle borderstyle = stylelowered!
end type

