HA$PBExportHeader$n_cst_c_tr_modfmp.sru
$PBExportComments$/***********************************************************~r~nSA55169 - Ceiba/jjmonsal - 03-10-2016~r~nComentario: REPORTE POR MODIFICACI$$HEX1$$d300$$ENDHEX$$N EN FICHAS DE MATERIA PRIM~r~n***********************************************************/
forward
global type n_cst_c_tr_modfmp from nonvisualobject
end type
end forward

global type n_cst_c_tr_modfmp from nonvisualobject
end type
global n_cst_c_tr_modfmp n_cst_c_tr_modfmp

type variables
/***********************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016
Comentario: REPORTE POR MODIFICACI$$HEX1$$d300$$ENDHEX$$N EN FICHAS DE MATERIA PRIM
***********************************************************/
Long								il_referencia, il_talla, il_color 
n_cst_c_log_reccotizado		inv_c_log_reccotizado
n_cst_tr_modfmp				inv_tr_modfmp							//Entidad tabla reporte de Modificaciones Fmp 

uo_dsbase						ids_ds_mpInicial, ids_partesInicial
Boolean							ib_parteAdd, ib_parteDel						

Public:
CONSTANT STRING NUEVO = 'NUEVOREG'
CONSTANT STRING ELIMI = 'ELIMINADO'
CONSTANT STRING MODIF = 'MODIFICADO'
CONSTANT STRING INDICADOR_REF_SIS = 'TP'

end variables

forward prototypes
public subroutine of_setdataobjectds_mp (readonly string as_dataobject)
public subroutine of_resetds_mp ()
public subroutine of_filtrardatoscondicion (ref uo_dsbase ads_arg, readonly string as_condicion)
public subroutine of_ordenardatos (ref uo_dsbase ads_arg, readonly string as_condicion)
public subroutine of_generardatosparaelreport (readonly long al_ref, readonly long al_talla, readonly long al_color, uo_dsbase ads_partes, uo_dsbase ads_mp, readonly string as_recurso, readonly long al_diseno)
public subroutine of_limpiardatos (ref string as_mpmod, ref string as_de_mpmod, ref long al_color_mpmod, ref string as_peso_mod)
public function uo_dsbase of_cargardsordenessis (ref string as_orden_prev_fab, ref string as_sol_pedido, readonly long al_ref, readonly long al_talla, readonly long al_color)
public subroutine of_inicializarbool (ref boolean ab_agrego, ref boolean ab_elimino)
public subroutine of_setvaloresmod (ref boolean ab_haymodifi, ref string as_mpmod, ref string as_de_mpmod, ref long al_color_mpmod, ref string as_peso_mod, ref uo_dsbase ads_ref, readonly string as_mpinicial, readonly long al_color_mpinicial, readonly string as_peso_inicial, readonly long al_filamp)
public function string of_setvaloresiniciales (ref string as_mpinicial, ref string as_de_mpinicial, ref long al_color_mpinicial, ref string as_peso_inicial, readonly long al_filamp, readonly long al_filasmpini, readonly long al_filasmpmod, uo_dsbase ads_ds_mpinicial, uo_dsbase ads_mp)
public subroutine of_setvaloreseliminados (ref string as_mpmod, ref string as_de_mpmod, ref long al_color_mpmod, ref string as_peso_mod, ref boolean ab_haymodifi)
public subroutine of_newsorteliminado (ref uo_dsbase ads_ds_mpinicial, ref uo_dsbase ads_mp)
public subroutine of_newsort (ref uo_dsbase ads_arg, readonly string as_dato)
public subroutine of_cargarinforeportepormodfmp (readonly string as_recurso, uo_dsbase ads_colores, uo_dsbase ads_partes, uo_dsbase ads_mp, readonly datawindow adw_mpinicial, readonly datawindow adw_partesinicial)
public subroutine of_poblards_mp_partes (datawindow adw_dwmp, datawindow adw_dwp)
public subroutine of_setib_parteadd (readonly boolean ab_arg)
public subroutine of_setib_partedel (readonly boolean ab_arg)
public function long of_getnumpartes (readonly long al_filaspartesmod)
public subroutine of_setvalorconvertidoaref (readonly boolean ab_bool)
public subroutine of_setinv_c_log_reccotizado (n_cst_c_log_reccotizado anvo_entidad)
public subroutine of_cargardatosdefaultsis_sap (ref uo_dsbase ads_datossis)
public subroutine of_cargarcamposordenprev_sap (ref string as_orden_prev_fab, readonly uo_dsbase as_datossap, readonly long al_filadatossis)
public function boolean of_cargarcamposordenessis (ref string as_orden_prev_fab, ref string as_sol_pedido, readonly uo_dsbase as_datossis, readonly long al_filadatossis)
public function uo_dsbase of_cargardsordenessap (readonly long al_refer, readonly long al_talla, readonly long al_color)
public function uo_dsbase of_cargardsordenessis_sap (uo_dsbase ads_datossis, uo_dsbase ads_datossap)
public subroutine of_limpiardato (ref long al_dato)
public subroutine of_limpiardato (ref string as_dato)
end prototypes

