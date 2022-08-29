HA$PBExportHeader$n_cst_rfc_reserva_sap.sru
forward
global type n_cst_rfc_reserva_sap from nonvisualobject
end type
end forward

global type n_cst_rfc_reserva_sap from nonvisualobject
end type
global n_cst_rfc_reserva_sap n_cst_rfc_reserva_sap

type variables
// Parametros de Entrada Stock
Constant Integer MATNR = 1
Constant Integer J_3ASIZ = 2
Constant Integer WERKS = 3
Constant Integer LGORT = 4

// Parametros de Salida Stock
Constant Integer MATNR_S = 1
Constant Integer J_3ASIZ_S = 2
Constant Integer VMENG = 3
Constant Integer CONOS = 4



// Parametros Entrada Reserva MP: T_SIS			
Constant Integer WERKS_ER = 1	// CHAR	4	Centro
Constant Integer UMLGO_ER = 2	// CHAR	4	Almac$$HEX1$$e900$$ENDHEX$$n receptor/emisor
Constant Integer LGORD_ER = 3	// CHAR	4	Almac$$HEX1$$e900$$ENDHEX$$n
Constant Integer RSPOS_ER = 4	//NUMC	4	N$$HEX1$$fa00$$ENDHEX$$mero de posici$$HEX1$$f300$$ENDHEX$$n de reserva/necesidades secundarias
Constant Integer MATNR_ER = 5	//CHAR	18	N$$HEX1$$fa00$$ENDHEX$$mero de material
Constant Integer J_3ASIZ_ER = 6	//CHAR	8	Valor matriz
Constant Integer VEMNG_ER = 7	//QUAN	13	Cantidad en unidad de medida de entrada
// FACL - S4H_F1  - 2021/02/18 - Modificacion RFC Reserva para S4Hana
Constant Integer MEINS_ER = 8	//CHAR 3	13	Unidad de medida base

Constant Integer CONO_ER = 9	//CHAR	12	Destinatario de mercanc$$HEX1$$ed00$$ENDHEX$$as
Constant Integer AUFNR_ER = 10	//NUMC	8	N$$HEX1$$fa00$$ENDHEX$$mero de la orden
Constant Integer ZZMAQUINA_ER = 11	//CHAR	10	Maquina Modificaci$$HEX1$$f300$$ENDHEX$$N
Constant Integer SALON_ER = 12	//CHAR	2	Salon
Constant Integer PASIL_ER = 13	//CHAR	2	Pasillo
Constant Integer PARQU_ER = 14	//CHAR	8	Parqueadero
Constant Integer CS_ORDEN_ER = 15	//NUMC	11	Consecutivo
// FACL - S4H_F1  - 2021/02/18 - Modificacion RFC Reserva para S4Hana
Constant Integer INDICADOR_FIN_ER=16	//CHAR	1	Indicador finalizaci$$HEX1$$f300$$ENDHEX$$n
Constant Integer TIPO_PROCESO_ER=17	//CHAR	1	Tipo Proceso
Constant Integer RSNUM_ER = 18			//NUMC	10	N$$HEX1$$fa00$$ENDHEX$$mero de la reserva/las necesidades secundarias

Constant Integer TIPO_PARCIAL = 19 //CHAR	1	Tipo de reserva (0=Un solo parcial / 1=Varios parciales)

// Parametros Entrada Reserva MP: T_SALIDA
Constant Integer TIPO_RETORNO_SR = 1 //	CHAR	1	(S) Satisfactorio (E) Error
Constant Integer RSNUM_SR = 2 //	NUMC	10	N$$HEX1$$fa00$$ENDHEX$$mero de la reserva/las necesidades secundarias
Constant Integer ZZMAQUINA_SR = 3 //	CHAR	10	Maquina Modificaci$$HEX1$$f300$$ENDHEX$$N
Constant Integer AUFNR_SR = 4 //	NUMC	8	N$$HEX1$$fa00$$ENDHEX$$mero de la orden
Constant Integer TEXTO_ERR_SR = 5 //	CHAR	60	Campo texto con longitud 60
Constant Integer CS_ORDEN_SR = 6 //	NUMC	11	Consecutivo

Long il_co_maquina_reserva = 0


Constant Integer MANDT = 1 // Mandante
Constant Integer RES_ITEM = 2 // N$$HEX1$$fa00$$ENDHEX$$mero de posici$$HEX1$$f300$$ENDHEX$$n de reserva/necesidades secundarias
Constant Integer WITHDRAWN = 3 // Salida final de la reserva

String is_msn_error = '' // Mensaje de error SAP
end variables

