HA$PBExportHeader$a_muestras.sra
$PBExportComments$Objeto aplicacion
forward
global type a_muestras from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
s_base_parametros lstr_parametros
string gs_usuario, gs_instancia
integer gi_tipo_asig, gi_fabrica, sw_rep
string gs_color_enable, gs_color_disable

transaction db_adminis 
end variables

global type a_muestras from application
string appname = "a_muestras"
end type
global a_muestras a_muestras

on a_muestras.create
appname="a_muestras"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on a_muestras.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;//La aplicaci$$HEX1$$f300$$ENDHEX$$n delega el comportamiento a n_cst_application 
//heredada de n_cst_application_base

n_cst_application = Create n_cst_application 

If IsValid(n_cst_application) Then
	n_cst_application.Event ue_open()
	//n_cst_application.of_load_ids()
End If
If IsValid(w_application) Then
	gs_usuario = n_cst_application.is_user
	
	w_application.Title = "Muestras de Exportaci$$HEX1$$f300$$ENDHEX$$n y Nacional [Fab "+String(n_cst_application.ii_fabrica)+"]"
	
	/********************************************************************************************
	SA-57749
	Comentario:	Se adiciono al titulo de aplicativo; servidor, base de datos, usuario y nombre de usuario
	para poder identificar exactamente si se esta corriendo en desarrollo o produccion y como es que 
	carga los permisos y maneja la seguridad del aplicativo.
	Se recomienda cambiar este manejo de seguridad por que es poco amigable para entender y
	esta causando conflictos para poder hacer cualquier prueba de aplicacion. JCMR 17-11-2017
	*********************************************************************************************/
	w_application.Title = w_application.Title + "      ["+trim(mid(n_cst_application.itr_appl.servername,Pos(n_cst_application.itr_appl.servername,'@') + 1)) &
								+	" : " + trim(n_cst_application.itr_appl.database) + "]    " + n_cst_application.itr_appl.userid+" --> " + n_cst_application.inv_seguridad.is_de_usuario 
	
	
	
	
	db_adminis = n_cst_application.itr_appl
	gi_fabrica = 2
	
	
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

