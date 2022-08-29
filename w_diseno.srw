HA$PBExportHeader$w_diseno.srw
$PBExportComments$Para buscar dise$$HEX1$$f100$$ENDHEX$$os, tambien permite crear nuevos
forward
global type w_diseno from w_response
end type
type st_1 from statictext within w_diseno
end type
type sle_1 from singlelineedit within w_diseno
end type
type cb_cancelar from commandbutton within w_diseno
end type
type cb_aceptar from commandbutton within w_diseno
end type
type cb_eliminar from commandbutton within w_diseno
end type
type cb_adicionar from commandbutton within w_diseno
end type
type dw_1 from u_dw_application within w_diseno
end type
type gb_1 from groupbox within w_diseno
end type
type gb_2 from groupbox within w_diseno
end type
end forward

global type w_diseno from w_response
integer width = 1559
integer height = 1556
string title = "Dise$$HEX1$$f100$$ENDHEX$$os"
st_1 st_1
sle_1 sle_1
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
cb_eliminar cb_eliminar
cb_adicionar cb_adicionar
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_diseno w_diseno

type variables
n_cst_param io_param

long il_fila

end variables

forward prototypes
public function integer of_filtro (string a_filtro)
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

public function integer of_verifica ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 30 de Enero de 2003 HORA 10:58:31:500
// 
// Se verifica que los datos sea adecuados y que no existan repetidos
//////////////////////////////////////////////////////////////////////////
long ll_tot,i, ll_c,ll_c1
String ls_de_combi


of_filtro("")
dw_1.SetSort("co_diseno a")
dw_1.Sort()

ll_tot=dw_1.RowCount()

For i=1 to ll_tot
	ll_c=dw_1.GetItemNumber(i,"co_diseno")
	
	
	If IsNull(ll_c) Then
		MessageBox("Advertencia!","Codigo de dise$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido, fila "+&
		String(i)+".",StopSign!)
		Return -1
	End If
	
	If i<ll_tot Then			
		ll_c1=dw_1.GetItemNUmber(i+1,"co_diseno")
		If ll_c=ll_c1 Then
			MessageBox("Advertencia!","Codigo de dise$$HEX1$$f100$$ENDHEX$$o repetido, fila "+&
			String(i)+".",StopSign!)
			Return -1
		End If
	End If
			
	ls_de_combi=dw_1.GetItemString(i,"de_diseno")
	
	If IsNull(ls_de_combi) Then
		MessageBox("Advertencia!","Descripci$$HEX1$$f300$$ENDHEX$$n de dise$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lida, fila "+&
		String(i)+".",StopSign!)
		Return -1
	End If


Next

Return 1
end function

on w_diseno.create
int iCurrent
call super::create
this.st_1=create st_1
this.sle_1=create sle_1
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.cb_eliminar=create cb_eliminar
this.cb_adicionar=create cb_adicionar
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.sle_1
this.Control[iCurrent+3]=this.cb_cancelar
this.Control[iCurrent+4]=this.cb_aceptar
this.Control[iCurrent+5]=this.cb_eliminar
this.Control[iCurrent+6]=this.cb_adicionar
this.Control[iCurrent+7]=this.dw_1
this.Control[iCurrent+8]=this.gb_1
this.Control[iCurrent+9]=this.gb_2
end on

on w_diseno.destroy
call super::destroy
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.cb_eliminar)
destroy(this.cb_adicionar)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 04 de Diciembre de 2002 HORA 10:06:47:421
// 
// 
//////////////////////////////////////////////////////////////////////////
io_param=Message.PowerObjectParm

dw_1.SetTransObject(n_cst_application.itr_appl)

dw_1.Retrieve(io_param.il_vector[1],&
              io_param.il_vector[2],&
				  io_param.il_vector[3],&
				  io_param.il_vector[4],&
				  io_param.il_vector[5])
				  
end event

type st_1 from statictext within w_diseno
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
string text = "Digite el dise$$HEX1$$f100$$ENDHEX$$o:"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_diseno
integer x = 594
integer y = 72
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

event modified;of_filtro("de_diseno like '%"+text+"%'")
end event

type cb_cancelar from commandbutton within w_diseno
integer x = 695
integer y = 1324
integer width = 343
integer height = 100
integer taborder = 50
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

type cb_aceptar from commandbutton within w_diseno
integer x = 343
integer y = 1324
integer width = 343
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;DateTime ldt_fecha
String ls_usuario,ls_instancia

If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If



If il_fila<=0 Then
	MessageBox("Advertencia!","Seleccione un dise$$HEX1$$f100$$ENDHEX$$o.",StopSign!)
	Return
End If

If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If

n_cst_param lo_param

lo_param.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_diseno")

If of_verifica()<>1 then
	Return
End If

If dw_1.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
	Return
End If

If dw_1.Update()<>1 then
	RollBack Using n_cst_application.itr_appl ;
	Return
End If

Commit Using n_cst_application.itr_appl ;



CloseWithReturn(Parent,lo_param)


end event

type cb_eliminar from commandbutton within w_diseno
integer x = 1056
integer y = 1180
integer width = 343
integer height = 92
integer taborder = 30
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

type cb_adicionar from commandbutton within w_diseno
integer x = 709
integer y = 1180
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

type dw_1 from u_dw_application within w_diseno
integer x = 46
integer y = 280
integer width = 1376
integer height = 848
string dataobject = "d_m_diseno"
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 04 de Diciembre de 2002 HORA 10:14:37:578
// 
// OverWrite
//////////////////////////////////////////////////////////////////////////

end event

event ue_insertrow;call super::ue_insertrow;long ll_f

ll_f=GetRow()

If ll_f<=0 Then Return

SetItem(ll_f,"co_fabrica",io_param.il_vector[1])
SetItem(ll_f,"co_linea",io_param.il_vector[2])
SetItem(ll_f,"co_referencia",io_param.il_vector[3])
SetItem(ll_f,"co_talla",io_param.il_vector[4])
SetItem(ll_f,"co_calidad",io_param.il_vector[5])
end event

event doubleclicked;call super::doubleclicked;If Row=0 Then
	Return 
End If

il_fila=Row

SelectRow(0,false)
SelectRow(il_fila,True)

cb_aceptar.post event clicked()
end event

event clicked;call super::clicked;If Row=0 Then
	Return 
End If

il_fila=Row

SelectRow(0,false)
SelectRow(il_fila,True)


end event

type gb_1 from groupbox within w_diseno
integer x = 9
integer y = 224
integer width = 1449
integer height = 1076
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Dise$$HEX1$$f100$$ENDHEX$$os"
borderstyle borderstyle = stylelowered!
end type

type gb_2 from groupbox within w_diseno
integer x = 9
integer y = 12
integer width = 1449
integer height = 188
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda dise$$HEX1$$f100$$ENDHEX$$o"
borderstyle borderstyle = stylelowered!
end type

