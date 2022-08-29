HA$PBExportHeader$n_cst_copiar_recurso.sru
forward
global type n_cst_copiar_recurso from nonvisualobject
end type
end forward

global type n_cst_copiar_recurso from nonvisualobject
end type
global n_cst_copiar_recurso n_cst_copiar_recurso

type variables
DataStore ids_mt_prima, ids_Colores, ids_color_muestrario, ids_muestraBasica, ids_infodestino
str_param	istr_colores, istr_strparam
Long  il_fabrica, il_linea, il_muestra, il_talla, il_muestrarioori, il_diseno, il_muestrariodest, &
		il_recursoori, il_recursodest, il_cnt_opcion, il_prueba, il_tipoprod


n_cst_log_reccotizado	inv_log_reccotizado	//SA52045 - Ceiba/jjmonsal - 30-11-2015: Se adiciona Entidad para la tabla que tendra la informacion de los cambios realizados a los recursos cotizados

end variables

forward prototypes
public function integer of_recuperar_mt ()
public function integer of_str_colores (readonly str_param astr_colores)
public function STR_PARAM of_get_str_colores ()
public function integer of_grabar_colores ()
public function integer of_set_parametros (readonly str_param astr_parametros)
public function string of_crear_diseno ()
public function boolean of_filtro_colores_muestrario (ref str_param astr_parametros)
public function long of_max (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra, readonly long al_talla)
public function long of_recuperar_diseno (ref long al_diseno)
public function integer of_grabar_dobleclick ()
public function integer of_set_parametros_dobleclick (readonly str_param astr_parametros)
public function integer grabar_coloresbk ()
public function long of_diseno_recurso (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra, readonly long al_talla, readonly long al_recursodest)
public function integer of_borrar_existente (readonly long a_fabrica, readonly long a_linea, readonly long a_muestra, readonly long a_talla, readonly long al_recurso, readonly long al_color, readonly long al_parte, readonly long al_diseno, readonly long al_opcion, readonly long al_nump, readonly long al_combinacion)
public function integer of_borrar_existente_bk (readonly long a_fabrica, readonly long a_linea, readonly long a_muestra, readonly long a_talla, readonly long al_recurso, readonly long al_color, readonly long al_parte, readonly long al_diseno, readonly long al_opcion, readonly long al_nump, readonly long al_combinacion)
public function string of_snrecurso_cotizado (long al_fabrica, long al_linea, long al_muestra, long al_talla, long al_recurso)
public function boolean of_mail_cambio (long al_fabrica, long al_linea, long al_muestra, long al_recurso)
public subroutine of_set_dsmuestrabasica (datastore ads_dsorigen)
public function datastore of_get_dsmuestrabasica ()
public function integer of_grabarmuestrabasica (datastore ads_inforecursodestino, long al_recurso)
public function integer of_borrarmuesbasirecurso (long al_recurso)
public subroutine of_commit ()
public subroutine of_set_fabrica (readonly long al_data)
public subroutine of_set_linea (readonly long al_data)
public subroutine of_set_muestra (readonly long al_data)
public function long of_get_fabrica ()
public function long of_get_linea ()
public function long of_get_muestra ()
public subroutine of_set_diseno (readonly long al_data)
public function long of_get_diseno ()
public subroutine of_set_talla (readonly long al_data)
public function long of_get_talla ()
public function datastore of_get_ids_infodestino ()
public function long of_cargar_ids_infodestino (readonly long al_recurso)
public function integer of_destruirobjetos ()
public subroutine of_set_tipoprod (readonly long al_data)
public function long of_get_tipoprod ()
public function long of_getrecursodestino ()
public subroutine of_setrecursodestino (readonly long al_dato)
public subroutine of_rollback ()
public function integer of_validargrabarlogreccotizado ()
end prototypes

public function integer of_recuperar_mt ();//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_recuperar_mt (Event)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Enero 24 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	Recuperacion de las materias primas para cada color.
//=========================================================================

//co_fabrica = 4  
//co_linea = 7  
//co_muestra = 80139  
//co_talla = 21  
//CO_DISENO = 1 
//co_muestrario = 106
//co_color in (37)


ids_mt_prima.Retrieve()


RETURN ids_mt_prima.Rowcount( )
end function

public function integer of_str_colores (readonly str_param astr_colores);Long ll_filasColores, ll_inicio, ll_return 

ll_filasColores = UpperBound(astr_colores.a_String1)
str_param lstr_param
istr_colores.a_long1 = lstr_param.a_long1
istr_colores.a_long2 = lstr_param.a_long2

For ll_inicio = 1 TO ll_filasColores
	istr_colores.a_long1[ll_inicio] = Long(astr_colores.a_String1[ll_inicio])
	istr_colores.a_long2[ll_inicio] = Long(astr_colores.a_String2[ll_inicio])
	ids_color_muestrario.Object.color[ll_inicio] = Long(astr_colores.a_String1[ll_inicio])
	ids_color_muestrario.Object.muestrario[ll_inicio] = Long(astr_colores.a_String2[ll_inicio])	
NEXT

RETURN 1


end function

public function STR_PARAM of_get_str_colores ();RETURN istr_colores
end function

public function integer of_grabar_colores ();Long 	ll_fila, ll_filas, ll_color, ll_insert, ll_find_colores, ll_diseno, ll_partesOrigen, ll_estructura, &
		ll_parte, ll_find_partes, ll_numpartes, ll_llegada, ll_cnt_opcion, ll_struc, ll_find
Boolean ib_colores = FALSE, lb_estruc = FALSE, lb_existe = FALSE
n_ds_application 	lds_colores, lds_partesorigen, lds_partesllegada, lds_mt_llegada, lds_mt_origen, lds_coloresorigen, lds_coloresllegada,&
				lds_mat, lds_mat_comb, lds_temp
str_param	lstr_partes, lstr_colorMuestrario, lstr_parametro
String ls_filtro, ls_idpeso
long ll_1, ll_2, ll_retorno, ll_nupartemp, ll_filastemp
Decimal lc_peso


lds_mat					= CREATE n_ds_application
lds_mat_comb			= CREATE n_ds_application
lds_partesorigen 		= CREATE n_ds_application
lds_partesllegada 	= CREATE n_ds_application
lds_colores				= CREATE n_ds_application
lds_mt_origen			= CREATE n_ds_application
lds_mt_llegada			= CREATE n_ds_application
lds_coloresorigen		= CREATE n_ds_application
lds_coloresllegada	= CREATE n_ds_application
lds_temp					= CREATE n_ds_application



lds_mat.of_load('d_partes_comp')
lds_mat_comb.of_load('d_partes_comp_comb')
lds_mt_llegada.of_load('d_mt_muestras_colores_dos')
lds_mt_origen.of_load('d_mt_muestras_colores')
lds_partesorigen.of_load('dS_dt_fmp_muestras_c')
lds_partesllegada.of_load('ds_dt_fmp_muestras_sin_muestrario')
lds_coloresorigen.of_load('d_detalle_fmp_mues_grabacion')
lds_coloresllegada.of_load('d_detalle_fmp_mues_llegada')
lds_temp.of_load('d_mt_muestras_colores_dos')

lds_mat.of_conexion(n_cst_application.itr_appl, TRUE)
lds_mat_comb.of_conexion(n_cst_application.itr_appl, TRUE)
lds_mt_llegada.of_conexion(n_cst_application.itr_appl, TRUE)
lds_mt_origen.of_conexion(n_cst_application.itr_appl, TRUE)
lds_partesllegada.of_conexion(n_cst_application.itr_appl, TRUE)
lds_partesorigen.of_conexion(n_cst_application.itr_appl, TRUE)
lds_coloresorigen.of_conexion(n_cst_application.itr_appl, TRUE)
lds_coloresllegada.of_conexion(n_cst_application.itr_appl, TRUE)
lds_temp.of_conexion(n_cst_application.itr_appl, TRUE)

ll_cnt_opcion = of_max(il_fabrica, il_linea, il_muestra, il_talla)

of_recuperar_diseno(ll_diseno)


