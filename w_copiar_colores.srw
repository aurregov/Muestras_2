HA$PBExportHeader$w_copiar_colores.srw
$PBExportComments$para la busqueda de los colores y los muetrarios
forward
global type w_copiar_colores from w_response
end type
type dw_filtromuestrario from datawindow within w_copiar_colores
end type
type dw_filtrocolor from datawindow within w_copiar_colores
end type
type ids_datos from datawindow within w_copiar_colores
end type
type cbx_1 from checkbox within w_copiar_colores
end type
type cb_2 from commandbutton within w_copiar_colores
end type
type cb_1 from commandbutton within w_copiar_colores
end type
type st_1 from statictext within w_copiar_colores
end type
type sle_1 from singlelineedit within w_copiar_colores
end type
type dw_color from datawindow within w_copiar_colores
end type
end forward

global type w_copiar_colores from w_response
integer x = 0
integer y = 0
integer width = 1193
integer height = 1600
string title = "Selecci$$HEX1$$f300$$ENDHEX$$n de colores a copiar"
dw_filtromuestrario dw_filtromuestrario
dw_filtrocolor dw_filtrocolor
ids_datos ids_datos
cbx_1 cbx_1
cb_2 cb_2
cb_1 cb_1
st_1 st_1
sle_1 sle_1
dw_color dw_color
end type
global w_copiar_colores w_copiar_colores

type variables
String is_muestra
Long il_recurso
str_param	istr_param, istr_colores, istr_null
//dataStore	ids_datos


Long il_muestra,  il_muestrariodest, il_fabrica, il_linea, il_talla, il_dise$$HEX1$$f100$$ENDHEX$$o, il_muestrarioori 

end variables

forward prototypes
public function integer of_llenar_colores ()
end prototypes

public function integer of_llenar_colores ();//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_llenar_colores (funtion)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Enero 24 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	llenar los colores seleccionados 
//=========================================================================
Long ll_filas, ll_str, ll_fila
String ls_seleccion, ls_colores, ls_muestraios
ll_filas = ids_datos.Rowcount( )
ll_str = 1

istr_colores = istr_null

FOR ll_fila = 1 To ll_filas 
	ls_seleccion = TRIM(String(ids_datos.object.seleccion[ll_fila],''))
	IF ls_seleccion = '1' THEN
		//color
		istr_colores.a_string1[ll_str] = String(ids_datos.Object.co_color[ll_fila])
		//muestrario
		istr_colores.a_string2[ll_str] = String(ids_datos.Object.muestrario[ll_fila])
		ls_muestraios += istr_colores.a_string1[ll_str]+' - ' +istr_colores.a_string2[ll_str]+ ', '
		ll_str += 1
		
	END IF	
NEXT


//MessageBox('','Colores - Muestrarios '+ls_muestraios)
return 1 
end function

on w_copiar_colores.create
int iCurrent
call super::create
this.dw_filtromuestrario=create dw_filtromuestrario
this.dw_filtrocolor=create dw_filtrocolor
this.ids_datos=create ids_datos
this.cbx_1=create cbx_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.sle_1=create sle_1
this.dw_color=create dw_color
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_filtromuestrario
this.Control[iCurrent+2]=this.dw_filtrocolor
this.Control[iCurrent+3]=this.ids_datos
this.Control[iCurrent+4]=this.cbx_1
this.Control[iCurrent+5]=this.cb_2
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.sle_1
this.Control[iCurrent+9]=this.dw_color
end on

on w_copiar_colores.destroy
call super::destroy
destroy(this.dw_filtromuestrario)
destroy(this.dw_filtrocolor)
destroy(this.ids_datos)
destroy(this.cbx_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.dw_color)
end on

event open;call super::open;//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	Open (Event)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Enero 24 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	Recibir la informacion de la ventana de materia prima 
//					para ser procesada en los filtros.
//=========================================================================

istr_param = Message.powerobjectparm
is_muestra = istr_param.a_string1[1] 

il_muestra = Long(istr_param.a_string1[1]) //muestra
il_recurso = Long(istr_param.a_string1[3])//recurso
il_muestrariodest = Long(istr_param.a_string1[2]) //muestrario
il_fabrica = Long(istr_param.a_string1[4])//fabrica
il_linea = Long(istr_param.a_string1[5])//linea
il_talla = Long(istr_param.a_string1[6])//talla
il_dise$$HEX1$$f100$$ENDHEX$$o = Long(istr_param.a_string1[7])//dise$$HEX1$$f100$$ENDHEX$$o
il_muestrarioori = Long(istr_param.a_string1[8])//muestrario actual

