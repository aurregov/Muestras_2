HA$PBExportHeader$w_res_seleccion_busq.srw
$PBExportComments$Ventana para seleccionar alguna b$$HEX1$$fa00$$ENDHEX$$squeda (muestra/orden_prod), en caso de que la ventana de orden de producci$$HEX1$$f300$$ENDHEX$$n no se haya invocado desde el registro de muestras
forward
global type w_res_seleccion_busq from w_response
end type
type rb_sel_orden from radiobutton within w_res_seleccion_busq
end type
type rb_sel_muestra from radiobutton within w_res_seleccion_busq
end type
type cb_cancelar from u_cb_base within w_res_seleccion_busq
end type
type cb_aceptar from u_cb_base within w_res_seleccion_busq
end type
type gb_seleccion from groupbox within w_res_seleccion_busq
end type
end forward

global type w_res_seleccion_busq from w_response
integer width = 1070
integer height = 544
string title = "Busqueda (Muestra/Orden)"
string icon = "DosEdit5!"
rb_sel_orden rb_sel_orden
rb_sel_muestra rb_sel_muestra
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
gb_seleccion gb_seleccion
end type
global w_res_seleccion_busq w_res_seleccion_busq

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 27 de Septiembre de 2004.H:11:39
---------------------------------------------------

---------------------------------------------------*/
String is_where_busqueda
end variables

on w_res_seleccion_busq.create
int iCurrent
call super::create
this.rb_sel_orden=create rb_sel_orden
this.rb_sel_muestra=create rb_sel_muestra
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.gb_seleccion=create gb_seleccion
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_sel_orden
this.Control[iCurrent+2]=this.rb_sel_muestra
this.Control[iCurrent+3]=this.cb_cancelar
this.Control[iCurrent+4]=this.cb_aceptar
this.Control[iCurrent+5]=this.gb_seleccion
end on

on w_res_seleccion_busq.destroy
call super::destroy
destroy(this.rb_sel_orden)
destroy(this.rb_sel_muestra)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.gb_seleccion)
end on

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 27 de Septiembre de 2004.H:11:37
---------------------------------------------------

---------------------------------------------------*/
is_where_busqueda = Message.StringParm
end event

type rb_sel_orden from radiobutton within w_res_seleccion_busq
string tag = "B$$HEX1$$fa00$$ENDHEX$$squeda de Orden de Producci$$HEX1$$f300$$ENDHEX$$n"
integer x = 73
integer y = 192
integer width = 873
integer height = 64
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda de &Orden de Producci$$HEX1$$f300$$ENDHEX$$n"
end type

event clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 27 de Septiembre de 2004.H:11:27
---------------------------------------------------

---------------------------------------------------*/
This.Checked = TRUE
This.BorderStyle = StyleLowered!
rb_sel_muestra.Checked = FALSE
rb_sel_muestra.BorderStyle = StyleRaised!
end event

event getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 27 de Septiembre de 2004.H:11:27
---------------------------------------------------

---------------------------------------------------*/
This.Trigger event Clicked()

end event

type rb_sel_muestra from radiobutton within w_res_seleccion_busq
string tag = "B$$HEX1$$fa00$$ENDHEX$$squeda de Muestras"
integer x = 73
integer y = 64
integer width = 933
integer height = 96
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Nueva orden, basada en una Muestra"
boolean checked = true
end type

event clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 27 de Septiembre de 2004.H:11:27
---------------------------------------------------

---------------------------------------------------*/
This.Checked = TRUE
This.BorderStyle = StyleLowered!
rb_sel_orden.Checked = FALSE
rb_sel_orden.BorderStyle = StyleRaised!

end event

event getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 27 de Septiembre de 2004.H:11:27
---------------------------------------------------

---------------------------------------------------*/
This.Trigger event Clicked()

end event

type cb_cancelar from u_cb_base within w_res_seleccion_busq
integer x = 549
integer y = 320
integer taborder = 40
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 27 de Septiembre de 2004.H:11:50
---------------------------------------------------

---------------------------------------------------*/
Close(Parent)
end event

type cb_aceptar from u_cb_base within w_res_seleccion_busq
integer x = 219
integer y = 320
integer taborder = 30
string text = "&Aceptar"
boolean default = true
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 27 de Septiembre de 2004.H:12:24
---------------------------------------------------
Acepta que ventana abrir
---------------------------------------------------*/
n_cst_param lou_param
boolean lb_ret

lb_ret = False
If rb_sel_muestra.Checked Then
	OpenWithParm(w_opc_muestra,is_where_busqueda)	
	If IsValid(Message.PowerObjectParm) Then
		lou_param = Message.PowerObjectParm
		lou_param.is_vector[2]='muestra'
		lb_ret = true
	End If
ElseIf rb_sel_orden.Checked Then
	OpenWithParm(w_opc_orden,is_where_busqueda)
	If IsValid(Message.PowerObjectParm) Then
		lou_param = Message.PowerObjectParm
		lou_param.is_vector[2]='orden'
		lb_ret = true
	End If	
End If

If lb_ret then
	CloseWithReturn(Parent,lou_param)
Else 
	Close(Parent)
End If

/*------------------------------------------
Validaci$$HEX1$$f300$$ENDHEX$$n del objeto Message
----------------------------------------*/
//Que ha pasado con el objeto PowerObjectParm ?
//If IsValid(Message.PowerObjectParm) Then
//	powerobject lpo_pobj
//	lpo_pobj = Message.PowerObjectParm
//	If lpo_pobj.ClassName() <> 'n_cst_param' Then
//		MessageBox('Error en Argumento','Tipo de Argumento Inv$$HEX1$$e100$$ENDHEX$$lido(Msj.Obj.)')
//		Close(Parent)
//	End If
//Else	
//	MessageBox('Error Argumento','Argumento Inv$$HEX1$$e100$$ENDHEX$$lido')
//	Close(Parent)
//End If
////----------------------------------------------
//lou_param = lpo_pobj
//CloseWithReturn(Parent,lou_param)
end event

type gb_seleccion from groupbox within w_res_seleccion_busq
integer x = 37
integer width = 987
integer height = 288
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione:"
end type

