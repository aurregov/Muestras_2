HA$PBExportHeader$w_cambio_estado_solicitud.srw
$PBExportComments$Para hacer el cambio del estado de las solicitudes
forward
global type w_cambio_estado_solicitud from w_response
end type
type cb_2 from commandbutton within w_cambio_estado_solicitud
end type
type cb_1 from commandbutton within w_cambio_estado_solicitud
end type
type dw_2 from u_dw_application within w_cambio_estado_solicitud
end type
type dw_1 from u_dw_application within w_cambio_estado_solicitud
end type
type gb_1 from groupbox within w_cambio_estado_solicitud
end type
type gb_2 from groupbox within w_cambio_estado_solicitud
end type
end forward

global type w_cambio_estado_solicitud from w_response
integer width = 3355
integer height = 1352
string title = "Estados de detalle de solicitud"
cb_2 cb_2
cb_1 cb_1
dw_2 dw_2
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_cambio_estado_solicitud w_cambio_estado_solicitud

type variables
n_cst_param io_param

end variables

on w_cambio_estado_solicitud.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.dw_2
this.Control[iCurrent+4]=this.dw_1
this.Control[iCurrent+5]=this.gb_1
this.Control[iCurrent+6]=this.gb_2
end on

on w_cambio_estado_solicitud.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;
io_param=Message.PowerObjectParm

dw_1.SetTransObject(n_cst_application.itr_appl)
dw_2.SetTransObject(n_cst_application.itr_appl)

dw_1.Retrieve(io_param.il_vector[1],&
              io_param.il_vector[2],&
				  io_param.is_vector[1],&
				  io_param.il_vector[3])
				  
dw_2.Retrieve(io_param.il_vector[1],&
              io_param.il_vector[2],&
				  io_param.is_vector[1],&
				  io_param.il_vector[3])
				  
dw_1.SetItem(1,"observaciones_cambio","")				 
				  

end event

type cb_2 from commandbutton within w_cambio_estado_solicitud
integer x = 2912
integer y = 144
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cambiar"
end type

event clicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 23 de Noviembre de 2002 HORA 10:48:45:625
// 
// Para cambiar el estado del detalle de la solicitud
// 
// - Se verifica que no sea el estado inicial
// - Se hace la advertencia pertinente
//////////////////////////////////////////////////////////////////////////


long ll_res,ll_est,ll_est_original
String ls_observaciones

If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If

ll_est_original=dw_1.GetItemNumber(1,"co_estado_sol",Primary!, TRUE)
ll_est=dw_1.GetItemNumber(1,"co_estado_sol")

If ll_est_original=ll_est then
	MessageBox("Advertencia!","El detalle de la muestra ya se encuentra en el estado seleccionado, por favor verifique.",StopSign!)
	Return
End If

ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Esta seguro que quiere cambiar el estado del detalle de la solicitud ?",Question!,YesNo!,2)
If ll_res=2 Then
	Return
End If

ls_observaciones=dw_1.GetItemString(1,"observaciones_cambio")
//////////////////////////////////////////////////////////////////////////
// Tomo la fecha y el usuario del servidor
// 
//////////////////////////////////////////////////////////////////////////
datetime ldt_fecha
String ls_usuario,ls_instancia
Date ld_fecha
If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If
ld_fecha=Date(ldt_fecha)
//////////////////////////////////////////////////////////////////////////
// Aca se debe cambiar el estado e insertar el nuevo registro
// 
//////////////////////////////////////////////////////////////////////////

  UPDATE dt_solicitudes  
     SET co_estado_sol = :ll_est  
   WHERE ( dt_solicitudes.co_fabrica =:io_param.il_vector[1] ) AND  
         ( dt_solicitudes.nu_solicitud = :io_param.il_vector[2] ) AND  
         ( dt_solicitudes.tipo_solicitud = :io_param.is_vector[1] ) AND  
         ( dt_solicitudes.cs_digitacion = :io_param.il_vector[3] )   
           using n_cst_application.itr_appl;

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If

  INSERT INTO dt_est_solicitudes  
         ( co_fabrica,   
           nu_solicitud,   
           tipo_solicitud,   
           cs_digitacion,   
           co_estado_sol,   
           fe_estado_sol,
			  obs_estado_sol)  
  VALUES ( :io_param.il_vector[1],   
           :io_param.il_vector[2],   
           :io_param.is_vector[1],   
           :io_param.il_vector[3],   
           :ll_est,   
           :ldt_fecha,
			  :ls_observaciones) using n_cst_application.itr_appl  ;

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If

Commit using n_cst_application.itr_appl ;

dw_2.Retrieve(io_param.il_vector[1], &
              io_param.il_vector[2], &
				  io_param.is_vector[1], &
				  io_param.il_vector[3])


			  


end event

type cb_1 from commandbutton within w_cambio_estado_solicitud
integer x = 1344
integer y = 1144
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(parent)
end event

type dw_2 from u_dw_application within w_cambio_estado_solicitud
integer x = 37
integer y = 432
integer width = 3209
integer height = 632
integer taborder = 20
string dataobject = "d_dt_est_solicitudes"
boolean hscrollbar = true
boolean livescroll = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 23 de Noviembre de 2002 HORA 11:50:51:390
// 
// overwrite
//////////////////////////////////////////////////////////////////////////

end event

type dw_1 from u_dw_application within w_cambio_estado_solicitud
integer x = 37
integer y = 68
integer width = 2843
integer height = 248
string dataobject = "d_dt_solicitudes_ex1_una"
boolean hscrollbar = true
boolean vscrollbar = false
boolean border = true
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 23 de Noviembre de 2002 HORA 11:50:35:359
// 
// overwrite
//////////////////////////////////////////////////////////////////////////

end event

type gb_1 from groupbox within w_cambio_estado_solicitud
integer x = 18
integer width = 3269
integer height = 352
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle de solicitud"
end type

type gb_2 from groupbox within w_cambio_estado_solicitud
integer x = 18
integer y = 368
integer width = 3259
integer height = 748
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estados "
end type

