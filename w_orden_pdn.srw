HA$PBExportHeader$w_orden_pdn.srw
$PBExportComments$W para los datos de las ordenes de producci$$HEX1$$f300$$ENDHEX$$n
forward
global type w_orden_pdn from w_sheet
end type
type dw_tmp_mu_soli_tinta from u_dw_application within w_orden_pdn
end type
type dw_mu_soli_tinta from u_dw_application within w_orden_pdn
end type
type dw_tmp_mu_soli_hilaza from u_dw_application within w_orden_pdn
end type
type dw_mu_soli_hilaza from u_dw_application within w_orden_pdn
end type
type dw_2 from u_dw_application within w_orden_pdn
end type
type dw_dt_mu_ord_col from u_dw_application within w_orden_pdn
end type
type dw_dt_mu_ord from u_dw_application within w_orden_pdn
end type
type gb_colores from u_gb_base within w_orden_pdn
end type
type tab_activ_oper from tab within w_orden_pdn
end type
type tabpage_mp_base from userobject within tab_activ_oper
end type
type dw_mp_base from u_dw_application within tabpage_mp_base
end type
type tabpage_mp_base from userobject within tab_activ_oper
dw_mp_base dw_mp_base
end type
type tabpage_procesos from userobject within tab_activ_oper
end type
type dw_tareas_en_operac from u_dw_application within tabpage_procesos
end type
type cb_orden_proc from u_cb_base within tabpage_procesos
end type
type dw_operacion_muestra from u_dw_application within tabpage_procesos
end type
type tabpage_procesos from userobject within tab_activ_oper
dw_tareas_en_operac dw_tareas_en_operac
cb_orden_proc cb_orden_proc
dw_operacion_muestra dw_operacion_muestra
end type
type tabpage_actividades from userobject within tab_activ_oper
end type
type dw_tareas_en_activ from u_dw_application within tabpage_actividades
end type
type cb_orden_act from u_cb_base within tabpage_actividades
end type
type dw_actividad_muestra from u_dw_application within tabpage_actividades
end type
type tabpage_actividades from userobject within tab_activ_oper
dw_tareas_en_activ dw_tareas_en_activ
cb_orden_act cb_orden_act
dw_actividad_muestra dw_actividad_muestra
end type
type tabpage_antideslizante from userobject within tab_activ_oper
end type
type dw_detalle_antideslizante from u_dw_application within tabpage_antideslizante
end type
type tabpage_antideslizante from userobject within tab_activ_oper
dw_detalle_antideslizante dw_detalle_antideslizante
end type
type tabpage_bordado from userobject within tab_activ_oper
end type
type dw_bordado from u_dw_application within tabpage_bordado
end type
type tabpage_bordado from userobject within tab_activ_oper
dw_bordado dw_bordado
end type
type tabpage_tareas from userobject within tab_activ_oper
end type
type cb_1 from commandbutton within tabpage_tareas
end type
type st_1 from statictext within tabpage_tareas
end type
type sle_sort from singlelineedit within tabpage_tareas
end type
type cb_orden_tareas from u_cb_base within tabpage_tareas
end type
type st_2 from u_st_base within tabpage_tareas
end type
type dw_tareas from u_dw_application within tabpage_tareas
end type
type tabpage_tareas from userobject within tab_activ_oper
cb_1 cb_1
st_1 st_1
sle_sort sle_sort
cb_orden_tareas cb_orden_tareas
st_2 st_2
dw_tareas dw_tareas
end type
type tabpage_repeticion from userobject within tab_activ_oper
end type
type dw_repeticiones from u_dw_base within tabpage_repeticion
end type
type tabpage_repeticion from userobject within tab_activ_oper
dw_repeticiones dw_repeticiones
end type
type tab_activ_oper from tab within w_orden_pdn
tabpage_mp_base tabpage_mp_base
tabpage_procesos tabpage_procesos
tabpage_actividades tabpage_actividades
tabpage_antideslizante tabpage_antideslizante
tabpage_bordado tabpage_bordado
tabpage_tareas tabpage_tareas
tabpage_repeticion tabpage_repeticion
end type
type gb_orden_pdn from u_gb_base within w_orden_pdn
end type
type dw_total_pares from u_dw_application within w_orden_pdn
end type
type cb_programar from u_cb_base within w_orden_pdn
end type
end forward

global type w_orden_pdn from w_sheet
integer x = 9
integer y = 12
integer width = 6875
integer height = 8132
string title = "Orden de Producci$$HEX1$$f300$$ENDHEX$$n de Muestras"
string menuname = "m_orden_pdn"
boolean maxbox = true
boolean vscrollbar = true
boolean resizable = true
windowstate windowstate = maximized!
event ue_eliminar_orden ( )
event ue_ficha_tecnica ( )
event ue_busq_muestra ( )
event ue_invocar_programacion ( )
event ue_cancelar_orden ( )
event ue_cancelar_tareas_color ( )
event ue_cancelar_tarea ( )
event ue_imprimir_ss ( )
event ue_cambiar_condicion_orden ( )
event ue_observacion_ss ( )
event ue_imprimir_ss_agrupada ( )
event ue_observacion_ss_tinta ( )
dw_tmp_mu_soli_tinta dw_tmp_mu_soli_tinta
dw_mu_soli_tinta dw_mu_soli_tinta
dw_tmp_mu_soli_hilaza dw_tmp_mu_soli_hilaza
dw_mu_soli_hilaza dw_mu_soli_hilaza
dw_2 dw_2
dw_dt_mu_ord_col dw_dt_mu_ord_col
dw_dt_mu_ord dw_dt_mu_ord
gb_colores gb_colores
tab_activ_oper tab_activ_oper
gb_orden_pdn gb_orden_pdn
dw_total_pares dw_total_pares
cb_programar cb_programar
end type
global w_orden_pdn w_orden_pdn

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 22 de Septiembre de 2004.H:17:49
---------------------------------------------------
---------------------------------------------------*/
n_ds_application	ids_m_proref_muestras, ids_dt_muestras_col,ids_proveedores
n_cst_param 		iou_param 
DataWindowChild 	idc_operacion, idc_ctecnico
String 	is_where_busqueda, is_tipo_muestra
Long 		il_fabrica,il_linea,il_muestra,il_talla,il_estado_orden, &
			il_tipo_prod,il_nu_orden_control,il_nu_orden = 0, &
			il_rows_actoper,il_pares_actoper,il_estado_activ,il_fila_col,il_fila_tarea,&
			il_COLOR_NO_PERMITIDO1,il_COLOR_NO_PERMITIDO2, il_recMuestraBas
Boolean  ib_busq_camb, ib_era, ib_cambios, ib_cambio_mp, ib_save
Decimal{2} ide_kilos
//CAMBIOS V.3.0

n_ds_application		ids_mp_base_mues,ids_cond_orden,ids_cond_tarea	//Para administrar la informaci$$HEX1$$f300$$ENDHEX$$n de la solicitud de servicio
n_cst_estima_tiempo 	iou_estimator //Objeto de estimaci$$HEX1$$f300$$ENDHEX$$n

n_ds_application 	ids_verif_precedencia_new
n_cst_soli_serv 	io_soli_serv

//SA51505 - Ceiba/JJ - 18-08-2015
n_cst_c_orden_pdn		inv_orden_pdn

Long il_consecutivo_repeticion, il_orden_repeticion_orig = 0
end variables

forward prototypes
public function integer of_redraw (boolean ab_redrawing)
public function long of_buscar_muestra ()
public function long of_cargar_ids (string as_ds)
public function integer of_reset ()
public function long of_buscar ()
public function integer of_verificar ()
public function integer of_carga_objtr ()
public function integer of_guardar ()
public function integer of_consecutivo ()
public function integer of_error_orden ()
public function integer of_eliminar_orden ()
public function integer of_recuperar_talla ()
public function integer of_distrib_col (long al_dato, string as_col)
public function integer of_error_orden2 ()
public function integer of_ok_orden ()
public function integer of_title (long al_estado)
public function integer of_cargar_dddw ()
public function integer of_orden_proc (ref datawindow adw_arg, string as_col)
public function integer of_estimacion (long al_row, string as_col)
public function integer of_validar_tareas (string as_por_color, string as_col, long al_codigo, string as_objeto)
public function integer of_recuperar_cilindros (long al_recurso)
public function integer of_partes_bordado (long al_bordado, long al_partes, long al_cons_color)
public function integer of_cantidad_chablon (long al_chablon, long al_cantidad, long al_cons_color)
public function integer of_sel_fila (long al_fila)
public function integer of_filtrar_chab_bord ()
public function integer of_verificar_datos_bordchab ()
public function integer of_ord_programada (boolean ab_enab)
public function integer of_codcolor_tarea (long al_color, long al_new)
public function integer of_pares_actoper_xorden ()
public function integer of_pares_actoper_xcriterioestado (string as_filtro)
public function integer of_scroll (long al_pos)
public function integer of_cancelar_orden ()
public function integer of_sel_fila (ref datawindow adw_param, ref long al_ref_varinst, long al_row)
public function integer of_cancelartareascolor (long al_cons_color)
public function integer of_refrescar_datos ()
public function integer of_verificarprecedencias ()
public function integer of_cancelartarea (long al_consec)
public function integer of_validarlote (long a_producto, long a_proveedor, string a_lote)
public function integer of_puedemodificar ()
public function integer of_insertar_tarea (long al_consecutivo_color, string as_genera_sol_serv, long al_co_operacion, long al_id_actividad, double adbl_tiempo, long al_clase_ss)
public function integer of_regtarea_si_xcolor (string as_genera_ss, long al_codigo, integer ai_opcion, long al_clase_ss)
public function integer of_regtarea_no_xcolor (string as_genera_ss, long al_codigo, integer ai_opcion, long al_clase_ss)
public function integer of_obtener_prioridad (string as_tipocliente, long an_cliente, long an_sucursal)
public function boolean wf_validarcamporecursohabilitado () throws exception
public subroutine wf_setpropertiescamporecurso (readonly boolean al_bool) throws exception
public function boolean wf_validarcargarrecursomuestrabasica () throws exception
public subroutine wf_cargarrecursomuestrabasica () throws exception
public function integer of_fecha_entrega (datetime adt_fecha, long an_nro_orden)
end prototypes

event ue_eliminar_orden();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 1 de Octubre de 2004.H:17:45
---------------------------------------------------
---------------------------------------------------*/
of_redraw(False)
of_eliminar_orden()
of_redraw(True)
end event

event ue_ficha_tecnica();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 5 de Octubre de 2004.H:11:21
---------------------------------------------------
Evento para el manejo de la ficha tecnica de la orden
---------------------------------------------------*/
n_cst_param lo_param
w_inf_orden_pdn lw_ficha
//---------------------------------------------------

If dw_dt_mu_ord.RowCount()=0 Then Return

If Not ib_era Then
	MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","No se puede generar ficha de una orden no registrada.",Information!)
	Return
End If

If This.of_recuperar_talla() <> 1 Then Return

If il_nu_orden = -1 Then
	MessageBox("Advertencia!","No se pudo determinar la orden para la ficha!.",StopSign!)
	Return
End If

lo_param.il_vector[1]=il_fabrica
lo_param.il_vector[2]=il_linea
lo_param.il_vector[3]=il_muestra
lo_param.il_vector[4]=il_talla
lo_param.il_vector[5]=il_nu_orden

OpenSheetWithParm(lw_ficha,lo_param,This.ParentWindow(),2,Original!)
end event

event ue_busq_muestra();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 22 de Septiembre de 2004.H:12:29
---------------------------------------------------
Evento que invoca la funci$$HEX1$$f300$$ENDHEX$$n de busqueda de muestra
validando si ha sido abierta desde el registro de muestra
---------------------------------------------------*/
If UpperBound(iou_param.is_vector)>0 Then
	If iou_param.is_vector[1]='FromMuestra' Then
		ib_busq_camb = True
		If of_buscar_muestra()=-1 Then
			of_reset()
		End If
	End If
End If






end event

event ue_invocar_programacion();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 21 de Diciembre de 2004.H:17:06
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
n_cst_param lo_param
//---------------------------------------------------
If il_fabrica<=0 Then
	MessageBox('Advertencia','C$$HEX1$$f300$$ENDHEX$$digo de F$$HEX1$$e100$$ENDHEX$$brica desconocido para iniciar programaci$$HEX1$$f300$$ENDHEX$$n',StopSign!)
	Return
End If
If il_linea<=0 Then
	MessageBox('Advertencia','C$$HEX1$$f300$$ENDHEX$$digo de L$$HEX1$$ed00$$ENDHEX$$nea desconocido para iniciar programaci$$HEX1$$f300$$ENDHEX$$n',StopSign!)
	Return
End If
If il_muestra<=0 Then
	MessageBox('Advertencia','C$$HEX1$$f300$$ENDHEX$$digo de Muestra desconocido para iniciar programaci$$HEX1$$f300$$ENDHEX$$n',StopSign!)
	Return
End If
If il_nu_orden<=0 Then
	If il_nu_orden=0 Then
		MessageBox('Advertencia','La orden no ha sido registrada a$$HEX1$$fa00$$ENDHEX$$n.',StopSign!)
		Return
	End If
	MessageBox('Advertencia','C$$HEX1$$f300$$ENDHEX$$digo de orden desconocido para iniciar programaci$$HEX1$$f300$$ENDHEX$$n',StopSign!)
	Return
End If
//---------------------------------------------------
If ib_cambios Then
	MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','Debe almacenar la informaci$$HEX1$$f300$$ENDHEX$$n adicionada '+&
	'o modificada en la orden antes programar.',Information!)
	Return 
End If
//---------------------------------------------------
lo_param.il_vector[1]=il_fabrica
lo_param.il_vector[2]=il_linea
lo_param.il_vector[3]=il_muestra
lo_param.il_vector[4]=il_nu_orden
lo_param.is_vector[1]='ProgOrden'

//*************************************************************************
OpenSheetWithParm(w_programacion_orden,lo_param,ParentWindow(),0,Original!)
//*************************************************************************

of_reset()
il_fabrica=0
end event

event ue_cancelar_orden();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 04 de Enero de 2005.H:10:36
---------------------------------------------------
Procedimiento para la cancelaci$$HEX1$$f300$$ENDHEX$$n de una orden y sus tareas.
---------------------------------------------------*/
//-------------------------------------------------
of_cancelar_orden()

end event

event ue_cancelar_tareas_color();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 04 de Enero de 2005.H:10:36
---------------------------------------------------
Procedimiento para la cancelaci$$HEX1$$f300$$ENDHEX$$n de una tarea segun un color.
---------------------------------------------------*/
Boolean 				lb_des
Long 					ll_cons_color,ll_color,ll_pos,ll_condicion
String				ls_de_color
//-------------------------------------------------------------------------------------
If dw_dt_mu_ord.RowCount()<1 Then
	Return
End If
//-------------------------------------------------------------------------------------
If Not ib_era Then
	MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Esta orden no ha sido almacenada a$$HEX1$$fa00$$ENDHEX$$n.",Information!)
	Return 
End If	

//-------------------------------------------------------------------------------------
If IsNull(il_nu_orden) OR il_nu_orden<=0 Then
		MessageBox("Advertencia","El c$$HEX1$$f300$$ENDHEX$$digo de orden no es v$$HEX1$$e100$$ENDHEX$$lido para la cancelaci$$HEX1$$f300$$ENDHEX$$n por color.",StopSign!)
	Return 
End If
//-------------------------------------------------------------------------------------
If tab_activ_oper.tabpage_tareas.dw_tareas.Rowcount()<=0 Then
		MessageBox("Advertencia","La orden # "+String(il_nu_orden)+" no posee tareas asignadas.",StopSign!)
		Return
End If
//-------------------------------------------------------------------------------------
ll_condicion = dw_dt_mu_ord.GetItemNumber(1,'condicion')
Choose Case ll_condicion
		Case 4,5,6,7,8
		ll_pos=ids_cond_orden.Find('condicion='+String(ll_condicion),1,ids_cond_orden.RowCount())
		MessageBox('Advertencia','La orden # '+String(il_nu_orden)+' se encuentra en estado '+&
					String(Trim(ids_cond_orden.GetItemString(ll_pos,'de_condicion'))),StopSign!)
		Return
		//	Case 4 /*FINALIZADA*/
		//	Case 5 /*CANCELADA*/
		//	Case 6 /*DESPACHADA*/
		//	Case 7 /*APROVADA*/				
		//	Case 8 /*RECHAZADA*/
End Choose
//-------------------------------------------------------------------------------------
If IsNull(il_fila_col) OR il_fila_col<=0 Then
	MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","No ha seleccionado ning$$HEX1$$fa00$$ENDHEX$$n color para cancelar sus tareas.",Information!)
	Return 
