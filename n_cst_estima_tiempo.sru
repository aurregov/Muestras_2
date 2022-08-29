HA$PBExportHeader$n_cst_estima_tiempo.sru
$PBExportComments$Objeto personalizado para la estimaci$$HEX1$$f300$$ENDHEX$$n de tiempos
forward
global type n_cst_estima_tiempo from nonvisualobject
end type
end forward

global type n_cst_estima_tiempo from nonvisualobject autoinstantiate
end type

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:17:40
---------------------------------------------------
Variables instancia del Objeto para la estimaci$$HEX1$$f300$$ENDHEX$$n de tiempos
---------------------------------------------------*/
PRIVATE:
	Long 		il_co_recurso, il_co_tipoprod, il_co_tipo_tejido,&
				il_co_grupo_talla, il_co_talla, il_tono,&				
				il_cilindros,il_cant_pares,il_cant_colores,il_criterio_tiempo,&
				il_grupoprod, il_ca_alimentadores
				
	Integer	ii_item
	String	is_nuevo_reforma,is_txpar,is_ajuste_maq,is_ajustexcol, is_ciclo_tejido
			
PUBLIC:	
	n_ds_application	ids_mu_pro_t1, ids_mu_pro_t2, ids_mu_pro_t3, ids_mu_pro_t4,ids_mu_pro_t5,&
							ids_mu_activ_t1, ids_mu_activ_t2, ids_mu_activ_t3,ids_mu_activ_t4, ids_mu_activ_t5,&
							ids_mu_activ_t6, ids_mu_pro_t6
	
	Decimal{2} idc_dato
end variables

forward prototypes
public function integer of_setrecurso (long al_recurso)
public function integer of_settipoprod (long al_tipoprod)
public function integer of_setgrupotalla (long al_grupo_talla)
public function integer of_settipotejido (long al_tipo_tejido)
public function integer of_settalla (long al_talla)
public function integer of_get_tiempo_activ_col (long al_id_actividad, long al_pares, long al_tono)
public function integer of_setcilindros (long al_cilindros)
public function integer of_gettiempo_operacion (long al_id_operacion)
public function integer of_gettiempo_operacion_col (long al_id_operacion, long al_pares, long al_tono)
public function integer of_setcantpares (long al_cant_pares)
public function integer of_setcantcolores (long al_cant_colores)
public function integer of_setnuevo_reforma (string as_nuevo_reforma)
public function integer of_setcriteriotiempo (long al_criterio_tiempo)
public function integer of_settxpar (string as_tiempoxpar)
public function integer of_setajuste_maq (string as_ajuste_maq)
public function integer of_setajustexcol (string as_ajustexcol)
public function integer of_cargar_item (integer ai_item)
public function integer of_destroy_item (integer ai_item)
public function long of_gettiempo_activ (long aid_actividad)
public function integer of_setgrupoprod (long al_grupoprod)
public function integer of_setalimentadores (long al_alimentadores)
public function integer of_setciclotejido (string as_ciclotejido)
end prototypes

public function integer of_setrecurso (long al_recurso);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:18:20
---------------------------------------------------
DESCRIPTION
Asigna el co_recurso
---------------------------------------------------*/
il_co_recurso = al_recurso
//---------------------------------------------------
Return 1
end function

public function integer of_settipoprod (long al_tipoprod);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:18:20
---------------------------------------------------
DESCRIPTION
Asigna co_tipoprod
---------------------------------------------------*/
il_co_tipoprod = al_tipoprod
//---------------------------------------------------
Return 1
end function

public function integer of_setgrupotalla (long al_grupo_talla);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:18:20
---------------------------------------------------
DESCRIPTION
Asigna co_grupo_talla
---------------------------------------------------*/
il_co_grupo_talla = al_grupo_talla
//---------------------------------------------------
Return 1
end function

public function integer of_settipotejido (long al_tipo_tejido);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:18:20
---------------------------------------------------
DESCRIPTION
Asigna co_tipo_tejido
---------------------------------------------------*/
il_co_tipo_tejido = al_tipo_tejido
//---------------------------------------------------
Return 1
end function

