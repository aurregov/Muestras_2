HA$PBExportHeader$w_recurso_maquina.srw
forward
global type w_recurso_maquina from w_response
end type
type cb_1 from commandbutton within w_recurso_maquina
end type
type dw_1 from u_dw_application within w_recurso_maquina
end type
type gb_1 from groupbox within w_recurso_maquina
end type
end forward

global type w_recurso_maquina from w_response
integer width = 1947
integer height = 960
string title = "Maquina"
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_recurso_maquina w_recurso_maquina

on w_recurso_maquina.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.gb_1
end on

on w_recurso_maquina.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;call super::open;dw_1.SetTransObject(n_cst_application.itr_appl)

dw_1.InsertRow(0)
end event

type cb_1 from commandbutton within w_recurso_maquina
integer x = 773
integer y = 740
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 10 de Diciembre de 2002 HORA 14:17:00:515
// 
// Cerrar
//////////////////////////////////////////////////////////////////////////
Close(Parent)
end event

type dw_1 from u_dw_application within w_recurso_maquina
integer x = 73
integer y = 108
integer width = 1733
integer height = 528
integer taborder = 20
string dataobject = "d_consulta_maq"
boolean vscrollbar = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 10 de Diciembre de 2002 HORA 14:16:34:828
// 
// OverWrite!!!
//////////////////////////////////////////////////////////////////////////

end event

event itemchanged;call super::itemchanged;Long ll_dato

ll_dato=Long(Data)

Retrieve(ll_dato)

If RowCount()=0 Then
	InsertRow(0)
	MessageBox("Advertencia!","No se encontr$$HEX2$$f3002000$$ENDHEX$$la m$$HEX1$$e100$$ENDHEX$$quina.",StopSign!)
	Return
End If

end event

type gb_1 from groupbox within w_recurso_maquina
integer x = 41
integer y = 44
integer width = 1801
integer height = 644
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Datos de m$$HEX1$$e100$$ENDHEX$$quina"
borderstyle borderstyle = stylelowered!
end type