End If
//*********
//Si el color es correcto
ll_cons_color=dw_dt_mu_ord_col.GetItemNumber(il_fila_col,'cons_color')
If IsNull(ll_cons_color) OR ll_cons_color<=0 Then
	MessageBox("Advertencia","El c$$HEX1$$f300$$ENDHEX$$digo del consecutivo del color de la posici$$HEX1$$f300$$ENDHEX$$n # "+String(il_fila_col)+" no es v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
	Return 
End If
ll_color=dw_dt_mu_ord_col.GetItemNumber(il_fila_col,'co_color')
ls_de_color=dw_dt_mu_ord_col.GetItemString(il_fila_col,'de_color')
//*********
ll_pos=tab_activ_oper.tabpage_tareas.dw_tareas.Find('cons_color='+String(ll_cons_color),1,tab_activ_oper.tabpage_tareas.dw_tareas.RowCount())
Choose Case ll_pos
		Case Is <=0 //Si el color tiene tareas asignadas
				MessageBox("Advertencia","El color # "+String(ll_color)+' - '+ls_de_color+" no tiene tareas asignadas.",StopSign!)
				Return 
		Case Else // Si el color seleccionado ya no est$$HEX2$$e1002000$$ENDHEX$$cancelado
				ll_condicion=tab_activ_oper.tabpage_tareas.dw_tareas.GetItemNumber(ll_pos,'condicion')				
				Choose Case ll_condicion
						Case 4,5,6,7,8,9
								ll_pos=ids_cond_tarea.Find('condicion='+String(ll_condicion),1,ids_cond_tarea.RowCount())
								MessageBox('Advertencia',"El color # "+String(ll_color)+' - '+ls_de_color+" tiene sus tareas en estado de "+&
											String(Trim(ids_cond_tarea.GetItemString(ll_pos,'de_condicion'))),StopSign!)
								Return
						//	Case 4 /*PROCESO*/
						//	Case 5 /*PARO GENERAL*/
						//	Case 6 /*PARO INDIVIDUAL*/
						//	Case 7 /*APROBADA*/
						//	Case 8 /*CANCELADA*/
						// Case 9 /*NO PROGRAMADA*/
				End Choose
End Choose
//-------------------------------------------------------------------------------------	
lb_des=True
If ib_cambios Then
	If MessageBox('Validaci$$HEX1$$f300$$ENDHEX$$n','Se perder$$HEX1$$e100$$ENDHEX$$n los cambios realizados. Desea continuar con la cancelaci$$HEX1$$f300$$ENDHEX$$n por color # '+String(ll_color)+' de la orden?',Question!,YesNo!,2)=2 Then
		Return 
	Else 
		lb_des=False
	End If
End If
//-------------------------------------------------------------------------------------
If lb_des Then
		If MessageBox('Validaci$$HEX1$$f300$$ENDHEX$$n','Desea modificar la condici$$HEX1$$f300$$ENDHEX$$n de las tareas del color # '+String(ll_color)+' - '+ls_de_color+&
							' al estado de ~'rechazada~'?',Question!,YesNo!)=2 Then
			Return
		End If	
End If
//-------------------------------------------------------------------------------------
of_cancelartareascolor(ll_cons_color)
end event

event ue_cancelar_tarea();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Lunes 04 de Abril de 2005 HORA 16:07:45:156
// 
// Procedimiento para cancelaci$$HEX1$$f300$$ENDHEX$$n de una tarea especifica
//////////////////////////////////////////////////////////////////////////



Boolean 				lb_des
Long 					ll_nu_sol_serv,ll_consec,ll_condicion,ll_i
//-------------------------------------------------------------------------------------
If dw_dt_mu_ord.RowCount()<1 Then
	Return
End If
//-------------------------------------------------------------------------------------
If Not ib_era Then
		MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Esta orden no ha sido almacenada a$$HEX1$$fa00$$ENDHEX$$n.",Information!)
		Return 
End If
//-------------------------------------------------------------------------------------
If IsNull(il_nu_orden) OR il_nu_orden<=0 Then
		MessageBox("Advertencia","La orden no es v$$HEX1$$e100$$ENDHEX$$lida para la cancelaci$$HEX1$$f300$$ENDHEX$$n de tarea.",StopSign!)
		Return 
End If	
//-------------------------------------------------------------------------------------
If tab_activ_oper.tabpage_tareas.dw_tareas.Rowcount()<=0 Then
		MessageBox("Advertencia","La orden # "+String(il_nu_orden)+" no posee tareas asignadas.",StopSign!)
		Return
End If
//-------------------------------------------------------------------------------------
ll_condicion = dw_dt_mu_ord.GetItemNumber(1,'condicion')
Choose Case ll_condicion
		Case 4,5,6,7,8
				ll_i=ids_cond_orden.Find('condicion='+String(ll_condicion),1,ids_cond_orden.RowCount())
				MessageBox('Advertencia','La orden # '+String(il_nu_orden)+' se encuentra en estado '+&
							String(Trim(ids_cond_orden.GetItemString(ll_i,'de_condicion'))),StopSign!)
				Return				
				//	Case 4 /*FINALIZADA*/
				//	Case 5 /*CANCELADA*/
				//	Case 6 /*DESPACHADA*/
				//	Case 7 /*APROVADA*/				
				//	Case 8 /*RECHAZADA*/
End Choose
//-------------------------------------------------------------------------------------
If IsNull(il_fila_tarea) OR il_fila_tarea<=0 Then
	MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","No ha seleccionado ninguna tarea.",Information!)
	Return 
End If
//-------------------------------------------------------------------------------------
ll_nu_sol_serv=tab_activ_oper.tabpage_tareas.dw_tareas.GetItemNumber(il_fila_tarea,'nu_sol_serv')
//If IsNull(ll_nu_sol_serv) OR ll_nu_sol_serv<=0 Then
//	MessageBox("Advertencia","La tarea seleccionada en la posici$$HEX1$$f300$$ENDHEX$$n # "+String(tab_activ_oper.tabpage_tareas.dw_tareas.GetItemNumber(il_fila_tarea,'posicion'))+&
//					" no posee solicitud de servicio.",StopSign!)
//	Return 
//End If
//-------------------------------------------------------------------------------------
ll_condicion=tab_activ_oper.tabpage_tareas.dw_tareas.GetItemNumber(il_fila_tarea,'condicion')
Choose Case ll_condicion
		Case 4,5,6,7,8,9
				ll_i=ids_cond_tarea.Find('condicion='+String(ll_condicion),1,ids_cond_tarea.RowCount())
				MessageBox(	"Advertencia","La tarea seleccionada en la posici$$HEX1$$f300$$ENDHEX$$n # "+String(tab_activ_oper.tabpage_tareas.dw_tareas.GetItemNumber(il_fila_tarea,'posicion'))+&
								" con su solicitud de servicio se encuentra en estado "+&
								String(Trim(ids_cond_tarea.GetItemString(ll_i,'de_condicion'))),StopSign!)
				Return				
				//	Case 4 /*PROCESO*/
				//	Case 5 /*PARO GENERAL*/
				//	Case 6 /*PARO INDIVIDUAL*/
				//	Case 7 /*APROBADA*/
				//	Case 8 /*CANCELADA*/				
End Choose
//-------------------------------------------------------------------------------------	
lb_des=True
If ib_cambios Then
	If MessageBox('Validaci$$HEX1$$f300$$ENDHEX$$n','Se perder$$HEX1$$e100$$ENDHEX$$n los cambios realizados. Desea continuar la cancelaci$$HEX1$$f300$$ENDHEX$$n de la tarea?',Question!,YesNo!,2)=2 Then
		Return 
	Else 
		lb_des=False
	End If
End If
//-------------------------------------------------------------------------------------
If lb_des Then
		If MessageBox('Validaci$$HEX1$$f300$$ENDHEX$$n','Desea modificar la condici$$HEX1$$f300$$ENDHEX$$n de la tarea al estado de ~'rechazada~'?',Question!,YesNo!)=2 Then
			Return
		End If	
End If
//-------------------------------------------------------------------------------------
ll_consec=tab_activ_oper.tabpage_tareas.dw_tareas.GetItemNumber(il_fila_tarea,'consec')
of_cancelarTarea(ll_consec)

end event

event ue_imprimir_ss();///*******************************************************************************************************
//* PROC./FUNC.: ue_imprimir_ss
//* ARG.		 : None
//* RETURN		 : Integer
//* SCOPE		 : Public
//* PURPOSE	 :	Evento que invoca la ventana de impresion de solicitudes
//					de servicio.
//* PRECOND.	 : La orden posea solicitudes de servicio asignadas
//* POSTCOND.	 : None
//* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
//* DATE		 :	Martes 18 de Enero de 2005. Hora: 08:12:32
//********************************************************************************************************/
////VARIABLE DECLARATION
//Boolean 				lb_des
//Long 					ll_nu_sol_serv,ll_consec,ll_condicion,ll_i,ll_pos
//u_dw_application 	ldw_tarea
//n_cst_param_orden	luo_param
//n_ds_application 	lds_act_color
////BEGIN SCRIPT------------------------------------------------------------------------------------------------------
//ldw_tarea=tab_activ_oper.tabpage_tareas.dw_tareas
////-------------------------------------------------------------------------------------
//If dw_dt_mu_ord.RowCount()<1 Then
//	Return
//End If
////-------------------------------------------------------------------------------------
//If Not ib_era Then
//		MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Esta orden no ha sido almacenada a$$HEX1$$fa00$$ENDHEX$$n.",Information!)
//		Return 
//End If
////-------------------------------------------------------------------------------------
//If ib_cambios Then
//	 	MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','Debe almacenar los cambios realizados',Information!)
//		Return
//End If
////-------------------------------------------------------------------------------------
//If IsNull(il_nu_orden) OR il_nu_orden<=0 Then
//		MessageBox("Advertencia","El c$$HEX1$$f300$$ENDHEX$$digo de orden no es v$$HEX1$$e100$$ENDHEX$$lido para la impresi$$HEX1$$f300$$ENDHEX$$n de solicitudes de servicio.",StopSign!)
//		Return 
//End If	
////-------------------------------------------------------------------------------------
//If ldw_tarea.Rowcount()<=0 Then
//		MessageBox("Advertencia","La orden # "+String(il_nu_orden)+" no posee tareas asignadas.",StopSign!)
//		Return
//End If
////-------------------------------------------------------------------------------------
//ll_i=ldw_tarea.Find('nu_sol_serv>0',1,ldw_tarea.RowCount())
//If ll_i<=0 Then
//		MessageBox('Advertencia','El orden # '+String(il_nu_orden)+' no posee solicitudes de servicio asignadas',StopSign!)
//		Return				
//End If
////-------------------------------------------------------------------------------------
//luo_param.il_vector[1]=il_fabrica
//luo_param.il_vector[2]=il_linea
//luo_param.il_vector[3]=il_muestra
//luo_param.il_vector[4]=il_nu_orden
////-------------------------------------------------------------------------------------
//
//lds_act_color=CREATE n_ds_application
//lds_act_color.of_load('d_ext_actividad_color')
//For ll_i=1 To ldw_tarea.RowCount()
//	If ldw_tarea.GetItemNumber(ll_i,'nu_sol_serv')>0 Then
//				ll_pos=lds_act_color.InsertRow(0)
//				lds_act_color.SetItem(ll_pos,'co_color',ldw_tarea.GetItemNumber(ll_i,'co_color'))
//				lds_act_color.SetItem(ll_pos,'nu_sol_serv',ldw_tarea.GetItemNumber(ll_i,'nu_sol_serv'))
//				lds_act_color.SetItem(ll_pos,'id_actividad',ldw_tarea.GetItemNumber(ll_i,'id_actividad'))
//	End If 
//Next
//
//
//luo_param.ids_vector[3]=lds_act_color
////-------------------------------------------------------------------------------------
//OpenSheetWithParm(w_imprimir_solicitud_servicio,luo_param,This.ParentWindow(),0,Original!)
////-------------------------------------------------------------------------------------
//
//
end event

event ue_cambiar_condicion_orden;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 02 de Febrero de 2005 HORA 17:38:11:687
// 
// Para cambiar la condici$$HEX1$$f300$$ENDHEX$$n de una orden
//////////////////////////////////////////////////////////////////////////

n_cst_param 	lo_param

lo_param.il_vector[1]=il_nu_orden


OpenWithParm(w_cambio_condicion_orden,lo_param)
end event

event ue_observacion_ss();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Martes 09 de Agosto de 2005 HORA 17:38:39:203
// 
// Para colocar observaciones a las solicitudes de servicio
//////////////////////////////////////////////////////////////////////////


n_cst_param 	lo_param


If il_nu_orden<=0 Then
	MessageBox("Advertencia!","La orden no se ha asignado.",StopSign!)
	Return
End If


lo_param.il_vector[1]=il_nu_orden

OpenwithParm(w_observacion_ss,lo_param)

end event

event ue_imprimir_ss_agrupada();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Lunes 15 de Agosto (Festivo) de 2005 HORA 17:15:18:562
// 
// Para imprimir las nuevas ss agrupadas
//////////////////////////////////////////////////////////////////////////

long ll_i

u_dw_application 	ldw_tarea
n_cst_param_orden	luo_param
n_ds_application 	lds_act_color
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
ldw_tarea=tab_activ_oper.tabpage_tareas.dw_tareas
//-------------------------------------------------------------------------------------
If dw_dt_mu_ord.RowCount()<1 Then
	Return
End If
//-------------------------------------------------------------------------------------
If IsNull(il_nu_orden) OR il_nu_orden<=0 Then
		MessageBox("Advertencia","El c$$HEX1$$f300$$ENDHEX$$digo de orden no es v$$HEX1$$e100$$ENDHEX$$lido para la impresi$$HEX1$$f300$$ENDHEX$$n de solicitudes de servicio.",StopSign!)
		Return 
End If	
//-------------------------------------------------------------------------------------
If ldw_tarea.Rowcount()<=0 Then
		MessageBox("Advertencia","La orden # "+String(il_nu_orden)+" no posee tareas asignadas.",StopSign!)
		Return
End If
//-------------------------------------------------------------------------------------
ll_i=ldw_tarea.Find('nu_sol_serv>0',1,ldw_tarea.RowCount())
If ll_i<=0 Then
		MessageBox('Advertencia','El orden # '+String(il_nu_orden)+' no posee solicitudes de servicio asignadas',StopSign!)
		Return				
End If
//-------------------------------------------------------------------------------------
luo_param.il_vector[1]=il_fabrica
luo_param.il_vector[2]=il_linea
luo_param.il_vector[3]=il_muestra
luo_param.il_vector[4]=il_nu_orden
//-------------------------------------------------------------------------------------
OpenSheetWithParm(w_imprimir_clase_ss,luo_param,This.ParentWindow(),0,Original!)
//-------------------------------------------------------------------------------------


end event

event ue_observacion_ss_tinta();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Martes 09 de Agosto de 2005 HORA 17:38:39:203
// 
// Para colocar observaciones a las solicitudes de servicio
//////////////////////////////////////////////////////////////////////////

n_cst_param 	lo_param


If il_nu_orden<=0 Then
	MessageBox("Advertencia!","La orden no se ha asignado.",StopSign!)
	Return
End If


lo_param.il_vector[1]=il_nu_orden

OpenwithParm(w_observacion_ss_tinta,lo_param)

end event

public function integer of_redraw (boolean ab_redrawing);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 22 de Septiembre de 2004.H:15:47
---------------------------------------------------
---------------------------------------------------*/
dw_dt_mu_ord.SetRedraw(ab_redrawing)
dw_dt_mu_ord_col.SetRedraw(ab_redrawing)
tab_activ_oper.tabpage_mp_base.dw_mp_base.SetRedraw(ab_redrawing)
tab_activ_oper.tabpage_procesos.dw_operacion_muestra.SetRedraw(ab_redrawing)
tab_activ_oper.tabpage_actividades.dw_actividad_muestra.SetRedraw(ab_redrawing)
tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante.SetRedraw(ab_redrawing)
tab_activ_oper.tabpage_bordado.dw_bordado.SetRedraw(ab_redrawing)
tab_activ_oper.tabpage_tareas.dw_tareas.SetRedraw(ab_redrawing)
tab_activ_oper.tabpage_repeticion.dw_repeticiones.SetRedraw(ab_redrawing)

Return 1
end function

public function long of_buscar_muestra ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 22 de Septiembre de 2004.H:15:36
---------------------------------------------------
Se utiliza 0 para nueva
---------------------------------------------------*/
n_ds_application lds_muestra
Long 	ll_co_ejecutiva,ll_res,ll_a,ll_b,ll_limidc, &
		ll_grupo_tlla,ll_talla,ll_recurso,ll_tipoprod,ll_tipo_tejido
String ls_co_ctecnico, ls_msj
u_dw_application ldw_v
n_cst_comun  lo_comun
TRY
//-----------------------------------------------------------------------------------------------------
If ib_cambios Then
	ll_res=MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
	If ll_res=2 Then
		Return -2
	End If
End If
ib_cambios=False
//-----------------------------------------------------------------------------------------------------
ib_era = False
cb_programar.Enabled = False
If ib_busq_camb Then
	il_fabrica 	= 	iou_param.il_vector[1] 
	il_linea		=	iou_param.il_vector[2]
	il_muestra 	= 	iou_param.il_vector[3]
End If
//-----------------------------------------------------------------------------------------------------
il_nu_orden=0
of_title(2)
//-----------------------------------------------------------------------------------------------------
lds_muestra = CREATE n_ds_application
lds_muestra.of_load('d_m_muestras_orden')
lds_muestra.of_conexion(n_cst_application.itr_appl,True)
ll_res = lds_muestra.Retrieve(il_fabrica,il_linea,il_muestra)
Choose Case ll_res
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de la muestra(ds).",StopSign!)
		dw_dt_mu_ord.InsertRow(0)		
		Return -1
	Case 0
		MessageBox("Advertencia!","La muestra no ha sido encontrada(ds).",StopSign!)			
		Return -1	
End Choose


//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Martes 15 de Marzo de 2005 HORA 08:57:48:453
// 
//  http://intranet/solicitud/application/rep/view.asp?id=7893
// Verificar que el recurso sea uno de la planta de preproduccion
//////////////////////////////////////////////////////////////////////////

il_tipo_prod 		= lds_muestra.GetItemNumber(1,'co_tipoprod')
ll_recurso   		= lds_muestra.GetItemNumber(1,'co_recurso')
il_recMuestraBas 	= lds_muestra.GetItemNumber(1,'co_recurso')
//-----------------------------------------------------------------------------------------------------
If dw_dt_mu_ord.RowCount()>0 Then
			 of_Reset()
End If
of_cargar_dddw() 
dw_total_pares.InsertRow(0)
ll_a = dw_dt_mu_ord.InsertRow(0)
dw_dt_mu_ord.SetItem(ll_a,'nu_orden',0)
dw_dt_mu_ord.SetItem(ll_a,'co_fabrica',lds_muestra.GetItemNumber(1,'co_fabrica'))
dw_dt_mu_ord.SetItem(ll_a,'co_linea',lds_muestra.GetItemNumber(1,'co_linea'))
dw_dt_mu_ord.SetItem(ll_a,'co_muestra',lds_muestra.GetItemNumber(1,'co_muestra'))		
dw_dt_mu_ord.SetItem(ll_a,'de_muestra',lds_muestra.GetItemString(1,'de_muestra'))
dw_dt_mu_ord.SetItem(ll_a,'co_ejecutiva',lds_muestra.GetItemNumber(1,'co_ejecutiva'))
dw_dt_mu_ord.SetItem(ll_a,'co_ctecnico',lds_muestra.GetItemString(1,'desarrollador'))
dw_dt_mu_ord.SetItem(ll_a,'co_grupo_tlla',lds_muestra.GetItemNumber(1,'co_grupo_tlla'))
dw_dt_mu_ord.SetItem(ll_a,'co_talla',lds_muestra.GetItemNumber(1,'co_talla'))
dw_dt_mu_ord.SetItem(ll_a,'co_tipoprod',lds_muestra.GetItemNumber(1,'co_tipoprod'))
dw_dt_mu_ord.SetItem(ll_a,'co_tipo_tejido',lds_muestra.GetItemNumber(1,'co_tipo_tejido'))
dw_dt_mu_ord.SetItem(ll_a,'co_recurso',lds_muestra.GetItemNumber(1,'co_recurso'))
dw_dt_mu_ord.SetItem(ll_a,'condicion',1)//1:Registrada,2:Programada
dw_dt_mu_ord.SetItem(ll_a,'co_grupoprod',lds_muestra.GetItemNumber(1,'co_grupoprod'))
dw_dt_mu_ord.SetItem(ll_a,'ca_alimentadores',lds_muestra.GetItemNumber(1,'ca_alimentadores'))
dw_dt_mu_ord.SetItem(ll_a,'ciclo_tejido',lds_muestra.GetItemString(1,'ciclo_tejido'))

il_estado_orden=1
of_ord_programada(True)
of_title(il_estado_orden)
of_Redraw(True)
/***********************************************************
SA51505 - Ceiba/JJ - 15-10-2015
Comentario: Verificar si se debe habilitar o no el campo recurso
***********************************************************/
IF wf_ValidarCampoRecursoHabilitado() THEN 
	wf_setpropertiescamporecurso(TRUE)
ELSE
	wf_setpropertiescamporecurso(FALSE)
END IF 

//----------------------------------------------------------------------------------------------
//// CARGA DE DESCRIPCIONES
/* Nombre de ejecutiva(o):*/
is_tipo_muestra = lds_muestra.GetItemString(1,'tipo_muestra')
ll_co_ejecutiva = lds_muestra.GetItemNumber(1,'co_ejecutiva')
ll_res = lo_comun.of_nombreejecutiva(is_tipo_muestra /*string a_tipo*/,&
                                   	ll_co_ejecutiva/*long a_codigo*/,&
											  	n_cst_application.itr_appl/*transaction a_transaction */)
If ll_res=1 Then
	dw_dt_mu_ord.SetItem(1,"de_ejecutiva",lo_comun.of_getString(1))
End If
/* Nombre de t$$HEX1$$e900$$ENDHEX$$cnico:*/
ls_co_ctecnico = lds_muestra.GetItemString(1,'desarrollador')
ll_res=lo_comun.of_nombredesarrollador(ls_co_ctecnico,n_cst_application.itr_appl)
If ll_res=1 then
	dw_dt_mu_ord.SetItem(1,"de_ctecnico",lo_comun.of_getString(1))	
End If
/* Nombre de Grupo Talla:*/
ll_grupo_tlla = lds_muestra.GetItemNumber(1,'co_grupo_tlla')
ll_res=lo_comun.of_nombregrupotalla(ll_grupo_tlla,n_cst_application.itr_appl)
If ll_res=1 then
	dw_dt_mu_ord.SetItem(1,"de_grupo_talla",lo_comun.of_getString(1))	
End If
/* Nombre de Talla:*/
ll_talla = lds_muestra.GetItemNumber(1,'co_talla')
ll_res=lo_comun.of_nombretalla(ll_grupo_tlla,ll_talla,n_cst_application.itr_appl)
If ll_res=1 then
	dw_dt_mu_ord.SetItem(1,"de_talla",lo_comun.of_getString(1))	
End If
/* Nombre de Recurso:*/
ll_res = lo_comun.of_nombreRecursomues(ll_recurso,n_cst_application.itr_appl)
//ll_res = lo_comun.of_nombrerecursotj(ll_recurso,n_cst_application.itr_appl)
//ll_res=lo_comun.of_nombregrupotalla(ll_recurso,n_cst_application.itr_appl)
If ll_res=1 then
	dw_dt_mu_ord.SetItem(1,"de_recurso",lo_comun.of_getString(1))	
End If
/* Nombre de Tipo producto:*/
ll_tipoprod = lds_muestra.GetItemNumber(1,'co_tipoprod')
ll_res=lo_comun.of_nombretipoprod(ll_tipoprod,n_cst_application.itr_appl)
If ll_res=1 then
	dw_dt_mu_ord.SetItem(1,"de_tipoprod",lo_comun.of_getString(1))	
End If
/* Nombre de Tipo tejido:*/
ll_tipo_tejido = lds_muestra.GetItemNumber(1,'co_tipo_tejido')
ll_res=lo_comun.of_nombretipotejido(ll_tipoprod,ll_tipo_tejido,n_cst_application.itr_appl)
If ll_res=1 then
	dw_dt_mu_ord.SetItem(1,"de_tipo_tejido",lo_comun.of_getString(1))	
End If
il_talla=ll_talla

long ll_cliente, ll_sucursal
//////////////////////////////////////////////////////////////////////////
// YOVANNY GALVEZ ZULUAGA
// Miercoles 31 de Agosto 2005 
// proridad del cliente
//////////////////////////////////////////////////////////////////////////
ll_cliente 	= lds_muestra.GetItemNumber(1,'co_cliente')
ll_sucursal = lds_muestra.GetItemNumber(1,'co_sucursal')

of_obtener_prioridad(is_tipo_muestra,ll_cliente,ll_sucursal)

/*************YGZ*********/
/*---------------------------------------------------------------------------------------
Cargo los datastore instancia de la ventana.
---------------------------------------------------------------------------------------*/
// Carga de los colores de la muestra.
ll_res=This.of_cargar_ids('col')
Choose Case ll_res
	Case Is < 0
		MessageBox("Error!","Recuperaci$$HEX1$$f300$$ENDHEX$$n de los colores de la muestra.",StopSign!)		
		Return -1
	Case 0
		ls_msj+='~nMuestra sin colores asignados'
	Case Else
		For ll_a=1 To ids_dt_muestras_col.RowCount()
			dw_dt_mu_ord_col.InsertRow(0)
			dw_dt_mu_ord_col.SetItem(ll_a,'co_color',ids_dt_muestras_col.GetItemNumber(ll_a,'co_color'))
			dw_dt_mu_ord_col.SetItem(ll_a,'de_color',ids_dt_muestras_col.GetItemString(ll_a,'de_color'))
			//******* CARGAR DATO AL GRABAR*******************
			dw_dt_mu_ord_col.SetItem(ll_a,'cons_color',ll_a)
			//************************************************
			dw_dt_mu_ord_col.SetItem(ll_a,'pares_tejer',ids_dt_muestras_col.GetItemNumber(ll_a,'pares_tejer'))
			dw_dt_mu_ord_col.SetItem(ll_a,'pares_despachar',ids_dt_muestras_col.GetItemNumber(ll_a,'pares_despachar'))
			//dw_dt_mu_ord_col.SetItem(ll_a,'co_estado',ids_dt_muestras_col.GetItemNumber(ll_a,'co_estado'))
			//dw_dt_mu_ord_col.SetItem(ll_a,'co_ctecnico',ids_dt_muestras_col.GetItemString(ll_a,'co_ctecnico'))
			//dw_dt_mu_ord_col.SetItem(ll_a,'fe_estado',ids_dt_muestras_col.GetItemDateTime(ll_a,'fe_estado'))
		Next
		dw_total_pares.SetItem(1,'total_ptejer',ids_dt_muestras_col.GetItemNumber(1,'compute_ptejer'))
		dw_total_pares.SetItem(1,'total_pdespachar',ids_dt_muestras_col.GetItemNumber(1,'compute_pdespa'))
End Choose
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//Carga las materias primas de la muestra
ll_res=This.of_cargar_ids('mp')
Choose Case ll_res
	Case Is < 0
		MessageBox("Error!","Recuperaci$$HEX1$$f300$$ENDHEX$$n de las materias primas base de la muestra.",StopSign!)		
		Return -1
	Case 0
		ls_msj+='~nMuestra sin materias primas base'
	Case Else
		ldw_v = tab_activ_oper.tabpage_mp_base.dw_mp_base
		For ll_a=1 To ids_mp_base_mues.RowCount()
			ldw_v.InsertRow(0)
			ldw_v.SetItem(ll_a,'co_fabrica',ids_mp_base_mues.GetItemNumber(ll_a,'co_fabrica'))
			ldw_v.SetItem(ll_a,'co_linea',ids_mp_base_mues.GetItemNumber(ll_a,'co_linea'))
			ldw_v.SetItem(ll_a,'co_muestra',ids_mp_base_mues.GetItemNumber(ll_a,'co_muestra'))
			ldw_v.SetItem(ll_a,'consec',ids_mp_base_mues.GetItemNumber(ll_a,'consec'))
			ldw_v.SetItem(ll_a,'co_fabrica_mp',ids_mp_base_mues.GetItemNumber(ll_a,'co_fabrica_mp'))
			ldw_v.SetItem(ll_a,'co_producto',ids_mp_base_mues.GetItemNumber(ll_a,'co_producto'))
			ldw_v.SetItem(ll_a,'de_producto',ids_mp_base_mues.GetItemString(ll_a,'de_producto'))			
		Next		
End Choose
//--------------------------------------------------------------------------------------------------
//Carga las operaciones de la muestra 
ldw_v = tab_activ_oper.tabpage_procesos.dw_operacion_muestra
ldw_v.SetFilter("")
ldw_v.Filter()
ll_res = ldw_v.Retrieve(il_fabrica,il_linea,il_muestra)
Choose Case ll_res
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de los procesos de la muestra relacionada con la orden.",StopSign!)
		Title="Orden "
		Return -1
	Case 0
		ls_msj+="~nMuestra sin operaciones para la nueva orden"
//		of_reset()
//		Title="Orden "
//		Return -1
End Choose
//-------------------------------------------------------------------------------------------------
// Carga de las actividades de la muestra
ldw_v = tab_activ_oper.tabpage_actividades.dw_actividad_muestra
ldw_v.SetFilter("")
ldw_v.Filter()
ll_res = ldw_v.Retrieve(il_fabrica,il_linea,il_muestra)
Choose Case ll_res
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de las actividades de la muestra relacionada con la orden.",StopSign!)
		Title="Orden "
		Return -1
	Case 0
		ls_msj+="~nMuestra sin actividades para la nueva orden"
//		of_reset()
//		Title="Orden "
//		Return -1
End Choose
//----------------------------------------------------------------------------------

of_cargar_ids('ss_tmp')
of_cargar_ids('ss_mp_tmp')
//----------------------------------------------------------------------------------
MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Datos de la muestra cargados!"+ls_msj,Information!)
il_estado_orden = 1
cb_programar.Enabled = True
Return 1
CATCH (Exception le_error)
	Messagebox("Error Busqueda orden de produccion", le_error.getmessage(), StopSign!)
END TRY
end function

public function long of_cargar_ids (string as_ds);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 28 de Septiembre de 2004.H:16:29
---------------------------------------------------
Se crean y se cargan los ds de la w
la fabrica, linea, muestra deben estar asignados a sus
variables instancia respectiva.
---------------------------------------------------*/
Long ll_res,ll_i
Choose Case as_ds		
	Case 'col'
			ids_dt_muestras_col = CREATE n_ds_application
			ids_dt_muestras_col.of_load('d_dt_muestras_col')
			ll_res = Integer(ids_dt_muestras_col.Describe("DataWindow.Column.Count"))
			For ll_i = 1 To ll_res
					ids_dt_muestras_col.Modify("#"+String(ll_i)+".DDDW.AutoRetrieve=No")
			Next			
			ids_dt_muestras_col.of_conexion(n_cst_application.itr_appl,True)
			ll_res = ids_dt_muestras_col.Retrieve(il_fabrica,il_linea,il_muestra,0,0)
	Case 'proc'/*DEPRECATED*/
			ids_m_proref_muestras = CREATE n_ds_application
			ids_m_proref_muestras.of_load('d_m_proref_muestras')
			ll_res = Integer(ids_m_proref_muestras.Describe("DataWindow.Column.Count"))
			For ll_i = 1 To ll_res
					ids_m_proref_muestras.Modify("#"+String(ll_i)+".DDDW.AutoRetrieve=No")
			Next	
			ids_m_proref_muestras.of_conexion(n_cst_application.itr_appl,True)
			ll_res = ids_m_proref_muestras.Retrieve(il_fabrica,il_linea,il_muestra,il_talla)
	Case 'mp'
			ids_mp_base_mues = CREATE n_ds_application
			ids_mp_base_mues.of_load('d_mu_mp_base')
			ids_mp_base_mues.of_conexion(n_cst_application.itr_appl,True)
			ll_res = ids_mp_base_mues.Retrieve(il_fabrica,il_linea,il_muestra)
			
End Choose

Return ll_res

end function

public function integer of_reset ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 29 de Septiembre de 2004.H:15:49
---------------------------------------------------
---------------------------------------------------*/
dw_dt_mu_ord.Reset()
dw_total_pares.Reset()
dw_dt_mu_ord_col.Reset()
tab_activ_oper.tabpage_mp_base.dw_mp_base.Reset()
tab_activ_oper.tabpage_procesos.dw_operacion_muestra.Reset()
tab_activ_oper.tabpage_actividades.dw_actividad_muestra.Reset()
tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante.Reset()
tab_activ_oper.tabpage_bordado.dw_bordado.Reset()
tab_activ_oper.tabpage_tareas.dw_tareas.Reset()
tab_activ_oper.tabpage_repeticion.dw_repeticiones.Reset()

//-------------------------------------------------
This.Title='Orden de Producci$$HEX1$$f300$$ENDHEX$$n de Muestras'
cb_programar.Text='Programar Orden'
cb_programar.Enabled=False

Return 1
end function

public function long of_buscar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 22 de Septiembre de 2004.H:17:05
---------------------------------------------------
Buscar las ordenes almacenadas
---------------------------------------------------*/
Long ll_resultado,ll_i,ll_cod,ll_res, ll_indicador_mp, ll_co_reserva_sap, ll_co_tipoprod
String ls_tipo_muestra,ls_co_ctecnico,ls_msj
n_cst_comun lo_comun
u_dw_application ldw_c
DataWindowChild 	ldc_tipo_orden, ldc_causa

TRY
//-------------------------------------------------------------------------------------------------
If ib_cambios Then
	ll_i=MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
	If ll_i=2 Then
		Return -2
	End If
End If
ib_cambios=False
//-------------------------------------------------------------------------------------------------
il_talla=-1
ib_era = false
If (ib_busq_camb) Then
	il_fabrica 	= 	iou_param.il_vector[1] 
	il_linea		=	iou_param.il_vector[2]
	il_muestra 	= 	iou_param.il_vector[3]
	il_nu_orden = 	iou_param.il_vector[4]
End If
If dw_dt_mu_ord.RowCount()>0 Then
	of_Reset()
End If
//-------------------------------------------------------------------------------------------------
of_cargar_dddw()
//-------------------------------------------------------------------------------------------------
// Retrieve a los datos de la tabla de orden de producci$$HEX1$$f300$$ENDHEX$$n'dt_mu_ord'
ll_resultado = dw_dt_mu_ord.Retrieve(il_fabrica,il_linea, &
												il_muestra,il_nu_orden)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de la orden de producci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
		Title="Orden "
		Return -1
	Case 0
		MessageBox("Advertencia!","La orden no ha sido encontrada en el registro.",StopSign!)	
		of_reset()
		Title="Orden "
		Return -1
End Choose

il_tipo_prod = dw_dt_mu_ord.GetItemNumber(1,'co_tipoprod')

ls_msj = ''
ll_indicador_mp 	= dw_dt_mu_ord.GetItemNumber( 1,'indicador_mp')
ll_co_reserva_sap = dw_dt_mu_ord.GetItemNumber( 1,'co_reserva_sap')
If ll_indicador_mp > 0 Then
	ls_msj = '~r~nReserva SAP ' + String( ll_co_reserva_sap )
	If ll_indicador_mp = 1 Then
		ls_msj += ' Sin pedir'
	ElseIf ll_indicador_mp = 2 Then
		ls_msj += ' con Pedido NT'
	End If
End If



/***********************************************************
SA51505 - Ceiba/JJ - 15-10-2015
Comentario: Verificar si se debe habilitar o no el campo recurso
***********************************************************/
IF wf_ValidarCampoRecursoHabilitado() THEN 
	wf_setpropertiescamporecurso(TRUE)
ELSE
	wf_setpropertiescamporecurso(FALSE)
END IF

dw_total_pares.InsertRow(0)
il_estado_orden=dw_dt_mu_ord.GetItemNumber(1,'condicion')
of_title(il_estado_orden)
ll_res=lo_comun.of_tipo_muestra(il_fabrica,il_linea,il_muestra,n_cst_application.itr_appl)
If ll_res=1 Then
	is_tipo_muestra=lo_comun.of_getstring(1)
End If
//-------------------------------------------------------------------------------------------------
If Not (ib_busq_camb) Then 
	il_nu_orden = dw_dt_mu_ord.GetItemNumber(1,'nu_orden')
	tab_activ_oper.tabpage_procesos.dw_operacion_muestra.Reset()
	tab_activ_oper.tabpage_actividades.dw_actividad_muestra.Reset()
End If
//-------------------------------------------------------------------------------------------------
// Retrieve a los datos de la tabla de colores de la orden 'dt_mu_ord_col'
ll_resultado = dw_dt_mu_ord_col.Retrieve(il_nu_orden,il_fabrica,il_linea)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de los colores de la orden.",StopSign!)
		Title="Orden "
		Return -1
	Case 0
		ls_msj+="~nLa orden no posee colores registrados"
End Choose
If ll_resultado>0 Then
	dw_total_pares.SetItem(1,'total_ptejer',dw_dt_mu_ord_col.GetItemNumber(1,'compute_ptejer'))
	dw_total_pares.SetItem(1,'total_pdespachar',dw_dt_mu_ord_col.GetItemNumber(1,'compute_pdespachar'))
End If
//-------------------------------------------------------------------------------------------------
// Retrieve a los datos de la tabla de materia prima de la orden 'mu_mp_base'
ldw_c = tab_activ_oper.tabpage_mp_base.dw_mp_base
ldw_c.SetFilter("")
ldw_c.Filter()
ll_resultado = ldw_c.Retrieve(il_nu_orden)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de la materia prima de la orden.",StopSign!)
		Title="Orden "
		Return -1
	Case 0
		ls_msj+="~nOrden sin materia prima asignada"
//		of_reset()
//		Title="Orden "
//		Return -1
End Choose
//-------------------------------------------------------------------------------------------------
// Retrieve a los datos de la tabla de procesos de la muestra 'm_proref_muestras'
ldw_c = tab_activ_oper.tabpage_procesos.dw_operacion_muestra
ldw_c.SetFilter("")
ldw_c.Filter()
ll_resultado = ldw_c.Retrieve(il_fabrica,il_linea,il_muestra)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de los procesos de la muestra relacionada con la orden.",StopSign!)
		Title="Orden "
		Return -1
	Case 0
		ls_msj+="~nMuestra relacionada con la orden sin operaciones"
End Choose
//-------------------------------------------------------------------------------------------------
// Retrieve a los datos de la tabla de actividades de la muestra 'mu_mues_activ'
ldw_c = tab_activ_oper.tabpage_actividades.dw_actividad_muestra
ldw_c.SetFilter("")
ldw_c.Filter()
ll_resultado = ldw_c.Retrieve(il_fabrica,il_linea,il_muestra)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de las actividades de la muestra relacionada con la orden.",StopSign!)
		Title="Orden "
		Return -1
	Case 0
		ls_msj+="~nMuestra relacionada con la orden sin actividades"
//		of_reset()
//		Title="Orden "
//		Return -1
End Choose
//-------------------------------------------------------------------------------------------------
// Retrieve a los datos de la tabla de antideslizantes de la orden 'mu_dt_chablon'
ldw_c = tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante
ldw_c.SetFilter("")
ldw_c.Filter()
ll_resultado = ldw_c.Retrieve(il_nu_orden)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de los chablones/antideslizantes de los colores de la orden.",StopSign!)
		Title="Orden "
		Return -1
	Case 0
		ls_msj+="~nOrden sin Chablones/Antideslizantes asignados"
End Choose
//-------------------------------------------------------------------------------------------------
// Retrieve a los datos de la tabla de bordados de la ordem 'mu_dt_bordado'
ldw_c = tab_activ_oper.tabpage_bordado.dw_bordado
ldw_c.SetFilter("")
ldw_c.Filter()
ll_resultado = ldw_c.Retrieve(il_nu_orden)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de los bordados de los colores de la orden.",StopSign!)
		Title="Orden "
		Return -1
	Case 0
		ls_msj+="~nOrden sin Bordados asignados"
End Choose
il_fila_col=1
of_filtrar_chab_bord()
//-------------------------------------------------------------------------------------------------
// Retrieve a los datos de la tabla de tareas de la orden 'mu_gantt'
ldw_c = tab_activ_oper.tabpage_tareas.dw_tareas
ldw_c.SetFilter("")
ldw_c.Filter()
ll_resultado = ldw_c.Retrieve(il_nu_orden)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de las tareas asignadas a la orden.",StopSign!)
		Title="Orden "
		Return -1
	Case 0
		ls_msj+="~nOrden sin tareas programadas"
		il_fila_tarea=0
End Choose

//Carga el c$$HEX1$$f300$$ENDHEX$$digo del color
For ll_i=1 to ll_resultado
	ll_cod=ldw_c.GetItemNumber(ll_i,'cons_color')
	If ll_cod <> 0 Then
		ll_res=dw_dt_mu_ord_col.Find('cons_color='+String(ll_cod),1,dw_dt_mu_ord_col.RowCount())
		ldw_c.SetItem(ll_i,'co_color',dw_dt_mu_ord_col.GetItemNumber(ll_res,'co_color'))
	End If
	ldw_c.SetItemStatus(ll_i,0,Primary!,NotModified!)
Next

//consulta si tiene repeticiones
ll_resultado = tab_activ_oper.tabpage_repeticion.dw_repeticiones.Retrieve(il_nu_orden)
If ll_resultado = 0 Then
	//mira si es orden repeticion de otra orden
	If dw_dt_mu_ord.GetItemNumber(1, 'orden_act_repeticion') > 0 Then
		 tab_activ_oper.tabpage_repeticion.dw_repeticiones.Retrieve(dw_dt_mu_ord.GetItemNumber(1, 'orden_act_repeticion'))
	End if
End if

ll_resultado = dw_mu_soli_hilaza.Retrieve(il_nu_orden)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de las tareas asignadas a la orden.",StopSign!)
		Title="Orden "
		Return -1
	Case 0
		ls_msj+="~nOrden sin tareas programadas"
		il_fila_tarea=0
End Choose


ll_resultado = dw_mu_soli_tinta.Retrieve(il_nu_orden)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de las tareas asignadas a la orden.",StopSign!)
		Title="Orden "
		Return -1
	Case 0
		ls_msj+="~nOrden sin tareas (tinta) programadas"
		il_fila_tarea=0
End Choose

//-------------------------------------------------------------------------------------------------
// Retrieve a los datos de la tabla de materia prima para las ss de la orden 'mu_sol_serv_mp'
ll_resultado=This.of_cargar_ids('ss_mp')
Choose Case ll_resultado
	Case Is < 0
		MessageBox("Advertencia!","Error recuperando las materias primas de las solicitudes de servicio para la orden.",StopSign!)
		Return -1
	Case 0
		ls_msj+='~nOrden sin alguna materia prima para las solicitudes de servicio asignadas'	
End Choose
of_redraw(true)	
ib_era = true
If Not ib_save Then
	MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Orden No.: "+String(il_nu_orden)+' cargada!'+ls_msj,Information!)
Else
	ib_save=False
End If

dw_dt_mu_ord.GetChild('tipo',ldc_tipo_orden)
	
//filtra tipo orden por el tipo de producto
ll_co_tipoprod = dw_dt_mu_ord.GetitemNumber(1,'co_tipoprod')
ldc_tipo_orden.SetFilter('co_tipoprod = ' + String(ll_co_tipoprod))
ldc_tipo_orden.Filter()

dw_dt_mu_ord.GetChild('cod_causa',ldc_causa)
//filtra tipo orden por el tipo de producto
ldc_causa.SetFilter('co_tipoprod = ' + String(ll_co_tipoprod))
ldc_causa.Filter()
	
il_consecutivo_repeticion = -1
il_orden_repeticion_orig = 0
//ids_mu_sol_serv.ShareData(dw_1)
//ids_mu_sol_serv_mp.Sharedata(dw_2)
//-------------------------------------------------------------------------------------------------
Return 1
CATCH(Throwable le_error)
	Messagebox("Error Cargar Orden Producci$$HEX1$$f300$$ENDHEX$$n", le_error.getmessage(), StopSign!)
End Try
end function

public function integer of_verificar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 30 de Septiembre de 2004.H:12:40
---------------------------------------------------
Verificaci$$HEX1$$f300$$ENDHEX$$n de los datos antes de grabar
---------------------------------------------------*/
Long ll_pos,ll_cod
String ls_tipo

If dw_dt_mu_ord.RowCount()=0 Then
	Return -1
End If

//--------------------------------------------
//If il_estado_orden = 2 Then //PROGRAMADA
//	MessageBox("Advertencia!","No puede modificar esta orden.~n"+ &
//					"Se encuentra en estado: PROGRAMADA",StopSign!)
//	Return -1
//End If

If dw_dt_mu_ord_col.RowCount()<=0 Then
	MessageBox("Advertencia!","La orden debe tener por lo menos, un color asignado.",StopSign!)
	Return -1
End If

//POR LO MENOS UNA ACTIV. O PROCESO SELECCIONADO

//If tab_activ_oper.tabpage_actividades.dw_actividad_muestra.RowCount()<=0 Then
//	MessageBox("Advertencia!","La orden debe tener por lo menos, un proceso asignado.",StopSign!)
//	Return -1
//End If

//--------------------------------------------
//---- si al menos un color es chequeado ...
ll_pos = dw_dt_mu_ord_col.Find("check=1",1,&
			 dw_dt_mu_ord_col.RowCount())
If ll_pos<=0 then
	MessageBox("Advertencia!","La orden debe tener por lo menos, un color asignado.",Exclamation!)
	Return -1
End If
//---- si al menos hay un proceso chequeado ...
//ll_pos = tab_activ_oper.tabpage_actividades.dw_actividad_muestra.Find("co_chequeo=1",1,&
//			 tab_activ_oper.tabpage_actividades.dw_actividad_muestra.RowCount())
//If ll_pos<=0 then
//	MessageBox("Advertencia!","La orden debe tener por lo menos, un proceso asignado.",Exclamation!)
//	Return -1
//End If

//--------------------------------------------
If dw_dt_mu_ord.AcceptText()<>1 Then
	//MessageBox("Advertencia!","Datos de la orden no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Trigger Event key(Key1!,2)
	Return -1
End If

If dw_total_pares.AcceptText()<>1 Then
	//MessageBox("Advertencia!","Datos de los totales de pares no son v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Trigger Event key(Key1!,2)
	dw_total_pares.SetFocus()
	Return -1
End If

If dw_dt_mu_ord_col.AcceptText()<>1 Then
	//MessageBox("Advertencia!","Datos de los colores no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Trigger Event key(Key2!,2)
	Return -1
End If

If tab_activ_oper.tabpage_mp_base.dw_mp_base.AcceptText()<>1 Then
	//MessageBox("Advertencia!","Datos de la materia prima base no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Trigger Event key(Key3!,2)
	Return -1
End If
//***************
tab_activ_oper.tabpage_bordado.dw_bordado.SetFilter('')
tab_activ_oper.tabpage_bordado.dw_bordado.Filter()
If tab_activ_oper.tabpage_bordado.dw_bordado.AcceptText()<>1 Then
	//MessageBox("Advertencia!","Datos de los bordados no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
//	ll_pos=tab_activ_oper.tabpage_bordado.dw_bordado.GetRow()
//	ll_cod=tab_activ_oper.tabpage_bordado.dw_bordado.GetItemNumber(ll_pos,'cons_color')
//	ll_pos=dw_dt_mu_ord_col.Find('cons_color='+String(ll_cod)+' AND check=1',1,dw_dt_mu_ord_col.RowCount())
//	dw_dt_mu_ord_col.Trigger Event rowfocuschanged(ll_pos)
	Trigger Event key(Key7!,2)
	Return -1
End If
tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante.SetFilter('')
tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante.Filter()
If tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante.AcceptText()<>1 Then
	//MessageBox("Advertencia!","Datos de los antideslizantes no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
//	ll_pos=tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante.GetRow()
//	ll_cod=tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante.GetItemNumber(ll_pos,'cons_color')
//	ll_pos=dw_dt_mu_ord_col.Find('cons_color='+String(ll_cod)+' AND check=1',1,dw_dt_mu_ord_col.RowCount())
//	dw_dt_mu_ord_col.Trigger Event rowfocuschanged(ll_pos)
	Trigger Event key(Key6!,2)
	Return -1
End If

If tab_activ_oper.tabpage_tareas.dw_tareas.AcceptText()<>1 Then
	//MessageBox("Advertencia!","Datos de las tareas no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Trigger Event key(Key8!,2)
	Return -1
End If

//verificaa que se tengaa el caampo tipo
ls_tipo = dw_dt_mu_ord.GetitemString(1,'tipo')
If Isnull(ls_tipo) or trim(ls_tipo) = '' then
	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n!","El campo Tipo esta en blanco y es obligaatorio.")
	Return -1
End if

//-----------------------------------------------------------------------------
If Not dw_dt_mu_ord.of_completedata() Then
	Trigger Event key(Key1!,2)	
	Return -1
End If
If Not dw_dt_mu_ord_col.of_completedata() Then
	Trigger Event key(Key2!,2)	
	Return -1
End If
If Not tab_activ_oper.tabpage_mp_base.dw_mp_base.of_completedata() Then
	Trigger Event key(Key3!,2)	
	Return -1
End If

If Not tab_activ_oper.tabpage_bordado.dw_bordado.of_completedata() Then
	ll_pos=tab_activ_oper.tabpage_bordado.dw_bordado.GetRow()
	ll_cod=tab_activ_oper.tabpage_bordado.dw_bordado.GetItemNumber(ll_pos,'cons_color')
	ll_pos=dw_dt_mu_ord_col.Find('cons_color='+String(ll_cod)+' AND check=1',1,dw_dt_mu_ord_col.RowCount())
	dw_dt_mu_ord_col.Trigger Event rowfocuschanged(ll_pos)
	Trigger Event key(Key7!,2)
	Return -1
End If

If Not tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante.of_completedata() Then
	ll_pos=tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante.GetRow()
	ll_cod=tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante.GetItemNumber(ll_pos,'cons_color')
	ll_pos=dw_dt_mu_ord_col.Find('cons_color='+String(ll_cod)+' AND check=1',1,dw_dt_mu_ord_col.RowCount())
	dw_dt_mu_ord_col.Trigger Event rowfocuschanged(ll_pos)
	Trigger Event key(Key6!,2)
	Return -1
End If

If Not tab_activ_oper.tabpage_tareas.dw_tareas.of_completedata() Then
	Trigger Event key(Key8!,2)
	Return -1
End If

If of_verificarPrecedencias()<>1 Then
	Return -1
End If


//*******************
//If tab_activ_oper.tabpage_tareas.dw_tareas.RowCount()<=0 Then
////	MessageBox("Advertencia!","No existe ninguna operaci$$HEX1$$f300$$ENDHEX$$n o actividad registrada para las tareas.",StopSign!)
////	If MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","No existe ninguna operaci$$HEX1$$f300$$ENDHEX$$n o actividad registrada para las tareas.Desea continuar?",Question!,YesNo!,2)=2 Then
////		Return -1
////	End If
//	//Return -1
//End If
//*******************

//-----YGZ-----\\
long ll_crudo,i,&
	  ll_proveedor
string  ls_lote

ll_crudo = dw_dt_mu_ord.GetitemNumber(dw_dt_mu_ord.GetRow(),"co_caract_mp")

//-----VERIFICAR QUE DATOS DE PROVEEDOR-----\\
If ll_crudo = 1 Then
	For i = 1 to  tab_activ_oper.tabpage_mp_base.dw_mp_base.RowCount()
		ls_lote		 = tab_activ_oper.tabpage_mp_base.dw_mp_base.GetitemString(i,"mp_lote")
		ll_proveedor = tab_activ_oper.tabpage_mp_base.dw_mp_base.GetitemNumber(i,"co_proveedor")
		If IsNull(ls_lote) OR  Trim(ls_lote) = ""  OR IsNull(ll_proveedor) OR (ll_proveedor = 0) Then
			MessageBox("Advertencia!","Favor verificar que en la fila "+string(i) +& 
			" Se indico proveedor y lote ",StopSign!)
			tab_activ_oper.tabpage_mp_base.dw_mp_base.Trigger Event rowfocuschanged(i)
			Trigger Event key(Key3!,2)	
			Return -1
		End if	
	Next
End If	
//-----YGZ-----\\

Return 1
end function

public function integer of_carga_objtr ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 30 de Septiembre de 2004.H:14:48
---------------------------------------------------
Carga los obj. de transacci$$HEX1$$f300$$ENDHEX$$n
---------------------------------------------------*/
Long ll_res
//---------------------------------------------------
dw_dt_mu_ord.of_conexion(n_cst_application.itr_appl,True)
dw_mu_soli_hilaza.of_conexion(n_cst_application.itr_appl,True)
dw_mu_soli_hilaza.of_conexion(n_cst_application.itr_appl,True)

//dw_verifica_precedencia_tipoprod.of_conexion(n_cst_application.itr_appl,True)

dw_mu_soli_tinta.of_conexion(n_cst_application.itr_appl,True)

dw_tmp_mu_soli_tinta.of_conexion(n_cst_application.itr_appl,True)
//////////////////////////////////////////////////////////////////////////
// 
// 
//////////////////////////////////////////////////////////////////////////

dw_dt_mu_ord_col.of_conexion(n_cst_application.itr_appl,True)
tab_activ_oper.tabpage_mp_base.dw_mp_base.of_conexion(n_cst_application.itr_appl,True)
tab_activ_oper.tabpage_procesos.dw_operacion_muestra.of_conexion(n_cst_application.itr_appl,True)
tab_activ_oper.tabpage_actividades.dw_actividad_muestra.of_conexion(n_cst_application.itr_appl,True)
tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante.of_conexion(n_cst_application.itr_appl,True)
tab_activ_oper.tabpage_bordado.dw_bordado.of_conexion(n_cst_application.itr_appl,True)
tab_activ_oper.tabpage_tareas.dw_tareas.of_conexion(n_cst_application.itr_appl,True)
tab_activ_oper.tabpage_repeticion.dw_repeticiones.of_conexion(n_cst_application.itr_appl,True)

of_cargar_ids('ss')
of_cargar_ids('ss_mp')
This.Height=3276

ids_cond_orden = CREATE n_ds_application
ids_cond_orden.of_load('d_dddw_mu_cond_orden')
ids_cond_orden.of_conexion(n_cst_application.itr_appl,True)
ll_res = ids_cond_orden.Retrieve()
Choose Case ll_res
	Case Is < 0
		MessageBox("Advertencia!","Error recuperando las descripciones de las condiciones de las $$HEX1$$f300$$ENDHEX$$rdenes.",StopSign!)		
	Case 0
		MessageBox("Advertencia!","No se recuperaron las descripciones de las condiciones de las $$HEX1$$f300$$ENDHEX$$rdenes.",StopSign!)
End Choose
//--------------------------------------------------
ids_cond_tarea = CREATE n_ds_application
ids_cond_tarea.of_load('d_dddw_mu_cond_gantt')
ids_cond_tarea.of_conexion(n_cst_application.itr_appl,True)
ll_res = ids_cond_tarea.Retrieve()
Choose Case ll_res
	Case Is < 0
		MessageBox("Advertencia!","Error recuperando las descripciones de las condiciones de las tareas.",StopSign!)
		Return -1
	Case 0
		MessageBox("Advertencia!","No se recuperaron las descripciones de las condiciones de las tareas.",StopSign!)
End Choose
//--------------------------------------------------

ids_verif_precedencia_new= CREATE n_ds_application

ids_verif_precedencia_new.of_load('d_verifica_precedencia_tipoprod')
ids_verif_precedencia_new.of_conexion(n_cst_application.itr_appl,True)



Return 1

end function

public function integer of_guardar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 30 de Septiembre de 2004.H:17:25
---------------------------------------------------
Guarda despues de verificar. Devuelve 1 si es exitoso
---------------------------------------------------*/
long ll_i,ll_tot, ll_find, ll_reg
DateTime ldt_fecha, ldt_fe_prog_fin
String ls_usuario,ls_instancia,ls_filtro
u_dw_application ldw_c, ldw_p
n_cst_comun_orden lo_obj
uo_dsbase	lds_repeticion

If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If
//**********************************************************
If ib_era AND (tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante.DeletedCount()>0 OR &
					tab_activ_oper.tabpage_bordado.dw_bordado.DeletedCount()>0 ) Then
	If	lo_obj.of_constraints_deferred()<>1 Then 		
		Return -1		
	End If
End If
//**********************************************************
//--------------------------------------------------
// Cuando inserta el codigo de orden es 0 y asigna consecutivo
//--------------------------------------------------
il_nu_orden_control=il_nu_orden
If il_nu_orden=0 Then
	If of_consecutivo()<>1 Then
		Return -1
	End If
	
	dw_dt_mu_ord.SetItem(1,"nu_orden",il_nu_orden)
End If
/*----------------------------------------------------
Resto de datos para el detalle
-----------------------------------------------------*/
ls_instancia = trim(ls_instancia)
dw_dt_mu_ord.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)
//SA56888 - Ceiba/reariase - 14/06/2017
ldt_fe_prog_fin = dw_dt_mu_ord.Getitemdatetime(1,'fe_prog_fin')
If Not IsNull(ldt_fe_prog_fin) Then
	of_fecha_entrega(ldt_fe_prog_fin,il_nu_orden)
