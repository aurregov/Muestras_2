HA$PBExportHeader$n_cst_materia_prima.sru
forward
global type n_cst_materia_prima from nonvisualobject
end type
end forward

global type n_cst_materia_prima from nonvisualobject
end type
global n_cst_materia_prima n_cst_materia_prima

type variables
Private:
//OleObject  	iole_rfc_sap
OleObject  	iole_Funcion
OleObject  	iole_ConexionSap
OleObject  	iole_conexion 
str_parametros_conexion		istr_parametros_conexion
str_parametros_sap			istr_info_sap
str_retorno_sap				istr_errores_crea_lot

 PRIVATE:
// Esta variable contiene el nombre de la transaccion que se ejecutara
String 	is_nombre_transaccion = 'Z_PP_ACT_LISTA_MATERIAL_AFS'
String 	is_mensaje = ''

  
end variables

forward prototypes
public subroutine of_asignar_conexion_sap (oleobject aole_conexionsap)
public function string of_obtener_mensaje ()
public function integer of_ingresar_materia_prima ()
public function integer of_asignar_parametros (str_parametros_sap astr_info_sap)
public subroutine of_asignar_errores_ingresando_mp (str_retorno_sap astr_errores_crea_lot)
public function str_retorno_sap of_obtener_errores_ingresando_mp ()
end prototypes

public subroutine of_asignar_conexion_sap (oleobject aole_conexionsap);//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_asignar_conexion_sap (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	
//-------------------------------------------------------------------------
// ARGUMENTO:	oleobject aole_conexionsap 
// RETORNO	:	
//=========================================================================

// Asigna la conexi$$HEX1$$f300$$ENDHEX$$n a SAP
iole_ConexionSap = aole_ConexionSap 
end subroutine

public function string of_obtener_mensaje ();//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_obtener_mensaje (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	
//-------------------------------------------------------------------------
// ARGUMENTO:	(none)
// RETORNO	:	
//=========================================================================

// Retorna el mensaje actual
RETURN Trim(is_mensaje)
end function

public function integer of_ingresar_materia_prima ();//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_ingresar_materia_prima (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	
//-------------------------------------------------------------------------
// ARGUMENTO:	(none)
// RETORNO	:	
//=========================================================================

/*
* Proceso los datos enviados a SAP RF
*
* SAP RFC puebla la propiedad Tables en la posicion (1) para retornar el resultado del proceso
*/
OleObject			lole_tabla
Integer				li_cantidad_tables 
Long	 				ll_filas,  ll_fila
 
str_retorno_sap	lstr_errores_ordenes
// Llama la RFC
iole_Funcion.call

// El resultado de la RFC es cargado en la propiedad Tables, posicion 1...
li_cantidad_tables = iole_Funcion.tables.Count

// En condiciones normales retorna 2 estructuras, como m$$HEX1$$ed00$$ENDHEX$$nimo una, de lo
// contrario es un error.
IF li_cantidad_tables < 1 THEN 
	is_mensaje = 'Ocurri$$HEX2$$f3002000$$ENDHEX$$un error inesperado al generar el envio'
	RETURN -1
END IF

IF li_cantidad_tables >= 1 THEN
	// FACL - 2019/01/24 - SA57229 - Se toma referencia a las tablas parametro de SAP por el nombre en vez de la posicion , estaba en 1
	lole_tabla = iole_Funcion.tables('T_ERRORES')  
	ll_filas   = lole_tabla.RowCount
  
	FOR ll_fila = 1 to ll_filas
		lstr_errores_ordenes.typesap[ll_fila]     	= lole_tabla.value(ll_fila, 1) 
		lstr_errores_ordenes.idsap[ll_fila]     		= lole_tabla.value(ll_fila, 2) 
		lstr_errores_ordenes.numbersap[ll_fila]  		= lole_tabla.value(ll_fila, 3) 
		lstr_errores_ordenes.messagesap[ll_fila]     = lole_tabla.value(ll_fila, 4) 
		lstr_errores_ordenes.log_nosap[ll_fila]      = lole_tabla.value(ll_fila, 5) 
		lstr_errores_ordenes.log_msg_nosap[ll_fila]  = lole_tabla.value(ll_fila, 6) 
		lstr_errores_ordenes.message_v1sap[ll_fila]  = lole_tabla.value(ll_fila, 7) 
		lstr_errores_ordenes.message_v2sap[ll_fila]  = lole_tabla.value(ll_fila, 8) 
		lstr_errores_ordenes.message_v3sap[ll_fila]  = lole_tabla.value(ll_fila, 9) 
		lstr_errores_ordenes.message_v4sap[ll_fila]  = lole_tabla.value(ll_fila,10) 
		lstr_errores_ordenes.parametersap[ll_fila]   = lole_tabla.value(ll_fila,11) 
		lstr_errores_ordenes.rowsap[ll_fila]    		= String(lole_tabla.value(ll_fila,12))
		lstr_errores_ordenes.fieldsap[ll_fila]    	= lole_tabla.value(ll_fila,13) 
		lstr_errores_ordenes.systemsap[ll_fila]  		= lole_tabla.value(ll_fila,14) 
	NEXT
	IF ll_filas > 0 and lstr_errores_ordenes.typesap[1] = 'E' THEN
	   This.of_asignar_errores_ingresando_mp( lstr_errores_ordenes )
		RETURN -1
	END IF