forward prototypes
public function integer of_leer_table_stock_disponible (oleobject aole_tabla_ret, ref datastore ads_kardex)
public function integer of_llenar_table_stock_disponible (oleobject aole_tabla, ref datastore ads_parametro)
public function integer of_ejecutar_rfc_stock_disponible (datastore ads_parm_stock, ref datastore ads_ret_stock)
public function integer of_ejecutar_rfc_reserva_mp (datastore ads_parm_stock, ref datastore ads_ret_stock)
public function integer of_llenar_table_reserva_mp (oleobject aole_tabla, ref datastore ads_parametro)
public function integer of_leer_table_reserva_mp (oleobject aole_tabla_ret, ref datastore ads_ret_reserva_mp)
public function integer of_ejecutar_rfc_cerrar_reserva_mp_afs (datastore ads_parm_reserva)
public function integer of_llenar_table_cerrar_reserva_mp_afs (oleobject aole_tabla, ref datastore ads_parametro)
public function integer of_llenar_table_cerrar_reserva_mp (oleobject aole_tabla, ref datastore ads_parametro)
public function integer of_ejecutar_rfc_cerrar_reserva_mp (datastore ads_parm_stock)
end prototypes

public function integer of_leer_table_stock_disponible (oleobject aole_tabla_ret, ref datastore ads_kardex);/*
	FACL - 2017/10/13 - SA57405 - Lee la tabla retornada por la RFC del Stock Disponible
*/

Long ll_filas, ll_fila, ll_row

ll_filas   = aole_tabla_ret.RowCount
FOR ll_fila = 1 to ll_filas
	ll_row = ads_kardex.InsertRow( 0 )
	
	ads_kardex.SetItem( ll_row, 'co_material_sap', aole_tabla_ret.Value( ll_fila, MATNR_S) )
	ads_kardex.SetItem( ll_row, 'co_matriz',	aole_tabla_ret.Value( ll_fila, J_3ASIZ_S) )
	ads_kardex.SetItem( ll_row, 'co_producto', Long(aole_tabla_ret.Value( ll_fila, MATNR_S)) )
	ads_kardex.SetItem( ll_row, 'co_color',	Long( aole_tabla_ret.Value( ll_fila, J_3ASIZ_S)) )
	ads_kardex.SetItem( ll_row, 'kardex',		Dec(aole_tabla_ret.Value( ll_fila, VMENG)) )
	ads_kardex.SetItem( ll_row, 'conos',		aole_tabla_ret.Value( ll_fila, CONOS) )

NEXT	


Return 1
end function

public function integer of_llenar_table_stock_disponible (oleobject aole_tabla, ref datastore ads_parametro);/*
	FACL - 2017/10/13 - SA57405 - Se llena la tabla de parametro para llamar a la RFC del Stock Disponible
*/

Long ll_fila, ll_pr
Integer li_retorno

Try
	For ll_pr = 1 To ads_parametro.RowCount()
		aole_tabla.Rows.Add 
		ll_fila ++
			
		aole_tabla.value[ll_fila, MATNR]	= RIGHT( '00000000000000000000' + Trim( ads_parametro.GetItemString( ll_pr, 'co_material_sap' ) ), 18 )  // Material
		aole_tabla.value[ll_fila, J_3ASIZ]	= RIGHT( '000000' + Trim(ads_parametro.GetItemString( ll_pr, 'co_matriz' )), 6 )		// Color
		aole_tabla.value[ll_fila, WERKS]	= Trim( ads_parametro.GetItemString( ll_pr, 'centro_sap' ) )			// Centro
		aole_tabla.value[ll_fila, LGORT]	= Trim( ads_parametro.GetItemString( ll_pr, 'almacen_sap' )	)		// Almacen
		
		
	Next
	li_retorno = 1
Catch( RunTimeError er )
	MessageBox( 'Error', String(er.Number) + " " + "Ocurrio al llenar los parametros del stock~r~n"+er.Text)
	li_retorno = -1
End Try

Return li_retorno
end function

public function integer of_ejecutar_rfc_stock_disponible (datastore ads_parm_stock, ref datastore ads_ret_stock);/*
	FACL - 2017/10/13 - SA57405 - Se invoca la RFC para consultar el stock disponible de los productos parametros
*/

Integer	li_retorno
Long		ll_filas, ll_fila, li_cantidad_tables, ll_row
boolean	lb_function
String	ls_type_error, ls_msn

OleObject		lole_tabla, lole_tabla_ret, lole_Funcion
n_cst_rfc_sap	lnvo_rfc


lnvo_rfc = Create n_cst_rfc_sap
// se cargan los parametros de conexion
If lnvo_rfc.of_Leer_Configuracion_Conexion() < 1  Then
	Destroy lnvo_rfc
	Return -1
End If
// se conecta con SAP
If lnvo_rfc.Of_Conectar_Sap() < 0 Then
	Destroy lnvo_rfc
	Return -1
End If
// se asocia el ole con la rfc de la solped
If lnvo_rfc.of_asociar_funcion_sap( 'Z_WM_STOCK_DISPONIBLE', lole_Funcion ) < 0 Then
	lnvo_rfc.Of_Desconectar_SAP()
	Destroy lnvo_rfc
	Return -1
End If

// La propiedad Tables en la posicion 2 recibe los parametros de ejecucion
lole_tabla  = lole_Funcion.tables('T_ENT_STOCK')
li_cantidad_tables = lole_Funcion.tables.Count
// se realiza el llenado del parametro table
li_retorno = This.Of_LLenar_Table_Stock_Disponible( lole_tabla, ads_parm_stock )

