HA$PBExportHeader$w_materiales_a_sap.srw
$PBExportComments$Para el manejo de lo referente a mano de obra, con todos los colores
forward
global type w_materiales_a_sap from w_sheet
end type
type pb_1 from picturebutton within w_materiales_a_sap
end type
type st_muestra from statictext within w_materiales_a_sap
end type
type cbx_todos from checkbox within w_materiales_a_sap
end type
type dw_detalle_lista from datawindow within w_materiales_a_sap
end type
type cb_1 from commandbutton within w_materiales_a_sap
end type
type dw_lista_mat from datawindow within w_materiales_a_sap
end type
type cb_enviar from commandbutton within w_materiales_a_sap
end type
type dw_encabezado from u_dw_application within w_materiales_a_sap
end type
type gb_1 from u_gb_base within w_materiales_a_sap
end type
type gb_2 from groupbox within w_materiales_a_sap
end type
type gb_3 from groupbox within w_materiales_a_sap
end type
end forward

global type w_materiales_a_sap from w_sheet
integer width = 5559
integer height = 5144
string title = "Lista de materiales a Sap"
string menuname = "m_materiales_sap"
boolean maxbox = true
windowstate windowstate = maximized!
event ue_copiar_mp ( )
event ue_borrar_mat_prima ( )
event ue_ficha_tecnica ( )
event ue_copia_parte ( )
event ue_cambio_parte ( )
event ue_copia_todos ( )
event ue_composicion_destruccion ( )
event ue_copia_basico ( )
event ue_borra_mp_color ( )
event ue_copiar_mp_col ( )
event ue_actualiza_composicion_mue ( )
event type integer ue_borrar_color_mp ( )
event ue_guardar_img_excel ( )
pb_1 pb_1
st_muestra st_muestra
cbx_todos cbx_todos
dw_detalle_lista dw_detalle_lista
cb_1 cb_1
dw_lista_mat dw_lista_mat
cb_enviar cb_enviar
dw_encabezado dw_encabezado
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_materiales_a_sap w_materiales_a_sap

type variables
n_cst_c_materiales_sap		inv_matsap
Long 								il_referencia, il_Row, il_talla, il_cabase
DataStore						ids_datos, ids_cabase
Boolean							ib_cambios, ib_find
double 							id_cabase

//str_parametros_sap		istr_info_sap


end variables

forward prototypes
public function long wf_muestrario_vigente (readonly long al_fabrica, readonly long al_linea)
public function long wf_muestrario_referencia (readonly long al_referencia, readonly long al_muestrario)
public subroutine wf_recuperar_lista_materiales ()
public function integer wf_cambiar_estado ()
public function integer wf_actualizar_recurso_cierra (readonly long al_muestra, readonly long al_linea, readonly long al_fabrica)
public function integer wf_actualizar_recurso_nocierra (readonly long al_muestra, readonly long al_linea, readonly long al_fabrica)
public function string wf_parametros (readonly long al_fabrica, readonly long al_linea, readonly string as_constante)
public function string wf_generar_log_errores (readonly string as_error)
public subroutine wf_proceso ()
public function integer wf_llenado_sap (readonly long al_proceso, ref str_parametros_sap astr_info_sap)
end prototypes

event ue_guardar_img_excel();String  ls_file,ls_path
Integer li_value
datawindow ls_dw

IF dw_detalle_lista.rowcount( ) = 0 Then Return

li_value = GetFileSaveName("Guardar como...", &
                           ls_path,ls_file,"XLS",&
									"Excel (*.XLS), *.XLS,"+&
									"Excel (*.PDF), *.PDF,"+&									
									"Excel (*.XML), *.XML,"+&																		
									"Excel (*.XML), *.XML,"+&																											
									"Texto (*.HTML), *.HTML")
If li_value = 1 Then
	if Upper(Right(Trim(ls_path),3)) = "XLS"	Then	
		dw_detalle_lista.SaveAs(ls_path,Excel!,True)
		/* FACL - 2018/08/21 - Libreria dw_xls no compatible con 2017*/
		/* FACL - 2019/10/22 - Libreria dw_xls no compatible con 2019*/
		ls_dw = dw_detalle_lista				
		//uf_save_dw_as_excel(ls_dw, ls_path)
	End If	
End If	
end event

public function long wf_muestrario_vigente (readonly long al_fabrica, readonly long al_linea);//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	wf_muestrario_vigente (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	recuperar el muestrario vigente
//-------------------------------------------------------------------------
// ARGUMENTO:	readonly long al_fabrica, readonly long al_linea 
// RETORNO	:	long
//=========================================================================

Long ll_dato


 SELECT m_muestrarios.co_muestrario  
    INTO :ll_dato  
    FROM m_muestrarios  
   WHERE ( m_muestrarios.co_fabrica = :al_fabrica ) 
	AND   ( m_muestrarios.co_linea = :al_linea ) 
	ORDER BY co_muestrario DESC
   USING n_cst_application.itr_appl;

IF n_cst_application.itr_appl.sqldbcode=-1 THEN
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	RETURN -1
END IF

IF n_cst_application.itr_appl.sqldbcode=100 THEN
	RETURN -1
END IF


RETURN ll_dato
end function

public function long wf_muestrario_referencia (readonly long al_referencia, readonly long al_muestrario);//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	wf_muestrario_referencia (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	muestrario para la referencia si existe o no
//-------------------------------------------------------------------------
// ARGUMENTO:	readonly long al_referencia, readonly long al_muestrario 
// RETORNO	:	long
//=========================================================================

Long ll_dato

SELECT count(co_muestrario) 
INTO :ll_dato
FROM dt_muestras_ref re, h_fmp_muestras mu
WHERE co_referencia_ref = :al_referencia
AND re.co_fabrica = mu.co_fabrica 
AND re.co_linea = mu.co_linea 
AND re.co_muestra = mu.co_muestra 
AND mu.co_muestrario = :al_muestrario
USING n_cst_application.itr_appl;	

IF n_cst_application.itr_appl.sqldbcode=-1 THEN
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	RETURN -1
END IF

IF n_cst_application.itr_appl.sqldbcode=100 THEN
	RETURN -1
END IF


RETURN ll_dato
end function

