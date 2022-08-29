HA$PBExportHeader$w_maquinas_recurso.srw
$PBExportComments$Lista las maquinas de un recurso
forward
global type w_maquinas_recurso from w_response
end type
type cb_1 from commandbutton within w_maquinas_recurso
end type
type dw_detalle from u_dw_application within w_maquinas_recurso
end type
type dw_head from u_dw_application within w_maquinas_recurso
end type
type gb_1 from groupbox within w_maquinas_recurso
end type
type gb_2 from groupbox within w_maquinas_recurso
end type
end forward

global type w_maquinas_recurso from w_response
integer width = 1874
integer height = 1612
string title = "Maquinas por recurso"
cb_1 cb_1
dw_detalle dw_detalle
dw_head dw_head
gb_1 gb_1
gb_2 gb_2
end type
global w_maquinas_recurso w_maquinas_recurso

on w_maquinas_recurso.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.dw_detalle=create dw_detalle
this.dw_head=create dw_head
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.dw_detalle
this.Control[iCurrent+3]=this.dw_head
this.Control[iCurrent+4]=this.gb_1
this.Control[iCurrent+5]=this.gb_2
end on

on w_maquinas_recurso.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.dw_detalle)
destroy(this.dw_head)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 23 de Enero de 2003 HORA 11:33:44:406
// 
// 
//////////////////////////////////////////////////////////////////////////



dw_head.SetTransObject(n_cst_application.itr_appl)
dw_detalle.SetTransObject(n_cst_application.itr_appl)

dw_head.InsertRow(0)
end event

type cb_1 from commandbutton within w_maquinas_recurso
integer x = 773
integer y = 1384
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

event clicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 10 de Diciembre de 2002 HORA 14:17:00:515
// 
// Cerrar
//////////////////////////////////////////////////////////////////////////
Close(Parent)
end event

type dw_detalle from u_dw_application within w_maquinas_recurso
integer x = 69
integer y = 364
integer width = 1577
integer height = 904
integer taborder = 0
string dataobject = "d_maquinas_recurso"
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 23 de Enero de 2003 HORA 11:41:07:859
// 
// overwrite
//////////////////////////////////////////////////////////////////////////

end event

type dw_head from u_dw_application within w_maquinas_recurso
integer x = 96
integer y = 76
integer width = 1582
integer height = 172
string dataobject = "d_recursos"
boolean vscrollbar = false
boolean livescroll = false
end type

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 23 de Enero de 2003 HORA 11:31:19:421
// 
// 
//////////////////////////////////////////////////////////////////////////


long ll_recurso,ll_tot

ll_recurso=Long(data)

dw_detalle.Reset()

ll_tot=Retrieve(ll_Recurso)

If ll_tot<=0 Then
	InsertRow(0)
	MessageBox("Advertencia!","No se encontr$$HEX2$$f3002000$$ENDHEX$$el recurso.",StopSign!)
	Return 2
End If

dw_detalle.Retrieve(ll_recurso)
end event

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 23 de Enero de 2003 HORA 11:40:52:015
// 
// overwrite
//////////////////////////////////////////////////////////////////////////

end event

type gb_1 from groupbox within w_maquinas_recurso
integer x = 23
integer y = 28
integer width = 1719
integer height = 248
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Recurso"
borderstyle borderstyle = stylelowered!
end type

type gb_2 from groupbox within w_maquinas_recurso
integer x = 23
integer y = 292
integer width = 1719
integer height = 1040
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Maquinas"
borderstyle borderstyle = stylelowered!
end type