If li_retorno < 0 Then
	lnvo_rfc.Of_Desconectar_SAP()
	Destroy lnvo_rfc
	Return -1
End If

// Llama la RFC
lb_function = lole_Funcion.Call

// El resultado de la RFC es cargado en la propiedad Tables, posicion 1...
li_cantidad_tables = lole_Funcion.tables.Count

// En condiciones normales retorna 2 estructuras, como m$$HEX1$$ed00$$ENDHEX$$nimo una, de lo
// contrario es un error.
IF li_cantidad_tables < 1 THEN 
	ROLLBACK USING n_cst_application.itr_appl;
	MessageBox('Atencion','Ocurri$$HEX2$$f3002000$$ENDHEX$$un error inesperado al invocar la RFC Z_WM_STOCK_DISPONIBLE!')
	lnvo_rfc.Of_Desconectar_SAP()
	Destroy lnvo_rfc
	RETURN -1
END IF

IF li_cantidad_tables >= 1 THEN
	lole_tabla_ret = lole_Funcion.tables('T_SAL_STOCK')
	This.Of_Leer_Table_Stock_Disponible( lole_tabla_ret, ads_ret_stock )
End IF

/*
IF li_cantidad_tables >= 1 THEN
   lole_tabla_ret = lole_Funcion.tables(1)
	ll_filas   = lole_tabla_ret.RowCount
	FOR ll_fila = 1 to ll_filas
		ls_type_error = lole_tabla_ret.Value( ll_fila, 1)

		If Trim(ls_type_error) <> 'S' Then
			ls_msn = lole_tabla_ret.Value( ll_fila, 4)
			ll_row= lole_tabla_ret.Value( ll_fila, 12)
			ROLLBACK USING n_cst_application.itr_appl;
			MessageBox( 'Atencion', ls_msn + '. ' + ls_type_error + ' Linea ' + String(ll_row) )
			li_retorno = -1
			lnvo_rfc.Of_Desconectar_SAP()
			Destroy lnvo_rfc
			REturn -1
		End If
	NEXT	
END IF
*/

// se desconecta la transaccion
If lnvo_rfc.Of_Desconectar_SAP() < 0 Then
	Destroy lnvo_rfc
	Return -1
End If

Destroy lnvo_rfc

Return 1

end function

public function integer of_ejecutar_rfc_reserva_mp (datastore ads_parm_stock, ref datastore ads_ret_stock);/*
	FACL - 2017/10/19 - SA57405 - Se invoca la RFC para consultar el stock disponible de los productos parametros
*/

Integer	li_retorno
Long		ll_filas, ll_fila, li_cantidad_tables, ll_row
boolean	lb_function
String	ls_type_error, ls_msn

OleObject		lole_tabla, lole_tabla_ret, lole_Funcion
n_cst_rfc_sap	lnvo_rfc


lnvo_rfc = Create n_cst_rfc_sap
// se cargan los parametros de conexion
If lnvo_rfc.of_Leer_Configuracion_Conexion() < 1  Then
	Destroy lnvo_rfc
	Return -1
End If
// se conecta con SAP
If lnvo_rfc.Of_Conectar_Sap() < 0 Then
	Destroy lnvo_rfc
	Return -1
End If
// se asocia el ole con la rfc de la solped
If lnvo_rfc.of_asociar_funcion_sap( 'Z_WM_CREAR_RESERVA_CONOS', lole_Funcion ) < 0 Then
	lnvo_rfc.Of_Desconectar_SAP()
	Destroy lnvo_rfc
	Return -1
End If

// La propiedad Tables en la posicion 2 recibe los parametros de ejecucion
lole_tabla  = lole_Funcion.tables('T_SIS')
li_cantidad_tables = lole_Funcion.tables.Count
// se realiza el llenado del parametro table
li_retorno = This.Of_LLenar_Table_Reserva_MP( lole_tabla, ads_parm_stock )

If li_retorno < 0 Then
	lnvo_rfc.Of_Desconectar_SAP()
	Destroy lnvo_rfc
	Return -1
End If

// Llama la RFC
lb_function = lole_Funcion.Call

// El resultado de la RFC es cargado en la propiedad Tables, posicion 1...
li_cantidad_tables = lole_Funcion.tables.Count

// En condiciones normales retorna 2 estructuras, como m$$HEX1$$ed00$$ENDHEX$$nimo una, de lo
// contrario es un error.
IF li_cantidad_tables < 1 THEN 
	ROLLBACK USING n_cst_application.itr_appl;
	MessageBox('Atencion','Ocurri$$HEX2$$f3002000$$ENDHEX$$un error inesperado al invocar la RFC Z_WM_CREAR_RESERVA_CONOS!')
	lnvo_rfc.Of_Desconectar_SAP()
	Destroy lnvo_rfc
	RETURN -1
END IF

