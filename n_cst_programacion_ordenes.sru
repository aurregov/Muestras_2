HA$PBExportHeader$n_cst_programacion_ordenes.sru
$PBExportComments$Esta es la clase encargada de la programaci$$HEX1$$f300$$ENDHEX$$n de ordenes
forward
global type n_cst_programacion_ordenes from nonvisualobject
end type
end forward

global type n_cst_programacion_ordenes from nonvisualobject autoinstantiate
end type

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 06 de Diciembre de 2004.H:11:40
---------------------------------------------------
Variables instancia para la clase encargada de la 
programaci$$HEX1$$f300$$ENDHEX$$n de $$HEX1$$f300$$ENDHEX$$rdenes
---------------------------------------------------*/
//--------------------------------------------------------------------------------------------------
PROTECTED:
		Long 		il_vector_grupos_examina[],il_vector_maquinas_examina[] //Lista de los grupos,m$$HEX1$$e100$$ENDHEX$$quinas a examinar
		Long		il_orden,il_estado,il_grupo,il_maquina,il_recurso,il_fabrica,il_linea,il_muestra,il_fabrica_mue//Grupo, M$$HEX1$$e100$$ENDHEX$$quina que se va a asignar a la tarea
		Integer	ii_cola_grupo,ii_cola_maquina	//Cola del grupo al que se le va a asignar la tarea
		DateTime idtm_fechaHora_programacion_ini,idtm_fechaHora_programacion_fin //Fecha y hora programaci$$HEX1$$f300$$ENDHEX$$n de la tarea
		Decimal{2} ide_tiempotarea
		n_cst_comun_orden iuo_comun
		datetime  idt_fechaHoraFinal
		string    is_tipo_muestra
		//Se adiciona los campos linea,muestra y fabrica de la muestra para poder verificar si la muestra fue convertida o no a referenica: SA51505 - Ceiba/JJ - 18-08-2015
//--------------------------------------------------------------------------------------------------
PUBLIC:
		n_ds_application	ids_grupos 						//Datastore con la lista de grupos.Se tiene el grupo con su respectivo turno
		n_ds_application	ids_turnos 						//Datastore con la lista de turnos.Se tiene el turno con su respectivo detalle de horarios
		n_ds_application	ids_festivos 					//Datastore para tener la lista de festivos fechas desde el momento hasta un a$$HEX1$$f100$$ENDHEX$$o adelante
		n_ds_application	ids_recurso_grupo 			//Datastore para tener los recursos asignados a los grupos
		n_ds_application	ids_estado_tarea_grupo 		//Datastore 
		n_ds_application	ids_tareas_orden,ids_tareas_copia				//Datastore 
		n_ds_application 	ids_estado_tarea_mtin		//Datastore 
		n_ds_application	ids_maq_tin						//Datastore 
		n_ds_application	ids_estado_tarea_recurso	//Datastore 
		n_ds_application	ids_maquinas_examina			//Datastore 
		n_ds_application	ids_activ_oper_rec			//Datastore 
		n_ds_application  ids_momento_predecesor
		n_ds_application  ids_verif_precedencia_new  //precedencias en memory
		n_ds_application  ids_grupos_busca			   //para buscar grupos
		n_ds_application  ids_lista_grupos_colas     //colas de los grupos
		n_ds_application  ids_maquinas               //para buscar maquina
		n_ds_application  ids_lista_maquinas_colas   //busca cola de maquinas
		n_ds_application  ids_vector_grupos				//para no repetir grupos
		n_ds_application  ids_vector_tin             //para no repetir mtin
//--------------------------------------------------------------------------------------------------
long    il_tot_tareas,il_grupo_procesador, il_tipoprod
//tring  is_tipo_muestra 

end variables

forward prototypes
public function integer of_programarorden (long al_orden, datetime adtm_fecha_inicio)
public function decimal of_estimartiempo (long al_turno, datetime adtm_fechahora1, datetime adtm_fechahora2)
public function decimal of_horasmanana (date adt_fecha, long al_turno)
public function decimal of_horas (date adt_fecha, long al_turno)
public function integer of_load_ids ()
public function integer of_obtenergrupo (decimal ade_tiempo_tarea, datetime adtm_fecha_hora_inicio)
private function decimal of_estimartiempotin (time atm_hora_ini_maq, decimal ade_horas_maq, datetime adtm_fechahora1, datetime adtm_fechahora2)
public function integer of_obtenermaquinatin (decimal ade_tiempo_tarea, datetime adtm_fecha_hora_inicio)
public function long of_vector_valor (ref long al_vector[])
public function integer of_rb ()
public function integer of_set_recurso (long al_recurso)
public function time of_ini_turno (date adt_var_feini, long al_turno)
public function integer of_validar_peso_maquina (long al_fabrica, long al_maquina, decimal ade_peso_maq)
public function integer of_vector_valor ()
public function integer of_win_yield ()
public function integer of_win_stepit ()
private function long of_dia_habil_turno (ref date adt_var_feini, long al_turno, ref decimal ade_horas_manana)
public function integer of_addminturno (ref datetime adtm_fechahora, long al_turno, decimal ade_minutos)
public function integer of_fechahoraprecede (long a_tipotarea, long a_codigotarea, long a_conscolor)
public function integer of_actualizartarea (long al_nu_orden, long al_consec, long al_grupo, long al_cola_grupo, long al_fabrica, long al_maqtin, long al_cola_mq_tin, long al_condicion)
public function integer of_set_tipo_muestra (string as_tipo_muestra)
public function boolean of_validarrecursodisponibledllo ()
public function boolean of_validarconvertidoref ()
public function long of_getlinea ()
public subroutine of_setlinea (readonly long al_valor)
public function long of_getmuestra ()
public subroutine of_setmuestra (readonly long al_valor)
public function long of_getfabricamuestra ()
public subroutine of_setfabricamuestra (readonly long al_valor)
end prototypes

public function integer of_programarorden (long al_orden, datetime adtm_fecha_inicio);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 06 de Diciembre de 2004.H:11:40
---------------------------------------------------
La fecha y hora para programar, debe ser una fecha futura, si es menor que el momento en que 
se hace la programaci$$HEX1$$f300$$ENDHEX$$n,se debe tomar el momento de programaci$$HEX1$$f300$$ENDHEX$$n.
No se debe tomar un fecha u hora pasadas. Se recupera la lista de tareas de la orden 
estas se ordenan por el campo posici$$HEX1$$f300$$ENDHEX$$n
---------------------------------------------------
SA51505 - Ceiba/JJ - 18-08-2015
Comentario: Se adiciona recomendacion para cambiar el recurso, pues el actual no esta habilitado para desarrollo 
esto siempre y cuando la muestra ya est$$HEX2$$e9002000$$ENDHEX$$convertida a referencia 
-------------------------------------------------*/
Long ll_estado,ll_recurso,ll_i,ll_grupo_intersec,ll_k,ll_vec[]
Long ll_operacion,ll_actividad,ll_null,ll_consec,ll_j,ll_maq_peso,ll_co_fabrica,ll_cs_maquina
Decimal lde_tiempotarea,lde_kilos
DateTime ldtm_predecesor,ldtm_fechahora_ini_tarea
long ll_res,ll_pos,ll_condicion

String ls_exp,ls_msj,ls_es_procesador
Integer li_res

long ll_nuSolServ, ll_consColor,ll_posicion,j,ll_tot_pred,ll_find,ll_estado1
long ll_can,ll_tipoTarea,ll_codigoTarea

long ll_gru_asig,ll_fab_asig,ll_maq_asig
//-------------------------------------------------
If IsNull(al_orden) OR al_orden<=0 Then
	MessageBox('Advertencia','El c$$HEX1$$f300$$ENDHEX$$digo de la orden para iniciar la programaci$$HEX1$$f300$$ENDHEX$$n no es v$$HEX1$$e100$$ENDHEX$$lido',StopSign!)
	Return -1
End If
il_orden=al_orden
If IsNull(adtm_fecha_inicio) Then
	MessageBox('Advertencia','La fecha de inicio para la programaci$$HEX1$$f300$$ENDHEX$$n no es v$$HEX1$$e100$$ENDHEX$$lida para la orden # '+String(al_orden),StopSign!)	
	Return -1
End If

il_tot_tareas=ids_tareas_orden.Retrieve(il_orden)
Choose Case il_tot_tareas
	Case Is < 0
		MessageBox('Advertencia','Error en la recuperaci$$HEX1$$f300$$ENDHEX$$n de las tareas para la orden # ~''+String(il_orden)+'~'',StopSign!)
		Return -1
	Case 0
		MessageBox('Advertencia','No se encontraron tareas asignadas a la orden # ~''+String(il_orden)+'~'',StopSign!)
		Return -1
End Choose
//Se ordenan las tareas de la orden por el campo 'posicion' que es asignado seg$$HEX1$$fa00$$ENDHEX$$n el criterio del desarrollador
ids_tareas_orden.SetSort('posicion A')
ids_tareas_orden.Sort()
/*****************************************
En algunos casos particulares las tareas se muestran por estado,
que es lo que realmente interesa en los movimientos, este es un caso particular,
cuando se presentan varias operaciones en un estado, el grupo solo debe ver el
estado en que esta con la lista de actividades.*/

//If il_orden=630 Then
//	MessageBox("Advertencia!","Hola",StopSign!)
//End If
Datetime ldt_null

SetNull(ldt_null)
For ll_k=1 To il_tot_tareas
	ids_tareas_orden.SetItem(ll_k,"f_mov_fin",ldt_null)
Next

//////////////////////////////////////////////////////////////////////////
// Se inicializa grupo procesador en -1, indicando que no se tiene 
// un grupo asignado.
//////////////////////////////////////////////////////////////////////////

il_grupo_procesador=-1

For ll_k=1 To il_tot_tareas
	ll_operacion   =ids_tareas_orden.GetItemNumber (ll_k,'co_operacion')
	ll_actividad   =ids_tareas_orden.GetItemNumber (ll_k,'id_actividad')
	ll_nuSolServ   =ids_tareas_orden.GetItemNumber (ll_k,'nu_sol_serv' )
	ll_consColor   =ids_tareas_orden.GetItemNumber (ll_k,'cons_color'  )
	ll_estado      =ids_tareas_orden.GetItemNumber (ll_k,'co_estado'   )
	ll_posicion    =ids_tareas_orden.GetItemNumber (ll_k,'posicion'    )
	lde_tiempotarea=ids_tareas_orden.GetItemDecimal(ll_k,'minutos'     )
	ll_consec      =ids_tareas_orden.GetItemNumber (ll_k,'consec'      )
	
	ll_condicion   =ids_tareas_orden.GetItemNumber (ll_k,'condicion'   )
	
	ll_gru_asig    =ids_tareas_orden.GetItemNumber (ll_k,'co_grupo'    )
	ll_fab_asig    =ids_tareas_orden.GetItemNumber (ll_k,'co_fabrica'    )
	ll_maq_asig    =ids_tareas_orden.GetItemNumber (ll_k,'cs_maquina'    )
	
	If IsNull(ll_actividad) Then
		//tipo 1 para operaciones
		ll_tipoTarea=1
		ls_exp='co_operacion='+String(ll_operacion)					
		ll_codigoTarea=ll_operacion
	Else
		//tipo 2 para actividades
		ll_tipoTarea=2
		ls_exp='id_actividad='+String(ll_actividad)
		ll_codigoTarea=ll_actividad
	End If	
	
	If IsNull(lde_tiempotarea) OR lde_tiempotarea<=0 Then

		MessageBox('Advertencia','El tiempo estimado para la tarea en la posici$$HEX1$$f300$$ENDHEX$$n # '+&
						String(ll_posicion)+' no es v$$HEX1$$e100$$ENDHEX$$lido, tarea por solicitud de servicio, perteneciente a la orden # '+String(al_orden))
		Return -1
	End If
	
//////////////////////////////////////////////////////////////////////////
// verifico si la tarea tiene maq de tin asignadas.
// 
//////////////////////////////////////////////////////////////////////////

	ids_estado_tarea_mtin.SetFilter(ls_exp)
	ids_estado_tarea_mtin.Filter()					
	
	ll_can=ids_estado_tarea_mtin.RowCount()
	
	If ll_can>0 Then
//////////////////////////////////////////////////////////////////////////
// Cuando se esta reprogramando las tareas que ya estan programadas deben ser
// asignadas a la misma maquina y al mismo grupo que tenian inicialmente.
//////////////////////////////////////////////////////////////////////////
		
		If ll_condicion=14 or ll_condicion=15 or ll_condicion=16 Then
			ids_maquinas_examina.Reset()
			ll_i=ids_maquinas_examina.InsertRow(0)
			ids_maquinas_examina.SetItem(ll_i,'co_fabrica',ll_fab_asig)
			ids_maquinas_examina.SetItem(ll_i,'cs_maquina',ll_maq_asig)													
		Else