public subroutine of_setdataobjectds_mp (readonly string as_dataobject);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : of_setDataObjectDs_Mp
<DESC> Description: Setear dataobject del objeto  </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Setter </USAGE>
********************************************************************/
Try
	ids_ds_mpInicial.dataObject = as_dataobject
	ids_ds_mpInicial.SetTransObject(n_cst_application.itr_appl)
CATCH( Exception ex1)
	Throw ex1
End try
end subroutine

public subroutine of_resetds_mp ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : of_resetDs_Mp
<DESC> Description: reset del objeto  </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> reset </USAGE>
********************************************************************/
Try
	ids_ds_mpInicial.reset( )
CATCH( Exception ex1)
	Throw ex1
End try
end subroutine

public subroutine of_filtrardatoscondicion (ref uo_dsbase ads_arg, readonly string as_condicion);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : of_filtrarDatosCondicion
<DESC> Description: Filtrar segun condicion </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Filtrar segun sea la condicion  </USAGE>
********************************************************************/
Long			ll_ref, ll_fila
Integer 		li_talla
String		ls_entrada, newsort	

Exception ex
ex = create Exception
Try
	ads_arg.SetFilter(as_condicion)
	IF ads_arg.Filter() < 0 THEN 
		ex.setmessage('Inconsistencia al cargar la informacion del reporte por fmp')
		Throw ex
	END IF
	newsort = "nu_partemp, co_color, cnt_opcion,nu_mp"	
	ads_arg.SetSort(newsort)	
	ads_arg.Sort( )	

	
CATCH( Exception ex1)
	Throw ex1
End try
end subroutine

public subroutine of_ordenardatos (ref uo_dsbase ads_arg, readonly string as_condicion);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : of_OrdenarDatos
<DESC> Description: Ordenar segun condicion </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Ordenar segun sea la condicion  </USAGE>
********************************************************************/
Exception ex
ex = create Exception
Try
	ads_arg.SetSort(as_condicion)
	ads_arg.Sort()
	ads_arg.GroupCalc()

CATCH( Exception ex1)
	Throw ex1
End try
end subroutine

public subroutine of_generardatosparaelreport (readonly long al_ref, readonly long al_talla, readonly long al_color, uo_dsbase ads_partes, uo_dsbase ads_mp, readonly string as_recurso, readonly long al_diseno);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : of_GenerarDatosParaElReport
<DESC> Description: Obtener los Datos Faltantes para completar el reporte </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Interface con SIS </USAGE>
********************************************************************/
Long			ll_reccotcierra, ll_reccotnocierra, ll_color_mpinicial, ll_color_mpmod, ll_filasMpIni, &
				ll_filas, ll_filasMpMod, ll_filaP, ll_filaMp, ll_filaDatosSis, ll_conse_orden, &
				ll_filasPartesIni,ll_filasPartesMod, ll_filasCicloPartes
String		ls_orden_prev_fab, ls_sol_pedido, ls_mpinicial, ls_mpmod, ls_de_mpinicial, ls_de_mpmod, &
				ls_peso_inicial, ls_peso_mod, ls_filtro, ls_accion, LS_PARTE
Boolean		lb_hayModifi