public function integer of_settalla (long al_talla);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:18:20
---------------------------------------------------
DESCRIPTION
Asigna co_talla
---------------------------------------------------*/
il_co_talla = al_talla
//---------------------------------------------------
Return 1
end function

public function integer of_get_tiempo_activ_col (long al_id_actividad, long al_pares, long al_tono);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:18:16
---------------------------------------------------
Data from design:
DESCRIPTION
//se asigna la variable de tono y se hace lo mismo que en el caso de nos ser por color
BEHAVIOR
<<il_tono>>=<<tono>>
<<il_cant_colores>>=1
il_cant_pares=a_pares
respuesta=of_gettiempo_activ(actividad)
retorne respuesta
---------------------------------------------------*/
Long ll_respuesta
//---------------------------------------------------
il_tono = al_tono
il_cant_colores=1
il_cant_pares=al_pares
ll_respuesta = of_gettiempo_activ(al_id_actividad)
//---------------------------------------------------
Return ll_respuesta
//---------------------------------------------------
end function

public function integer of_setcilindros (long al_cilindros);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 18 de Noviembre de 2004.H:17:28
---------------------------------------------------
DESCRIPTION
Asigna cilindros
---------------------------------------------------*/
il_cilindros = al_cilindros
//---------------------------------------------------
Return 1
end function

