HA$PBExportHeader$n_ds_base.sru
$PBExportComments$DataStore Base
forward
global type n_ds_base from datastore
end type
end forward

global type n_ds_base from datastore
end type
global n_ds_base n_ds_base

forward prototypes
public function integer of_conexion (n_tr_base atr_transaction, readonly boolean ab_live)
public subroutine of_load (string as_dataobject)
end prototypes

public function integer of_conexion (n_tr_base atr_transaction, readonly boolean ab_live);
If ab_live Then
	Return This.SetTransObject(atr_transaction)
Else
	Return This.SetTrans(atr_transaction)
End If
end function

public subroutine of_load (string as_dataobject);
This.DataObject = as_dataobject
end subroutine

on n_ds_base.create
call datastore::create
TriggerEvent( this, "constructor" )
end on

on n_ds_base.destroy
call datastore::destroy
TriggerEvent( this, "destructor" )
end on

event dberror;Integer li_response

Choose Case sqldbcode
	
	Case -268
		li_response = MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Se est$$HEX2$$e1002000$$ENDHEX$$tratando de ingresar un que registro que ya existe !."+Char(13)&
										+"Detalles: "+SQLErrText,Exclamation!) 
	
	Case -692
		li_response = MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Est$$HEX2$$e1002000$$ENDHEX$$tratando de eliminar un registro que ya es referenciado por otro archivo !."+Char(13)&
										+"Detalles: "+SQLErrText,Exclamation!)   

	Case Else
		li_response = MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Se ha producido un error !."+Char(13)&
										+"Detalles: "+SQLErrText,Exclamation!) 
	
End Choose 



end event

