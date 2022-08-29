HA$PBExportHeader$n_tr_base.sru
$PBExportComments$Transaction base
forward
global type n_tr_base from transaction
end type
end forward

global type n_tr_base from transaction
end type
global n_tr_base n_tr_base

forward prototypes
public function integer of_disconnect ()
public function integer of_connectdb (string as_dbms, string as_database, string as_userid, string as_dbpass, string as_servername, string as_lock)
end prototypes

public function integer of_disconnect ();
If This.DbHandle() > 0 Then
	Disconnect Using This;
	If This.SqlCode <> 0 Then
		MessageBox("Desconexi$$HEX1$$f300$$ENDHEX$$n Base de Datos",&
			"No se pudo desconectar de la base de datos.~r~n"+&
			"C$$HEX1$$f300$$ENDHEX$$digo de error: "+String(This.SqlDbCode)+"~r~n"+&
			"Mensaje de error: "+String(This.SqlErrText),&
			StopSign!,Ok!,1)
	End If
	Return This.SqlCode
Else
	Return -1
End If


end function

public function integer of_connectdb (string as_dbms, string as_database, string as_userid, string as_dbpass, string as_servername, string as_lock);
This.DBMS       = as_DBMS
This.Database   = as_Database
This.UserId     = as_UserId
This.DBPass     = as_DBPass
This.ServerName = as_ServerName
This.AutoCommit = False
This.DBParm     = "CommitOnDisconnect='No',DisableBind=1" 
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

on n_tr_base.create
call transaction::create
TriggerEvent( this, "constructor" )
end on

on n_tr_base.destroy
call transaction::destroy
TriggerEvent( this, "destructor" )
end on

