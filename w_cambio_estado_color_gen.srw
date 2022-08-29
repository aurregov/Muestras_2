HA$PBExportHeader$w_cambio_estado_color_gen.srw
$PBExportComments$Para cambiar el estado de un color, se puede hacer para todas las tallas o todos los colores
forward
global type w_cambio_estado_color_gen from w_response
end type
type st_1 from statictext within w_cambio_estado_color_gen
end type
type dw_estados from u_dw_application within w_cambio_estado_color_gen
end type
type cb_recuperar from commandbutton within w_cambio_estado_color_gen
end type
type dw_colores from u_dw_application within w_cambio_estado_color_gen
end type
type cb_3 from commandbutton within w_cambio_estado_color_gen
end type
type cb_2 from commandbutton within w_cambio_estado_color_gen
end type
type cb_1 from commandbutton within w_cambio_estado_color_gen
end type
type dw_muestra from u_dw_application within w_cambio_estado_color_gen
end type
type dw_detalle from u_dw_application within w_cambio_estado_color_gen
end type
type gb_1 from groupbox within w_cambio_estado_color_gen
end type
type gb_2 from groupbox within w_cambio_estado_color_gen
end type
type gb_3 from groupbox within w_cambio_estado_color_gen
end type
type gb_4 from groupbox within w_cambio_estado_color_gen
end type
end forward

global type w_cambio_estado_color_gen from w_response
integer x = 0
integer y = 0
integer width = 3579
integer height = 2200
string title = "Estado de colores de solicitud"
st_1 st_1
dw_estados dw_estados
cb_recuperar cb_recuperar
dw_colores dw_colores
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_muestra dw_muestra
dw_detalle dw_detalle
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
end type
global w_cambio_estado_color_gen w_cambio_estado_color_gen

type variables

end variables

forward prototypes
public function integer of_detallaestado (long a_fabrica, long a_linea, long a_muestra, long a_talla, long a_color, long a_estado, string a_observacion)
end prototypes

public function integer of_detallaestado (long a_fabrica, long a_linea, long a_muestra, long a_talla, long a_color, long a_estado, string a_observacion);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 08 de Octubre de 2003 HORA 09:16:13:557
// 
// Ingresa el registro del detalle del cambio de estado, el la histora de 
// cambios de estado
//////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////
// Se determina el maximo consecutivo
// 
//////////////////////////////////////////////////////////////////////////
long ll_consecutivo

  SELECT max(consecutivo)  
    INTO :ll_consecutivo  
    FROM dt_est_col_mues  
   WHERE ( dt_est_col_mues.co_fabrica = :a_fabrica) AND  
         ( dt_est_col_mues.co_linea = :a_linea ) AND  
         ( dt_est_col_mues.co_muestra = :a_muestra ) AND  
         ( dt_est_col_mues.co_talla = :a_talla ) AND  
         ( dt_est_col_mues.co_color = :a_color) 
			using n_cst_application.itr_appl  ;
			
			
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

If IsNull(ll_consecutivo) Then 
	ll_consecutivo=0
End If

ll_consecutivo++

  INSERT INTO dt_est_col_mues  
         ( co_fabrica,   
           co_linea,   
           co_muestra,   
           co_talla,   
           co_color,   
           consecutivo,   
           co_estado,   
           observacion,   
           fe_creacion,   
           fe_actualizacion,   
           usuario,   
           instancia )  
  VALUES ( :a_fabrica,   
           :a_linea,   
           :a_muestra,   
           :a_talla,   
           :a_color,   
           :ll_consecutivo,   
           :a_estado,   
           :a_observacion,   
           current,   
           current,   
           USER,   
           DBSERVERNAME )  using n_cst_application.itr_appl  ;


If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

Return 1
end function