IF li_cantidad_tables >= 1 THEN
	lole_tabla_ret = lole_Funcion.tables('T_SALIDA')
	This.Of_Leer_Table_Reserva_MP( lole_tabla_ret, ads_ret_stock )
End IF

/*
IF li_cantidad_tables >= 1 THEN
   lole_tabla_ret = lole_Funcion.tables(1)
	ll_filas   = lole_tabla_ret.RowCount
	FOR ll_fila = 1 to ll_filas
		ls_type_error = lole_tabla_ret.Value( ll_fila, 1)

		If Trim(ls_type_error) <> 'S' Then
			ls_msn = lole_tabla_ret.Value( ll_fila, 4)
			ll_row= lole_tabla_ret.Value( ll_fila, 12)
			ROLLBACK USING n_cst_application.itr_appl;
			MessageBox( 'Atencion', ls_msn + '. ' + ls_type_error + ' Linea ' + String(ll_row) )
			li_retorno = -1
			lnvo_rfc.Of_Desconectar_SAP()
			Destroy lnvo_rfc
			REturn -1
		End If
	NEXT	
END IF
*/

// se desconecta la transaccion
If lnvo_rfc.Of_Desconectar_SAP() < 0 Then
	Destroy lnvo_rfc
	Return -1
End If

Destroy lnvo_rfc

Return 1

end function

public function integer of_llenar_table_reserva_mp (oleobject aole_tabla, ref datastore ads_parametro);/*
	FACL - 2017/10/13 - SA57405 - Se llena la tabla de parametro para llamar a la RFC del Stock Disponible
	
WERKS_ER = 1	// CHAR	4	Centro
UMLGO_ER = 2	// CHAR	4	Almac$$HEX1$$e900$$ENDHEX$$n receptor/emisor
LGORD_ER = 3	// CHAR	4	Almac$$HEX1$$e900$$ENDHEX$$n
RSPOS_ER = 4	//NUMC	4	N$$HEX1$$fa00$$ENDHEX$$mero de posici$$HEX1$$f300$$ENDHEX$$n de reserva/necesidades secundarias
MATNR_ER = 5	//CHAR	18	N$$HEX1$$fa00$$ENDHEX$$mero de material
J_3ASIZ_ER = 6	//CHAR	8	Valor matriz
VEMNG_ER = 7	//QUAN	13	Cantidad en unidad de medida de entrada
MEINS_ER = 8	//CHAR 3	13	Unidad de medida base
CONO_ER = 9	//CHAR	12	Destinatario de mercanc$$HEX1$$ed00$$ENDHEX$$as
AUFNR_ER = 10	//NUMC	8	N$$HEX1$$fa00$$ENDHEX$$mero de la orden
ZZMAQUINA_ER = 11	//CHAR	10	Maquina Modificaci$$HEX1$$f300$$ENDHEX$$N
SALON_ER = 12	//CHAR	2	Salon
PASIL_ER = 13	//CHAR	2	Pasillo
PARQU_ER = 14	//CHAR	8	Parqueadero
CS_ORDEN_ER = 15	//NUMC	11	Consecutivo
// FACL - S4H_F1  - 2021/02/18 - Modificacion RFC Reserva para S4Hana
INDICADOR_FIN=16_ER	//CHAR	1	Indicador finalizaci$$HEX1$$f300$$ENDHEX$$n
TIPO_PROCESO_ER=17	//CHAR	1	Tipo Proceso
RSNUM_ER = 18			//NUMC	10	N$$HEX1$$fa00$$ENDHEX$$mero de la reserva/las necesidades secundarias
TIPO_PARCIAL = 19 //CHAR	1	Tipo de reserva (0=Un solo parcial / 1=Varios parciales)
*/

Long ll_fila, ll_pr, ll_pos

For ll_pr = 1 To ads_parametro.RowCount()
	// FACL - 2019/10/15 - SA60054 - Si tiene cs_item >= 1000 es porque no se genera reserva para el producto-color
	If ads_parametro.GetItemNumber( ll_pr, 'cs_item' ) >= 1000 Then Continue	
	
	aole_tabla.Rows.Add 
	ll_fila ++
	// Se obtiene la posicion
	ll_pos = ads_parametro.GetItemNumber( ll_pr, 'cs_item' )
	If IsNull( ll_pos ) Or ll_pos = 0 Then ll_pos = ll_pr
	
