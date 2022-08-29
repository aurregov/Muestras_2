HA$PBExportHeader$w_sel_open_appl.srw
$PBExportComments$Ventana para seleccionar la apliraci$$HEX1$$f300$$ENDHEX$$n con la que se desea mostrar el Gantt
forward
global type w_sel_open_appl from w_response
end type
type rb_appl_2 from radiobutton within w_sel_open_appl
end type
type rb_appl_1 from radiobutton within w_sel_open_appl
end type
type cb_cancelar from u_cb_base within w_sel_open_appl
end type
type cb_aceptar from u_cb_base within w_sel_open_appl
end type
type gb_seleccion from groupbox within w_sel_open_appl
end type
end forward

global type w_sel_open_appl from w_response
integer width = 1070
integer height = 532
string title = "Seleccione aplicaci$$HEX1$$f300$$ENDHEX$$n"
string icon = "DosEdit5!"
rb_appl_2 rb_appl_2
rb_appl_1 rb_appl_1
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
gb_seleccion gb_seleccion
end type
global w_sel_open_appl w_sel_open_appl

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 27 de Septiembre de 2004.H:11:39
---------------------------------------------------

---------------------------------------------------*/
String is_where_busqueda
end variables

on w_sel_open_appl.create
int iCurrent
call super::create
this.rb_appl_2=create rb_appl_2
this.rb_appl_1=create rb_appl_1
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.gb_seleccion=create gb_seleccion
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_appl_2
this.Control[iCurrent+2]=this.rb_appl_1
this.Control[iCurrent+3]=this.cb_cancelar
this.Control[iCurrent+4]=this.cb_aceptar
this.Control[iCurrent+5]=this.gb_seleccion
end on

on w_sel_open_appl.destroy
call super::destroy
destroy(this.rb_appl_2)
destroy(this.rb_appl_1)
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

type rb_appl_2 from radiobutton within w_sel_open_appl
string tag = "B$$HEX1$$fa00$$ENDHEX$$squeda de Orden de Producci$$HEX1$$f300$$ENDHEX$$n"
integer x = 73
integer y = 208
integer width = 873
integer height = 64
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Internet Explorer"
end type

event clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 27 de Septiembre de 2004.H:11:27
---------------------------------------------------

---------------------------------------------------*/
This.Checked = TRUE
This.BorderStyle = StyleLowered!
rb_appl_1.Checked = FALSE
rb_appl_1.BorderStyle = StyleRaised!
end event

event getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 27 de Septiembre de 2004.H:11:27
---------------------------------------------------

---------------------------------------------------*/
This.Trigger event Clicked()

end event

type rb_appl_1 from radiobutton within w_sel_open_appl
string tag = "B$$HEX1$$fa00$$ENDHEX$$squeda de Muestras"
integer x = 73
integer y = 80
integer width = 622
integer height = 96
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "Gantt Proyect v.2.10.3"
boolean checked = true
end type

event clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 27 de Septiembre de 2004.H:11:27
---------------------------------------------------

---------------------------------------------------*/
This.Checked = TRUE
This.BorderStyle = StyleLowered!
rb_appl_2.Checked = FALSE
rb_appl_2.BorderStyle = StyleRaised!

end event

event getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 27 de Septiembre de 2004.H:11:27
---------------------------------------------------

---------------------------------------------------*/
This.Trigger event Clicked()

end event

type cb_cancelar from u_cb_base within w_sel_open_appl
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

type cb_aceptar from u_cb_base within w_sel_open_appl
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
n_cst_param_orden lou_param
Boolean lb_ret
//---------------------------------------------------*/
lb_ret = False
If rb_appl_1.Checked Then	
	lou_param.il_vector[1]=1
	lb_ret = true
ElseIf rb_appl_2.Checked Then	
		lou_param.il_vector[1]=2
		lb_ret = true	
End If
//---------------------------------------------------*/
If lb_ret then
	CloseWithReturn(Parent,lou_param)
Else 
	Close(Parent)
End If
//---------------------------------------------------*/
end event

type gb_seleccion from groupbox within w_sel_open_appl
integer x = 37
integer y = 16
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
string text = "Seleccione aplicaci$$HEX1$$f300$$ENDHEX$$n:"
end type

