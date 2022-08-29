HA$PBExportHeader$n_cst_application_base.sru
$PBExportComments$Objeto No visual que tiene el comportamineto de un objeto aplicaci$$HEX1$$f300$$ENDHEX$$n Ya que PowerBuilder no permite heredar objetos applicaci$$HEX1$$f300$$ENDHEX$$n
forward
global type n_cst_application_base from nonvisualobject
end type
end forward

global type n_cst_application_base from nonvisualobject
event ue_open ( )
event ue_idle ( )
event ue_systemerror ( )
event ue_close ( )
event type connectprivilege ue_connectionbegin ( readonly string as_userid,  readonly string as_password,  readonly string as_connectstring )
event ue_connectionend ( readonly string as_userid,  readonly string as_password,  readonly string as_connectstring )
end type
global n_cst_application_base n_cst_application_base

type variables
Public:
           String           is_PathPicture
           String           is_PathFileConf
           String           is_User
           String           is_Passwd
           String           is_SessionDbSeg
           String           is_SessionDbApp
           String           is_SessionApp
           Int              ii_Application
           Int              ii_Perfil
			  Boolean          ib_audit 
			  String           is_InstanciaDbApp="CryDes01"

end variables

forward prototypes
public function integer of_setprofile (readonly string as_path, readonly string as_session, readonly string as_key, readonly string as_value)
public function string of_getprofile (readonly string as_path, readonly string as_session, readonly string as_key)
public function boolean of_selectserver (n_tr_base atr_transaction, ref datetime adt_fecha, ref string as_usuario, ref string as_instancia)
end prototypes

event ue_systemerror;String ls_message

ls_message = 'Error Number '+String(Error.Number) & 
				+'.~r~nError Text = '+Error.Text &
				+'.~r~nWindow/Menu/Object = '+Error.WindowMenu &
				+'.~r~nError Object/Control = '+Error.Object &
				+'.~r~nScript = '+Error.ObjectEvent &
				+'.~r~nLine in Script = '+String(Error.Line) + '.'
	
MessageBox("System Error",ls_message,StopSign!)	

Halt Close
end event

public function integer of_setprofile (readonly string as_path, readonly string as_session, readonly string as_key, readonly string as_value);
Return SetProfileString ( as_path, as_session, as_key, as_value )
end function

public function string of_getprofile (readonly string as_path, readonly string as_session, readonly string as_key);
Return ProfileString ( as_path, as_session, as_key, "" )
end function

public function boolean of_selectserver (n_tr_base atr_transaction, ref datetime adt_fecha, ref string as_usuario, ref string as_instancia);//Determinar l fecha,usuario,instancia en la base de datos 

n_ds_base lds_server

lds_server = Create n_ds_base

lds_server.of_Load('d_select_server')
If lds_server.of_Conexion(atr_transaction,True) <> 1 Then
	MessageBox("Error","Se ha producido un error estableciendo la conexi$$HEX1$$f300$$ENDHEX$$n con la base de datos !.",Exclamation!)
	Destroy lds_server
	Return False
End If

If lds_server.Retrieve() <= 0 Then
	MessageBox("Error","Se ha producido un error recuperando la fecha, usuario, e instancia de la base de datos !.",Exclamation!)
	Destroy lds_server
	Return False
End If

adt_fecha    = lds_server.GetItemDateTime(1,'fe_actualizacion')
gs_usuario   = lds_server.GetItemString(1,'usuario')
gs_instancia = lds_server.GetItemString(1,'instancia')

as_usuario   =  lds_server.GetItemString(1,'usuario')
as_instancia =  lds_server.GetItemString(1,'instancia')

Destroy lds_server

Return True


end function

on n_cst_application_base.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_application_base.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;
//Configuraci$$HEX1$$f300$$ENDHEX$$n global
GetApplication().DwMessageTitle     = "Validaci$$HEX1$$f300$$ENDHEX$$n"
GetApplication().MicroHelpDefault   = " "
GetApplication().ToolBarFrameTitle  = "Barra del Marco"
GetApplication().ToolBarSheetTitle  = "Barra de Hojas"
GetApplication().ToolbarPopMenuText	= 'Izquierda,Arriba,Derecha,Abajo,Flotante,Mostrar Textos,Mostrar Tips'
end event