sle_1.text = String(istr_param.a_string1[2])
dw_color.SetTransObject(n_cst_application.itr_appl)
IF dw_color.Retrieve(Long(is_muestra), il_recurso) < 0 THEN
	MessageBox('Error','Ha ocurrido un error, favor llamar a mesa de ayuda - opci$$HEX1$$f300$$ENDHEX$$n 1')
END IF
dw_filtromuestrario.insertrow( 0)
dw_filtrocolor.insertrow( 0)

ids_datos.Dataobject = dw_color.Dataobject
dw_color.Rowscopy( 1, dw_color.RowCount(), Primary!, ids_datos, 1, Primary!)

end event

type dw_filtromuestrario from datawindow within w_copiar_colores
event ue_tecla pbm_dwnkey
integer x = 416
integer y = 92
integer width = 384
integer height = 84
integer taborder = 10
string title = "none"
string dataobject = "de_filtro_numerico"
boolean livescroll = true
end type

event ue_tecla;//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	Ue_tecla (Event)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Enero 24 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	realizar el filtro cuando se esta copiando en el encabezado.
//=========================================================================
Long  ll_fila, ll_filas, ll_longitud, ll_insert
String ls_left, ls_numero, ls_numeroant

ls_numeroant = Trim(String(This.Object.dato[1],'')) 

THIS.accepttext( )
ll_filas = ids_datos.rowcount( )
CHOOSE CASE key 
	CASE Key0!, KeyNumpad0!
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],'')) 
	CASE Key1!, KeyNumpad1!
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE Key2!, KeyNumpad2!
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE Key3!, KeyNumpad3!
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE Key4!, KeyNumpad4!
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE Key5!, KeyNumpad5!
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE Key6!, KeyNumpad6!
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE Key7!, KeyNumpad7!
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE Key8!, KeyNumpad8!
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE Key9!, KeyNumpad9!
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE keyEnter!, KeyBack!, KeyDelete!
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))		
	CASE ELSE
		THIS.accepttext( )
		ls_numero = ls_numeroant
		this.reset()
		this.Insertrow( 0)
		This.Object.dato[1] = ls_numero
		THIS.accepttext( )
		RETURN 1
END CHOOSE
	
ll_longitud = Len(String(ls_numero))

dw_color.reset( )
cbx_1.checked = TRUE
FOR ll_fila = 1 TO ll_filas 
	ls_left = Left ( String(ids_datos.object.muestrario[ll_fila]), ll_longitud)
	
	IF ls_left = String(ls_numero) THEN
		ll_insert = dw_color.Insertrow(0)
		dw_color.object.co_color[ll_insert] = ids_datos.object.co_color[ll_fila]
		dw_color.object.muestrario[ll_insert] = ids_datos.object.muestrario[ll_fila]
		dw_color.object.seleccion[ll_insert] = ids_datos.object.seleccion[ll_fila]
		
		IF dw_color.object.seleccion[ll_insert] <> '1' THEN
			cbx_1.checked = FALSE
		END IF
	END IF
NEXT
end event

event editchanged;//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	Editchanged (Event)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Enero 24 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	realizar el filtro cuando se esta copiando en el encabezado.
//=========================================================================
Long  ll_fila, ll_filas, ll_longitud, ll_insert 
String ls_left, ls_numero, ls_numeroant


ls_numeroant = Trim(String(This.Object.dato[1],'')) 

THIS.accepttext( )
ll_filas = ids_datos.rowcount( )
CHOOSE CASE Long(Mid(data,len(data) - 1,1))
	CASE 0
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],'')) 
	CASE 1
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE 2
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE 3
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE 4
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))	
	CASE 5
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE 6
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE 7
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE 8
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE 9
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE ELSE
		THIS.accepttext( )
		ls_numero = ls_numeroant
		this.reset()
		this.Insertrow( 0)
		This.Object.dato[1] = ls_numero
		THIS.accepttext( )
END CHOOSE
	
ll_longitud = Len(String(ls_numero))

dw_color.reset( )
cbx_1.checked = TRUE
FOR ll_fila = 1 TO ll_filas 
	ls_left = Left ( String(ids_datos.object.muestrario[ll_fila]), ll_longitud)
	
	IF ls_left = String(ls_numero) THEN
		ll_insert = dw_color.Insertrow(0)
		dw_color.object.co_color[ll_insert] = ids_datos.object.co_color[ll_fila]
		dw_color.object.muestrario[ll_insert] = ids_datos.object.muestrario[ll_fila]
		dw_color.object.seleccion[ll_insert] = ids_datos.object.seleccion[ll_fila]
		
		IF dw_color.object.seleccion[ll_insert] <> '1' THEN
			cbx_1.checked = FALSE
		END IF
	END IF