on w_cambio_estado_color_gen.create
int iCurrent
call super::create
this.st_1=create st_1
this.dw_estados=create dw_estados
this.cb_recuperar=create cb_recuperar
this.dw_colores=create dw_colores
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_muestra=create dw_muestra
this.dw_detalle=create dw_detalle
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.dw_estados
this.Control[iCurrent+3]=this.cb_recuperar
this.Control[iCurrent+4]=this.dw_colores
this.Control[iCurrent+5]=this.cb_3
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.dw_muestra
this.Control[iCurrent+9]=this.dw_detalle
this.Control[iCurrent+10]=this.gb_1
this.Control[iCurrent+11]=this.gb_2
this.Control[iCurrent+12]=this.gb_3
this.Control[iCurrent+13]=this.gb_4
end on

on w_cambio_estado_color_gen.destroy
call super::destroy
destroy(this.st_1)
destroy(this.dw_estados)
destroy(this.cb_recuperar)
destroy(this.dw_colores)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_muestra)
destroy(this.dw_detalle)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 15 de Septiembre de 2003 HORA 11:47:10:241
// 
// 
//////////////////////////////////////////////////////////////////////////
x=10
y=5

n_cst_param lo_param

long ll_res


lo_param=message.powerObjectParm

dw_muestra.SetTransObject(n_cst_application.itr_appl)
dw_colores.SetTransObject(n_cst_application.itr_appl)
dw_estados.SetTransObject(n_cst_application.itr_appl)
dw_detalle.SetTransObject(n_cst_application.itr_appl)

dw_estados.InsertRow(0)

dw_muestra.InsertRow(0)

If IsValid(lo_param) Then
	dw_muestra.SetItem(1,"co_fabrica",lo_param.il_vector[1])
	dw_muestra.SetItem(1,"co_linea",lo_param.il_vector[2])
	dw_muestra.SetItem(1,"co_muestra",lo_param.il_vector[3])
	//dw_muestra.SetItem(1,"co_talla",io_param.il_vector[4])
	//dw_muestra.SetItem(1,"co_color",io_param.il_vector[5])
End If


end event

type st_1 from statictext within w_cambio_estado_color_gen
integer x = 87
integer y = 992
integer width = 1755
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Haga dobleclick para ver el color, para ver la historia de los cambios de estado."
boolean focusrectangle = false
end type

type dw_estados from u_dw_application within w_cambio_estado_color_gen
integer x = 1541
integer y = 128
integer width = 1637
integer height = 156
integer taborder = 40
string dataobject = "d_ext_estado_observacion"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// overwrite!!
// 
//////////////////////////////////////////////////////////////////////////

end event

type cb_recuperar from commandbutton within w_cambio_estado_color_gen
integer x = 1216
integer y = 176
integer width = 261
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Recuperar"
end type

event clicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 07 de Octubre de 2003 HORA 17:54:15:765
// 
// para recuperar varias tallas-colores
//////////////////////////////////////////////////////////////////////////
long ll_talla,ll_color,ll_tot,ll_fabrica,ll_linea,ll_muestra,ll_cliente,ll_sucursal, &
     ll_solicitud

If dw_muestra.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If

ll_cliente=dw_muestra.getItemNumber(1,"co_cliente")

If IsNull(ll_cliente) Then
	ll_cliente=-1
End If

ll_sucursal=dw_muestra.getItemNumber(1,"co_sucursal")

If IsNull(ll_sucursal) Then
	ll_sucursal=-1
End If

ll_solicitud=dw_muestra.getItemNumber(1,"nu_solicitud")

If IsNull(ll_solicitud) Then
	ll_solicitud=-1
End If

ll_fabrica=dw_muestra.getItemNumber(1,"co_fabrica")

If IsNull(ll_fabrica) Then
	ll_fabrica=-1
End If

ll_linea=dw_muestra.getItemNumber(1,"co_linea")

If IsNull(ll_linea) Then
	ll_linea=-1
End If

ll_muestra=dw_muestra.getItemNumber(1,"co_muestra")

If IsNull(ll_muestra) Then
	ll_muestra=-1
End If

ll_talla=dw_muestra.getItemNumber(1,"co_talla")

If IsNull(ll_talla) Then
	ll_talla=-1
End If

