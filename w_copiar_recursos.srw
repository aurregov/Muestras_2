HA$PBExportHeader$w_copiar_recursos.srw
forward
global type w_copiar_recursos from w_response
end type
type dw_recursos_agrupa from datawindow within w_copiar_recursos
end type
type st_4 from statictext within w_copiar_recursos
end type
type sle_3 from singlelineedit within w_copiar_recursos
end type
type sle_2 from singlelineedit within w_copiar_recursos
end type
type st_3 from statictext within w_copiar_recursos
end type
type st_2 from statictext within w_copiar_recursos
end type
type st_1 from statictext within w_copiar_recursos
end type
type sle_1 from singlelineedit within w_copiar_recursos
end type
type ids_datos from datawindow within w_copiar_recursos
end type
type cb_2 from commandbutton within w_copiar_recursos
end type
type cb_1 from commandbutton within w_copiar_recursos
end type
type dw_recurso from datawindow within w_copiar_recursos
end type
type cbx_1 from checkbox within w_copiar_recursos
end type
end forward

global type w_copiar_recursos from w_response
integer x = 0
integer y = 0
integer width = 1518
integer height = 1748
string title = "Selecci$$HEX1$$f300$$ENDHEX$$n de recursos a copiar"
dw_recursos_agrupa dw_recursos_agrupa
st_4 st_4
sle_3 sle_3
sle_2 sle_2
st_3 st_3
st_2 st_2
st_1 st_1
sle_1 sle_1
ids_datos ids_datos
cb_2 cb_2
cb_1 cb_1
dw_recurso dw_recurso
cbx_1 cbx_1
end type
global w_copiar_recursos w_copiar_recursos

type variables
String is_muestra
Long il_recurso
str_param	istr_param, istr_colores, istr_null, istr_Datos_Grabacion
n_cst_copiar_recurso 		inv_copia_rec
//2015-06-16 Solicitud: 51249 Ceiba/JJ
CONSTANT String MUESTRA_BASICA = 'Muestra_basica'
CONSTANT String MEDIDAS_MUESTRA = 'Medidas_Muestra'

Boolean ib_maneja_recurso_agrupa
end variables

forward prototypes
public function integer of_llenar_colores ()
public function long of_recurso_cierra (readonly long al_recurso)
public function integer of_recursos_existen (readonly long al_muestra, readonly str_param astr_color)
public function long of_crearimagen_informacionrecursoorigen ()
public function long of_cargarinformaciondestino (long al_recurso)
public function integer of_setear_grabar_inforecursodestino (long al_recurso)
public function integer of_destruirobjetos ()
public subroutine of_cargartextosiniciales ()
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
		istr_colores.a_string1[ll_str] = String(ids_datos.Object.co_recurso[ll_fila])
		//muestrario
		istr_colores.a_string2[ll_str] = String(ids_datos.Object.muestrario[ll_fila])
		ls_muestraios += istr_colores.a_string1[ll_str]+' - ' +istr_colores.a_string2[ll_str]+ ', '
		ll_str += 1
	END IF	
NEXT


MessageBox('','Colores - Muestrarios '+ls_muestraios)
return 1 
end function

public function long of_recurso_cierra (readonly long al_recurso);Long ll_cierra

SELECT inter.sw_cierra 
INTO :ll_cierra
FROM m_recursos_tj inter 
WHERE inter.co_recurso = :al_recurso
Using n_cst_application.itr_appl;

IF n_cst_application.itr_appl.sqlcode < 0 THEN
	MessageBox('','Ha ocurrido un error, favor llamar a mesa de ayuda - opci$$HEX1$$f300$$ENDHEX$$n 1')
	RETURN -1
END IF

RETURN ll_cierra

end function

public function integer of_recursos_existen (readonly long al_muestra, readonly str_param astr_color);Long ll_retorno, ll_retornoexiste, ll_colores, ll_fila, ll_recurso, ll_recursoant, ll_insert
dataStore	lds_rexisten, lds_datos

