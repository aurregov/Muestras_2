HA$PBExportHeader$u_cst_print.sru
$PBExportComments$Objeto Print
forward
global type u_cst_print from userobject
end type
type ddlb_imp_solo from u_ddlb_base within u_cst_print
end type
type p_no_inter from u_p_base within u_cst_print
end type
type em_copias from u_em_base within u_cst_print
end type
type st_imp_solo from u_st_base within u_cst_print
end type
type st_copias from u_st_base within u_cst_print
end type
type sle_paginas from u_sle_base within u_cst_print
end type
type st_explicacion from u_st_base within u_cst_print
end type
type rb_seleccion from u_rb_base within u_cst_print
end type
type cbx_intercalar from u_cbx_base within u_cst_print
end type
type rb_paginas from u_rb_base within u_cst_print
end type
type rb_currentpage from u_rb_base within u_cst_print
end type
type rb_todo from u_rb_base within u_cst_print
end type
type cbx_archivo from u_cbx_base within u_cst_print
end type
type st_comentarios from u_st_base within u_cst_print
end type
type st_donde from u_st_base within u_cst_print
end type
type st_tipo from u_st_base within u_cst_print
end type
type st_estado from u_st_base within u_cst_print
end type
type st_impresora from u_st_base within u_cst_print
end type
type st_t_comentarios from u_st_base within u_cst_print
end type
type st_t_donde from u_st_base within u_cst_print
end type
type st_t_tipo from u_st_base within u_cst_print
end type
type st_t_estado from u_st_base within u_cst_print
end type
type st_t_impresora from u_st_base within u_cst_print
end type
type cb_propiedades from u_cb_base within u_cst_print
end type
type cb_cancelar from u_cb_base within u_cst_print
end type
type cb_acpetar from u_cb_base within u_cst_print
end type
type gb_copias from u_gb_base within u_cst_print
end type
type gb_intervalo from u_gb_base within u_cst_print
end type
type gb_impresora from u_gb_base within u_cst_print
end type
type p_si_inter from u_p_base within u_cst_print
end type
end forward

global type u_cst_print from userobject
integer width = 2354
integer height = 1244
boolean border = true
long backcolor = 80269524
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
ddlb_imp_solo ddlb_imp_solo
p_no_inter p_no_inter
em_copias em_copias
st_imp_solo st_imp_solo
st_copias st_copias
sle_paginas sle_paginas
st_explicacion st_explicacion
rb_seleccion rb_seleccion
cbx_intercalar cbx_intercalar
rb_paginas rb_paginas
rb_currentpage rb_currentpage
rb_todo rb_todo
cbx_archivo cbx_archivo
st_comentarios st_comentarios
st_donde st_donde
st_tipo st_tipo
st_estado st_estado
st_impresora st_impresora
st_t_comentarios st_t_comentarios
st_t_donde st_t_donde
st_t_tipo st_t_tipo
st_t_estado st_t_estado
st_t_impresora st_t_impresora
cb_propiedades cb_propiedades
cb_cancelar cb_cancelar
cb_acpetar cb_acpetar
gb_copias gb_copias
gb_intervalo gb_intervalo
gb_impresora gb_impresora
p_si_inter p_si_inter
end type
global u_cst_print u_cst_print

type variables
Private:
            u_dw_base idw_toprint
end variables

forward prototypes
private subroutine of_print ()
public subroutine of_load (u_dw_base adw_datawindow)
private subroutine of_close (readonly integer ai_valor)
private subroutine of_device ()
end prototypes

private subroutine of_print ();Int    li_valor
String ls_fullfilename,ls_filename

If cbx_archivo.Checked Then
	If idw_toprint.Describe("DataWindow.Print.Filename") = "" Then
		li_valor= GetFileSaveName("Imprimir a un archivo",ls_fullfilename, ls_filename,"PRN","Archivos de impresi$$HEX1$$f300$$ENDHEX$$n, *.PRN, Todos los archivos, *.*")
		If li_valor = 1 Then
			idw_toprint.Modify("DataWindow.Print.Filename='"+ls_filename+"'")
		End If
	End If
	If idw_toprint.Describe("DataWindow.Print.Filename") <> "" Then
		idw_toprint.Print()
		idw_toprint.Modify("DataWindow.Print.Page.Range=''")		
		This.of_Close(100)
	End If
Else
	idw_toprint.Modify("DataWindow.Print.Filename=''")
	idw_toprint.Print()
	idw_toprint.Modify("DataWindow.Print.Page.Range=''")
	This.of_Close(100)
End If



end subroutine