//  co_reserva_sap  nu_orden_agrupada  co_producto_mp  co_color_mp  nu_conos  peso_mp_estandar  
// ca_gramos_necesidad  ca_gramos_reserva  inventario_disponible  co_centro_sap  co_almacen_sap  co_almacen_receptor 		
	aole_tabla.value[ll_fila, WERKS_ER]	= Trim( ads_parametro.GetItemString( ll_pr, 'co_centro_sap' ) )  // Centro
	aole_tabla.value[ll_fila, UMLGO_ER]	= Trim( ads_parametro.GetItemString( ll_pr, 'co_almacen_receptor' )	)		// Almac$$HEX1$$e900$$ENDHEX$$n receptor/emisor
	aole_tabla.value[ll_fila, LGORD_ER]	= Trim( ads_parametro.GetItemString( ll_pr, 'co_almacen_sap' )	)		// Almacen
	aole_tabla.value[ll_fila, RSPOS_ER]	= ll_pr		// N$$HEX1$$fa00$$ENDHEX$$mero de posici$$HEX1$$f300$$ENDHEX$$n de reserva/necesidades secundarias
	aole_tabla.value[ll_fila, MATNR_ER]	= String( ads_parametro.GetItemNumber( ll_pr, 'co_producto_mp' ) , Fill('0',18) )  // Material
	aole_tabla.value[ll_fila, J_3ASIZ_ER]	= String( ads_parametro.GetItemNumber( ll_pr, 'co_color_mp' ), '000000' )		// Color
	aole_tabla.value[ll_fila, VEMNG_ER]	= ads_parametro.GetItemDecimal( ll_pr, 'ca_gramos_reserva' ) 			// Cantidad en unidad de medida de entrada
	aole_tabla.value[ll_fila, CONO_ER]	= ads_parametro.GetItemNumber( ll_pr, 'nu_conos' )			// Conos
	
	aole_tabla.value[ll_fila, MEINS_ER]	= 'G'			// Fijo 0
	
	
	// FACL - 2019/10/15 - SAXXX - Si tienes conos y gramos fijo se trabaja con el dato fijo
	If ads_parametro.GetItemNumber( ll_pr, 'nu_conos_fijo' ) >= 0 Then 
		aole_tabla.value[ll_fila, CONO_ER]	= ads_parametro.GetItemNumber( ll_pr, 'nu_conos_fijo' )
	End If
	
	If ads_parametro.GetItemNumber( ll_pr, 'ca_gramos_fijo' ) >= 0 Then 
		aole_tabla.value[ll_fila, VEMNG_ER]	= ads_parametro.GetItemDecimal( ll_pr, 'ca_gramos_fijo' )
	End If
	
	
	aole_tabla.value[ll_fila, AUFNR_ER]	= ads_parametro.GetItemNumber( ll_pr, 'nu_orden_agrupada' ) 			// N$$HEX1$$fa00$$ENDHEX$$mero de la orden
	aole_tabla.value[ll_fila, ZZMAQUINA_ER]	= il_co_maquina_reserva			// Maquina Fijo 0
	aole_tabla.value[ll_fila, SALON_ER]	= 0			// Fijo 0
	aole_tabla.value[ll_fila, PASIL_ER]	= 0			// Fijo 0
	aole_tabla.value[ll_fila, PARQU_ER]	= 0			// Fijo 0
	aole_tabla.value[ll_fila, CS_ORDEN_ER]	= 0			// Fijo 0	
	// FACL - 2021/02/18 - S4H_F2 - Modificacion RFC Reserva para S4Hana
	aole_tabla.value[ll_fila, INDICADOR_FIN_ER]	= '0'			// Fijo 0
	aole_tabla.value[ll_fila, TIPO_PROCESO_ER]	= '1'			// Fijo 0
	aole_tabla.value[ll_fila, RSNUM_ER]	= 0			// Fijo 0	
	
	aole_tabla.value[ll_fila, TIPO_PARCIAL]	= '0'			// FACL - 2018/11/02 - SA59463 - Se agrega parametro TIPO_PARCIAL Fijo 0	
	
Next



Return 1
end function

public function integer of_leer_table_reserva_mp (oleobject aole_tabla_ret, ref datastore ads_ret_reserva_mp);/*
	FACL - 2017/10/13 - SA57405 - Lee la tabla retornada por la RFC de Reserva de MP
	
	FACL  - 2021/02/18 - S4H_F1 - Modificacion RFC Reserva para S4Hana
	
TIPO_RETORNO_SR = 1 //	CHAR	1	(S) Satisfactorio (E) Error
RSNUM_SR = 2 //	NUMC	10	N$$HEX1$$fa00$$ENDHEX$$mero de la reserva/las necesidades secundarias
ZZMAQUINA_SR = 3 //	CHAR	10	Maquina Modificaci$$HEX1$$f300$$ENDHEX$$N
AUFNR_SR = 4 //	NUMC	8	N$$HEX1$$fa00$$ENDHEX$$mero de la orden
TEXTO_ERR_SR = 5 //	CHAR	60	Campo texto con longitud 60
CS_ORDEN_SR = 6 //	NUMC	11	Consecutivo
	
*/

Long ll_filas, ll_fila, ll_row