DO WHILE of_filtro_colores_muestrario(lstr_parametro) = TRUE
	
	lds_coloresorigen.retrieve(il_fabrica, il_linea, il_muestra, il_talla, il_muestrarioori, il_recursoori,lstr_parametro.a_long1)
	lds_coloresllegada.retrieve(il_fabrica, il_linea, il_muestra, il_talla, il_muestrariodest, il_recursodest,lstr_parametro.a_long1)
	
	ll_llegada = lds_coloresllegada.rowcount( )
	IF ll_llegada > 0 THEN 
		ll_cnt_opcion = lds_coloresllegada.object.co_diseno[1]
		ls_idpeso = lds_coloresllegada.Object.id_peso[1]
	ELSE
		ls_idpeso = 'P'
	END IF 
	
	ll_filas = lds_coloresorigen.Rowcount( )
	IF ll_filas = 0 THEN
		//se debe hacer la validacion del recurso que estamos trabajando para que si tenga colores asociados
		MessageBox('','Ha ocurrido un error, favor llamar a mesa de ayuda - opci$$HEX1$$f300$$ENDHEX$$n 1')	
		RETURN -1
	ELSE	
		ll_struc = 1
		FOR ll_fila =1 TO ll_filas	
			
			ll_color = lds_coloresorigen.Object.co_color[ll_fila]
			ll_find_colores = lds_coloresllegada.find( " co_color = "+String(ll_color), 1, lds_coloresllegada.Rowcount())
			
			IF ll_find_colores = 0 THEN
				
				ll_insert = lds_coloresllegada.Insertrow(0)
			
				lds_coloresllegada.object.co_fabrica[ll_insert] 	= lds_coloresorigen.object.co_fabrica[ll_fila]
				lds_coloresllegada.object.co_linea[ll_insert] 		= lds_coloresorigen.object.co_linea[ll_fila]
				lds_coloresllegada.object.co_muestra[ll_insert] 	= lds_coloresorigen.object.co_muestra[ll_fila] 
				lds_coloresllegada.object.co_talla[ll_insert] 		= lds_coloresorigen.object.co_talla[ll_fila]
				lds_coloresllegada.object.co_color[ll_insert] 		= lds_coloresorigen.object.co_color[ll_fila]
				lds_coloresllegada.object.cnt_opcion[ll_insert] 	= ll_cnt_opcion
				lds_coloresllegada.object.co_recurso[ll_insert] 	= il_recursodest
				lds_coloresllegada.object.id_peso[ll_insert] 		= ls_idpeso
				lds_coloresllegada.object.fe_creacion[ll_insert] 	= lds_coloresorigen.object.fe_creacion[ll_fila]
				lds_coloresllegada.object.usuario[ll_insert] 		= lds_coloresorigen.object.usuario[ll_fila]
				lds_coloresllegada.object.co_muestrario[ll_insert] = il_muestrariodest
				lds_coloresllegada.object.co_diseno[ll_insert] 		= ll_diseno
				lstr_colorMuestrario.a_long1[ll_struc] = lds_coloresorigen.object.co_color[ll_fila]
				ll_struc ++
				ib_colores = true
			ELSE
				lds_coloresllegada.object.cnt_opcion[ll_find_colores] 	= ll_cnt_opcion
				lds_coloresllegada.object.co_recurso[ll_find_colores] 	= il_recursodest
				lds_coloresllegada.object.id_peso[ll_find_colores] 		= ls_idpeso
				lds_coloresllegada.object.fe_creacion[ll_find_colores] 	= lds_coloresorigen.object.fe_creacion[ll_fila]
				lds_coloresllegada.object.usuario[ll_find_colores] 		= lds_coloresorigen.object.usuario[ll_fila]
				lds_coloresllegada.object.co_muestrario[ll_find_colores] = il_muestrariodest
				lds_coloresllegada.object.co_diseno[ll_find_colores] 		= ll_diseno
				lstr_colorMuestrario.a_long1[ll_struc] = lds_coloresorigen.object.co_color[ll_fila]
				ll_struc++
				ib_colores = true
			END IF
		NEXT
	END IF 
	
	// se debe recuperar las partes y copiar las partes que son comunes las unas a las otras. es decir esto es 
	//para muestras que esten 
	// un poco diligenciadas. 
	
	//se recuperan las partes comunes entre los dos recursos el de origen y el de llegada
	lds_partesorigen.retrieve(il_fabrica, il_linea, il_muestra, il_talla, il_recursoori, il_muestrarioori)
	lds_partesllegada.retrieve(il_fabrica, il_linea, il_muestra, il_talla, il_recursodest, il_muestrariodest)
	
	/*----------------------------------------------------------------------------------------------------*/
	/*----------------------------------------------------------------------------------------------------*/
	/*----------------------------------------------------------------------------------------------------*/
	// ACA FALTA LA VALIDACION DE QUE SI NO SE TIENE FILAS DE LAS PARTES EN EL RECURSO AL QUE SE VA A COPIAR 
	// NO SE DEBE HACER NADA, SERIA DE MOSTRAR UN MENSAJE DIIENDO QUE NO EXISTEN PARTES PARA COPIAR
	//	Y PASAR AL SIGUIENTE RECURSO.
	/*----------------------------------------------------------------------------------------------------*/
	/*----------------------------------------------------------------------------------------------------*/
	/*----------------------------------------------------------------------------------------------------*/
	/*----------------------------------------------------------------------------------------------------*/
	
	IF ib_colores THEN
		ll_partesOrigen = lds_partesorigen.Rowcount( )
		IF ll_partesOrigen = 0 THEN
			//MessageBox('','No Existen datos para el recurso que se desea copiar.')
			CONTINUE
		ELSE			
			ll_estructura = 1
			FOR ll_fila = 1 TO ll_partesOrigen
				ll_parte = lds_partesorigen.Object.co_partemp[ll_fila]
				ll_find_partes = lds_partesllegada.find( " co_partemp = "+String(ll_parte), 1, lds_partesllegada.Rowcount())
				IF ll_find_partes > 0 THEN			
					lstr_partes.a_long1[ll_estructura] = ll_parte
					ll_estructura++
					lb_estruc = true
				END IF
			NEXT
		END IF 
	END IF
	
	/*
	se va a recuperar los registros de materia prima que se tienen en la parte del origen y en la parte
	del destino, asi vamos poder hacer un update en el que ya existe o un insert en el 
	que no existe aun.
	lds_mt_llegada, lds_mt_origen
	'd_mt_muestras_colores'
	
	co_fabrica = :a_fabrica  
	co_linea = :a_linea  
	co_muestra = :a_muestra  
	co_talla = :a_talla  
	CO_recurso = :al_recurso
	co_muestrario = :an_muestrario
	co_color in ( :al_colores) 
	*/

	
	lds_mt_origen.Retrieve(il_fabrica, il_linea, il_muestra, il_talla, il_recursoori,il_muestrarioori, lstr_colorMuestrario.a_long1, lstr_partes.a_long1)
//	lds_mt_llegada.Retrieve(il_fabrica, il_linea, il_muestra, il_talla, il_recursodest,il_muestrariodest, lstr_colorMuestrario.a_long1, lstr_partes.a_long1)
	lds_mt_llegada.Retrieve(il_fabrica, il_linea, il_muestra, il_talla, il_recursodest,il_muestrarioori, lstr_colorMuestrario.a_long1, lstr_partes.a_long1)
	
	
	n_ds_application 	lds_prueba
	lds_prueba = CREATE n_ds_application
	Long ll_find2, ll_coloresprue

	lds_prueba.Of_Load('d_mt_muestras_colores_temp')
	lds_prueba.of_conexion(n_cst_application.itr_appl, TRUE)
	lds_prueba.Retrieve(il_fabrica, il_linea, il_muestra, il_talla, il_recursodest,il_muestrarioori, lstr_colorMuestrario.a_long1, lstr_partes.a_long1)
	
//	lds_mt_llegada.rowscopy( 1, lds_mt_llegada.rowcount( ) , Primary!, lds_prueba, 1, Primary!)
	
	
	lds_temp.retrieve(il_fabrica, il_linea, il_muestra, il_talla, il_recursodest,il_muestrarioori, lstr_colorMuestrario.a_long1, lstr_partes.a_long1)
	ll_filas = lds_mt_llegada.rowcount( )
	ll_filastemp = lds_temp.Rowcount( )
			
//	FOR ll_fila = 1 TO lds_mt_llegada.rowcount( )
//				
//		ls_filtro = 'co_fabrica = '+String(il_fabrica)+' AND co_linea = '+String(il_linea)+' AND co_muestra = '+String(il_muestra)+' AND co_talla = '+String(il_talla) 
//		ls_filtro +=' AND co_color = '+String(lds_mt_llegada.Object.co_color[ll_fila])
//		ls_filtro +=' AND nu_mp = '+String(lds_mt_llegada.Object.nu_mp[ll_fila])+' AND co_partemp = '+String(lds_mt_llegada.Object.co_partemp[ll_fila])
//
//		IF Trim(String(lds_mt_llegada.Object.co_combinacion[ll_fila],'')) <> '' THEN
//			ls_filtro +=' AND co_combinacion = '+String(lds_mt_llegada.Object.co_combinacion[ll_fila])
//		END IF
//		
//		ll_find = lds_mt_origen.Find(ls_filtro, 1, lds_mt_origen.RowCount())
//
//
//		IF ll_find > 0 THEN
//			lds_mt_llegada.deleterow(ll_fila)
//			ll_fila = 0
//		END IF
//		
//	NEXT
//lds_mt_llegada.update( )

	
string 	ls_filtro2
	IF lb_estruc THEN
		
		ll_numpartes = lds_mt_origen.Rowcount( )
		ll_1 = lds_coloresllegada.Update( )
	
			FOR ll_fila = 1 TO ll_numpartes
				
					IF Trim(String(lds_mt_origen.Object.co_combinacion[ll_fila],'')) <> '' THEN
						ls_filtro = 'dt_fmp_muestras.co_color = '+String(lds_mt_origen.Object.co_color[ll_fila])+ ' AND dt_fmp_muestras.co_partemp = '+String(lds_mt_origen.Object.co_partemp[ll_fila])+' AND co_combinacion = '+String(lds_mt_origen.Object.co_combinacion[ll_fila])
					ELSE
						ls_filtro = 'dt_fmp_muestras.co_color = '+String(lds_mt_origen.Object.co_color[ll_fila])+ ' AND dt_fmp_muestras.co_partemp = '+String(lds_mt_origen.Object.co_partemp[ll_fila])
					END IF
					ll_find = lds_temp.find(ls_filtro , 1, lds_temp.RowCount())
					
					IF ll_find > 0 THEN
						lc_peso = lds_temp.object.peso_mp[ll_find]
						lds_temp.Deleterow( ll_find)						
					ELSE 
						lc_peso = lds_mt_origen.object.peso_mp[ll_fila]
					END IF		
									
					ls_filtro = 'co_fabrica = '+String(il_fabrica)+' AND co_linea = '+String(il_linea)+' AND co_muestra = '+String(il_muestra)+' AND co_talla = '+String(il_talla) 
					ls_filtro +=' AND co_color = '+String(lds_mt_origen.Object.co_color[ll_fila])+' AND co_diseno = '+String(ll_diseno)
					ls_filtro +=' AND nu_mp = '+String(lds_mt_origen.Object.nu_mp[ll_fila])+' AND co_partemp = '+String(lds_mt_origen.Object.co_partemp[ll_fila])
					
					ls_filtro2 = ' dt_fmp_muestras.co_partemp = '+String(lds_mt_origen.Object.co_partemp[ll_fila])
					
					
					
					lds_mat_comb.reset( )
					lds_mat.reset( )
					IF Trim(String(lds_mt_origen.Object.co_combinacion[ll_fila],'')) <> '' THEN
						ls_filtro +=' AND co_combinacion = '+String(lds_mt_origen.Object.co_combinacion[ll_fila])
						ls_filtro2 +=' AND co_combinacion = '+String(lds_mt_origen.Object.co_combinacion[ll_fila])
						ll_retorno = lds_mat_comb.Retrieve(il_fabrica, il_linea, il_muestra, il_talla, ll_diseno, lds_mt_origen.Object.co_partemp[ll_fila], lds_mt_origen.Object.co_combinacion[ll_fila])
						IF ll_retorno > 0 THEN ll_nupartemp = lds_mat_comb.object.nu_partemp[1]
					ELSE
						ll_retorno = lds_mat.Retrieve(il_fabrica, il_linea, il_muestra, il_talla, ll_diseno, lds_mt_origen.Object.co_partemp[ll_fila])
						IF ll_retorno > 0 THEN 
							ll_nupartemp = lds_mat.object.nu_partemp[1]
						ELSE
							ll_nupartemp = lds_mt_origen.Object.nu_partemp[ll_fila]
						END IF

					END IF					
					
					ll_coloresprue = lds_coloresllegada.find( ' co_color = '+String(lds_mt_origen.Object.co_color[ll_fila]), 1, lds_coloresllegada.RowCount())
					
					lds_prueba.setfilter( ls_filtro2)
					lds_prueba.filter( )
					ll_find2 = lds_prueba.rowcount( )
					lds_prueba.setfilter( '')
					lds_prueba.filter( )