NEXT


	


end event

type dw_filtrocolor from datawindow within w_copiar_colores
event ue_tecla pbm_dwnkey
integer x = 41
integer y = 92
integer width = 384
integer height = 84
integer taborder = 10
string title = "none"
string dataobject = "de_filtro_numerico"
boolean livescroll = true
end type

event ue_tecla;//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	Ue_tecla (Event)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Enero 24 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	realizar el filtro cuando se esta copiando en el encabezado.
//=========================================================================
Long  ll_fila, ll_filas, ll_longitud, ll_insert
String ls_left, ls_numero, ls_numeroant 

ls_numeroant = Trim(String(This.Object.dato[1],'')) 

THIS.accepttext( )
ll_filas = ids_datos.rowcount( )
CHOOSE CASE key 
	CASE Key0!, KeyNumpad0!
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],'')) 
	CASE Key1!, KeyNumpad1!
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE Key2!, KeyNumpad2!
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE Key3!, KeyNumpad3!
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE Key4!, KeyNumpad4!
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE Key5!, KeyNumpad5!
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE Key6!, KeyNumpad6!
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE Key7!, KeyNumpad7!
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE Key8!, KeyNumpad8!
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE Key9!, KeyNumpad9!
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE keyEnter!, KeyBack!, KeyDelete!
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))		
	CASE ELSE
		THIS.accepttext( )
		ls_numero = ls_numeroant
		this.reset()
		this.Insertrow( 0)
		This.Object.dato[1] = ls_numero
		THIS.accepttext( )
		RETURN 1
END CHOOSE
	
ll_longitud = Len(String(ls_numero))

dw_color.reset( )
cbx_1.checked = TRUE
FOR ll_fila = 1 TO ll_filas 
	ls_left = Left ( String(ids_datos.object.co_color[ll_fila]), ll_longitud)
	
	IF ls_left = String(ls_numero) THEN
		ll_insert = dw_color.Insertrow(0)
		dw_color.object.co_color[ll_insert] = ids_datos.object.co_color[ll_fila]
		dw_color.object.muestrario[ll_insert] = ids_datos.object.muestrario[ll_fila]
		dw_color.object.seleccion[ll_insert] = ids_datos.object.seleccion[ll_fila]
		
		IF dw_color.object.seleccion[ll_insert] <> '1' THEN
			cbx_1.checked = FALSE
		END IF
	END IF
NEXT
end event

event editchanged;//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	Editchanged (Event)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Enero 24 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	realizar el filtro cuando se esta copiando en el encabezado.
//=========================================================================

Long  ll_fila, ll_filas, ll_longitud, ll_insert
String ls_left, ls_numero, ls_numeroant

ls_numeroant = Trim(String(This.Object.dato[1],'')) 

THIS.accepttext( )
ll_filas = ids_datos.rowcount( )
CHOOSE CASE Long(Mid(data,len(data) - 1,1))
	CASE 0
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],'')) 
	CASE 1
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE 2
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE 3
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE 4
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))	
	CASE 5
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE 6
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE 7
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE 8
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE 9
		THIS.accepttext( )
		ls_numero = Trim(String(This.Object.dato[1],''))
	CASE ELSE
		THIS.accepttext( )
		ls_numero = ls_numeroant
		this.reset()
		this.Insertrow( 0)
		This.Object.dato[1] = ls_numero
		THIS.accepttext( )
END CHOOSE
	
ll_longitud = Len(String(ls_numero))

dw_color.reset( )
cbx_1.checked = TRUE
FOR ll_fila = 1 TO ll_filas 
	ls_left = Left ( String(ids_datos.object.co_color[ll_fila]), ll_longitud)
	
	IF ls_left = String(ls_numero) THEN
		ll_insert = dw_color.Insertrow(0)
		dw_color.object.co_color[ll_insert] = ids_datos.object.co_color[ll_fila]
		dw_color.object.muestrario[ll_insert] = ids_datos.object.muestrario[ll_fila]
		dw_color.object.seleccion[ll_insert] = ids_datos.object.seleccion[ll_fila]
		
		IF dw_color.object.seleccion[ll_insert] <> '1' THEN
			cbx_1.checked = FALSE
		END IF
	END IF
NEXT
end event

type ids_datos from datawindow within w_copiar_colores
integer x = 1385
integer y = 208
integer width = 1070
integer height = 916
integer taborder = 10
string title = "none"
string dataobject = "d_colormuestrario"
boolean vscrollbar = true
boolean livescroll = true
end type