public function integer of_gettiempo_operacion (long al_id_operacion);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:17:58
---------------------------------------------------
---------------------------------------------------*/
Long ll_total_filas, ll_tipomaquina
Decimal{2} lde_tiempo,lde_tiempo_ajuste
String ls_desc,ls_tipoprod,ls_tipotej,ls_grupotalla,ls_talla,ls_res
n_cst_comun_orden luo_comun
//---------------------------------------------------
//********************
ii_item=0 /*operacion*/
This.of_cargar_item(ii_item)
//********************
Choose Case il_criterio_tiempo
	Case 1
		ll_total_filas=ids_mu_pro_t1.Retrieve(al_id_operacion)
   	If ll_total_filas<=0 Then
			luo_comun.of_nombre_operac_muestra(al_id_operacion,n_cst_application.itr_appl) 
			ls_desc=luo_comun.of_getstring(1)
			MessageBox('Advertencia','Datos no encontrados en la estimaci$$HEX1$$f300$$ENDHEX$$n de tiempo de la operaci$$HEX1$$f300$$ENDHEX$$n: <'+&
							String(al_id_operacion)+'> '+ls_desc+' para el criterio de tiempo No. 1',StopSign!)
      	Return -1
	   End If
   	lde_tiempo=ids_mu_pro_t1.GetItemDecimal(1,1)
	Case 2		
		ll_total_filas=ids_mu_pro_t2.Retrieve(al_id_operacion,il_cilindros,is_nuevo_reforma)
   	If ll_total_filas<=0 Then
			luo_comun.of_nombre_operac_muestra(al_id_operacion,n_cst_application.itr_appl) 
			ls_desc=luo_comun.of_getstring(1)
			MessageBox('Advertencia','Datos no encontrados en la estimaci$$HEX1$$f300$$ENDHEX$$n de tiempo de la operaci$$HEX1$$f300$$ENDHEX$$n: <'+&
							String(al_id_operacion)+'> '+ls_desc+' para el criterio de tiempo No. 2 con : ~n'+&
							'Cilindros: '+String(il_cilindros)+'~nNuevo/Reforma: '+luo_comun.of_nombrenuevoreforma(is_nuevo_reforma),StopSign!)
      	Return -1
	   End If
   	lde_tiempo=ids_mu_pro_t2.GetItemDecimal(1,1)
	Case 3
		ll_total_filas=ids_mu_pro_t3.Retrieve(al_id_operacion,il_co_tipoprod,il_co_tipo_tejido,il_cilindros)
   	If ll_total_filas<=0 Then
			luo_comun.of_nombre_operac_muestra(al_id_operacion,n_cst_application.itr_appl) 
			ls_desc=luo_comun.of_getstring(1)
			luo_comun.of_nombretipoprod(il_co_tipoprod,n_cst_application.itr_appl)
			ls_tipoprod=luo_comun.of_getstring(1)
			luo_comun.of_nombretipotejido(il_co_tipoprod,il_co_tipo_tejido,n_cst_application.itr_appl)
			ls_tipotej=luo_comun.of_getstring(1)
			MessageBox('Advertencia','Datos no encontrados en la estimaci$$HEX1$$f300$$ENDHEX$$n de tiempo de la operaci$$HEX1$$f300$$ENDHEX$$n: <'+&
							String(al_id_operacion)+'> '+ls_desc+' para el criterio de tiempo No. 3 con : ~n'+&
							'Tipo producto: '+String(il_co_tipoprod)+' - '+ls_tipoprod+&
							'~nTipo tejido: '+String(il_co_tipo_tejido)+' - '+ls_tipotej+&
							'~nCilindros: '+String(il_cilindros),StopSign!)
      	Return -1
	   End If
		lde_tiempo=ids_mu_pro_t3.GetItemDecimal(1,"minutos")
	   lde_tiempo_ajuste= ids_mu_pro_t3.GetItemDecimal(1,"min_alista")   
	Case 4
		ll_total_filas=ids_mu_pro_t4.Retrieve(al_id_operacion,il_co_grupo_talla,il_co_talla)
   	If ll_total_filas<=0 Then
			luo_comun.of_nombre_operac_muestra(al_id_operacion,n_cst_application.itr_appl) 
			ls_desc=luo_comun.of_getstring(1)
			luo_comun.of_nombregrupotalla(il_co_grupo_talla,n_cst_application.itr_appl)
			ls_grupotalla=luo_comun.of_getstring(1)
			luo_comun.of_nombretalla(il_co_grupo_talla,il_co_talla,n_cst_application.itr_appl)
			ls_talla=luo_comun.of_getstring(1)
			MessageBox('Advertencia','Datos no encontrados en la estimaci$$HEX1$$f300$$ENDHEX$$n de tiempo de la operaci$$HEX1$$f300$$ENDHEX$$n: <'+&
							String(al_id_operacion)+'> '+ls_desc+' para el criterio de tiempo No. 4 con : ~n'+&
							'Grupo Talla: '+String(il_co_grupo_talla)+' - '+ls_grupotalla+&
							'~nTalla: '+String(il_co_talla)+' - '+ls_talla,StopSign!)
      	Return -1
	   End If
   	lde_tiempo=ids_mu_pro_t4.GetItemDecimal(1,1)
	Case 5
		ll_total_filas=ids_mu_pro_t5.Retrieve(al_id_operacion,il_tono)
   	If ll_total_filas<=0 Then
			luo_comun.of_nombre_operac_muestra(al_id_operacion,n_cst_application.itr_appl)
			ls_desc=luo_comun.of_getstring(1)
			MessageBox('Advertencia','Datos no encontrados en la estimaci$$HEX1$$f300$$ENDHEX$$n de tiempo de la operaci$$HEX1$$f300$$ENDHEX$$n: <'+&
							String(al_id_operacion)+'> '+ls_desc+' para el criterio de tiempo No. 5 con : ~n'+&
							'Tono: '+luo_comun.of_nombretono(il_tono),StopSign!)
      	Return -1
	   End If
   	lde_tiempo=ids_mu_pro_t5.GetItemDecimal(1,1)
		
	Case 6
		luo_comun.of_gettipomaquina(il_co_recurso,n_cst_application.itr_appl)
		ll_tipomaquina=luo_comun.of_getlong(1)
		
		ll_total_filas=ids_mu_pro_t6.Retrieve(al_id_operacion, il_co_tipoprod, il_grupoprod, is_ciclo_tejido,&
		                                        il_ca_alimentadores, ll_tipomaquina )
   	If ll_total_filas<=0 Then
			luo_comun.of_nombre_operac_muestra(al_id_operacion,n_cst_application.itr_appl)
			ls_desc=luo_comun.of_getstring(1)
			MessageBox('Advertencia','Datos no encontrados en la estimaci$$HEX1$$f300$$ENDHEX$$n de tiempo de la operaci$$HEX1$$f300$$ENDHEX$$n: <'+&
							String(al_id_operacion)+'> '+ls_desc+' para el criterio de tiempo No. 6 con : ~n'+&
							'Grupo de Tipo de Producto: '+String(il_grupoprod)+"~n"+&
							'Ciclo de Tejido: '+is_ciclo_tejido+"~n"+&
							'Cantidad de Alimentadores: '+String(il_ca_alimentadores)+"~n"+&
							'Tipo de M$$HEX1$$e100$$ENDHEX$$quina: '+String(ll_tipomaquina),StopSign!)
      	Return -1
	   End If
	
   	lde_tiempo		 	= ids_mu_pro_t6.GetItemDecimal(1,'ca_minutos')
   	lde_tiempo_ajuste = ids_mu_pro_t6.GetItemDecimal(1,"ca_min_alista")

	Case Else