n_cst_comun	lo_c
uo_dsbase	lds_datosSIS, lds_datosSAP, lds_datosSISSAP
Exception	ex
ex = Create	Exception
Try
	/*--------------- CARGAR DS DATOS SIS y SAP---------------------------------------------*/
	lds_datosSIS = THIS.of_cargarDSOrdenesSIS(ls_orden_prev_fab,ls_sol_pedido,al_ref,al_talla,al_color) 
	lds_datosSAP = THIS.of_cargarDSOrdenesSAP(al_ref,al_talla,al_color) 	
	lds_datosSISSAP = THIS.of_cargarDSOrdenesSIS_SAP(lds_datosSIS,lds_datosSAP)
	/*--------------------------------------------------------------------------------------*/
	
	IF as_recurso = 'CIERRA' THEN 
		ll_reccotcierra = inv_c_log_reccotizado.il_recurso
	END IF 
	
	IF as_recurso = 'NO CIERRA' THEN 
		ll_reccotnocierra = inv_c_log_reccotizado.il_recurso
	END IF
	
	ll_filasCicloPartes = THIS.of_getNumPartes(ads_partes.RowCount())
	
	FOR ll_filaP = 1 TO ll_filasCicloPartes
		IF ib_parteAdd THEN LS_PARTE = String(ads_partes.getItemNumber(ll_filaP,'nu_partemp'))
		IF ib_parteDel THEN LS_PARTE = String(ids_partesInicial.getItemNumber(ll_filaP,'nu_partemp'))
		
		/*----------- Filtrar y ordenar los Registros --------------------------------------------------*/
		ls_filtro = ' nu_partemp = ' +  LS_PARTE +&
						' and co_color = '+ String(al_color)+&
						' and co_diseno ='+ String(al_diseno)+''
		THIS.of_filtrarDatosCondicion(ids_ds_mpInicial,ls_filtro)
		THIS.of_filtrarDatosCondicion(ads_mp,ls_filtro)
		/*-----------------------------------------------------------------------------------------------*/
		
		ll_filasMpIni	= ids_ds_mpInicial.RowCount()
		ll_filasMpMod	= ads_mp.RowCount()
		IF ll_filasMpIni > ll_filasMpMod THEN //Elimino registro
			ll_filas = ll_filasMpIni
			THIS.of_NewSortEliminado(ids_ds_mpInicial,ads_mp)
		ELSEIF ll_filasMpMod >= ll_filasMpIni THEN //Agrega registro 
			ll_filas = ll_filasMpMod
		END IF
		
		FOR ll_filaMp = 1 TO ll_filas
			lb_hayModifi = FALSE
				  
			ls_accion = THIS.of_SetValoresIniciales(ls_mpInicial,ls_de_mpinicial,ll_color_mpinicial,ls_peso_inicial,&
															ll_filaMp,ll_filasMpIni,ll_filasMpMod,ids_ds_mpInicial,ads_mp)															
			CHOOSE CASE ls_accion
				CASE NUEVO
					THIS.of_setvaloresmod(lb_hayModifi,ls_mpmod,ls_de_mpmod,ll_color_mpmod,ls_peso_mod,ads_mp,&
																ls_mpInicial, ll_color_mpinicial,ls_peso_inicial,ll_filamp)
				CASE ELIMI
					THIS.of_setValoresEliminados(ls_mpmod,ls_de_mpmod,ll_color_mpmod,ls_peso_mod,lb_hayModifi)																
				CASE MODIF
					THIS.of_setvaloresmod(lb_hayModifi,ls_mpmod,ls_de_mpmod,ll_color_mpmod,ls_peso_mod,ads_mp,&
																ls_mpInicial, ll_color_mpinicial,ls_peso_inicial,ll_filamp)
			END CHOOSE
			
			IF lb_hayModifi THEN
				//Si no se encontro informacion en SIS setear con Espacios 
				IF lds_datosSISSAP.RowCount() <= 0 THEN of_cargarDatosDefaultSIS_SAP(lds_datosSISSAP)
				
				FOR ll_filaDatosSis = 1 TO lds_datosSISSAP.RowCount()
					of_limpiarDato(ll_conse_orden)
					of_limpiarDato(ls_orden_prev_fab)
					of_limpiarDato(ls_sol_pedido)
					
					ll_conse_orden = Long(lds_datosSISSAP.getItemNumber(ll_filaDatosSis,'tb_ordenprevfab_cs_orden'))
					//Si no se carga la informacion de sap carguela de sis 
					THIS.of_cargarCamposOrdenesSIS(ls_orden_prev_fab,ls_sol_pedido,lds_datosSISSAP,ll_filaDatosSis) 
					THIS.of_cargarCamposOrdenprev_Sap(ls_orden_prev_fab, lds_datosSISSAP,ll_filaDatosSis)
					 
					inv_tr_modfmp.of_Validarregexiste(al_ref, al_talla,al_color,ll_conse_orden,ls_orden_prev_fab,&
							ls_sol_pedido,ll_recCotcierra,ll_recCotNocierra,ls_mpinicial,ls_mpmod,ll_color_mpinicial,ll_color_mpmod) 
					

					
					CHOOSE CASE inv_tr_modfmp.of_getOperacion()
						CASE 'INSERT' 
							inv_tr_modfmp.of_setdatosinserccion(al_ref, al_talla, al_color, ls_orden_prev_fab, ls_sol_pedido, ll_reccotcierra, &
																			ll_reccotnocierra, ls_mpinicial, ls_mpmod, ls_de_mpinicial, ls_de_mpmod, &
																			ll_color_mpinicial, ll_color_mpmod, ls_peso_inicial, ls_peso_mod,ll_conse_orden)
	
						CASE 'UPDATE'
							inv_tr_modfmp.of_setDatosModificacion(al_ref, al_talla, al_color, ls_orden_prev_fab, ls_sol_pedido, ll_reccotcierra, &
																			ll_reccotnocierra, ls_mpinicial, ls_mpmod, ls_de_mpinicial, ls_de_mpmod, &
																			ll_color_mpinicial, ll_color_mpmod, ls_peso_inicial, ls_peso_mod,ll_conse_orden)
					END CHOOSE 
				NEXT 
			END IF
	
		NEXT
		
		THIS.of_filtrarDatosCondicion(ids_ds_mpInicial,'')
		THIS.of_filtrarDatosCondicion(ads_mp,'')
	NEXT	

CATCH( Exception ex1)
	Throw ex1
End try
end subroutine

public subroutine of_limpiardatos (ref string as_mpmod, ref string as_de_mpmod, ref long al_color_mpmod, ref string as_peso_mod);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : of_LimpiarDatos
<DESC> Description: limpiar datos  </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> limpiar datos </USAGE>
********************************************************************/
Try
	SetNull(as_mpmod)
	SetNull(as_de_mpmod)
	SetNull(al_color_mpmod)
	SetNull(as_peso_mod)	
CATCH( Exception ex1)
	Throw ex1
End try
end subroutine

public function uo_dsbase of_cargardsordenessis (ref string as_orden_prev_fab, ref string as_sol_pedido, readonly long al_ref, readonly long al_talla, readonly long al_color);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : of_cargarDSOrdenesSIS
<DESC> Description: Obtener la informacion referente al campo ORDEN PREV/FAB Y SOLICITUD PEDIDO SIS</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Obtener informacion  </USAGE>
********************************************************************/
n_cst_tb_ordenprevfab	lonv_tb_ordenprevfab
Exception 	ex