lds_rexisten = CREATE dataStore
lds_datos = CREATE dataStore

ll_colores = UpperBound(astr_color.a_long1)


lds_datos.DataObject = 'd_recursos_muestra_existe'
lds_datos.SetTransobject(n_cst_application.itr_appl)
ll_retorno = lds_datos.Retrieve( al_muestra, astr_color.a_long1)


lds_rexisten.DataObject = 'd_recursos_muestra'
lds_rexisten.SetTransobject(n_cst_application.itr_appl)
ll_retornoexiste = lds_rexisten.Retrieve( al_muestra, astr_color.a_long1)


FOR ll_fila = 1 To ll_retorno
	ll_recurso = lds_datos.Object.co_recurso[ll_fila]
	
	IF ll_recursoant <> ll_recurso THEN
		lds_datos.Setfilter( ' co_recurso = '+String(ll_recurso))
		lds_datos.filter( )
		
		IF lds_datos.Rowcount( ) <> ll_colores THEN
			ll_insert = dw_recurso.InsertRow( 0)
			lds_datos.setfilter( '')
			lds_datos.filter( )		
			dw_recurso.Object.muestrario[ll_insert] = lds_datos.Object.muestrario[ll_fila]
			dw_recurso.Object.co_recurso[ll_insert] = lds_datos.Object.co_recurso[ll_fila]
			dw_recurso.Object.cierra[ll_insert] = lds_datos.Object.cierra[ll_fila]
		END IF
		ll_recursoant = ll_recurso
	END IF
NEXT







return ll_retorno



end function

public function long of_crearimagen_informacionrecursoorigen ();//=========================================================================
// Funcion	:	of_CrearImagen_InformacionRecursoOrigen
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	Copiar la informacion modificada, borrada o insertada de la 
//					pesta$$HEX1$$f100$$ENDHEX$$a de reposadas en la opcion Muestra Basica del menu principal
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ	
DataStore	lds_datosMuesBasiOrigen

lds_datosMuesBasiOrigen 				= CREATE DataStore
lds_datosMuesBasiOrigen.dataobject 	= 'd_dt_med_mue_rep'
lds_datosMuesBasiOrigen.SetTransobject(n_cst_application.itr_appl)
istr_param.a_dw1[1].Rowscopy( 1, istr_param.a_dw1[1].rowcount(), Primary!, lds_datosMuesBasiOrigen, 1, Primary!)

//Se carga la informacion Base, de origen, para luego cambiarle el recurso y alamcenarlo
inv_copia_rec.of_set_dsmuestrabasica(lds_datosMuesBasiOrigen)

Return 1 
end function

public function long of_cargarinformaciondestino (long al_recurso);//=========================================================================
// Funcion	:	of_cargarInformacionDestino
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	setitem de recursos
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ

Long ll_retorno

//Se carga la informacion del ds destino, para luego cambiarle las medidas y alamcenarlo
ll_retorno =inv_copia_rec.of_cargar_ids_infodestino(al_recurso)
If ll_retorno<0 Then
	Return -1
End If

Return 1 
end function

public function integer of_setear_grabar_inforecursodestino (long al_recurso);//=========================================================================
// Funcion	:	of_Setear_Grabar_InfoRecursoDestino
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	setitem de recursos
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ
Long			ll_fila, ll_filas, ll_retorno, ll_disenoDestino
DataStore	lds_datosMuesBasiOrigen, lds_datosMuestraDestino

lds_datosMuesBasiOrigen	=	inv_copia_rec.of_get_dsmuestrabasica()

//seteo de variables para realizar el borrado del dato asociado al recurso 
inv_copia_rec.of_set_fabrica(istr_param.a_long1[4])
inv_copia_rec.of_set_linea(istr_param.a_long1[5])
inv_copia_rec.of_set_muestra(istr_param.a_long1[1])