public subroutine wf_recuperar_lista_materiales ();//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	wf_recuperar_lista_materiales (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	recuperar la lista de los materiales para mostrarlos en w
//-------------------------------------------------------------------------
// ARGUMENTO:	(none)
// RETORNO	:	(none)
//=========================================================================


long ll_null, ll_referencia, ll_talla, ll_color, ll_muestrario

setnull(ll_null)

dw_Lista_mat.reset()

ll_referencia = dw_encabezado.Object.referencia[1]
ll_talla = dw_encabezado.Object.talla[1]
ll_color = dw_encabezado.Object.color[1]
ll_muestrario = Long(dw_encabezado.Object.muestrario[1])

inv_matsap.of_lista_materiales(ll_referencia, ll_talla, ll_color, ll_muestrario)

ids_datos = inv_matsap.of_get_ids_datos()


ids_datos.rowscopy( 1, ids_datos.rowcount( ) ,Primary!, dw_Lista_mat, 1, Primary!)
end subroutine

public function integer wf_cambiar_estado ();//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	wf_cambiar_estado (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	se selecciona cual recurso se va a actualizar el estado si el que 
//					cierra o el que no cierra para que quede con estado de enviado
//-------------------------------------------------------------------------
// ARGUMENTO:	(none)
// RETORNO	:	integer
//=========================================================================

Long ll_filas, ll_fila, ll_muestra, ll_fabrica, ll_linea


ll_filas = dw_lista_mat.rowcount( )

FOR ll_fila = 1 TO ll_filas 
	IF dw_lista_mat.object.enviado[ll_fila] = '1' THEN
		
		ll_muestra = dw_lista_mat.Object.co_muestra[ll_fila]
		ll_fabrica = dw_lista_mat.Object.co_fabrica[ll_fila]
		ll_linea = dw_lista_mat.Object.co_linea[ll_fila]
		
		IF dw_lista_mat.object.reccierra[ll_fila] = '1' THEN
			wf_actualizar_recurso_cierra(ll_muestra,ll_linea, ll_fabrica)
		ELSE
			wf_actualizar_recurso_nocierra(ll_muestra,ll_linea, ll_fabrica	)		
		END  IF		
	END IF
NEXT

RETURN 1 

end function

public function integer wf_actualizar_recurso_cierra (readonly long al_muestra, readonly long al_linea, readonly long al_fabrica);//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	wf_actualizar_recurso_cierra (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	se actualiza el estado en el recurso que cierra para que quede como enviado 
//-------------------------------------------------------------------------
// ARGUMENTO:	readonly long al_muestra, readonly long al_linea, readonly long al_fabrica 
// RETORNO	:	integer
//=========================================================================


UPDATE DT_MUESTRAS 
SET CO_ESTRECCIERRA = 2
WHERE CO_MUESTRA=:al_muestra
AND CO_LINEA =:al_linea
AND CO_FABRICA =:al_fabrica
USING n_cst_application.itr_appl;

IF n_cst_application.itr_appl.SQLcode=-1 THEN 
	ROLLBACK using n_cst_application.itr_appl;
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	RETURN -1
END IF

RETURN 1
end function

public function integer wf_actualizar_recurso_nocierra (readonly long al_muestra, readonly long al_linea, readonly long al_fabrica);//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	wf_actualizar_recurso_nocierra (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	se actualiza el estado en el recurso que no cierra para que quede como enviado 
//-------------------------------------------------------------------------
// ARGUMENTO:	readonly long al_muestra, readonly long al_linea, readonly long al_fabrica 
// RETORNO	:	integer
//=========================================================================


UPDATE DT_MUESTRAS 
SET CO_ESTRECNOCIERRA = 2
WHERE CO_MUESTRA=:al_muestra
AND CO_LINEA =:al_linea
AND CO_FABRICA =:al_fabrica
USING n_cst_application.itr_appl;

IF n_cst_application.itr_appl.SQLcode=-1 THEN 
	ROLLBACK using n_cst_application.itr_appl;
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	RETURN -1
END IF

COMMIT using n_cst_application.itr_appl;

RETURN 1
end function

public function string wf_parametros (readonly long al_fabrica, readonly long al_linea, readonly string as_constante);//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	wf_parametros (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	recuperacion de los parametros de configuracion de la aplicacion
//					de la tabla m_variables_config recuperados por fabrica Linea 
//-------------------------------------------------------------------------
// ARGUMENTO:	readonly long al_fabrica, readonly long al_linea, readonly string as_constante 
// RETORNO	:	string
//=========================================================================

n_cst_parametros_config			lnv_parametros
lnv_parametros = CREATE n_cst_parametros_config

IF lnv_parametros.of_recuperar_parametro_config( al_fabrica, al_linea,as_constante ) = -1 THEN
	RETURN '-1'
END IF

RETURN lnv_parametros.of_get_codigo()
end function

public function string wf_generar_log_errores (readonly string as_error);//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	wf_generar_log_errores (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	generar archivo al finalizar el proceso con el error que arroja SAP
//-------------------------------------------------------------------------
// ARGUMENTO:	readonly string as_error 
// RETORNO	:	string
//=========================================================================


Integer li_FileNum, ll_pos
string ls_nombre

ls_nombre = 'LOG '+String(dateTime(Date(today()),Time(Now())))+'.txt'

ll_pos = Pos ( ls_nombre, '/', 1 )

DO WHILE ll_pos > 0
	ls_nombre = Replace(ls_nombre, ll_pos, 1, "")
	ll_pos = Pos ( ls_nombre, '/', 1 )
LOOP

ll_pos = Pos ( ls_nombre, ':', 1 )

DO WHILE ll_pos > 0
	ls_nombre = Replace(ls_nombre, ll_pos, 1, "")
	ll_pos = Pos ( ls_nombre, ':', 1 )
LOOP

ls_nombre = GetCurrentDirectory( )+'\'+ls_nombre
li_FileNum = FileOpen( ls_nombre, StreamMode!, Write!, LockWrite!, Replace!)

FileWrite ( li_FileNum, as_error )
FileClose(li_FileNum)

Return ls_nombre
end function

