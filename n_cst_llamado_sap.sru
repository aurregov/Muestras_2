HA$PBExportHeader$n_cst_llamado_sap.sru
forward
global type n_cst_llamado_sap from nonvisualobject
end type
end forward

global type n_cst_llamado_sap from nonvisualobject
end type
global n_cst_llamado_sap n_cst_llamado_sap

type variables
str_parametros_sap		istr_info_sap
str_param_sap				istr_interface_sis_sap
String	is_str 
Private:
Constant Integer CENTRO = 1				//Campo centro
Constant Integer MATERIALH_E = 2			//Campo Material Ingreso
Constant Integer VMATRIZH_E = 3			//Campo Valor Matriz Ingreso
Constant Integer ORDPREV = 2				//Campo Retornado orden de produccion 
Constant Integer MATERIALH_R = 3			//Campo Retornado Material
Constant Integer VMATRIZH_R = 4			//Campo Retornado Matriz
Constant Long    CANTIDAD = 5				//Campo Cantidad de Unidades
Constant Long    MATKL = 6					//Campo Grupo de Art$$HEX1$$ed00$$ENDHEX$$culos
Constant Long    WGBEZ = 7					//Campo Descripci$$HEX1$$f300$$ENDHEX$$n de Grupo de Art$$HEX1$$ed00$$ENDHEX$$culos
Constant String  CENTRO_1110= '1110'

//Ds para la fusion con los datos de SIS
uo_dsbase	ids_DatosPROCESADOSSAP


end variables

forward prototypes
public function string of_get_error ()
public function long of_gen_mp (readonly str_parametros_sap astr_inf_sap)
public subroutine of_leervararchivoconfiguracion (ref str_parametros_conexion astr_paramconex_sap)
public function integer of_llenar_table (oleobject aole_tabla, readonly string as_refer, readonly string as_talla, readonly string as_color)
public function uo_dsbase of_cargar_table (oleobject aole_tabla)
public function integer of_ejecutar_rfc_sap (readonly string as_refer, readonly string as_talla, readonly string as_color)
public function long of_procesardatosretornadossap (uo_dsbase ads_tablereturn)
public subroutine of_setdsdatossap (uo_dsbase ads_tablereturn)
public function uo_dsbase of_getdsdatossap ()
end prototypes

public function string of_get_error ();//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_get_error (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	retorno del error en el llamado de SAP
//-------------------------------------------------------------------------
// ARGUMENTO:	(none)
// RETORNO	:	
//=========================================================================

RETURN is_str
end function

public function long of_gen_mp (readonly str_parametros_sap astr_inf_sap);//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_gen_mp (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	llamado y conexion al servicio por RFC 
//-------------------------------------------------------------------------
// ARGUMENTO:	readonly str_parametros_sap astr_inf_sap 
// RETORNO	:	
//=========================================================================
Long 								ll_return, ll_row, ll_rows 
String							ls_str
String							ls_path, ls_applicationserver, ls_client, ls_user, ls_password, &
									ls_language, ls_systemcode, ls_systemnumber
str_parametros_conexion 	lstr_connection_params
n_cst_rfc_sap					lnv_rfc_sap
n_cst_materia_prima			lnv_matpri

str_retorno_sap				lstr_error_info

istr_info_sap	= astr_inf_sap

lnv_rfc_sap		= CREATE n_cst_rfc_sap
lnv_matpri		= CREATE n_cst_materia_prima

/*Cargar los parametros del archivo de configuracion */
THIS.of_leerVarArchivoConfiguracion(lstr_connection_params) //SA55583 - Ceiba/jjmonsal - 14-10-2016

lnv_rfc_sap.of_asignar_parametros_conexion( lstr_connection_params )

ll_return = lnv_rfc_sap.of_conectar_transaccion( )