public subroutine of_load (u_dw_base adw_datawindow);
String ls_range
Int    li_range_include  


idw_toprint            = adw_datawindow
rb_currentpage.Enabled = Upper(idw_toprint.Describe("DataWindow.Print.Preview")) = Upper("Yes")

//s=ProfileString("win.ini","Windows","device", "Impresora por defecto,,")
//st_impresora.text = Left(s,Pos(s,",")-1)+" en "+ right(s,Len(s)-Pos(s,",",Pos(s,",")+1))

st_impresora.text = idw_toprint.Describe('DataWindow.Printer')

If Integer(idw_toprint.Describe("DataWindow.Print.Copies"))=0 Then
	idw_toprint.ModIfy("DataWindow.Print.Copies=1")
End If
cbx_archivo.Checked    = idw_toprint.Describe("DataWindow.Print.FileName") <> ""
cbx_intercalar.Checked = (idw_toprint.Describe("DataWindow.Print.Collate") = "yes")
cbx_intercalar.Event Clicked()
ls_range = idw_toprint.Describe("DataWindow.Print.Page.Range") 

If ls_range = "" Then
	rb_paginas.Checked = False
	rb_todo.Checked    = True
Else
	rb_todo.Checked    = False
	rb_paginas.Checked = True
End If

sle_paginas.Text = idw_toprint.Describe("DataWindow.Print.Page.Range")
li_range_include = Integer(idw_toprint.Describe("DataWindow.Print.Page.RangeInclude"))

Choose Case li_range_include
	Case 0
		ddlb_imp_solo.Text = "El intervalo"
	Case 1
		ddlb_imp_solo.Text = "P$$HEX1$$e100$$ENDHEX$$ginas pares"
	Case 2
		ddlb_imp_solo.Text = "P$$HEX1$$e100$$ENDHEX$$ginas impares"
End Choose

em_copias.Text = idw_toprint.Describe("DataWindow.Print.Copies")

end subroutine

private subroutine of_close (readonly integer ai_valor);w_base        lw_parent
GraphicObject lgo_graphicobject

lgo_graphicobject = This
Do
	lgo_graphicobject = lgo_graphicobject.GetParent()
Loop Until lgo_graphicobject.TypeOf() = Window! 
lw_parent = lgo_graphicobject

CloseWithReturn(lw_parent,ai_valor)
end subroutine

private subroutine of_device ();String  ls_device

PrintSetUp()
ls_device         = ProfileString("win.ini","Windows","device", "Impresora por defecto,,")
//st_impresora.Text = Left(ls_device,Pos(ls_device,",")-1)+" en "+ Right(ls_device,Len(ls_device)-Pos(ls_device,",",Pos(ls_device,",")+1))
st_impresora.Text = idw_toprint.Describe("DataWindow.Printer")



end subroutine

on u_cst_print.create
this.ddlb_imp_solo=create ddlb_imp_solo
this.p_no_inter=create p_no_inter
this.em_copias=create em_copias
this.st_imp_solo=create st_imp_solo
this.st_copias=create st_copias
this.sle_paginas=create sle_paginas
this.st_explicacion=create st_explicacion
this.rb_seleccion=create rb_seleccion
this.cbx_intercalar=create cbx_intercalar
this.rb_paginas=create rb_paginas
this.rb_currentpage=create rb_currentpage
this.rb_todo=create rb_todo
this.cbx_archivo=create cbx_archivo
this.st_comentarios=create st_comentarios
this.st_donde=create st_donde
this.st_tipo=create st_tipo
this.st_estado=create st_estado
this.st_impresora=create st_impresora
this.st_t_comentarios=create st_t_comentarios
this.st_t_donde=create st_t_donde
this.st_t_tipo=create st_t_tipo
this.st_t_estado=create st_t_estado
this.st_t_impresora=create st_t_impresora
this.cb_propiedades=create cb_propiedades
this.cb_cancelar=create cb_cancelar
this.cb_acpetar=create cb_acpetar
this.gb_copias=create gb_copias
this.gb_intervalo=create gb_intervalo
this.gb_impresora=create gb_impresora
this.p_si_inter=create p_si_inter
this.Control[]={this.ddlb_imp_solo,&
this.p_no_inter,&
this.em_copias,&
this.st_imp_solo,&
this.st_copias,&
this.sle_paginas,&
this.st_explicacion,&
this.rb_seleccion,&
this.cbx_intercalar,&
this.rb_paginas,&
this.rb_currentpage,&
this.rb_todo,&
this.cbx_archivo,&
this.st_comentarios,&
this.st_donde,&
this.st_tipo,&
this.st_estado,&
this.st_impresora,&
this.st_t_comentarios,&
this.st_t_donde,&
this.st_t_tipo,&
this.st_t_estado,&
this.st_t_impresora,&
this.cb_propiedades,&
this.cb_cancelar,&
this.cb_acpetar,&
this.gb_copias,&
this.gb_intervalo,&
this.gb_impresora,&
this.p_si_inter}
end on

