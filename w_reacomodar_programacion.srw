HA$PBExportHeader$w_reacomodar_programacion.srw
$PBExportComments$Obj.Ventana en la que se consulta la lista de $$HEX1$$f300$$ENDHEX$$rdenes que se est$$HEX1$$e100$$ENDHEX$$n procesando y las cuales son susceptibles de ser movidas por la reacomodaci$$HEX1$$f300$$ENDHEX$$n de prioridades.Se despliega la lista y se selecciona opci$$HEX1$$f300$$ENDHEX$$n donde se procesan + muestran con nuevo orden pr$$HEX3$$4441542a0052$$ENDHEX$$
forward
global type w_reacomodar_programacion from w_sheet
end type
type pb_refresh from picturebutton within w_reacomodar_programacion
end type
type cbx_all from checkbox within w_reacomodar_programacion
end type
type dw_tipoprod from datawindow within w_reacomodar_programacion
end type
type cb_cancelar from u_cb_application within w_reacomodar_programacion
end type
type mle_1 from multilineedit within w_reacomodar_programacion
end type
type cb_2 from u_cb_application within w_reacomodar_programacion
end type
type cb_1 from u_cb_application within w_reacomodar_programacion
end type
type cb_reacomodar from u_cb_application within w_reacomodar_programacion
end type
type dw_ordenes from u_dw_application within w_reacomodar_programacion
end type
type gb_orden from u_gb_base within w_reacomodar_programacion
end type
end forward

global type w_reacomodar_programacion from w_sheet
integer width = 2528
integer height = 1892
string title = "Reacomodar programaci$$HEX1$$f300$$ENDHEX$$n de $$HEX1$$f300$$ENDHEX$$rdenes"
string menuname = "m_reacomodar_programacion"
pb_refresh pb_refresh
cbx_all cbx_all
dw_tipoprod dw_tipoprod
cb_cancelar cb_cancelar
mle_1 mle_1
cb_2 cb_2
cb_1 cb_1
cb_reacomodar cb_reacomodar
dw_ordenes dw_ordenes
gb_orden gb_orden
end type
global w_reacomodar_programacion w_reacomodar_programacion

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 21 de Diciembre de 2004.H:17:06
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
PRIVATE:
	n_cst_param 						iou_param 
	n_cst_comun_orden 				iou_comun 
	n_cst_reacomodar_programacion iuo_readjust //Objeto de la programaci$$HEX1$$f300$$ENDHEX$$n
	Long il_nu_orden, il_tipoprod
	Boolean ib_cambios,ib_save,ib_cancelar
	DateTime idtm_fechahora_actual
	n_cst_programacion_ordenes iuo_programacion 
 
	
end variables

forward prototypes
public function integer of_carga_objtr ()
public function integer of_reset ()
public function integer of_redraw (boolean ab_redrawing)
public function long of_buscar ()
public function integer of_reacomodar ()
public function string of_tiempo (long a_tiempo)
public function integer of_desprogramar ()
end prototypes

public function integer of_carga_objtr ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 21 de Diciembre de 2004.H:14:48
---------------------------------------------------
Carga los obj. de transacci$$HEX1$$f300$$ENDHEX$$n
---------------------------------------------------*/
Long ll_res
//---------------------------------------------------*/
IF IsNull(il_tipoprod) THEN
	MessageBox('Advertencia','Debe seleccionar primero el Tipo de Producto',StopSign!)
	dw_tipoprod.SetColumn('co_tipoprod')
	dw_tipoprod.SetFocus()
	Return -1
END IF
mle_1.text = ''
dw_ordenes.of_conexion(n_cst_application.itr_appl,True)
ll_res = dw_ordenes.Retrieve(il_tipoprod)