Try 
	ex 						= Create Exception
	lonv_tb_ordenprevfab	= Create n_cst_tb_ordenprevfab
	
	lonv_tb_ordenprevfab.of_CargarTransaccionalDB2()	
	lonv_tb_ordenprevfab.of_setNombreDataObject()
	lonv_tb_ordenprevfab.of_RecuperarInformacionDS(al_ref,al_talla,al_color )
	RETURN lonv_tb_ordenprevfab.of_getDS()
	
CATCH( Exception ex1)
	Throw ex1
End try
end function

public subroutine of_inicializarbool (ref boolean ab_agrego, ref boolean ab_elimino);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : of_InicializarBool
<DESC> Description: Setear valores a variables  </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Interface con SIS </USAGE>
********************************************************************/
Exception	ex
ex 			= Create	Exception
Try
	ab_agrego = FALSE
	ab_elimino = FALSE

CATCH( Exception ex1)
	Throw ex1
End try
end subroutine

public subroutine of_setvaloresmod (ref boolean ab_haymodifi, ref string as_mpmod, ref string as_de_mpmod, ref long al_color_mpmod, ref string as_peso_mod, ref uo_dsbase ads_ref, readonly string as_mpinicial, readonly long al_color_mpinicial, readonly string as_peso_inicial, readonly long al_filamp);/********************************************************************
SA55169 - Ceiba/jjmonsal - 04-11-2016 FunctionName : of_setValoresMod
<DESC> Description: Setear valores a campos Modificados </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Setter </USAGE>
********************************************************************/
n_cst_comun	lo_c
Exception	ex
ex = Create	Exception
Try			
	/*----------- Limpiar los valores Modificados---------------------*/
	THIS.of_LimpiarDatos(as_mpmod,as_de_mpmod,al_color_mpmod,as_peso_mod)
	/*----------------------------------------------------------------*/
	
	IF (as_mpinicial <> String(ads_Ref.getItemNumber(al_filaMp,'co_producto_mp'))) THEN
		as_mpmod	= String(ads_Ref.getItemNumber(al_filaMp,'co_producto_mp'))
	
		IF lo_c.of_nombreMatPrima(Long(ads_Ref.getItemNumber(al_filaMp,'co_producto_mp')),n_cst_application.itr_appl) = 1 THEN 
			as_de_mpmod = lo_c.of_getString(1)
		END IF 
		ab_hayModifi		= TRUE 
	END IF 
	
	IF (al_color_mpinicial <> ads_Ref.getItemNumber(al_filaMp,'co_color_mp')) THEN 
		al_color_mpmod		= ads_Ref.getItemNumber(al_filaMp,'co_color_mp')
		ab_hayModifi		= TRUE 
	END IF 
	
	IF (as_peso_inicial <> String(ads_Ref.getItemDecimal(al_filaMp,'peso_mp'))) THEN 
		as_peso_mod			= String(ads_Ref.getItemDecimal(al_filaMp,'peso_mp'))
		ab_hayModifi		= TRUE 
	END IF 
	
	IF ab_hayModifi THEN //Validar que aunque no existan cambios, no llegue Nulo 
		//En Materia Prima
		IF IsNull(as_mpmod) THEN 
			as_mpmod = ""
			as_de_mpmod = ""
		END IF 
		//En color de la Materia Prima
		IF IsNull(al_color_mpmod) THEN 
			al_color_mpmod = 0 
		END IF 
		//En el peso de la Materia Prima
		IF IsNull(as_peso_mod) THEN 
			as_peso_mod = ""
		END IF 
	END IF 
CATCH( Exception ex1)
	Throw ex1
End try
end subroutine

public function string of_setvaloresiniciales (ref string as_mpinicial, ref string as_de_mpinicial, ref long al_color_mpinicial, ref string as_peso_inicial, readonly long al_filamp, readonly long al_filasmpini, readonly long al_filasmpmod, uo_dsbase ads_ds_mpinicial, uo_dsbase ads_mp);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : of_SetValoresIniciales 
<DESC> Description: Setear  los Datos inicialmente cargados en la FMP </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> setter</USAGE>
********************************************************************/
String			ls_accion
dwItemStatus	l_statusMod, l_statusIni
n_cst_comun		lo_c
Exception		ex
ex = Create	Exception

Try
	l_statusIni	= ads_ds_mpInicial.GetItemStatus(al_filamp, 'co_producto_mp', Primary!)
	l_statusMod	= ads_mp.GetItemStatus(al_filamp, 'co_producto_mp', Primary!)
	//	of_InicializarBool(lb_agrego,lb_elimino)
	IF al_filasMpMod > al_filasMpIni AND IsNull(l_statusIni) THEN //Agregue Nuevo Registro 
		as_mpInicial		= ' '
		as_de_mpinicial	= ' '
		al_color_mpinicial= 0
		as_mpInicial		= ' '
		as_peso_inicial	= ' ' 
		ls_accion = NUEVO
	ELSEIF al_filasMpIni > al_filasMpMod AND IsNull(l_statusMod) THEN //Elimino registro
		as_mpInicial = String(ids_ds_mpInicial.getItemNumber(al_filaMp,'co_producto_mp'))
		IF lo_c.of_nombreMatPrima(Long(ids_ds_mpInicial.getItemNumber(al_filaMp,'co_producto_mp')),n_cst_application.itr_appl) = 1 THEN 
			as_de_mpinicial = lo_c.of_getString(1)
		End If
		al_color_mpinicial= ids_ds_mpInicial.getItemNumber(al_filaMp,'co_color_mp')
		as_peso_inicial = String(ids_ds_mpInicial.getItemDecimal(al_filaMp,'peso_mp'))
		ls_accion = ELIMI
	ELSE 
		as_mpInicial = String(ids_ds_mpInicial.getItemNumber(al_filaMp,'co_producto_mp'))
		IF lo_c.of_nombreMatPrima(Long(ids_ds_mpInicial.getItemNumber(al_filaMp,'co_producto_mp')),n_cst_application.itr_appl) = 1 THEN 
			as_de_mpinicial = lo_c.of_getString(1)
		End If
		al_color_mpinicial= ids_ds_mpInicial.getItemNumber(al_filaMp,'co_color_mp')
		as_peso_inicial = String(ids_ds_mpInicial.getItemDecimal(al_filaMp,'peso_mp'))
		ls_accion = MODIF
	END IF
	RETURN ls_accion