public subroutine wf_proceso ();//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	wf_proceso (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	llenado y envio de la informacion a SAP
//-------------------------------------------------------------------------
// ARGUMENTO:	(none)
// RETORNO	:	(none)
//=========================================================================
Long ll_retorno 
String ls_error, ls_ruta
n_cst_llamado_sap		inv_sap
inv_sap = CREATE n_cst_llamado_sap

str_parametros_sap		lstr_info_sap

IF wf_llenado_sap(1, lstr_info_sap) = -1 THEN RETURN

ll_retorno = inv_sap.of_gen_mp(lstr_info_sap)

IF ll_retorno = -1 THEN 
	ls_error = inv_sap.of_get_error( )
	IF TRIM(ls_error) <> '' THEN
		ls_ruta  =wf_generar_log_errores(ls_error)
		IF MessageBox('Error','Se presentaron Inconsistencias. Desea ver el registro de inconsistencias?',Exclamation!, YesNo!, 2) = 1 THEN
			OpenWithParm(w_error_enviosap,ls_error)	
		END IF
	END IF
END IF

IF ll_retorno = -1 THEN RETURN
	
wf_llenado_sap(2, lstr_info_sap)


IF TRIM(ls_error) <> '' THEN
	ROLLBACK using n_cst_application.itr_appl;
	wf_recuperar_lista_materiales()
	//MessageBox('Advertencia','Se presentaron Inconsistencias. Se grabo el archivo en la ruta: '+ls_ruta, Question!, ok!)
ELSE
	wf_cambiar_estado()
	COMMIT using n_cst_application.itr_appl;
	wf_recuperar_lista_materiales()
	MessageBox('Advertencia','Informaci$$HEX1$$f300$$ENDHEX$$n enviada satisfactoriamente', Question!, ok!)
END IF
end subroutine

public function integer wf_llenado_sap (readonly long al_proceso, ref str_parametros_sap astr_info_sap);//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	wf_llenado_sap (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	llenar las tablas que se van a enviar a SAP con la siguiente 
//					estructura de datos.
//-------------------------------------------------------------------------
// ARGUMENTO:	readonly long al_proceso 
// RETORNO	:	integer
//=========================================================================

//LISTA_MATERIAL	 	Tabla que recibe la informaci$$HEX1$$f300$$ENDHEX$$n de la lista de material a crear o modificar.		Ejemplo	Sugerencia
//MATNR					CHAR	N$$HEX1$$fa00$$ENDHEX$$mero de material	110963TP	
//WERKS					CHAR	Centro	1110	Par$$HEX1$$e100$$ENDHEX$$metro
//ALTERNATIVE			CHAR	Alternativa de la lista de materiales	01	
//BASE_QUANTITY		CHAR	Cantidad base (BTCI)	24000	
//BASE_UNIT				UNIT	Un.medida base p.lista material.	UN	Par$$HEX1$$e100$$ENDHEX$$metro
//BOM_TEXT				CHAR	Texto de la lista de materiales		
//ALT_TEXT				CHAR	Texto de alternativa de lista de materiales	RECURSO 6530	
//ITEM_CATEGORY		CHAR	Tipo de posici$$HEX1$$f300$$ENDHEX$$n (Lista de materiales)	L	Par$$HEX1$$e100$$ENDHEX$$metro
//COMPONENT				CHAR	Componente de lista de materiales	110004040	
//COMP_UNIT				UNIT	Unidad de medida del componente	G	Par$$HEX1$$e100$$ENDHEX$$metro
//HDR_GRID_VALUE		CHAR	Valor matriz	02000362	Concatena la talla (con ceros a la izquierda) + el color (con ceros a la iquierda) dcel material TP
//COMP_GRID_VALUE		CHAR	Valor matriz	000600	Color de la MP con ceros a la izquierda
//CATEGORY				CHAR	Valor de categor$$HEX1$$ed00$$ENDHEX$$a		En Blanco. No aplica para TP
//COMP_QUANTITY		QUAN	Cantidad de componente	14	
//
Long ll_seleccion, ll_fila, ll_filas, ll_fabrica, ll_linea, ll_talla, ll_muestra, ll_recurso, ll_muestrario, ll_filasmat, ll_filafor, &
		ll_retorno, ll_color
String ls_centro, ls_unidad_medida, ls_unidadMedidaBase, ls_item_categoria, ls_talla, ls_color, ls_tallacolor, ls_color_mp, ls_sufijo, &
		ls_usuario,ls_instancia, ls_cantidad
Boolean lb_entro = FALSE
DateTime ldt_fecha

ll_fila = 1

u_ds_base				lds_comp_material
lds_comp_material = 	CREATE u_ds_base
u_ds_base		lds_datos
lds_datos		= CREATE u_ds_base
lds_datos.DataObject = 'd_log_sap'
lds_datos.Settransobject(n_cst_application.itr_appl)

//str_parametros_sap		lstr_null
//
//astr_info_sap = lstr_null

lds_comp_material.DataObject = 'd_com_lista_materiales'
lds_comp_material.Settransobject(n_cst_application.itr_appl)
ll_filas = dw_lista_mat.Rowcount( )

IF al_proceso = 1 THEN
	FOR ll_seleccion = 1 TO ll_filas
		IF dw_lista_mat.Object.enviado[ll_seleccion] = '1' AND dw_lista_mat.Object.co_estreccierra[ll_seleccion] = 2  THEN
			IF MessageBox('Advertencia!','Desea enviar datos enviados con anterioridad a SAP?', Question!, Yesno!,2) <> 1 THEN
				RETURN -1
			END IF			
			EXIT
		END IF 
	NEXT
END IF

