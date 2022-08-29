HA$PBExportHeader$n_cst_reserva_mp_orden.sru
forward
global type n_cst_reserva_mp_orden from nonvisualobject
end type
end forward

global type n_cst_reserva_mp_orden from nonvisualobject
end type
global n_cst_reserva_mp_orden n_cst_reserva_mp_orden

type variables
n_ds_application ids_ordenes, ids_mp_x_reserva_ord, ids_mp_x_reserva, ids_mp_reserva_ord, ids_mp_reserva_agrupa, &
	ids_kx_mp, ids_mp, ids_peso_std_cono, ids_prod_alta_rotacion,&
	ids_kx_otros_alm, ids_mp_x_reserva_fijo

u_dw_application idw_ordenes, idw_mp_adicional

Boolean ib_conectado_db2 = False
n_cst_conexiondb2 itr_Ordenesdb2

n_tr_base itr_sqlserver
Long ii_ordenes[]

Integer ii_Lead_Time_Tejido = 3
Integer ii_indicador_mp_vacio = 0, ii_indicador_mp_reservada = 1, ii_indicador_mp_pedido = 2
String is_co_centro_sap = '1110', is_co_almacen_sap = '0100', is_almacen_recptor = '0104', is_almacen_aux_sap[] = {  '0104',  '0107' }
String is_co_parte_hilo_cerrado, is_actividad
String is_msn_error
Integer ii_max_errores_validacion = 10
Boolean ib_guardar_log = False, ib_mp_adicional = False
Long il_orden_adicional = 999999
Decimal idc_Porc_a_Pedir, idc_Porc_Inv, idc_Porc_Encim_Res
Integer ii_control_tope_reserva
end variables

forward prototypes
public function integer of_validar_mp ()
public function integer of_agrupar_mp_requerida ()
public function integer of_conectar_db2 ()
public function integer of_conectar_sqlserver ()
public function integer of_obtener_fe_entrega ()
public function integer of_cargar_stock_disponible ()
public function integer of_set_dw_ordenes (ref u_dw_application adw_ordenes)
public function integer of_cargar_ordenes_x_reserva ()
public function integer of_setmicrohelp (string as_mensaje)
public function integer of_reservar_mp_sap ()
public function integer of_pedir_mp_sis ()
public function integer of_mostrar_mp_x_reserva (u_dw_application adw_mp_x_reserva)
public function integer of_obtener_ultimo_consecutivo_db2 ()
public function integer of_cargar_constantes ()
public function integer of_cargar_std_conos_sis ()
public function integer of_filtrar_tareas_x_reservar ()
public function integer of_cargar_productos_alta_rotacion ()
public function integer of_set_dw_mp_adicional (ref u_dw_application adw_mp_adicional)
public function integer of_reserva_pide_mp_adicional ()
public function integer of_llena_pedido_mp (long al_co_reserva_sap, long al_ca_programada, string as_usuario, datetime adt_fecha)
public function integer of_validar_mp_adicional (boolean ab_act_ca_reserva)
public function integer of_producto_alta_rotacion (long al_co_producto_mp, long al_co_color_mp)
public function integer of_validar_reserva_fijo (string as_campo, long al_row, string as_dato, u_dw_application adw_mp_x_reserva)
public function integer of_act_reserva_fijo (u_dw_application adw_mp_x_reserva)
end prototypes

public function integer of_validar_mp ();/*
	FACL - 2017/10/18 - SA57405 - Funcion Valida el Inventario
		....
		que Agrupa las necesidades y si hay inventario suficiente 
		se marca con la bandera "CON MP"
*/

Long ll_row, ll_agrupa_orden, ll_filas, ll_nu_orden, ll_co_producto_mp, ll_co_color_mp, ll_rec, ll_pr, ll_fila &
	, ll_ar
Integer li_retorno, li_ret
String ls_find, ls_msn_error_std


If idw_ordenes.AcceptText() <> 1 Then
	Return 0
End If

If This.of_Cargar_Productos_Alta_Rotacion() < 0 Then
	Return -1
End If
	
li_retorno = 0
idw_ordenes.SetFilter( 'agrupa_orden > 0 and estado_reserva IN ( 3,4,5,6 )' )
idw_ordenes.Filter()
idw_ordenes.SetReDraw( False )
is_msn_error = ''

If idw_ordenes.RowCount() > 0 Then
	li_retorno = 1
	This.of_SetMicroHelp('Cargando MP para Ordenes ...')
	Yield()
	// Se toman todas los ordenes
	ii_ordenes = idw_ordenes.Object.nu_orden.Primary
	
	If Not IsValid( ids_mp_x_reserva_ord ) Then
		ids_mp_x_reserva_ord = CREATE n_ds_application
		ids_mp_x_reserva_ord.of_Load('d_gr_mp_x_ordenes_x_reserva')
		ids_mp_x_reserva_ord.of_Conexion( n_cst_application.itr_appl, True )
	Else
		ids_mp_x_reserva_ord.Reset()
		ids_mp_x_reserva_ord.SetFilter('')
		ids_mp_x_reserva_ord.Filter()
	End If
		
	// Se carga la materia prima de las ordenes por reservar
	ll_filas = ids_mp_x_reserva_ord.Retrieve( ii_ordenes )		
	If ll_filas < 0 Then
		idw_ordenes.SetFilter( '' )
		idw_ordenes.Filter()
		idw_ordenes.Sort()
		MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'Ocurrio un error al consultar las fichas de materia prima' )
		Return -1
	End If	
	
	// Se marcan los partes de hilo cerrado con el color negativo para tenerlos en cuenta en la reserva
	ls_find = 'co_partemp in (' + is_co_parte_hilo_cerrado + ')'
	li_ret = ids_mp_x_reserva_ord.SetFilter( ls_find )
	If li_ret < 0 Then
		idw_ordenes.SetFilter( '' )
		idw_ordenes.Filter()
		idw_ordenes.Sort()
		If IsNull( ls_find ) Then ls_find = 'NULL'
		MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'Ocurrio un error el Find de partes de Cerrado!~r~n' + ls_find )
		Return -1
	End If
	ids_mp_x_reserva_ord.Filter()
	
	For ll_pr = 1 To ids_mp_x_reserva_ord.RowCount()
		ids_mp_x_reserva_ord.SetItem( ll_pr, 'co_partemp', -ids_mp_x_reserva_ord.GetItemNumber( ll_pr, 'co_partemp' ) )		
	Next
	
	For ll_ar = 1 To ids_prod_alta_rotacion.RowCount()
		If ids_prod_alta_rotacion.GetItemNumber( ll_ar, 'sw_alta_rotacion' ) = 1 Then
			// Se marcan los partes de hilo cerrado con el color negativo para tenerlos en cuenta en la reserva
			ls_find = 'co_producto_mp = ' + String( ids_prod_alta_rotacion.GetItemNumber( ll_ar, 'co_producto_mp' ) ) &
				+ ' AND co_color_mp = ' + String(  ids_prod_alta_rotacion.GetItemNumber( ll_ar, 'co_color_mp' ) )
			li_ret = ids_mp_x_reserva_ord.SetFilter( ls_find )
			If li_ret < 0 Then
				idw_ordenes.SetFilter( '' )
				idw_ordenes.Filter()
				idw_ordenes.Sort()
				If IsNull( ls_find ) Then ls_find = 'NULL'
				MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'Ocurrio un error el Find de partes de Cerrado!~r~n' + ls_find )
				Return -1
			End If
			ids_mp_x_reserva_ord.Filter()			
			
			For ll_pr = 1 To ids_mp_x_reserva_ord.RowCount()
				ids_mp_x_reserva_ord.SetItem( ll_pr, 'co_producto_mp', -ids_mp_x_reserva_ord.GetItemNumber( ll_pr, 'co_producto_mp' ) )		
				ids_mp_x_reserva_ord.SetItem( ll_pr, 'co_color_mp', -ids_mp_x_reserva_ord.GetItemNumber( ll_pr, 'co_color_mp' ) )		
			Next
		End If
	Next
	
	
	ids_mp_x_reserva_ord.SetFilter('')
	ids_mp_x_reserva_ord.Filter()	
	
	If ib_guardar_log Then ids_mp_x_reserva_ord.saveas( 'c:\mp_x_reserva_ord.xls', excel!, true )
	// Se verifica que cada orden tenga informacion de ficha de materia prima
	For ll_row = 1 To idw_ordenes.RowCount()
		ll_nu_orden = idw_ordenes.GetItemNumber( ll_row, 'nu_orden' )
		ids_mp_x_reserva_ord.SetFilter( 'nu_orden = ' + String(ll_nu_orden) +  ' And co_producto_mp > 0 And co_color_mp > 0 And co_partemp  > 0')
		ids_mp_x_reserva_ord.Filter()
		
		If ids_mp_x_reserva_ord.RowCount() = 0 Then
			idw_ordenes.SetItem( ll_row, 'sw_fmp_x_reserva', -1 )	
			idw_ordenes.SetItem( ll_row, 'estado_mp', 'NO MER' )			
			idw_ordenes.SetItem( ll_row, 'estado_reserva', 4 )			
		End If		
	Next
	
	
	
	If Not IsValid( ids_mp ) Then
		ids_mp = CREATE n_ds_application
		ids_mp.of_Load('d_gr_ext_parm_rfc_stock_disponible')
	Else
		ids_mp.Reset()
	End IF
	
	This.of_SetMicroHelp('Preparando Datos ...')
	
	ids_mp_x_reserva_ord.SetFilter('co_producto_mp > 0 And co_color_mp > 0 And co_partemp  > 0')
	ids_mp_x_reserva_ord.Filter()
	ids_mp_x_reserva_ord.GroupCalc()
	// Se preparan los parametros para invocar la RFC de Stock Disponible
	If ids_mp_x_reserva_ord.RowCount() > 0 Then
		ll_pr = 1
	Else
		ll_pr = 0
	End If
	
	Do While ll_pr > 0 
		ll_co_producto_mp = ids_mp_x_reserva_ord.GetItemNumber( ll_pr, 'co_producto_mp' )
		ll_co_color_mp = ids_mp_x_reserva_ord.GetItemNumber( ll_pr, 'co_color_mp' )
		
		If ll_co_color_mp >= 0 Then		
			ll_rec = ids_mp.InsertRow( 0 )
			ids_mp.SetItem( ll_rec, 'co_material_sap', String(ll_co_producto_mp) )
			ids_mp.SetItem( ll_rec, 'co_matriz', RIGHT( '000000' + String(ll_co_color_mp), 6) )
			ids_mp.SetItem( ll_rec, 'centro_sap', is_co_centro_sap )
			ids_mp.SetItem( ll_rec, 'almacen_sap', is_co_almacen_sap )
		Else
			ll_co_color_mp = -1
		End If
		
		ls_find = 'co_producto_mp <> ' + String( ll_co_producto_mp ) + ' OR co_color_mp <> ' + String( ll_co_color_mp )
		ll_pr = ids_mp_x_reserva_ord.Find( ls_find, ll_pr + 1, ids_mp_x_reserva_ord.RowCount() + 1 )
	Loop
	
	If This.Of_Cargar_STD_Conos_SIS() < 0 Then
		li_retorno = -1
	Else
		If is_msn_error <> '' Then
			ls_msn_error_std = is_msn_error
			is_msn_error = ''
		End If
	End If
	
	If li_retorno > 0 Then
		If This.Of_Cargar_Stock_Disponible() < 0 Then 
			li_retorno = -2
		ElseIf This.Of_Agrupar_MP_Requerida() < 0 Then
			li_retorno = -3
		Else
			li_retorno = 1
		End If
	End If
End If

idw_ordenes.SetFilter( 'agrupa_orden > 0 and estado_reserva >= 3' )
idw_ordenes.Filter()
idw_ordenes.Sort()

If ib_guardar_log Then idw_ordenes.saveas( 'c:\ordenes_validadas.xls', excel!, true )

idw_ordenes.SetReDraw( True )
This.of_SetMicroHelp('')

If ls_msn_error_std <> '' Then
	MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', ls_msn_error_std, Information! )	
End If

Return li_retorno
end function

public function integer of_agrupar_mp_requerida ();/*
	FACL - 2017/10/18 - SA57405 - Funcion que Agrupa las necesidades y si hay inventario suficiente 
		se marca con la bandera "CON MP"
*/

Integer li_estado_reserva, li_nro_errores, li_retorno
Long ll_row, ll_agrupa_orden, ll_pr, ll_prf, ll_rec, ll_rstd, ll_rkx, ll_rkx2, ll_rfj, ll_consc_agrupacion, &
	ll_co_producto_mp, ll_co_color_mp, ll_conos, ll_conos_fijo, ll_nu_orden, ll_nu_orden_agrupada, ll_nu_orden_ant, ll_co_producto_mp_log, ll_co_color_mp_log
Long ll_cs_item, ll_item_res,ll_item_no_res
String ls_ordenes, ls_filtro, ls_find, ls_find_std, ls_find_ords, ls_find_fj, ls_msn, ls_find_kx, ls_estado_mp, ls_msn_error, ls_sin_std
Decimal ldc_std_cono, ldc_kardex_requerido, ldc_kardex_fijo, ldc_inventario_disponible, ldc_ca_reserva_mp, ldc_inventario_c1, ldc_inventario_c2, ldc_ca_gramos_fijo
Boolean lb_puede_reservar, lb_hay_agrupa_valido, lb_problema_maestros
n_ds_application lds_ordenes

This.of_SetMicroHelp( 'Agrupando Necesidades de Materia Prima ...' )

lds_ordenes = Create n_ds_application
lds_ordenes.of_Load( idw_ordenes.DataObject )

If Not IsValid( ids_mp_x_reserva ) Then
	ids_mp_x_reserva = CREATE n_ds_application
	ids_mp_x_reserva.of_Load('d_gr_dt_mu_ord_reserva_agrupada')
	ids_mp_x_reserva.of_Conexion( n_cst_application.itr_appl, True ) 	
Else
	ids_mp_x_reserva.Reset()	
End If
ll_co_producto_mp_log = 110004281
ll_co_color_mp_log = 2019
idw_ordenes.RowsCopy( 1, idw_ordenes.RowCount(), Primary!, lds_ordenes, 1, Primary! )


