HA$PBExportHeader$w_sel_graf_deschab.srw
$PBExportComments$Ventana para seleccionar el tipo de operador que modificara el registro de chablon
forward
global type w_sel_graf_deschab from w_response
end type
type rb_desarrollador from radiobutton within w_sel_graf_deschab
end type
type rb_graficador from radiobutton within w_sel_graf_deschab
end type
type cb_cancelar from u_cb_base within w_sel_graf_deschab
end type
type cb_aceptar from u_cb_base within w_sel_graf_deschab
end type
type gb_seleccion from groupbox within w_sel_graf_deschab
end type
end forward

global type w_sel_graf_deschab from w_response
integer width = 1070
integer height = 544
string title = "Selecci$$HEX1$$f300$$ENDHEX$$n de Operario"
string icon = "DosEdit5!"
rb_desarrollador rb_desarrollador
rb_graficador rb_graficador
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
gb_seleccion gb_seleccion
end type
global w_sel_graf_deschab w_sel_graf_deschab

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 27 de Septiembre de 2004.H:11:39
---------------------------------------------------

---------------------------------------------------*/

end variables

on w_sel_graf_deschab.create
int iCurrent
call super::create
this.rb_desarrollador=create rb_desarrollador
this.rb_graficador=create rb_graficador
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.gb_seleccion=create gb_seleccion
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_desarrollador
this.Control[iCurrent+2]=this.rb_graficador
this.Control[iCurrent+3]=this.cb_cancelar
this.Control[iCurrent+4]=this.cb_aceptar
this.Control[iCurrent+5]=this.gb_seleccion
end on

on w_sel_graf_deschab.destroy
call super::destroy
destroy(this.rb_desarrollador)
destroy(this.rb_graficador)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.gb_seleccion)
end on

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 27 de Septiembre de 2004.H:11:37
---------------------------------------------------

---------------------------------------------------*/

end event

type rb_desarrollador from radiobutton within w_sel_graf_deschab
string tag = "Desarrollador Chablones"
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
string text = "Desarrollador &Chablones"
end type

event clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 27 de Septiembre de 2004.H:11:27
---------------------------------------------------

---------------------------------------------------*/
This.Checked = TRUE
This.BorderStyle = StyleLowered!
rb_graficador.Checked = FALSE
rb_graficador.BorderStyle = StyleRaised!
end event

event getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 27 de Septiembre de 2004.H:11:27
---------------------------------------------------

---------------------------------------------------*/
This.Trigger event Clicked()

end event

type rb_graficador from radiobutton within w_sel_graf_deschab
string tag = "Graficador"
integer x = 73
integer y = 64
integer width = 649
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
string text = "Desarrollador &Graficador"
boolean checked = true
end type

event clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 27 de Septiembre de 2004.H:11:27
---------------------------------------------------

---------------------------------------------------*/
This.Checked = TRUE
This.BorderStyle = StyleLowered!
rb_desarrollador.Checked = FALSE
rb_desarrollador.BorderStyle = StyleRaised!

end event

event getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 27 de Septiembre de 2004.H:11:27
---------------------------------------------------

---------------------------------------------------*/
This.Trigger event Clicked()

end event

type cb_cancelar from u_cb_base within w_sel_graf_deschab
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

type cb_aceptar from u_cb_base within w_sel_graf_deschab
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
//--------------------------------------------------
lb_ret = False
If rb_graficador.Checked Then // Operario Graficador
	lou_param.il_vector[1]=1
ElseIf rb_desarrollador.Checked Then// Operario Desarrollador
	lou_param.il_vector[1]=2
End If

CloseWithReturn(Parent,lou_param)
end event

type gb_seleccion from groupbox within w_sel_graf_deschab
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