CATCH( Exception ex1)
	Throw ex1
End try
end function

public subroutine of_setvaloreseliminados (ref string as_mpmod, ref string as_de_mpmod, ref long al_color_mpmod, ref string as_peso_mod, ref boolean ab_haymodifi);/********************************************************************
SA55169 - Ceiba/jjmonsal - 04-11-2016 FunctionName : of_setValoresEliminados
<DESC> Description: Setear valores a campos Modificados </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Setter </USAGE>
********************************************************************/
n_cst_comun	lo_c
Exception	ex
ex = Create	Exception
Try			
	as_mpmod			= 'Eliminado'
	as_de_mpmod		= 'Eliminado'
	al_color_mpmod = 0
	as_peso_mod		= 'Eliminado'	
	ab_hayModifi	= TRUE
	
CATCH( Exception ex1)
	Throw ex1
End try
end subroutine

public subroutine of_newsorteliminado (ref uo_dsbase ads_ds_mpinicial, ref uo_dsbase ads_mp);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : of_NewSortEliminado
<DESC> Description: Filtrar segun condicion </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Filtrar segun sea la condicion  </USAGE>
********************************************************************/
String		newsort	

Exception ex
ex = create Exception
Try
	//Elimacion de partes 
	IF ids_ds_mpInicial.Rowcount( ) <= 0 THEN 
		THIS.of_NewSort(ads_mp,'')
		RETURN 
	ELSEIF ads_mp.Rowcount( ) <= 0 THEN
		THIS.of_NewSort(ids_ds_mpInicial,'')
		RETURN 
	END IF 
		
	//Cuando son mas de 2 registros, Se debe implementar un Find en ambos DS
	IF ids_ds_mpInicial.object.co_producto_mp[1] = ads_mp.object.co_producto_mp[1] THEN 
		THIS.of_NewSort(ids_ds_mpInicial,'')
		THIS.of_NewSort(ads_mp,'')
	ELSE
		THIS.of_NewSort(ids_ds_mpInicial,'desc')
		THIS.of_NewSort(ads_mp,'desc')
	END IF
	
CATCH( Exception ex1)
	Throw ex1
End try
end subroutine

public subroutine of_newsort (ref uo_dsbase ads_arg, readonly string as_dato);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : of_Ordenado
<DESC> Description: Filtrar segun condicion </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Filtrar segun sea la condicion  </USAGE>
********************************************************************/
String		newsort	

Exception ex
ex = create Exception
Try
	newsort = "co_fabrica,co_linea,co_muestra,co_talla,co_color,co_centro,nu_partemp,co_producto_mp "+as_dato
	ads_arg.SetSort(newsort)	
	ads_arg.Sort( )
	
CATCH( Exception ex1)
	Throw ex1
End try
end subroutine

public subroutine of_cargarinforeportepormodfmp (readonly string as_recurso, uo_dsbase ads_colores, uo_dsbase ads_partes, uo_dsbase ads_mp, readonly datawindow adw_mpinicial, readonly datawindow adw_partesinicial);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : of_cargarInfoReportePorModFMP
<DESC> Description:Esta funcion permite almacenar la informacion sobre las modificaciones realizada
a los recursos cotizados cierra o no cierra y con necesidad en Produccion </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Cuando se modifica un recurso cotizado cierra o no cierra se debe invocar esta funcion, ya esta validara si se debe almacenar o no</USAGE>
********************************************************************/
//Se crea la Tabla tr_ModFmp: Tabla que almacena la informacion sobre los cambios realizados a los recursos cotizados y que tienen necesidades en produccion (SIS y SAP)
Long			ll_ref, ll_talla, ll_color, ll_fila, ll_reccotcierra, ll_reccotnocierra, &
				ll_color_mpinicial, ll_color_mpmod, ll_diseno
Integer 		li_talla
String		ls_orden_prev_fab, ls_sol_pedido, ls_mpinicial, ls_mpmod, ls_de_mpinicial, &
				ls_de_mpmod, ls_peso_inicial, ls_peso_mod 

Exception ex