ll_filas   = aole_tabla_ret.RowCount
FOR ll_fila = 1 to ll_filas
	ll_row = ads_ret_reserva_mp.InsertRow( 0 )
	
	ads_ret_reserva_mp.SetItem( ll_row, 'tipo_retorno', Trim(aole_tabla_ret.Value( ll_fila, TIPO_RETORNO_SR)) )
	ads_ret_reserva_mp.SetItem( ll_row, 'co_reserva_sap', Long(aole_tabla_ret.Value( ll_fila, RSNUM_SR)) )
	ads_ret_reserva_mp.SetItem( ll_row, 'co_maquina',	aole_tabla_ret.Value( ll_fila, ZZMAQUINA_SR) )
	ads_ret_reserva_mp.SetItem( ll_row, 'nu_orden', Long(aole_tabla_ret.Value( ll_fila, AUFNR_SR)) )
	If ads_ret_reserva_mp.GetItemString( ll_row, 'tipo_retorno' )  = 'E' Then
		ads_ret_reserva_mp.SetItem( ll_row, 'msn_error', aole_tabla_ret.Value( ll_fila, TEXTO_ERR_SR) )
	Else
		ads_ret_reserva_mp.SetItem( ll_row, 'msn_error', '' )
	End If
	ads_ret_reserva_mp.SetItem( ll_row, 'cs_orden_sr',	Long( aole_tabla_ret.Value( ll_fila, CS_ORDEN_SR)) )

NEXT	


Return 1
end function

public function integer of_ejecutar_rfc_cerrar_reserva_mp_afs (datastore ads_parm_reserva);/*
	FACL - 2017/10/19 - SA58161 - Se invoca la RFC para consultar el stock disponible de los productos parametros
*/

Integer	li_retorno
Long		ll_filas, ll_fila, li_cantidad_tables, ll_row, ll_co_reserva_sap
boolean	lb_function
String	ls_type_error, ls_msn

OleObject		lole_tabla, lole_tabla_ret, lole_Funcion
n_cst_rfc_sap	lnvo_rfc


lnvo_rfc = Create n_cst_rfc_sap
// se cargan los parametros de conexion
If lnvo_rfc.of_Leer_Configuracion_Conexion() < 1  Then
	Destroy lnvo_rfc
	Return -1
End If
// se conecta con SAP
If lnvo_rfc.Of_Conectar_Sap() < 0 Then
	Destroy lnvo_rfc
	Return -1
End If
// se asocia el ole con la rfc de la solped
If lnvo_rfc.of_asociar_funcion_sap( 'Z_WM_CIERRE_RESERVA', lole_Funcion ) < 0 Then
	lnvo_rfc.Of_Desconectar_SAP()
	Destroy lnvo_rfc
	Return -1
End If
ll_co_reserva_sap = ads_parm_reserva.GetItemNumber( 1, 'co_reserva_sap' )

lole_Funcion.Exports( 'I_RSNUM', ll_co_reserva_sap ) // Numero de la Reserva a Cerrar

// La propiedad Tables en la posicion 2 recibe los parametros de ejecucion
lole_tabla  = lole_Funcion.tables('T_RPOS')
li_cantidad_tables = lole_Funcion.tables.Count
// se realiza el llenado del parametro table con las posiciones a cerrar
li_retorno = This.Of_LLenar_Table_Cerrar_Reserva_MP_AFS( lole_tabla, ads_parm_reserva )

If li_retorno < 0 Then
	lnvo_rfc.Of_Desconectar_SAP()
	Destroy lnvo_rfc
	Return -1
End If

// Llama la RFC
lb_function = lole_Funcion.Call

// El resultado de la RFC es cargado en la propiedad Tables, posicion 1...
li_cantidad_tables = lole_Funcion.tables.Count

// En condiciones normales retorna 2 estructuras, como m$$HEX1$$ed00$$ENDHEX$$nimo una, de lo
// contrario es un error.
IF li_cantidad_tables < 1 THEN 
	ROLLBACK USING n_cst_application.itr_appl;
	MessageBox('Atencion','Ocurri$$HEX2$$f3002000$$ENDHEX$$un error inesperado al invocar la RFC SolPed!')
	lnvo_rfc.Of_Desconectar_SAP()
	Destroy lnvo_rfc
	RETURN -1
END IF

IF li_cantidad_tables >= 1 THEN
   lole_tabla_ret = lole_Funcion.tables('T_RETURN')
	ll_filas   = lole_tabla_ret.RowCount
	FOR ll_fila = 1 to ll_filas
		ls_type_error = lole_tabla_ret.Value( ll_fila, 1)

		If Trim(ls_type_error) <> 'S' Then // Tipo mensaje: S Success, E Error, W Warning, I Info A Abort
			ls_msn = lole_tabla_ret.Value( ll_fila, 4) // Texto de mensaje
			ll_row= lole_tabla_ret.Value( ll_fila, 12)  // L$$HEX1$$ed00$$ENDHEX$$nea en el par$$HEX1$$e100$$ENDHEX$$metro
			ROLLBACK USING n_cst_application.itr_appl;
			is_msn_error = ls_msn + '. ' + ls_type_error + ' Linea ' + String(ll_row) 
			li_retorno = -1
			lnvo_rfc.Of_Desconectar_SAP()
			Destroy lnvo_rfc
			REturn -1
		End If
	NEXT	
END IF


// se desconecta la transaccion
If lnvo_rfc.Of_Desconectar_SAP() < 0 Then
	Destroy lnvo_rfc
	Return -1
End If

Destroy lnvo_rfc