//					ll_find2 = lds_prueba.Find(ls_filtro2, 1, lds_prueba.RowCount())
					
										
					ll_find = lds_mt_llegada.Find(ls_filtro, 1, lds_mt_llegada.RowCount())
					IF (ll_find = 0 AND ll_find2 > 0) OR (ll_coloresprue > 0 AND ll_find2 > 0 )THEN
						ll_insert = lds_mt_llegada.Insertrow( 0)
					ELSE
						IF ll_find > 0 Then 
							ll_insert = ll_find
						Else
							ll_insert = lds_mt_llegada.Insertrow( 0)
						End if
					END IF
					
						
						lds_mt_llegada.Object.co_fabrica[ll_insert] 				=  lds_mt_origen.Object.co_fabrica[ll_fila]
						lds_mt_llegada.Object.co_linea[ll_insert] 				=  lds_mt_origen.Object.co_linea[ll_fila]
						lds_mt_llegada.Object.co_muestra[ll_insert] 				=  lds_mt_origen.Object.co_muestra[ll_fila]
						lds_mt_llegada.Object.co_talla[ll_insert] 				=  lds_mt_origen.Object.co_talla[ll_fila]
						lds_mt_llegada.Object.co_color[ll_insert] 				=  lds_mt_origen.Object.co_color[ll_fila]
						lds_mt_llegada.Object.co_centro[ll_insert] 				=  lds_mt_origen.Object.co_centro[ll_fila]
						lds_mt_llegada.Object.nu_partemp[ll_insert] 				=  ll_nupartemp
						lds_mt_llegada.Object.nu_mp[ll_insert] 					=  lds_mt_origen.Object.nu_mp[ll_fila]
						lds_mt_llegada.Object.co_tipoprod[ll_insert] 			=  lds_mt_origen.Object.co_tipoprod[ll_fila]
						lds_mt_llegada.Object.co_partemp[ll_insert] 				=  lds_mt_origen.Object.co_partemp[ll_fila]
						il_prueba = lds_mt_origen.Object.co_partemp[ll_fila]
						lds_mt_llegada.Object.co_combinacion[ll_insert] 		=  lds_mt_origen.Object.co_combinacion[ll_fila]
						lds_mt_llegada.Object.co_fabrica_mp[ll_insert] 			=  lds_mt_origen.Object.co_fabrica_mp[ll_fila]
						lds_mt_llegada.Object.co_producto_mp[ll_insert] 		=  lds_mt_origen.Object.co_producto_mp[ll_fila]
						lds_mt_llegada.Object.calidad_mp[ll_insert] 				=  lds_mt_origen.Object.calidad_mp[ll_fila]
						lds_mt_llegada.Object.co_matiz_mp[ll_insert] 			=  lds_mt_origen.Object.co_matiz_mp[ll_fila]
						lds_mt_llegada.Object.co_caracteristi_mp[ll_insert] 	=  lds_mt_origen.Object.co_caracteristi_mp[ll_fila]
						lds_mt_llegada.Object.co_color_mp[ll_insert] 			=  lds_mt_origen.Object.co_color_mp[ll_fila]
						lds_mt_llegada.Object.peso_mp[ll_insert] 					=  lc_peso
						lds_mt_llegada.Object.nu_conos[ll_insert] 				=  lds_mt_origen.Object.nu_conos[ll_fila]
						lds_mt_llegada.Object.fe_creacion[ll_insert] 			=  lds_mt_origen.Object.fe_creacion[ll_fila]			
						lds_mt_llegada.Object.fe_actualizacion[ll_insert] 		=  lds_mt_origen.Object.fe_actualizacion[ll_fila]
						lds_mt_llegada.Object.usuario[ll_insert] 					=  lds_mt_origen.Object.usuario[ll_fila]
						lds_mt_llegada.Object.instancia[ll_insert] 				=  lds_mt_origen.Object.instancia[ll_fila] 
						lds_mt_llegada.Object.co_proveedor[ll_insert] 			=  lds_mt_origen.Object.co_proveedor[ll_fila] 
						lds_mt_llegada.Object.mp_lote[ll_insert] 					=  lds_mt_origen.Object.mp_lote[ll_fila] 
						lds_mt_llegada.Object.cnt_opcion[ll_insert] 				=  ll_cnt_opcion
						lds_mt_llegada.Object.enhebrado[ll_insert] 				=  lds_mt_origen.Object.enhebrado[ll_fila]
						lds_mt_llegada.Object.posicion[ll_insert] 				=  lds_mt_origen.Object.posicion[ll_fila]
						lds_mt_llegada.Object.tension[ll_insert] 					=  lds_mt_origen.Object.tension[ll_fila]
						lds_mt_llegada.Object.co_diseno[ll_insert] 				=  ll_diseno
					
					of_borrar_existente( lds_mt_origen.Object.co_fabrica[ll_fila], lds_mt_origen.Object.co_linea[ll_fila], lds_mt_origen.Object.co_muestra[ll_fila], lds_mt_origen.Object.co_talla[ll_fila], il_recursodest, lds_mt_origen.Object.co_color[ll_fila], ll_nupartemp, ll_diseno, ll_cnt_opcion,lds_mt_origen.Object.nu_mp[ll_fila],(lds_mt_origen.Object.co_combinacion[ll_fila]))
					
					ll_2 = lds_mt_llegada.Update( )		
					
					
					
			NEXT

	
		IF ll_1 = 1 AND ll_2 = 1 THEN 
			IF of_snrecurso_cotizado(il_fabrica, il_linea, il_muestra, il_talla, il_recursodest) = 'S' THEN
//				of_mail_cambio(il_fabrica, il_linea, il_muestra, il_recursodest)
			END IF
			Commit using n_cst_application.itr_appl;
		ELSE
			RETURN -1
		END IF
	
	END IF
LOOP
RETURN 1
end function

public function integer of_set_parametros (readonly str_param astr_parametros);il_fabrica 			= astr_parametros.a_long1[1]
il_linea 			= astr_parametros.a_long1[2]
il_muestra 			= astr_parametros.a_long1[3]
il_talla 			= astr_parametros.a_long1[4]
il_muestrarioori 	= 0//astr_parametros.a_long1[5]
il_muestrariodest = astr_parametros.a_long1[6]
il_diseno 			= astr_parametros.a_long1[7]
il_recursoori 		= astr_parametros.a_long1[8]
il_recursodest 	= astr_parametros.a_long1[9]


RETURN 1
end function

public function string of_crear_diseno ();String ls_diseno_muestra
Long ll_filas
n_cst_param lo_param
DataStore	lds_diseno

lds_diseno = CREATE DataStore

ls_diseno_muestra = ''

lds_diseno.dataObject = 'd_crear_diseno'
lds_diseno.SettransObject(n_cst_application.itr_appl)
lds_diseno.Retrieve(il_fabrica, il_linea, il_muestra)

ll_filas = lds_diseno.Rowcount( )

IF ll_filas > 0 THEN lo_param.is_vector[1] = lds_diseno.Object.de_diseno[1]

If ( iSNull(ls_diseno_muestra) OR Trim(ls_diseno_muestra)  = '' ) THEN 	
	//lo_param.is_vector[1] = ''
	OpenWithParm(w_m_codigos_disenos,lo_param)
	
	lo_param = Message.PowerObjectParm
	If (IsValid(lo_param) ) THEN 
		ls_diseno_muestra=lo_param.is_vector[1]
	End If	
End If


RETURN ls_diseno_muestra
end function

public function boolean of_filtro_colores_muestrario (ref str_param astr_parametros);//of_filtro_colores_muestrario

Long ll_filas, ll_fila, ll_muestrario
Boolean lb_fin = FALSE

ids_color_muestrario.Object.Color[]
ids_color_muestrario.Object.muestrario[]

ids_color_muestrario.setsort( ' muestrario asc ')
ids_color_muestrario.Sort( )

//101
//102
//102
//102
//102
//103
//103
//104
//105
//105
//105
//105

ll_filas = ids_color_muestrario.Rowcount( )

FOR ll_fila = 1 TO ll_filas 
	ll_muestrario = ids_color_muestrario.Object.Muestrario[ll_fila]
	IF il_muestrarioori < ll_muestrario THEN
		il_muestrarioori = ids_color_muestrario.Object.Muestrario[ll_fila]
		lb_fin = TRUE
		EXIT
	END IF	
NEXT

ids_color_muestrario.setfilter( ' muestrario = '+String(il_muestrarioori))
ids_color_muestrario.Filter( )

ll_filas = ids_color_muestrario.Rowcount( )

FOR ll_fila =1 TO ll_filas 
	astr_parametros.a_long1[ll_fila] = ids_color_muestrario.Object.color[ll_fila]
NEXT


ids_color_muestrario.setfilter('')
ids_color_muestrario.Filter( )

RETURN lb_fin
end function

public function long of_max (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra, readonly long al_talla);Long ll_maximo
select max(cnt_opcion) 
Into :ll_maximo
from h_fmp_muestras 
where co_fabrica = :al_fabrica
and co_linea = :al_linea
and co_muestra = :al_muestra
and co_talla = :al_talla
USING n_cst_application.itr_appl; 


ll_maximo++

RETURN ll_maximo
end function

public function long of_recuperar_diseno (ref long al_diseno);
Long ll_retorno

//recuperar el dise$$HEX1$$f100$$ENDHEX$$o con la ingresada del recurso
 SELECT FIRST 1 co_diseno, count(*)
 into :al_diseno, :ll_retorno
    FROM dt_med_mue
  WHERE ( co_recurso = :il_recursodest ) AND  	
	      ( co_fabrica = :il_fabrica ) AND  
         ( co_linea   = :il_linea )   AND  
         ( co_muestra = :il_muestra ) AND  
         ( co_talla   = :il_talla )  
	Group By co_diseno		
	using n_cst_application.itr_appl;


RETURN ll_retorno
end function

public function integer of_grabar_dobleclick ();/***********************************************************
SA52045 - Ceiba/jjmonsal - 13-01-2016
Comentario:Se adiciona funcionalidad para que al copiar la info a un 
recurso cotizado en muestra basica se genere log y asi generar una alerta por correo
***********************************************************/
Long 			ll_fila, ll_filas, ll_insert, ll_cnt_opcion
String		ls_rec_mod
DataStore 	lds_mt_llegada, lds_mt_origen, lds_coloresorigen, lds_coloresllegada

n_cst_c_log_reccotizado	lnv_c_log_reccotizado
lnv_c_log_reccotizado = CREATE n_cst_c_log_reccotizado	