//////////////////////////////////////////////////////////////////////////
// Se verifican las maquinas con la capacidad adecuada
// 
//////////////////////////////////////////////////////////////////////////
			lde_kilos=ids_tareas_orden.GetItemDecimal(ll_k,'ca_kilos')
			
			If IsNull(lde_kilos) Then
				lde_kilos=0
			End If
			
			//il_vector_maquinas_examina=ll_vec
			ids_maquinas_examina.Reset()
			If lde_kilos>0 Then		
				For j=1 To ids_estado_tarea_mtin.RowCount()
					ll_co_fabrica=ids_estado_tarea_mtin.GetItemNumber(j,'co_fabrica')
					ll_cs_maquina=ids_estado_tarea_mtin.GetItemNumber(j,'cs_maquina')
					ll_j=This.of_validar_peso_maquina(ll_co_fabrica,ll_cs_maquina,lde_kilos)
					Choose Case ll_j
						Case 1
							ll_i=ids_maquinas_examina.InsertRow(0)
							ids_maquinas_examina.SetItem(ll_i,'co_fabrica',ll_co_fabrica)
							ids_maquinas_examina.SetItem(ll_i,'cs_maquina',ll_cs_maquina)													
							//il_vector_maquinas_examina[UpperBound(il_vector_maquinas_examina)+1]=ll_maq_peso
						Case -2
							Return -1
					End Choose
				Next
				
				If ids_maquinas_examina.RowCount()<=0 Then
					/*(JFVD): Creo que no se va a presentar,pero como veo las cosas no
						deberia programarla y si generar una advertencia*/
					
					MessageBox('Advertencia','No se encontraron m$$HEX1$$e100$$ENDHEX$$quinas que soportaran los kilos de la tarea en la posici$$HEX1$$f300$$ENDHEX$$n # '+&
						String(ll_posicion)+',tarea por solicitud de servicio, perteneciente a la orden # '+String(al_orden),StopSign!)
					Return -1
				End If
			Else 
	//////////////////////////////////////////////////////////////////////////
	// Si no se tienen kilos se consideran todas las maquinas de tin
	// 
	//////////////////////////////////////////////////////////////////////////
				For ll_i=1 To ids_estado_tarea_mtin.RowCount()
					ll_j=ids_maquinas_examina.InsertRow(0)
					ids_maquinas_examina.SetItem(ll_j,'co_fabrica',ids_estado_tarea_mtin.GetItemNumber(ll_i,'co_fabrica'))
					ids_maquinas_examina.SetItem(ll_j,'cs_maquina',ids_estado_tarea_mtin.GetItemNumber(ll_i,'cs_maquina'))
				Next
			End If					
			//----------------------------------------------					
			//Cargar el vector de m$$HEX1$$e100$$ENDHEX$$quinas de tintorer$$HEX1$$ed00$$ENDHEX$$a que pueden atender la tarea						
			li_res=This.of_vector_valor()
			If li_res<>1 Then Return li_res
		End If //para ver si estaba programada o no condiciones 14,15,16
		
		
		//----------------------------------------------							
		//----------------------------------------------										
		ll_res=of_fechaHoraPrecede(ll_tipoTarea /*long a_tipotarea*/,&
											ll_codigoTarea/*long a_codigotarea*/,&
											ll_consColor/*long a_conscolor */)
											
		If ll_res=1 Then
			ldtm_predecesor=idt_fechaHoraFinal
		Else
			ldtm_predecesor=adtm_fecha_inicio
		End If


	//		//ll_tot_pred=lds_momento_predecesor.Retrieve(il_orden,ll_estado)
	//		ll_tot_pred=ids_momento_predecesor.&
	//		            Retrieve(il_orden,ll_tipoTarea,ll_codigoTarea,ll_consColor)
	//						
	//		Choose Case ll_tot_pred
	//			Case Is < 0
	//				MessageBox('Advertencia','Error en la recuperaci$$HEX1$$f300$$ENDHEX$$n del momento predecesor'+&
	//							' para la tarea en la posici$$HEX1$$f300$$ENDHEX$$n # '+String(ll_posicion)+', tarea por solicitud de servicio, perteneciente a la orden # '+String(al_orden),StopSign!)																	
	//				Return -1
	//			Case 0									
	//				ldtm_predecesor=adtm_fecha_inicio
	//			Case Else
	//				ldtm_predecesor=ids_momento_predecesor.GetItemDateTime(1,'fe_predecesor')
	//				If IsNull(ldtm_predecesor) Then ldtm_predecesor=adtm_fecha_inicio
	//		End Choose
			//***************************************************************							
		li_res=of_obtenerMaquinaTin(lde_tiempotarea,ldtm_predecesor)
		If  li_res<>1 Then
			Return li_res
		End If
		//INICIO OBTENER GRUPO*******************************************************************************************								
		ids_estado_tarea_grupo.SetFilter(ls_exp)
		ids_estado_tarea_grupo.Filter()
		
		ll_can=ids_estado_tarea_grupo.RowCount()
		
		If ll_can>0 Then
			//Se coloca por defecto en la cola 1.Informativo
			//siempre debe ser el mismo grupo el que tenga la maq tin
			il_grupo=ids_estado_tarea_grupo.GetItemNumber(1,'id_grupo')
			ii_cola_grupo=1
		Else
			SetNull(il_grupo)
			SetNull(ii_cola_grupo)
		End If							
		//FIN OBTENER GRUPO*******************************************************************************************						
		//SetNull(ll_null)					
		
		ide_tiempotarea=lde_tiempotarea
		li_res=of_actualizartarea(il_orden,ll_consec,il_grupo,ii_cola_grupo,il_fabrica,&
									il_maquina,ii_cola_maquina,ll_condicion)
		If  li_res<>1 Then
			Return li_res
		End If
		//FIN SI se encontraron registros para las m$$HEX1$$e100$$ENDHEX$$quinas
	
	Else 
//////////////////////////////////////////////////////////////////////////
// En este caso se hace asignacion de grupos
// Se tiene en cuenta que si el grupo ya se habia asignado es decir los de
// condicion 14,15,16 se debe respetar
//////////////////////////////////////////////////////////////////////////

		If ll_condicion=14 or ll_condicion=15 or ll_condicion=16 Then
			il_vector_grupos_examina=ll_vec
			il_vector_grupos_examina[1]=ll_gru_asig
		Else
//////////////////////////////////////////////////////////////////////////
// Aca se hace asignaci$$HEX1$$f300$$ENDHEX$$n de grupos, 
// Se asume que todas las tareas de un mismo estado se asignan a un mismo
// grupo
//////////////////////////////////////////////////////////////////////////
			If ll_k>1 Then
				ll_estado1=ids_tareas_orden.GetItemNumber (ll_k -1,'co_estado'   )
			Else
				ll_estado1=-1
			End If
			
			If ll_estado=ll_estado1 Then
//////////////////////////////////////////////////////////////////////////
// Aca se coloca el mismo grupo de la tarea anterior, porque son
// del mismo estado
//////////////////////////////////////////////////////////////////////////

				il_vector_grupos_examina=ll_vec
				il_vector_grupos_examina[1]=il_grupo
			
			Else

				ids_estado_tarea_grupo.SetFilter(ls_exp)
				ids_estado_tarea_grupo.Filter()
				
				ll_can=ids_estado_tarea_grupo.RowCount()
				
				If ll_can=0 Then
					MessageBox('Advertencia','No se encontraron grupos'+&
					' para la tarea en la posici$$HEX1$$f300$$ENDHEX$$n # '+String(ll_posicion)+', perteneciente a la orden # '+String(al_orden),StopSign!)																	
						Return -1
				End If
				//--------------------------------------
				// Buscar grupos del recurso de tejido							
				//------------------------------------------------------------------------
				// El tipo de muestra EN quiere decir Ambos (Exportaciones y Nacional )
				// matriculado en la tabla m_mu_grupo
				//------------------------------------------------------------------------
				ids_recurso_grupo.SetFilter('co_recurso='+String(il_recurso)+' AND ( tipo_muestra = "' + is_tipo_muestra + '" OR tipo_muestra = "EN")' )
				// ids_recurso_grupo.SetFilter('co_recurso='+String(il_recurso) )
				ll_can = ids_recurso_grupo.Filter()
				
				ll_can=ids_recurso_grupo.RowCount()
				//--------------------------------------
				il_vector_grupos_examina=ll_vec
	
				If ll_can>0 Then
					For ll_i=1 To ll_can
						
						ll_grupo_intersec=ids_recurso_grupo.GetItemNumber(ll_i,'id_grupo')
						ll_find=ids_estado_tarea_grupo.Find('id_grupo='+String(ll_grupo_intersec),1,ids_estado_tarea_grupo.RowCount())
						If ll_find>0 Then 
							il_vector_grupos_examina[UpperBound(il_vector_grupos_examina)+1]=ll_grupo_intersec
						End If		
					Next							
				End If	
//////////////////////////////////////////////////////////////////////////
// si la tarea tiene recursos asignados, tiene que haber un grupo con el
// recurso especificado, sino es un error de configuraci$$HEX1$$f300$$ENDHEX$$n
//////////////////////////////////////////////////////////////////////////
				
				ids_activ_oper_rec.SetFilter(ls_exp)
				ids_activ_oper_rec.Filter()
				
				ll_can=ids_activ_oper_rec.RowCount()
				
				If ll_can>0 Then
					ls_msj = 'No se encontraron grupos'+&
						' para la tarea en la posici$$HEX1$$f300$$ENDHEX$$n # '+String(ll_posicion)+&
						', perteneciente a la orden # '+String(al_orden)+", "+&
						"puede ser que no este configurado el recurso "+&
						String(il_recurso)+", puede ser que este no sea de la planta de desarrollo.~n"
					//IF NOT(of_validarConvertidoRef()) OR NOT(of_validarrecursodisponibledllo()) Then
					IF NOT(of_validarrecursodisponibledllo()) Then
						MessageBox('Advertencia',ls_msj + "Debe cambiar el recurso por uno habilitado para desarrollo",StopSign!) //SA51505 - Ceiba/JJ - 18-08-2015
						RETURN -1
					ElseIf UpperBound(il_vector_grupos_examina)<=0 Then
						MessageBox('Advertencia',ls_msj,StopSign!)
						Return -1
					End If
				End If		
//////////////////////////////////////////////////////////////////////////
// Si no hay grupos en la interseccion, entonces se colocan
// todos los que tiene la tarea
//////////////////////////////////////////////////////////////////////////
				
				If UpperBound(il_vector_grupos_examina)<=0 Then
					If ids_estado_tarea_grupo.RowCount()>0 Then
						il_vector_grupos_examina=ids_estado_tarea_grupo.Object.id_grupo.Primary    
					End If
				End If

				If UpperBound(il_vector_grupos_examina)<=0 Then
					MessageBox('Advertencia','No se encontraron grupos para el estado y el recurso de la tarea en la posici$$HEX1$$f300$$ENDHEX$$n # '+&
											String(ll_posicion)+', tarea por solicitud de servicio, perteneciente a la orden # '+String(al_orden),StopSign!)
					Return -1
				End If							
				li_res=This.of_vector_valor(il_vector_grupos_examina)
				If li_res<>1 Then Return li_res
			
			End If
		End If	
		//Se toma el tiempo de la tarea, de la lista que se recuper$$HEX1$$f300$$ENDHEX$$
		//**********************************************************
		lde_tiempotarea=ids_tareas_orden.GetItemDecimal(ll_k,'minutos')
		If IsNull(lde_tiempotarea) OR lde_tiempotarea<=0 Then
			MessageBox('Advertencia','El tiempo estimado para la tarea en la posici$$HEX1$$f300$$ENDHEX$$n # '+&
							String(ll_posicion)+' no es v$$HEX1$$e100$$ENDHEX$$lido, tarea por solicitud de servicio, perteneciente a la orden # '+String(al_orden),StopSign!)
			Return -1
		End If
		//**********************************************************
		//Se toma el momento en el cual se debe hacer la tarea,en este caso se busca la finalizaci$$HEX1$$f300$$ENDHEX$$n
		//de la precedente del estado que se esta examinando.	
		
		ll_res=of_fechaHoraPrecede(ll_tipoTarea /*long a_tipotarea*/,&
											ll_codigoTarea/*long a_codigotarea*/,&
											ll_consColor/*long a_conscolor */)
											
		If ll_res=1 Then
			ldtm_predecesor=idt_fechaHoraFinal
		Else
			ldtm_predecesor=adtm_fecha_inicio
		End If
		
//			ll_tot_pred=ids_momento_predecesor.&
//		            Retrieve(il_orden,ll_tipoTarea,ll_codigoTarea,ll_consColor)
//						
//			Choose Case ll_tot_pred
//				Case Is < 0
//					MessageBox('Advertencia','Error en la recuperaci$$HEX1$$f300$$ENDHEX$$n del momento predecesor '+&
//									'para la tarea en la posici$$HEX1$$f300$$ENDHEX$$n # '+String(ll_posicion)+', tarea por solicitud de servicio, perteneciente a la orden # '+String(al_orden),StopSign!)
//					Return -1
//				Case 0									
//					ldtm_predecesor=adtm_fecha_inicio
//				Case Else
//					ldtm_predecesor=ids_momento_predecesor.GetItemDateTime(1,'fe_predecesor')
//					If IsNull(ldtm_predecesor) Then ldtm_predecesor=adtm_fecha_inicio
//			End Choose							
			/*Se llama un m$$HEX1$$e900$$ENDHEX$$todo que es el encargado de determinar el cual de los grupos hace la tarea,
			se va a tener el vector de instancia con los grupos, el tiempo de la tarea y el momento en
			que se debe iniciar*/	
			
		li_res=of_obtenergrupo (lde_tiempotarea,ldtm_predecesor)
		If  li_res<>1 Then
			Return li_res
		End If
		SetNull(ll_null)
		
