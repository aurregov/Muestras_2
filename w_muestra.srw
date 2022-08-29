HA$PBExportHeader$w_muestra.srw
forward
global type w_muestra from window
end type
type sle_1 from singlelineedit within w_muestra
end type
type tab_1 from tab within w_muestra
end type
type tabpage_1 from userobject within tab_1
end type
type tabpage_1 from userobject within tab_1
end type
type tab_1 from tab within w_muestra
tabpage_1 tabpage_1
end type
end forward

global type w_muestra from window
integer width = 613
integer height = 396
boolean titlebar = true
string title = "Muestra"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_1 sle_1
tab_1 tab_1
end type
global w_muestra w_muestra

on w_muestra.create
this.sle_1=create sle_1
this.tab_1=create tab_1
this.Control[]={this.sle_1,&
this.tab_1}
end on

on w_muestra.destroy
destroy(this.sle_1)
destroy(this.tab_1)
end on

event open;//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	open (event)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	permite visualizar el numero de la muestra que se esta trabajando
//-------------------------------------------------------------------------
// ARGUMENTO:	(none)
// RETORNO	:	long [pbm_open]
//=========================================================================

sle_1.text = String(message.doubleparm)


end event

event key;

CHOOSE CASE Key
	CASE keyescape!
		Close(This)
END CHOOSE
		
end event

type sle_1 from singlelineedit within w_muestra
integer x = 50
integer y = 140
integer width = 475
integer height = 100
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type tab_1 from tab within w_muestra
integer x = 9
integer width = 581
integer height = 316
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_1)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 544
integer height = 196
long backcolor = 67108864
string text = "Muestra N$$HEX1$$fa00$$ENDHEX$$mero"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