End Choose

//---------------------------------------------------		
If is_txpar="S" Then
   If il_cant_pares<=0 Then
			luo_comun.of_nombre_operac_muestra(al_id_operacion,n_cst_application.itr_appl)
			ls_desc=luo_comun.of_getstring(1)
			MessageBox('Advertencia','La operaci$$HEX1$$f300$$ENDHEX$$n ('+String(al_id_operacion)+')'+ls_desc+' considera pares para la estimaci$$HEX1$$f300$$ENDHEX$$n de tiempo, '+&
							'pero el valor de la cantidad de pares no es v$$HEX1$$e100$$ENDHEX$$lido al momento de realizar la estimaci$$HEX1$$f300$$ENDHEX$$n.',StopSign!)
			Return -1
	End If
   lde_tiempo = lde_tiempo * il_cant_pares
End If
//---------------------------------------------------		
If is_ajuste_maq="S" Then
   If is_ajustexcol="S" Then
		lde_tiempo_ajuste = lde_tiempo_ajuste * il_cant_colores;
	End If
Else
    lde_tiempo_ajuste=0
End If
lde_tiempo=lde_tiempo + lde_tiempo_ajuste
//---------------------------------------------------
//Se redondea el tiempo resultado
If lde_tiempo <=0 OR IsNull(lde_tiempo) Then
			luo_comun.of_nombre_operac_muestra(al_id_operacion,n_cst_application.itr_appl)
			ls_desc=luo_comun.of_getstring(1)
			If IsNull(lde_tiempo) Then 
				ls_res='NULL'
			Else 
				ls_res=String(lde_tiempo)
			End If
			MessageBox('Advertencia','El tiempo estimado para la operaci$$HEX1$$f300$$ENDHEX$$n ('+String(al_id_operacion)+') '+ls_desc+' no es v$$HEX1$$e100$$ENDHEX$$lido.~n'+&
							'Su resultado ha sido: <'+ls_res+'>',StopSign!)
			Return -1
ElseIf (lde_tiempo - Truncate(lde_tiempo,0)) > 0 Then
			lde_tiempo = Truncate(lde_tiempo,0) + 1
End If
//---------------------------------------------------		
Return lde_tiempo
end function

public function integer of_gettiempo_operacion_col (long al_id_operacion, long al_pares, long al_tono);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:17:58
---------------------------------------------------
Data from design:
DESCRIPTION
//Se asigna la variable de tono y se hace lo mismo que en el caso de no ser por color

<<il_tono>>=<<tono>>
<<il_cant_colores>>=1
il_cant_pares=a_pares
respuesta=of_gettiempo_operacion(operacion )
retorne respuesta
---------------------------------------------------*/
Long ll_respuesta
//---------------------------------------------------
il_tono = al_tono
il_cant_colores = 1
il_cant_pares = al_pares
ll_respuesta = of_gettiempo_operacion(al_id_operacion)
Return ll_respuesta
end function