End If
//Fin SA56888
/*----------------------------------------------------
Filtro los no marcados
------------------------------------------------------*/
ldw_c = dw_dt_mu_ord_col
//ldw_p = tab_activ_oper.tabpage_actividades.dw_actividad_muestra
//----------------------------------------------------
ls_filtro = 'check=1'
ldw_c.SetFilter(ls_filtro)
ldw_c.Filter()
//ldw_p.SetFilter(ls_filtro)
//ldw_p.Filter()
If ib_era Then
	ldw_c.RowsDiscard(1, ldw_c.DeletedCount(), Delete!)
	ldw_c.RowsMove(1,ldw_c.FilteredCount(),Filter!,ldw_c,&
						1,Delete!)
//	ldw_p.RowsDiscard(1, ldw_p.DeletedCount(), Delete!)
//	ldw_p.RowsMove(1,ldw_p.FilteredCount(),Filter!,ldw_c,&
//						1,Delete!)
Else
	ldw_c.RowsDiscard(1, ldw_c.FilteredCount(), Filter!)
	//ldw_p.RowsDiscard(1, ldw_p.FilteredCount(), Filter!)
End If	
/*-------------------------------------------
Resto de datos para el detalle de colores
*/
//of_redraw(False)
If il_nu_orden_control = 0 Then	
	For ll_i=1 to ldw_c.RowCount()
		ldw_c.SetItem(ll_i,"nu_orden",il_nu_orden)
		//ldw_c.SetItem(ll_i,"cons_color",ll_i)//consecutivos por orden		
	Next
	ldw_c.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)	
	ldw_c=tab_activ_oper.tabpage_mp_base.dw_mp_base
	For ll_i=1 to ldw_c.RowCount()
		ldw_c.SetItem(ll_i,"nu_orden",il_nu_orden)
		//ldw_c.SetItem(ll_i,"consec",ll_i)//consecutivos por orden		
	Next
	ldw_c.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)	
	ldw_c=tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante
	For ll_i=1 to ldw_c.RowCount()
		ldw_c.SetItem(ll_i,"nu_orden",il_nu_orden)
		//ldw_c.SetItem(ll_i,"cons_color",ll_i)//consecutivos por orden				
	Next
	ldw_c.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)	
	ldw_c=tab_activ_oper.tabpage_bordado.dw_bordado
	For ll_i=1 to ldw_c.RowCount()
		ldw_c.SetItem(ll_i,"nu_orden",il_nu_orden)
		//ldw_c.SetItem(ll_i,"cons_color",ll_i)//consecutivos por orden		
		//ldw_c.SetItem(ll_i,"cons_parte",ll_i)
	Next
	ldw_c.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)					

Else
	ldw_c.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)	
End If

ldw_c=tab_activ_oper.tabpage_tareas.dw_tareas

ldw_c.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)

For ll_i=1 to ldw_c.RowCount()
	ldw_c.SetItem(ll_i,"nu_orden",il_nu_orden)
	//ldw_c.SetItem(ll_i,"consec",ll_i)//consecutivos por orden		
Next

For ll_i=1 to dw_mu_soli_hilaza.RowCount()
	dw_mu_soli_hilaza.SetItem(ll_i,"nu_orden",il_nu_orden)
	//ldw_c.SetItem(ll_i,"consec",ll_i)//consecutivos por orden		
Next


dw_mu_soli_hilaza.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)


For ll_i=1 to dw_mu_soli_tinta.RowCount()
	dw_mu_soli_tinta.SetItem(ll_i,"nu_orden",il_nu_orden)
	//ldw_c.SetItem(ll_i,"consec",ll_i)//consecutivos por orden		
Next

dw_mu_soli_tinta.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)

//***Ordenamiento de las tareas antes de guardar
of_orden_proc(tab_activ_oper.tabpage_tareas.dw_tareas,"posicion")
dw_dt_mu_ord.AcceptText()

//actualiza campos de sw_complemento
If dw_dt_mu_ord.GetItemNumber(1,'sw_complemento') = 1 Then
	//verifica que la orde no este en blanco
	If Isnull(dw_dt_mu_ord.GetItemNumber(1,'nu_orden_principal') ) or dw_dt_mu_ord.GetItemNumber(1,'nu_orden_principal') <= 0 Then
		of_error_orden()
		MessageBox('Atenci$$HEX1$$f300$$ENDHEX$$n','Ha marcado la orden como complemento y No ha digitado la orden principal')
		Return -1
	End if
End if

//actualiza campos de repeticiones
If dw_dt_mu_ord.GetItemNumber(1,'sw_repeticion') = 1 Then
	//verifica que la orde anterior y la causa no este en blanco
	If Isnull(dw_dt_mu_ord.GetItemNumber(1,'nu_orden_ant') ) or dw_dt_mu_ord.GetItemNumber(1,'nu_orden_ant') <= 0 Then
		of_error_orden()
		MessageBox('Atenci$$HEX1$$f300$$ENDHEX$$n','No ha digitado orden anterior')
		Return -1
	End if
	
	//verifica que la orde anterior y la causa no este en blanco
	If Isnull(dw_dt_mu_ord.GetItemNumber(1,'cod_causa') ) or dw_dt_mu_ord.GetItemNumber(1,'cod_causa') <= 0 Then
		of_error_orden()
		MessageBox('Atenci$$HEX1$$f300$$ENDHEX$$n','No ha digitado causa de repetici$$HEX1$$f300$$ENDHEX$$n')
		Return -1
	End if
	
	//busca si no existe orden
	ll_find = tab_activ_oper.tabpage_repeticion.dw_repeticiones.Find('nu_orden = ' + String(il_nu_orden) ,1, &
					 tab_activ_oper.tabpage_repeticion.dw_repeticiones.RowCount() + 1)
					 
	If ll_find = 0 Then
		//si es nuevo registro para el consecutivo
		If il_consecutivo_repeticion = -1 Then
			SELECT max(dt_repeticiones_ordenes.consecutivo_repeticion)  into :il_consecutivo_repeticion
			FROM dt_repeticiones_ordenes
			using n_cst_application.itr_appl
			;
			il_consecutivo_repeticion ++
			
			IF Isnull(il_consecutivo_repeticion) Then
				il_consecutivo_repeticion = 1
			End if
		End if
		
		//ingresa repetici$$HEX1$$f300$$ENDHEX$$n
		ll_reg = tab_activ_oper.tabpage_repeticion.dw_repeticiones.InsertRow(0)
		tab_activ_oper.tabpage_repeticion.dw_repeticiones.SetItem(ll_reg,'consecutivo_repeticion', il_consecutivo_repeticion)
		tab_activ_oper.tabpage_repeticion.dw_repeticiones.SetItem(ll_reg,'nu_orden', il_nu_orden)
		tab_activ_oper.tabpage_repeticion.dw_repeticiones.SetItem(ll_reg,'nu_orden_ant', dw_dt_mu_ord.GetItemNumber(1,'nu_orden_ant'))
		tab_activ_oper.tabpage_repeticion.dw_repeticiones.SetItem(ll_reg,'cod_causa', dw_dt_mu_ord.GetItemNumber(1,'cod_causa'))
		If tab_activ_oper.tabpage_repeticion.dw_repeticiones.RowCount() > 1 Then
			tab_activ_oper.tabpage_repeticion.dw_repeticiones.SetItem(ll_reg,'orden', tab_activ_oper.tabpage_repeticion.dw_repeticiones.GetItemNumber(ll_reg -1,'orden') + 1)
		Else
			tab_activ_oper.tabpage_repeticion.dw_repeticiones.SetItem(ll_reg,'orden', 1)
		End if
		tab_activ_oper.tabpage_repeticion.dw_repeticiones.SetItem(ll_reg,'fe_creacion', ldt_fecha)
		tab_activ_oper.tabpage_repeticion.dw_repeticiones.SetItem(ll_reg,'fe_actualizacion', ldt_fecha)
		tab_activ_oper.tabpage_repeticion.dw_repeticiones.SetItem(ll_reg,'usuario', ls_usuario)
		tab_activ_oper.tabpage_repeticion.dw_repeticiones.SetItem(ll_reg,'instancia', ls_instancia)
	
	ElseIf ll_find > 0 Then
		//actualiza la causa
		tab_activ_oper.tabpage_repeticion.dw_repeticiones.SetItem(ll_find,'cod_causa', dw_dt_mu_ord.GetItemNumber(1,'cod_causa'))
 	ElseIf ll_find < 0 Then
		of_error_orden()
		MessageBox('Atenci$$HEX1$$f300$$ENDHEX$$n','Ocurrion un inconveniente al busca la orden en la repetici$$HEX1$$f300$$ENDHEX$$n.')
		Return -1
	End if
Else //If dw_dt_mu_ord.GetItemNumber(1,'sw_repeticion') = 1 Then
 
End if

//mira si debe borrar orden repeticion
If il_orden_repeticion_orig > 0 Then
	//la orden repeticion debe ser distinta a la que hay actualmente
	If il_orden_repeticion_orig <> dw_dt_mu_ord.GetItemNumber(1,'nu_orden_ant') or &
		dw_dt_mu_ord.GetItemNumber(1,'sw_repeticion') = 0 Then
		//busca registro en la tabla de repeticion
		lds_repeticion = create uo_dsbase
		lds_repeticion.dataobject = 'd_gr_repeticiones_ordenes_x_ordenes'
		lds_repeticion.setTransobject(n_cst_application.itr_appl)	
		
		//consulta repeticion para borrar
		If lds_repeticion.Retrieve(il_nu_orden, il_orden_repeticion_orig) > 0 Then
			//borra registro
			lds_repeticion.RowsMove(1, lds_repeticion.RowCount() +1, Primary! ,  lds_repeticion, 1,Delete! )
			
			//actualiza en la base de datos
			If lds_repeticion.Update(true,false)<>1 Then 
				of_error_orden()
				Destroy lds_repeticion
				Return -1
			End If
		End if
		Destroy  lds_repeticion
	End if
End if
//**********************************************
/*----------------------------------------------
Update
----------------------------------------------*/
If dw_dt_mu_ord.Update(true,false)<>1 Then 
	of_error_orden()
	Return -1
End If

If dw_dt_mu_ord_col.Update(true,false)<>1 Then 
	of_error_orden()
	Return -1
End If

If tab_activ_oper.tabpage_mp_base.dw_mp_base.Update(true,false)<>1 Then 
	of_error_orden()
	Return -1
End If
//***************
If tab_activ_oper.tabpage_bordado.dw_bordado.Update(true,false)<>1 Then 
	of_error_orden()
	Return -1
End If

If tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante.Update(true,false)<>1 Then 
	of_error_orden()
	Return -1
End If

If tab_activ_oper.tabpage_tareas.dw_tareas.Update(true,false)<>1 Then 
	of_error_orden()
	Return -1
End If

If dw_mu_soli_hilaza.Update(true,false)<>1 Then 
	of_error_orden()
	Return -1
End If

If dw_mu_soli_tinta.Update(true,false)<>1 Then 
	of_error_orden()
	Return -1
End If

//actualiza repeticiones
If tab_activ_oper.tabpage_repeticion.dw_repeticiones.Update(true,false)<>1 Then 
	of_error_orden()
	Return -1
End If

//****************
//of_redraw(True)
//----------------------------------------------
il_fabrica = dw_dt_mu_ord.GetItemNumber(1,'co_fabrica')
il_linea = dw_dt_mu_ord.GetItemNumber(1,'co_linea')
il_muestra = dw_dt_mu_ord.GetItemNumber(1,'co_muestra')
//----------------------------------------------
dw_dt_mu_ord.ResetUpdate()
dw_dt_mu_ord_col.ResetUpdate()
tab_activ_oper.tabpage_mp_base.dw_mp_base.ResetUpdate()
tab_activ_oper.tabpage_bordado.dw_bordado.ResetUpdate()
tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante.ResetUpdate()
tab_activ_oper.tabpage_tareas.dw_tareas.ResetUpdate()
tab_activ_oper.tabpage_repeticion.dw_repeticiones.ResetUpdate()
dw_mu_soli_hilaza.ResetUpdate()
dw_mu_soli_tinta.ResetUpdate()




Return 1
end function

public function integer of_consecutivo ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 30 de Septiembre de 2004.H:18:20
---------------------------------------------------
Generaci$$HEX1$$f300$$ENDHEX$$n del consecutivo. Devuelve -1 si el proceso no fu$$HEX1$$e900$$ENDHEX$$
exitoso.
----------------------------------------------------
Consulta del consecutivo
El codigo para las ordenes de producci$$HEX1$$f300$$ENDHEX$$n de muestras ser$$HEX2$$e1002000$$ENDHEX$$para el
ID '27'<--- creada en tiempo de dise$$HEX1$$f100$$ENDHEX$$o
Log del registro :
Table  : cf_consecutivos@crydes
Fields : co_fabrica 		= 2
			id_documento 	= 27
			cs_documento 	= *(ini)
			ob_documento 	= Ordenes de producci$$HEX1$$f300$$ENDHEX$$n
			sw_replica		= 0
			instancia		= crydes01
---------------------------------------------------*/
Boolean lb_continuar
Long ll_cantidad
n_ds_application 	lds_cant_orden
//--------------------------------------------------
lds_cant_orden = CREATE n_ds_application
lds_cant_orden.of_load('d_nro_orden')
lds_cant_orden.of_conexion(n_cst_application.itr_appl,True)
	
lb_continuar=True
DO WHILE lb_continuar //*
	il_nu_orden = n_cst_application.of_consecutive(n_cst_application.ii_fabrica,27,n_cst_application.itr_appl)
   If il_nu_orden<=0 Then
		il_nu_orden=0
		MessageBox("Advertencia!","No se pudo determinar el consecutivo de la orden de producci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
		Return -1
	End If
	
	ll_cantidad = lds_cant_orden.Retrieve(il_nu_orden)
	If ll_cantidad<= 0 Then
			MessageBox("Advertencia!","Error recuperando la cantidad de ordenes(ds).",StopSign!)		
			Return -1						
	End If
	ll_cantidad = lds_cant_orden.GetItemNumber(1,'nro_conteo')
	If ll_cantidad=0 Then
		lb_continuar=False
	End If
LOOP //*

DESTROY lds_cant_orden

If il_nu_orden>0 Then
	Return 1
End If
//*******************************************



end function

public function integer of_error_orden ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 1 de Octubre de 2004.H:11:50
---------------------------------------------------
Deshace los cambios hechos a la bd.
Guardar
---------------------------------------------------*/
//**************************************************
ROLLBACK USING n_cst_application.itr_appl;
//**************************************************
//dw_dt_mu_ord.SetItem(1,"nu_orden",il_nu_orden_control)

Return 1
end function

public function integer of_eliminar_orden ();/*-------------------------------------------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 1 de Octubre de 2004.H:18:35
//-------------------------------------------------------------------------------------
Elimina la orden de prod. completa si no est$$HEX2$$e1002000$$ENDHEX$$programada
-------------------------------------------------------------------------------------*/
Long 					ll_respuesta,ll_estado_orden,ll_i
u_dw_application 	ldw_v
n_ds_application	lds_ref
//-------------------------------------------------------------------------------------
If dw_dt_mu_ord.RowCount()<1 Then
	Return -1
End If
//-------------------------------------------------------------------------------------
If Not ib_era Then
	MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Esta orden no ha sido registrada a$$HEX1$$fa00$$ENDHEX$$n.",Information!)
	Return -1
End If	
//-------------------------------------------------------------------------------------
/*Solo se permite eliminar una orden en estado REGISTRADA*/
ll_estado_orden=dw_dt_mu_ord.GetItemNumber(1,'condicion')
If ll_estado_orden <> 1 Then /*REGISTRADA*/
		ll_respuesta=ids_cond_orden.Find('condicion='+String(ll_estado_orden),1,ids_cond_orden.RowCount())		
		MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Esta orden no puede ser eliminada. Su estado es "+&
			String(Trim(ids_cond_orden.GetItemString(ll_respuesta,'de_condicion'))),Information!)
		Return -1
End If
//-------------------------------------------------------------------------------------
ll_respuesta = MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","$$HEX1$$bf00$$ENDHEX$$Desea eliminar esta orden y toda su informaci$$HEX1$$f300$$ENDHEX$$n relacionada?",Question!,YesNo!,2)
If ll_respuesta<>1 Then
	Return -1
End If
//-------------------------------------------------------------------------------------
ldw_v = dw_dt_mu_ord_col
//ldw_v.RowsDiscard(1, ldw_v.DeletedCount(), Delete!)
ldw_v.SetFilter('')
ldw_v.Filter()
ldw_v.RowsMove(1,ldw_v.RowCount(),Primary!,ldw_v,1,Delete!)
//-------------------------------------------------------------------------------------
ldw_v = tab_activ_oper.tabpage_mp_base.dw_mp_base
//ldw_v.RowsDiscard(1, ldw_v.DeletedCount(), Delete!)
//ldw_v.RowsMove(1,ldw_v.RowCount(),Primary!,ldw_v,1,Delete!)
//ldw_v.Rowscopy(1,ldw_v.RowCount(),Primary!,ldw_v,1,Delete!)
//ldw_v.RowsDiscard(1,ldw_v.RowCount(),Primary!)
ll_respuesta=ldw_v.RowCount()
For ll_i=1 To ll_respuesta
	ldw_v.DeleteRow(0)
Next
//-------------------------------------------------------------------------------------
ldw_v =tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante
ldw_v.SetFilter('')
ldw_v.Filter()
//ldw_v.RowsDiscard(1, ldw_v.DeletedCount(), Delete!)
ldw_v.RowsMove(1,ldw_v.RowCount(),Primary!,ldw_v,ldw_v.DeletedCount()+1,Delete!)
//ldw_v.RowsMove(1,ldw_v.FilteredCount(),Filter!,ldw_v,ldw_v.DeletedCount()+1,Delete!)
//-------------------------------------------------------------------------------------
ldw_v =tab_activ_oper.tabpage_bordado.dw_bordado
ldw_v.SetFilter('')
ldw_v.Filter()
//ldw_v.RowsDiscard(1, ldw_v.DeletedCount(), Delete!)
ldw_v.RowsMove(1,ldw_v.RowCount(),Primary!,ldw_v,ldw_v.DeletedCount()+1,Delete!)
//ldw_v.RowsMove(1,ldw_v.FilteredCount(),Filter!,ldw_v,ldw_v.DeletedCount()+1,Delete!)
//-------------------------------------------------------------------------------------
ldw_v =tab_activ_oper.tabpage_tareas.dw_tareas
//ldw_v.RowsDiscard(1, ldw_v.DeletedCount(), Delete!)
ldw_v.RowsMove(1,ldw_v.RowCount(),Primary!,ldw_v,ldw_v.DeletedCount()+1,Delete!)
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------
dw_dt_mu_ord.DeleteRow(1)
//-------------------------------------------------------------------------------------
//dw
ldw_v = tab_activ_oper.tabpage_tareas.dw_tareas
If ldw_v.Update()<>1 Then
	of_error_orden2()
	Return -1
End If
ldw_v = tab_activ_oper.tabpage_bordado.dw_bordado
If ldw_v.Update()<>1 Then
	of_error_orden2()
	Return -1
End If
ldw_v = tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante
If ldw_v.Update()<>1 Then
	of_error_orden2()
	Return -1
End If
ldw_v = tab_activ_oper.tabpage_mp_base.dw_mp_base
If ldw_v.Update()<>1 Then
	of_error_orden2()
	Return -1
End If
ldw_v = dw_dt_mu_ord_col
If ldw_v.Update()<>1 Then
	of_error_orden2()
	Return -1
End If
ldw_v=dw_dt_mu_ord
If ldw_v.Update()<>1 Then
	of_error_orden2()
	Return -1
End If
//Funci$$HEX1$$f300$$ENDHEX$$n que realiza el commit
of_ok_orden()
of_Reset()
MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","La orden nro. # "+String(il_nu_orden)+" fu$$HEX2$$e9002000$$ENDHEX$$eliminada satisfactoriamente.")
Title='Orden de Producci$$HEX1$$f300$$ENDHEX$$n de Muestras'
Return 1
end function

public function integer of_recuperar_talla ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 5 de Octubre de 2004.H:15:16
---------------------------------------------------
Recupera la talla para la muestra de la orden
---------------------------------------------------*/
Long 					ll_cantidad,ll_res
n_ds_application 	lds_talla
//-------------------------------------------------

lds_talla = CREATE n_ds_application
lds_talla.of_load('d_recup_talla')
lds_talla.of_conexion(n_cst_application.itr_appl,True)
ll_res = lds_talla.Retrieve(il_fabrica,il_linea,il_muestra)
Choose Case ll_res
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando dato de la talla(ds).",StopSign!)		
		Return -1
	Case 0
		MessageBox("Advertencia!","Talla no encontrada para la muestra(ds).",StopSign!)	
		Return -1	
	Case Is > 1
		//Validaci$$HEX1$$f300$$ENDHEX$$n para el caso en que se tengan m$$HEX1$$e100$$ENDHEX$$s de una talla x muestra
		MessageBox("Advertencia!","Se han encontrado varias tallas para la muestra(ds).",StopSign!)	
		Return -1	
End Choose
il_talla = lds_talla.GetItemNumber(1,'co_talla')
DESTROY lds_talla
Return 1
end function

public function integer of_distrib_col (long al_dato, string as_col);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 12 de Octubre de 2004.H:08:12
---------------------------------------------------
Distribuye la cantidad de colores para la orden
---------------------------------------------------*/
Long ll_nueva_cantidad,ll_numcol, ll_cant_distribuir,ll_a,ll_col
String ls_col
Boolean ll_ba
u_dw_application ldw_v
//-------------------------------------------------
ldw_v = dw_dt_mu_ord_col
ll_numcol = ldw_v.RowCount()
If ll_numcol > 0 Then
	ll_nueva_cantidad=al_dato			
	of_Redraw(False)
	ldw_v.SetFilter("co_color NOT IN (888,999) AND check=1")
	ldw_v.Filter()			
	ll_numcol = ldw_v.RowCount()
	ll_ba=False
	If ll_numcol > 0 Then
			ll_cant_distribuir = ll_nueva_cantidad / ll_numcol								
			If as_col='total_ptejer' Then
				ls_col='pares_tejer'						
			Else
				ls_col='pares_despachar'						
			End If			
			If ll_cant_distribuir > 0 Then				
				For ll_a=1 to ll_numcol - 1
					ldw_v.SetItem(ll_a,ls_col,ll_cant_distribuir)
				Next
				ll_cant_distribuir = ll_nueva_cantidad - (ll_cant_distribuir*(ll_numcol - 1))
				ldw_v.SetItem(ll_numcol,ls_col,ll_cant_distribuir)					
			Else
				ldw_v.SetItem(1,ls_col,ll_nueva_cantidad)					
				For ll_a=2 to ll_numcol 
					ldw_v.SetItem(ll_a,ls_col,0)
				Next
			End If						
	Else		
		ll_ba=true
		//MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','No hay colores seleccionados para la Orden',Information!)		
	End If
	ldw_v.SetFilter("")
	ldw_v.Filter()
	ldw_v.Sort()
	of_Redraw(True)