Choose Case ll_res
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando la informaci$$HEX1$$f300$$ENDHEX$$n de las $$HEX1$$f300$$ENDHEX$$rdenes para la reacomodaci$$HEX1$$f300$$ENDHEX$$n de programaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
		cb_reacomodar.Enabled = FALSE
		cbx_all.Enabled       = FALSE
		Return -1
	Case 0
		MessageBox("Advertencia!","No se han encontrado informaci$$HEX1$$f300$$ENDHEX$$n de $$HEX1$$f300$$ENDHEX$$rdenes en proceso para la reacomodaci$$HEX1$$f300$$ENDHEX$$n de programaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)	
		cb_reacomodar.Enabled = FALSE
		cbx_all.Enabled       = FALSE
		Return -1
End Choose
cb_reacomodar.Enabled = TRUE
cbx_all.Enabled       = TRUE
cbx_all.Checked       = TRUE
//------------------------------------------------
Return 1
end function

public function integer of_reset ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 29 de Septiembre de 2004.H:15:49
---------------------------------------------------
---------------------------------------------------*/
dw_ordenes.Reset()
//dw_tareas_gantt.Reset()
//---------------------------------------------------
Return 1
end function

public function integer of_redraw (boolean ab_redrawing);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 22 de Septiembre de 2004.H:15:47
---------------------------------------------------
---------------------------------------------------*/
dw_ordenes.SetRedraw(ab_redrawing)
//dw_tareas_gantt.SetRedraw(ab_redrawing)
//---------------------------------------------------
Return 1
end function

public function long of_buscar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 22 de Septiembre de 2004.H:17:05
//---------------------------------------------------
	Buscar las ordenes almacenadas
//---------------------------------------------------*/
Long ll_resultado,ll_i
String ls_tipo_muestra,ls_co_ctecnico,ls_msj
//-------------------------------------------------------------------------------------------------
If dw_ordenes.RowCount()>0 Then
			of_Reset()
End If
////-------------------------------------------------------------------------------------------------
Return 1
end function

public function integer of_reacomodar ();/*-------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n para reacomodar las $$HEX1$$f300$$ENDHEX$$rdenes seg$$HEX1$$fa00$$ENDHEX$$n la prioridad
---------------------------------------------------
---------------------------------------------------*/
DateTime ldtm_fechahora_actual
Integer li_res
String ls_msj
//-------------------------------------------------
n_cst_application.of_selectserver(n_cst_application.itr_appl,ldtm_fechahora_actual,ls_msj,ls_msj)
//*************************************
ls_msj='Procesando reacomodaci$$HEX1$$f300$$ENDHEX$$n de programaci$$HEX1$$f300$$ENDHEX$$n ('+String(ldtm_fechahora_actual,'yyyy/mm/dd hh:mm')+')'
//*************************************
//iou_param.is_vector[1]=/*Title*/ls_msj
//iou_param.il_vector[1]=dw_ordenes.RowCount()
//OpenWithParm(w_procesando_programacion,iou_param)
////*************************************
//SetPointer(HourGlass!)
OpenWithParm(w_procesando_programacion,ls_msj)
//*************************************

li_res = iuo_readjust.of_reacomodarprogramacion()
If  li_res <> 1 Then
		iuo_readjust.of_rb()
		Close(w_procesando_programacion)
		SetPointer(Arrow!)
		If li_res = -3 Then
				MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','El proceso de reacomodaci$$HEX1$$f300$$ENDHEX$$n ha sido cancelado por el usuario',Information!)
		End If
		Return -1
End If
iuo_readjust.of_cmt()
Close(w_procesando_programacion)
SetPointer(Arrow!)
MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','La reacomodaci$$HEX1$$f300$$ENDHEX$$n de las tareas de las $$HEX1$$f300$$ENDHEX$$rdenes se registr$$HEX2$$f3002000$$ENDHEX$$satisfactoriamente.',Information!)	
//*************************************
Return 1

end function

public function string of_tiempo (long a_tiempo);long ll_seg,ll_mil,ll_min
String ls_res

ll_seg=a_tiempo/1000
ll_mil=mod(a_tiempo,1000)

ll_min=ll_seg/60
ll_seg=mod(ll_seg,60)

ls_res=String(ll_min)+":"+&
       String(ll_seg)+":"+&
		 String(ll_mil)
		 
Return ls_res		 
end function

public function integer of_desprogramar ();Long 		ll_res, ll_totfilas, ll_selfilas, ll_fila, ll_nu_orden
String 	ls_cuantas

ll_totfilas = iou_param.il_vector[1]
ll_selfilas = iou_param.il_vector[2]

IF ll_totfilas = ll_selfilas THEN 
	ls_cuantas = 'todas las'
ELSE
	ls_cuantas = String(ll_selfilas)
END IF

ll_res = MessageBox("Advertencia!","$$HEX1$$bf00$$ENDHEX$$Desea desprogramar "+ls_cuantas+" tareas programadas?",Question!,YesNo!,2)

If ll_res <> 1 Then
	Return -1
End If

iou_comun.il_tipoprod = il_tipoprod
FOR ll_fila = 1 to ll_selfilas
	ll_nu_orden = dw_ordenes.GetItemNumber(ll_fila, 'nu_orden')
	If iou_comun.of_act_reacomoda_canc(ll_nu_orden, n_cst_application.itr_appl) <> 1 Then 
		iou_comun.of_rollback(n_cst_application.itr_appl)
		MessageBox('Advertencia','Error al actualizar el estado de las tareas de las orden '+String(ll_nu_orden)+' en proceso para la reacomodaci$$HEX1$$f300$$ENDHEX$$n',StopSign!)
		Return -1
	End If
NEXT
iou_comun.of_commit()

mle_1.Text = "Se ha desprogramado satisfactoriamente..."

Return 1
//MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Se ha desprogramado satisfactoriamente...")


end function

on w_reacomodar_programacion.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_reacomodar_programacion" then this.MenuID = create m_reacomodar_programacion
this.pb_refresh=create pb_refresh
this.cbx_all=create cbx_all
this.dw_tipoprod=create dw_tipoprod
this.cb_cancelar=create cb_cancelar
this.mle_1=create mle_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_reacomodar=create cb_reacomodar
this.dw_ordenes=create dw_ordenes
this.gb_orden=create gb_orden
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_refresh
this.Control[iCurrent+2]=this.cbx_all
this.Control[iCurrent+3]=this.dw_tipoprod
this.Control[iCurrent+4]=this.cb_cancelar
this.Control[iCurrent+5]=this.mle_1
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.cb_reacomodar
this.Control[iCurrent+9]=this.dw_ordenes
this.Control[iCurrent+10]=this.gb_orden
end on

on w_reacomodar_programacion.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.pb_refresh)
destroy(this.cbx_all)
destroy(this.dw_tipoprod)
destroy(this.cb_cancelar)
destroy(this.mle_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_reacomodar)
destroy(this.dw_ordenes)
destroy(this.gb_orden)
end on