lds_mt_origen			= CREATE DataStore
lds_mt_llegada			= CREATE DataStore
lds_coloresorigen		= CREATE DataStore
lds_coloresllegada	= CREATE DataStore

lds_mt_llegada.dataObject 		= 'd_muestras_colores'
lds_mt_origen.dataObject 		= 'd_muestras_colores'
lds_coloresorigen.DataObject 	= 'd_colores_fmp_mues'
lds_coloresllegada.DataObject = 'd_colores_fmp_mues'

lds_mt_llegada.SetTransobject(n_cst_application.itr_appl)
lds_mt_origen.SetTransobject(n_cst_application.itr_appl)
lds_coloresorigen.settransobject(n_cst_application.itr_appl)
lds_coloresllegada.settransobject(n_cst_application.itr_appl)

ll_cnt_opcion = of_diseno_recurso(il_fabrica, il_linea, il_muestra, il_talla, il_recursodest)

lds_coloresorigen.retrieve(il_fabrica, il_linea, il_muestra, il_talla, il_muestrarioori, il_recursoori)
lds_coloresllegada.retrieve(il_fabrica, il_linea, il_muestra, il_talla, il_muestrariodest, il_recursodest)

ll_filas = lds_coloresorigen.rowcount( )
FOR ll_fila = 1 To ll_filas
	ll_insert = lds_coloresllegada.Insertrow(0)
	
	lds_coloresllegada.object.co_fabrica[ll_insert] 	= lds_coloresorigen.object.co_fabrica[ll_fila]
	lds_coloresllegada.object.co_linea[ll_insert] 		= lds_coloresorigen.object.co_linea[ll_fila]
	lds_coloresllegada.object.co_muestra[ll_insert] 	= lds_coloresorigen.object.co_muestra[ll_fila] 
	lds_coloresllegada.object.co_talla[ll_insert] 		= lds_coloresorigen.object.co_talla[ll_fila]
	lds_coloresllegada.object.co_color[ll_insert] 		= lds_coloresorigen.object.co_color[ll_fila]
	lds_coloresllegada.object.cnt_opcion[ll_insert] 	= il_diseno
	lds_coloresllegada.object.co_recurso[ll_insert] 	= il_recursodest
	lds_coloresllegada.object.id_peso[ll_insert] 		= 'P'
	lds_coloresllegada.object.fe_creacion[ll_insert] 	= lds_coloresorigen.object.fe_creacion[ll_fila]
	lds_coloresllegada.object.usuario[ll_insert] 		= lds_coloresorigen.object.usuario[ll_fila]
	lds_coloresllegada.object.co_muestrario[ll_insert] = il_muestrariodest
	lds_coloresllegada.object.co_diseno[ll_insert] 		= il_diseno
NEXT

lds_mt_llegada.retrieve( il_fabrica, il_linea, il_muestra, il_talla, il_recursodest, il_muestrariodest)
lds_mt_origen.retrieve(il_fabrica, il_linea, il_muestra, il_talla, il_recursoori, il_muestrarioori )

ll_filas = lds_mt_origen.rowcount( )
FOR ll_fila = 1 To ll_filas
	ll_insert = lds_mt_llegada.Insertrow( 0)
	lds_mt_llegada.Object.co_fabrica[ll_insert] 				=  lds_mt_origen.Object.co_fabrica[ll_fila]
	lds_mt_llegada.Object.co_linea[ll_insert] 				=  lds_mt_origen.Object.co_linea[ll_fila]
	lds_mt_llegada.Object.co_muestra[ll_insert] 				=  lds_mt_origen.Object.co_muestra[ll_fila]
	lds_mt_llegada.Object.co_talla[ll_insert] 				=  lds_mt_origen.Object.co_talla[ll_fila]
	lds_mt_llegada.Object.co_color[ll_insert] 				=  lds_mt_origen.Object.co_color[ll_fila]
	lds_mt_llegada.Object.co_centro[ll_insert] 				=  lds_mt_origen.Object.co_centro[ll_fila]
	lds_mt_llegada.Object.nu_partemp[ll_insert] 				=  lds_mt_origen.Object.nu_partemp[ll_fila]
	lds_mt_llegada.Object.nu_mp[ll_insert] 					=  lds_mt_origen.Object.nu_mp[ll_fila]
	lds_mt_llegada.Object.co_tipoprod[ll_insert] 			=  lds_mt_origen.Object.co_tipoprod[ll_fila]
	lds_mt_llegada.Object.co_partemp[ll_insert] 				=  lds_mt_origen.Object.co_partemp[ll_fila]
	lds_mt_llegada.Object.co_combinacion[ll_insert] 		=  lds_mt_origen.Object.co_combinacion[ll_fila]
	lds_mt_llegada.Object.co_fabrica_mp[ll_insert] 			=  lds_mt_origen.Object.co_fabrica_mp[ll_fila]
	lds_mt_llegada.Object.co_producto_mp[ll_insert] 		=  lds_mt_origen.Object.co_producto_mp[ll_fila]
	lds_mt_llegada.Object.calidad_mp[ll_insert] 				=  lds_mt_origen.Object.calidad_mp[ll_fila]
	lds_mt_llegada.Object.co_matiz_mp[ll_insert] 			=  lds_mt_origen.Object.co_matiz_mp[ll_fila]
	lds_mt_llegada.Object.co_caracteristi_mp[ll_insert] 	=  lds_mt_origen.Object.co_caracteristi_mp[ll_fila]
	lds_mt_llegada.Object.co_color_mp[ll_insert] 			=  lds_mt_origen.Object.co_color_mp[ll_fila]
	lds_mt_llegada.Object.peso_mp[ll_insert] 					=  lds_mt_origen.Object.peso_mp[ll_fila]
	lds_mt_llegada.Object.nu_conos[ll_insert] 				=  lds_mt_origen.Object.nu_conos[ll_fila]
	lds_mt_llegada.Object.fe_creacion[ll_insert] 			=  lds_mt_origen.Object.fe_creacion[ll_fila]			
	lds_mt_llegada.Object.fe_actualizacion[ll_insert] 		=  lds_mt_origen.Object.fe_actualizacion[ll_fila]
	lds_mt_llegada.Object.usuario[ll_insert] 					=  lds_mt_origen.Object.usuario[ll_fila]
	lds_mt_llegada.Object.instancia[ll_insert] 				=  lds_mt_origen.Object.instancia[ll_fila] 
	lds_mt_llegada.Object.co_proveedor[ll_insert] 			=  lds_mt_origen.Object.co_proveedor[ll_fila] 
	lds_mt_llegada.Object.mp_lote[ll_insert] 					=  lds_mt_origen.Object.mp_lote[ll_fila] 
	lds_mt_llegada.Object.cnt_opcion[ll_insert] 				=  il_diseno
	lds_mt_llegada.Object.alimentador[ll_insert] 			=  lds_mt_origen.Object.alimentador[ll_fila]
	lds_mt_llegada.Object.portahilo[ll_insert] 				=  lds_mt_origen.Object.portahilo[ll_fila]
	lds_mt_llegada.Object.enhebrado[ll_insert] 				=  lds_mt_origen.Object.enhebrado[ll_fila]
	lds_mt_llegada.Object.posicion[ll_insert] 				=  lds_mt_origen.Object.posicion[ll_fila]
	lds_mt_llegada.Object.tension[ll_insert] 					=  lds_mt_origen.Object.tension[ll_fila]
	lds_mt_llegada.Object.co_diseno[ll_insert] 				=  il_diseno	
NEXT	

long ll_1,ll_2
ll_1 = lds_coloresllegada.update( )
ll_2 = lds_mt_llegada.update( )

IF ll_1 = 1 and ll_2 = 1 THEN 
	
	IF of_snrecurso_cotizado(il_fabrica, il_linea, il_muestra, il_talla, il_recursodest) = 'S' THEN
//		of_mail_cambio(il_fabrica, il_linea, il_muestra, il_recursodest)
		/***********************************************************
		SA52045 - Ceiba/jjmonsal - 14-01-2016
		Comentario:Modificacion Correo automatico desde Muestras
		***********************************************************/
		lnv_c_log_reccotizado.of_setFabrica(il_fabrica)
		lnv_c_log_reccotizado.of_setLinea(il_linea)
		lnv_c_log_reccotizado.of_setMuestra(il_muestra)
		lnv_c_log_reccotizado.of_setRecurso(il_recursodest)
		ls_rec_mod = lnv_c_log_reccotizado.of_recurso_mod(il_muestra, il_linea,il_fabrica, il_recursodest)
		IF lnv_c_log_reccotizado.of_cargarInfoReporteRecCotizado(ls_rec_mod,il_muestrariodest) = -1 THEN 
			of_rollBack()
		END IF 
	END IF
	
	of_commit()
ELSE
	ROLLBACK using n_cst_application.itr_appl;
	MessageBox('','Ha ocurrido un error, favor llamar a mesa de ayuda - opci$$HEX1$$f300$$ENDHEX$$n 1')
	RETURN -1
END IF

IF IsValid(lnv_c_log_reccotizado) THEN 
	Destroy lnv_c_log_reccotizado
END IF 

RETURN 1





end function

public function integer of_set_parametros_dobleclick (readonly str_param astr_parametros);il_fabrica 			= astr_parametros.a_long1[1]
il_linea 			= astr_parametros.a_long1[2]
il_muestra 			= astr_parametros.a_long1[3]
il_talla 			= astr_parametros.a_long1[4]
il_muestrarioori 	= astr_parametros.a_long1[5]
il_muestrariodest = astr_parametros.a_long1[6]
il_diseno 			= astr_parametros.a_long1[7]
il_recursoori 		= astr_parametros.a_long1[8]
il_recursodest 	= astr_parametros.a_long1[9]


RETURN 1
end function

public function integer grabar_coloresbk ();Long 	ll_fila, ll_filas, ll_color, ll_insert, ll_find_colores, ll_diseno, ll_partesOrigen, ll_estructura, &
		ll_parte, ll_find_partes, ll_numpartes, ll_llegada, ll_cnt_opcion, ll_struc, ll_find
Boolean ib_colores = FALSE, lb_estruc = FALSE, lb_existe = FALSE
n_ds_application 	lds_colores, lds_partesorigen, lds_partesllegada, lds_mt_llegada, lds_mt_origen, lds_coloresorigen, lds_coloresllegada,&
				lds_mat, lds_mat_comb, lds_temp
str_param	lstr_partes, lstr_colorMuestrario, lstr_parametro
String ls_filtro, ls_idpeso
long ll_1, ll_2, ll_retorno, ll_nupartemp, ll_filastemp, ll_peso