public function integer of_setcantpares (long al_cant_pares);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 18 de Noviembre de 2004.H:17:28
---------------------------------------------------
DESCRIPTION
Asigna la cantidad de pares
---------------------------------------------------*/
il_cant_pares = al_cant_pares
//---------------------------------------------------
Return 1
end function

public function integer of_setcantcolores (long al_cant_colores);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 18 de Noviembre de 2004.H:17:28
---------------------------------------------------
DESCRIPTION
Asigna la cantidad de colores
---------------------------------------------------*/
il_cant_colores = al_cant_colores
//---------------------------------------------------
Return 1
end function

public function integer of_setnuevo_reforma (string as_nuevo_reforma);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 18 de Noviembre de 2004.H:17:28
---------------------------------------------------
DESCRIPTION
Asigna valor de nuevo/reforma
---------------------------------------------------*/
is_nuevo_reforma = as_nuevo_reforma
//---------------------------------------------------
Return 1
end function

public function integer of_setcriteriotiempo (long al_criterio_tiempo);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 18 de Noviembre de 2004.H:17:28
---------------------------------------------------
DESCRIPTION
Asigna el criterio de tiempo
---------------------------------------------------*/
il_criterio_tiempo = al_criterio_tiempo
//---------------------------------------------------
Return 1
end function

public function integer of_settxpar (string as_tiempoxpar);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 18 de Noviembre de 2004.H:17:28
---------------------------------------------------
DESCRIPTION
Asigna txpar
---------------------------------------------------*/
is_txpar = as_tiempoxpar
//---------------------------------------------------
Return 1
end function

public function integer of_setajuste_maq (string as_ajuste_maq);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 18 de Noviembre de 2004.H:17:28
---------------------------------------------------
DESCRIPTION
Asigna valor de ajuste de m$$HEX1$$e100$$ENDHEX$$quina
---------------------------------------------------*/
is_ajuste_maq = as_ajuste_maq
//---------------------------------------------------
Return 1
end function

public function integer of_setajustexcol (string as_ajustexcol);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 18 de Noviembre de 2004.H:17:28
---------------------------------------------------
DESCRIPTION
Asigna valor de ajuste por color
---------------------------------------------------*/
is_ajustexcol = as_ajustexcol
//---------------------------------------------------
Return 1
end function

public function integer of_cargar_item (integer ai_item);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 25 de Noviembre de 2004.H:10:06
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n que carga los valores de los objetos de transaction
y DWO para el calculo de la estimaci$$HEX1$$f300$$ENDHEX$$n del item
---------------------------------------------------*/
//---------------------------------------------------
Choose Case ai_item
	Case 0 // Operacion
		ids_mu_pro_t1 = CREATE n_ds_application
		ids_mu_pro_t1.of_load('d_mu_pro_t1_busca')
		ids_mu_pro_t1.of_conexion(n_cst_application.itr_appl,True)
		ids_mu_pro_t2 = CREATE n_ds_application
		ids_mu_pro_t2.of_load('d_mu_pro_t2_busca')
		ids_mu_pro_t2.of_conexion(n_cst_application.itr_appl,True)
		ids_mu_pro_t3 = CREATE n_ds_application
		ids_mu_pro_t3.of_load('d_mu_pro_t3_busca')		
		ids_mu_pro_t3.of_conexion(n_cst_application.itr_appl,True)
		ids_mu_pro_t4 = CREATE n_ds_application
		ids_mu_pro_t4.of_load('d_mu_pro_t4_busca')
		ids_mu_pro_t4.of_conexion(n_cst_application.itr_appl,True)
		ids_mu_pro_t5 = CREATE n_ds_application
		ids_mu_pro_t5.of_load('d_mu_pro_t5_busca')
		ids_mu_pro_t5.of_conexion(n_cst_application.itr_appl,True)
		ids_mu_pro_t6 = CREATE n_ds_application
		ids_mu_pro_t6.of_load('d_mu_pro_t6_busca')
		ids_mu_pro_t6.of_conexion(n_cst_application.itr_appl,True)
	Case 1 //Actividad
		ids_mu_activ_t1 = CREATE n_ds_application
		ids_mu_activ_t1.of_load('d_mu_activ_t1_busca')
		ids_mu_activ_t1.of_conexion(n_cst_application.itr_appl,True)
		ids_mu_activ_t2 = CREATE n_ds_application
		ids_mu_activ_t2.of_load('d_mu_activ_t2_busca')
		ids_mu_activ_t2.of_conexion(n_cst_application.itr_appl,True)
		ids_mu_activ_t3 = CREATE n_ds_application
		ids_mu_activ_t3.of_load('d_mu_activ_t3_busca')
		ids_mu_activ_t3.of_conexion(n_cst_application.itr_appl,True)
		ids_mu_activ_t4 = CREATE n_ds_application
		ids_mu_activ_t4.of_load('d_mu_activ_t4_busca')
		ids_mu_activ_t4.of_conexion(n_cst_application.itr_appl,True)
		ids_mu_activ_t5 = CREATE n_ds_application
		ids_mu_activ_t5.of_load('d_mu_activ_t5_busca')
		ids_mu_activ_t5.of_conexion(n_cst_application.itr_appl,True)
		ids_mu_activ_t6 = CREATE n_ds_application
		ids_mu_activ_t6.of_load('d_mu_activ_t6_busca')
		ids_mu_activ_t6.of_conexion(n_cst_application.itr_appl,True)