Return 1

end function

public function integer of_llenar_table_cerrar_reserva_mp_afs (oleobject aole_tabla, ref datastore ads_parametro);/*
	FACL - 2018/02/19 - SA58161 - Se llena la tabla de parametro para llamar a la RFC del Stock Disponible
	
T_RPOS
MANDT = 1 // Mandante
RES_ITEM = 2 // N$$HEX1$$fa00$$ENDHEX$$mero de posici$$HEX1$$f300$$ENDHEX$$n de reserva/necesidades secundarias
WITHDRAWN = 3 // Salida final de la reserva
*/

Long ll_fila, ll_pr, ll_pos

For ll_pr = 1 To ads_parametro.RowCount()
	// FACL - 2019/10/15 - SA60054 - Si tiene cs_item >= 1000 es porque no se genera reserva para el producto-color
	If ads_parametro.GetItemNumber( ll_pr, 'cs_item' ) >= 1000 Then Continue	

	aole_tabla.Rows.Add 
	ll_fila ++
	// Se obtiene la posicion
	ll_pos = ads_parametro.GetItemNumber( ll_pr, 'cs_item' )
	If IsNull( ll_pos ) Or ll_pos = 0 Then ll_pos = ll_pr
	
	// aole_tabla.value[ll_fila, MANDT]	= 0  // No se envia
	aole_tabla.value[ll_fila, RES_ITEM]	= ads_parametro.GetItemNumber( ll_pr, 'cs_item' )  // posicion a cerrar
	aole_tabla.value[ll_fila, WITHDRAWN]= 'X'  // Fijo en X
Next



Return 1
end function

public function integer of_llenar_table_cerrar_reserva_mp (oleobject aole_tabla, ref datastore ads_parametro);/*
	FACL - 2021/02/18 - S4H_F2 - Se llena la tabla de parametro para llamar a la RFC de Z_WM_CREAR_RESERVA_CONOS con funcionalidad de cerrar reserva
	
WERKS_ER = 1	// CHAR	4	Centro
UMLGO_ER = 2	// CHAR	4	Almac$$HEX1$$e900$$ENDHEX$$n receptor/emisor
LGORD_ER = 3	// CHAR	4	Almac$$HEX1$$e900$$ENDHEX$$n
RSPOS_ER = 4	//NUMC	4	N$$HEX1$$fa00$$ENDHEX$$mero de posici$$HEX1$$f300$$ENDHEX$$n de reserva/necesidades secundarias
MATNR_ER = 5	//CHAR	18	N$$HEX1$$fa00$$ENDHEX$$mero de material
J_3ASIZ_ER = 6	//CHAR	8	Valor matriz
VEMNG_ER = 7	//QUAN	13	Cantidad en unidad de medida de entrada
MEINS_ER = 8	//CHAR 3	13	Unidad de medida base
CONO_ER = 9	//CHAR	12	Destinatario de mercanc$$HEX1$$ed00$$ENDHEX$$as
AUFNR_ER = 10	//NUMC	8	N$$HEX1$$fa00$$ENDHEX$$mero de la orden
ZZMAQUINA_ER = 11	//CHAR	10	Maquina Modificaci$$HEX1$$f300$$ENDHEX$$N
SALON_ER = 12	//CHAR	2	Salon
PASIL_ER = 13	//CHAR	2	Pasillo
PARQU_ER = 14	//CHAR	8	Parqueadero
CS_ORDEN_ER = 15	//NUMC	11	Consecutivo
INDICADOR_FIN=16_ER	//CHAR	1	Indicador finalizaci$$HEX1$$f300$$ENDHEX$$n
TIPO_PROCESO_ER=17	//CHAR	1	Tipo Proceso
RSNUM_ER = 18			//NUMC	10	N$$HEX1$$fa00$$ENDHEX$$mero de la reserva/las necesidades secundarias
TIPO_PARCIAL = 19 //CHAR	1	Tipo de reserva (0=Un solo parcial / 1=Varios parciales)
*/

Long ll_fila, ll_pr, ll_pos

For ll_pr = 1 To ads_parametro.RowCount()
	// FACL - 2019/10/15 - SA60054 - Si tiene cs_item >= 1000 es porque no se genera reserva para el producto-color
	If ads_parametro.GetItemNumber( ll_pr, 'cs_item' ) >= 1000 Then Continue	
	
	aole_tabla.Rows.Add 
	ll_fila ++
	// Se obtiene la posicion
	ll_pos = ads_parametro.GetItemNumber( ll_pr, 'cs_item' )
	If IsNull( ll_pos ) Or ll_pos = 0 Then ll_pos = ll_pr
	
	aole_tabla.value[ll_fila, RES_ITEM]	= ads_parametro.GetItemNumber( ll_pr, 'cs_item' )  // posicion a cerrar
	// FACL - S4H_F1  - 2021/02/18 - Modificacion RFC Reserva para S4Hana
	aole_tabla.value[ll_fila, INDICADOR_FIN_ER]	= '1'			// Fijo 1
	aole_tabla.value[ll_fila, TIPO_PROCESO_ER]	= '3'			// Fijo 3
	aole_tabla.value[ll_fila, RSNUM_ER]	= ads_parametro.GetItemNumber( ll_pr, 'co_reserva_sap' )
	