ll_retorno = of_cargarinformaciondestino(al_recurso)
If ll_retorno<0 Then
	Return -1
End If

//se carga la informacion en el ds local
lds_datosMuestraDestino	=	inv_copia_rec.of_get_ids_infodestino()
 
ll_filas = lds_datosMuesBasiOrigen.rowcount()
IF ll_filas = 0 THEN RETURN -1 

inv_copia_rec.of_set_talla(lds_datosMuestraDestino.GetItemNumber(1,"co_talla"))
inv_copia_rec.of_set_diseno(lds_datosMuestraDestino.GetItemNumber(1,"co_diseno"))
inv_copia_rec.of_set_tipoprod(lds_datosMuestraDestino.GetItemNumber(1,"co_tipoprod"))


//las medidas de origen son las que se deben almacenar, pero sin afectar los datos originales del destino
//por temas de rendimiento se hara el update basado en los datos de origen, los recien ingresados, borrados o modificados por el user
FOR ll_fila = 1 TO ll_filas
	lds_datosMuesBasiOrigen.SetItem(ll_fila,"co_fabrica",inv_copia_rec.of_get_fabrica())
	lds_datosMuesBasiOrigen.SetItem(ll_fila,"co_linea",inv_copia_rec.of_get_linea())
	lds_datosMuesBasiOrigen.SetItem(ll_fila,"co_muestra",inv_copia_rec.of_get_muestra())
	lds_datosMuesBasiOrigen.SetItem(ll_fila,"co_talla",inv_copia_rec.of_get_talla())
	lds_datosMuesBasiOrigen.SetItem(ll_fila,"co_diseno",inv_copia_rec.of_get_diseno())
	lds_datosMuesBasiOrigen.SetItem(ll_fila,"co_tipoprod",inv_copia_rec.of_get_tipoprod())	
	lds_datosMuesBasiOrigen.SetItem(ll_fila,"co_recurso",al_recurso)	
	lds_datosMuesBasiOrigen.SetItem(ll_fila,"fe_actualizacion",today())			
	lds_datosMuesBasiOrigen.SetItem(ll_fila,"usuario",gs_usuario)		
	lds_datosMuesBasiOrigen.SetItem(ll_fila,"instancia",gs_instancia)		
NEXT 

//El recurso se debe enviar porque es el unico que varia en cada llamado
inv_copia_rec.of_grabarMuestraBasica(lds_datosMuesBasiOrigen, al_recurso)

Return 1 
end function

public function integer of_destruirobjetos ();//=========================================================================
// Funcion	:	of_destruirobjetos()
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	of_destruirobjetos()
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ

inv_copia_rec.of_destruirobjetos()

Return 1 
end function

public subroutine of_cargartextosiniciales ();//=========================================================================
// Funcion	:	of_cargartextosiniciales
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	Cargar los titulos y textos iniciales 
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ
IF MUESTRA_BASICA = istr_param.a_string3[1] OR MEDIDAS_MUESTRA = istr_param.a_string3[1] THEN 
	sle_1.visible=False
	sle_2.visible=False
	st_2.visible=False
	st_3.visible=False
	st_4.visible=True
	st_1.Width = 823
	st_1.Height = 180
	st_1.text='Existen otras partes con medidas reposadas diferentes en los siguientes recursos:'
	st_4.text='$$HEX1$$bf00$$ENDHEX$$Desea tambi$$HEX1$$e900$$ENDHEX$$n realizar el cambio en los recursos seleccionados?'
	of_setTitle('Modificar medidas reposadas')
END IF

end subroutine