Else
	Return -1
End If
If ll_ba Then 
	Return -1
End If
//---------------------------------------
Return 1
end function

public function integer of_error_orden2 ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 6 de Octubre de 2004.H:11:50
---------------------------------------------------
Deshace los cambios hechos a la bd.
Usada al eliminar
---------------------------------------------------*/
//****************************************
ROLLBACK USING n_cst_application.itr_appl;
//****************************************
of_reset()

Return 1
end function

public function integer of_ok_orden ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 6 de Octubre de 2004.H:11:50
---------------------------------------------------
Deshace los cambios hechos a la bd.
---------------------------------------------------*/
//****************************************
COMMIT USING n_cst_application.itr_appl;
//****************************************

Return 1
end function

public function integer of_title (long al_estado);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 22 de Septiembre de 2004.H:17:05
---------------------------------------------------
Asigna el literal al titulo de la ventana seg$$HEX1$$fa00$$ENDHEX$$n el estado
de la orden
---------------------------------------------------*/
Long ll_pos
Title="Orden "+String(il_nu_orden)+" / "+String(il_fabrica)+" / "+String(il_linea)+" / "+String(il_muestra)
ll_pos=ids_cond_orden.Find('condicion='+String(al_estado),1,ids_cond_orden.RowCount())
Title += ' | Estado de la Orden : '+ Trim(ids_cond_orden.GetItemString(ll_pos,'de_condicion'))
/*Choose Case al_estado		
	Case 1 //Registrada
		Title += ' | Estado de la Orden : REGISTRADA'	
	Case 2 //Programada
		Title += ' | Estado de la Orden : PROGRAMADA'	
	Case 5 //Cancelada
		Title += ' | Estado de la Orden: CANCELADA'
	Case 3
		Title += ' | Estado de la Orden: PROCESO PRODUCTIVO'
	Case 4
		Title += ' | Estado de la Orden: FINALIZADA'
	Case 6
		Title += ' | Estado de la Orden: DESPACHADA'
	Case 7
		Title += ' | Estado de la Orden: APROBADA'
	Case 8
		Title += ' | Estado de la Orden: RECHAZADA'
End Choose*/
//---------------------------------------------------
Return 1

end function

public function integer of_cargar_dddw ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 24 de Noviembre de 2004.H:09:30
---------------------------------------------------
---------------------------------------------------*/
n_cst_comun  lo_comun
//---------------------------------------------------
//Datos del T$$HEX1$$e900$$ENDHEX$$cnico
dw_dt_mu_ord.getChild("co_ctecnico",idc_ctecnico)
lo_comun.of_loaddddw(idc_ctecnico,n_cst_application.itr_appl)

Return 1
end function

public function integer of_orden_proc (ref datawindow adw_arg, string as_col);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 8 de Octubre de 2004.H:15:27
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n para ordenar los registros del dw par$$HEX1$$e100$$ENDHEX$$metro
segun la columna.
---------------------------------------------------*/
Long ll_i,ll_tot
String ls_ini
//-------------------------------------------------
If adw_arg.RowCount()<=0 Then Return -1
//------------------------------------------------
ll_tot=adw_arg.RowCount()
ls_ini = adw_arg.Describe("DataWindow.Table.Sort")
adw_arg.SetSort(as_col+' A')
adw_arg.Sort()
For ll_i=1 To ll_tot
	adw_arg.SetItem(ll_i,as_col,ll_i*10)
Next
adw_arg.Modify("DataWindow.Table.Sort='"+ls_ini+"'")
//------------------------------------------------
Return 1
end function

public function integer of_estimacion (long al_row, string as_col);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 24 de Noviembre de 2004.H:09:56
---------------------------------------------------
Selecci$$HEX1$$f300$$ENDHEX$$n de las operaciones para la estimaci$$HEX1$$f300$$ENDHEX$$n de tiempos
y registro en el Gantt
---------------------------------------------------*/
Long 		ll_codigo,ll_tipoprod,ll_tipo_tejido,ll_grupo_talla,ll_recurso,ll_res,ll_rows, &
			ll_talla,ll_pares,ll_null,ll_i,ll_tono,ll_co_color,&
			ll_max,ll_clase_ss
Integer 	li_cilindros
Boolean lb_out
Decimal {2} lde_tiempo
String 	ls_tipo_orden, ls_dwo, ls_objeto, &
			ls_exp, ls_de_color 

u_dw_application ldw_dest,ldw_a
n_cst_comun_orden lo_comun
n_cst_param_orden lo_param
String ls_sw_col_mp_act

long ll_consec,ll_cual_fila
Long 		ll_grupoprod, ll_ca_alimentadores
String	ls_ciclo_tejido

u_dw_application ldw_gantt, ldw_tmp

//---------------------------------------------------
ldw_gantt=tab_activ_oper.tabpage_tareas.dw_tareas

//--------------------------------------------------
//If dw_dt_mu_ord_col.Find('check_estimacion=1',1,dw_dt_mu_ord_col.RowCount()) <= 0 Then
//	MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','Seleccione al menos un color para estimar',Information!)
//	Return -1
//End If//Si hay seleccionados1
//CARGA LOS DATOS DE LA MUESTRA DE LA ORDEN

ll_tipoprod=dw_dt_mu_ord.GetItemNumber(1,'co_tipoprod')
If IsNull(ll_tipoprod) Then
	MessageBox('Advertencia','Muestra de la orden sin c$$HEX1$$f300$$ENDHEX$$digo de tipo producto.',StopSign!)
	Return -1
End If
ll_tipo_tejido=dw_dt_mu_ord.GetItemNumber(1,'co_tipo_tejido')
If IsNull(ll_tipo_tejido) Then
	MessageBox('Advertencia','Muestra de la orden sin c$$HEX1$$f300$$ENDHEX$$digo de tipo tejido ',StopSign!)
	Return -1
End If
ll_grupo_talla=dw_dt_mu_ord.GetItemNumber(1,'co_grupo_tlla')
If IsNull(ll_grupo_talla) Then
	MessageBox('Advertencia','Muestra de la orden sin c$$HEX1$$f300$$ENDHEX$$digo de Grupo talla ',StopSign!)
	Return -1
End If
ll_talla=dw_dt_mu_ord.GetItemNumber(1,'co_talla')
If IsNull(ll_talla) Then
	MessageBox('Advertencia','Muestra de la orden sin c$$HEX1$$f300$$ENDHEX$$digo de la talla ',StopSign!)
	Return -1
End If
ls_tipo_orden=dw_dt_mu_ord.GetItemString(1,'tipo')
If IsNull(ls_tipo_orden) Then
	MessageBox('Advertencia','Orden sin c$$HEX1$$f300$$ENDHEX$$digo de la tipo asignado',StopSign!)
	Return -1
End If

/*
* MODIFICADO: Agosto 24 de 2009 - gagudelo - ohlondon
* Agregar campos que son necesarios en la estimacion
*/
IF il_tipo_prod = 20 THEN
	dw_dt_mu_ord.Accepttext( )
	ll_grupoprod = dw_dt_mu_ord.GetItemNumber(1,'co_grupoprod')
	If IsNull(ll_grupoprod) Then
		MessageBox('Advertencia','Muestra de la orden sin Grupo de tipo de producto.',StopSign!)
		Return -1
	End If
	ll_ca_alimentadores = dw_dt_mu_ord.GetItemNumber(1,'ca_alimentadores')
	If IsNull(ll_ca_alimentadores) Then
		MessageBox('Advertencia','Muestra de la orden sin cantidad de Alimentadores.',StopSign!)
		Return -1
	End If
	ls_ciclo_tejido = dw_dt_mu_ord.GetItemString(1,'ciclo_tejido')
	If IsNull(ls_ciclo_tejido ) Then
		MessageBox('Advertencia','Muestra sin ciclo de tejido.',StopSign!)
		Return -1
	End If
	iou_estimator.of_setgrupoprod(ll_grupoprod)
	iou_estimator.of_setalimentadores(ll_ca_alimentadores)
	iou_estimator.of_setciclotejido(ls_ciclo_tejido)
END IF


Choose Case as_col
	Case 'co_operacion'
		ldw_dest = tab_activ_oper.tabpage_procesos.dw_operacion_muestra
		ls_objeto='Operaci$$HEX1$$f300$$ENDHEX$$n'
	Case 'id_actividad'
		ldw_dest = tab_activ_oper.tabpage_actividades.dw_actividad_muestra
		ls_objeto='Actividad'
	Case Else
		Return -1
End Choose
//------------------------------------------------------------------------------------
ll_codigo = ldw_dest.GetItemNumber(al_row,as_col)//CARGA DEL C$$HEX1$$d300$$ENDHEX$$DIGO DE LA OPERACI$$HEX1$$d300$$ENDHEX$$N/ACTIVIDAD
//CARGA DE LOS DATOS DE LA OPERACI$$HEX1$$d300$$ENDHEX$$N/ACTIVIDAD---------------------------


//ll_res=lds_actoper.Retrieve(ll_codigo)

If io_soli_serv.of_cargar_info_tarea(as_col,ll_codigo,il_tipo_prod )<>1 Then
	Return -1
End If

//*********************************************************************************************************
//Validaci$$HEX1$$f300$$ENDHEX$$n de que halla al menos un color para la estimaci$$HEX1$$f300$$ENDHEX$$n segun el criterio del estado
If io_soli_serv.of_get_tarea_x_color() = 'S' Then
	If dw_dt_mu_ord_col.Find('check_estimacion=1',1,dw_dt_mu_ord_col.RowCount()) <= 0 Then
		MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','El estado de la '+ls_objeto+' es por color.Seleccione al menos un color en la columna ~'Incluir estimaci$$HEX1$$f300$$ENDHEX$$n~' para estimar',Information!)
		Return -1
	End If//Si hay seleccionados1
Else
	If dw_dt_mu_ord_col.Find('check=1',1,dw_dt_mu_ord_col.RowCount()) <= 0 Then
		MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','El estado de la '+ls_objeto+' es por orden.Seleccione al menos un color en la columna ~'Selecci$$HEX1$$f300$$ENDHEX$$n~' para estimar',Information!)
		Return -1
	End If//Si hay seleccionados1	
End If 
//******************************************************************************************************************************
//**Verificaci$$HEX1$$f300$$ENDHEX$$n de que las opera/acti no se repitan en el gantt
//**seg$$HEX1$$fa00$$ENDHEX$$n el criterio del estado de la oper/activ de si es por color o no!***************************
If of_validar_tareas(io_soli_serv.of_get_tarea_x_color() ,&
                     as_col,ll_codigo,ls_objeto) <> 1 Then Return -1
//**FIN Verificaci$$HEX1$$f300$$ENDHEX$$n de que las opera/acti no se repitan en el gantt*********************************
//***CARGA EL N$$HEX1$$da00$$ENDHEX$$MERO DE CILINDROS DEL RECURSO QUE SE HA ASIGNADO A LA TALLA DE LA MUESTRA
ll_recurso=dw_dt_mu_ord.GetItemNumber(1,'co_recurso')
li_cilindros = of_recuperar_cilindros(ll_recurso)
//**FIN CARGA EL N$$HEX1$$da00$$ENDHEX$$MERO DE CILINDROS
If li_cilindros <=0 Then//Cilindros OK
	Return -1
End If//Cilindros OK
//***************************************************************************************************
//CARGA LOS DATOS DE LA ORDEN AL OBJETO DE ESTIMACI$$HEX1$$d300$$ENDHEX$$N-------------------		
iou_estimator.of_setcilindros(li_cilindros)
iou_estimator.of_settipoprod(ll_tipoprod)
iou_estimator.of_settipotejido(ll_tipo_tejido)
iou_estimator.of_setgrupotalla(ll_grupo_talla)
iou_estimator.of_settalla(ll_talla)
iou_estimator.of_setnuevo_reforma(ls_tipo_orden)		
//CARGA LOS DATOS DE LA OPERACI$$HEX1$$d300$$ENDHEX$$N/ACTIVIDAD
iou_estimator.of_settxpar(io_soli_serv.of_get_sw_pares() )
iou_estimator.of_setajuste_maq(io_soli_serv.of_get_sw_ajuste_maq() )

iou_estimator.of_setajustexcol(io_soli_serv.of_get_sw_ajustexcol())

iou_estimator.of_setcriteriotiempo(io_soli_serv.of_get_criterio_tiempo( ) )
//********************************************************************************************************************
If as_col='co_operacion' Then//Si es operacion o activ.
	//******************************
	//*** SELECCI$$HEX1$$d300$$ENDHEX$$N DE OPERACI$$HEX1$$d300$$ENDHEX$$N ***
	//******************************							

	If io_soli_serv.of_get_tarea_x_color() ='N' Then//Operacion|x|orden|color <-- OPERACION X ORDEN
		If io_soli_serv.of_get_criterio_tiempo() = 5 Then/*Por tono*/

				MessageBox('Advertencia','El estado '+io_soli_serv.of_get_de_estado() +&
				' de la operaci$$HEX1$$f300$$ENDHEX$$n <'+String(ll_codigo)+'> - '+&
				io_soli_serv.of_get_descripcion_tarea() +' NO tiene configuraci$$HEX1$$f300$$ENDHEX$$n  POR COLOR, y '+ &
								'el criterio de tiempo para esta operaci$$HEX1$$f300$$ENDHEX$$n es POR TONO.No es permitida la estimaci$$HEX1$$f300$$ENDHEX$$n.',StopSign!)
			Return -1
		End If
		If of_regtarea_no_xcolor("N"/*ls_genera_ss*/,ll_codigo,1,ll_clase_ss) <> 1 Then
			Return -1
		End If
	Else//Operacion|x|orden|color <-- OPERACION X COLOR								
		If of_regtarea_si_xcolor("N"/*ls_genera_ss*/,ll_codigo,1,ll_clase_ss) <> 1 Then
			Return -1
		End If
	End If//Operacion|x|orden|color
Else//Si es operacion o activ. 
//////////////////////////////////////////////////////////////////////////
// Este es el caso de una actividad 
// 
//////////////////////////////////////////////////////////////////////////


	
//////////////////////////////////////////////////////////////////////////
// ya se pueden tener ss que no sean por color y tengan tono como en las
// hilazas
// Solicitud de Servicio 7969
// Viernes 12 de Agosto de 2005 HORA 17:40:51
//////////////////////////////////////////////////////////////////////////

//	If ls_por_color='N' AND ll_criterio = 5 Then/*Por tono*/
//		ls_estado=Trim(Upper(lds_actoper.GetItemString(1,'de_estado')))
//		
//		MessageBox('Advertencia','El estado '+ls_estado+' de la actividad <'+String(ll_codigo)+'> - '+ls_de_actoper+' NO tiene configuraci$$HEX1$$f300$$ENDHEX$$n POR COLOR, y '+ &
//							'el criterio de tiempo para esta actividad es POR TONO.No es permitida la estimaci$$HEX1$$f300$$ENDHEX$$n.',StopSign!)
//		Return -1
//	End If

//////////////////////////////////////////////////////////////////////////
// Se verifica si es por color y tiene info adicional, quedamos en que esto no 
// se presentaba por ahora
//////////////////////////////////////////////////////////////////////////
	ll_clase_ss=io_soli_serv.of_get_co_clase_ss( )

	If io_soli_serv.of_get_tarea_x_color()='S' and &
	   io_soli_serv.of_requiere_info_adicional( ll_clase_ss/*long al_clase_ss */)=1 Then
		MessageBox("Advertencia!","La actividad "+String(ll_codigo)+&
		" esta configurada con color y con informaci$$HEX1$$f300$$ENDHEX$$n adicional, verifiquela con el"+&
		" administrador del sistema.",StopSign!)
		Return -1
	End If


	If io_soli_serv.of_requiere_info_adicional( ll_clase_ss/*long al_clase_ss */)=1 Then
	//////////////////////////////////////////////////////////////////////////
	// por ahora solo se tiene la de tenido hilaza
	// 
	//////////////////////////////////////////////////////////////////////////
		

		If io_soli_serv.of_es_tenido_hilaza(ll_clase_ss /*long al_clase_solicitud */) = 1 Then
			dw_tmp_mu_soli_hilaza.Reset()
			dw_tmp_mu_soli_hilaza.InsertRow(0)
			dw_tmp_mu_soli_hilaza.SetItem(1,'id_actividad',ll_codigo)
			dw_tmp_mu_soli_hilaza.SetItem(1,'de_actividad',io_soli_serv.of_get_descripcion_tarea() )											

			If io_soli_serv.of_get_tarea_x_color()='N' Then//Selecionxorden/color <-- ACTIVIDAD X ORDEN
				//Funci$$HEX1$$f300$$ENDHEX$$n que calcula el Nro de colores y sus pares a tejer cuando la act/oper no es por color						
				of_pares_actoper_xcriterioestado('check=1')
				//***********************						
				If il_pares_actoper <= 0 Then//Pares de seleccionados OK1						
					MessageBox('Advertencia','La cantidad de pares debe ser mayor a 0',StopSign!)
					Return -1
				End If//Pares de seleccionados OK1	
				iou_estimator.of_setcantcolores(il_rows_actoper)
				iou_estimator.of_setcantpares(il_pares_actoper)												
			Else//Selecionxorden/color <-- ACTIVIDAD X COLOR	
					//???
			End If//Selecionxorden/color	<-- ACTIVIDAD X COLOR						
			lo_param.idw_vector[1]=dw_tmp_mu_soli_hilaza

			OpenWithParm(w_mu_soli_hilaza,lo_param)
			//OpenWithParm(w_especificar_actividad,lo_param)				
			//********************************************
			If IsValid(Message.PowerObjectParm) Then //Obj. retorno OK
				lo_param=Message.PowerObjectParm
//            
				
				//lde_tiempo=ids_mu_sol_serv_tmp.GetItemDecimal(1,'tiempo_estimado')	
				lde_tiempo=iou_estimator.of_gettiempo_activ(ll_codigo /*long aid_actividad */)
				SetNull(ll_null)
				This.of_insertar_tarea( 0/*long al_consecutivo_color*/,&
												io_soli_serv.of_get_sw_genera_ss() /*string as_genera_sol_serv*/,&
												ll_null/*long al_co_operacion*/,&
												ll_codigo/*long al_id_actividad*/,&
												lde_tiempo,/*double adbl_tiempo */&
												ll_clase_ss) 
												
//////////////////////////////////////////////////////////////////////////
// Se toma en consecutivo de la ultima fila del gantt para colocarselo a
// la info adicional de la solicitud de servicio
//////////////////////////////////////////////////////////////////////////
				ll_cual_fila=ldw_gantt.RowCount()
				If ll_cual_fila<=0 Then
					Return -1
				End If
				
				ls_de_color = lo_param.is_vector[ UpperBound(lo_param.is_vector)]
									
				ldw_gantt.SetItem(ll_cual_fila, 'sw_color_hil', 1)
				ldw_gantt.SetItem(ll_cual_fila, 'de_color', ls_de_color )
								
				ll_consec=ldw_gantt.GetItemNumber(ll_cual_fila,"consec")
				dw_tmp_mu_soli_hilaza.SetItem(1,"consec",ll_consec)
				
				dw_tmp_mu_soli_hilaza.RowsCopy(1,1,Primary!,&
				dw_mu_soli_hilaza,50,primary! )
		
			Else //Obj. retorno OK
				//MessageBox('Advertencia','Error en la recuperacion de los parametros de la solicitud de servicio',StopSign!)								
				Return -1
			End If //Obj. retorno OK
		
		//// GAC ---------------
		
		ELSEIf io_soli_serv.of_es_tinta_antideslizante(ll_clase_ss /*long al_clase_solicitud */) = 1 Then
			dw_tmp_mu_soli_tinta.Reset()
			dw_tmp_mu_soli_tinta.InsertRow(0)
			dw_tmp_mu_soli_tinta.SetItem(1,'id_actividad',ll_codigo)
			dw_tmp_mu_soli_tinta.SetItem(1,'de_actividad',io_soli_serv.of_get_descripcion_tarea() )											

			If io_soli_serv.of_get_tarea_x_color()='N' Then//Selecionxorden/color <-- ACTIVIDAD X ORDEN
				//Funci$$HEX1$$f300$$ENDHEX$$n que calcula el Nro de colores y sus pares a tejer cuando la act/oper no es por color						
				of_pares_actoper_xcriterioestado('check=1')
				//***********************						
				If il_pares_actoper <= 0 Then//Pares de seleccionados OK1						
					MessageBox('Advertencia','La cantidad de pares debe ser mayor a 0',StopSign!)
					Return -1
				End If//Pares de seleccionados OK1	
				iou_estimator.of_setcantcolores(il_rows_actoper)
				iou_estimator.of_setcantpares(il_pares_actoper)												
			Else//Selecionxorden/color <-- ACTIVIDAD X COLOR	
					//???
			End If//Selecionxorden/color	<-- ACTIVIDAD X COLOR						
			lo_param.idw_vector[1]=dw_tmp_mu_soli_tinta

			OpenWithParm(w_mu_soli_tinta,lo_param)
			//OpenWithParm(w_especificar_actividad,lo_param)				
			//********************************************
			If IsValid(Message.PowerObjectParm) Then //Obj. retorno OK
				lo_param=Message.PowerObjectParm

				//lde_tiempo=ids_mu_sol_serv_tmp.GetItemDecimal(1,'tiempo_estimado')	
				lde_tiempo=iou_estimator.of_gettiempo_activ(ll_codigo /*long aid_actividad */)
				SetNull(ll_null)
				This.of_insertar_tarea( 0/*long al_consecutivo_color*/,&
												io_soli_serv.of_get_sw_genera_ss() /*string as_genera_sol_serv*/,&
												ll_null/*long al_co_operacion*/,&
												ll_codigo/*long al_id_actividad*/,&
												lde_tiempo,/*double adbl_tiempo */&
												ll_clase_ss) 
												
//////////////////////////////////////////////////////////////////////////
// Se toma en consecutivo de la ultima fila del gantt para colocarselo a
// la info adicional de la solicitud de servicio
//////////////////////////////////////////////////////////////////////////
				ll_cual_fila=ldw_gantt.RowCount()
				If ll_cual_fila<=0 Then
					Return -1
				End If
				ll_consec=ldw_gantt.GetItemNumber(ll_cual_fila,"consec")
				dw_tmp_mu_soli_tinta.SetItem(1,"consec",ll_consec)
				
				dw_tmp_mu_soli_tinta.RowsCopy(1,1,Primary!,&
				dw_mu_soli_tinta,50,primary! )
		
			Else //Obj. retorno OK
				//MessageBox('Advertencia','Error en la recuperacion de los parametros de la solicitud de servicio',StopSign!)								
				Return -1
			End If //Obj. retorno OK
		Else // hay al menos un item que solicitar							
			//Genera solicitud pero no existen item que solicitar
			//ls_genera_ss='S'
			of_cargar_ids('ss_tmp')
			If io_soli_serv.of_get_tarea_x_color()='N' Then//Actividad|x|orden|color <-- ACTIVIDAD X ORDEN
				If of_regtarea_no_xcolor(io_soli_serv.of_get_sw_genera_ss() ,&
				                         ll_codigo,2,ll_clase_ss)	<> 1 Then
					Return -1
				End If
			Else//Actividad|x|orden|color <-- ACTIVIDAD X COLOR
				//Una solicitud de servicio para cada color
				If of_regtarea_si_xcolor(io_soli_serv.of_get_sw_genera_ss() ,&
				                         ll_codigo,2,ll_clase_ss) <> 1 Then
					Return -1
				End If
			End If//Actividad|x|orden|color								
		End If // HAY AL MENOS un item que solicitar
		
		///// GAC------------
		
		
		
		
	Else	//GENERA SS <-- No genera solicitud
		If io_soli_serv.of_get_tarea_x_color()='N' Then//Actividad|x|orden|color <-- ACTIVIDAD X ORDEN						
			If of_regtarea_no_xcolor(io_soli_serv.of_get_sw_genera_ss(),&
			                         ll_codigo,2,ll_clase_ss)	<> 1 Then
				Return -1
			End If
		Else//Actividad|x|orden|color <-- ACTIVIDAD X COLOR
			If of_regtarea_si_xcolor(io_soli_serv.of_get_sw_genera_ss(),&
			                         ll_codigo,2,ll_clase_ss) <> 1 Then
				Return -1
			End If
		End If//Actividad|x|orden|color			
	End If //GENERA SS				
End If//Si es operacion o activ.


//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Martes 22 de Febrero de 2005 HORA 11:33:08:953
// 
// en el dw de colores se debe hacer desmarcado, en caso de haber seleccionado
// algunos
//////////////////////////////////////////////////////////////////////////
long i,ll_tot

ll_tot=dw_dt_mu_ord_col.RowCount()

For i=1 to ll_tot
	dw_dt_mu_ord_col.SetItem(i,"check_estimacion",0)
Next
//----------------------
Return 1

end function

public function integer of_validar_tareas (string as_por_color, string as_col, long al_codigo, string as_objeto);	/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 26 de Noviembre de 2004.H:17:06
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n que verifica si la oper/activ no se encuentra registrada
en el gantt seg$$HEX1$$fa00$$ENDHEX$$n el criterio del estado de la oper/activ de si es por color o no!
Debe conocerse el criterio del estado es por color en as_por_color
El nombre de la col del dw en as_col
El c$$HEX1$$f300$$ENDHEX$$digo de la oper/activ al_c$$HEX1$$f300$$ENDHEX$$digo
---------------------------------------------------*/
Long ll_rows, ll_i
String ls_exp
Boolean lb_out
u_dw_application ldw_tareas
//---------------------------------------------------
lb_out=False
ldw_tareas=tab_activ_oper.tabpage_tareas.dw_tareas
If as_por_color='N' Then
	If as_col="co_operacion" Then
		ls_exp='cons_color=0 AND '+as_col+'='+String(al_codigo)
		
		ll_rows=	ldw_tareas.Find(ls_exp,1,ldw_tareas.RowCount())
		If ll_rows>0 Then			
			ldw_tareas.SetFocus()		
			tab_activ_oper.SelectTab(tab_activ_oper.tabpage_tareas)
			of_redraw(True)
			MessageBox('Advertencia','La '+as_objeto+' '+String(al_codigo)+' ya tiene la tarea registrada en el Gantt con criterio ~'por orden~''+&
				' en la fila # '+String(ll_rows),StopSign!)
			lb_out=True			
		End If		
	End If
Else
			of_redraw(False)								
			dw_dt_mu_ord_col.SetFilter("check_estimacion=1")
			dw_dt_mu_ord_col.Filter()
			For ll_i=1 to dw_dt_mu_ord_col.RowCount()
				ls_exp='cons_color='+String(dw_dt_mu_ord_col.GetItemNumber(ll_i,'cons_color'))+ &
							' AND '+as_col+'='+String(al_codigo)
				//MessageBox('',ls_exp)
				ll_rows=	ldw_tareas.Find(ls_exp,1,ldw_tareas.RowCount())
				If ll_rows>0 Then			
					ldw_tareas.SetFocus()		
					tab_activ_oper.SelectTab(tab_activ_oper.tabpage_tareas)
					of_redraw(True)
					MessageBox('Advertencia','La '+as_objeto+' '+String(al_codigo)+' ya tiene la tarea registrada en el Gantt con criterio ~'por color~' para el color <'+&
						String(ldw_tareas.GetItemNumber(ll_rows,'cons_color'))+'> en la fila # '+String(ll_rows),StopSign!)
					ll_i=dw_dt_mu_ord_col.RowCount()+1
					lb_out=True			
				End If
			Next
			dw_dt_mu_ord_col.SetFilter("")
			dw_dt_mu_ord_col.Filter()
			dw_dt_mu_ord_col.Sort()
			of_redraw(True)				
End If
If lb_out Then
	Return -1
End If
//-------------------------
Return 1
end function

public function integer of_recuperar_cilindros (long al_recurso);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 24 de Noviembre de 2004.H:17:31
---------------------------------------------------
---------------------------------------------------*/
Integer li_cilindros,li_res
n_ds_application lds_recurso
n_cst_comun_orden luo_comun
//---------------------------------------------------
If Not IsNull(al_recurso) Then
	lds_recurso = CREATE n_ds_application
	lds_recurso.of_load('d_recup_cilindros')
	lds_recurso.of_conexion(n_cst_application.itr_appl,True)
	li_res=lds_recurso.Retrieve(al_recurso)
	Choose Case li_res
		Case Is < 0 
			MessageBox("Advertencia!","Error recuperando dato de los cilindros del recurso "+String(al_recurso),StopSign!)		
			Return -1
		Case 0
			MessageBox("Advertencia!","Recurso "+String(al_recurso)+" no encontrado para los cilindros(ds).",StopSign!)
			Return -1	
//		Case Is > 1		
//			MessageBox("Advertencia!","Se han encontrado varias recursos para el detalle de cilindros(ds).",StopSign!)	
//			Return -1	
	End Choose
	li_cilindros = lds_recurso.GetItemNumber(1,'cilindros')	
	DESTROY lds_recurso
	If li_cilindros=0 Then
		luo_comun.of_nombrerecursotj(al_recurso,n_cst_application.itr_appl)
		MessageBox('Advertencia','El recurso de la muestra de la orden #'+String(al_recurso)+' - ~''+luo_comun.of_getstring(1)+'~' no posee cilindros.',StopSign!)
		Return -1
	End If
Else
	MessageBox('Advertencia','C$$HEX1$$f300$$ENDHEX$$digo de recurso err$$HEX1$$f300$$ENDHEX$$neo para la recuperaci$$HEX1$$f300$$ENDHEX$$n de sus cilindros',StopSign!)
	Return -1
End If
//----------------------------------------------------
Return li_cilindros
end function

public function integer of_partes_bordado (long al_bordado, long al_partes, long al_cons_color);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 02 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Long ll_i,ll_pos
u_dw_application ldw_bord
//-------------------------------------------------
If al_partes<=0 Then
	MessageBox('Advertencia','Error en el c$$HEX1$$f300$$ENDHEX$$digo de las partes para el bordado',StopSign!)
	Return -1
End If
If IsNull(al_cons_color) Then	
	Return -1
End If
ldw_bord=tab_activ_oper.tabpage_bordado.dw_bordado
tab_activ_oper.SelectTab(tab_activ_oper.tabpage_bordado)
ldw_bord.SetRedraw(False)
ldw_bord.SetFilter("")
ldw_bord.Filter()
ldw_bord.SetFilter("cons_color="+String(al_cons_color))
ldw_bord.Filter()
ldw_bord.SetRedraw(True)
For ll_i=1 to al_partes
	ll_pos=ldw_bord.InsertRow(0)
	ldw_bord.SetItem(ll_pos,'nu_orden',il_nu_orden)
	ldw_bord.SetItem(ll_pos,'cons_color',al_cons_color)
	ldw_bord.SetItem(ll_pos,'cons_parte',ll_i)
Next

//-------------------------------------------------
Return 1
end function

public function integer of_cantidad_chablon (long al_chablon, long al_cantidad, long al_cons_color);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 02 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Long ll_i,ll_pos
u_dw_application ldw_chab
//-------------------------------------------------
If al_cantidad<=0 Then
	MessageBox('Advertencia','Error en la cantidad de tintas para el chablon',StopSign!)
	Return -1
End If
If IsNull(al_cons_color) Then	
	Return -1
End If
ldw_chab=tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante
tab_activ_oper.SelectTab(tab_activ_oper.tabpage_antideslizante)
ldw_chab.SetRedraw(False)
ldw_chab.SetFilter("")
ldw_chab.Filter()
ldw_chab.SetFilter("cons_color="+String(al_cons_color))
ldw_chab.Filter()
ldw_chab.SetRedraw(True)
For ll_i=1 to al_cantidad
	ll_pos=ldw_chab.InsertRow(0)
	ldw_chab.SetItem(ll_pos,'nu_orden',il_nu_orden)
	ldw_chab.SetItem(ll_pos,'cons_color',al_cons_color)
	ldw_chab.SetItem(ll_pos,'cons_chablon',ll_i)
