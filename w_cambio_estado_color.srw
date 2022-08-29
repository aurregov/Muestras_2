HA$PBExportHeader$w_cambio_estado_color.srw
$PBExportComments$Para cambiar el estado de un color, inicialmete esto es manual la idea es hacerlo automatico
forward
global type w_cambio_estado_color from w_response
end type
type cb_3 from commandbutton within w_cambio_estado_color
end type
type cb_2 from commandbutton within w_cambio_estado_color
end type
type cb_1 from commandbutton within w_cambio_estado_color
end type
type dw_muestra from u_dw_application within w_cambio_estado_color
end type
type dw_detalle from u_dw_application within w_cambio_estado_color
end type
type gb_1 from groupbox within w_cambio_estado_color
end type
type gb_2 from groupbox within w_cambio_estado_color
end type
end forward

global type w_cambio_estado_color from w_response
integer x = 0
integer y = 0
integer width = 3319
integer height = 1548
string title = "Estado de color de solicitud"
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_muestra dw_muestra
dw_detalle dw_detalle
gb_1 gb_1
gb_2 gb_2
end type
global w_cambio_estado_color w_cambio_estado_color

type variables
n_cst_param io_param
end variables

on w_cambio_estado_color.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_muestra=create dw_muestra
this.dw_detalle=create dw_detalle
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.dw_muestra
this.Control[iCurrent+5]=this.dw_detalle
this.Control[iCurrent+6]=this.gb_1
this.Control[iCurrent+7]=this.gb_2
end on

on w_cambio_estado_color.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_muestra)
destroy(this.dw_detalle)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 15 de Septiembre de 2003 HORA 11:47:10:241
// 
// 
//////////////////////////////////////////////////////////////////////////


long ll_res


io_param=message.powerObjectParm

dw_muestra.SetTransObject(n_cst_application.itr_appl)

dw_muestra.InsertRow(0)

dw_muestra.SetItem(1,"co_fabrica",io_param.il_vector[1])
dw_muestra.SetItem(1,"co_linea",io_param.il_vector[2])
dw_muestra.SetItem(1,"co_muestra",io_param.il_vector[3])
dw_muestra.SetItem(1,"co_talla",io_param.il_vector[4])
dw_muestra.SetItem(1,"co_color",io_param.il_vector[5])

dw_muestra.SetItem(1,"de_muestra",io_param.is_vector[1])

dw_detalle.SetTransObject(n_cst_application.itr_appl)


ll_res=dw_detalle.Retrieve(io_param.il_vector[1],&
                           io_param.il_vector[2],&
									io_param.il_vector[3],&
									io_param.il_vector[4],&
									io_param.il_vector[5])


end event

type cb_3 from commandbutton within w_cambio_estado_color
integer x = 2930
integer y = 116
integer width = 270
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&ambiar"
end type

event clicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 15 de Septiembre de 2003 HORA 13:38:29:366
// 
// cambio el estado
//////////////////////////////////////////////////////////////////////////
long ll_f,ll_estado

String ls_observacion

If dw_muestra.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If

ll_estado=dw_muestra.GetItemNumber(1,"co_estado")

If IsNull(ll_estado) Then
	MessageBox("Advertencia!","Estado no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
	Return
End If

ls_observacion=dw_muestra.GetItemString(1,"observacion")


ll_f=dw_detalle.InsertRow(0)

dw_detalle.SetItem(ll_f,"co_fabrica",io_param.il_vector[1])
dw_detalle.SetItem(ll_f,"co_linea",io_param.il_vector[2])
dw_detalle.SetItem(ll_f,"co_muestra",io_param.il_vector[3])
dw_detalle.SetItem(ll_f,"co_talla",io_param.il_vector[4])
dw_detalle.SetItem(ll_f,"co_color",io_param.il_vector[5])
dw_detalle.SetItem(ll_f,"consecutivo",ll_f)
dw_detalle.SetItem(ll_f,"co_estado",ll_estado)
dw_detalle.SetItem(ll_f,"observacion",ls_observacion)

SetNull(ll_estado)

dw_muestra.SetItem(1,"co_estado",ll_estado)
dw_muestra.SetItem(1,"observacion","")





end event

type cb_2 from commandbutton within w_cambio_estado_color
integer x = 1632
integer y = 1272
integer width = 443
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
end type

event clicked;close(Parent)
end event

type cb_1 from commandbutton within w_cambio_estado_color
integer x = 1179
integer y = 1272
integer width = 443
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 15 de Septiembre de 2003 HORA 12:10:57:054
// 
// Retorna el ultimo estado, que es el actual, segun el planteamineto 
//////////////////////////////////////////////////////////////////////////
long ll_f


If dw_detalle.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If

If dw_detalle.Update()<>1 Then
	RollBack using n_cst_application.itr_appl ;
	Return
End If

Long ll_estado

ll_f=dw_detalle.RowCount()

ll_estado=dw_detalle.GetItemNumber(ll_f,"co_estado")

//////////////////////////////////////////////////////////////////////////
// Se cambia el valor del detalle en dt_muestras_col
// 
//////////////////////////////////////////////////////////////////////////

  UPDATE dt_muestras_col  
     SET co_estado = :ll_estado,
	      fe_estado = current
   WHERE ( dt_muestras_col.co_fabrica = :io_param.il_vector[1] ) AND  
         ( dt_muestras_col.co_linea = :io_param.il_vector[2]  ) AND  
         ( dt_muestras_col.co_muestra = :io_param.il_vector[3]  ) AND  
         ( dt_muestras_col.co_talla = :io_param.il_vector[4]  ) AND  
         ( dt_muestras_col.co_color = :io_param.il_vector[5]  )   
        Using n_cst_application.itr_appl ;
		  
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If
			  



Commit using n_cst_application.itr_appl ;



n_cst_param lo_param

lo_param.il_vector[1]=ll_estado

CloseWithReturn(Parent,lo_param)

end event

type dw_muestra from u_dw_application within w_cambio_estado_color
integer x = 37
integer y = 72
integer width = 2958
integer height = 156
string dataobject = "d_ext_muestra_color_estado"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 15 de Septiembre de 2003 HORA 12:11:38:882
// 
// overwrite!!
//////////////////////////////////////////////////////////////////////////

end event

type dw_detalle from u_dw_application within w_cambio_estado_color
integer x = 59
integer y = 324
integer width = 3031
integer height = 848
integer taborder = 0
string dataobject = "d_dt_est_col_mues"
boolean hscrollbar = true
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 15 de Septiembre de 2003 HORA 12:11:24:944
// 
// overwrite!
//////////////////////////////////////////////////////////////////////////

end event

type gb_1 from groupbox within w_cambio_estado_color
integer x = 23
integer y = 268
integer width = 3209
integer height = 932
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Procesos por los que ha pasado"
end type

type gb_2 from groupbox within w_cambio_estado_color
integer x = 23
integer y = 24
integer width = 3209
integer height = 240
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Muestra / Color"
end type