event ue_find;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 21 de Diciembre de 2004.H:17:06
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
//Open(w_opc_orden)
//If IsValid(Message.PowerObjectParm) Then
//	iou_param = Message.PowerObjectParm
//	il_fabrica=iou_param.il_vector[1]
//	il_linea=iou_param.il_vector[2]
//	il_muestra=iou_param.il_vector[3]
//	il_nu_orden=iou_param.il_vector[4]
//	of_buscar()
//End If
//
	
end event

event ue_save;call super::ue_save;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 30 de Septiembre de 2004.H:12:37
---------------------------------------------------
Evento para  guardar los datos.
//---------------------------------------------------*/
//Return
//of_Redraw(False)
//If of_verificar()<>1 Then
//	of_Redraw(True)
//	Return
//End If
////--------------------------------------------------
//If of_guardar()<>1 Then
//	of_Redraw(True)
//	Return
//End If
////**************************************************
////SE CONSIGNAN LOS CAMBIOS EN LA BD.
//iou_comun.of_commit(n_cst_application.itr_appl)
////**************************************************
//il_nu_orden = dw_ordenes.getItemNUmber(1,"nu_orden")
//MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","La programaci$$HEX1$$f300$$ENDHEX$$n de la orden #~'"+String(il_nu_orden)+"~' se registr$$HEX2$$f3002000$$ENDHEX$$satisfactoriamente.")
//ib_cambios=False
//ib_save=True
//of_buscar()
//of_Redraw(True)
////----------------------------------------------------------------
end event

event open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 21 de Diciembre de 2004.H:17:06
---------------------------------------------------
---------------------------------------------------*/

DataWindowChild ldwc_tipoprod


dw_tipoprod.GetChild('co_tipoprod_1', ldwc_tipoprod)
ldwc_tipoprod.SetTransObject(n_cst_application.itr_appl)
ldwc_tipoprod.Retrieve(n_cst_application.is_user)

dw_tipoprod.InsertRow(0)

SetNull(il_tipoprod)
end event

