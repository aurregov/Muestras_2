HA$PBExportHeader$w_base_busqueda_mod.srw
$PBExportComments$Para la b$$HEX1$$fa00$$ENDHEX$$squeda de datos y su modificaci$$HEX1$$f300$$ENDHEX$$n
forward
global type w_base_busqueda_mod from w_response
end type
type st_1 from statictext within w_base_busqueda_mod
end type
type sle_1 from singlelineedit within w_base_busqueda_mod
end type
type cb_adicionar from commandbutton within w_base_busqueda_mod
end type
type cb_eliminar from commandbutton within w_base_busqueda_mod
end type
type cb_aceptar from commandbutton within w_base_busqueda_mod
end type
type cb_cancelar from commandbutton within w_base_busqueda_mod
end type
type dw_1 from u_dw_application within w_base_busqueda_mod
end type
type gb_1 from groupbox within w_base_busqueda_mod
end type
type gb_2 from groupbox within w_base_busqueda_mod
end type
end forward

global type w_base_busqueda_mod from w_response
integer width = 1678
integer height = 1836
string title = "Combinaciones muestra"
st_1 st_1
sle_1 sle_1
cb_adicionar cb_adicionar
cb_eliminar cb_eliminar
cb_aceptar cb_aceptar
cb_cancelar cb_cancelar
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_base_busqueda_mod w_base_busqueda_mod

type variables
long il_fila

n_cst_param io_param, io_retorno
end variables

forward prototypes
public function integer of_filtro (string a_filtro)
public function integer of_retorno ()
public function integer of_verifica ()
end prototypes

public function integer of_filtro (string a_filtro);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 30 de Enero de 2003 HORA 10:55:08:234
// 
// 
//////////////////////////////////////////////////////////////////////////

dw_1.SetFilter(a_filtro)
dw_1.Filter()

Return 1
end function

public function integer of_retorno ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 17 de Marzo de 2003 HORA 09:58:32:515
// 
// 
//////////////////////////////////////////////////////////////////////////



Return 1
end function

public function integer of_verifica ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 30 de Enero de 2003 HORA 10:58:31:500
// 
// Se verifica que los datos sea adecuados y que no existan repetidos
//////////////////////////////////////////////////////////////////////////


Return 1
end function

on w_base_busqueda_mod.create
int iCurrent
call super::create
this.st_1=create st_1
this.sle_1=create sle_1
this.cb_adicionar=create cb_adicionar
this.cb_eliminar=create cb_eliminar
this.cb_aceptar=create cb_aceptar
this.cb_cancelar=create cb_cancelar
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.sle_1
this.Control[iCurrent+3]=this.cb_adicionar
this.Control[iCurrent+4]=this.cb_eliminar
this.Control[iCurrent+5]=this.cb_aceptar
this.Control[iCurrent+6]=this.cb_cancelar
this.Control[iCurrent+7]=this.dw_1
this.Control[iCurrent+8]=this.gb_1
this.Control[iCurrent+9]=this.gb_2
end on

on w_base_busqueda_mod.destroy
call super::destroy
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.cb_adicionar)
destroy(this.cb_eliminar)
destroy(this.cb_aceptar)
destroy(this.cb_cancelar)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;io_param=Message.PowerObjectParm


dw_1.SetTransObject(n_cst_application.itr_appl)


end event

type st_1 from statictext within w_base_busqueda_mod
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
string text = "Digite la combinaci$$HEX1$$f300$$ENDHEX$$n:"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_base_busqueda_mod
integer x = 594
integer y = 104
integer width = 809
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

type cb_adicionar from commandbutton within w_base_busqueda_mod
integer x = 754
integer y = 1440
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&dicionar"
end type

event clicked;dw_1.Trigger Event ue_insertRow()
end event

type cb_eliminar from commandbutton within w_base_busqueda_mod
integer x = 1102
integer y = 1440
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;dw_1.Trigger Event ue_DeleteRow()
end event

type cb_aceptar from commandbutton within w_base_busqueda_mod
integer x = 448
integer y = 1588
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

If dw_1.RowCount()>0 Then
	If il_fila<=0 Then
		MessageBox("Advertencia!","Debe seleccionar un registro.",StopSign!)
		Return
	End If

	If dw_1.AcceptText()<>1 Then
		MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
		Return
	End If

	of_retorno()
	
	If of_verifica()<>1 then
		Return
	End If
	
	DateTime ldt_fecha
	String ls_usuario,ls_instancia
	
	If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
													 ldt_fecha,ls_usuario,ls_instancia) Then
		Return -1
	End If
	


	If dw_1.of_datosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
		Return
	End If
End If

If dw_1.Update()<>1 then
	RollBack Using n_cst_application.itr_appl ;
	Return
End If

Commit Using n_cst_application.itr_appl ;

If dw_1.RowCount()>0 Then
	CloseWithReturn(Parent,io_retorno)
Else
	Close(Parent)
End If


end event

type cb_cancelar from commandbutton within w_base_busqueda_mod
integer x = 800
integer y = 1588
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

type dw_1 from u_dw_application within w_base_busqueda_mod
integer x = 55
integer y = 308
integer width = 1481
integer height = 1112
end type

event ue_insertrow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 08 de Enero de 2003 HORA 11:17:29:828
// 
// Asigno valores a los campos ocultos
//////////////////////////////////////////////////////////////////////////
super::Event ue_insertRow()
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

il_fila=Row

SelectRow(0,false)
SelectRow(il_fila,True)
end event

event doubleclicked;call super::doubleclicked;If Row=0 Then
	Return 
End If

il_fila=Row

SelectRow(0,false)
SelectRow(il_fila,True)

cb_aceptar.post event clicked()
end event

event itemfocuschanged;call super::itemfocuschanged;If Row=0 Then
	Return 
End If

If il_fila=Row Then Return 

il_fila=Row

SelectRow(0,false)
SelectRow(il_fila,True)
end event

event ue_dwnprocessenter;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 17 de Marzo de 2003 HORA 10:35:16:578
// 
// 
//////////////////////////////////////////////////////////////////////////

return 1


end event

type gb_1 from groupbox within w_base_busqueda_mod
integer x = 27
integer y = 252
integer width = 1531
integer height = 1316
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Combinaciones muestra"
end type

type gb_2 from groupbox within w_base_busqueda_mod
integer x = 27
integer y = 12
integer width = 1531
integer height = 228
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda combinaci$$HEX1$$f300$$ENDHEX$$n"
end type

