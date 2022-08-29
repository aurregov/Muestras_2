HA$PBExportHeader$n_cst_application.sru
$PBExportComments$Objeto No visual que tiene el comportamineto de un objeto aplicaci$$HEX1$$f300$$ENDHEX$$n heredado de n_cst_application_base. Este es el objeto espec$$HEX1$$ed00$$ENDHEX$$fico para la aplicacion se le pueden agregar otros m$$HEX1$$e900$$ENDHEX$$todos y propiedades
forward
global type n_cst_application from n_cst_application_base
end type
end forward

global type n_cst_application from n_cst_application_base
end type
global n_cst_application n_cst_application

type prototypes
FUNCTION boolean GetComputerNameA(ref string cname,ref long nbuf) LIBRARY "Kernel32.dll" alias for "GetComputerNameA;Ansi"

FUNCTION boolean GetUserNameA(ref string uname, ref ulong slength) LIBRARY "ADVAPI32.DLL" alias for "GetUserNameA;Ansi" 
end prototypes

type variables
Public:
           n_tr_application    itr_appl,itr_seguridad
      
			  String            is_workstation
			  String            is_application
			  Int               ii_fabrica
			  
long il_fabMue,il_lineaMue,il_muestra,&
     il_fabRef,il_lineaRef,il_referencia
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 24 de Septiembre de 2004.H:15:30
---------------------------------------------------
Adicion de variable de instancia
---------------------------------------------------*/
Public	Long	il_nu_orden, il_tipoprod
//-------------------------------------------------
Date id_build 
integer ii_cstv , ii_sw_clave	  

n_cst_security      inv_seguridad

n_ds_application  ids_verif_precedencia_new
end variables

forward prototypes
public function string of_usuario ()
protected function long of_logapplication ()
public function integer of_sql_error (transaction a_transaction)
public function integer of_controlversion (transaction atr_transaction)
public function integer of_load_ids ()
public function integer of_copiaprecedencias (n_ds_application a_ds)
public function integer of_verifiva_pbdk ()
public function long of_consecutive (integer an_fabrica, integer an_tipo, n_tr_base atr_transaction)
public function integer of_get_tipoprod_x_usuario ()
end prototypes

public function string of_usuario ();string  ls_username 
string  ls_var 
ulong  lu_val 
boolean rtn 
lu_val = 255 
ls_username = Space( 255 ) 
rtn = GetUserNameA(ls_username, lu_val) 

ls_username=Trim(ls_username)

Return ls_username

//Messagebox("GetUserNameA", "Username = " + string(ls_username)) 

end function

protected function long of_logapplication ();//Definir objeto tipo parametros log$$HEX1$$ed00$$ENDHEX$$n
n_cst_paramlogin  inv_paramlogin
String            ls_dbms,ls_database,ls_servername,ls_lock

inv_paramlogin.is_pathfile    = This.is_pathfileconf
inv_paramlogin.is_sessiondb   = This.is_sessiondbseg
inv_paramlogin.ii_application = This.ii_application
//Para determinar el usuario que se log$$HEX1$$ed00$$ENDHEX$$o la ultima vez
//////////////////////////////////////////////////////////////////////////
// coloco el usuario del sistema operativo por defecto
// 
//////////////////////////////////////////////////////////////////////////

inv_paramlogin.is_user        = of_usuario()//This.Of_GetProFile(This.is_pathfileconf,This.is_sessionapp,'USER')
//Determinar argumentos de conexi$$HEX1$$f300$$ENDHEX$$n
inv_paramlogin.is_dbms        = This.Of_GetProFile(is_pathfileconf,This.is_sessiondbseg,'DBMS')
inv_paramlogin.is_database    = This.Of_GetProFile(is_pathfileconf,This.is_sessiondbseg,'DATABASE')
inv_paramlogin.is_servername  = This.Of_GetProFile(is_pathfileconf,This.is_sessiondbseg,'SERVERNAME')
inv_paramlogin.is_lock        = This.Of_GetProFile(is_pathfileconf,This.is_sessiondbseg,'LOCK')
inv_paramlogin.itr_conexion   = This.itr_seguridad

OpenWithParm(w_login,inv_paramlogin)

inv_paramlogin = Message.PowerObjectParm