End Choose
Return 1
end function

public function integer of_destroy_item (integer ai_item);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 25 de Noviembre de 2004.H:10:06
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n que destruye los objetos ds para la estimaci$$HEX1$$f300$$ENDHEX$$n
---------------------------------------------------*/
//---------------------------------------------------
Choose Case ai_item
	Case 0 // Operacion
		DESTROY ids_mu_pro_t1 
		DESTROY ids_mu_pro_t2
		DESTROY ids_mu_pro_t3
		DESTROY ids_mu_pro_t4
		DESTROY ids_mu_pro_t5
	Case 1 //Actividad
		DESTROY ids_mu_activ_t1
		DESTROY ids_mu_activ_t2
		DESTROY ids_mu_activ_t3
		DESTROY ids_mu_activ_t4
		DESTROY ids_mu_activ_t5
End Choose
Return 1
end function

public function long of_gettiempo_activ (long aid_actividad);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:17:58
---------------------------------------------------
---------------------------------------------------*/
Long ll_total_filas, ll_tipomaquina
Decimal{2} lde_tiempo, lde_tiempo_ajuste
Integer li_cilindros
String ls_desc,ls_tipoprod,ls_tipotej,ls_grupotalla,ls_talla,ls_res
n_cst_comun_orden luo_comun
//---------------------------------------------------
//********************
ii_item=1 /*actividad*/
This.of_cargar_item(ii_item)
//********************
Choose Case il_criterio_tiempo
	Case 1
		ll_total_filas=ids_mu_activ_t1.Retrieve(aid_actividad)
   	If ll_total_filas<=0 Then
			luo_comun.of_nombreactividad(aid_actividad,n_cst_application.itr_appl)
			ls_desc=luo_comun.of_getstring(1)
			MessageBox('Advertencia','Datos no encontrados en la estimaci$$HEX1$$f300$$ENDHEX$$n de tiempo de la actividad: <'+&
							String(aid_actividad)+'> '+ls_desc+' para el criterio de tiempo No. 1',StopSign!)
      	Return -1
	   End If
   	lde_tiempo=ids_mu_activ_t1.GetItemDecimal(1,1)
	Case 2	
		ll_total_filas=ids_mu_activ_t2.Retrieve(aid_actividad,il_cilindros,is_nuevo_reforma)
   	If ll_total_filas<=0 Then
			luo_comun.of_nombreactividad(aid_actividad,n_cst_application.itr_appl)
			ls_desc=luo_comun.of_getstring(1)
			MessageBox('Advertencia','Datos no encontrados en la estimaci$$HEX1$$f300$$ENDHEX$$n de tiempo de la actividad: <'+&
							String(aid_actividad)+'> '+ls_desc+' para el criterio de tiempo No. 2 con : ~n'+&
							'Cilindros: '+String(il_cilindros)+'~nNuevo/Reforma: '+luo_comun.of_nombrenuevoreforma(is_nuevo_reforma),StopSign!)
      	Return -1
	   End If
   	lde_tiempo=ids_mu_activ_t2.GetItemDecimal(1,1)
	Case 3
		ll_total_filas=ids_mu_activ_t3.Retrieve(aid_actividad,il_co_tipoprod,il_co_tipo_tejido,il_cilindros)
   	If ll_total_filas<=0 Then
			luo_comun.of_nombreactividad(aid_actividad,n_cst_application.itr_appl)
			ls_desc=luo_comun.of_getstring(1)
			luo_comun.of_nombretipoprod(il_co_tipoprod,n_cst_application.itr_appl)
			ls_tipoprod=luo_comun.of_getstring(1)
			luo_comun.of_nombretipotejido(il_co_tipoprod,il_co_tipo_tejido,n_cst_application.itr_appl)
			ls_tipotej=luo_comun.of_getstring(1)
			MessageBox('Advertencia','Datos no encontrados en la estimaci$$HEX1$$f300$$ENDHEX$$n de tiempo de la actividad: <'+&
							String(aid_actividad)+'> '+ls_desc+' para el criterio de tiempo No. 3 con : ~n'+&
							'Tipo producto: '+String(il_co_tipoprod)+' - '+ls_tipoprod+&
							'~nTipo tejido: '+String(il_co_tipo_tejido)+' - '+ls_tipotej+&
							'~nCilindros: '+String(il_cilindros),StopSign!)
      	Return -1
	   End If
   	lde_tiempo=ids_mu_activ_t3.GetItemDecimal(1,"minutos")
   	lde_tiempo_ajuste= ids_mu_activ_t3.GetItemDecimal(1,"min_alista")
	Case 4
		ll_total_filas=ids_mu_activ_t4.Retrieve(aid_actividad,il_co_grupo_talla,il_co_talla)
   	If ll_total_filas<=0 Then
			luo_comun.of_nombreactividad(aid_actividad,n_cst_application.itr_appl)
			ls_desc=luo_comun.of_getstring(1)
			luo_comun.of_nombregrupotalla(il_co_grupo_talla,n_cst_application.itr_appl)
			ls_grupotalla=luo_comun.of_getstring(1)
			luo_comun.of_nombretalla(il_co_grupo_talla,il_co_talla,n_cst_application.itr_appl)
			ls_talla=luo_comun.of_getstring(1)
			MessageBox('Advertencia','Datos no encontrados en la estimaci$$HEX1$$f300$$ENDHEX$$n de tiempo de la actividad: <'+&
							String(aid_actividad)+'> '+ls_desc+' para el criterio de tiempo No. 4 con : ~n'+&
							'Grupo Talla: '+String(il_co_grupo_talla)+' - '+ls_grupotalla+&
							'~nTalla: '+String(il_co_talla)+' - '+ls_talla,StopSign!)
      	Return -1
	   End If
   	lde_tiempo=ids_mu_activ_t4.GetItemDecimal(1,1)
	Case 5
		ll_total_filas=ids_mu_activ_t5.Retrieve(aid_actividad,il_tono)
   	If ll_total_filas<=0 Then
			luo_comun.of_nombreactividad(aid_actividad,n_cst_application.itr_appl)
			ls_desc=luo_comun.of_getstring(1)
			MessageBox('Advertencia','Datos no encontrados en la estimaci$$HEX1$$f300$$ENDHEX$$n de tiempo de la actividad: <'+&
							String(aid_actividad)+'> '+ls_desc+' para el criterio de tiempo No. 5 con : ~n'+&
							'Tono: '+luo_comun.of_nombretono(il_tono),StopSign!)
      	Return -1
	   End If
   	lde_tiempo=ids_mu_activ_t5.GetItemDecimal(1,1)
	Case 6
		luo_comun.of_gettipomaquina(il_co_recurso,n_cst_application.itr_appl)
		ll_tipomaquina=luo_comun.of_getlong(1)
		
		ll_total_filas=ids_mu_activ_t6.Retrieve(aid_actividad,il_grupoprod, is_ciclo_tejido,&
		                                        il_ca_alimentadores, ll_tipomaquina )
   	If ll_total_filas<=0 Then
			luo_comun.of_nombreactividad(aid_actividad,n_cst_application.itr_appl)
			ls_desc=luo_comun.of_getstring(1)
			MessageBox('Advertencia','Datos no encontrados en la estimaci$$HEX1$$f300$$ENDHEX$$n de tiempo de la actividad: <'+&
							String(aid_actividad)+'> '+ls_desc+' para el criterio de tiempo No. 6 con : ~n'+&
							'Grupo de Tipo de Producto: '+String(il_grupoprod)+"~n"+&
							'Ciclo de Tejido: '+is_ciclo_tejido+"~n"+&
							'Cantidad de Alimentadores: '+String(il_ca_alimentadores)+"~n"+&
							'Tipo de M$$HEX1$$e100$$ENDHEX$$quina: '+String(ll_tipomaquina),StopSign!)
      	Return -1
	   End If
	

   	lde_tiempo		 	= ids_mu_activ_t6.GetItemDecimal(1,'minutos')
   	lde_tiempo_ajuste = ids_mu_activ_t6.GetItemDecimal(1,"min_alista")