on w_copiar_recursos.create
int iCurrent
call super::create
this.dw_recursos_agrupa=create dw_recursos_agrupa
this.st_4=create st_4
this.sle_3=create sle_3
this.sle_2=create sle_2
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.sle_1=create sle_1
this.ids_datos=create ids_datos
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_recurso=create dw_recurso
this.cbx_1=create cbx_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_recursos_agrupa
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.sle_3
this.Control[iCurrent+4]=this.sle_2
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.sle_1
this.Control[iCurrent+9]=this.ids_datos
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.cb_1
this.Control[iCurrent+12]=this.dw_recurso
this.Control[iCurrent+13]=this.cbx_1
end on

on w_copiar_recursos.destroy
call super::destroy
destroy(this.dw_recursos_agrupa)
destroy(this.st_4)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.ids_datos)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_recurso)
destroy(this.cbx_1)
end on

event open;call super::open;//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	Open (Event)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Enero 24 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	Recibir la informacion de la ventana de materia prima 
//					para ser procesada en los filtros.
//=========================================================================

Long ll_retorno

istr_param = Message.powerobjectparm

inv_copia_rec	= CREATE n_cst_copiar_recurso

is_muestra = String(istr_param.a_long1[1])
il_recurso = istr_param.a_long1[2]
sle_1.text = String(il_recurso)

istr_Datos_Grabacion.a_long1[1] = istr_param.a_long1[4] //fabrica
istr_Datos_Grabacion.a_long1[2] = istr_param.a_long1[5] //Linea
istr_Datos_Grabacion.a_long1[3] = istr_param.a_long1[1] //muestra
istr_Datos_Grabacion.a_long1[4] = istr_param.a_long1[6]//talla
istr_Datos_Grabacion.a_long1[5] = 0//istr_param.a_long1[8] //muestrario Origen
istr_Datos_Grabacion.a_long1[6] = istr_param.a_long1[3] //muestrario destino
istr_Datos_Grabacion.a_long1[7] = istr_param.a_long1[7] //Dise$$HEX1$$f100$$ENDHEX$$o Origen
istr_Datos_Grabacion.a_long1[8] = istr_param.a_long1[2]//recurso origen
istr_Datos_Grabacion.a_long1[9] = 0

//inv_copia_rec.of_set_parametros( istr_Datos_Grabacion)

//inv_copia_rec.of_str_colores(istr_param)
str_param lstr_param
//lstr_param = inv_copia_rec.Of_get_str_colores( )

ll_retorno = of_recurso_cierra(il_recurso)
IF ll_retorno = 1 THEN 
	sle_2.text = 'Si'
ELSE
	IF ll_retorno < 0 THEN
		RETURN -1
	ELSE
		sle_2.text = 'No'
	END IF
END IF

IF (MUESTRA_BASICA = istr_param.a_string3[1] OR MEDIDAS_MUESTRA = istr_param.a_string3[1]) THEN 
	dw_recurso.Dataobject = 'd_dt_med_mue_rep_recursos_muestra'
	ib_maneja_recurso_agrupa = False
Else
	ib_maneja_recurso_agrupa = True
End If

dw_recurso.Setfocus( )
dw_recurso.SetTransObject(n_cst_application.itr_appl)

dw_recursos_agrupa.SetTransObject(n_cst_application.itr_appl)
dw_recursos_agrupa.Visible = false

//this.of_recursos_existen( Long(is_muestra), lstr_param)
IF (MUESTRA_BASICA = istr_param.a_string3[1] OR MEDIDAS_MUESTRA = istr_param.a_string3[1]) THEN 
	ll_retorno = dw_recurso.Retrieve(istr_param.a_long1[4],istr_param.a_long1[5],Long(is_muestra),istr_param.a_long1[2])
ELSE
	ll_retorno = dw_recurso.Retrieve(Long(is_muestra), lstr_param.a_long1,istr_Datos_Grabacion.a_long1[8]) 
END IF 
IF ll_retorno < 0 THEN MessageBox('Error','Ha ocurrido un error, favor llamar a mesa de ayuda - opci$$HEX1$$f300$$ENDHEX$$n 1')
ids_datos.Dataobject = dw_recurso.Dataobject
dw_recurso.Rowscopy( 1, dw_recurso.RowCount(), Primary!, ids_datos, 1, Primary!)