FOR ll_seleccion = 1 TO ll_filas
//	IF dw_lista_mat.Object.enviado[ll_seleccion] = '1' AND dw_lista_mat.Object.co_estreccierra[ll_seleccion] <> 2  THEN
	IF dw_lista_mat.Object.enviado[ll_seleccion] = '1' THEN
		lb_entro = TRUE
		ll_fabrica = dw_lista_mat.Object.co_fabrica[ll_seleccion]
		ll_linea = dw_lista_mat.Object.co_linea[ll_seleccion]
		
		ls_unidad_medida = wf_parametros(ll_fabrica, ll_linea, 'UNIDADPESO')
		ls_centro = wf_parametros(ll_fabrica, ll_linea, 'CENTROFABRICA')
		ls_item_categoria = wf_parametros(ll_fabrica, ll_linea, 'ITEMCATEGORIA')
		ls_unidadMedidaBase = wf_parametros(ll_fabrica, ll_linea, 'UNIDADMEDIDABASE')
		ls_sufijo = wf_parametros(ll_fabrica, ll_linea, 'SUFREF')
		
		IF ls_unidad_medida = '-1' OR ls_centro = '-1' OR ls_item_categoria = '-1' OR ls_unidadMedidaBase = '-1' OR ls_sufijo = '-1' THEN
			RETURN -1
		END IF		
		
		ll_talla = dw_lista_mat.Object.co_talla[ll_seleccion]
		ll_muestra = dw_lista_mat.Object.co_muestra[ll_seleccion]
		ll_recurso = dw_lista_mat.Object.co_reccotcierra[ll_seleccion]
		ll_muestrario = dw_lista_mat.Object.co_muestrario[ll_seleccion]
		IF IsNull(dw_encabezado.object.color[1]) OR String(dw_encabezado.object.color[1],'') = '' THEN
			ll_color = -1
		ELSE
			ll_color = Long(dw_encabezado.Object.color[1])
		END IF
		
		lds_comp_material.retrieve(ll_fabrica, ll_linea, ll_talla, ll_muestra, ll_recurso, ll_muestrario, ll_color)
		
		ll_filasMat = lds_comp_material.Rowcount( )
		CHOOSE CASE al_proceso
			CASE 1
				FOR ll_filafor = 1 TO ll_filasMat 			
					
					ls_talla = '00'+String(lds_comp_material.Object.co_talla[ll_filafor],'')
					ls_talla = Right ( ls_talla, 2)
					
					ls_color = '000000'+String(lds_comp_material.Object.pinta[ll_filafor],'')			
					ls_color = Right ( ls_color, 6)
					
					ls_tallacolor = String(ls_talla)+String(ls_color)
					
					ls_color_mp = '000000'+String(lds_comp_material.Object.co_color_mp[ll_filafor],'')
					ls_color_mp = Right ( ls_color_mp, 6)
					
					astr_info_sap.matnr[ll_fila]					= String(lds_comp_material.Object.referencia[ll_filafor],'')+ls_sufijo
					astr_info_sap.werks[ll_fila]					= ls_centro
					astr_info_sap.alternative[ll_fila]			= '0'+String(dw_lista_mat.Object.listamaterial[ll_seleccion],'')
					astr_info_sap.base_quantity[ll_fila]		= String(dw_encabezado.Object.cabase[1],'')
					astr_info_sap.base_unit[ll_fila]				= ls_unidadMedidaBase
					astr_info_sap.bom_text[ll_fila]				= ''
					astr_info_sap.alt_text[ll_fila]				= 'Recurso '+String(ll_recurso,'')
					astr_info_sap.item_category[ll_fila]		= ls_item_categoria
					astr_info_sap.component[ll_fila]				= String(lds_comp_material.Object.co_producto[ll_filafor],'')
					astr_info_sap.comp_unit[ll_fila]				= ls_unidad_medida
					astr_info_sap.hdr_grid_value[ll_fila]		= ls_tallacolor
					astr_info_sap.comp_grid_value[ll_fila]		= ls_color_mp
					astr_info_sap.category[ll_fila]				= ''
					
					ls_cantidad = String(lds_comp_material.Object.peso_mp[ll_filafor] * id_cabase,'')
					
//					ls_cantidad = Replace ( ls_cantidad, Pos (ls_cantidad,'.',1 ), 1, ',' )
										
					astr_info_sap.comp_quantity[ll_fila]		= ls_cantidad
					astr_info_sap.aplicativo[ll_fila]			= Trim(lds_comp_material.Object.aplicativo[ll_filafor])
					ll_fila++
				NEXT
			CASE 2
				IF NOT n_cst_application.of_SelectServer(n_cst_application.itr_appl, ldt_fecha,ls_usuario,ls_instancia) THEN
					MessageBox('Advertencia','Error en el proceso de determinaci$$HEX1$$f300$$ENDHEX$$n de la fecha del servidor de aplicaci$$HEX1$$f300$$ENDHEX$$n.',StopSign!)								
					RETURN -1
				END IF
				
				FOR ll_filafor = 1 TO ll_filasMat 			
					
					ls_talla = '00'+String(lds_comp_material.Object.co_talla[ll_filafor],'')
					ls_talla = Right ( ls_talla, 2)
					
					ls_color = '000000'+String(lds_comp_material.Object.pinta[ll_filafor],'')			
					ls_color = Right ( ls_color, 6)
					
					ls_tallacolor = String(ls_talla)+String(ls_color)
					
					ls_color_mp = '000000'+String(lds_comp_material.Object.co_color_mp[ll_filafor],'')
					ls_color_mp = Right ( ls_color_mp, 6)
					
					ll_fila = lds_datos.insertrow( 0)
					lds_datos.Object.co_referencia[ll_fila]			= Long(lds_comp_material.Object.referencia[ll_filafor])
					lds_datos.Object.co_centro[ll_fila]   				= Long(ls_centro)
					lds_datos.Object.co_listamaterial[ll_fila]   	= String(dw_lista_mat.Object.listamaterial[ll_seleccion],'')
					lds_datos.Object.de_cabase[ll_fila]   				= String(dw_encabezado.Object.cabase[1],'')
					lds_datos.Object.de_unidadmedida[ll_fila]   		= ls_unidadMedidaBase
					lds_datos.Object.de_alternativa[ll_fila]   		= 'Recurso '+String(ll_recurso,'')
					lds_datos.Object.de_categoria[ll_fila]   			= ls_item_categoria
					lds_datos.Object.de_componente[ll_fila]   		= String(lds_comp_material.Object.co_producto[ll_filafor],'')
					lds_datos.Object.de_unidadcomponente[ll_fila]   = ls_unidad_medida
					lds_datos.Object.de_tallacolor[ll_fila]   		= ls_tallacolor
					lds_datos.Object.de_colormp[ll_fila]   			= ls_color_mp
					lds_datos.Object.peso_mp[ll_fila]   				= String(lds_comp_material.Object.peso_mp[ll_filafor] * id_cabase,'')
					lds_datos.Object.fe_actualizacion[ll_fila]   	= DateTime(DATE(Today()),Time(Now()))
					lds_datos.Object.usuario[ll_fila]   				= gs_usuario
					lds_datos.Object.instancia[ll_fila]					= ls_instancia					
				NEXT	
	
		END CHOOSE
	END IF
