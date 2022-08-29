HA$PBExportHeader$n_cst_rfc_sap.sru
forward
global type n_cst_rfc_sap from nonvisualobject
end type
end forward

global type n_cst_rfc_sap from nonvisualobject
end type
global n_cst_rfc_sap n_cst_rfc_sap

type variables
OleObject  	iole_ConexionSap
OleObject  	iole_conexion 
OLEObject	iole_rfc
str_parametros_conexion	istr_parametros_conexion

String 	is_mensaje

end variables

forward prototypes
public function integer of_conectar_transaccion ()
public function string of_obtener_mensaje ()
public subroutine of_desconectar_transaccion ()
public subroutine of_asignar_parametros_conexion (str_parametros_conexion astr_parametros_conexion)
public function oleobject of_obtener_conexion_sap ()
public function integer of_conectar_sap ()
public function integer of_asociar_funcion_sap (string as_funcion, ref oleobject aole_funcion)
public function integer of_desconectar_sap ()
public function integer of_leer_configuracion_conexion ()
end prototypes

public function integer of_conectar_transaccion ();//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_conectar_transaccion (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	Hace la conexion a SAP con los parametros configurados en la estructura
//					istr_parametros_conexion, por ejemplo para desarrollo seria:
//
//					istr_parametros_conexion.client[1]            = '120'
//					istr_parametros_conexion.user[1]              = "ydbetanc"
//					istr_parametros_conexion.password[1]          = "PIPO2014"
//					istr_parametros_conexion.language[1]          = "S"
//					istr_parametros_conexion.systemcode[1]        = 'D01'
//					istr_parametros_conexion.systemnumber[1]      = '00'
//					istr_parametros_conexion.applicationserver[1] = '10.130.20.29' 
//-------------------------------------------------------------------------
// ARGUMENTO:	(none)
// RETORNO	:	
//=========================================================================

Boolean  	lb_conectado = TRUE

// Crea la conexi$$HEX1$$f300$$ENDHEX$$n al objeto
IF Not IsValid(iole_conexion) Then
	iole_conexion = CREATE OLEObject
	iole_conexion = iole_ConexionSap.Connection()
End If

If Not IsValid(iole_conexion) Then
	MessageBox("La conexi$$HEX1$$f300$$ENDHEX$$n con SAP fall$$HEX1$$f300$$ENDHEX$$", "Enviado de la informaci$$HEX1$$f300$$ENDHEX$$n a SAP present$$HEX2$$f3002000$$ENDHEX$$error al realizar la comunicaci$$HEX1$$f300$$ENDHEX$$n con el Componente llamar a la mesa de ayuda opci$$HEX1$$f300$$ENDHEX$$n 1")
	RETURN -1
END IF

// Asigno las propiedades de conexi$$HEX1$$f300$$ENDHEX$$n configuradas en el m$$HEX1$$e900$$ENDHEX$$todo of_configurar_parametros_conexion
iole_conexion.Client            = istr_parametros_conexion.client[1]
iole_conexion.User              = istr_parametros_conexion.user[1]
iole_conexion.Password          = istr_parametros_conexion.password[1]
iole_conexion.Language          = istr_parametros_conexion.language[1]
iole_conexion.System            = istr_parametros_conexion.systemcode[1]
iole_conexion.SystemNumber      = istr_parametros_conexion.systemnumber[1]
iole_conexion.ApplicationServer = istr_parametros_conexion.applicationserver[1]

// Ahora Acceso (silenciosamente)	
lb_conectado = iole_conexion.logon(0, true)

// Si es exitoso
IF lb_conectado THEN
	is_mensaje =  "Conexi$$HEX1$$f300$$ENDHEX$$n con SAP exitosa."
ELSE
	// Sino, es porque fall$$HEX2$$f3002000$$ENDHEX$$algo en el acceso
	MessageBox("El acceso fall$$HEX1$$f300$$ENDHEX$$", "Enviado de la informaci$$HEX1$$f300$$ENDHEX$$n a SAP present$$HEX2$$f3002000$$ENDHEX$$error al realizar la comunicaci$$HEX1$$f300$$ENDHEX$$n con el Componente llamar a la mesa de ayuda opci$$HEX1$$f300$$ENDHEX$$n 1")
	is_mensaje = "Enviado de la informaci$$HEX1$$f300$$ENDHEX$$n a SAP present$$HEX2$$f3002000$$ENDHEX$$error al realizar la comunicaci$$HEX1$$f300$$ENDHEX$$n con el Componente "
	IF IsValid(iole_ConexionSap) THEN DESTROY iole_ConexionSap
	IF IsValid(iole_conexion) THEN DESTROY iole_conexion
	RETURN -1
