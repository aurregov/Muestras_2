HA$PBExportHeader$n_cst_parametros_config.sru
forward
global type n_cst_parametros_config from nonvisualobject
end type
end forward

global type n_cst_parametros_config from nonvisualobject
end type
global n_cst_parametros_config n_cst_parametros_config

type variables
u_ds_base		ids_datos

end variables

forward prototypes
public function string of_get_codigo ()
public function integer of_recuperar_parametro_config (readonly long al_fabrica, readonly long al_linea, readonly string as_constante)
end prototypes

public function string of_get_codigo ();//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_get_codigo (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	retorna el codigo que se recupera de los parametros de configuracion.
//-------------------------------------------------------------------------
// ARGUMENTO:	(none)
// RETORNO	:	String
//=========================================================================


RETURN TRIM(String(ids_datos.Object.co_codigo[1],''))
end function

public function integer of_recuperar_parametro_config (readonly long al_fabrica, readonly long al_linea, readonly string as_constante);//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_recuperar_parametro_config (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	recuperacion de los parametros de configuracion.
//-------------------------------------------------------------------------
// ARGUMENTO:	readonly long al_fabrica, readonly long al_linea, readonly string as_constante 
// RETORNO	:	integer
//=========================================================================


ids_datos.Retrieve(al_fabrica, al_linea, as_constante)

IF ids_datos.Rowcount( ) < 1 THEN
	MessageBox('Configuraci$$HEX1$$f300$$ENDHEX$$n','Falta Configurar el parametro '+as_constante+' para la fabrica: '+String(al_fabrica)+' y la Linea: '+String(al_linea))
	RETURN -1
END IF

return 1
end function

on n_cst_parametros_config.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_parametros_config.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	constructor (event)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	construccion de la controladora de los parametros de configuracion.
//-------------------------------------------------------------------------
// ARGUMENTO:	(none)
// RETORNO	:	
//=========================================================================

ids_datos		= CREATE u_ds_base

ids_datos.dataobject = 'd_variables_config'
ids_datos.settransobject( n_cst_application.itr_appl)
end event