NEXT

IF NOT lb_entro THEN 
	MessageBox('Advertencia','Se debe seleccionar un registro valido a enviar', Exclamation!)	
	RETURN -1 
END IF

IF al_proceso = 2 THEN
	ll_retorno = lds_datos.update( )		
	lds_datos.SaveAs("C:\muestras.xls", Excel!, FALSE)
	RETURN ll_retorno
END IF

RETURN 1
end function

on w_materiales_a_sap.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_materiales_sap" then this.MenuID = create m_materiales_sap
this.pb_1=create pb_1
this.st_muestra=create st_muestra
this.cbx_todos=create cbx_todos
this.dw_detalle_lista=create dw_detalle_lista
this.cb_1=create cb_1
this.dw_lista_mat=create dw_lista_mat
this.cb_enviar=create cb_enviar
this.dw_encabezado=create dw_encabezado
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.st_muestra
this.Control[iCurrent+3]=this.cbx_todos
this.Control[iCurrent+4]=this.dw_detalle_lista
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.dw_lista_mat
this.Control[iCurrent+7]=this.cb_enviar
this.Control[iCurrent+8]=this.dw_encabezado
this.Control[iCurrent+9]=this.gb_1
this.Control[iCurrent+10]=this.gb_2
this.Control[iCurrent+11]=this.gb_3
end on

on w_materiales_a_sap.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.pb_1)
destroy(this.st_muestra)
destroy(this.cbx_todos)
destroy(this.dw_detalle_lista)
destroy(this.cb_1)
destroy(this.dw_lista_mat)
destroy(this.cb_enviar)
destroy(this.dw_encabezado)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;call super::open;//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	open (event)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	abre la conexion con base de datos para el dw de la ventana.
//-------------------------------------------------------------------------
// ARGUMENTO:	(none)
// RETORNO	:	long [pbm_open]
//=========================================================================
DataWindowChild lwc_datos

inv_matsap				= CREATE n_cst_c_materiales_sap
ids_datos				= CREATE DataStore
ids_cabase				= CREATE DataStore


ids_cabase.dataObject = 'ddw_cabase'
ids_cabase.settransobject( n_cst_application.itr_appl)
ids_cabase.retrieve( )
dw_detalle_lista.settransobject( n_cst_application.itr_appl)

dw_encabezado.Insertrow( 0)

dw_encabezado.getchild('cabase', lwc_datos)
			
ids_cabase.rowscopy( 1, ids_cabase.Rowcount(), Primary!, lwc_datos , 1, Primary!)



end event

event ue_find;call super::ue_find;//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	ue_find (event)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	realiza las validaciones antes de que se proceda a la recuperacion
//					de la informacion.
//-------------------------------------------------------------------------
// ARGUMENTO:	(none)
// RETORNO	:	(none)
//=========================================================================

IF dw_encabezado.Rowcount( ) = 0 THEN 
	MessageBox('Advertencia','Se debe ingresar una referencia para poder continuar',Exclamation!)
	RETURN 
END IF

IF IsNull(dw_encabezado.Object.cabase[1]) OR dw_encabezado.Object.cabase[1] = 0 THEN
	MessageBox('Advertencia','La cantidad Base no puede ser igual o menor a cero.',Exclamation!)
	RETURN 
END IF


IF IsNull(dw_encabezado.Object.referencia[1]) OR dw_encabezado.Object.referencia[1] = 0 THEN
	MessageBox('Advertencia','La cantidad Base no puede ser igual o menor a cero.',Exclamation!)
	RETURN 
END IF

wf_recuperar_lista_materiales()
end event

type pb_1 from picturebutton within w_materiales_a_sap
integer x = 2985
integer y = 60
integer width = 142
integer height = 152
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Custom043!"
alignment htextalign = left!
string powertiptext = "Guardar Imagen Excel"
end type

event clicked;parent.triggerevent("ue_guardar_img_excel")
end event

type st_muestra from statictext within w_materiales_a_sap
integer x = 119
integer y = 1056
integer width = 910
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type cbx_todos from checkbox within w_materiales_a_sap
integer x = 4873
integer y = 228
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todos"
end type

event clicked;Long ll_fila
String ls_valor
IF cbx_todos.checked THEN
	ls_valor = '1'
ELSE
	ls_valor = '0'
END IF
	
FOR ll_fila = 1 TO dw_lista_mat.Rowcount( )
	dw_lista_mat.object.enviado[ll_fila] = ls_valor 
NEXT
end event

type dw_detalle_lista from datawindow within w_materiales_a_sap
integer x = 82
integer y = 1272
integer width = 5051
integer height = 1200
integer taborder = 60
string title = "none"
string dataobject = "d_crost_materiales"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_materiales_a_sap
integer x = 2569
integer y = 32
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Consultar"
end type

event clicked;

IF dw_encabezado.Rowcount( ) = 0 THEN 
	MessageBox('Advertencia','Se debe ingresar una referencia para poder continuar',Exclamation!)
	RETURN -1
END IF

IF IsNull(dw_encabezado.Object.cabase[1]) OR dw_encabezado.Object.cabase[1] = 0 THEN
	MessageBox('Advertencia','La cantidad Base no puede ser igual o menor a cero.',Exclamation!)
	RETURN -1	
END IF


IF IsNull(dw_encabezado.Object.referencia[1]) OR dw_encabezado.Object.referencia[1] = 0 THEN
	MessageBox('Advertencia','La cantidad Base no puede ser igual o menor a cero.',Exclamation!)
	RETURN -1	
ELSE
	SELECT NUMERICO
	INTO	 :il_cabase
	FROM	 m_constantes
	WHERE  VAR_NOMBRE = 'CA_BASE'
	AND	 TIPO = 1
	USING n_cst_application.itr_appl
	;
	
	id_cabase = dw_encabezado.object.cabase[1] / il_cabase