type pb_refresh from picturebutton within w_reacomodar_programacion
integer x = 1413
integer y = 16
integer width = 101
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "Continue!"
alignment htextalign = left!
string powertiptext = "Refrescar"
end type

event clicked;
il_tipoprod = dw_tipoprod.GetItemNumber(1, 'co_tipoprod')

/*
* ----------------------------------------------------------------------------
* MODIFICADO: Diciembre 23 de 2011 - ohlondon
* ----------------------------------------------------------------------------
* Se omite el bot$$HEX1$$f300$$ENDHEX$$n recuperar, y se pasa como un icono de refrescar para que  
* recupere nuevamente.
* ----------------------------------------------------------------------------
*/
of_carga_objtr()

end event

type cbx_all from checkbox within w_reacomodar_programacion
integer x = 91
integer y = 1156
integer width = 293
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Todos"
boolean checked = true
end type

event clicked;/*
* ----------------------------------------------------------------------------
* MODIFICADO: Diciembre 22 de 2011 - ohlondon
* ----------------------------------------------------------------------------
* Se adiciona la columna "incluida" en el detalle para poder seleccionar las
* ordenes que se quieren reprogramar.
* ----------------------------------------------------------------------------
*/
Long 		ll_fila
String	ls_incluida

// Si se chequea entonces se incluyen todas
IF This.Checked THEN
	ls_incluida = 'S'
ELSE
	// Si se DESchequea entonces se excluyen todas
	ls_incluida = 'N'
END IF

FOR ll_fila = 1 TO dw_ordenes.RowCount()
	dw_ordenes.SetItem(ll_fila, 'incluida', ls_incluida)
NEXT
	
end event

type dw_tipoprod from datawindow within w_reacomodar_programacion
integer x = 46
integer y = 24
integer width = 1467
integer height = 100
integer taborder = 20
string dataobject = "d_seleccion_tipoprod"
boolean border = false
boolean livescroll = true
end type

event itemchanged;
AcceptText()

il_tipoprod = Long(Data)

/*
* ----------------------------------------------------------------------------
* MODIFICADO: Diciembre 22 de 2011 - ohlondon
* ----------------------------------------------------------------------------
* Se omite el bot$$HEX1$$f300$$ENDHEX$$n recuperar, y se pasa el llamado al metodo para que se 
* recupere tan pronto se seleccione el tipo de producto
* ----------------------------------------------------------------------------
*/
of_carga_objtr()


end event

type cb_cancelar from u_cb_application within w_reacomodar_programacion
integer x = 745
integer y = 1148
integer width = 338
integer taborder = 70
boolean enabled = false
string text = "&Cancelar"
end type

event clicked;call super::clicked;ib_cancelar=True


Enabled=False
end event

type mle_1 from multilineedit within w_reacomodar_programacion
integer x = 1184
integer y = 1164
integer width = 1266
integer height = 352
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from u_cb_application within w_reacomodar_programacion
boolean visible = false
integer x = 41
integer y = 1484
integer width = 398
integer taborder = 70
string text = "&Recuperar"
end type

event clicked;call super::clicked;of_carga_objtr()
end event

type cb_1 from u_cb_application within w_reacomodar_programacion
boolean visible = false
integer x = 448
integer y = 1484
integer width = 398
integer taborder = 60
string text = "&Desprogramar"
end type

event clicked;call super::clicked;Long ll_res

IF IsNull(il_tipoprod) THEN
	MessageBox('Advertencia','Debe seleccionar primero el Tipo de Producto',StopSign!)
	dw_tipoprod.SetColumn('co_tipoprod')
	dw_tipoprod.SetFocus()
	Return -1
END IF
ll_res=MessageBox("Advertencia!",&
"$$HEX1$$bf00$$ENDHEX$$Desea desprogramar todas las tareas programadas?",Question!,YesNo!,2)

If ll_res<>1 Then
	Return
End If

iou_comun.il_tipoprod = il_tipoprod

If iou_comun.of_act_reacomoda_canc(n_cst_application.itr_appl)<>1 Then 
		iou_comun.of_rollback(n_cst_application.itr_appl)
		MessageBox('Advertencia','Error al actualizar el estado de las tareas de las $$HEX1$$f300$$ENDHEX$$rdenes en proceso para la reacomodaci$$HEX1$$f300$$ENDHEX$$n',StopSign!)
		Return -1
End If