/////////////////////////////////////////////////////////////////////////
// Verifico si el grupo es procesador y actualizo el grupo de procesad
// 
//////////////////////////////////////////////////////////////////////////
		If il_grupo_procesador=-1 Then
			ll_pos=ids_grupos.find("id_grupo="+String(il_grupo),1,ids_grupos.RowCount())
			
			If ll_pos>0 Then
				ls_es_procesador=ids_grupos.GetItemString(ll_pos,"es_procesador")
				If ls_es_procesador="S" Then
					il_grupo_procesador=il_grupo
				End If
			End If
		End If
			
		ide_tiempotarea=lde_tiempotarea
		li_res=of_actualizartarea(il_orden,ll_consec,il_grupo,ii_cola_grupo,ll_null/*il_fabrica*/,&
									ll_null/*il_maquina*/,ll_null/*ii_cola_maquina*/,ll_condicion)
		If  li_res<>1 Then
			Return li_res
		End If

	End If//FIN se programa en un grupo

NEXT//Ciclo de las tareas de la orden

//************************************************************************************************
//iuo_comun.of_commit(n_cst_application.itr_appl)
SetNull(il_recurso)
//MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','La programaci$$HEX1$$f300$$ENDHEX$$n de la orden # '+String(il_orden)+' se registr$$HEX2$$f3002000$$ENDHEX$$satisfactoriamente.',Information!)	
//-------------------------------------------------
Return 1
end function

public function decimal of_estimartiempo (long al_turno, datetime adtm_fechahora1, datetime adtm_fechahora2);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 06 de Diciembre de 2004.H:12:21
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n para estimar el tiemo entre dos fecha hora,
considerando un turno
---------------------------------------------------*/
//-------------------------------------------------
Long ll_pos,ll_no_dia,ll_pos_festivo
Date ldt_fecha1, ldt_fecha2,ldt_var_fecha
Decimal{2} 	lde_horas_manana, lde_horas, lde_horas_fh1,lde_horas_principio, &
				lde_hora_ini_turno_dia,lde_horas_final,lde_horas_fh2,lde_horas_turno
Time ltm_horaini
String ls_exp
//-------------------------------------------------
//*************************************************
//Obtengo el n$$HEX1$$fa00$$ENDHEX$$mero de d$$HEX1$$ed00$$ENDHEX$$a para la fecha 1
ll_no_dia=DayNumber(Date(adtm_fechahora1))
ls_exp='id_turno='+String(al_turno)+' AND dia='+String(ll_no_dia)
ll_pos = ids_turnos.Find(ls_exp,1,ids_turnos.RowCount())
If ll_pos<=0 Then
	MessageBox('Advertencia','El c$$HEX1$$f300$$ENDHEX$$digo de turno y horario no fu$$HEX2$$e9002000$$ENDHEX$$encontrado(Horas ma$$HEX1$$f100$$ENDHEX$$ana)',StopSign!)
	Return -1
End If
ltm_horaini=ids_turnos.GetItemTime(ll_pos,'hora_inicio')
lde_hora_ini_turno_dia= Hour(ltm_horaini) + (Minute(ltm_horaini)/60)
//*************************************************
ldt_fecha1 = Date(adtm_fechahora1)
ldt_var_fecha = RelativeDate(ldt_fecha1,-1) //Toma el d$$HEX1$$ed00$$ENDHEX$$a anterior
lde_horas_manana=This.of_horasmanana(ldt_var_fecha,al_turno)
ldt_var_fecha = RelativeDate(ldt_var_fecha,1) //Aumenta el d$$HEX1$$ed00$$ENDHEX$$a ...

lde_horas = This.of_horas(ldt_var_fecha,al_turno) + lde_horas_manana
lde_horas_fh1= Hour(Time(adtm_fechahora1)) + (Minute(Time(adtm_fechahora1))/60)
If lde_horas_manana>0 Then		
		If lde_horas_fh1 <= lde_horas_manana Then
			lde_horas_principio = lde_horas_fh1
		ElseIf lde_horas_fh1 > lde_hora_ini_turno_dia then
			lde_horas_principio=lde_horas_manana + lde_horas_fh1 - lde_hora_ini_turno_dia			
		Else// Este pasa con alg$$HEX1$$fa00$$ENDHEX$$n fenomeno raro de cambio de turno,poco probable
			lde_horas_principio=lde_horas_manana			
		End If
Else 
    lde_horas_principio = lde_horas_fh1 - lde_hora_ini_turno_dia
End If
//Fin del d$$HEX1$$ed00$$ENDHEX$$a uno
//Ciclo para recorrer d$$HEX1$$ed00$$ENDHEX$$as en la mitad si se tienen

Do While (ldt_var_fecha < Date(adtm_fechahora2))
	//Para este chequeo no se concideran domingos ni festivos
	//De los ids
	ll_pos_festivo=ids_festivos.Find('fecha='+String(ldt_var_fecha),1,ids_festivos.RowCount())
	If DayNumber(ldt_var_fecha)<>1 AND ll_pos_festivo=0 Then 
		/*NO se tiene en cuenta el domingo*/	
		lde_horas_manana=This.of_horasmanana(ldt_var_fecha,al_turno)
		ldt_var_fecha=RelativeDate(ldt_var_fecha,1)
		lde_horas=This.of_horas(ldt_var_fecha,al_turno) + lde_horas_manana	
	Else
		ldt_var_fecha=RelativeDate(ldt_var_fecha,1)
	End If
Loop
//Por $$HEX1$$fa00$$ENDHEX$$ltimo se verifica el $$HEX1$$fa00$$ENDHEX$$ltimo d$$HEX1$$ed00$$ENDHEX$$a
//Sumar las horas del $$HEX1$$fa00$$ENDHEX$$ltimo d$$HEX1$$ed00$$ENDHEX$$a
//*SE DEBE HACER PARA EVALUAR EL $$HEX1$$da00$$ENDHEX$$LTIMO A DIA ENCONTRADO
ll_no_dia=DayNumber(Date(ldt_var_fecha))
ls_exp='id_turno='+String(al_turno)+' AND dia='+String(ll_no_dia)
ll_pos = ids_turnos.Find(ls_exp,1,ids_turnos.RowCount())
If ll_pos<=0 Then
	MessageBox('Advertencia','El c$$HEX1$$f300$$ENDHEX$$digo de turno y horario no fu$$HEX2$$e9002000$$ENDHEX$$encontrado(Horas ma$$HEX1$$f100$$ENDHEX$$ana)',StopSign!)
	Return -1
End If
ltm_horaini=ids_turnos.GetItemTime(ll_pos,'hora_inicio')
lde_horas_turno=ids_turnos.GetItemDecimal(ll_pos,'horas')//*
lde_hora_ini_turno_dia= Hour(ltm_horaini) + (Minute(ltm_horaini)/60)//*
lde_horas_fh2= Hour(Time(adtm_fechahora2)) + (Minute(Time(adtm_fechahora2))/60)//*
//******************************************************
If ldt_var_fecha > ldt_fecha1 Then
	lde_horas+= This.of_horas(ldt_var_fecha,al_turno) + lde_horas_manana
End If
If lde_horas_manana>0 Then
		If lde_horas_fh2 <= lde_horas_manana Then
				//Horario de noche, las horas son, las que se gasta en la ma$$HEX1$$f100$$ENDHEX$$ana + las que tiene el d$$HEX1$$ed00$$ENDHEX$$a por la noche
				lde_horas_final = lde_horas_manana - lde_horas_fh2 + This.of_horas(ldt_var_fecha,al_turno)					
		ElseIf lde_horas_fh2 > lde_hora_ini_turno_dia Then//Cuando se hace en la noche
				lde_horas_final = lde_hora_ini_turno_dia + lde_horas_turno - lde_horas_fh2 
		End If
Else
		lde_horas_final = lde_hora_ini_turno_dia + lde_horas_turno - lde_horas_fh2
End If
//********************************************************************
lde_horas= lde_horas - lde_horas_final - lde_horas_principio
//********************************************************************
Return (lde_horas*60)//Devuelve los minutos

end function

public function decimal of_horasmanana (date adt_fecha, long al_turno);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 06 de Diciembre de 2004.H:11:40
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n que retorna las horas del turno en el dia 
siguiente al que se manda como parametro
adt_fecha : Fecha que se va a examinar
al_turno : C$$HEX1$$f300$$ENDHEX$$digo del turno
---------------------------------------------------*/
Long 			ll_pos,ll_no_dia
Decimal{2}	lde_hora_inicio,lde_horas_manana,lde_cantidad_horas
String 		ls_exp
Time 			ltm_horaini
//-------------------------------------------------
If ids_turnos.RowCount()<=0 Then 
	MessageBox('Advertencia','No se encontr$$HEX2$$f3002000$$ENDHEX$$informaci$$HEX1$$f300$$ENDHEX$$n solicitada respecto a los turnos y sus horarios (horas ma$$HEX1$$f100$$ENDHEX$$ana).',StopSign!)
	Return -1
End If
//-------------------------------------------------
ll_no_dia=DayNumber(adt_fecha)
ls_exp='id_turno='+String(al_turno)+' AND dia='+String(ll_no_dia)
ll_pos = ids_turnos.Find(ls_exp,1,ids_turnos.RowCount())
If ll_pos>0 Then
		ltm_horaini=ids_turnos.GetItemTime(ll_pos,'hora_inicio')
		If IsNull(ltm_horaini)Then
			MessageBox('Advertencia','La hora de inicio del turno #'+String(al_turno)+' para el d$$HEX1$$ed00$$ENDHEX$$a '+String(ll_no_dia)+' no est$$HEX2$$e1002000$$ENDHEX$$asignada (horas ma$$HEX1$$f100$$ENDHEX$$ana).',StopSign!)
			Return -1
		End If
		lde_cantidad_horas=ids_turnos.GetItemDecimal(ll_pos,'horas')
		If IsNull(lde_cantidad_horas) Then
			MessageBox('Advertencia','El n$$HEX1$$fa00$$ENDHEX$$mero de horas del turno #'+String(al_turno)+' para el d$$HEX1$$ed00$$ENDHEX$$a '+String(ll_no_dia)+' no est$$HEX2$$e1002000$$ENDHEX$$asignado (horas ma$$HEX1$$f100$$ENDHEX$$ana).',StopSign!)
			Return -1
		End If
		//----------------------------------------------------
		lde_hora_inicio = Hour(ltm_horaini) + (Minute(ltm_horaini)/60) //Total de hora de inicio en horas
		lde_horas_manana = (lde_hora_inicio + lde_cantidad_horas) - 24
		If lde_horas_manana<0 Then			
			lde_horas_manana = 0
		End If
		Return lde_horas_manana
Else
		MessageBox('Advertencia','El horario del c$$HEX1$$f300$$ENDHEX$$digo de turno #'+String(al_turno)+' para el d$$HEX1$$ed00$$ENDHEX$$a '+String(ll_no_dia)+' no fu$$HEX2$$e9002000$$ENDHEX$$encontrado (horas ma$$HEX1$$f100$$ENDHEX$$ana)',StopSign!)
		Return -1
End If
//------------------------------------------------------------


end function

public function decimal of_horas (date adt_fecha, long al_turno);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 06 de Diciembre de 2004.H:11:40
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n para retorna las horas de trabajo de un turno
en un dia, desde que se inicia hasta que se termina o
si es de noche, las horas hasta llegar a media noche
---------------------------------------------------*/
//-------------------------------------------------
Long 			ll_pos,ll_no_dia
Decimal{2}	lde_hora_inicio,lde_horas_manana,lde_cantidad_horas,lde_horas_hoy
String 		ls_exp
Time 			ltm_horaini
//-------------------------------------------------
If ids_turnos.RowCount()<=0 Then 
	MessageBox('Advertencia','No se encontr$$HEX2$$f3002000$$ENDHEX$$informaci$$HEX1$$f300$$ENDHEX$$n solicitada respecto a los turnos y sus horarios (horas hoy).',StopSign!)
	Return -1