Next

//-------------------------------------------------
Return 1
end function

public function integer of_sel_fila (long al_fila);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 03 de Diciembre de 2004.H:09:11
---------------------------------------------------
---------------------------------------------------*/
il_fila_col=al_fila
dw_dt_mu_ord_col.SelectRow(0,False)
dw_dt_mu_ord_col.SelectRow(il_fila_col,True)
dw_dt_mu_ord_col.ScrollToRow(il_fila_col)
//-------------------------------------------------
Return 1










end function

public function integer of_filtrar_chab_bord ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 02 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
String ls_filtro
Long ll_cons
//-------------------------------------------------
If il_fila_col<=0 OR dw_dt_mu_ord_col.RowCount()<=0 Then
	Return -1
End If
ll_cons=dw_dt_mu_ord_col.GetItemNumber(il_fila_col,'cons_color')
If IsNull(ll_cons) Then
	Return -1
End If
tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante.SetRedraw(False)
tab_activ_oper.tabpage_bordado.dw_bordado.SetRedraw(False)
tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante.SetFilter('')
tab_activ_oper.tabpage_bordado.dw_bordado.SetFilter('')
tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante.Filter()
tab_activ_oper.tabpage_bordado.dw_bordado.Filter()
ls_filtro='cons_color='+String(ll_cons)
tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante.SetFilter(ls_filtro)
tab_activ_oper.tabpage_bordado.dw_bordado.SetFilter(ls_filtro)
tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante.Filter()
tab_activ_oper.tabpage_bordado.dw_bordado.Filter()
tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante.SetRedraw(True)
tab_activ_oper.tabpage_bordado.dw_bordado.SetRedraw(True)
//------------------------------------------------------
Return 1
end function

public function integer of_verificar_datos_bordchab ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 02 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
If Not tab_activ_oper.tabpage_bordado.dw_bordado.of_completedata() Then
	tab_activ_oper.SelectTab(tab_activ_oper.tabpage_bordado)
	Return -1
End If
If Not tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante.of_completedata() Then
	tab_activ_oper.SelectTab(tab_activ_oper.tabpage_antideslizante)
	Return -1
End If
Return 1
end function

public function integer of_ord_programada (boolean ab_enab);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 02 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
String ls_as
//-------------------------------------------------
//SA56888 - Ceiba/reariase - 14/06/2017
//dw_dt_mu_ord.Enabled=ab_enab
//Fin SA56888
dw_total_pares.Enabled=ab_enab
ls_as='No'
If NOT ab_enab Then ls_as='Yes'

//dw_dt_mu_ord_col.Modify("DataWindow.ReadOnly="+ls_as)
tab_activ_oper.tabpage_actividades.dw_actividad_muestra.Modify("DataWindow.ReadOnly="+ls_as)
//tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante.Modify("DataWindow.ReadOnly="+ls_as)
//tab_activ_oper.tabpage_bordado.dw_bordado.Modify("DataWindow.ReadOnly="+ls_as)
//tab_activ_oper.tabpage_mp_base.dw_mp_base.Modify("DataWindow.ReadOnly="+ls_as)
tab_activ_oper.tabpage_procesos.dw_operacion_muestra.Modify("DataWindow.ReadOnly="+ls_as)
//tab_activ_oper.tabpage_tareas.dw_tareas.Modify("DataWindow.ReadOnly="+ls_as)

If il_estado_orden=1 or il_estado_orden=2 or il_estado_orden=3 Then
	tab_activ_oper.tabpage_tareas.cb_orden_tareas.Enabled=True
Else
	tab_activ_oper.tabpage_tareas.cb_orden_tareas.Enabled=False
End If

m_orden_pdn.m_movimientos.m_orden.m_programaci$$HEX1$$f300$$ENDHEX$$ndeordenes.Enabled=ab_enab
m_orden_pdn.m_edicion.m_clear.Enabled=ab_enab
//m_orden_pdn.m_archivo.m_guardar.Enabled=ab_enab
Return 1
end function

public function integer of_codcolor_tarea (long al_color, long al_new);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 02 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Long ll_i
u_dw_application ldw_a
//-------------------------------------------------
ldw_a=tab_activ_oper.tabpage_tareas.dw_tareas
ldw_a.SetRedraw(False)
ldw_a.SetFilter('co_color='+String(al_color))
ldw_a.Filter()
For ll_i=1 to ldw_a.RowCount()
	ldw_a.SetItem(ll_i,'co_color',al_new)
Next
ldw_a.SetFilter('')
ldw_a.Filter()
ldw_a.SetRedraw(True)
//----------------------------------------
Return 1
end function

public function integer of_pares_actoper_xorden ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 1 de Diciembre de 2004.H:09:03
---------------------------------------------------
NOT USED
Funci$$HEX1$$f300$$ENDHEX$$n que calcula la cantidad de colores y de pares a tejer
para la Operaci$$HEX1$$f300$$ENDHEX$$n/Actividad cuando su estado tiene el criterio
'por orden'
---------------------------------------------------*/
//---------------------------------------------------
of_redraw(False)
dw_dt_mu_ord_col.SetFilter("check=1")
dw_dt_mu_ord_col.Filter()
il_rows_actoper  = dw_dt_mu_ord_col.RowCount()
il_pares_actoper = dw_dt_mu_ord_col.GetItemNumber(1,'compute_ptejer')//total para solo los seleccionados
dw_dt_mu_ord_col.SetFilter("")
dw_dt_mu_ord_col.Filter()
dw_dt_mu_ord_col.Sort()
of_redraw(True)
//-----------------------------------------------------
Return 1
end function

public function integer of_pares_actoper_xcriterioestado (string as_filtro);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 1 de Diciembre de 2004.H:09:03
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n que calcula la cantidad de colores y de pares a tejer
para la Operaci$$HEX1$$f300$$ENDHEX$$n/Actividad seg$$HEX1$$fa00$$ENDHEX$$n el criterio de su estado
por orden : 'check=1' toma los seleccionados
por color : 'check_estimacion=1' toma los seleccionados y marcados para estimaci$$HEX1$$f300$$ENDHEX$$n
---------------------------------------------------*/
//---------------------------------------------------
of_redraw(False)
dw_dt_mu_ord_col.SetFilter(as_filtro)
dw_dt_mu_ord_col.Filter()
il_rows_actoper  = dw_dt_mu_ord_col.RowCount()
il_pares_actoper = dw_dt_mu_ord_col.GetItemNumber(1,'compute_ptejer')//total para solo los seleccionados
dw_dt_mu_ord_col.SetFilter("")
dw_dt_mu_ord_col.Filter()
dw_dt_mu_ord_col.Sort()
of_redraw(True)
//-----------------------------------------------------
Return 1
end function

public function integer of_scroll (long al_pos);//Window message:
long    		WM_SCROLL  		=    	276    // Horizontal scroll
long     	WM_VSCROLL 		=    	277    // Vertical scroll

//Parameters:
long 	    	SB_LINEUP  		=    	0      // Scrolls one line up. 
long    		SB_LINELEFT  	=	  	0
long    		SB_LINEDOWN		=    	1      // Scrolls one line down. 
long    		SB_LINERIGHT	=	  	1
long    		SB_PAGEUP    	=	  	2      // Scrolls one page up. 
long   		SB_PAGELEFT  	=	  	2
long    		SB_PAGEDOWN  	=	  	3      // Scrolls one page down. 
long    		SB_PAGERIGHT 	=		3
long    		SB_TOP         =		6      // Scrolls to the upper left. 
long    		SB_LEFT     	=		6
long    		SB_BOTTOM		=		7      // Scrolls to the lower right.
long    		SB_RIGHT   		=		7
long    		SB_ENDSCROLL	=		8      // Ends scroll. 
    
//
//  Scroll Window one page down
//    WM_VSCROLL  = 277
//    SB_PAGEDOWN = 3
//
long i

Send(Handle(this),WM_VSCROLL,SB_TOP, 0)

For i=1 To al_pos
	Send(Handle(this), WM_VSCROLL, SB_PAGEDOWN, 0)
Next

Return 1
end function

public function integer of_cancelar_orden ();///*-------------------------------------------------------------------------------------
//Funci$$HEX1$$f300$$ENDHEX$$n para cancelar un orden y sus tareas asignadas
////-------------------------------------------------------------------------------------*/
//Long 					ll_respuesta,ll_i,ll_condicion
//Boolean 				lb_des,lb_cond
//n_ds_application 	lds_acttarea,lds_ord
//n_cst_comun_orden luo_comun
////String 				ls_msj
////DateTime 			ldtm_fhact,ldtm_fmovfin
////-------------------------------------------------------------------------------------
//If dw_dt_mu_ord.RowCount()<1 Then
//	Return -1
//End If
////-------------------------------------------------------------------------------------
//If Not ib_era Then
//	MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Esta orden no ha sido almacenada a$$HEX1$$fa00$$ENDHEX$$n.",Information!)
//	Return -1
//End If	
////-------------------------------------------------------------------------------------
//If IsNull(il_nu_orden) OR il_nu_orden<=0 Then
//		MessageBox("Advertencia","El c$$HEX1$$f300$$ENDHEX$$digo de la orden no es v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
//	Return -1
//End If	
////-------------------------------------------------------------------------------------
//If tab_activ_oper.tabpage_tareas.dw_tareas.Rowcount()<=0 Then
//		MessageBox("Advertencia","La orden # "+String(il_nu_orden)+" no posee tareas asignadas.",StopSign!)
//	Return -1
//End If	
////-------------------------------------------------------------------------------------
///*Ordenes: 1:rechazada, 2:programada, 3:proceso productivo, 4:Finalizada
//5:cancelada, 6:despachada, 7:aprobada, 8:rechazada*/
//ll_condicion = dw_dt_mu_ord.GetItemNumber(1,'condicion')
//Choose Case ll_condicion
//	Case 4,5,6,7,8
//		ll_i=ids_cond_orden.Find('condicion='+String(ll_condicion),1,ids_cond_orden.RowCount())
//		MessageBox('Advertencia','La orden # '+String(il_nu_orden)+' se encuentra en estado '+&
//					String(Trim(ids_cond_orden.GetItemString(ll_i,'de_condicion'))),StopSign!)
//		Return -1
//		//	Case 4 /*FINALIZADA*/
//		//	Case 5 /*CANCELADA*/
//		//	Case 6 /*DESPACHADA*/
//		//	Case 7 /*APROVADA*/				
//		//	Case 8 /*RECHAZADA*/
//End Choose
////-------------------------------------------------------------------------------------
//lb_cond=False
//For ll_i=1 To tab_activ_oper.tabpage_tareas.dw_tareas.Rowcount()
//	ll_condicion=tab_activ_oper.tabpage_tareas.dw_tareas.GetItemNumber(ll_i,'condicion')
//	Choose Case ll_condicion
//		Case 4,5,6,7,8,9
//			//	Case 4 /*PROCESO*/
//			//	Case 5 /*PARO GENERAL*/
//			//	Case 6 /*PARO INDIVIDUAL*/
//			//	Case 7 /*APROBADA*/
//			//	Case 8 /*CANCELADA*/
//			// Case 9 /*NO PROGRAMADA*/
//		Case 1,2,3		//(REGISTRADA,PROGRAMADA,LISTA PARA INICIAR)
//			lb_cond=True
//			Exit
//	End Choose
//Next
////-------------------------------------------------------------------------------------
//lb_des=True
//If ib_cambios Then
//	If MessageBox('Validaci$$HEX1$$f300$$ENDHEX$$n','Se perder$$HEX1$$e100$$ENDHEX$$n los cambios realizados. Desea continuar con la cancelaci$$HEX1$$f300$$ENDHEX$$n de la orden y sus tareas?',Question!,YesNo!,2)=2 Then
//		Return -1
//	Else 
//		lb_des=False
//	End If
//End If
////-------------------------------------------------------------------------------------
//If lb_des Then
//		If MessageBox('Validaci$$HEX1$$f300$$ENDHEX$$n','Desea modificar la condici$$HEX1$$f300$$ENDHEX$$n de la orden y las tareas al estado de ~'cancelada~'?',Question!,YesNo!)=2 Then
//			Return -1
//		End If	
//End If
////-------------------------------------------------------------------------------------
////***************************
//lds_ord = CREATE n_ds_application
//lds_ord.of_load('d_dt_mu_ord1')
//lds_ord.of_conexion(n_cst_application.itr_appl,True)
//ll_respuesta=lds_ord.Retrieve(il_fabrica,il_linea,il_muestra,il_nu_orden)
//Choose Case ll_respuesta
//	Case Is < 0
//		MessageBox('Advertencia','Error en la solicitud de la informaci$$HEX1$$f300$$ENDHEX$$n de la orden para la cancelaci$$HEX1$$f300$$ENDHEX$$n',StopSign!)
//		Return -1
//	Case 0
//		MessageBox('Advertencia','No se encontr$$HEX2$$f3002000$$ENDHEX$$informaci$$HEX1$$f300$$ENDHEX$$n de la orden para la cancelaci$$HEX1$$f300$$ENDHEX$$n',StopSign!)
//		Return -1
//End Choose
////***************************
//If lb_cond=True Then
//			lds_acttarea = CREATE n_ds_application
//			lds_acttarea.of_load('d_canc_tarea_orden')
//			lds_acttarea.of_conexion(n_cst_application.itr_appl,True)
//			ll_respuesta=lds_acttarea.Retrieve(il_nu_orden)
//			Choose Case ll_respuesta
//				Case Is < 0
//					MessageBox('Advertencia','Error en la solicitud de la informaci$$HEX1$$f300$$ENDHEX$$n de las tareas de la orden para la cancelaci$$HEX1$$f300$$ENDHEX$$n',StopSign!)
//					Return -1
//				Case 0
//					MessageBox('Advertencia','No se encontr$$HEX2$$f3002000$$ENDHEX$$informaci$$HEX1$$f300$$ENDHEX$$n de tareas de la orden que a$$HEX1$$fa00$$ENDHEX$$n no han finalizado para su cancelaci$$HEX1$$f300$$ENDHEX$$n.',StopSign!)
//					Return -1
//			End Choose
//End If
////***********************************
////If Not n_cst_application.of_selectserver(n_cst_application.itr_appl,ldtm_fhact,ls_msj,ls_msj) Then
////	MessageBox('Advertencia','Error en la informaci$$HEX1$$f300$$ENDHEX$$n de la hora y fecha actual',Information!)
////	Return -1
////End If	
////***********************************
//lds_ord.SetItem(1,'condicion',5)//Orden CANCELADA
//If lb_cond=True Then
//		For ll_i=1 To ll_respuesta
//			lds_acttarea.SetItem(ll_i,'condicion',8) //Tarea CANCELADA	
//		Next
//End If
////***********************************
//If lds_ord.Update(/*True,False*/)<>1 Then 
//	luo_comun.of_rollback(n_cst_application.itr_appl)
//	MessageBox('Advertencia','Error al actualizar la condici$$HEX1$$f300$$ENDHEX$$n de la orden para su cancelaci$$HEX1$$f300$$ENDHEX$$n',StopSign!)
//	Return -1
//End If
//If lb_cond=True Then
//		If lds_acttarea.Update(/*True,False*/)<>1 Then 
//			luo_comun.of_rollback(n_cst_application.itr_appl)
//			MessageBox('Advertencia','Error al actualizar la condici$$HEX1$$f300$$ENDHEX$$n para las tareas de la orden en su cancelaci$$HEX1$$f300$$ENDHEX$$n',StopSign!)
//			Return -1
//		End If
//End If
////***********************************
//luo_comun.of_commit(n_cst_application.itr_appl)
////***********************************
//MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','La cancelaci$$HEX1$$f300$$ENDHEX$$n de la orden # '+String(il_nu_orden)+' y sus tareas se registr$$HEX2$$f3002000$$ENDHEX$$satisfactoriamente',Information!)	
//ib_cambios=False
//ib_save=True
//of_buscar()
////***********************************
Return 1
end function

public function integer of_sel_fila (ref datawindow adw_param, ref long al_ref_varinst, long al_row);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 03 de Diciembre de 2004.H:09:11
---------------------------------------------------
---------------------------------------------------*/
al_ref_varinst=al_row
adw_param.SelectRow(0,False)
adw_param.SelectRow(al_ref_varinst,True)
adw_param.ScrollToRow(al_ref_varinst)
//-------------------------------------------------
Return 1

end function

public function integer of_cancelartareascolor (long al_cons_color);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 04 de Enero de 2005.H:10:36
---------------------------------------------------
-------------------------------------------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n para cancelar las tareas asignadas a un color determinado
//-------------------------------------------------------------------------------------*/
Long 					ll_respuesta,ll_i,ll_color,ll_res
String ls_color
n_ds_application 	lds_acttarea
n_cst_comun_orden luo_comun
//-----------------------------
ll_color=dw_dt_mu_ord_col.Find('cons_color='+String(al_cons_color),1,dw_dt_mu_ord_col.Rowcount())
ls_color=dw_dt_mu_ord_col.GetItemString(ll_color,'de_color')
ll_color=dw_dt_mu_ord_col.GetItemNumber(ll_color,'co_color')
lds_acttarea = CREATE n_ds_application
lds_acttarea.of_load('d_canc_tarea_color')
lds_acttarea.of_conexion(n_cst_application.itr_appl,True)
ll_respuesta=lds_acttarea.Retrieve(il_nu_orden,al_cons_color)
Choose Case ll_respuesta
	Case Is < 0
		MessageBox('Advertencia','Error en la solicitud de la informaci$$HEX1$$f300$$ENDHEX$$n de las tareas del color # '+String(ll_color)+&
						' - '+ ls_color+' para la cancelaci$$HEX1$$f300$$ENDHEX$$n.',StopSign!)
		Return -1
	Case 0
		MessageBox('Advertencia','No se encontr$$HEX2$$f3002000$$ENDHEX$$informaci$$HEX1$$f300$$ENDHEX$$n de las tareas del color # '+String(ll_color)+&
						' - '+ ls_color+' para la cancelaci$$HEX1$$f300$$ENDHEX$$n.',StopSign!)
		Return -1
End Choose
//***********************************

DateTime ldt_fecha
String ls_usuario,ls_instancia


If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If


For ll_i=1 To ll_respuesta	
	lds_acttarea.SetItem(ll_i,'condicion',8) //Tarea CANCELADA	
Next

ll_res=lds_acttarea.of_datosactualizacion(ldt_fecha /*datetime a_fecha*/,&
                                          ls_usuario/*string a_usuario*/,&
														ls_instancia/*string a_instancia */)
														
If ll_res<>1 Then
	Return -1
End If
//***********************************
If lds_acttarea.Update(/*True,False*/)<>1 Then 
	luo_comun.of_rollback(n_cst_application.itr_appl)
	MessageBox('Advertencia','Error al actualizar la condici$$HEX1$$f300$$ENDHEX$$n para las tareas de la orden en su cancelaci$$HEX1$$f300$$ENDHEX$$n por color',StopSign!)
	Return -1
End If
//***********************************
luo_comun.of_commit(n_cst_application.itr_appl)
MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','La cancelaci$$HEX1$$f300$$ENDHEX$$n de las tareas por color se registr$$HEX2$$f3002000$$ENDHEX$$satisfactoriamente',Information!)	
ib_cambios=False
ib_save=True
of_buscar()
//***************************
Return 1
end function

public function integer of_refrescar_datos ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 21 de Diciembre de 2004.H:17:06
---------------------------------------------------
Funcion que actualiza los registros modificados de las tareas
p.e. desde programaci$$HEX1$$f300$$ENDHEX$$n
---------------------------------------------------*/
Long ll_i
//-------------------------------------------------
For ll_i=1 To tab_activ_oper.tabpage_tareas.dw_tareas.RowCount()
	tab_activ_oper.tabpage_tareas.dw_tareas.ReSelectrow(ll_i)	
Next
//-------------------------------------------------
Return 1
end function

public function integer of_verificarprecedencias ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Lunes 28 de Febrero de 2005 HORA 14:30:21:968
// 
// Para verificar que no se violen las precedencias en el momento del registro
//////////////////////////////////////////////////////////////////////////
Datawindow ldw
long i,ll_tot,ll_estado,ll_operacion,ll_actividad,ll_pos,ll_filtrados,ll_tipo,j,&
		ll_codigoTarea,ll_posicion,ll_posicion1,ll_actividad1,ll_operacion1,&
		ll_tipo1,ll_codigoTarea1
String ls_estado,ls_operacion,ls_actividad,ls_filtro,ls_operacion1,ls_actividad1,&
       ls_tipo,ls_tipo1,ls_tarea,ls_tarea1


of_orden_proc(tab_activ_oper.tabpage_tareas.dw_tareas,"posicion")

ldw=tab_activ_oper.tabpage_tareas.dw_tareas

ll_tot=ldw.RowCount()

//For i=1 To ll_tot
//	ll_estado=ldw.getItemNumber(i,"co_estado")
//	ids_verif_precedencia.SetFilter("co_estado="+String(ll_estado))
//	ids_verif_precedencia.Filter()
//	
//	ll_filtrados=ids_verif_precedencia.RowCount()
//	
//	For j=1 To ll_filtrados
//		ll_tipo=ids_verif_precedencia.GetItemNumber(j,"tipo_tarea")
//		ll_codigoTarea=ids_verif_precedencia.GetItemNumber(j,"codigo_tarea")
//		If ll_tipo=2 Then
//			ll_pos=ldw.find("id_actividad="+String(ll_codigoTarea),i+1,ll_tot+1)
//			If ll_pos>0 Then
//				ls_estado=ldw.GetItemString(i,"de_estado")
//				ls_actividad=ldw.GetItemString(ll_pos,"descripcion")
//				ll_posicion=ldw.GetItemNumber(i,"posicion")
//				ll_posicion1=ldw.GetItemNumber(ll_pos,"posicion")
//				
//				MessageBox("Advertencia!","La actividad "+String(ll_codigoTarea)+&
//				" "+ls_actividad+", ubicada en la posici$$HEX1$$f300$$ENDHEX$$n ("+String(ll_posicion1)+&
//				"), es predecesora del estado "+String(ll_estado)+&
//				" "+ls_estado+", ubicado en la posici$$HEX1$$f300$$ENDHEX$$n ("+String(ll_posicion)+&
//				"), debe verificar el orden de las tareas.",StopSign!)
//				Return -1
//
//			End If
//			
//		Else
//
//			ll_pos=ldw.find("co_operacion="+String(ll_codigoTarea),i+1,ll_tot+1)
//			If ll_pos>0 Then
//				ls_estado=ldw.GetItemString(i,"de_estado")
//				ls_operacion=ldw.GetItemString(ll_pos,"descripcion")
//				ll_posicion=ldw.GetItemNumber(i,"posicion")
//				ll_posicion1=ldw.GetItemNumber(ll_pos,"posicion")
//				
//				MessageBox("Advertencia!","La operaci$$HEX1$$f300$$ENDHEX$$n "+String(ll_codigoTarea)+&
//				" "+ls_operacion+", ubicada en la posici$$HEX1$$f300$$ENDHEX$$n ("+String(ll_posicion1)+&
//				"), es predecesora del estado "+String(ll_estado)+&
//				" "+ls_estado+", ubicado en la posici$$HEX1$$f300$$ENDHEX$$n ("+String(ll_posicion)+&
//				"), debe verificar el orden de las tareas.",StopSign!)
//				Return -1
//
//			End If
//			
//		End If
//		
//	Next
//	
//Next


//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 20 de Abril de 2005 HORA 11:03:56:968
// 
// Se verifican las precedencias por tareas.
//////////////////////////////////////////////////////////////////////////

long ll_res

If ids_verif_precedencia_new.RowCount()=0 Then
//	ll_res =n_cst_application.&
//             of_copiaPrecedencias(ids_verif_precedencia_new)
	
	//.Retrieve()
	ll_res = ids_verif_precedencia_new.Retrieve(il_tipo_prod)
	
   //ll_res = dw_verifica_precedencia_tipoprod.Retrieve(il_tipo_prod)
	
	Choose Case ll_res
		Case Is < 0
			MessageBox("Advertencia!","Error recuperando las precedencias nuevas de tareas.",StopSign!)
			Return -1
		Case 0
			MessageBox("Advertencia!","No se recuperaron precedencias nuevas, por favor verifique.",StopSign!)
	End Choose
End If


For i=1 To ll_tot
	ll_actividad=ldw.getItemNumber(i,"id_actividad")
	ll_operacion=ldw.getItemNumber(i,"co_operacion")
	
	If IsNull(ll_actividad) Then
		ll_codigoTarea=ll_operacion
		ll_tipo=1
		ls_tipo="operaci$$HEX1$$f300$$ENDHEX$$n"
	Else
		ll_codigoTarea=ll_actividad
		ll_tipo=2
		ls_tipo="actividad"
	End If
	ls_filtro="tipo="+String(ll_tipo)+" and id="+String(ll_codigoTarea)
	
	ids_verif_precedencia_new.SetFilter(ls_filtro)
	ids_verif_precedencia_new.Filter()

	
	ll_filtrados=ids_verif_precedencia_new.RowCount()
	
	For j=1 To ll_filtrados
		ll_tipo1=ids_verif_precedencia_new.GetItemNumber(j,"tipo1")
		ll_codigoTarea1=ids_verif_precedencia_new.GetItemNumber(j,"id1")
		If ll_tipo1=2 Then
			ls_tipo1="actividad"
			ll_pos=ldw.find("id_actividad="+String(ll_codigoTarea1),i+1,ll_tot+1)
			If ll_pos>0 Then
//				Messagebox('Var','i='+String(i)+'~n'+&
//'ll_pos='+String(ll_pos)+'~n')
				ls_tarea=ldw.GetItemString(i,"descripcion")
				ll_posicion=ldw.GetItemNumber(i,"posicion")
				
				ll_codigotarea1=ldw.GetItemNumber(ll_pos,"id_actividad")
				ls_tarea1=ldw.GetItemString(ll_pos,"descripcion")
				
				ll_posicion1=ldw.GetItemNumber(ll_pos,"posicion")
				
				MessageBox("Advertencia!","La "+ls_tipo1+" "+String(ll_codigoTarea1)+&
				" "+ls_tarea1+", ubicada en la posici$$HEX1$$f300$$ENDHEX$$n ("+String(ll_posicion1)+&
				"), es predecesora de la "+ls_tipo+" "+String(ll_codigotarea)+&
				" "+ls_tarea+", ubicada en la posici$$HEX1$$f300$$ENDHEX$$n ("+String(ll_posicion)+&
				"), debe verificar el orden de las tareas.",StopSign!)
				Return -1

			End If
			
		Else
			ls_tipo1="operaci$$HEX1$$f300$$ENDHEX$$n"
			ll_pos=ldw.find("co_operacion="+String(ll_codigoTarea1),i+1,ll_tot+1)
			If ll_pos>0 Then
//				Messagebox('Var','i='+String(i)+'~n'+&
//'ll_pos='+String(ll_pos)+'~n')
				ls_tarea=ldw.GetItemString(i,"descripcion")
				ll_posicion=ldw.GetItemNumber(i,"posicion")
				
				ll_codigoTarea1=ldw.GetItemNumber(ll_pos,"co_operacion")
				ls_tarea1=ldw.GetItemString(ll_pos,"descripcion")
				
				ll_posicion1=ldw.GetItemNumber(ll_pos,"posicion")
				
				MessageBox("Advertencia!","La "+ls_tipo1+" "+String(ll_codigoTarea1)+&
				" "+ls_tarea1+", ubicada en la posici$$HEX1$$f300$$ENDHEX$$n ("+String(ll_posicion1)+&
				"), es predecesora de la "+ls_tipo+" "+String(ll_codigotarea)+&
				" "+ls_tarea+", ubicada en la posici$$HEX1$$f300$$ENDHEX$$n ("+String(ll_posicion)+&
				"), debe verificar el orden de las tareas.",StopSign!)
				Return -1

			End If
			
			
		End If
		
	Next
	
Next

Return 1
end function

public function integer of_cancelartarea (long al_consec);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Lunes 04 de Abril de 2005 HORA 16:11:09:781
// 
// Permite cancelar cualquier tarea especifica
//////////////////////////////////////////////////////////////////////////




Long 					ll_respuesta,ll_i,ll_cons_color,al_color,ll_res
Boolean 				lb_des
DateTime 			ldtm_fhact,ldtm_fmovfin
n_ds_application 	lds_acttarea,lds_ord
n_cst_comun_orden luo_comun
//-----------------------------
lds_acttarea = CREATE n_ds_application
lds_acttarea.of_load('d_canc_tarea_solserv')
lds_acttarea.of_conexion(n_cst_application.itr_appl,True)
ll_respuesta=lds_acttarea.Retrieve(il_nu_orden,al_consec)
Choose Case ll_respuesta
	Case Is < 0
		MessageBox('Advertencia','Error en la informaci$$HEX1$$f300$$ENDHEX$$n de la tarea.',StopSign!)
		Return -1
	Case 0
		MessageBox('Advertencia','No se encontr$$HEX2$$f3002000$$ENDHEX$$informaci$$HEX1$$f300$$ENDHEX$$n de la tarea.',StopSign!)
		Return -1
End Choose

DateTime ldt_fecha
String ls_usuario,ls_instancia


If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If





//***********************************
For ll_i=1 To ll_respuesta
	lds_acttarea.SetItem(ll_i,'condicion',8) //Tarea CANCELADA
Next

ll_res=lds_acttarea.of_datosactualizacion(ldt_fecha /*datetime a_fecha*/,&
                                          ls_usuario/*string a_usuario*/,&
														ls_instancia/*string a_instancia */)
														
If ll_res<>1 Then
	Return -1
End If


//***********************************
If lds_acttarea.Update(/*True,False*/)<>1 Then 
	luo_comun.of_rollback(n_cst_application.itr_appl)
	MessageBox('Advertencia','Error al actualizar la condici$$HEX1$$f300$$ENDHEX$$n para la tarea.',StopSign!)
	Return -1
End If
//***********************************
luo_comun.of_commit(n_cst_application.itr_appl)
MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','La cancelaci$$HEX1$$f300$$ENDHEX$$n de la tarea se registr$$HEX2$$f3002000$$ENDHEX$$satisfactoriamente',Information!)	
ib_cambios=False
ib_save=True
of_buscar()
//***************************
Return 1
end function

public function integer of_validarlote (long a_producto, long a_proveedor, string a_lote);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 06 de Abril de 2005 HORA 09:37:40:312
// 
// Fucni$$HEX1$$f300$$ENDHEX$$n que verifica si un lote es v$$HEX1$$e100$$ENDHEX$$lido.
//////////////////////////////////////////////////////////////////////////
long ll_cantidad

If IsNull(a_producto) Then
	Return 1
End If