END IF

wf_recuperar_lista_materiales()
end event

type dw_lista_mat from datawindow within w_materiales_a_sap
event ue_tecla pbm_dwnkey
integer x = 64
integer y = 396
integer width = 5079
integer height = 648
integer taborder = 30
string title = "none"
string dataobject = "d_lista_materiales_sap"
boolean controlmenu = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_tecla;Long ll_fabrica, ll_linea, ll_talla, ll_muestra, ll_muestrario, ll_recurso

THIS.AcceptText( )

CHOOSE CASE key
	CASE KeyDownArrow!
		
		il_row ++
		IF il_Row > THIS.rowcount( ) THEN il_Row = THIS.rowcount( )
		SelectRow(0,False)
		SelectRow(il_Row,True)
	
		ll_fabrica = Object.co_fabrica[il_Row]
		ll_linea = Object.co_linea[il_Row]
		ll_talla = Object.co_talla[il_Row]
		ll_muestra = Object.co_muestra[il_Row]
		ll_recurso = Object.co_reccotcierra[il_Row]

		IF IsNull(dw_encabezado.object.muestrario[1]) OR String(dw_encabezado.object.muestrario[1],'') = '0' THEN
			ll_muestrario = Object.co_muestrario[il_Row]
		ELSE
			ll_muestrario = Long(dw_encabezado.Object.muestrario[1])
		END IF
		
		dw_detalle_lista.retrieve(ll_fabrica, ll_linea, ll_talla, 1, ll_muestra, ll_muestrario, ll_recurso)
	CASE KeyUpArrow!
		
		il_Row --		
		IF il_Row = 0 THEN il_row = 1
		
		SelectRow(0,False)
		SelectRow(il_Row,True)
	
		ll_fabrica = Object.co_fabrica[il_Row]
		ll_linea = Object.co_linea[il_Row]
		ll_talla = Object.co_talla[il_Row]
		ll_muestra = Object.co_muestra[il_Row]
		ll_recurso = Object.co_reccotcierra[il_Row]

		IF IsNull(dw_encabezado.object.muestrario[1]) OR String(dw_encabezado.object.muestrario[1],'') = '0' THEN
			ll_muestrario = Object.co_muestrario[il_Row]
		ELSE
			ll_muestrario = Long(dw_encabezado.Object.muestrario[1])
		END IF
		
		dw_detalle_lista.retrieve(ll_fabrica, ll_linea, ll_talla, 1, ll_muestra, ll_muestrario, ll_recurso)
		
	CASE Keyf11!

		IF GetRow() < 1 THEN RETURN
		
		ll_muestra = Object.co_muestra[GetRow()]
		OpenWithParm(w_muestra,ll_muestra)	
END CHOOSE
end event

event clicked;Long ll_fabrica, ll_linea, ll_talla, ll_muestra, ll_muestrario, ll_recurso, ll_color

IF Row = 0 THEN RETURN

SelectRow(0,False)
SelectRow(row,True)

il_Row = row

ll_fabrica = Object.co_fabrica[Row]
ll_linea = Object.co_linea[Row]
ll_talla = Object.co_talla[Row]
ll_muestra = Object.co_muestra[Row]
ll_recurso = Object.co_reccotcierra[Row]

IF IsNull(dw_encabezado.object.muestrario[1]) OR String(dw_encabezado.object.muestrario[1],'') = '0' THEN
	ll_muestrario = Object.co_muestrario[Row]
ELSE
	ll_muestrario = Long(dw_encabezado.Object.muestrario[1])
END IF

IF IsNull(dw_encabezado.object.color[1]) OR String(dw_encabezado.object.color[1],'') = '' THEN
	ll_color = -1
ELSE
	ll_color = Long(dw_encabezado.Object.color[1])
END IF

dw_detalle_lista.reset( )
dw_detalle_lista.retrieve(ll_fabrica, ll_linea, ll_talla, 1, ll_muestra, ll_muestrario, ll_recurso, ll_color, id_cabase)


st_muestra.text = 'Muestra n$$HEX1$$fa00$$ENDHEX$$mero: '+String(ll_muestra)
end event

event doubleclicked;Long ll_muestra

IF row < 1 THEN RETURN

ll_muestra = Object.co_muestra[row]
OpenWithParm(w_muestra,ll_muestra)	
end event

type cb_enviar from commandbutton within w_materiales_a_sap
integer x = 2569
integer y = 156
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Enviar"
end type

event clicked;wf_proceso()

cbx_todos.checked = FALSE
end event

type dw_encabezado from u_dw_application within w_materiales_a_sap
event ue_tecla pbm_dwnkey
integer x = 69
integer y = 76
integer width = 2359
integer height = 160
string dataobject = "d_enc_mat_sap"
boolean vscrollbar = false
boolean livescroll = false
end type

event ue_tecla;Long ll_nulo, ll_len, ll_retorno

SetNull(ll_nulo)

CHOOSE CASE key
	CASE keyBack!, keyDelete!
		CHOOSE CASE this.getcolumnname( )
			CASE 'talla'	
				dw_encabezado.Object.talla[1] = ll_nulo
				dw_encabezado.Object.color[1] = ll_nulo
				dw_encabezado.Object.muestrario[1] = '0'
			CASE 'color'
				dw_encabezado.Object.color[1] = ll_nulo
				dw_encabezado.Object.muestrario[1] = ''				
			CASE 'muestrario'
				dw_encabezado.Object.muestrario[1] = ''	
		END CHOOSE
	CASE keyEnter!
		CHOOSE CASE this.getcolumnname( )
			CASE 'referencia'
				THIS.SetColumn( 'talla')
				THIS.SetFocus( )
			CASE 'talla'
				IF IsNull(dw_encabezado.Object.talla[1]) THEN
					dw_encabezado.event itemchanged(1, THIS.object.talla, String(0))
				END IF
				
				THIS.SetColumn( 'color')
				THIS.SetFocus( )
			CASE 'color'
				THIS.SetColumn( 'muestrario')
				THIS.SetFocus( )
			CASE 'muestrario'
				THIS.SetColumn( 'cabase')
				THIS.SetFocus( )
		END CHOOSE
