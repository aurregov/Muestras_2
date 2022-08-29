HA$PBExportHeader$w_materia_prima.srw
$PBExportComments$Para seleccionar la materia prima
forward
global type w_materia_prima from w_response
end type
type st_1 from statictext within w_materia_prima
end type
type sle_1 from singlelineedit within w_materia_prima
end type
type cb_aceptar from commandbutton within w_materia_prima
end type
type cb_cancelar from commandbutton within w_materia_prima
end type
type dw_1 from u_dw_application within w_materia_prima
end type
type gb_1 from groupbox within w_materia_prima
end type
type gb_2 from groupbox within w_materia_prima
end type
end forward

global type w_materia_prima from w_response
integer width = 1353
integer height = 1528
string title = "Materia prima"
st_1 st_1
sle_1 sle_1
cb_aceptar cb_aceptar
cb_cancelar cb_cancelar
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_materia_prima w_materia_prima

type variables
long il_fila

n_cst_param io_param
end variables

forward prototypes
public function integer of_filaSel (long a_fila)
public function integer of_filtro (string a_filtro)
end prototypes

public function integer of_filaSel (long a_fila);//////////////////////////////////////////////////////////////////////////
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

on w_materia_prima.create
int iCurrent
call super::create
this.st_1=create st_1
this.sle_1=create sle_1
this.cb_aceptar=create cb_aceptar
this.cb_cancelar=create cb_cancelar
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.sle_1
this.Control[iCurrent+3]=this.cb_aceptar
this.Control[iCurrent+4]=this.cb_cancelar
this.Control[iCurrent+5]=this.dw_1
this.Control[iCurrent+6]=this.gb_1
this.Control[iCurrent+7]=this.gb_2
end on

on w_materia_prima.destroy
call super::destroy
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.cb_aceptar)
destroy(this.cb_cancelar)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;io_param=Message.PowerObjectParm


dw_1.SetTransObject(n_cst_application.itr_appl)

dw_1.Retrieve()
end event

type st_1 from statictext within w_materia_prima
integer x = 105
integer y = 112
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
string text = "Digite la Mat Prima:"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_materia_prima
integer x = 594
integer y = 104
integer width = 558
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

event modified;of_filtro("de_producto like '%"+text+"%'")
dw_1.SetFocus()
end event

type cb_aceptar from commandbutton within w_materia_prima
integer x = 242
integer y = 1300
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
// Miercoles 08 de Enero de 2003 HORA 11:17:57:265
// 
// 
//////////////////////////////////////////////////////////////////////////


If il_fila<=0 Then
	MessageBox("Advertencia!","Seleccione una materia prima.",StopSign!)
	Return
End If



n_cst_param lo_param

lo_param.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_producto")

CloseWithReturn(Parent,lo_param)


end event

type cb_cancelar from commandbutton within w_materia_prima
integer x = 594
integer y = 1300
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

type dw_1 from u_dw_application within w_materia_prima
integer x = 105
integer y = 276
integer width = 1083
integer height = 928
string dataobject = "d_m_matprimas"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event ue_insertrow;call super::ue_insertrow;////////////////////////////////////////////////////////////////////////////
//// JUAN FERNANDO VASQUEZ DUQE 
//// Miercoles 08 de Enero de 2003 HORA 11:17:29:828
//// 
//// Asigno valores a los campos ocultos
////////////////////////////////////////////////////////////////////////////
//
//long ll_f
//
//ll_f=GetRow()
//
//SetItem(ll_f,"co_fabrica",io_param.il_vector[1])
//SetItem(ll_f,"co_linea",io_param.il_vector[2])
//SetItem(ll_f,"co_muestra",io_param.il_vector[3])
//SetItem(ll_f,"co_talla",io_param.il_vector[4])
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

of_filaSel(Row)

cb_aceptar.post event clicked()
end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 30 de Enero de 2003 HORA 11:16:01:312
// 
// Se evitan los cambios en los datos
//////////////////////////////////////////////////////////////////////////


Return 2
end event

event itemfocuschanged;call super::itemfocuschanged;If Row=0 Then Return

of_filaSel(Row)
end event

type gb_1 from groupbox within w_materia_prima
integer x = 27
integer y = 220
integer width = 1234
integer height = 1056
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Materias primas"
borderstyle borderstyle = stylelowered!
end type

type gb_2 from groupbox within w_materia_prima
integer x = 27
integer y = 12
integer width = 1234
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
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda Mat. prima"
borderstyle borderstyle = stylelowered!
end type