lds_mat					= CREATE n_ds_application
lds_mat_comb			= CREATE n_ds_application
lds_partesorigen 		= CREATE n_ds_application
lds_partesllegada 	= CREATE n_ds_application
lds_colores				= CREATE n_ds_application
lds_mt_origen			= CREATE n_ds_application
lds_mt_llegada			= CREATE n_ds_application
lds_coloresorigen		= CREATE n_ds_application
lds_coloresllegada	= CREATE n_ds_application
lds_temp					= CREATE n_ds_application



lds_mat.of_load('d_partes_comp')
lds_mat_comb.of_load('d_partes_comp_comb')
lds_mt_llegada.of_load('d_mt_muestras_colores_dos')
lds_mt_origen.of_load('d_mt_muestras_colores')
lds_partesorigen.of_load('dS_dt_fmp_muestras_c')
lds_partesllegada.of_load('ds_dt_fmp_muestras_sin_muestrario')
lds_coloresorigen.of_load('d_detalle_fmp_mues_grabacion')
lds_coloresllegada.of_load('d_detalle_fmp_mues_llegada')
lds_temp.of_load('d_mt_muestras_colores_dos')

lds_mat.of_conexion(n_cst_application.itr_appl, TRUE)
lds_mat_comb.of_conexion(n_cst_application.itr_appl, TRUE)
lds_mt_llegada.of_conexion(n_cst_application.itr_appl, TRUE)
lds_mt_origen.of_conexion(n_cst_application.itr_appl, TRUE)
lds_partesllegada.of_conexion(n_cst_application.itr_appl, TRUE)
lds_partesorigen.of_conexion(n_cst_application.itr_appl, TRUE)
lds_coloresorigen.of_conexion(n_cst_application.itr_appl, TRUE)
lds_coloresllegada.of_conexion(n_cst_application.itr_appl, TRUE)
lds_temp.of_conexion(n_cst_application.itr_appl, TRUE)

ll_cnt_opcion = of_max(il_fabrica, il_linea, il_muestra, il_talla)

of_recuperar_diseno(ll_diseno)


DO WHILE of_filtro_colores_muestrario(lstr_parametro) = TRUE
	
	lds_coloresorigen.retrieve(il_fabrica, il_linea, il_muestra, il_talla, il_muestrarioori, il_recursoori,lstr_parametro.a_long1)
	lds_coloresllegada.retrieve(il_fabrica, il_linea, il_muestra, il_talla, il_muestrariodest, il_recursodest,lstr_parametro.a_long1)
	
	ll_llegada = lds_coloresllegada.rowcount( )
	IF ll_llegada > 0 THEN 
		ll_cnt_opcion = lds_coloresllegada.object.co_diseno[1]
		ls_idpeso = lds_coloresllegada.Object.id_peso[1]
	ELSE
		ls_idpeso = 'P'
	END IF 
	
	ll_filas = lds_coloresorigen.Rowcount( )
	IF ll_filas = 0 THEN
		//se debe hacer la validacion del recurso que estamos trabajando para que si tenga colores asociados
		MessageBox('','Ha ocurrido un error, favor llamar a mesa de ayuda - opci$$HEX1$$f300$$ENDHEX$$n 1')	
		RETURN -1
	ELSE	
		ll_struc = 1
		FOR ll_fila =1 TO ll_filas	
			
			ll_color = lds_coloresorigen.Object.co_color[ll_fila]
			ll_find_colores = lds_coloresllegada.find( " co_color = "+String(ll_color), 1, lds_coloresllegada.Rowcount())
			
			IF ll_find_colores = 0 THEN
				
				ll_insert = lds_coloresllegada.Insertrow(0)
			
				lds_coloresllegada.object.co_fabrica[ll_insert] 	= lds_coloresorigen.object.co_fabrica[ll_fila]
				lds_coloresllegada.object.co_linea[ll_insert] 		= lds_coloresorigen.object.co_linea[ll_fila]
				lds_coloresllegada.object.co_muestra[ll_insert] 	= lds_coloresorigen.object.co_muestra[ll_fila] 
				lds_coloresllegada.object.co_talla[ll_insert] 		= lds_coloresorigen.object.co_talla[ll_fila]
				lds_coloresllegada.object.co_color[ll_insert] 		= lds_coloresorigen.object.co_color[ll_fila]
				lds_coloresllegada.object.cnt_opcion[ll_insert] 	= ll_cnt_opcion
				lds_coloresllegada.object.co_recurso[ll_insert] 	= il_recursodest
				lds_coloresllegada.object.id_peso[ll_insert] 		= ls_idpeso
				lds_coloresllegada.object.fe_creacion[ll_insert] 	= lds_coloresorigen.object.fe_creacion[ll_fila]
				lds_coloresllegada.object.usuario[ll_insert] 		= lds_coloresorigen.object.usuario[ll_fila]
				lds_coloresllegada.object.co_muestrario[ll_insert] = il_muestrariodest
				lds_coloresllegada.object.co_diseno[ll_insert] 		= ll_diseno
				lstr_colorMuestrario.a_long1[ll_struc] = lds_coloresorigen.object.co_color[ll_fila]
				ll_struc ++
				ib_colores = true
			ELSE
				lds_coloresllegada.object.cnt_opcion[ll_find_colores] 	= ll_cnt_opcion
				lds_coloresllegada.object.co_recurso[ll_find_colores] 	= il_recursodest
				lds_coloresllegada.object.id_peso[ll_find_colores] 		= ls_idpeso
				lds_coloresllegada.object.fe_creacion[ll_find_colores] 	= lds_coloresorigen.object.fe_creacion[ll_fila]
				lds_coloresllegada.object.usuario[ll_find_colores] 		= lds_coloresorigen.object.usuario[ll_fila]
				lds_coloresllegada.object.co_muestrario[ll_find_colores] = il_muestrariodest
				lds_coloresllegada.object.co_diseno[ll_find_colores] 		= ll_diseno
				lstr_colorMuestrario.a_long1[ll_struc] = lds_coloresorigen.object.co_color[ll_fila]
				ll_struc++
				ib_colores = true
			END IF
		NEXT
	END IF 
	
	// se debe recuperar las partes y copiar las partes que son comunes las unas a las otras. es decir esto es 
	//para muestras que esten 
	// un poco diligenciadas. 
	
	//se recuperan las partes comunes entre los dos recursos el de origen y el de llegada
	lds_partesorigen.retrieve(il_fabrica, il_linea, il_muestra, il_talla, il_recursoori, il_muestrarioori)
	lds_partesllegada.retrieve(il_fabrica, il_linea, il_muestra, il_talla, il_recursodest, il_muestrariodest)
	
	/*----------------------------------------------------------------------------------------------------*/
	/*----------------------------------------------------------------------------------------------------*/
	/*----------------------------------------------------------------------------------------------------*/
	// ACA FALTA LA VALIDACION DE QUE SI NO SE TIENE FILAS DE LAS PARTES EN EL RECURSO AL QUE SE VA A COPIAR 
	// NO SE DEBE HACER NADA, SERIA DE MOSTRAR UN MENSAJE DIIENDO QUE NO EXISTEN PARTES PARA COPIAR
	//	Y PASAR AL SIGUIENTE RECURSO.
	/*----------------------------------------------------------------------------------------------------*/
	/*----------------------------------------------------------------------------------------------------*/
	/*----------------------------------------------------------------------------------------------------*/
	/*----------------------------------------------------------------------------------------------------*/
	
	IF ib_colores THEN
		ll_partesOrigen = lds_partesorigen.Rowcount( )
		IF ll_partesOrigen = 0 THEN
			//MessageBox('','No Existen datos para el recurso que se desea copiar.')
			CONTINUE
		ELSE			
			ll_estructura = 1
			FOR ll_fila = 1 TO ll_partesOrigen
				ll_parte = lds_partesorigen.Object.co_partemp[ll_fila]
				ll_find_partes = lds_partesllegada.find( " co_partemp = "+String(ll_parte), 1, lds_partesllegada.Rowcount())
				IF ll_find_partes > 0 THEN			
					lstr_partes.a_long1[ll_estructura] = ll_parte
					ll_estructura++
					lb_estruc = true
				END IF
			NEXT
		END IF 
	END IF
	
	/*
	se va a recuperar los registros de materia prima que se tienen en la parte del origen y en la parte
	del destino, asi vamos poder hacer un update en el que ya existe o un insert en el 
	que no existe aun.
	lds_mt_llegada, lds_mt_origen
	'd_mt_muestras_colores'
	
	co_fabrica = :a_fabrica  
	co_linea = :a_linea  
	co_muestra = :a_muestra  
	co_talla = :a_talla  
	CO_recurso = :al_recurso
	co_muestrario = :an_muestrario
	co_color in ( :al_colores) 
	*/

	
	lds_mt_origen.Retrieve(il_fabrica, il_linea, il_muestra, il_talla, il_recursoori,il_muestrarioori, lstr_colorMuestrario.a_long1, lstr_partes.a_long1)
//	lds_mt_llegada.Retrieve(il_fabrica, il_linea, il_muestra, il_talla, il_recursodest,il_muestrariodest, lstr_colorMuestrario.a_long1, lstr_partes.a_long1)
	lds_mt_llegada.Retrieve(il_fabrica, il_linea, il_muestra, il_talla, il_recursodest,il_muestrarioori, lstr_colorMuestrario.a_long1, lstr_partes.a_long1)
	
	
	datastore 	lds_prueba
	lds_prueba = CREATE datastore
	Long ll_find2, ll_coloresprue

	lds_prueba.dataobject = 'd_mt_muestras_colores_temp'
	lds_prueba.Settransobject(n_cst_application.itr_appl)
	lds_prueba.Retrieve(il_fabrica, il_linea, il_muestra, il_talla, il_recursodest,il_muestrarioori, lstr_colorMuestrario.a_long1, lstr_partes.a_long1)
	
//	lds_mt_llegada.rowscopy( 1, lds_mt_llegada.rowcount( ) , Primary!, lds_prueba, 1, Primary!)
	
	
	lds_temp.retrieve(il_fabrica, il_linea, il_muestra, il_talla, il_recursodest,il_muestrarioori, lstr_colorMuestrario.a_long1, lstr_partes.a_long1)
	ll_filas = lds_mt_llegada.rowcount( )
	ll_filastemp = lds_temp.Rowcount( )
			
	FOR ll_fila = 1 TO lds_mt_llegada.rowcount( )
				
		ls_filtro = 'co_fabrica = '+String(il_fabrica)+' AND co_linea = '+String(il_linea)+' AND co_muestra = '+String(il_muestra)+' AND co_talla = '+String(il_talla) 
		ls_filtro +=' AND co_color = '+String(lds_mt_llegada.Object.co_color[ll_fila])
		ls_filtro +=' AND nu_mp = '+String(lds_mt_llegada.Object.nu_mp[ll_fila])+' AND co_partemp = '+String(lds_mt_llegada.Object.co_partemp[ll_fila])

		IF Trim(String(lds_mt_llegada.Object.co_combinacion[ll_fila],'')) <> '' THEN
			ls_filtro +=' AND co_combinacion = '+String(lds_mt_llegada.Object.co_combinacion[ll_fila])
		END IF
		
		ll_find = lds_mt_origen.Find(ls_filtro, 1, lds_mt_origen.RowCount())


		IF ll_find > 0 THEN
			lds_mt_llegada.deleterow(ll_fila)
			ll_fila = 0
		END IF
		
	NEXT
	lds_mt_llegada.update( )