Try
	ex = create Exception
	IF THIS.inv_c_log_reccotizado.ib_converref THEN //Validar si se debe o No generar el Reporte 
		THIS.of_PoblarDS_mp_Partes(adw_mpinicial,adw_partesinicial)
		THIS.of_filtrarDatosCondicion(ads_colores,' sw_enpdn = 1 ') //Filtrar solo colores con necesidades en produccion
		ll_ref	= inv_c_log_reccotizado.il_ref
		ll_talla	= inv_c_log_reccotizado.il_talla		
		FOR ll_fila = 1 TO ads_colores.rowCount()
			ll_color	= ads_colores.getItemNumber(ll_fila,'co_color') 
			ll_diseno= ads_colores.getItemNumber(ll_fila,'co_diseno')
			//Cargar datos de la controladora a la entidad
			THIS.of_GenerarDatosParaElReport(ll_ref,ll_talla,ll_color,ads_partes,ads_mp,as_recurso,ll_diseno)
		
		NEXT 
		
		IF inv_tr_modfmp.of_Update( ) < 0 THEN 
			ex.setmessage('Inconsistencia al cargar la informacion del reporte por fmp')
			Throw ex
		END IF 
	END IF
	
CATCH( Exception ex1)
	Throw ex1
End try
end subroutine

public subroutine of_poblards_mp_partes (datawindow adw_dwmp, datawindow adw_dwp);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : of_PoblarDs_Mp
<DESC> Description: Retireve del objeto  </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> reset </USAGE>
********************************************************************/
Exception ex
ex	= Create Exception
Try
	ids_ds_mpInicial.dataobject = adw_dwMp.dataobject
	IF adw_dwMp.RowsCopy(1, adw_dwMp.RowCount(), Primary!, &
							ids_ds_mpInicial, 1, Primary!) < 0 THEN 
		ex.setmessage('Inconsistencia al realizar el copiado de informacion de la materia prima original')
		Throw ex
	END IF 
	
	ids_partesInicial.dataobject = adw_dwP.dataobject
	IF adw_dwP.RowsCopy(1, adw_dwP.RowCount(), Primary!, &
							ids_partesInicial, 1, Primary!) < 0 THEN 
		ex.setmessage('Inconsistencia al realizar el copiado de informacion de las partes originales')
		Throw ex
	END IF 
	
CATCH( Exception ex1)
	Throw ex1
End try
end subroutine

public subroutine of_setib_parteadd (readonly boolean ab_arg);/********************************************************************
SA55169 - Ceiba/jjmonsal - 04-11-2016 FunctionName : of_setib_parteAdd
<DESC> Description: Setear valores a campos Modificados </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Setter </USAGE>
********************************************************************/
Try			
	ib_parteAdd	= ab_arg 
CATCH( Exception ex1)
	Throw ex1
End try
end subroutine

public subroutine of_setib_partedel (readonly boolean ab_arg);/********************************************************************
SA55169 - Ceiba/jjmonsal - 04-11-2016 FunctionName : of_setib_parteDel
<DESC> Description: Setear valores a campos Modificados </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Setter </USAGE>
********************************************************************/
Try			
	ib_parteDel	= ab_arg 
CATCH( Exception ex1)
	Throw ex1
End try
end subroutine

public function long of_getnumpartes (readonly long al_filaspartesmod);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : of_getNumPartes
<DESC> Description: Obtener los Datos Faltantes para completar el reporte </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Interface con SIS </USAGE>
********************************************************************/
Long			ll_filasPartesIni, ll_filasCicloPartes
Try	
	ll_filasPartesIni = ids_partesInicial.RowCount()

	IF ll_filasPartesIni > al_filasPartesMod THEN 
		ll_filasCicloPartes = ll_filasPartesIni //Se elimina un parte 
		of_setib_parteDel(TRUE)
	ELSE 
		ll_filasCicloPartes = al_filasPartesMod //Se agrega una parte 
		of_setib_parteAdd(TRUE)
	END IF
	
	Return ll_filasCicloPartes
		
CATCH( Exception ex1)
	Throw ex1
End try
end function

public subroutine of_setvalorconvertidoaref (readonly boolean ab_bool);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : of_setvalorConvertidoaRef
<DESC> Description: Setear del valor de la instancia del objeto tipo n_cst_c_log_reccotizado el bool de convertido o no a ref </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Setter </USAGE>
********************************************************************/
Boolean	lb_bool
Try
	THIS.inv_c_log_reccotizado.ib_converref = ab_bool
CATCH( Exception ex1)
	Throw ex1
End try
end subroutine

public subroutine of_setinv_c_log_reccotizado (n_cst_c_log_reccotizado anvo_entidad);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : of_setvalorConvertidoaRef
<DESC> Description: Setear del valor de la instancia del objeto tipo n_cst_c_log_reccotizado el bool de convertido o no a ref </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Setter </USAGE>
********************************************************************/
Try
	THIS.inv_c_log_reccotizado = anvo_entidad
CATCH( Exception ex1)
	Throw ex1
End try
end subroutine

public subroutine of_cargardatosdefaultsis_sap (ref uo_dsbase ads_datossis);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : of_cargardatosdefaultsis_Sap
<DESC> Description: cargar datos vacios cuando en sis no hay informacion </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Interface con SIS </USAGE>
********************************************************************/
Long 			ll_filaInsert
String		ls_espacio