IF ll_return = 1 THEN  
	 
	lnv_matpri.of_asignar_conexion_sap( lnv_rfc_sap.of_obtener_conexion_sap())

	ll_return  = lnv_matpri.of_asignar_parametros( istr_info_sap)

	IF ll_return = -1 THEN 
      ls_str = lnv_matpri.of_obtener_mensaje( )
		RETURN -1
	END IF
	
	ll_return  = lnv_matpri.of_ingresar_materia_prima( )

	IF ll_return = -1 THEN 
		lstr_error_info = lnv_matpri.of_obtener_errores_ingresando_mp( )
		ll_rows         = UpperBound(lstr_error_info.typesap)
      ls_str          = ''
		
		FOR ll_row = 1 TO ll_rows					
			ls_str += lstr_error_info.typesap[ll_row]
			ls_str += "-"+lstr_error_info.idsap[ll_row]
			ls_str += "-"+lstr_error_info.numbersap[ll_row]
			ls_str += "-"+lstr_error_info.messagesap[ll_row]
			ls_str += "-"+lstr_error_info.log_nosap[ll_row]
			ls_str += "-"+lstr_error_info.log_msg_nosap[ll_row]
			ls_str += "-"+lstr_error_info.message_v1sap[ll_row]
			ls_str += "-"+lstr_error_info.message_v2sap[ll_row]
			ls_str += "-"+lstr_error_info.message_v3sap[ll_row]
			ls_str += "-"+lstr_error_info.message_v4sap[ll_row]
			ls_str += "-"+lstr_error_info.parametersap[ll_row]
			ls_str += "-"+lstr_error_info.rowsap[ll_row]
			ls_str += "-"+lstr_error_info.fieldsap[ll_row]
			ls_str += "-"+lstr_error_info.systemsap[ll_row]
   		ls_str += "~r~n"
  		NEXT
	   is_str = ls_str
		RETURN -1
   END IF
ELSE
	ls_str = lnv_rfc_sap.of_obtener_mensaje( )
	is_str = ls_str
END IF

RETURN ll_return
end function

public subroutine of_leervararchivoconfiguracion (ref str_parametros_conexion astr_paramconex_sap);/********************************************************************
SA55583 - Ceiba/jjmonsal - 14-10-2016 FuncionName: of_leerVarArchivoConfiguracion
<DESC> Description: Refactoring para obtener los parametros de Conexion, tener la lectura a is_pathfileconf en un solo punto </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> str_parametros_conexion - astr_paramconex_sap </ARGS> 
<USAGE> recuperar informacion </USAGE>
********************************************************************/
String							ls_path, ls_applicationserver, ls_client, ls_user, ls_password, &
									ls_language, ls_systemcode, ls_systemnumber

ls_path 						= n_cst_application.is_pathfileconf
ls_applicationserver   	= n_cst_application.Of_GetProFile(ls_path,'bd proceso','applicationserver')
ls_client    				= n_cst_application.Of_GetProFile(ls_path,'bd proceso','client')
ls_user  					= n_cst_application.Of_GetProFile(ls_path,'bd proceso','user')		
ls_password    			= n_cst_application.Of_GetProFile(ls_path,'bd proceso','password')	
ls_language    			= n_cst_application.Of_GetProFile(ls_path,'bd proceso','language')	
ls_systemcode    			= n_cst_application.Of_GetProFile(ls_path,'bd proceso','systemcode')	
ls_systemnumber    		= n_cst_application.Of_GetProFile(ls_path,'bd proceso','systemnumber')	

astr_paramConex_sap.client[1]            = ls_client
astr_paramConex_sap.user[1]              = ls_user
astr_paramConex_sap.password[1]          = ls_password
astr_paramConex_sap.language[1]          = ls_language
astr_paramConex_sap.systemcode[1]        = ls_systemcode
astr_paramConex_sap.systemnumber[1]      = ls_systemnumber
astr_paramConex_sap.applicationserver[1] = ls_applicationserver
end subroutine

