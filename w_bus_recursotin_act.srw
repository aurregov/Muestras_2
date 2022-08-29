HA$PBExportHeader$w_bus_recursotin_act.srw
$PBExportComments$Ventana de b$$HEX1$$fa00$$ENDHEX$$squeda para las maquinas de tintorer$$HEX1$$ed00$$ENDHEX$$a
forward
global type w_bus_recursotin_act from w_base_busqueda
end type
type rb_dis from u_rb_base within w_bus_recursotin_act
end type
type rb_ndis from u_rb_base within w_bus_recursotin_act
end type
end forward

global type w_bus_recursotin_act from w_base_busqueda
string tag = "B$$HEX1$$fa00$$ENDHEX$$squeda de Maquinas de Tintorer$$HEX1$$ed00$$ENDHEX$$a"
integer width = 2661
integer height = 1404
string title = "B$$HEX1$$fa00$$ENDHEX$$squeda de Maquinas de Tintorer$$HEX1$$ed00$$ENDHEX$$a"
rb_dis rb_dis
rb_ndis rb_ndis
end type
global w_bus_recursotin_act w_bus_recursotin_act

type variables

end variables

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:16:48
---------------------------------------------------
---------------------------------------------------*/
io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_fabrica")
io_retorno.il_vector[2]=dw_1.GetItemNumber(il_fila,"cs_maquina")
io_retorno.is_vector[1]=dw_1.GetItemString(il_fila,"de_maquina")
io_retorno.is_vector[2]=dw_1.GetItemString(il_fila,"disponible")

Return 1
end function

on w_bus_recursotin_act.create
int iCurrent
call super::create
this.rb_dis=create rb_dis
this.rb_ndis=create rb_ndis
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_dis
this.Control[iCurrent+2]=this.rb_ndis
end on

on w_bus_recursotin_act.destroy
call super::destroy
destroy(this.rb_dis)
destroy(this.rb_ndis)
end on

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:17:12
---------------------------------------------------
---------------------------------------------------*/
Long ll_res
//--------------------------------------------------
dw_1.of_conexion(n_cst_application.itr_appl,True)
dw_1.SetRedraw(False)
ll_res = dw_1.Retrieve()
Choose Case ll_res
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos para la selecci$$HEX1$$f300$$ENDHEX$$n de m$$HEX1$$e100$$ENDHEX$$quinas de tintorer$$HEX1$$ed00$$ENDHEX$$a.",StopSign!)		
		Return -1
	Case 0
		MessageBox("Advertencia!","No hay datos para la selecci$$HEX1$$f300$$ENDHEX$$n de m$$HEX1$$e100$$ENDHEX$$quinas de tintorer$$HEX1$$ed00$$ENDHEX$$a.",StopSign!)	
		Return -1
End Choose
//-------------------------------------------------------------------------------------------------
dw_1.SetFilter("Match(disponible,'S')")
dw_1.Filter()
dw_1.RowsDiscard(1,dw_1.FilteredCount(),Filter!)
dw_1.SetFilter("")
dw_1.Filter()
dw_1.SetRedraw(True)

//IF IsValid(io_param) THEN
//	IF io_param.il_vector[1] > 0 THEN
//	   dw_1.SetFilter("co_tipoprod = "+String(io_param.il_vector[1]))
//		dw_1.Filter()
//	END IF
//END IF

If dw_1.RowCount()<=0 Then
	MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','No se recuperaron m$$HEX1$$e100$$ENDHEX$$quinas en estado disponible',Information!)
	il_fila=0
End If


end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_recursotin_act
integer x = 622
integer y = 104
integer width = 1609
integer height = 80
integer limit = 80
end type

event sle_1::modified;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:17:23	
---------------------------------------------------
---------------------------------------------------*/
If of_validarcadena(Text)<>1 Then Return -1
of_filtro("Match(Upper(de_maquina),Upper('"+text+"'))")
//dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_recursotin_act
integer x = 178
integer y = 112
integer width = 443
string text = "Digite descripci$$HEX1$$f300$$ENDHEX$$n :"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_recursotin_act
integer x = 951
integer y = 1184
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_recursotin_act
integer x = 1317
integer y = 1184
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_recursotin_act
integer x = 69
integer y = 376
integer width = 2505
integer height = 696
string dataobject = "d_lista_recursotin"
boolean hscrollbar = true
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_recursotin_act
string tag = "Lista de M$$HEX1$$e100$$ENDHEX$$quinas de Tintorer$$HEX1$$ed00$$ENDHEX$$a"
integer y = 296
integer width = 2587
integer height = 860
string text = "Lista de M$$HEX1$$e100$$ENDHEX$$quinas de Tintorer$$HEX1$$ed00$$ENDHEX$$a"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_recursotin_act
integer width = 2587
integer height = 244
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda"
end type

type rb_dis from u_rb_base within w_bus_recursotin_act
boolean visible = false
integer x = 2267
integer y = 160
integer width = 329
integer height = 64
boolean bringtotop = true
boolean enabled = false
string text = "Disponibles"
boolean checked = true
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:11:27
---------------------------------------------------

---------------------------------------------------*/
//This.Checked = TRUE
//This.BorderStyle = StyleLowered!
//rb_ndis.Checked = FALSE
//rb_ndis.BorderStyle = StyleRaised!
//of_filtro("Match(disponible,'S')")
//dw_1.SetFocus()

end event

type rb_ndis from u_rb_base within w_bus_recursotin_act
boolean visible = false
integer x = 73
integer y = 1184
integer width = 73
integer height = 64
boolean bringtotop = true
boolean enabled = false
string text = "No Disponibles"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:11:27
---------------------------------------------------

---------------------------------------------------*/
This.Checked = TRUE
This.BorderStyle = StyleLowered!
rb_dis.Checked = FALSE
rb_dis.BorderStyle = StyleRaised!
of_filtro("Match(disponible,'N')")
dw_1.SetFocus()

end event