string 	ls_filtro2
	IF lb_estruc THEN
		
		ll_numpartes = lds_mt_origen.Rowcount( )
		ll_1 = lds_coloresllegada.Update( )
	
			FOR ll_fila = 1 TO ll_numpartes
				
					IF Trim(String(lds_mt_origen.Object.co_combinacion[ll_fila],'')) <> '' THEN
						ls_filtro = 'dt_fmp_muestras.co_color = '+String(lds_mt_origen.Object.co_color[ll_fila])+ ' AND dt_fmp_muestras.co_partemp = '+String(lds_mt_origen.Object.co_partemp[ll_fila])+' AND co_combinacion = '+String(lds_mt_origen.Object.co_combinacion[ll_fila])
					ELSE
						ls_filtro = 'dt_fmp_muestras.co_color = '+String(lds_mt_origen.Object.co_color[ll_fila])+ ' AND dt_fmp_muestras.co_partemp = '+String(lds_mt_origen.Object.co_partemp[ll_fila])
					END IF
					ll_find = lds_temp.find(ls_filtro , 1, lds_temp.RowCount())
					
					IF ll_find > 0 THEN
						ll_peso = lds_temp.object.peso_mp[ll_find]
						lds_temp.Deleterow( ll_find)						
					ELSE 
						ll_peso = lds_mt_origen.object.peso_mp[ll_fila]
					END IF		
									
					ls_filtro = 'co_fabrica = '+String(il_fabrica)+' AND co_linea = '+String(il_linea)+' AND co_muestra = '+String(il_muestra)+' AND co_talla = '+String(il_talla) 
					ls_filtro +=' AND co_color = '+String(lds_mt_origen.Object.co_color[ll_fila])+' AND co_diseno = '+String(ll_diseno)
					ls_filtro +=' AND nu_mp = '+String(lds_mt_origen.Object.nu_mp[ll_fila])+' AND co_partemp = '+String(lds_mt_origen.Object.co_partemp[ll_fila])
					
					ls_filtro2 = ' dt_fmp_muestras.co_partemp = '+String(lds_mt_origen.Object.co_partemp[ll_fila])
					
					
					
					lds_mat_comb.reset( )
					lds_mat.reset( )
					IF Trim(String(lds_mt_origen.Object.co_combinacion[ll_fila],'')) <> '' THEN
						ls_filtro +=' AND co_combinacion = '+String(lds_mt_origen.Object.co_combinacion[ll_fila])
						ls_filtro2 +=' AND co_combinacion = '+String(lds_mt_origen.Object.co_combinacion[ll_fila])
						ll_retorno = lds_mat_comb.Retrieve(il_fabrica, il_linea, il_muestra, il_talla, ll_diseno, lds_mt_origen.Object.co_partemp[ll_fila], lds_mt_origen.Object.co_combinacion[ll_fila])
						IF ll_retorno > 0 THEN ll_nupartemp = lds_mat_comb.object.nu_partemp[1]
					ELSE
						ll_retorno = lds_mat.Retrieve(il_fabrica, il_linea, il_muestra, il_talla, ll_diseno, lds_mt_origen.Object.co_partemp[ll_fila])
						IF ll_retorno > 0 THEN 
							ll_nupartemp = lds_mat.object.nu_partemp[1]
						ELSE
							ll_nupartemp = lds_mt_origen.Object.nu_partemp[ll_fila]
						END IF

					END IF					
					
					ll_coloresprue = lds_coloresllegada.find( ' co_color = '+String(lds_mt_origen.Object.co_color[ll_fila]), 1, lds_coloresllegada.RowCount())
					
					lds_prueba.setfilter( ls_filtro2)
					lds_prueba.filter( )
					ll_find2 = lds_prueba.rowcount( )
					lds_prueba.setfilter( '')
					lds_prueba.filter( )
//					ll_find2 = lds_prueba.Find(ls_filtro2, 1, lds_prueba.RowCount())
					
										
					ll_find = lds_mt_llegada.Find(ls_filtro, 1, lds_mt_llegada.RowCount())
					IF (ll_find = 0 AND ll_find2 > 0) OR (ll_coloresprue > 0 AND ll_find2 > 0 )THEN
					
						ll_insert = lds_mt_llegada.Insertrow( 0)
						lds_mt_llegada.Object.co_fabrica[ll_insert] 				=  lds_mt_origen.Object.co_fabrica[ll_fila]
						lds_mt_llegada.Object.co_linea[ll_insert] 				=  lds_mt_origen.Object.co_linea[ll_fila]
						lds_mt_llegada.Object.co_muestra[ll_insert] 				=  lds_mt_origen.Object.co_muestra[ll_fila]
						lds_mt_llegada.Object.co_talla[ll_insert] 				=  lds_mt_origen.Object.co_talla[ll_fila]
						lds_mt_llegada.Object.co_color[ll_insert] 				=  lds_mt_origen.Object.co_color[ll_fila]
						lds_mt_llegada.Object.co_centro[ll_insert] 				=  lds_mt_origen.Object.co_centro[ll_fila]
						lds_mt_llegada.Object.nu_partemp[ll_insert] 				=  ll_nupartemp
						lds_mt_llegada.Object.nu_mp[ll_insert] 					=  lds_mt_origen.Object.nu_mp[ll_fila]
						lds_mt_llegada.Object.co_tipoprod[ll_insert] 			=  lds_mt_origen.Object.co_tipoprod[ll_fila]
						lds_mt_llegada.Object.co_partemp[ll_insert] 				=  lds_mt_origen.Object.co_partemp[ll_fila]
						lds_mt_llegada.Object.co_combinacion[ll_insert] 		=  lds_mt_origen.Object.co_combinacion[ll_fila]
						lds_mt_llegada.Object.co_fabrica_mp[ll_insert] 			=  lds_mt_origen.Object.co_fabrica_mp[ll_fila]
						lds_mt_llegada.Object.co_producto_mp[ll_insert] 		=  lds_mt_origen.Object.co_producto_mp[ll_fila]
						lds_mt_llegada.Object.calidad_mp[ll_insert] 				=  lds_mt_origen.Object.calidad_mp[ll_fila]
						lds_mt_llegada.Object.co_matiz_mp[ll_insert] 			=  lds_mt_origen.Object.co_matiz_mp[ll_fila]
						lds_mt_llegada.Object.co_caracteristi_mp[ll_insert] 	=  lds_mt_origen.Object.co_caracteristi_mp[ll_fila]
						lds_mt_llegada.Object.co_color_mp[ll_insert] 			=  lds_mt_origen.Object.co_color_mp[ll_fila]
						lds_mt_llegada.Object.peso_mp[ll_insert] 					=  ll_peso
						lds_mt_llegada.Object.nu_conos[ll_insert] 				=  lds_mt_origen.Object.nu_conos[ll_fila]
						lds_mt_llegada.Object.fe_creacion[ll_insert] 			=  lds_mt_origen.Object.fe_creacion[ll_fila]			
						lds_mt_llegada.Object.fe_actualizacion[ll_insert] 		=  lds_mt_origen.Object.fe_actualizacion[ll_fila]
						lds_mt_llegada.Object.usuario[ll_insert] 					=  lds_mt_origen.Object.usuario[ll_fila]
						lds_mt_llegada.Object.instancia[ll_insert] 				=  lds_mt_origen.Object.instancia[ll_fila] 
						lds_mt_llegada.Object.co_proveedor[ll_insert] 			=  lds_mt_origen.Object.co_proveedor[ll_fila] 
						lds_mt_llegada.Object.mp_lote[ll_insert] 					=  lds_mt_origen.Object.mp_lote[ll_fila] 
						lds_mt_llegada.Object.cnt_opcion[ll_insert] 				=  ll_cnt_opcion
						lds_mt_llegada.Object.enhebrado[ll_insert] 				=  lds_mt_origen.Object.enhebrado[ll_fila]
						lds_mt_llegada.Object.posicion[ll_insert] 				=  lds_mt_origen.Object.posicion[ll_fila]
						lds_mt_llegada.Object.tension[ll_insert] 					=  lds_mt_origen.Object.tension[ll_fila]
						lds_mt_llegada.Object.co_diseno[ll_insert] 				=  ll_diseno
					END IF
					of_borrar_existente( lds_mt_origen.Object.co_fabrica[ll_fila], lds_mt_origen.Object.co_linea[ll_fila], lds_mt_origen.Object.co_muestra[ll_fila], lds_mt_origen.Object.co_talla[ll_fila], il_recursodest, lds_mt_origen.Object.co_color[ll_fila], ll_nupartemp, ll_diseno, ll_cnt_opcion, lds_mt_origen.Object.nu_mp[ll_fila],(lds_mt_origen.Object.co_combinacion[ll_fila]))
//se debe reemplazar la informacion que venga desde el roriginal en el r destino sin modificar el numero de 
//materias primas que tenga el rdestino adicionar o igualar no disminuir.
//
					ll_2 = lds_mt_llegada.Update( )		
					
					
					
			NEXT

	
		IF ll_1 = 1 AND ll_2 = 1 THEN 
			Commit using n_cst_application.itr_appl;
		ELSE
			RETURN -1
		END IF
	
	END IF
LOOP
RETURN 1
end function

public function long of_diseno_recurso (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra, readonly long al_talla, readonly long al_recursodest);Long ll_maximo

delete from dt_fmp_muestras
where co_muestra = :al_muestra
and co_linea = :al_linea
and co_fabrica =:al_fabrica
and co_diseno = :il_diseno
USING n_cst_application.itr_appl;

delete from h_fmp_muestras
where co_muestra = :al_muestra
and co_linea = :al_linea
and co_fabrica =:al_fabrica
and co_diseno = :il_diseno
USING n_cst_application.itr_appl;


COMMIT USING n_cst_application.itr_appl;

RETURN ll_maximo
end function