END CHOOSE
end event

event getfocus;call super::getfocus;//gb_head.of_color(True)
end event

event itemchanged;Long ll_null, ll_referencia, ll_fila, ll_filas, ll_find
String ls_consulta, ls_null 
DataWindowChild lwc_datos

SetNull(ll_null)
SetNull(ls_null)

THIS.accepttext( )

IF Row = 0 THEN RETURN

lwc_datos.reset( )
ids_datos.reset( )
dw_lista_mat.Reset( )
dw_detalle_lista.Reset( )
CHOOSE CASE dwo.name
	CASE 'referencia'
		THIS.Reset( )
		THIS.Insertrow( 0)
		ll_referencia = Long(data)
		
		dw_encabezado.object.referencia[1] = ll_referencia

		IF ll_referencia = 0 THEN
			THIS.Reset( )
			THIS.Insertrow( 0)
			THIS.getchild('muestrario', lwc_datos)
		
			ll_filas = lwc_datos.rowcount( )
			FOR ll_fila =1 TO ll_filas 
				lwc_datos.deleterow(0)
			NEXT
			
			THIS.getchild('color', lwc_datos)
			
			ll_filas = lwc_datos.rowcount( )
			FOR ll_fila =1 TO ll_filas 
				lwc_datos.deleterow(0)
			NEXT
			
			THIS.getchild('talla', lwc_datos)
			
			ll_filas = lwc_datos.rowcount( )
			FOR ll_fila =1 TO ll_filas 
				lwc_datos.deleterow(0)
			NEXT 		
			
			RETURN 0
		END IF

		IF inv_matsap.of_existe_referencia( Long(data)) > 0 THEN
			il_referencia = Long(data)		
			
			//recuperacion de los muestrarios para la referencia
			ids_datos = inv_matsap.of_muestrarios( il_referencia, ll_null, ll_null)
						
			IF ids_datos.Rowcount( ) > 0 THEN
				THIS.getchild('muestrario', lwc_datos)
		
				ll_filas = lwc_datos.rowcount( )
				FOR ll_fila =1 TO ll_filas 
					lwc_datos.deleterow(0)
				NEXT
				
				ids_datos.rowscopy( 1, ids_datos.Rowcount(), Primary!, lwc_datos , 1, Primary!)
			
				ids_datos.reset( )			
			END IF
			
			//Recuperacion de las tallas para la referencia
			ids_datos = inv_matsap.of_tallas_muestrario_vigente( il_referencia, ll_null)
			THIS.getchild('talla', lwc_datos)
			
			ll_filas = lwc_datos.rowcount( )
			FOR ll_fila =1 TO ll_filas 
				lwc_datos.deleterow(0)
			NEXT 
			
			ids_datos.rowscopy( 1, ids_datos.Rowcount(), Primary!, lwc_datos , 1, Primary!)
			
			ids_datos.reset( )
			
			//recuperacion de los colores para la referencia
			ids_datos = inv_matsap.of_colores_referencia(il_referencia,ll_null, ll_null, ll_null)
			
			THIS.getchild('color', lwc_datos)
			
			ll_filas = lwc_datos.rowcount( )
			FOR ll_fila =1 TO ll_filas 
				lwc_datos.deleterow(0)
			NEXT
			
			ids_datos.rowscopy( 1, ids_datos.Rowcount(), Primary!, lwc_datos , 1, Primary!)
			
			ids_datos.reset( )

		ELSE
			il_referencia = ll_null
			THIS.Reset( )
			THIS.Insertrow( 0)
			MessageBox('Advertencia','Material no existe', Exclamation!)
			THIS.Reset( )
			THIS.Insertrow( 0)
			THIS.getchild('muestrario', lwc_datos)
		
			ll_filas = lwc_datos.rowcount( )
			FOR ll_fila =1 TO ll_filas 
				lwc_datos.deleterow(0)
			NEXT
			
			THIS.getchild('color', lwc_datos)
			
			ll_filas = lwc_datos.rowcount( )
			FOR ll_fila =1 TO ll_filas 
				lwc_datos.deleterow(0)
			NEXT
			
			THIS.getchild('talla', lwc_datos)
			
			ll_filas = lwc_datos.rowcount( )
			FOR ll_fila =1 TO ll_filas 
				lwc_datos.deleterow(0)
			NEXT 		
			RETURN 2
		END IF							
			
	CASE 'talla'
		
		IF String(il_referencia,'') = '' OR il_referencia = 0 THEN 
			//HACER PREGUNTA DE QUE FABRICA - LINEA SE UTILIZA EN ESTE PUNTO AL HACER LA RECUPERACION 
			//DEL MUESTRARIO VIGENTE Y QUE UNA REFERENCIA PUEDE SER CONFORMADA POR VARIAS MUESTRAS 
			//DE DIFERENTE FABRICA - LINEA
			
			MessageBox('Advertencia','Se debe Ingresar una Referencia.')
			RETURN 2		
					
		ELSE
			IF String(data,'') = '0' THEN
				
				ids_datos = inv_matsap.of_colores_referencia(il_referencia, ll_null, ll_null, ll_null)
			
				THIS.getchild('color', lwc_datos)
				
				ll_filas = lwc_datos.rowcount( )
				FOR ll_fila =1 TO ll_filas 
					lwc_datos.deleterow(0)
				NEXT
				
				ids_datos.rowscopy( 1, ids_datos.Rowcount(), Primary!, lwc_datos , 1, Primary!)
				
				ids_datos.reset( )
				
				RETURN 0
			END IF			
		
			THIS.Object.color[1] = ll_null
			
			ids_datos = inv_matsap.of_muestrarios( il_referencia, Long(data), ll_null)
			
			IF ids_datos.Rowcount( ) > 0 THEN				
				THIS.getchild('muestrario', lwc_datos)
		
				ll_filas = lwc_datos.rowcount( )
				FOR ll_fila =1 TO ll_filas 
					lwc_datos.deleterow(0)
				NEXT
				
				ids_datos.rowscopy( 1, ids_datos.Rowcount(), Primary!, lwc_datos , 1, Primary!)
			
				ids_datos.reset( )			
			END IF			
			
			ids_datos = inv_matsap.of_talla_referencia( il_referencia) 
			
			ll_find = ids_datos.Find( ' co_talla = '+String(data), 1, ids_datos.rowcount( ) )
						
			IF ll_find > 0 THEN
				ids_datos.reset( )
				ids_datos = inv_matsap.of_colores_referencia( il_referencia, Long(data), ll_null/*inv_matsap.of_get_muestrario()*/, ll_null)
				
				IF ids_datos.Rowcount( ) = 0 THEN
					MessageBox('Advertencia','Para la referencia talla no existen colores disponibles')
					THIS.getchild('color', lwc_datos)
			
					ll_filas = lwc_datos.rowcount( )
					FOR ll_fila =1 TO ll_filas 
						lwc_datos.deleterow(0)
					NEXT
					
					RETURN 1
				ELSE
					THIS.getchild('color', lwc_datos)
			
					ll_filas = lwc_datos.rowcount( )
					FOR ll_fila =1 TO ll_filas 
						lwc_datos.deleterow(0)
					NEXT
					
					ids_datos.rowscopy( 1, ids_datos.Rowcount(), Primary!, lwc_datos , 1, Primary!)
					
					ids_datos.reset( )
				END IF
				
			ELSE
				THIS.Object.color[1] = ll_null
				MessageBox('Advertencia','Talla '+String(data)+' no existe para el Material '+String(il_referencia))
				THIS.getchild('color', lwc_datos)
		
				ll_filas = lwc_datos.rowcount( )
				FOR ll_fila =1 TO ll_filas 
					lwc_datos.deleterow(0)
				NEXT
				THIS.Object.talla[1] = ll_null
				RETURN 1
			END IF
			
			THIS.Object.muestrario[1] = ls_null
		END IF

	CASE 'color'
		IF String(il_referencia,'') = '' OR il_referencia = 0 THEN 
			//HACER PREGUNTA DE QUE FABRICA - LINEA SE UTILIZA EN ESTE PUNTO AL HACER LA RECUPERACION 
			//DEL MUESTRARIO VIGENTE Y QUE UNA REFERENCIA PUEDE SER CONFORMADA POR VARIAS MUESTRAS 
			//DE DIFERENTE FABRICA - LINEA
			
			MessageBox('Advertencia','Se debe Ingresar una Referencia.')
			RETURN 2		
		END IF
		
		ids_datos = inv_matsap.of_colores_referencia(il_referencia,dw_encabezado.Object.talla[1], ll_null/*inv_matsap.of_get_muestrario()*/, Long(Data))
		
		IF ids_datos.Rowcount( ) < 1 THEN 
			MessageBox('Advertencia','Para la referencia no se encuentra el color disponible')
			dw_encabezado.object.color[1] = ll_null
			THIS.SetColumn( 'color')
				THIS.SetFocus( )
			RETURN 2
		END IF
		
		ids_datos = inv_matsap.of_muestrarios( il_referencia, dw_encabezado.Object.talla[1], Long(Data))
		
		IF ids_datos.Rowcount( ) > 0 THEN				
			THIS.getchild('muestrario', lwc_datos)
	
			ll_filas = lwc_datos.rowcount( )
			FOR ll_fila =1 TO ll_filas 
				lwc_datos.deleterow(0)
			NEXT
			
			ids_datos.rowscopy( 1, ids_datos.Rowcount(), Primary!, lwc_datos , 1, Primary!)
		
			ids_datos.reset( )	