//2015-06-16 Solicitud: 51249 Ceiba/JJ
//se deben modificar los textos segun sea el caso
of_cargartextosiniciales()
//2015-06-16 Solicitud: 51249 Ceiba/JJ - 51249
IF (MUESTRA_BASICA = istr_param.a_string3[1] OR MEDIDAS_MUESTRA = istr_param.a_string3[1]) AND dw_recurso.RowCount() = 0 THEN 
	cb_2.event clicked( )
END IF 

end event

type dw_recursos_agrupa from datawindow within w_copiar_recursos
boolean visible = false
integer x = 846
integer y = 300
integer width = 599
integer height = 984
integer taborder = 50
string title = "none"
string dataobject = "d_recursos_copiar_agrupa"
boolean vscrollbar = true
boolean livescroll = true
end type

type st_4 from statictext within w_copiar_recursos
boolean visible = false
integer x = 27
integer y = 1296
integer width = 827
integer height = 128
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean focusrectangle = false
end type

type sle_3 from singlelineedit within w_copiar_recursos
boolean visible = false
integer x = 69
integer y = 1560
integer width = 745
integer height = 76
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_copiar_recursos
integer x = 338
integer y = 224
integer width = 64
integer height = 72
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = false
boolean displayonly = true
end type

type st_3 from statictext within w_copiar_recursos
integer y = 224
integer width = 731
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "  Este Recurso      Cierra"
boolean focusrectangle = false
end type

type st_2 from statictext within w_copiar_recursos
integer x = 23
integer y = 96
integer width = 768
integer height = 132
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "la Ficha de MP a los recursos que se seleccionen"
boolean focusrectangle = false
end type

type st_1 from statictext within w_copiar_recursos
integer x = 18
integer y = 40
integer width = 517
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Se copiara del recurso "
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_copiar_recursos
integer x = 544
integer y = 40
integer width = 274
integer height = 60
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = false
boolean displayonly = true
end type

type ids_datos from datawindow within w_copiar_recursos
integer x = 2405
integer y = 208
integer width = 1070
integer height = 916
integer taborder = 30
string title = "none"
string dataobject = "d_recursos_muestra"
boolean vscrollbar = true
boolean livescroll = true
end type

type cb_2 from commandbutton within w_copiar_recursos
integer x = 471
integer y = 1432
integer width = 343
integer height = 100
integer taborder = 50
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

type cb_1 from commandbutton within w_copiar_recursos
integer x = 50
integer y = 1432
integer width = 343
integer height = 100
integer taborder = 60
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
Long ll_fila, ll_estr, ll_colores,ll_filas , ll_recursos 
//aca se debe hacer el for del llamado de la controladora para el grabado 
// por cada recurso seleccionado y enviar este parametro a la ves
//istr_Datos_Grabacion.a_long1[9] = il_recursodest

str_param lstr_param

ll_colores = UpperBound (istr_param.a_string1)
ll_filas = ids_datos.Rowcount( )
sle_3.visible = TRUE

ll_recursos = 0
FOR ll_fila = 1 To ll_filas	
	IF ids_datos.Object.seleccion[ll_fila] = '1' THEN
		ll_recursos++
	END IF
NEXT
IF ll_recursos > 5 OR ll_colores > 5 THEN
	IF MessageBox("Advertencia", 'Se tiene una gran cantidad de informaci$$HEX1$$f300$$ENDHEX$$n y el proceso puede ser interrumpido, Desea continuar?', Exclamation!, YesNo!, 2) <> 1 THEN
		return
	end if
