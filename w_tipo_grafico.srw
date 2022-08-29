HA$PBExportHeader$w_tipo_grafico.srw
$PBExportComments$Para seleccionar el tipo de grafico de clacetin que se imprime en el informe de materia prima
forward
global type w_tipo_grafico from w_response
end type
type cb_2 from commandbutton within w_tipo_grafico
end type
type cb_1 from commandbutton within w_tipo_grafico
end type
type dw_1 from u_dw_application within w_tipo_grafico
end type
end forward

global type w_tipo_grafico from w_response
integer x = 1
integer y = 1
integer width = 1943
integer height = 1388
string title = "Grafico para la impresi$$HEX1$$f300$$ENDHEX$$n"
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_tipo_grafico w_tipo_grafico

on w_tipo_grafico.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.dw_1
end on

on w_tipo_grafico.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 28 de Agosto de 2003 HORA 15:39:43:215
// 
// 
//////////////////////////////////////////////////////////////////////////


dw_1.insertRow(0)

//////////////////////////////////////////////////////////////////////////
// La mas utlizada es la larga
// 
//////////////////////////////////////////////////////////////////////////


dw_1.SetItem(1,"tipo_grafico",2)
end event

type cb_2 from commandbutton within w_tipo_grafico
integer x = 946
integer y = 1144
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_tipo_grafico
integer x = 576
integer y = 1144
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

event clicked;n_cst_param lo_param


If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If

lo_param.il_vector[1]=dw_1.getitemNumber(1,"tipo_grafico")

CloseWithReturn(parent,lo_param)
end event

type dw_1 from u_dw_application within w_tipo_grafico
integer x = 59
integer y = 24
integer width = 1797
integer height = 1088
string dataobject = "d_ext_tipo_grafico"
boolean vscrollbar = false
boolean border = true
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 28 de Agosto de 2003 HORA 15:34:14:606
// 
// Se cambia el grafico
//////////////////////////////////////////////////////////////////////////
long ll_dato

ll_dato=long(data)

Modify("p_1.Filename='tipo_"+String(ll_dato)+".bmp'")




end event

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 28 de Agosto de 2003 HORA 16:01:46:543
// 
// DataBlade!!
//////////////////////////////////////////////////////////////////////////

end event