If IsValid(inv_paramlogin) And Not IsNull(inv_paramlogin) Then
	If inv_paramlogin.ib_sucessful Then
		This.is_user   = inv_paramlogin.is_user
		This.is_passwd = inv_paramlogin.is_password
		This.ii_perfil = inv_paramlogin.ii_perfil
		
	
		//S$$HEX2$$ed002000$$ENDHEX$$todo ha estado bien conectar ahora a la base de datos de la aplicaci$$HEX1$$f300$$ENDHEX$$n
		ls_dbms        = This.Of_GetProFile(is_pathfileconf,This.is_sessiondbapp,'DBMS')
		ls_database    = This.Of_GetProFile(is_pathfileconf,This.is_sessiondbapp,'DATABASE')
		ls_servername  = This.Of_GetProFile(is_pathfileconf,This.is_sessiondbapp,'SERVERNAME')
		ls_lock        = This.Of_GetProFile(is_pathfileconf,This.is_sessiondbapp,'LOCK')
		If This.itr_appl.of_ConnectDb(ls_dbms,&
											   ls_database,&
											   This.is_user,&
												This.is_passwd,&
											   ls_servername,&
											   ls_lock) = 0 Then
			//Escribir en el .ini el usuario actual
			This.Of_SetProFile(This.is_pathfileconf,This.is_sessionapp,'USER',This.is_user)
			Return 0
		End If	
	Else
		Return -1
	End If
Else
	Return -1
End If

Return -1
end function

public function integer of_sql_error (transaction a_transaction);String ls_SQL_err,ls_usuario
String ls_msg,ls_directorio

ls_directorio=GetCurrentDirectory()
ls_SQL_err = a_transaction.SQLErrText

Rollback Using a_transaction;

ls_msg = "Error de Base de Datos.~n"+&
			"Error : "+ls_SQL_err+"~n"+"Ubicaci$$HEX1$$f300$$ENDHEX$$n: "+&
			Error.WindowMenu+"/"+Error.Object+"/"+&
			Error.ObjectEvent+"/"+String(Error.Line)+"~nDatabase: "+&
			a_transaction.Database	+"~nServer: "+a_transaction.ServerName	+&
			"~n"

ls_usuario = ProfileString("procesop.ini", "correo_error","usuario", "jfvasduq")

/*Dbedocal 2018-05-11
n_ms_base lob_mail
lob_mail=create n_ms_base

lob_mail.of_sendmailoutlook(ls_usuario,'MUESTRAS SQL',ls_directorio+"~n"+ls_msg)

Destroy lob_mail
*/

uo_correo	lnv_correo
lnv_correo = CREATE uo_correo

TRY
	lnv_correo.of_enviar_correo('MUESTRAS SQL', ls_msg, 'correo_error')
CATCH(Exception ex)
	Messagebox("Error", ex.getmessage())
END TRY

DESTROY lnv_correo

MessageBox("Advertencia!", ls_msg, StopSign!)

Return 1
end function

public function integer of_controlversion (transaction atr_transaction);Date ld_fecha1
Int  li_cstv
String ls_critica
  
select construido,   
       contador,
		 critica
  into :ld_fecha1,   
       :li_cstv,
		 :ls_critica
  from version  
 where co_aplicacion = :n_cst_application.ii_application using atr_transaction ;
 
