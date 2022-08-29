HA$PBExportHeader$w_clave.srw
forward
global type w_clave from window
end type
type sle_clave from singlelineedit within w_clave
end type
type gb_1 from groupbox within w_clave
end type
end forward

global type w_clave from window
integer width = 745
integer height = 412
boolean titlebar = true
string title = "Clave de Autorizaci$$HEX1$$f300$$ENDHEX$$n"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
sle_clave sle_clave
gb_1 gb_1
end type
global w_clave w_clave

event open;n_cst_application.ii_sw_clave = 0

//this.x = 900
//this.y = 1000
//this.height = 420
//this.width = 777

sle_clave.SetFocus() 
end event

on w_clave.create
this.sle_clave=create sle_clave
this.gb_1=create gb_1
this.Control[]={this.sle_clave,&
this.gb_1}
end on

on w_clave.destroy
destroy(this.sle_clave)
destroy(this.gb_1)
end on

type sle_clave from singlelineedit within w_clave
integer x = 87
integer y = 128
integer width = 558
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

event modified;string ls_clave, ls_texto, ls_varnombre

ls_clave = sle_clave.Text
ls_varnombre = 'PWD_MODIFY'
SELECT  m_constantes.texto
  INTO  :ls_texto
  FROM  m_constantes
  WHERE m_constantes.var_nombre = :ls_varnombre and
        m_constantes.tipo       = 2
		  using n_cst_application.itr_appl;
		  
if IsNull(ls_texto) then
	ls_texto = " "
end if

IF trim(ls_clave) <> trim(ls_texto) then
	MessageBox("Error","Ud. no se encuentra autorizado para esta opci$$HEX1$$f300$$ENDHEX$$n")
	n_cst_application.ii_sw_clave = 0
else
	n_cst_application.ii_sw_clave = 1
end if

close(parent)
end event

type gb_1 from groupbox within w_clave
integer x = 37
integer y = 68
integer width = 663
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
string text = "Clave de Autorizaci$$HEX1$$f300$$ENDHEX$$n"
end type