iou_comun.of_commit()

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Se ha desprogramado satisfactoriamente...")



end event

type cb_reacomodar from u_cb_application within w_reacomodar_programacion
integer x = 402
integer y = 1148
integer width = 338
integer taborder = 50
string text = "Aceptar"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 16 de Marzo de 2005 HORA 11:03:36:046
// 
// 
//////////////////////////////////////////////////////////////////////////
String 	ls_msj, ls_tipo_muestra 
long		i,ll_tot,ll_nu_orden,ll_recurso,ll_res,ll_t1,ll_t2,ll_t,ll_tr,ll_tm,ll_ini,ll_tmax, &
     		ll_torden, ll_fabrica, ll_linea, ll_muestra

mle_1.text = ''
    
IF IsNull(il_tipoprod) THEN
	MessageBox('Advertencia','Debe seleccionar primero el Tipo de Producto',StopSign!)
	dw_tipoprod.SetColumn('co_tipoprod')
	dw_tipoprod.SetFocus()
	Return -1
END IF

If Not n_cst_application.of_selectserver(&
   n_cst_application.itr_appl,idtm_fechahora_actual,ls_msj,ls_msj) Then
	Return 	
End If

/*
* ----------------------------------------------------------------------------
* Solo se procesan aquellas ordenes que han sido incluidas.
* ----------------------------------------------------------------------------
*/
iou_param.il_vector[1] = dw_ordenes.RowCount() 
dw_ordenes.SetRedraw(FALSE)
dw_ordenes.SetFilter("incluida = 'S'")
dw_ordenes.Filter()

iou_param.il_vector[2] = dw_ordenes.RowCount() 

If iou_param.il_vector[2] = 0 Then
	MessageBox("Advertencia!","No hay $$HEX1$$f300$$ENDHEX$$rdenes seleccionadas para reprogramar.",StopSign!)
	dw_ordenes.SetFilter("")
	dw_ordenes.Filter()
	dw_ordenes.SetRedraw(TRUE)
	Return
End If

mle_1.text = String(iou_param.il_vector[2])+" $$HEX1$$f300$$ENDHEX$$rdenes seleccionadas para reprogramar."

/*
* ----------------------------------------------------------------------------
* Se procede a DESprogramar las ordenes seleccionadas
* ----------------------------------------------------------------------------
*/
ll_res = of_desprogramar( )
// Si ocurrio un error o se decidio no reprogramar
If ll_res = -1 Then
	dw_ordenes.SetFilter("")
	dw_ordenes.Filter()
	dw_ordenes.SetRedraw(TRUE)
	mle_1.text = ''
	Return -1
End If
// ---------------------------------------------------------------------------

iuo_programacion.il_tipoprod = il_tipoprod
iuo_programacion.of_rb()

If iuo_programacion.of_load_ids()<>1 Then
	dw_ordenes.SetFilter("")
	dw_ordenes.Filter()
	dw_ordenes.SetRedraw(TRUE)
	mle_1.text = ''
	Return -1
End If

ll_tot = dw_ordenes.RowCount()

cb_cancelar.Enabled=True
ll_t1   = cpu()
ll_tmax = 0