on u_cst_print.destroy
destroy(this.ddlb_imp_solo)
destroy(this.p_no_inter)
destroy(this.em_copias)
destroy(this.st_imp_solo)
destroy(this.st_copias)
destroy(this.sle_paginas)
destroy(this.st_explicacion)
destroy(this.rb_seleccion)
destroy(this.cbx_intercalar)
destroy(this.rb_paginas)
destroy(this.rb_currentpage)
destroy(this.rb_todo)
destroy(this.cbx_archivo)
destroy(this.st_comentarios)
destroy(this.st_donde)
destroy(this.st_tipo)
destroy(this.st_estado)
destroy(this.st_impresora)
destroy(this.st_t_comentarios)
destroy(this.st_t_donde)
destroy(this.st_t_tipo)
destroy(this.st_t_estado)
destroy(this.st_t_impresora)
destroy(this.cb_propiedades)
destroy(this.cb_cancelar)
destroy(this.cb_acpetar)
destroy(this.gb_copias)
destroy(this.gb_intervalo)
destroy(this.gb_impresora)
destroy(this.p_si_inter)
end on

type ddlb_imp_solo from u_ddlb_base within u_cst_print
integer x = 1710
integer y = 1008
integer height = 220
integer taborder = 30
string item[] = {"El intervalo","P$$HEX1$$e100$$ENDHEX$$ginas pares","P$$HEX1$$e100$$ENDHEX$$ginas impares"}
end type

event selectionchanged;Integer li_i

Choose Case ddlb_imp_solo.Text
	Case "El intervalo"
		li_i= 0
	Case "P$$HEX1$$e100$$ENDHEX$$ginas pares"
		li_i= 1
	Case "P$$HEX1$$e100$$ENDHEX$$ginas impares"
		li_i= 2
End Choose
idw_toprint.Modify("DataWindow.Print.Page.RangeInclude="+String(li_i))

end event

type p_no_inter from u_p_base within u_cst_print
integer x = 1184
integer y = 724
integer width = 489
integer height = 224
string picturename = "no_inter.bmp"
boolean border = false
borderstyle borderstyle = stylebox!
end type

type em_copias from u_em_base within u_cst_print
integer x = 1746
integer y = 612
string text = "1"
string mask = "##"
boolean spin = true
double increment = 1
string minmax = "1~~"
end type

event modified;
idw_toprint.Modify("DataWindow.Print.Copies="+em_copias.Text)
If Integer(em_copias.Text) > 1 Then
	cbx_intercalar.Enabled = True
End If
end event

type st_imp_solo from u_st_base within u_cst_print
integer x = 1399
integer y = 1032
integer width = 311
string text = "Imprimir s$$HEX1$$f300$$ENDHEX$$lo:"
end type

type st_copias from u_st_base within u_cst_print
integer x = 1221
integer y = 624
integer width = 434
string text = "N$$HEX1$$fa00$$ENDHEX$$mero de copias:"
end type

type sle_paginas from u_sle_base within u_cst_print
integer x = 471
integer y = 744
integer width = 622
integer taborder = 20
end type

event modified;
idw_toprint.Modify("DataWindow.Print.Page.Range='"+sle_paginas.Text+"'")
If Trim(sle_paginas.Text) <> "" Then
	rb_paginas.Checked = True
End If
end event

type st_explicacion from u_st_base within u_cst_print
integer x = 59
integer y = 856
integer width = 1051
integer height = 120
string text = "Escriba n$$HEX1$$fa00$$ENDHEX$$meros de p$$HEX1$$e100$$ENDHEX$$gina y/o intervalos separados por comas. Ejemplo: 1,3,5-12,14"
end type

type rb_seleccion from u_rb_base within u_cst_print
integer x = 471
integer y = 680
integer width = 283
boolean enabled = false
string text = "Selecci$$HEX1$$f300$$ENDHEX$$n"
end type

type cbx_intercalar from u_cbx_base within u_cst_print
integer x = 1746
integer y = 724
integer width = 329
string text = "Intercalar"
end type

event clicked;
If This.Checked Then
	idw_toprint.Modify("DataWindow.Print.Collate=yes")
	p_si_inter.BringToTop = True