lb_hay_agrupa_valido = False
lds_ordenes.SetSort( 'agrupa_orden, nu_orden' )
lds_ordenes.Sort()
ll_row = 1
ll_consc_agrupacion = 0
li_nro_errores = 0
Do While lds_ordenes.RowCount() > 0 
	ls_ordenes = ''
	lb_puede_reservar = True
	lb_problema_maestros = False
	ll_consc_agrupacion ++
	ll_item_res = 0
	ll_item_no_res = 0
	ll_agrupa_orden = lds_ordenes.GetItemNumber( 1, 'agrupa_orden' )
	
	lds_ordenes.SetFilter( 'agrupa_orden = ' + String( ll_agrupa_orden ) )
	lds_ordenes.Filter()
	lds_ordenes.Sort()
	For ll_row = 1 To lds_ordenes.RowCount() 
		If ll_row > 1 Then ls_ordenes += ', '
		ls_ordenes += String(lds_ordenes.GetItemNumber( ll_row, 'nu_orden' ) )
		IF lds_ordenes.GetItemNumber( ll_row, 'sw_fmp_x_reserva' ) <> 1 Then
			lb_problema_maestros = True
		End If
	Next	

	// FACL - 2019/10/11 - SA60054 - Se filtran los datos fijos para la agrupacion
	ls_filtro = 'nu_orden_agrupada in ( ' + ls_ordenes + ')'
	ids_mp_x_reserva_fijo.SetFilter( ls_filtro )
	ids_mp_x_reserva_fijo.Filter()
	
	
	// Se filtran las fichas de MP de las ordenes que tiene ingresado el color y es valida la parte para hacer la reserva
	ls_filtro = 'nu_orden in ( ' + ls_ordenes + ') and co_producto_mp >0 And co_color_mp >= 0 And co_partemp > 0'
	ids_mp_x_reserva_ord.SetFilter( ls_filtro )
	ids_mp_x_reserva_ord.Filter()
	ids_mp_x_reserva_ord.Sort()
	ids_mp_x_reserva_ord.GroupCalc()
	
	

	If lb_problema_maestros Or ids_mp_x_reserva_ord.RowCount() = 0 Then
		ll_pr = 0
		lb_puede_reservar = False
	Else
		ll_pr = 1
		ll_nu_orden_agrupada = lds_ordenes.GetItemNumber( 1, 'nu_orden' )
	End If
	
	Do While ll_pr > 0 
		ll_co_producto_mp = ids_mp_x_reserva_ord.GetItemNumber( ll_pr, 'co_producto_mp' )
		ll_co_color_mp = ids_mp_x_reserva_ord.GetItemNumber( ll_pr, 'co_color_mp' )
		ll_conos = ids_mp_x_reserva_ord.GetItemNumber( ll_pr, 'cmp_total_conos_producto' )
		
		If ll_co_producto_mp = ll_co_producto_mp_log And ll_co_color_mp = ll_co_color_mp_log Then
			ll_co_producto_mp = ll_co_producto_mp_log 
		End If
		
		// FACL - 2019/10/11 - SA60054 - Se obtiene los datos fijos para evaluar el inventario
		ls_find_fj = 'co_producto_mp = ' + String(ids_mp_x_reserva_ord.GetItemNumber( ll_pr, 'co_producto_mp' ) ) &
			+ ' and co_color_mp = ' +String( ids_mp_x_reserva_ord.GetItemNumber( ll_pr, 'co_color_mp' ) )
		
		ll_rfj = ids_mp_x_reserva_fijo.Find( ls_find_fj, 1, ids_mp_x_reserva_fijo.RowCount() )
		If ll_rfj > 0 Then
			ll_conos_fijo = 	ids_mp_x_reserva_fijo.GetItemNumber( ll_rfj, 'nu_conos_fijo')
			ldc_ca_gramos_fijo = 	ids_mp_x_reserva_fijo.GetItemDecimal( ll_rfj, 'ca_gramos_fijo')
		Else
			SetNull( ll_conos_fijo )
			SetNull( ldc_ca_gramos_fijo )
		End If	
		
		
		ls_find_std = 'co_centro = "' + is_co_centro_sap + '" And co_material = "' + String( ll_co_producto_mp ) + '"' &
			+ ' AND co_matriz = "' + String( ll_co_color_mp, '000000' ) + '"'
		
		ll_rstd = ids_peso_std_cono.Find( ls_find_std, 1, ids_peso_std_cono.RowCount() )
		
		If ll_rstd > 0 Then
			ldc_std_cono = ids_peso_std_cono.GetItemDecimal( ll_rstd, 'ca_gramosumb' )
			
			If ldc_ca_gramos_fijo >= 0 Then
				ldc_kardex_fijo = ldc_ca_gramos_fijo
			ElseIf ll_conos_fijo > 0 Then
				ldc_kardex_fijo = ll_conos_fijo * ldc_std_cono  * ( idc_Porc_a_Pedir / 100 )
			Else
				SetNull(ldc_kardex_fijo)
			End If
			// FACL - 2018/08/27 - Se agrega constante idc_Porc_a_Pedir
			ldc_kardex_requerido = ll_conos * ldc_std_cono * ( idc_Porc_a_Pedir / 100 )  
		ElseIf ll_rstd = 0 Then
			lb_puede_reservar = False
			If ls_sin_std <> '' Then ls_sin_std += '~r~n'
			ls_sin_std += String(ll_co_producto_mp) + '~t~t' + String(ll_co_color_mp) &
				+ '~t' + String( ll_agrupa_orden ) + '~t~t'
			ll_nu_orden_ant = 0
			
			
			// Se muestran las dos primeras ordenes
			ls_find_ords = 'co_producto_mp = ' + String( ll_co_producto_mp ) + ' AND co_color_mp = ' + String( ll_co_color_mp ) + ' And co_partemp > 0'
			ll_prf = ids_mp_x_reserva_ord.Find( ls_find_ords, 1, ids_mp_x_reserva_ord.RowCount() )
			Do While ll_prf > 0
				ll_nu_orden = ids_mp_x_reserva_ord.GetItemNumber( ll_prf, 'nu_orden' )
				idw_ordenes.SetFilter( 'sw_fmp_x_reserva = 1 And nu_orden = ' + String( ll_nu_orden ) )
				idw_ordenes.Filter()
				ll_row =  idw_ordenes.RowCount() 
				If ll_row > 0 Then
					idw_ordenes.SetItem( ll_row, 'sw_fmp_x_reserva', -1 )

					ls_sin_std += String( ll_nu_orden ) + ' '
					If ll_nu_orden_ant > 0 Then
						Exit
					Else
						ll_nu_orden_ant = ll_nu_orden
					End If
				End If
			
				ll_prf = ids_mp_x_reserva_ord.Find( ls_find_ords, ll_prf + 1, ids_mp_x_reserva_ord.RowCount() + 1 )
			Loop
			
			li_nro_errores ++
			
			If li_nro_errores >= ii_max_errores_validacion Then
				ls_msn = 'No se encontro informacion de Peso Estandar para:~r~n' &
					+ ' Producto~t~tColor~tAgrupacion~tOrden~r~n' &
					+ ls_sin_std
					
				MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', ls_msn )
				
				Destroy lds_ordenes
				Return -1
			Else
				ldc_std_cono = 1 // Para continuar con las validaciones
			End If
			ldc_kardex_requerido = 1
		Else
			If IsNull( ls_find_std ) Then ls_find_std = 'NULL'
			Post MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'Ocurrio un error en el Find de peso std:~r~n' + ls_find_std )
			
			Destroy lds_ordenes
			Return -1
		End If
		
		ls_find_kx = 'co_producto = ' + String( ll_co_producto_mp ) + ' AND co_color = ' + String( ll_co_color_mp )
		
		ll_rkx = ids_kx_mp.Find( ls_find_kx, 1, ids_kx_mp.RowCount() )
		If ll_rkx > 0 Then
			ldc_inventario_disponible = ids_kx_mp.GetItemDecimal( ll_rkx, 'kardex' ) - ids_kx_mp.GetItemDecimal( ll_rkx, 'kardex_reservado' )
		Else
			ldc_inventario_disponible = 0
		End If
		
		// FACL - 2019/10/07 - SA60053 - Se agrega la informacion del almacen 0104
		ll_rkx2 = ids_kx_otros_alm.Find( ls_find_kx + ' and almacen_sap = "0104"', 1, ids_kx_otros_alm.RowCount() )
		If ll_rkx2 > 0 Then
			ldc_inventario_c1 = ids_kx_otros_alm.GetItemDecimal( ll_rkx2, 'kardex' ) - ids_kx_otros_alm.GetItemDecimal( ll_rkx2, 'kardex_reservado' )
		Else
			ldc_inventario_c1 = 0
		End If
		// FACL - 2019/10/07 - SA60053 - Se agrega la informacion del almacen 0107
		ll_rkx2 = ids_kx_otros_alm.Find( ls_find_kx + ' and almacen_sap = "0107"', 1, ids_kx_otros_alm.RowCount() )
		If ll_rkx2 > 0 Then
			ldc_inventario_c2 = ids_kx_otros_alm.GetItemDecimal( ll_rkx2, 'kardex' ) - ids_kx_otros_alm.GetItemDecimal( ll_rkx2, 'kardex_reservado' )
		Else
			ldc_inventario_c2 = 0
		End If
		
		If ldc_ca_gramos_fijo >= 0 Then
			If ldc_ca_gramos_fijo > ldc_inventario_disponible And ldc_inventario_disponible >= 0 And ldc_ca_gramos_fijo > 0 Then
				lb_puede_reservar = False
			Else
				ldc_kardex_requerido = ldc_ca_gramos_fijo
			End If
		// Si no hay suficiente inventario
		ElseIf ldc_kardex_requerido > ldc_inventario_disponible Then
			// Si hay menos de la mitad del estandar de conos no se puede reservar
			//If ll_conos*ldc_std_cono/2 > ldc_inventario_disponible Then
			// FACL - 2018/08/27 - Se modifica por constante de % de Inventario Disponible
			If ll_conos*ldc_std_cono*(idc_Porc_Inv/100) > ldc_inventario_disponible Then
				lb_puede_reservar = False
			End If
			// Si tiene un solo cono o la diferencia es superior al cono estandar no se puede reservar
//			If ( ll_conos = 1 Or ldc_kardex_requerido - ldc_std_cono > ldc_inventario_disponible) Then
//				lb_puede_reservar = False
//			End If
		End If
		
		
		///  co_reserva_sap  nu_orden_agrupada  co_producto_mp  co_color_mp  nu_conos  peso_mp_estandar  }
		// ca_gramos_necesidad  ca_gramos_reserva  inventario_disponible  co_centro_sap  co_almacen_sap  co_almacen_receptor 
		ll_rec = ids_mp_x_reserva.InsertRow( 0 )
		
		// FACL - 2019/10/15 - SA60054 - Se maneja diferente cs_item para productos que no se van a reservar
		ll_cs_item ++
		If ldc_ca_gramos_fijo = 0 Then
			ll_item_no_res ++
			ll_cs_item = 1000 + ll_item_no_res
		Else
			ll_item_res ++
			ll_cs_item = ll_item_res
		End If
		
		ids_mp_x_reserva.SetItem( ll_rec, 'co_reserva_sap'		,  ll_agrupa_orden  )
		ids_mp_x_reserva.SetItem( ll_rec, 'cs_item', ll_cs_item )
		// Se llena los datos del centro-almacen para realizar la reserva
		ids_mp_x_reserva.SetItem( ll_rec, 'co_centro_sap', is_co_centro_sap )
		ids_mp_x_reserva.SetItem( ll_rec, 'co_almacen_sap', is_co_almacen_sap )
		ids_mp_x_reserva.SetItem( ll_rec, 'co_almacen_receptor', is_almacen_recptor )

		ids_mp_x_reserva.SetItem( ll_rec, 'nu_orden_agrupada'	, ll_nu_orden_agrupada )
		ids_mp_x_reserva.SetItem( ll_rec, 'co_producto_mp'		, ll_co_producto_mp )
		ids_mp_x_reserva.SetItem( ll_rec, 'de_producto'		, Trim( ids_mp_x_reserva_ord.GetItemString( ll_pr, 'de_producto' ) ) )
		ids_mp_x_reserva.SetItem( ll_rec, 'co_color_mp'			, ll_co_color_mp )
		ids_mp_x_reserva.SetItem( ll_rec, 'de_color_mp'		, Trim( ids_mp_x_reserva_ord.GetItemString( ll_pr, 'de_color_mp' ) ) )
		ids_mp_x_reserva.SetItem( ll_rec, 'nu_conos'				, ll_conos  )
		ids_mp_x_reserva.SetItem( ll_rec, 'nu_conos_fijo'				, ll_conos_fijo  )
		ids_mp_x_reserva.SetItem( ll_rec, 'peso_mp_estandar'	, ldc_std_cono  )
		ids_mp_x_reserva.SetItem( ll_rec, 'ca_gramos_necesidad', ldc_kardex_requerido  )
		ids_mp_x_reserva.SetItem( ll_rec, 'ca_gramos_fijo'	, ldc_ca_gramos_fijo  )
		ids_mp_x_reserva.SetItem( ll_rec, 'ca_gramos_reserva'	, 0  )
		
		ids_mp_x_reserva.SetItem( ll_rec, 'inventario_disponible', ldc_inventario_disponible )
		// FACL - 2019/10/07 - SA60053 - se agrega almace 0104 y 0107
		ids_mp_x_reserva.SetItem( ll_rec, 'inventario_0104', ldc_inventario_c1 )
		ids_mp_x_reserva.SetItem( ll_rec, 'inventario_0107', ldc_inventario_c2 )
		
		ls_find = 'co_producto_mp <> ' + String( ll_co_producto_mp ) + ' OR co_color_mp <> ' + String( ll_co_color_mp )
		ll_pr = ids_mp_x_reserva_ord.Find( ls_find, ll_pr + 1, ids_mp_x_reserva_ord.RowCount() + 1 )
	Loop
	
	
	// Si puede reservar se descuenta del inventario disponible y se marca como reservado
	If lb_puede_reservar Then		
		For ll_rec = 1 To ids_mp_x_reserva.RowCount()
			ldc_ca_reserva_mp = ids_mp_x_reserva.GetItemDecimal( ll_rec, 'ca_gramos_necesidad' )
			ldc_ca_gramos_fijo = ids_mp_x_reserva.GetItemDecimal( ll_rec, 'ca_gramos_fijo' )
			If ldc_ca_gramos_fijo >= 0 Then ldc_ca_reserva_mp = ldc_ca_gramos_fijo
			
			If ll_co_producto_mp_log = ids_mp_x_reserva.GetItemNumber( ll_rec, 'co_producto_mp' ) And ll_co_color_mp_log = ids_mp_x_reserva.GetItemNumber( ll_rec, 'co_color_mp' ) Then
				ll_co_producto_mp_log = ll_co_producto_mp_log 
			End If
			
			ls_find_kx = 'co_producto = ' + String( ids_mp_x_reserva.GetItemNumber( ll_rec, 'co_producto_mp' )) &
				+ ' AND co_color = ' + String( ids_mp_x_reserva.GetItemNumber( ll_rec, 'co_color_mp' ) )
			
			ll_rkx = ids_kx_mp.Find( ls_find_kx, 1, ids_kx_mp.RowCount() )
			If ll_rkx > 0 Then
				ldc_inventario_disponible = ids_kx_mp.GetItemDecimal( ll_rkx, 'kardex' ) - ids_kx_mp.GetItemDecimal( ll_rkx, 'kardex_reservado' )
			Else
				ldc_inventario_disponible = 0
			End If
			
			If ldc_ca_reserva_mp > ldc_inventario_disponible And ldc_inventario_disponible >=0 Then
				ldc_ca_reserva_mp = ldc_inventario_disponible
			End If		
			
			ids_mp_x_reserva.SetItem( ll_rec, 'ca_gramos_reserva', ldc_ca_reserva_mp  )
			// Se actualiza la reserva
			ids_kx_mp.SetItem( ll_rkx, 'kardex_reservado', ids_kx_mp.GetItemDecimal( ll_rkx, 'kardex_reservado' ) + ldc_ca_reserva_mp )
		Next
		
		li_estado_reserva = 5
		ls_estado_mp = 'CON MP'
	Else
		li_estado_reserva = 4
		If ids_mp_x_reserva_ord.RowCount() = 0 Then
			ls_estado_mp = 'NO MER'
		Else
			ls_estado_mp = 'SIN MP'
		End If
	End If
	// Se actualiza el estado en el dw de la ventana
	idw_ordenes.SetFilter( 'agrupa_orden = ' + String( ll_agrupa_orden ) )
	idw_ordenes.Filter()
	For ll_row = 1 To idw_ordenes.RowCount()
		If Not lb_problema_maestros Then
			idw_ordenes.SetItem( ll_row, 'estado_mp', ls_estado_mp )
		End If
		idw_ordenes.SetItem( ll_row, 'estado_reserva', li_estado_reserva )
		If li_estado_reserva = 5 Then
			idw_ordenes.SetItem( ll_row, 'sw_reserva', 1 )
			lb_hay_agrupa_valido = True
		End IF
		If ids_mp_x_reserva_ord.RowCount() = 0 Then
			idw_ordenes.SetItem( ll_row, 'sw_fmp_x_reserva', -2 )
		End If
	Next
	// Se mueven todos los registros procesados al buffer de filtrado
	ids_mp_x_reserva.SetFilter( '1=0' )
	ids_mp_x_reserva.Filter()
	
	// Se Descartan los datos y se continua con el siguiente
	lds_ordenes.RowsDiscard( 1, lds_ordenes.RowCount(), Primary! )
	lds_ordenes.SetFilter( '' )
	lds_ordenes.Filter()
	lds_ordenes.Sort()
Loop


ids_mp_x_reserva.SetFilter( '' )
ids_mp_x_reserva.Filter()