ll_color=dw_muestra.getItemNumber(1,"co_color")

If IsNull(ll_color) Then
	ll_color=-1
End If

ll_tot=dw_colores.Retrieve(ll_fabrica,&
                    ll_linea,&
						  ll_muestra,&
						  ll_talla,&
						  ll_color,&
						  ll_cliente,&
						  ll_sucursal,&
						  ll_solicitud)
						  
						  
If ll_tot=0 Then
	MessageBox("Advertencia!","No se encontraron datos.",StopSign!)
	Return
End If


end event

type dw_colores from u_dw_application within w_cambio_estado_color_gen
integer x = 50
integer y = 460
integer width = 3438
integer height = 524
integer taborder = 30
string dataobject = "d_colores_todos_estado"
boolean border = true
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 08 de Octubre de 2003 HORA 14:52:22:076
// 
// Se muestra el detalle de los cambios de estados
//////////////////////////////////////////////////////////////////////////
long ll_talla, ll_color,ll_fabrica,ll_linea,ll_muestra

If row=0 Then
	Return
End If

ll_fabrica=GetItemNumber(row,"co_fabrica")
ll_linea=GetItemNumber(row,"co_linea")
ll_muestra=GetItemNumber(row,"co_muestra")

ll_talla=GetItemNumber(row,"co_talla")
ll_color=GetItemNumber(row,"co_color")


dw_detalle.Retrieve(ll_fabrica,&
                    ll_linea,&
						  ll_muestra,&
					     ll_talla,&
						  ll_color)

SelectRow(0,false)
SelectRow(row,True)
									


end event

event getfocus;//////////////////////////////////////////////////////////////////////////
// overwrite!
// 
//////////////////////////////////////////////////////////////////////////

end event

type cb_3 from commandbutton within w_cambio_estado_color_gen
integer x = 3186
integer y = 160
integer width = 329
integer height = 84
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
long ll_f,ll_estado,i,ll_tot,ll_estado1

String ls_observacion,ls_ctecnico

If dw_estados.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If

ll_estado=dw_estados.GetItemNumber(1,"co_estado")