/*
* ----------------------------------------------------------------------------
* Se procede a Reprogramar las ordenes seleccionadas
* ----------------------------------------------------------------------------
*/
/***********************************************************
SA51505 - Ceiba/JJ - 15-10-2015
Comentario: se adiciona al dw: d_ordenes_prioridad_incluir los campos fabrica-linea-muestra para posteriomente 
hacer los get y set para validar si ya fue convertida a referencia o no en la Re-Programacion
El campo recurso no se debe cargar de muestras, para esto se le adiciono al repositorio de ordenes el campo recurso 
***********************************************************/
For i=1 To ll_tot
	GarbageCollect()
	SetPointer(Arrow!)
	ll_ini      		= cpu()
	ll_nu_orden    	= dw_ordenes.GetItemNumber(i,'nu_orden')
	ll_recurso      	= dw_ordenes.GetItemNumber(i,'co_recurso')
	ls_tipo_muestra 	= dw_ordenes.GetItemString(i,'tipo_muestra')
	ll_fabrica			= dw_ordenes.GetItemNumber(i,'co_fabrica')
	ll_linea				= dw_ordenes.GetItemNumber(i,'co_linea')
	ll_muestra			= dw_ordenes.GetItemNumber(i,'co_muestra')
	
	iuo_programacion.of_set_recurso(ll_recurso)
	iuo_programacion.of_set_tipo_muestra(ls_tipo_muestra)
	iuo_programacion.of_setfabricamuestra(ll_fabrica)
	iuo_programacion.of_setlinea(ll_linea)
	iuo_programacion.of_setmuestra(ll_muestra)

	ll_res = iuo_programacion.of_programarorden(ll_nu_orden, idtm_fechahora_actual)
	
	If ll_res <> 1 Then
		iuo_programacion.of_rb()
		MessageBox('Advertencia','Error en el proceso de reacomodaci$$HEX1$$f300$$ENDHEX$$n para la orden # '+String(ll_nu_orden),StopSign!)
		dw_ordenes.Reset()
		If ll_res = -3 Then
			dw_ordenes.SetFilter("")
			dw_ordenes.Filter()
			dw_ordenes.SetRedraw(TRUE)
			Return ll_res
		End If
		dw_ordenes.SetRedraw(TRUE)
		Return -1	
	End If
	
  	iou_comun.of_commit()
	
	ll_t2     = cpu()
	ll_torden = ll_t2 - ll_ini
	ll_t      = ll_t2 - ll_t1
	ll_tm     = ll_t / i
	ll_tr     = ll_tm * (ll_tot - i)
		
	ls_msj = "Porcentaje: "+String(i/ll_tot*100,"###.00")+"% ~r~n"+&
			   "Procesando orden : ("+String(i)+") "+String(ll_nu_orden)+"~r~n"+&
			   "Tiempo promedio (min:sec) : "+of_tiempo(ll_tm)+"~r~n"+&
			   "Tiempo empleado (min:sec) : "+of_tiempo(ll_t)+"~r~n"+&	
			   "Tiempo Restante (min:sec) : "+of_tiempo(ll_tr)
				
	If ll_torden > ll_tmax Then
		ll_tmax = ll_torden
		
		INSERT INTO mu_log_reacomoda  
         ( nu_orden,   
           tiempo,   
           fe_actualizacion,   
           usuario,   
           instancia )  
		VALUES ( :ll_nu_orden,   
           :ll_tmax,   
           CURRENT,   
           USER,   
           DBSERVERNAME ) 
			  using n_cst_application.itr_appl;
			  
		If n_cst_application.itr_appl.SQLcode=-1 Then 
			PopulateError(20,"SQL Error")
			n_cst_application.of_sql_error(n_cst_application.itr_appl)
			dw_ordenes.SetFilter("")
			dw_ordenes.Filter()
			dw_ordenes.SetRedraw(TRUE)
			Return
		End If
		iou_comun.of_commit()		
	End If
	Yield()

	If ib_cancelar Then 
		iou_comun.of_rollback()
		dw_ordenes.SetFilter("")
		dw_ordenes.Filter()
		dw_ordenes.SetRedraw(TRUE)
		Return 
	End If
	mle_1.text = ls_msj
	
Next

cb_cancelar.enabled=False


/////*-------------------------------------------------
////	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
////	Date		: Martes 21 de Diciembre de 2004.H:17:06
////---------------------------------------------------
////---------------------------------------------------*/
//////-------------------------------------------------
////If of_reacomodar()=1 Then
////	of_carga_objtr ()
////End If

end event

type dw_ordenes from u_dw_application within w_reacomodar_programacion
integer x = 87
integer y = 196
integer width = 2341
integer height = 860
string dataobject = "d_ordenes_prioridad_incluir"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 21 de Diciembre de 2004.H:17:06
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------

end event

event itemchanged;call super::itemchanged;
This.PostEvent("ue_find")
end event

event ue_find;call super::ue_find;Long ll_noselec 
ll_noselec = This.Find("incluida = 'N'", 1, This.RowCount())

IF ll_noselec > 0 THEN
	cbx_all.Checked = FALSE
ELSE
	cbx_all.Checked = TRUE
END IF

end event

type gb_orden from u_gb_base within w_reacomodar_programacion
integer x = 50
integer y = 132
integer width = 2414
integer height = 988
integer taborder = 20
string text = "$$HEX1$$d300$$ENDHEX$$rdenes"
end type