If ib_guardar_log Then ids_mp_x_reserva.SaveAs( 'c:\mp_x_reserva_agrupado.xls', excel5!, true )
If ib_guardar_log And IsValid(ids_kx_mp) Then ids_kx_mp.SaveAs( 'c:\kx_mp_reservado.xls', excel5!, true )


Destroy lds_ordenes
If li_nro_errores = 0 Then
	li_retorno = 1
Else
	ls_msn = 'No se encontro informacion de Peso Estandar para:~r~n' &
		+ ' Producto~t~tColor~tAgrupacion~tOrden~r~n' &
		+ ls_sin_std
		
	Post MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', ls_msn )
	If Not lb_hay_agrupa_valido Then
		li_retorno = -1
	Else
		li_retorno = 1
	End If
End If

Return li_retorno
end function

public function integer of_conectar_db2 ();If ib_conectado_db2 Then Return 1

Try
	itr_Ordenesdb2 = Create n_cst_conexiondb2
	itr_Ordenesdb2.of_CargarTransaccionalDB2( )
	ib_conectado_db2 = True
Catch(Exception ex1)
	Throw ex1 // recodificar
	Return -1
End Try

Return 1
end function

public function integer of_conectar_sqlserver ();/*
	FACL - 2017/10/17 - SA57405 - Se realiza la conexion a un servidor SQLServer con los datos de conexion del .ini
*/

String ls_user, ls_pwd, ls_servidor, ls_bd, ls_path

If Not IsValid( itr_sqlserver ) Then

	ls_path 		= n_cst_application.is_pathfileconf

	// Se leen los datos de conexion del .ini
	ls_servidor	= n_cst_application.Of_GetProFile( ls_path,"bd sqlserver","SERVIDORSQL")
	ls_user		= n_cst_application.Of_GetProFile( ls_path,"bd sqlserver","USERSQL")
	ls_pwd		= n_cst_application.Of_GetProFile( ls_path,"bd sqlserver","PASSSQL")
	ls_bd			= n_cst_application.Of_GetProFile( ls_path,"bd sqlserver","BDSQL")
	
	itr_sqlserver = Create Transaction	
	// Se realiza la conexion a la Base de Datos en SQLServer quitando el Prompt para evitar espera por ser un proceso automatico
	itr_sqlserver.DBMS = "ODBC"
	itr_sqlserver.Lock = "RC"
	itr_sqlserver.AutoCommit = False
	itr_sqlserver.DBParm = "ConnectString='Driver={SQL Server};Server="+ls_servidor+";UID="+ls_user+";PWD="+ls_pwd &
			+";Database="+ls_bd+"',CommitOnDisconnect='No',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"
			
	Connect Using itr_sqlserver;
	If itr_sqlserver.SQLCode = -1 Then
		MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'Ocurrio un error al conectarse a SQLServe~r~n' + itr_sqlserver.SQLErrText )
		Destroy itr_sqlserver
		Return -1
	End IF	
End If


Return 1
end function

public function integer of_obtener_fe_entrega ();/*
	FACL - 2017/10/17 - SA57405 - Funcion para Obtener la fecha de tejido de las Muestras
*/

Long ll_filas, ll_filas2, ll_row, ll_fec, ll_ordenes[], ll_nro_registros
Decimal ldc_tiempo_ult_act
String ls_find, ls_msn
Date ld_entrega_cliente, ld_entrega_tejido
DateTime ldt_ult_act

n_ds_application lds_fe_tejido, lds_valida_sql

This.of_SetMicroHelp('Cargando Fecha Tejido ...')
If ids_ordenes.RowCount() = 0 Then Return 0

This.of_SetMicroHelp('Cargando Fecha Tejido Conectando SQL...')
// Se conecta a SQLServer
If This.Of_Conectar_SQLServer() < 0 Then Return -1

This.of_SetMicroHelp('Cargando Fecha Tejido, Consultando Conectando SQL...')
// Se toman todas los ordenes
ll_ordenes = ids_ordenes.Object.nu_orden.Primary

lds_fe_tejido = CREATE n_ds_application
lds_fe_tejido.of_Load('d_gr_orden_sqlserver_fe_tejido')
//lds_fe_tejido.of_Conexion( itr_sqlserver, True ) 
lds_fe_tejido.SetTransObject( itr_sqlserver ) 

ll_filas = lds_fe_tejido.Retrieve( ll_ordenes )

If ll_filas < 0 Then
	MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'Ocurrio un error al consultar la fecha de tejido en SQLServer~r~n' + itr_sqlserver.SQLErrText )
ElseIf ll_filas = 0 Then
	lds_valida_sql = CREATE n_ds_application
	lds_valida_sql.of_Load('d_gr_sqlserver_valida_fe_orden')
	lds_valida_sql.SetTransObject( itr_sqlserver ) 
	//  nro_registros  min_fe_actualizacion  max_fe_actualizacion  tiempo_ult_act 
	ll_filas2 = lds_valida_sql.Retrieve()
	If ll_filas2 = 1 Then
		ldc_tiempo_ult_act = lds_valida_sql.GetItemDecimal( 1, 'tiempo_ult_act' )
		ll_nro_registros 	= lds_valida_sql.GetItemNumber( 1, 'nro_registros' )
		ldt_ult_act 		= lds_valida_sql.GetItemDateTime( 1, 'max_fe_actualizacion' )
		
		If ldc_tiempo_ult_act > 8/24 Then  
			ls_msn = 'Lleva mas de un 8 horas sin actualizar la fecha de las ordenes.~r~nUltima Actualizacion: ' + String( ldt_ult_act )			
		ElseIf ll_nro_registros = 0 Then
			ls_msn = 'El proceso de fechas se esta ejecutando por favor intente en 5 minutos'
		ElseIf ldc_tiempo_ult_act < 0.002 Then
			ls_msn = 'El proceso de fechas se esta ejecutando por favor intente en 2 minutos'
		Else
			ls_msn = ''
		End If
		If ls_msn <> '' Then
			MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', ls_msn )
			Destroy lds_valida_sql
			Destroy lds_fe_tejido
			Return 0
		End If
	End If
	Destroy lds_valida_sql
Else
	This.of_SetMicroHelp('Cargando Fecha Tejido, Asignando Fecha ...')
	For ll_row = 1 To ids_ordenes.RowCount()
		ls_find = 'nu_orden = "' + String( ids_ordenes.GetItemNumber( ll_row, 'nu_orden' ) ) + '"'
		ll_fec = lds_fe_tejido.Find( ls_find, 1, lds_fe_tejido.RowCount() )
		If ll_fec > 0 Then
			ld_entrega_cliente = Date( lds_fe_tejido.GetItemDateTime( ll_fec, 'fecha_entrega' ) )
			// Se obtiene la fecha de entrega de tejido
			ld_entrega_tejido = RelativeDate( ld_entrega_cliente, - ii_Lead_Time_Tejido )
			
			ids_ordenes.SetItem( ll_row, 'fe_entrega_cliente', ld_entrega_cliente )
			ids_ordenes.SetItem( ll_row, 'fe_entrega_tejido', ld_entrega_tejido )
		Else
			
		End If
	Next	
End If

Destroy lds_fe_tejido

Return 1
end function

public function integer of_cargar_stock_disponible ();/*
	FACL - 2017/10/13 - SA57405 - Se carga el stock disponible
*/

Integer li_retorno
Long ll_pr, ll_parm, ll_co_producto_mp, ll_co_color_mp, ll_rec, ll_ka
String ls_find, ls_almacen_aux

This.of_SetMicroHelp('Cargando Stock Disponible..')
n_cst_rfc_reserva_sap lnvo_rfc_reserva

If Not ib_mp_adicional Then
	If Not IsValid(ids_mp_x_reserva_ord) Then Return 0
	If ids_mp_x_reserva_ord.RowCount() = 0 Then Return 0
End If

If Not IsValid( ids_kx_mp ) Then
	ids_kx_mp = CREATE n_ds_application
	ids_kx_mp.of_Load('d_gr_ext_parm_rfc_stock_disponible')
	ids_kx_mp.of_Conexion( n_cst_application.itr_appl, True ) 
Else
	ids_kx_mp.Reset()
	
End If

Long ll_alm
String ls_almacen
n_ds_application lds_kx_otros_alm, lds_mp


If Not IsValid( ids_kx_otros_alm ) Then
	ids_kx_otros_alm = CREATE n_ds_application
	ids_kx_otros_alm.of_Load( ids_kx_mp.DataObject )
Else
	ids_kx_otros_alm.Reset()	
End If


lds_kx_otros_alm = CREATE n_ds_application
lds_kx_otros_alm.of_Load( ids_kx_mp.DataObject )

w_application.SetMicroHelp('Cargando Stock Disponible - Ejecutando RFC ...')
Yield()
lnvo_rfc_reserva = Create n_cst_rfc_reserva_sap
li_retorno = lnvo_rfc_reserva.of_Ejecutar_RFC_Stock_Disponible( ids_mp, ids_kx_mp )
// FACL - 2019/10/07 - SA60053 - Si no es la opcion de Reserva Adicional se obtiene el inventario de los otros almacenes
If li_retorno >= 0 And Not ib_mp_adicional Then
	lds_mp = Create n_ds_application
	lds_mp.DataObject = ids_mp.DataObject
	
	ids_mp.RowsCopy( 1, ids_mp.RowCount(), Primary!, lds_mp, 1, Primary! )
	
	For ll_alm = 1 To UpperBound( is_almacen_aux_sap ) 
		ls_almacen =  is_almacen_aux_sap[ ll_alm ]
		w_application.SetMicroHelp('Cargando Stock Disponible - Ejecutando RFC ... Almacen ' + ls_almacen )
		Yield()
		
		For ll_rec = 1 To lds_mp.RowCount()
			lds_mp.SetItem( ll_rec, 'almacen_sap',  ls_almacen )
		Next
		
		li_retorno = lnvo_rfc_reserva.of_Ejecutar_RFC_Stock_Disponible( lds_mp, lds_kx_otros_alm )
		
		If li_retorno < 0 Then Exit		
		For ll_ka = 1 To lds_kx_otros_alm.RowCount()
			lds_kx_otros_alm.SetItem( ll_ka, 'almacen', ls_almacen )
		Next		
		lds_kx_otros_alm.RowsCopy( 1, lds_kx_otros_alm.RowCount(), Primary!, ids_kx_otros_alm, 1, Primary! )
		lds_kx_otros_alm.Reset()
	Next	
End If

Destroy lds_kx_otros_alm
Destroy n_cst_rfc_reserva_sap


If ib_guardar_log Then ids_mp.SaveAs( 'c:\ids_mp.xls', excel5!, true )
If ib_guardar_log Then ids_kx_mp.saveas( 'c:\ids_kx_mp.xls', excel5!, true )


Return li_retorno
end function

public function integer of_set_dw_ordenes (ref u_dw_application adw_ordenes);idw_ordenes = adw_ordenes
Return 1
end function

public function integer of_cargar_ordenes_x_reserva ();/*
	FACL - 2017/10/18 - SA57405 - Funcion para cargar las ordenes pendientes 
		por Reserva de Materia Prima
*/


Long ll_row, ll_filas, ll_co_reserva_sap[], ll_pos

If Not IsValid( ids_ordenes ) Then
	ids_ordenes = CREATE n_ds_application
	ids_ordenes.of_Load( idw_ordenes.DataObject )
	ids_ordenes.of_Conexion( n_cst_application.itr_appl, True )
Else
	ids_ordenes.ib_mostrar_dberror = True
End If

This.of_SetMicroHelp('Cargando Constantes ...')
If This.of_Cargar_Constantes() <> 1 Then
	Return -1
End If
	
	
	
idw_ordenes.Reset()
idw_ordenes.SetFilter( '' )
idw_ordenes.Filter()
This.of_SetMicroHelp('Cargando Ordenes ...')
// Se carga las ordenes pendientes por reservar
ll_filas = ids_ordenes.Retrieve()

If ll_filas > 0 Then
	// Se descartan las ordenes que no estan programadas
	If This.Of_Filtrar_Tareas_x_Reservar() < 0 Then
		
	End If
	// Se actualiza la fecha de entregan
	This.Of_Obtener_Fe_Entrega()
	This.of_SetMicroHelp('Ordenes Cargadas, Asignando Estados...')
	// se marca las ordenes que tiene ficha de materia prima
	ids_ordenes.SetFilter( 'estado_fmp = 1' )
	ids_ordenes.Filter()
	For ll_row = 1 To ids_ordenes.RowCount()
		ids_ordenes.SetItem( ll_row, 'estado_reserva', 1 )	
	Next
	
	// se marca las ordenes que tiene fecha de entrega de tejido
	ids_ordenes.SetFilter( '(Not IsNull(fe_entrega_tejido)) And estado_reserva = 1' )
	ids_ordenes.Filter()
	For ll_row = 1 To ids_ordenes.RowCount()
		ids_ordenes.SetItem( ll_row, 'estado_reserva', 2 )	
	Next
	
	// FACL - 2018/02/21 - SA57405 - Se desactiva control de fecha de entrega cargada	
	// Si se esta ejecutando desde desarrollo
	If Handle( GetApplication() ) = 0 Or 1=1 Then
		ids_ordenes.SetFilter( 'IsNull(fe_entrega_tejido) And estado_reserva = 1' )
		ids_ordenes.Filter()
		For ll_row = 1 To ids_ordenes.RowCount()
			ids_ordenes.SetItem( ll_row, 'estado_reserva', 2 )	
		Next
	End If
	
	ll_pos = 0
	// FACL - 2018/02/07 - SA57405 - Se cambia el campo condicion por nuevo campo indicador_mp
	// se dejan las ordenes listas para realizar el pedido de MP	
	ids_ordenes.SetFilter( 'indicador_mp = 1' )
	ids_ordenes.Filter()
	For ll_row = 1 To ids_ordenes.RowCount()
		ids_ordenes.SetItem( ll_row, 'estado_reserva', 8 )
		ids_ordenes.SetItem( ll_row, 'sw_reserva', 1 )
		ids_ordenes.SetItem( ll_row, 'estado_mp', 'RESERV' )
		ll_pos ++
		ll_co_reserva_sap[ ll_pos ] = ids_ordenes.GetItemNumber( ll_row, 'co_reserva_sap' )
	Next
	If ll_pos > 0 Then
		This.of_SetMicroHelp('Cargando Info de Ordenes Reservadas ...')
		ids_mp_reserva_agrupa.Retrieve( ll_co_reserva_sap )
	End If
	
	// Se limpian las banderas
	ids_ordenes.ResetUpdate()
	
	// Se quita el filtro
	ids_ordenes.SetFilter( '' )
	ids_ordenes.Filter()
	ids_ordenes.Sort()
	// Se copian los datos al dw de la ventana
	ids_ordenes.RowsCopy( 1, ll_filas, Primary!, idw_ordenes, 1, Primary! )
	This.of_SetMicroHelp('Ordenes Cargadas!')
	
	ids_ordenes.ib_mostrar_dberror = False

End If



Return 1
end function

public function integer of_setmicrohelp (string as_mensaje);
w_application.SetMicroHelp( as_mensaje )
Yield()

Return 1
end function

public function integer of_reservar_mp_sap ();/*
	FACL - 2017/10/20 - SA57405 - Funcion que Agrupa las necesidades y si hay inventario suficiente 
		se marca con la bandera "CON MP"
*/
Integer li_retorno, li_estado_reserva, li_condicion
Long ll_row, ll_agrupa_orden, ll_co_reserva_sap, ll_rec, ll_pr, ll_po
String ls_ordenes, ls_filtro, ls_msn_error, ls_msn_err_agrupa, ls_find

DateTime ldt_fecha
String ls_usuario, ls_instancia

n_cst_rfc_reserva_sap lnvo_rfc_reserva

n_ds_application lds_ordenes, lds_ret_reserva


If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If