End If
//-------------------------------------------------
ll_no_dia=DayNumber(adt_fecha) //Se encuentra el d$$HEX1$$ed00$$ENDHEX$$a del turno
ls_exp='id_turno='+String(al_turno)+' AND dia='+String(ll_no_dia)
ll_pos = ids_turnos.Find(ls_exp,1,ids_turnos.RowCount())
If ll_pos>0 Then
		ltm_horaini=ids_turnos.GetItemTime(ll_pos,'hora_inicio')
		If IsNull(ltm_horaini)Then
			MessageBox('Advertencia','La hora de inicio del turno #'+String(al_turno)+' para el d$$HEX1$$ed00$$ENDHEX$$a '+String(ll_no_dia)+' no est$$HEX2$$e1002000$$ENDHEX$$asignada (horas hoy).',StopSign!)
			Return -1
		End If
		lde_cantidad_horas=ids_turnos.GetItemDecimal(ll_pos,'horas')
		If IsNull(lde_cantidad_horas)Then
			MessageBox('Advertencia','El n$$HEX1$$fa00$$ENDHEX$$mero de horas del turno #'+String(al_turno)+' para el d$$HEX1$$ed00$$ENDHEX$$a '+String(ll_no_dia)+' no est$$HEX2$$e1002000$$ENDHEX$$asignado (horas hoy).',StopSign!)
			Return -1
		End If
		//----------------------------------------------------
		lde_hora_inicio = Hour(ltm_horaini) + (Minute(ltm_horaini)/60) //Total de hora de inicio en horas
		lde_horas_manana = (lde_hora_inicio + lde_cantidad_horas) - 24
		If lde_horas_manana>0 Then
			lde_horas_hoy = lde_cantidad_horas - lde_horas_manana
		Else
			lde_horas_hoy = lde_cantidad_horas
		End If
		Return lde_horas_hoy		
Else
		MessageBox('Advertencia','El horario del c$$HEX1$$f300$$ENDHEX$$digo de turno #'+String(al_turno)+' para el d$$HEX1$$ed00$$ENDHEX$$a '+String(ll_no_dia)+' no fu$$HEX2$$e9002000$$ENDHEX$$encontrado (horas hoy).',StopSign!)
		Return -1
End If
//------------------------------------------------------------
//Return 1



end function

public function integer of_load_ids ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 06 de Diciembre de 2004.H:11:40
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n para cargar los datos de conexi$$HEX1$$f300$$ENDHEX$$n para el objeto
de programaci$$HEX1$$f300$$ENDHEX$$n.
---------------------------------------------------*/
Long ll_retrieve, ll_res
//-------------------------------------------------

ids_grupos_busca          	= CREATE n_ds_application
ids_lista_grupos_colas   	= CREATE n_ds_application
ids_maquinas             	= CREATE n_ds_application
ids_lista_maquinas_colas	= CREATE n_ds_application

ids_vector_grupos		  		= CREATE n_ds_application	
ids_vector_tin         		= CREATE n_ds_application

ids_grupos = CREATE n_ds_application
ids_grupos.of_load('d_grupos_todos')
ids_grupos.of_conexion(n_cst_application.itr_appl,True)

ids_turnos = CREATE n_ds_application
ids_turnos.of_load('d_turnos_todos')
ids_turnos.of_conexion(n_cst_application.itr_appl,True)

ids_festivos = CREATE n_ds_application
ids_festivos.of_load('d_festivos_1anno')//FALTA POR DEFINIR???
ids_festivos.of_conexion(n_cst_application.itr_appl,True)

ids_recurso_grupo = CREATE n_ds_application
ids_recurso_grupo.of_load('d_recurso_grupo_todos')
ids_recurso_grupo.of_conexion(n_cst_application.itr_appl,True)

ids_estado_tarea_grupo = CREATE n_ds_application
ids_estado_tarea_grupo.of_load('d_estado_tarea_grupo')
ids_estado_tarea_grupo.of_conexion(n_cst_application.itr_appl,True)

ids_tareas_orden = CREATE n_ds_application
ids_tareas_orden.of_load('d_tareas_orden_lista')
ids_tareas_orden.of_conexion(n_cst_application.itr_appl,True)

ids_tareas_copia = CREATE n_ds_application
ids_tareas_copia.of_load('d_tareas_orden_lista')

ids_estado_tarea_mtin = CREATE n_ds_application
ids_estado_tarea_mtin.of_load('d_estado_tarea_mtin')
ids_estado_tarea_mtin.of_conexion(n_cst_application.itr_appl,True)

ids_maq_tin = CREATE n_ds_application
ids_maq_tin.of_load('d_maq_tin_todas')
ids_maq_tin.of_conexion(n_cst_application.itr_appl,True)

ids_estado_tarea_recurso = CREATE n_ds_application
ids_estado_tarea_recurso.of_load('d_estado_tarea_recurso')
ids_estado_tarea_recurso.of_conexion(n_cst_application.itr_appl,True)

ids_maquinas_examina=CREATE n_ds_application
ids_maquinas_examina.of_load('d_ext_vec_maq_examina')

ids_activ_oper_rec=CREATE n_ds_application
ids_activ_oper_rec.of_load('d_activ_oper_rec_todos')
ids_activ_oper_rec.of_conexion(n_cst_application.itr_appl,True)

ids_momento_predecesor=CREATE n_ds_application

//lds_momento_predecesor.of_load('d_sp_momento_predecesor')
ids_momento_predecesor.of_load('d_sp_mu_fe_prece')
ids_momento_predecesor.of_conexion(n_cst_application.itr_appl,True)



ids_verif_precedencia_new= CREATE n_ds_application
ids_verif_precedencia_new.of_load('d_verifica_precedencia_tipoprod')
ids_verif_precedencia_new.of_conexion(n_cst_application.itr_appl,True)


////GAC
	ll_res = ids_verif_precedencia_new.Retrieve(il_tipoprod)
	
	Choose Case ll_res
		Case Is < 0
			MessageBox("Advertencia!","Error recuperando las precedencias nuevas de tareas.",StopSign!)
			Return -1
		Case 0
			MessageBox("Advertencia!","No se recuperaron precedencias nuevas, por favor verifique.",StopSign!)
	End Choose

///GAC





//-------------------------------------------------
// Se cargan los ds que contienen los datos necesarios de todo un item en general
//Toda la informaci$$HEX1$$f300$$ENDHEX$$n de los grupos
ll_retrieve=ids_grupos.Retrieve()
Choose Case ll_retrieve
	Case Is < 0
		MessageBox('Advertencia','Error en la solicitud de la informaci$$HEX1$$f300$$ENDHEX$$n de los grupos total',StopSign!)
		Return -1
	Case 0
		MessageBox('Advertencia','No se encontr$$HEX2$$f3002000$$ENDHEX$$informaci$$HEX1$$f300$$ENDHEX$$n de los grupos total',Information!)
		//Return -1
End Choose
//-------------------------------------------------
//Toda la informaci$$HEX1$$f300$$ENDHEX$$n de los turnos
ll_retrieve=ids_turnos.Retrieve()
Choose Case ll_retrieve
	Case Is < 0
		MessageBox('Advertencia','Error en la solicitud de la informaci$$HEX1$$f300$$ENDHEX$$n de los turnos total',StopSign!)
		Return -1
	Case 0
		MessageBox('Advertencia','No se encontr$$HEX2$$f3002000$$ENDHEX$$informaci$$HEX1$$f300$$ENDHEX$$n de los turnos total',Information!)
		//Return -1
End Choose
//-------------------------------------------------
//Toda la informaci$$HEX1$$f300$$ENDHEX$$n de los d$$HEX1$$ed00$$ENDHEX$$as festivos
ll_retrieve=ids_festivos.Retrieve()
Choose Case ll_retrieve
	Case Is < 0
		MessageBox('Advertencia','Error en la solicitud de la informaci$$HEX1$$f300$$ENDHEX$$n de los d$$HEX1$$ed00$$ENDHEX$$as festivos',StopSign!)
		Return -1
	Case 0
		//MessageBox('Advertencia','No se encontr$$HEX2$$f3002000$$ENDHEX$$informaci$$HEX1$$f300$$ENDHEX$$n de los los d$$HEX1$$ed00$$ENDHEX$$as festivos',Information!)
		//Return -1
End Choose
//-------------------------------------------------
//Toda la informaci$$HEX1$$f300$$ENDHEX$$n de las m$$HEX1$$e100$$ENDHEX$$quinas de tintorer$$HEX1$$ed00$$ENDHEX$$a
ll_retrieve=ids_maq_tin.Retrieve()
Choose Case ll_retrieve
	Case Is < 0
		MessageBox('Advertencia','Error en la solicitud de la informaci$$HEX1$$f300$$ENDHEX$$n de las m$$HEX1$$e100$$ENDHEX$$quinas de tintorer$$HEX1$$ed00$$ENDHEX$$a total',StopSign!)
		Return -1
	Case 0
		MessageBox('Advertencia','No se encontr$$HEX2$$f3002000$$ENDHEX$$informaci$$HEX1$$f300$$ENDHEX$$n de las m$$HEX1$$e100$$ENDHEX$$quinas de tintorer$$HEX1$$ed00$$ENDHEX$$a total',Information!)
		//Return -1
End Choose
//-------------------------------------------------
//Toda la informaci$$HEX1$$f300$$ENDHEX$$n de los recursos de los grupos
ll_retrieve=ids_recurso_grupo.Retrieve()
Choose Case ll_retrieve
	Case Is < 0
		MessageBox('Advertencia','Error en la solicitud de la informaci$$HEX1$$f300$$ENDHEX$$n de los recursos de los grupos total',StopSign!)
		Return -1
	Case 0
		//MessageBox('Advertencia','No se encontr$$HEX2$$f3002000$$ENDHEX$$informaci$$HEX1$$f300$$ENDHEX$$n de los recursos de los grupos total',Information!)
		//Return -1
End Choose
//-------------------------------------------------
ll_retrieve=ids_estado_tarea_grupo.Retrieve(il_tipoprod )
Choose Case ll_retrieve
	Case Is < 0
		MessageBox('Advertencia','Error en la solicitud de la informaci$$HEX1$$f300$$ENDHEX$$n de los estados de los $$HEX1$$ed00$$ENDHEX$$tem para los grupos',StopSign!)
		Return -1
	Case 0
		//MessageBox('Advertencia','No se encontr$$HEX2$$f3002000$$ENDHEX$$informaci$$HEX1$$f300$$ENDHEX$$n de los estados de los $$HEX1$$ed00$$ENDHEX$$tem para los grupos',Information!)
		//Return -1
End Choose
//-------------------------------------------------
ll_retrieve=ids_estado_tarea_mtin.Retrieve()
Choose Case ll_retrieve
	Case Is < 0
		MessageBox('Advertencia','Error en la solicitud de la informaci$$HEX1$$f300$$ENDHEX$$n de los estados de los $$HEX1$$ed00$$ENDHEX$$tem para las m$$HEX1$$e100$$ENDHEX$$quinas de tintorer$$HEX1$$ed00$$ENDHEX$$a',StopSign!)
		Return -1
	Case 0
		//MessageBox('Advertencia','No se encontr$$HEX2$$f3002000$$ENDHEX$$informaci$$HEX1$$f300$$ENDHEX$$n de los estados de los $$HEX1$$ed00$$ENDHEX$$tem para las m$$HEX1$$e100$$ENDHEX$$quinas de tintorer$$HEX1$$ed00$$ENDHEX$$a',Information!)
		//Return -1
End Choose
//-------------------------------------------------
ll_retrieve=ids_estado_tarea_recurso.Retrieve()
Choose Case ll_retrieve
	Case Is < 0
		MessageBox('Advertencia','Error en la solicitud de la informaci$$HEX1$$f300$$ENDHEX$$n de los recursos de los estados de los $$HEX1$$ed00$$ENDHEX$$tem para los recursos de tejido',StopSign!)
		Return -1
	Case 0
		//MessageBox('Advertencia','No se encontr$$HEX2$$f3002000$$ENDHEX$$informaci$$HEX1$$f300$$ENDHEX$$n de los estados de los $$HEX1$$ed00$$ENDHEX$$tem para los recursos de tejido',Information!)
		//Return -1
End Choose
//-------------------------------------------------
ll_retrieve=ids_activ_oper_rec.Retrieve()
Choose Case ll_retrieve
	Case Is < 0
		MessageBox('Advertencia','Error reucuperando recursos de actividades y operaciones.',StopSign!)
		Return -1
	Case 0
		//MessageBox('Advertencia','No se encontr$$HEX2$$f3002000$$ENDHEX$$informaci$$HEX1$$f300$$ENDHEX$$n de los estados de los $$HEX1$$ed00$$ENDHEX$$tem para los recursos de tejido',Information!)
		//Return -1
End Choose

ll_retrieve =n_cst_application.&
             of_copiaPrecedencias(ids_verif_precedencia_new)

//.Retrieve()
Choose Case ll_retrieve
	Case Is < 0
		MessageBox("Advertencia!","Error recuperando las precedencias nuevas de tareas.",StopSign!)
		Return -1
	Case 0
		MessageBox("Advertencia!","No se recuperaron precedencias nuevas, por favor verifique.",StopSign!)
End Choose


Return 1
end function

public function integer of_obtenergrupo (decimal ade_tiempo_tarea, datetime adtm_fecha_hora_inicio);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 06 de Diciembre de 2004.H:11:40
---------------------------------------------------
/*
Esta funci$$HEX1$$f300$$ENDHEX$$n permite determinar cual es el grupo que primero
puede atender una tarea, se va a tener una lista de posibles
grupos en un vector, y seg$$HEX1$$fa00$$ENDHEX$$n las colas de cada grupo se
determina cual la puede atender primero.
Para esto se tiene en cuenta la cola cargada de cada grupo.
*/
adc_tiempo_tarea : Tiempo que toma realizar la tarea en minutos
adtm_fecha_hora_inicio : momento a partir del cual se debe programar la tarea
---------------------------------------------------*/
String ls_exp
Long ll_rows,ll_i,ll_grupo,ll_turno_grupo,ll_cantcolas_grupo,& 
		ll_pos,ll_pos_ext,ll_c,ll_j,ll_k,ll_lim_grupos