End Choose

//---------------------------------------------------		
If is_txpar="S" Then
   If il_cant_pares<=0 Then
			luo_comun.of_nombreactividad(aid_actividad,n_cst_application.itr_appl)
			ls_desc=luo_comun.of_getstring(1)
			MessageBox('Advertencia','La actividad ('+String(aid_actividad)+') '+ls_desc+' considera pares para la estimaci$$HEX1$$f300$$ENDHEX$$n de tiempo, '+&
							'pero el valor de la cantidad de pares no es v$$HEX1$$e100$$ENDHEX$$lido al momento de realizar la estimaci$$HEX1$$f300$$ENDHEX$$n.',StopSign!)
			Return -1
	End If
   lde_tiempo = lde_tiempo * il_cant_pares
End If
//---------------------------------------------------		
If is_ajuste_maq = "S" Then
	If is_ajustexcol = "S" Then 
		lde_tiempo_ajuste = lde_tiempo_ajuste * il_cant_colores
	End If
Else 
    lde_tiempo_ajuste=0
End If
lde_tiempo=lde_tiempo + lde_tiempo_ajuste
//---------------------------------------------------
//Se redondea el tiempo resultado
If lde_tiempo <=0 OR IsNull(lde_tiempo) Then
			luo_comun.of_nombreactividad(aid_actividad,n_cst_application.itr_appl)
			ls_desc=luo_comun.of_getstring(1)
			If IsNull(lde_tiempo) Then 
				ls_res='NULL'
			Else 
				ls_res=String(lde_tiempo)
			End If
			MessageBox('Advertencia','El tiempo estimado para la actividad ('+String(aid_actividad)+') '+ls_desc+' no es v$$HEX1$$e100$$ENDHEX$$lido.~n'+&
							'Su resultado ha sido: <'+ls_res+'>',StopSign!)
			Return -1
ElseIf(lde_tiempo - Truncate(lde_tiempo,0)) > 0 Then
		lde_tiempo = Truncate(lde_tiempo,0) + 1
End If
//---------------------------------------------------
Return lde_tiempo
end function

public function integer of_setgrupoprod (long al_grupoprod);
il_grupoprod = al_grupoprod
Return 1
end function

public function integer of_setalimentadores (long al_alimentadores);
il_ca_alimentadores = al_alimentadores
Return 1
end function

public function integer of_setciclotejido (string as_ciclotejido);
is_ciclo_tejido = as_ciclotejido
Return 1
end function

on n_cst_estima_tiempo.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_estima_tiempo.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 25 de Noviembre de 2004.H:10:42
---------------------------------------------------
---------------------------------------------------*/
of_destroy_item(ii_item)
//---------------------------------------------------

end event

event constructor;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 25 de Noviembre de 2004.H:10:06
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
end event