Exception	ex
ex = Create	Exception
Try
	ls_espacio = ''
	ll_filaInsert = ads_datosSIS.insertRow(0)
	 
	ads_datosSIS.SetItem(ll_filaInsert,'tb_ordenprevfab_co_ordenprevisional',ls_espacio)
	ads_datosSIS.SetItem(ll_filaInsert,'tb_ordenprevfab_co_ordenfabricacion',ls_espacio)
	ads_datosSIS.SetItem(ll_filaInsert,'tb_ordenmaestra_ordenproduccion',ls_espacio)
	ads_datosSIS.SetItem(ll_filaInsert,'tb_ordenprevfab_cs_orden',0)	

CATCH( Exception ex1)
	Throw ex1
End try
end subroutine

public subroutine of_cargarcamposordenprev_sap (ref string as_orden_prev_fab, readonly uo_dsbase as_datossap, readonly long al_filadatossis);/********************************************************************
SA55583 - Ceiba/jjmonsal - 21-09-2016 FunctionName: of_cargarCamposOrdenPrev_SAP
<DESC> Description: cargar campos requeridos de SAP </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Obtener datos</USAGE>
********************************************************************/
String			ls_sol_pedido, ls_array[]
Integer			li_Pos_Guion, ll_fila
n_cst_String	lnvo_string
Exception 		ex
Try
	ex = Create Exception
	IF IsNull(as_orden_prev_fab) THEN
		as_orden_prev_fab = ' '
	END IF
	
	IF NOT(len(trim(as_datosSap.getItemString(al_filadatossis,'tb_ordenprevfab_co_ordenprevisional')))) = 0 AND &
		len(trim(as_datosSap.getItemString(al_filadatossis,'tb_ordenprevfab_co_ordenfabricacion'))) = 0 THEN 
		as_orden_prev_fab	= as_datosSap.getitemstring(al_filaDatosSis,'tb_ordenprevfab_co_ordenprevisional')
	ELSE 
		RETURN
	END IF

Catch(Exception ex1)
	Throw ex1
End Try

end subroutine

public function boolean of_cargarcamposordenessis (ref string as_orden_prev_fab, ref string as_sol_pedido, readonly uo_dsbase as_datossis, readonly long al_filadatossis);/********************************************************************
SA55583 - Ceiba/jjmonsal - 21-09-2016 FunctionName: of_cargarCamposOrdenesSIS
<DESC> Description: cargar campos requeridos de SIS </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Obtener datos</USAGE>
********************************************************************/
String			ls_sol_pedido, ls_array[]
Integer			li_Pos_Guion, ll_fila
Boolean			lb_cargoDatosSis
n_cst_String	lnvo_string
Exception 		ex
Try
	lb_cargoDatosSis = FALSE
	ex = Create Exception
	IF as_datosSIS.Rowcount( ) <= 0 THEN 
		as_orden_prev_fab = '-'
		as_sol_pedido = '-'
	END IF
	
	IF NOT(IsNull(as_datosSIS.getitemstring(al_filaDatosSis,'tb_ordenprevfab_co_ordenfabricacion'))) THEN 
		as_orden_prev_fab	= as_datosSIS.getitemstring(al_filaDatosSis,'tb_ordenprevfab_co_ordenfabricacion')
		lb_cargoDatosSis = TRUE 
	ELSE 
		as_orden_prev_fab	= as_datosSIS.getitemstring(al_filaDatosSis,'tb_ordenprevfab_co_ordenprevisional')
		lb_cargoDatosSis = TRUE 
	END IF
	
	ls_sol_pedido	= as_datosSIS.getitemstring(al_filaDatosSis,'tb_ordenmaestra_ordenproduccion')
	lnvo_string.of_convertirstring_array(ls_sol_pedido,ls_array,'-')
	
	FOR ll_fila = 1 TO UpperBound(ls_array) 
		IF Len(ls_array[ll_fila]) = 10 THEN 
			as_sol_pedido = ls_array[ll_fila]
		END IF 	
	NEXT
	
	IF IsNull(as_orden_prev_fab) THEN
		as_orden_prev_fab = ' '
		lb_cargoDatosSis = FALSE
	END IF
	
	IF IsNull(as_sol_pedido) THEN
		as_sol_pedido = ' '
		lb_cargoDatosSis = FALSE
	END IF	
	
	RETURN lb_cargoDatosSis
Catch(Exception ex1)
	Throw ex1
End Try

end function

public function uo_dsbase of_cargardsordenessap (readonly long al_refer, readonly long al_talla, readonly long al_color);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : of_cargarDSOrdenesSAP
<DESC> Description: Obtener la informacion referente al campo ORDEN PREV/FAB Y SOLICITUD PEDIDO SIS</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Obtener informacion  </USAGE>
********************************************************************/
Long					ll_return, ll_filas
uo_dsbase			lds_datosSap
Exception ex

