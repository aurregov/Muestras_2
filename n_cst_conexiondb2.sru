HA$PBExportHeader$n_cst_conexiondb2.sru
$PBExportComments$/***********************************************************~r~nSA55583 - Ceiba/jjmonsal - 21-09-2016~r~nComentario: Conexion a Ordenes DB2~r~n***********************************************************/
forward
global type n_cst_conexiondb2 from n_tr_application
end type
end forward

global type n_cst_conexiondb2 from n_tr_application
end type
global n_cst_conexiondb2 n_cst_conexiondb2

type variables
String				is_userConexionDb2		//Usuario de servicio para establecer la conexion con ORDENESDB2 bajo el Esquema Eficien
String				is_PassConexionDb2		//PassWord de servicio para establecer la conexion con ORDENESDB2 bajo el Esquema Eficien
end variables

forward prototypes
public subroutine of_cargarconstantes ()
public subroutine of_cargartransaccionaldb2 ()
public function n_tr_application of_gettransacciondb2 ()
public subroutine of_disconnecttransaccionaldb2 ()
end prototypes

public subroutine of_cargarconstantes ();/********************************************************************
SA55583 - Ceiba/jjmonsal - 21-09-2016 FunctionName: of_CargarConstantes
<DESC> Description Cargar Constantes </DESC> 
<RETURN> No aplica </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE>  cargar constantes  </USAGE>
********************************************************************/
Long			ll_res
n_cst_comun lo_comun
try	
	lo_comun.of_valorconstante( "USER_SVC_MUESTRASDB2", n_cst_application.itr_appl)
	is_userConexionDb2=String(lo_comun.of_getstring(1))
	
	lo_comun.of_valorconstante( "PASS_SVC_MUESTRASDB2", n_cst_application.itr_appl)
	is_PassConexionDb2=String(lo_comun.of_getstring(1))

Catch ( Throwable ex)
	Throw (ex)
End try
end subroutine

public subroutine of_cargartransaccionaldb2 ();/********************************************************************
SA55583 - Ceiba/jjmonsal - 21-09-2016 FunctionName: of_CargarTransaccionalDB2
<DESC> Description: Cargar transaccional de la BD OrdenesDB2 </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Obtener conexion a la BD OrdenesDB2 </USAGE>
********************************************************************/
String		ls_dbms, ls_database, ls_servername, &
				ls_lock, ls_DBParm, ls_dsn, ls_path
Exception	ex1
try
	ex1 = Create Exception
	//Crear una instancia de la transacci$$HEX1$$f300$$ENDHEX$$n BD OrdenesDB2 
	ls_path = n_cst_application.is_pathfileconf
	
	ls_dbms			= n_cst_application.of_GetProFile(ls_path, 'bd ordenesdb2', 'DBMS')
	ls_database		= n_cst_application.of_GetProFile(ls_path, 'bd ordenesdb2', 'DATABASE')
	ls_servername	= n_cst_application.of_GetProFile(ls_path, 'bd ordenesdb2', 'SERVERNAME')
	ls_lock			= n_cst_application.of_GetProFile(ls_path, 'bd ordenesdb2', 'LOCK')
	ls_DBParm		= n_cst_application.of_GetProFile(ls_path, 'bd ordenesdb2', 'DBPARM')		
	ls_dsn			= n_cst_application.of_GetProFile(ls_path, 'bd ordenesdb2', 'DSN')		
	
	IF Len(Trim(is_userConexionDb2)) = 0 or Len(Trim(is_PassConexionDb2)) = 0 THEN 
		THIS.of_cargarConstantes( )
	END IF 
	ls_DBParm = "ConnectString='DSN=" + TRIM(ls_dsn) + ";UID=" + is_userConexionDb2 + ";PWD="+ is_PassConexionDb2 + "'," + ls_DBParm
	
	//Esta invocacion se realiza del ancestro
	If THIS.of_connect_db2(ls_dbms, ls_database, is_userConexionDb2, is_PassConexionDb2, &
											 ls_servername, ls_lock, ls_DBParm) <> 0 Then
		//ex1.setmessage("Error al tratar de establecer la conexi$$HEX1$$f300$$ENDHEX$$n con la Base de datos ORDENESDB2.")
		ex1.setmessage("Error al tratar de establecer la conexi$$HEX1$$f300$$ENDHEX$$n con la Base de datos " + ls_dsn )		
		Throw ex1
	END IF
CATCH(Exception ex)
	Throw ex
CATCH( Throwable th)
	Throw (th)
End try

end subroutine

public function n_tr_application of_gettransacciondb2 ();/********************************************************************
SA55583 - Ceiba/jjmonsal - 21-09-2016 FunctionName: of_getTransacciondb2
<DESC> Description getter Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> getter el dato requerido </USAGE>
********************************************************************/
try
	Return THIS
Catch ( Throwable ex)
	Throw (ex)
End try
end function

public subroutine of_disconnecttransaccionaldb2 ();/********************************************************************
SA55583 - Ceiba/jjmonsal - 21-09-2016 FunctionName: of_DisconnectTransaccionalDB2
<DESC> Description: Desconectar la transaccional de la BD ordenes db2  </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> desconectar conexion a la seguridad  </USAGE>
********************************************************************/
try
	IF IsValid(THIS) THEN 
		Disconnect using THIS;
	END IF 
CATCH(Exception ex)
	Throw ex
CATCH( Throwable th)
	Throw (th)
End try

end subroutine

on n_cst_conexiondb2.create
call super::create
end on

on n_cst_conexiondb2.destroy
call super::destroy
end on