public function integer of_borrar_existente (readonly long a_fabrica, readonly long a_linea, readonly long a_muestra, readonly long a_talla, readonly long al_recurso, readonly long al_color, readonly long al_parte, readonly long al_diseno, readonly long al_opcion, readonly long al_nump, readonly long al_combinacion);long   ll_filas
  
//  85309
  IF Trim(String(al_combinacion,'')) <> '' THEN	
	
	  SELECT count(dt_fmp_muestras.co_fabrica)
	  INTO :ll_filas
		 FROM dt_fmp_muestras,   
				h_fmp_muestras  
		WHERE dt_fmp_muestras.co_fabrica = h_fmp_muestras.co_fabrica
		and   dt_fmp_muestras.co_linea = h_fmp_muestras.co_linea  
		and   dt_fmp_muestras.co_muestra = h_fmp_muestras.co_muestra  
		and   dt_fmp_muestras.co_talla = h_fmp_muestras.co_talla  
		and   dt_fmp_muestras.co_color = h_fmp_muestras.co_color  
		and   dt_fmp_muestras.CO_DISENO = h_fmp_muestras.CO_DISENO  
		and   dt_fmp_muestras.co_fabrica = :a_fabrica  
		AND   dt_fmp_muestras.co_linea = :a_linea  
		AND   dt_fmp_muestras.co_muestra = :a_muestra   
		AND   dt_fmp_muestras.co_talla = :a_talla  
		AND   h_fmp_muestras.CO_recurso = :al_recurso
		AND 	dt_fmp_muestras.co_color = :al_color
		AND 	dt_fmp_muestras.co_partemp = :il_prueba
		AND 	dt_fmp_muestras.co_diseno = :al_diseno
		AND 	dt_fmp_muestras.cnt_opcion = :al_opcion
		AND 	dt_fmp_muestras.co_combinacion = :al_combinacion
		USING n_cst_application.itr_appl;
		
		
		IF ll_filas > 0 THEN
			DELETE FROM dt_fmp_muestras
			WHERE dt_fmp_muestras.co_fabrica = :a_fabrica  
			AND   dt_fmp_muestras.co_linea = :a_linea  
			AND   dt_fmp_muestras.co_muestra = :a_muestra  
			AND   dt_fmp_muestras.co_talla = :a_talla  
			AND 	dt_fmp_muestras.co_color = :al_color
			AND 	dt_fmp_muestras.nu_partemp = :al_parte
			AND 	dt_fmp_muestras.co_diseno = :al_diseno
			AND 	dt_fmp_muestras.cnt_opcion = :al_opcion
			AND 	dt_fmp_muestras.nu_mp = :al_nump
			AND 	dt_fmp_muestras.co_combinacion = :al_combinacion
			USING n_cst_application.itr_appl;
		END IF
	ELSE
			
	  SELECT count(dt_fmp_muestras.co_fabrica)
	  INTO :ll_filas
		 FROM dt_fmp_muestras,   
				h_fmp_muestras  
		WHERE dt_fmp_muestras.co_fabrica = h_fmp_muestras.co_fabrica
		and   dt_fmp_muestras.co_linea = h_fmp_muestras.co_linea  
		and   dt_fmp_muestras.co_muestra = h_fmp_muestras.co_muestra  
		and   dt_fmp_muestras.co_talla = h_fmp_muestras.co_talla  
		and   dt_fmp_muestras.co_color = h_fmp_muestras.co_color  
		and   dt_fmp_muestras.CO_DISENO = h_fmp_muestras.CO_DISENO  
		and   dt_fmp_muestras.co_fabrica = :a_fabrica  
		AND   dt_fmp_muestras.co_linea = :a_linea  
		AND   dt_fmp_muestras.co_muestra = :a_muestra  
		AND   dt_fmp_muestras.co_talla = :a_talla  
		AND   h_fmp_muestras.CO_recurso = :al_recurso
		AND 	dt_fmp_muestras.co_color = :al_color
		AND 	dt_fmp_muestras.nu_partemp = :al_parte
		AND 	dt_fmp_muestras.co_diseno = :al_diseno
		AND 	dt_fmp_muestras.cnt_opcion = :al_opcion
		AND 	dt_fmp_muestras.nu_mp = :al_nump
		USING n_cst_application.itr_appl;
		
		IF ll_filas > 0 THEN
			DELETE FROM dt_fmp_muestras
			WHERE dt_fmp_muestras.co_fabrica = :a_fabrica  
			AND   dt_fmp_muestras.co_linea = :a_linea  
			AND   dt_fmp_muestras.co_muestra = :a_muestra  
			AND   dt_fmp_muestras.co_talla = :a_talla  
			AND 	dt_fmp_muestras.co_color = :al_color
			AND 	dt_fmp_muestras.nu_partemp = :al_parte
			AND 	dt_fmp_muestras.co_diseno = :al_diseno
			AND 	dt_fmp_muestras.cnt_opcion = :al_opcion
			AND 	dt_fmp_muestras.nu_mp = :al_nump
			USING n_cst_application.itr_appl;
		END IF
	END IF
		
	
	return 1 
end function

public function integer of_borrar_existente_bk (readonly long a_fabrica, readonly long a_linea, readonly long a_muestra, readonly long a_talla, readonly long al_recurso, readonly long al_color, readonly long al_parte, readonly long al_diseno, readonly long al_opcion, readonly long al_nump, readonly long al_combinacion);long   ll_filas
  
  
  IF Trim(String(al_combinacion,'')) <> '' THEN	
	
	  SELECT count(dt_fmp_muestras.co_fabrica)
	  INTO :ll_filas
		 FROM dt_fmp_muestras,   
				h_fmp_muestras  
		WHERE dt_fmp_muestras.co_fabrica = h_fmp_muestras.co_fabrica
		and   dt_fmp_muestras.co_linea = h_fmp_muestras.co_linea  
		and   dt_fmp_muestras.co_muestra = h_fmp_muestras.co_muestra  
		and   dt_fmp_muestras.co_talla = h_fmp_muestras.co_talla  
		and   dt_fmp_muestras.co_color = h_fmp_muestras.co_color  
		and   dt_fmp_muestras.CO_DISENO = h_fmp_muestras.CO_DISENO  
		and   dt_fmp_muestras.co_fabrica = :a_fabrica  
		AND   dt_fmp_muestras.co_linea = :a_linea  
		AND   dt_fmp_muestras.co_muestra = :a_muestra  
		AND   dt_fmp_muestras.co_talla = :a_talla  
		AND   h_fmp_muestras.CO_recurso = :al_recurso
		AND 	dt_fmp_muestras.co_color = :al_color
		AND 	dt_fmp_muestras.nu_partemp = :al_parte
		AND 	dt_fmp_muestras.co_diseno = :al_diseno
		AND 	dt_fmp_muestras.cnt_opcion = :al_opcion
		AND 	dt_fmp_muestras.nu_mp = :al_nump
		AND 	dt_fmp_muestras.co_combinacion = :al_combinacion
		USING n_cst_application.itr_appl;
		
		IF ll_filas > 0 THEN
			DELETE FROM dt_fmp_muestras
			WHERE dt_fmp_muestras.co_fabrica = :a_fabrica  
			AND   dt_fmp_muestras.co_linea = :a_linea  
			AND   dt_fmp_muestras.co_muestra = :a_muestra  
			AND   dt_fmp_muestras.co_talla = :a_talla  
			AND 	dt_fmp_muestras.co_color = :al_color
			AND 	dt_fmp_muestras.nu_partemp = :al_parte
			AND 	dt_fmp_muestras.co_diseno = :al_diseno
			AND 	dt_fmp_muestras.cnt_opcion = :al_opcion
			AND 	dt_fmp_muestras.nu_mp = :al_nump
			AND 	dt_fmp_muestras.co_combinacion = :al_combinacion
			USING n_cst_application.itr_appl;
		END IF
	ELSE
			
	  SELECT count(dt_fmp_muestras.co_fabrica)
	  INTO :ll_filas
		 FROM dt_fmp_muestras,   
				h_fmp_muestras  
		WHERE dt_fmp_muestras.co_fabrica = h_fmp_muestras.co_fabrica
		and   dt_fmp_muestras.co_linea = h_fmp_muestras.co_linea  
		and   dt_fmp_muestras.co_muestra = h_fmp_muestras.co_muestra  
		and   dt_fmp_muestras.co_talla = h_fmp_muestras.co_talla  
		and   dt_fmp_muestras.co_color = h_fmp_muestras.co_color  
		and   dt_fmp_muestras.CO_DISENO = h_fmp_muestras.CO_DISENO  
		and   dt_fmp_muestras.co_fabrica = :a_fabrica  
		AND   dt_fmp_muestras.co_linea = :a_linea  
		AND   dt_fmp_muestras.co_muestra = :a_muestra  
		AND   dt_fmp_muestras.co_talla = :a_talla  
		AND   h_fmp_muestras.CO_recurso = :al_recurso
		AND 	dt_fmp_muestras.co_color = :al_color
		AND 	dt_fmp_muestras.nu_partemp = :al_parte
		AND 	dt_fmp_muestras.co_diseno = :al_diseno
		AND 	dt_fmp_muestras.cnt_opcion = :al_opcion
		AND 	dt_fmp_muestras.nu_mp = :al_nump
		USING n_cst_application.itr_appl;
		
		IF ll_filas > 0 THEN
			DELETE FROM dt_fmp_muestras
			WHERE dt_fmp_muestras.co_fabrica = :a_fabrica  
			AND   dt_fmp_muestras.co_linea = :a_linea  
			AND   dt_fmp_muestras.co_muestra = :a_muestra  
			AND   dt_fmp_muestras.co_talla = :a_talla  
			AND 	dt_fmp_muestras.co_color = :al_color
			AND 	dt_fmp_muestras.nu_partemp = :al_parte
			AND 	dt_fmp_muestras.co_diseno = :al_diseno
			AND 	dt_fmp_muestras.cnt_opcion = :al_opcion
			AND 	dt_fmp_muestras.nu_mp = :al_nump
			USING n_cst_application.itr_appl;
		END IF
	END IF
		
	
	return 1 
end function

public function string of_snrecurso_cotizado (long al_fabrica, long al_linea, long al_muestra, long al_talla, long al_recurso);STRING	sncotizado

SELECT	'S'
INTO		:sncotizado
FROM		DT_MUESTRAS D
WHERE		(D.CO_RECCOTCIERRA = :al_recurso OR D.CO_RECCOTNOCIERRA = :al_recurso)
AND		D.CO_FABRICA = :al_fabrica
AND		D.CO_LINEA = :al_linea
AND		D.CO_MUESTRA = :al_muestra
AND		D.CO_TALLA = :al_talla
USING n_cst_application.itr_appl
;