//			THIS.Object.muestrario[1] = ls_null
		END IF
		
		
	CASE 'muestrario'
		
		IF Not IsNull(dw_encabezado.Object.referencia[1]) THEN			
			IF wf_muestrario_referencia( il_referencia, Long(data)) < 1 THEN
				MessageBox('Advertencia','Muestrario para el material no existe.')
				dw_encabezado.object.muestrario[1] = ''
				THIS.SetColumn( 'referencia')
				THIS.SetFocus( )
				RETURN 2
			ELSE
				
				IF IsNull(dw_encabezado.Object.talla[1]) THEN
					il_talla = ll_null
				ELSE
					il_talla = dw_encabezado.Object.talla[1]
				END IF	
				
				//recuperacion de los colores para la referencia
				ids_datos = inv_matsap.of_colores_referencia(il_referencia,il_talla, Long(data), ll_null)
				
				THIS.getchild('color', lwc_datos)
				
				ll_filas = lwc_datos.rowcount( )
				FOR ll_fila =1 TO ll_filas 
					lwc_datos.deleterow(0)
				NEXT
				
				ids_datos.rowscopy( 1, ids_datos.Rowcount(), Primary!, lwc_datos , 1, Primary!)
				
				ids_datos.reset( )

			END IF
		ELSE
			MessageBox('Advertencia','Se debe Ingresar una Referencia.')
			dw_encabezado.object.muestrario[1] = ''
			THIS.SetColumn( 'referencia')
			THIS.SetFocus( )
			RETURN 2
		END IF	
END CHOOSE
end event

event itemerror;return 1
end event

event losefocus;//gb_head.of_color(False)

This.accepttext( )
end event

event ue_insertrow;//long ll_res
//If ib_cambios Then
//	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
//	If ll_res=2 Then
//		Return
//	End If
//End If
//
//ib_find = FALSE
//
//Reset()
//
//Super::Event ue_insertRow()
//

end event

event ue_deleterow;//If tab_1.tabpage_1.dw_partes.RowCount()>0 Then
//	MessageBox("Advertencia!","No deben existir partes.",StopSign!)
//	Return
//End If
//
//Super::Event ue_deleteRow()
//
end event

event ue_dwnprocessenter;//
end event

type gb_1 from u_gb_base within w_materiales_a_sap
integer x = 14
integer y = 24
integer width = 2459
integer height = 224
string text = "Referencia"
end type

type gb_2 from groupbox within w_materiales_a_sap
integer x = 18
integer y = 280
integer width = 5179
integer height = 872
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lista de materiales"
end type

type gb_3 from groupbox within w_materiales_a_sap
integer x = 18
integer y = 1188
integer width = 5179
integer height = 1344
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Componentes de la lista de materiales"
end type