Boolean lb_out
Decimal{2} lde_tiempoEstimado
DateTime ldtm_fe_fin_estimada,ldtm_fe_cola,ldtm_fe_finmedio,ldtm_fe_ini_estimada


long ll_res
//-------------------------------------------------
If UpperBound(il_vector_grupos_examina)<=0 Then	
	Return -1
End If
//-------------------------------------------------
//Se cargan las tareas de los grupos programadas y en proceso
//Condicion(2,3,4,5,6); posteriores a la fecha_hora de inicio 
//que se envi$$HEX2$$f3002000$$ENDHEX$$como par$$HEX1$$e100$$ENDHEX$$metro.Punto 1

ids_grupos_busca.Dataobject='d_grupos_seleccion2'
ids_grupos_busca.SetTransObject(n_cst_application.itr_appl)
ll_rows=ids_grupos_busca.Retrieve(il_vector_grupos_examina,adtm_fecha_hora_inicio)
Choose Case ll_rows
	Case Is < 0  
		MessageBox('Advertencia','Error al recuperar la informaci$$HEX1$$f300$$ENDHEX$$n de las tareas para los grupos programados y en proceso',StopSign!)
		Return -1
	Case 0 
		//MessageBox('Information!','No se encontr$$HEX2$$f3002000$$ENDHEX$$informaci$$HEX1$$f300$$ENDHEX$$n de las tareas para los grupos programados y en proceso',StopSign!)
		//Return -1
		//??? Aqui retorno o no?
End Choose
//-------------------------------------------------
//Se tiene un datastore basado en external puede ser para 
//determinar cual es el mas proximo, debe tener

ids_lista_grupos_colas.DataObject='d_ext_gruposcol'
//-------------------------------------------------
//Se hace un recorrido por los diferentes grupos
ll_lim_grupos = UpperBound(il_vector_grupos_examina)
For ll_i=1 To ll_lim_grupos		
	//Se hace un recorrido por la lista grupos para saber cual la puede atender m$$HEX1$$e100$$ENDHEX$$s r$$HEX1$$e100$$ENDHEX$$pido
	ll_grupo=il_vector_grupos_examina[ll_i]//lds_grupos.GetItemNumber(ll_i,'co_grupo')
	ls_exp='id_grupo='+String(ll_grupo)
	ll_pos=ids_grupos.Find(ls_exp,1,ids_grupos.RowCount())
	//Se busca el turno del grupo, que se empleara en estimar tiempos
	ll_turno_grupo=ids_grupos.GetItemNumber(ll_pos,'id_turno')
	ll_cantcolas_grupo=ids_grupos.GetItemNumber(ll_pos,'cantidad_colas')
	//Se hace otro recorrido por la cantidad de colas
	For ll_c=1 To ll_cantcolas_grupo //Recorrido por el numero de colas del grupo determinado				
		//Filtra las tareas del grupo y la cola en el datastore del Punto 1,
		//y las ordena por fecha y hora de inicio
		ls_exp='co_grupo='+String(ll_grupo)+' AND cola_grupo='+String(ll_c)
		ids_grupos_busca.SetFilter(ls_exp)
		ids_grupos_busca.Filter()
//////////////////////////////////////////////////////////////////////////
// En este caso si es mayor a 0 se tendr$$HEX2$$e1002000$$ENDHEX$$un registro con la fecha de 
// terminaci$$HEX1$$f300$$ENDHEX$$n de la tarea programada ultima...esto con el cambio de
// colocar siempre en cola.
//////////////////////////////////////////////////////////////////////////
		If ids_grupos_busca.RowCount()>0 Then 
			ldtm_fe_cola=ids_grupos_busca.GetItemDateTime(1,'f_mov_fin')
			ldtm_fe_ini_estimada=ldtm_fe_cola
		Else
//////////////////////////////////////////////////////////////////////////
// El sino es cuando no se tiene nada en una cola o un grupo, en tal caso
// se puede colocar en el momento mismo de la programaci$$HEX1$$f300$$ENDHEX$$n
//////////////////////////////////////////////////////////////////////////
			ldtm_fe_ini_estimada=adtm_fecha_hora_inicio
		End If
		
		ll_res=This.of_addminturno(ldtm_fe_ini_estimada/* ref datetime adtm_fechahora*/,&
											ll_turno_grupo/*long al_turno*/,&
											ade_tiempo_tarea/*decimal ade_minutos */)
																		
		If ll_res<>1 Then
			Return -1	
		End If
					
		ldtm_fe_fin_estimada=idt_fechaHoraFinal
		
		
  		ll_pos_ext=ids_lista_grupos_colas.InsertRow(0)
  		ids_lista_grupos_colas.SetItem(ll_pos_ext,'id_grupo',ll_grupo)
  		ids_lista_grupos_colas.SetItem(ll_pos_ext,'cola',ll_c)						  
  		ids_lista_grupos_colas.SetItem(ll_pos_ext,'fecha_hora_ini',ldtm_fe_ini_estimada)
  		ids_lista_grupos_colas.SetItem(ll_pos_ext,'fecha_hora_fin',ldtm_fe_fin_estimada)

	Next//FIN.Recorrido por el numero de colas del grupo determinado
	
Next//FIN.Se hace un recorrido por la lista de grupos para saber cual la puede atender m$$HEX1$$e100$$ENDHEX$$s r$$HEX1$$e100$$ENDHEX$$pido

//*****************************************************************************
/*Se selecciona la cola y grupo con menor fecha_hora.Se cargan las variables de
instancia de grupo, cola y fecha_hora de programaci$$HEX1$$f300$$ENDHEX$$n de la tarea.*/
ids_lista_grupos_colas.SetSort('fecha_hora_ini A')
ids_lista_grupos_colas.Sort()
//*****************************************************************************
il_grupo=ids_lista_grupos_colas.GetItemNumber(1,'id_grupo')
ii_cola_grupo=ids_lista_grupos_colas.GetItemNumber(1,'cola')
idtm_fechaHora_programacion_ini=ids_lista_grupos_colas.GetItemDateTime(1,'fecha_hora_ini')
idtm_fechaHora_programacion_fin=ids_lista_grupos_colas.GetItemDateTime(1,'fecha_hora_fin')
//*****************************************************************************

Return 1
end function

private function decimal of_estimartiempotin (time atm_hora_ini_maq, decimal ade_horas_maq, datetime adtm_fechahora1, datetime adtm_fechahora2);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 06 de Diciembre de 2004.H:11:40
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n para estimar el tiempo disponible entre dos
momentos en una maquina de tintorer$$HEX1$$ed00$$ENDHEX$$a.
---------------------------------------------------*/
//-------------------------------------------------
Long ll_pos_festivo
Date ldt_var_fecha
Decimal{2} 	lde_horafh1,lde_horafh2,lde_horas_principio,lde_horas,&
				lde_hora_ini_maq,lde_horas_final
//-------------------------------------------------
lde_horafh1 = Hour(Time(adtm_fechahora1)) + (Minute(Time(adtm_fechahora1))/60)
lde_horafh2 = Hour(Time(adtm_fechahora2)) + (Minute(Time(adtm_fechahora2))/60)
lde_hora_ini_maq = Hour(atm_hora_ini_maq) + (Minute(atm_hora_ini_maq)/60)
lde_horas_principio = lde_horafh1 - lde_hora_ini_maq
lde_horas = ade_horas_maq
ldt_var_fecha=Date(adtm_fechahora1)
//Termina el d$$HEX1$$ed00$$ENDHEX$$a 1
//Por $$HEX1$$fa00$$ENDHEX$$ltimo se verifica el $$HEX1$$fa00$$ENDHEX$$ltimo d$$HEX1$$ed00$$ENDHEX$$a
//Si no es el mismo d$$HEX1$$ed00$$ENDHEX$$a inicial
Do While (ldt_var_fecha<Date(adtm_fechahora2))
		//-->??? Para este chequeo no se consideran ni domingos ni festivos		
		ll_pos_festivo=ids_festivos.Find('fecha='+String(ldt_var_fecha),1,ids_festivos.RowCount())
		If DayNumber(ldt_var_fecha)<>1 AND ll_pos_festivo<=0 Then 			
			ldt_var_fecha=RelativeDate(ldt_var_fecha,1)//Se hacen los otros dias
			lde_horas+=ade_horas_maq		
		End If
Loop
//Se verifica si no es el mismo d$$HEX1$$ed00$$ENDHEX$$a
If Date(adtm_fechahora1)<>Date(adtm_fechahora2) Then
	//Se suma las horas del $$HEX1$$fa00$$ENDHEX$$ltimo d$$HEX1$$ed00$$ENDHEX$$a
	lde_horas+=ade_horas_maq
End If
lde_horas_final=lde_hora_ini_maq + ade_horas_maq - lde_horafh2
lde_horas = lde_horas - lde_horas_final - lde_horas_principio

//-------------------------------------------------
Return (lde_horas*60)//Devuelve los minutos
end function

public function integer of_obtenermaquinatin (decimal ade_tiempo_tarea, datetime adtm_fecha_hora_inicio);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 06 de Diciembre de 2004.H:11:40
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n que obteniene la m$$HEX1$$e100$$ENDHEX$$quina de tintorer$$HEX1$$ed00$$ENDHEX$$a para asignarle una tarea.
---------------------------------------------------
Esta funci$$HEX1$$f300$$ENDHEX$$n permite determinar cual es la m$$HEX1$$e100$$ENDHEX$$quina que primero
puede atender una tarea, se va a tener una lista de posibles
m$$HEX1$$e100$$ENDHEX$$quinas en un vector, y seg$$HEX1$$fa00$$ENDHEX$$n las colas de cada m$$HEX1$$e100$$ENDHEX$$quina se
determina cual la puede atender primero.
Para esto se tiene en cuenta la cola cargada de cada m$$HEX1$$e100$$ENDHEX$$quina.
//-------------------------------------------------
adc_tiempo_tarea : Tiempo que toma realizar la tarea en minutos
adtm_fecha_hora_inicio : momento a partir del cual se debe programar la tarea
---------------------------------------------------*/
//-------------------------------------------------

String ls_exp,ls_disponible,ls_where_maq,ls_modified_select,ls_select_ini
Long ll_rows,ll_i,ll_maquina,ll_turno_maquina,ll_cantcolas_maquina,&
		ll_pos,ll_pos_ext,ll_c,ll_j,ll_lim_maquinas,ll_k,ll_fabrica
Boolean lb_out,lb_dis
Decimal{2} lde_tiempoEstimado


DateTime ldtm_fe_cola,ldtm_fe_finmedio,ldtm_fe_ini_estimada,ldtm_fe_fin_estimada
Long ll_res

String ls_sel2
//-------------------------------------------------
If ids_maquinas_examina.RowCount()<=0 Then	
	Return -1
End If
//-------------------------------------------------
//Se cargan las tareas de las maquinas programadas y en proceso,
//posteriores a la fecha_hora de inicio que se envi$$HEX2$$f3002000$$ENDHEX$$como par$$HEX1$$e100$$ENDHEX$$metro.Punto 1

ids_maquinas.of_load('d_ds_maquinas_colas_obtmaq2')
ids_maquinas.of_conexion(n_cst_application.itr_appl,True)
//SE actualiza el where de la consulta-----------------------------------*/
//**********
ls_where_maq=' and ('
ll_rows=ids_maquinas_examina.RowCount()
For ll_i=1 To ll_rows
	ll_fabrica=ids_maquinas_examina.GetItemNumber(ll_i,'co_fabrica')
	ll_maquina=ids_maquinas_examina.GetItemNumber(ll_i,'cs_maquina')
	ls_where_maq +='(mu_gantt.co_fabrica='+String(ll_fabrica)+' and cs_maquina='+String(ll_maquina)+') or '
Next

If Right(ls_where_maq,4)=" or " Then
	ls_where_maq=left(ls_where_maq, len(ls_where_maq) - 4)+")"
End If

ls_select_ini=ids_maquinas.Describe("DataWindow.Table.Select")

ll_pos=pos(ls_select_ini,"GROUP")

If ll_pos>0 Then
	ls_sel2=mid(ls_select_ini,ll_pos)
	ls_select_ini=mid(ls_select_ini,1, ll_pos -1)
End If

//clipboard('ls_select_ini='+ls_select_ini+'~n'+&
//'ls_where_maq='+ls_where_maq+'~n'+&
//'ls_sel2='+ls_sel2+'~n')

If Right(ls_where_maq,1)=")" Then		
	ls_modified_select="DataWindow.Table.Select='"+&
	ls_select_ini+ls_where_maq+" "+ls_sel2+"'"
	ids_maquinas.Modify(ls_modified_select)
End If