idw_ordenes.SetFilter( 'sw_reserva = 1 and estado_reserva in (5,6)' )
idw_ordenes.Filter()
//  co_reserva_sap  nu_orden_agrupada  co_producto_mp  co_color_mp  nu_conos  peso_mp_estandar  ca_gramos_necesidad  ca_gramos_reserva  inventario_disponible  co_centro_sap  co_almacen_sap  co_almacen_receptor 
If idw_ordenes.RowCount() > 0 Then
	This.Of_SetMicroHelp('Reservando MP - Ejecutando RFC ...')

	lds_ret_reserva = CREATE n_ds_application
	lds_ret_reserva.of_Load('d_gr_ext_ret_rfc_reserva_mp') 

	lds_ordenes = Create n_ds_application
	lds_ordenes.of_Load( idw_ordenes.DataObject )
	
	If Not IsValid( ids_mp_reserva_agrupa ) Then
		ids_mp_reserva_agrupa = CREATE n_ds_application
		ids_mp_reserva_agrupa.of_Load( ids_mp_x_reserva.DataObject )
		ids_mp_reserva_agrupa.of_Conexion( n_cst_application.itr_appl, True )		
	End If
		
	// Se realiza una copia para hacer la reserva de cada agrupacion	
	idw_ordenes.RowsCopy( 1, idw_ordenes.RowCount(), Primary!, lds_ordenes, 1, Primary! )
	
	lds_ordenes.SetSort( 'agrupa_orden' )
	lds_ordenes.Sort()
	ll_row = 1
	Do While lds_ordenes.RowCount() > 0 
		
		ls_msn_error = ''
		ls_ordenes = ''
		lds_ret_reserva.Reset()
		ll_agrupa_orden = lds_ordenes.GetItemNumber( 1, 'agrupa_orden' )
		
		lds_ordenes.SetFilter( 'agrupa_orden = ' + String( ll_agrupa_orden ) )
		lds_ordenes.Filter()
		
		For ll_row = 1 To lds_ordenes.RowCount() 
			If ll_row > 1 Then ls_ordenes += ', '
			ls_ordenes += String(lds_ordenes.GetItemNumber( ll_row, 'nu_orden' ) )
		Next	

		// FACL - 2019/11/20 - SA60456 - En el ds de Ordenes se fltran las de la agrupacion
		ids_ordenes.SetFilter( 'nu_orden in (' + ls_ordenes + ')' )
		ids_ordenes.Filter()		
		
		ls_filtro = 'nu_orden_agrupada in ( ' + ls_ordenes + ')'
		ids_mp_x_reserva.SetFilter( ls_filtro )
		ids_mp_x_reserva.Filter()
		ids_mp_x_reserva.Sort()
		ids_mp_x_reserva.GroupCalc()
		
		
		ids_mp_reserva_agrupa.SetFilter( '1=0' )
		ids_mp_reserva_agrupa.Filter()
		// Se copian lo registros para guardarlos
		ids_mp_x_reserva.RowsCopy( 1, ids_mp_x_reserva.RowCount(), Primary!, ids_mp_reserva_agrupa, 1, Primary! )
		
		
		ls_filtro = 'nu_orden in ( ' + ls_ordenes + ') and co_producto_mp >0 And co_color_mp >= 0 And co_partemp > 0'
		ids_mp_x_reserva_ord.SetFilter( ls_filtro )
		ids_mp_x_reserva_ord.Filter()
		ids_mp_x_reserva_ord.Sort()
		ids_mp_x_reserva_ord.GroupCalc()
		
		For ll_pr = 1 To ids_mp_x_reserva_ord.RowCount()
			ll_po = ids_mp_reserva_ord.InsertRow( 0 )
			ids_mp_reserva_ord.SetItem( ll_po, 'nu_orden', ids_mp_x_reserva_ord.GetItemNumber( ll_pr, 'nu_orden' ) )
			ids_mp_reserva_ord.SetItem( ll_po, 'co_talla', ids_mp_x_reserva_ord.GetItemNumber( ll_pr, 'co_talla' ) )
			ids_mp_reserva_ord.SetItem( ll_po, 'co_color', ids_mp_x_reserva_ord.GetItemNumber( ll_pr, 'co_color' ) )
			ids_mp_reserva_ord.SetItem( ll_po, 'co_producto_mp', ids_mp_x_reserva_ord.GetItemNumber( ll_pr, 'co_producto_mp' ) )
			ids_mp_reserva_ord.SetItem( ll_po, 'co_color_mp', ids_mp_x_reserva_ord.GetItemNumber( ll_pr, 'co_color_mp' ) )
			ids_mp_reserva_ord.SetItem( ll_po, 'co_partemp', ids_mp_x_reserva_ord.GetItemNumber( ll_pr, 'co_partemp' ) )
			ids_mp_reserva_ord.SetItem( ll_po, 'nu_mp', ids_mp_x_reserva_ord.GetItemNumber( ll_pr, 'nu_mp' ) )
			ids_mp_reserva_ord.SetItem( ll_po, 'cs_item', ll_pr )
			ids_mp_reserva_ord.SetItem( ll_po, 'co_reserva_sap', 0 )
			ids_mp_reserva_ord.SetItem( ll_po, 'nu_conos', ids_mp_x_reserva_ord.GetItemNumber( ll_pr, 'nu_conos' ) )
			ids_mp_reserva_ord.SetItem( ll_po, 'co_recurso', ids_mp_x_reserva_ord.GetItemNumber( ll_pr, 'co_recurso' ) )
			ids_mp_reserva_ord.SetItem( ll_po, 'origen_fmp', Trim( ids_mp_x_reserva_ord.GetItemString( ll_pr, 'origen_fmp' ) ) )
		Next
		// d_gr_dt_mu_orde_reserva nu_orden  co_talla  co_color  co_producto_mp  co_color_mp  co_partemp  co_reserva_sap  
		// nu_conos  peso_mp_estandar  ca_gramos_necesidad  ca_gramos_reserva  co_recurso  origen_fmp  fe_creacion  fe_actualizacion  instancia  usuario 
	
		ls_msn_err_agrupa = 'Fallo la reserva de la agrupacion ' + String( ll_agrupa_orden )
		
		// FACL - 2019/11/20 - SA60456 - Se actualiza los campos de auditoria, para asegurar que otra persona no esta reservando la misma Orden
		For ll_row = 1 To ids_ordenes.RowCount() 
			ids_ordenes.SetItem( ll_row, 'fe_actualizacion', ldt_fecha )
		Next
		
		If ids_ordenes.Update( True, False ) < 1 Then
			ls_msn_error = ls_msn_err_agrupa + ', Fallo actualizando las Ordenes x Reserva, No genero reserva sap!:~r~n' + n_cst_application.itr_appl.SQLErrText
			ROLLBACK USING n_cst_application.itr_appl;
			li_retorno = -1
			// Se vuelve a dejar el dato que tenia y se limpia la bandera
			For ll_row = 1 To ids_ordenes.RowCount() 
				ids_ordenes.SetItem( ll_row, 'fe_actualizacion', ids_ordenes.GetItemDateTime(ll_row, 'fe_actualizacion', Primary!, True  ) )
				ids_ordenes.SetItemStatus( ll_row, 'fe_actualizacion', Primary!, NotModified! ) 
			Next
			Post MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', ls_msn_error )
			lds_ordenes.Reset() // Se limpia para terminar el ciclo
			Exit
		End If
		
		// FACL - 2018/02/07 - SA57405 - Se ordena para asegurar que la resarva y el registro en SIS tiene las mismas posiciones
		ids_mp_reserva_agrupa.SetSort( 'cs_item, co_producto_mp, co_color_mp' )
		ids_mp_reserva_agrupa.Sort()
		
		lnvo_rfc_reserva = Create n_cst_rfc_reserva_sap
		li_retorno = lnvo_rfc_reserva.of_Ejecutar_RFC_Reserva_MP( ids_mp_reserva_agrupa, lds_ret_reserva )
		Destroy n_cst_rfc_reserva_sap
		
		If ib_guardar_log Then ids_mp_reserva_agrupa.saveas( 'c:\reserva_agrupa_' + String(ll_agrupa_orden) +'.xls', excel!, true )
		If ib_guardar_log Then lds_ret_reserva.saveas( 'c:\ret_reserva_agrupa_' + String(ll_agrupa_orden) +'.xls', excel!, true )
		If li_retorno < 0 Then
			ls_msn_error = ls_msn_err_agrupa + ' Fallo la RFC de reserva!'
		Else
			If lds_ret_reserva.RowCount() = 0 Then
				ll_co_reserva_sap = 0
				ls_msn_error = ls_msn_err_agrupa + ', No genero reserva sap'
			Else
				ll_co_reserva_sap = lds_ret_reserva.GetItemNumber( 1, 'co_reserva_sap' )
				If Trim( lds_ret_reserva.GetItemString( 1, 'msn_error' ) ) <> '' Then
					ls_msn_error = ls_msn_err_agrupa + ', Fallo la RFC de reserva:~r~n' &
						+Trim( lds_ret_reserva.GetItemString( 1, 'msn_error' ) )
				End If
			End If
		End If
			
		If ls_msn_error = '' And ll_co_reserva_sap > 0 Then
			li_estado_reserva = 7
			// Se actualiza el estado para actualizar la BD
			ids_ordenes.SetFilter( 'nu_orden in (' + ls_ordenes + ')' )
			ids_ordenes.Filter()
			
			For ll_row = 1 To ids_ordenes.RowCount() 
				ids_ordenes.SetItem( ll_row, 'co_reserva_sap', ll_co_reserva_sap )
				ids_ordenes.SetItem( ll_row, 'estado_reserva', li_estado_reserva )
				// FACL - 2018/02/07 - SA57405 - Se cambia el campo condicion por nuevo campo indicador_mp
				ids_ordenes.SetItem( ll_row, 'indicador_mp', ii_indicador_mp_reservada )
			Next
			ids_ordenes.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)	
			// Se actualiza el numero de reserva al resumen de Materia Prima
			For ll_rec = 1 To ids_mp_reserva_agrupa.RowCount()
				ids_mp_reserva_agrupa.SetItem( ll_rec, 'co_reserva_sap', ll_co_reserva_sap )
			Next
			ids_mp_reserva_agrupa.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)	
			
			// Se actualiza el numero de reserva al detalle de Materia Prima por Orden
			For ll_po = 1 To ids_mp_reserva_ord.RowCount()
				ids_mp_reserva_ord.SetItem( ll_po, 'co_reserva_sap', ll_co_reserva_sap )
			Next
			ids_mp_reserva_ord.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)	

			If ids_ordenes.Update( True, False ) < 1 Then
				ls_msn_error = ls_msn_err_agrupa + ', Fallo actualizando la Orden:~r~n' + ids_ordenes.is_SQLErrText
				ROLLBACK USING n_cst_application.itr_appl;
			ElseIf ids_mp_reserva_agrupa.Update( True, False ) < 1 Then
				ls_msn_error = ls_msn_err_agrupa + ', Fallo creando Agrupa MP:~r~n' + ids_mp_reserva_agrupa.is_SQLErrText
				ROLLBACK USING n_cst_application.itr_appl;
			ElseIf ids_mp_reserva_ord.Update( True, False ) < 1 Then
				ls_msn_error = ls_msn_err_agrupa + ', Fallo creando Detalle MP:~r~n' + ids_mp_reserva_agrupa.is_SQLErrText
				ROLLBACK USING n_cst_application.itr_appl;
			Else
				COMMIT USING n_cst_application.itr_appl;
				ids_mp_reserva_agrupa.ResetUpdate()
				ids_ordenes.ResetUpdate()
				ids_mp_reserva_ord.ResetUpdate()
				
				
				// Se actualiza el estado en el dw de la ventana
				idw_ordenes.SetFilter( 'agrupa_orden = ' + String( ll_agrupa_orden ) )
				idw_ordenes.Filter()
				
				For ll_row = 1 To idw_ordenes.RowCount() 
					idw_ordenes.SetItem( ll_row, 'co_reserva_sap', ll_co_reserva_sap )
					idw_ordenes.SetItem( ll_row, 'estado_reserva', li_estado_reserva )
					// FACL - 2018/02/07 - SA57405 - Se cambia el campo condicion por nuevo campo indicador_mp
					idw_ordenes.SetItem( ll_row, 'indicador_mp', ii_indicador_mp_reservada )		
					idw_ordenes.SetItem( ll_row, 'sw_pedir_mp', 1 )		
				Next
				// Se actualiza el numero de reserva en ds temporal
				For ll_rec = 1 To ids_mp_x_reserva.RowCount()
					ids_mp_x_reserva.SetItem( ll_rec, 'co_reserva_sap', ll_co_reserva_sap )
				Next
			End If
			
			//si ocurre algun error, devuelve reserva sap
			If ls_msn_error <> '' Then
				lnvo_rfc_reserva = Create n_cst_rfc_reserva_sap
				// se anula la reserva en SAP
				li_retorno = lnvo_rfc_reserva.of_Ejecutar_RFC_Cerrar_Reserva_MP( ids_mp_reserva_agrupa )
				If li_retorno > 1 Then
					ls_msn_error += '~r~nFallo devolviendo la Reserva ' + String(ll_co_reserva_sap) + '.~r~n' + lnvo_rfc_reserva.is_msn_error
				End If
				Destroy n_cst_rfc_reserva_sap
			End if
			
		ElseIf ls_msn_error <> '' Then
			ls_msn_error += ', No genero reserva sap!'			
		End If
		
		If ls_msn_error <> '' Then
			ROLLBACK USING n_cst_application.itr_appl;
			// se descartan los registros que no fueron procesados
			ids_mp_reserva_agrupa.RowsDiscard( 1, ids_mp_reserva_agrupa.RowCount(), Primary! )
			ids_mp_reserva_ord.RowsDiscard( 1, ids_mp_reserva_ord.RowCount(), Primary! )
			
			// FACL - 2020/01/22 - SA60574 - Se actualiza la informacion de las ordenes si tenia N$$HEX2$$b0002000$$ENDHEX$$de Reserva
			If ll_co_reserva_sap > 0 Then
				li_estado_reserva = 6
				ll_co_reserva_sap = 0
				// Se actualiza el estado para actualizar la BD
				ids_ordenes.SetFilter( 'nu_orden in (' + ls_ordenes + ')' )
				ids_ordenes.Filter()
				
				For ll_row = 1 To ids_ordenes.RowCount() 
					ids_ordenes.SetItem( ll_row, 'co_reserva_sap', ll_co_reserva_sap )
					ids_ordenes.SetItem( ll_row, 'estado_reserva', li_estado_reserva )		
					ids_ordenes.SetItem( ll_row, 'indicador_mp', ii_indicador_mp_vacio )
				Next
			End If
			
			MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', ls_msn_error )
			lds_ordenes.Reset() // Se limpia para terminar el ciclo
		End If
		
		
		// Se Descartan los datos y se continua con el siguiente
		lds_ordenes.RowsDiscard( 1, lds_ordenes.RowCount(), Primary! )
		lds_ordenes.SetFilter( '' )
		lds_ordenes.Filter()
		lds_ordenes.Sort()
	Loop
	This.Of_SetMicroHelp('')
End If


Destroy lds_ordenes
Destroy lds_ret_reserva

idw_ordenes.SetFilter( 'agrupa_orden > 0 and estado_reserva >= 3' )
idw_ordenes.Filter()
idw_ordenes.Sort()	
	
	

Return 1
end function

