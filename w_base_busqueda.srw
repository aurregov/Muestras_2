HA$PBExportHeader$w_base_busqueda.srw
$PBExportComments$Para la b$$HEX1$$fa00$$ENDHEX$$squeda de datos sin modificaci$$HEX1$$f300$$ENDHEX$$n
forward
global type w_base_busqueda from w_response
end type
type sle_1 from singlelineedit within w_base_busqueda
end type
type st_1 from statictext within w_base_busqueda
end type
type cb_aceptar from commandbutton within w_base_busqueda
end type
type cb_cancelar from commandbutton within w_base_busqueda
end type
type dw_1 from u_dw_application within w_base_busqueda
end type
type gb_1 from groupbox within w_base_busqueda
end type
type gb_2 from groupbox within w_base_busqueda
end type
end forward

global type w_base_busqueda from w_response
integer width = 1312
integer height = 1436
string title = ""
sle_1 sle_1
st_1 st_1
cb_aceptar cb_aceptar
cb_cancelar cb_cancelar
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_base_busqueda w_base_busqueda

type variables
long il_fila

n_cst_param io_param,io_retorno
end variables

forward prototypes
public function integer of_filtro (string a_filtro)
public function integer of_filasel (long a_fila)
public function integer of_retorno ()
public function integer of_validarcadena (string as_text)
end prototypes

public function integer of_filtro (string a_filtro);//----------------------------------
dw_1.SetFilter(a_filtro)
dw_1.Filter()

il_fila=0

dw_1.SelectRow(0,False)

If dw_1.RowCount()<=0 Then
	//Si filtra registros
	dw_1.SetFilter('')
	dw_1.Filter()	
End If
of_filaSel(1)

Return 1
//----------------------------------
//dw_1.SetFilter(a_filtro)
//dw_1.Filter()
//
//il_fila=0
//
//dw_1.SelectRow(0,False)
//
//If dw_1.RowCount()>0 Then
//	of_filaSel(1)
//End If
//
//Return 1
end function

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

public function integer of_retorno ();
io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_color")

Return 1
end function

public function integer of_validarcadena (string as_text);If pos(as_text,'"')>0 Then
	MessageBox("Advertencia!",'Car$$HEX1$$e100$$ENDHEX$$cter no v$$HEX1$$e100$$ENDHEX$$lido ("), por favor verifique.',StopSign!)
	Return -1
End If

If pos(as_text,"'")>0 Then
	MessageBox("Advertencia!","Car$$HEX1$$e100$$ENDHEX$$cter no v$$HEX1$$e100$$ENDHEX$$lido ('), por favor verifique.",StopSign!)
	Return -1
End If

If Len(as_Text)>0 AND Trim(as_text)='' Then
	MessageBox("Advertencia!","Texto no v$$HEX1$$e100$$ENDHEX$$lido (espacios en blanco), por favor verifique.",StopSign!)
	Return -1
End If

Return 1
end function

on w_base_busqueda.create
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

on w_base_busqueda.destroy
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
end event

type sle_1 from singlelineedit within w_base_busqueda
integer x = 594
integer y = 72
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

event modified;of_filtro("de_color like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from statictext within w_base_busqueda
integer x = 105
integer y = 80
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
string text = "Digite :"
boolean focusrectangle = false
end type

type cb_aceptar from commandbutton within w_base_busqueda
integer x = 251
integer y = 1192
integer width = 343
integer height = 100
integer taborder = 30
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
	MessageBox("Advertencia!","Seleccione una fila.",StopSign!)
	Return -1
End If

of_retorno()

CloseWithReturn(Parent,io_retorno)


end event

type cb_cancelar from commandbutton within w_base_busqueda
integer x = 603
integer y = 1192
integer width = 343
integer height = 100
integer taborder = 40
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

type dw_1 from u_dw_application within w_base_busqueda
integer x = 105
integer y = 280
integer width = 1042
integer height = 824
integer taborder = 20
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

type gb_1 from groupbox within w_base_busqueda
integer x = 27
integer y = 200
integer width = 1234
integer height = 956
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_base_busqueda
integer x = 27
integer y = 12
integer width = 1234
integer height = 180
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