type cbx_1 from checkbox within w_copiar_colores
integer x = 914
integer y = 124
integer width = 338
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Todos"
end type

event clicked;//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	Clicked (Event)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Enero 24 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	llenar los colores seleccionados todos/ninguno
//=========================================================================
Long ll_filas, ll_fila, ll_co_color, ll_find
String ls_seleccion


ll_filas = dw_color.Rowcount( )
IF ll_filas > 0 THEN
	FOR ll_fila = 1 TO ll_filas
		
		ll_co_color = dw_color.Object.co_color[ll_fila]
		ls_seleccion = TRIM(String(dw_color.Object.seleccion[ll_fila],''))
		
		ll_find = ids_datos.find( " co_color = "+String(ll_co_color), 1, ids_datos.RowCount())
		IF THIS.Checked THEN
			dw_color.Object.seleccion[ll_fila] = '1'
			ids_datos.Object.seleccion[ll_find] = '1'
		ELSE
			dw_color.Object.seleccion[ll_fila] = '0'
			ids_datos.Object.seleccion[ll_find] = '0'
		END IF		
	NEXT
END IF 
end event

type cb_2 from commandbutton within w_copiar_colores
integer x = 745
integer y = 1356
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancelar"
end type

event clicked;//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	Close (Event)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Enero 24 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	Cerrar ventana de seleccion de colores.
//=========================================================================
close(parent)
end event

type cb_1 from commandbutton within w_copiar_colores
integer x = 160
integer y = 1360
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	Clicked (Event)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Enero 24 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	llenar los colores seleccionados 
//=========================================================================
IF of_llenar_colores() = 1 THEN 
	
	istr_colores.a_long1[1] = Long(is_muestra)
	istr_colores.a_long1[2] = Long(il_recurso)		
	istr_colores.a_long1[3] = il_muestrariodest
	istr_colores.a_long1[4] = il_fabrica
	istr_colores.a_long1[5] = il_linea
	istr_colores.a_long1[6] = il_talla
	istr_colores.a_long1[7] = il_dise$$HEX1$$f100$$ENDHEX$$o
	istr_colores.a_long1[8] = il_muestrarioori
	istr_colores.a_String3[1] = 'Materia_Prima'

	OpenWithParm(w_copiar_recursos,istr_colores)
	
	CLOSE(Parent)
END IF
	




end event

type st_1 from statictext within w_copiar_colores
integer x = 73
integer y = 1156
integer width = 805
integer height = 232
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Los colores seleccionados se copiar$$HEX1$$e100$$ENDHEX$$n en el muestrario"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_copiar_colores
integer x = 901
integer y = 1176
integer width = 215
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean displayonly = true
end type

type dw_color from datawindow within w_copiar_colores
integer x = 46
integer y = 212
integer width = 1070
integer height = 916
integer taborder = 10
string title = "none"
string dataobject = "d_colormuestrario"
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	Clicked (Event)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Enero 24 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	seleccionar los registro que se tengan filtrados 
//=========================================================================
Long ll_co_color, ll_find, ll_fila, ll_filas
String ls_seleccion

str_param		lstr_param

ll_filas = ids_datos.Rowcount( )
THIS.accepttext( )

CHOOSE CASE dwo.name
	CASE 'seleccion'
		ll_co_color = dw_color.Object.co_color[Row]
		ls_seleccion = TRIM(String(dw_color.Object.seleccion[Row],''))
		
		ll_find = ids_datos.find( " co_color = "+String(ll_co_color), 1, ids_datos.RowCount())
		IF ls_seleccion = '1' THEN
			ids_datos.object.seleccion[ll_find] = '0'	
		ELSE
			ids_datos.object.seleccion[ll_find] = '1'
		END IF
END CHOOSE
end event

event editchanged;Long ll_co_color, ll_find, ll_fila, ll_filas
String ls_seleccion

str_param		lstr_param

ll_filas = ids_datos.Rowcount( )
THIS.accepttext( )

CHOOSE CASE dwo.name
	CASE 'seleccion'
		ll_co_color = dw_color.Object.co_recurso[Row]
		ls_seleccion = TRIM(String(dw_color.Object.seleccion[Row],''))
		
		ll_find = ids_datos.find( " co_color = "+String(ll_co_color), 1, ids_datos.RowCount())
		IF ls_seleccion = '1' THEN
			ids_datos.object.seleccion[ll_find] = '0'	
		ELSE
			ids_datos.object.seleccion[ll_find] = '1'
		END IF
END CHOOSE
end event