End If
/*
* para verifica conexi$$HEX1$$f300$$ENDHEX$$n
LONG li_estado

li_estado = iole_conexion.IsConnected()
*/
Return 1

end function

public function string of_obtener_mensaje ();// Retorna el mensaje actual
RETURN Trim(is_mensaje)
end function

public subroutine of_desconectar_transaccion ();// Se hace la desconexion de Sap de los objetos 
iole_ConexionSap.Logoff()
 

end subroutine

public subroutine of_asignar_parametros_conexion (str_parametros_conexion astr_parametros_conexion);//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_asignar_parametros_conexion (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	
//-------------------------------------------------------------------------
// ARGUMENTO:	str_parametros_conexion astr_parametros_conexion 
// CONTENIDO:	Recibe los siguientes datos:
//					String		applicationserver
//					Boolean		autoLogon
//					String		client
//					String		destination 
//					String		language
//					String		password
//					String		systemcode
//					String		systemNumber 
//					String		user
//=========================================================================
	
istr_parametros_conexion = astr_parametros_conexion
end subroutine

public function oleobject of_obtener_conexion_sap ();//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_obtener_conexion_sap (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	se obtiene el ole para la conexion a SAP
//-------------------------------------------------------------------------
// ARGUMENTO:	(none)
// RETORNO	:	
//=========================================================================

RETURN iole_ConexionSap
end function

public function integer of_conectar_sap ();//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_conectar_sap (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// ARGUMENTO:	(none)
// RETORNO	:	
//=========================================================================

Integer li_ret

// Crea la conexi$$HEX1$$f300$$ENDHEX$$n al objeto
IF Not IsValid(iole_conexion) Then
	//	Se crea el objeto utilizado para la conexion con SAP
	iole_conexion = Create OLEObject
End If

li_ret = iole_conexion.ConnectToNewObject( 'SAP.BAPI.1' )
If li_ret = -2 Then
	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","El Objeto para la conexi$$HEX1$$f300$$ENDHEX$$n con SAP no existe")
	Return -1
ElseIf li_ret < 0 Then
	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Error al crear el Objeto de conexi$$HEX1$$f300$$ENDHEX$$n SAP")
	Return -1
End IF

// Asigno las propiedades de conexi$$HEX1$$f300$$ENDHEX$$n configuradas en el m$$HEX1$$e900$$ENDHEX$$todo of_configurar_parametros_conexion
iole_conexion.Connection.Client            = istr_parametros_conexion.client[1]
iole_conexion.Connection.User              = istr_parametros_conexion.user[1]
iole_conexion.Connection.Password          = istr_parametros_conexion.password[1]
iole_conexion.Connection.Language          = istr_parametros_conexion.language[1]
iole_conexion.Connection.System            = istr_parametros_conexion.systemcode[1]
iole_conexion.Connection.SystemNumber      = istr_parametros_conexion.systemnumber[1]
iole_conexion.Connection.ApplicationServer = istr_parametros_conexion.applicationserver[1]

// Evita que aparezca la ventana de Logon de SAP
iole_conexion.Connection.Logon( 0, True )

//	Establece la conexi$$HEX1$$f300$$ENDHEX$$n
li_ret = iole_conexion.Connection.IsConnected()


//	Se crea el objeto utilizado para tomar la referencia a la funcion RFC de SAP
iole_rfc = Create OleObject
li_ret = iole_rfc.ConnectToNewObject( 'SAP.Functions' )

If li_ret = -2 Then
	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","El Objeto para llamar a la RFC de SAP no existe")
	Return -1
ElseIf li_ret < 0 Then
	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Error al crear el Objeto para hacer el llamado a la RFC de SAP")
	Return -1
End IF

