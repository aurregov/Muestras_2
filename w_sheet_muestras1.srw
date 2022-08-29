HA$PBExportHeader$w_sheet_muestras1.srw
$PBExportComments$Propuesta de dise$$HEX1$$f100$$ENDHEX$$o para los datos b$$HEX1$$e100$$ENDHEX$$sicos
forward
global type w_sheet_muestras1 from w_sheet
end type
type st_2 from statictext within w_sheet_muestras1
end type
type cb_cargar_ficha_tejido from commandbutton within w_sheet_muestras1
end type
type dw_tmp_dt_fmp_muestras from datawindow within w_sheet_muestras1
end type
type dw_pares_tejer from u_dw_application within w_sheet_muestras1
end type
type dw_actividades from u_dw_application within w_sheet_muestras1
end type
type dw_colores1 from u_dw_application within w_sheet_muestras1
end type
type dw_combinacion from u_dw_application within w_sheet_muestras1
end type
type dw_dt_muestras_col from u_dw_application within w_sheet_muestras1
end type
type dw_muestra from u_dw_application within w_sheet_muestras1
end type
type gb_muestra from u_gb_base within w_sheet_muestras1
end type
type dw_dt_muestras from u_dw_application within w_sheet_muestras1
end type
type tab_medidas from tab within w_sheet_muestras1
end type
type tabpage_1 from userobject within tab_medidas
end type
type cb_3 from commandbutton within tabpage_1
end type
type dw_medidas1 from u_dw_application within tabpage_1
end type
type tabpage_1 from userobject within tab_medidas
cb_3 cb_3
dw_medidas1 dw_medidas1
end type
type tabpage_2 from userobject within tab_medidas
end type
type cb_4 from commandbutton within tabpage_2
end type
type cb_2 from commandbutton within tabpage_2
end type
type dw_med_rep from u_dw_application within tabpage_2
end type
type tabpage_2 from userobject within tab_medidas
cb_4 cb_4
cb_2 cb_2
dw_med_rep dw_med_rep
end type
type tabpage_3 from userobject within tab_medidas
end type
type dw_referencias from u_dw_application within tabpage_3
end type
type tabpage_3 from userobject within tab_medidas
dw_referencias dw_referencias
end type
type tabpage_operaciones from userobject within tab_medidas
end type
type cb_1 from commandbutton within tabpage_operaciones
end type
type cb_7 from commandbutton within tabpage_operaciones
end type
type dw_operaciones_mue from u_dw_application within tabpage_operaciones
end type
type tabpage_operaciones from userobject within tab_medidas
cb_1 cb_1
cb_7 cb_7
dw_operaciones_mue dw_operaciones_mue
end type
type tabpage_actividades from userobject within tab_medidas
end type
type cb_3dot_act from commandbutton within tabpage_actividades
end type
type cb_orden_act from commandbutton within tabpage_actividades
end type
type dw_actividad_muestra from u_dw_application within tabpage_actividades
end type
type tabpage_actividades from userobject within tab_medidas
cb_3dot_act cb_3dot_act
cb_orden_act cb_orden_act
dw_actividad_muestra dw_actividad_muestra
end type
type tabpage_mp_base from userobject within tab_medidas
end type
type dw_mp_base from u_dw_application within tabpage_mp_base
end type
type tabpage_mp_base from userobject within tab_medidas
dw_mp_base dw_mp_base
end type
type tabpage_diseno from userobject within tab_medidas
end type
type dw_mu_dt_largo from u_dw_application within tabpage_diseno
end type
type dw_mu_dt_puno from u_dw_application within tabpage_diseno
end type
type dw_mu_dt_diseno from u_dw_application within tabpage_diseno
end type
type gb_diseno from u_gb_base within tabpage_diseno
end type
type gb_puno from u_gb_base within tabpage_diseno
end type
type gb_largo from u_gb_base within tabpage_diseno
end type
type tabpage_diseno from userobject within tab_medidas
dw_mu_dt_largo dw_mu_dt_largo
dw_mu_dt_puno dw_mu_dt_puno
dw_mu_dt_diseno dw_mu_dt_diseno
gb_diseno gb_diseno
gb_puno gb_puno
gb_largo gb_largo
end type
type tab_medidas from tab within w_sheet_muestras1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_operaciones tabpage_operaciones
tabpage_actividades tabpage_actividades
tabpage_mp_base tabpage_mp_base
tabpage_diseno tabpage_diseno
end type
type gb_colores from u_gb_base within w_sheet_muestras1
end type
type dw_mat_prima from u_dw_application within w_sheet_muestras1
end type
type dw_h_fmp_muestras from u_dw_application within w_sheet_muestras1
end type
type gb_matprima from u_gb_base within w_sheet_muestras1
end type
type dw_observacion from u_dw_application within w_sheet_muestras1
end type
type gb_1 from groupbox within w_sheet_muestras1
end type
type gb_procesos from u_gb_base within w_sheet_muestras1
end type
type st_1 from statictext within w_sheet_muestras1
end type
type dw_operaciones from u_dw_application within w_sheet_muestras1
end type
end forward

global type w_sheet_muestras1 from w_sheet
integer x = 0
integer y = 0
integer width = 7104
integer height = 7476
string title = "Muestras"
string menuname = "m_muestra1"
boolean maxbox = true
boolean vscrollbar = true
boolean resizable = true
windowstate windowstate = maximized!
event ue_ficha_tecnica ( )
event ue_refrescarcodigos ( )
event ue_borrar_muestra ( )
event ue_cambiar_estado_color ( )
event ue_cambiar_estado_todos ( )
event ue_copiar_medidas ( )
event ue_copiar_procesos ( )
event ue_copiar_matprima ( )
event ue_copia_basico ( )
event ue_copia_observacion ( )
event type integer ue_teorica ( )
event ue_invocar_orden ( )
event ue_cambio_cod_color ( )
event ue_copiar_actividades ( )
st_2 st_2
cb_cargar_ficha_tejido cb_cargar_ficha_tejido
dw_tmp_dt_fmp_muestras dw_tmp_dt_fmp_muestras
dw_pares_tejer dw_pares_tejer
dw_actividades dw_actividades
dw_colores1 dw_colores1
dw_combinacion dw_combinacion
dw_dt_muestras_col dw_dt_muestras_col
dw_muestra dw_muestra
gb_muestra gb_muestra
dw_dt_muestras dw_dt_muestras
tab_medidas tab_medidas
gb_colores gb_colores
dw_mat_prima dw_mat_prima
dw_h_fmp_muestras dw_h_fmp_muestras
gb_matprima gb_matprima
dw_observacion dw_observacion
gb_1 gb_1
gb_procesos gb_procesos
st_1 st_1
dw_operaciones dw_operaciones
end type
global w_sheet_muestras1 w_sheet_muestras1

type prototypes
// Declare this as your Local External Function
FUNCTION ulong GetTempPathA (long nBufferLength, &
   ref string lpBuffer  ) LIBRARY "KERNEL32.DLL" alias for "GetTempPathA;Ansi"


end prototypes

type variables
	datawindowchild idc_fabrica,idc_linea,idc_grupos_vta, &
                idc_sgrupo_vta,idc_tipo_tejido,idc_tallas_por_grupo, &
					 idc_ref_exp,idc_talla_exp,idc_colores_exp,&
					 idc_partebas,idc_col_ad,idc_col_ad_1,&
					 idc_partebas11, idwc_grupoprod, idwc_tipoprod, idwc_diseno
					 

					 
long il_co_cliente, il_co_sucursal, &
     il_fila_sel,il_talla,il_recurso_cambio,&
	  il_fila_col,il_color,&
     il_fabrica,il_linea,il_muestra,il_tipo_prod, il_grupo_talla
	  
long il_tipo_recurso // 2 recuso tejido - 1 recursos de muestras
	  
boolean ib_cambios=false, ib_guardar_ok=false, ib_cambia_recurso=false, ib_cambios_med=false, ib_new=TRUE, &
		  ib_cierra = FALSE, ib_grabado = FALSE, ib_cambios_medReposadas=False


String is_co_ref_exp,is_co_talla_exp,is_co_color_exp,&
       is_tipo_solicitud, is_nu_orden, is_de_referencia, is_estado, is_correo

long il_col_ad_usado=0,il_muestra_control

String is_where_busqueda

String is_desarrollador

Date id_fecha_solicitud

long il_recurso

long il_opcion, il_fila_color,il_fila_opcion

long il_PARTEMP_GEN, il_COMBINA_GEN  

Decimal ide_FACTOR_MUESTRA_A_PDN, ide_produc

n_ds_application ids_validar_prod_proveedor

n_cst_recurso_cotizado	inv_RecCotizado 		//SA52045 - Ceiba/jjmonsal - 30-11-2015: Se adiciona Entidad para controlar informacion de los recursos cotizados
n_cst_log_reccotizado	inv_log_reccotizado	//SA52045 - Ceiba/jjmonsal - 30-11-2015: Se adiciona Entidad para la tabla que tendra la informacion de los cambios realizados a los recursos cotizados
end variables

forward prototypes
public function integer of_datos_dt_solicitud (long a_fabrica, long a_solicitud, string a_ref_exp)
public function integer of_haydatos (datawindow a_dw)
public function integer of_insertardiseno ()
public function integer of_datos_solicitud (long a_fabrica, long a_solicitud)
public function integer of_colorestodos ()
public function integer of_desc_muestra ()
public function integer of_retrieve_tipo_prod ()
public function integer of_cargar_dddw (long a_fabrica)
public function integer of_nombrerecurso ()
public function integer of_filtro_medida ()
public function integer of_datos_cliente (string as_tpped, long an_cliente, long an_sucursal)
public function integer of_redraw (boolean a_redrawing)
public function integer of_partebase ()
public function integer of_verpulgadas ()
public function integer of_reset ()
public function string of_nombrecombinacion (long a_combi, long a_talla)
public function integer of_nombre_parte_combinacion ()
public function integer of_nombrerestrictivo ()
public function integer of_scroll (long a_pos)
public function integer of_filtro_talla (long a_talla, string a_talla_exp, long a_fila)
public function integer of_filtro_color (long a_color, long a_fila)
public function integer of_filtro_opcion (long a_opcion, long a_fila)
public function integer of_buscar (long a_fabrica, long a_linea, long a_muestra)
public function integer of_grabar ()
public function integer of_validar ()
public function integer of_consecutivo ()
public function string of_espacios (string a_cad, integer a_tam)
public function integer of_error_muestra ()
public function integer of_distrib_cant_colores (long al_nueva_cantidad, string as_nom_colum_pares)
public function integer of_co_color_especial (long al_row)
public function integer of_verificaroperacionorden (long a_operacion)
public function integer of_verificaractividadorden (long a_actividad)
public function integer of_verificar_ref_pdn (long a_fabrica, long a_linea, long a_referencia, long a_talla)
public function integer of_verificarproductomp (string a_columna, long a_fila, string a_dato)
public function integer of_validar_mat_prima ()
public function integer of_validar_matprima (transaction a_transaction, long an_producto, long an_color, long an_fabrica)
public function integer of_modificar_peso_mp (long al_base_peso, long al_base_peso_ant)
public function integer of_validar_estadotipotejido (transaction a_transaction, long an_co_ttejido)
public function integer of_verificar_borrado ()
public subroutine of_mail_cambio ()
public function long of_abrirventanaseleccionrecursosacopiar ()
public subroutine of_inicializarreccotizados ()
public function boolean of_validargenerarinformacionrep ()
public subroutine of_setinforeccotizado ()
public function string of_leerconstantestring (readonly string as_nombrevar)
public function integer of_cargarinforeportereccotizado (readonly dwitemstatus al_statusrecursocierra, readonly dwitemstatus al_statusrecursonocierra)
public subroutine of_setinforeccotizadocierra (long al_reccotcierra)
public subroutine of_setinforeccotizadonocierra (long al_reccotnocierra)
public function integer of_cargarinforepreccotizadocierra (readonly string as_entrada, readonly long al_talla, readonly long al_ref)
public function integer of_cargarinforepreccotizadonocierra (readonly string as_entrada, readonly long al_talla, readonly long al_ref)
public subroutine wf_eliminardatosasociadosestadocolormues (long al_talla, long al_color)
public subroutine wf_recorrerdatoseliminados_est_color_mue ()
public subroutine wf_cargavalorcampoenpdn ()
public subroutine wf_pintarcheckcampoenpdn (readonly long al_fila)
public subroutine wf_mostrarcampoenpdn (readonly boolean ab_bool)
public subroutine wf_validarmostrarcargarcampoenpdn ()
public function integer of_cargar_ficha_tejido ()
public function integer of_borrar_ficha_tejido (long an_muestra)
public function integer of_nombre_tela (long al_tela, ref string as_de_tela, boolean ab_validar)
public function integer of_cambia_recurso_ficha_medida_mp ()
end prototypes

event ue_ficha_tecnica();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 12 de Noviembre de 2002 HORA 10:31:26:734
// 
// Para el manejo de la ficha tecnica de muestras
//////////////////////////////////////////////////////////////////////////

If dw_muestra.RowCount()=0 Then Return 

n_cst_param lo_param

lo_param.il_vector[1]=il_fabrica
lo_param.il_vector[2]=il_linea
lo_param.il_vector[3]=il_muestra
lo_param.il_vector[4]=il_talla
//lo_param.il_vector[5]=il_diseno
//lo_param.il_vector[6]=il_recurso

If il_talla=-1 Then
	MessageBox("Advertencia!","No se pudo determinar la talla.",StopSign!)
	Return
End If

w_inf_muestra_medidas w1

OpenSheetWithParm(w1,lo_param,This.ParentWindow(),2,Original!)

end event

event ue_refrescarcodigos();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 27 de Noviembre de 2002 HORA 09:36:17:578
// 
// Para refrescar las listas desplegables
//////////////////////////////////////////////////////////////////////////

idc_partebas.Retrieve(il_tipo_prod)

end event

event ue_borrar_muestra();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 25 de Agosto de 2003 HORA 12:30:38:153
// 
// Se elimina la muestra
//-------------------------------------------------
//	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
//	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 10 de Noviembre de 2004.H:16:31
//---------------------------------------------------
// Se agrega la eliminaci$$HEX1$$f300$$ENDHEX$$n de las actividades y mp base
//////////////////////////////////////////////////////////////////////////
long ll_Res,ll_count
n_ds_application lds_muestra
//**********************************************************************************************************
If NOT (il_fabrica>0 AND il_linea>0 AND il_muestra>0) Then Return
//**********************************************************************************************************
lds_muestra = CREATE n_ds_application
lds_muestra.of_load('d_ver_integ_muestra')
lds_muestra.of_conexion(n_cst_application.itr_appl,True)
ll_res=lds_muestra.Retrieve(il_fabrica,il_linea,il_muestra)
Choose Case ll_res
Case Is < 0
		MessageBox('Advertencia','Error en la consulta de la existencia de registros de $$HEX1$$f300$$ENDHEX$$rdenes dependientes de la muestra '+String(il_fabrica)+'/'+String(il_linea)+'/'+String(il_muestra),StopSign!)
		Return
	Case 0
		MessageBox('Advertencia','No se devolvi$$HEX2$$f3002000$$ENDHEX$$informaci$$HEX1$$f300$$ENDHEX$$n con la consulta de la existencia de registros de $$HEX1$$f300$$ENDHEX$$rdenes dependientes de la muestra '+String(il_fabrica)+'/'+String(il_linea)+'/'+String(il_muestra),StopSign!)
		Return
End Choose
ll_count=lds_muestra.GetItemNumber(1,'nro_muestra')
If ll_count>0 Then
		MessageBox('Advertencia','La muestra '+String(il_fabrica)+'/'+String(il_linea)+'/'+String(il_muestra)+' posee '+String(ll_count)+' orden(es) registrada(s). No se puede eliminar',StopSign!)
		Return
End If
//**********************************************************************************************************
ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea eliminar esta muestra y toda su informaci$$HEX1$$f300$$ENDHEX$$n relacionada ?",Question!,YesNo!,2)

If ll_res<>1 Then
	Return 
End If
//**********************************************************************************************************
  DELETE FROM m_disenos_muestras  
   WHERE ( m_disenos_muestras.co_fabrica = :il_fabrica ) AND  
         ( m_disenos_muestras.co_linea = :il_linea ) AND  
         ( m_disenos_muestras.co_muestra = :il_muestra )   
           using  n_cst_application.itr_appl;
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If

  DELETE FROM dt_medidas_est  
   WHERE ( dt_medidas_est.co_fabrica = :il_fabrica ) AND  
         ( dt_medidas_est.co_linea = :il_linea ) AND  
         ( dt_medidas_est.co_muestra = :il_muestra )   
           using  n_cst_application.itr_appl;
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If

  DELETE FROM dt_med_mue  
   WHERE ( dt_med_mue.co_fabrica = :il_fabrica ) AND  
         ( dt_med_mue.co_linea = :il_linea ) AND  
         ( dt_med_mue.co_muestra = :il_muestra )   
           using  n_cst_application.itr_appl;
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If

  DELETE FROM dt_med_mue_rep  
   WHERE ( dt_med_mue_rep.co_fabrica = :il_fabrica ) AND  
         ( dt_med_mue_rep.co_linea = :il_linea ) AND  
         ( dt_med_mue_rep.co_muestra = :il_muestra )   
           using  n_cst_application.itr_appl;
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If


  DELETE FROM m_proref_muestras  
   WHERE ( m_proref_muestras.co_fabrica = :il_fabrica ) AND  
         ( m_proref_muestras.co_linea = :il_linea ) AND  
         ( m_proref_muestras.co_muestra = :il_muestra )   
           using  n_cst_application.itr_appl;
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If
//************************************************************
DELETE FROM mu_mues_activ  
   WHERE ( mu_mues_activ.co_fabrica = :il_fabrica ) AND  
         ( mu_mues_activ.co_linea = :il_linea ) AND  
         ( mu_mues_activ.co_muestra = :il_muestra )   
           using  n_cst_application.itr_appl;
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If

DELETE FROM mu_mp_base
   WHERE ( mu_mp_base.co_fabrica = :il_fabrica ) AND  
         ( mu_mp_base.co_linea = :il_linea ) AND  
         ( mu_mp_base.co_muestra = :il_muestra )   
           using  n_cst_application.itr_appl;
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If
//************************************************************
  DELETE FROM dt_fmp_mue1  
   WHERE ( dt_fmp_mue1.co_fabrica = :il_fabrica ) AND  
         ( dt_fmp_mue1.co_linea = :il_linea ) AND  
         ( dt_fmp_mue1.co_muestra = :il_muestra )   
           using  n_cst_application.itr_appl;
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If


  DELETE FROM dt_fmp_muestras  
   WHERE ( dt_fmp_muestras.co_fabrica = :il_fabrica ) AND  
         ( dt_fmp_muestras.co_linea = :il_linea ) AND  
         ( dt_fmp_muestras.co_muestra = :il_muestra )   
           using  n_cst_application.itr_appl;
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If



  DELETE FROM h_fmp_muestras  
   WHERE ( h_fmp_muestras.co_fabrica = :il_fabrica) AND  
         ( h_fmp_muestras.co_linea = :il_linea ) AND  
         ( h_fmp_muestras.co_muestra = :il_muestra)   
           using  n_cst_application.itr_appl;
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If


  DELETE FROM dt_est_col_mues  
   WHERE ( dt_est_col_mues.co_fabrica = :il_fabrica ) AND  
         ( dt_est_col_mues.co_linea = :il_linea ) AND  
         ( dt_est_col_mues.co_muestra = :il_muestra )   
           using  n_cst_application.itr_appl;
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If


  DELETE FROM dt_muestras_col  
   WHERE ( dt_muestras_col.co_fabrica = :il_fabrica ) AND  
         ( dt_muestras_col.co_linea = :il_linea ) AND  
         ( dt_muestras_col.co_muestra = :il_muestra )   
           using  n_cst_application.itr_appl;
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If



  DELETE FROM dt_muestras  
   WHERE ( dt_muestras.co_fabrica = :il_fabrica ) AND  
         ( dt_muestras.co_linea = :il_linea ) AND  
         ( dt_muestras.co_muestra = :il_muestra )   
           using  n_cst_application.itr_appl;
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If


dw_muestra.DeleteRow(0)

If dw_muestra.update()<>1 Then
	RollBack using n_cst_application.itr_appl ;
	Return
End If

dw_dt_muestras.Reset()
tab_medidas.tabpage_1.dw_medidas1.Reset()
tab_medidas.tabpage_2.dw_med_rep.Reset()
dw_dt_muestras_col.Reset()
//************************************************************
tab_medidas.tabpage_operaciones.dw_operaciones_mue.Reset()
tab_medidas.tabpage_actividades.dw_actividad_muestra.Reset()
tab_medidas.tabpage_mp_base.dw_mp_base.Reset()
//************************************************************
dw_mat_prima.Reset()
dw_h_fmp_muestras.Reset()

Commit using n_cst_application.itr_appl ;

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Muestra eliminada exitosamente.")
of_settitle('Muestras')





end event

event ue_cambiar_estado_color();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 13 de Septiembre de 2003 HORA 14:26:09:218
// 
// Cuando se cambia el estado de un color de una muestra
//////////////////////////////////////////////////////////////////////////
long ll_res

If ib_cambios Then
	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
	If ll_res=2 Then
		Return
	End If
End If

n_cst_param lo_param

lo_param.il_vector[1]=il_fabrica
lo_param.il_vector[2]=il_linea
lo_param.il_vector[3]=il_muestra
lo_param.il_vector[4]=il_talla
lo_param.il_vector[5]=il_color

lo_param.is_vector[1]=dw_muestra.getItemString(1,"de_muestra")


OpenWithParm(w_cambio_estado_color,lo_param)

lo_param=message.PowerObjectParm

//////////////////////////////////////////////////////////////////////////
// El retorno es el estado en que queda el color, el ultimo que se coloca, 
// o si dan cancelar retorna nada
//////////////////////////////////////////////////////////////////////////

If Not IsValid(lo_param) Then
	Return 
End If

dw_dt_muestras_col.&
SetItem(il_fila_col,"co_estado",lo_param.il_vector[1])






end event

event ue_cambiar_estado_todos();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 09 de Febrero de 2005 HORA 17:21:49:515
// 
// 
//////////////////////////////////////////////////////////////////////////


long ll_res

If ib_cambios Then
	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
	If ll_res=2 Then
		Return
	End If
End If

n_cst_param lo_param

lo_param.il_vector[1]=il_fabrica
lo_param.il_vector[2]=il_linea
lo_param.il_vector[3]=il_muestra
//lo_param.il_vector[4]=il_talla
//lo_param.il_vector[5]=il_color
If dw_muestra.RowCount()>0 Then
	lo_param.is_vector[1]=dw_muestra.getItemString(1,"de_muestra")
Else
	lo_param.is_vector[1]=""
End If


OpenWithParm(w_cambio_estado_color_gen,lo_param)

lo_param=message.PowerObjectParm

//////////////////////////////////////////////////////////////////////////
// El retorno es el estado en que queda el color, el ultimo que se coloca, 
// o si dan cancelar retorna nada
//////////////////////////////////////////////////////////////////////////

If Not IsValid(lo_param) Then
	Return 
End If

//////////////////////////////////////////////////////////////////////////
// Disparo el evento de recuperar
// 
//////////////////////////////////////////////////////////////////////////
of_buscar(il_fabrica,il_linea,il_muestra)





end event

event ue_copiar_medidas();n_cst_param lou_param
long ll_recurso

If tab_medidas.tabpage_1.dw_medidas1.RowCount()>0 Then
	MessageBox("Advertencia!","La referencia tiene medidas, solo es posible hacer copia a referencias sin medidas.",StopSign!)
	Return
End If

If tab_medidas.tabpage_2.dw_med_rep.RowCount()>0 Then
	MessageBox("Advertencia!","La referencia tiene medidas reposadas, solo es posible hacer copia a referencias sin medidas.",StopSign!)
	Return
End If

If il_talla=-1 Then
	MessageBox("Advertencia!","Debe especificar talla y recurso para las medidas.",StopSign!)
	Return
End If

String ls_filtro 

ls_filtro = " m_muestras.co_fabrica="+String(il_fabrica)+" and m_muestras.co_linea="+String(il_linea)+" and m_muestras.co_muestra="+String(il_muestra)+" and dt_med_mue.co_diseno = 1 )"
											

OpenWithParm(w_opc_nue_recurso1,ls_filtro )

lou_param = Message.PowerObjectParm

If Not IsValid(lou_param) Then
	Return 
End If

long ll_fabrica,ll_linea,ll_muestra,ll_tipoprod,ll_talla,ll_diseno,ll_grp_talla
	
//is_where_copia=lou_param.is_vector[1]
	
ll_fabrica=lou_param.il_vector[1]
ll_linea=lou_param.il_vector[2]
ll_muestra=lou_param.il_vector[3]
ll_talla=lou_param.il_vector[4]
ll_tipoprod=lou_param.il_vector[5]
ll_diseno=lou_param.il_vector[6]
ll_grp_talla=lou_param.il_vector[7]

SELECT co_recurso 
INTO :ll_recurso
FROM dt_muestras
WHERE co_fabrica = :ll_fabrica AND
co_linea = :ll_linea AND
co_muestra = :ll_muestra AND
co_talla = :ll_talla
USING n_cst_application.itr_appl;

If isnull(ll_recurso) Then
	MessageBox("Advertencia!","El recurso de la muestra no es valido.",StopSign!)
	Return
End If


If ll_talla<>ll_talla Then
	MessageBox("Advertencia!","No se pueden copiar medidas de una muestra con diferente talla.",StopSign!)
	Return
End If
	
n_ds_application lds_1

lds_1=create n_ds_application

lds_1.DataObject= tab_medidas.tabpage_1.dw_medidas1.DataObject  //"d_dt_med_mue_rec"

lds_1.SetTransObject(n_cst_application.itr_appl)

//co_partebas
DataWindowChild ldc_1

lds_1.getChild("co_partebas",ldc_1)

n_cst_comun lo_comun

lo_comun.of_loaddddw(ldc_1,-1,n_cst_application.itr_appl)

long i,ll_tot

ll_tot=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_diseno,ll_recurso)
//ll_tot=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_diseno,ll_recurso)

If ll_tot<=0 Then
	MessageBox("Advertencia!","No se han parametrizado las medidas para el recurso que seleccion$$HEX1$$f300$$ENDHEX$$.",StopSign!)
	Return
End If

lds_1.RowsCopy(1,ll_tot,Primary!,tab_medidas.tabpage_1.dw_medidas1,1,Primary!)

For i=1 to ll_tot
	tab_medidas.tabpage_1.dw_medidas1.setItem(i,"co_fabrica",il_fabrica)
	tab_medidas.tabpage_1.dw_medidas1.setItem(i,"co_linea",il_linea)
	tab_medidas.tabpage_1.dw_medidas1.setItem(i,"co_muestra",il_muestra)
	tab_medidas.tabpage_1.dw_medidas1.setItem(i,"co_talla",il_talla)
	tab_medidas.tabpage_1.dw_medidas1.setItem(i,"co_diseno",1)
Next

//////////////////////////////////////////////////////////////////////////
// Se copian tambien las medidas reposadas
// 
//////////////////////////////////////////////////////////////////////////

lds_1.DataObject=tab_medidas.tabpage_2.dw_med_rep.DataObject

lds_1.SetTransObject(n_cst_application.itr_appl)

ll_tot=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_recurso,ll_diseno )

If ll_tot<=0 Then	
	MessageBox("Advertencia!","No se han parametrizado las medidas reposadas.",StopSign!)
	Return
End If


lds_1.RowsCopy(1,ll_tot,Primary!,tab_medidas.tabpage_2.dw_med_rep ,1,Primary!)

For i=1 to ll_tot
	tab_medidas.tabpage_2.dw_med_rep.setItem(i,"co_fabrica",il_fabrica)
	tab_medidas.tabpage_2.dw_med_rep.setItem(i,"co_linea",il_linea)
	tab_medidas.tabpage_2.dw_med_rep.setItem(i,"co_muestra",il_muestra)
	
	tab_medidas.tabpage_2.dw_med_rep.setItem(i,"co_talla",il_talla)	
	tab_medidas.tabpage_2.dw_med_rep.setItem(i,"co_diseno",1)	
Next

of_verPulgadas()



end event

event ue_copiar_procesos();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 18 de Noviembre de 2003 HORA 08:26:46:151
// 
// 
//////////////////////////////////////////////////////////////////////////
n_cst_param         lo_param
n_ds_application    lds_1
long                ll_fabrica, ll_linea, ll_muestra, ll_talla
long 					  ll_tot,i

If tab_medidas.tabpage_operaciones.dw_operaciones_mue.RowCount()>0 Then
	MessageBox("Advertencia!","No se puede hacer la copia porque la muestra tiene operaciones.",StopSign!)
	Return
End If

OpenWithParm(w_opc_mues,"")

lo_param=Message.PowerObjectParm


If Not IsValid(lo_param) Then
	Return
End If

ll_fabrica=lo_param.il_vector[1]
ll_linea=lo_param.il_vector[2]
ll_muestra=lo_param.il_vector[3]
ll_talla=lo_param.il_vector[4]

lds_1=create n_ds_application

lds_1.DataObject="d_operaciones_basica"

lds_1.SetTransObject(n_cst_application.itr_appl)



ll_tot=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra)

If ll_tot<0 Then
	MessageBox("Advertencia!","Error recuperando datos.",StopSign!)
	Return
End If

lds_1.RowsCopy(1,ll_tot,Primary!,tab_medidas.tabpage_operaciones.dw_operaciones_mue,1,Primary!)

For i=1 To ll_tot
	tab_medidas.tabpage_operaciones.dw_operaciones_mue.SetItem(i,"co_fabrica",il_fabrica)
	tab_medidas.tabpage_operaciones.dw_operaciones_mue.SetItem(i,"co_linea",il_linea)
	tab_medidas.tabpage_operaciones.dw_operaciones_mue.SetItem(i,"co_muestra",il_muestra)
	tab_medidas.tabpage_operaciones.dw_operaciones_mue.SetItem(i,"co_talla",il_talla)	
Next
//ll_tot=tab_medidas.tabpage_procesos.dw_procesos.RowCount()


end event

event ue_copiar_matprima();//////////////////////////////////////////////////////////////////////////
// Para hacer copia de la materia prima
// 
//////////////////////////////////////////////////////////////////////////


n_cst_param lo_param
long ll_tot,i


If il_opcion=-1 Then
	MessageBox("Advertencia!","Debe especificar la opci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
	Return
End If

If dw_mat_prima.RowCount()>0 Then
	MessageBox("Advertencia!","La muestra tiene materia prima, solo es posible hacer copia a muestras sin materia prima.",StopSign!)
	Return
End If

OpenWithParm(w_opc_mat_prima_muestra_c_basica,"")

lo_param=Message.PowerObjectParm

If Not IsValid(lo_param) Then
	Return 
End If


SetPointer(HourGlass!)

long ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_color,&
     ll_tipoprod,ll_cons,ll_opcion

  
ll_fabrica    =  lo_param.il_vector[1]
ll_linea      =  lo_param.il_vector[2]
ll_muestra    =  lo_param.il_vector[3]
ll_talla      =  lo_param.il_vector[4]
ll_color      =  lo_param.il_vector[5]
ll_opcion     =  lo_param.il_vector[6]

//////////////////////////////////////////////////////////////////////////
// Se verifican las combinaciones, haber si es posible hacer la copia
// 
//////////////////////////////////////////////////////////////////////////
n_ds_application lds_1

lds_1=create n_ds_application

lds_1.DataObject=dw_combinacion.DataObject

lds_1.SetTransObject(n_cst_application.itr_appl)

ll_tot=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra)


If dw_combinacion.RowCount()>0 Then
	MessageBox("Advertencia!","Ya existen combinaciones, por lo tanto no se copiar$$HEX1$$e100$$ENDHEX$$n.",StopSign!)
Else
	For i=1 To ll_tot
		dw_combinacion.InsertRow(0)
		dw_combinacion.SetItem(i,"co_talla",il_talla)	
	
		dw_combinacion.SetItem(i,"co_combinacion",&
		lds_1.GetItemNumber(i,"co_combinacion"))	
		
		dw_combinacion.SetItem(i,"de_combinacion",&
		lds_1.GetItemString(i,"de_combinacion"))	
		
	Next
End If

lds_1.DataObject="d_dt_fmp_mue1_col_opc"

lds_1.SetTransObject(n_cst_application.itr_appl)


ll_tot=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_color,ll_opcion)

If ll_tot<0 Then
	MessageBox("Advertencia!","Error recuperando datos.",StopSign!)
	Return
End If
long ll
ll = lds_1.RowsCopy(1,ll_tot,Primary!,dw_mat_prima,1,Primary!)

For i=1 To ll_tot
	dw_mat_prima.SetItem(i,"co_fabrica",il_fabrica)
	dw_mat_prima.SetItem(i,"co_linea",il_linea)
	dw_mat_prima.SetItem(i,"co_muestra",il_muestra)
	dw_mat_prima.SetItem(i,"co_talla",il_talla)	
	dw_mat_prima.SetItem(i,"co_color",il_color)
	dw_mat_prima.SetItem(i,"cnt_opcion",il_opcion)	
	dw_mat_prima.SetItem(i,"co_diseno",il_opcion)	
//////////////////////////////////////////////////////////////////////////
// Se actualiza el consecutivo
// 
//////////////////////////////////////////////////////////////////////////
	
	dw_mat_prima.SetItem(i,"consec",i)
Next


of_nombre_parte_combinacion()

end event

event ue_copia_basico();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 23 de Diciembre de 2003 HORA 08:45:06:470
// 
// Para hacer copia de la informaci$$HEX1$$f300$$ENDHEX$$n b$$HEX1$$e100$$ENDHEX$$sica de una muestra a otra
//-------------------------------------------------
//	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
//	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 10 de Noviembre de 2004.H:17:47
//---------------------------------------------------
//Modificaci$$HEX1$$f300$$ENDHEX$$n:Copia de los datos de las actividades & mpbase
//////////////////////////////////////////////////////////////////////////
n_cst_param lou_param

If dw_muestra.RowCount()=0 Then Return
If dw_dt_muestras.RowCount()=0 Then Return

If il_grupo_talla=-1 Then
	MessageBox("Advertencia!","Debe especificar el grupo de talla.",StopSign!)
	Return
End If

If il_muestra<>0 And il_muestra<>-1 Then
	MessageBox("Advertencia!","No se puede copiar a una muesta existente.",StopSign!)
	Return
End If

If il_talla=-1 Then
	MessageBox("Advertencia!","Debe especifiar la talla.",StopSign!)
	Return
End If

OpenWithParm(w_opc_muestra,is_where_busqueda)

lou_param = Message.PowerObjectParm

If Not IsValid(lou_param) Then
	Return 
End If

Long ll_fabrica,ll_linea,ll_muestra, ll_recurso

ll_fabrica =lou_param.il_vector[1]
ll_linea   =lou_param.il_vector[2]
ll_muestra =lou_param.il_vector[3]

IF Not isnull(ll_fabrica) AND Not isnull(ll_linea) AND Not isnull(ll_muestra) THEN
	SELECT FIRST 1 co_recurso 
	INTO :ll_recurso
	FROM dt_muestras
	WHERE co_fabrica = :ll_fabrica
	AND co_linea = :ll_linea 
	AND co_muestra = :ll_muestra
	using  n_cst_application.itr_appl;
	 
END IF	

IF isnull(ll_recurso) OR ll_recurso = 0 THEN
	Messagebox("Advertencia","El recurso de la muestra origen no es valido, por lo tanto no se pueden copiar las medidas")
END IF	

of_Redraw(False)

n_ds_application lds_1

lds_1=create n_ds_application

lds_1.DataObject=dw_muestra.DataObject+"_cp"

lds_1.SetTransObject(n_cst_application.itr_appl)

long ll_tot,i

ll_tot=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra)

If ll_tot<=0 Then
	MessageBox("Advertencia!","Error copiando datos de la muestra.",StopSign!)
	Return
End If

dw_muestra.SetItem(1,"de_muestra",lds_1.GetItemString(1,"de_muestra"))
dw_muestra.SetItem(1,"co_cliente",lds_1.GetItemNumber(1,"co_cliente"))
dw_muestra.SetItem(1,"co_sucursal",lds_1.GetItemNumber(1,"co_sucursal"))

dw_muestra.SetItem(1,"co_ref_exp",lds_1.GetItemString(1,"co_ref_exp"))
dw_muestra.SetItem(1,"de_coleccion",lds_1.GetItemString(1,"de_coleccion"))

dw_muestra.SetItem(1,"co_tipoprod",lds_1.GetItemNumber(1,"co_tipoprod"))
dw_muestra.SetItem(1,"co_tipo_tejido",lds_1.GetItemNumber(1,"co_tipo_tejido"))

//se comenta por peticion del usuario
//dw_muestra.SetItem(1,"bpl_co_tipoprod",lds_1.GetItemString(1,"bpl_co_tipoprod"))
dw_muestra.SetItem(1,"bpl_co_tipoprod",'')

dw_muestra.SetItem(1,"id_tipo_med",lds_1.GetItemNumber(1,"id_tipo_med"))
dw_muestra.SetItem(1,"id_tipo_graf",lds_1.GetItemNumber(1,"id_tipo_graf"))

dw_muestra.SetItem(1,"desarrollador",lds_1.GetItemString(1,"desarrollador"))

dw_muestra.SetItem(1,"co_ejecutiva",lds_1.GetItemNumber(1,"co_ejecutiva"))

dw_muestra.SetItem(1,"de_observacion",lds_1.GetItemString(1,"de_observacion"))

//////////////////////////////////////////////////////////////////////////
// ojo ajustar lo de observaciones...
// 
//////////////////////////////////////////////////////////////////////////

String ls_tmp,ls_observacion

ls_observacion=lds_1.GetItemString(1,"de_observacion")

dw_observacion.Reset()
For i=1 to 12
	ls_tmp=Trim(mid(ls_observacion,60 * (i -1)+1,60))
	dw_observacion.InsertRow(0)
	dw_observacion.SetItem(i,1,ls_tmp)
Next


//////////////////////////////////////////////////////////////////////////
// Se copia como la platilla para las medidas, pero no las medidas
// basicas
//////////////////////////////////////////////////////////////////////////

//tab_medidas.tabpage_1.dw_medidas1.SetFilter("") //coment 20090203
//tab_medidas.tabpage_1.dw_medidas1.Filter() //coment 20090203
tab_medidas.tabpage_1.dw_medidas1.Reset()


lds_1.DataObject=tab_medidas.tabpage_1.dw_medidas1.DataObject+"_cp"

lds_1.SetTransObject(n_cst_application.itr_appl)

ll_tot=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra,1,ll_recurso )

For i=1 To ll_tot
	tab_medidas.tabpage_1.dw_medidas1.InsertRow(0)
	
	tab_medidas.tabpage_1.dw_medidas1.SetItem(i,"co_talla",il_talla)
	
	tab_medidas.tabpage_1.dw_medidas1.SetItem(i,"co_diseno",1)
	
	tab_medidas.tabpage_1.dw_medidas1.SetItem(i,"co_tipoprod",il_tipo_Prod)
	
	tab_medidas.tabpage_1.dw_medidas1.SetItem(i,"co_partebas",&
	lds_1.GetItemNumber(i,"co_partebas"))
	
Next
	
//////////////////////////////////////////////////////////////////////////
// Medidas reposadas
// 
//////////////////////////////////////////////////////////////////////////

//tab_medidas.tabpage_2.dw_med_rep.SetFilter("")
//tab_medidas.tabpage_2.dw_med_rep.Filter()
tab_medidas.tabpage_2.dw_med_rep.Reset()

lds_1.DataObject=tab_medidas.tabpage_2.dw_med_rep.DataObject

lds_1.SetTransObject(n_cst_application.itr_appl)

ll_tot=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_recurso,1)

For i=1 To ll_tot
	tab_medidas.tabpage_2.dw_med_rep.InsertRow(0)
	
	tab_medidas.tabpage_2.dw_med_rep.SetItem(i,"co_talla",il_talla)
	
	tab_medidas.tabpage_2.dw_med_rep.SetItem(i,"co_diseno",1)
	
	tab_medidas.tabpage_2.dw_med_rep.SetItem(i,"co_tipoprod",il_tipo_Prod)	
	
	tab_medidas.tabpage_2.dw_med_rep.SetItem(i,"id_med_rep",&
	lds_1.GetItemString(i,"id_med_rep"))	
Next
//////////////////////////////////////////////////////////////////////////
// Aca se debe mostrar una ventana con los colores a copiar
// 
//////////////////////////////////////////////////////////////////////////

dw_dt_muestras_col.SetFilter("")
dw_dt_muestras_col.Filter()
dw_dt_muestras_col.Reset()

lds_1.DataObject=dw_dt_muestras_col.DataObject+"_cp"

lds_1.SetTransObject(n_cst_application.itr_appl)

ll_tot=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra,1)

dw_colores1.Reset()
For i=1 To ll_tot
	dw_colores1.InsertRow(0)
	dw_colores1.SetItem(i,"co_color",lds_1.GetItemNumber(i,"co_color"))
Next

OpenWithParm(w_sel_color_copia,dw_colores1)

long ll_pos,ll_f,ll_color
ll_pos=0

For i=1 To ll_tot
	
	ll_color=lds_1.GetItemNumber(i,"co_color")
	
	ll_pos=dw_colores1.Find("co_color="+String(ll_color)+" and chk=1",&
	1,dw_colores1.RowCount())
	
	If ll_pos>0 Then
		ll_f=dw_dt_muestras_col.InsertRow(0)
	
		dw_dt_muestras_col.SetItem(ll_f,"co_talla",il_talla)
	
		dw_dt_muestras_col.SetItem(ll_f,"co_color_exp",&
		lds_1.GetItemString(i,"co_color_exp"))	

		dw_dt_muestras_col.SetItem(ll_f,"co_color",&
		ll_color)	
	
	End If	
Next

//////////////////////////////////////////////////////////////////////////
// Se copian los procesos
// 
//////////////////////////////////////////////////////////////////////////
//<********************************************************************************
tab_medidas.tabpage_operaciones.dw_operaciones_mue.SetFilter("")
tab_medidas.tabpage_operaciones.dw_operaciones_mue.Filter()
tab_medidas.tabpage_operaciones.dw_operaciones_mue.Reset()

lds_1.DataObject=tab_medidas.tabpage_operaciones.dw_operaciones_mue.DataObject

lds_1.SetTransObject(n_cst_application.itr_appl)

ll_tot=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra)

For i=1 To ll_tot
	tab_medidas.tabpage_operaciones.dw_operaciones_mue.InsertRow(0)
	
	tab_medidas.tabpage_operaciones.dw_operaciones_mue.SetItem(i,"co_talla",il_talla)
	
	tab_medidas.tabpage_operaciones.dw_operaciones_mue.SetItem(i,"co_tipoprod",il_tipo_Prod)
	
	tab_medidas.tabpage_operaciones.dw_operaciones_mue.SetItem(i,"orden_operacion",&
	lds_1.GetItemNumber(i,"orden_operacion"))	

	tab_medidas.tabpage_operaciones.dw_operaciones_mue.SetItem(i,"co_operacion",&
	lds_1.GetItemNumber(i,"co_operacion"))	
	
	tab_medidas.tabpage_operaciones.dw_operaciones_mue.SetItem(i,"de_operacion",&
	lds_1.GetItemString(i,"de_operacion"))	
	
Next
//*** Copia de las actividades
tab_medidas.tabpage_actividades.dw_actividad_muestra.SetFilter("")
tab_medidas.tabpage_actividades.dw_actividad_muestra.Filter()
tab_medidas.tabpage_actividades.dw_actividad_muestra.Reset()

lds_1.DataObject=tab_medidas.tabpage_actividades.dw_actividad_muestra.DataObject

lds_1.SetTransObject(n_cst_application.itr_appl)

ll_tot=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra)

For i=1 To ll_tot
	tab_medidas.tabpage_actividades.dw_actividad_muestra.InsertRow(0)
	
	tab_medidas.tabpage_actividades.dw_actividad_muestra.SetItem(i,"id_actividad",&
	lds_1.GetItemNumber(i,"id_actividad"))
	
	tab_medidas.tabpage_actividades.dw_actividad_muestra.SetItem(i,"posicion",&
	lds_1.GetItemNumber(i,"posicion"))
	
	tab_medidas.tabpage_actividades.dw_actividad_muestra.SetItem(i,"de_actividad",&
	lds_1.GetItemString(i,"de_actividad"))	
	
Next
//Copia de la mat.prima base
tab_medidas.tabpage_mp_base.dw_mp_base.SetFilter("")
tab_medidas.tabpage_mp_base.dw_mp_base.Filter()
tab_medidas.tabpage_mp_base.dw_mp_base.Reset()

lds_1.DataObject=tab_medidas.tabpage_mp_base.dw_mp_base.DataObject

lds_1.SetTransObject(n_cst_application.itr_appl)

ll_tot=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra)

For i=1 To ll_tot
	tab_medidas.tabpage_mp_base.dw_mp_base.InsertRow(0)
	
	tab_medidas.tabpage_mp_base.dw_mp_base.SetItem(i,"consec",&
	lds_1.GetItemNumber(i,"consec"))
	
	tab_medidas.tabpage_mp_base.dw_mp_base.SetItem(i,"co_fabrica_mp",&
	lds_1.GetItemNumber(i,"co_fabrica_mp"))
	
	tab_medidas.tabpage_mp_base.dw_mp_base.SetItem(i,"co_producto",&
	lds_1.GetItemNumber(i,"co_producto"))
	
	tab_medidas.tabpage_mp_base.dw_mp_base.SetItem(i,"de_producto",&
	lds_1.GetItemString(i,"de_producto"))	
	
	tab_medidas.tabpage_mp_base.dw_mp_base.SetItem(i,"posicion",&
	lds_1.GetItemNumber(i,"posicion"))
	
Next

//*** Copia largo
tab_medidas.tabpage_diseno.dw_mu_dt_largo.SetFilter("")
tab_medidas.tabpage_diseno.dw_mu_dt_largo.Filter()
tab_medidas.tabpage_diseno.dw_mu_dt_largo.Reset()

lds_1.DataObject=tab_medidas.tabpage_diseno.dw_mu_dt_largo.DataObject

lds_1.SetTransObject(n_cst_application.itr_appl)

ll_tot=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra)

//valida que tenga datos el campo largo cuand co_tipoprod <> 20 CRYSTAL ROPA
If dw_muestra.getitemNumber(1,"co_tipoprod") <> 20 Then
	If ll_tot<=0 Then
		MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n!","La muestra " + String(ll_muestra) + ' no tiene clase de largo. No se puede copiar de esta muestra.')
		Return
	End If
End if

For i=1 To ll_tot
	tab_medidas.tabpage_diseno.dw_mu_dt_largo.InsertRow(0)
	
	tab_medidas.tabpage_diseno.dw_mu_dt_largo.SetItem(i,"co_largo",&
	lds_1.GetItemNumber(i,"co_largo"))
	
Next
//********************************************************************************>
//////////////////////////////////////////////////////////////////////////
// Se copian las combinaciones, si existen!
// 
//////////////////////////////////////////////////////////////////////////
dw_combinacion.SetFilter("")
dw_combinacion.Filter()
dw_combinacion.Reset()

lds_1.DataObject=dw_combinacion.DataObject

lds_1.SetTransObject(n_cst_application.itr_appl)

ll_tot=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra)

For i=1 To ll_tot
	dw_combinacion.InsertRow(0)
	dw_combinacion.SetItem(i,"co_talla",il_talla)	

	dw_combinacion.SetItem(i,"co_combinacion",&
	lds_1.GetItemNumber(i,"co_combinacion"))	
	
	dw_combinacion.SetItem(i,"de_combinacion",&
	lds_1.GetItemString(i,"de_combinacion"))	
	
Next

//////////////////////////////////////////////////////////////////////////
// Opciones de mp por color
// 
//////////////////////////////////////////////////////////////////////////

dw_h_fmp_muestras.SetFilter("")
dw_h_fmp_muestras.Filter()
dw_h_fmp_muestras.Reset()

lds_1.DataObject='d_h_fmp_muestras_pruebacopiado'

lds_1.SetTransObject(n_cst_application.itr_appl)

ll_tot=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra, 1)

//lds_1.DataObject=dw_h_fmp_muestras.DataObject
//
//lds_1.SetTransObject(n_cst_application.itr_appl)

//ll_tot=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra)

For i=1 To ll_tot
	ll_color=lds_1.GetItemNumber(i,"co_color")
	
	ll_pos=dw_colores1.Find("co_color="+String(ll_color)+" and chk=1",1,dw_colores1.RowCount())
	
	If ll_pos>0 Then
		
		ll_f=dw_h_fmp_muestras.InsertRow(0)
		dw_h_fmp_muestras.SetItem(ll_f,"co_talla",il_talla)	
	
		dw_h_fmp_muestras.SetItem(ll_f,"co_color",ll_color)	
		
		dw_h_fmp_muestras.SetItem(ll_f,"cnt_opcion",lds_1.GetItemNumber(i,"cnt_opcion"))
		dw_h_fmp_muestras.SetItem(ll_f,"co_diseno",lds_1.GetItemNumber(i,"cnt_opcion"))
		
		dw_h_fmp_muestras.SetItem(ll_f,"de_cnt_opcion",lds_1.GetItemString(i,"de_cnt_opcion"))
	End If	
Next

//////////////////////////////////////////////////////////////////////////
// Copio el detalle de la materia prima
// 
//////////////////////////////////////////////////////////////////////////

dw_mat_prima.SetFilter("")
dw_mat_prima.Filter()
dw_mat_prima.Reset()

lds_1.DataObject=dw_mat_prima.DataObject

lds_1.SetTransObject(n_cst_application.itr_appl)

ll_tot=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra)

For i=1 To ll_tot
	ll_color=lds_1.GetItemNumber(i,"co_color")
	
	ll_pos=dw_colores1.Find("co_color="+String(ll_color)+" and chk=1",&
	1,dw_colores1.RowCount())
	
	If ll_pos>0 Then
		
		ll_f=dw_mat_prima.InsertRow(0)
		dw_mat_prima.SetItem(ll_f,"co_talla",il_talla)	
	
		dw_mat_prima.SetItem(ll_f,"co_color",&
		lds_1.GetItemNumber(i,"co_color"))	
		
		dw_mat_prima.SetItem(ll_f,"cnt_opcion",lds_1.GetItemNumber(i,"cnt_opcion"))
		dw_mat_prima.SetItem(ll_f,"co_diseno",lds_1.GetItemNumber(i,"cnt_opcion"))
		
		dw_mat_prima.SetItem(ll_f,"co_tipoprod",&
		lds_1.GetItemNumber(i,"co_tipoprod"))
	
		dw_mat_prima.SetItem(ll_f,"co_partemp",&
		lds_1.GetItemNumber(i,"co_partemp"))
		
		dw_mat_prima.SetItem(ll_f,"co_combinacion",&
		lds_1.GetItemNumber(i,"co_combinacion"))
		
		dw_mat_prima.SetItem(ll_f,"co_producto_mp",&
		lds_1.GetItemNumber(i,"co_producto_mp"))
		
		dw_mat_prima.SetItem(ll_f,"de_producto",&
		lds_1.GetItemString(i,"de_producto"))
	
		dw_mat_prima.SetItem(ll_f,"co_color_mp",&
		lds_1.GetItemNumber(i,"co_color_mp"))
		
		dw_mat_prima.SetItem(ll_f,"de_color",&
		lds_1.GetItemString(i,"de_color"))
		
		dw_mat_prima.SetItem(ll_f,"consec",&
		lds_1.GetItemNumber(i,"consec"))
		
		dw_mat_prima.SetItem(ll_f,"nu_conos",&
		lds_1.GetItemNumber(i,"nu_conos"))
		
		dw_mat_prima.SetItem(ll_f,"alimentador",&
		lds_1.GetItemString(i,"alimentador"))
		
		dw_mat_prima.SetItem(ll_f,"portahilo",&
		lds_1.GetItemString(i,"portahilo"))
		
	   dw_mat_prima.SetItem(ll_f,"enhebrado",&
		lds_1.GetItemString(i,"enhebrado"))
		
		dw_mat_prima.SetItem(ll_f,"posicion",&
		lds_1.GetItemString(i,"posicion"))
				
	   dw_mat_prima.SetItem(ll_f,"tension",&
		lds_1.GetItemString(i,"tension"))
		
	  dw_mat_prima.SetItem(ll_f,"estado_parte",&
		lds_1.GetItemString(i,"estado_parte"))
		
	End If	
Next

of_nombre_parte_combinacion()

of_filtro_talla(dw_dt_muestras.GetItemNumber(1,"co_talla"),&
                dw_dt_muestras.GetItemString(1,"co_talla_exp"),&
					 1)

of_Redraw(True)
//










end event

event ue_copia_observacion();//////////////////////////////////////////////////////////////////////////
// se copia la observacion de otra muestra b$$HEX1$$e100$$ENDHEX$$sica
// Soporte de Aplicaciones:  SA-2705
// Solicitado por Oscar Acosta
//////////////////////////////////////////////////////////////////////////


n_cst_param lou_param

If dw_muestra.RowCount()=0 Then Return
If dw_dt_muestras.RowCount()=0 Then Return

If il_grupo_talla=-1 Then
	MessageBox("Advertencia!","Debe especificar el grupo de talla.",StopSign!)
	Return
End If


If il_talla=-1 Then
	MessageBox("Advertencia!","Debe especifiar la talla.",StopSign!)
	Return
End If

OpenWithParm(w_opc_muestra,is_where_busqueda)

lou_param = Message.PowerObjectParm

If Not IsValid(lou_param) Then
	Return 
End If

Long ll_fabrica,ll_linea,ll_muestra

ll_fabrica =lou_param.il_vector[1]
ll_linea   =lou_param.il_vector[2]
ll_muestra =lou_param.il_vector[3]

of_Redraw(False)

n_ds_application lds_1

lds_1=create n_ds_application

lds_1.DataObject=dw_muestra.DataObject+"_cp"

lds_1.SetTransObject(n_cst_application.itr_appl)

long ll_tot,i

ll_tot=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra)

If ll_tot<=0 Then
	MessageBox("Advertencia!","Error copiando observaciones de la muestra.",StopSign!)
	Return
End If

dw_muestra.SetItem(1,"de_observacion",lds_1.GetItemString(1,"de_observacion"))

//////////////////////////////////////////////////////////////////////////
// ojo ajustar lo de observaciones...
// 
//////////////////////////////////////////////////////////////////////////

String ls_tmp,ls_observacion

ls_observacion=lds_1.GetItemString(1,"de_observacion")

dw_observacion.Reset()
For i=1 to 12
	ls_tmp=Trim(mid(ls_observacion,60 * (i -1)+1,60))
	dw_observacion.InsertRow(0)
	dw_observacion.SetItem(i,1,ls_tmp)
Next

end event

event type integer ue_teorica();//////////////////////////////////////////////////////////////////////////
// Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico.13.09.04-04.53
// Para el manejo de la producci$$HEX1$$f300$$ENDHEX$$n te$$HEX1$$f300$$ENDHEX$$rica de muestras en un recurso dado
//////////////////////////////////////////////////////////////////////////

n_cst_param lo_param
String ls_forma_tejer 

if dw_muestra.rowcount() = 0 OR dw_dt_muestras.rowcount() = 0 THEN
	Return -1
END IF	

il_recurso = dw_dt_muestras.GetItemNumber(1,"co_recurso")
IF isnull(il_recurso) THEN
	il_recurso = -1
	Messagebox("Advertencia", "Debe especificar el recurso")
END IF	

If il_recurso=-1 or il_fabrica=-1 or il_linea=-1 or il_muestra=-1 or &
   il_talla=-1  Then
	
	Return -1
	
End If

dw_muestra.accepttext()

ls_forma_tejer = dw_muestra.getitemstring(1,"bpl_co_tipoprod") 
if isnull (ls_forma_tejer) THEN
	Messagebox("Advertencia","Debe seleccionar la Forma de tejer")
	Return -1
End if	

lo_param.il_vector[1] = il_recurso
lo_param.il_vector[2] = il_fabrica
lo_param.il_vector[3] = il_linea
lo_param.il_vector[4] = il_muestra
lo_param.il_vector[5] = il_talla
lo_param.il_vector[6] = il_tipo_prod

lo_param.is_vector[1] = ls_forma_tejer

//SA52991 - E00526 - Ceiba/reariase - 03-02-2017
OpenWithParm(w_teorica_muestra_ref,lo_param)
//OpenWithParm(w_teorica_muestra,lo_param)

Return 1
end event

event ue_invocar_orden();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 24 de Noviembre de 2004.H:14:56
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lo_param
//---------------------------------------------------
If il_fabrica<=0 Then
	MessageBox('Advertencia','C$$HEX1$$f300$$ENDHEX$$digo de F$$HEX1$$e100$$ENDHEX$$brica desconocido',Information!)
	Return
End If
If il_linea<=0 Then
	MessageBox('Advertencia','C$$HEX1$$f300$$ENDHEX$$digo de L$$HEX1$$ed00$$ENDHEX$$nea desconocido',Information!)
	Return
End If
If il_muestra<=0 Then
	MessageBox('Advertencia','C$$HEX1$$f300$$ENDHEX$$digo de Muestra desconocido',Information!)
	Return
End If
//---------------------------------------------------
If ib_cambios Then
	MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','Debe almacenar la informaci$$HEX1$$f300$$ENDHEX$$n adicionada '+&
	'o modificada en la muestra antes de generar una orden.',Information!)
	Return 
End If
//---------------------------------------------------
lo_param.il_vector[1]=il_fabrica
lo_param.il_vector[2]=il_linea
lo_param.il_vector[3]=il_muestra
lo_param.is_vector[1]='FromMuestra'
OpenSheetWithParm(w_orden_pdn,lo_param,ParentWindow(),0,Original!)

end event

event ue_cambio_cod_color();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Martes 08 de Febrero de 2005 HORA 09:00:51:625
// 
// 
//////////////////////////////////////////////////////////////////////////
n_cst_param lo_param

lo_param.il_vector[1]=il_fabrica
lo_param.il_vector[2]=il_linea
lo_param.il_vector[3]=il_muestra
lo_param.il_vector[4]=il_talla
lo_param.il_vector[5]=il_color

lo_param.is_vector[1]=dw_muestra.getItemString(1,"de_muestra")


OpenWithParm(w_cambio_codigo_color,lo_param)

String ls_res

ls_res=message.StringParm

If IsNull(ls_res) Then 
	ls_res=""
End If

If ls_res="OK" Then
	of_buscar(il_fabrica /*long a_fabrica*/,&
	          il_linea/*long a_linea*/,&
				 il_muestra/*long a_muestra */)
End If				 
end event

event ue_copiar_actividades();//////////////////////////////////////////////////////////////////////////
// GAC   copiado de ue_copiar_operaciones
// Martes 27  de Ocubre de 2009 // 
// 
//////////////////////////////////////////////////////////////////////////
//
//
n_cst_param         lo_param
n_ds_application    lds_1
long                ll_fabrica, ll_linea, ll_muestra, ll_talla
long 					  ll_tot,i

If tab_medidas.tabpage_actividades.dw_actividad_muestra.RowCount()>0 Then
	MessageBox("Advertencia!","No se puede hacer la copia porque la muestra tiene actividades.",StopSign!)
	Return
End If

OpenWithParm(w_opc_mues,"")

lo_param=Message.PowerObjectParm


If Not IsValid(lo_param) Then
	Return
End If

ll_fabrica=lo_param.il_vector[1]
ll_linea=lo_param.il_vector[2]
ll_muestra=lo_param.il_vector[3]
ll_talla=lo_param.il_vector[4]

lds_1=create n_ds_application

lds_1.DataObject="d_mu_mues_activ"

lds_1.SetTransObject(n_cst_application.itr_appl)


ll_tot=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra)

If ll_tot<0 Then
	MessageBox("Advertencia!","Error recuperando datos.",StopSign!)
	Return
End If

lds_1.RowsCopy(1,ll_tot,Primary!,tab_medidas.tabpage_actividades.dw_actividad_muestra,1,Primary!)

For i=1 To ll_tot
	tab_medidas.tabpage_actividades.dw_actividad_muestra.SetItem(i,"co_fabrica",il_fabrica)
	tab_medidas.tabpage_actividades.dw_actividad_muestra.SetItem(i,"co_linea",il_linea)
	tab_medidas.tabpage_actividades.dw_actividad_muestra.SetItem(i,"co_muestra",il_muestra)
Next


//ll_tot=tab_medidas.tabpage_procesos.dw_procesos.RowCount()


end event

public function integer of_datos_dt_solicitud (long a_fabrica, long a_solicitud, string a_ref_exp);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 08 de Octubre de 2002 HORA 09:55:09:468
// 
// Datos del detalle de la solicitud
//////////////////////////////////////////////////////////////////////////
If IsNull(a_ref_exp) Then a_ref_exp=""

a_ref_exp=trim(a_ref_exp)


  SELECT min(dt_solicitudes.nu_orden),   
         min(dt_solicitudes.de_referencia)  
    INTO :is_nu_orden,   
         :is_de_referencia  
    FROM dt_solicitudes  
   WHERE ( dt_solicitudes.co_fabrica = :a_fabrica ) AND  
         ( dt_solicitudes.nu_solicitud = :a_solicitud ) AND  
         ( dt_solicitudes.co_ref_exp = :a_ref_exp ) using n_cst_application.itr_appl  ;


If n_cst_application.itr_appl.SqlCode = -1 Then
	is_nu_orden=""
	is_de_referencia=""
	MessageBox("Advertencia!","Hubo un error al consultar detalle de Solicitudes.~n~nNota: " + n_cst_application.itr_appl.SqlErrText )
	Return -1
ElseIf n_cst_application.itr_appl.SqlCode = 100 Then
	is_nu_orden=""
	is_de_referencia=""
End If

Return 1











end function

public function integer of_haydatos (datawindow a_dw);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 26 de Septiembre de 2002 HORA 11:56:53:906
// 
// Verifica si existen o no tallas
//////////////////////////////////////////////////////////////////////////



If a_dw.RowCount()>0 Then
	Return 1
Else
	Return -1
End If
end function

public function integer of_insertardiseno ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 15 de Agosto de 2003 HORA 09:48:15:979
// 
// Se inseran los dise$$HEX1$$f100$$ENDHEX$$os de las muestra en todas las tallas con 
// c$$HEX1$$f300$$ENDHEX$$digo 1
//////////////////////////////////////////////////////////////////////////


String ls_diseno

ls_diseno=dw_muestra.getItemString(1,"co_diseno_muestra")


  INSERT INTO m_disenos_muestras  
         ( co_fabrica,   
           co_linea,   
           co_muestra,   
           co_talla,   
           co_diseno,
           de_diseno,
           fe_creacion,
           fe_actualizacion,
           usuario,   
           instancia )  
     SELECT dt_muestras.co_fabrica,   
            dt_muestras.co_linea,   
            dt_muestras.co_muestra,   
            dt_muestras.co_talla,   
            1,   
            :ls_diseno,   
            current,   
            current,   
            user,   
            DBSERVERNAME  
       FROM dt_muestras  
      WHERE ( dt_muestras.co_fabrica = :il_fabrica ) AND  
            ( dt_muestras.co_linea = :il_linea ) AND  
            ( dt_muestras.co_muestra = :il_muestra ) AND  
            ( dt_muestras.co_talla not in (  SELECT m_disenos_muestras.co_talla  
                                               FROM m_disenos_muestras  
                                              WHERE ( m_disenos_muestras.co_fabrica = :il_fabrica ) AND  
                                                    ( m_disenos_muestras.co_linea = :il_linea ) AND  
                                                    ( m_disenos_muestras.co_muestra = :il_muestra ) AND  
                                                    ( m_disenos_muestras.co_diseno = 1 )   
                                                     ))  using n_cst_application.itr_appl ;
																	  
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

//////////////////////////////////////////////////////////////////////////
// en caso de cambiar la descripcion del dise$$HEX1$$f100$$ENDHEX$$o, se actualiza en la
// tabla maestra.
//////////////////////////////////////////////////////////////////////////


  UPDATE m_disenos_muestras  
     SET (de_diseno, fe_actualizacion, usuario, instancia) =
	      (:ls_diseno, current, user, sitename)  
   WHERE ( m_disenos_muestras.co_fabrica = :il_fabrica ) AND  
         ( m_disenos_muestras.co_linea = :il_linea ) AND  
         ( m_disenos_muestras.co_muestra = :il_muestra ) AND  
			( m_disenos_muestras.co_diseno = 1 )
       USING n_cst_application.itr_appl    ;

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

	
  UPDATE m_codigos_disenos
     SET (sw_usado, fe_actualizacion, usuario, instancia) = 
	      (1, current, user, sitename)    
   WHERE m_codigos_disenos.de_diseno = :ls_diseno 
       USING n_cst_application.itr_appl;

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If
																  
Return 1


end function

public function integer of_datos_solicitud (long a_fabrica, long a_solicitud);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 03 de Febrero de 2003 HORA 17:35:46:281
// 
// 
//////////////////////////////////////////////////////////////////////////

If IsNull(a_fabrica) or a_solicitud=0 Then
	SetNull(il_co_cliente)
	SetNull(il_co_sucursal)
	SetNUll(is_tipo_solicitud)
	SetNull(is_desarrollador)
	SetNull(id_fecha_solicitud)
	Return 1
End If


  SELECT h_solicitudes.co_cliente,   
         h_solicitudes.co_sucursal,
			h_solicitudes.tipo_solicitud,
			h_solicitudes.co_ctecnico,
			h_solicitudes.fe_solicitud
    INTO :il_co_cliente,   
         :il_co_sucursal,
			:is_tipo_solicitud,
			:is_desarrollador,
			:id_fecha_solicitud
    FROM h_solicitudes  
   WHERE ( h_solicitudes.co_fabrica = :a_fabrica ) AND  
         ( h_solicitudes.nu_solicitud = :a_solicitud ) using n_cst_application.itr_appl  ;

If n_cst_application.itr_appl.SqlCode = -1 Then
	il_co_cliente=-1
	il_co_sucursal=-1
	is_tipo_solicitud=""
	MessageBox("Advertencia!","Hubo un error al consultar Solicitudes.~n~nNota: " + n_cst_application.itr_appl.SqlErrText )
	Return -1
ElseIf n_cst_application.itr_appl.SqlCode = 100 Then
	il_co_cliente=0
	il_co_sucursal=0
	is_tipo_solicitud=""
	MessageBox("Advertencia!","La soliciatud no existe. Por favor revisar.")
	Return -1
End If

Return 1
end function

public function integer of_colorestodos ();long i
If dw_dt_muestras_col.RowCount()=0 Then
	For i=1 To idc_colores_exp.RowCount()
		dw_dt_muestras_col.InsertRow(0)
		dw_dt_muestras_col.SetItem(i,"co_color_exp",&
		idc_colores_exp.GetItemString(i,"co_color"))
		
		dw_dt_muestras_col.SetItem(i,"co_talla",il_talla)
	Next
End If


Return 1






















end function

public function integer of_desc_muestra ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 13 de Noviembre de 2003 HORA 11:40:30:099
// 
// Campos de descripci$$HEX1$$f300$$ENDHEX$$n en la muestra
//////////////////////////////////////////////////////////////////////////
n_cst_comun lo_comun
String ls_de_tela
long ll_tipo_med,ll_res, ll_co_reftel

ll_tipo_med=dw_muestra.GetItemNumber(1,"id_tipo_med")

ll_Res=lo_comun.of_nombretipomedida(ll_tipo_med /*long a_tipo_medida*/, &
                                    n_cst_application.itr_appl/*transaction a_transaction */)
												
If ll_res=1 Then
	dw_muestra.SetItem(1,"de_tipo_med",lo_comun.of_getString(1))
End If

long   ll_cliente,ll_sucursal
String   ls_tipo_muestra

ll_cliente=dw_muestra.GetItemNumber(1,"co_cliente")
ll_sucursal=dw_muestra.GetItemNumber(1,"co_sucursal")
ls_tipo_muestra=dw_muestra.GetItemString(1,"tipo_muestra")

ll_res=lo_comun.of_nombrecliente( ll_cliente,ll_sucursal,&
       ls_tipo_muestra,n_cst_application.itr_appl)
		 
If ll_res=1 Then
	dw_muestra.SetItem(1,"de_cliente",lo_comun.of_getString(1))
End If

//////////////////////////////////////////////////////////////////////////
// Se coloca la desripcion de la ejecutiva
// 
//////////////////////////////////////////////////////////////////////////
long ll_ejecutiva

ll_ejecutiva=dw_muestra.GetItemNumber(1,"co_ejecutiva")

ll_res=lo_comun.of_nombreejecutiva(ls_tipo_muestra /*string a_tipo*/,&
                                   ll_ejecutiva/*long a_codigo*/,&
											  n_cst_application.itr_appl/*transaction a_transaction */)
											  
If ll_res=1 Then
	dw_muestra.SetItem(1,"de_ejecutiva",lo_comun.of_getString(1))
End If

// FACL - 2019/01/03 - SA59582 -  Se asigna la descripcion de la Tela, sin control de Sourcing
ll_co_reftel = dw_muestra.GetItemNumber( 1, 'co_reftel' )
If ll_co_reftel > 0 Then
	If This.Of_Nombre_Tela( ll_co_reftel, ls_de_tela, False ) > 0 Then
		dw_muestra.SetItem(1,"de_tela", ls_de_tela )
	End IF
End If
	
	
//////////////////////////////////////////////////////////////////////////
// Paso las observaciones al dw que las muestra en la tercera carpeta
// 
//////////////////////////////////////////////////////////////////////////
String ls_observacion


ls_observacion=dw_muestra.GetItemString(1,"de_observacion")
ls_observacion=Trim(ls_observacion)


String ls_tmp
int i
dw_observacion.Reset()
For i=1 to 12
	ls_tmp=Trim(mid(ls_observacion,60 * (i -1)+1,60))
	dw_observacion.InsertRow(0)
	dw_observacion.SetItem(i,1,ls_tmp)
Next

Return 1
end function

public function integer of_retrieve_tipo_prod ();n_cst_comun lo_comun
lo_comun.of_loadDddw(idc_tipo_tejido,il_tipo_prod,n_cst_application.itr_appl)

lo_comun.of_loadDddw(idc_partebas,il_tipo_prod,n_cst_application.itr_appl)

//tab_1.tabpage_3.dw_m_parte_bas.Retrieve(il_tipo_prod)
//se deb cargar un drop down con las partes del producto
Return 1
end function

public function integer of_cargar_dddw (long a_fabrica);n_cst_comun_orden lo_comun

lo_comun.of_loadDddw(idc_linea,a_fabrica,n_cst_application.itr_appl)
lo_comun.of_loadDddw(idc_grupos_vta,a_fabrica,n_cst_application.itr_appl)
lo_comun.of_loadDddw(idc_sgrupo_vta,a_fabrica,n_cst_application.itr_appl)

Return 1
end function

public function integer of_nombrerecurso ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 20 de Noviembre de 2003 HORA 14:07:14:245
// 
// Para la descripcion de los recursos
//////////////////////////////////////////////////////////////////////////


//n_cst_comun lo_comun
//
//long i,ll_tot,ll_recurso,ll_res

//ll_tot=dw_h_fmp_muestras.RowCount()
//
//For i=1 To ll_tot
//	ll_recurso=dw_h_fmp_muestras.GetItemNumber(i,"co_recurso")
//	ll_res=lo_comun.of_nombrerecursotj(ll_recurso /*long a_recurso*/,&
//	                                   n_cst_application.itr_appl/*transaction a_transaction */)
//												  
//	If ll_res=1 Then
//		dw_h_fmp_muestras.SetItem(i,"de_recurso",lo_comun.of_getString(1))
//	End If
//	
//Next
//
Return 1
end function

public function integer of_filtro_medida ();String ls_filtro

ls_filtro="co_talla="+String(il_talla)

//coment 20090203
//tab_medidas.tabpage_1.dw_medidas1.setFilter(ls_filtro) 
//tab_medidas.tabpage_1.dw_medidas1.Filter()

//tab_medidas.tabpage_2.dw_med_rep.setFilter(ls_filtro)
//tab_medidas.tabpage_2.dw_med_rep.Filter()

//FIN coment 20090203

Return 1
end function

public function integer of_datos_cliente (string as_tpped, long an_cliente, long an_sucursal);String ls_descliente,ls_desejecutiva,ls_depais
Int    li_pais,li_ejecutiva



//Buscamos la descripci$$HEX1$$f300$$ENDHEX$$n del cliente como el pa$$HEX1$$ed00$$ENDHEX$$s y la ejecutiva de cuenta.
If as_tpped = "EX" Or as_tpped = "XD" Then
	select de_cliente,
			 co_pais,
			 co_ejecutiva
	  into :ls_descliente,
			 :li_pais,
			 :li_ejecutiva  
	  from m_clientes_exp  
	 where co_cliente = :an_cliente and
			 co_sucursal = :an_sucursal using n_cst_application.itr_appl ;
Else
	select de_cliente
     into :ls_descliente
     from m_clientes  
    where co_cliente = :an_cliente and
			 co_sucursal = :an_sucursal using n_cst_application.itr_appl ;
	
	ls_depais = 'COLOMBIA'
End If


If n_cst_application.itr_appl.SqlCode = -1 Then
	MessageBox("Advertencia!","Hubo un error al consultar el cliente.~n~nNota: " + n_cst_application.itr_appl.SqlErrText )
	Return 2
ElseIf n_cst_application.itr_appl.SqlCode = 100 Then
	MessageBox("Advertencia!","El cliente no existe. Por favor revisar.")
	Return 2
End If

dw_muestra.SetItem(1,"de_cliente",ls_descliente)

//Buscamos la descripci$$HEX1$$f300$$ENDHEX$$n del pa$$HEX1$$ed00$$ENDHEX$$s.
select de_pais  
  into :ls_depais  
  from m_paises  
 where co_pais = :li_pais using n_cst_application.itr_appl ;

If n_cst_application.itr_appl.SqlCode = -1 Then
	MessageBox("Advertencia!","Hubo un error al consultar la descripci$$HEX1$$f300$$ENDHEX$$n del cliente.~n~nNota: " + n_cst_application.itr_appl.SqlErrText )
	Return 1
//ElseIf n_cst_application.itr_appl.SqlCode = 100 Then
//	MessageBox("Advertencia!","El pa$$HEX1$$ed00$$ENDHEX$$s relacionado con el cliente no existe. Por favor revisar.")
//	Return 1
End If

//dw_muestra.SetItem(1,"de_pais",ls_depais)


//Buscamos la descripci$$HEX1$$f300$$ENDHEX$$n del asesor de la siguiente manera: si el tipo de 
//pedido es EX se busca en m_ejecutivas_exp de lo contrario en m_vendedor.
If as_tpped = "EX" Or as_tpped = "XD" Then
	
	select de_ejecutiva  
     into :ls_desejecutiva  
     from m_ejecutivas_exp  
    where co_ejecutiva = :li_ejecutiva  using n_cst_application.itr_appl ;
	 
Else
	select m_vend_linea.co_vendedor,   
          m_vendedor.de_vendedor  
     into :li_ejecutiva,   
          :ls_desejecutiva  
    FROM m_vend_linea,   
         m_vendedor  
   WHERE ( m_vend_linea.co_vendedor = m_vendedor.co_vendedor ) and  
         ( m_vend_linea.co_fabrica = 2 ) AND  
         ( m_vend_linea.co_linea = 99 ) AND  
         ( m_vend_linea.co_cliente = :an_cliente ) AND  
         ( m_vend_linea.co_sucursal = :an_sucursal  )   ;

End If

If n_cst_application.itr_appl.SqlCode = -1 Then
	MessageBox("Advertencia!","Hubo un error al consultar la descripci$$HEX1$$f300$$ENDHEX$$n del asesor.~n~nNota: " + n_cst_application.itr_appl.SqlErrText )
	Return 2
//ElseIf n_cst_application.itr_appl.SqlCode = 100 Then
//	MessageBox("Advertencia!","El asesor no existe. Por favor revisar.")
//	Return 1
End If

dw_muestra.SetItem(1,"co_ejecutiva",li_ejecutiva)
dw_muestra.SetItem(1,"de_ejecutiva",ls_desejecutiva)


//////////////////////////////////////////////////////////////////////////
// Se asigna el personaje de control t$$HEX1$$e900$$ENDHEX$$cnico
// an_cliente,an_sucursal
//////////////////////////////////////////////////////////////////////////
String ls_usuario

  SELECT cliente_ctecnico.co_ctecnico  
    INTO :ls_usuario  
    FROM cliente_ctecnico  
   WHERE ( cliente_ctecnico.tipo_cliente = :as_tpped ) AND  
         ( cliente_ctecnico.co_cliente = :an_cliente ) AND  
         ( cliente_ctecnico.co_sucursal = :an_sucursal )  
			using n_cst_application.itr_appl;
			
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If
			
If n_cst_application.itr_appl.SQLcode=100 Then 
	MessageBox("Advertencia!","No se determino el funcionario de control t$$HEX1$$e900$$ENDHEX$$cnico, por favor verifique.",StopSign!)
	Return -1
End If

dw_muestra.SetItem(1,"desarrollador",ls_usuario)


Return 0
end function

public function integer of_redraw (boolean a_redrawing);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 16 de Octubre de 2002 HORA 15:43:57:250
// 
// Redraw al momento de guardar
//-------------------------------------------------
//	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
//	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 10 de Noviembre de 2004.H:17:05
//---------------------------------------------------
//Modificaci$$HEX1$$f300$$ENDHEX$$n-Adici$$HEX1$$f300$$ENDHEX$$n de redraw para las actividades y mpbase
//////////////////////////////////////////////////////////////////////////


dw_dt_muestras.SetRedraw(a_redrawing)
dw_dt_muestras_col.SetRedraw(a_redrawing)
tab_medidas.tabpage_1.dw_medidas1.SetRedraw(a_redrawing)
tab_medidas.tabpage_2.dw_med_rep.SetRedraw(a_redrawing)

dw_h_fmp_muestras.SetRedraw(a_redrawing)

dw_mat_prima.SetRedraw(a_redrawing)
//******************************************************************************
tab_medidas.tabpage_operaciones.dw_operaciones_mue.SetRedraw(a_redrawing)
tab_medidas.tabpage_actividades.dw_actividad_muestra.SetRedraw(a_redrawing)
tab_medidas.tabpage_mp_base.dw_mp_base.SetRedraw(a_redrawing)
//******************************************************************************
Return 1
end function

public function integer of_partebase ();//////////////////////////////////////////////////////////////////////////
// Ingresa las partes basicas del producto
// 
//////////////////////////////////////////////////////////////////////////


long i,ll_tot,ll_cod,ll_clasificacion,ll_f




ll_tot=idc_partebas.RowCount()

For i=1 To ll_tot
	
	ll_cod=idc_partebas.GetItemNumber(i,"co_partebas")
	ll_clasificacion=idc_partebas.GetItemNumber(i,"co_clasificacion")
	If not IsNull(ll_cod) and ll_clasificacion=1 Then
		
		ll_f=tab_medidas.tabpage_1.dw_medidas1.InsertRow(0)
		tab_medidas.tabpage_1.dw_medidas1.SetItem(ll_f,"co_fabrica",il_fabrica)
		tab_medidas.tabpage_1.dw_medidas1.SetItem(ll_f,"co_linea",il_linea)
		tab_medidas.tabpage_1.dw_medidas1.SetItem(ll_f,"co_muestra",il_muestra)
		tab_medidas.tabpage_1.dw_medidas1.SetItem(ll_f,"co_talla",il_talla)
		tab_medidas.tabpage_1.dw_medidas1.SetItem(ll_f,"co_tipoprod",il_tipo_prod)
		
		tab_medidas.tabpage_1.dw_medidas1.SetItem(ll_f,"co_partebas",ll_cod)
		
		tab_medidas.tabpage_1.dw_medidas1.SetItem(ll_f,"co_diseno",1)
		
		tab_medidas.tabpage_1.dw_medidas1.SetItem(ll_f,"co_recurso",il_recurso)		
	End If
Next

Return 1


end function

public function integer of_verpulgadas ();n_cst_comun lo_pulg
Long i,ll_tot

ll_tot=tab_medidas.tabpage_2.dw_med_rep.RowCount()


For i=1 to ll_tot
	tab_medidas.tabpage_2.dw_med_rep.SetItem(i,"ca_pulg",lo_pulg.of_mmToPulg(&
	tab_medidas.tabpage_2.dw_med_rep.GetItemDecimal(i,"ca_cm")))	
Next

Return 1
end function

public function integer of_reset ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 10 de Noviembre de 2004.H:17:05
---------------------------------------------------
Modificaci$$HEX1$$f300$$ENDHEX$$n-Adici$$HEX1$$f300$$ENDHEX$$n de reset para las actividades y mpbase
---------------------------------------------------*/
dw_muestra.Reset()
dw_dt_muestras.Reset()
dw_dt_muestras_col.Reset()

dw_observacion.Reset()
Long i
For i=1 To 12
	dw_observacion.InsertRow(0)
Next

tab_medidas.tabpage_1.dw_medidas1.Reset()
tab_medidas.tabpage_2.dw_med_rep.Reset()

dw_dt_muestras_col.Reset()
//********************************************************************
tab_medidas.tabpage_operaciones.dw_operaciones_mue.Reset()
tab_medidas.tabpage_actividades.dw_actividad_muestra.Reset()
tab_medidas.tabpage_mp_base.dw_mp_base.Reset()
//********************************************************************
dw_h_fmp_muestras.Reset()

dw_mat_prima.Reset()

dw_combinacion.reset()

il_recurso=-1 
il_fabrica=-1 
il_linea=-1 
il_muestra=-1 
il_talla=-1

Return 1
end function

public function string of_nombrecombinacion (long a_combi, long a_talla);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 22 de Diciembre de 2003 HORA 14:12:37:921
// 
// Busca el nombre el el dw con las combinaciones
// que esta oculto
//////////////////////////////////////////////////////////////////////////

long 		ll_pos
String 	ls_retorno

If IsNull(a_combi) Then a_combi=-1

ll_pos=dw_combinacion.find("co_combinacion="+String(a_combi)+&
     " and co_talla="+String(a_talla),1,dw_combinacion.RowCount())

If ll_pos<=0 Then
	MessageBox("Advertencia!","Combinaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	ls_retorno=""
Else
	ls_retorno=dw_combinacion.GetItemString(ll_pos,"de_combinacion")

End If

Return ls_retorno
end function

public function integer of_nombre_parte_combinacion ();//////////////////////////////////////////////////////////////////////////
// Para colocar la descripcion de la parte o combinacion
// 
//////////////////////////////////////////////////////////////////////////


n_cst_comun lo_c

Decimal lde_peso_prod
Long i,ll_tot,ll_parte,ll_combinacion,ll_res, ll_talla

ll_tot=dw_mat_prima.RowCount()

For i=1 To ll_tot
	ll_parte=dw_mat_prima.GetItemNumber(i,"co_partemp")
	ll_talla=dw_mat_prima.GetItemNumber(i,"co_talla")
	
	ll_combinacion=dw_mat_prima.GetItemNumber(i,"co_combinacion")
	If IsNull(ll_parte) Then 
		ll_parte=il_PARTEMP_GEN
		//dw_partes.SetItem(i,"co_partemp",ll_parte)
	End If
	If IsNull(ll_combinacion) Then 
		ll_combinacion=il_COMBINA_GEN
		//dw_partes.SetItem(i,"co_combinacion",ll_combinacion)
	End If
	If ll_parte<>il_PARTEMP_GEN Then
		ll_res=lo_c.of_nombrepartemp(il_tipo_prod,ll_parte,n_cst_application.itr_appl)
		
		dw_mat_prima.SetItem(i,"de_parte_combinacion",lo_c.of_getString(1))
	ElseIf ll_combinacion<>il_COMBINA_GEN Then
		//ll_res=lo_c.of_nombreCombinaMuestra( il_fabrica,il_linea, il_muestra,&
	   //                il_talla, ll_combinacion,n_cst_application.itr_appl)
		
		dw_mat_prima.SetItem(i,"de_parte_combinacion",of_nombreCombinacion(ll_combinacion,ll_talla))
	End If
	
	
	lde_peso_prod=dw_mat_prima.GetItemDecimal(i,"peso_mp")
	dw_mat_prima.SetItem(i,"peso_muestra", lde_peso_prod/ide_FACTOR_MUESTRA_A_PDN)	
	
Next
Return 1



end function

public function integer of_nombrerestrictivo ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 23 de Agosto de 2003 HORA 15:19:45:161
// 
// Para colocar el nombre del recurso restrictivo cuando se recupera..
//////////////////////////////////////////////////////////////////////////
n_cst_comun lo_comun
long ll_tot,i,ll_rec,ll_res

//ll_tot=dw_dt_muestras.RowCount()

//For i=1 to ll_tot
//	ll_rec=dw_dt_muestras.GetItemNumber(i,"id_rec_rest")
//	ll_res=lo_comun.of_nombrerecursoTj( ll_rec,n_cst_application.itr_appl /*transaction a_transaction */)
//	
//   //	ll_res=lo_comun.of_nombrerecursorestrictivo( ll_rec,n_cst_application.itr_appl /*transaction a_transaction */)
//	
//	If ll_res=1 Then
//		dw_dt_muestras.SetItem(i,"de_rec_rest",lo_comun.of_getString(1))
//	End If
//	
//	ll_rec=dw_dt_muestras.GetItemNumber(i,"co_recurso")
//	ll_res=lo_comun.of_nombrerecursoTj( ll_rec,n_cst_application.itr_appl /*transaction a_transaction */)
//	
//	If ll_res=1 Then
//		dw_dt_muestras.SetItem(i,"de_recurso",lo_comun.of_getString(1))
//	End If
	
//Next


Return 1
end function

public function integer of_scroll (long a_pos);//Window message:
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

For i=1 To a_pos
	Send(Handle(this), WM_VSCROLL, SB_PAGEDOWN, 0)
Next

Return 1
end function

public function integer of_filtro_talla (long a_talla, string a_talla_exp, long a_fila);String        ls_filtro,ls_filtro_exp
n_cst_comun   lo_comun
long          ll_res

//dw_dt_muestras.SelectRow(0,False)
//dw_dt_muestras.SelectRow(a_fila,True)


If IsNull(a_talla) Then a_talla=-1
If IsNull(a_talla_exp) Then a_talla_exp="-1"

ls_filtro="co_talla="+String(a_talla)
ls_filtro_exp="co_talla_exp='"+String(a_talla_exp)+"'"


il_fila_sel=a_fila

il_talla=a_talla
/*Para asignar el valor num$$HEX1$$e900$$ENDHEX$$rico del recurso para la modificacion
de la produccion teorica.
*/
il_recurso = dw_dt_muestras.GetItemNumber(a_fila,"co_recurso")
/*
*/

dw_dt_muestras_col.SetFilter(ls_filtro)
dw_dt_muestras_col.Filter()

dw_combinacion.SetFilter(ls_filtro)
dw_combinacion.Filter()

gb_colores.text="Colores por talla "+String(il_talla) + " (Ctrl+4)"

//////////////////////////////////////////////////////////////////////////
// Filtro las medidas para una talla especifica y coloco el minimo recurso
// 
//////////////////////////////////////////////////////////////////////////

//tab_medidas.tabpage_1.dw_medidas1.SetFilter(ls_filtro)
//tab_medidas.tabpage_1.dw_medidas1.Filter()

//gb_medidas.text="Medidas por talla "+String(il_talla)

tab_medidas.tabpage_operaciones.dw_operaciones_mue.SetFilter(ls_filtro)
tab_medidas.tabpage_operaciones.dw_operaciones_mue.Filter()

gb_procesos.text="Procesos por talla "+String(il_talla)+ " (Ctrl+5)"


of_filtro_medida()

Long ll_color1,ll_pos


If dw_dt_muestras_col.RowCount()>0 Then

	ll_pos=dw_dt_muestras_col.Find("co_color="+String(il_color),1,&
       dw_dt_muestras_col.RowCount())

	If ll_pos<=0 Then
		ll_pos=1
	End If
	
	il_color=dw_dt_muestras_col.GetItemNumber(ll_pos,"co_color")
	of_filtro_color(il_color,ll_pos)
Else
	il_color=-1
	of_filtro_color(il_color,-1)
End If

idc_colores_exp.SetFilter(ls_filtro_exp)
idc_colores_exp.Filter()

IF a_talla <> -1 THEN wf_validarMostrarCargarCampoEnPDn() //SA55583 - Ceiba/jjmonsal - 21-09-2016, la talla ya tiene un valor correcto asignado 

Return 1


end function

public function integer of_filtro_color (long a_color, long a_fila);String	ls_filtro
long		ll_caract_mp

dw_dt_muestras_col.SelectRow(0,False)
dw_dt_muestras_col.SelectRow(a_fila,True)

il_fila_color=a_fila

If IsNull(a_color) Then a_color=-1

il_color=a_color

ls_filtro="co_talla="+String(il_talla)+" and co_color="+String(il_color)

//Messagebox('Var filtro color','ls_filtro='+ls_filtro+'~n')

dw_h_fmp_muestras.Setfilter(ls_filtro)
dw_h_fmp_muestras.Filter()

dw_mat_prima.SetFilter(ls_filtro)
dw_mat_prima.Filter()


gb_matprima.text="Materia prima de talla "+&
String(il_talla)+" en color "+String(il_color)+ " (Ctrl+6)"

ll_caract_mp=dw_muestra.GetItemNumber(1,"co_caract_mp")

If IsNull(ll_caract_mp) Then
	ll_caract_mp=1
End If
//////////////////////////////////////////////////////////////////////////
// solo se va a colocar h_fmp si el color es prete$$HEX1$$f100$$ENDHEX$$ido
// y para el caso de crudos si es el 999
//////////////////////////////////////////////////////////////////////////

If dw_h_fmp_muestras.RowCount()=0 and a_color<>-1 Then
	If ll_caract_mp=2 or a_color=999 or il_tipo_prod = 20 Then
		dw_h_fmp_muestras.TriggerEvent("ue_insertrow")
	End If
End If
long ll_pos
If dw_h_fmp_muestras.RowCount()>0 Then
	
	ll_pos=dw_h_fmp_muestras.Find("co_diseno="+String(il_opcion),1,&
	       dw_h_fmp_muestras.RowCount())
			 
	If ll_pos<=0 Then
		ll_pos=1
	End If
	
	il_opcion=dw_h_fmp_muestras.GetItemNumber(ll_pos,"co_diseno")
	of_filtro_opcion(il_opcion,ll_pos)
Else
	il_opcion=-1	
	of_filtro_opcion(il_opcion,-1)
end If



Return 1
end function

public function integer of_filtro_opcion (long a_opcion, long a_fila);String ls_filtro



dw_h_fmp_muestras.SelectRow(0,False)
dw_h_fmp_muestras.SelectRow(a_fila,True)

il_fila_opcion=a_fila

If IsNull(a_opcion) Then a_opcion=-1

il_opcion=a_opcion

ls_filtro="co_talla="+String(il_talla)+" and co_color="+String(il_color)+&
" and co_diseno="+String(il_opcion) 

//Messagebox('Var','ls_filtro='+ls_filtro+'~n')

dw_mat_prima.Setfilter(ls_filtro)
dw_mat_prima.Filter()

Return 1
end function

public function integer of_buscar (long a_fabrica, long a_linea, long a_muestra);//////////////////////////////////////////////////////////////////////////
// Se utiliza 0 para nueva
//-------------------------------------------------
//	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
//	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 10 de Noviembre de 2004.H:17:05
//---------------------------------------------------
// Modificaci$$HEX1$$f300$$ENDHEX$$n-Adici$$HEX1$$f300$$ENDHEX$$n de la b$$HEX1$$fa00$$ENDHEX$$squeda de los datos de actividades y mpbase
//////////////////////////////////////////////////////////////////////////
n_cst_comun  		lo_comun
DataWindowChild	ldc_1, ldwc_diseno
Long 					ll_res,ll_recurso
Long 					ll_grupoprod
String 				ls_co_ref_exp
Integer 				li_registros

n_cst_recurso	 lnv_recurso
lnv_recurso		= CREATE n_cst_recurso

If ib_cambios Then
	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
	
	If ll_res=2 Then
		Return -2
	End If
End If

ib_cambios=False

dw_dt_muestras.Reset()

ll_res=dw_muestra.Retrieve(a_fabrica,a_linea,a_muestra)
If ll_res<0 Then
	MessageBox("Advertencia!","Error recuperando datos.",StopSign!)
	dw_muestra.InsertRow(0)
	Return -1
End If

If ll_res=0 Then
	MessageBox("Advertencia!","La muestra no se encontr$$HEX1$$f300$$ENDHEX$$.",StopSign!)
	Return -1
End If

of_desc_muestra()

il_co_cliente=0
il_co_sucursal=0
il_recurso=-1

il_tipo_prod=dw_muestra.GetItemNumber(1,"co_tipoprod")

of_retrieve_tipo_prod()

/*
* MODIFICADO: Agosto 11 de 2009 - ohlondon
*/

ll_grupoprod = dw_muestra.GetItemNumber(1,"co_grupoprod")

If  (ll_grupoprod=-1 or isnull(ll_grupoprod)) Then
	ll_grupoprod = 0
END IF

/*
* Se deben recuperar las medidas del Grupo de tipo de producto
*/
tab_medidas.tabpage_2.dw_med_rep.GetChild("id_med_rep",ldc_1)	
ldc_1.SetTransObject(n_cst_application.itr_appl)
ldc_1.Retrieve(ll_grupoprod)

/*
* MODIFICADO: Julio 30 de 2009 - ohlondon
*/
lo_comun.of_loadDddw(idwc_tipoprod, n_cst_application.is_user, n_cst_application.itr_appl)

lo_comun.of_loadDddw(idwc_grupoprod,il_tipo_prod,n_cst_application.itr_appl)

lo_comun.of_loadDddw(idc_tipo_tejido,il_tipo_prod,n_cst_application.itr_appl)

lo_comun.of_loadDddw(ldwc_diseno,il_tipo_prod,n_cst_application.itr_appl)

il_grupo_talla=dw_muestra.GetItemNumber(1,"co_grupo_tlla")

lo_comun.of_loadDddw(idc_tallas_por_grupo,il_grupo_talla,n_cst_application.itr_appl)
//////////////////////////////////////////////////////////////////////////
// Carga la fabrica y la linea para la lista de colores
// 
//////////////////////////////////////////////////////////////////////////

il_fabrica=dw_muestra.GetItemNumber(1,"co_fabrica") 
il_linea=dw_muestra.GetItemNumber(1,"co_linea")
il_muestra=dw_muestra.GetItemNumber(1,"co_muestra")

Title="Muestra "+String(a_fabrica)+" / "+String(a_linea)+" / "+String(a_muestra)

long ll_solicitud

ll_solicitud=dw_muestra.getItemNumber(1,"nu_solicitud")

If of_datos_solicitud(il_fabrica,ll_solicitud)<>1 Then
//	Return -1
End If

ls_co_ref_exp=dw_muestra.getItemString(1,"co_ref_exp")

lo_comun.of_loadDddw(idc_ref_exp,il_fabrica,ll_solicitud,il_linea,n_cst_application.itr_appl )

lo_comun.of_loadDddw(idc_colores_exp,il_fabrica,ll_solicitud,ls_co_ref_exp,n_cst_application.itr_appl )
lo_comun.of_loadDddw(idc_talla_exp,il_fabrica,ll_solicitud,il_linea,ls_co_ref_exp,n_cst_application.itr_appl )

of_cargar_dddw(il_fabrica)

//////////////////////////////////////////////////////////////////////////
// Tomo los datos de la muestra para recuperar el detalle
// 
//////////////////////////////////////////////////////////////////////////

long ll_tot_tallas,ll_talla,i,ll_color

ll_tot_tallas=dw_dt_muestras.Retrieve(il_fabrica,il_linea,il_muestra)

//////////////////////////////////////////////////////////////////////////
// Coloca nombre de recurso restrictivo
// 
//////////////////////////////////////////////////////////////////////////

of_nombreRestrictivo()

If ll_tot_tallas>0 Then
	
	IF TRIM(String(dw_dt_muestras.Object.co_reccotnocierra[1],'')) <>'' AND dw_dt_muestras.Object.co_reccotnocierra[1] <> 0 THEN
			
		ll_res=lnv_recurso.of_nombreRecursoTj( Long(dw_dt_muestras.Object.co_reccotnocierra[1]) ,n_cst_application.itr_appl)
					
		IF ll_res = 1 THEN
			dw_dt_muestras.Object.de_recursonocierra[1] = lnv_recurso.of_getString(1)
		END IF
	END IF
	IF TRIM(String(dw_dt_muestras.Object.co_reccotcierra[1],'')) <>'' AND dw_dt_muestras.Object.co_reccotcierra[1] <> 0 THEN
			
		ll_res=lnv_recurso.of_nombreRecursoTj( Long(dw_dt_muestras.Object.co_reccotcierra[1]) ,n_cst_application.itr_appl)
					
		IF ll_res = 1 THEN
			dw_dt_muestras.Object.de_recursocierra[1] = lnv_recurso.of_getString(1)
		END IF
	END IF
	
	
	dw_dt_muestras_col.Retrieve(il_fabrica,il_linea,il_muestra,0,0)	
	
//////////////////////////////////////////////////////////////////////////
// Coloco los nombres de los colores
// 
//////////////////////////////////////////////////////////////////////////
	dw_dt_muestras_col.SetFilter("")
	dw_dt_muestras_col.Filter()
	
//	For i=1 To dw_dt_muestras_col.RowCount()
//		ll_color=dw_dt_muestras_col.GetItemNumber(i,"co_color")
//		ll_res=lo_comun.of_nombrecolor( il_Fabrica,il_linea,ll_color,n_cst_application.itr_appl)
//		If ll_res=1 then
//			dw_dt_muestras_col.SetItem(i,"de_color",lo_comun.of_getstring(1))
//		End If
//	Next

/////////////////////
ll_recurso = dw_dt_muestras.getitemNumber(1,"co_recurso")
/////////////////////
	
//////////////////////////////////////////////////////////////////////////
// Se recuperan las medidas
// solo del dise$$HEX1$$f100$$ENDHEX$$o 1
//////////////////////////////////////////////////////////////////////////
If il_fabrica = 5 Then
	tab_medidas.tabpage_1.dw_medidas1.DataObject = 'd_dt_med_mue_tolerancia'
Else
	tab_medidas.tabpage_1.dw_medidas1.DataObject = 'd_dt_med_mue'
End if 
tab_medidas.tabpage_1.dw_medidas1.SetTransObject(n_cst_application.itr_appl)

	//SA56890 - Ceiba reariase - 30/05/2017
	tab_medidas.tabpage_1.dw_medidas1.GetChild('co_partebas', idc_partebas)
	idc_partebas.SetTransObject(n_cst_application.itr_appl)
	idc_partebas.Retrieve(il_tipo_prod)
	//Fin SA56890

   tab_medidas.tabpage_1.dw_medidas1.Retrieve(il_fabrica,il_linea,il_muestra,1,ll_recurso)
//	tab_medidas.tabpage_1.dw_medidas1.SetFilter("")
//	tab_medidas.tabpage_1.dw_medidas1.Filter()
	
	tab_medidas.tabpage_2.dw_med_rep.Retrieve(il_fabrica,il_linea,il_muestra,ll_recurso,1)
//	tab_medidas.tabpage_2.dw_med_rep.SetFilter("")
//	tab_medidas.tabpage_2.dw_med_rep.Filter()
	
//SA56750 - Ceiba/reariase - 11-05-2017
//	tab_medidas.tabpage_3.dw_referencias.Retrieve(il_fabrica,il_linea,il_muestra)
	li_registros = tab_medidas.tabpage_3.dw_referencias.Retrieve(il_fabrica,il_linea,il_muestra)
	IF li_registros > 0 THEN
		cb_cargar_ficha_tejido.visible = False
	ELSE
		cb_cargar_ficha_tejido.visible = True
	END IF
//Fin SA56750

	of_verPulgadas()
	//***********************************************************************************************
	tab_medidas.tabpage_operaciones.dw_operaciones_mue.Retrieve(il_fabrica,il_linea,il_muestra)
//	tab_medidas.tabpage_operaciones.dw_operaciones_mue.SetFilter("")
//	tab_medidas.tabpage_operaciones.dw_operaciones_mue.Filter()
	
	tab_medidas.tabpage_actividades.dw_actividad_muestra.Retrieve(il_fabrica,il_linea,il_muestra)
//	tab_medidas.tabpage_actividades.dw_actividad_muestra.SetFilter("")
//	tab_medidas.tabpage_actividades.dw_actividad_muestra.Filter()
	
	tab_medidas.tabpage_mp_base.dw_mp_base.Retrieve(il_fabrica,il_linea,il_muestra)
//	tab_medidas.tabpage_mp_base.dw_mp_base.SetFilter("")
//	tab_medidas.tabpage_mp_base.dw_mp_base.Filter()
	tab_medidas.tabpage_diseno.dw_mu_dt_diseno.GetChild('co_diseno', ldwc_diseno)
	ldwc_diseno.SetTransObject(n_cst_application.itr_appl)
	ldwc_diseno.Retrieve(il_tipo_prod)
	tab_medidas.tabpage_diseno.dw_mu_dt_diseno.Retrieve(il_fabrica,il_linea,il_muestra)
	tab_medidas.tabpage_diseno.dw_mu_dt_largo.Retrieve(il_fabrica,il_linea,il_muestra)
	tab_medidas.tabpage_diseno.dw_mu_dt_puno.Retrieve(il_fabrica,il_linea,il_muestra)
	
	//***********************************************************************************************	
	dw_h_fmp_muestras.Retrieve(il_fabrica,il_linea,il_muestra)
	dw_h_fmp_muestras.SetFilter("")
	dw_h_fmp_muestras.Filter()
	
	of_nombreRecurso()
	
	dw_mat_prima.Retrieve(il_fabrica,il_linea,il_muestra)
	dw_mat_prima.SetFilter("")
	dw_mat_prima.Filter()

	dw_combinacion.Retrieve(il_fabrica,il_linea,il_muestra)
	dw_combinacion.SetFilter("")
	dw_combinacion.Filter()
	
	of_nombre_parte_combinacion()
	
//////////////////////////////////////////////////////////////////////////
// Ubicar el cursor en el $$HEX1$$fa00$$ENDHEX$$ltimo color consultado
// 
//////////////////////////////////////////////////////////////////////////
	long ll_talla1,ll_pos
	
	ll_pos=dw_dt_muestras.find("co_talla="+String(il_talla),1,&
	       dw_dt_muestras.RowCount() )
			 
	If ll_pos<=0 Then
		ll_pos=1
	End If
	
	of_filtro_talla(dw_dt_muestras.GetItemNumber(ll_pos,"co_talla"),&
                dw_dt_muestras.GetItemString(ll_pos,"co_talla_exp"),&
					 ll_pos)
	
End If

//////////////////////////////////////////////////////////////////////////
// se coloca la descripcion de los recursos
// 
//////////////////////////////////////////////////////////////////////////
//of_nombreRecurso()

dw_muestra.SetFocus()
//-------------------------------------------------------------------------------------
// Cargo la suma de los pares que existen
// Candrico .
If dw_dt_muestras_col.RowCount()>0 Then
	dw_dt_muestras_col.Modify("compute_ptejer.Expression='sum(pares_tejer for all)'")
	dw_pares_tejer.Object.pares_tejer[1] = dw_dt_muestras_col.Object.compute_ptejer[1]		
	dw_dt_muestras_col.Modify("compute_pdespa.Expression='sum(pares_despachar for all)'")
	dw_pares_tejer.Object.pares_despachar[1] = dw_dt_muestras_col.Object.compute_pdespa[1]
End If
//-------------------------------------------------------------------------------------
ib_new=FALSE

of_InicializarRecCotizados() //SA52045 - Ceiba/jjmonsal - 30-11-2015 
Return 1
end function

public function integer of_grabar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 26 de Septiembre de 2002 HORA 15:54:27:468
// 
// Retorna 1 si el proceso es exitoso
//-------------------------------------------------
//	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
//	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 10 de Noviembre de 2004.H:17:29
//---------------------------------------------------
//Modificaci$$HEX1$$f300$$ENDHEX$$n- Adici$$HEX1$$f300$$ENDHEX$$n de la actualizaci$$HEX1$$f300$$ENDHEX$$n de las actividades & m.p.base
//////////////////////////////////////////////////////////////////////////
Long		i,ll_tot, ll_muestrario,ll_error, ll_cantidad, ll_res, ll_respuesta, ll_nulo, &
			ll_estado,ll_color,ll_f,ll_talla, ll_nu_partemp,ll_nu_mp, ll_parte,ll_parte1, &
			ll_comb,ll_comb1,ll_talla1,ll_opcion,ll_color1,ll_opcion1
DateTime ldt_fecha
String 	ls_usuario,ls_instancia,ls_ref_ant,ls_error, ls_co_reccotnocierra, ls_de_recursonocierra, ls_co_reccotcierra, &
			ls_de_recursocierra, ls_diseno_muestra, ls_protect, ls_desarrollador, ls_observacion
Date 		ld_fecha_desarrollo
Boolean	lb_vacio
Integer  li_reg,li_reg2,li_cont
decimal  lde_peso
 
dwItemStatus			l_status_fabrica, l_status_linea, l_status_muestra, l_status_recurso, &
							l_status_muestrario, l_status_medidas_est, l_status_medidas_rep, l_status
DataWindowChild		ldc_diseno
n_cst_param 			lo_param
n_cst_comun 			lo_comun
n_cst_recurso			lnv_recurso 
uo_dsbase				lds_dt_est_col_mues
n_cst_estado_muestra	lo_estado

lnv_recurso = CREATE n_cst_recurso
SetNull(ll_nulo)
ls_observacion=""

If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If		

If isnull(il_recurso) Or il_recurso =-1 Then
	MessageBox("Advertencia!","Debe especificar el recurso",StopSign!)
	Return -1
End If

// Cuando la esta insertando el codigo de muestra es 0 y asigna un consecutivo
// el tipo es 25 para las muestras, se define con marta oct 4 de 2002
il_muestra_control=il_muestra

If il_muestra=0 Then
	If of_consecutivo()<>1 Then
		Return -1
	End If
	
	dw_muestra.SetItem(1,"co_muestra",il_muestra)

	// Si no tiene fecha de desarrollo se asigna la del sistema	
	ld_fecha_desarrollo=dw_muestra.GetItemDate(1,"fe_desarrollo")
	
	If IsNull(ld_fecha_desarrollo) Then
		dw_muestra.setItem(1,"fe_desarrollo",Date(ldt_fecha))
	end If	
	
End If 

ls_diseno_muestra = dw_muestra.GetItemString(1,'co_diseno_muestra')

If ( iSNull(ls_diseno_muestra) OR Trim(ls_diseno_muestra)  = '' ) THEN 
	If ( MessageBox('Atenci$$HEX1$$f300$$ENDHEX$$n','El c$$HEX1$$f300$$ENDHEX$$digo de dise$$HEX1$$f100$$ENDHEX$$o no ha sido especificado.'+ &
	     '$$HEX1$$bf00$$ENDHEX$$Desea crear uno Nuevo?',Question!,YesNo!,1) = 1 )  THEN 
		lo_param.is_vector[1] = Trim(dw_muestra.GetItemString(1,'de_muestra'))
		OpenWithParm(w_m_codigos_disenos,lo_param)
		
		lo_param = Message.PowerObjectParm
		If (IsValid(lo_param) ) THEN 
			IF UpperBound(lo_param.is_vector) > 0 THEN
				ls_diseno_muestra=lo_param.is_vector[1]
				dw_muestra.SetItem(1,'co_diseno_muestra',ls_diseno_muestra)
			END IF
		Else
			dw_muestra.SetFocus()
			dw_muestra.SetColumn('co_diseno_muestra')
			Return -1 
		End If
	Else
		dw_muestra.SetFocus()
		dw_muestra.SetColumn('co_diseno_muestra')
		Return -1		
	End If
	
End If 
/*
* ----------------------------------------------------------------------------
* MODIFICADO: Agosto 13 de 2012 - ohlondon
* ----------------------------------------------------------------------------
* Se debe quitar la validacion al momento de asociar el dise$$HEX1$$f100$$ENDHEX$$o a la muestra
* ----------------------------------------------------------------------------
	IF IsNumber(ls_diseno_muestra) THEN
		ll_res=lo_comun.of_validardiseno(il_muestra, ls_diseno_muestra, n_cst_application.itr_appl)	
		
		If ll_res = -1 Then
			//HUbo un error y ya lo mostro en of_validardiseno
			Return -1 
		ElseIf ll_res = 1 Then
			
			MessageBox("Advertencia!","El Dise$$HEX1$$f100$$ENDHEX$$o ya est$$HEX2$$e1002000$$ENDHEX$$asignado en otra muestra. Por favor verifique.",StopSign!)
			dw_muestra.SetItem(1,'co_diseno_muestra',' ')
			dw_muestra.SetFocus()
			dw_muestra.SetColumn('co_diseno_muestra')
			Return -1
		End If
	END IF
*/
///////////////////////////////////
l_status_fabrica	= dw_muestra.GetItemStatus(1,"co_fabrica",Primary!)
l_status_linea		= dw_muestra.GetItemStatus(1,"co_linea",Primary!)
l_status_muestra	= dw_muestra.GetItemStatus(1,"co_muestra",Primary!)
l_status_recurso	= dw_dt_muestras.GetItemStatus(1,"co_recurso",Primary!)
////////////////////////////////////
DECLARE pr_cunsulta_muestrario PROCEDURE FOR sp_muestrario_mues(:il_fabrica, :il_linea)
Using n_cst_application.itr_appl;

CLOSE pr_cunsulta_muestrario;


EXECUTE pr_cunsulta_muestrario;

ll_error = n_cst_application.itr_appl.SQLCode

IF n_cst_application.itr_appl.SQLCode < 0 THEN
	ls_error = n_cst_application.itr_appl.SQLErrText
	ROLLBACK Using n_cst_application.itr_appl;
	CLOSE pr_cunsulta_muestrario;

	MessageBox("Advertencia - Error de Base Datos","Error al ejecutar el procedimiento almacenado <sp_muestrario_mues> al consultar muestrario vigente"+&
			"~n~nError : "+ String(ll_error) + " - "+ trim(ls_error) + "~n~nConsulte con el administrador del sistema",StopSign!)
	Return -1
End If

FETCH pr_cunsulta_muestrario INTO :ll_muestrario ;

ll_error = n_cst_application.itr_appl.SQLCode
IF ll_error < 0 THEN
	ls_error = n_cst_application.itr_appl.SQLErrText
	CLOSE pr_cunsulta_muestrario;
	ROLLBACK;
	MessageBox("Advertencia - Error de Base de Datos","Error en la lectura de los datos en la ejecuci$$HEX1$$f300$$ENDHEX$$n del procedimiento <sp_muestrario_mues>"+&
		"~n~nError: "+ String(ll_error) + " - "+ trim(ls_error) +"~n~nConsulte con el Administrador del Sistema",StopSign!)			
	Return -1
End If

////////////////////////////////////////
ll_tot=dw_dt_muestras.RowCount()

FOR i=1 TO ll_tot		
	dw_dt_muestras.SetItem(i,"co_fabrica",il_fabrica)
	dw_dt_muestras.SetItem(i,"co_linea",il_linea)
	dw_dt_muestras.SetItem(i,"co_muestra",il_muestra)
	
	ls_co_reccotnocierra = TRIM(String(dw_dt_muestras.object.co_reccotnocierra[i],''))
	ls_de_recursonocierra = TRIM(String(dw_dt_muestras.object.de_recursonocierra[i],''))
	ls_co_reccotcierra = TRIM(String(dw_dt_muestras.object.co_reccotcierra[i],''))
	ls_de_recursocierra = TRIM(String(dw_dt_muestras.object.de_recursocierra[i],''))
	
	IF ls_co_reccotnocierra = '' OR ls_de_recursonocierra = '' THEN
		IF ls_co_reccotcierra = '' OR ls_de_recursocierra = '' THEN
			MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','Se debe digitar al menos un recurso cotizado',Exclamation!)
			RETURN -1
		END IF
	END IF 	

	l_status = dw_dt_muestras.GetItemStatus(i, "co_recurso", Primary!)

	IF l_status = datamodified! THEN
		IF (ls_co_reccotnocierra <> '' AND ls_de_recursonocierra <> '') OR (ls_co_reccotcierra <> '' AND  ls_de_recursocierra <> '') THEN
			IF ls_co_reccotnocierra = TRIM(String(dw_dt_muestras.object.co_recurso[i],'')) OR ls_co_reccotcierra = TRIM(String(dw_dt_muestras.object.co_recurso[i],'')) THEN
				lb_vacio = TRUE						
			ELSE
				ll_respuesta = MessageBox('Cambio de Recurso','Desea Cambiar el recurso Cotizado?',Information!,YesNo!)	
				lb_vacio = FALSE
			END IF
		ELSE
			lb_vacio = TRUE
		END IF
		
		dataStore  lds_valdiseno
		lds_valdiseno		= CREATE datastore
		
		
		lds_valdiseno.dataobject = 'd_validadiseno'
		lds_valdiseno.settransobject( n_cst_application.itr_appl)
		lds_valdiseno.retrieve(il_muestra,il_recurso)
		
		
//		IF lds_valdiseno.Rowcount( ) > 0 THEN 
//			IF lds_valdiseno.object.co_diseno[1] <> 1 THEN
//				MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','El recurso ingresado ya ha sido utilizado por favor verificar la informacion.',Exclamation!)
//				RETURN -1
//			END IF
//			
//		END IF

	
	
		IF ll_respuesta = 1 OR lb_vacio THEN
			IF lnv_recurso.of_validar_cierra_nocierra( Long(il_recurso)) > 0 THEN			
				IF lnv_recurso.of_Get_cierra() THEN
						dw_dt_muestras.Object.co_reccotcierra[i] = il_recurso
						dw_dt_muestras.Object.de_recursocierra[i] = dw_dt_muestras.Object.de_recurso[i]
					ELSE
						dw_dt_muestras.Object.co_reccotnocierra[i] = il_recurso
						dw_dt_muestras.Object.de_recursonocierra[i] = dw_dt_muestras.Object.de_recurso[i]
					END IF
				END IF
			END IF
		END IF



	dwItemStatus l_statusRecursoCierra,l_statusRecursoNoCierra
	l_statusRecursoCierra = dw_dt_muestras.GetItemStatus(i, "co_reccotcierra", Primary!)
	l_statusRecursoNoCierra = dw_dt_muestras.GetItemStatus(i, "co_reccotnocierra", Primary!)
	
	//se hace el envio del mail para avisar que se cambio los datos de la muestra para 
	//cuando ya fue convertida a referencia.
	/***********************************************************
	SA52045 - Ceiba/jjmonsal - 30-11-2015
	Comentario:Modificacion Correo automatico desde Muestras
	***********************************************************/
	IF (l_statusRecursoCierra = datamodified!) OR (l_statusRecursoNoCierra = datamodified!) THEN
		of_cargarInfoReporteRecCotizado(l_statusRecursoCierra,l_statusRecursoNoCierra) //SA52045 - Ceiba/jjmonsal - 30-11-2015
		//	of_mail_cambio()
	END IF
	
	IF l_statusRecursoCierra = datamodified! THEN
		IF IsNull(dw_dt_muestras.Object.CO_ESTRECCIERRA[1]) THEN
			dw_dt_muestras.Object.CO_ESTRECCIERRA[1] = 1
		ELSE
			IF dw_dt_muestras.Object.CO_ESTRECCIERRA[1] = 2 THEN
				dw_dt_muestras.Object.CO_ESTRECCIERRA[1] = 3
			ELSE
				dw_dt_muestras.Object.CO_ESTRECCIERRA[1] = 1
			END IF
		END IF
	END IF
			
	IF l_statusRecursoNoCierra = datamodified! THEN
		IF IsNull(dw_dt_muestras.Object.CO_ESTRECNOCIERRA[1]) THEN
			dw_dt_muestras.Object.CO_ESTRECNOCIERRA[1] = 1
		ELSE
			IF dw_dt_muestras.Object.CO_ESTRECNOCIERRA[1] = 2 THEN
				dw_dt_muestras.Object.CO_ESTRECNOCIERRA[1] = 3
			ELSE
				dw_dt_muestras.Object.CO_ESTRECNOCIERRA[1] = 1
			END IF
		END IF
	END IF
NEXT

//Colores por talla
dw_dt_muestras_col.setFilter("")
dw_dt_muestras_col.filter()
ll_tot=dw_dt_muestras_col.RowCount()

lds_dt_est_col_mues=Create uo_dsbase
lds_dt_est_col_mues.DataObject="d_dt_est_col_mues"
lds_dt_est_col_mues.SetTransObject(n_cst_application.itr_appl)

For i=1 To ll_tot
	dw_dt_muestras_col.SetItem(i,"co_fabrica",il_fabrica)
	dw_dt_muestras_col.SetItem(i,"co_linea",il_linea)
	dw_dt_muestras_col.SetItem(i,"co_muestra",il_muestra)
	
	//Si son registros nuevos, hay que ingresar en el detalle de estados en 1
	IF dw_dt_muestras_col.GetItemStatus(i,0,primary!)=New! Or &
	   dw_dt_muestras_col.GetItemStatus(i,0,primary!)=NewModified!	Then
		
		ll_estado=dw_dt_muestras_col.GetItemNumber(i,"co_estado")		
		ll_color=dw_dt_muestras_col.GetItemNumber(i,"co_color")		
		ll_talla=dw_dt_muestras_col.GetItemNumber(i,"co_talla")
		
		If ll_estado=1 Then
			ll_f=lds_dt_est_col_mues.InsertRow(0)
			lds_dt_est_col_mues.SetItem(ll_f,"co_fabrica",il_fabrica)
			lds_dt_est_col_mues.SetItem(ll_f,"co_linea",il_linea)
			lds_dt_est_col_mues.SetItem(ll_f,"co_muestra",il_muestra)
			lds_dt_est_col_mues.SetItem(ll_f,"co_talla",ll_talla)
			lds_dt_est_col_mues.SetItem(ll_f,"co_color",ll_color)
			lds_dt_est_col_mues.SetItem(ll_f,"co_estado",1)
			lds_dt_est_col_mues.SetItem(ll_f,"consecutivo",1)
		End If
	ELSE		
	END If
NEXT

//Paso las observaciones al dw_definitivo
For i=1 to 12
	ls_observacion+=of_espacios( dw_observacion.GetItemString(i,1),60)
Next

dw_muestra.SetItem(1,"de_observacion",ls_observacion)

//En la materia prima se debe actualizar nu_partemp, nu_mp
dw_mat_prima.setFilter("")
dw_mat_prima.Filter()

dw_mat_prima.Sort()

ll_tot=dw_mat_prima.RowCount()
ll_nu_partemp=1
ll_nu_mp=1

For i=1 To ll_tot
	dw_mat_prima.SetItem(i,"co_fabrica",il_fabrica)
	dw_mat_prima.SetItem(i,"co_linea",il_linea)
	dw_mat_prima.SetItem(i,"co_muestra",il_muestra)
	
	ll_parte=dw_mat_prima.GetItemNumber(i,"co_partemp")
	ll_comb=dw_mat_prima.GetItemNumber(i,"co_combinacion")
	
	ll_talla=dw_mat_prima.GetItemNumber(i,"co_talla")
	ll_color=dw_mat_prima.GetItemNumber(i,"co_color")
	ll_opcion=dw_mat_prima.GetItemNumber(i,"co_diseno")
   //SA56750 - Ceiba reariase - 30/06/2017
   lde_peso = dw_mat_prima.getitemdecimal(i,"peso_mp")
	If IsNull(lde_peso) Then 
		MessageBox("Advertencia!","El peso no puede ser Nulo.",StopSign!)
		Return -1
	End If
	//Fin SA56750
	
	If IsNull(ll_comb) Then
		ll_comb=-1
	End If

	If i>1 Then
		ll_parte1=dw_mat_prima.GetItemNumber(i -1,"co_partemp")
		ll_comb1=dw_mat_prima.GetItemNumber(i -1,"co_combinacion")

		ll_talla1=dw_mat_prima.GetItemNumber(i -1,"co_talla")
		ll_color1=dw_mat_prima.GetItemNumber(i -1,"co_color")
		ll_opcion1=dw_mat_prima.GetItemNumber(i -1,"co_diseno")

		If IsNull(ll_comb1) Then
			ll_comb1=-1
		End If
		
		If Not(ll_talla=ll_talla1 and &
		   ll_color=ll_color1 and ll_opcion=ll_opcion1) Then
			
			ll_nu_partemp=1
			ll_nu_mp=1
			
		ElseIf ll_parte=ll_parte1 and ll_comb=ll_comb1 Then 
			ll_nu_mp++
		Else
			ll_nu_mp=1
			ll_nu_partemp++
		End If
	End If
	
	dw_mat_prima.SetItem(i,"nu_partemp",ll_nu_partemp)
	dw_mat_prima.SetItem(i,"nu_mp",ll_nu_mp)
	
Next

//Asigno valores para los campos ocultos
tab_medidas.tabpage_operaciones.dw_operaciones_mue.setFilter("")
tab_medidas.tabpage_operaciones.dw_operaciones_mue.Filter()

ll_tot=tab_medidas.tabpage_operaciones.dw_operaciones_mue.RowCount()
tab_medidas.tabpage_operaciones.cb_1.Trigger Event Clicked()

//IF (l_status_fabrica <> Notmodified!) OR (l_status_linea <> Notmodified!) OR (l_status_muestra <> Notmodified!) THEN
	
	For i=1 To ll_tot
		tab_medidas.tabpage_operaciones.dw_operaciones_mue.SetItem(i,"co_fabrica",il_fabrica)
		tab_medidas.tabpage_operaciones.dw_operaciones_mue.SetItem(i,"co_linea",il_linea)
		tab_medidas.tabpage_operaciones.dw_operaciones_mue.SetItem(i,"co_muestra",il_muestra)	
	Next

//END IF

tab_medidas.tabpage_actividades.dw_actividad_muestra.setFilter("")
tab_medidas.tabpage_actividades.dw_actividad_muestra.Filter()

ll_tot=tab_medidas.tabpage_actividades.dw_actividad_muestra.RowCount()
tab_medidas.tabpage_actividades.cb_orden_act.Trigger Event Clicked()

//IF (l_status_fabrica <> Notmodified!) OR (l_status_linea <> Notmodified!) OR (l_status_muestra <> Notmodified!) THEN
	
	For i=1 To ll_tot
		tab_medidas.tabpage_actividades.dw_actividad_muestra.SetItem(i,"co_fabrica",il_fabrica)
		tab_medidas.tabpage_actividades.dw_actividad_muestra.SetItem(i,"co_linea",il_linea)
		tab_medidas.tabpage_actividades.dw_actividad_muestra.SetItem(i,"co_muestra",il_muestra)
	Next

//END IF

//tab_medidas.tabpage_mp_base.dw_mp_base.setFilter("")
//tab_medidas.tabpage_mp_base.dw_mp_base.Filter()

ll_tot=tab_medidas.tabpage_mp_base.dw_mp_base.RowCount()

//IF (l_status_fabrica <> Notmodified!) OR (l_status_linea <> Notmodified!) OR (l_status_muestra <> Notmodified!) THEN

	For i=1 To ll_tot
		tab_medidas.tabpage_mp_base.dw_mp_base.SetItem(i,"co_fabrica",il_fabrica)
		tab_medidas.tabpage_mp_base.dw_mp_base.SetItem(i,"co_linea",il_linea)
		tab_medidas.tabpage_mp_base.dw_mp_base.SetItem(i,"co_muestra",il_muestra)
	Next

//END IF
ll_tot=tab_medidas.tabpage_diseno.dw_mu_dt_diseno.RowCount()

//IF (l_status_fabrica <> Notmodified!) OR (l_status_linea <> Notmodified!) OR (l_status_muestra <> Notmodified!) THEN

	For i=1 To ll_tot
		tab_medidas.tabpage_diseno.dw_mu_dt_diseno.SetItem(i,"co_fabrica",il_fabrica)
		tab_medidas.tabpage_diseno.dw_mu_dt_diseno.SetItem(i,"co_linea",il_linea)
		tab_medidas.tabpage_diseno.dw_mu_dt_diseno.SetItem(i,"co_muestra",il_muestra)
	Next
//END IF

ll_tot=tab_medidas.tabpage_diseno.dw_mu_dt_largo.RowCount()

//IF (l_status_fabrica <> Notmodified!) OR (l_status_linea <> Notmodified!) OR (l_status_muestra <> Notmodified!) THEN
	For i=1 To ll_tot
		tab_medidas.tabpage_diseno.dw_mu_dt_largo.SetItem(i,"co_fabrica",il_fabrica)
		tab_medidas.tabpage_diseno.dw_mu_dt_largo.SetItem(i,"co_linea",il_linea)
		tab_medidas.tabpage_diseno.dw_mu_dt_largo.SetItem(i,"co_muestra",il_muestra)
	Next
//END IF

ll_tot=tab_medidas.tabpage_diseno.dw_mu_dt_puno.RowCount()

//IF (l_status_fabrica <> Notmodified!) OR (l_status_linea <> Notmodified!) OR (l_status_muestra <> Notmodified!) THEN

	For i=1 To ll_tot
		tab_medidas.tabpage_diseno.dw_mu_dt_puno.SetItem(i,"co_fabrica",il_fabrica)
		tab_medidas.tabpage_diseno.dw_mu_dt_puno.SetItem(i,"co_linea",il_linea)
		tab_medidas.tabpage_diseno.dw_mu_dt_puno.SetItem(i,"co_muestra",il_muestra)
	Next
//END IF

//******************************************************************************************>
//tab_medidas.tabpage_1.dw_medidas1.SetFilter("")
//tab_medidas.tabpage_1.dw_medidas1.Filter()

ll_tot=tab_medidas.tabpage_1.dw_medidas1.RowCount()

//IF (l_status_fabrica <> Notmodified!) OR (l_status_linea <> Notmodified!) OR (l_status_muestra <> Notmodified!) OR  (l_status_recurso <> Notmodified!) THEN
	For i=1 To ll_tot
		l_status_medidas_est = tab_medidas.tabpage_1.dw_medidas1.GetItemStatus(i,0,Primary!)
		IF l_status_medidas_est = New! OR l_status_medidas_est = NewModified! THEN
			tab_medidas.tabpage_1.dw_medidas1.SetItem(i,"co_fabrica",il_fabrica)
			tab_medidas.tabpage_1.dw_medidas1.SetItem(i,"co_linea",il_linea)
			tab_medidas.tabpage_1.dw_medidas1.SetItem(i,"co_muestra",il_muestra)
			tab_medidas.tabpage_1.dw_medidas1.SetItem(i,"co_recurso",il_recurso)		
		END IF	
	Next
//END IF

//tab_medidas.tabpage_2.dw_med_rep.SetFilter("")
//tab_medidas.tabpage_2.dw_med_rep.Filter()

ll_tot=tab_medidas.tabpage_2.dw_med_rep.RowCount()

//IF (l_status_fabrica <> Notmodified!) OR (l_status_linea <> Notmodified!) OR (l_status_muestra <> Notmodified!) OR (l_status_recurso <> Notmodified!) THEN
	For i=1 To ll_tot
		l_status_medidas_rep = tab_medidas.tabpage_2.dw_med_rep.GetItemStatus(i,0,Primary!)
		IF l_status_medidas_rep = New! OR l_status_medidas_rep = NewModified! THEN
			tab_medidas.tabpage_2.dw_med_rep.SetItem(i,"co_fabrica",il_fabrica)
			tab_medidas.tabpage_2.dw_med_rep.SetItem(i,"co_linea",il_linea)
			tab_medidas.tabpage_2.dw_med_rep.SetItem(i,"co_muestra",il_muestra)
			tab_medidas.tabpage_2.dw_med_rep.SetItem(i,"co_recurso",il_recurso)		
		END IF	
	Next
//END IF
//2015-06-16 Solicitud: 51249 Ceiba/JJ - 51249
IF ib_cambios_medReposadas THEN of_AbrirVentanaSeleccionRecursosACopiar()
//////////////////////////////////////////////////////////////////////////
// Coloca fabrica, linea, muestra en el detalle de materia prima
// 
//////////////////////////////////////////////////////////////////////////
dw_h_fmp_muestras.setFilter("")
dw_h_fmp_muestras.Filter()

//dw_h_fmp_muestras.accepttext( )

ll_tot=dw_h_fmp_muestras.RowCount()

for i=1 To ll_tot
	//IF (l_status_fabrica <> Notmodified!) OR (l_status_linea <> Notmodified!) OR (l_status_muestra <> Notmodified!) OR (l_status_recurso <> Notmodified!) THEN
	dw_h_fmp_muestras.SetItem(i,"co_fabrica",il_fabrica)
	dw_h_fmp_muestras.SetItem(i,"co_linea",il_linea)
	dw_h_fmp_muestras.SetItem(i,"co_muestra",il_muestra)	
	//dw_h_fmp_muestras.SetItem(i,"co_recurso",il_recurso)	
	/*
	* ---------------------------------------------------------------------------
	* MODIFICADO: Julio 13 de 2010 - gagudelo - ohlondon
	* ---------------------------------------------------------------------------
	* Solo puede actualizar el recurso de la muestra en el dise$$HEX1$$f100$$ENDHEX$$o 1
	* ---------------------------------------------------------------------------
	*/
	IF dw_h_fmp_muestras.GetItemNumber(i, 'co_diseno') = 1 THEN
		dw_h_fmp_muestras.SetItem(i,"co_recurso",il_recurso)
	END IF
	//END IF
	//l_status_muestrario = dw_h_fmp_muestras.getitemstatus( i ,"co_muestrario",primary!)
	
	ls_protect = dw_h_fmp_muestras.Describe("Evaluate(~"If(IsRowNew(), 0, 1)~"," + String(i) + ")"  )
	
	IF (ls_protect = "0") THEN
		dw_h_fmp_muestras.SetItem(i,"co_muestrario",ll_muestrario)					
	END IF	
Next

dw_combinacion.SetFilter("")
dw_combinacion.Filter()

ll_tot=dw_combinacion.RowCount()

//IF (l_status_fabrica <> Notmodified!) OR (l_status_linea <> Notmodified!) OR (l_status_muestra <> Notmodified!) THEN
	for i=1 To ll_tot
		dw_combinacion.SetItem(i,"co_fabrica",il_fabrica)
		dw_combinacion.SetItem(i,"co_linea",il_linea)
		dw_combinacion.SetItem(i,"co_muestra",il_muestra)	
	Next
//END IF
	
//////////////////////////////////////////////////////////////////////////
// Dejo el manejo de la integridad para que lo controle el motor hasta
// el final.
//////////////////////////////////////////////////////////////////////////

If dw_muestra.GetItemStatus(i,0,primary!)=New! Or dw_muestra.GetItemStatus(i,0,primary!)=NewModified!	Then
	dw_dt_muestras.Object.co_estreccierra[1] = 1
	dw_dt_muestras.Object.co_estrecnocierra[1] = 1
/*ELSE
	dw_dt_muestras.Object.co_estreccierra[1] = 3
	dw_dt_muestras.Object.co_estrecnocierra[1] = 3	*/
END IF


EXECUTE IMMEDIATE "SET CONSTRAINTS ALL DEFERRED"
USING n_cst_application.itr_appl;
 
If n_cst_application.itr_appl.SQLcode=-1 Then 
 PopulateError(20,"SQL Error")
 n_cst_application.of_sql_error(n_cst_application.itr_appl)
 Return -1
End If


If dw_muestra.Update(true,false)<>1 Then 
	of_error_muestra()
	Return -1
End If

If dw_dt_muestras.Update(true,false)<>1 Then 
	of_error_muestra()
	Return -1
End If

If tab_medidas.tabpage_1.dw_medidas1.Update(true,false)<>1 Then 
	of_error_muestra()
	Return -1
End If

If tab_medidas.tabpage_2.dw_med_rep.Update(true,false)<>1 Then 
	of_error_muestra()
	Return -1
End If
//<**************************************************************************************
/*
* MODIFICADO: OJOOOOOO HABILITADO Agosto 24 de 2009 - gagudelo - ohlondon
* Es necesario guardar la relacion operaciones muestra.
*/
If tab_medidas.tabpage_operaciones.dw_operaciones_mue.Update(true,false)<>1 Then 
	of_error_muestra()
	Return -1
End If


If tab_medidas.tabpage_actividades.dw_actividad_muestra.Update(true,false)<>1 Then 
	of_error_muestra()
	Return -1
End If

If tab_medidas.tabpage_mp_base.dw_mp_base.Update(true,false)<>1 Then 
	of_error_muestra()
	Return -1
End If

If tab_medidas.tabpage_diseno.dw_mu_dt_diseno.Update(true,false)<>1 Then 
	of_error_muestra()
	Return -1
End If

If tab_medidas.tabpage_diseno.dw_mu_dt_largo.Update(true,false)<>1 Then 
	of_error_muestra()
	Return -1
End If

If tab_medidas.tabpage_diseno.dw_mu_dt_puno.Update(true,false)<>1 Then 
	of_error_muestra()
	Return -1
End If

If tab_medidas.tabpage_3.dw_referencias.Update(true,false)<>1 Then 
	of_error_muestra()
	Return -1
End If

//**************************************************************************************>
//////////////////////////////////////////////////////////////////////////
// Cuando se crea la muestra se ingresa el dise$$HEX1$$f100$$ENDHEX$$o 1
// con el mismo dise$$HEX1$$f100$$ENDHEX$$o de la muestra en m_disenos_muestras
//////////////////////////////////////////////////////////////////////////

If of_insertarDiseno()<>1 Then
	of_error_muestra()
	Return -1
End If

	
If dw_dt_muestras_col.Update(true,false)<>1 Then 
	of_error_muestra()
	Return -1
End If
	
If dw_h_fmp_muestras.Update(true,false)<>1 Then 
	of_error_muestra()
	Return -1
End If
	
If dw_combinacion.Update(true,false)<>1 Then 
	of_error_muestra()
	Return -1
End If

If dw_mat_prima.Update(true,false)<>1 Then 
	of_error_muestra()
	Return -1
End If

Commit Using n_cst_application.itr_appl;

// Se actualiza la insercion del estado inicial del color, cuando son nuevos 
//If lds_1.Update(true,false)<>1 Then => ahora es lds_dt_est_col_mues
//	RollBack Using n_cst_application.itr_appl;
//	Return -1
//End If

wf_RecorrerDatosEliminados_Est_Color_Mue()//SA55400 - Ceiba/jjmonsal - 17-08-2016

ll_tot=lds_dt_est_col_mues.RowCount()

ls_desarrollador=dw_muestra.GetItemString(1,"desarrollador")

For i=1 To ll_tot
	ll_color=lds_dt_est_col_mues.GetItemNumber(i,"co_color")
	ll_talla=lds_dt_est_col_mues.GetItemNumber(i,"co_talla")
	
	ll_res=lo_estado.of_mover(il_fabrica,il_linea,il_muestra,ll_talla,&
								 ll_color,1,ls_desarrollador,"")
								 
	If ll_res=-1 Then
		of_error_muestra()
		MessageBox("Advertencia!","El color "+String(ll_color)+&
		" No se puedo mover adecuadamente.",StopSign!)
		Return -1
	End If

	If ll_res=-2 Then
		of_error_muestra()
		MessageBox("Advertencia!","El funcionario "+&
		"No esta autorizado para el registro de muestras.",StopSign!)
		Return -1
	End If

	If ll_res=-3 Then
		of_error_muestra()
		MessageBox("Advertencia!","La muestra est$$HEX2$$e1002000$$ENDHEX$$rechazada y no se puede cambiar.",StopSign!)
		Return -1
	End If	
Next

//SA56750 - Ceiba/reariase - 17/05/2017	

SELECT Count(*)
INTO   :li_cont
FROM   tmp_dt_fmp_muestras
WHERE  co_muestra = :il_muestra
using n_cst_application.itr_appl;

IF li_cont > 0 THEN
	// Borrar la tabla temporal de muestras
	DELETE FROM	tmp_dt_fmp_muestras
	WHERE  co_muestra = :il_muestra
	using n_cst_application.itr_appl;
END IF

//Fin SA56750

Commit Using n_cst_application.itr_appl;

If n_cst_application.itr_appl.SQLcode=-1 Then 
 PopulateError(20,"SQL Error")
 n_cst_application.of_sql_error(n_cst_application.itr_appl)
 Return -1
End If

dw_muestra.ResetUpdate()
dw_dt_muestras.ResetUpdate()
dw_dt_muestras_col.ResetUpdate()
tab_medidas.tabpage_1.dw_medidas1.ResetUpdate()
tab_medidas.tabpage_2.dw_med_rep.ResetUpdate()
tab_medidas.tabpage_operaciones.dw_operaciones_mue.ResetUpdate()
tab_medidas.tabpage_actividades.dw_actividad_muestra.ResetUpdate()
tab_medidas.tabpage_mp_base.dw_mp_base.ResetUpdate()

dw_h_fmp_muestras.ResetUpdate()
dw_mat_prima.ResetUpdate()

dw_muestra.getChild("co_diseno_muestra",ldc_diseno)

lo_comun.of_loaddddw (ldc_diseno,n_cst_application.itr_appl)
ldc_diseno.InsertRow(1)
ldc_diseno.SetItem(1, 'de_diseno', '')
ldc_diseno.SetItem(1, 'descripcion', '')

ib_grabado = TRUE

Return 1
end function

public function integer of_validar ();String ls_forma_tejer, ls_display, ls_diseno_muestra
Long ll_recurso_rest, ll_muestra, ll_res, ll_tot,i,ll_col,ll_col1,ll_tal,ll_pos,ll_tal1,ll_parte,ll_parte1,j, ll_find
long ll_recurso,ll_recurso1, ll_ejecutiva,ll_MU_EJECUTIVA, ll_crudo, ll_f,ll_color,ll_opcion
dwItemStatus ldws_status
n_cst_param lo_param
n_cst_comun lo_comun
n_cst_comun lo_c

If dw_muestra.RowCount()=0 Then
	Return -1
End If

If dw_muestra.AcceptText()<>1 Then
	Trigger Event Key(Key1!,1)
	MessageBox("Advertencia!","Datos de la muestra no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If dw_dt_muestras.AcceptText()<>1 Then
	of_scroll(0)
	dw_dt_muestras.Setfocus()
	MessageBox("Advertencia!","Datos de muestra no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If dw_dt_muestras.RowCount()=0 Then
	Return -1
End If

If dw_dt_muestras_col.RowCount()<1 Then
	Trigger Event Key(Key4!,1)

	MessageBox("Advertencia!","La muestra debe tener por lo menos un color.",StopSign!)
	Return -1
End If
If dw_dt_muestras_col.AcceptText()<>1 Then
	Trigger Event Key(Key4!,1)
	
	MessageBox("Advertencia!","Datos de colores no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If dw_observacion.AcceptText()<>1 Then
	Trigger Event Key(Key7!,1)
	MessageBox("Advertencia!","Observaciones de muestra no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If tab_medidas.tabpage_1.dw_medidas1.AcceptText()<1 Then
	Trigger Event Key(Key2!,1)
	MessageBox("Advertencia!","Medidas no v$$HEX1$$e100$$ENDHEX$$lidas.",StopSign!)
	Return -1
End If

If tab_medidas.tabpage_2.dw_med_rep.AcceptText()<>1 Then
	Trigger Event Key(Key3!,1)
	MessageBox("Advertencia!","Medidas no v$$HEX1$$e100$$ENDHEX$$lidas.",StopSign!)
	Return -1
End If
//************************************************************
If tab_medidas.tabpage_actividades.dw_actividad_muestra.AcceptText()<>1 Then
	of_scroll(4)
	tab_medidas.tabpage_actividades.dw_actividad_muestra.SetFocus()
	tab_medidas.SelectTab(tab_medidas.tabpage_actividades)	
	Return -1
End If

If tab_medidas.tabpage_operaciones.dw_operaciones_mue.AcceptText()<>1 Then
	of_scroll(4)
	tab_medidas.tabpage_operaciones.dw_operaciones_mue.SetFocus()
	tab_medidas.SelectTab(tab_medidas.tabpage_operaciones)	
	Return -1
End If

If tab_medidas.tabpage_mp_base.dw_mp_base.AcceptText()<>1 Then
	of_scroll(4)
	tab_medidas.tabpage_mp_base.dw_mp_base.SetFocus()
	tab_medidas.SelectTab(tab_medidas.tabpage_mp_base)	
	Return -1
End If

If tab_medidas.tabpage_3.dw_referencias.AcceptText()<>1 Then
	of_scroll(4)
	tab_medidas.tabpage_3.dw_referencias.SetFocus()
	tab_medidas.SelectTab(tab_medidas.tabpage_3)	
	Return -1
End If

If tab_medidas.tabpage_diseno.dw_mu_dt_diseno.AcceptText()<>1 Then
	of_scroll(4)
	tab_medidas.tabpage_diseno.dw_mu_dt_diseno.SetFocus()
	tab_medidas.SelectTab(tab_medidas.tabpage_diseno)	
	Return -1
End If

If tab_medidas.tabpage_diseno.dw_mu_dt_largo.AcceptText()<>1 Then
	of_scroll(4)
	tab_medidas.tabpage_diseno.dw_mu_dt_largo.SetFocus()
	tab_medidas.SelectTab(tab_medidas.tabpage_diseno)	
	Return -1
End If

If tab_medidas.tabpage_diseno.dw_mu_dt_puno.AcceptText()<>1 Then
	of_scroll(4)
	tab_medidas.tabpage_diseno.dw_mu_dt_puno.SetFocus()
	tab_medidas.SelectTab(tab_medidas.tabpage_diseno)	
	Return -1
End If

//************************************************************
// 19-01-2009
ls_forma_tejer = dw_muestra.getitemstring(1,"bpl_co_tipoprod") 
if isnull (ls_forma_tejer) or trim(ls_forma_tejer) = '' THEN
	Messagebox("Advertencia","Debe seleccionar la Forma de tejer")
	Return -1
End if	

//ll_recurso_rest = dw_dt_muestras.getitemNumber(1,"id_rec_rest") 
//if isnull (ll_recurso_rest) THEN
//	Messagebox("Advertencia","Debe digitar el recurso m$$HEX1$$ed00$$ENDHEX$$nimo")
//	Return -1
//End if	

//************************************************************

If dw_h_fmp_muestras.AcceptText()<>1 Then
	Trigger Event Key(Key6!,1)
	MessageBox("Advertencia!","Datos de materia prima no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If dw_mat_prima.AcceptText()<>1 Then
	Trigger Event Key(Key6!,1)
	MessageBox("Advertencia!","Datos de materia prima no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

// Nov 24 de 2010,  
ls_diseno_muestra = dw_muestra.GetItemString(1,'co_diseno_muestra')

If ( iSNull(ls_diseno_muestra) OR Trim(ls_diseno_muestra)  = '' ) THEN 
	If ( MessageBox('Atenci$$HEX1$$f300$$ENDHEX$$n','El c$$HEX1$$f300$$ENDHEX$$digo de dise$$HEX1$$f100$$ENDHEX$$o no ha sido especificado.'+ &
	     '$$HEX1$$bf00$$ENDHEX$$Desea crear uno Nuevo?',Question!,YesNo!,1) = 1 )  THEN 
		lo_param.is_vector[1] = Trim(dw_muestra.GetItemString(1,'de_muestra'))
		OpenWithParm(w_m_codigos_disenos,lo_param)
		
		lo_param = Message.PowerObjectParm
		If (IsValid(lo_param) ) THEN 
			ls_diseno_muestra=lo_param.is_vector[1]
			dw_muestra.SetItem(1,'co_diseno_muestra',ls_diseno_muestra)
		Else
			dw_muestra.SetFocus()
			dw_muestra.SetColumn('co_diseno_muestra')
			Return -1 
		End If
	Else
		dw_muestra.SetFocus()
		dw_muestra.SetColumn('co_diseno_muestra')
		Return -1		
	End If
End If
ll_muestra = dw_muestra.GetItemNumber(1,'co_muestra')

/*
* ----------------------------------------------------------------------------
* MODIFICADO: Agosto 13 de 2012 - ohlondon
* ----------------------------------------------------------------------------
* Se debe quitar la validacion al momento de asociar el dise$$HEX1$$f100$$ENDHEX$$o a la muestra
* ----------------------------------------------------------------------------
//
// MODIFICADO: Diciembre 21 de 2011 - ohlondon
// No debe validar el dise$$HEX1$$f100$$ENDHEX$$o cuando es fabrica 5

IF il_fabrica <> 5 THEN

	IF IsNumber(ls_diseno_muestra) THEN
		ll_res     = lo_comun.of_validardiseno(ll_muestra, ls_diseno_muestra, n_cst_application.itr_appl)
		
		If ll_res = -1 Then
			//HUbo un error y ya lo mostro en of_validardiseno
			SetNUll(ll_res)
			of_scroll(0)
			dw_muestra.SetItem(1,'co_diseno_muestra',ll_res)
			dw_muestra.SetFocus()
			dw_muestra.SetColumn('co_diseno_muestra')
			Return -1
		ElseIf ll_res = 1 Then
			SetNUll(ll_res)
			MessageBox("Advertencia!","El Dise$$HEX1$$f100$$ENDHEX$$o ya est$$HEX2$$e1002000$$ENDHEX$$asignado en otra muestra. Por favor verifique.",StopSign!)
			of_scroll(0)
			dw_muestra.SetItem(1,'co_diseno_muestra',ll_res)
			dw_muestra.SetFocus()
			dw_muestra.SetColumn('co_diseno_muestra')
			Return -1
		End If
	END IF
END IF
	*/	
// ---------------------------------------------------------------------------

If Not dw_muestra.of_completedata() Then
	of_scroll(0)
	Return -1
End If

If Not dw_dt_muestras.of_completedata() Then
	of_scroll(0)
	Return -1
End If

If Not dw_dt_muestras_col.of_completedata() Then
	of_scroll(0)
	Return -1
End If



//************************************************************
If Not tab_medidas.tabpage_actividades.dw_actividad_muestra.of_completedata() Then
	of_scroll(4)
	tab_medidas.tabpage_actividades.dw_actividad_muestra.SetFocus()
	tab_medidas.SelectTab(tab_medidas.tabpage_actividades)	
	Return -1
End If

If Not tab_medidas.tabpage_operaciones.dw_operaciones_mue.of_completedata() Then
	of_scroll(4)
	tab_medidas.tabpage_operaciones.dw_operaciones_mue.SetFocus()
	tab_medidas.SelectTab(tab_medidas.tabpage_operaciones)	
	Return -1
End If

If Not tab_medidas.tabpage_mp_base.dw_mp_base.of_completedata() Then
	of_scroll(4)
	tab_medidas.tabpage_mp_base.dw_mp_base.SetFocus()
	tab_medidas.SelectTab(tab_medidas.tabpage_mp_base)	
	Return -1
End If

If Not tab_medidas.tabpage_3.dw_referencias.of_completedata() Then
	of_scroll(4)
	tab_medidas.tabpage_3.dw_referencias.SetFocus()
	tab_medidas.SelectTab(tab_medidas.tabpage_3)	
	Return -1
End If

If Not tab_medidas.tabpage_diseno.dw_mu_dt_diseno.of_completedata() Then
	of_scroll(4)
	tab_medidas.tabpage_diseno.dw_mu_dt_diseno.SetFocus()
	tab_medidas.SelectTab(tab_medidas.tabpage_diseno)	
	Return -1
End If

//valida que tenga datos el campo largo cuand co_tipoprod <> 20 CRYSTAL ROPA
If dw_muestra.getitemNumber(1,"co_tipoprod") <> 20 Then
	If tab_medidas.tabpage_diseno.dw_mu_dt_largo.RowCount() = 0 Then
		of_scroll(4)
		tab_medidas.tabpage_diseno.dw_mu_dt_largo.SetFocus()
		tab_medidas.SelectTab(tab_medidas.tabpage_diseno)	
		MessageBox("Advertencia!","Falta por ingresar el campo Clase de largo.")
		Return -1
	End if
End if

If Not tab_medidas.tabpage_diseno.dw_mu_dt_largo.of_completedata() Then
	of_scroll(4)
	tab_medidas.tabpage_diseno.dw_mu_dt_largo.SetFocus()
	tab_medidas.SelectTab(tab_medidas.tabpage_diseno)	
	Return -1
End If

If Not tab_medidas.tabpage_diseno.dw_mu_dt_puno.of_completedata() Then
	of_scroll(4)
	tab_medidas.tabpage_diseno.dw_mu_dt_puno.SetFocus()
	tab_medidas.SelectTab(tab_medidas.tabpage_diseno)	
	Return -1
End If

//************************************************************
//////////////////////////////////////////////////////////////////////////
// Se verifica que esten ingresadas adecuadamente las partes. 
// 
//////////////////////////////////////////////////////////////////////////


If Not tab_medidas.tabpage_1.dw_medidas1.of_completedata() Then
	Trigger Event Key(Key2!,1)
	Return -1
End If

If Not tab_medidas.tabpage_2.dw_med_rep.of_completedata() Then
	Trigger Event Key(Key3!,1)
	Return -1
End If

//////////////////////////////////////////////////////////////////////////
// Verifica que las partes no se repitan en las medidas de la muestra
// 
//////////////////////////////////////////////////////////////////////////

ll_tot=tab_medidas.tabpage_1.dw_medidas1.RowCount()

For i=1 To ll_tot
	
	For j=1 To ll_tot
		If i<>j Then
			ll_parte=tab_medidas.tabpage_1.dw_medidas1.GetItemNumber(i,"co_partebas")
			ll_parte1=tab_medidas.tabpage_1.dw_medidas1.GetItemNumber(j,"co_partebas")
			If ll_parte=ll_parte1 Then
				ls_display = tab_medidas.tabpage_1.dw_medidas1.describe( &
		      "Evaluate('LookUpDisplay(co_partebas) ', "+ String(i) + ")");
				
				MessageBox("Advertencia!","Se est$$HEX1$$e100$$ENDHEX$$n repitiendo las medidas de la parte "+Trim(ls_display)+&
				".~n~rPor favor verifique.",StopSign!)
				tab_medidas.tabpage_1.dw_medidas1.SetRow(j)
				
				Trigger Event Key(Key2!,1)
				
				Return -1

			End IF
		End If
	Next
Next

//////////////////////////////////////////////////////////////////////////
// se verifica que existan los colores, que no sean nulos, y que no
// se repitan
//////////////////////////////////////////////////////////////////////////
dw_dt_muestras_col.SetFilter("")
dw_dt_muestras_col.Filter()

dw_dt_muestras_col.Sort()

ll_tot=dw_dt_muestras_col.RowCount()

For i=1 To ll_tot
	ll_tal=dw_dt_muestras_col.GetItemNumber(i,"co_talla")
	ll_col=dw_dt_muestras_col.GetItemNumber(i,"co_color")
	If IsNUll(ll_col) Then
		ll_pos=dw_dt_muestras.Find("co_talla="+String(ll_tal),1,&
		dw_dt_muestras.RowCount())
		
		If ll_pos>0 then
			dw_dt_muestras.SetRow(ll_pos)
//			of_filtro_talla(tab_1.tabpage_1.dw_dt_muestras.GetItemNumber(ll_pos,"co_talla"),&
//			tab_1.tabpage_1.dw_dt_muestras.GetItemString(ll_pos,"co_talla_exp"),ll_pos)
		End If
		MessageBox("Advertencia!","Existen colores no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
		Return -1

	End If
	
	If i<ll_tot Then
		ll_col1=dw_dt_muestras_col.GetItemNumber(i+1,"co_color")
		ll_tal1=dw_dt_muestras_col.GetItemNumber(i+1,"co_talla")
		If ll_tal=ll_tal1 and ll_col=ll_col1 Then
			ll_pos=dw_dt_muestras.Find("co_talla="+String(ll_tal),1,&
			dw_dt_muestras.RowCount())
			
			If ll_pos>0 then
				dw_dt_muestras.SetRow(ll_pos)
//				of_filtro_talla(tab_1.tabpage_1.dw_dt_muestras.GetItemNumber(ll_pos,"co_talla"),&
//				tab_1.tabpage_1.dw_dt_muestras.GetItemString(ll_pos,"co_talla_exp"),ll_pos)
			End If
			MessageBox("Advertencia!","El color "+String(ll_col)+" est$$HEX2$$e1002000$$ENDHEX$$repetido.",StopSign!)
			Return -1
		End If
	End If		
Next

//////////////////////////////////////////////////////////////////////////
// Verifico los datos de materia prima
// 
//////////////////////////////////////////////////////////////////////////

dw_mat_prima.SetFilter("")
dw_mat_prima.Filter()

If Not dw_mat_prima.of_completedata() Then
	//////////////////////////////////////////////////////////////////////////
	// Se ubica la fila y se filtra la info
	// primero color y luego opci$$HEX1$$f300$$ENDHEX$$n
	//////////////////////////////////////////////////////////////////////////
	ll_f=dw_mat_prima.GetRow()
	If ll_f>0 Then
		ll_color=dw_mat_prima.GetItemNumber(ll_f,"co_color")
		ll_opcion=dw_mat_prima.GetItemNumber(ll_f,"co_diseno")
		ll_pos=dw_dt_muestras_col.find("co_color="+String(ll_col),1,dw_dt_muestras_col.RowCount())
		If ll_pos>0 Then
			of_filtro_color(ll_color,ll_pos)
		End If
		
		ll_pos=dw_h_fmp_muestras.find("co_diseno="+String(ll_opcion),1,&
		dw_h_fmp_muestras.RowCount())
		
		If ll_pos>0 Then
			of_filtro_opcion(ll_opcion,ll_pos)
		End If
		
	End If
	Return -1
End If

//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Jueves 17 de Febrero de 2005 HORA 15:54:49:531
// 
// Se verifica que el recurso de la muestra y la materia prima sean el mismo
//////////////////////////////////////////////////////////////////////////

dw_h_fmp_muestras.SetFilter("")
dw_h_fmp_muestras.Filter()

ll_tot=dw_h_fmp_muestras.RowCount()
ll_recurso=dw_dt_muestras.GetItemNumber(1,"co_recurso")

//se comenta este codigo ya que el recurso se est$$HEX1$$e100$$ENDHEX$$
//asignando automaticamente 23012009
//For i =1 to ll_tot
//	ll_recurso1=dw_h_fmp_muestras.GetItemNumber(i,"co_recurso")
//	If ll_recurso<>ll_recurso1 Then
//		MessageBox("Advertencia!","El recurso "+String(ll_recurso1)+" es diferente al "+&
//		String(ll_recurso)+" de la Muestra, por favor verifique.",StopSign!)
//
//		ll_color=dw_h_fmp_muestras.GetItemNumber(i,"co_color")
//		ll_opcion=dw_h_fmp_muestras.GetItemNumber(i,"cnt_opcion")
//
//		ll_pos=dw_dt_muestras_col.find("co_color="+String(ll_color),1,dw_dt_muestras_col.RowCount())
//		If ll_pos>0 Then
//			of_filtro_color(ll_color,ll_pos)
//		End If
//		
//		ll_pos=dw_h_fmp_muestras.find("cnt_opcion="+String(ll_opcion),1,&
//		dw_h_fmp_muestras.RowCount())
//		
//		If ll_pos>0 Then
//			of_filtro_opcion(ll_opcion,ll_pos)
//		End If
//		Trigger Event Key(Key4!,1)
//		dw_h_fmp_muestras.SetFocus()
//		
//		Return -1		
//	End If
//
//Next

//////////////////////////////////////////////////////////////////////////
// YOVANNY GALVEZ ZULUAGA 
// Martes 30 de Agosto de 2005 
//VALIDACION EJECUTIVA NO ASIGNADA 
//////////////////////////////////////////////////////////////////////////

ll_res=lo_c.of_valorconstante( "MU_EJECUTIVA_NO_VALIDA",n_cst_application.itr_appl )

If ll_res=1 Then
	ll_MU_EJECUTIVA=Long(lo_c.of_getDecimal(1))
Else
	ll_MU_EJECUTIVA=999
End If

ll_ejecutiva = dw_muestra.GetitemNumber(dw_muestra.GetRow(),"co_ejecutiva")

IF ll_MU_EJECUTIVA = ll_ejecutiva THEN
	MessageBox("Advertencia!","La ejecutiva seleccionada "+String(ll_ejecutiva)+" no es v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	RETURN -1
END IF	

//-----SI ES CRUDO REALIZAR VALIDACION-----\\ 

ll_crudo = dw_muestra.GetitemNumber(dw_muestra.GetRow(),"co_caract_mp")

If ll_crudo = 1 Then
	If tab_medidas.tabpage_mp_base.dw_mp_base.RowCount() > 0 Then
		If Not tab_medidas.tabpage_mp_base.dw_mp_base.of_completedata() Then
			of_scroll(4)
			tab_medidas.tabpage_mp_base.dw_mp_base.SetFocus()
			tab_medidas.SelectTab(tab_medidas.tabpage_mp_base)	
			MessageBox("Advertencia!","Verifique que los datos de materia prima base esten completos",StopSign!)
			Return -1
		End If
	Else
		of_scroll(4)
		tab_medidas.tabpage_mp_base.dw_mp_base.SetFocus()
		tab_medidas.SelectTab(tab_medidas.tabpage_mp_base)	
		MessageBox("Advertencia!","Verifique que se encuentren registors de materia prima base",StopSign!)
		Return -1
	End if	
End If

//-----YGZ-----\\

ll_find = dw_mat_prima.Find('estado_parte = "I"',1,dw_mat_prima.RowCount()+1)

//toma estado para ver si la muestra es nueva
ldws_status = dw_muestra.GetItemStatus(1,0,Primary! )

//si es nueva y tiene partes inactivos
If (ldws_status = New! Or ldws_status = NewModified!) and ll_find > 0 Then
	MessageBox("Advertencia!","Existen partes de materia prima inactivas para la muestra nueva.")
	Return -1
End if

//si hay partes inactivas y la muestra no tiene referencia
If ll_find > 0 and tab_medidas.tabpage_3.dw_referencias.RowCount() = 0 Then
	MessageBox("Advertencia!","Existen partes de materia prima inactivas para la muestra.")
	Return -1
End if



Return 1


end function

public function integer of_consecutivo ();//////////////////////////////////////////////////////////////////////////
// Toma el consecutivo y verifica si fue asignado
// 
//////////////////////////////////////////////////////////////////////////
boolean lb_continuar=True
long ll_cantidad

DO WHILE lb_continuar

	
	il_muestra = n_cst_application.&
	of_consecutive(n_cst_application.ii_fabrica,25,n_cst_application.itr_appl)
   If il_muestra<=0 Then
		il_muestra=0
		MessageBox("Advertencia!","No se pudo determinar el consecutivo de la muestra.",StopSign!)
		Return -1
	//SA56753 Ceiba/reariase - 16-05-2017
	Else
		Commit Using n_cst_application.itr_appl;
	//Fin SA56753
	End If

  SELECT count(*)  
    INTO :ll_cantidad  
    FROM m_muestras  
   WHERE ( m_muestras.co_muestra = :il_muestra ) using n_cst_application.itr_appl  ;

	If n_cst_application.itr_appl.SQLcode=-1 Then 
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(n_cst_application.itr_appl)
		Return -1
	End If
	
	If IsNull(ll_cantidad) then ll_cantidad=0
	
	If ll_cantidad=0 Then
		lb_continuar=False
	End If



LOOP

If il_muestra>0 Then
	Return 1
End If

Return -1
end function

public function string of_espacios (string a_cad, integer a_tam);String ls_cad


ls_cad=a_cad

If IsNull(ls_cad) then ls_cad=""

Do While (Len(ls_cad)<a_tam)
	ls_cad=ls_cad+" "	
Loop

Return ls_cad
end function

public function integer of_error_muestra ();RollBack Using n_cst_application.itr_appl;
dw_muestra.SetItem(1,"co_muestra",il_muestra_control)

Return 1
end function

public function integer of_distrib_cant_colores (long al_nueva_cantidad, string as_nom_colum_pares);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 21 de Septiembre de 2004.H:14:48
---------------------------------------------------
Esta funcion hace la distribucion uniforme de la nueva cantidad en todos
los colores del dw_dt_muestras_col que es recibida en el arg.
a_nueva_cantidad en la colunmna de pares que se recibe en el arg.
a_nom_colum_pares
---------------------------------------------------*/
Long ll_numcol, ll_cant_distribuir,ll_cant_ultimo,ll_pv

ll_numcol = dw_dt_muestras_col.RowCount()
If ll_numcol > 0 Then
	of_Redraw(False)
	dw_dt_muestras_col.SetFilter("co_color NOT IN (888,999)")
	dw_dt_muestras_col.Filter()
	ll_numcol = dw_dt_muestras_col.RowCount()
	If ll_numcol > 0 Then
		ll_cant_distribuir = al_nueva_cantidad / ll_numcol		
		If ll_cant_distribuir > 0 Then			
			For ll_pv=1 to ll_numcol - 1
				dw_dt_muestras_col.SetItem(ll_pv,as_nom_colum_pares,ll_cant_distribuir)
			Next
			ll_cant_ultimo = al_nueva_cantidad - (ll_cant_distribuir*(ll_numcol - 1))
			dw_dt_muestras_col.SetItem(ll_numcol,as_nom_colum_pares,ll_cant_ultimo)					
		Else
			dw_dt_muestras_col.SetItem(1,as_nom_colum_pares,al_nueva_cantidad)					
			For ll_pv=2 to ll_numcol 
				dw_dt_muestras_col.SetItem(ll_pv,as_nom_colum_pares,0)
			Next
		End If		
	End If
	dw_dt_muestras_col.SetFilter("")
	dw_dt_muestras_col.Filter()
	dw_dt_muestras_col.Sort()
	of_Redraw(True)
Else
	Return -1
End If
Return 1
end function

public function integer of_co_color_especial (long al_row);/*Se deshabilita la edicion de los campos de pares cuando el codigo del color es 
	alguno de los 'comodines'
*/
	If dw_dt_muestras_col.Object.co_color[al_row]=999 OR &
		dw_dt_muestras_col.Object.co_color[al_row]=888 then
			dw_dt_muestras_col.Modify("pares_tejer.TabSequence='0'")
			dw_dt_muestras_col.Modify("pares_despachar.TabSequence='0'")
			//dw_dt_muestras_col.Object.pares_despachar[row].Background.Color=RGB(1,2,3)
	Else		
			dw_dt_muestras_col.Modify("pares_tejer.TabSequence='100'")
			dw_dt_muestras_col.Modify("pares_despachar.TabSequence='110'")
	End If
	dw_dt_muestras_col.SetItem(al_row,"pares_tejer",0)
	dw_dt_muestras_col.SetItem(al_row,"pares_despachar",0)
Return 1
end function

public function integer of_verificaroperacionorden (long a_operacion);
//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 18 de Mayo de 2005 HORA 14:55:16:906
// of_verificarOperacionOrden
//
// Verifica si una operaci$$HEX1$$f300$$ENDHEX$$n se ha utilizado en alguna orden.
// Retorna -1 Error
//         -2 Tiene ordenes con la operacion
//          1 Exitoso
//////////////////////////////////////////////////////////////////////////
Long					ll_pos,ll_res,ll_operacion,ll_count
n_ds_application 	lds_operacion

lds_operacion= CREATE n_ds_application
lds_operacion.of_load('d_ver_integ_operacion')
lds_operacion.of_conexion(n_cst_application.itr_appl,True)
ll_res=lds_operacion.Retrieve(il_fabrica,il_linea,il_muestra,a_operacion)
Choose Case ll_res
	Case Is < 0
		MessageBox('Advertencia','Error en la consulta de la existencia de registros dependientes de la operaci$$HEX1$$f300$$ENDHEX$$n '+String(a_operacion)+' para esta muestra',StopSign!)
		Destroy lds_operacion
		Return -1
//	Case 0
//		MessageBox('Advertencia','No se devolvi$$HEX2$$f3002000$$ENDHEX$$informaci$$HEX1$$f300$$ENDHEX$$n con la consulta de la existencia de registros dependientes de la operaci$$HEX1$$f300$$ENDHEX$$n '+String(ll_operacion)+' para esta muestra',StopSign!)
//		Return
End Choose
ll_count=lds_operacion.GetItemNumber(1,'nro_operacion')

If ll_count >0 Then
	Destroy lds_operacion
	Return -2
//		MessageBox('Advertencia','La operaci$$HEX1$$f300$$ENDHEX$$n # '+String(ll_operacion)+' - '+This.GetItemString(ll_pos,'de_operacion')+' est$$HEX2$$e1002000$$ENDHEX$$asignada a tareas de $$HEX1$$f300$$ENDHEX$$rdenes registradas para esta muestra. No se puede eliminar',StopSign!)
//		Return
End If

Destroy lds_operacion
Return 1
end function

public function integer of_verificaractividadorden (long a_actividad);
//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 18 de Mayo de 2005 HORA 14:55:16:906
// of_verificarActividadOrden
//
// Verifica si una operaci$$HEX1$$f300$$ENDHEX$$n se ha utilizado en alguna orden.
// Retorna -1 Error
//         -2 Tiene ordenes con la operacion
//          1 Exitoso
//////////////////////////////////////////////////////////////////////////
Long					ll_pos,ll_res,ll_operacion,ll_count
n_ds_application 	lds_actividad

lds_actividad= CREATE n_ds_application
lds_actividad.of_load('d_ver_integ_actividad')
lds_actividad.of_conexion(n_cst_application.itr_appl,True)
ll_res=lds_actividad.Retrieve(il_fabrica,il_linea,il_muestra,a_actividad)
Choose Case ll_res
	Case Is < 0
		MessageBox('Advertencia','Error en la consulta de la existencia de registros dependientes de la actividad '+String(a_actividad)+' para esta muestra',StopSign!)
		Destroy lds_actividad
		Return -1
//	Case 0
//		MessageBox('Advertencia','No se devolvi$$HEX2$$f3002000$$ENDHEX$$informaci$$HEX1$$f300$$ENDHEX$$n con la consulta de la existencia de registros dependientes de la operaci$$HEX1$$f300$$ENDHEX$$n '+String(ll_operacion)+' para esta muestra',StopSign!)
//		Return
End Choose
ll_count=lds_actividad.GetItemNumber(1,'nro_actividad')

If ll_count>0 Then
	Destroy lds_actividad
	Return -2
//		MessageBox('Advertencia','La operaci$$HEX1$$f300$$ENDHEX$$n # '+String(ll_operacion)+' - '+This.GetItemString(ll_pos,'de_operacion')+' est$$HEX2$$e1002000$$ENDHEX$$asignada a tareas de $$HEX1$$f300$$ENDHEX$$rdenes registradas para esta muestra. No se puede eliminar',StopSign!)
//		Return
End If

Destroy lds_actividad
Return 1
end function

public function integer of_verificar_ref_pdn (long a_fabrica, long a_linea, long a_referencia, long a_talla);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 29 de Junio de 2005 HORA 11:52:15:296
// 
// Verifica si una referencia de produccion existe
//////////////////////////////////////////////////////////////////////////
long ll_dato

If IsNull(a_fabrica) Then a_fabrica=-1
If IsNull(a_linea)   Then a_linea=-1
If IsNull(a_referencia)   Then a_referencia=-1
If IsNull(a_talla)   Then a_talla=-1

  SELECT min(m_ref_pdn.co_referencia)
    INTO :ll_dato  
    FROM m_ref_pdn  
   WHERE ( m_ref_pdn.co_fabrica = :a_fabrica ) AND  
         ( m_ref_pdn.co_linea = :a_linea ) AND  
         ( m_ref_pdn.co_referencia = :a_referencia ) AND  
         ( m_ref_pdn.co_talla = :a_talla )  
			using n_cst_application.itr_appl;

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

If IsNull(ll_dato) Then
	ll_dato=-1
End If

If ll_dato<>a_referencia Then
	Return -1
End If

Return 1
end function

public function integer of_verificarproductomp (string a_columna, long a_fila, string a_dato);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 19 de Diciembre de 2002 HORA 11:32:24:062
// 
// Se verifica que el producto sea v$$HEX1$$e100$$ENDHEX$$lido, cuando estan todos los datos
//////////////////////////////////////////////////////////////////////////


long ll_fabrica_mp,ll_producto_mp,ll_calidad_mp,ll_matiz_mp,ll_caracteristi_mp,&
     ll_color_mp,ll_res,ll_proveedor
	  
	  

ll_fabrica_mp      = dw_mat_prima.GetItemNumber(a_fila,"co_fabrica_mp")
ll_producto_mp     = dw_mat_prima.GetItemNumber(a_fila,"co_producto_mp")
ll_calidad_mp      = dw_mat_prima.GetItemNumber(a_fila,"calidad_mp")
ll_matiz_mp        = dw_mat_prima.GetItemNumber(a_fila,"co_matiz_mp")
ll_caracteristi_mp = dw_mat_prima.GetItemNumber(a_fila,"co_caracteristi_mp")
ll_color_mp        = dw_mat_prima.GetItemNumber(a_fila,"co_color_mp")
ll_proveedor       = dw_mat_prima.GetItemNumber(a_fila,"co_proveedor")

If a_columna="co_fabrica_mp" Then
	ll_fabrica_mp=Long(a_dato)
End If

If a_columna="co_producto_mp" Then
	ll_producto_mp=Long(a_dato)
End If

If a_columna="calidad_mp" Then
	ll_calidad_mp=Long(a_dato)
End If

If a_columna="co_matiz_mp" Then
	ll_matiz_mp=Long(a_dato)
End If

If a_columna="co_caracteristi_mp" Then
	ll_caracteristi_mp=Long(a_dato)
End If

If a_columna="co_color_mp" Then
	ll_color_mp=Long(a_dato)
End If

If a_columna="co_proveedor" Then
	ll_proveedor=Long(a_dato)
End If


If IsNull(ll_fabrica_mp) or IsNull(ll_producto_mp) or IsNull(ll_calidad_mp) or &
   IsNull(ll_matiz_mp)   or IsNull(ll_caracteristi_mp) or IsNull(ll_color_mp) or &
	IsNull(ll_proveedor)Then
	
//////////////////////////////////////////////////////////////////////////
// Si hay algun dato nulo, entonces se toma como v$$HEX1$$e100$$ENDHEX$$lido el registo que
// se esta haciendo
//////////////////////////////////////////////////////////////////////////
	
	Return 1
End If


n_ds_application lds_1

lds_1=create n_ds_application

lds_1.DataObject="d_m_prod_proveedor"

lds_1.SetTransObject(n_cst_application.itr_appl)

ll_res=lds_1.Retrieve(ll_fabrica_mp,ll_producto_mp,ll_calidad_mp,ll_matiz_mp,&
                     ll_caracteristi_mp,ll_color_mp,ll_proveedor)
							
If ll_res<=0 Then
	MessageBox("Advertencia!","El producto no existe, o no tiene proveedor, por favor verifique.",StopSign!)
	Return -1
End If

//////////////////////////////////////////////////////////////////////////
// Determino el estado del color, para que sea v$$HEX1$$e100$$ENDHEX$$lido, debe ser A $$HEX2$$f3002000$$ENDHEX$$D
// 
//////////////////////////////////////////////////////////////////////////
long ll_pos

ll_pos=lds_1.find("#1='A'",1,lds_1.RowCount())

If ll_pos>0 Then
	Return 1
End If

ll_pos=lds_1.find("#1='D'",1,lds_1.RowCount())


If ll_pos>0 Then
	Return 1
Else
	MessageBox("Advertencia!","El estado del color no es v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
	Return -1
End If


Return 1











end function

public function integer of_validar_mat_prima ();

Return 1
end function

public function integer of_validar_matprima (transaction a_transaction, long an_producto, long an_color, long an_fabrica);Long ll_error, ll_contador

If IsNull(an_producto) OR  IsNull(an_color)  Then
	Return 1
End If

//Se verifica que por lo menos haya una convinacion de producto - color activo

SELECT count(estado) 
INTO :ll_contador
FROM m_prod_proveedor 
WHERE co_producto = :an_producto
AND co_color = :an_color
AND  estado = "A" 
//AND  estado = "O" 
AND co_fabrica = :an_fabrica
  using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If

If ll_contador > 0 Then
	Return 1
Else
	Return 0
End If


Return 1
end function

public function integer of_modificar_peso_mp (long al_base_peso, long al_base_peso_ant);/*
* -----------------------------------------------------------------------------
* MODIFICACION: Marzo 05 de 2008 - ohlondon
* -----------------------------------------------------------------------------
* Se debe modificar el peso de los registro de la  FMP que hayan sido 
* insertados con la base de peso anterior. OJO solo il_tipo_prod = 20
* -----------------------------------------------------------------------------
*/
Decimal 	ldc_peso, ldc_peso_ant
Long 		ll_row, ll_rows, ll_base_peso, ll_res
LONG 		ll_co_talla,   &
			ll_co_color,   &
			ll_co_centro,   &
			ll_nu_partemp,   &
			ll_nu_mp


Datastore lds_muestras
lds_muestras  = Create DataStore

lds_muestras.DataObject = 'd_modifica_peso_mp'
lds_muestras.SetTransObject(n_cst_application.itr_appl)

// recuperar las filas de FMP para la muestra
ll_rows = lds_muestras.retrieve(il_fabrica, il_linea, il_muestra)

FOR ll_row = 1 to ll_rows
		
   ldc_peso     = 0
	// ser obtiene el peso_mp anterior 
	ldc_peso_ant  = lds_muestras.GetItemDecimal(ll_row, 'peso_mp')
	ll_co_talla   = lds_muestras.GetItemNumber(ll_row, 'co_talla')
	ll_co_color   = lds_muestras.GetItemNumber(ll_row, 'co_color')
	ll_co_centro  = lds_muestras.GetItemNumber(ll_row, 'co_centro')
	ll_nu_partemp = lds_muestras.GetItemNumber(ll_row, 'nu_partemp')
	ll_nu_mp      = lds_muestras.GetItemNumber(ll_row, 'nu_mp')
	// Es de esperar que la base de peso anterior sea diferente de 0 	
	IF (al_base_peso_ant  <> 0) THEN
		// Se multiplica para obtener el peso total del material
		ldc_peso_ant = Round (ldc_peso_ant * al_base_peso_ant , 2)
	END IF

	IF (al_base_peso <> 0) THEN
		// Se recalcula el peso unitario de cada matrial
		// y si el calculo da cero se asina el menor posible
		// es decir 0.01
		IF Round (ldc_peso_ant / al_base_peso,2) = 0 THEN
			ldc_peso = 0.01
		ELSE
			ldc_peso =  Round (ldc_peso_ant / al_base_peso,2)
		END IF
	END IF
	
   // Se actualiza el peso del material
	UPDATE dt_fmp_muestras
      SET peso_mp = :ldc_peso
	 WHERE co_fabrica = :il_fabrica
   	AND co_linea   = :il_linea
      AND co_muestra = :il_muestra
      AND co_talla   = :ll_co_talla
      AND co_color   = :ll_co_color
      AND co_centro  = :ll_co_centro
      AND nu_partemp = :ll_nu_partemp
      AND nu_mp      = :ll_nu_mp
  	 USING n_cst_application.itr_appl;

	If n_cst_application.itr_appl.SQLcode <> 0 Then 
		MessageBox("Error BD", "Ocurrio un error al actualizar el peso recalculado para la ficha de la muestra " +&
		             String(il_fabrica)+" - "+String(il_linea)+" - "+String(il_muestra)+".~r~n"+&
						n_cst_application.itr_appl.SqlErrText )
		Return -1
	End If
NEXT															  
Return 1
end function

public function integer of_validar_estadotipotejido (transaction a_transaction, long an_co_ttejido);Long ll_error

SELECT estado 
INTO :is_estado
FROM m_ttejidos
WHERE co_ttejido = :an_co_ttejido
  using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If

If a_transaction.SQLcode=100 Then 
	Return 0
End If


Return 1
end function

public function integer of_verificar_borrado ();LONG ll_borrar, ll_referencia


  SELECT count(dt_muestras_ref.co_fabrica_ref)
  INTO :ll_referencia
    FROM dt_muestras_ref  
   WHERE ( dt_muestras_ref.co_fabrica = :il_fabrica ) 
	AND   ( dt_muestras_ref.co_linea = :il_linea ) 
	AND   ( dt_muestras_ref.co_muestra = :il_muestra )
	USING n_cst_application.itr_appl;


IF ll_referencia <> 0 THEN
	
	SELECT count(dt_fmp_muestras.co_fabrica)
	INTO :ll_borrar
	FROM 	dt_fmp_muestras,   
			h_fmp_muestras  
	WHERE ( dt_fmp_muestras.co_fabrica = h_fmp_muestras.co_fabrica ) 
	AND ( dt_fmp_muestras.co_linea = h_fmp_muestras.co_linea ) 
	AND ( dt_fmp_muestras.co_muestra = h_fmp_muestras.co_muestra )
	AND ( dt_fmp_muestras.co_talla = h_fmp_muestras.co_talla ) 
	AND ( dt_fmp_muestras.co_color = h_fmp_muestras.co_color ) 
	AND ( dt_fmp_muestras.CO_DISENO = h_fmp_muestras.CO_DISENO ) 
	AND ( h_fmp_muestras.CO_RECURSO = :il_recurso ) 
	AND ( dt_fmp_muestras.co_fabrica = :il_fabrica )
	AND ( dt_fmp_muestras.co_linea = :il_linea ) 
	AND ( dt_fmp_muestras.co_muestra = :il_muestra ) 
	AND ( dt_fmp_muestras.CO_DISENO =  1)
	USING n_cst_application.itr_appl;
ELSE 
	UPDATE h_fmp_muestras
	SET co_recurso = :il_recurso_cambio
	WHERE co_fabrica = :il_fabrica
	AND co_linea = :il_linea
	AND co_muestra = :il_muestra
	AND co_diseno = 1
	USING n_cst_application.itr_appl;	
	
	UPDATE dt_med_mue
	SET co_recurso = :il_recurso_cambio
	WHERE co_fabrica = :il_fabrica
	AND co_linea = :il_linea
	AND co_muestra = :il_muestra
	AND co_diseno = 1
	USING n_cst_application.itr_appl;	
	
	
	COMMIT USING n_cst_application.itr_appl;	
	ll_borrar = 0
END IF

RETURN ll_borrar
end function

public subroutine of_mail_cambio ();String ls_usuario, ls_colores, ls_asunto, ls_msg, ls_error
Long ll_muestra, ll_fabrica, ll_linea, ll_solicitud, ll_existe, ll_inicio, ll_long, ll_recurso

u_ds_base			lds_datos
lds_datos		= 	CREATE u_ds_base

uo_correo	lnv_correo
lnv_correo = CREATE uo_correo
	
ll_muestra	= dw_muestra.object.co_muestra[1]
ll_fabrica	= dw_muestra.object.co_fabrica[1]
ll_linea		= dw_muestra.object.co_linea[1]
ll_recurso	= dw_dt_muestras.object.co_recurso[1]

lds_datos.DataObject = 'd_datos_correo'
lds_datos.SetTransobject(n_cst_application.itr_appl)
lds_datos.retrieve(ll_muestra, ll_fabrica, ll_linea)
ll_existe = lds_datos.rowcount( )

IF ll_existe > 0 THEN
	
	FOR ll_inicio = 1 TO ll_existe
		ls_colores += String(lds_datos.Object.co_color[ll_inicio])+','		
	NEXT
	
	ll_long = len(ls_colores)
	
	ls_colores = Left(ls_colores, ll_long - 1)
	
	ls_asunto='Referencia '+String(lds_datos.Object.co_referencia[1])

	ls_msg= " El material "+String(lds_datos.Object.co_referencia[1],'')+" talla: "+String(lds_datos.Object.co_talla[1],'')+&
			  " Recurso: "+String(ll_recurso)+" -color(es): "+ls_colores+&
			  " muestrario: "+String(lds_datos.Object.co_muestrario[1],'')+" ha sido modificado "+&
			  " por el usuario: "+n_cst_application.is_user+","+&
			  " en MUESTRA BASICA. Fecha de Creaci$$HEX1$$f300$$ENDHEX$$n (o modificaci$$HEX1$$f300$$ENDHEX$$n): "+String(DateTime(Date(Today()),Time(Now())))+""	
	
	/*Dbedocal 2018-05-11
	//Declara y Ejecuta procedimiento almacenado para envio de correo, el programa es datos_maestros
	Declare pr_envia_mail Procedure For admpd.pr_envia_mail('datos_maestros',:ls_asunto,:ls_msg)
	Using n_cst_application.itr_appl;

	Execute pr_envia_mail;

	IF n_cst_application.itr_appl.SQLCode < 0 THEN
		ls_error = n_cst_application.itr_appl.SQLErrText
		CLOSE pr_envia_mail;
	
		MessageBox("Advertencia - Error de Base Datos","Error al ejecutar el procedimiento almacenado <pr_envia_mail> al enviar correos."+&
				"~n~nError : "+ String(n_cst_application.itr_appl.SQLCode) + " - "+ trim(ls_error) + "~n~nConsulte con el administrador del sistema",StopSign!)
		Return
	End If

	// Cierra el procedimiento almacenado declarado
	Close pr_envia_mail;
	*/
	
	TRY
		lnv_correo.of_enviar_correo(ls_asunto, ls_msg, "datos_maestros")
	CATCH(Exception ex)
		Messagebox("Error", ex.getmessage())
	END TRY
	
END IF

DESTROY lnv_correo
DESTROY lds_datos
end subroutine

public function long of_abrirventanaseleccionrecursosacopiar ();//=========================================================================
// Funcion	:	of_AbrirVentanaSeleccionRecursosACopiar
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	Abrir la ventana para seleccionar los recursos con los que deseo sincromizar la informacion
//					Copiar la informacion modificada, borrada o insertada de la 
//					pesta$$HEX1$$f100$$ENDHEX$$a de reposadas en la opcion Muestra Basica del menu principal
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ
str_param	lstr_param

lstr_param.a_long1[1] = Long(il_muestra)
lstr_param.a_long1[2] = Long(il_recurso)
lstr_param.a_long1[3] = Long(il_muestra)
lstr_param.a_long1[4] =	Long(il_fabrica)
lstr_param.a_long1[5] = Long(il_linea)
lstr_param.a_long1[6] = Long(il_talla)
lstr_param.a_long1[7] = Long(tab_medidas.tabpage_2.dw_med_rep.GetItemNumber(1, "co_diseno"))//DISE$$HEX1$$d100$$ENDHEX$$O DE ORIGEN
//Se envia el nombre del programa para saber como debe comportarse
lstr_param.a_string3[1] = 'Muestra_basica'
//Se envia el dw para luego generar un copia, setearles el co_recurso y luego actualizarlos 
lstr_param.a_dw1[1] = tab_medidas.tabpage_2.dw_med_rep

OpenWithParm(w_copiar_recursos,lstr_param)

return 1
end function

public subroutine of_inicializarreccotizados ();/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName: of_inicializarRecCotizados
<DESC> Description: Inicializar Recursos Cotizados </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Al cargar la muestra basica desde of_buscar se invoca esta funcion para cargar los valores anteriores 
Se setea el recurso cotizado cargado a la entidad para llevar el historico 
y asi saber en caso de que ocurra algun cambio, si ha sido modificado o No</USAGE>
********************************************************************/
IF NOT(IsNull(dw_dt_muestras.object.co_reccotnocierra[dw_dt_muestras.GetRow()])) THEN 
	inv_RecCotizado.of_setRecCotizaOldNoCierra(dw_dt_muestras.object.co_reccotnocierra[dw_dt_muestras.GetRow()])
ELSE
	inv_RecCotizado.of_setRecCotizaOldNoCierra(0)//Con el nulo no es capaz de comparar cuando desde el guardar se valide si ha ocurrido algun cambio en uno de los recursos cotizados  
END IF 
	
IF NOT(IsNull(dw_dt_muestras.object.co_reccotcierra[dw_dt_muestras.GetRow()])) THEN
	inv_RecCotizado.of_setRecCotizaOldCierra(dw_dt_muestras.object.co_reccotcierra[dw_dt_muestras.GetRow()])	
ELSE 
	inv_RecCotizado.of_setRecCotizaOldCierra(0) 
END IF 
end subroutine

public function boolean of_validargenerarinformacionrep ();/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName : Of_ValidarGenerarInformacionRep
<DESC> Description: Esta funcion permite Validar si se produjo un cambio en los recursos cotizados 
y se debe almacenar en la nueva tabla log_RecCotizado para generar el reporte y enviarlo al correo 
a los recursos cotizados cierra o no cierra </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Para retornar TRUE la muestra debe estar convertida a referencia y que no haya convertido a referencia en
ese mismo momento (Evitar informacion inconsistente en SAP), y por ultimo algun recurso cotizado se haya modificado </USAGE>
Notas: Se debe cambiar que solo se genere la notificacion cuando fue convertida a ref y no siempre
********************************************************************/
n_cst_dt_muestras_ref	lds_dt_muestras_ref
lds_dt_muestras_ref		= CREATE n_cst_dt_muestras_ref

lds_dt_muestras_ref.of_validarMuestraConvertidaAReferencia(il_fabrica,il_linea,il_muestra)
lds_dt_muestras_ref.of_filtrar(' fe_actualizacion < datetime(today()) ') //Verificar que ya existe y no se haya convertido a referencia en el momento 
IF lds_dt_muestras_ref.of_getRowCount() > 0 AND (il_fabrica <> 5) THEN 
	Destroy(lds_dt_muestras_ref)
	RETURN TRUE
ELSE 
	Destroy(lds_dt_muestras_ref)
	RETURN FALSE 
END IF 
end function

public subroutine of_setinforeccotizado ();/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName : of_SetInfoRecCotizado
<DESC> Description:Esta funcion permite almacenar la informacion sobre las modificaciones realizada
a los recursos cotizados cierra o no cierra </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Cuando se modifica un recurso cotizado cierra o no cierra se debe invocar </USAGE>
********************************************************************/
Long ll_reccotcierra, ll_reccotnocierra, ll_null

ll_reccotcierra	= dw_dt_muestras.object.co_reccotcierra[dw_dt_muestras.GetRow()]
ll_reccotnocierra	= dw_dt_muestras.object.co_reccotnocierra[dw_dt_muestras.GetRow()]
SetNull(ll_null)

//Si se borra el cotizado queda nulo, se debe capturar y verificar contra el cero 
IF ISNULL(ll_reccotcierra) THEN ll_reccotcierra = 0 
IF ISNULL(ll_reccotnocierra) THEN ll_reccotnocierra = 0

IF (inv_RecCotizado.of_getRecCotizaOldCierra() <> ll_reccotcierra) THEN 
	//Se carga la informacion del cambio realizado Sobre el recurso cotizado Cierra 
	IF inv_RecCotizado.of_getRecCotizaOldCierra() = 0 THEN inv_RecCotizado.of_setRecCotizaOldCierra(ll_null)
	inv_log_recCotizado.of_setRecCotCierraOld(inv_RecCotizado.of_getRecCotizaOldCierra())
	IF ll_reccotcierra = 0 THEN SetNull(ll_reccotcierra) //Se borro el recurso cotizado
	inv_log_recCotizado.of_setRecCotCierraNew(ll_reccotcierra)
END IF 

IF inv_RecCotizado.of_getRecCotizaOldNoCierra() <> ll_reccotnocierra THEN 
	//Se carga la informacion del cambio realizado Sobre el recurso cotizado no Cierra 
	IF inv_RecCotizado.of_getRecCotizaOldNoCierra() = 0 THEN inv_RecCotizado.of_setRecCotizaOldNoCierra(ll_null)
	inv_log_recCotizado.of_setRecCotNoCierraOld(inv_RecCotizado.of_getRecCotizaOldNoCierra())
	IF ll_reccotnocierra = 0 THEN SetNull(ll_reccotnocierra) //Se borro el recurso cotizado	
	inv_log_recCotizado.of_setRecCotNoCierraNew(ll_reccotnocierra)
END IF 
end subroutine

public function string of_leerconstantestring (readonly string as_nombrevar);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName: of_LeerConstante
<DESC> Description: Inicializar constante </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> cargar constante </USAGE>
********************************************************************/
n_cst_comun		lnv_comun

IF lnv_comun.of_valorconstante(as_nombrevar,n_cst_application.itr_appl) = -1 THEN RETURN ''
RETURN lnv_comun.of_getString(1)
end function

public function integer of_cargarinforeportereccotizado (readonly dwitemstatus al_statusrecursocierra, readonly dwitemstatus al_statusrecursonocierra);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName : of_cargarInfoReporteRecCotizado
<DESC> Description:Esta funcion permite almacenar la informacion sobre las modificaciones realizada
a los recursos cotizados cierra o no cierra </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Cuando se modifica un recurso cotizado cierra o no cierra se debe invocar esta funcion, ya esta validara si se debe almacenar o no</USAGE>
********************************************************************/
//Se crea la Tabla log_RecCotizado: tabla que almacena la informacion sobre los cambios realizados a los recursos cotizados 
Long		ll_ref
Integer 	li_talla
String	ls_entrada 

Exception ex
ex = create Exception
Try
	ls_entrada = of_LeerConstanteString('ORIGENCAMBIORECCOTMUESTRABASICA')
	IF Of_ValidarGenerarInformacionRep() THEN //Validar si se deben cargan los datos a la tabla log_RecCotizado
		li_talla	= tab_medidas.tabpage_3.dw_referencias.GetItemNumber(1,'co_talla_ref')
		ll_ref	= tab_medidas.tabpage_3.dw_referencias.GetItemNumber(1,'co_referencia_ref')
		//Se inserta o actualiza el registro, al_muestrario
		IF al_statusRecursoCierra = datamodified! THEN
			of_cargarInfoRepRecCotizadoCierra(ls_entrada,li_talla,ll_ref)
		END IF 
		IF al_statusRecursoNoCierra = datamodified! THEN
			of_cargarInfoRepRecCotizadoNoCierra(ls_entrada,li_talla,ll_ref)
		END IF 
	END IF 

	RETURN 1 
CATCH( Throwable ex1)
	Throw ex1
	RETURN -1 
End try
//Campos: 
//Material
//Talla
//Recurso Cotizado (recurso que inicialmente ten$$HEX1$$ed00$$ENDHEX$$a)
//Cambio Recurso (recurso por el que cambia)
//Muestrario
//Fecha Modificaci$$HEX1$$f300$$ENDHEX$$n
//Usuario
//Entrada modificada
end function

public subroutine of_setinforeccotizadocierra (long al_reccotcierra);/********************************************************************
SA52045 - Ceiba/jjmonsal - 22-12-2015 FunctionName : of_SetInfoRecCotizadoCierra
<DESC> Description:Esta funcion permite almacenar la informacion sobre las modificaciones realizada
a los recursos cotizados cierra o no cierra </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Cuando se modifica un recurso cotizado Cierra se debe invocar </USAGE>
********************************************************************/
Long ll_null
SetNull(ll_null)

IF (inv_RecCotizado.of_getRecCotizaOldCierra() <> al_reccotcierra) THEN 
	//Se carga la informacion del cambio realizado Sobre el recurso cotizado Cierra 
	IF inv_RecCotizado.of_getRecCotizaOldCierra() = 0 THEN inv_RecCotizado.of_setRecCotizaOldCierra(ll_null)
	inv_log_recCotizado.of_setRecCotCierraOld(inv_RecCotizado.of_getRecCotizaOldCierra())
	IF al_reccotcierra = 0 THEN SetNull(al_reccotcierra) //Se borro el recurso cotizado
	inv_log_recCotizado.of_setRecCotCierraNew(al_reccotcierra)
END IF 
end subroutine

public subroutine of_setinforeccotizadonocierra (long al_reccotnocierra);/********************************************************************
SA52045 - Ceiba/jjmonsal - 22-12-2015 FunctionName : of_SetInfoRecCotizadoNoCierra
<DESC> Description:Esta funcion permite almacenar la informacion sobre las modificaciones realizada
a los recursos cotizados cierra o no cierra </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Cuando se modifica un recurso cotizado No cierra se debe invocar </USAGE>
********************************************************************/
Long ll_null

SetNull(ll_null)

IF inv_RecCotizado.of_getRecCotizaOldNoCierra() <> al_reccotnocierra THEN 
	//Se carga la informacion del cambio realizado Sobre el recurso cotizado no Cierra 
	IF inv_RecCotizado.of_getRecCotizaOldNoCierra() = 0 THEN inv_RecCotizado.of_setRecCotizaOldNoCierra(ll_null)
	inv_log_recCotizado.of_setRecCotNoCierraOld(inv_RecCotizado.of_getRecCotizaOldNoCierra())
	IF al_reccotnocierra = 0 THEN SetNull(al_reccotnocierra) //Se borro el recurso cotizado	
	inv_log_recCotizado.of_setRecCotNoCierraNew(al_reccotnocierra)
END IF 

end subroutine

public function integer of_cargarinforepreccotizadocierra (readonly string as_entrada, readonly long al_talla, readonly long al_ref);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName : of_cargarInfoRepRecCotizadoCierra
<DESC> Description:Esta funcion permite almacenar la informacion sobre las modificaciones realizada
a los recursos cotizados cierra o no cierra </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Cuando se modifica un recurso cotizado cierra </USAGE>
********************************************************************/
Long		ll_ref, ll_reccotcierra, ll_null,ll_muestrario
Integer 	li_talla

Exception ex
ex = create Exception
SetNull(ll_null)
Try
	ll_reccotcierra = dw_dt_muestras.object.co_reccotcierra[dw_dt_muestras.GetRow()]
	
	//Si se borra el cotizado queda nulo, se debe capturar y verificar contra el cero 
	IF ISNULL(ll_reccotcierra) THEN ll_reccotcierra = 0 
	//Cargar el muestrario 
	ll_muestrario = inv_log_recCotizado.of_cargarMuestrarioFichaMatPrima(il_fabrica,il_linea,il_muestra,al_talla,ll_reccotcierra)
	IF ISNULL(ll_muestrario) THEN ll_muestrario = 0 
	inv_log_recCotizado.of_validarRegExiste(il_fabrica,il_linea,il_muestra,ll_muestrario)
	CHOOSE CASE inv_log_recCotizado.of_getOperacion()
		CASE 'INSERT'
			inv_log_recCotizado.of_SetDatosInserccion(il_fabrica,il_linea,il_muestra,al_talla,al_ref,ll_muestrario,as_entrada)
		CASE 'UPDATE'	
			inv_log_recCotizado.of_setdatosupdate(as_entrada)
	END CHOOSE 
	
	of_SetInfoRecCotizadoCierra(ll_reccotcierra)//Cargar los datos Old y New de los recursos cotizados
	IF inv_log_recCotizado.OF_Update( ) < 0 THEN RETURN -1 
	RETURN 1 
CATCH( Throwable ex1)
	Throw ex1
	RETURN -1 
End try
end function

public function integer of_cargarinforepreccotizadonocierra (readonly string as_entrada, readonly long al_talla, readonly long al_ref);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName : of_cargarInfoRepRecCotizadoNoCierra
<DESC> Description:Esta funcion permite almacenar la informacion sobre las modificaciones realizada
a los recursos cotizados cierra o no cierra </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Cuando se modifica un recurso cotizado No cierra </USAGE>
********************************************************************/
Long		ll_ref, ll_reccotnocierra, ll_null,ll_muestrario
Integer 	li_talla

Exception ex
ex = create Exception
SetNull(ll_null)
Try
	ll_reccotnocierra	= dw_dt_muestras.object.co_reccotnocierra[dw_dt_muestras.GetRow()]
	
	//Si se borra el cotizado queda nulo, se debe capturar y verificar contra el cero 
	IF ISNULL(ll_reccotnocierra) THEN ll_reccotnocierra = 0 
	//Cargar el muestrario 
	ll_muestrario = inv_log_recCotizado.of_cargarMuestrarioFichaMatPrima(il_fabrica,il_linea,il_muestra,al_talla,ll_reccotnocierra)
	IF ISNULL(ll_muestrario) THEN ll_muestrario = 0 
	inv_log_recCotizado.of_validarRegExiste(il_fabrica,il_linea,il_muestra,ll_muestrario)
	CHOOSE CASE inv_log_recCotizado.of_getOperacion()
		CASE 'INSERT'
			inv_log_recCotizado.of_SetDatosInserccion(il_fabrica,il_linea,il_muestra,al_talla,al_ref,ll_muestrario,as_entrada)
		CASE 'UPDATE'	
			inv_log_recCotizado.of_setdatosupdate(as_entrada)
	END CHOOSE 
	
	of_SetInfoRecCotizadoNoCierra(ll_reccotnocierra)//Cargar los datos Old y New de los recursos cotizados
	IF inv_log_recCotizado.OF_Update( ) < 0 THEN RETURN -1 
	RETURN 1 
CATCH( Throwable ex1)
	Throw ex1
	RETURN -1 
End try
end function

public subroutine wf_eliminardatosasociadosestadocolormues (long al_talla, long al_color);/********************************************************************
SA55400 - Ceiba/jjmonsal - 17-08-2016 FunctionName : wf_EliminarDatosAsociadosEstadoColorMues
<DESC> Description: Esta funcion evita que se encuentren datos inconsistentes a la hora de eliminar un color por talla
debido a que, Si se ha borrado algun Color por talla, se debe limpiar adicionalmente el repositorio: dt_est_col_mues</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
********************************************************************/
Long			ll_fila, ll_filas
uo_dsbase	lds_dt_est_col_mues
Exception 	ex

Try
	ex = create Exception
	
	lds_dt_est_col_mues=Create uo_dsbase
	lds_dt_est_col_mues.DataObject="d_dt_est_col_mues"
	lds_dt_est_col_mues.SetTransObject(n_cst_application.itr_appl)
	ll_filas = lds_dt_est_col_mues.of_retrieve(il_fabrica,il_linea,il_muestra,al_talla,al_color)
	
	For ll_fila = 1 TO ll_filas
		lds_dt_est_col_mues.deleterow(0)
	Next 
	
	IF lds_dt_est_col_mues.of_update( ) < 0 THEN 
		of_error_muestra()
		ex.setmessage("Error al eliminar el color del repositorio Estado Color por muestra.")
		Throw ex
	End If

Catch(Exception ex1)
	Throw ex1
End Try
end subroutine

public subroutine wf_recorrerdatoseliminados_est_color_mue ();/********************************************************************
SA55400 - Ceiba/jjmonsal - 17-08-2016 FunctionName : wf_RecorrerDatosEliminados_Est_Color_Mue
<DESC> Description: Esta funcion evita que se encuentren datos inconsistentes a la hora de eliminar un color por talla
debido a que, Si se ha borrado algun Color por talla, se debe limpiar adicionalmente el repositorio: dt_est_col_mues</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
********************************************************************/
Long			ll_fila, ll_filas
uo_dsbase	lds_dt_est_col_mues
Exception 	ex

Try
	ex = create Exception
	ll_filas = dw_dt_muestras_col.DeletedCount( )
	FOR ll_fila = 1 TO ll_filas
		//Si se ha borrado algun Color por talla, se debe limpiar adicionalmente el repositorio: dt_est_col_mues
		wf_EliminarDatosAsociadosEstadoColorMues(dw_dt_muestras_col.getitemNumber(ll_fila,'co_talla',Delete!,False),&
																dw_dt_muestras_col.getitemNumber(ll_fila,'co_color',Delete!,False))
	NEXT 
Catch(Exception ex1)
	Throw ex1
End Try
end subroutine

public subroutine wf_cargavalorcampoenpdn ();/********************************************************************
SA55583 - Ceiba/jjmonsal - 21-09-2016 FunctionName : wf_CargaValorCampoEnPdn
<DESC> Description: Por cada color verificar por referencia - talla - color si esta en produccion o NO</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS>
********************************************************************/
Long							ll_referencia, ll_color, ll_fila, ll_filas, ll_valorCampoEnPdn
n_cst_tb_ordenprevfab	lonv_tb_ordenprevfab
Exception 	ex

Try
	ex 						= Create Exception
	lonv_tb_ordenprevfab	= Create n_cst_tb_ordenprevfab
	
	lonv_tb_ordenprevfab.of_CargarTransaccionalDB2()	
	lonv_tb_ordenprevfab.of_PreparaAmbRecuperarInformacionDS()
	ll_referencia	= tab_medidas.tabpage_3.dw_referencias.getItemNumber(1,'co_referencia_ref')
	
	ll_filas = dw_dt_muestras_col.RowCount()
	
	FOR ll_fila = 1 TO ll_filas
		ll_color			= dw_dt_muestras_col.getitemNumber(ll_fila,'co_color')
		lonv_tb_ordenprevfab.of_RecuperarInformacionDS(ll_referencia,il_talla,ll_color )
		IF lonv_tb_ordenprevfab.of_CargaValorCampoEnPdn() THEN 
			ll_valorCampoEnPdn = 1
			wf_PintarCheckCampoEnPDN(ll_fila)
		ELSE //Replicar Indicando que no esta en produccion en la FMP
			ll_valorCampoEnPdn = 0
		END IF 
		//Para que Replicar en Fmp por cada color si la logica al recuperar la informacion tambien se implemento en Fmp
		//lonv_tb_ordenprevfab.of_ReplicarCambiosFmp(ll_valorCampoEnPdn,il_fabrica,il_linea,il_muestra,il_talla,ll_color)
	NEXT
	lonv_tb_ordenprevfab.of_DestruirTransaccional()
	
Catch(Exception ex1)
	Throw ex1
End Try
end subroutine

public subroutine wf_pintarcheckcampoenpdn (readonly long al_fila);/********************************************************************
SA55583 - Ceiba/jjmonsal - 21-09-2016 FunctionName : wf_PintarCheckCampoEnPDN
<DESC> Description: Pintar checkeado el campo en produccion, por defecto no aparece checkeado
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS>
********************************************************************/
Try
	dw_dt_muestras_col.setitem(al_fila,'sw_enpdn',1)	
Catch(Exception ex1)
	Throw ex1
End Try
end subroutine

public subroutine wf_mostrarcampoenpdn (readonly boolean ab_bool);/********************************************************************
SA55583 - Ceiba/jjmonsal - 21-09-2016 FunctionName : wf_mostrarCampoEnPDN
<DESC> Description: Mostrar el campo en produccion, Por defecto esta oculto 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS>
********************************************************************/

Try
	dw_dt_muestras_col.Object.sw_enpdn_t.Visible = ab_bool
	dw_dt_muestras_col.Object.sw_enpdn.Visible = ab_bool
Catch(Exception ex1)
	Throw ex1
End Try
end subroutine

public subroutine wf_validarmostrarcargarcampoenpdn ();/********************************************************************
SA55583 - Ceiba/jjmonsal - 21-09-2016 FunctionName : wf_validarMostrarCargarCampoEnPDn
<DESC> Description: Validar si se debe o no mostrar el campo en produccion, este solo se muestra si la muestra fue convertida a referencia 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS>
********************************************************************/
Exception 	ex

Try
	ex 						= Create Exception
	IF tab_medidas.tabpage_3.dw_referencias.RowCount() > 0 THEN 
		wf_mostrarCampoEnPDN(TRUE)
		wf_CargaValorCampoEnPdn()
	END IF 
	
Catch(Exception ex1)
	Throw ex1
End Try
end subroutine

public function integer of_cargar_ficha_tejido ();//////////////////////////////////////////////////////////////////////////
// RENE ARIAS ESPARZA
// Jueves 11 de Mayo de 2017 HORA 11:06
// SA56750 - Ficha Pesos Sistema Mecatr$$HEX1$$f300$$ENDHEX$$nica Vs Muestras
// Funci$$HEX1$$f300$$ENDHEX$$n para cargar ficha de tejido del Sistema de mecatr$$HEX1$$f300$$ENDHEX$$nica
//////////////////////////////////////////////////////////////////////////

Long ll_co_muestra,ll_co_color,ll_nu_partemp,ll_nu_mp,ll_co_partemp,ll_co_combinacion
Long ll_co_producto_mp,ll_co_color_mp,ll_nu_conos,ll_consec,ll_co_tipoprod
Long ll_cnt_opcion,ll_co_centro,ll_co_fabrica_mp,ll_co_diseno,ll_color
Long ll_res,ll_tot,ll_kte_seg
Decimal ld_solo_seg,ld_peso_mp
String ls_alimentador,ls_portahilo,ls_enhebrado,ls_posicion,ls_tension,ls_instancia,ls_estado_parte
String ls_de_producto,ls_de_color,ls_de_combinacion,ls_usuario,ls_de_partemp,ls_filtro
DateTime ldt_fe_creacion,ldt_fe_actualizacion
Integer li_count,li_i,li_cont_reg,li_reg,i,li_reg2,li_cont_teo
n_cst_comun lo_c

ll_cnt_opcion = 1
ll_co_centro = 12
ll_co_tipoprod = 10
ll_co_fabrica_mp = 2
ldt_fe_creacion = DateTime(Today())
ldt_fe_actualizacion = DateTime(Today())
ls_usuario = n_cst_application.is_user
ls_instancia = 'crypro01'
ll_consec = 1
ll_co_diseno = 1
ll_kte_seg = 1200

dw_tmp_dt_fmp_muestras.Retrieve(il_muestra)

//Seleccionar el dw temporal
li_cont_reg = dw_tmp_dt_fmp_muestras.RowCount()

IF li_cont_reg = 0 THEN 
	MessageBox("Error","No hay ficha de tejido a cargar. " )
	dw_mat_prima.Retrieve(il_fabrica,il_linea,il_muestra)
	Return -1
Else
	ll_co_color  = dw_tmp_dt_fmp_muestras.getitemnumber(1, "co_color")
	li_reg = dw_dt_muestras_col.rowcount( )
	For li_i = 1 To li_reg
		ll_color = dw_dt_muestras_col.Getitemnumber(li_i, 'co_color')
		If ll_color = ll_co_color Then 
			dw_dt_muestras_col.setrow(li_i)
			dw_dt_muestras_col.selectrow(li_i, True)
			dw_dt_muestras_col.scrolltorow(li_i)
		End If
	Next
End If

// Validar que el c$$HEX1$$f300$$ENDHEX$$digo de la muestra exista
li_count = dw_mat_prima.Retrieve(il_fabrica,il_linea,il_muestra)

IF li_count > 0 THEN
// Borrar Muestras
	dw_mat_prima.Reset()
END IF

FOR li_i=1 TO li_cont_reg
	ll_co_color    	= dw_tmp_dt_fmp_muestras.getitemnumber( li_i, "co_color")
	ll_nu_partemp 		= dw_tmp_dt_fmp_muestras.getitemnumber( li_i, "nu_partemp")
	ll_nu_mp      		= dw_tmp_dt_fmp_muestras.getitemnumber( li_i, "nu_mp")
	ll_co_partemp 		= dw_tmp_dt_fmp_muestras.getitemnumber( li_i, "co_partemp") 
	ll_co_combinacion = dw_tmp_dt_fmp_muestras.getitemnumber( li_i, "co_combinacion")
 	ll_co_producto_mp = dw_tmp_dt_fmp_muestras.getitemnumber( li_i, "co_producto_mp")
	ls_de_producto 	= dw_tmp_dt_fmp_muestras.getitemstring( li_i, "de_producto") 
	ll_co_color_mp    = dw_tmp_dt_fmp_muestras.getitemnumber( li_i, "co_color_mp")
	ls_de_color   		= dw_tmp_dt_fmp_muestras.getitemstring( li_i, "de_color")
	ll_nu_conos       = dw_tmp_dt_fmp_muestras.getitemnumber( li_i, "nu_conos")
	ld_peso_mp			= dw_tmp_dt_fmp_muestras.getitemdecimal( li_i, "peso_mp")
	ls_alimentador 	= dw_tmp_dt_fmp_muestras.getitemstring( li_i, "alimentador")
	ls_portahilo		= dw_tmp_dt_fmp_muestras.getitemstring( li_i, "portahilo") 
	ls_enhebrado		= dw_tmp_dt_fmp_muestras.getitemstring( li_i, "enhebrado") 
	ls_posicion			= dw_tmp_dt_fmp_muestras.getitemstring( li_i, "posicion") 
	ls_tension			= dw_tmp_dt_fmp_muestras.getitemstring( li_i, "tension") 
	ld_solo_seg			= dw_tmp_dt_fmp_muestras.getitemdecimal( li_i, "solo_seg")
	ls_estado_parte =  dw_tmp_dt_fmp_muestras.getitemstring( li_i, "estado_parte")
	ls_filtro			="co_talla="+String(il_talla)+" and co_color="+String(ll_co_color)		

	// Validar el c$$HEX1$$f300$$ENDHEX$$digo de la parte mp
	ll_res=lo_c.of_nombrepartemp(ll_co_tipoprod,ll_co_partemp,n_cst_application.itr_appl)
	If ll_res<>1 Then
		MessageBox("Advertencia!","Parte no v$$HEX1$$e100$$ENDHEX$$lida",StopSign!)
		dw_mat_prima.Retrieve(il_fabrica,il_linea,il_muestra)
		of_nombre_parte_combinacion()
		of_borrar_ficha_tejido(il_muestra)
		Return -1
	End If
	ls_de_partemp = lo_c.of_getString(1)
	
	// Validar el c$$HEX1$$f300$$ENDHEX$$digo y la descripci$$HEX1$$f300$$ENDHEX$$n del producto
	
	If IsNull(ll_co_producto_mp) And (IsNull(ls_de_producto) Or Trim(ls_de_producto) = '') Then
		MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo de producto vac$$HEX1$$ed00$$ENDHEX$$o",StopSign!)
		dw_mat_prima.Retrieve(il_fabrica,il_linea,il_muestra)
		of_borrar_ficha_tejido(il_muestra)
		Return -1
	Else
		If Not IsNull(ll_co_producto_mp) Then
			ll_res=lo_c.of_nombreMatPrima(ll_co_producto_mp,n_cst_application.itr_appl)
			If ll_res<>1 Then
				MessageBox("Advertencia!","Producto no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
				dw_mat_prima.Retrieve(il_fabrica,il_linea,il_muestra)
				of_borrar_ficha_tejido(il_muestra)
				Return -1
			End If
			ls_de_producto = lo_c.of_getString(1)
		End If
	End If	

	// Validar el c$$HEX1$$f300$$ENDHEX$$digo de la combinaci$$HEX1$$f300$$ENDHEX$$n
	If Not IsNull(ll_co_combinacion) Then
		ls_de_combinacion=of_nombrecombinacion(ll_co_combinacion,il_talla)
		If ls_de_combinacion="" Then
			MessageBox("Advertencia!","Combinaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
			dw_mat_prima.Retrieve(il_fabrica,il_linea,il_muestra)
			of_borrar_ficha_tejido(il_muestra)
			Return -1
		End If
		ls_de_partemp = ls_de_combinacion
		ll_co_partemp = 999
	Else
		ls_de_combinacion = ""
	End If
	
	// Validar el c$$HEX1$$f300$$ENDHEX$$digo del color
	If Not IsNull(ll_co_color_mp) Then
		ll_res=lo_c.of_nombrecolor_mp(ll_co_fabrica_mp,ll_co_producto_mp,ll_co_color_mp,n_cst_application.itr_appl)
		If ll_res<>1 Then
			MessageBox("Advertencia!","Color no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
			dw_mat_prima.Retrieve(il_fabrica,il_linea,il_muestra)
			of_borrar_ficha_tejido(il_muestra)
			Return -1
		End If
		
		ll_res = of_validar_matprima(n_cst_application.itr_appl,ll_co_producto_mp,ll_co_color_mp,ll_co_fabrica_mp)
		If ll_res <> 1 Then
			MessageBox("Advertencia!","Existe por lo menos una combinaci$$HEX1$$f300$$ENDHEX$$n producto - matiz - caracter$$HEX1$$ed00$$ENDHEX$$stica - color - calidad en estado obsoleto ",StopSign!)
			dw_mat_prima.Retrieve(il_fabrica,il_linea,il_muestra)
			of_borrar_ficha_tejido(il_muestra)
			Return -1
		End If
		ls_de_color = lo_c.of_getString(1)
	End If	

	If IsNull(ld_peso_mp) Then ld_peso_mp = 0
	
	//Insertar en el dw de muestras
	dw_mat_prima.Insertrow(0)
	dw_mat_prima.Setitem( li_i, "co_fabrica", il_fabrica)
	dw_mat_prima.Setitem( li_i, "co_linea", il_linea)
	dw_mat_prima.Setitem( li_i, "co_muestra", il_muestra)
	dw_mat_prima.Setitem( li_i, "co_talla", il_talla)
	dw_mat_prima.Setitem( li_i, "co_color", ll_co_color)
	dw_mat_prima.Setitem( li_i, "cnt_opcion", ll_cnt_opcion)
	dw_mat_prima.Setitem( li_i, "consec", li_i)
	dw_mat_prima.Setitem( li_i, "co_centro", ll_co_centro)
	dw_mat_prima.Setitem( li_i, "nu_partemp", ll_nu_partemp)
	dw_mat_prima.Setitem( li_i, "nu_mp", ll_nu_mp)
	dw_mat_prima.Setitem( li_i, "co_tipoprod", ll_co_tipoprod)
	dw_mat_prima.Setitem( li_i, "co_partemp", ll_co_partemp)
	dw_mat_prima.Setitem( li_i, "co_combinacion", ll_co_combinacion)
	dw_mat_prima.Setitem( li_i, "de_parte_combinacion", ls_de_partemp)
	dw_mat_prima.Setitem( li_i, "co_fabrica_mp", ll_co_fabrica_mp)
	dw_mat_prima.Setitem( li_i, "co_producto_mp", ll_co_producto_mp)
	dw_mat_prima.Setitem( li_i, "de_producto", ls_de_producto)
	dw_mat_prima.Setitem( li_i, "co_color_mp", ll_co_color_mp)
	dw_mat_prima.Setitem( li_i, "de_color", ls_de_color)
	dw_mat_prima.Setitem( li_i, "peso_mp", ld_peso_mp)
	dw_mat_prima.Setitem( li_i, "nu_conos", ll_nu_conos)
	dw_mat_prima.Setitem( li_i, "fe_creacion", ldt_fe_creacion)
	dw_mat_prima.Setitem( li_i, "fe_actualizacion", ldt_fe_actualizacion)
	dw_mat_prima.Setitem( li_i, "usuario", ls_usuario)
	dw_mat_prima.Setitem( li_i, "instancia", ls_instancia)
	dw_mat_prima.Setitem( li_i, "alimentador", ls_alimentador)
	dw_mat_prima.Setitem( li_i, "portahilo", ls_portahilo)
	dw_mat_prima.Setitem( li_i, "enhebrado", ls_enhebrado)
	dw_mat_prima.Setitem( li_i, "posicion", ls_posicion)
	dw_mat_prima.Setitem( li_i, "tension", ls_tension)
	dw_mat_prima.Setitem( li_i, "co_diseno", ll_co_diseno)
	dw_mat_prima.Setitem( li_i, "estado_parte", ls_estado_parte)
								
Next

ll_tot=dw_dt_muestras_col.RowCount()
For i=1 To ll_tot
	ll_color=dw_dt_muestras_col.GetItemNumber(i,"co_color")		
	
	SELECT Count(*)
	INTO   :li_reg
	FROM   tmp_dt_fmp_muestras
	WHERE  co_muestra = :il_muestra
	AND    co_color   = :ll_color
	using n_cst_application.itr_appl  ;
	
	If li_reg > 0 Then
		//Revisar si hay datos en la tabla
		SELECT Count(*)
		INTO   :li_reg2
		FROM   dt_fmp_mue1
		WHERE  co_fabrica = :il_fabrica
		AND    co_linea   = :il_linea
		AND    co_muestra = :il_muestra
		AND    co_talla   = :il_talla
		AND    co_color   = :ll_color
		using n_cst_application.itr_appl  ;
	
		If li_reg2 > 0 Then
			// Borrar los datos de la tabla de muestras	
			DELETE FROM	dt_fmp_mue1
			WHERE  co_fabrica = :il_fabrica
			AND    co_linea   = :il_linea
			AND    co_muestra = :il_muestra
			AND    co_talla   = :il_talla
			AND    co_color   = :ll_color
			using n_cst_application.itr_appl  ;
		End If
	End If
NEXT

of_Redraw(True)

// Recalcular la producci$$HEX1$$f300$$ENDHEX$$n te$$HEX1$$f300$$ENDHEX$$rica
If ld_solo_seg > 0 Then
	ide_produc = Truncate(ll_kte_seg / ld_solo_seg,2)
Else
	MessageBox("Advertencia!","Solo segundos en cero.",StopSign!)
	dw_mat_prima.Retrieve(il_fabrica,il_linea,il_muestra)
	of_borrar_ficha_tejido(il_muestra)
	Return -1
End If	

// Actualizar la tabla de producci$$HEX1$$f300$$ENDHEX$$n te$$HEX1$$f300$$ENDHEX$$rica
SELECT COUNT(*)
INTO   :li_cont_teo
FROM m_producc_teo_bas
WHERE ( co_recurso = :il_recurso ) 
AND   ( co_fabrica = :il_fabrica ) 
AND   ( co_linea   = :il_linea ) 
AND   ( co_muestra = :il_muestra ) 
AND   ( co_talla   = :il_talla )
using n_cst_application.itr_appl  ;	

If li_cont_teo = 0 Then
	INSERT INTO m_producc_teo_bas
		(co_recurso,
	 	 co_fabrica,
	 	 co_linea,
	 	 co_muestra,
	 	 co_talla,
	 	 produccion_teo,
	 	 fe_actualizacion,
	 	 usuario,
	 	 instancia,
	 	 estado)
	 VALUES
	 	(:il_recurso,
		 :il_fabrica,
		 :il_linea,
		 :il_muestra,
		 :il_talla,
		 :ide_produc,
		 CURRENT,   
       USER,   
       DBSERVERNAME,  
		 'P')
	 using n_cst_application.itr_appl  ;	
Else	
	UPDATE 	m_producc_teo_bas 
	SET 	produccion_teo = :ide_produc
	WHERE ( co_recurso = :il_recurso ) 
	AND   ( co_fabrica = :il_fabrica ) 
	AND   ( co_linea   = :il_linea ) 
	AND   ( co_muestra = :il_muestra ) 
	AND   ( co_talla   = :il_talla )
	using n_cst_application.itr_appl  ;	
End If

MessageBox("OK!","Se realiz$$HEX2$$f3002000$$ENDHEX$$el proceso de cargue de fichas de tejido. " )
Return 1
	

end function

public function integer of_borrar_ficha_tejido (long an_muestra);// Borrar la tabla temporal de muestras
DELETE FROM	tmp_dt_fmp_muestras
WHERE  co_muestra = :an_muestra
using n_cst_application.itr_appl  ;
commit using n_cst_application.itr_appl  ;
Return 0
end function

public function integer of_nombre_tela (long al_tela, ref string as_de_tela, boolean ab_validar);/*
	FACL - 2019/01/03 - SA59582 -  Se valida el codigo de la Tela
*/
Long ll_filas

n_ds_application lds_tela

lds_tela = CREATE n_ds_application
lds_tela.of_Load( 'd_gr_h_telas_consulta' )
lds_tela.of_Conexion( n_cst_application.itr_appl, True )

ll_filas = lds_tela.Retrieve( al_tela )
If ll_filas > 0 Then
	If ab_validar Then
		If lds_tela.GetItemNumber( 1, 'co_procedencia' ) = 6 Then
			// ok
		Else
			MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'La Tela No es de Seamless!' )
			Destroy lds_tela
			Return -1
		End If
	End If
	as_de_tela = lds_tela.GetItemString( 1, 'de_reftel' )
ElseIf ll_filas = 0 Then
	If ab_validar Then
		MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'La Tela No existe!' )
	End If	
	as_de_tela = ''
Else
	If ab_validar Then
		MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'Ocurrio un error al consultar la tela!~r~n' + n_cst_application.itr_appl.SQLErrText )
		Destroy lds_tela
		Return -1
	End If
End If

Destroy lds_tela

Return ll_filas
end function

public function integer of_cambia_recurso_ficha_medida_mp ();
	UPDATE h_fmp_muestras
	SET co_recurso = :il_recurso_cambio
	WHERE co_fabrica = :il_fabrica
	AND co_linea = :il_linea
	AND co_muestra = :il_muestra
	AND co_diseno = 1
	USING n_cst_application.itr_appl;	
	
	UPDATE dt_med_mue
	SET co_recurso = :il_recurso_cambio
	WHERE co_fabrica = :il_fabrica
	AND co_linea = :il_linea
	AND co_muestra = :il_muestra
	AND co_diseno = 1
	USING n_cst_application.itr_appl;	
	
	
	COMMIT USING n_cst_application.itr_appl;	

RETURN 1
end function

on w_sheet_muestras1.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_muestra1" then this.MenuID = create m_muestra1
this.st_2=create st_2
this.cb_cargar_ficha_tejido=create cb_cargar_ficha_tejido
this.dw_tmp_dt_fmp_muestras=create dw_tmp_dt_fmp_muestras
this.dw_pares_tejer=create dw_pares_tejer
this.dw_actividades=create dw_actividades
this.dw_colores1=create dw_colores1
this.dw_combinacion=create dw_combinacion
this.dw_dt_muestras_col=create dw_dt_muestras_col
this.dw_muestra=create dw_muestra
this.gb_muestra=create gb_muestra
this.dw_dt_muestras=create dw_dt_muestras
this.tab_medidas=create tab_medidas
this.gb_colores=create gb_colores
this.dw_mat_prima=create dw_mat_prima
this.dw_h_fmp_muestras=create dw_h_fmp_muestras
this.gb_matprima=create gb_matprima
this.dw_observacion=create dw_observacion
this.gb_1=create gb_1
this.gb_procesos=create gb_procesos
this.st_1=create st_1
this.dw_operaciones=create dw_operaciones
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.cb_cargar_ficha_tejido
this.Control[iCurrent+3]=this.dw_tmp_dt_fmp_muestras
this.Control[iCurrent+4]=this.dw_pares_tejer
this.Control[iCurrent+5]=this.dw_actividades
this.Control[iCurrent+6]=this.dw_colores1
this.Control[iCurrent+7]=this.dw_combinacion
this.Control[iCurrent+8]=this.dw_dt_muestras_col
this.Control[iCurrent+9]=this.dw_muestra
this.Control[iCurrent+10]=this.gb_muestra
this.Control[iCurrent+11]=this.dw_dt_muestras
this.Control[iCurrent+12]=this.tab_medidas
this.Control[iCurrent+13]=this.gb_colores
this.Control[iCurrent+14]=this.dw_mat_prima
this.Control[iCurrent+15]=this.dw_h_fmp_muestras
this.Control[iCurrent+16]=this.gb_matprima
this.Control[iCurrent+17]=this.dw_observacion
this.Control[iCurrent+18]=this.gb_1
this.Control[iCurrent+19]=this.gb_procesos
this.Control[iCurrent+20]=this.st_1
this.Control[iCurrent+21]=this.dw_operaciones
end on

on w_sheet_muestras1.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_2)
destroy(this.cb_cargar_ficha_tejido)
destroy(this.dw_tmp_dt_fmp_muestras)
destroy(this.dw_pares_tejer)
destroy(this.dw_actividades)
destroy(this.dw_colores1)
destroy(this.dw_combinacion)
destroy(this.dw_dt_muestras_col)
destroy(this.dw_muestra)
destroy(this.gb_muestra)
destroy(this.dw_dt_muestras)
destroy(this.tab_medidas)
destroy(this.gb_colores)
destroy(this.dw_mat_prima)
destroy(this.dw_h_fmp_muestras)
destroy(this.gb_matprima)
destroy(this.dw_observacion)
destroy(this.gb_1)
destroy(this.gb_procesos)
destroy(this.st_1)
destroy(this.dw_operaciones)
end on

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 10 de Noviembre de 2004.H::
---------------------------------------------------
Modificaci$$HEX1$$f300$$ENDHEX$$n:Adici$$HEX1$$f300$$ENDHEX$$n de carga de obj. trans. para actividades & mpbase
---------------------------------------------------*/
String		ls_UNIDAD_PDN,ls_UNIDAD_MUESTRA_FMP
decimal		lde_TAMANO_MUESTRA_FMP
n_cst_comun lo_comun
//---------------------------------------------------
dw_muestra.SetTransObject(n_cst_application.itr_appl)

dw_dt_muestras.SetTransObject(n_cst_application.itr_appl)
dw_dt_muestras_col.SetTransObject(n_cst_application.itr_appl)

//SA56750 - Ceiba/reariase - 11-05-2017
dw_tmp_dt_fmp_muestras.SetTransObject(n_cst_application.itr_appl)
//Fin SA56750

tab_medidas.tabpage_1.dw_medidas1.SetTransObject(n_cst_application.itr_appl)
tab_medidas.tabpage_2.dw_med_rep.SetTransObject(n_cst_application.itr_appl)
tab_medidas.tabpage_3.dw_referencias.SetTransObject(n_cst_application.itr_appl)
tab_medidas.tabpage_diseno.dw_mu_dt_diseno.SetTransObject(n_cst_application.itr_appl)
tab_medidas.tabpage_diseno.dw_mu_dt_largo.SetTransObject(n_cst_application.itr_appl)
tab_medidas.tabpage_diseno.dw_mu_dt_puno.SetTransObject(n_cst_application.itr_appl)

//<************************************************************************************************
tab_medidas.tabpage_operaciones.dw_operaciones_mue.SetTransObject(n_cst_application.itr_appl)
tab_medidas.tabpage_actividades.dw_actividad_muestra.SetTransObject(n_cst_application.itr_appl)
tab_medidas.tabpage_mp_base.dw_mp_base.SetTransObject(n_cst_application.itr_appl)
//************************************************************************************************>

dw_h_fmp_muestras.SetTransObject(n_cst_application.itr_appl)
dw_mat_prima.SetTransObject(n_cst_application.itr_appl)

dw_combinacion.SetTransObject(n_cst_application.itr_appl)

//**********************************************************************************
		ids_validar_prod_proveedor = create n_ds_application
		
		ids_validar_prod_proveedor.dataobject="dgr_prod_proveedor"
		ids_validar_prod_proveedor.Settransobject(n_cst_application.itr_appl)
		
//**********************************************************************************


//////////////////////////////////////////////////////////////////////////
// Recupera las fabricas del ususario
// 
//////////////////////////////////////////////////////////////////////////


dw_muestra.getChild("co_fabrica",idc_fabrica)

lo_comun.of_loaddddw( idc_fabrica,n_cst_application.is_user,n_cst_application.itr_appl)

dw_muestra.getChild("co_linea",idc_linea)

lo_comun.of_loadDddw(idc_linea,0,n_cst_application.itr_appl)


dw_muestra.getChild("co_grupo_vta",idc_grupos_vta)
lo_comun.of_loadDddw(idc_grupos_vta,-1,n_cst_application.itr_appl)

dw_muestra.getChild("co_sgrupo_vta",idc_sgrupo_vta)
lo_comun.of_loadDddw(idc_sgrupo_vta,-1,n_cst_application.itr_appl)

dw_muestra.getChild("co_tipo_tejido",idc_tipo_tejido)
lo_comun.of_loadDddw(idc_tipo_tejido,10,n_cst_application.itr_appl)

dw_muestra.getChild("co_ref_exp",idc_ref_exp)
lo_comun.of_loadDddw(idc_ref_exp,0,0,0,n_cst_application.itr_appl)

//////////////////////////////////////////////////////////////////////////
// tallas por grupo
// co_talla
//////////////////////////////////////////////////////////////////////////

dw_dt_muestras.getChild("co_talla",idc_tallas_por_grupo )
lo_comun.of_loadDddw(idc_tallas_por_grupo,17,n_cst_application.itr_appl)

//////////////////////////////////////////////////////////////////////////
// Capturo los estilos de colores exp
// 
//////////////////////////////////////////////////////////////////////////

dw_dt_muestras_col.GetChild("co_color_exp",idc_colores_exp )
lo_comun.of_loadDddw(idc_colores_exp,0,0,"0",n_cst_application.itr_appl)

dw_dt_muestras.GetChild("co_talla_exp",idc_talla_exp )
lo_comun.of_loadDddw(idc_talla_exp,0,0,0,"0",n_cst_application.itr_appl)


il_co_cliente=0
il_co_sucursal=0
il_talla=-1
il_color=-1

dw_muestra.SetFocus()

//////////////////////////////////////////////////////////////////////////
// Partes base
// 
//////////////////////////////////////////////////////////////////////////
tab_medidas.tabpage_1.dw_medidas1.GetChild("co_partebas",idc_partebas)
il_tipo_prod=10
lo_comun.of_loadDddw(idc_partebas,il_tipo_prod,n_cst_application.itr_appl)

//////////////////////////////////////////////////////////////////////////
// Se carga la lista de fabricas permitidas para el usuario
// 
//////////////////////////////////////////////////////////////////////////

DataWindowChild ldc_fabrica

dw_muestra.getChild("co_fabrica",ldc_fabrica)
ldc_fabrica.SetTransObject(n_cst_application.itr_appl)
If ldc_fabrica.Retrieve(n_cst_application.is_user)<=0 Then
	MessageBox("Advertencia!","El usuario no tiene fabricas asignadas.",StopSign!)
	Return
End If
//////////////////////////////////////////////////////////////////////////
// Asigno los valores de las constantes
// 
//////////////////////////////////////////////////////////////////////////
long ll_res
n_cst_comun lo_c

ll_res=lo_c.of_valorconstante( "PARTEMP_GEN",n_cst_application.itr_appl )

If ll_res=1 Then
	il_PARTEMP_GEN=Long(lo_c.of_getDecimal(1))
Else
	il_PARTEMP_GEN=999
End If
ll_res=lo_c.of_valorconstante( "COMBINA_GEN",n_cst_application.itr_appl )

If ll_res=1 Then
	il_COMBINA_GEN=Long(lo_c.of_getDecimal(1))
Else
	il_COMBINA_GEN=999
End If
	
ll_res=lo_c.of_valorConstante( "UNIDAD_PDN",n_cst_application.itr_appl )


If ll_res=1 Then
	ls_UNIDAD_PDN=lo_c.of_getString(1)
Else
	MessageBox("Advertencia!","No se pudo determinar la unidad de pdn",StopSign!)
End If

ll_res=lo_c.of_valorConstante( "UNIDAD_MUESTRA_FMP",n_cst_application.itr_appl )

If ll_res=1 Then
	ls_UNIDAD_MUESTRA_FMP=lo_c.of_getString(1)
Else
	MessageBox("Advertencia!","No se pudo determinar la unidad de muestras",StopSign!)
End If


ll_res=lo_c.of_valorConstante( "TAMANO_MUESTRA_FMP",n_cst_application.itr_appl )

If ll_res=1 Then
	lde_TAMANO_MUESTRA_FMP=lo_c.of_getDecimal(1)
Else
	MessageBox("Advertencia!","No se pudo determinar Tama$$HEX1$$f100$$ENDHEX$$o de la muestra.",StopSign!)
End If

ll_res=lo_c.of_factorconversion(ls_UNIDAD_PDN /*string a_origen*/,&
                                ls_UNIDAD_MUESTRA_FMP/*string a_destino*/,&
										  n_cst_application.itr_appl/*transaction a_transaction */)
										  
If ll_res=1 Then
	ide_FACTOR_MUESTRA_A_PDN=lo_c.of_getDecimal(1)
	If lde_TAMANO_MUESTRA_FMP<>0 Then
		ide_FACTOR_MUESTRA_A_PDN/=lde_TAMANO_MUESTRA_FMP
	End If
	
Else
	MessageBox("Advertencia!","No se pudo determinar la conversi$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
End If

dw_pares_tejer.insertRow(0)

il_tipo_recurso = 1 // muestras

/*
* =============================================================================
* MODIFICADO: Julio 29 de 2009 - ohlondon
* -----------------------------------------------------------------------------
* Se filtra el tipo de producto con los que tiene el usuario. en el ddw se hace
* el join con m_usuario_tipoprod por lo que se debe enviar el usuario:
* =============================================================================
*/
dw_muestra.GetChild("co_tipoprod", idwc_tipoprod)
dw_muestra.GetChild("co_grupoprod", idwc_grupoprod)

lo_comun.of_loadDddw(idwc_tipoprod, n_cst_application.is_user, n_cst_application.itr_appl)
ll_res = idwc_tipoprod.RowCount() 
IF ll_res = 1 THEN 
	dw_muestra.SetItem(1, "co_tipoprod", idwc_tipoprod.GetItemNumber(1, 'co_tipoprod'))
	lo_comun.of_loadDddw(idwc_grupoprod,idwc_tipoprod.GetItemNumber(1, 'co_tipoprod'),n_cst_application.itr_appl)
ELSE
	lo_comun.of_loadDddw(idwc_grupoprod,-1,n_cst_application.itr_appl)
END IF

tab_medidas.tabpage_diseno.dw_mu_dt_diseno.GetChild('co_diseno', idwc_diseno)

// MODIFICADO: Noviembre 30 de 2010
// Se refresca el listado de codigos de dise$$HEX1$$f100$$ENDHEX$$os para que solo muestre los
// Disponibles, ademas para que muestre la opcion de ponerlo en blanco
DataWindowChild 	ldwc_diseno

dw_muestra.GetChild('co_diseno_muestra', ldwc_diseno)
lo_comun.of_loadDddw(ldwc_diseno,n_cst_application.itr_appl)

ldwc_diseno.InsertRow(1)
ldwc_diseno.SetItem(1, 'de_diseno', '')
ldwc_diseno.SetItem(1, 'descripcion', '')

/***********************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015
Comentario:Modificacion Correo automatico desde Muestras
***********************************************************/
inv_RecCotizado		= CREATE n_cst_recurso_cotizado
inv_log_reccotizado	= CREATE n_cst_log_reccotizado
inv_log_reccotizado.of_SetNombreDataObject('d_sq_gr_log_reccotizado')


end event

event ue_find;n_cst_param		lou_param
Int				li_cliente,li_sucursal
String			ls_tpped
Long				ll_res

Try
	If ib_cambios Then
		ll_res=MessageBox("Advertencia!","$$HEX1$$bf00$$ENDHEX$$Desea descartar los cambios?",Question!,YesNo!,2)
		
		If ll_res=2 Then
			Return 
		End If
	End If
	
	OpenWithParm(w_opc_muestra,is_where_busqueda)
	
	lou_param = Message.PowerObjectParm
	of_Redraw(False)
	wf_mostrarCampoEnPDN(FALSE) //SA55583 - Ceiba/jjmonsal - 21-09-2016: Limpiar visibilidad despues de una busqueda
	If IsValid(lou_param) Then
		il_fabrica=-1
		il_muestra=-1
		il_talla=-1
		il_color=-1
		il_opcion=-1
		il_recurso=-1
		of_buscar(lou_param.il_vector[1],lou_param.il_vector[2],lou_param.il_vector[3])		
		is_where_busqueda=lou_param.is_vector[1]
	End If
	
	of_Redraw(True)
CATCH(Throwable th_ex)
	Messagebox("Ocurrio una Excepci$$HEX1$$f300$$ENDHEX$$n", th_ex.getmessage())
End Try

end event

event ue_save;call super::ue_save;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 20 de Septiembre de 2002 HORA 14:57:10:546
// 
// Aca se guardan los datos..
//////////////////////////////////////////////////////////////////////////
ib_guardar_ok = false
long ll_muestra
If of_validar()<>1 Then
	Return
End If

of_Redraw(False)
If of_grabar()<>1 Then
	of_Redraw(True)
	Return
End If


ll_muestra=dw_muestra.getItemNUmber(1,"co_muestra")

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","La muestra "+String(ll_muestra)+" se registr$$HEX2$$f3002000$$ENDHEX$$satisfactoriamente.")

ib_cambios=False

of_buscar(il_fabrica,il_linea,il_muestra)

of_Redraw(True)

ib_guardar_ok = true
ib_cambios_med=false
ib_cambios_medReposadas = False
end event

event key;
IF keyflags = 1 THEN

	If Key = Key1! Then
		of_scroll(0)
		dw_muestra.SetFocus()
	ElseIf key= Key2! Then
		of_scroll(4)
		tab_medidas.tabpage_1.dw_medidas1.SetFocus()
		tab_medidas.SelectTab(tab_medidas.tabpage_1)

	ElseIf key= Key3! Then
		of_scroll(4)
		tab_medidas.tabpage_2.dw_med_rep.SetFocus()
		tab_medidas.SelectTab(tab_medidas.tabpage_2)

	ElseIf key= Key4! Then
		of_scroll(7+4)
		dw_dt_muestras_col.setFocus()		
	ElseIf key= Key5! Then
		of_scroll(7+4)
		tab_medidas.tabpage_operaciones.dw_operaciones_mue.setFocus()		
	ElseIf key= Key6! Then
		of_scroll(12+4)
		dw_h_fmp_muestras.setFocus()			
	ElseIf key= Key7! Then
		of_scroll(19+4)
		dw_observacion.setFocus()				
	End If
	
End If		
end event

event close;call super::close;/***********************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015
Comentario: Destruir entidad 
***********************************************************/
IF IsValid(inv_RecCotizado) THEN 
	Destroy inv_RecCotizado
END IF 
IF IsValid(inv_log_reccotizado) THEN 
	Destroy inv_log_reccotizado
END IF 


end event

type st_2 from statictext within w_sheet_muestras1
integer x = 2395
integer y = 3020
integer width = 1074
integer height = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 79741120
string text = "Texto rojo : Significa que existen partes de materia prima en estado inactivo"
boolean focusrectangle = false
end type

type cb_cargar_ficha_tejido from commandbutton within w_sheet_muestras1
boolean visible = false
integer x = 3529
integer y = 2192
integer width = 507
integer height = 176
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cargar Ficha Tejido"
end type

event clicked;of_cargar_ficha_tejido()
end event

type dw_tmp_dt_fmp_muestras from datawindow within w_sheet_muestras1
boolean visible = false
integer x = 2583
integer y = 4616
integer width = 485
integer height = 200
integer taborder = 130
boolean enabled = false
string title = "none"
string dataobject = "d_tmp_dt_fmp_muestras"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_pares_tejer from u_dw_application within w_sheet_muestras1
integer x = 37
integer y = 2724
integer width = 2523
integer height = 100
integer taborder = 50
boolean bringtotop = true
string title = "Tallas (Ctrl+2)"
string dataobject = "d_ext_pares_cantidad"
boolean hscrollbar = true
boolean vscrollbar = false
boolean hsplitscroll = true
end type

event itemchanged;call super::itemchanged;/* Si el usuario ha editado las cantidades de tejer se invoca la
	funcion que distribuye la nueva cantidad uniforme en todos los colores
*/
If dwo.name="pares_tejer" OR dwo.name="pares_despachar" then
	of_distrib_cant_colores(Long(Data),dwo.name)
//	Long ll_cant_pares_editado
//	String ls_ncol_pares
//	ls_ncol_pares = dwo.name //pq las columnas en el dw_dt_muestras_col tienen el mismo nombre
//	ll_cant_pares_editado = Long (Data)
//	of_distrib_cant_colores(ll_cant_pares_editado,ls_ncol_pares)
End If

end event

type dw_actividades from u_dw_application within w_sheet_muestras1
boolean visible = false
integer x = 1902
integer y = 4636
integer width = 549
integer height = 192
integer taborder = 120
string dataobject = "d_mu_m_actividad_sel"
boolean vscrollbar = false
boolean border = true
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

type dw_colores1 from u_dw_application within w_sheet_muestras1
boolean visible = false
integer x = 1280
integer y = 4636
integer width = 475
integer height = 192
integer taborder = 60
string dataobject = "d_ext_copia_color"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type dw_combinacion from u_dw_application within w_sheet_muestras1
boolean visible = false
integer x = 841
integer y = 4636
integer width = 402
integer height = 184
integer taborder = 110
string dataobject = "d_combinaciones_por_muestra"
boolean vscrollbar = false
boolean border = true
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

type dw_dt_muestras_col from u_dw_application within w_sheet_muestras1
event ue_move ( )
integer x = 27
integer y = 2252
integer width = 3328
integer height = 456
integer taborder = 40
string dataobject = "d_dt_muestras_col"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event ue_move();//////////////////////////////////////////////////////////////////////////
// cambio de posicion
// 
//////////////////////////////////////////////////////////////////////////
x=727
y=284
end event

event doubleclicked;call super::doubleclicked;If dwo.name="co_color_exp_t" Then
	If RowCount()=0 Then
	   of_coloresTodos()
	End If
End If

n_cst_param lo_param
long ll_null
SetNull(ll_null)

If Row>0 Then
	If dwo.name="filaa" Then
		This.RowsCopy(Row,Row,Primary!,This,row+1,Primary!)
		SetItem(row+1,"co_color",ll_null)
		Return
	End If
	
	If dwo.name="co_color" then
		lo_param.il_vector[1]=dw_muestra.GetItemNumber(1,"co_fabrica")
		lo_param.il_vector[2]=dw_muestra.GetItemNumber(1,"co_linea")
		
		OpenWithParm(w_bus_m_colores,lo_param)
		
		lo_param=Message.PowerObjectParm
		
		If IsValid(lo_param) Then
			SetText(String(lo_param.il_vector[1]))
			AcceptText()
		End If		

		
	End If
End If


end event

event getfocus;call super::getfocus;gb_colores.of_color(True)
end event

event itemchanged;call super::itemchanged;If il_err_item_change<>0 Then
	Return 2
End If
long ll_color,ll_pos,ll_res
n_cst_comun lo_comun

If dwo.name="co_color" Then
	ll_pos=find("co_color="+data,1,RowCount())
	If ll_pos>0 then
		MessageBox("Advertencia!","El color ya existe.",StopSign!)
		Return 2
	End If
	
	If dw_h_fmp_muestras.RowCount()>0 Then
		MessageBox("Advertencia!","No se puede modificar porque existe materia prima, verifique por favor.",StopSign!)
		Return 2
	End If


	ll_color=Long(Data)
	ll_res=lo_comun.of_nombrecolor( il_fabrica,il_linea ,ll_color,n_cst_application.itr_appl)
	If ll_res<>1 Then
		MessageBox("Advertencia!","Color no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_color",lo_comun.of_getString(1))
	of_filtro_color(ll_color,Row)
	
End If
//******************************************************************************
//Codigo para la edicion de los campos de pares : tejer y despachar
/* Cuando estos campos sean editados, deben actualizar los totales de pares a tejer y
		despachar que est$$HEX1$$e100$$ENDHEX$$n en el  dw 'dw_muestra'.*/
If dwo.name="pares_tejer" Then	
	IF Long(Data) > 32766 THEN
		MessageBox("Advertencia!","El valor Ingresado no es v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	END IF
		This.SetItem(row,"pares_tejer",Long(Data))
		dw_pares_tejer.Object.pares_tejer[1] = This.Object.compute_ptejer[1]		
End If
//
If  dwo.name="pares_despachar" then
		IF Long(Data) > 32766 THEN
			MessageBox("Advertencia!","El valor Ingresado no es v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
			Return 2
		END IF
		This.SetItem(row,"pares_despachar",Long(Data))
		dw_pares_tejer.Object.pares_despachar[1] = This.Object.compute_pdespa[1]
End If
If  dwo.name="co_formula" then
	IF Long(Data) > 32766 THEN
		MessageBox("Advertencia!","El valor Ingresado no es v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	END IF
END IF


///////////////////////////////////////
ib_cambios=True
end event

event losefocus;call super::losefocus;gb_colores.of_color(False)
end event

event sqlpreview;call super::sqlpreview;//MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!",sqlsyntax)

end event

event ue_insertrow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 26 de Mayo de 2004 HORA 08:14:59:171
// 
// Se verifica que cuando se esta borrando no se insertan nuevos datos
//////////////////////////////////////////////////////////////////////////

If This.deletedCount()>0 Then
	MessageBox("Advertencia!","Se han borrado datos, por favor guarde antes de continuar.",StopSign!)
	Return	
End If

If il_talla<0 Then
	MessageBox("Advertencia!","Debe especificar la talla.",StopSign!)
	Return
End If

super::event ue_insertRow()

long ll_fila

ll_fila=getRow()

SetItem(ll_fila,"co_talla",il_talla)

SetColumn("co_color_exp")
end event

event ue_deleterow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 04 de Octubre de 2002 HORA 11:36:36:062
//////////////////////////////////////////////////////////////////////////
If dw_h_fmp_muestras.RowCount()>0 Then
	MessageBox("Advertencia!","No se puede borrar porque existe materia prima, verifique por favor.",StopSign!)
	Return
End If

super::event ue_DeleteRow()
end event

event ue_dwnprocessenter;If This.AcceptText() < 0 then
  Return 1
End If

If This.GetColumn() = 10 then 
	if this.GetRow() = this.RowCount() then
		PostEvent("ue_insertrow")
   	Return 1
 	end if
	
end if

Send(Handle(this),256,9,Long(0,0))
return 1

end event

event rowfocuschanged;call super::rowfocuschanged;If currentrow=0 OR RowCount()=0 Then Return
//Messagebox('Var','il_fila_color='+String(il_fila_color)+'~n'+&
//'row='+String(row)+'~n')

If currentrow<>il_fila_color Then
	of_filtro_color(GetItemNumber(currentrow,"co_color"),&
	currentrow)
End If




end event

event itemfocuschanged;call super::itemfocuschanged;dw_pares_tejer.Object.pares_tejer[1] = This.Object.compute_ptejer[1]
dw_pares_tejer.Object.pares_despachar[1] = This.Object.compute_pdespa[1]
end event

event editchanged;call super::editchanged;If dwo.name='pares_tejer' OR dwo.name='pares_despachar'then
	If this.Object.co_color[row]=999 or this.Object.co_color[row]=888 then
		this.Object.pares_tejer[row]=0
		this.Object.pares_despachar[row]=0
	End If
End If
end event

type dw_muestra from u_dw_application within w_sheet_muestras1
event ue_move pbm_move
integer x = 27
integer y = 64
integer width = 3438
integer height = 724
boolean bringtotop = true
string dataobject = "d_m_muestras"
boolean vscrollbar = false
boolean livescroll = false
end type

event ue_move;//x=18
//y=48
//gb_muestra.y=0

//
end event

event getfocus;call super::getfocus;gb_muestra.of_color(True)


end event

event losefocus;call super::losefocus;gb_muestra.of_color(False)
end event

event ue_insertrow;Long ll_res
If ib_cambios Then
	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
	
	If ll_res=2 Then
	 Return
	End If
End If

of_reset()

//dw_detalle.Reset()
il_muestra=0
long ll_1

Parent.title="Muestras"

call super::ue_insertrow	

dw_dt_muestras.InsertRow(0)

ll_res = idwc_tipoprod.RowCount() 
IF ll_res = 1 THEN 
	ll_res = idwc_tipoprod.GetItemNumber(1, 'co_tipoprod')
	dw_muestra. event itemchanged(1, Object.co_tipoprod, String(ll_res))
	dw_muestra.SetItem(1, 'co_tipoprod', ll_res)
END IF

ib_new=TRUE 
end event

event itemchanged;call super::itemchanged;Long ll_base_peso, ll_base_peso_ant, ll_n
long ll_solicitud,ll_null,ll_res,ll_cliente,ll_dato, ll_muestra
String ls_referencia,ls_tipo_muestra, ls_de_tela
Date ldt_feentrega, ldt_system_date
Integer li_ret
n_cst_comun lo_comun
DataWindowChild ldc_datos

if il_err_item_change>0 Then
	Return 2
End If

CHOOSE CASE dwo.name
	CASE "de_muestra" 
		If of_validarcadena( data)<>1 Then
			Return 2
		End If
		
	CASE "co_linea" 	
		If long(Data)=3 Then
			SetItem(1,"tipo_muestra","EX")
		Else
			SetItem(1,"tipo_muestra","NA")
		End If
		
		il_fabrica=GetItemNumber(row,"co_fabrica")
		il_linea=Long(Data)
		ll_solicitud=GetItemNumber(row,"nu_solicitud")
		ls_referencia=Trim(GetItemString(row,"co_ref_exp"))	
		
		lo_comun.of_loadDddw(idc_ref_exp,il_fabrica,ll_solicitud,il_linea,n_cst_application.itr_appl)
		
		lo_comun.of_loadDddw(idc_colores_exp,il_fabrica,ll_solicitud,ls_referencia,n_cst_application.itr_appl)
				
	CASE "co_fabrica"
		SetItem(row,"nu_solicitud",0)
		SetItem(row,"co_ref_exp","")
	//////////////////////////////////////////////////////////////////////////
	// Cargar los datos que dependen de la fabrica
	// 
	//////////////////////////////////////////////////////////////////////////
		il_fabrica=Long(Data)
		il_linea=getItemNumber(row,"co_linea")
		ll_solicitud=GetItemNumber(row,"nu_solicitud")
		ls_referencia=Trim(GetItemString(row,"co_ref_exp"))	
		
		of_cargar_dddw(il_fabrica)
		
		lo_comun.of_loadDddw(idc_ref_exp,il_fabrica,ll_solicitud,il_linea,n_cst_application.itr_appl)
		lo_comun.of_loadDddw(idc_colores_exp,il_fabrica,ll_solicitud,ls_referencia,n_cst_application.itr_appl)
		lo_comun.of_loadDddw(idc_talla_exp,il_fabrica,ll_solicitud,il_linea,ls_referencia,n_cst_application.itr_appl)
	
		If of_datos_solicitud(il_fabrica,ll_solicitud)<>1 Then
			Return 2
		End If
	
		If of_datos_dt_solicitud(il_fabrica,ll_solicitud,ls_referencia)<>1 Then
			Return 2
		End If
		
		setitem(1,"co_cliente",il_co_cliente)
		setitem(1,"co_sucursal",il_co_sucursal)
		SetItem(1,"tipo_muestra",is_tipo_solicitud)
		
		SetItem(1,"de_muestra",is_de_referencia)
		SetItem(1,"de_coleccion",is_nu_orden)
		
	CASE "co_tipoprod"
	//////////////////////////////////////////////////////////////////////////
	// Verificar que no existan partes base
	// 
	//////////////////////////////////////////////////////////////////////////    
		il_tipo_prod=Long(Data)
		SetItem(1,"co_tipo_tejido",0)
		of_retrieve_tipo_prod()
	
		// Si es ropa, por defecto en Tipo Medida se pone en Prenda (m_tipo_medida.id_tipo_med = 7)
		IF ( il_tipo_prod = 20) THEN 
			SetNull(ll_null)
			SetItem(1,"id_tipo_med",7)
			SetItem(1,"base_peso",1)
			SetItem(1,"co_grupo_tlla",ll_null)		
		ELSEIF ( il_tipo_prod = 10) THEN 
			SetItem(1,"base_peso",6)
			SetItem(1,"co_grupo_tlla",17)
			SetItem(1,"co_grupoprod",1)
			
		ELSEIF IsNull( il_tipo_prod ) THEN 
			il_tipo_prod = -1
			SetItem(1,"base_peso",6)
		END IF
	
		// Se filtran los ddw que sean del tipo de producto seleccionado.
		lo_comun.of_loadDddw(idwc_grupoprod,il_tipo_prod,n_cst_application.itr_appl)
		
		lo_comun.of_loadDddw(idc_tipo_tejido,il_tipo_prod,n_cst_application.itr_appl)
		
		lo_comun.of_loadDddw(idc_tipo_tejido,il_tipo_prod,n_cst_application.itr_appl)
		
		lo_comun.of_loadDddw(idwc_diseno,il_tipo_prod,n_cst_application.itr_appl)
		
		SetNull(ll_null)
	
		SetItem(1,"co_tipo_tejido",ll_null)
		
	CASE "nu_solicitud" 
		il_fabrica=getItemNumber(Row,"co_fabrica")
		il_linea=getItemNumber(Row,"co_linea")
		ll_solicitud=Long(Data)
	
		If of_datos_solicitud(il_fabrica,ll_solicitud)<>1 Then
			Return 2
		End If
		setitem(1,"co_cliente",il_co_cliente)
		setitem(1,"co_sucursal",il_co_sucursal)
		SetItem(1,"tipo_muestra",is_tipo_solicitud)
		SetItem(1,"fe_desarrollo",id_fecha_solicitud)
		
		ls_referencia=Trim(GetItemString(row,"co_ref_exp"))
		
		lo_comun.of_loadDddw(idc_ref_exp,il_fabrica,ll_solicitud,il_linea,n_cst_application.itr_appl)
		lo_comun.of_loadDddw(idc_colores_exp,il_fabrica,ll_solicitud,ls_referencia,n_cst_application.itr_appl)
		lo_comun.of_loadDddw(idc_talla_exp,il_fabrica,ll_solicitud,il_linea,ls_referencia,n_cst_application.itr_appl)
		
	
		If of_datos_dt_solicitud(il_fabrica,ll_solicitud,ls_referencia)<>1 Then
			Return 2
		End If
		
		SetItem(1,"de_muestra",is_de_referencia)
		SetItem(1,"de_coleccion",is_nu_orden)
		SetItem(1,"desarrollador",is_desarrollador)
		
	CASE "co_ref_exp"
		
		il_fabrica=getItemNumber(Row,"co_fabrica")
		ll_solicitud=GetItemNumber(row,"nu_solicitud")
		ls_referencia=Trim(Data)
		lo_comun.of_loadDddw(idc_colores_exp,il_fabrica,ll_solicitud,ls_referencia,n_cst_application.itr_appl)
		lo_comun.of_loadDddw(idc_talla_exp,il_fabrica,ll_solicitud,il_linea,ls_referencia,n_cst_application.itr_appl)
	
		If of_datos_dt_solicitud(il_fabrica,ll_solicitud,ls_referencia)<>1 Then
			Return 2
		End If
		SetItem(1,"de_muestra",is_de_referencia)
		SetItem(1,"de_coleccion",is_nu_orden)
		
	CASE "co_grupo_tlla"
		il_grupo_talla=Long(Data)
		lo_comun.of_loadDddw(idc_tallas_por_grupo,il_grupo_talla,n_cst_application.itr_appl )
		
	CASE "tipo_muestra" 
		ll_solicitud=getItemNumber(Row,"nu_solicitud")
		If ll_solicitud<>0 Then
			MessageBox("Advertencia!","No puede cambiar el tipo de muestra.",StopSign!)
			Return 2
		End If
		
	CASE "co_cliente" 
		ll_solicitud=GetItemNumber(Row,"nu_solicitud")
		If ll_solicitud<>0 Then
			MessageBox("Advertencia!","Este dato es de la solicitud, y no se puede cambiar.",StopSign!)
			Return 2
		End If
		SetNull(ll_null)
		SetItem(1,"co_sucursal",ll_null)
		
	CASE "co_sucursal" 
		ll_solicitud=GetItemNumber(Row,"nu_solicitud")
		ll_cliente=GetItemNumber(Row,"co_cliente")
		ll_dato=Long(data)
		If ll_solicitud<>0 Then
			MessageBox("Advertencia!","Este dato es de la solicitud, y no se puede cambiar.",StopSign!)
			Return 2
		End If
		ls_tipo_muestra=GetItemString(Row,"tipo_muestra")	
		
		of_datos_cliente(ls_tipo_muestra,ll_cliente,ll_dato)
		
	CASE "base_peso"
		IF il_tipo_prod <> 20 THEN
			AcceptText()
			ib_cambios=True
			RETURN 0
		END IF
			
		ll_base_peso_ant = GetItemDecimal(row, 'base_peso')
		
		/* 
		* MODIFICADO: Agosto 14 de 2009 - ohlondon
		* 
		* Al modificar la base del peso se debe verificar si es un
		* registro nuevo o sin es consultado y al que se le esta
		* cambiandio el valor. Para eso se hace uso de la variable
		* ib_new: True --> cuando es nuevo, False --> cuando se 
		* consulta.
		* Cuando dicha variable est$$HEX2$$e1002000$$ENDHEX$$en False se debe pedir una 
		* clave de autorizacion para modificar el peso, y sino
		* la tiene entonces no se deja modificar.
		*
		* La clave debe ser igual a la recuperada de m_constantes
		* con la variable PWD_MODIFY
		* NOTA: Si el valor de peso es 0.01 no lo debe cambiar.
		*/	
		IF NOT ib_new THEN
			Open(w_clave)
			// si no es valida o no la digita
			IF n_cst_application.ii_sw_clave = 0 THEN
				SetItem(row, 'base_peso', ll_base_peso_ant)
				RETURN 1
			END IF
			
			This.AcceptText( )
			ll_base_peso = Dec(data)
			ll_base_peso = GetItemDecimal(row, 'base_peso')
			
			If (ll_base_peso < 0 or isnull(ll_base_peso)) Then
				ll_base_peso = 0
			END IF
			ll_res = of_modificar_peso_mp(ll_base_peso, ll_base_peso_ant)
			IF ll_res = -1 THEN
				ROLLBACK USING n_cst_application.itr_appl;
				SetItem(row, 'base_peso', ll_base_peso_ant)
				RETURN 1
			END IF
		END IF
		
	CASE "id_tipo_med"
		ll_dato=long(data)
		ll_res=lo_comun.of_nombretipomedida(ll_dato /*long a_tipo_medida*/,&
														n_cst_application.itr_appl/*transaction a_transaction */)
														
		If ll_res<>1 Then
			MessageBox("Advertencia!","Tipo de medida no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
			Return 2
		End If
		SetItem(1,"de_tipo_med",lo_comun.of_getString(1))
		
	CASE "bpl_co_tipoprod"
		If trim(data) = '' Then Return 2
		If ( il_fabrica = 2 OR il_fabrica = 4 OR il_fabrica = 8 ) THEN 
			IF ( Trim(data)  = '1' OR Trim(data) = 'M' OR Trim(data) = 'L' ) THEN 
				Post MessageBox("Advertencia!","Tipo de Forma de Tejer no v$$HEX1$$e100$$ENDHEX$$lido para las f$$HEX1$$e100$$ENDHEX$$bricas 2, 4 y 8 .",StopSign!)
				Return 2
			End If		
		End If
		
		dw_muestra.getChild("bpl_co_tipoprod",ldc_datos)
		//valida que exista
		ll_n =  ldc_datos.Find('bpl_co_tipoprod = "' +trim(data)+'"', 1, ldc_datos.RowCount() +1 )
		//sino encuentra
		If ll_n <= 0 Then
			Post MessageBox("Advertencia!","Tipo de Forma de Tejer no v$$HEX1$$e100$$ENDHEX$$lido .",StopSign!)
			Return 2
		End if
		
		
	CASE "co_ejecutiva" 
		ls_tipo_muestra=GetItemString(1,"tipo_muestra")
		ll_dato=Long(Data)
		
		ll_res=lo_comun.of_nombreejecutiva(ls_tipo_muestra /*string a_tipo*/,&
													  ll_dato/*long a_codigo*/,&
													  n_cst_application.itr_appl/*transaction a_transaction */)
		If ll_res<>1 Then
			MessageBox("Advertencia!","Ejecutiva no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
			Return 2
		End If
		SetItem(1,"de_ejecutiva",lo_comun.of_getString(1))												  
		/* GAC ,  se va a validar que el tipo de tejido este activo*/
	CASE "co_tipo_tejido" 
		IF NOT IsNull(Data) THEN
			ll_dato=long(data)
			
			ll_res=of_validar_estadotipotejido(n_cst_application.itr_appl /*transaction a_transaction */,& 
												ll_dato /*long tipo de tejido*/)
															
			If ll_res<>1 Then
				MessageBox("Advertencia!","Tipo de tejido no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
					
				SetNull(ll_null)
				SetItem(1,"co_tipo_tejido",ll_null)
				
				Return 2
			End If
			If is_estado <> 'A' THEN
				MessageBox("Advertencia!","El tipo de Tejido digitado no esta Activo.",StopSign!)
				SetNull(ll_null)		
				SetItem(1,"co_tipo_tejido",ll_null)
							
				Return 1
			END IF
		END IF
		/*
* ----------------------------------------------------------------------------
* MODIFICADO: Agosto 13 de 2012 - ohlondon
* ----------------------------------------------------------------------------
* Se debe quitar la validacion al momento de asociar el dise$$HEX1$$f100$$ENDHEX$$o a la muestra
* ----------------------------------------------------------------------------
*/  //*** desde aca

	CASE "co_diseno_muestra"
		IF NOT IsNull(data) AND Trim(data) <> '' THEN
			ll_muestra = GetItemNumber(row, 'co_muestra')
			ll_res=lo_comun.of_validarcodigodiseno(data , ll_muestra, n_cst_application.itr_appl)
															
			If ll_res = 1 Then
				MessageBox("Advertencia!","El c$$HEX1$$f300$$ENDHEX$$digo de dise$$HEX1$$f100$$ENDHEX$$o "+Trim(data)+" ya est$$HEX2$$e1002000$$ENDHEX$$siendo usado en otra muestra.",StopSign!)
			ELSEIf ll_res = 2 Then
				MessageBox("Advertencia!","El c$$HEX1$$f300$$ENDHEX$$digo de dise$$HEX1$$f100$$ENDHEX$$o "+Trim(data)+" no existe.",StopSign!)
			End If
			
	//*/*** hasta aca
		End If
		
	CASE 'fe_entrega'
		If IsDate(Data) Then
			ldt_feentrega=Date(data)
			ldt_system_date=Today()
			If ldt_feentrega < ldt_system_date Then
					MessageBox(	"Advertencia!","La fecha de entrega ~""+String(ldt_feentrega,'YYYY/MM/DD')+"~" es menor que la fecha actual ~""+&
									String(ldt_system_date,'YYYY/MM/DD')+"~"",StopSign!)
					Return 2
			End If
		End If	
	// FACL - 2019/01/03 - SA59582 -  Se valida el codigo de la Tela
	Case 'co_reftel'
		ll_dato = Long( Data )
		If IsNull(ll_dato ) Then 
			This.SetItem( Row, 'de_tela', '' )
			Return 0 // Se permite el dato en blanco
		End If
		
		li_ret = Parent.Of_Nombre_Tela( ll_dato, ls_de_tela, True )
		If li_ret > 0 Then
			This.SetItem( Row, 'de_tela', ls_de_tela)
		Else
			Return 2
		End If
		
END CHOOSE
// --------------------------------------------------------------------

ib_cambios=True
end event

event ue_deleterow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 25 de Agosto de 2003 HORA 13:50:30:075
// 
// overwrite!!
//////////////////////////////////////////////////////////////////////////

end event

event doubleclicked;call super::doubleclicked;If row=0 Then Return

String ls_tipo_sol

n_cst_param lo_param

lo_param.il_vector[1]=0

CHOOSE CASE dwo.name
	CASE "co_cliente", "co_sucursal" 
			
		ls_tipo_sol=GetItemString(1,"tipo_muestra")
		
		If IsNull(ls_tipo_sol) Then
			MessageBox("Advertencia!","Debe especificar el tipo de solicitud.",StopSign!)
			Return
		End If
		lo_param.is_vector[1]=""
		lo_param.is_vector[2]=ls_tipo_sol
		OpenWithParm(w_opc_cliente,lo_param)
		lo_param=Message.PowerObjectParm
	//////////////////////////////////////////////////////////////////////////
	// Si seleccionan algo en la ventana, entonces asigna el cliente, la sucursal y 
	// llama el evento
	//////////////////////////////////////////////////////////////////////////
		
		If IsValid(lo_param) Then
			SetItem(1,"co_cliente",lo_param.il_vector[1])
			SetItem(1,"co_sucursal",lo_param.il_vector[2])
			//is_where_cliente=lo_param.is_vector[1]
			
			DWObject dwo_1
			dwo_1 = This.Object.co_sucursal
			trigger event itemchanged(1,dwo_1,String(lo_param.il_vector[2]))
		End If
		
	CASE "id_tipo_med" 
		open(w_bus_m_tipo_medida)
		lo_param=Message.powerObjectParm
	
		If IsValid(lo_param) Then
			SetText(String(lo_param.il_vector[1]))
			AcceptText()
		End If
		
	CASE "co_ejecutiva" 
		lo_param.is_vector[1]=GetItemString(1,"tipo_muestra")
		OpenWithParm(w_bus_ejecutivo_vendedor,lo_param)
		lo_param=Message.powerObjectParm
	
		If IsValid(lo_param) Then
			SetText(String(lo_param.il_vector[1]))
			AcceptText()
		End If
		
	CASE "co_diseno_muestra" 
		lo_param.is_vector[1]=GetItemString(1,"de_muestra")
		OpenWithParm(w_bus_disenos_sin_usar,lo_param)
		lo_param=Message.powerObjectParm
	
		If IsValid(lo_param) Then
			SetText(Trim(lo_param.is_vector[1]))
			AcceptText()
		End If
END CHOOSE
end event

event itemerror;RETURN 1
end event

type gb_muestra from u_gb_base within w_sheet_muestras1
integer width = 3511
integer height = 1144
integer taborder = 0
string text = "Muestra (Ctrl+1)"
end type

type dw_dt_muestras from u_dw_application within w_sheet_muestras1
event ue_move pbm_move
integer x = 32
integer y = 788
integer width = 2935
integer height = 332
integer taborder = 20
boolean bringtotop = true
string title = "Tallas (Ctrl+2)"
string dataobject = "d_dt_muestras"
boolean hscrollbar = true
boolean vscrollbar = false
boolean hsplitscroll = true
end type

event ue_move;//y=504
end event

event doubleclicked;call super::doubleclicked;//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	doubleclicked (event)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Diciembre 3 de 2013 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	se realizaran las busquedas con el evento dobleclick del mouse
//-------------------------------------------------------------------------
// ARGUMENTO:	integer xpos, integer ypos, long row, dwobject dwo 
// RETORNO	:	long [pbm_dwnlbuttondblclk]
//=========================================================================

//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 23 de Agosto de 2003 HORA 14:42:40:271
// 
// Se muestra la lista de rec restri
//////////////////////////////////////////////////////////////////////////
Long ll_res, ll_null, ll_recurso_old
long ll_fabrica,ll_linea, ll_muestra
String ls_diseno
dataStore  lds_ficha_medida, lds_ficha_mat_prima
n_cst_param lo_param
n_cst_recurso		lnv_recursos

lnv_recursos		 =  CREATE n_cst_recurso

ll_recurso_old = GetitemNumber( row, "co_recurso")
ll_muestra = dw_muestra.GetitemNumber(1,"co_muestra")
ll_fabrica = dw_muestra.GetitemNumber(1,"co_fabrica")
ll_linea = dw_muestra.GetitemNumber(1,"co_linea")
ls_diseno = trim(dw_muestra.GetitemString(1,"co_diseno_muestra"))
		
SetNull(ll_null)

CHOOSE CASE dwo.name
	CASE "id_rec_rest" 
		/*
		* MODIFICADO: Julio 30 de 2009 - ohlondon
		* Se debe adicionar el filtro por el tipo de producto
		*/
		//Open(w_bus_m_recurso_tj)
		lo_param.il_vector[1] = il_tipo_prod
		OpenWithParm(w_bus_m_recurso_tj, lo_param)
	
		lo_param=Message.PowerObjectParm
	
		IF IsValid(lo_param) THEN
			SetText(String(lo_param.il_vector[1]))
			AcceptText()
		END IF

		//////////////////////////////////////////////////////////////////////////
		// JUAN FERNANDO VASQUEZ DUQUE 
		// Miercoles 23 de Febrero de 2005 HORA 17:08:58:593
		// 
		// se cambia para buscar del subconjunto de recursos de ct
		//////////////////////////////////////////////////////////////////////////
		
	CASE "co_recurso"
		/*
		* MODIFICADO: Julio 30 de 2009 - ohlondon
		* Se debe adicionar el filtro por el tipo de producto
		*/
		//Open(w_bus_mu_recurso_ct)
		
		lo_param.il_vector[1] = il_tipo_prod
		OpenWithParm(w_bus_mu_recurso_ct, lo_param)
	
		lo_param=Message.PowerObjectParm
	
		IF IsValid(lo_param) THEN
			
			il_recurso_cambio = lo_param.il_vector[1]
			
			IF Of_ValidarGenerarInformacionRep() THEN //Validar si la muestra es convertida a ref
		
				lds_ficha_medida		= CREATE datastore
				lds_ficha_medida.dataobject = 'd_gr_ficha_medidas'
				lds_ficha_medida.settransobject( n_cst_application.itr_appl)
				
				//valida que el recurso que se modifica no tenga ficha de medida
				If lds_ficha_medida.retrieve(ll_fabrica,ll_linea,ll_muestra,ls_diseno,ll_recurso_old) > 0 Then
					Post MessageBox("Advertencia!","El recurso de la muestra (actual) tiene ficha de medidas asociado debe eliminar la ficha de medidas.")
					Destroy lds_ficha_medida
					Return 2
				End if
				
				//valida que el recurso que se modifica no tenga ficha de medida
				If lds_ficha_medida.retrieve(ll_fabrica,ll_linea,ll_muestra,ls_diseno,il_recurso_cambio) > 0 Then
					Post MessageBox("Advertencia!","El recurso de la muestra (nuevo) tiene ficha de medidas asociado debe eliminar la ficha de medidas.")
					Destroy lds_ficha_medida
					Return 2
				End if
				Destroy lds_ficha_medida
				
				lds_ficha_mat_prima		= CREATE datastore
				lds_ficha_mat_prima.dataobject = 'd_gr_ficha_mat_prima'
				lds_ficha_mat_prima.settransobject( n_cst_application.itr_appl)
				
				//valida que el recorso que se modifica no tenga ficha de medida
				If lds_ficha_mat_prima.retrieve(ll_fabrica,ll_linea,ll_muestra,ls_diseno,ll_recurso_old) > 0 Then
					Post MessageBox("Advertencia!","El recurso de la muestra (actual) tiene ficha de materia prima  asociado debe eliminar la ficha de MPs.")
					Destroy lds_ficha_mat_prima
					Return 2
				End if
				
				//valida que el recorso que se modifica no tenga ficha de medida
				If lds_ficha_mat_prima.retrieve(ll_fabrica,ll_linea,ll_muestra,ls_diseno,il_recurso_cambio) > 0 Then
					Post MessageBox("Advertencia!","El recurso de la muestra (nuevo) tiene ficha de materia prima  asociado debe eliminar la ficha de MPs.")
					Destroy lds_ficha_mat_prima
					Return 2
				End if
				Destroy lds_ficha_mat_prima
							
			Else //IF Of_ValidarGenerarInformacionRep() THEN //Validar si la muestra es convertida a ref
				//actualiza fhica medida y ficha mp
				of_cambia_recurso_ficha_medida_mp()
			End if
			
//				IF of_verificar_borrado() > 0 THEN		
//					MessageBox("Advertencia!","El Recurso no puede ser cambiado ya que tiene informacion en ficha de Medidas.",StopSign!)
//					Return 2
//				End If
			SetText(String(lo_param.il_vector[1]))
			
			AcceptText()
		ELSE
			RETURN
		END IF
		
	CASE "co_reccotcierra"

		lo_param.il_vector[1] = il_tipo_prod
		lo_param.is_vector[1] = 'd_lista_m_recurso_sicierra'
		lo_param.is_vector[2] = "co_tipoprod = "+String(il_tipo_prod)
		
		OpenWithParm(w_bus_m_recurso, lo_param)
	
		lo_param=Message.PowerObjectParm
	
		IF IsValid(lo_param) THEN
			SetText(String(lo_param.il_vector[1]))
			AcceptText()
		ELSE
			RETURN
		END IF

		ll_res=lnv_recursos.of_nombreRecursoTj( lo_param.il_vector[1], n_cst_application.itr_appl)
												 
		IF ll_res=1 THEN
			SetItem(1,"de_recursocierra",lnv_recursos.of_getString(1))
		End If
		
		
		
	CASE "co_reccotnocierra"

		lo_param.il_vector[1] = il_tipo_prod
		lo_param.is_vector[1] = 'd_lista_m_recurso_nocierra'
		lo_param.is_vector[2] = "co_tipoprod = "+String(il_tipo_prod)
		
		OpenWithParm(w_bus_m_recurso, lo_param)
	
		lo_param=Message.PowerObjectParm
	
		IF IsValid(lo_param) THEN
			SetText(String(lo_param.il_vector[1]))
			AcceptText()
		ELSE
			RETURN
		END IF
		
		ll_res=lnv_recursos.of_nombreRecursoTj( lo_param.il_vector[1], n_cst_application.itr_appl)
												 
		IF ll_res=1 THEN
			SetItem(1,"de_recursonocierra",lnv_recursos.of_getString(1))
		End If
		
END CHOOSE

end event

event itemchanged;call super::itemchanged;long ll_pos,ll_dato,ll_resp, ll_muestra, ll_recurso_old, ll_res, ll_nulo, ll_filas, ll_respuesta
long ll_fabrica,ll_linea
String ls_co_reccotnocierra, ls_de_recursonocierra, ls_co_reccotcierra, ls_de_recursocierra, ls_diseno
Boolean lb_vacio
dataStore  lds_valdiseno, lds_ficha_medida, lds_ficha_mat_prima

SetNull(ll_nulo)

n_cst_comun lo_comun
n_ds_base lds_datos
lds_datos = CREATE n_ds_base 

n_cst_recurso	lnv_recurso
lnv_recurso		= CREATE n_cst_recurso

If il_err_item_change<>0 Then
	Return 2
End If

IF row > 0 THEN
	ll_recurso_old = GetitemNumber( row, "co_recurso")
END IF	
CHOOSE CASE dwo.name
	CASE "co_talla" 
	//////////////////////////////////////////////////////////////////////////
	// Verifico que la talla no exista
	// 
	//////////////////////////////////////////////////////////////////////////
		ll_pos=Find("co_talla="+Data,1,RowCount())
		
		If ll_pos>0 Then
			MessageBox("Advertencia!","La talla ya existe.",StopSign!)
			Return 2
		End If
		
		If of_hayDatos(dw_dt_muestras_col)=1 Then
			MessageBox("Advertencia!","No se puede cambiar porque existen colores.",StopSign!)
			Return 2
		End If
		
		of_filtro_talla(Long(Data),GetItemString(row,"co_talla_exp"),row)
		
	CASE "co_talla_exp" 
		If of_hayDatos(dw_dt_muestras_col)=1 Then
			MessageBox("Advertencia!","No se puede cambiar porque existen colores.",StopSign!)
			Return 2
		End If
		of_filtro_talla(GetItemNumber(row,"co_talla"),data,row)

	CASE "id_rec_rest" 	
		ll_dato=long(data)
		
		If IsNull(ll_dato) Then
			SetItem(row,"de_rec_rest","")
			Return 0
		End If
			
		ll_res=lo_comun.of_nombreRecursoTj(ll_dato,n_cst_application.itr_appl)	
		
		If ll_res<>1 Then
			MessageBox("Advertencia!","Recurso restrictivo no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
			Return 2
		End If
		SetItem(row,"de_rec_rest",lo_comun.of_getString(1))
		
	CASE "co_recurso"
		ll_dato=Long(Data)
		il_recurso_cambio = ll_dato
		//MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n', 'Mensaje de Prueba' )
		
//		IF of_verificar_borrado() > 0 THEN		
//			MessageBox("Advertencia!","El Recurso no puede ser cambiado ya que tiene informacion en ficha de Materia Prima y esta convertido en Referencia.",StopSign!)
//			Return 2
//		End If
		
		ll_dato=Long(Data)
		ll_muestra = dw_muestra.GetitemNumber(1,"co_muestra")
		ll_fabrica = dw_muestra.GetitemNumber(1,"co_fabrica")
		ll_linea = dw_muestra.GetitemNumber(1,"co_linea")
		ls_diseno = trim(dw_muestra.GetitemString(1,"co_diseno_muestra"))
		ib_cambia_recurso= false
		
		
		lds_valdiseno		= CREATE datastore
		lds_valdiseno.dataobject = 'd_validadiseno'
		lds_valdiseno.settransobject( n_cst_application.itr_appl)
		
		//lds_valdiseno.retrieve(ll_muestra,ll_dato)		
		
//		IF lds_valdiseno.Rowcount( ) > 0 THEN 
//			IF lds_valdiseno.object.co_diseno[1] <> 1 THEN
//				MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','El recurso ingresado ya ha sido utilizado por favor verificar la informacion.',Exclamation!)
//				RETURN 2
//			END IF			
//		END IF		
		
		IF ib_cambios_med THEN
			Post Messagebox("Advertencia","Debe guardar las medidas modificadas antes de cambiar el recurso")	
			Return 2
		END IF
		
		If IsNull(ll_dato) Then
			SetItem(row,"de_recurso","")	
			Object.co_reccotnocierra[1] = ll_nulo
			Object.co_reccotcierra[1] = ll_nulo			
//			Object.de_recursocierra[1] = ''
//			Object.de_recursonocierra[1] = ''			
			il_tipo_recurso = 1
			Return 0
		End If	
		
		
		IF il_tipo_recurso = 1 THEN
		
			ll_res=lo_comun.of_nombreRecursoMues(ll_dato,n_cst_application.itr_appl)
			
			If ll_res<>1 Then 
				ll_resp = MessageBox("Advertencia!","Recurso de muestras no v$$HEX1$$e100$$ENDHEX$$lido, Desea buscarlo como recurso de tejido?",Question!, yesNO!,2)
				IF ll_resp = 1 THEN
					il_tipo_recurso = 2
				ELSE
					Return 2								 
				END IF
			End If
		END IF
		
		IF il_tipo_recurso = 2 THEN
			ll_res=lo_comun.of_nombreRecursoTj(ll_dato,n_cst_application.itr_appl)	
		
			If ll_res<>1 Then
				Post MessageBox("Advertencia!","Recurso restrictivo no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
				Return 2
			End If
	
		END IF	
		il_tipo_recurso = 1
		
		IF ll_muestra <> 0 AND NOT ISNULL(ll_muestra) AND NOT isnull(ll_recurso_old) THEN
			ll_resp = Messagebox("Advertencia","La muestra ya tenia otro recurso asociado para cambiarlo debe guardar, Desea hacerlo ahora?",Question!, yesNO!,2)
			IF ll_resp = 2 THEN
				This.Setitem( row,"co_recurso",ll_recurso_old)				
				Return 2
			ELSE
				il_recurso = ll_dato
				parent.triggerevent("ue_save")
				IF NOT ib_guardar_ok THEN
					This.Setitem( row,"co_recurso",ll_recurso_old)					
					Return 2				
				END IF	
			END IF	
		END IF	
		
		ib_cambia_recurso= true
		il_recurso = ll_dato
		SetItem(Row,"de_recurso",lo_comun.of_getString(1))	
		
		ls_co_reccotnocierra = String(dw_dt_muestras.object.co_reccotnocierra[row],'')
		ls_de_recursonocierra = String(dw_dt_muestras.object.de_recursonocierra[row],'')
		ls_co_reccotcierra = String(dw_dt_muestras.object.co_reccotcierra[row],'')
		ls_de_recursocierra = String(dw_dt_muestras.object.de_recursocierra[row],'')		
		
		IF NOT ib_grabado THEN
			IF (ls_co_reccotnocierra <> '' AND ls_de_recursonocierra <> '') OR (ls_co_reccotcierra <> '' AND  ls_de_recursocierra <> '') THEN
				ll_respuesta = MessageBox('Cambio de Recurso','Desea Cambiar el recurso Cotizado?',Information!,YesNo!)	
				lb_vacio = FALSE
			ELSE
				lb_vacio = TRUE
			END IF
		ELSE
			ib_grabado = FALSE
		END IF
		
		IF ll_respuesta = 1 OR lb_vacio THEN
		
			IF lnv_recurso.of_validar_cierra_nocierra( Long(data)) > 0 THEN			
				IF lnv_recurso.of_Get_cierra() THEN
					Object.co_reccotcierra[Row] = il_recurso
					Object.de_recursocierra[Row] = Object.de_recurso[Row]
					
					Object.co_reccotnocierra[Row] = ll_nulo
					Object.de_recursonocierra[Row] = ''
				ELSE
					Object.co_reccotnocierra[Row] = il_recurso
					Object.de_recursonocierra[Row] = Object.de_recurso[Row]
					
					Object.co_reccotcierra[Row] = ll_nulo
					Object.de_recursocierra[Row] = ''
				END IF
			END IF
		END IF
		
		IF Of_ValidarGenerarInformacionRep() THEN //Validar si la muestra es convertida a ref
		
				lds_ficha_medida		= CREATE datastore
				lds_ficha_medida.dataobject = 'd_gr_ficha_medidas'
				lds_ficha_medida.settransobject( n_cst_application.itr_appl)
				
				//valida que el recurso que se modifica no tenga ficha de medida
				If lds_ficha_medida.retrieve(ll_fabrica,ll_linea,ll_muestra,ls_diseno,ll_recurso_old) > 0 Then
					Post MessageBox("Advertencia!","El recurso de la muestra (actual) tiene ficha de medidas asociado debe eliminar la ficha de medidas.")
					Destroy lds_ficha_medida
					Return 2
				End if
				
				//valida que el recurso que se modifica no tenga ficha de medida
				If lds_ficha_medida.retrieve(ll_fabrica,ll_linea,ll_muestra,ls_diseno,il_recurso_cambio) > 0 Then
					Post MessageBox("Advertencia!","El recurso de la muestra (nuevo) tiene ficha de medidas asociado debe eliminar la ficha de medidas.")
					Destroy lds_ficha_medida
					Return 2
				End if
				Destroy lds_ficha_medida
				
				lds_ficha_mat_prima		= CREATE datastore
				lds_ficha_mat_prima.dataobject = 'd_gr_ficha_mat_prima'
				lds_ficha_mat_prima.settransobject( n_cst_application.itr_appl)
				
				//valida que el recorso que se modifica no tenga ficha de medida
				If lds_ficha_mat_prima.retrieve(ll_fabrica,ll_linea,ll_muestra,ls_diseno,ll_recurso_old) > 0 Then
					Post MessageBox("Advertencia!","El recurso de la muestra (actual) tiene ficha de materia prima  asociado debe eliminar la ficha de MPs.")
					Destroy lds_ficha_mat_prima
					Return 2
				End if
				
				//valida que el recorso que se modifica no tenga ficha de medida
				If lds_ficha_mat_prima.retrieve(ll_fabrica,ll_linea,ll_muestra,ls_diseno,il_recurso_cambio) > 0 Then
					Post MessageBox("Advertencia!","El recurso de la muestra (nuevo) tiene ficha de materia prima  asociado debe eliminar la ficha de MPs.")
					Destroy lds_ficha_mat_prima
					Return 2
				End if
				Destroy lds_ficha_mat_prima
							
			Else //IF Of_ValidarGenerarInformacionRep() THEN //Validar si la muestra es convertida a ref
				//actualiza fhica medida y ficha mp
				of_cambia_recurso_ficha_medida_mp()
			End if
		
	CASE "co_reccotcierra"
		lds_datos.dataObject = 'd_nv_recursos_tj'
		lds_datos.SetTransobject( n_cst_application.itr_appl)
		IF Long(Data) < 1 THEN 
			THIS.accepttext( )
			MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','Recurso no existe',Exclamation!)
			Object.co_reccotcierra[1] = ll_nulo
			Object.de_recursocierra[1] = ''
			RETURN 2
		END IF
		lds_datos.Retrieve(Long(Data))

		ll_filas = lds_datos.Rowcount( )
		IF ll_filas > 0 THEN
			IF TRIM(String(lds_datos.Object.sw_cierra[1],'')) = '1' THEN
				ll_res=lnv_recurso.of_nombreRecursoTj( Long(data) ,n_cst_application.itr_appl)
				
				IF ll_res = 1 THEN
					Object.co_reccotcierra[1] = Long(Data)
					Object.de_recursocierra[1] = lnv_recurso.of_getString(1)
				END IF
			ELSE
				THIS.accepttext( )
				MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','Debe digitar un recurso que si cierra',Exclamation!)
				Object.co_reccotcierra[1] = ll_nulo
				Object.de_recursocierra[1] = ''
				RETURN 1
			END IF
		ELSE
			THIS.accepttext( )
			MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','Recurso no existe',Exclamation!)
			Object.co_reccotcierra[1] = ll_nulo
			Object.de_recursocierra[1] = ''
			RETURN 1
		END IF 
		
	CASE "co_reccotnocierra"
		
		lds_datos.dataObject = 'd_nv_recursos_tj'
		lds_datos.SetTransobject( n_cst_application.itr_appl)
		lds_datos.Retrieve(Long(Data))
		
		IF TRIM(String(Data,'')) = '0' THEN
			THIS.accepttext( )
			MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','Recurso no existe',Exclamation!)
			Object.co_reccotnocierra[1] = ll_nulo
			Object.de_recursonocierra[1] = ''
			RETURN 1
		END IF
		
		ll_filas = lds_datos.Rowcount( )
		IF ll_filas > 0 THEN
			/***********************************************************
			SA57695
			Se adiciona la condicion con el '2' que ahora indica Doble Cilindro. JCMR 07-11-2017
			***********************************************************/
			IF TRIM(String(lds_datos.Object.sw_cierra[1],'')) = '0' Or &
				TRIM(String(lds_datos.Object.sw_cierra[1],'')) = '2' THEN
				ll_res=lnv_recurso.of_nombreRecursoTj( Long(Data), n_cst_application.itr_appl)
				
				IF ll_res = 1 THEN
					Object.co_reccotnocierra[1] = Long(Data)
					Object.de_recursonocierra[1] = lnv_recurso.of_getString(1)
				END IF
			ELSE
				THIS.accepttext( )
				MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','Debe digitar un recurso que no cierra',Exclamation!)
				Object.co_reccotnocierra[1] = ll_nulo
				Object.de_recursonocierra[1] = ''
				RETURN 1
			END IF
		ELSE
			THIS.accepttext( )
			MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','Recurso no existe',Exclamation!)
			Object.co_reccotnocierra[1] = ll_nulo
			Object.de_recursonocierra[1] = ''
			RETURN 1
		END IF 
		
		
END CHOOSE
ib_cambios=True
end event

event itemfocuschanged;call super::itemfocuschanged;If Row=0 Then Return

If row<>il_fila_sel Then
	of_filtro_talla(GetItemNumber(row,"co_talla"),&
	GetItemString(row,"co_talla_exp"),row)
End If



end event

event losefocus;call super::losefocus;gb_muestra.of_color(False)


end event

event ue_insertrow;//////////////////////////////////////////////////////////////////////////
//hay que poner algo para poder sobrescribir!
// 
//////////////////////////////////////////////////////////////////////////

end event

event getfocus;call super::getfocus;gb_muestra.of_color(True)


end event

event rbuttondown;n_cst_param lo_param
Long ll_resp

If dwo.name="id_rec_rest" Then
//	Open(w_bus_m_recurso_tj)
//
//	lo_param=Message.PowerObjectParm
//
//	If IsValid(lo_param) Then
//		SetText(String(lo_param.il_vector[1]))
//		AcceptText()
//	End If
End If


If dwo.name="co_recurso" Then
//	Open(w_bus_mu_recurso_ct)
//
//	lo_param=Message.PowerObjectParm
//
//	If IsValid(lo_param) Then
//		SetText(String(lo_param.il_vector[1]))
//		AcceptText()
//	End If

	ll_resp = Messagebox("Advertencia","Desea buscar en la tabla de recursos de tejido",Question!,yesno!,2)

	IF ll_resp = 1 THEN
		/*
		* MODIFICADO: Julio 30 de 2009 - ohlondon
		* Se debe adicionar el filtro por el tipo de producto
		*/
		//Open(w_bus_m_recurso_tj)
		lo_param.il_vector[1] = il_tipo_prod
		OpenWithParm(w_bus_m_recurso_tj, lo_param)

		lo_param=Message.PowerObjectParm

		If IsValid(lo_param) Then
			il_tipo_recurso = 2
			SetText(String(lo_param.il_vector[1]))
			AcceptText()
		End If
	END IF	
End If
end event

event itemerror;call super::itemerror;return 1
end event

type tab_medidas from tab within w_sheet_muestras1
integer x = 5
integer y = 1196
integer width = 3488
integer height = 968
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_operaciones tabpage_operaciones
tabpage_actividades tabpage_actividades
tabpage_mp_base tabpage_mp_base
tabpage_diseno tabpage_diseno
end type

on tab_medidas.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_operaciones=create tabpage_operaciones
this.tabpage_actividades=create tabpage_actividades
this.tabpage_mp_base=create tabpage_mp_base
this.tabpage_diseno=create tabpage_diseno
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_operaciones,&
this.tabpage_actividades,&
this.tabpage_mp_base,&
this.tabpage_diseno}
end on

on tab_medidas.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_operaciones)
destroy(this.tabpage_actividades)
destroy(this.tabpage_mp_base)
destroy(this.tabpage_diseno)
end on

type tabpage_1 from userobject within tab_medidas
integer x = 18
integer y = 104
integer width = 3451
integer height = 848
long backcolor = 80269524
string text = "Medidas (Ctrl+2)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
cb_3 cb_3
dw_medidas1 dw_medidas1
end type

on tabpage_1.create
this.cb_3=create cb_3
this.dw_medidas1=create dw_medidas1
this.Control[]={this.cb_3,&
this.dw_medidas1}
end on

on tabpage_1.destroy
destroy(this.cb_3)
destroy(this.dw_medidas1)
end on

type cb_3 from commandbutton within tabpage_1
integer x = 3026
integer y = 184
integer width = 256
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Partes"
end type

event clicked;If il_talla=-1  or isnull(il_recurso) Or il_recurso =-1 Then
	MessageBox("Advertencia!","Debe especificar la talla y el recurso.",StopSign!)
	Return
End If	

If dw_medidas1.RowCount()=0 Then
	of_parteBase()
End If
end event

type dw_medidas1 from u_dw_application within tabpage_1
event ue_move pbm_move
integer x = 5
integer y = 32
integer width = 2976
integer height = 808
integer taborder = 5
string dataobject = "d_dt_med_mue"
boolean hscrollbar = true
boolean border = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_move;//x=1440
//y=284
end event

event getfocus;call super::getfocus;tabtextcolor=Rgb(0,0,255)
end event

event losefocus;call super::losefocus;tabtextcolor=Rgb(0,0,0)
end event

event ue_insertrow;long i,ll_recurso


If il_talla=-1 or isnull(il_recurso) Or il_recurso =-1 Then
	MessageBox("Advertencia!","Debe especificar talla y recurso para las medidas.",StopSign!)
	Return
End If
Super::Event ue_insertRow()

i=GetRow()


SetItem(i,"co_fabrica",il_fabrica)
SetItem(i,"co_linea",il_linea)
SetItem(i,"co_muestra",il_muestra)
SetItem(i,"co_tipoprod",il_tipo_Prod)
SetItem(i,"co_talla",il_talla)
SetItem(i,"co_diseno",1)  //constante
SetItem(i,"co_recurso",il_recurso )  

end event

event itemchanged;call super::itemchanged;ib_cambios=True
ib_cambios_med=true
end event

type tabpage_2 from userobject within tab_medidas
integer x = 18
integer y = 104
integer width = 3451
integer height = 848
long backcolor = 80269524
string text = "Reposadas (Ctrl+3)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
cb_4 cb_4
cb_2 cb_2
dw_med_rep dw_med_rep
end type

on tabpage_2.create
this.cb_4=create cb_4
this.cb_2=create cb_2
this.dw_med_rep=create dw_med_rep
this.Control[]={this.cb_4,&
this.cb_2,&
this.dw_med_rep}
end on

on tabpage_2.destroy
destroy(this.cb_4)
destroy(this.cb_2)
destroy(this.dw_med_rep)
end on

type cb_4 from commandbutton within tabpage_2
integer x = 1285
integer y = 316
integer width = 279
integer height = 84
integer taborder = 45
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Norma"
end type

event clicked;String 		ls_key , ls_path
long 			ll
OLEObject	xlapp

/*
* Del .ini, se trae con el nombre de la secci$$HEX1$$f300$$ENDHEX$$n "rutanorma" y el nombre
* de la clave se arma asi:  'NORMAS'+ codigo del tipo de producto
*/

ls_key = "NORMAS"+String(il_tipo_prod)
ls_path = n_cst_application.of_GetProfile ( n_cst_application.is_pathfileconf, "rutanombre", ls_key)
IF ls_path = '' THEN 
	MessageBox("$$HEX1$$a100$$ENDHEX$$Atenci$$HEX1$$f300$$ENDHEX$$n!", "No esta disponible el sitio de Normas para el tipo de producto "+String(il_tipo_prod))
	RETURN
END IF
xlApp = Create OLEObject
// Connect to Excel and check the return code
ll = xlApp.ConnectToNewObject( "Excel.Sheet" )
if ll < 0  then
	MessageBox("Connect to Excel Failed!",string(ll))
   return -1
end if

xlApp.Application.Workbooks.Open(ls_path, false) 
xlApp.Application.Visible = true 
end event

type cb_2 from commandbutton within tabpage_2
integer x = 1285
integer y = 184
integer width = 279
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Partes"
end type

event clicked;//////////////////////////////////////////////////////////////////////////
// Se toman las partes y se colocan todas
// 
//////////////////////////////////////////////////////////////////////////
DatawindowChild ldc_1
DataStore lds_partes
Long 		ll_grupoprod
lds_partes = CREATE datastore

lds_partes.DataObject = 'd_dddw_m_tipo_med_rep_grupo'

ll_grupoprod = dw_muestra.GetItemNumber(1,"co_grupoprod")
lds_partes.SetTransObject(n_cst_application.itr_appl)

If ll_grupoprod=-1 or isnull(ll_grupoprod) Then
	MessageBox("Advertencia!","Debe especificar el Grupo de Tipo de Producto para la muestra.",StopSign!)
	dw_muestra.SetColumn('co_grupoprod' )
	dw_muestra.SetFocus()
	Return
End If

If dw_med_rep.RowCount()>0 Then
	Return
End If

If il_talla=-1  or isnull(il_recurso) Or il_recurso =-1 Then
	MessageBox("Advertencia!","Debe especificar la talla y el recurso.",StopSign!)
	Return
End If	
/*
* Se deben recuperar las medidas del Grupo de tipo de producto
*/
lds_partes.Retrieve(ll_grupoprod)

long i,ll_tot
String ls_med_rep

ll_tot=lds_partes.RowCount()

For i=1 to ll_tot
	
	ls_med_rep=lds_partes.GetItemString(i,"id_med_rep")
	dw_med_rep.InsertRow(0)
	
	dw_med_rep.SetItem(i,"co_fabrica",il_fabrica)
	dw_med_rep.SetItem(i,"co_linea",il_linea)
	dw_med_rep.SetItem(i,"co_muestra",il_muestra)
	dw_med_rep.SetItem(i,"co_talla",il_talla)
	dw_med_rep.SetItem(i,"co_diseno",1) //se maneja un solo dise$$HEX1$$f100$$ENDHEX$$o
	dw_med_rep.SetItem(i,"co_tipoprod",il_tipo_prod)
	dw_med_rep.SetItem(i,"id_med_rep",ls_med_rep)
	dw_med_rep.SetItem(i,"co_recurso",il_recurso)	
Next

end event

type dw_med_rep from u_dw_application within tabpage_2
event ue_move pbm_move
integer x = 5
integer y = 32
integer width = 1243
integer height = 800
string dataobject = "d_dt_med_mue_rep"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event ue_move;//x=1440
//y=284
end event

event getfocus;call super::getfocus;tabtextcolor=Rgb(0,0,255)
end event

event itemchanged;call super::itemchanged;n_cst_comun lo_pulg
//2015-06-16 Solicitud: 51249 Ceiba/JJ
If dwo.name="ca_cm" Then
	SetItem(row,"ca_pulg",lo_pulg.of_mmToPulg(Dec(Data)))
	SetItem(row,"fe_actualizacion",today())			
	SetItem(row,"usuario",gs_usuario)		
	SetItem(row,"instancia",gs_instancia)	
ElseIf dwo.name="ca_pulg" Then
	SetItem(row,"ca_cm",lo_pulg.of_PulgTomm(Data))
	SetItem(row,"fe_actualizacion",today())			
	SetItem(row,"usuario",gs_usuario)		
	SetItem(row,"instancia",gs_instancia)	
End If

ib_cambios=True
ib_cambios_med=true
//2015-06-16 Solicitud: 51249 Ceiba/JJ - 51249
ib_cambios_medReposadas = True
end event

event losefocus;call super::losefocus;tabtextcolor=Rgb(0,0,0)
end event

event ue_insertrow;long i
Long ll_grupoprod

ll_grupoprod = dw_muestra.GetItemNumber(1,"co_grupoprod")

If ll_grupoprod=-1 or isnull(ll_grupoprod) Then
	MessageBox("Advertencia!","Debe especificar el Grupo de Tipo de Producto para la muestra.",StopSign!)
	dw_muestra.SetColumn('co_grupoprod' )
	dw_muestra.SetFocus()
	Return
End If

If il_talla=-1 or isnull(il_recurso) Or il_recurso =-1 Then
	MessageBox("Advertencia!","Debe especificar talla y recurso para las medidas.",StopSign!)
	Return
End If

Super::Event ue_insertRow()

i=GetRow()


SetItem(i,"co_fabrica",il_fabrica)
SetItem(i,"co_linea",il_linea)
SetItem(i,"co_muestra",il_muestra)
SetItem(i,"co_tipoprod",il_tipo_Prod)
SetItem(i,"co_talla",il_talla)
SetItem(i,"co_diseno",1)  //constante
SetItem(i,"co_recurso",il_recurso )
//2015-06-16 Solicitud: 51249 Ceiba/JJ
SetItem(i,"fe_actualizacion",today())			
SetItem(i,"usuario",gs_usuario)		
SetItem(i,"instancia",gs_instancia)	
end event

event itemerror;RETURN 1
end event

event ue_deleterow;call super::ue_deleterow;/***********************************************************
SA52837 Ceiba/JJ
Comentario: Validar si una fila o no eliminada
***********************************************************/
Long ll_Del
ll_Del = THIS.DeletedCount( )
IF ll_Del > 0 THEN ib_cambios_medReposadas = True


end event

type tabpage_3 from userobject within tab_medidas
integer x = 18
integer y = 104
integer width = 3451
integer height = 848
long backcolor = 80269524
string text = "convertida a referencia"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_referencias dw_referencias
end type

on tabpage_3.create
this.dw_referencias=create dw_referencias
this.Control[]={this.dw_referencias}
end on

on tabpage_3.destroy
destroy(this.dw_referencias)
end on

type dw_referencias from u_dw_application within tabpage_3
integer x = 5
integer y = 32
integer width = 2062
integer height = 800
integer taborder = 20
string dataobject = "d_muestras_ref"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event ue_insertrow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 29 de Junio de 2005 HORA 11:34:06:171
// 
// Se verifica que sea una muestra v$$HEX1$$e100$$ENDHEX$$lida antes de proceder a colocar
// nuevos registros
//////////////////////////////////////////////////////////////////////////

If il_muestra<=0 Then
	MessageBox("Advertencia!","Debe tener una muestra v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	Return
End If

long ll_f

ll_f=This.InsertRow(0)

This.SetItem(ll_f,"co_fabrica",il_fabrica)
This.SetItem(ll_f,"co_linea",il_linea)
This.SetItem(ll_f,"co_muestra",il_muestra)
This.SetItem(ll_f,"co_talla",il_talla)
//////////////////////////////////////////////////////////////////////////
//El (2) indica que fue asociada una ref y no creada de la muestra 
// 
//////////////////////////////////////////////////////////////////////////

This.SetItem(ll_f,"co_tipo_asocia",2)

end event

event ue_deleterow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 29 de Junio de 2005 HORA 11:42:08:984
// 
// solo se pueden borrar las de tipo de asociacion 2
//////////////////////////////////////////////////////////////////////////

long ll_tipo,ll_fila

ll_fila=getRow()

If ll_fila<=0 Then
	return
End If

ll_tipo=This.GetItemNumber(ll_fila,"co_tipo_asocia")

If ll_tipo<>2 Then
	MessageBox("Advertencia!","No se puede borrar el registro, porque fue creado por el sistema.",StopSign!)
	Return
End If


Super::EVENT ue_deleteRow()
end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 29 de Junio de 2005 HORA 11:48:42:984
// 
// Cuando se digita la talla el sistema velida si la referencia existe
// en m_ref_pdn, de lo contrario rechaza esta talla y  pide al usuario que
// verifique los datos.
//////////////////////////////////////////////////////////////////////////
long ll_dato,ll_fabrica,ll_linea,ll_referencia,ll_res,ll_null

setNull(ll_null)


If dwo.name="co_referencia_ref" or &
   dwo.name="co_fabrica_ref" or &
	dwo.name="co_linea_ref"Then
	
	This.SetItem(row,"co_talla_ref",ll_null)
	
End If
	
If dwo.name="co_talla_ref" Then
	ll_dato=Long(data)
	
	ll_fabrica=This.GEtItemNumber(row,"co_fabrica_ref")
	ll_linea=This.GEtItemNumber(row,"co_linea_ref")
	ll_referencia=This.GEtItemNumber(row,"co_referencia_ref")
	
	ll_res=of_verificar_ref_pdn(ll_fabrica /*long a_fabrica*/,&
	                            ll_linea/*long a_linea*/,&
										 ll_referencia/*long a_referencia*/,&
										 ll_dato/*long a_talla */)
										 
	If ll_res<>1 Then
		MessageBox("Advertencia!",&
		"La referencia no existe, o tiene una talla no v$$HEX1$$e100$$ENDHEX$$lida, por favor verifique.",StopSign!)
		Return 2
	End If
End If
	
	
	
end event

type tabpage_operaciones from userobject within tab_medidas
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3451
integer height = 848
long backcolor = 80269524
string text = "Operaciones"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
cb_1 cb_1
cb_7 cb_7
dw_operaciones_mue dw_operaciones_mue
end type

on tabpage_operaciones.create
this.cb_1=create cb_1
this.cb_7=create cb_7
this.dw_operaciones_mue=create dw_operaciones_mue
this.Control[]={this.cb_1,&
this.cb_7,&
this.dw_operaciones_mue}
end on

on tabpage_operaciones.destroy
destroy(this.cb_1)
destroy(this.cb_7)
destroy(this.dw_operaciones_mue)
end on

type cb_1 from commandbutton within tabpage_operaciones
integer x = 2062
integer y = 216
integer width = 402
integer height = 80
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Orden"
end type

event clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:19:27
---------------------------------------------------
---------------------------------------------------*/
Long ll_i,ll_tot
//--------------------------------------------------
ll_tot=dw_operaciones_mue.RowCount()
dw_operaciones_mue.Sort()

For ll_i=1 To ll_tot
	dw_operaciones_mue.SetItem(ll_i,"orden_operacion",ll_i*10)
Next
//--------------------------------------------------
	


end event

type cb_7 from commandbutton within tabpage_operaciones
integer x = 2496
integer y = 216
integer width = 402
integer height = 80
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "..."
end type

event clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:19:29
---------------------------------------------------
---------------------------------------------------*/
Long    ll_tot,i,ll_operacion,ll_f
String  ls_de_operacion
//---------------------------------------------------
If il_talla=-1  Then
	MessageBox("Advertencia!","Debe especificar talla.",StopSign!)
	Return
End If	
//---------------------------------------------------
If dw_operaciones_mue.RowCount()>0 Then
	Return
End If
//---------------------------------------------------
If dw_operaciones.RowCount()=0 Then
	dw_operaciones.SetTransObject(n_cst_application.itr_appl)
	dw_operaciones.Retrieve(il_tipo_prod)
End If
//***********************
Open(w_operacion_muestra)
//***********************
ll_tot=dw_operaciones.RowCount()
For i=1 To ll_tot
	If dw_operaciones.GetItemNumber(i,"check")=1 Then
		ll_operacion=dw_operaciones.GetItemNumber(i,"co_operacion")
		ls_de_operacion=dw_operaciones.GetItemString(i,"de_operacion")
		ll_f=dw_operaciones_mue.InsertRow(0)
		dw_operaciones_mue.SetItem(ll_f,"co_fabrica",il_fabrica)
		dw_operaciones_mue.SetItem(ll_f,"co_linea",il_linea)
		dw_operaciones_mue.SetItem(ll_f,"co_muestra",il_muestra)
		dw_operaciones_mue.SetItem(ll_f,"co_talla",il_talla)
		dw_operaciones_mue.SetItem(ll_f,"co_tipoprod",il_tipo_prod)
		dw_operaciones_mue.SetItem(ll_f,"orden_operacion",ll_f * 10)
		dw_operaciones_mue.SetItem(ll_f,"co_operacion",ll_operacion)
		dw_operaciones_mue.SetItem(ll_f,"de_operacion",ls_de_operacion)
	End If
Next
//---------------------------------------------------
end event

type dw_operaciones_mue from u_dw_application within tabpage_operaciones
event ue_move pbm_move
integer x = 5
integer y = 32
integer width = 1874
integer height = 800
integer taborder = 70
string title = "Procesos (Ctrl+4)"
string dataobject = "d_operaciones_basica"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event ue_move;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:19:23
---------------------------------------------------
---------------------------------------------------*/
//x=2162
//y=709
end event

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:19:26
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lo_param
//--------------------------------------------------
If dwo.name="co_operacion" Then
	lo_param.il_vector[1]=il_tipo_prod
	OpenWithParm(w_bus_operac_muestra,lo_param)
	lo_param=Message.powerObjectParm
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
		AcceptText()
		SetColumn('de_operacion')
	End If
End If
//--------------------------------------------------
end event

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:17:26
---------------------------------------------------
---------------------------------------------------*/
//gb_procesos.of_color(True)
end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:19:25
---------------------------------------------------
---------------------------------------------------*/
Long ll_dato,ll_res,ll_operacion_ant
n_cst_comun_orden lo_comun

DWItemStatus		ldwis_state
ldwis_state=This.GetItemStatus(Row,0,Primary!)

//-----------------------------------------------------
If dwo.name="co_operacion" Then
	ll_res=Find("co_operacion="+data,1,RowCount())
	If ll_res>0 then
		MessageBox("Advertencia!","Esta operaci$$HEX1$$f300$$ENDHEX$$n ya est$$HEX2$$e1002000$$ENDHEX$$seleccionada.",StopSign!)		
		Return 2
	End If
	ll_dato=Long(Data)
	
//////////////////////////////////////////////////////////////////////////
// Verifico si es un dato nuevo, sino debo ver que no tenga ordenes con  
// esta operaci$$HEX1$$f300$$ENDHEX$$n ---YGZ---
//////////////////////////////////////////////////////////////////////////
	If ldwis_state<>New! And ldwis_state<>NewModified! Then
		ll_operacion_ant = THIS.GetitemNumber(row,"co_operacion", Primary!,TRUE)
		ll_res=of_verificarOperacionOrden(ll_operacion_ant)
		
		IF ll_res<>1 Then
			If ll_res=-2 Then
				MessageBox('Advertencia','La operaci$$HEX1$$f300$$ENDHEX$$n # '+&
				String(ll_operacion_ant)+' - '+This.GetItemString(row,'de_operacion')+&
				' est$$HEX2$$e1002000$$ENDHEX$$asignada a tareas de $$HEX1$$f300$$ENDHEX$$rdenes registradas para esta muestra. No se puede modificar',StopSign!)

			End If
			Return 2
	 	End If
		
	End If
	
	ll_res=lo_comun.of_nombre_operac_muestra (	ll_dato/*long a_operacion*/,&
	                                           il_tipo_prod,&
												  			n_cst_application.itr_appl/*transaction a_transaction */)
   If ll_res<>1 Then
		MessageBox("Advertencia!","Operaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_operacion",lo_comun.of_getString(1))												  
End If
//-----------------------------------------------------
ib_cambios=True
end event

event itemerror;call super::itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:19:24
---------------------------------------------------
---------------------------------------------------*/
n_cst_comun lo_comun
Long ll_null
//--------------------------------------------------
If dwo.name="co_operacion" or dwo.name="orden_operacion" Then
	If Long(Data)=0 Then
		SetNull(ll_null)		
		SetItem(row,String(dwo.name),ll_null)
		If dwo.name="co_operacion" Then SetItem(row,'de_operacion','')
		Return 3
	End If 
End If
//--------------------------------------------------
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:19:24
---------------------------------------------------
---------------------------------------------------*/
//gb_procesos.of_color(False)
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:17:39
---------------------------------------------------
---------------------------------------------------*/
Long ll_i,ll_orden
//-------------------------------------------------
If il_talla=-1 Then
	MessageBox("Advertencia!","Debe especificar talla.",StopSign!)
	Return
End If
//-------------------------------------------------
Super::Event ue_insertRow()
ll_i=GetRow()
SetItem(ll_i,"co_fabrica",il_fabrica)
SetItem(ll_i,"co_linea",il_linea)
SetItem(ll_i,"co_muestra",il_muestra)
SetItem(ll_i,"co_tipoprod",il_tipo_Prod)
SetItem(ll_i,"co_talla",il_talla)
ll_orden = Long(This.Describe("Evaluate('max(orden_operacion for all)', 0)"))
If IsNull(ll_orden) Then 
	ll_orden=10
Else
	ll_orden+=10
End If
SetItem(ll_i,"orden_operacion",ll_orden)
//-------------------------------------------------

end event

event ue_deleterow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 18 de Mayo de 2005 HORA 15:01:22:015
// 
// Se utiliza una funci$$HEX1$$f300$$ENDHEX$$n, para garantizar esta funcionalidad cuando 
// se cambie un c$$HEX1$$f300$$ENDHEX$$digo de operaci$$HEX1$$f300$$ENDHEX$$n.
//////////////////////////////////////////////////////////////////////////

Long					ll_pos,ll_res,ll_operacion,ll_count
n_ds_application 	lds_operacion
DWItemStatus		ldwis_state

//////////////////////////////////////////////////////////////////////////
// Si es un registro nuevo se borra de una vez
// 
//////////////////////////////////////////////////////////////////////////

ll_pos=GetRow()
IF ll_pos <= 0 THEN RETURN

ldwis_state=This.GetItemStatus(ll_pos,0,Primary!)
Choose Case ldwis_state
	Case New!,NewModified!
		CALL SUPER :: ue_deleterow
		Return
End Choose

ll_operacion=This.GetItemNumber(ll_pos,'co_operacion')

ll_res=of_verificarOperacionOrden(ll_operacion)

IF ll_res<>1 Then
	If ll_res=-2 Then
		MessageBox('Advertencia','La operaci$$HEX1$$f300$$ENDHEX$$n # '+&
		String(ll_operacion)+' - '+This.GetItemString(ll_pos,'de_operacion')+&
		' est$$HEX2$$e1002000$$ENDHEX$$asignada a tareas de $$HEX1$$f300$$ENDHEX$$rdenes registradas para esta muestra. No se puede eliminar',StopSign!)
		
	End If
	Return
End If

CALL SUPER :: ue_deleterow


end event

type tabpage_actividades from userobject within tab_medidas
integer x = 18
integer y = 104
integer width = 3451
integer height = 848
long backcolor = 80269524
string text = "Actividades"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
cb_3dot_act cb_3dot_act
cb_orden_act cb_orden_act
dw_actividad_muestra dw_actividad_muestra
end type

on tabpage_actividades.create
this.cb_3dot_act=create cb_3dot_act
this.cb_orden_act=create cb_orden_act
this.dw_actividad_muestra=create dw_actividad_muestra
this.Control[]={this.cb_3dot_act,&
this.cb_orden_act,&
this.dw_actividad_muestra}
end on

on tabpage_actividades.destroy
destroy(this.cb_3dot_act)
destroy(this.cb_orden_act)
destroy(this.dw_actividad_muestra)
end on

type cb_3dot_act from commandbutton within tabpage_actividades
integer x = 2395
integer y = 204
integer width = 402
integer height = 80
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "..."
end type

event clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:19:29
---------------------------------------------------
---------------------------------------------------*/
Long    ll_tot,i,ll_actividad,ll_fila
String  ls_de_actividad
//---------------------------------------------------
If il_talla=-1  Then
	MessageBox("Advertencia!","Debe especificar talla.",StopSign!)
	Return
End If	
//---------------------------------------------------
If dw_actividad_muestra.RowCount()>0 Then
	Return
End If
//---------------------------------------------------
If dw_actividades.RowCount()=0 Then
	dw_actividades.SetTransObject(n_cst_application.itr_appl)
	dw_actividades.Retrieve()
End If
//***********************
Open(w_actividad_sel_muestra)
//***********************
dw_actividades.SetFilter("check=1")
dw_actividades.Filter()
ll_tot=dw_actividades.RowCount()
For i=1 To ll_tot
	ll_actividad = dw_actividades.GetItemNumber(i,"id_actividad")
	ls_de_actividad = dw_actividades.GetItemString(i,"de_actividad")
	ll_fila = dw_actividad_muestra.InsertRow(0)
	dw_actividad_muestra.SetItem(ll_fila,"co_fabrica",il_fabrica)
	dw_actividad_muestra.SetItem(ll_fila,"co_linea",il_linea)
	dw_actividad_muestra.SetItem(ll_fila,"co_muestra",il_muestra)
	dw_actividad_muestra.SetItem(ll_fila,"posicion",ll_fila * 10)
	dw_actividad_muestra.SetItem(ll_fila,"id_actividad",ll_actividad)
	dw_actividad_muestra.SetItem(ll_fila,"de_actividad",ls_de_actividad)
Next
dw_actividad_muestra.Sort()
dw_actividades.SetFilter("")
dw_actividades.Filter()
dw_actividades.Sort()
//---------------------------------------------------
end event

type cb_orden_act from commandbutton within tabpage_actividades
integer x = 1957
integer y = 204
integer width = 402
integer height = 80
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Orden"
end type

event clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:19:27
---------------------------------------------------
---------------------------------------------------*/
Long ll_i,ll_tot
//--------------------------------------------------
ll_tot=dw_actividad_muestra.RowCount()
dw_actividad_muestra.Sort()

For ll_i=1 To ll_tot
	dw_actividad_muestra.SetItem(ll_i,"posicion",ll_i*10)
Next
//--------------------------------------------------
	


end event

type dw_actividad_muestra from u_dw_application within tabpage_actividades
integer x = 5
integer y = 32
integer width = 1856
integer height = 800
integer taborder = 20
string dataobject = "d_mu_mues_activ"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:19:26
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lo_param
//--------------------------------------------------
If dwo.name="id_actividad" Then
	lo_param.il_vector[1] = dw_muestra.GetItemNumber(1, 'co_tipoprod')
	OpenWithParm(w_bus_actividad, lo_param)
	lo_param=Message.powerObjectParm
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
		AcceptText()
		SetColumn('de_actividad')
	End If
End If
//--------------------------------------------------
end event

event itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:19:25
---------------------------------------------------
---------------------------------------------------*/
Long ll_dato,ll_res,ll_actividad_ant, ll_tipoprod
n_cst_comun_orden lo_comun
DWItemStatus		ldwis_state
ldwis_state=This.GetItemStatus(Row,0,Primary!)

//-----------------------------------------------------
If dwo.name="id_actividad" Then
	//Verificar que no se repita la actividad.
	ll_res=find("id_actividad="+data,1,RowCount())
	If ll_res>0 then
		MessageBox("Advertencia!","Esta actividad ya est$$HEX2$$e1002000$$ENDHEX$$seleccionada.",StopSign!)		
		Return 2
	End If	
	ll_dato=Long(Data)
	
	//////////////////////////////////////////////////////////////////////////
	// Verifico si es un dato nuevo, sino debo ver que no tenga ordenes con  
	// esta actividad //-----YGZ-----\\
	//////////////////////////////////////////////////////////////////////////
	If ldwis_state<>New! And ldwis_state<>NewModified! Then
		ll_actividad_ant = THIS.GetitemNumber(row,"id_actividad",Primary!,TRUE)
		ll_res=of_verificarActividadOrden(ll_actividad_ant)
		
		IF ll_res<>1 Then
			If ll_res=-2 Then
				MessageBox('Advertencia','La actividad # '+&
				String(ll_actividad_ant)+' - '+This.GetItemString(row,'de_actividad')+&
				' est$$HEX2$$e1002000$$ENDHEX$$asignada a tareas de $$HEX1$$f300$$ENDHEX$$rdenes registradas para esta muestra. No se puede Modificar',StopSign!)
			End If
			Return 2
	 	End If
	End If
	//-----YGZ-----\\
	/*
	* MODIFICADO: Agosto 12 de 2009 - ohlondon
	* debe validarse que sea del mismo tipo que el de la muestra (encabezado)
	*/
	ll_tipoprod = dw_muestra.GetItemNumber(1, 'co_tipoprod')
	
	ll_res=lo_comun.of_nombreactividadtipo(ll_dato/*long a_actividad*/,&
														ll_tipoprod,&	
												  n_cst_application.itr_appl/*transaction a_transaction */)
   If ll_res<>1 Then
		MessageBox("Advertencia!","Actividad no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_actividad",lo_comun.of_getString(1))												  
End If
//-----------------------------------------------------

ib_cambios=True
end event

event itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:19:24
---------------------------------------------------
---------------------------------------------------*/
Long ll_null
//-----------------------------------------------------
If dwo.name="id_actividad" or  dwo.name="posicion" Then	
	If Long(Data)=0 Then
		SetNull(ll_null)		
		SetItem(row,String(dwo.name),ll_null)
		If dwo.name="id_actividad" Then SetItem(row,'de_actividad','')
		Return 3
	End If 
End If
//-----------------------------------------------------
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:17:39
---------------------------------------------------
---------------------------------------------------*/
Long ll_i,ll_posicion
//-------------------------------------------------
If il_talla=-1 Then
	MessageBox("Advertencia!","Debe especificar talla.",StopSign!)
	Return
End If
//-------------------------------------------------
Super::Event ue_insertRow()
ll_i=GetRow()
SetItem(ll_i,"co_fabrica",il_fabrica)
SetItem(ll_i,"co_linea",il_linea)
SetItem(ll_i,"co_muestra",il_muestra)
ll_posicion = Long(This.Describe("Evaluate('max(posicion for all)', 0)"))
If IsNull(ll_posicion) Then 
	ll_posicion=10
Else
	ll_posicion+=10
End If
SetItem(ll_i,"posicion",ll_posicion)
//-------------------------------------------------

end event

event ue_deleterow;/*******************************************************************************************************
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Martes 08 de Febrero de 2005. Hora: 11:46:40
********************************************************************************************************/
//VARIABLE DECLARATION
Long					ll_pos,ll_res,ll_actividad,ll_count
n_ds_application 	lds_actividad
DWItemStatus		ldwis_state
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
ll_pos=GetRow()
IF ll_pos <= 0 THEN RETURN


ldwis_state=This.GetItemStatus(ll_pos,0,Primary!)
Choose Case ldwis_state
	Case New!,NewModified!
		CALL SUPER :: ue_deleterow
		Return
End Choose
//------------------------------------------------------------------------------------------------------
ll_actividad=This.GetItemNumber(ll_pos,'id_actividad')

ll_res=of_verificarActividadOrden(ll_actividad)

IF ll_res<>1 Then
	If ll_res=-2 Then
		MessageBox('Advertencia','La actividad # '+&
		String(ll_actividad)+' - '+This.GetItemString(ll_pos,'de_actividad')+&
		' est$$HEX2$$e1002000$$ENDHEX$$asignada a tareas de $$HEX1$$f300$$ENDHEX$$rdenes registradas para esta muestra. No se puede eliminar',StopSign!)
		
	End If
	Return
End If

CALL SUPER :: ue_deleterow
end event

type tabpage_mp_base from userobject within tab_medidas
integer x = 18
integer y = 104
integer width = 3451
integer height = 848
long backcolor = 80269524
string text = "Materia Prima Base"
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
integer x = 5
integer y = 32
integer width = 2400
integer height = 800
integer taborder = 90
string dataobject = "d_mu_mp_base"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 10 de Noviembre de 2004.H:12:00
---------------------------------------------------
---------------------------------------------------*/
n_cst_comun lo_comun
Long ll_res,ll_dato,ll_codigo
//--------------------------------------------------
If dwo.name="co_producto" Then
	ll_res=Find("co_producto="+data,1,RowCount())
	If ll_res>0 then
		MessageBox("Advertencia!","Este producto ya est$$HEX2$$e1002000$$ENDHEX$$seleccionado.",StopSign!)		
		Return 2
	End If
	ll_dato=Long(Data)
	ll_res=lo_comun.of_nombreMatPrima(ll_dato,n_cst_application.itr_appl)
	If ll_res=1 then
		SetItem(row,"de_producto",lo_comun.of_getString(1))
	Else
		SetItem(row,"de_producto",'/*Nuevo!*/')
	End If	
End If
//------------------------------------------------------------
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
//If dwo.name="de_producto" Then
//	ll_codigo=GetItemNumber(row,"co_producto")
//	If Not IsNull(ll_codigo) Then
//		MessageBox("Advertencia!","No se puede modificar la descripci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
//		Return 2	
//	End If
//End If
////--------------------------------------------------
ib_cambios=True
end event

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 10 de Noviembre de 2004.H:12:00
---------------------------------------------------
Overwrite!
---------------------------------------------------*/

end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 10 de Noviembre de 2004.H:12:20
---------------------------------------------------
---------------------------------------------------*/
Long ll_i,ll_mp_max=0
n_ds_application lds_mp
//-------------------------------------------------
If il_talla=-1 Then
	MessageBox("Advertencia!","Debe especificar talla.",StopSign!)
	Return
End If
//-------------------------------------------------
//Se verifica que haya al menos un color con caracteristica de materia
//prima en CRUDO para la adicion de MP base. si no existe se descartan las actuales.
//ll_i = dw_dt_muestras_col.Find('co_caract_mp=1',1,dw_dt_muestras_col.RowCount())
//If ll_i=0 Then
//	MessageBox("Advertencia!","No se han encontrado colores crudos.",StopSign!)	
//	Return
//End If
//-------------------------------------------------
ll_mp_max = Long(This.Describe("Evaluate('max(consec for all)', 0)"))
If IsNull(ll_mp_max) Then ll_mp_max=0
ll_mp_max++
//If MessageBox('Nota','Consec:'+String(ll_mp_max),Information!,YesNo!,2) &
//	= 2 Then	Return
Super::Event ue_insertRow()
ll_i=GetRow()
SetItem(ll_i,"co_fabrica",il_fabrica)
SetItem(ll_i,"co_linea",il_linea)
SetItem(ll_i,"co_muestra",il_muestra)
SetItem(ll_i,"consec",ll_mp_max)
//-------------------------------------------------

end event

event itemerror;call super::itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 10 de Noviembre de 2004.H:12:00
---------------------------------------------------
---------------------------------------------------*/
Long ll_null
String ls_coltype
//-------------------------------------------------
ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	Return 1
End If

If dwo.name="co_producto" Then	
	If Long(Data)=0 Then
		SetNull(ll_null)		
		SetItem(row,String(dwo.name),ll_null)
		SetItem(row,'de_actividad','')
		Return 3
	End If 
End If
end event

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 10 de Noviembre de 2004.H:12:10
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lo_param
//---------------------------------------------------
If dwo.name="co_producto" Then
	Open(w_materia_prima)
	lo_param=Message.PowerObjectParm
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
		AcceptText()
		SetColumn('de_producto')
	End If
End If
//---------------------------------------------------
end event

type tabpage_diseno from userobject within tab_medidas
integer x = 18
integer y = 104
integer width = 3451
integer height = 848
long backcolor = 80269524
string text = "Detalles dise$$HEX1$$f100$$ENDHEX$$o"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_mu_dt_largo dw_mu_dt_largo
dw_mu_dt_puno dw_mu_dt_puno
dw_mu_dt_diseno dw_mu_dt_diseno
gb_diseno gb_diseno
gb_puno gb_puno
gb_largo gb_largo
end type

on tabpage_diseno.create
this.dw_mu_dt_largo=create dw_mu_dt_largo
this.dw_mu_dt_puno=create dw_mu_dt_puno
this.dw_mu_dt_diseno=create dw_mu_dt_diseno
this.gb_diseno=create gb_diseno
this.gb_puno=create gb_puno
this.gb_largo=create gb_largo
this.Control[]={this.dw_mu_dt_largo,&
this.dw_mu_dt_puno,&
this.dw_mu_dt_diseno,&
this.gb_diseno,&
this.gb_puno,&
this.gb_largo}
end on

on tabpage_diseno.destroy
destroy(this.dw_mu_dt_largo)
destroy(this.dw_mu_dt_puno)
destroy(this.dw_mu_dt_diseno)
destroy(this.gb_diseno)
destroy(this.gb_puno)
destroy(this.gb_largo)
end on

type dw_mu_dt_largo from u_dw_application within tabpage_diseno
integer x = 2336
integer y = 76
integer width = 1065
integer height = 708
integer taborder = 35
string dataobject = "d_mu_dt_largo"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;call super::getfocus;gb_largo.of_color(True)
end event

event losefocus;call super::losefocus;gb_diseno.of_color(False)
end event

type dw_mu_dt_puno from u_dw_application within tabpage_diseno
integer x = 1184
integer y = 76
integer width = 1065
integer height = 708
integer taborder = 25
string dataobject = "d_mu_dt_puno"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;call super::getfocus;gb_puno.of_color(True)
end event

event losefocus;call super::losefocus;gb_diseno.of_color(False)
end event

type dw_mu_dt_diseno from u_dw_application within tabpage_diseno
integer x = 27
integer y = 76
integer width = 1065
integer height = 708
integer taborder = 15
string dataobject = "d_mu_dt_diseno"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 10 de Noviembre de 2004.H:12:10
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lo_param
//---------------------------------------------------
If dwo.name="co_producto" Then
	Open(w_materia_prima)
	lo_param=Message.PowerObjectParm
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
		AcceptText()
		SetColumn('de_producto')
	End If
End If
//---------------------------------------------------
end event

event getfocus;call super::getfocus;gb_diseno.of_color(True)
end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 10 de Noviembre de 2004.H:12:00
---------------------------------------------------
---------------------------------------------------*/
n_cst_comun lo_comun
Long ll_res,ll_dato,ll_codigo
//--------------------------------------------------
If dwo.name="co_producto" Then
	ll_res=Find("co_producto="+data,1,RowCount())
	If ll_res>0 then
		MessageBox("Advertencia!","Este producto ya est$$HEX2$$e1002000$$ENDHEX$$seleccionado.",StopSign!)		
		Return 2
	End If
	ll_dato=Long(Data)
	ll_res=lo_comun.of_nombreMatPrima(ll_dato,n_cst_application.itr_appl)
	If ll_res=1 then
		SetItem(row,"de_producto",lo_comun.of_getString(1))
	Else
		SetItem(row,"de_producto",'/*Nuevo!*/')
	End If	
End If
//------------------------------------------------------------
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
//If dwo.name="de_producto" Then
//	ll_codigo=GetItemNumber(row,"co_producto")
//	If Not IsNull(ll_codigo) Then
//		MessageBox("Advertencia!","No se puede modificar la descripci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
//		Return 2	
//	End If
//End If
////--------------------------------------------------
ib_cambios=True
end event

event itemerror;call super::itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 10 de Noviembre de 2004.H:12:00
---------------------------------------------------
---------------------------------------------------*/
Long ll_null
String ls_coltype
//-------------------------------------------------
ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	Return 1
End If

If dwo.name="co_producto" Then	
	If Long(Data)=0 Then
		SetNull(ll_null)		
		SetItem(row,String(dwo.name),ll_null)
		SetItem(row,'de_actividad','')
		Return 3
	End If 
End If
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:17:39
---------------------------------------------------
---------------------------------------------------*/
Long ll_i,ll_posicion
//-------------------------------------------------
If il_talla=-1 Then
	MessageBox("Advertencia!","Debe especificar talla.",StopSign!)
	Return
End If
//-------------------------------------------------
Super::Event ue_insertRow()
ll_i=GetRow()
SetItem(ll_i,"co_fabrica",il_fabrica)
SetItem(ll_i,"co_linea",il_linea)
SetItem(ll_i,"co_muestra",il_muestra)



end event

event losefocus;call super::losefocus;gb_diseno.of_color(False)
end event

type gb_diseno from u_gb_base within tabpage_diseno
integer y = 8
integer width = 1134
integer height = 812
string text = "Clase de dise$$HEX1$$f100$$ENDHEX$$o"
end type

type gb_puno from u_gb_base within tabpage_diseno
integer x = 1152
integer y = 8
integer width = 1134
integer height = 812
integer taborder = 20
string text = "Clase de pu$$HEX1$$f100$$ENDHEX$$o"
end type

type gb_largo from u_gb_base within tabpage_diseno
integer x = 2304
integer y = 8
integer width = 1134
integer height = 812
integer taborder = 30
string text = "Clase de largo"
end type

type gb_colores from u_gb_base within w_sheet_muestras1
integer x = 9
integer y = 2192
integer width = 3474
integer height = 644
integer taborder = 0
string text = "Colores por talla (Ctrl+4)"
end type

type dw_mat_prima from u_dw_application within w_sheet_muestras1
integer x = 59
integer y = 3168
integer width = 3392
integer height = 848
integer taborder = 80
string dataobject = "d_dt_fmp_mue1"
boolean hscrollbar = true
end type

event getfocus;call super::getfocus;gb_matprima.of_color(True)
end event

event losefocus;call super::losefocus;gb_matprima.of_color(False)
end event

event ue_insertrow;long ll_f,i,ll_tot

If This.deletedCount()>0 Then
	MessageBox("Advertencia!","Se han borrado datos, por favor guarde antes de continuar.",StopSign!)
	Return	
End If

If dw_h_fmp_muestras.RowCount()=0 Or il_opcion=-1 Then
	MessageBox("Advertencia!","Debe especificar la opci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
	Return
End If

If RowCount()=0 Or GetRow()=RowCount() Then
	super::event ue_insertRow()
	ll_f=GetRow()
Else
	ll_f=InsertRow(GetRow())		
End If

If ll_f>1 Then
	SetItem(ll_f,"co_partemp",          GetItemNumber(ll_f -1,"co_partemp"))	
	SetItem(ll_f,"co_combinacion",      GetItemNumber(ll_f -1,"co_combinacion"))	
	SetItem(ll_f,"de_parte_combinacion",GetItemString(ll_f -1,"de_parte_combinacion"))	
	/*
	* Repetir los datos de la fila anterior
	*/
	SetItem(ll_f,"co_centro",           GetItemNumber(ll_f -1,"co_centro"))	
	SetItem(ll_f,"nu_partemp",          GetItemNumber(ll_f -1,"nu_partemp"))	  
	SetItem(ll_f,"nu_mp",               GetItemNumber(ll_f -1,"nu_mp"))	 
	SetItem(ll_f,"co_fabrica_mp",       GetItemNumber(ll_f -1,"co_fabrica_mp"))	
	SetItem(ll_f,"co_producto_mp",      GetItemNumber(ll_f -1,"co_producto_mp"))	
	SetItem(ll_f,"de_producto",   	   GetItemString(ll_f -1,"de_producto"))	
	SetItem(ll_f,"co_color_mp",         GetItemNumber(ll_f -1,"co_color_mp"))	
	SetItem(ll_f,"de_color",            GetItemString(ll_f -1,"de_color"))	
	SetItem(ll_f,"peso_mp",             GetItemDecimal(ll_f -1,"peso_mp"))   
	SetItem(ll_f,"nu_conos",            GetItemNumber(ll_f -1,"nu_conos"))	
	SetItem(ll_f,"consec",              GetItemNumber(ll_f -1,"consec"))	
	SetItem(ll_f,"alimentador",         GetItemString(ll_f -1,"alimentador"))	
  	SetItem(ll_f,"portahilo",           GetItemString(ll_f -1,"portahilo"))	
	SetItem(ll_f,"enhebrado",           GetItemString(ll_f -1,"enhebrado"))	
	SetItem(ll_f,"posicion",            GetItemString(ll_f -1,"posicion"))	
	SetItem(ll_f,"tension",             GetItemString(ll_f -1,"tension"))	
End If

SetItem(ll_f,"co_fabrica",il_fabrica)
SetItem(ll_f,"co_linea",il_linea)
SetItem(ll_f,"co_muestra",il_muestra)
SetItem(ll_f,"co_tipoprod",il_tipo_prod)
SetItem(ll_f,"co_talla",il_talla)
SetItem(ll_f,"co_color",il_color)
SetItem(ll_f,"cnt_opcion",il_opcion)
SetItem(ll_f,"co_diseno",il_opcion)



SetRow(ll_f)
ScrollToRow(ll_f)
SetColumn("co_partemp")
SetFocus()	

This.Object.DataWindow.HorizontalScrollPosition=0
//////////////////////////////////////////////////////////////////////////
// Se recalcula nuevamente el consecutivo
// 
//////////////////////////////////////////////////////////////////////////
ll_tot=RowCount()

For i=1 To ll_tot
	SetItem(i,"consec",i)
Next
end event

event doubleclicked;call super::doubleclicked;n_cst_param lo_param

If dwo.name="co_partemp" Then
	lo_param.il_vector[1]=il_tipo_prod
	
	OpenWithParm(w_busins_m_partemp,lo_param)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
		This.SetItem(row,'estado_parte',lo_param.is_vector[1])
		AcceptText()
	End If
End If

If dwo.name="co_combinacion" Then

   n_cst_parm_dw lo_param_dw
	
	lo_param_dw.il_vector[1]=il_talla
	lo_param_dw.idw_vector[1]=dw_combinacion
	
	OpenWithParm(w_combinaciones_muestras,lo_param_dw)
	
	lo_param_dw=Message.PowerObjectParm
	
	If IsValid(lo_param_dw) Then
		SetText(String(lo_param_dw.il_vector[1]))
		AcceptText()
	End If
End If

If dwo.name="co_producto_mp" Then
	lo_param.il_vector[1]=il_tipo_prod
	
	Open(w_materia_prima)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
		AcceptText()
	End If

End If

If dwo.name="co_color_mp" Then
	lo_param.il_vector[1]=GetItemNumber(row,"co_fabrica_mp")
	lo_param.il_vector[2]=GetItemNumber(row,"co_producto_mp")
	
	OpenWithParm(w_color_mp_prod,lo_param)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		// Verifica si el estado del color es descontinuado "D"
		IF lo_param.is_vector[1] = 'D' THEN
			// Si es "D", entonces se verifica si se quiere seleccionar con ese estado
			IF MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "$$HEX1$$bf00$$ENDHEX$$Seguro que desea seleccionar un color descontinuado?", Question!,YesNo!, 2) = 1 THEN
				SetText(String(lo_param.il_vector[1]))
			END IF
		ELSE
			// Si esta activo, no se verifica, solo se selecciona.
			SetText(String(lo_param.il_vector[1]))
		END IF	
		
		AcceptText()
	End If
End If



end event

event itemchanged;call super::itemchanged;
If il_err_item_change<>0 Then
	Return 2
End If
Long   ll_dato,ll_res,ll_null,ll_codigo,ll_codigo_color
String ls_dato

//If dw_mp.rowcount()>0 Then
//	MessageBox("Advertencia!","No puede modificar la parte/combinaci$$HEX1$$f300$$ENDHEX$$n, porque tiene detalle.",StopSign!)
//	Return 2
//End If

n_cst_comun lo_c

SetNull(ll_null)

If dwo.name="co_partemp" Then
	ll_dato=Long(Data)
	ll_res=lo_c.of_nombrepartemp(il_tipo_prod,ll_dato,n_cst_application.itr_appl)
	If ll_res<>1 Then
		MessageBox("Advertencia!","Parte no v$$HEX1$$e100$$ENDHEX$$lida",StopSign!)
		Return 2
	End If
	//valida que la parte no este inactiva
	If lo_c.of_getString(2) <> 'A' Then
		MessageBox("Advertencia!","Parte no Activa",StopSign!)
		Return 2
	End If
	This.SetItem(row,'estado_parte',lo_c.of_getString(2))
	
	SetItem(row,"de_parte_combinacion",lo_c.of_getString(1))
	SetItem(row,"co_combinacion",ll_null)
	
End If
String ls_comb
If dwo.name="co_combinacion" Then
	ll_dato=Long(Data)
	ls_comb=of_nombrecombinacion(ll_dato /*long a_combi */,il_talla)
//	ll_res=lo_c.of_nombreCombinaMuestra( il_fabrica,il_linea, il_muestra,&
//	                                  il_talla, ll_dato,n_cst_application.itr_appl)
//	If ll_res<>1 Then
//		MessageBox("Advertencia!","Combinaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida",StopSign!)
//		Return 2
//	End If
//	SetItem(row,"de_parte_combinacion",lo_c.of_getString(1))

	If ls_comb="" Then
		MessageBox("Advertencia!","Combinaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_parte_combinacion",ls_comb)

	SetItem(row,"co_partemp",il_PARTEMP_GEN)
	
End If
long ll_fabrica_exp
If dwo.name="co_producto_mp" Then
	ll_dato=Long(Data)
	ll_codigo_color=GetItemNumber(row,"co_color_mp")
	ll_fabrica_exp = GetItemNumber(row,"co_fabrica_mp")
	If Not IsNull(ll_dato) Then
		ll_res=lo_c.of_nombreMatPrima(ll_dato,n_cst_application.itr_appl)
		If ll_res<>1 Then
			MessageBox("Advertencia!","Producto no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
			Return 2
		End If

		///***********************************************************
//		ll_res = of_validar_matprima(n_cst_application.itr_appl,ll_dato,ll_codigo_color,ll_fabrica_exp)
//		If ll_res <> 1 Then
//			MessageBox("Advertencia!","Existe por lo menos una combinaci$$HEX1$$f300$$ENDHEX$$n producto - matiz - caracter$$HEX1$$ed00$$ENDHEX$$stica - color - calidad en estado obsoleto ",StopSign!)
//			Return 2
//		End If
	///***********************************************************
		
		setnull(ll_null)
		SetItem(row,"co_color_mp",ll_null)
		SetItem(row,"de_producto",lo_c.of_getString(1))
	End If
End If

If dwo.name="de_producto" Then
	ll_codigo=GetItemNumber(row,"co_producto_mp")
	If Not IsNull(ll_codigo) Then
		MessageBox("Advertencia!","No se puede modificar la descripci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
		Return 2	
	End If
End If
//long ll_fabrica_exp
If dwo.name="co_color_mp" Then
	ll_codigo=GetItemNumber(row,"co_producto_mp")
	ll_dato=Long(Data)
	If Not IsNull(ll_dato) Then
		ll_fabrica_exp=GetItemNumber(row,"co_fabrica_mp")
		ll_res=lo_c.of_nombrecolor_mp(ll_fabrica_exp /*long a_fabrica*/,&
												ll_codigo/*long a_producto*/,&
												ll_dato/*long a_color*/, &
												n_cst_application.itr_appl/*transaction a_transaction */)
		If ll_res<>1 Then
			MessageBox("Advertencia!","Color no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
			Return 2
		End If
		
		ll_res = of_validar_matprima(n_cst_application.itr_appl,ll_codigo,ll_dato,ll_fabrica_exp)
		If ll_res <> 1 Then
			MessageBox("Advertencia!","Existe por lo menos una combinaci$$HEX1$$f300$$ENDHEX$$n producto - matiz - caracter$$HEX1$$ed00$$ENDHEX$$stica - color - calidad en estado obsoleto ",StopSign!)
			Return 2
		End If
		
		SetItem(row,"de_color",lo_c.of_getString(1))
	End If
End If

If dwo.name="de_color" Then
	ll_codigo=GetItemNumber(row,"co_color_mp")
	If Not IsNull(ll_codigo) Then
		MessageBox("Advertencia!","No se puede modificar la descripci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
		Return 2	
	End If
End If

Decimal lde_peso,lde_p1,lde_pf

If dwo.name="peso_mp" Then
	If Not IsNull(Data) Then
		lde_peso=Dec(Data)
		If ide_FACTOR_MUESTRA_A_PDN<>0 Then
			SetItem(row,"peso_muestra",lde_peso/ide_FACTOR_MUESTRA_A_PDN)
		End If
	End If
End If

If dwo.name="peso_muestra" Then
	If Not IsNull(Data) Then	
		lde_peso=Dec(Data)
		If ide_FACTOR_MUESTRA_A_PDN<>0 Then
			SetItem(row,"peso_mp",lde_peso*ide_FACTOR_MUESTRA_A_PDN)
		End If		
	End If
End If
ib_cambios=True
end event

event ue_deleterow;call super::ue_deleterow;Long i,ll_tot

ll_tot=RowCount()

For i=1 To ll_tot
	SetItem(i,"consec",i)
Next
end event

event sqlpreview;call super::sqlpreview;//MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!",sqlsyntax)

end event

event ue_dwnprocessenter;Integer li_columna

IF il_tipo_prod = 10 THEN
	li_columna = 28
ELSE
	li_columna = 31
END IF

if this.AcceptText() < 0 then
  Return 1
end if
//19 nu conos
if this.GetColumn() = li_columna then 
	if this.GetRow() = this.RowCount() then
		PostEvent("ue_insertrow")
   	Return 1
 	end if
	
end if

Send(Handle(this),256,9,Long(0,0))
return 1

end event

type dw_h_fmp_muestras from u_dw_application within w_sheet_muestras1
integer x = 55
integer y = 2896
integer width = 2121
integer height = 244
integer taborder = 70
string dataobject = "d_h_fmp_muestras_1"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event ue_insertrow;long i

If This.deletedCount()>0 Then
	MessageBox("Advertencia!","Se han borrado datos, por favor guarde antes de continuar.",StopSign!)
	Return	
End If

If il_muestra=0 or il_muestra=-1 Then
	MessageBox("Advertencia!","Guarde la informaci$$HEX1$$f300$$ENDHEX$$n antes de continuar.",StopSign!)
	Return	
End If

If il_color=-1 or dw_dt_muestras_col.RowCount()=0 Then
	MessageBox("Advertencia!","Debe especificar color.",StopSign!)
	Return
End If

Super::Event ue_insertRow()

i=GetRow()

SetItem(i,"co_fabrica",il_fabrica)
SetItem(i,"co_linea",il_linea)
SetItem(i,"co_muestra",il_muestra)

SetItem(i,"co_talla",il_talla)
SetItem(i,"co_color",il_color)

//////////////////////////////////////////////////////////////////////////
// busco la maxima opcion existente y le sumo 1
// 
//////////////////////////////////////////////////////////////////////////
long ll_cons

ll_cons = Long(This.Describe("Evaluate('max(cnt_opcion for all)', 0)"))

If IsNull(ll_cons) Then
	ll_cons=0
End If

ll_cons++
/***********************************************************
SA54243 - Ceiba/jjmonsal - 03-03-2016
Comentario: El campo CNT_OPCION nunca es nulo, y el dise$$HEX1$$f100$$ENDHEX$$o se llena segun el consecutivo
Verificando con Jaime ceballos, se puede dar que se borre el detalle quedando nulo el dise$$HEX1$$f100$$ENDHEX$$o, se sugiere que solo se tenga un dise$$HEX1$$f100$$ENDHEX$$o por Fmp
***********************************************************/
SetItem(i,"cnt_opcion",ll_cons)
il_opcion=ll_cons
SetItem(i,"co_diseno",Long(il_opcion))

SetItem(i,"co_recurso",dw_dt_muestras.GetItemNumber(1,"co_recurso"))
SetItem(i,"de_recurso",dw_dt_muestras.GetItemString(1,"de_recurso"))

end event

event ue_deleterow;If dw_mat_prima.RowCount()>0 Then
	MessageBox("Advertencia!","No se puede modificar porque existe materia prima, verifique por favor.",StopSign!)
	Return 
End If
	
super::event ue_DeleteRow()
end event

event doubleclicked;call super::doubleclicked;n_cst_param lo_param

If dwo.name="co_recurso" Then
	Open(w_bus_m_recurso_tj)

	lo_param=Message.PowerObjectParm

	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
		AcceptText()
	End If
End If
end event

event itemchanged;call super::itemchanged;long ll_dato,ll_res
n_cst_comun lo_comun
If dwo.name="co_recurso" Then
	ll_dato=long(Data)
	ll_res=lo_comun.of_nombrerecursotj( ll_dato,n_cst_application.itr_appl)
	If ll_res<>1 Then
		MessageBox("Advertencia!","Recurso no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(Row,"de_recurso",lo_comun.of_getString(1))
End If
ib_cambios=True
end event

event getfocus;call super::getfocus;gb_matprima.of_color(True)
end event

event losefocus;call super::losefocus;gb_matprima.of_color(False)
end event

event rowfocuschanged;call super::rowfocuschanged;If currentrow=0 OR RowCount()=0 Then Return


If currentrow<>il_fila_opcion Then
	of_filtro_opcion(GetItemNumber(currentrow,"co_diseno"),currentrow)
End If



end event

event sqlpreview;call super::sqlpreview;//MessageBox("Advertencia!",sqlsyntax,StopSign!)
//	Return
//
end event

type gb_matprima from u_gb_base within w_sheet_muestras1
integer y = 2848
integer width = 3497
integer height = 1220
integer taborder = 0
string text = "Materia prima para cada color (Ctrl+6)"
end type

type dw_observacion from u_dw_application within w_sheet_muestras1
integer x = 55
integer y = 4136
integer width = 3383
integer height = 356
integer taborder = 90
string dataobject = "d_ext_observaciones_60"
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 15 de Enero de 2003 HORA 11:51:58:156
// 
// overwrite!
//////////////////////////////////////////////////////////////////////////

end event

event itemchanged;call super::itemchanged;If of_validarcadena( Data)<>1 Then
	Return 2
End If
ib_cambios=True
end event

type gb_1 from groupbox within w_sheet_muestras1
integer y = 4080
integer width = 3493
integer height = 464
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Observaciones de la muestra (Ctrl+7)"
end type

type gb_procesos from u_gb_base within w_sheet_muestras1
boolean visible = false
integer x = 1792
integer y = 4636
integer width = 73
integer height = 76
integer taborder = 130
boolean enabled = false
string text = "Procesos por talla (Ctrl+5)"
end type

type st_1 from statictext within w_sheet_muestras1
boolean visible = false
integer x = 2958
integer y = 772
integer width = 544
integer height = 168
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Doble Clic en recurso de Muestras, clic derecho recurso de tejido"
boolean focusrectangle = false
end type

type dw_operaciones from u_dw_application within w_sheet_muestras1
boolean visible = false
integer x = 73
integer y = 4636
integer width = 731
integer height = 192
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_m_operac_muestra_sel"
boolean vscrollbar = false
boolean border = true
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