If IsNull(a_proveedor) Then
	MessageBox("Advertencia!","Proveedor no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
	Return -1
End If


  SELECT count(*)  
    INTO :ll_cantidad  
    FROM cajas  
   WHERE ( cajas.lote = :a_lote ) AND  
         ( cajas.estado = 0 ) AND  
         ( cajas.co_producto = :a_producto ) AND  
         ( cajas.co_proveedor = :a_proveedor )  
			using n_cst_application.itr_appl;


If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

If ll_cantidad<=0 then
	MessageBox("Advertencia!","El lote no es v$$HEX1$$e100$$ENDHEX$$lido o pertenece a otro proveedor.",StopSign!)
	Return -1
End If



Return 1

end function

public function integer of_puedemodificar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Lunes 25 de Abril de 2005 HORA 16:08:52:640
// 
// Los estados en los que se pueden modificar datos
// de la orden
//////////////////////////////////////////////////////////////////////////


If il_estado_orden=1 or il_estado_orden=2 or &
   il_estado_orden=3 Then
	Return 1
Else
	Return -1
End If
end function

public function integer of_insertar_tarea (long al_consecutivo_color, string as_genera_sol_serv, long al_co_operacion, long al_id_actividad, double adbl_tiempo, long al_clase_ss);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 22 de Noviembre de 2004.H:15:00
--------------------------------------------------- 
Este es el m$$HEX1$$e900$$ENDHEX$$todo para insertar las tareas en el Gantt
---------------------------------------------------*/
Long ll_consec_tarea,ll_consec_nu_sol_serv,ll_row,ll_res,ll_res2,ll_estado
String ls_desc, ls_de_color
u_dw_application ldw_gantt
n_cst_comun_orden lo_comun
//---------------------------------------------------
ldw_gantt=tab_activ_oper.tabpage_tareas.dw_tareas
ll_consec_tarea = Long(ldw_gantt.Describe("Evaluate('max(consec for all)', 0)"))
If IsNull(ll_consec_tarea) Then ll_consec_tarea=0
ll_consec_tarea++
//Se aumenta el consecutivo de la solicitud de servicio------------------
If as_genera_sol_serv='S' Then
	ll_consec_nu_sol_serv = Long(ldw_gantt.Describe("Evaluate('max(nu_sol_serv for all)', 0)"))
	If IsNull(ll_consec_nu_sol_serv) Then ll_consec_nu_sol_serv=0
	ll_consec_nu_sol_serv++	
		
	//ids_mu_sol_serv.ShareData(dw_1)
	//ids_mu_sol_serv_mp.Sharedata(dw_2 )
Else		
	ll_consec_nu_sol_serv=0
End If

ll_row=ldw_gantt.InsertRow(0)
//Adici$$HEX1$$f300$$ENDHEX$$n del c$$HEX1$$f300$$ENDHEX$$digo de la orden en la funci$$HEX1$$f300$$ENDHEX$$n grabar
ldw_gantt.SetItem(ll_row,'consec',ll_consec_tarea)
ldw_gantt.SetItem(ll_row,'nu_sol_serv',ll_consec_nu_sol_serv)
//*******************************************************************
ldw_gantt.SetItem(ll_row,'cons_color',al_consecutivo_color)
If al_consecutivo_color <> 0 Then
	ll_res=dw_dt_mu_ord_col.Find('cons_color='+String(al_consecutivo_color),1,dw_dt_mu_ord_col.RowCount())
	ldw_gantt.SetItem(ll_row,'co_color',dw_dt_mu_ord_col.GetItemNumber(ll_res,'co_color'))
Else
	ldw_gantt.SetItem(ll_row,'co_color',0)
	
//	io_soli_serv.of_recuperar_color_hilaza( /*long a_nu_orden*/, al_id_actividad, 'actividad', ls_de_color)
	
End If
ldw_gantt.SetItem(ll_row,'co_operacion',al_co_operacion)
ldw_gantt.SetItem(ll_row,'id_actividad',al_id_actividad)
If Not IsNull(al_co_operacion) Then
	lo_comun.of_nombre_operac_muestra(al_co_operacion, il_tipo_prod ,n_cst_application.itr_appl)
Else
	lo_comun.of_nombreactividad(al_id_actividad,n_cst_application.itr_appl)
End If
ls_desc=lo_comun.of_getString(1)
ll_estado=lo_comun.of_getLong(1)
ldw_gantt.SetItem(ll_row,'descripcion',ls_desc)
ldw_gantt.SetItem(ll_row,'co_estado',ll_estado)
lo_comun.of_nombreestadomuestra(ll_estado,n_cst_application.itr_appl)
ls_desc=lo_comun.of_getString(1)
ldw_gantt.SetItem(ll_row,'de_estado',ls_desc)
ldw_gantt.SetItem(ll_row,'minutos',adbl_tiempo)
If Not IsNull(ide_kilos) Then 
	ldw_gantt.SetItem(ll_row,'ca_kilos',ide_kilos)
End If
ldw_gantt.SetItem(ll_row,'posicion',(ll_row*10))//<----!!!

//////////////////////////////////////////////////////////////////////////
// Cuando se adiconan filas a una orden programada o en proceso estas se
// identifican de forma que en el futuro se tenga conocimiento de estos procesos
//////////////////////////////////////////////////////////////////////////

If il_estado_orden=2 or il_estado_orden=3 Then
	ldw_gantt.SetItem(ll_row,'tarea_adicional',"S")
Else
	ldw_gantt.SetItem(ll_row,'tarea_adicional',"N")
End If

ldw_gantt.ScrollToRow(ll_row)
tab_activ_oper.tabpage_procesos.dw_tareas_en_operac.ScrollToRow(ll_row)
tab_activ_oper.tabpage_actividades.dw_tareas_en_activ.ScrollToRow(ll_row)

//tab_activ_oper.tabpage_tareas.dw_tareas.SetFocus()		
//tab_activ_oper.SelectTab(tab_activ_oper.tabpage_tareas)
//---------------------------------------------------
Return 1
end function

public function integer of_regtarea_si_xcolor (string as_genera_ss, long al_codigo, integer ai_opcion, long al_clase_ss);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 1 de Diciembre de 2004.H:09:03
---------------------------------------------------
---------------------------------------------------*/
Boolean lb_out
Long ll_rows,ll_i,ll_pares,ll_co_color,ll_null,ll_tono,ll_codA,ll_codB
u_dw_application ldw_a
Decimal {2} lde_tiempo
n_cst_comun_orden lo_comun
String ls_de_color
//---------------------------------------------------
lb_out=False
of_redraw(False)
dw_dt_mu_ord_col.SetFilter("check_estimacion=1")
dw_dt_mu_ord_col.Filter()
ll_rows = dw_dt_mu_ord_col.RowCount()													
For ll_i=1 To ll_rows//Ciclo colores marcados
		ll_pares=dw_dt_mu_ord_col.GetItemNumber(ll_i,'pares_tejer')
		If IsNull(ll_pares) Then ll_pares=0
		//***** TONO COLOR *************************************************
		//*** Se recupera del maestro de colores m_colores************************
		//*** Captura del tono del color segun la f$$HEX1$$e100$$ENDHEX$$brica y la l$$HEX1$$ed00$$ENDHEX$$nea*********************
		ll_co_color=dw_dt_mu_ord_col.GetItemNumber(ll_i,'co_color')
		If lo_comun.of_tono_color(il_fabrica,il_linea,ll_co_color,n_cst_application.itr_appl) <> -1 Then//TONO COLOR OK									
				ll_tono=lo_comun.of_getLong(1)										
				//****ESTIMACION TIEMPO *********************************************************************
				Choose Case ai_opcion
						Case 1 // Operaci$$HEX1$$f300$$ENDHEX$$n
							lde_tiempo=iou_estimator.of_gettiempo_operacion_col(al_codigo,ll_pares,ll_tono)//CALCULO DEL TIEMPO
							ll_codA=al_codigo
							SetNull(ll_codB)
						Case 2 // Actividad
							lde_tiempo=iou_estimator.of_get_tiempo_activ_col(al_codigo,ll_pares,ll_tono)//CALCULO DEL TIEMPO
							ll_codB=al_codigo
							SetNull(ll_codA)
				End Choose				
				//MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','Tiempo estimado para la '+ls_objeto+' con c$$HEX1$$f300$$ENDHEX$$digo:'+String(ll_codigo)+' en colores-->'+String(lde_tiempo),Information!)								
				If lde_tiempo <> -1 Then //tiempo estimacion OK1
						ll_co_color=dw_dt_mu_ord_col.GetItemNumber(ll_i,'cons_color')//<--Tener en cuenta para la cancelaci$$HEX1$$f300$$ENDHEX$$n de una orden por color
						This.of_insertar_tarea(	ll_co_color/*pero mejor el co_color long al_consecutivo_color*/,&
														as_genera_ss/*string as_genera_sol_serv*/, &
														ll_codA/*long al_co_operacion*/, &
														ll_codB/*long al_co_actividad*/, &
														lde_tiempo/*double adbl_tiempo */,&
														al_clase_ss)
				Else//tiempo estimacion OK1
						MessageBox('Advertencia','Error calculando el valor de tiempo de estimaci$$HEX1$$f300$$ENDHEX$$n para el color: '+String(ll_co_color),StopSign!)
						ll_null=ll_i
						ll_i=ll_rows	
						lb_out=True
				End If //tiempo estimacion OK1
		Else //TONO COLOR OK
			ls_de_color = dw_dt_mu_ord_col.GetItemString(ll_i,'de_color')
			IF isnull(ls_de_color) THEN
				ls_de_color = ""
			END IF	
//				MessageBox("Advertencia!","Error en la recuperaci$$HEX1$$f300$$ENDHEX$$n del tono para el color "+String(ll_co_color)+'-'+ &
//								dw_dt_mu_ord_col.GetItemString(ll_i,'de_color'),StopSign!)
//				MessageBox("Advertencia!","Error en la recuperaci$$HEX1$$f300$$ENDHEX$$n del tono para el color "+String(ll_co_color)+'-'+ &
//								ls_de_color ,StopSign!)

				ll_null=ll_i
				ll_i=ll_rows	
				lb_out=True
		End If //TONO COLOR OK
Next//Ciclo colores marcados														
dw_dt_mu_ord_col.SetFilter("")
dw_dt_mu_ord_col.Filter()
dw_dt_mu_ord_col.Sort()
of_redraw(True)
If lb_out Then
	//Borra los item adicionados hasta algun error
	ldw_a=tab_activ_oper.tabpage_tareas.dw_tareas
	For ll_i=1 To (ll_null -1)
		ldw_a.DeleteRow(ldw_a.RowCount())
	Next								
	Return -1
End If
//--------------------------------------------------------
Return 1
end function

public function integer of_regtarea_no_xcolor (string as_genera_ss, long al_codigo, integer ai_opcion, long al_clase_ss);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 1 de Diciembre de 2004.H:09:03
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n que calcula el Nro de colores y sus pares a tejer
cuando la act/oper no es por color						
---------------------------------------------------*/
Long ll_null,ll_codA,ll_codB
Decimal{2} lde_tiempo
//---------------------------------------------------
//Funci$$HEX1$$f300$$ENDHEX$$n que calcula el Nro de colores y sus pares a tejer cuando la act/oper es por orden
of_pares_actoper_xcriterioestado('check=1')
/// OR...
//il_rows_actoper  = dw_dt_mu_ord_col.RowCount()
//il_pares_actoper = dw_dt_mu_ord_col.GetItemNumber(1,'compute_ptejer')
//*************************************************************************						
If il_pares_actoper=0 Then//Pares de seleccionados OK1						
	MessageBox('Advertencia','La cantidad de pares debe ser mayor a 0',StopSign!)
	Return -1
End If//Pares de seleccionados OK1					
iou_estimator.of_setcantcolores(il_rows_actoper)
iou_estimator.of_setcantpares(il_pares_actoper)
//C$$HEX1$$c100$$ENDHEX$$LCULO DE ESTIMACI$$HEX1$$d300$$ENDHEX$$N DE TIEMPO
Choose Case ai_opcion
		Case 1 // Operaci$$HEX1$$f300$$ENDHEX$$n
			lde_tiempo=iou_estimator.of_gettiempo_operacion(al_codigo)
			ll_codA=al_codigo
			SetNull(ll_codB)
		Case 2 // Actividad
			lde_tiempo=iou_estimator.of_gettiempo_activ(al_codigo)
			ll_codB=al_codigo
			SetNull(ll_codA)
End Choose	
//If MessageBox('Validaci$$HEX1$$f300$$ENDHEX$$n','Tiempo estimado para la '+ls_objeto+' con c$$HEX1$$f300$$ENDHEX$$digo:'+String(ll_codigo)+'-->'+String(lde_tiempo)+'~nSeguir?',Question!,YesNo!,2) &
//	= 2 Then Return 1
If lde_tiempo=-1 Then //tiempo estimacion OK1						
		MessageBox('Advertencia','Error calculando el valor de tiempo de estimaci$$HEX1$$f300$$ENDHEX$$n para la actividad: '+String(al_codigo),StopSign!)
		Return -1
End If //tiempo estimacion OK1				
This.of_insertar_tarea(	0/*long al_consecutivo(co_color)_color*/,&
								as_genera_ss/*string as_genera_sol_serv*/, &
								ll_codA/*long al_co_operacion*/, &
								ll_codB/*long al_co_actividad*/, &
								lde_tiempo/*double adbl_tiempo */,&
								al_clase_ss)
//-------------------------------------------------------------------------------						
Return 1
end function

public function integer of_obtener_prioridad (string as_tipocliente, long an_cliente, long an_sucursal);long ll_prioridad

SELECT prioridad
INTO :ll_prioridad
FROM mu_cliente_prioridad
WHERE tipo_cliente = :as_tipocliente
AND   co_cliente = :an_cliente
AND   co_sucursal = :an_sucursal
using n_cst_application.itr_appl  ;

If n_cst_application.itr_appl.SqlCode = -1 Then
	MessageBox("Advertencia!","Hubo un error al consultar la prioridad del cliente.~n~nNota: " + n_cst_application.itr_appl.SqlErrText )
	Return -1
ElseIf n_cst_application.itr_appl.SqlCode = 100 Then
//	MessageBox("Advertencia!","La soliciatud no existe. Por favor revisar.")
	Return -1
End If
dw_dt_mu_ord.SetItem(1,"prioridad",ll_prioridad)

RETURN 1
end function

public function boolean wf_validarcamporecursohabilitado () throws exception;/********************************************************************
SA51505 - wf_ValidarCampoRecursoHabilitado Ceiba/JJ - 18-08-2015
<DESC> Description: Indica si el campo recurso esta habilitado o No </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> El Campo recurso esta habilitado si ya fue convertido a referencia si aun No 
		se ha convertido a referencia, no esta habilitado </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	IF inv_orden_pdn.of_ValidarCampoRecursoHabilitado(il_fabrica,il_linea,il_muestra,dw_dt_mu_ord.getItemNumber(1,'co_Recurso') ) THEN
		RETURN TRUE
	ELSE 
		RETURN FALSE
	END IF 
catch( Throwable ex1 )
	ex1.setmessage( "No se pudo verificar si el recurso es modificable o No")
	Throw ex1
End try
end function

public subroutine wf_setpropertiescamporecurso (readonly boolean al_bool) throws exception;/********************************************************************
SA51505 - wf_SetPropertiesCampoRecurso Ceiba/JJ - 18-08-2015
<DESC> Description: si el campo recurso esta habilitado o No tiene un color, y es o no protegido</DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> cargar las propiedades indicadas </USAGE>
********************************************************************/	
IF al_bool THEN //CAMPO HABILITADO
	dw_dt_mu_ord.Modify("co_recurso.Background.Color='1073741824'")//White 
	dw_dt_mu_ord.SetTabOrder(21, 29)
	dw_dt_mu_ord.Modify("co_recurso.Protect='0'")
ELSE //CAMPO DESHABILITADO
	dw_dt_mu_ord.Modify("co_recurso.Background.Color='67108864'")//ButtonFace
	dw_dt_mu_ord.SetTabOrder(21, 0)
	dw_dt_mu_ord.Modify("co_recurso.Protect='1'")
END IF
end subroutine

public function boolean wf_validarcargarrecursomuestrabasica () throws exception;/********************************************************************
SA51505 Ceiba/JJ - 18-08-2015 - wf_validarCargarRecursoMuestraBasica() 
<DESC> Description: Indica si el campo recurso esta habilitado o No </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> si no se ha convertido a referencia la muestra y el recurso no esta 
habilitado se debe validar si en la muestra ya fue cambiado el recurso por uno habilitado </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	//Ceiba/JJ - 30-10-2015
	//Refrescar orden de producci$$HEX1$$f300$$ENDHEX$$n al cambiar por recurso habilitado para desarrollo en la muestra b$$HEX1$$e100$$ENDHEX$$sica, para el caso en donde la muestra no ha sido convertida a referencia
	/*IF inv_orden_pdn.of_ValidarCargarCampoRecursoMuestraOrden(il_fabrica,il_linea,il_muestra,dw_dt_mu_ord.getItemNumber(1,'co_Recurso')) &
		AND (inv_orden_pdn.of_puedeModificar(il_estado_orden)) THEN*/
	IF inv_orden_pdn.of_ValidarCargarCampoRecursoMuestraOrden(il_fabrica,il_linea,il_muestra) THEN		
		RETURN TRUE
	ELSE 
		RETURN FALSE
	END IF 
catch( Throwable ex1 )
	ex1.setmessage( "No se pudo verificar si el recurso es modificable o No")
	Throw ex1
End try
end function

public subroutine wf_cargarrecursomuestrabasica () throws exception;/********************************************************************
SA51505 - wf_CargarRecursoMuestraBasica() Ceiba/JJ - 18-08-2015
<DESC> Description: Indica si el campo recurso esta habilitado o No </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> si no se ha convertido a referencia la muestra y el recurso no esta 
habilitado se debe validar si en la muestra ya fue cambiado el recurso por uno habilitado </USAGE>
********************************************************************/	
Long ll_res
Exception 		ex
n_cst_comun 	lo_comun
ex = create Exception

Try
	IF inv_orden_pdn.of_CargarRecursoMuestraBasica(il_fabrica,il_linea,il_muestra) THEN
		IF inv_orden_pdn.of_getRecursoMuestraBasica() <> dw_dt_mu_ord.GetItemNumber(1,'co_recurso') THEN
			dw_dt_mu_ord.setItem(1,'co_recurso', inv_orden_pdn.of_getRecursoMuestraBasica())
			ll_res=lo_comun.of_nombrerecursomues(inv_orden_pdn.of_getRecursoMuestraBasica() ,n_cst_application.itr_appl)
			If ll_res=1 then
				dw_dt_mu_ord.SetItem(1,"de_recurso",lo_comun.of_getString(1))	
			else 
				dw_dt_mu_ord.SetItem(1,"de_recurso",'')	
			end if 
			ib_cambios = True
		END IF
	END IF 
catch( Throwable ex1 )
	ex1.setmessage( "No se pudo verificar si el recurso es modificable o No")
	Throw ex1
End try


end subroutine

public function integer of_fecha_entrega (datetime adt_fecha, long an_nro_orden);/*-------------------------------------------------
	Develr.	: Ren$$HEX2$$e9002000$$ENDHEX$$Arias Esparza
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 14 de Junio de 2017.H:14:40
//---------------------------------------------------
	Fecha de Entrega de las Ordenes
//---------------------------------------------------*/

Integer li_consec

SELECT MAX(consec)
INTO   :li_consec
FROM   mu_gantt
WHERE nu_orden = :an_nro_orden
using n_cst_application.itr_appl ;

If li_consec > 0 Then

	UPDATE mu_gantt
	SET 	f_prog_fin = :adt_fecha,
			f_mov_fin  = :adt_fecha
	WHERE nu_orden   = :an_nro_orden
	AND   consec     = :li_consec
	using n_cst_application.itr_appl ;

	If n_cst_application.itr_appl.SQLcode=-1 Then 
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(n_cst_application.itr_appl)
		Return -1
	Else
		Commit using n_cst_application.itr_appl;
	End If
Else
	MessageBox("Error", "No hay consecutivo de $$HEX1$$f300$$ENDHEX$$rdenes")
	Return -1
End If

RETURN 1
end function

on w_orden_pdn.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_orden_pdn" then this.MenuID = create m_orden_pdn
this.dw_tmp_mu_soli_tinta=create dw_tmp_mu_soli_tinta
this.dw_mu_soli_tinta=create dw_mu_soli_tinta
this.dw_tmp_mu_soli_hilaza=create dw_tmp_mu_soli_hilaza
this.dw_mu_soli_hilaza=create dw_mu_soli_hilaza
this.dw_2=create dw_2
this.dw_dt_mu_ord_col=create dw_dt_mu_ord_col
this.dw_dt_mu_ord=create dw_dt_mu_ord
this.gb_colores=create gb_colores
this.tab_activ_oper=create tab_activ_oper
this.gb_orden_pdn=create gb_orden_pdn
this.dw_total_pares=create dw_total_pares
this.cb_programar=create cb_programar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_tmp_mu_soli_tinta
this.Control[iCurrent+2]=this.dw_mu_soli_tinta
this.Control[iCurrent+3]=this.dw_tmp_mu_soli_hilaza
this.Control[iCurrent+4]=this.dw_mu_soli_hilaza
this.Control[iCurrent+5]=this.dw_2
this.Control[iCurrent+6]=this.dw_dt_mu_ord_col
this.Control[iCurrent+7]=this.dw_dt_mu_ord
this.Control[iCurrent+8]=this.gb_colores
this.Control[iCurrent+9]=this.tab_activ_oper
this.Control[iCurrent+10]=this.gb_orden_pdn
this.Control[iCurrent+11]=this.dw_total_pares
this.Control[iCurrent+12]=this.cb_programar
end on

on w_orden_pdn.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_tmp_mu_soli_tinta)
destroy(this.dw_mu_soli_tinta)
destroy(this.dw_tmp_mu_soli_hilaza)
destroy(this.dw_mu_soli_hilaza)
destroy(this.dw_2)
destroy(this.dw_dt_mu_ord_col)
destroy(this.dw_dt_mu_ord)
destroy(this.gb_colores)
destroy(this.tab_activ_oper)
destroy(this.gb_orden_pdn)
destroy(this.dw_total_pares)
destroy(this.cb_programar)
end on

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 22 de Septiembre de 2004.H:12:29
---------------------------------------------------*/
// Diagrama Iteraci$$HEX1$$f300$$ENDHEX$$n: Orden de produccion de muestras
// Usuario de orden de producci$$HEX1$$f300$$ENDHEX$$n --> w_orden_pdn
// Msj: Si la ventana no fu$$HEX2$$e9002000$$ENDHEX$$abierta desde el registro.

If io_soli_serv.of_cargar_constantes( )<>1 Then
	Close(This)
	Return 
End If

of_carga_objtr()

If IsValid(Message.PowerObjectParm) Then
	iou_param = Message.PowerObjectParm
	This.PostEvent('ue_busq_muestra') //por que viene con los par. de muestra!
End If

//////////////////////////////////////////////////////////////////////////
// Se hace shareddata entre la lista de tareas, para verla en el tab
// de operaciones y en el de actividades
//////////////////////////////////////////////////////////////////////////
Int i,ll_tot

ll_tot=32

For i=1 to 32
	tab_activ_oper.tabpage_actividades.dw_tareas_en_activ.SetTabOrder(i,0)
	tab_activ_oper.tabpage_procesos.dw_tareas_en_operac.SetTabOrder(i,0)
	
	tab_activ_oper.tabpage_actividades.dw_tareas_en_activ.Modify(&
	"#"+String(i)+".Background.Color='76788149'")
	
	tab_activ_oper.tabpage_procesos.dw_tareas_en_operac.Modify(&
	"#"+String(i)+".Background.Color='76788149'")
Next

tab_activ_oper.tabpage_tareas.dw_tareas.ShareData(&
tab_activ_oper.tabpage_actividades.dw_tareas_en_activ/*datastore d */)

tab_activ_oper.tabpage_tareas.dw_tareas.ShareData(&
tab_activ_oper.tabpage_procesos.dw_tareas_en_operac)

//-----YGZ-----\\
long ll_res
n_cst_comun lo_c

ll_res=lo_c.of_valorconstante( "MU_COLOR_NO_PERMITIDO1",n_cst_application.itr_appl )

If ll_res=1 Then
	il_COLOR_NO_PERMITIDO1=Long(lo_c.of_getDecimal(1))
Else
	il_COLOR_NO_PERMITIDO1=888
End If

ll_res=lo_c.of_valorconstante( "MU_COLOR_NO_PERMITIDO2",n_cst_application.itr_appl )

If ll_res=1 Then
	il_COLOR_NO_PERMITIDO2=Long(lo_c.of_getDecimal(1))
Else
	il_COLOR_NO_PERMITIDO2 = 999
End If
//-----YGZ-----\\
//SA51505 - Ceiba/JJ - 18-08-2015
inv_orden_pdn = Create n_cst_c_orden_pdn

end event

event ue_find;call super::ue_find;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 27 de Septiembre de 2004.H:11:53
---------------------------------------------------
Funcion para invocar la ventana de busqueda para las
muestras/Orden de producci$$HEX1$$f300$$ENDHEX$$n
---------------------------------------------------*/
OpenWithParm(w_res_seleccion_busq,is_where_busqueda)
If IsValid(Message.PowerObjectParm) Then
	iou_param = Message.PowerObjectParm
	il_fabrica=-1
	il_linea=-1
	il_muestra=-1	
	If UpperBound(iou_param.is_vector)=2 Then
		ib_busq_camb = TRUE
		If iou_param.is_vector[2]='muestra' Then			
			If of_buscar_muestra() = -1 Then
				of_reset()
			End If
		ElseIf iou_param.is_vector[2]='orden'Then			
			If of_buscar() = -1 Then
				of_reset()
			End If 
		End If		
	Else
		MessageBox('Advertencia','Error en el par$$HEX1$$e100$$ENDHEX$$metro de selecci$$HEX1$$f300$$ENDHEX$$n de B$$HEX1$$fa00$$ENDHEX$$squeda.',StopSign!)
	End If
End If
end event

event key;call super::key;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 27 de Septiembre de 2004.H:17:31
---------------------------------------------------
Uso del ctrl, keyflags=2
---------------------------------------------------*/
IF keyflags = 2 THEN // Keyflags para el 'Ctrl'
	Choose Case Key
			Case Key1!
				of_scroll(0)
				dw_dt_mu_ord.SetFocus()
			Case Key2!
				of_scroll(0)
				dw_dt_mu_ord_col.SetFocus()				
			Case Key3!
				of_scroll(8)
				tab_activ_oper.SelectTab(tab_activ_oper.tabpage_mp_base)
				tab_activ_oper.tabpage_mp_base.dw_mp_base.SetFocus()		
			Case Key4!
				of_scroll(8)
				tab_activ_oper.SelectTab(tab_activ_oper.tabpage_procesos)
				tab_activ_oper.tabpage_procesos.dw_operacion_muestra.SetFocus()		
			Case Key5!
				of_scroll(8)
				tab_activ_oper.SelectTab(tab_activ_oper.tabpage_actividades)
				tab_activ_oper.tabpage_actividades.dw_actividad_muestra.SetFocus()				
			Case Key6!
				of_scroll(8)
				tab_activ_oper.SelectTab(tab_activ_oper.tabpage_antideslizante)
				tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante.SetFocus()				
			Case Key7!
				of_scroll(8)
				tab_activ_oper.SelectTab(tab_activ_oper.tabpage_bordado)
				tab_activ_oper.tabpage_bordado.dw_bordado.SetFocus()				
			Case Key8!
				of_scroll(8)
				tab_activ_oper.SelectTab(tab_activ_oper.tabpage_tareas)
				tab_activ_oper.tabpage_tareas.dw_tareas.SetFocus()				
	End Choose
End If
end event

event ue_save;call super::ue_save;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 30 de Septiembre de 2004.H:12:37
---------------------------------------------------
Evento para  guardar los datos.
---------------------------------------------------*/
Long ll_nu_orden

dw_dt_mu_ord.AcceptText()

of_Redraw(False)
If of_verificar()<>1 Then
	of_filtrar_chab_bord()
	of_Redraw(True)
	Return
End If

If of_guardar()<>1 Then
	of_Redraw(True)
	Return
End If

//Funci$$HEX1$$f300$$ENDHEX$$n que realiza el commit
of_ok_orden()

ll_nu_orden = dw_dt_mu_ord.getItemNUmber(1,"nu_orden")
MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","La orden # "+String(il_nu_orden)+" se registr$$HEX2$$f3002000$$ENDHEX$$satisfactoriamente.")
ib_cambios=False
ib_busq_camb = False
ib_save=True
of_buscar()
of_Redraw(True)
il_orden_repeticion_orig = 0
//----------------------------------------------------------------
end event

event closequery;call super::closequery;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 28 de Septiembre de 2004.H:15:12
---------------------------------------------------
---------------------------------------------------*/
If ib_cambios Then
	If MessageBox('Validaci$$HEX1$$f300$$ENDHEX$$n','Se perder$$HEX1$$e100$$ENDHEX$$n los cambios realizados. Desea continuar?',Question!,YesNo!,2)=2 Then
		Return 1
	Else
		Return 0
	End If
End If
end event

type dw_tmp_mu_soli_tinta from u_dw_application within w_orden_pdn
boolean visible = false
integer x = 1874
integer y = 3036
integer taborder = 80
string dataobject = "d_mu_soli_tinta"
end type

type dw_mu_soli_tinta from u_dw_application within w_orden_pdn
boolean visible = false
integer x = 1289
integer y = 3048
integer taborder = 80
string dataobject = "d_mu_soli_tinta"
end type

type dw_tmp_mu_soli_hilaza from u_dw_application within w_orden_pdn
boolean visible = false
integer x = 713
integer y = 3040
integer taborder = 70
string dataobject = "d_mu_soli_hilaza"
end type

type dw_mu_soli_hilaza from u_dw_application within w_orden_pdn
boolean visible = false
integer x = 114
integer y = 3024
integer taborder = 60
string dataobject = "d_mu_soli_hilaza"
end type

type dw_2 from u_dw_application within w_orden_pdn
boolean visible = false
integer x = 78
integer y = 3468
integer width = 2706
integer height = 608
integer taborder = 0
string dataobject = "d_mu_sol_serv_mp"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 24 de Septiembre de 2004.H:09:56
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lo_param
//---------------------------------------------------
If dwo.name="co_proveedor" then
	Open(w_bus_m_proveedores_mp_ord) 
	lo_param=Message.PowerObjectParm
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If		
End If
end event

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 24 de Septiembre de 2004.H:14:25
---------------------------------------------------
Adquiere color 
---------------------------------------------------*/
//tabtextcolor=Rgb(0,0,255)
end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 24 de Noviembre de 2004.H:14:11
---------------------------------------------------
---------------------------------------------------*/
Long ll_dato,ll_resultado
n_cst_comun lo_comun
//---------------------------------------------------
If il_err_item_change<>0 Then
	Return 2
End If
//--------------------------------------------------------------------
If dwo.name="co_proveedor" Then
	ll_dato=Long(Data)
	ll_resultado=lo_comun.of_nombreproveedor(ll_dato,n_cst_application.itr_appl)
	If ll_resultado<>1 Then
		MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo de proveedor no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		//Return 2
	End If
	SetItem(row,"de_proveedor",lo_comun.of_getString(1))
End If
//--------------------------------------------------------------------
ib_cambios=True
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 24 de Septiembre de 2004.H:14:25
---------------------------------------------------
Adquiere color 
---------------------------------------------------*/
//tabtextcolor=Rgb(0,0,0)
end event

event sqlpreview;call super::sqlpreview;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 4 de Octubre de 2004.H:17:23
---------------------------------------------------
---------------------------------------------------*/
//MessageBox('SQLPreview','SQLSYNTAX: ~n'+sqlsyntax+'~n#Fila: '+&
//				String(row))
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 25 de Noviembre de 2004.H:10:06
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
end event

type dw_dt_mu_ord_col from u_dw_application within w_orden_pdn
integer x = 73
integer y = 912
integer width = 3438
integer height = 700
integer taborder = 40
string dataobject = "d_dt_mu_ord_col1"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 24 de Septiembre de 2004.H:09:56
---------------------------------------------------
---------------------------------------------------*/
n_cst_param_orden lo_param
n_cst_param lo_param2
//---------------------------------------------------
If Row=0 Then Return
//---------------------------------------------------
of_Sel_fila(Row)
//---------------------------------------------------
If dwo.name="co_color" then
	If il_estado_orden<>1 Then
		MessageBox("Advertencia!","No se puede modificar el color.",StopSign!)
		Return 2
	End If

	lo_param2.il_vector[1]=il_fabrica
	lo_param2.il_vector[2]=il_linea
	OpenWithParm(w_bus_m_colores,lo_param2)
	lo_param2=Message.PowerObjectParm
	If IsValid(lo_param2) Then
		SetText(String(lo_param2.il_vector[1]))
		AcceptText()
		SetColumn('de_color')
	End If		
End If
//---------------------------------------------------
If dwo.name="id_bordado" then

	Open(w_bus_bordado)
	lo_param=Message.PowerObjectParm
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
		AcceptText()
		SetColumn('de_bordado')
		//SetItem(row,'de_bordado',lo_param.is_vector[1])
	End If		
End If
//---------------------------------------------------
If dwo.name="id_chablon" then

	Open(w_bus_chablon)
	lo_param=Message.PowerObjectParm
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
		AcceptText()
		SetColumn('de_chablon')
		//SetItem(row,'de_chablon',lo_param.is_vector[1])
	End If		
End If
//---------------------------------------------------
end event

event editchanged;call super::editchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 8 de Octubre de 2004.H:14:18
---------------------------------------------------
---------------------------------------------------*/
If dwo.name='pares_tejer' OR dwo.name='pares_despachar'then
	If This.Object.co_color[row]=999 OR This.Object.co_color[row]=888 then
		This.Object.pares_tejer[row]=0
		This.Object.pares_despachar[row]=0
	End If