// se usa la conexion echa con el ole de la funcion
iole_rfc.Connection = iole_conexion.Connection


Return li_ret

end function

public function integer of_asociar_funcion_sap (string as_funcion, ref oleobject aole_funcion);Long			ll_filas, ll_fila, li_cantidad_tables
OleObject	lole_tabla, iole_Funcion
STring is_nombre_transaccion

TRY
	// Obtengo una instancia de la funcion de SAP as_funcion 
	aole_funcion = This.iole_rfc.Add(as_funcion)
	
CATCH (runtimeerror er)
    MessageBox('Atencion', "No existe la transacci$$HEX1$$f300$$ENDHEX$$n "+ as_funcion +&
	 				  " para la conexi$$HEX1$$f300$$ENDHEX$$n que est$$HEX2$$e1002000$$ENDHEX$$utilizando.~r~n~r~n"+&
					  er.getmessage() )
	 RETURN -1
END TRY

Return 1
end function

public function integer of_desconectar_sap ();
//	Se desconecta del servidor SAP
iole_conexion.Connection.Logoff()

Return 1
end function

public function integer of_leer_configuracion_conexion ();/*
	FACL - 2017/10/13 - SA57405 - Funcion para leer los parametros de conexion desde el archivo de configuracion
*/
String							ls_path

ls_path 						= n_cst_application.is_pathfileconf

istr_parametros_conexion.client[1]            = n_cst_application.Of_GetProFile(ls_path,'bd proceso','client')
istr_parametros_conexion.user[1]              = n_cst_application.Of_GetProFile(ls_path,'bd proceso','user')	
istr_parametros_conexion.password[1]          = n_cst_application.Of_GetProFile(ls_path,'bd proceso','password')	
istr_parametros_conexion.language[1]          = n_cst_application.Of_GetProFile(ls_path,'bd proceso','language')
istr_parametros_conexion.systemcode[1]        = n_cst_application.Of_GetProFile(ls_path,'bd proceso','systemcode')
istr_parametros_conexion.systemnumber[1]      = n_cst_application.Of_GetProFile(ls_path,'bd proceso','systemnumber')
istr_parametros_conexion.applicationserver[1] = n_cst_application.Of_GetProFile(ls_path,'bd proceso','applicationserver')

Return 1
end function

on n_cst_rfc_sap.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_rfc_sap.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;/*
*----------------------------------------------------------------------*
* Informaci$$HEX1$$f300$$ENDHEX$$n General
*----------------------------------------------------------------------*
* Descripci$$HEX1$$f300$$ENDHEX$$n  : Objeto para la conexi$$HEX1$$f300$$ENDHEX$$n con el ambiente de SAP
* Autor        : Oscar Hern$$HEX1$$e100$$ENDHEX$$n Londo$$HEX1$$f100$$ENDHEX$$o Ospina
* Fecha Creac. : 09.09.2011
*----------------------------------------------------------------------*
*/

Long	ll_retorno

// Crea el objeto para la Conexi$$HEX1$$f300$$ENDHEX$$n con Sap 
iole_ConexionSap = Create OLEObject
// Se conecta
ll_retorno = iole_ConexionSap.ConnectToNewObject("sap.functions")

/*
Retorna 0 si es exitosa y uno de los siguientes valores negativos si ocurre
algun error:

-1  Invalid Call: the argument is the Object property of a control
-2  Class name not found
-3  Object could not be created
-4  Could not connect to object
-9  Other error
-15  MTS is not loaded on this computer
-16  Invalid Call: this function not applicable

Si alguno de los valores de los argumentos es nulo, ConnectToNewObject retorna nulo.
*/
CHOOSE CASE ll_retorno
	CASE -1
		is_mensaje = 'Invalid Call: the argument is the Object property of a control'
	CASE -2
		is_mensaje = 'Class name not found'
	CASE -3
		is_mensaje = 'Object could not be created'
	CASE -4
		is_mensaje = 'Could not connect to object'
	CASE -9
		is_mensaje = 'Other error'
	CASE -15
		is_mensaje = 'MTS is not loaded on this computer'
	CASE -16
		is_mensaje = 'Invalid Call: this function not applicable'
END CHOOSE

IF ll_retorno < 0 THEN return ll_retorno 



end event