public function integer of_llenar_table (oleobject aole_tabla, readonly string as_refer, readonly string as_talla, readonly string as_color);/********************************************************************
SA55583 Ceiba/jjmonsal - 06-12-2016 - E00572 - Muestra b$$HEX1$$e100$$ENDHEX$$sica - FunctionName: of_llenar_table
<DESC> Description: llenar tabla para envio a sap </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Long		ll_fila, ll_filas 
TRY
	ll_filas = 1
	For ll_fila = 0 To ll_filas
		aole_tabla.Rows.Add 
		ll_fila ++

		aole_tabla.value[ll_fila, CENTRO]			= CENTRO_1110
		aole_tabla.value[ll_fila, MATERIALH_E]		= as_refer					//'122029TP'
		aole_tabla.value[ll_fila, VMATRIZH_E]		= as_talla + as_color	//'05000961'
	Next
	
	Return 1
CATCH(Exception ex)
	Messagebox("A ocurrido una excepci$$HEX1$$f300$$ENDHEX$$n", "Fallo:" + ex.getmessage(), StopSign!)
	RETURN -1 
CATCH( Throwable th)
	Messagebox("A ocurrido una excepci$$HEX1$$f300$$ENDHEX$$n", "Fallo:" + th.getmessage(), StopSign!)
	RETURN -1 
End try
end function

public function uo_dsbase of_cargar_table (oleobject aole_tabla);//of_Cargar_Table
Long			ll_fila, ll_filas, ll_insert
//String		ls_campo1, ls_campo2, ls_campo3, ls_campo4
uo_dsbase	lds_TableReturn
TRY
	lds_TableReturn = create uo_dsbase
	lds_TableReturn.Dataobject= 'd_ex_gr_validarnecesidadenpdn'
	lds_TableReturn.SetTransobject(n_cst_application.itr_appl)
	
	ll_filas = aole_tabla.RowCount
	For ll_fila = 1 To ll_filas
		ll_insert = lds_TableReturn.InsertRow( 0 )
		
		/*ls_campo1 = STRING( aole_tabla.Cell( ll_fila, CENTRO ) )
		ls_campo2 = STRING( aole_tabla.Cell( ll_fila, ORDPREV ) ) 
		ls_campo3 = STRING( aole_tabla.Cell( ll_fila, MATERIALH_R ) ) 
		ls_campo4 = STRING( aole_tabla.Cell( ll_fila, VMATRIZH_R ) ) */
		
		lds_TableReturn.setItem(ll_insert, 'Campo1',TRIM(STRING( aole_tabla.Cell( ll_fila, CENTRO ) ) ))
		lds_TableReturn.setItem(ll_insert, 'Campo2',TRIM(STRING( aole_tabla.Cell( ll_fila, ORDPREV ) ) ))
		lds_TableReturn.setItem(ll_insert, 'Campo3',TRIM(STRING( aole_tabla.Cell( ll_fila, MATERIALH_R ) ) ))
		lds_TableReturn.setItem(ll_insert, 'Campo4',TRIM(STRING( aole_tabla.Cell( ll_fila, VMATRIZH_R ) ) ))
		//SA56970 - E00572 - Ceiba/reariase - 02-08-2017    -- FACL - Se comenta temporalmente
//		lds_TableReturn.setItem(ll_insert, 'Campo5',TRIM(STRING( aole_tabla.Cell( ll_fila, CANTIDAD ) ) ))
//		lds_TableReturn.setItem(ll_insert, 'Campo6',TRIM(STRING( aole_tabla.Cell( ll_fila, MATKL ) ) ))
//		lds_TableReturn.setItem(ll_insert, 'Campo7',TRIM(STRING( aole_tabla.Cell( ll_fila, WGBEZ ) ) ))
		//Fin SA56970
	Next
	
	RETURN lds_TableReturn
CATCH(Exception ex)
	Messagebox("A ocurrido una excepci$$HEX1$$f300$$ENDHEX$$n", "Fallo:" + ex.getmessage(), StopSign!)
