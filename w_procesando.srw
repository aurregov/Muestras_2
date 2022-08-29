HA$PBExportHeader$w_procesando.srw
forward
global type w_procesando from window
end type
type st_1 from statictext within w_procesando
end type
type gb_1 from groupbox within w_procesando
end type
end forward

global type w_procesando from window
integer width = 1979
integer height = 420
boolean titlebar = true
windowtype windowtype = popup!
long backcolor = 67108864
st_1 st_1
gb_1 gb_1
end type
global w_procesando w_procesando

event open;this.x = 800
this.y = 1000
this.height = 420
this.width = 1979
end event

on w_procesando.create
this.st_1=create st_1
this.gb_1=create gb_1
this.Control[]={this.st_1,&
this.gb_1}
end on

on w_procesando.destroy
destroy(this.st_1)
destroy(this.gb_1)
end on

type st_1 from statictext within w_procesando
integer x = 718
integer y = 144
integer width = 494
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Espere por Favor..."
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_procesando
integer x = 37
integer y = 68
integer width = 1883
integer height = 188
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
borderstyle borderstyle = stylelowered!
end type

