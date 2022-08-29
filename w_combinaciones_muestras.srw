HA$PBExportHeader$w_combinaciones_muestras.srw
$PBExportComments$Para parametrizar las combianciones de las muestras
forward
global type w_combinaciones_muestras from w_response
end type
type cb_aceptar from commandbutton within w_combinaciones_muestras
end type
type cb_cancelar from commandbutton within w_combinaciones_muestras
end type
type sle_1 from singlelineedit within w_combinaciones_muestras
end type
type st_1 from statictext within w_combinaciones_muestras
end type
type gb_2 from groupbox within w_combinaciones_muestras
end type
type dw_1 from u_dw_application within w_combinaciones_muestras
end type
type gb_1 from groupbox within w_combinaciones_muestras
end type
type cb_eliminar from commandbutton within w_combinaciones_muestras
end type
type cb_adicionar from commandbutton within w_combinaciones_muestras
end type
end forward

global type w_combinaciones_muestras from w_response
integer width = 1541
integer height = 1428
string title = "B$$HEX1$$fa00$$ENDHEX$$squeda de combinaciones"
cb_aceptar cb_aceptar
cb_cancelar cb_cancelar
sle_1 sle_1
st_1 st_1
gb_2 gb_2
dw_1 dw_1
gb_1 gb_1
cb_eliminar cb_eliminar
cb_adicionar cb_adicionar
end type
global w_combinaciones_muestras w_combinaciones_muestras

type variables
long il_fila

n_cst_parm_dw io_param,io_retorno
end variables

forward prototypes
public function integer of_filasel (long a_fila)
public function integer of_filtro (string a_filtro)
public function integer of_retorno ()
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

dw_1.SetFocus()
dw_1.setRow(il_fila)

Return 1

end function

public function integer of_filtro (string a_filtro);String ls_filtro


ls_filtro="co_talla="+String(io_param.il_vector[1])+" and "	      			
				

ls_filtro+=a_filtro

dw_1.SetFilter(ls_filtro)
dw_1.Filter()

il_fila=0

dw_1.SelectRow(0,False)

If dw_1.RowCount()>0 Then
	of_filaSel(1)
End If

Return 1
end function

public function integer of_retorno ();If il_fila>0 Then
	io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_combinacion")
End If

Return 1
end function

on w_combinaciones_muestras.create
int iCurrent
call super::create
this.cb_aceptar=create cb_aceptar
this.cb_cancelar=create cb_cancelar
this.sle_1=create sle_1
this.st_1=create st_1
this.gb_2=create gb_2
this.dw_1=create dw_1
this.gb_1=create gb_1
this.cb_eliminar=create cb_eliminar
this.cb_adicionar=create cb_adicionar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_aceptar
this.Control[iCurrent+2]=this.cb_cancelar
this.Control[iCurrent+3]=this.sle_1
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.gb_2
this.Control[iCurrent+6]=this.dw_1
this.Control[iCurrent+7]=this.gb_1
this.Control[iCurrent+8]=this.cb_eliminar
this.Control[iCurrent+9]=this.cb_adicionar
end on

on w_combinaciones_muestras.destroy
call super::destroy
destroy(this.cb_aceptar)
destroy(this.cb_cancelar)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.gb_2)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.cb_eliminar)
destroy(this.cb_adicionar)
end on

event open;call super::open;//MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","open")

io_param=Message.PowerObjectParm

io_param.idw_vector[1].ShareData(dw_1)

of_filaSel(1)
end event

type cb_aceptar from commandbutton within w_combinaciones_muestras
integer x = 251
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
string text = "&Aceptar"
end type

event clicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 09 de Diciembre de 2002 HORA 09:07:56:468
// 
// 
//////////////////////////////////////////////////////////////////////////
If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If

If Not dw_1.of_completedata() Then
	Return
End IF


If il_fila<=0 Then
	MessageBox("Advertencia!","Seleccione una fila.",StopSign!)
	Return -1
End If

Commit Using n_cst_application.itr_appl;

of_retorno()

CloseWithReturn(Parent,io_retorno)


end event

type cb_cancelar from commandbutton within w_combinaciones_muestras
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

type sle_1 from singlelineedit within w_combinaciones_muestras
integer x = 677
integer y = 72
integer width = 558
integer height = 84
integer taborder = 20
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
dw_1.SetFocus()
end event

type st_1 from statictext within w_combinaciones_muestras
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
string text = "Digite combinaci$$HEX1$$f300$$ENDHEX$$n :"
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_combinaciones_muestras
integer x = 27
integer y = 12
integer width = 1472
integer height = 180
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda"
end type

type dw_1 from u_dw_application within w_combinaciones_muestras
integer x = 50
integer y = 280
integer width = 1417
integer height = 744
integer taborder = 30
string dataobject = "d_combinaciones_por_muestra"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;call super::doubleclicked;If Row=0 Then
	Return 
End If

of_filaSel(row)

cb_aceptar.post event clicked()
end event

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 11 de Diciembre de 2002 HORA 16:52:02:000
// 
// OverWrite!!
//////////////////////////////////////////////////////////////////////////

end event

event itemfocuschanged;call super::itemfocuschanged;//If Row=0 Then Return
//
//of_filaSel(row)
end event

event ue_insertrow;call super::ue_insertrow;long ll_f,ll_cons

ll_f=GetRow()

ll_cons = Long(This.Describe("Evaluate('max(co_combinacion for all)', 0)"))

If IsNull(ll_cons) Then
	ll_cons=0
End If

ll_cons++
SetItem(ll_f,"co_combinacion",ll_cons)
SetItem(ll_f,"co_talla",io_param.il_vector[1])
setColumn("de_combinacion")
ScrollToRow(ll_f)
SetRow(ll_f)
end event

event ue_deleterow;If RowCount()=0 Then
	MessageBox("Advertencia!","No existen datos para eliminar.",StopSign!)
	Return
End If
If il_fila=0 Then
	MessageBox("Advertencia!","Seleccione una fila.",StopSign!)
	Return
End If

long ll_res

ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea eliminar la fila ?",Question!,YesNo!,2)

If ll_res<>1 Then
	Return
End If

This.DeleteRow(il_fila)

If RowCount()>0 Then
	of_filasel(getRow())
Else
	il_fila=0
End If
end event

event rowfocuschanged;call super::rowfocuschanged;If currentrow=0 Then
	Return 
End If

of_filaSel(currentrow)
end event

event ue_dwnprocessenter;call super::ue_dwnprocessenter;if this.AcceptText() < 0 then
  Return 1
end if

if this.GetColumn() = 6 then
 if this.GetRow() = this.RowCount() then
	postEvent("ue_insertRow")
   Return 1
 end if
end if

Send(Handle(this),256,9,Long(0,0))
return 1

end event

type gb_1 from groupbox within w_combinaciones_muestras
integer x = 27
integer y = 200
integer width = 1472
integer height = 956
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type cb_eliminar from commandbutton within w_combinaciones_muestras
integer x = 768
integer y = 1036
integer width = 343
integer height = 92
integer taborder = 60
boolean bringtotop = true
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

type cb_adicionar from commandbutton within w_combinaciones_muestras
integer x = 1120
integer y = 1036
integer width = 343
integer height = 92
integer taborder = 50
boolean bringtotop = true
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