//**********
//-----------------------------------------------------------------------*/
ll_rows=ids_maquinas.Retrieve(adtm_fecha_hora_inicio)
Choose Case ll_rows
	Case Is < 0  
		MessageBox('Advertencia','Error al recuperar la informaci$$HEX1$$f300$$ENDHEX$$n de las tareas para las m$$HEX1$$e100$$ENDHEX$$quinas programadas y en proceso.',StopSign!)
		Return -1
	Case 0 
		//MessageBox('Information!','No se encontr$$HEX2$$f3002000$$ENDHEX$$informaci$$HEX1$$f300$$ENDHEX$$n de las tareas para las m$$HEX1$$e100$$ENDHEX$$quinas programadas y en proceso',StopSign!)
		//Return -1
		//??? Aqui retorno o no?
End Choose
//Se tiene un datastore basado en external,
//puede ser para determinar cual es el m$$HEX1$$e100$$ENDHEX$$s pr$$HEX1$$f300$$ENDHEX$$ximo

ids_lista_maquinas_colas.of_load('d_ext_lista_maquinas_colas')

lb_dis=False
//Se hace un recorrido para las m$$HEX1$$e100$$ENDHEX$$quinas
//ll_lim_maquinas=UpperBound(il_vector_maquinas_examina)/*DEPRECATED*/

ll_lim_maquinas=ids_maquinas_examina.RowCount()

For ll_i=1 To ll_lim_maquinas		
	//Se hace un recorrido por la lista de m$$HEX1$$e100$$ENDHEX$$quinas para saber cual la puede atender m$$HEX1$$e100$$ENDHEX$$s r$$HEX1$$e100$$ENDHEX$$pido
	//ll_maquina=il_vector_maquinas_examina[ll_i]/*DEPRECATED*/
	ll_fabrica=ids_maquinas_examina.GetItemNumber(ll_i,'co_fabrica')
	ll_maquina=ids_maquinas_examina.GetItemNumber(ll_i,'cs_maquina')
	//**** Cargo datos de la m$$HEX1$$e100$$ENDHEX$$quina del ds de todas las m$$HEX1$$e100$$ENDHEX$$quinas
	ls_exp='co_fabrica='+String(ll_fabrica)+' AND cs_maquina='+String(ll_maquina)
	ll_pos=ids_maq_tin.Find(ls_exp,1,ids_maq_tin.RowCount())		
	ll_cantcolas_maquina=ids_maq_tin.GetItemNumber(ll_pos,'cantidad_colas')//
	If IsNull(ll_cantcolas_maquina) OR ll_cantcolas_maquina<=0 Then 
		MessageBox('Advertencia','La cantidad de colas para la m$$HEX1$$e100$$ENDHEX$$quina # '+String(ll_maquina)+' no es v$$HEX1$$e100$$ENDHEX$$lida.',StopSign!)
		Return -1
	End If

	ll_turno_maquina=ids_maq_tin.GetItemNumber(ll_pos,'id_turno')
	
	If ll_turno_maquina<=0 Then
		MessageBox("Advertencia!",&
		'El Turno para la m$$HEX1$$e100$$ENDHEX$$quina # '+String(ll_maquina)+' no es v$$HEX1$$e100$$ENDHEX$$lido.',StopSign!)
		Return -1
	End If

	ls_disponible=ids_maq_tin.GetItemString(ll_pos,'disponible')
	//Si la m$$HEX1$$e100$$ENDHEX$$quina no esta activa se procede a hacer la verificaci$$HEX1$$f300$$ENDHEX$$n con la siguiente m$$HEX1$$e100$$ENDHEX$$quina
	If ls_disponible='N' Then CONTINUE
	//***********************************************************
	lb_dis=True
	For ll_c=1 To ll_cantcolas_maquina //Recorrido por el numero de colas de la m$$HEX1$$e100$$ENDHEX$$quina determinada				
		//Filtra las tareas de la m$$HEX1$$e100$$ENDHEX$$quina y la cola en el datastore del Punto 1,
		//y las ordena por fecha y hora de inicio
		ls_exp='co_fabrica='+String(ll_fabrica)+' AND cs_maquina='+String(ll_maquina)+' AND cola_tin='+String(ll_c)
		ids_maquinas.SetFilter(ls_exp)
		ids_maquinas.Filter()
//////////////////////////////////////////////////////////////////////////
// Se tendr$$HEX2$$e1002000$$ENDHEX$$un solo registro con la fecha mas adelantada
// 
//////////////////////////////////////////////////////////////////////////
		
		If ids_maquinas.RowCount()>0 Then 
			ldtm_fe_cola=ids_maquinas.GetItemDateTime(1,'f_mov_fin')
			ldtm_fe_ini_estimada=ldtm_fe_cola
		Else
//////////////////////////////////////////////////////////////////////////
// Por el sino, se puede colocar desde la misma fecha del mov, esto
// indica que la maquina no tiene tareas asignadas
//////////////////////////////////////////////////////////////////////////
			ldtm_fe_ini_estimada=adtm_fecha_hora_inicio
		End If

		ll_res=This.of_addminturno(ldtm_fe_ini_estimada/* ref datetime adtm_fechahora*/,&
											ll_turno_maquina/*long al_turno*/,&
											ade_tiempo_tarea/*decimal ade_minutos */)

		If ll_res<>1 Then
			Return -1
		End If

		ldtm_fe_fin_estimada=idt_fechaHoraFinal

		ll_pos_ext=ids_lista_maquinas_colas.InsertRow(0)
		ids_lista_maquinas_colas.SetItem(ll_pos_ext,'co_fabrica',ll_fabrica)
		ids_lista_maquinas_colas.SetItem(ll_pos_ext,'cs_maquina',ll_maquina)
		ids_lista_maquinas_colas.SetItem(ll_pos_ext,'cola',ll_c)
		ids_lista_maquinas_colas.SetItem(ll_pos_ext,'fecha_hora_ini',ldtm_fe_ini_estimada)
		ids_lista_maquinas_colas.SetItem(ll_pos_ext,'fecha_hora_fin',ldtm_fe_fin_estimada)
				
	Next//FIN.Recorrido por el numero de colas de la m$$HEX1$$e100$$ENDHEX$$quina determinada

Next//FIN.Se hace un recorrido por la lista de m$$HEX1$$e100$$ENDHEX$$quinas para saber cual la puede atender m$$HEX1$$e100$$ENDHEX$$s r$$HEX1$$e100$$ENDHEX$$pido

If Not lb_dis Then
	MessageBox('Advertencia','No se encontraron m$$HEX1$$e100$$ENDHEX$$quinas en estado disponible para la programaci$$HEX1$$f300$$ENDHEX$$n de la tarea.',StopSign!)
	Return -2
End If	
//*****************************************************************************
/*Se selecciona la cola y maquina con menor fecha_hora.Se cargan las variables de
instancia de grupo, cola y fecha_hora de programaci$$HEX1$$f300$$ENDHEX$$n de la tarea.*/
ids_lista_maquinas_colas.SetSort('fecha_hora_ini A')
ids_lista_maquinas_colas.Sort()
//*****************************************************************************
il_fabrica=ids_lista_maquinas_colas.GetItemNumber(1,'co_fabrica')
il_maquina=ids_lista_maquinas_colas.GetItemNumber(1,'cs_maquina')
ii_cola_maquina=ids_lista_maquinas_colas.GetItemNumber(1,'cola')
idtm_fechaHora_programacion_ini=ids_lista_maquinas_colas.GetItemDateTime(1,'fecha_hora_ini')
idtm_fechaHora_programacion_fin=ids_lista_maquinas_colas.GetItemDateTime(1,'fecha_hora_fin')
//*****************************************************************************

Return 1
end function

public function long of_vector_valor (ref long al_vector[]);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 29 de Diciembre de 2004.H:15:36
---------------------------------------------------
Funcion que elimina valores repetidos en el vector de c$$HEX1$$f300$$ENDHEX$$digos
de los grupos
---------------------------------------------------*/
Long ll_len,ll_alp[],ll_i,ll_pos,ll_valor,ll_vec[]

//-------------------------------------------------

ids_vector_grupos.of_load('d_vec_repeat')
ll_len=UpperBound(al_vector)
For ll_i=1 To ll_len	
	ll_valor=al_vector[ll_i]
//////////////////////////////////////////////////////////////////////////
// Si entre los grupos esta el procesador, este debe ser el que hace la tarea
// seleccionada.
//////////////////////////////////////////////////////////////////////////
	
	If il_grupo_procesador>0 Then
		If il_grupo_procesador=ll_valor Then
			al_vector=ll_vec
			al_vector[1]=ll_valor
			Return 1
		End If
			
	End If
	If ids_vector_grupos.Find('c_long='+String(al_vector[ll_i]),1,ids_vector_grupos.RowCount())<=0  Then
		ll_pos=ids_vector_grupos.InsertRow(0)
		ids_vector_grupos.SetItem(ll_pos,'c_long',al_vector[ll_i])
	End If
Next
al_vector=ids_vector_grupos.Object.c_long.Primary

Return 1
end function

public function integer of_rb ();iuo_comun.of_rollback(n_cst_application.itr_appl)
Return 1
end function

public function integer of_set_recurso (long al_recurso);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 04 de Enero de 2005.H:10:36
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
If al_recurso<0 Then Return -1
//----------------------------
il_recurso=al_recurso
Return 1
end function

public function time of_ini_turno (date adt_var_feini, long al_turno);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 07  de Enero de 2005.H:18:00
---------------------------------------------------
---------------------------------------------------*/
Int li_no_dia
String ls_exp
Long ll_pos
Time ltm_hora_ini_turno,ltm_null
SetNull(ltm_null)
//-------------------------------------------------
li_no_dia=DayNumber(adt_var_feini) //Se encuentra el d$$HEX1$$ed00$$ENDHEX$$a del turno
ls_exp='id_turno='+String(al_turno)+' AND dia='+String(li_no_dia)
ll_pos = ids_turnos.Find(ls_exp,1,ids_turnos.RowCount())
ltm_hora_ini_turno=ids_turnos.GetItemTime(ll_pos,'hora_inicio')
If IsNull(ltm_hora_ini_turno) Then 
	MessageBox('Advertencia','El turno # '+String(al_turno)+' no tiene una hora de inicio v$$HEX1$$e100$$ENDHEX$$lida para el d$$HEX1$$ed00$$ENDHEX$$a # '+String(li_no_dia),StopSign!)
	Return ltm_null
End If
Return ltm_hora_ini_turno
end function

public function integer of_validar_peso_maquina (long al_fabrica, long al_maquina, decimal ade_peso_maq);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 28 de Diciembre de 2004.H:17:06
---------------------------------------------------
DataStore usado para verificar que el peso de la tarea
o actividad pueda ser realizado por la m$$HEX1$$e100$$ENDHEX$$quina; debe
estar en el rango de pesos de la m$$HEX1$$e100$$ENDHEX$$quina
---------------------------------------------------*/
//n_ds_application lds_verificar_peso
Long ll_pos
String ls_find

ls_find="co_fabrica="+String(al_fabrica)+" and cs_maquina="+String(al_maquina)

ll_pos=ids_maq_tin.Find(ls_find,1,ids_maq_tin.RowCount())

Decimal{3} lde_min,lde_max
If ll_pos<=0 Then
	Return -1
	
End If

lde_min=ids_maq_tin.GetItemDecimal(ll_pos,"peso_min")
lde_max=ids_maq_tin.GetItemDecimal(ll_pos,"peso_max")

If ade_peso_maq>=lde_min and ade_peso_maq<=lde_max Then
	Return 1
End If


Return -1

//-------------------------------------------------
//lds_verificar_peso = CREATE n_ds_application
//lds_verificar_peso.of_load('d_verificar_peso_maquinaxtarea')
//lds_verificar_peso.of_conexion(n_cst_application.itr_appl,True)
//ll_pos=lds_verificar_peso.Retrieve(al_fabrica,al_maquina,ade_peso_maq)
//Choose Case ll_pos
//	Case Is < 0
//		MessageBox('Advertencia','Error en la solicitud de la informaci$$HEX1$$f300$$ENDHEX$$n'+&
//					'de los pesos m$$HEX1$$ed00$$ENDHEX$$nimos y m$$HEX1$$e100$$ENDHEX$$ximos para la m$$HEX1$$e100$$ENDHEX$$quina de tintorer$$HEX1$$ed00$$ENDHEX$$a # '+String(al_maquina)+&
//					' y el peso de la tarea '+String(ade_peso_maq,'####.00'),StopSign!)
//		Return -2	
//	Case 0
//		Return -1
//End Choose
//--------------------------------------------------
Return 1
end function

public function integer of_vector_valor ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 29 de Diciembre de 2004.H:15:36
---------------------------------------------------
Funcion que elimina valores repetidos en el datastore de c$$HEX1$$f300$$ENDHEX$$digos
de las m$$HEX1$$e100$$ENDHEX$$quinas
---------------------------------------------------*/
Long 					ll_i,ll_pos
String 				ls_exp

//-------------------------------------------------