public function integer of_pedir_mp_sis ();/*
	FACL - 2017/10/21 - SA57405 - Funcion para llenar las tabla de SIS para que realice el pedido de MP


TB_TR_PARCIALRESERVA 
  CO_RESERVA VARCHAR(10) NOT NULL = No. de la Reserva
  NM_PARCIAL INTEGER NOT NULL = No. del parcial = 1
  CO_TIPOESTADO INTEGER NOT NULL = 10
  CO_ESTADO INTEGER NOT NULL = 4
  SW_ANULADA VARCHAR(1) DEFAULT '0' NOT NULL
  CO_TIPOORDEN VARCHAR(2) = ""CT""
  CA_TEJIDA INTEGER = 0
  CA_PROGRAMADA INTEGER = Cantidad programada de la orden de producci$$HEX1$$f300$$ENDHEX$$n
  CA_PROGRAMADAPARCIAL INTEGER = Cantidad programada de la orden de producci$$HEX1$$f300$$ENDHEX$$n
  CA_SINDESPACHAR INTEGER = 0
  CO_TIPOPARCIAL VARCHAR(1) DEFAULT 'P',
  FH_ACTUALIZACION TIMESTAMP = Fecha del d$$HEX1$$ed00$$ENDHEX$$a + hora del d$$HEX1$$ed00$$ENDHEX$$a
  VERSION INTEGER = 1
  CO_USUARIO VARCHAR(8) = Usuario que lo crea
  FH_CREACION TIMESTAMP = Fecha y hora de creaci$$HEX1$$f300$$ENDHEX$$n

detalle TB_TR_DETALLEPARCIALRESERVA
  CS_PARCIAL INTEGER NOT NULL = Consecutivo de la cabecera
 CO_PRODUCTOSAP VARCHAR(18) NOT NULL = Materia Prima
  CO_MATRIZSAP VARCHAR(18) NOT NULL = Color de la Materia Prima
  CO_PRODUCTOREEMPLAZOSAP VARCHAR(18) =  Materia Prima de reemplazo
  CO_MATRIZREEMPLAZOSAP VARCHAR(18) = Color de Reemplazo
  CA_GRAMOSPEDIRSAP DECIMAL(13 , 3) = Gramos de la materia Prima a pedir
  CA_CONOSPEDIRSAP INTEGER = Conos a pedir
  CA_GRAMOSPENDIENTESSAP DECIMAL(13 , 3) = 0 // Gramos de la materia Prima a pedir -- REVISAR CON MARTHA
  NM_POSICIONPARCIAL INTEGER = No de posici$$HEX1$$f300$$ENDHEX$$n de la materia Prima (La misma posici$$HEX1$$f300$$ENDHEX$$n creada en la reserva)
  CO_NUMEROTRASPORTE INTEGER = 0
  DE_TEXTO VARCHAR(60) = vacio
  CO_USUARIO VARCHAR(60) = Usuario que lo crea
  FH_CREACION TIMESTAMP = Fecha y hora de creaci$$HEX1$$f300$$ENDHEX$$n
  FH_ACTUALIZACION TIMESTAMP = Fecha y Hora de creaci$$HEX1$$f300$$ENDHEX$$n
  VERSION INTEGER = 1
  NM_PARCIAL INTEGER DEFAULT 0 NOT NULL = 1
  CA_GRAMOSNECESARIOS DECIMAL(13 , 3) = Gramos de la materia Prima a pedir
  CA_CONOSNECESARIOS INTEGER DEFAULT = Conos de la materia Prima a pedir
*/

Integer li_estado_reserva, li_retorno
Long ll_cs_parcial, ll_co_reserva_sap, ll_agrupa_orden, ll_conos, ll_cs_item
Long ll_row, ll_rec, ll_rp, ll_rdp, ll_ca_programada, ll_filas
String ls_ordenes, ls_filtro, ls_msn_error, ls_msn_err_agrupa
DateTime ldt_fecha
String ls_usuario, ls_instancia, ls_co_producto_mp_sap, ls_co_color_mp_sap
Decimal ldc_kardex_reservado

n_ds_application lds_pedmp_sis, lds_consec_pedmp_sis, lds_dt_pedmp_sis, lds_ordenes

If of_Conectar_DB2() < 0 Then
	Return -1
End If

If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If


If Not IsValid( ids_mp_reserva_agrupa ) Then
	ids_mp_reserva_agrupa = CREATE n_ds_application
	ids_mp_reserva_agrupa.of_Load( 'd_gr_dt_mu_ord_reserva_agrupada' )
	ids_mp_reserva_agrupa.of_Conexion( n_cst_application.itr_appl, True )		
End If

SetPointer( HourGlass! )

lds_pedmp_sis = CREATE n_ds_application
lds_pedmp_sis.of_Load('d_gr_tb_tr_parcialreserva_sis')
lds_pedmp_sis.SetTransObject( itr_Ordenesdb2 )	

lds_consec_pedmp_sis = CREATE n_ds_application
lds_consec_pedmp_sis.of_Load('d_gr_tb_tr_parcialreserva_sis')
lds_consec_pedmp_sis.SetTransObject( itr_Ordenesdb2 )	

lds_dt_pedmp_sis = CREATE n_ds_application
lds_dt_pedmp_sis.of_Load('d_gr_tb_tr_detalleparcialreserva_sis')
lds_dt_pedmp_sis.SetTransObject( itr_Ordenesdb2 )	

// se filtran las ordenes para pedir MP
idw_ordenes.SetFilter( 'sw_pedir_mp = 1 and estado_reserva in (7,8)' )
idw_ordenes.Filter()
//  co_reserva_sap  nu_orden_agrupada  co_producto_mp  co_color_mp  nu_conos  peso_mp_estandar  ca_gramos_necesidad  ca_gramos_reserva  inventario_disponible  co_centro_sap  co_almacen_sap  co_almacen_receptor 
If idw_ordenes.RowCount() > 0 Then
	This.Of_SetMicroHelp('Registrando Pedido MP ...')

	lds_ordenes = Create n_ds_application
	lds_ordenes.of_Load( idw_ordenes.DataObject )
	
	idw_ordenes.RowsCopy( 1, idw_ordenes.RowCount(), Primary!, lds_ordenes, 1, Primary! )
	
	lds_ordenes.SetSort( 'agrupa_orden' )
	lds_ordenes.Sort()
	ll_row = 1
	Do While lds_ordenes.RowCount() > 0 
		
		ls_ordenes = ''
		ll_agrupa_orden = lds_ordenes.GetItemNumber( 1, 'agrupa_orden' )		
		lds_ordenes.SetFilter( 'agrupa_orden = ' + String( ll_agrupa_orden ) )
		lds_ordenes.Filter()
		
		ls_msn_err_agrupa = 'Fallo la reserva de la agrupacion ' + String( ll_agrupa_orden )
		
		ll_ca_programada = 0
		For ll_row = 1 To lds_ordenes.RowCount() 
			If ll_row > 1 Then ls_ordenes += ', '
			ls_ordenes += String(lds_ordenes.GetItemNumber( ll_row, 'nu_orden' ) )
			ll_ca_programada += lds_ordenes.GetItemNumber( ll_row, 'ca_programada_orden' ) 
		Next
		// FACL - 2019/10/15 - SA60054 - Se agrega filtro de productos que se van a reservar: cs_item <1000
		ls_filtro = 'nu_orden_agrupada in ( ' + ls_ordenes + ') and cs_item <1000'
		ids_mp_reserva_agrupa.SetFilter( ls_filtro )
		ids_mp_reserva_agrupa.Filter()
		ids_mp_reserva_agrupa.Sort()
		ids_mp_reserva_agrupa.GroupCalc()
	
		If ids_mp_reserva_agrupa.RowCount() = 0 Then
			MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'Ocurrio un error al cargar la MP de las ordenes ' + ls_ordenes )
			li_retorno = -1
			Exit			
		End If
		
		ll_co_reserva_sap = ids_mp_reserva_agrupa.GetItemNumber( 1, 'co_reserva_sap' )	
		
		ll_rp = lds_pedmp_sis.InsertRow( 0 )
		// Se llena los datos del encabezado de la tabla de sis
		lds_pedmp_sis.SetItem( ll_rp, 'co_reserva', String(ll_co_reserva_sap) ) 
		lds_pedmp_sis.SetItem( ll_rp, 'nm_parcial', 1 ) // No. del parcial = 1
		lds_pedmp_sis.SetItem( ll_rp, 'co_tipoestado', 10 ) // Fijo 10
		lds_pedmp_sis.SetItem( ll_rp, 'co_estado', 4 ) // Fijo 4
		lds_pedmp_sis.SetItem( ll_rp, 'sw_anulada', '0' ) // Fijo '0'
		lds_pedmp_sis.SetItem( ll_rp, 'co_tipoorden', 'CT' ) // Fijo CT
		lds_pedmp_sis.SetItem( ll_rp, 'ca_tejida', 0 ) // Fijo 0
		lds_pedmp_sis.SetItem( ll_rp, 'ca_programada', ll_ca_programada ) // Cantidad programada de la orden de producci$$HEX1$$f300$$ENDHEX$$n
		lds_pedmp_sis.SetItem( ll_rp, 'ca_programadaparcial', ll_ca_programada ) // Cantidad programada de la orden de producci$$HEX1$$f300$$ENDHEX$$n
		lds_pedmp_sis.SetItem( ll_rp, 'ca_sindespachar', 0 ) // Fijo 0
		lds_pedmp_sis.SetItem( ll_rp, 'co_tipoparcial', 'P' ) // Fijo P
		lds_pedmp_sis.SetItem( ll_rp, 'fh_actualizacion', ldt_fecha )
		lds_pedmp_sis.SetItem( ll_rp, 'version', 1 )
		lds_pedmp_sis.SetItem( ll_rp, 'co_usuario', ls_usuario )
		lds_pedmp_sis.SetItem( ll_rp, 'fh_creacion', ldt_fecha )
		// FACL - 2018/02/07 - SA57405 - Se ordena para asegurar que la resarva y el registro en SIS tiene las mismas posiciones
		ids_mp_reserva_agrupa.SetSort( 'cs_item, co_producto_mp, co_color_mp' )
		ids_mp_reserva_agrupa.Sort()
		
		For ll_rec = 1 To ids_mp_reserva_agrupa.RowCount()
			
			ls_co_producto_mp_sap = String( ids_mp_reserva_agrupa.GetItemnumber( ll_rec, 'co_producto_mp' ) )
			ls_co_color_mp_sap = String( ids_mp_reserva_agrupa.GetItemnumber( ll_rec, 'co_color_mp' ), '000000' )
			ll_conos = ids_mp_reserva_agrupa.GetItemNumber( ll_rec, 'nu_conos' )
			ll_cs_item = ids_mp_reserva_agrupa.GetItemNumber( ll_rec, 'cs_item' )
			//ldc_kardex_requerido = ids_mp_reserva_agrupa.GetItemDecimal( ll_rec, 'ca_gramos_necesidad' )
			ldc_kardex_reservado = ids_mp_reserva_agrupa.GetItemDecimal( ll_rec, 'ca_gramos_reserva' )
			
			ll_rdp = lds_dt_pedmp_sis.InsertRow( 0 )
			
			// Se llena los datos del detalle de la tabla de sis
			lds_dt_pedmp_sis.SetItem( ll_rdp, 'co_productosap', ls_co_producto_mp_sap ) // Materia Prima
			lds_dt_pedmp_sis.SetItem( ll_rdp, 'co_matrizsap', ls_co_color_mp_sap ) // Color de la Materia Prima
			lds_dt_pedmp_sis.SetItem( ll_rdp, 'co_productoreemplazosap', ls_co_producto_mp_sap ) // Materia Prima de reemplazo
			lds_dt_pedmp_sis.SetItem( ll_rdp, 'co_matrizreemplazosap', ls_co_color_mp_sap ) // Color de Reemplazo
			lds_dt_pedmp_sis.SetItem( ll_rdp, 'ca_gramospedirsap', ldc_kardex_reservado ) //  Gramos de la materia Prima a pedir
			lds_dt_pedmp_sis.SetItem( ll_rdp, 'ca_conospedirsap', ll_conos) // Conos a pedir
			lds_dt_pedmp_sis.SetItem( ll_rdp, 'ca_gramospendientessap', ldc_kardex_reservado ) // Pendiente por pedir de sap
			lds_dt_pedmp_sis.SetItem( ll_rdp, 'nm_posicionparcial', ll_cs_item ) // No de posici$$HEX1$$f300$$ENDHEX$$n de la materia Prima (La misma posici$$HEX1$$f300$$ENDHEX$$n creada en la reserva)
			lds_dt_pedmp_sis.SetItem( ll_rdp, 'co_numerotrasporte', 0 ) // Fijo 0
			lds_dt_pedmp_sis.SetItem( ll_rdp, 'de_texto', '' )  // Se deja en blanco
			lds_dt_pedmp_sis.SetItem( ll_rdp, 'co_usuario', ls_usuario ) // Usuario que lo crea
			lds_dt_pedmp_sis.SetItem( ll_rdp, 'fh_creacion', ldt_fecha ) // Fecha y hora de creaci$$HEX1$$f300$$ENDHEX$$n
			lds_dt_pedmp_sis.SetItem( ll_rdp, 'fh_actualizacion', ldt_fecha ) // Fecha y hora de creaci$$HEX1$$f300$$ENDHEX$$n
			lds_dt_pedmp_sis.SetItem( ll_rdp, 'version', 1 ) // Fijo 1
			lds_dt_pedmp_sis.SetItem( ll_rdp, 'nm_parcial', 1 ) // Fijo 1
			lds_dt_pedmp_sis.SetItem( ll_rdp, 'ca_gramosnecesarios', ldc_kardex_reservado ) // Gramos de la materia Prima a pedir
			lds_dt_pedmp_sis.SetItem( ll_rdp, 'ca_conosnecesarios', ll_conos ) // Conos de la materia Prima a pedir
		Next
		
		
		If ib_guardar_log Then lds_pedmp_sis.saveas( 'c:\lds_pedmp_sis_a' + String(ll_agrupa_orden) +'.xls', excel!, true )
		If ib_guardar_log Then lds_dt_pedmp_sis.saveas( 'c:\lds_pedmp_sis_a' + String(ll_agrupa_orden) +'.xls', excel!, true )

		
		// Se crea el pedido de MP en SIS
		IF ls_msn_error = '' Then			
			// Se actualiza la informacion en SIS
			If lds_pedmp_sis.Update( True, False ) < 1 Then
				ls_msn_error = ls_msn_err_agrupa + ', Fallo creando Pedido MP:~r~n' + itr_Ordenesdb2.SQLErrText
				ROLLBACK USING itr_Ordenesdb2;
			Else
				// Se toma el consecutivo
				ll_cs_parcial = lds_pedmp_sis.GetItemNumber( ll_rp, 'cs_parcial' )
				If IsNull( ll_cs_parcial ) Then
					ll_filas = lds_consec_pedmp_sis.Retrieve( String(ll_co_reserva_sap) )
					If ll_filas = 1 Then
						ll_cs_parcial = lds_consec_pedmp_sis.GetItemNumber( 1, 'cs_parcial' )
						lds_pedmp_sis.SetItem( ll_rp, 'cs_parcial', ll_cs_parcial )
					ElseIf ll_filas = 0 Then
						ls_msn_error = ls_msn_err_agrupa + '~r~nNo se encontro el consecutivo de parcial'
					Else
						ls_msn_error = ls_msn_err_agrupa + '~r~nFallo la recuperacion del consecutivo de parcial'
					End If
				End If
				
				If ls_msn_error <> '' Then
					ROLLBACK USING itr_Ordenesdb2;
				Else
					// Se asigna el consecutivo del parcial al detalle
					For ll_rdp = 1 To lds_dt_pedmp_sis.RowCount()
						lds_dt_pedmp_sis.SetItem( ll_rdp, 'cs_parcial', ll_cs_parcial )  
					Next
				
				
					If lds_dt_pedmp_sis.Update( True, False ) < 1 Then
						ls_msn_error = ls_msn_err_agrupa + ', Fallo creando detalle Pedido MP:~r~n' + itr_Ordenesdb2.SQLErrText
						ROLLBACK USING itr_Ordenesdb2;
					End If
				End If
			End If
			If ib_guardar_log Then lds_pedmp_sis.saveas( 'c:\lds_pedmp_sis_b' + String(ll_agrupa_orden) +'.xls', excel!, true )
			If ib_guardar_log Then lds_dt_pedmp_sis.saveas( 'c:\lds_pedmp_sis_b' + String(ll_agrupa_orden) +'.xls', excel!, true )
		End If
			
			
			
		IF ls_msn_error = '' Then
			li_estado_reserva = 10
			// Se actualiza el estado para actualizar la BD
			ids_ordenes.SetFilter( 'nu_orden in (' + ls_ordenes + ')' )
			ids_ordenes.Filter()			
			For ll_row = 1 To ids_ordenes.RowCount() 
				// FACL - 2018/02/07 - SA57405 - Se cambia el campo condicion por nuevo campo indicador_mp
				ids_ordenes.SetItem( ll_row, 'indicador_mp', ii_indicador_mp_pedido )
			Next
			ids_ordenes.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)	
			
			
			// Se actualiza la condicion a las ordenes
			If ids_ordenes.Update( True, False ) < 1 Then
				ls_msn_error = ls_msn_err_agrupa + ', Fallo actualizando la Orden:~r~n' + n_cst_application.itr_appl.SQLErrText
				ROLLBACK USING itr_Ordenesdb2;
				ROLLBACK USING n_cst_application.itr_appl;
			Else
				// Se hace commit en SIS y Muestras
				COMMIT USING itr_Ordenesdb2;
				COMMIT USING n_cst_application.itr_appl;
				ids_ordenes.ResetUpdate()
				lds_pedmp_sis.ResetUpdate()
				lds_dt_pedmp_sis.ResetUpdate()
				
				// Se actualiza el estado en el dw de la ventana
				idw_ordenes.SetFilter( 'agrupa_orden = ' + String( ll_agrupa_orden ) )
				idw_ordenes.Filter()
				
				For ll_row = 1 To idw_ordenes.RowCount() 
					idw_ordenes.SetItem( ll_row, 'estado_reserva', li_estado_reserva )
					// FACL - 2018/02/07 - SA57405 - Se cambia el campo condicion por nuevo campo indicador_mp
					idw_ordenes.SetItem( ll_row, 'indicador_mp', ii_indicador_mp_pedido )		
				Next
				// Se pasan los registros procesados al buffer de filtrado
				lds_pedmp_sis.SetFilter( '1=0' )
				lds_pedmp_sis.Filter()
		
				lds_dt_pedmp_sis.SetFilter( '1=0' )
				lds_dt_pedmp_sis.Filter()
			End If
		End If
		
		If ls_msn_error <> '' Then
			ROLLBACK USING itr_Ordenesdb2;
			ROLLBACK USING n_cst_application.itr_appl;
			MessageBox( 'Error', ls_msn_error )
			lds_ordenes.Reset() // Se limpia para terminar el ciclo
		End If
		
		// Se Descartan los datos y se continua con la siguiente agrupacion
		lds_ordenes.RowsDiscard( 1, lds_ordenes.RowCount(), Primary! )
		lds_ordenes.SetFilter( '' )
		lds_ordenes.Filter()
		lds_ordenes.Sort()
		li_retorno = 1
		
	Loop
	This.Of_SetMicroHelp('')