End If
end event

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 24 de Septiembre de 2004.H:14:25
---------------------------------------------------
---------------------------------------------------*/
gb_colores.of_color(True)
end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 8 de Septiembre de 2004.H:11:54
---------------------------------------------------
---------------------------------------------------*/
Long 	ll_dato,ll_pos,ll_resultado,ll_partes_bordado,&
		ll_cantidad_chablon,ll_cons_color,ll_null, ll_color
String ls_activo
n_cst_comun_orden lo_comun
u_dw_application ldw_a
//--------------------------------------------------------------------
If il_err_item_change<>0 Then
	Return 2
End If
//--------------------------------------------------------------------
If dwo.name="co_color" Then
	
	If il_estado_orden<>1 Then
		MessageBox("Advertencia!","No se puede modificar el color, la orden no est$$HEX2$$e1002000$$ENDHEX$$en estado registrada.",StopSign!)
		Return 2
	End If
	
	ll_pos=find("co_color="+data,1,RowCount())
	If ll_pos>0 then
		MessageBox("Advertencia","El color ya existe.",StopSign!)
		Return 2 
	End If
	
	ll_dato=Long(Data)
	ll_resultado=lo_comun.of_nombrecolor(il_fabrica,il_linea,ll_dato, &
													n_cst_application.itr_appl)
	If ll_resultado<>1 Then
		MessageBox("Advertencia!","Color no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_color",Trim(lo_comun.of_getString(1)))
	of_codcolor_tarea(GetItemNumber(row,'co_color'),Long(Data))
End If
/*--------------------------------------------------------------------
Control de la distribucion de los colores de la orden
--------------------------------------------------------------------*/
If dwo.name="pares_tejer" Then
	
	If il_estado_orden<>1 Then
		MessageBox("Advertencia!","No se puede modificar pares a tejer, la orden no est$$HEX2$$e1002000$$ENDHEX$$en estado registrada.",StopSign!)
		Return 2
	End If
	
	ll_pos=GetItemNumber(row,"check")
	If  ll_pos = 1 Then
		This.SetItem(row,"pares_tejer",Long(Data))
		dw_total_pares.SetItem(1,'total_ptejer',This.GetItemNumber(1,'compute_ptejer'))
	Else
		Return 2
	End IF		
End If
//--------------------------------------------------------------------
If  dwo.name="pares_despachar" Then

	If il_estado_orden<>1 Then
		MessageBox("Advertencia!","No se puede modificar pares a despachar, la orden no est$$HEX2$$e1002000$$ENDHEX$$en estado registrada.",StopSign!)
		Return 2
	End If
	
	
	ll_pos=GetItemNumber(row,"check")
	If  ll_pos = 1 Then
		This.SetItem(row,"pares_despachar",Long(Data))
		dw_total_pares.SetItem(1,'total_pdespachar',This.GetItemNumber(1,'compute_pdespachar'))
	Else
		Return 2
	End IF		
End If
//--------------------------------------------------------------------
If dwo.name="check" Then

	If il_estado_orden<>1 Then
		MessageBox("Advertencia!","No se puede modificar colores, la orden no est$$HEX2$$e1002000$$ENDHEX$$en estado registrada.",StopSign!)
		Return 2
	End If
	
	
	If GetItemNumber(row,"check") = 1 Then
		//*********************************************************
			ldw_a=tab_activ_oper.tabpage_tareas.dw_tareas
			If ldw_a.Find('cons_color=0',1,ldw_a.RowCount())>0 Then
				MessageBox('Advertencia','Existe(n) tarea(s) con criterio por orden',StopSign!)
				Return 2
			Else
				If ldw_a.Find('cons_color='+String(GetItemNumber(row,'cons_color')),1,ldw_a.RowCount())>0 Then
					MessageBox('Advertencia','Color incluido en tarea(s) con criterio por color',StopSign!)
					Return 2
				End If
			End If
			//Gantt
		//*********************************************************
		This.SetItem(row,"check",0)
		This.SetItem(row,"check_estimacion",0)
		This.SetItem(row,"pares_despachar",0)
		This.SetItem(row,"pares_tejer",0)
		If Not IsNull(GetItemNumber(row,'id_bordado')) Then
			ldw_a=tab_activ_oper.tabpage_bordado.dw_bordado
			ldw_a.RowsMove(1,ldw_a.RowCount(),Primary!,ldw_a,ldw_a.DeletedCount()+1,Delete!)
			SetNull(ll_null)
			SetItem(row,'id_bordado',ll_null)
			SetItem(row,'de_bordado','')
		End If
		If Not IsNull(GetItemNumber(row,'id_chablon')) Then
			ldw_a=tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante
			ldw_a.RowsMove(1,ldw_a.RowCount(),Primary!,ldw_a,ldw_a.DeletedCount()+1,Delete!)
			SetNull(ll_null)
			SetItem(row,'id_chablon',ll_null)
			SetItem(row,'de_chablon','')
		End If
	Else
		This.SetItem(row,"check",1)			
	End If
	ll_pos=of_distrib_col(dw_total_pares.GetItemNumber(1,'total_ptejer'),"total_ptejer")
	ll_pos=of_distrib_col(dw_total_pares.GetItemNumber(1,'total_pdespachar'),"total_pdespachar")
	This.ScrollToRow(row)			
End If
//--------------------------------------------------------------------
If dwo.name="check_estimacion" Then

	If of_puedeModificar()<>1 Then
		MessageBox("Advertencia!","No se puede modificar colores, la orden no est$$HEX2$$e1002000$$ENDHEX$$en estado registrada.",StopSign!)
		Return 2
	End If
	
	If GetItemNumber(row,"check") = 0 Then
		MessageBox("Advertencia!","Color no seleccionado para la orden.No se puede incluir en la estimaci$$HEX1$$f300$$ENDHEX$$n",StopSign!)
		Return 2			
	End If
	//-----YGZ-----\\
	ll_color = THIS.GetitemNumber(row,"co_color")	
	
	IF ll_color = il_COLOR_NO_PERMITIDO1 OR ll_color = il_COLOR_NO_PERMITIDO2 THEN
		MessageBox("Advertencia!","No esta permitido la programacion de tareas. Para el color "+string(ll_color),StopSign!)
		RETURN 2
	END IF	
	//-----YGZ-----\\
	
End If
//--------------------------------------------------------------------
If dwo.name="id_bordado" Then
		//Validar cuando se borra osea nulo y limpiar la desc.
		ll_dato=Long(Data)
		ll_resultado=lo_comun.of_nombrebordado(ll_dato,n_cst_application.itr_appl)
		If ll_resultado<>1 Then		
			MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo de Bordado no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
			Return 2
		End If
		ls_activo=lo_comun.of_getString(2)
		If ls_activo='N' Then// Se verifica si el bordado no esta activo debe estar en la orden

				If ll_pos<=0 Then
						MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo de Bordado esta inactivo y no est$$HEX2$$e1002000$$ENDHEX$$incluido en la orden.",StopSign!)
						Return 2
				End If			
		End If
		//***************Si modifica el bordado con partes registradas
		ldw_a=tab_activ_oper.tabpage_bordado.dw_bordado
		ll_cons_color=GetItemNumber(row,'cons_color')
		ll_pos=ldw_a.Find('cons_color='+String(ll_cons_color),1,ldw_a.RowCount())
		If ll_pos>0 Then
			If MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Este color tiene hilos del bordado registrados."+&
						"Desea modificar el bordado y asignar nuevos hilos?",Question!,YesNo!,2)=2 Then
				Return 2
			Else
				ldw_a.RowsMove(1,ldw_a.RowCount(),Primary!,ldw_a,ldw_a.DeletedCount()+1,Delete!)
			End If
		End If
		//***************
		SetItem(row,"de_bordado",Trim(lo_comun.of_getString(1)))
		ll_partes_bordado=lo_comun.of_getLong(1)
		If of_partes_bordado(ll_dato,ll_partes_bordado,ll_cons_color)<>1 Then
			//SetItem(row,"de_bordado",'')
			Return 2
		End If
End If
//--------------------------------------------------------------------
If dwo.name="id_chablon" Then
		//Validar cuando se borra osea nulo y limpiar la desc.
		ll_dato=Long(Data)
		ll_resultado=lo_comun.of_nombrechablon(ll_dato,n_cst_application.itr_appl)
		If ll_resultado<>1 Then
			MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo de chablon no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
			Return 2
		End If
		ls_activo=lo_comun.of_getString(2)
		If ls_activo='N' Then// Se verifica si el chablon no esta activo debe estar en la orden

				If ll_pos<=0 Then
						MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo de Chabl$$HEX1$$f300$$ENDHEX$$n esta inactivo y no est$$HEX2$$e1002000$$ENDHEX$$incluido en la orden.",StopSign!)
						Return 2
				End If			
		End If
		ldw_a=tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante
		ll_cons_color=GetItemNumber(row,'cons_color')
		ll_pos=ldw_a.Find('cons_color='+String(ll_cons_color),1,ldw_a.RowCount())
		If ll_pos>0 Then
			If MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Este color tiene tintas del chablon registradas."+&
						"Desea modificar el chablon y asignar nuevas tintas?",Question!,YesNo!,2)=2 Then
				Return 2
			Else
				ldw_a.RowsMove(1,ldw_a.RowCount(),Primary!,ldw_a,ldw_a.DeletedCount()+1,Delete!)
			End If
		End If
		SetItem(row,"de_chablon",Trim(lo_comun.of_getString(1)))
		ll_cantidad_chablon=lo_comun.of_getLong(1)
		If of_cantidad_chablon(ll_dato,ll_cantidad_chablon,ll_cons_color)<> 1 Then
			//SetItem(row,"de_chablon",'')	
			Return 2
		End If 
			
End If
//--------------------------------------------------------------------
ib_cambios=True
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 24 de Septiembre de 2004.H:14:25
---------------------------------------------------
---------------------------------------------------*/
gb_colores.of_color(False)
end event

event sqlpreview;call super::sqlpreview;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 4 de Octubre de 2004.H:17:23
---------------------------------------------------
---------------------------------------------------*/
//MessageBox('SQLPreview.Colores','SQLSYNTAX: ~n'+sqlsyntax+'~n#Fila: '+&
//				String(row))
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 25 de Noviembre de 2004.H:10:06
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
end event

event ue_deleterow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 25 de Noviembre de 2004.H:10:06
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
end event

event rowfocuschanged;call super::rowfocuschanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 02 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
If CurrentRow<=0 Then Return
//-------------------------------------------------
of_Sel_fila(CurrentRow)
of_filtrar_chab_bord()
//-------------------------------------------------
end event

event itemerror;call super::itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 10 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Long li_null,ll_cons_color,ll_pos
u_dw_application ldw_a
//-------------------------------------------------
If Long(Data)=0 Then
		SetNull(li_null)		
		If dwo.name='co_color' Then 
			This.SetItem(row,String(dwo.name),li_null)
			This.SetItem(row,'de_color','')		
		ElseIf dwo.name='id_bordado' Then
			//***************Si modifica el bordado con partes registradas
			ldw_a=tab_activ_oper.tabpage_bordado.dw_bordado
			ll_cons_color=GetItemNumber(row,'cons_color')
			ll_pos=ldw_a.Find('cons_color='+String(ll_cons_color),1,ldw_a.RowCount())
			If ll_pos>0 Then
				If MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Este color tiene hilos del bordado registrados."+&
							"Desea eliminar el bordado y los hilos registrados?",Question!,YesNo!,2)=2 Then
					Post SetColumn('de_bordado')		
					Return 3
				Else
					This.SetItem(row,String(dwo.name),li_null)
					ldw_a.RowsMove(1,ldw_a.RowCount(),Primary!,ldw_a,ldw_a.DeletedCount()+1,Delete!)
				End If
			End If
			//***************
			This.SetItem(row,'de_bordado','')		
		ElseIf dwo.name='id_chablon' Then 
				ldw_a=tab_activ_oper.tabpage_antideslizante.dw_detalle_antideslizante
				ll_cons_color=GetItemNumber(row,'cons_color')
				ll_pos=ldw_a.Find('cons_color='+String(ll_cons_color),1,ldw_a.RowCount())
				If ll_pos>0 Then
					If MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Este color tiene tintas del chablon registradas."+&
								"Desea eliminar el chablon y las tintas registradas?",Question!,YesNo!,2)=2 Then
						Post SetColumn('de_chablon')
						Return 3
					Else
						This.SetItem(row,String(dwo.name),li_null)
						ldw_a.RowsMove(1,ldw_a.RowCount(),Primary!,ldw_a,ldw_a.DeletedCount()+1,Delete!)
					End If
				End If
				This.SetItem(row,'de_chablon','')		
		End If
		ib_cambios=True
		Return 3
End If

end event

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 02 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------
If Row<=0 Then Return
//-------------------------------------------
of_Sel_fila(Row)
of_filtrar_chab_bord()
//-------------------------------------------
end event

type dw_dt_mu_ord from u_dw_application within w_orden_pdn
integer x = 50
integer y = 84
integer width = 3438
integer height = 684
string dataobject = "d_dt_mu_ord1"
boolean vscrollbar = false
end type

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 27 de Septiembre de 2004.H:08:35
---------------------------------------------------
---------------------------------------------------*/

gb_orden_pdn.of_color(True)



end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 27 de Septiembre de 2004.H:08:35
---------------------------------------------------
---------------------------------------------------*/
gb_orden_pdn.of_color(False)
end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 29 de Septiembre de 2004.H:10:40
---------------------------------------------------
---------------------------------------------------*/
n_cst_comun lo_comun
Long ll_resultado,ll_dato, ll_res
String ls_dato
Datetime ldt_fe_prog_fin
Long ll_co_tipoprod, ll_nulo, ll_fabrica, ll_linea, ll_muestra, ll_talla, ll_find
DataWindowChild 	ldc_tipo_orden, ldc_causa
uo_dsbase	lds_orden
	
//--------------------------------------------------------------------------------

Setnull(ll_nulo)

Choose Case dwo.Name
	Case 'co_muestra'
		//	//
		//	il_fabrica	= dw_dt_mu_ord.GetItemNumber(row,"co_fabrica")
		//	il_linea		= dw_dt_mu_ord.GetItemNumber(row,"co_linea")
		//	ll_dato		= Long(Data)
		//	ll_resultado = lo_comun.of_nombreMuestra(il_fabrica,il_linea, &
		//								ll_dato,n_cst_application.itr_appl)
		//	// 
		//	If ll_resultado<>1 then 
		//		MessageBox("Advertencia!","Muestra no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		//		Return 2
		//	End If
		//		// Esta descripcion es sacada de la tabla m_muestras, no de dt_mud_ord
		//		SetItem(1,"de_muestra",lo_comun.of_getString(1))
		//		il_muestra = ll_dato
		//		//Si es otra muestra ... traer sus datos y colores
		//		//ib_busq_camb = False
		//		//of_buscar_muestra()
			Post MessageBox("Advertencia!","Localizar datos desde la b$$HEX1$$fa00$$ENDHEX$$squeda de muestras",StopSign!)
			Return 2
			
	Case  'co_ejecutiva'
		If IsNull(is_tipo_muestra) Then
			ll_resultado=lo_comun.of_tipo_muestra(il_fabrica,il_linea, &
											il_muestra,n_cst_application.itr_appl)
			If ll_resultado<>1 then 
				Post MessageBox("Advertencia!","Verifique muestra para "+ &
							  "hallar su tipo.~nEjecutiva no disponible",StopSign!)
				Return 2
			End If
			is_tipo_muestra =  lo_comun.of_getString(1)
		End If
		ll_dato = Long(Data)
		ll_resultado=lo_comun.of_nombreejecutiva(is_tipo_muestra /*string a_tipo*/,&
													  ll_dato/*long a_codigo*/,&
													  n_cst_application.itr_appl/*transaction a_transaction */)
		If ll_resultado<>1 Then
			Post MessageBox("Advertencia!","Ejecutiva no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
			Return 2
		End If
		SetItem(1,"de_ejecutiva",lo_comun.of_getString(1))	
		
	Case "co_ctecnico"
		Trim(Data)
		ll_resultado=idc_ctecnico.Find('Match(co_ctecnico,~"'+Data+'~")',1,idc_ctecnico.RowCount()+1)
		SetItem(1,'de_ctecnico',idc_ctecnico.GetItemString(ll_resultado,'de_ctecnico'))
		
	Case "co_tipoprod"
		This.GetChild('tipo',ldc_tipo_orden)
	
		//filtra tipo orden por el tipo de producto
		ll_co_tipoprod = This.GetitemNumber(1,'co_tipoprod')
		ldc_tipo_orden.SetFilter('co_tipoprod = ' + String(ll_co_tipoprod))
		ldc_tipo_orden.Filter()
		
		This.GetChild('cod_causa',ldc_causa)
		//filtra tipo orden por el tipo de producto
		ldc_causa.SetFilter('co_tipoprod = ' + String(ll_co_tipoprod))
		ldc_causa.Filter()
	
		//limpia campo tipo
		This.SetItem(1, 'tipo', '')
		
	Case 'sw_repeticion'
		//habilita datos
		If Trim(data) = '0' Then
			//mira si  la orden es repeticion de otra, no se deja borrar
			ll_find = tab_activ_oper.tabpage_repeticion.dw_repeticiones.Find('nu_orden_ant = ' + String(This.GetItemNumber(row,'nu_orden')) &
								, 1 , tab_activ_oper.tabpage_repeticion.dw_repeticiones.RowCount() + 1)
			//si encuentra no se deja modificar
			If ll_find > 0 Then Return 2
			//toma la orden anterior para borrarla
			If This.GetItemNumber(row,'nu_orden_ant',Primary!,true) > 0 Then 
				il_orden_repeticion_orig = This.GetItemNumber(row,'nu_orden_ant',Primary!,true)
			Else
				il_orden_repeticion_orig = 0
			End if
			//limpia campos
			This.SetItem(row,'nu_orden_ant',ll_nulo)
			This.SetItem(row,'cod_causa',ll_nulo)
			//limpia dw de repeticiones
			tab_activ_oper.tabpage_repeticion.dw_repeticiones.Reset()
		End if
		
		//filtra causas por tipo producto
		This.GetChild('cod_causa',ldc_causa)
	
		//filtra tipo orden por el tipo de producto
		ll_co_tipoprod = This.GetitemNumber(1,'co_tipoprod')
		ldc_causa.SetFilter('co_tipoprod = ' + String(ll_co_tipoprod))
		ldc_causa.Filter()
	Case 'sw_complemento'
		//habilita datos
		If Trim(data) = '0' Then
			//limpia campos
			This.SetItem(row,'nu_orden_principal',ll_nulo)
		End if
		
	Case 'nu_orden_principal'
		If Isnull(data) or Trim(data) = '' or Long (data) = This.GetItemNumber(row,'nu_orden') Then Return 2
		
		lds_orden = create uo_dsbase
		lds_orden.dataobject = 'd_gr_orden_x_nu_orden_ant'
		lds_orden.setTransobject(n_cst_application.itr_appl)	
		
		//consulta si existe orden digitada
		If lds_orden.Retrieve(Long(data)) > 0 Then
			//verifica si la orden ya es complemento de otra orden
			If lds_orden.GetItemNumber(1, 'orden_principal') > 0 Then
				Post MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Orden ingresada es orden complementaria de la orden " + String(lds_orden.GetItemNumber(1, 'orden_principal')))
				Destroy lds_orden
				Return 2 
			End if	
		Else
			Post MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Orden de fabricaci$$HEX1$$f300$$ENDHEX$$n no existe")
			Destroy lds_orden
			Return 2 
		End if
		
	Case 'nu_orden_ant'
		
		If Isnull(data) or Trim(data) = '' or Long (data) = This.GetItemNumber(row,'nu_orden') Then Return 2
		
		//mira si  la orden es repeticion de otra, no se deja borrar
		ll_find = tab_activ_oper.tabpage_repeticion.dw_repeticiones.Find('nu_orden_ant = ' + String(This.GetItemNumber(row,'nu_orden')) &
							, 1 , tab_activ_oper.tabpage_repeticion.dw_repeticiones.RowCount() + 1)
		//si encuentra no se deja modificar
		If ll_find > 0 Then Return 2
		
		If This.GetItemNumber(row,'nu_orden_ant',Primary!,true) > 0 Then 
			il_orden_repeticion_orig = This.GetItemNumber(row,'nu_orden_ant',Primary!,true)
		Else
			il_orden_repeticion_orig = 0
		End if
		
		lds_orden = create uo_dsbase
		lds_orden.dataobject = 'd_gr_orden_x_nu_orden_ant'
		lds_orden.setTransobject(n_cst_application.itr_appl)	
		
		//consulta si existe orden digitada
		If lds_orden.Retrieve(Long(data)) > 0 Then
			//verifica si la orden ya es repitente de otra orden
			If lds_orden.GetItemNumber(1, 'orden_act_repeticion') > 0 Then
				Post MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Orden ingresada ya es orden anterior de la orden repetici$$HEX1$$f300$$ENDHEX$$n " + String(lds_orden.GetItemNumber(1, 'orden_act_repeticion')))
				Destroy lds_orden
				Return 2 
			End if
			
			//toma muestra y talla
			ll_fabrica = This.GetitemNumber(1,'co_fabrica')
			ll_linea = This.GetitemNumber(1,'co_linea')
			ll_muestra = This.GetitemNumber(1,'co_muestra')
			ll_talla = This.GetitemNumber(1,'co_talla')
			
			//verifica que la orden sea de la misma muestra y talla
			If ll_fabrica = lds_orden.getItemNumber(1,'co_fabrica') and &
				ll_linea = lds_orden.getItemNumber(1,'co_linea') and &
				ll_muestra = lds_orden.getItemNumber(1,'co_muestra') and &
				ll_talla = lds_orden.getItemNumber(1,'co_talla') Then
				
				//consulta las repeticiones que tiene la orden digitada
				tab_activ_oper.tabpage_repeticion.dw_repeticiones.Retrieve(Long(data))
				
				//tomo el consecutivo de las repeticiones
				If tab_activ_oper.tabpage_repeticion.dw_repeticiones.RowCount() > 0 Then
					il_consecutivo_repeticion = tab_activ_oper.tabpage_repeticion.dw_repeticiones.GetItemNumber(1,'consecutivo_repeticion')
				Else
					il_consecutivo_repeticion = -1 //lds_orden.GetItemNumber(1,'max_consecutivo_repeticion') + 1
				End if
				
			Else
				Post MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Orden de fabricaci$$HEX1$$f300$$ENDHEX$$n no contiene el mismo c$$HEX1$$f300$$ENDHEX$$digo de muestra o talla")
				Destroy lds_orden
				Return 2 
			End if
				
		Else
			Post MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Orden de fabricaci$$HEX1$$f300$$ENDHEX$$n no existe")
			Destroy lds_orden
			Return 2 
		End if
		
		Destroy lds_orden
End choose


//--------------------------------------------------------------------------------
/***********************************************************
SA51505 - Ceiba/JJ - 18-08-2015
Comentario: Cargar la misma de recursos que hay en muestra basica 
***********************************************************/
If dwo.name="co_recurso" and this.Describe("co_recurso.Protect") = '0' Then 
	/* Nombre de Recurso*/
	ll_res=lo_comun.of_nombrerecursomues(long(data) ,n_cst_application.itr_appl)
	If ll_res=1 then
		dw_dt_mu_ord.SetItem(1,"de_recurso",lo_comun.of_getString(1))	
	else 
		dw_dt_mu_ord.SetItem(1,"de_recurso",'')	
	End If
END IF

//--------------------------------------------------------------------------------
ib_cambios=True
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 29 de Septiembre de 2004.H:11:21
---------------------------------------------------
Permitir un nuevo registro de la orden cuando se proviene 
de la busqueda de los datos de alguna orden
---------------------------------------------------*/
//Long ll_res
//If ib_cambios Then
//	ll_res=MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n!","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
//	
//	If ll_res=2 Then
//	 Return
//	End If
//End If
//of_reset()
//il_nu_orden=0
//Call Super::ue_insertrow	
MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe realizar una b$$HEX1$$fa00$$ENDHEX$$squeda de muestra para recuperar datos de una nueva orden.",Information!)

end event

event retrieveend;call super::retrieveend;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 1 de Octubre de 2004.H:17:58
---------------------------------------------------
SA51505 - Ceiba/JJ - 22-10-2015
Comentario: Se adiciona el llamado de la funcion wf_validarcargarrecursomuestrabasica
***********************************************************/
Long ll_estado
Boolean lb_prog
TRY
ll_estado = dw_dt_mu_ord.GetItemNumber(1,'condicion')
il_estado_orden=ll_estado
Choose Case ll_estado
	Case 1/*Registrada*/
		lb_prog=True	
	Case Else//2,3,4,5,6,7,8 
		lb_prog=False		
End Choose
of_ord_programada(lb_prog)	
IF wf_validarCargarRecursoMuestraBasica() THEN
	wf_cargarRecursoMuestraBasica()
END IF 
//---------------------------------
CATCH(Throwable le_error)
	Messagebox("Error Recuperando Ordenes", le_error.getmessage(), StopSign!)
End Try
end event

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 8 de Octubre de 2004.H:10:23
---------------------------------------------------
---------------------------------------------------*/
n_cst_comun 	lo_comun
Long				ll_res
//--------------------------------------------------------------------
If Row<=0 Then Return
//--------------------------------------------------------------------
If dwo.name="co_ejecutiva" Then
	n_cst_param lo_param
	lo_param.is_vector[1]=is_tipo_muestra
	OpenWithParm(w_bus_ejecutivo_vendedor,lo_param)
	lo_param=Message.powerObjectParm
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
		AcceptText()
		SetColumn('de_ejecutiva')
	End If	
End If

/***********************************************************
SA51505 - Ceiba/JJ - 18-08-2015
Comentario: Cargar la misma de recursos que hay en muestra basica 
***********************************************************/
If dwo.name="co_recurso" and this.Describe("co_recurso.Protect") = '0' Then 
	lo_param.il_vector[1] = il_tipo_prod
	OpenWithParm(w_bus_mu_recurso_ct, lo_param)	
	lo_param=Message.PowerObjectParm	
	IF IsValid(lo_param) THEN	
		SetItem (getrow(), "co_recurso", lo_param.il_vector[1] )
		/* Nombre de Recurso*/
		ll_res=lo_comun.of_nombrerecursomues(lo_param.il_vector[1] ,n_cst_application.itr_appl)
		If ll_res=1 then
			dw_dt_mu_ord.SetItem(1,"de_recurso",lo_comun.of_getString(1))	
		End If
	ELSE
		RETURN
	END IF
END IF
end event

event ue_deleterow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 25 de Noviembre de 2004.H:10:06
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
end event

event itemerror;call super::itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 10 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Integer li_null
String ls_col
//-------------------------------------------------
If dwo.name='co_ejecutiva' Then
	If Long(Data)=0 Then
		SetNull(li_null)
		ls_col=dwo.name
		This.SetItem(row,ls_col,li_null)
		This.SetItem(row,'de_ejecutiva','')		
		Return 3
	End If		
End If
end event

event sqlpreview;//MessageBox('SQLPreview.Maestro','SQLSYNTAX: ~n'+sqlsyntax+'~n#Fila: '+&
//				String(row))
end event

event itemfocuschanged;call super::itemfocuschanged;Long ll_co_tipoprod
DataWindowChild 	ldc_tipo_orden

This.GetChild('tipo',ldc_tipo_orden)

//filtra tipo orden por el tipo de producto
ll_co_tipoprod = This.GetitemNumber(1,'co_tipoprod')
If Not Isnull(ll_co_tipoprod) Then
	ldc_tipo_orden.SetFilter('co_tipoprod = ' + String(ll_co_tipoprod))
	ldc_tipo_orden.Filter()
End if
end event

type gb_colores from u_gb_base within w_orden_pdn
integer x = 37
integer y = 836
integer width = 3511
integer height = 980
integer taborder = 0
string text = "Colores(Ctrl+2)"
end type

type tab_activ_oper from tab within w_orden_pdn
integer x = 37
integer y = 1820
integer width = 3511
integer height = 1152
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_mp_base tabpage_mp_base
tabpage_procesos tabpage_procesos
tabpage_actividades tabpage_actividades
tabpage_antideslizante tabpage_antideslizante
tabpage_bordado tabpage_bordado
tabpage_tareas tabpage_tareas
tabpage_repeticion tabpage_repeticion
end type

on tab_activ_oper.create
this.tabpage_mp_base=create tabpage_mp_base
this.tabpage_procesos=create tabpage_procesos
this.tabpage_actividades=create tabpage_actividades
this.tabpage_antideslizante=create tabpage_antideslizante
this.tabpage_bordado=create tabpage_bordado
this.tabpage_tareas=create tabpage_tareas
this.tabpage_repeticion=create tabpage_repeticion
this.Control[]={this.tabpage_mp_base,&
this.tabpage_procesos,&
this.tabpage_actividades,&
this.tabpage_antideslizante,&
this.tabpage_bordado,&
this.tabpage_tareas,&
this.tabpage_repeticion}
end on

on tab_activ_oper.destroy
destroy(this.tabpage_mp_base)
destroy(this.tabpage_procesos)
destroy(this.tabpage_actividades)
destroy(this.tabpage_antideslizante)
destroy(this.tabpage_bordado)
destroy(this.tabpage_tareas)
destroy(this.tabpage_repeticion)
end on

type tabpage_mp_base from userobject within tab_activ_oper
integer x = 18
integer y = 104
integer width = 3474
integer height = 1032
long backcolor = 80269524
string text = "M.P. Base (Ctrl+3)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_mp_base dw_mp_base
end type

on tabpage_mp_base.create
this.dw_mp_base=create dw_mp_base
this.Control[]={this.dw_mp_base}
end on

on tabpage_mp_base.destroy
destroy(this.dw_mp_base)
end on

type dw_mp_base from u_dw_application within tabpage_mp_base
integer x = 18
integer y = 24
integer width = 3035
integer height = 992
integer taborder = 20
string dataobject = "d_mu_mp_base_ord"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 24 de Noviembre de 2004.H:14:11
---------------------------------------------------
---------------------------------------------------*/
Long ll_dato,ll_resultado
n_cst_comun lo_comun
//---------------------------------------------------
If il_err_item_change<>0 Then
	Return 2
End If
//--------------------------------------------------------------------
If dwo.name="co_proveedor" Then
	ll_dato=Long(Data)
	ll_resultado=lo_comun.of_nombreproveedor(ll_dato,n_cst_application.itr_appl)
	If ll_resultado<>1 Then
		//MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo de proveedor no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		If Not ib_cambio_mp Or IsNull(GetItemString(row,"de_proveedor")) Then
			SetItem(row,"de_proveedor",'/*NUEVO*/')				
		End If
		ib_cambio_mp=True
		Return 0
	End If
	SetItem(row,"de_proveedor",Trim(lo_comun.of_getString(1)))
	ib_cambio_mp=False
	Return 0
End If
String ls_lote
long ll_producto,ll_proveedor

If dwo.name="mp_lote" Then
	ls_lote=data
	ll_producto=GetItemNumber(row,"co_producto")
	ll_proveedor=GetItemNumber(row,"co_proveedor")
	
//	If of_validarLote(ll_producto,ll_proveedor,ls_lote)<>1 Then
//		Return 2
//	End If
End If
//--------------------------------------------------------------------
String ls_coltype
ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	If Trim(Data)='' AND NOt IsNull(Data) Then
		MessageBox('Advertencia','Texto del campo no v$$HEX1$$e100$$ENDHEX$$lido.S$$HEX1$$f300$$ENDHEX$$lo hay espacios en blanco',StopSign!)
		Return 1
	End If
	If This.of_validarcadena(Data)<>1 Then 
		Return 1
	End If
End If
//---------------------------------------------------
If dwo.name='de_proveedor' Then
	If Not ib_cambio_mp /*OR IsNull(GetItemNumber(row,'co_proveedor'))*/ Then
		Return 2
	End If	
End If
ib_cambios=True
end event

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 24 de Septiembre de 2004.H:14:25
---------------------------------------------------
Adquiere color 
---------------------------------------------------*/
tabtextcolor=Rgb(0,0,255)
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 24 de Septiembre de 2004.H:14:25
---------------------------------------------------
Adquiere color 
---------------------------------------------------*/
tabtextcolor=Rgb(0,0,0)
end event

event sqlpreview;call super::sqlpreview;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 4 de Octubre de 2004.H:17:23
---------------------------------------------------
---------------------------------------------------*/
//MessageBox('SQLPreview.MPBASE','SQLSYNTAX: ~n'+sqlsyntax+'~n#Fila: '+&
//				String(row))
end event

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 24 de Septiembre de 2004.H:09:56
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lo_param
//---------------------------------------------------
//--------------------------------------------------------------------
If Row<=0  OR il_estado_orden<>1/*No es registrada*/Then Return
//--------------------------------------------------------------------
If dwo.name="co_proveedor" then
	Open(w_bus_m_proveedores_mp_ord)
	lo_param=Message.PowerObjectParm
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
		AcceptText()
		SetColumn('de_proveedor')
	End If		
End If
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 25 de Noviembre de 2004.H:10:06
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
end event

event itemerror;call super::itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 13 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Long ll_null
String ls_coltype
//-------------------------------------------------
ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	Return 1
End If

If dwo.name='co_proveedor' Then
	If Long(Data)=0 Then
		SetNull(ll_null)
		SetNull(ls_coltype)
		This.SetItem(row,String(dwo.name),ll_null)
		If Not ib_cambio_mp Then
				This.SetItem(row,'de_proveedor',"")
				This.SetItem(row,'de_proveedor',ls_coltype)		
		End If
		ib_cambio_mp=True
		ib_cambios=True
		Return 3
	End If	
End If
end event

event rowfocuschanged;call super::rowfocuschanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 15 de Diciembre de 2004.H:17:06
---------------------------------------------------
---------------------------------------------------*/
Long ll_cod
n_cst_comun_orden lo_comun
//-------------------------------------------------
If currentrow<=0 Then Return
//-------------------------------------------------
//This.Modify("de_proveedor.Protect='0'")
ll_cod=GetItemNumber(currentrow,'co_proveedor')
If Not IsNull(ll_cod) Then	
	ll_cod=lo_comun.of_nombreproveedor(ll_cod,n_cst_application.itr_appl)
	If ll_cod<>1 Then	
		ib_cambio_mp=True		
	Else 
		ib_cambio_mp=False
	End If
Else
	ib_cambio_mp=True	
End If
end event

event ue_deleterow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 15 de Diciembre de 2004.H:17:06
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
end event

event editchanged;call super::editchanged;If dwo.name='de_proveedor' Then
	If Not ib_cambio_mp /*OR IsNull(GetItemNumber(row,'co_proveedor'))*/Then
		SetColumn('co_proveedor')
	End If	
End If
end event

type tabpage_procesos from userobject within tab_activ_oper
integer x = 18
integer y = 104
integer width = 3474
integer height = 1032
long backcolor = 80269524
string text = "Operaciones (Ctrl+4):"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_tareas_en_operac dw_tareas_en_operac
cb_orden_proc cb_orden_proc
dw_operacion_muestra dw_operacion_muestra
end type

on tabpage_procesos.create
this.dw_tareas_en_operac=create dw_tareas_en_operac
this.cb_orden_proc=create cb_orden_proc
this.dw_operacion_muestra=create dw_operacion_muestra
this.Control[]={this.dw_tareas_en_operac,&
this.cb_orden_proc,&
this.dw_operacion_muestra}
end on

on tabpage_procesos.destroy
destroy(this.dw_tareas_en_operac)
destroy(this.cb_orden_proc)
destroy(this.dw_operacion_muestra)
end on

type dw_tareas_en_operac from u_dw_application within tabpage_procesos
integer x = 1486
integer y = 152
integer width = 1970
integer height = 864
integer taborder = 80
string dataobject = "d_gantt_ingreso"
boolean hscrollbar = true
boolean border = true
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event getfocus;//
end event

type cb_orden_proc from u_cb_base within tabpage_procesos
boolean visible = false
integer x = 2066
integer y = 24
integer width = 366
integer height = 96
integer taborder = 30
string text = "Orden"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 8 de Octubre de 2004.H:15:27
---------------------------------------------------
---------------------------------------------------*/
of_orden_proc(dw_operacion_muestra,"orden_operacion")

end event

type dw_operacion_muestra from u_dw_application within tabpage_procesos
integer x = 18
integer y = 24
integer width = 1445
integer height = 992
integer taborder = 20
string dataobject = "d_operacion_muestra"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 24 de Septiembre de 2004.H:14:25
---------------------------------------------------
Adquiere color 
---------------------------------------------------*/
tabtextcolor=Rgb(0,0,255)
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 24 de Septiembre de 2004.H:14:25
---------------------------------------------------
Adquiere color 
---------------------------------------------------*/
tabtextcolor=Rgb(0,0,0)
end event

event sqlpreview;call super::sqlpreview;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 4 de Octubre de 2004.H:17:23
---------------------------------------------------
---------------------------------------------------*/
//MessageBox('SQLPreview.operaciones','SQLSYNTAX: ~n'+sqlsyntax+'~n#Fila: '+&
//				String(row))
end event

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 24 de Noviembre de 2004.H:14:24
---------------------------------------------------
---------------------------------------------------*/
//--------------------------------------------------------------------
If Row<=0 Then Return
//--------------------------------------------------------------------

If of_puedeModificar()<>1 Then
	MessageBox("Advertencia!","No se puede modificar las tareas de la orden en este estado.",StopSign!)
	Return 
End If

If of_estimacion(Row,"co_operacion")=1 Then
	ib_cambios=True
End If
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 25 de Noviembre de 2004.H:10:06
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
end event

event ue_deleterow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 25 de Noviembre de 2004.H:10:06
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 1 de Diciembre de 2004.H:09:03
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
Return 2
end event

type tabpage_actividades from userobject within tab_activ_oper
integer x = 18
integer y = 104
integer width = 3474
integer height = 1032
long backcolor = 80269524
string text = "Actividades (Ctrl+5):"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_tareas_en_activ dw_tareas_en_activ
cb_orden_act cb_orden_act
dw_actividad_muestra dw_actividad_muestra
end type

on tabpage_actividades.create
this.dw_tareas_en_activ=create dw_tareas_en_activ
this.cb_orden_act=create cb_orden_act
this.dw_actividad_muestra=create dw_actividad_muestra
this.Control[]={this.dw_tareas_en_activ,&
this.cb_orden_act,&
this.dw_actividad_muestra}
end on

on tabpage_actividades.destroy
destroy(this.dw_tareas_en_activ)
destroy(this.cb_orden_act)
destroy(this.dw_actividad_muestra)
end on

type dw_tareas_en_activ from u_dw_application within tabpage_actividades
integer x = 1477
integer y = 152
integer width = 1970
integer height = 864
integer taborder = 90
string dataobject = "d_gantt_ingreso"
boolean hscrollbar = true
boolean border = true
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event getfocus;//
end event

event itemerror;call super::itemerror;If dwo.name='posicion' Then
	If Long(Data)=0 Then
		Long ll_null
		SetNull(ll_null)		
		This.SetItem(row,String(dwo.name),ll_null)
		ib_cambios=True
		Return 3
	End If	
End If
end event

event sqlpreview;call super::sqlpreview;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 12 de Octubre de 2004.H:04:36
---------------------------------------------------
---------------------------------------------------*/
//MessageBox('SQLPreview.TAreas','SQLSYNTAX: ~n'+sqlsyntax+'~n#Fila: '+&
//				String(row))
end event

type cb_orden_act from u_cb_base within tabpage_actividades
boolean visible = false
integer x = 2030
integer y = 24
integer width = 366
integer height = 96
integer taborder = 30
string text = "Orden"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 8 de Octubre de 2004.H:15:27
---------------------------------------------------
---------------------------------------------------*/
of_orden_proc(dw_actividad_muestra,"posicion")

end event

type dw_actividad_muestra from u_dw_application within tabpage_actividades
integer x = 18
integer y = 24
integer width = 1431
integer height = 992
integer taborder = 20
string dataobject = "d_actividad_muestra"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 24 de Septiembre de 2004.H:14:25
---------------------------------------------------
Adquiere color 
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,255)