ids_vector_tin.of_load('d_ext_vec_maq_examina')
For ll_i=1 To ids_maquinas_examina.RowCount()
	ls_exp='co_fabrica='+String(ids_maquinas_examina.GetItemNumber(ll_i,'co_fabrica'))+&
		" AND cs_maquina="+String(ids_maquinas_examina.GetItemNumber(ll_i,'cs_maquina'))
	If ids_vector_tin.Find(ls_exp,1,ids_vector_tin.RowCount())<=0  Then
			//ll_pos=lds_vector.InsertRow(0)
			//lds_vector.SetItem(ll_pos,'c_long',al_vector[ll_i])
			ids_maquinas_examina.RowsCopy(ll_i,ll_i,Primary!,ids_vector_tin,ids_vector_tin.Rowcount()+1,Primary!)
	End If
Next
ids_maquinas_examina.Reset()
ids_vector_tin.RowsCopy(1,ids_vector_tin.RowCount(),Primary!,ids_maquinas_examina,1,Primary!)
//al_vector=lds_vector.Object.c_long.Primary

Return 1
end function

public function integer of_win_yield ();/*******************************************************************************************************
* PROC./FUNC.: of_win_yield
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	Funci$$HEX1$$f300$$ENDHEX$$n para tomar el estado de cancelacion de la operaci$$HEX1$$f300$$ENDHEX$$n
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Martes 18 de Enero de 2005. Hora: 17:27:37
********************************************************************************************************/
//VARIABLE DECLARATION
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
//SetPointer(Arrow!)
//Yield()
//If IsValid(w_procesando_programacion) Then
//	If w_procesando_programacion.of_get_estado() Then
//			Return -1
//	End If
//End If
Return 1
//END SCRIPT------------------------------------------------------------------------------------------------------
end function

public function integer of_win_stepit ();/*******************************************************************************************************
* PROC./FUNC.: of_win_stepit
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	Funci$$HEX1$$f300$$ENDHEX$$n para el incremento de la barra de proceso en la
					ventana de procesando
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Martes 18 de Enero de 2005. Hora: 14:31:23
********************************************************************************************************/
//VARIABLE DECLARATION
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
Return w_procesando_programacion.of_StepIt()
//END SCRIPT------------------------------------------------------------------------------------------------------



end function

private function long of_dia_habil_turno (ref date adt_var_feini, long al_turno, ref decimal ade_horas_manana);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 07 de Enero de 2005.H:18:00
---------------------------------------------------
---------------------------------------------------*/
Decimal lde_horas_manana,lde_null
Date ldt_var_feini
Long ll_pos_festivo, ll_res
Boolean lb_out
//-------------------------------------------------
SetNull(lde_null)
ldt_var_feini=adt_var_feini
lb_out=True						
ll_res=1
Do
	If DayNumber(ldt_var_feini)=1 Then
	
		lde_horas_manana=This.of_horasmanana(ldt_var_feini,al_turno)				
		If lde_horas_manana = -3 Then Return -3
		If lde_horas_manana<0 Then return lde_null				
	
		lb_out=False												
	Else
		ll_pos_festivo=ids_festivos.Find('fec_fer=DATE(~''+String(ldt_var_feini)+'~')',1,ids_festivos.RowCount())
		If ll_pos_festivo>0 Then
			lde_horas_manana=This.of_horasmanana(ldt_var_feini/*date adt_fecha*/,&
											al_turno/*long al_turno */)
			If lde_horas_manana = -3 Then Return -3
			
			If lde_horas_manana<0 Then return lde_null			
			
			lb_out=False
		Else
			lb_out=True
		End If
	End If

	If Not lb_out Then 
		ldt_var_feini = relativedate (ldt_var_feini,1)
		ll_res=0
	End If

Loop Until lb_out

adt_var_feini=ldt_var_feini
ade_horas_manana=lde_horas_manana

Return ll_res
end function

public function integer of_addminturno (ref datetime adtm_fechahora, long al_turno, decimal ade_minutos);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 29 de Diciembre de 2004.H:15:36
---------------------------------------------------
---------------------------------------------------*/
Long ll_cont_iter,ll_pos,ll_res
Date ldt_feini,ldt_fecha
Decimal{2} 	lde_horas_manana,lde_horasm1,lde_horas_turno
Decimal{0}  lde_minutos_pendientes,lde_min_obtenidos,lde_min_obtenidos_ant

DateTime ldtm_fefin_retorno,ldtm_null,ldtm_fe_ini_ret,ldtm_cancel
Time ltm_fin_turno,ltm_tiempocalc,ltm_hora_ini_turno,ltm_hora_ini_tarea
String ls_exp
Integer li_no_dia
SetNull(ldtm_null)
SetNull(ldtm_fe_ini_ret)
//-------------------------------------------------
/*Tomo la fecha del par$$HEX1$$e100$$ENDHEX$$metro a_fechaHora, le resto 1,
para determinar si hay horas en el siguiente d$$HEX1$$ed00$$ENDHEX$$a, esto
se presenta en el turno de la noche.*/
//------------------------------------------------
ldt_feini=Date(adtm_fechahora)
ltm_hora_ini_tarea=Time(adtm_fechahora)

//////////////////////////////////////////////////////////////////////////
// Se verifica que el dia enviado como parametro sea habil
// 
//////////////////////////////////////////////////////////////////////////

ll_res=of_dia_habil_turno(ldt_feini/*ref date adt_fecha*/,&
						  al_turno/*long al_turno */,&
						  lde_horas_manana)

//If ldt_feini=Date(adtm_fechahora) Then 
If ll_res=1 Then
//////////////////////////////////////////////////////////////////////////
// Si es un dia habil, le resto uno, para qeu en el caso de ser un turno
// nocturno, saber cuantas horas se pueden utilizar del dia siguiente
//////////////////////////////////////////////////////////////////////////
	
	ldt_fecha=RelativeDate(ldt_feini,-1)
	lde_horas_manana=This.of_horasmanana(ldt_fecha/*date adt_fecha*/,&
													al_turno/*long al_turno */)
	//********************************************************************												
	If (lde_horas_manana = -3) Then return -1
	//********************************************************************
	If lde_horas_manana<0 Then return -1
	//**************
	ldt_fecha=RelativeDate(ldt_fecha,1)
	//**************			
Else 
	
//////////////////////////////////////////////////////////////////////////
// Si no es un adia habil, el sistema calcula el primero habil en  ldt_feini, pero
// se da el caso de que el turno sea denoche, entonces el trabajo inica a las
// 10:00 pm de la noche anterior
//////////////////////////////////////////////////////////////////////////
	
	//Se asigna la fecha y hora del momento de inicio indicado
	ldt_fecha=ldt_feini
	If lde_horas_manana>0 Then
		ldt_fecha=RelativeDate(ldt_fecha,-1)
		ltm_hora_ini_turno=of_ini_turno(ldt_fecha,al_turno)			
		
		If IsNull(ltm_hora_ini_turno) Then Return -1
		
		ltm_hora_ini_tarea=ltm_hora_ini_turno
		
		//ldt_fecha=RelativeDate(ldt_fecha,1)
		lde_horas_manana=0
		
	Else
		ltm_hora_ini_turno=of_ini_turno(ldt_fecha,al_turno)
			
		If IsNull(ltm_hora_ini_turno) Then Return -1
		
		ltm_hora_ini_tarea=ltm_hora_ini_turno
	End If		
End If

//-------------------------------------------------
If ade_minutos<=0 Then	
	ldtm_fe_ini_ret=DateTime(ldt_fecha,ltm_hora_ini_tarea)
	adtm_fechahora=ldtm_fe_ini_ret
	Return -1
End If
//-------------------------------------------------

lde_minutos_pendientes=ade_minutos
ll_cont_iter=1
//********************************************************************
Do While lde_minutos_pendientes>0 
//////////////////////////////////////////////////////////////////////////
// Toma la primera parte del dia y calcula los minutos
// 
//////////////////////////////////////////////////////////////////////////
	lde_min_obtenidos=0
	If lde_horas_manana>0 Then//INICIO si hay horas ma$$HEX1$$f100$$ENDHEX$$ana
//////////////////////////////////////////////////////////////////////////
// La hora de inicio se coloca en 0 en las posteriores iteraciones, ya que
// en estos dias si puede tomar todo el tiempo
//////////////////////////////////////////////////////////////////////////
		If ll_cont_iter>1 Then
			ltm_hora_ini_tarea=time(00:00:00)
		End If
		
		ltm_fin_turno=RelativeTime(00:00:00,lde_horas_manana*3600/*Seg*/)//Time(lde_horas_manana,0,0)

		lde_min_obtenidos=SecondsAfter(ltm_hora_ini_tarea,ltm_fin_turno)/60/*Min*/													
		If ltm_hora_ini_tarea>ltm_fin_turno Then 
			lde_min_obtenidos=0
		End If
	End If

	If lde_min_obtenidos>0 Then
		
		If IsNull(ldtm_fe_ini_ret) Then 
			ldtm_fe_ini_ret=DateTime(ldt_fecha,ltm_hora_ini_tarea)
		End If
		
		If lde_min_obtenidos>=lde_minutos_pendientes Then
			ltm_tiempocalc=RelativeTime(ltm_hora_ini_tarea,lde_minutos_pendientes*60)
			ldtm_fefin_retorno=DateTime(ldt_fecha,ltm_tiempocalc)
			adtm_fechahora=ldtm_fe_ini_ret
			
			idt_fechaHoraFinal=ldtm_fefin_retorno
			Return 1			

		Else
			lde_minutos_pendientes = Round(lde_minutos_pendientes - lde_min_obtenidos,0)
		End If
		
	End If

//////////////////////////////////////////////////////////////////////////
// Esta es la parte normal del dia, o la ultima de la noche si el turno
// es de este tipo
//////////////////////////////////////////////////////////////////////////

	lde_min_obtenidos=0
	ltm_hora_ini_turno=of_ini_turno(ldt_fecha,al_turno)

	If IsNull(ltm_hora_ini_turno) Then Return -1					
//////////////////////////////////////////////////////////////////////////
// Si la tarea esta para antes del inicio del turno ejm 4 am y turno
// inicia  a las 6 am
//////////////////////////////////////////////////////////////////////////
	If ltm_hora_ini_tarea<ltm_hora_ini_turno Then
		ltm_hora_ini_tarea=ltm_hora_ini_turno
	End If

//////////////////////////////////////////////////////////////////////////
// En los dias posteriores se puede tomar desde el inicio del turno
//
//////////////////////////////////////////////////////////////////////////
	If ll_cont_iter>1 Then
		ltm_hora_ini_tarea=ltm_hora_ini_turno
	End If
	
	lde_horas_turno=of_horas(ldt_fecha,al_turno)
	If lde_horas_turno = -3 Then Return -1
	If lde_horas_turno<0 Then return -1
	
	If lde_horas_turno>0 Then
	//INICIO.El dia tiene horas
		ltm_fin_turno=RelativeTime(ltm_hora_ini_turno,lde_horas_turno*3600/*Seg*/)
		lde_min_obtenidos=SecondsAfter(ltm_hora_ini_tarea,ltm_fin_turno)/60/*Min*/						
		
		If ltm_hora_ini_tarea>ltm_fin_turno Then 
			lde_min_obtenidos=0
		End If	
		
	End If
	
	If lde_min_obtenidos>0 Then

		If IsNull(ldtm_fe_ini_ret) Then 
			ldtm_fe_ini_ret=DateTime(ldt_fecha,ltm_hora_ini_tarea)
		End If

		If lde_min_obtenidos>=lde_minutos_pendientes Then
			ltm_tiempocalc=RelativeTime(ltm_hora_ini_tarea,lde_minutos_pendientes*60)
			ldtm_fefin_retorno=DateTime(ldt_fecha,ltm_tiempocalc)
			adtm_fechahora=ldtm_fe_ini_ret
			idt_fechaHoraFinal=ldtm_fefin_retorno
			Return 1
		Else
			lde_minutos_pendientes = Round(lde_minutos_pendientes - lde_min_obtenidos,0)	
		End If
	End If

	lde_horas_manana=This.of_horasmanana(ldt_fecha,al_turno)
	If lde_horas_manana = -3 Then Return -1
	If lde_horas_manana<0 Then return -1
	//----------------------------------------------
	ldt_fecha = relativedate (ldt_fecha,1)
	//----------------------------------------------
	ll_res=of_dia_habil_turno(ldt_fecha,al_turno,lde_horasm1)

	If ll_res=0 Then
		lde_horas_manana=lde_horasm1
	End If
	ll_cont_iter++	
	
	If ll_cont_iter>70 Then
		Return -1
	End If

Loop
////********************************************************************								
//adtm_fechahora=ldtm_fe_ini_ret

//Return ldtm_fefin_retorno
////********************************************************************								
end function

public function integer of_fechahoraprecede (long a_tipotarea, long a_codigotarea, long a_conscolor);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 27 de Abril de 2005 HORA 16:19:31:968
// 
// Retorna fecha y hora de la predecesora
//////////////////////////////////////////////////////////////////////////

String ls_filtro,ls_filtro1
long ll_tot,ll_filtrados,i,ll_tipo,ll_codigo,ll_posicion
DateTime ldt_retorno

ls_filtro="tipo="+String(a_tipoTarea)+" and id="+String(a_codigoTarea)

ids_verif_precedencia_new.SetFilter(ls_filtro)
ids_verif_precedencia_new.Filter()

ll_filtrados=ids_verif_precedencia_new.RowCount()

If ll_filtrados=0 Then
	Return -1