END IF
FOR ll_fila = 1 To ll_filas	
	IF ids_datos.Object.seleccion[ll_fila] = '1' THEN
		//2015-06-16 Solicitud: 51249 Ceiba/JJ
		//Almacenar los datos segun sea la opcion por la cual se ingreso
		IF MUESTRA_BASICA = istr_param.a_string3[1] OR MEDIDAS_MUESTRA = istr_param.a_string3[1] THEN 
			//Almacenar la informacion en los demas recursos seleccionados a partir de la imagen - informacion del de origen 
			//se envia la fila porque el recurso selecciona esta con el checked para ser actualizado
			IF of_CrearImagen_InformacionRecursoOrigen() <> 1 THEN 
				RollBack using n_cst_application.itr_appl;	
				RETURN 1
			END IF
			IF of_Setear_Grabar_InfoRecursoDestino(ids_datos.Object.co_recurso[ll_fila]) <> 1 THEN 
				RollBack using n_cst_application.itr_appl;	
				RETURN 1			
			END IF
		ELSE
			//Ejecuta logica por defecto - opcion de materia prima
			FOR ll_estr = 1 TO ll_colores
				lstr_param.a_string1[1] = istr_param.a_string1[ll_estr]
				lstr_param.a_string2[1] = istr_param.a_string2[ll_estr]
				istr_Datos_Grabacion.a_long1[9] = ids_datos.object.co_recurso[ll_fila]	
				
				inv_copia_rec.of_str_colores(lstr_param)
				inv_copia_rec.of_set_parametros( istr_Datos_Grabacion)
				sle_3.text = STRING(ll_fila) +' De '+String(ll_filas) + ' Recurso: ' +String(istr_Datos_Grabacion.a_long1[9])
				IF inv_copia_rec.of_grabar_colores( ) = -1 THEN 
					RollBack using n_cst_application.itr_appl;
		
					RETURN 1
				END IF
				IF inv_copia_rec.of_ValidarGrabarLogRecCotizado() = -1 THEN RETURN -1 //SA52045 - Ceiba/jjmonsal - 19-01-2016
			NEXT
		END IF
		
	END IF
NEXT 

//2015-06-16 Solicitud: 51249 Ceiba/JJ
IF MUESTRA_BASICA = istr_param.a_string3[1] OR MEDIDAS_MUESTRA = istr_param.a_string3[1] THEN 
	//MessageBox('Exito','Las medidas de muestras han sido copiadas con exito en los recursos seleccionados')
ELSE
	MessageBox('Exito','Los colores han sido copiados con exito en los recursos seleccionados')
END IF
of_destruirobjetos()
Close(Parent)
end event

type dw_recurso from datawindow within w_copiar_recursos
event ue_tecla pbm_dwnkey
integer x = 27
integer y = 300
integer width = 773
integer height = 984
integer taborder = 40
string title = "none"
string dataobject = "d_recursos_muestra"
boolean vscrollbar = true
boolean livescroll = true
end type

event ue_tecla;Long ll_co_recurso, ll_find, ll_fila, ll_filas
String ls_seleccion

str_param		lstr_param

ll_filas = ids_datos.Rowcount( )
// FACL - 2019/05/30 - Soporte si no tiene registros se retorna
If GetRow() = 0 Then Return 0
If THIS.AcceptText( ) <> 1 Then Return 0



CHOOSE CASE Key
	CASE KeySpaceBar!
		ll_co_recurso = dw_recurso.Object.co_recurso[GetRow()]
		ls_seleccion = TRIM(String(dw_recurso.Object.seleccion[GetRow()],''))
		
		ll_find = ids_datos.find( " co_recurso = "+String(ll_co_recurso), 1, ids_datos.RowCount())
		IF ls_seleccion = '1' THEN
			ids_datos.object.seleccion[ll_find] = '0'	
		ELSE
			ids_datos.object.seleccion[ll_find] = '1'
		END IF
END CHOOSE
end event

