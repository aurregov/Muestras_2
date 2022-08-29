HA$PBExportHeader$ancestor.sra
$PBExportComments$Objeto aplicacion
forward
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type ancestor from application
 end type
global ancestor ancestor

on ancestor.create
appname = "ancestor"
message = create message
sqlca = create transaction
sqlda = create dynamicdescriptionarea
sqlsa = create dynamicstagingarea
error = create error
end on

on ancestor.destroy
destroy( sqlca )
destroy( sqlda )
destroy( sqlsa )
destroy( error )
destroy( message )
end on

event open;//La aplicaci$$HEX1$$f300$$ENDHEX$$n delega el comportamiento a n_cst_application 
//heredada de n_cst_application_base

n_cst_application = Create n_cst_application 

If IsValid(n_cst_application) Then
	n_cst_application.Event ue_open()
End If
end event

event close;
n_cst_application.Event ue_close()
end event

event idle;
n_cst_application.Event ue_idle()
end event

event systemerror;
n_cst_application.Event ue_systemerror()
end event

event connectionend;
n_cst_application.Event ue_connectionend(userid,password,connectstring)
end event

event connectionbegin;
Return n_cst_application.Event ue_connectionbegin(userid,password,connectstring)

end event