End If

Destroy lds_ordenes
Destroy lds_pedmp_sis
Destroy lds_dt_pedmp_sis

idw_ordenes.SetFilter( 'agrupa_orden > 0 and estado_reserva >= 3' )
idw_ordenes.Filter()
idw_ordenes.Sort()	
idw_ordenes.SetRedraw( True )

SetPointer( Arrow! )

Return li_retorno
end function

public function integer of_mostrar_mp_x_reserva (u_dw_application adw_mp_x_reserva);
adw_mp_x_reserva.Reset()

If Not IsValid( ids_mp_x_reserva ) Then Return 1

If ids_mp_x_reserva.RowCount() > 0 Then
	ids_mp_x_reserva.RowsCopy( 1, ids_mp_x_reserva.RowCount(), Primary!, adw_mp_x_reserva, 1, Primary! )
End If

If ids_mp_x_reserva.FilteredCount() > 0 Then
	ids_mp_x_reserva.RowsCopy( 1, ids_mp_x_reserva.FilteredCount(), Filter!, adw_mp_x_reserva, 1, Primary! )
End If


If IsValid( ids_mp_reserva_agrupa ) Then
	If ids_mp_reserva_agrupa.RowCount() > 0 Then
		ids_mp_reserva_agrupa.RowsCopy( 1, ids_mp_reserva_agrupa.RowCount(), Primary!, adw_mp_x_reserva, 1, Primary! )
	End If
	
	If ids_mp_reserva_agrupa.FilteredCount() > 0 Then
		ids_mp_reserva_agrupa.RowsCopy( 1, ids_mp_reserva_agrupa.FilteredCount(), Filter!, adw_mp_x_reserva, 1, Primary! )
	End If
End If
Return 1
end function

public function integer of_obtener_ultimo_consecutivo_db2 ();String ls_sql = 'IDENTITY_VAL_LOCAL()'
Return 1
end function

public function integer of_cargar_constantes ();/*
	FACL - 2017/10/25 - SA57405 - Se cargan las constantes a utilizar en el proceso de la reserva
*/
Long ll_ret, ll_filas
n_cst_comun lnvo_comun

// Se cargan los dias de lead time de tejido
ll_ret=lnvo_comun.of_ValorConstante( "DIAS_LEAD_TIME_TEJIDO",n_cst_application.itr_appl )

If ll_ret = 1 Then
	ii_Lead_Time_Tejido = Long(lnvo_comun.of_GetDecimal(1))
Else
	ii_Lead_Time_Tejido = 3
End If

// Se cargan el % a Pedir del Estandar de Cono de Materia Prima
ll_ret=lnvo_comun.of_ValorConstante( "PORC_A_PEDIR",n_cst_application.itr_appl )
If ll_ret = 1 Then
	idc_Porc_a_Pedir = lnvo_comun.of_GetDecimal(1)
Else
	//idc_Porc_a_Pedir = 100
	MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', "No se encontro Configuracion de 'PORC_A_PEDIR'" )
	Return -1	
End If
// Se carga el % de inventario minimo para realizar la reserval
ll_ret=lnvo_comun.of_ValorConstante( "PORC_DE_INV",n_cst_application.itr_appl )
If ll_ret = 1 Then
	idc_Porc_Inv = lnvo_comun.of_GetDecimal(1)
Else
	//idc_Porc_Inv = 50
	MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', "No se encontro Configuracion de 'PORC_DE_INV'" )
	Return -1	
End If

// FACL - 2019/10/11 - SA60054 - Se carga el % por encima de reserva permitido
ll_ret=lnvo_comun.of_ValorConstante( "CONTROL_TOPE_RESERVA",n_cst_application.itr_appl )
If ll_ret = 1 Then
	ii_control_tope_reserva = lnvo_comun.of_GetLong(1)
Else
	//ii_control_tope_reserva = 0
	MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', "No se encontro Configuracion de 'CONTROL_TOPE_RESERVA'" )
	Return -1	
End If

// FACL - 2019/10/11 - SA60054 - Se carga el % por encima de reserva permitido
ll_ret=lnvo_comun.of_ValorConstante( "PORC_ENCIM_RES",n_cst_application.itr_appl )
If ll_ret = 1 Then
	idc_Porc_Encim_Res = lnvo_comun.of_GetDecimal(1)
Else
	//idc_Porc_Encim_Res = 10
	MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', "No se encontro Configuracion de 'PORC_ENCIM_RES'" )
	Return -1	
End If


// Se carga el almacen de sap
ll_ret=lnvo_comun.of_ValorConstante( "CO_ALMACEN_SAP",n_cst_application.itr_appl )
If ll_ret = 1 Then
	is_co_almacen_sap = Trim(lnvo_comun.of_GetString(1))
Else
	is_co_almacen_sap = '0100'
End If

// se carga el almacen receptor de SAP
ll_ret=lnvo_comun.of_ValorConstante( "CO_ALMACEN_RECEPTOR",n_cst_application.itr_appl )
If ll_ret = 1 Then
	is_almacen_recptor = Trim(lnvo_comun.of_GetString(1))
Else
	is_almacen_recptor = '0104'
End If

// Se carga las partes de hilo cerrado que se descartan
ll_ret=lnvo_comun.of_ValorConstante( "PARTE_HILO_CERRADO",n_cst_application.itr_appl )
If ll_ret = 1 Then
	is_co_parte_hilo_cerrado = Trim(lnvo_comun.of_GetString(1))
Else
	is_co_parte_hilo_cerrado = '205, 206' // Hilo Cerrado por Encima/ Hilo Cerrado por debajo
End If



// Se carga las actividades que se tienen en cuenta para realizar la reserva
ll_ret=lnvo_comun.of_ValorConstante( "ACTIVIDAD_RESERVA",n_cst_application.itr_appl )
If ll_ret = 1 Then
	is_actividad = Trim(lnvo_comun.of_GetString(1))
Else
	is_actividad = '12, 89, 90, 1, 68' // 12 - DESARROLLO TECNICO - TEJER, 89 - DLLO_T$$HEX1$$c900$$ENDHEX$$CNICO_ESCALADOS, 1, 90 y 68 Graficados
End If


// Se carga el centro de sap asociada a la fabrica seleccionada
n_ds_application lds_varconfig

lds_varconfig = CREATE n_ds_application
lds_varconfig.of_Load('d_gr_m_variables_config_x_fabrica')
lds_varconfig.of_Conexion( n_cst_application.itr_appl, True ) 

ll_filas = lds_varconfig.Retrieve( n_cst_application.ii_fabrica, 'CENTROFABRICA' )

If ll_filas = 0 Then
	MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', "Falta Configurar el parametro 'CENTROFABRICA' para la fabrica: "+String(n_cst_application.ii_fabrica) )
	ll_ret = -1
ElseIf ll_filas < 0 Then
	MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', "Fallo consultando Configuracion de 'CENTROFABRICA'" )
	ll_ret = -1
Else
	is_co_centro_sap = Trim( lds_varconfig.GetItemString( 1, 'co_codigo' ) )
	ll_ret = 1
End If
Destroy lds_varconfig

Return ll_ret
end function

public function integer of_cargar_std_conos_sis ();/*
	FACL - 2017/10/18 - SA57405 - Funcion Para cargar el peso estandar por cono en SIS ( DB2) 
		de la Materia Prima que usa la ordenes que fueron seleccionadas
*/

Boolean lb_falta_std
Long ll_filas, ll_rec, ll_rstd, ll_row, ll_pr, &
	ll_nu_orden, ll_co_producto_mp, ll_co_color_mp
String ls_productos[], ls_colores[], ls_find_std, ls_filtro_ord, ls_msn, ls_sin_std

This.of_SetMicroHelp( 'Cargando Estandar de Conos ...' )

If Not IsValid( ids_mp ) Then Return 0

If ids_mp.RowCount() = 0 Then Return 0

If Not IsValid( ids_peso_std_cono ) Then

	If of_Conectar_DB2() < 0 Then
		Return -1
	End If
	ids_peso_std_cono = Create n_ds_application
	ids_peso_std_cono.of_Load( 'd_gr_conos_std_sis' )  // crear datawindows  *****
	ids_peso_std_cono.SetTransObject( itr_Ordenesdb2 )	
Else
	ids_peso_std_cono.Reset()
End If

lb_falta_std = False

// Se cargan los estandares por cono
ls_productos= ids_mp.Object.co_material_sap.Primary
ls_colores	= ids_mp.Object.co_matriz.Primary

ll_filas = ids_peso_std_cono.Retrieve( is_co_centro_sap, ls_productos, ls_colores )

// Se verifica que 
For ll_rec = 1 To ids_mp.RowCount()
	ll_co_producto_mp = Long( ids_mp.GetItemString( ll_rec, 'co_material_sap' ))
	ll_co_color_mp = Long( ids_mp.GetItemString( ll_rec, 'co_matriz' ))
	
	
	ls_find_std = 'co_centro = "' + is_co_centro_sap + '" And co_material = "' + Trim( ids_mp.GetItemString( ll_rec, 'co_material_sap' )) + '"' &
			+ ' AND co_matriz = "' + Trim( ids_mp.GetItemString( ll_rec, 'co_matriz' )) + '"'
	
	ll_rstd = ids_peso_std_cono.Find( ls_find_std, 1, ids_peso_std_cono.RowCount() )
	If ll_rstd = 0 Then
		lb_falta_std = True
		If ls_sin_std <> '' Then ls_sin_std += '~r~n'
		ls_sin_std += String(ll_co_producto_mp) + '~t~t' + String(ll_co_color_mp)	+ '~t' 
		// Se marcan las ordenes que contienen el dato
		ls_filtro_ord = 'co_producto_mp = ' + String( ll_co_producto_mp ) &
			+ ' AND co_color_mp = ' + String( ll_co_color_mp )
		
		If Not ib_mp_adicional Then
			ids_mp_x_reserva_ord.SetFilter( ls_filtro_ord )
			ids_mp_x_reserva_ord.Filter()
			
			For ll_pr = 1 To ids_mp_x_reserva_ord.RowCount()
				ll_nu_orden = ids_mp_x_reserva_ord.GetItemNumber( ll_pr, 'nu_orden' )
				ll_row = idw_ordenes.Find( 'sw_fmp_x_reserva = 1 And nu_orden = ' + String( ll_nu_orden ), 1, idw_ordenes.RowCount() )
				If ll_row > 0 Then
					idw_ordenes.SetItem( ll_row, 'sw_fmp_x_reserva', -2 )	
					idw_ordenes.SetItem( ll_row, 'estado_mp', 'NO STD' )
					ls_sin_std += String( ll_nu_orden ) + ', '
				End If
			Next
		End If
	End If
Next

// Se verifica que esten todos los colores


If ib_guardar_log Then ids_peso_std_cono.SaveAs( 'c:\peso_std_cono.xls', excel5!, true )

If lb_falta_std Then
	is_msn_error = 'No se encontro informacion de Peso Estandar para:~r~n' &
		+ ' Producto~t~tColor~tOrden~r~n' &
		+ ls_sin_std
		
End If

Return 1

end function

public function integer of_filtrar_tareas_x_reservar ();/*
	FACL - 2017/10/27 - SA57405 - Funcion para filtras las operaciones y actividades en que se puede 
		reservar las ordenes
*/

String ls_filtro

ls_filtro = 'co_actividad IN (' + is_actividad + ')'

If ids_ordenes.SetFilter( ls_filtro ) < 0 Then
	MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'Ocurrio un error en el filtrado!' )
	Return -1
End If

ids_ordenes.Filter()

ids_ordenes.RowsDiscard( 1, ids_ordenes.FilteredCount(), Filter! )



Return 1
end function

public function integer of_cargar_productos_alta_rotacion ();




Return ids_prod_alta_rotacion.Retrieve()
end function

public function integer of_set_dw_mp_adicional (ref u_dw_application adw_mp_adicional);idw_mp_adicional = adw_mp_adicional

Return 1
end function

public function integer of_reserva_pide_mp_adicional ();/*
	FACL - 2018/02/20 - SA58161 - Funcion para realizar la reserva y el pedido para 
		pedidos adicicionales de MP.
*/

Integer li_retorno, li_retorno2
Long ll_pedido_adicional, ll_co_reserva_sap, ll_rec
String ls_usuario, ls_instancia, ls_msn_error
DateTime ldt_fecha
n_ds_application lds_ret_reserva
n_cst_rfc_reserva_sap lnvo_rfc_reserva

If idw_mp_adicional.AcceptText() <> 1 Then Return 0

If idw_mp_adicional.RowCount() = 0 Then Return 0

ll_pedido_adicional = idw_mp_adicional.GetItemNumber( 1, 'cs_adicional' )
// si no tiene Pedido Adicional
If IsNull( ll_pedido_adicional ) Or ll_pedido_adicional = 0 Then
	MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'Fallo obtener el consecutivo de Adicional, Debe volver a Validar MP!' )
	Return 1
End If

// se asigna el consecutivo a todos los registros
For ll_rec = 1 To idw_mp_adicional.RowCount()
	idw_mp_adicional.SetItem( ll_rec, 'cs_item', ll_rec )
	idw_mp_adicional.SetItem( ll_rec, 'cs_adicional', ll_pedido_adicional )
Next		

// se vuelve a validar mp Adicional  --- SI ES NECESARIO ????
//li_retorno = This.of_Validar_MP_Adicional()
//If li_retorno < 0 Then Return li_retorno


If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If

ll_co_reserva_sap = 0

lds_ret_reserva = CREATE n_ds_application
lds_ret_reserva.of_Load('d_gr_ext_ret_rfc_reserva_mp') 