END IF

RETURN 1
end function

public function integer of_asignar_parametros (str_parametros_sap astr_info_sap);//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_asignar_parametros (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	
//-------------------------------------------------------------------------
// ARGUMENTO:	str_parametros_sap astr_info_sap 
// RETORNO	:	
//=========================================================================

//LISTA_MATERIAL	 	Tabla que recibe la informaci$$HEX1$$f300$$ENDHEX$$n de la lista de material a crear o modificar.		Ejemplo	Sugerencia
//MATNR					CHAR	N$$HEX1$$fa00$$ENDHEX$$mero de material	110963TP	
//WERKS					CHAR	Centro	1110	Par$$HEX1$$e100$$ENDHEX$$metro
//ALTERNATIVE			CHAR	Alternativa de la lista de materiales	1	
//BASE_QUANTITY		CHAR	Cantidad base (BTCI)	24000	
//BASE_UNIT				UNIT	Un.medida base p.lista material.	UN	Par$$HEX1$$e100$$ENDHEX$$metro
//BOM_TEXT				CHAR	Texto de la lista de materiales		
//ALT_TEXT				CHAR	Texto de alternativa de lista de materiales	RECURSO 6530	
//ITEM_CATEGORY		CHAR	Tipo de posici$$HEX1$$f300$$ENDHEX$$n (Lista de materiales)	L	Par$$HEX1$$e100$$ENDHEX$$metro
//COMPONENT				CHAR	Componente de lista de materiales	110004040	
//COMP_UNIT				UNIT	Unidad de medida del componente	G	Par$$HEX1$$e100$$ENDHEX$$metro
//HDR_GRID_VALUE		CHAR	Valor matriz	02000362	Concatena la talla (con ceros a la izquierda) + el color (con ceros a la iquierda) dcel material TP
//COMP_GRID_VALUE		CHAR	Valor matriz	000600	Color de la MP con ceros a la izquierda
//CATEGORY				CHAR	Valor de categor$$HEX1$$ed00$$ENDHEX$$a		En Blanco. No aplica para TP
//COMP_QUANTITY		QUAN	Cantidad de componente	14	

String 		ls_str 
Datetime 	ld_fect
Long			ll_filas, ll_fila
OleObject	lole_tabla

// Obtiene los parametros de ejecucion
istr_info_sap = astr_info_sap

// Llama la RFC
TRY
	// Obtengo una instancia de la transaccion is_nombre_transaccion 
	iole_Funcion = iole_ConexionSap.Add(is_nombre_transaccion)
CATCH (runtimeerror er)
    is_mensaje = "No existe la transacci$$HEX1$$f300$$ENDHEX$$n "+is_nombre_transaccion+&
	 				  " para la conexi$$HEX1$$f300$$ENDHEX$$n que est$$HEX2$$e1002000$$ENDHEX$$utilizando.~r~n~r~n"+&
					  er.getmessage() 
	 RETURN -1
END TRY

// La propiedad Tables en la posicion 2 recibe los parametros de ejecucion
// FACL - 2019/01/24 - SA57229 - Se toma referencia a las tablas parametro de SAP por el nombre en vez de la posicion , estaba en 2
lole_tabla  = iole_Funcion.tables('T_MATERIALES')
 
ll_filas = UpperBound(istr_info_sap.matnr)

IF ll_filas = 0 THEN 
	is_mensaje = 'Debe enviar m$$HEX1$$ed00$$ENDHEX$$nimo un registro. Por favor verifique'
	RETURN -1
END IF

u_ds_base	lds_log_sap
lds_log_sap		= CREATE u_ds_base


lds_log_sap.dataobject = 'd_log_envio_sap'

long ll_insert