End If

For i=1 To ll_filtrados
	ll_tipo=ids_verif_precedencia_new.GetItemNumber(i,"tipo1")
	ll_codigo=ids_verif_precedencia_new.GetItemNumber(i,"id1")
	
	ls_filtro1+="("
	
	If a_consColor>0 Then
		ls_filtro1+="(cons_color=0 or cons_color="+String(a_consColor)+") and "
	End If
	If ll_tipo=1 Then
		ls_filtro1+=" co_operacion="
	Else
		ls_filtro1+=" id_actividad="
	End If
	
	ls_filtro1+=String(ll_codigo)+") or "
	
Next
ls_filtro1=mid(ls_filtro1,1,len(ls_filtro1) -4)

//clipboard(ls_filtro1)

ids_tareas_copia.Reset()

ids_tareas_orden.RowsCopy(1,ids_tareas_orden.RowCount(),Primary!,&
                                     ids_tareas_copia,1,Primary!)
												 
ids_tareas_copia.SetFilter(ls_filtro1)
ids_tareas_copia.Filter()

ll_tot=ids_tareas_copia.RowCount()

If ll_tot=0 Then
	Return -1
End If


ids_tareas_copia.SetSort("f_mov_fin D")
ids_tareas_copia.Sort()

ldt_retorno=ids_tareas_copia.GetItemDateTime(1,"f_mov_fin")
ll_posicion=ids_tareas_copia.GetItemNumber(1,"posicion")

If IsNull(ldt_retorno) Then
	Return -1
End If
idt_fechaHoraFinal=ldt_retorno

//ll_posicion,idt_fechaHoraFinal,a_codigoTarea
//Messagebox('Var','ll_posicion='+String(ll_posicion)+'~n'+&
//'idt_fechaHoraFinal='+String(idt_fechaHoraFinal)+'~n'+&
//'a_codigoTarea='+String(a_codigoTarea)+'~n')
//
//Messagebox('Var','ldt_retorno='+String(ldt_retorno)+'~n'+&
//'ll_tot='+String(ll_tot)+'~n'+&
//'ls_filtro1='+ls_filtro1+'~n')
//il_orden,ll_tipoTarea,ll_codigoTarea,ll_consColor

Return 1
end function

public function integer of_actualizartarea (long al_nu_orden, long al_consec, long al_grupo, long al_cola_grupo, long al_fabrica, long al_maqtin, long al_cola_mq_tin, long al_condicion);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 06 de Diciembre de 2004.H:11:40
---------------------------------------------------
Para programar en el gantt
---------------------------------------------------*/
//-------------------------------------------------
Long ll_i,ll_condicion
n_ds_application lds_acttareas
//-------------------------------------------------
//VERSION DATAW
//lds_acttareas = CREATE n_ds_application
//lds_acttareas.of_load('d_actualizar_tareasxcolor_ss')
//lds_acttareas.of_conexion(n_cst_application.itr_appl,True)
//-------------------------------------------------
//ll_i=lds_acttareas.InsertRow(0)
//ll_i=lds_acttareas.Retrieve(al_nu_orden,al_consec)
//lds_acttareas.SaveAs('D:\IS\candrico\Scripts\SaveAs\dw_act_tarea_colorss.xls',Excel5!,True)
//lds_acttareas.SetItem(ll_i,'nu_orden',al_nu_orden)
//lds_acttareas.SetItem(ll_i,'consec',al_consec)
//lds_acttareas.SetItem(ll_i,'co_grupo',al_grupo)
//lds_acttareas.SetItem(ll_i,'cola_grupo',al_cola_grupo)
//lds_acttareas.SetItem(ll_i,'co_maq_tin',al_maqtin)
//lds_acttareas.SetItem(ll_i,'cola_tin',al_cola_mq_tin)	
//lds_acttareas.SetItem(ll_i,'f_mov_ini',idtm_fechahora_programacion_ini)
//lds_acttareas.SetItem(ll_i,'f_mov_fin',idtm_fechahora_programacion_fin)	
//lds_acttareas.SetItem(ll_i,'condicion',2)// El estado de la tarea en PROGRAMADA
//If IsNull(lds_acttareas.GetItemDatetime(ll_i,'f_prog_ini'))Then
//		lds_acttareas.SetItem(ll_i,'f_prog_ini',idtm_fechahora_programacion_ini)
//		lds_acttareas.SetItem(ll_i,'f_prog_fin',idtm_fechaHora_programacion_fin)
//End If
//lds_acttareas.SetItemStatus(ll_i,0,Primary!,DataModified!)
//ll_i=lds_acttareas.Update(/*True,False*/)//<>1 Then
//VERSION OBJECTO PERS.


If al_condicion=14 or al_condicion=15 or al_condicion=16 Then
	ll_condicion=al_condicion - 10 //estas son las que estan en proceso
else
	ll_condicion=2 //condicion programada
End If


ll_i=	iuo_comun.of_actualizar_tarea_color_ss(al_nu_orden, &
		al_consec,al_grupo,al_cola_grupo,al_fabrica,al_maqtin,al_cola_mq_tin,&
		idtm_fechahora_programacion_ini,idtm_fechaHora_programacion_fin,&
		ll_condicion,n_cst_application.itr_appl)
////-------------------------------------------------
If ll_i<>1 Then 
	iuo_comun.of_rollback(n_cst_application.itr_appl)
	MessageBox('Advertencia','Error al actualizar la informaci$$HEX1$$f300$$ENDHEX$$n de programaci$$HEX1$$f300$$ENDHEX$$n para las tareas por color/solicitud',StopSign!)
	Return -1
End If

long ll_pos

String ls_find

ls_find="consec="+String(al_consec)

ll_pos=ids_tareas_orden.Find(ls_find,1,ids_tareas_orden.RowCount())

//Messagebox('Var','ll_pos='+String(ll_pos)+'~n')

//Messagebox('Var','al_consec='+String(al_consec)+'~n'+&
//'idtm_fechahora_programacion_ini='+String(idtm_fechahora_programacion_ini)+'~n'+&
//'idtm_fechahora_programacion_fin='+String(idtm_fechahora_programacion_fin)+'~n')
//
If ll_pos>0 Then
	ids_tareas_orden.SetItem(ll_pos,"f_mov_ini",idtm_fechahora_programacion_ini)
	ids_tareas_orden.SetItem(ll_pos,"f_mov_fin",idtm_fechahora_programacion_fin)
End If	
//-------------------------------------------------
//lds_acttareas = CREATE n_ds_application
//lds_acttareas.of_load('d_actualizar_tareasxcolor_ss')
//lds_acttareas.of_conexion(n_cst_application.itr_appl,True)
//lds_acttareas.Retrieve(al_nu_orden,al_consec)
//lds_acttareas.SaveAs('D:\IS\candrico\Scripts\SaveAs\dw_act_tarea_colorss.xls',Excel5!,True)
Return 1
//***********************************************************************
//lds_acttareas = CREATE n_ds_application
//lds_acttareas.of_load('d_actualizar_tareasxcolor_ss_ext')
//lds_acttareas.of_conexion(n_cst_application.itr_appl,True)
////-------------------------------------------------
//ll_i=lds_acttareas.InsertRow(0)
//lds_acttareas.SetItem(ll_i,'nu_orden',al_nu_orden)
//lds_acttareas.SetItem(ll_i,'consec',al_consec)
//lds_acttareas.SetItem(ll_i,'co_grupo',al_grupo)
//lds_acttareas.SetItem(ll_i,'cola_grupo',al_cola_grupo)
//lds_acttareas.SetItem(ll_i,'co_maq_tin',al_maqtin)
//lds_acttareas.SetItem(ll_i,'cola_tin',al_cola_mq_tin)	
//lds_acttareas.SetItem(ll_i,'f_mov_ini',idtm_fechahora_programacion_ini)
//lds_acttareas.SetItem(ll_i,'f_mov_fin',idtm_fechahora_programacion_fin)	
//lds_acttareas.SetItem(ll_i,'condicion',2)// El estado de la tarea en PROGRAMADA
//lds_acttareas.SetItemStatus(ll_i,0,Primary!,DataModified!)
//If lds_acttareas.Update(/*True,False*/)<>1 Then 
//	iuo_comun.of_rollback(n_cst_application.itr_appl)
//	MessageBox('Advertencia','Error al actualizar la informaci$$HEX1$$f300$$ENDHEX$$n de programaci$$HEX1$$f300$$ENDHEX$$n para las tareas por color/solicitud',StopSign!)
//	Return -1
//End If
//***********************************************************************
end function

public function integer of_set_tipo_muestra (string as_tipo_muestra);If as_tipo_muestra = ' ' Then Return -1
//----------------------------
is_tipo_muestra = as_tipo_muestra

Return 1
end function

public function boolean of_validarrecursodisponibledllo ();/********************************************************************
SA51505 - of_validarRecursoDisponibleDllo Ceiba/JJ - 18-08-2015
<DESC> Description: validar si el recurso esta disponble o no para desarrollo de prenda </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Valida con respecto a maestro de grupo de trabajo </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
n_cst_dt_mu_rec_gru	lds_dt_mu_rec_gru			//Para validar los recursos contra el maestro de Grupos	
Try 
	lds_dt_mu_rec_gru		= Create n_cst_dt_mu_rec_gru
	lds_dt_mu_rec_gru.of_setNombreDataObject('d_dt_mu_rec_gru_all')
	lds_dt_mu_rec_gru.of_RecuperarInformacion() //Se recuperan todos los recursos habilitados para dllo 
	IF lds_dt_mu_rec_gru.of_ValidarRecursoHabDllo(il_recurso) THEN 		
		RETURN TRUE
	END IF
	Destroy lds_dt_mu_rec_gru
	RETURN FALSE
catch( Throwable ex1 )
	Throw ex1
End try 
end function

public function boolean of_validarconvertidoref ();/********************************************************************
SA51505 - of_validarconvertidoref Ceiba/JJ - 18-08-2015
<DESC> Description:Validar si fue o no convertida a referencia </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Valida con respecto a Muestra Basica </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
n_cst_c_orden_pdn	lnv_c_orden_pdn			 
Try 
	lnv_c_orden_pdn		= Create n_cst_c_orden_pdn
	IF lnv_c_orden_pdn.of_validarcamporecursohabilitado(il_fabrica_mue,of_getLinea(),of_getMuestra()) THEN 		
		Destroy lnv_c_orden_pdn
		RETURN TRUE
	END IF
	Destroy lnv_c_orden_pdn
	RETURN FALSE
catch( Throwable ex1 )
	Throw ex1
End try 
end function

public function long of_getlinea ();/********************************************************************
SA51505 - of_getLinea - Ceiba/JJ - 18-08-2015
<DESC> Description: Retornar el nombre del dato solcitado </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> obtener dato solicitado </USAGE>
********************************************************************/	
RETURN il_linea
end function

public subroutine of_setlinea (readonly long al_valor);/********************************************************************
SA51505 - of_setLinea - Ceiba/JJ - 18-08-2015
<DESC> Description: setear dato campo requerido </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> cambiar valor dato solicitado </USAGE>
********************************************************************/	
THIS.il_linea = al_valor
end subroutine

public function long of_getmuestra ();/********************************************************************
SA51505 - of_getMuestra - Ceiba/JJ - 18-08-2015
<DESC> Description: Retornar el nombre del dato solcitado </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> obtener dato solicitado </USAGE>
********************************************************************/	
RETURN il_muestra
end function

public subroutine of_setmuestra (readonly long al_valor);/********************************************************************
SA51505 - of_setMuestra - Ceiba/JJ - 18-08-2015
<DESC> Description: setear dato campo requerido </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> cambiar valor dato solicitado </USAGE>
********************************************************************/	
THIS.il_muestra = al_valor
end subroutine

public function long of_getfabricamuestra ();/********************************************************************
SA51505 - of_getFabricaMuestra - Ceiba/JJ - 18-08-2015
<DESC> Description: Retornar el nombre del dato solcitado </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> obtener dato solicitado </USAGE>
********************************************************************/	
RETURN il_fabrica_mue
end function

public subroutine of_setfabricamuestra (readonly long al_valor);/********************************************************************
SA51505 - of_setfabricamuestra - Ceiba/JJ - 18-08-2015
<DESC> Description: setear dato campo requerido </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> cambiar valor dato solicitado </USAGE>
********************************************************************/	
THIS.il_fabrica_mue = al_valor
end subroutine

on n_cst_programacion_ordenes.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_programacion_ordenes.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;SetNull(il_recurso)

end event

event destructor;Destroy ids_grupos_busca
Destroy ids_lista_grupos_colas

Destroy ids_activ_oper_rec
Destroy ids_estado_tarea_grupo
Destroy ids_estado_tarea_mtin
Destroy ids_estado_tarea_recurso
Destroy ids_festivos
Destroy ids_grupos
Destroy ids_maq_tin
Destroy ids_maquinas_examina
Destroy ids_momento_predecesor
Destroy ids_recurso_grupo
Destroy ids_tareas_copia
Destroy ids_tareas_orden
Destroy ids_turnos
Destroy ids_verif_precedencia_new

Destroy ids_vector_grupos
Destroy ids_vector_tin


end event