CATCH( Throwable th)
	Messagebox("A ocurrido una excepci$$HEX1$$f300$$ENDHEX$$n", "Fallo:" + th.getmessage(), StopSign!)
End try
end function

public function integer of_ejecutar_rfc_sap (readonly string as_refer, readonly string as_talla, readonly string as_color);/********************************************************************
SA55583 Ceiba/jjmonsal - 06-12-2016 - E00572 - Muestra b$$HEX1$$e100$$ENDHEX$$sica - FunctionName: of_ejecutar_rfc_sap
<DESC> Description: funciones de Conexion con SAP </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Long								ll_return
Integer							li_cantidad_tables
Boolean							lb_function
String							ls_msn
str_parametros_conexion 	lstr_connection_params
OleObject						lole_tabla, lole_tabla_ret, lole_Funcion
n_cst_rfc_sap					lnvo_rfc

TRY
lnvo_rfc = Create n_cst_rfc_sap
lb_function = False

//Leer los parametros del archivo de configuracion 
THIS.of_leerVarArchivoConfiguracion(lstr_connection_params)

// Asignar a la estructura de instancia de la RFC SAP
lnvo_rfc.of_asignar_parametros_conexion( lstr_connection_params )

//Se conecta con SAP
ll_return = lnvo_rfc.Of_Conectar_Sap( )
If ll_return < 0 Then
	Destroy lnvo_rfc
	Return -1
End If

//Se asocia el ole con la rfc de la solped
If lnvo_rfc.of_asociar_funcion_sap( 'Z_PP_OP_SINFIJAR_X_MATERIAL', lole_Funcion ) < 0 Then
	lnvo_rfc.Of_Desconectar_SAP()
	Destroy lnvo_rfc
	Return -1
End If

// La propiedad Tables en la posicion 2 recibe los parametros de ejecucion
lole_tabla  = lole_Funcion.tables('I_TI_DATOS')
li_cantidad_tables = lole_Funcion.tables.Count

// se realiza el llenado del parametro table
ll_return = This.Of_LLenar_Table( lole_tabla, as_refer, as_talla, as_color )

If ll_return < 0 Then
	lnvo_rfc.Of_Desconectar_SAP()
	Destroy lnvo_rfc
	Return -1
End If

// Llama la RFC
lb_function = lole_Funcion.Call

IF NOT lb_function THEN 
	If IsValid( lole_funcion.EXCEPTION ) Then ls_msn = lole_funcion.EXCEPTION 
	ls_msn += '- Ocurri$$HEX2$$f3002000$$ENDHEX$$un error inesperado al ejecutar rfc sap'
	Messagebox("Error",ls_msn)
	RETURN -1	
END IF

// En condiciones normales retorna 2 estructuras, como m$$HEX1$$ed00$$ENDHEX$$nimo una, de lo
// contrario es un error.
IF li_cantidad_tables < 1 THEN
	ROLLBACK;
	MessageBox('Atencion','Ocurri$$HEX2$$f3002000$$ENDHEX$$un error inesperado al invocar la RFC de necesidades en produccion SAP!')
	lnvo_rfc.Of_Desconectar_SAP()
	Destroy lnvo_rfc
	RETURN -1
END IF

lole_tabla_ret  = lole_Funcion.Tables('E_TI_DATOS')

ll_return = THIS.of_ProcesarDatosRetornadosSap(This.of_Cargar_Table( lole_tabla_ret ))

// se desconecta la transaccion
If lnvo_rfc.Of_Desconectar_SAP() < 0 Then
	Destroy lnvo_rfc
	Return -1
End If

Destroy lnvo_rfc

IF ll_return >= 0 THEN 
	RETURN ll_return
ELSE 
	RETURN -1 
END IF 
CATCH(Exception ex)
	Messagebox("A ocurrido una excepci$$HEX1$$f300$$ENDHEX$$n", "Fallo:" + ex.getmessage(), StopSign!)
	RETURN -1 
CATCH( Throwable th)
	Messagebox("A ocurrido una excepci$$HEX1$$f300$$ENDHEX$$n", "Fallo:" + th.getmessage(), StopSign!)
	RETURN -1 
End try
end function

public function long of_procesardatosretornadossap (uo_dsbase ads_tablereturn);/********************************************************************
SA55583 Ceiba/jjmonsal - 06-12-2016 - E00572 - Muestra b$$HEX1$$e100$$ENDHEX$$sica - FunctionName: of_ProcesarDatosRetornadosSap
<DESC> Description: procesar enviado a sap </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
long ll_found
TRY
	ll_found = ads_TableReturn.Find(" Campo2 <> '' ", 1 ,ads_TableReturn.RowCount())
	IF ll_found > 0 THEN 
		//Solo se tiene en cuenta los datos que no tienen vacio campo 2 para la fusion con los datos de SAP 
		THIS.of_setDsDatosSap(ads_TableReturn)
		RETURN 2
	ELSE 
		RETURN 0
	END IF 
CATCH(Exception ex)
	Messagebox("A ocurrido una excepci$$HEX1$$f300$$ENDHEX$$n", "Fallo:" + ex.getmessage(), StopSign!)
	RETURN -1
CATCH( Throwable th)
	Messagebox("A ocurrido una excepci$$HEX1$$f300$$ENDHEX$$n", "Fallo:" + th.getmessage(), StopSign!)
	RETURN -1
End try
end function

public subroutine of_setdsdatossap (uo_dsbase ads_tablereturn);/********************************************************************
SA55583 Ceiba/jjmonsal - 06-12-2016 - E00572 - Muestra b$$HEX1$$e100$$ENDHEX$$sica - FunctionName: of_setDsDatosSap
<DESC> Description: procesar enviado a sap </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
long ll_iniAddCampo
Exception ex
TRY
	ex = create Exception
	ll_iniAddCampo = 1
	IF ids_DatosPROCESADOSSAP.rowcount() > 0 THEN 
		ll_iniAddCampo = ids_DatosPROCESADOSSAP.rowcount()
	END IF 
	IF ads_TableReturn.RowCount() > 0 THEN 
		IF ads_TableReturn.RowsCopy(1,ads_TableReturn.RowCount(), Primary!, ids_DatosPROCESADOSSAP, ll_iniAddCampo, Primary!) < 0 THEN 
			ex.setmessage('Fallo copiado de datos para la fusion con SIS')
			THROW ex
		END IF 
	END IF 
CATCH(Exception exc)
	Throw exc
CATCH( Throwable th)
	Throw (th)
End try
end subroutine

public function uo_dsbase of_getdsdatossap ();/********************************************************************
SA55583 Ceiba/jjmonsal - 06-12-2016 - E00572 - Muestra b$$HEX1$$e100$$ENDHEX$$sica - FunctionName: of_getDsDatosSap
<DESC> Description: retornar datos para fusion con datos SIS </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
TRY
	RETURN ids_DatosPROCESADOSSAP
CATCH(Exception exc)
	Throw exc
CATCH( Throwable th)
	Throw (th)
End try
end function

on n_cst_llamado_sap.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_llamado_sap.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;/***********************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016
Comentario: REPORTE POR MODIFICACI$$HEX1$$d300$$ENDHEX$$N EN FICHAS DE MATERIA PRIM
***********************************************************/
ids_DatosPROCESADOSSAP = create uo_dsbase
ids_DatosPROCESADOSSAP.Dataobject= 'd_ex_gr_validarnecesidadenpdn'
ids_DatosPROCESADOSSAP.SetTransobject(n_cst_application.itr_appl)
end event

event destructor;IF ISVALID(ids_DatosPROCESADOSSAP)THEN 
	DESTROY(ids_DatosPROCESADOSSAP)
END IF 
end event