event clicked;//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	Clicked (Event)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Enero 24 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	seleccionar los registro que se tengan filtrados 
//=========================================================================
Long ll_co_recurso, ll_find, ll_fila, ll_filas
String ls_seleccion
Integer li_rec_agrupa
Double  ld_recurso, ld_muestra, ld_diseno

str_param		lstr_param

ll_filas = ids_datos.Rowcount( )
// FACL - 2019/05/30 - Soporte si no tiene registros se retorna
If Row = 0 Then Return 0
If THIS.AcceptText( ) <> 1 Then Return 0


CHOOSE CASE dwo.name
	CASE 'seleccion'
		ll_co_recurso = dw_recurso.Object.co_recurso[Row]
		ls_seleccion = TRIM(String(dw_recurso.Object.seleccion[Row],''))
		
		ll_find = ids_datos.find( " co_recurso = "+String(ll_co_recurso), 1, ids_datos.RowCount())
		IF ls_seleccion = '1' THEN
			ids_datos.object.seleccion[ll_find] = '0'	
		ELSE
			ids_datos.object.seleccion[ll_find] = '1'
		END IF
END CHOOSE

If ib_maneja_recurso_agrupa Then
	//SA56239 - Ceiba/reariase - 23-05-2017 - Recursos que agrupa
	dw_recursos_agrupa.visible = False
	ld_recurso = dw_recurso.GetItemNumber( Row, "co_recursoagrupa")
	If IsNull(ld_recurso) Then ld_recurso = 0
	ld_muestra = dw_recurso.GetItemNumber( Row, "co_muestra")
	ld_diseno  = dw_recurso.GetItemNumber( Row, "co_diseno")	
	li_rec_agrupa = dw_recursos_agrupa.Retrieve(ld_recurso, ld_muestra, ld_diseno)
	if li_rec_agrupa > 0 Then dw_recursos_agrupa.visible = True
	//Fin SA56239 
End If
end event

event doubleclicked;Long ll_co_recurso, ll_find, ll_fila, ll_filas
String ls_seleccion

str_param		lstr_param

ll_filas = ids_datos.Rowcount( )
// FACL - 2019/05/30 - Soporte si no tiene registros se retorna
If Row = 0 Then Return 0
If THIS.AcceptText( ) <> 1 Then Return 0


CHOOSE CASE dwo.name
	CASE 'seleccion'
		ll_co_recurso = dw_recurso.Object.co_recurso[Row]
		ls_seleccion = TRIM(String(dw_recurso.Object.seleccion[Row],''))
		
		ll_find = ids_datos.find( " co_recurso = "+String(ll_co_recurso), 1, ids_datos.RowCount())
		IF ls_seleccion = '1' THEN
			ids_datos.object.seleccion[ll_find] = '0'	
		ELSE
			ids_datos.object.seleccion[ll_find] = '1'
		END IF
END CHOOSE
end event

type cbx_1 from checkbox within w_copiar_recursos
integer x = 622
integer y = 172
integer width = 338
integer height = 72
boolean bringtotop = true
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
Long ll_filas, ll_fila, ll_co_recurso, ll_find
String ls_seleccion


ll_filas = dw_recurso.Rowcount( )
IF ll_filas > 0 THEN
	FOR ll_fila = 1 TO ll_filas
		
		ll_co_recurso = dw_recurso.Object.co_recurso[ll_fila]
		ls_seleccion = TRIM(String(dw_recurso.Object.seleccion[ll_fila],''))
		
		ll_find = ids_datos.find( " co_recurso = "+String(ll_co_recurso), 1, ids_datos.RowCount())
		IF THIS.Checked THEN
			dw_recurso.Object.seleccion[ll_fila] = '1'
			ids_datos.Object.seleccion[ll_find] = '1'
		ELSE
			dw_recurso.Object.seleccion[ll_fila] = '0'
			ids_datos.Object.seleccion[ll_find] = '0'
		END IF		
	NEXT
END IF 
end event