IF IsNull(sncotizado) OR sncotizado = "" THEN
	sncotizado = 'N'
END IF

RETURN sncotizado
end function

public function boolean of_mail_cambio (long al_fabrica, long al_linea, long al_muestra, long al_recurso);String ls_usuario, ls_msg, ls_error, ls_asunto
Long ll_solicitud, ll_existe, ll_inicio, ll_long

u_ds_base			lds_datos
lds_datos		= 	CREATE u_ds_base

lds_datos.DataObject = 'd_datos_correo'
lds_datos.SetTransobject(n_cst_application.itr_appl)
lds_datos.retrieve(al_muestra, al_fabrica, al_linea)
ll_existe = lds_datos.rowcount( )

IF ll_existe > 0 THEN
	
	ls_asunto='Referencia '+String(lds_datos.Object.co_referencia[1])
	
	ls_msg= " El material "+String(lds_datos.Object.co_referencia[1],'')+" talla: "+String(lds_datos.Object.co_talla[1],'')+&
			  " Recurso: "+String(al_recurso)+" muestrario: "+String(lds_datos.Object.co_muestrario[1],'')+" ha sido modificado "+&
			  " por el usuario: "+n_cst_application.is_user+","+&
			  " en FICHA DE MATERIA PRIMA. Fecha de Creaci$$HEX1$$f300$$ENDHEX$$n (o modificaci$$HEX1$$f300$$ENDHEX$$n): "+String(DateTime(Date(Today()),Time(Now())))+""
	
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
		Return False
	End If

	// Cierra el procedimiento almacenado declarado
	Close pr_envia_mail;
	*/
	
	uo_correo			lnv_correo
	lnv_correo 		= CREATE uo_correo

	TRY
		lnv_correo.of_enviar_correo(ls_asunto, ls_msg, "datos_maestros")
	CATCH(Exception ex)
		Messagebox("Error", ex.getmessage())
	END TRY
	
	DESTROY lnv_correo
	RETURN TRUE
ELSE
	RETURN FALSE
END IF
end function

public subroutine of_set_dsmuestrabasica (datastore ads_dsorigen);//=========================================================================
// Funcion	:	of_set_dsmuestrabasica
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	setter ds con los datos origen muestra basica
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ
ids_muestraBasica = ads_dsOrigen
end subroutine

public function datastore of_get_dsmuestrabasica ();//=========================================================================
// Funcion	:	of_get_dsmuestrabasica
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	obtener ds con datos de origen 
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ
return ids_muestraBasica
end function

public function integer of_grabarmuestrabasica (datastore ads_inforecursodestino, long al_recurso);//=========================================================================
// Funcion	:	of_GrabarMuestraBasica
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	Grabar los datos de Muestra Basica 
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ
//se obtiene el datastore proveniente de la ventana Muestra Basica
//posteriormente se le realiza el borrado del recurso que se creara de nuevo
//posteriormente se setea el campo co_recurso con setitem para luego hacer el .update
//se comita y destruye el objeto
DataStore ds_copiaralrecurso

IF of_borrarmuesbasirecurso(al_recurso) = 1 THEN
	//Se graba la informacion basado en el ds origen en el de destino, solo cambio el recurso
	IF ads_inforecursodestino.Update(True,False)<>1 THEN
		RollBack Using n_cst_application.itr_appl;
		Return -1
	End If
ELSE 
	RollBack Using n_cst_application.itr_appl;
	Return -1
END IF
of_commit()
ads_inforecursodestino.ResetUpdate()
Return 1
end function

public function integer of_borrarmuesbasirecurso (long al_recurso);//=========================================================================
// Funcion	:	of_borrarMuesBasiRecurso
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	Borrar el dato para luego almacenarlo de nuevo 
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ

DELETE FROM dt_med_mue_rep
	WHERE dt_med_mue_rep.co_fabrica = :il_fabrica  
	AND   dt_med_mue_rep.co_linea = :il_linea  
	AND   dt_med_mue_rep.co_muestra = :il_muestra   	
	AND   dt_med_mue_rep.co_diseno = :il_diseno
	AND   dt_med_mue_rep.co_recurso = :al_recurso 	
	USING n_cst_application.itr_appl;
			
Return 1
end function

public subroutine of_commit ();//=========================================================================
// Funcion	:	of_commit
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	commit
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ

Commit using n_cst_application.itr_appl;

end subroutine

public subroutine of_set_fabrica (readonly long al_data);//=========================================================================
// Funcion	:	of_set_Atributo
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	setter del atributo
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ
il_fabrica = al_data
end subroutine

public subroutine of_set_linea (readonly long al_data);//=========================================================================
// Funcion	:	of_set_Atributo
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	setter del atributo
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ
il_linea = al_data
end subroutine

public subroutine of_set_muestra (readonly long al_data);//=========================================================================
// Funcion	:	of_set_Atributo
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	setter del atributo
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ
il_muestra = al_data
end subroutine

public function long of_get_fabrica ();//=========================================================================
// Funcion	:	of_get_Atributo
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	setter del atributo
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ
return il_fabrica
end function

public function long of_get_linea ();//=========================================================================
// Funcion	:	of_get_Atributo
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	setter del atributo
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ
return il_linea
end function

public function long of_get_muestra ();//=========================================================================
// Funcion	:	of_get_Atributo
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	setter del atributo
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ
return il_muestra
end function

public subroutine of_set_diseno (readonly long al_data);//=========================================================================
// Funcion	:	of_set_Atributo
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	setter del atributo
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ
il_diseno = al_data
end subroutine

public function long of_get_diseno ();//=========================================================================
// Funcion	:	of_get_Atributo
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	setter del atributo
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ
return il_diseno
end function

public subroutine of_set_talla (readonly long al_data);//=========================================================================
// Funcion	:	of_set_Atributo
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	setter del atributo
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ
il_talla = al_data
end subroutine

public function long of_get_talla ();//=========================================================================
// Funcion	:	of_get_Atributo
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	setter del atributo
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ
return il_talla
end function

public function datastore of_get_ids_infodestino ();//=========================================================================
// Funcion	:	of_cargar_ids_infodestino
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	setter ds con los datos origen muestra basica
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ
return ids_infodestino

end function

public function long of_cargar_ids_infodestino (readonly long al_recurso);//=========================================================================
// Funcion	:	of_cargar_ids_infodestino
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	setter ds con los datos origen muestra basica
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ
lONG ll_tot
ll_tot = ids_infodestino.Retrieve( il_fabrica, il_linea, il_muestra, al_recurso, 0)
If ll_tot<0 Then 
	Return -1
End If
return 1
end function

public function integer of_destruirobjetos ();//=========================================================================
// Funcion	:	of_destruirobjetos()
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	of_destruirobjetos()
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ

DESTROY(ids_muestraBasica)
DESTROY(ids_infodestino)

Return 1 
end function

public subroutine of_set_tipoprod (readonly long al_data);//=========================================================================
// Funcion	:	of_set_Atributo
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	setter del atributo
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ
il_tipoprod = al_data
end subroutine

public function long of_get_tipoprod ();//=========================================================================
// Funcion	:	of_get_Atributo
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	setter del atributo
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ
return il_tipoprod
end function

public function long of_getrecursodestino ();/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName of_getRecursoDestino
<DESC> Description: retornar recurs destino </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Modificacion Correo automatico desde Muestras </USAGE>
********************************************************************/
return il_recursodest
end function

public subroutine of_setrecursodestino (readonly long al_dato);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName of_setRecursoDestino
<DESC> Description: Setter recurso destino </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Modificacion Correo automatico desde Muestras </USAGE>
********************************************************************/
il_recursodest = al_dato
end subroutine

public subroutine of_rollback ();//=========================================================================
// Funcion	:	of_ROLLBACK
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	ROLLBACK transaccion
//=========================================================================

ROLLBACK using n_cst_application.itr_appl;

end subroutine

public function integer of_validargrabarlogreccotizado ();/********************************************************************
SA52045 - Ceiba/jjmonsal - 19-01-2016 FunctionName: of_ValidarGrabarLogRecCotizado
<DESC> Description: Recursos Cotizados </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE>Se adiciona funcionalidad para que al copiar la info desde muestrario a un 
recurso cotizado en muestra basica se genere log y asi generar una alerta por correo </USAGE>
***********************************************************/
Long 			ll_fila, ll_filas, ll_insert, ll_cnt_opcion
String		ls_rec_mod
DataStore 	lds_mt_llegada, lds_mt_origen, lds_coloresorigen, lds_coloresllegada

n_cst_c_log_reccotizado	lnv_c_log_reccotizado
lnv_c_log_reccotizado = CREATE n_cst_c_log_reccotizado	
	
IF of_snrecurso_cotizado(il_fabrica, il_linea, il_muestra, il_talla, il_recursodest) = 'S' THEN
	lnv_c_log_reccotizado.of_setFabrica(il_fabrica)
	lnv_c_log_reccotizado.of_setLinea(il_linea)
	lnv_c_log_reccotizado.of_setMuestra(il_muestra)
	lnv_c_log_reccotizado.of_setRecurso(il_recursodest)
	ls_rec_mod = lnv_c_log_reccotizado.of_recurso_mod(il_muestra, il_linea,il_fabrica, il_recursodest)
	IF lnv_c_log_reccotizado.of_cargarInfoReporteRecCotizado(ls_rec_mod,il_muestrariodest) = -1 THEN 
		of_rollBack()
		RETURN -1
	END IF 
	
	of_commit()
END IF

IF IsValid(lnv_c_log_reccotizado) THEN 
	Destroy lnv_c_log_reccotizado
END IF 

RETURN 1
end function

on n_cst_copiar_recurso.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_copiar_recurso.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;ids_mt_prima				= CREATE DataStore
ids_Colores					= CREATE DataStore
ids_color_muestrario		= CREATE DataStore
ids_muestraBasica			= CREATE DataStore
ids_infodestino			= CREATE DataStore

ids_mt_prima.DataObject = 'd_mt_muestras_colores'
ids_Colores.DataObject = 'd_dt_fmp_colores'
ids_color_muestrario.DataObject = 'd_color_muestrario'
ids_muestraBasica.DataObject = 'd_dt_med_mue_rep'
ids_infodestino.DataObject = 'd_dt_med_mue_rep'


ids_mt_prima.SetTransobject( n_cst_application.itr_appl)
ids_Colores.SetTransobject( n_cst_application.itr_appl)
ids_muestraBasica.SetTransobject( n_cst_application.itr_appl)
ids_infodestino.SetTransobject( n_cst_application.itr_appl)






end event