Next



Return 1
end function

public function integer of_ejecutar_rfc_cerrar_reserva_mp (datastore ads_parm_stock);/*
	FACL  - 2021/02/18 - S4H_F2 - Se invoca la RFC para cerrar la reserva
*/

Integer	li_retorno
Long		ll_filas, ll_fila, li_cantidad_tables, ll_row, ll_rfind
boolean	lb_function
String	ls_type_error, ls_msn
n_ds_application lds_ret_reserva

OleObject		lole_tabla, lole_tabla_ret, lole_Funcion
n_cst_rfc_sap	lnvo_rfc

lnvo_rfc = Create n_cst_rfc_sap
// se cargan los parametros de conexion
If lnvo_rfc.of_Leer_Configuracion_Conexion() < 1  Then
	Destroy lnvo_rfc
	Return -1
End If
// se conecta con SAP
If lnvo_rfc.Of_Conectar_Sap() < 0 Then
	Destroy lnvo_rfc
	Return -1
End If
// se asocia el ole con la rfc de la solped
If lnvo_rfc.of_asociar_funcion_sap( 'Z_WM_CREAR_RESERVA_CONOS', lole_Funcion ) < 0 Then
	lnvo_rfc.Of_Desconectar_SAP()
	Destroy lnvo_rfc
	Return -1
End If

// La propiedad Tables en la posicion 2 recibe los parametros de ejecucion
lole_tabla  = lole_Funcion.tables('T_SIS')
li_cantidad_tables = lole_Funcion.tables.Count
// se realiza el llenado del parametro table
li_retorno = This.Of_LLenar_Table_Cerrar_Reserva_MP( lole_tabla, ads_parm_stock )

If li_retorno < 0 Then
	lnvo_rfc.Of_Desconectar_SAP()
	Destroy lnvo_rfc
	Return -1
End If

// Llama la RFC
lb_function = lole_Funcion.Call

// El resultado de la RFC es cargado en la propiedad Tables, posicion 1...
li_cantidad_tables = lole_Funcion.tables.Count

// En condiciones normales retorna 2 estructuras, como m$$HEX1$$ed00$$ENDHEX$$nimo una, de lo
// contrario es un error.
IF li_cantidad_tables < 1 THEN 
	ROLLBACK USING n_cst_application.itr_appl;
	MessageBox('Atencion','Ocurri$$HEX2$$f3002000$$ENDHEX$$un error inesperado al invocar la RFC Z_WM_CREAR_RESERVA_CONOS!')
	lnvo_rfc.Of_Desconectar_SAP()
	Destroy lnvo_rfc
	RETURN -1
END IF

IF li_cantidad_tables >= 1 THEN
	lole_tabla_ret = lole_Funcion.tables('T_SALIDA')
	
	lds_ret_reserva = CREATE n_ds_application
	lds_ret_reserva.of_Load('d_gr_ext_ret_rfc_reserva_mp') 

	This.Of_Leer_Table_Reserva_MP( lole_tabla_ret, lds_ret_reserva )
	// Se verifica que no tenga error
	ll_rfind = lds_ret_reserva.Find( 'tipo_retorno <> "S"', 1, lds_ret_reserva.RowCount() )
	If ll_rfind > 0 Then 
		is_msn_error = Trim( lds_ret_reserva.GetItemString( ll_rfind, 'msn_error' ) )
		li_retorno = -1
	Else
		li_retorno = 1
	End If
	Destroy lds_ret_reserva
	 
End IF

/*
IF li_cantidad_tables >= 1 THEN
   lole_tabla_ret = lole_Funcion.tables(1)
	ll_filas   = lole_tabla_ret.RowCount
	FOR ll_fila = 1 to ll_filas
		ls_type_error = lole_tabla_ret.Value( ll_fila, 1)

		If Trim(ls_type_error) <> 'S' Then
			ls_msn = lole_tabla_ret.Value( ll_fila, 4)
			ll_row= lole_tabla_ret.Value( ll_fila, 12)
			ROLLBACK USING n_cst_application.itr_appl;
			MessageBox( 'Atencion', ls_msn + '. ' + ls_type_error + ' Linea ' + String(ll_row) )
			li_retorno = -1
			lnvo_rfc.Of_Desconectar_SAP()
			Destroy lnvo_rfc
			REturn -1
		End If
	NEXT	
END IF
*/

// se desconecta la transaccion
If lnvo_rfc.Of_Desconectar_SAP() < 0 Then
	Destroy lnvo_rfc
	Return -1
End If

Destroy lnvo_rfc

Return li_retorno

end function

on n_cst_rfc_reserva_sap.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_rfc_reserva_sap.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;/*
	FACL - 2017/10/13 - SA57405 - Objeto para consultar el stock disponible y realizar la reserva
*/
end event