String	ls_refer, ls_talla, ls_color
n_cst_llamado_sap lnvo_llamado_sap
Try
	ex 					= create Exception
	lnvo_llamado_sap	= Create n_cst_llamado_sap
	lds_datosSap		= create uo_dsbase
	
	lds_datosSap.Dataobject= 'd_ex_gr_validarnecesidadenpdn'
	
	ls_refer = String(al_refer) + INDICADOR_REF_SIS	
	ls_talla = String(al_talla, '00')
	ls_color = String(al_color, '000000')	
	
	ll_return = lnvo_llamado_sap.of_Ejecutar_RFC_SAP(ls_refer, ls_talla, ls_color) 
	IF ll_return < 0 Then
		ex.setmessage('Fallo obtencion de datos SAP')
		throw ex
	ELSEIF ll_return = 0 Then //El color no tiene necesidades en produccion para SAP
		RETURN lds_datosSap
	End IF
	
	ll_filas = lnvo_llamado_sap.of_getDSdatosSAP().RowCount()
	IF lnvo_llamado_sap.of_getDSdatosSAP().RowsCopy(1, ll_filas, Primary!, lds_datosSap, 1, Primary!) < 0 THEN 
		ex.setmessage('Fallo copiado obtencion de datos SAP')
		throw ex
	End IF
	
	Return lds_datosSap
	
CATCH( Exception ex1)
	Throw ex1
End try
end function

public function uo_dsbase of_cargardsordenessis_sap (uo_dsbase ads_datossis, uo_dsbase ads_datossap);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : of_cargarDSOrdenesSIS_SAP
<DESC> Description: Obtener la informacion referente al campo ORDEN PREV/FAB Y SOLICITUD PEDIDO SIS y de SAP</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Obtener informacion  </USAGE>
********************************************************************/
Long			ll_fila, ll_filas, ll_filaInsert
String		ls_espacio
Exception 	ex
uo_dsbase	lds_DSOrdenesSIS_SAP
TRY
	ls_espacio 				= ''
	ex 						= Create Exception	
	lds_DSOrdenesSIS_SAP = create uo_dsbase
	lds_DSOrdenesSIS_SAP.Dataobject= 'd_sq_gr_db2_tb_ordenprevfab_color_mae'
	lds_DSOrdenesSIS_SAP.SetTransobject(n_cst_application.itr_appl)
	
	IF ads_datosSIS.ROWCOUNT() > 0 THEN 
		IF ads_datosSIS.RowsCopy(1,ads_datosSIS.RowCount(), Primary!, lds_DSOrdenesSIS_SAP, 1, Primary!) < 0 THEN 
			ex.setmessage('Fallo copiado de datos SIS en fusion de datos')
			THROW ex
		END IF
	END IF 
	
	ll_filas = ads_DatosSAP.RowCount()
	FOR ll_fila = 1 TO ll_filas
		ll_filaInsert = lds_DSOrdenesSIS_SAP.insertRow(0)
		lds_DSOrdenesSIS_SAP.SetItem(ll_filaInsert,'tb_ordenprevfab_co_ordenprevisional',ads_DatosSAP.getItemString(ll_fila, 'campo2'))
		lds_DSOrdenesSIS_SAP.SetItem(ll_filaInsert,'tb_ordenprevfab_co_ordenfabricacion',ls_espacio)
		lds_DSOrdenesSIS_SAP.SetItem(ll_filaInsert,'tb_ordenmaestra_ordenproduccion',ls_espacio)
		lds_DSOrdenesSIS_SAP.SetItem(ll_filaInsert,'tb_ordenprevfab_cs_orden',ll_fila)	
	NEXT 
	
	RETURN lds_DSOrdenesSIS_SAP
CATCH( Exception ex1)
	Throw ex1
End try
end function

public subroutine of_limpiardato (ref long al_dato);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : of_limpiardato
<DESC> Description: limpiar datos  </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> limpiar datos </USAGE>
********************************************************************/
Try
	SetNull(al_dato)
CATCH( Exception ex1)
	Throw ex1
End try
end subroutine

public subroutine of_limpiardato (ref string as_dato);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : of_limpiardato
<DESC> Description: limpiar datos  </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> limpiar datos </USAGE>
********************************************************************/
Try
	SetNull(as_dato)
CATCH( Exception ex1)
	Throw ex1
End try
end subroutine

on n_cst_c_tr_modfmp.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_c_tr_modfmp.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;/***********************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016
Comentario: Se crea controladora de la entidad para REPORTE POR MODIFICACI$$HEX1$$d300$$ENDHEX$$N EN FICHAS DE MATERIA PRIM
***********************************************************/
inv_tr_modfmp	= CREATE n_cst_tr_modfmp
inv_tr_modfmp.of_SetNombreDataObject('d_sq_gr_tr_modfmp')

//Crear la instancia para interactuar con la controladora de los recursos cotizados modificados
inv_c_log_reccotizado = CREATE n_cst_c_log_reccotizado
inv_c_log_reccotizado.ib_converref = FALSE

//Crear ds para la Materia Prima Inicial 
ids_ds_mpInicial	= CREATE uo_dsbase

//Crear ds para la Partes Materia Prima Inicial
ids_partesInicial = CREATE uo_dsbase

//Inicializar indicador de adicion o eliminacion de partes 
ib_parteAdd	= FALSE 
ib_parteDel	= FALSE

end event

event destructor;/***********************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016
Comentario: REPORTE POR MODIFICACI$$HEX1$$d300$$ENDHEX$$N EN FICHAS DE MATERIA PRIM
***********************************************************/
IF IsValid(inv_c_log_reccotizado) THEN 
	Destroy inv_c_log_reccotizado
END IF 

IF IsValid(inv_tr_modfmp) THEN 
	Destroy inv_tr_modfmp
END IF  

end event