// Se invoca la reserva a SAP

// Se ordena para asegurar que la resarva y el registro en SIS tiene las mismas posiciones
ids_mp_reserva_agrupa.of_Load( idw_mp_adicional.DataObject )
idw_mp_adicional.ShareData( ids_mp_reserva_agrupa )

ids_mp_reserva_agrupa.SetSort( 'cs_item' )
ids_mp_reserva_agrupa.Sort()

lnvo_rfc_reserva = Create n_cst_rfc_reserva_sap
// Se guarda el consecutivo de pedido adicional en el numero de la maquina
lnvo_rfc_reserva.il_co_maquina_reserva = ll_pedido_adicional
li_retorno = lnvo_rfc_reserva.of_Ejecutar_RFC_Reserva_MP( ids_mp_reserva_agrupa, lds_ret_reserva )

If ib_guardar_log Then ids_mp_reserva_agrupa.saveas( 'c:\reserva_add_' + String(ll_pedido_adicional) +'.xls', excel!, true )

If li_retorno < 0 Then
	is_msn_error = 'Fallo la RFC de reserva!'
Else
	If lds_ret_reserva.RowCount() = 0 Then
		ll_co_reserva_sap = 0
		is_msn_error = 'No genero reserva sap'
		li_retorno = 0
	Else
		// Se obtiene la reserva
		ll_co_reserva_sap = lds_ret_reserva.GetItemNumber( 1, 'co_reserva_sap' )
		// Si la estructura contiene un mensaje es porque hay error
		If Trim( lds_ret_reserva.GetItemString( 1, 'msn_error' ) ) <> '' Then
			is_msn_error = 'Fallo la RFC de reserva:~r~n' +Trim( lds_ret_reserva.GetItemString( 1, 'msn_error' ) )
			li_retorno = -1
		End If
	End If
End If

Destroy lds_ret_reserva

If li_retorno > 0 Then
	// Se actualiza el numero de reserva al resumen de Materia Prima
	For ll_rec = 1 To ids_mp_reserva_agrupa.RowCount()
		ids_mp_reserva_agrupa.SetItem( ll_rec, 'co_reserva_sap', ll_co_reserva_sap )
	Next
	ids_mp_reserva_agrupa.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)
	
	If ids_mp_reserva_agrupa.Update( True, False ) < 1 Then
		is_msn_error = 'Fallo creando Agrupa MP:~r~n' + n_cst_application.itr_appl.SQLErrText
		ROLLBACK USING n_cst_application.itr_appl;
	End If
End If
	
// Se graba en SIS y en muestras.
If li_retorno > 0 Then
	li_retorno = This.of_Llena_Pedido_MP(ll_co_reserva_sap, 1, ls_usuario, ldt_fecha)
End If

If li_retorno > 0 Then
	COMMIT Using itr_Ordenesdb2;
	COMMIT Using n_cst_application.itr_appl;
	
	MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'Se genero el pedido adicional con Exito~r~nCs Adicional: ' + String(ll_pedido_adicional) )
	idw_mp_adicional.Reset()
Else
	// Se devuelven los cambios en Muestras y SIS
	ROLLBACK USING itr_Ordenesdb2;
	ROLLBACK USING n_cst_application.itr_appl;
	If ll_co_reserva_sap > 0 Then
		// se anula la reserva en SAP
		li_retorno2 = lnvo_rfc_reserva.of_Ejecutar_RFC_Cerrar_Reserva_MP( ids_mp_reserva_agrupa )
		If li_retorno2 > 1 Then
			is_msn_error += '~r~nFallo Cerrando la Reserva ' + String(ll_co_reserva_sap) + '.~r~n' + lnvo_rfc_reserva.is_msn_error
		End If
	End If
	MessageBox( 'Error', is_msn_error )
End If
	



Destroy n_cst_rfc_reserva_sap

Return 1
end function

public function integer of_llena_pedido_mp (long al_co_reserva_sap, long al_ca_programada, string as_usuario, datetime adt_fecha);/*
	FACL - 2017/10/21 - SA57405 - Funcion para llenar las tabla de SIS para que realice el pedido de MP


TB_TR_PARCIALRESERVA 
  CO_RESERVA VARCHAR(10) NOT NULL = No. de la Reserva
  NM_PARCIAL INTEGER NOT NULL = No. del parcial = 1
  CO_TIPOESTADO INTEGER NOT NULL = 10
  CO_ESTADO INTEGER NOT NULL = 4
  SW_ANULADA VARCHAR(1) DEFAULT '0' NOT NULL
  CO_TIPOORDEN VARCHAR(2) = ""CT""
  CA_TEJIDA INTEGER = 0
  CA_PROGRAMADA INTEGER = Cantidad programada de la orden de producci$$HEX1$$f300$$ENDHEX$$n
  CA_PROGRAMADAPARCIAL INTEGER = Cantidad programada de la orden de producci$$HEX1$$f300$$ENDHEX$$n
  CA_SINDESPACHAR INTEGER = 0
  CO_TIPOPARCIAL VARCHAR(1) DEFAULT 'P',
  FH_ACTUALIZACION TIMESTAMP = Fecha del d$$HEX1$$ed00$$ENDHEX$$a + hora del d$$HEX1$$ed00$$ENDHEX$$a
  VERSION INTEGER = 1
  CO_USUARIO VARCHAR(8) = Usuario que lo crea
  FH_CREACION TIMESTAMP = Fecha y hora de creaci$$HEX1$$f300$$ENDHEX$$n

detalle TB_TR_DETALLEPARCIALRESERVA
  CS_PARCIAL INTEGER NOT NULL = Consecutivo de la cabecera
 CO_PRODUCTOSAP VARCHAR(18) NOT NULL = Materia Prima
  CO_MATRIZSAP VARCHAR(18) NOT NULL = Color de la Materia Prima
  CO_PRODUCTOREEMPLAZOSAP VARCHAR(18) =  Materia Prima de reemplazo
  CO_MATRIZREEMPLAZOSAP VARCHAR(18) = Color de Reemplazo
  CA_GRAMOSPEDIRSAP DECIMAL(13 , 3) = Gramos de la materia Prima a pedir
  CA_CONOSPEDIRSAP INTEGER = Conos a pedir
  CA_GRAMOSPENDIENTESSAP DECIMAL(13 , 3) = 0 // Gramos de la materia Prima a pedir -- REVISAR CON MARTHA
  NM_POSICIONPARCIAL INTEGER = No de posici$$HEX1$$f300$$ENDHEX$$n de la materia Prima (La misma posici$$HEX1$$f300$$ENDHEX$$n creada en la reserva)
  CO_NUMEROTRASPORTE INTEGER = 0
  DE_TEXTO VARCHAR(60) = vacio
  CO_USUARIO VARCHAR(60) = Usuario que lo crea
  FH_CREACION TIMESTAMP = Fecha y hora de creaci$$HEX1$$f300$$ENDHEX$$n
  FH_ACTUALIZACION TIMESTAMP = Fecha y Hora de creaci$$HEX1$$f300$$ENDHEX$$n
  VERSION INTEGER = 1
  NM_PARCIAL INTEGER DEFAULT 0 NOT NULL = 1
  CA_GRAMOSNECESARIOS DECIMAL(13 , 3) = Gramos de la materia Prima a pedir
  CA_CONOSNECESARIOS INTEGER DEFAULT = Conos de la materia Prima a pedir
*/

Long ll_rp, ll_rec, ll_rdp, ll_filas
Long ll_cs_parcial, ll_ca_programada, ll_conos, ll_cs_item
Integer li_retorno
String ls_co_producto_mp_sap, ls_co_color_mp_sap
Decimal ldc_kardex_reservado

n_ds_application lds_pedmp_sis, lds_consec_pedmp_sis, lds_dt_pedmp_sis

If ids_mp_reserva_agrupa.RowCount() = 0 Then Return 0

li_retorno = 0

lds_pedmp_sis = CREATE n_ds_application
lds_pedmp_sis.of_Load('d_gr_tb_tr_parcialreserva_sis')
lds_pedmp_sis.SetTransObject( itr_Ordenesdb2 )	

lds_consec_pedmp_sis = CREATE n_ds_application
lds_consec_pedmp_sis.of_Load('d_gr_tb_tr_parcialreserva_sis')
lds_consec_pedmp_sis.SetTransObject( itr_Ordenesdb2 )	

lds_dt_pedmp_sis = CREATE n_ds_application
lds_dt_pedmp_sis.of_Load('d_gr_tb_tr_detalleparcialreserva_sis')
lds_dt_pedmp_sis.SetTransObject( itr_Ordenesdb2 )	


ll_rp = lds_pedmp_sis.InsertRow( 0 )
// Se llena los datos del encabezado de la tabla de sis
lds_pedmp_sis.SetItem( ll_rp, 'co_reserva', String(al_co_reserva_sap) ) 
lds_pedmp_sis.SetItem( ll_rp, 'nm_parcial', 1 ) // No. del parcial = 1
lds_pedmp_sis.SetItem( ll_rp, 'co_tipoestado', 10 ) // Fijo 10
lds_pedmp_sis.SetItem( ll_rp, 'co_estado', 4 ) // Fijo 4
lds_pedmp_sis.SetItem( ll_rp, 'sw_anulada', '0' ) // Fijo '0'
lds_pedmp_sis.SetItem( ll_rp, 'co_tipoorden', 'CT' ) // Fijo CT
lds_pedmp_sis.SetItem( ll_rp, 'ca_tejida', 0 ) // Fijo 0
lds_pedmp_sis.SetItem( ll_rp, 'ca_programada', al_ca_programada ) // Cantidad programada de la orden de producci$$HEX1$$f300$$ENDHEX$$n
lds_pedmp_sis.SetItem( ll_rp, 'ca_programadaparcial', al_ca_programada ) // Cantidad programada de la orden de producci$$HEX1$$f300$$ENDHEX$$n
lds_pedmp_sis.SetItem( ll_rp, 'ca_sindespachar', 0 ) // Fijo 0
lds_pedmp_sis.SetItem( ll_rp, 'co_tipoparcial', 'P' ) // Fijo P
lds_pedmp_sis.SetItem( ll_rp, 'fh_actualizacion', adt_fecha )
lds_pedmp_sis.SetItem( ll_rp, 'version', 1 )
lds_pedmp_sis.SetItem( ll_rp, 'co_usuario', as_usuario )
lds_pedmp_sis.SetItem( ll_rp, 'fh_creacion', adt_fecha )
// FACL - 2018/02/07 - SA57405 - Se ordena para asegurar que la resarva y el registro en SIS tiene las mismas posiciones
ids_mp_reserva_agrupa.SetSort( 'cs_item, co_producto_mp, co_color_mp' )
ids_mp_reserva_agrupa.Sort()

For ll_rec = 1 To ids_mp_reserva_agrupa.RowCount()
	
	ls_co_producto_mp_sap = String( ids_mp_reserva_agrupa.GetItemnumber( ll_rec, 'co_producto_mp' ) )
	ls_co_color_mp_sap = String( ids_mp_reserva_agrupa.GetItemnumber( ll_rec, 'co_color_mp' ), '000000' )
	ll_conos = ids_mp_reserva_agrupa.GetItemNumber( ll_rec, 'nu_conos' )
	//ldc_kardex_requerido = ids_mp_reserva_agrupa.GetItemDecimal( ll_rec, 'ca_gramos_necesidad' )
	ldc_kardex_reservado = ids_mp_reserva_agrupa.GetItemDecimal( ll_rec, 'ca_gramos_reserva' )
	ll_cs_item = ids_mp_reserva_agrupa.GetItemNumber( ll_rec, 'cs_item' )
	
	ll_rdp = lds_dt_pedmp_sis.InsertRow( 0 )
	
	// Se llena los datos del detalle de la tabla de sis
	lds_dt_pedmp_sis.SetItem( ll_rdp, 'co_productosap', ls_co_producto_mp_sap ) // Materia Prima
	lds_dt_pedmp_sis.SetItem( ll_rdp, 'co_matrizsap', ls_co_color_mp_sap ) // Color de la Materia Prima
	lds_dt_pedmp_sis.SetItem( ll_rdp, 'co_productoreemplazosap', ls_co_producto_mp_sap ) // Materia Prima de reemplazo
	lds_dt_pedmp_sis.SetItem( ll_rdp, 'co_matrizreemplazosap', ls_co_color_mp_sap ) // Color de Reemplazo
	lds_dt_pedmp_sis.SetItem( ll_rdp, 'ca_gramospedirsap', ldc_kardex_reservado ) //  Gramos de la materia Prima a pedir
	lds_dt_pedmp_sis.SetItem( ll_rdp, 'ca_conospedirsap', ll_conos) // Conos a pedir
	lds_dt_pedmp_sis.SetItem( ll_rdp, 'ca_gramospendientessap', ldc_kardex_reservado ) // Pendiente por pedir de sap
	lds_dt_pedmp_sis.SetItem( ll_rdp, 'nm_posicionparcial',  ll_cs_item ) // No de posici$$HEX1$$f300$$ENDHEX$$n de la materia Prima (La misma posici$$HEX1$$f300$$ENDHEX$$n creada en la reserva)
	lds_dt_pedmp_sis.SetItem( ll_rdp, 'co_numerotrasporte', 0 ) // Fijo 0
	lds_dt_pedmp_sis.SetItem( ll_rdp, 'de_texto', '' )  // Se deja en blanco
	lds_dt_pedmp_sis.SetItem( ll_rdp, 'co_usuario', as_usuario ) // Usuario que lo crea
	lds_dt_pedmp_sis.SetItem( ll_rdp, 'fh_creacion', adt_fecha ) // Fecha y hora de creaci$$HEX1$$f300$$ENDHEX$$n
	lds_dt_pedmp_sis.SetItem( ll_rdp, 'fh_actualizacion', adt_fecha ) // Fecha y hora de creaci$$HEX1$$f300$$ENDHEX$$n
	lds_dt_pedmp_sis.SetItem( ll_rdp, 'version', 1 ) // Fijo 1
	lds_dt_pedmp_sis.SetItem( ll_rdp, 'nm_parcial', 1 ) // Fijo 1
	lds_dt_pedmp_sis.SetItem( ll_rdp, 'ca_gramosnecesarios', ldc_kardex_reservado ) // Gramos de la materia Prima a pedir
	lds_dt_pedmp_sis.SetItem( ll_rdp, 'ca_conosnecesarios', ll_conos ) // Conos de la materia Prima a pedir
Next


// Se actualiza la informacion en SIS
If lds_pedmp_sis.Update( True, False ) < 1 Then
	is_msn_error = ' Fallo creando Pedido MP:~r~n' + itr_Ordenesdb2.SQLErrText
	ROLLBACK USING itr_Ordenesdb2;
	li_retorno = -1
Else
	// Se toma el consecutivo
	ll_cs_parcial = lds_pedmp_sis.GetItemNumber( ll_rp, 'cs_parcial' )
	If IsNull( ll_cs_parcial ) Then
		ll_filas = lds_consec_pedmp_sis.Retrieve( String(al_co_reserva_sap) )
		If ll_filas = 1 Then
			ll_cs_parcial = lds_consec_pedmp_sis.GetItemNumber( 1, 'cs_parcial' )
			lds_pedmp_sis.SetItem( ll_rp, 'cs_parcial', ll_cs_parcial )
		ElseIf ll_filas = 0 Then
			is_msn_error = 'No se encontro el consecutivo de parcial'
		Else
			is_msn_error = 'Fallo la recuperacion del consecutivo de parcial'
		End If
	End If
	
	If is_msn_error <> '' Then
		ROLLBACK USING itr_Ordenesdb2;
		li_retorno = -2
	Else
		// Se asigna el consecutivo del parcial al detalle
		For ll_rdp = 1 To lds_dt_pedmp_sis.RowCount()
			lds_dt_pedmp_sis.SetItem( ll_rdp, 'cs_parcial', ll_cs_parcial )  
		Next
	
	
		If lds_dt_pedmp_sis.Update( True, False ) < 1 Then
			is_msn_error = 'Fallo creando detalle Pedido MP:~r~n' + itr_Ordenesdb2.SQLErrText
			ROLLBACK USING itr_Ordenesdb2;
			li_retorno = -3
		Else
			li_retorno = 1
		End If
	End If