end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 24 de Septiembre de 2004.H:14:25
---------------------------------------------------
Adquiere color 
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,0)
end event

event sqlpreview;call super::sqlpreview;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 12 de Octubre de 2004.H:04:36
---------------------------------------------------
---------------------------------------------------*/
//MessageBox('SQLPreview.activi','SQLSYNTAX: ~n'+sqlsyntax+'~n#Fila: '+&
//				String(row))
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 25 de Noviembre de 2004.H:10:06
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
end event

event ue_deleterow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 25 de Noviembre de 2004.H:10:06
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 1 de Diciembre de 2004.H:09:03
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
Return 2
end event

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 24 de Noviembre de 2004.H:14:24
---------------------------------------------------
---------------------------------------------------*/
//--------------------------------------------------------------------
If Row<=0 Then Return
//--------------------------------------------------------------------

If of_puedeModificar()<>1 Then
	MessageBox("Advertencia!","No se puede modificar las tareas de la orden en este estado.",StopSign!)
	Return 
End If

If of_estimacion(Row,"id_actividad")=1 Then
	ib_cambios=True
End If
end event

type tabpage_antideslizante from userobject within tab_activ_oper
integer x = 18
integer y = 104
integer width = 3474
integer height = 1032
long backcolor = 80269524
string text = "Chablones/Antideslizantes (Ctrl+6)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_detalle_antideslizante dw_detalle_antideslizante
end type

on tabpage_antideslizante.create
this.dw_detalle_antideslizante=create dw_detalle_antideslizante
this.Control[]={this.dw_detalle_antideslizante}
end on

on tabpage_antideslizante.destroy
destroy(this.dw_detalle_antideslizante)
end on

type dw_detalle_antideslizante from u_dw_application within tabpage_antideslizante
integer x = 18
integer y = 24
integer width = 2194
integer height = 992
integer taborder = 20
string dataobject = "d_mu_dt_chablon"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 24 de Septiembre de 2004.H:14:25
---------------------------------------------------
Adquiere color 
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,255)

end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 24 de Septiembre de 2004.H:14:25
---------------------------------------------------
Adquiere color 
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,0)
end event

event sqlpreview;call super::sqlpreview;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 12 de Octubre de 2004.H:04:36
---------------------------------------------------
---------------------------------------------------*/
//MessageBox('SQLPreview.Chab/antides','SQLSYNTAX: ~n'+sqlsyntax+'~n#Fila: '+&
//				String(row))
end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 02 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Long ll_pos,ll_tinta,ll_resultado
String ls_activo
n_cst_comun_orden lo_comun
//-------------------------------------------------
If dwo.name="id_tinta" Then
	ll_pos=Find("cons_color="+String(GetItemNumber(row,'cons_color'))+&
					" AND id_tinta="+data,1,RowCount())
	If ll_pos>0 then
		MessageBox("Advertencia!","El c$$HEX1$$f300$$ENDHEX$$digo de tinta ya est$$HEX2$$e1002000$$ENDHEX$$seleccionado.",StopSign!)
		//Setitem(row,'de_grupo','')
		Return 2
	End If
	ll_tinta=Long(Data)
	ll_resultado=lo_comun.of_nombretinta(ll_tinta,n_cst_application.itr_appl)
	If ll_resultado<>1 Then
		MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo de la tinta no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	ls_activo=lo_comun.of_getString(2)
	If ls_activo='N' Then// Se verifica si la tinta no esta activa debe estar en la orden

			If ll_pos<=0 Then
					MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo de Bordado esta inactivo y no est$$HEX2$$e1002000$$ENDHEX$$incluido en la orden.",StopSign!)
					Return 2
			End If			
	End If
	SetItem(row,"de_tinta",Trim(lo_comun.of_getString(1)))
End If
//-------------------
ib_cambios=True
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 02 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
end event

event ue_deleterow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 02 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
end event

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 02 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
n_cst_param_orden lo_param
//-------------------------------------------------
//--------------------------------------------------------------------
If Row<=0 Then Return
//--------------------------------------------------------------------
If dwo.name="id_tinta" then

	OpenWithParm(w_bus_tinta,lo_param)
	lo_param=Message.PowerObjectParm
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
		AcceptText()
		SetColumn('de_tinta')
		//SetItem(row,'de_tinta',lo_param.is_vector[1])
	End If		
	//-------------------------------------------------
End If
end event

event itemerror;call super::itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 13 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Long ll_null, ll_pos
//-------------------------------------------------
If dwo.name='id_tinta' Then
	If Long(Data)=0 Then
		SetNull(ll_null)		
		This.SetItem(row,String(dwo.name),ll_null)
		SetItem(row,'de_tinta','')
		ib_cambios=True			
	End If	
	Return 3
End If
end event

type tabpage_bordado from userobject within tab_activ_oper
integer x = 18
integer y = 104
integer width = 3474
integer height = 1032
long backcolor = 80269524
string text = "Bordados (Ctrl+7)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_bordado dw_bordado
end type

on tabpage_bordado.create
this.dw_bordado=create dw_bordado
this.Control[]={this.dw_bordado}
end on

on tabpage_bordado.destroy
destroy(this.dw_bordado)
end on

type dw_bordado from u_dw_application within tabpage_bordado
integer x = 18
integer y = 24
integer width = 2267
integer height = 992
integer taborder = 20
string dataobject = "d_mu_dt_bordado"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 24 de Septiembre de 2004.H:14:25
---------------------------------------------------
Adquiere color 
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,255)

end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 24 de Septiembre de 2004.H:14:25
---------------------------------------------------
Adquiere color 
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,0)
end event

event sqlpreview;call super::sqlpreview;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 12 de Octubre de 2004.H:04:36
---------------------------------------------------
---------------------------------------------------*/
//MessageBox('SQLPreview.Bordad','SQLSYNTAX: ~n'+sqlsyntax+'~n#Fila: '+&
//				String(row))
end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 02 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Long ll_pos,ll_hilo,ll_resultado
String ls_activo
n_cst_comun_orden lo_comun
//-------------------------------------------------
If dwo.name="co_hilo" Then
	ll_pos=Find("cons_color="+String(GetItemNumber(row,'cons_color'))+&
					" AND co_hilo="+data,1,RowCount())
	ll_pos=Find("co_hilo="+data,1,RowCount())
	If ll_pos>0 then
		MessageBox("Advertencia!","El c$$HEX1$$f300$$ENDHEX$$digo del Hilo ya est$$HEX2$$e1002000$$ENDHEX$$seleccionado.",StopSign!)
		//Setitem(row,'de_grupo','')
		Return 2
	End If
	ll_hilo=Long(Data)
	ll_resultado=lo_comun.of_nombrehilo(ll_hilo,n_cst_application.itr_appl)
	If ll_resultado<>1 Then
		MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo del hilo no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_hilo",Trim(lo_comun.of_getString(1)))
End If
//-------------------
ib_cambios=True
end event

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 24 de Septiembre de 2004.H:09:56
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lo_param
//---------------------------------------------------
//--------------------------------------------------------------------
If Row<=0 Then Return
//--------------------------------------------------------------------
If dwo.name="co_hilo" then
	Open(w_bus_hilos) 
	lo_param=Message.PowerObjectParm
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
		AcceptText()
		SetColumn('de_hilo')
		//SetItem(row,'de_hilo',lo_param.is_vector[1])
	End If		
End If
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 02 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
end event

event ue_deleterow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 02 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
end event

event itemerror;call super::itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 13 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Long ll_null
//-------------------------------------------------
If dwo.name='co_hilo' Then
	If Long(Data)=0 Then
		SetNull(ll_null)		
		This.SetItem(row,String(dwo.name),ll_null)
		SetItem(row,'de_hilo','')
		ib_cambios=True		
	End If	
	Return 3
End If
end event

type tabpage_tareas from userobject within tab_activ_oper
integer x = 18
integer y = 104
integer width = 3474
integer height = 1032
long backcolor = 80269524
string text = "Tareas (Ctrl+8)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
cb_1 cb_1
st_1 st_1
sle_sort sle_sort
cb_orden_tareas cb_orden_tareas
st_2 st_2
dw_tareas dw_tareas
end type

on tabpage_tareas.create
this.cb_1=create cb_1
this.st_1=create st_1
this.sle_sort=create sle_sort
this.cb_orden_tareas=create cb_orden_tareas
this.st_2=create st_2
this.dw_tareas=create dw_tareas
this.Control[]={this.cb_1,&
this.st_1,&
this.sle_sort,&
this.cb_orden_tareas,&
this.st_2,&
this.dw_tareas}
end on

on tabpage_tareas.destroy
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.sle_sort)
destroy(this.cb_orden_tareas)
destroy(this.st_2)
destroy(this.dw_tareas)
end on

type cb_1 from commandbutton within tabpage_tareas
boolean visible = false
integer x = 1554
integer y = 28
integer width = 343
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "prueba"
end type

event clicked;dw_tareas.setsort(sle_sort.text)
dw_tareas.sort()
end event

type st_1 from statictext within tabpage_tareas
integer x = 485
integer y = 40
integer width = 247
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Texto:"
boolean focusrectangle = false
end type

type sle_sort from singlelineedit within tabpage_tareas
boolean visible = false
integer x = 869
integer y = 28
integer width = 613
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "f_mov_fin desc"
borderstyle borderstyle = stylelowered!
end type

type cb_orden_tareas from u_cb_base within tabpage_tareas
integer x = 18
integer y = 24
integer width = 384
integer height = 96
integer taborder = 40
string text = "Orden"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 21 de Diciembre de 2004.H:15:27
---------------------------------------------------
---------------------------------------------------*/
of_orden_proc(dw_tareas,"posicion")

end event

type st_2 from u_st_base within tabpage_tareas
integer x = 2432
integer y = 88
integer width = 1024
integer height = 64
integer weight = 700
string text = "Formato de fecha : AAAA/MM/DD HH:MM"
end type

type dw_tareas from u_dw_application within tabpage_tareas
integer x = 18
integer y = 152
integer width = 3438
integer height = 864
integer taborder = 70
string dataobject = "d_gantt_ingreso"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event sqlpreview;call super::sqlpreview;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 12 de Octubre de 2004.H:04:36
---------------------------------------------------
---------------------------------------------------*/
//MessageBox('SQLPreview.TAreas','SQLSYNTAX: ~n'+sqlsyntax+'~n#Fila: '+&
//				String(row))
end event

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 24 de Septiembre de 2004.H:14:25
---------------------------------------------------
Adquiere color 
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,255)
This.hscrollbar=False
This.hscrollbar=True
This.vscrollbar=False
This.vscrollbar=True


end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 24 de Septiembre de 2004.H:14:25
---------------------------------------------------
Adquiere color 
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,0)
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 25 de Noviembre de 2004.H:10:06
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
end event

event ue_deleterow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 25 de Noviembre de 2004.H:10:06
---------------------------------------------------
---------------------------------------------------*/
Long 		ll_pos,ll_dato,ll_row
String 	ls_exp
//---------------------------------------------------
If This.RowCount()<=0 Then
	Return
End If
//---------------------------------------------------
If dw_dt_mu_ord.GetItemNumber(1,'condicion') <> 1/*REGISTRADA*/ Then
	Return
End If
//---------------------------------------------------
ll_row=This.GetRow()
If ll_row<=0 Then Return
//---------------------------------------------------
ll_dato=This.GetItemNumber(ll_row,'nu_sol_serv')
ll_pos=This.GetItemNumber(ll_row,'posicion')
If Not IsNull(ll_dato) AND ll_dato>0 Then
		If MessageBox(	"Validaci$$HEX1$$f300$$ENDHEX$$n","Esta seguro(a) de eliminar la tarea de la posici$$HEX1$$f300$$ENDHEX$$n *"+String(ll_pos)+&
							" con su solicitud de servicio # "+String(ll_dato)+"?.",Question!,YesNo!,2) = 1 Then
			ls_exp='nu_sol_serv='+String(ll_dato)
			This.DeleteRow(ll_row)
		End If
Else
	ll_dato=GetItemNumber(GetRow(),'id_actividad')
	If Not IsNull(ll_dato) AND ll_dato>0 Then
		If MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Esta seguro(a) de eliminar la tarea de la posici$$HEX1$$f300$$ENDHEX$$n *"+String(ll_pos)+&
							" para la actividad # "+String(ll_dato)+"?.",Question!,YesNo!,2) = 1 Then										
			This.DeleteRow(ll_row)
		End If
	Else
			ll_dato=GetItemNumber(ll_row,'co_operacion')
			If Not IsNull(ll_dato) AND ll_dato>0 Then
				If MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Esta seguro(a) de eliminar la tarea de la posici$$HEX1$$f300$$ENDHEX$$n *"+String(ll_pos)+&
								" para la operaci$$HEX1$$f300$$ENDHEX$$n # "+String(ll_dato)+"?.",Question!,YesNo!,2) = 1 Then										
							This.DeleteRow(ll_row)
						End If
			End If		
	End If
End If
//---------------------------------------------------
This.SetFocus()
//---------------------------------------------------
ib_cambios = True


end event

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Lunes 15 de Agosto (Festivo) de 2005 HORA 11:21:27:515
// 
// 
//////////////////////////////////////////////////////////////////////////

n_cst_param_orden lo_param
Long ll_actividad,ll_ss,ll_i,ll_pos,ll_max,ll_clase_ss,ll_res,ll_consec
String ls_find,ls_var
Decimal{2} lde_kilos
n_cst_param_orden lou_param
n_cst_param lou_param2

u_dw_application ldw_gantt

//---------------------------------------------------
ldw_gantt=tab_activ_oper.tabpage_tareas.dw_tareas

//--------------------------------------------------------------------
If Row<=0 Then 
	Return
End If

of_sel_fila(dw_tareas,il_fila_tarea,row)


If il_estado_orden<>1/*No es registrada*/ Then 
	Return
End If

//--------------------------------------------------------------------
If dwo.name<>'id_actividad' and dwo.name<>'nu_sol_serv' Then
	Return
End If
	
	
ll_actividad=GetItemNumber(row,'id_actividad')
If IsNull(ll_actividad) OR ll_actividad<=0 Then
	MessageBox("Advertencia!","Debe seleccionar una actividad.",StopSign!)
	Return
End If
ll_ss=GetItemNumber(row,'nu_sol_serv') 
If IsNull(ll_ss) OR  ll_ss<=0 Then
	MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','Esta actividad no tiene generada solicitud de servicio',Information!)
	Return
End If			
ll_consec=GetItemNumber(row,'consec') 
ls_find='consec='+String(ll_consec)			

//////////////////////////////////////////////////////////////////////////
// Se verifica si la actividad requiere informaci$$HEX1$$f300$$ENDHEX$$n adicional
// 
//////////////////////////////////////////////////////////////////////////
ll_res=io_soli_serv.of_cargar_info_tarea("id_actiidad" ,ll_actividad, il_tipo_prod )

If ll_res<>1 Then
	Return
End If

ll_clase_ss=io_soli_serv.of_get_co_clase_ss()

If io_soli_serv.of_requiere_info_adicional(ll_clase_ss /*long al_clase_ss */)<>1 Then
	MessageBox("Advertencia!","La solicitud no requiere informaci$$HEX1$$f300$$ENDHEX$$n adicional.")
	Return
End If

If io_soli_serv.of_es_tenido_hilaza(ll_clase_ss /*long al_clase_solicitud */) = 1 Then
	dw_tmp_mu_soli_hilaza.Reset()
	ll_pos=dw_mu_soli_hilaza.Find(ls_find,1,ldw_gantt.RowCount())
	
	If ll_pos<=0 Then
		dw_tmp_mu_soli_hilaza.InsertRow(0)
		dw_tmp_mu_soli_hilaza.SetItem(1,'id_actividad',ll_actividad)
		dw_tmp_mu_soli_hilaza.SetItem(1,'de_actividad',io_soli_serv.of_get_descripcion_tarea() )											
		dw_tmp_mu_soli_hilaza.SetItem(1,'consec',ll_consec)
	Else
		dw_mu_soli_hilaza.RowsCopy(ll_pos,ll_pos,primary!,dw_tmp_mu_soli_hilaza,&
		                           1,primary!)
	End If
	
   lo_param.idw_vector[1]=dw_tmp_mu_soli_hilaza
	
	OpenWithParm(w_mu_soli_hilaza,lo_param)
	
	If IsValid(Message.PowerObjectParm) Then //Obj. retorno OK
		lo_param=Message.PowerObjectParm
//////////////////////////////////////////////////////////////////////////
// Si ya existe el dato se borra y se le copia la nueva informacion
// 
//////////////////////////////////////////////////////////////////////////
		
		If ll_pos>0 Then
			dw_mu_soli_hilaza.DeleteRow(ll_pos)
		End If
			

		dw_tmp_mu_soli_hilaza.RowsCopy(1,1,Primary!,&
		dw_mu_soli_hilaza,50,primary! )
	End If
End If


If io_soli_serv.of_es_tinta_antideslizante(ll_clase_ss /*long al_clase_solicitud */) = 1 Then
	dw_tmp_mu_soli_tinta.Reset()
	ll_pos=dw_mu_soli_tinta.Find(ls_find,1,ldw_gantt.RowCount())
	
	If ll_pos<=0 Then
		dw_tmp_mu_soli_tinta.InsertRow(0)
		dw_tmp_mu_soli_tinta.SetItem(1,'id_actividad',ll_actividad)
		dw_tmp_mu_soli_tinta.SetItem(1,'de_actividad',io_soli_serv.of_get_descripcion_tarea() )											
		dw_tmp_mu_soli_tinta.SetItem(1,'consec',ll_consec)
	Else
		dw_mu_soli_tinta.RowsCopy(ll_pos,ll_pos,primary!,dw_tmp_mu_soli_tinta,&
		                           1,primary!)
	End If
	
   lo_param.idw_vector[1]=dw_tmp_mu_soli_tinta
	
	OpenWithParm(w_mu_soli_tinta,lo_param)
	
	If IsValid(Message.PowerObjectParm) Then //Obj. retorno OK
		lo_param=Message.PowerObjectParm
//////////////////////////////////////////////////////////////////////////
// Si ya existe el dato se borra y se le copia la nueva informacion
// 
//////////////////////////////////////////////////////////////////////////
		
		If ll_pos>0 Then
			dw_mu_soli_tinta.DeleteRow(ll_pos)
		End If
			

		dw_tmp_mu_soli_tinta.RowsCopy(1,1,Primary!,&
		dw_mu_soli_tinta,50,primary! )
	End If
End If




end event

event itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Lunes 25 de Abril de 2005 HORA 16:34:57:843
// 
// Controla la modificaci$$HEX1$$f300$$ENDHEX$$n de la posicion
//////////////////////////////////////////////////////////////////////////


If dwo.name="posicion" or dwo.name="minutos" Then
	If of_puedeModificar()<>1 Then 
		MessageBox("Advertencia!","No se puede modificar pares a tejer, la orden no est$$HEX2$$e1002000$$ENDHEX$$en estado registrada.",StopSign!)
		Return 2
	End If
End If













///*-------------------------------------------------
//	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
//	Date		: Jueves 02 de Diciembre de 2004.H:11:40
//---------------------------------------------------
//---------------------------------------------------*/
//Long ll_dato, ll_resultado
//n_cst_comun_orden lo_comun
////-------------------------------------------------
//If dwo.name="co_grupo" Then
//	ll_dato=Long(Data)
//	ll_resultado=lo_comun.of_nombregrupoact(ll_dato,n_cst_application.itr_appl)
//	If ll_resultado<>1 Then
//		MessageBox("Advertencia!","Grupo de la tarea no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
//		Return 2
//	End If
//	SetItem(row,"de_grupo",lo_comun.of_getString(1))
//	SetItem(row,"cola_grupo",lo_comun.of_getLong(1))	
//End If
////--------------------------------------------------------------
//If dwo.name="co_maq_tin" Then
//	ll_dato=Long(Data)
//	ll_resultado=lo_comun.of_nombremaqtin(ll_dato,n_cst_application.itr_appl)
//	If ll_resultado<>1 Then
//		MessageBox("Advertencia!","Grupo de la m$$HEX1$$e100$$ENDHEX$$quina para la tarea no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
//		Return 2
//	End If
//	SetItem(row,"de_maq_tin",lo_comun.of_getString(1))
//	SetItem(row,"cola_tin",lo_comun.of_getLong(1))	
//End If
////--------------------------------------------------------------
//ib_cambios = True
end event

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 06 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
//------------------------------------------------
//--------------------------------------------------------------------
If Row<=0 Then Return
//--------------------------------------------------------------------
of_sel_fila(dw_tareas,il_fila_tarea,row)
end event

event itemerror;call super::itemerror;If dwo.name='posicion' Then
	If Long(Data)=0 Then
		Long ll_null
		SetNull(ll_null)		
		This.SetItem(row,String(dwo.name),ll_null)
		ib_cambios=True
		Return 3
	End If	
End If
end event

event rowfocuschanged;call super::rowfocuschanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 02 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
If currentrow<=0 Then Return
//--------------------------------------------
of_sel_fila(dw_tareas,il_fila_tarea,currentrow)
//--------------------------------------------

end event

type tabpage_repeticion from userobject within tab_activ_oper
integer x = 18
integer y = 104
integer width = 3474
integer height = 1032
long backcolor = 80269524
string text = "Repeticiones"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_repeticiones dw_repeticiones
end type

on tabpage_repeticion.create
this.dw_repeticiones=create dw_repeticiones
this.Control[]={this.dw_repeticiones}
end on

on tabpage_repeticion.destroy
destroy(this.dw_repeticiones)
end on

type dw_repeticiones from u_dw_base within tabpage_repeticion
integer x = 23
integer y = 16
integer width = 3387
integer height = 960
integer taborder = 20
string dataobject = "d_gr_repeticiones_ordenes_x_nu_orden"
end type

type gb_orden_pdn from u_gb_base within w_orden_pdn
integer x = 37
integer y = 32
integer width = 3511
integer height = 776
integer taborder = 0
string text = "Orden de Producci$$HEX1$$f300$$ENDHEX$$n (Ctrl+1)"
end type

type dw_total_pares from u_dw_application within w_orden_pdn
integer x = 73
integer y = 1628
integer width = 987
integer height = 160
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_pares_total"
boolean vscrollbar = false
boolean livescroll = false
end type

event itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 8 de Octubre de 2004.H:18:01
---------------------------------------------------
---------------------------------------------------*/
Long ll_a
String ls_col
u_dw_application ldw_v
//---------------------------------------------------
If dwo.name = 'total_ptejer' OR dwo.name = 'total_pdespachar' Then
	If Long(Data)<=0 Then //Validaci$$HEX1$$f300$$ENDHEX$$n
		MessageBox('Advertencia','La cantidad a distribuir debe ser mayor a cero',StopSign!)
		Return 2
	End If
	ldw_v=dw_dt_mu_ord_col
	If ldw_v.Find("check=1",1,ldw_v.RowCount())>0 Then
		If of_distrib_col(Long(Data),dwo.name) <> 1 Then
			If dwo.name = 'total_pdespachar' Then
				This.SetText(String(This.GetItemNumber(1,'total_pdespachar')))
			End If
			Return 2
		End If
	Else
		MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','No hay colores seleccionados para distribuir la cantidad digitada',Information!)
		Return 2
	End If
End If
//---------------
ib_cambios=True
end event

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 8 de Septiembre de 2004.H:09:20
---------------------------------------------------
---------------------------------------------------*/
gb_orden_pdn.of_color(True)
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 8 de Septiembre de 2004.H:12:35
---------------------------------------------------
---------------------------------------------------*/
gb_orden_pdn.of_color(False)
end event

type cb_programar from u_cb_base within w_orden_pdn
boolean visible = false
integer x = 2958
integer y = 204
integer width = 581
integer height = 96
integer taborder = 30
boolean bringtotop = true
integer weight = 700
boolean enabled = false
string text = "Programar Orden"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 1 de Octubre de 2004.H:17:54
---------------------------------------------------
---------------------------------------------------*/
Long ll_estado
If dw_dt_mu_ord.RowCount()>0 Then
	ll_estado = dw_dt_mu_ord.GetItemNumber(1,'condicion')
	If ll_estado = 1 Then
		dw_dt_mu_ord.SetItem(1,'condicion',2)
		cb_programar.Text = 'Desprogramar Orden'
	Else
		dw_dt_mu_ord.SetItem(1,'condicion',1)
		cb_programar.Text = 'Programar Orden'
	End If 
End If
ib_cambios=True
end event