If atr_transaction.SqlCode <> 0 Then
	MessageBox("Advertencia!","No se pudo obtener la versi$$HEX1$$f300$$ENDHEX$$n de la aplicaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
	Return -1
End If

If ld_fecha1 > This.id_build Then
	MessageBox("Advertencia!","Usted no tiene la ultima versi$$HEX1$$f300$$ENDHEX$$n instalada del sistema, por favor actualice.",StopSign!)

	If ls_critica="S" Then
		Halt Close
	End If

	Return -1
ElseIf ld_fecha1 = This.id_build Then
	If ii_cstv < li_cstv Then
		MessageBox("Advertencia!","Usted no tiene la ultima versi$$HEX1$$f300$$ENDHEX$$n instalada del sistema, por favor actualice.",StopSign!)

		If ls_critica="S" Then
			Halt Close
		End If

		Return -1
	End If
End If

Return 1

end function

public function integer of_load_ids ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Jueves 28 de Abril de 2005 HORA 10:29:25:140
// 
// Carga los objetos datastore, en este caso el de precedencias, que es
// como el mas larguito en la programaci$$HEX1$$f300$$ENDHEX$$n, y el registro de ordenes
//////////////////////////////////////////////////////////////////////////
Long ll_retrieve

// FACL - 2018/01/26 - Para agilizar las pruebas en desarrollo
If Handle( GetApplication() ) = 0 Then Return 1

ids_verif_precedencia_new= CREATE n_ds_application

ids_verif_precedencia_new.of_load('d_verifica_precedencia_new')
ids_verif_precedencia_new.of_conexion(n_cst_application.itr_appl,True)


ll_retrieve = ids_verif_precedencia_new.Retrieve()
Choose Case ll_retrieve
	Case Is < 0
		MessageBox("Advertencia!","Error recuperando las precedencias nuevas de tareas.",StopSign!)
		Return -1
	Case 0
		MessageBox("Advertencia!","No se recuperaron precedencias nuevas, por favor verifique.",StopSign!)
End Choose



Return 1

end function

public function integer of_copiaprecedencias (n_ds_application a_ds);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Jueves 28 de Abril de 2005 HORA 10:40:36:218
// 
// Copia las precedencias, que se cargan al principio, para que no sea
// necesario cargarlas cada que se programa o cada que se registra o 
// cada que se hace el proceso de reacomodaci$$HEX1$$f300$$ENDHEX$$n.
//////////////////////////////////////////////////////////////////////////


a_ds.Reset()

ids_verif_precedencia_new.RowsCopy(&
1,ids_verif_precedencia_new.RowCount(),Primary!,a_ds,1,Primary!)

If a_ds.RowCount()<=0 Then
	Return -1
End If


Return 1
end function

public function integer of_verifiva_pbdk ();String ls_name

String ls_version

//ContextInformation ici_info
//
//Constant String ls_currver = "6.0.02"
//
//GetContextService("ContextInformation", ici_info)
//
//ici_info.GetVersionName(ls_version)
//
//Messagebox('Var','ls_version='+ls_version+'~n')
//
//IF ls_version <> ls_currver THEN
//
//        MessageBox("Error", &
//       "Must be at Version " + ls_currver)
//	Return -1
//END IF

Return 1
end function

public function long of_consecutive (integer an_fabrica, integer an_tipo, n_tr_base atr_transaction);Long ll_documento

//////////////////////////////////////////////////////////////////////////
// Coloco el update antes del select para evitar bloqueos
// 
//////////////////////////////////////////////////////////////////////////


update cf_consecutivos   
   set cs_documento = cs_documento + 1 
 where co_fabrica = :an_fabrica and
       id_documento = :an_tipo using atr_transaction ;
		 
If atr_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
End If
		 

select cs_documento  
  into :ll_documento  
  from cf_consecutivos  
 where co_fabrica = :an_fabrica and
       id_documento = :an_tipo using atr_transaction ;
		 
If atr_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
//SA56753 - Ceiba/reariase - 24-05-2017 
Else
	COMMIT USING atr_transaction;
//Fin SA56753
End If	

If atr_transaction.SqlCode = 100 Then
	Return -2
End If

//Messagebox('Var','ll_documento='+String(ll_documento)+'~n')

Return ll_documento


end function

public function integer of_get_tipoprod_x_usuario ();Long 			ll_rows, ll_row
DataStore 	lds_tipoprod 

lds_tipoprod = CREATE DataStore

lds_tipoprod.DataObject = 'd_tipo_producto_x_usuario'
lds_tipoprod.Settransobject(itr_appl)

/*
* ============================================================================
* MODIFICADO: Julio 27 de 2009 - ohlondon
* ----------------------------------------------------------------------------
* Inicializa el vector con lso tipos de producto que maneja el usuario que se
* conect$$HEX1$$f300$$ENDHEX$$.
* Para ello se usa la global lstr_parametros.entero[N]; ademas, si el usuario 
* solo maneja un tipo de producto se usa lstr_parametros.booleana[1] que dira
* TRUE si maneja varios o FALSE si es solo uno. 
* ============================================================================
*/	 

// Se recuperan los tipos de producto del usuario
ll_rows = lds_tipoprod.Retrieve(is_user)

IF ll_rows < 0 THEN RETURN -1

// Se llevan al vector
FOR ll_row = 1 to ll_rows 
	lstr_parametros.Entero[ll_row] = lds_tipoprod.GetItemNumber(ll_row, 'co_tipoprod')
NEXT

/*
SELECT DISTINCT co_tipoprod
 FROM m_usuario_tipoprod                          
WHERE co_usuario = :as_usuario                      
  
 */

CHOOSE CASE UpperBound(lstr_parametros.Entero) 
	CASE 0
		MessageBox("$$HEX1$$a100$$ENDHEX$$Advertencia!","Debe configurar los tipos de producto que maneja el usuario.",StopSign!)
		HALT CLOSE
	CASE 1
		lstr_parametros.booleana[1] = TRUE
	CASE ELSE
		lstr_parametros.booleana[1] = FALSE
END CHOOSE

Return 1

 
end function

on n_cst_application.create
call super::create
end on

on n_cst_application.destroy
call super::destroy
end on

event ue_close;
Destroy n_cst_application
end event

event ue_open;//////////////////////////////////////////////////////////////////////////
// Veriables para el control de la version
// se inicializan
//////////////////////////////////////////////////////////////////////////
id_build =date(2005,6,21)
ii_cstv=1


//Crear una instancia de la transacci$$HEX1$$f300$$ENDHEX$$n seguridad
This.itr_seguridad = Create n_tr_application 

//Crear una instancia de la transacci$$HEX1$$f300$$ENDHEX$$n applicaci$$HEX1$$f300$$ENDHEX$$n
This.itr_appl = Create n_tr_application 


If This.of_LogApplication() = 0 Then
	open(w_seleccion_fabrica)
	If Message.stringParm<>"OK" Then
		Halt Close
	End If

	If of_controlVersion(itr_appl)<>1 Then
		MessageBox("Advertencia!","Esta no es la $$HEX1$$fa00$$ENDHEX$$ltima versi$$HEX1$$f300$$ENDHEX$$n del sistema, esto puede causar errores serios.",StopSign!)
		MessageBox("Advertencia!","Por favor actualice el sistema. ~nEsta no es la $$HEX1$$fa00$$ENDHEX$$ltima versi$$HEX1$$f300$$ENDHEX$$n del sistema, esto puede causar errores serios.",StopSign!)
	End If

	of_verifiva_pbdk()
	//////////////////////////////////////////////////////////////////////////
	// Se verifica la seguridad de la aplicaci$$HEX1$$f300$$ENDHEX$$n.
	// 
	//////////////////////////////////////////////////////////////////////////			
	If inv_seguridad.of_iniciar(ii_application,is_user,itr_seguridad) = 1 Then
		Disconnect using itr_seguridad ;
		This.of_load_ids()
		Open(w_application)
	End If
End If
end event

event destructor;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 19 de Diciembre de 2002 HORA 11:12:23:656
// 
// se desconectan las bases de datos
//////////////////////////////////////////////////////////////////////////

disconnect using itr_appl ;
disconnect using itr_seguridad ;

Destroy itr_appl
Destroy itr_seguridad

end event

event constructor;call super::constructor;long   ll_buf = 25


/*Aqu$$HEX2$$ed002000$$ENDHEX$$deben definirsen las propiedades de la aplicaci$$HEX1$$f300$$ENDHEX$$n*/
is_pathfileconf = "proceso.ini" //Asignar el nombre del archivo.ini
is_sessiondbapp = "bd proceso" //Asignar el nombre de la session de la aplicaci$$HEX1$$f300$$ENDHEX$$n
is_sessiondbseg = "bd seguridad" //Asignar el nombre de la session de la seguridad
is_sessionapp   = "proceso" //Asignar el nombre de la session referente a la aplicaci$$HEX1$$f300$$ENDHEX$$n
is_pathpicture  = This.Of_GetProFile(is_pathfileconf,is_sessionapp,"PATHPICTURE")
ii_application  = Integer(This.Of_GetProFile(is_pathfileconf,is_sessionapp,"APPL"))
ib_audit        = True //Determina si se realiza auditoria sobre los dw que lo permitan
is_application  = GetApplication( ).ClassName ( )

//Asignaci$$HEX1$$f300$$ENDHEX$$n del nombre de la m$$HEX1$$e100$$ENDHEX$$quina
is_workstation  = Space(ll_buf)
GetComputerNameA(is_workstation,ll_buf)






end event

event ue_systemerror;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 15 de Enero de 2003 HORA 10:11:20:890
// 
// overwrite
//////////////////////////////////////////////////////////////////////////

String ls_message,ls_usuario

ls_message = 'Error Number '+String(Error.Number) & 
				+'.~r~nError Text = '+Error.Text &
				+'.~r~nWindow/Menu/Object = '+Error.WindowMenu &
				+'.~r~nError Object/Control = '+Error.Object &
				+'.~r~nScript = '+Error.ObjectEvent &
				+'.~r~nLine in Script = '+String(Error.Line) + '.'


/*Dbedocal 2018-05-11
ls_usuario=ProfileString("procesop.ini", "correo_error","usuario", "jfvasduq")

n_ms_base lo_mail
lo_mail=Create n_ms_base

lo_mail.of_sendmailoutlook(ls_usuario, "Error muestras",ls_message)
destroy n_ms_base		
*/

uo_correo	lnv_correo
lnv_correo = CREATE uo_correo

TRY
	lnv_correo.of_enviar_correo('Error muestras', ls_message, "correo_error")
CATCH(Exception ex)
	Messagebox("Error", ex.getmessage())
END TRY

DESTROY lnv_correo


super::event ue_systemerror()
end event

