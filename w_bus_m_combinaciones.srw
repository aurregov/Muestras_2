HA$PBExportHeader$w_bus_m_combinaciones.srw
$PBExportComments$Para las partes de materia prima
forward
global type w_bus_m_combinaciones from w_response
end type
type st_1 from statictext within w_bus_m_combinaciones
end type
type sle_1 from singlelineedit within w_bus_m_combinaciones
end type
type cb_adicionar from commandbutton within w_bus_m_combinaciones
end type
type cb_eliminar from commandbutton within w_bus_m_combinaciones
end type
type cb_aceptar from commandbutton within w_bus_m_combinaciones
end type
type cb_cancelar from commandbutton within w_bus_m_combinaciones
end type
type dw_1 from u_dw_application within w_bus_m_combinaciones
end type
type gb_1 from groupbox within w_bus_m_combinaciones
end type
type gb_2 from groupbox within w_bus_m_combinaciones
end type
end forward

global type w_bus_m_combinaciones from w_response
integer width = 1787
integer height = 1716
string title = "Combinaciones referencias"
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
global w_bus_m_combinaciones w_bus_m_combinaciones

type variables
long il_fila

n_cst_param io_param
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
dw_1.SetSort("#1 a")
dw_1.Sort()

ll_tot=dw_1.RowCount()

For i=1 to ll_tot
	ll_c=dw_1.GetItemNumber(i,"co_combinacion")
	
	
	If IsNull(ll_c) Then
		MessageBox("Advertencia!","Codigo de combinaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lido, fila "+&
		String(i)+".",StopSign!)
		Return -1
	End If
	
	If i<ll_tot Then			
		ll_c1=dw_1.GetItemNUmber(i+1,"co_combinacion")
		If ll_c=ll_c1 Then
			MessageBox("Advertencia!","Codigo de combinaci$$HEX1$$f300$$ENDHEX$$n repetido, fila "+&
			String(i)+".",StopSign!)
			Return -1
		End If
	End If
			
	ls_de_combi=dw_1.GetItemString(i,"de_combinacion")
	
	If IsNull(ls_de_combi) Then
		MessageBox("Advertencia!","Descripci$$HEX1$$f300$$ENDHEX$$n de combinaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida, fila "+&
		String(i)+".",StopSign!)
		Return -1
	End If


Next

Return 1
end function

on w_bus_m_combinaciones.create
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

on w_bus_m_combinaciones.destroy
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

event open;call super::open;long ll_tot

io_param=Message.PowerObjectParm


dw_1.SetTransObject(n_cst_application.itr_appl)

ll_tot=dw_1.Retrieve(io_param.il_vector[1]/*fabrica*/,&
              io_param.il_vector[2]/*linea*/,&
				  io_param.il_vector[3]/*referencia*/,&
				  io_param.il_vector[4]/*talla*/,&
				  io_param.il_vector[5]/*calidad*/)
				  
				  
If ll_tot=0 Then
	dw_1.triggerEvent("ue_insertrow")
End If				  
end event

type st_1 from statictext within w_bus_m_combinaciones
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

type sle_1 from singlelineedit within w_bus_m_combinaciones
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

event modified;of_filtro("de_combinacion like '%"+text+"%'")
end event

type cb_adicionar from commandbutton within w_bus_m_combinaciones
integer x = 754
integer y = 1280
integer width = 343
integer height = 92
integer taborder = 30
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

type cb_eliminar from commandbutton within w_bus_m_combinaciones
integer x = 1102
integer y = 1280
integer width = 343
integer height = 92
integer taborder = 40
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

type cb_aceptar from commandbutton within w_bus_m_combinaciones
integer x = 448
integer y = 1424
integer width = 343
integer height = 100
integer taborder = 50
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


If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If


n_cst_param lo_param

lo_param.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_combinacion")

If of_verifica()<>1 then
	Return
End If



If dw_1.Update()<>1 then
	RollBack Using n_cst_application.itr_appl ;
	Return
End If

Commit Using n_cst_application.itr_appl ;



CloseWithReturn(Parent,lo_param)


end event

type cb_cancelar from commandbutton within w_bus_m_combinaciones
integer x = 800
integer y = 1424
integer width = 343
integer height = 100
integer taborder = 60
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

type dw_1 from u_dw_application within w_bus_m_combinaciones
integer x = 105
integer y = 336
integer width = 1504
integer height = 928
integer taborder = 20
string dataobject = "d_lista_m_combinaciones"
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

Long ll_cons

ll_cons = Long(This.Describe("Evaluate('max(co_combinacion for all)', 0)"))

If IsNull(ll_cons) Then ll_cons=0

ll_cons++

SetItem(ll_f,"co_combinacion",ll_cons)

SetColumn("de_combinacion")





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

event ue_dwnprocessenter;if this.AcceptText() < 0 then
  Return 1
end if
//////////////////////////////////////////////////////////////////////////
// la col 6 es de_combinacion
// 
//////////////////////////////////////////////////////////////////////////

if this.GetColumn() = 6 then
 if this.GetRow() = this.RowCount() then
	postEvent("ue_insertRow")
   Return 1
 end if
end if

Send(Handle(this),256,9,Long(0,0))
return 1

end event

type gb_1 from groupbox within w_bus_m_combinaciones
integer x = 27
integer y = 280
integer width = 1646
integer height = 1112
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Combinaciones referencias"
borderstyle borderstyle = stylelowered!
end type

type gb_2 from groupbox within w_bus_m_combinaciones
integer x = 27
integer y = 12
integer width = 1646
integer height = 228
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda Combinaciones referencias"
borderstyle borderstyle = stylelowered!
end type

