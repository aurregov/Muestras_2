HA$PBExportHeader$n_tr_application.sru
$PBExportComments$Objeto transaccional al cual se le pueden agregar comportamientos espec$$HEX1$$ed00$$ENDHEX$$ficos para la aplicaci$$HEX1$$f300$$ENDHEX$$n
forward
global type n_tr_application from n_tr_base
end type
end forward

global type n_tr_application from n_tr_base
end type
global n_tr_application n_tr_application

forward prototypes
public function integer of_connect_db2 (string as_dbms, string as_database, string as_userid, string as_dbpass, string as_servername, string as_lock, string as_dbparm)
end prototypes

public function integer of_connect_db2 (string as_dbms, string as_database, string as_userid, string as_dbpass, string as_servername, string as_lock, string as_dbparm);This.DBMS       = as_DBMS
This.Database   = as_Database
This.UserId     = as_UserId
This.DBPass     = as_DBPass
This.ServerName = as_ServerName
This.AutoCommit = False
This.DBParm     = as_DBParm
This.Lock       = as_Lock

If This.DbHandle() > 0 Then
	Return -1
End If

Connect Using This;
If This.SqlCode <> 0 Then
	MessageBox("Conexi$$HEX1$$f300$$ENDHEX$$n Base de Datos",&
   	"No se pudo establecer una conexi$$HEX1$$f300$$ENDHEX$$n con la base de datos.~r~n~n"+&
		"C$$HEX1$$f300$$ENDHEX$$digo de error: "+String(This.SqlDbCode)+"~r~n"+&
		"Mensaje de error: "+String(This.SqlErrText),&
		StopSign!,Ok!,1)
End If
Return This.SqlCode
end function

on n_tr_application.create
call super::create
end on

on n_tr_application.destroy
call super::destroy
end on