// Si hay parametros entonces se adicionan
FOR ll_fila = 1 to ll_filas
	lole_tabla.Rows.Add
	ll_insert = lds_log_sap.insertrow(0)
	
	lole_tabla.value[ll_fila,  1] = istr_info_sap.matnr[ll_fila]
	lole_tabla.value[ll_fila,  2] = istr_info_sap.werks[ll_fila]
	lole_tabla.value[ll_fila,  3] = istr_info_sap.alternative[ll_fila]
	lole_tabla.value[ll_fila,  4] = istr_info_sap.base_quantity[ll_fila]
	lole_tabla.value[ll_fila,  5] = istr_info_sap.base_unit[ll_fila]
	lole_tabla.value[ll_fila,  6] = istr_info_sap.bom_text[ll_fila]
	lole_tabla.value[ll_fila,  7] = istr_info_sap.alt_text[ll_fila]
	lole_tabla.value[ll_fila,  8] = istr_info_sap.item_category[ll_fila]
	lole_tabla.value[ll_fila,  9] = istr_info_sap.component[ll_fila]
	lole_tabla.value[ll_fila, 10] = istr_info_sap.comp_unit[ll_fila]
	lole_tabla.value[ll_fila, 11] = istr_info_sap.hdr_grid_value[ll_fila]
	lole_tabla.value[ll_fila, 12] = istr_info_sap.comp_grid_value[ll_fila]
	lole_tabla.value[ll_fila, 13] = istr_info_sap.category[ll_fila]
	lole_tabla.value[ll_fila, 14] = istr_info_sap.comp_quantity[ll_fila]
	lole_tabla.value[ll_fila, 15] = istr_info_sap.aplicativo[ll_fila]
	
	
	lds_log_sap.Object.matnr[ll_insert] 				= istr_info_sap.matnr[ll_fila]
	lds_log_sap.Object.wernr[ll_insert] 				= istr_info_sap.werks[ll_fila]
	lds_log_sap.Object.alternative[ll_insert] 		= istr_info_sap.alternative[ll_fila]
	lds_log_sap.Object.base_quantity[ll_insert] 		= istr_info_sap.base_quantity[ll_fila]
	lds_log_sap.Object.base_unit[ll_insert] 			= istr_info_sap.base_unit[ll_fila]
	lds_log_sap.Object.bom_text[ll_insert] 			= istr_info_sap.bom_text[ll_fila]
	lds_log_sap.Object.alt_text[ll_insert] 			= istr_info_sap.alt_text[ll_fila]
	lds_log_sap.Object.item_category[ll_insert] 		= istr_info_sap.item_category[ll_fila]
	lds_log_sap.Object.component[ll_insert] 			= istr_info_sap.component[ll_fila]
	lds_log_sap.Object.comp_unit[ll_insert] 			= istr_info_sap.comp_unit[ll_fila]
	lds_log_sap.Object.hdr_grid_value[ll_insert] 	= istr_info_sap.hdr_grid_value[ll_fila]
	lds_log_sap.Object.comp_grid_value[ll_insert] 	= istr_info_sap.comp_grid_value[ll_fila]
	lds_log_sap.Object.category[ll_insert] 			= istr_info_sap.category[ll_fila]
	lds_log_sap.Object.comp_quantity[ll_insert] 		= istr_info_sap.comp_quantity[ll_fila]
	lds_log_sap.Object.aplicativo[ll_insert] 			= istr_info_sap.aplicativo[ll_fila]
	
	
NEXT


//lds_log_sap.SaveAs("EnvioSap", "C:\", Excel5!, TRUE)

lds_log_sap.SaveAs("c:\parametrossap.xls", excel!, true)
		  
		  


RETURN 1
end function

public subroutine of_asignar_errores_ingresando_mp (str_retorno_sap astr_errores_crea_lot);//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_asignar_errores_ingresando_mp (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	esta toda la estructura de retorno de la funcion RFC
//-------------------------------------------------------------------------
// ARGUMENTO:	str_retorno_sap astr_errores_crea_lot 
// RETORNO	:	
//=========================================================================


istr_errores_crea_lot = astr_errores_crea_lot

end subroutine

public function str_retorno_sap of_obtener_errores_ingresando_mp ();//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_obtener_errores_ingresando_mp (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	
//-------------------------------------------------------------------------
// ARGUMENTO:	(none)
// RETORNO	:	
//=========================================================================


RETURN istr_errores_crea_lot
end function

on n_cst_materia_prima.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_materia_prima.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;/*
*----------------------------------------------------------------------*
* Informaci$$HEX1$$f300$$ENDHEX$$n General
*----------------------------------------------------------------------*
* Descripci$$HEX1$$f300$$ENDHEX$$n  : Objeto para el ingreso de materia prima
* Autor        : Oscar Hern$$HEX1$$e100$$ENDHEX$$n Londo$$HEX1$$f100$$ENDHEX$$o Ospina
* Fecha Creac. : 09.09.2011
*----------------------------------------------------------------------*
*/

Long	ll_retorno

// Crea el objeto para la Conexi$$HEX1$$f300$$ENDHEX$$n con Sap 
iole_ConexionSap = Create OLEObject

end event

