HA$PBExportHeader$w_color_mp_prod.srw
$PBExportComments$para filtrar solo por producto
forward
global type w_color_mp_prod from w_response
end type
type sle_1 from singlelineedit within w_color_mp_prod
end type
type st_1 from statictext within w_color_mp_prod
end type
type cb_aceptar from commandbutton within w_color_mp_prod
end type
type cb_cancelar from commandbutton within w_color_mp_prod
end type
type dw_1 from u_dw_application within w_color_mp_prod
end type
type gb_1 from groupbox within w_color_mp_prod
end type
type gb_2 from groupbox within w_color_mp_prod
end type
end forward

global type w_color_mp_prod from w_response
integer width = 1691
integer height = 1420
string title = "Color Materia prima"
sle_1 sle_1
st_1 st_1
cb_aceptar cb_aceptar
cb_cancelar cb_cancelar
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_color_mp_prod w_color_mp_prod

type variables
long il_fila

n_cst_param io_param
end variables

forward prototypes
public function integer of_filasel (long a_fila)
public function integer of_filtro (string a_filtro)
end prototypes

public function integer of_filasel (long a_fila);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 30 de Enero de 2003 HORA 11:22:07:437
// 
// 
//////////////////////////////////////////////////////////////////////////
il_fila=a_fila

dw_1.SelectRow(0,False)
dw_1.SelectRow(il_fila,true)


Return 1

end function

public function integer of_filtro (string a_filtro);dw_1.SetFilter(a_filtro)
dw_1.Filter()

il_fila=0

dw_1.SelectRow(0,False)

If dw_1.RowCount()>0 Then
	of_filaSel(1)
End If

Return 1
end function

on w_color_mp_prod.create
int iCurrent
call super::create
this.sle_1=create sle_1
this.st_1=create st_1
this.cb_aceptar=create cb_aceptar
this.cb_cancelar=create cb_cancelar
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.cb_aceptar
this.Control[iCurrent+4]=this.cb_cancelar
this.Control[iCurrent+5]=this.dw_1
this.Control[iCurrent+6]=this.gb_1
this.Control[iCurrent+7]=this.gb_2
end on

on w_color_mp_prod.destroy
call super::destroy
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.cb_aceptar)
destroy(this.cb_cancelar)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;io_param=Message.PowerObjectParm


dw_1.SetTransObject(n_cst_application.itr_appl)

dw_1.Retrieve(io_param.il_vector[1],&
              io_param.il_vector[2])
end event

type sle_1 from singlelineedit within w_color_mp_prod
integer x = 594
integer y = 88
integer width = 690
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;of_filtro("de_color like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from statictext within w_color_mp_prod
integer x = 105
integer y = 96
integer width = 480
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Digite color:"
boolean focusrectangle = false
end type

type cb_aceptar from commandbutton within w_color_mp_prod
integer x = 411
integer y = 1192
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

event clicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 09 de Diciembre de 2002 HORA 09:07:56:468
// 
// 
//////////////////////////////////////////////////////////////////////////


If il_fila<=0 Then
	MessageBox("Advertencia!","Seleccione una parte.",StopSign!)
	Return
End If


n_cst_param lo_param

lo_param.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_color")
lo_param.is_vector[1]=dw_1.GetItemString(il_fila,"estado")

CloseWithReturn(Parent,lo_param)


end event

type cb_cancelar from commandbutton within w_color_mp_prod
integer x = 763
integer y = 1192
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
end type

event clicked;Close(Parent)
end event

type dw_1 from u_dw_application within w_color_mp_prod
integer x = 69
integer y = 360
integer width = 1522
integer height = 728
string dataobject = "d_color_mat_prima_prod"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event ue_insertrow;call super::ue_insertrow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 09 de Diciembre de 2002 HORA 09:17:50:750
// 
// Asigno valores a los campos ocultos
//////////////////////////////////////////////////////////////////////////

long ll_f

ll_f=GetRow()

SetItem(ll_f,"co_fabrica",io_param.il_vector[1])
SetItem(ll_f,"co_linea",io_param.il_vector[2])
SetItem(ll_f,"co_referencia",io_param.il_vector[3])
SetItem(ll_f,"co_talla",io_param.il_vector[4])
SetItem(ll_f,"co_calidad",io_param.il_vector[5])

end event

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 11 de Diciembre de 2002 HORA 16:52:02:000
// 
// OverWrite!!
//////////////////////////////////////////////////////////////////////////

end event

event clicked;call super::clicked;If Row=0 Then
	Return 
End If

of_filaSel(Row)
end event

event doubleclicked;call super::doubleclicked;If Row=0 Then
	Return 
End If

of_filaSel(row)

cb_aceptar.post event clicked()
end event

event itemfocuschanged;call super::itemfocuschanged;If Row=0 Then Return

of_filaSel(row)
end event

type gb_1 from groupbox within w_color_mp_prod
integer x = 27
integer y = 296
integer width = 1618
integer height = 860
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Colores materia prima"
end type

type gb_2 from groupbox within w_color_mp_prod
integer x = 27
integer y = 12
integer width = 1609
integer height = 204
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda de colores"
end type