End If

Destroy lds_pedmp_sis
Destroy lds_consec_pedmp_sis
Destroy lds_dt_pedmp_sis

Return li_retorno
end function

public function integer of_validar_mp_adicional (boolean ab_act_ca_reserva);/*
	FACL - 2017/10/18 - SA58161 - Funcion Valida el Inventario
		....
		que Agrupa las necesidades y si hay inventario suficiente 
		se marca con la bandera "CON MP"
*/

Long ll_agrupa_orden, ll_nu_orden, ll_co_producto_mp, ll_co_color_mp, ll_conos, ll_pedido_adicional
Long ll_row, ll_rec, ll_pr, ll_filas, ll_fila, ll_ar, ll_rfind, ll_rstd, ll_rkx
Integer li_retorno, li_ret
String ls_find, ls_msn_error_std, ls_find_std, ls_sin_std, ls_find_kx
Decimal ldc_std_cono, ldc_kardex_requerido, ldc_inventario_disponible, ldc_ca_reserva_mp
Boolean lb_puede_reservar

ib_mp_adicional = True

If idw_mp_adicional.AcceptText() <> 1 Then Return 0

If idw_mp_adicional.RowCount() = 0 Then Return 0
// Se verifica que todos tenga ingresado el producto
ls_find = 'co_producto_mp <= 0 Or IsNull(co_producto_mp)'
ll_rfind = idw_mp_adicional.Find( ls_find, 1, idw_mp_adicional.RowCount()  )
If ll_rfind > 0 Then
	MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'Primero debe ingresar el producto' )
	Return -1
End If


If Not IsValid( ids_mp ) Then
	ids_mp = CREATE n_ds_application
	ids_mp.of_Load('d_gr_ext_parm_rfc_stock_disponible')
Else
	ids_mp.Reset()
End IF
	
This.of_SetMicroHelp('Preparando Datos ...')

idw_mp_adicional.SetFilter('co_producto_mp > 0 And co_color_mp > 0 And nu_conos > 0')
idw_mp_adicional.Filter()
idw_mp_adicional.GroupCalc()
// Se preparan los parametros para invocar la RFC de Stock Disponible
	
For ll_pr = 1 To idw_mp_adicional.RowCount()
	ll_co_producto_mp = idw_mp_adicional.GetItemNumber( ll_pr, 'co_producto_mp' )
	ll_co_color_mp = idw_mp_adicional.GetItemNumber( ll_pr, 'co_color_mp' )
	
	ll_rec = ids_mp.InsertRow( 0 )
	ids_mp.SetItem( ll_rec, 'co_material_sap', String(ll_co_producto_mp) )
	ids_mp.SetItem( ll_rec, 'co_matriz', RIGHT( '000000' + String(ll_co_color_mp), 6) )
	ids_mp.SetItem( ll_rec, 'centro_sap', is_co_centro_sap )
	ids_mp.SetItem( ll_rec, 'almacen_sap', is_co_almacen_sap )
Next
	
If This.Of_Cargar_STD_Conos_SIS() < 0 Then
	li_retorno = -1
Else
	If is_msn_error <> '' Then
		ls_msn_error_std = is_msn_error
		is_msn_error = ''
	End If
	li_retorno = 1
End If
	
If li_retorno > 0 Then
	If This.Of_Cargar_Stock_Disponible() < 0 Then 
		li_retorno = -2
	Else
		// Realizar el cambio de estados		
		For ll_pr = 1 To idw_mp_adicional.RowCount()
			ll_co_producto_mp = idw_mp_adicional.GetItemNumber( ll_pr, 'co_producto_mp' )
			ll_co_color_mp = idw_mp_adicional.GetItemNumber( ll_pr, 'co_color_mp' )			
			ll_conos = idw_mp_adicional.GetItemNumber( ll_pr, 'nu_conos' )
			ldc_ca_reserva_mp = idw_mp_adicional.GetItemDecimal( ll_pr, 'ca_gramos_reserva' )
		
//			If ll_co_producto_mp = ll_co_producto_mp_log And ll_co_color_mp = ll_co_color_mp_log Then
//				ll_co_producto_mp = ll_co_producto_mp_log 
//			End If
		
			ls_find_std = 'co_centro = "' + is_co_centro_sap + '" And co_material = "' + String( ll_co_producto_mp ) + '"' &
				+ ' AND co_matriz = "' + String( ll_co_color_mp, '000000' ) + '"'
		
			ll_rstd = ids_peso_std_cono.Find( ls_find_std, 1, ids_peso_std_cono.RowCount() )
			
			If ll_rstd > 0 Then
				ldc_std_cono = ids_peso_std_cono.GetItemDecimal( ll_rstd, 'ca_gramosumb' )
				ldc_kardex_requerido = ll_conos * ldc_std_cono
			ElseIf ll_rstd = 0 Then
				lb_puede_reservar = False
				If ls_sin_std <> '' Then ls_sin_std += '~r~n'
				ls_sin_std += String(ll_co_producto_mp) + '~t~t' + String(ll_co_color_mp) &
					+ '~t' + String( ll_agrupa_orden ) + '~t~t'
				
				
				ldc_kardex_requerido = 1
			Else
				If IsNull( ls_find_std ) Then ls_find_std = 'NULL'
				Post MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'Ocurrio un error en el Find de peso std:~r~n' + ls_find_std )
				
				Return -1
			End If
		
			ls_find_kx = 'co_producto = ' + String( ll_co_producto_mp ) + ' AND co_color = ' + String( ll_co_color_mp )
			
			ll_rkx = ids_kx_mp.Find( ls_find_kx, 1, ids_kx_mp.RowCount() )
			If ll_rkx > 0 Then
				ldc_inventario_disponible = ids_kx_mp.GetItemDecimal( ll_rkx, 'kardex' ) - ids_kx_mp.GetItemDecimal( ll_rkx, 'kardex_reservado' )
			Else
				ldc_inventario_disponible = 0
			End If
			lb_puede_reservar = True
			// Si no se actualiza la cantidad se deja el valor actual
			If Not ab_act_ca_reserva Or ldc_ca_reserva_mp > 0 Then
				// no se toca la cantidad reservada
			// Si no hay suficiente inventario
			ElseIf ldc_kardex_requerido > ldc_inventario_disponible Then				
				// Si hay menos de la mitad del estandar de conos no se puede reservar
				If ll_conos*ldc_std_cono/2 > ldc_inventario_disponible Then
					lb_puede_reservar = False
					ldc_ca_reserva_mp = 0
				Else
					ldc_ca_reserva_mp = ldc_inventario_disponible
				End If				
			Else
				ldc_ca_reserva_mp = ldc_kardex_requerido
			End If
		
			idw_mp_adicional.SetItem( ll_pr, 'co_reserva_sap'		,  1  )
			idw_mp_adicional.SetItem( ll_pr, 'cs_item'				,  ll_pr  ) // se asigna el consecutivo
			// Se llena los datos del centro-almacen para realizar la reserva
			idw_mp_adicional.SetItem( ll_pr, 'co_centro_sap', is_co_centro_sap )
			idw_mp_adicional.SetItem( ll_pr, 'co_almacen_sap', is_co_almacen_sap )
			idw_mp_adicional.SetItem( ll_pr, 'co_almacen_receptor', is_almacen_recptor )
	
			idw_mp_adicional.SetItem( ll_pr, 'nu_orden_agrupada'	, il_orden_adicional  )
			idw_mp_adicional.SetItem( ll_pr, 'peso_mp_estandar'	, ldc_std_cono  )
			idw_mp_adicional.SetItem( ll_pr, 'ca_gramos_necesidad', ldc_kardex_requerido  )
			idw_mp_adicional.SetItem( ll_pr, 'ca_gramos_reserva'	, ldc_ca_reserva_mp  )
			idw_mp_adicional.SetItem( ll_pr, 'inventario_disponible', ldc_inventario_disponible )
		Next
		
		li_retorno = 1
	End If
End If

idw_mp_adicional.SetReDraw( True )
This.of_SetMicroHelp('')

idw_mp_adicional.SetFilter('')
idw_mp_adicional.Filter()

If ls_msn_error_std <> '' Then
	MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', ls_msn_error_std, Information! )	
End If

// Se obtiene el consecutivo adicional
ll_pedido_adicional = idw_mp_adicional.GetItemNumber( 1, 'cs_adicional' )
// si no tiene Pedido Adicional
If IsNull( ll_pedido_adicional ) Or ll_pedido_adicional = 0 Then
	// Se obtiene el consecutivo de Pedido Adicional.
	ll_pedido_adicional = n_cst_application.of_Consecutive( n_cst_application.ii_fabrica, 110, n_cst_application.itr_appl)
	If ll_pedido_adicional<=0 Then
		ll_pedido_adicional=0
		MessageBox("Advertencia!","No se pudo determinar el consecutivo de Pedido Adicional",StopSign!)
		Return -1
	Else
		// Se guarda el consecutivo
		COMMIT Using n_cst_application.itr_appl;
	End If
End If

// se asigna el consecutivo a todos los registros
For ll_rec = 1 To idw_mp_adicional.RowCount()
	idw_mp_adicional.SetItem( ll_rec, 'cs_adicional', ll_pedido_adicional )
	idw_mp_adicional.SetItem( ll_rec, 'cs_item', ll_rec )
Next		



Return li_retorno
end function

public function integer of_producto_alta_rotacion (long al_co_producto_mp, long al_co_color_mp);/*
	FACL - 2018/02/27 - SA58161 - Determina si un producto es de alta rotacion.
*/


Integer li_retorno
Long ll_rfind
String ls_find

If ids_prod_alta_rotacion.RowCount() = 0 Then
	This.Of_Cargar_Productos_Alta_Rotacion()
End If

li_retorno = 0
ls_find = 'co_producto_mp = ' + String( al_co_producto_mp )	+ ' AND co_color_mp = ' + String(  al_co_color_mp )

ll_rfind = ids_prod_alta_rotacion.Find( ls_find, 1, ids_prod_alta_rotacion.RowCount() )
If ll_rfind > 0 Then
	If ids_prod_alta_rotacion.GetItemNumber( ll_rfind, 'sw_alta_rotacion' ) = 1 Then
		li_retorno = 1
	End If
End If

Return li_retorno

end function

public function integer of_validar_reserva_fijo (string as_campo, long al_row, string as_dato, u_dw_application adw_mp_x_reserva);Long ll_rfij
String ls_find
Decimal ldc_dato_anterior

If Not IsValid( ids_mp_x_reserva_fijo) Then
	ids_mp_x_reserva_fijo = Create n_ds_application
	ids_mp_x_reserva_fijo.Of_Load( ids_mp_x_reserva.DataObject )	
End If


//      nu_conos  nu_conos_fijo  ca_gramos_fijo  ca_gramos_necesidad 
ls_find = 'nu_orden_agrupada = ' + String(adw_mp_x_reserva.GetItemNumber( al_row, 'nu_orden_agrupada' ) ) &
	+ ' and co_producto_mp = ' + String(adw_mp_x_reserva.GetItemNumber( al_row, 'co_producto_mp' ) ) &
	+ ' and co_color_mp = ' +String( adw_mp_x_reserva.GetItemNumber( al_row, 'co_color_mp' ) )

ll_rfij = ids_mp_x_reserva_fijo.Find( ls_find, 1, ids_mp_x_reserva_fijo.RowCount() )
If ll_rfij > 0 Then
	//adw_mp_x_reserva
	
End If





Return 1
end function

public function integer of_act_reserva_fijo (u_dw_application adw_mp_x_reserva);/*
	 FACL - 2019/10/11 - SA60054 - Se almacena la reserva fija
*/

Long ll_rfij
String ls_filtro, ls_filtro_fj
Decimal ldc_dato_anterior

If adw_mp_x_reserva.AcceptText() <> 1 Then Return -1
	

// nu_orden_agrupada co_producto_mp co_color_mp
//      nu_conos  nu_conos_fijo  ca_gramos_fijo  ca_gramos_necesidad

// Se descarta la informacion que hay fija para la orden agrupada
ls_filtro_fj = 'nu_orden_agrupada = ' + String(adw_mp_x_reserva.GetItemNumber( 1, 'nu_orden_agrupada' ) ) 
ids_mp_x_reserva_fijo.SetFilter( ls_filtro_fj )
ids_mp_x_reserva_fijo.Filter()
If ids_mp_x_reserva_fijo.RowCount() > 0 Then
	ids_mp_x_reserva_fijo.RowsDiscard( 1, ids_mp_x_reserva_fijo.RowCount(), Primary! )
End If


ls_filtro = ls_filtro_fj + ' And (nu_conos_fijo >=0 Or ca_gramos_fijo >=0)'
adw_mp_x_reserva.SetFilter( ls_filtro )
adw_mp_x_reserva.Filter()

If adw_mp_x_reserva.RowCount() >0 Then
	adw_mp_x_reserva.RowsCopy( 1, adw_mp_x_reserva.RowCount(), Primary!, ids_mp_x_reserva_fijo, 1, Primary! )
End If

adw_mp_x_reserva.SetFilter( ls_filtro_fj )
adw_mp_x_reserva.Filter()

Return 1
end function

on n_cst_reserva_mp_orden.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_reserva_mp_orden.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;/*
	FACL - 2017/10/13 - SA57405 - Se destruyen los objetos y se desconecta de las bases de datos
*/

Destroy ids_ordenes

Destroy ids_mp_x_reserva_ord
Destroy ids_mp_x_reserva

Destroy ids_mp
Destroy ids_kx_mp
Destroy ids_kx_otros_alm
Destroy ids_peso_std_cono
Destroy ids_prod_alta_rotacion

Destroy ids_mp_reserva_ord
Destroy ids_mp_reserva_agrupa

// Se termina la conexion a DB2
If IsValid( itr_Ordenesdb2 ) Then
	itr_Ordenesdb2.of_DisconnectTransaccionalDB2()
	Destroy itr_Ordenesdb2
End If

If IsValid( itr_sqlserver ) Then
	Disconnect Using itr_sqlserver;
	Destroy itr_sqlserver
End If

Return 1
end event

event constructor;/*
	FACL - 2017/10/13 - SA57405 - Se crea objeto para administrar la reserva de materia prima para control tecnico
*/

// ids_mp_x_reserva_ord, ids_mp_x_reserva, ids_mp_reserva_agrupa, &
//	ids_kx_mp, ids_mp, ids_peso_std_cono

If Handle( GetApplication() ) = 0 Then
	ib_guardar_log = True
End If
// se instancia el ds para la mp x reservar
ids_mp_x_reserva = CREATE n_ds_application
ids_mp_x_reserva.of_Load( 'd_gr_dt_mu_ord_reserva_agrupada' )
ids_mp_x_reserva.of_Conexion( n_cst_application.itr_appl, True )


// se instancia el ds para la mp reservada
ids_mp_reserva_agrupa = CREATE n_ds_application
ids_mp_reserva_agrupa.of_Load( 'd_gr_dt_mu_ord_reserva_agrupada' )
ids_mp_reserva_agrupa.of_Conexion( n_cst_application.itr_appl, True )

// se instancia el ds para datos fijos ingresados por el usuario
ids_mp_x_reserva_fijo = Create n_ds_application
ids_mp_x_reserva_fijo.Of_Load( ids_mp_x_reserva.DataObject )	


// detalle de la MP x Orden Reservado
ids_mp_reserva_ord = CREATE n_ds_application
ids_mp_reserva_ord.of_Load( 'd_gr_dt_mu_ord_reserva' )
ids_mp_reserva_ord.of_Conexion( n_cst_application.itr_appl, True )


ids_prod_alta_rotacion = CREATE n_ds_application
ids_prod_alta_rotacion.of_Load( 'd_gr_dt_producto_alta_rotacion' )
ids_prod_alta_rotacion.of_Conexion( n_cst_application.itr_appl, True )





Return 1
	
end event