If IsNull(ll_estado) Then
	MessageBox("Advertencia!","Estado no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
	Return
End If

ls_observacion=dw_estados.GetItemString(1,"observacion")
ls_ctecnico=dw_estados.GetItemString(1,"co_ctecnico")


ll_tot=dw_colores.RowCount()

For i=1 To ll_tot
	ll_estado1=dw_colores.GetItemNumber(i,"co_estado")
	If ll_estado<>ll_estado1 Then
		dw_colores.SetItem(i,"co_estado",ll_estado)
		dw_colores.SetItem(i,"de_observacion",ls_observacion)
		dw_colores.SetItem(i,"co_ctecnico",ls_ctecnico)
	End If	
Next

SetNull(ll_estado)

dw_estados.SetItem(1,"co_estado",ll_estado)
dw_estados.SetItem(1,"observacion","")





end event

type cb_2 from commandbutton within w_cambio_estado_color_gen
integer x = 1632
integer y = 1968
integer width = 443
integer height = 84
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

type cb_1 from commandbutton within w_cambio_estado_color_gen
integer x = 1179
integer y = 1968
integer width = 443
integer height = 84
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
long ll_f,ll_talla,ll_color,ll_fabrica,ll_linea,ll_muestra


If dw_colores.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If


//////////////////////////////////////////////////////////////////////////
// Actualizo la fecha en los que se hubieran cambiado
// 
//////////////////////////////////////////////////////////////////////////
DateTime ldt_fecha
String ls_usuario,ls_instancia,ls_ref_ant

//If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
//												 ldt_fecha,ls_usuario,ls_instancia) Then
//	Return -1
//End If

long 							i,ll_tot,ll_estado,ll_res
String 						ls_observacion,ls_ctecnico
n_cst_estado_muestra   	lo_estado

ll_tot=dw_colores.RowCount()


For i=1 To ll_tot
	If dw_colores.GetItemStatus(i,"co_estado",Primary!)=DataModified!	 Then
		dw_colores.SetItem(i,"fe_Estado",ldt_fecha)
		ll_talla=dw_colores.GetItemNumber(i,"co_talla")
		ll_color=dw_colores.GetItemNumber(i,"co_color")
		ll_estado=dw_colores.GetItemNumber(i,"co_estado")
		ls_observacion=dw_colores.GetItemString(i,"de_observacion")
		
		ll_fabrica =dw_colores.GetItemNumber(i,"co_fabrica")
		ll_linea   =dw_colores.GetItemNumber(i,"co_linea")
		ll_muestra =dw_colores.GetItemNumber(i,"co_muestra")
		
//		If of_detallaEstado(ll_fabrica, ll_linea, ll_muestra, ll_talla,ll_color,ll_estado,ls_observacion)<>1 Then
//			RollBack using n_cst_application.itr_appl ;
//			Return 
//		End If

		ls_ctecnico=dw_colores.GetItemString(i,"co_ctecnico")
		
		ll_res=lo_estado.of_mover(ll_fabrica /*long a_fabrica*/,&
		                          ll_linea/*long a_linea*/,&
										  ll_muestra/*long a_muestra*/,&
										  ll_talla/*long a_talla*/,&
										  ll_color/*long a_color*/,&
										  ll_estado/*long a_estado*/,&
										  ls_ctecnico/*string a_ctecnico*/,&
										  ls_observacion/*string a_observacion */)
										  
		If ll_res=-1 Then							 
			RollBack using n_cst_application.itr_appl ;
			dw_colores.SetRow(i)
			MessageBox("Advertencia!","El color "+String(ll_color)+&
			" No se puedo mover adecuadamente, por favor verifique fila "+String(i)+".",StopSign!)
			Return -1
		End If
	
		If ll_res=-2 Then							 
			RollBack using n_cst_application.itr_appl ;
			dw_colores.SetRow(i)
			MessageBox("Advertencia!","El funcionario "+&
			"No esta autorizado para el este movimiento, por favor verifique la fila "+&
			String(i)+".",StopSign!)
			Return -1
		End If	
		
		If ll_res=-3 Then							 
			RollBack using n_cst_application.itr_appl ;
			dw_colores.SetRow(i)
			MessageBox("Advertencia!","La muestra esta Rechazada y no se puede modificar en la fila "+&
			String(i)+".",StopSign!)
			Return -1
		End If	
		
		
	End If
Next

//If dw_colores.Update()<>1 Then
//	RollBack using n_cst_application.itr_appl ;
//	Return
//End If

Commit using n_cst_application.itr_appl ;

n_cst_param lo_param

lo_param.il_vector[1]=0

CloseWithReturn(Parent,lo_param)
end event

type dw_muestra from u_dw_application within w_cambio_estado_color_gen
integer x = 55
integer y = 72
integer width = 1152
integer height = 296
string dataobject = "d_ext_datos_estado"
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

type dw_detalle from u_dw_application within w_cambio_estado_color_gen
integer x = 59
integer y = 1136
integer width = 3429
integer height = 784
integer taborder = 0
string dataobject = "d_dt_est_col_mues"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 15 de Septiembre de 2003 HORA 12:11:24:944
// 
// overwrite!
//////////////////////////////////////////////////////////////////////////

end event

type gb_1 from groupbox within w_cambio_estado_color_gen
integer x = 23
integer y = 1080
integer width = 3515
integer height = 864
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

type gb_2 from groupbox within w_cambio_estado_color_gen
integer x = 23
integer y = 24
integer width = 1472
integer height = 368
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tallas y colores a seleccionar"
end type

type gb_3 from groupbox within w_cambio_estado_color_gen
integer x = 23
integer y = 408
integer width = 3520
integer height = 664
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Colores y estados"
end type

type gb_4 from groupbox within w_cambio_estado_color_gen
integer x = 1513
integer y = 24
integer width = 2034
integer height = 368
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cambiar estado/observacion a todos "
end type