Else
	idw_toprint.Modify("DataWindow.Print.Collate=no")
	p_no_inter.BringToTop = True
End If
end event

type rb_paginas from u_rb_base within u_cst_print
integer x = 59
integer y = 756
integer width = 384
string text = "P$$HEX1$$e100$$ENDHEX$$ginas"
end type

event clicked;
idw_toprint.Modify("DataWindow.Print.Page.Range='"+sle_paginas.text+"'")
sle_paginas.SetFocus()

end event

type rb_currentpage from u_rb_base within u_cst_print
integer x = 59
integer y = 680
integer width = 384
string text = "P$$HEX1$$e100$$ENDHEX$$gina actual"
end type

event clicked;Integer li_x1,li_x2

li_x1 = Integer(idw_toprint.Describe("DataWindow.FirstRowOnPage"))
li_x2 = Integer(idw_toprint.Describe("DataWindow.LastRowOnPage"))

li_x1 = li_x2/(li_x2 - li_x1 + 1)
idw_toprint.Modify("DataWindow.Print.Page.Range='"+Trim(string(li_x1))+"'")


end event

type rb_todo from u_rb_base within u_cst_print
integer x = 59
integer y = 604
integer width = 384
string text = "Todo"
end type

event clicked;
idw_toprint.Modify("DataWindow.Print.Page.Range=''")
end event

type cbx_archivo from u_cbx_base within u_cst_print
integer x = 1577
integer y = 336
integer width = 567
boolean enabled = false
string text = " I&mprimir a un archivo"
end type

type st_comentarios from u_st_base within u_cst_print
integer x = 357
integer y = 408
integer width = 1307
end type

type st_donde from u_st_base within u_cst_print
integer x = 357
integer y = 336
integer width = 1198
end type

type st_tipo from u_st_base within u_cst_print
integer x = 357
integer y = 264
integer width = 1307
end type

type st_estado from u_st_base within u_cst_print
integer x = 357
integer y = 192
integer width = 1307
end type

type st_impresora from u_st_base within u_cst_print
integer x = 357
integer y = 112
integer width = 1307
integer height = 68
long backcolor = 80269524
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type st_t_comentarios from u_st_base within u_cst_print
integer x = 59
integer y = 408
integer width = 297
string text = "Comentarios:"
end type

type st_t_donde from u_st_base within u_cst_print
integer x = 59
integer y = 336
integer width = 297
string text = "Donde:"
end type

type st_t_tipo from u_st_base within u_cst_print
integer x = 59
integer y = 264
integer width = 297
string text = "Tipo:"
end type

type st_t_estado from u_st_base within u_cst_print
integer x = 59
integer y = 192
integer width = 297
string text = "Estado:"
end type

type st_t_impresora from u_st_base within u_cst_print
integer x = 59
integer y = 120
integer width = 297
string text = "Nombre:"
end type

type cb_propiedades from u_cb_base within u_cst_print
integer x = 1787
integer y = 156
integer width = 361
integer taborder = 0
boolean bringtotop = true
string text = "Propiedades..."
end type

event clicked;
Parent.of_Device()
end event

type cb_cancelar from u_cb_base within u_cst_print
integer x = 1851
integer y = 1120
integer taborder = 50
boolean bringtotop = true
string text = "Cancelar"
end type

event clicked;
idw_toprint.Modify("DataWindow.Print.Page.Range=''")		
Parent.of_Close(-1)
end event

type cb_acpetar from u_cb_base within u_cst_print
integer x = 1499
integer y = 1120
integer taborder = 40
boolean bringtotop = true
string text = "Aceptar"
boolean default = true
end type

event clicked;
Parent.of_Print()
end event

type gb_copias from u_gb_base within u_cst_print
integer x = 1170
integer y = 532
integer width = 1129
integer height = 468
integer taborder = 0
integer weight = 400
string text = "Copias"
end type

type gb_intervalo from u_gb_base within u_cst_print
integer x = 41
integer y = 532
integer width = 1093
integer height = 468
integer taborder = 0
integer weight = 400
string text = "Intervalo de p$$HEX1$$e100$$ENDHEX$$ginas"
end type

type gb_impresora from u_gb_base within u_cst_print
integer x = 32
integer y = 52
integer width = 2267
integer height = 448
integer taborder = 0
integer weight = 400
long backcolor = 80269524
string text = "Impresora"
end type

type p_si_inter from u_p_base within u_cst_print
integer x = 1184
integer y = 724
integer width = 489
integer height = 224
string picturename = "si_inter.bmp"
boolean border = false
borderstyle borderstyle = stylebox!
end type

