HA$PBExportHeader$n_cst_comun_orden.sru
$PBExportComments$Objeto de Usuario heredado de n_cst_comun para la adicion de funciones del negocio para las ordenes de producci$$HEX1$$f300$$ENDHEX$$n, mantenimiento programaci$$HEX1$$f300$$ENDHEX$$n, Programacion
forward
global type n_cst_comun_orden from n_cst_comun
end type
end forward

global type n_cst_comun_orden from n_cst_comun
end type

type variables
Long il_tipoprod
end variables

forward prototypes
public function integer of_delproc (long al_nu_orden)
public function integer of_nombregrupoact (long al_grupo, transaction atr_transaction)
public function integer of_del_criactiv (long al_actividad, integer ai_criterio)
public function integer of_del_crioper (long al_operacion, integer ai_criterio)
public function integer of_nombreturno (long al_turno, transaction atr_transaction)
public function integer of_nombreactividad (long al_actividad, transaction atr_transaction)
public function integer of_nombre_operac_muestra (long al_operacion, transaction a_transaction)
public function integer of_nombrechablon (long al_chablon, transaction atr_transaction)
public function integer of_nombrebordado (long al_bordado, transaction atr_transaction)
public function integer of_x_color_estado (long a_estado, transaction a_transaction)
public function integer of_tono_color (long a_fabrica, long a_linea, long a_color, transaction a_transaction)
public function integer of_nombretinta (long al_tinta, transaction atr_transaction)
public function long of_nombrecolor (long a_fabrica, long a_linea, long a_color, transaction a_transaction)
public function integer of_constraints_deferred ()
public function integer of_validardescripcion (string as_desc, integer ai_cod, transaction atr_transaction)
public function integer of_nombremaqtin (long al_maquina, transaction atr_transaction)
public function integer of_nombrehilo (long al_hilo, transaction atr_transaction)
public function integer of_commit ()
public function integer of_rollback ()
public function integer of_rollback (transaction atr_transaction)
public function integer of_commit (transaction atr_transaction)
public function string of_nombrenuevoreforma (string as_nr)
public function string of_nombretono (long al_tono)
public function integer of_actualizar_tarea_estado (long al_orden, long al_estado, long al_grupo, long al_cola_grupo, datetime adtm_fmovini, datetime adtm_fmovfin, long al_condicion, ref transaction a_transaction)
public function integer of_act_reacomoda_canc (ref transaction a_transaction)
public function integer of_nombremaqtin (long al_fabrica, long al_cs_maquina, transaction atr_transaction)
public function integer of_actualizar_tarea_color_ss (long al_orden, long al_consec, long al_grupo, long al_cola_grupo, long al_fabrica, long al_maq_tin, long al_cola_maq_tin, datetime adtm_fmovini, datetime adtm_fmovfin, long al_condicion, ref transaction a_transaction)
public function integer of_nombreactividadtipo (long al_actividad, long al_tipoprod, transaction atr_transaction)
public function integer of_nombre_operac_muestra (long al_operacion, long al_tipoprod, transaction a_transaction)
public function integer of_gettipomaquina (long al_recurso, transaction atr_transaction)
public function integer of_validarcodigo (long ai_codigo, integer ai_cod, transaction atr_transaction)
public function integer of_act_reacomoda_canc (integer al_nu_orden, ref transaction a_transaction)
end prototypes

public function integer of_delproc (long al_nu_orden);/*-------------------------------------------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 8 de Octubre de 2004.H:18:35
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------*/


DELETE FROM dt_mu_ord_proc  
WHERE ( dt_mu_ord_proc.nu_orden = :al_nu_orden )   
USING n_cst_application.itr_appl;

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If
Return 1

end function

public function integer of_nombregrupoact (long al_grupo, transaction atr_transaction);
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:17:39
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n que devuelve la descripci$$HEX1$$f300$$ENDHEX$$n del grupo para la actividad
de Programacion de muestras
---------------------------------------------------*/
String ls_dato
Long ll_cant
//-------------------------------------------------

If IsNull(al_grupo)  Then
	Return -1
End If

  SELECT m_mu_grupo.de_grupo,
  			m_mu_grupo.cantidad_colas
    INTO :ls_dato, :ll_cant  
    FROM m_mu_grupo  
   WHERE m_mu_grupo.id_grupo = :al_grupo 
	USING atr_transaction;

If atr_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
End If


If atr_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato
il_retorno[1]=ll_cant

Return 1

end function

public function integer of_del_criactiv (long al_actividad, integer ai_criterio);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 28 de Octubre de 2004.H:18:02
---------------------------------------------------
---------------------------------------------------*/
If ai_criterio>0 And ai_criterio<6 Then
	If ai_criterio<>1 Then
		DELETE FROM mu_activ_t1
		WHERE ( mu_activ_t1.id_actividad = :al_actividad )   
		USING n_cst_application.itr_appl;
		If n_cst_application.itr_appl.SQLcode=-1 Then 
			PopulateError(20,"SQL Error")
			n_cst_application.of_sql_error(n_cst_application.itr_appl)
			Return -1
		End If
	End If
	
	If ai_criterio<>2 Then
		DELETE FROM mu_activ_t2
		WHERE ( mu_activ_t2.id_actividad = :al_actividad )   
		USING n_cst_application.itr_appl;
		If n_cst_application.itr_appl.SQLcode=-1 Then 
			PopulateError(20,"SQL Error")
			n_cst_application.of_sql_error(n_cst_application.itr_appl)
			Return -1
		End If
	End If
	
	If ai_criterio<>3 Then
		DELETE FROM mu_activ_t3
		WHERE ( mu_activ_t3.id_actividad = :al_actividad )   
		USING n_cst_application.itr_appl;
		If n_cst_application.itr_appl.SQLcode=-1 Then 
			PopulateError(20,"SQL Error")
			n_cst_application.of_sql_error(n_cst_application.itr_appl)
			Return -1
		End If
	End If
	
	If ai_criterio<>4 Then
		DELETE FROM mu_activ_t4
		WHERE ( mu_activ_t4.id_actividad = :al_actividad )   
		USING n_cst_application.itr_appl;
		If n_cst_application.itr_appl.SQLcode=-1 Then 
			PopulateError(20,"SQL Error")
			n_cst_application.of_sql_error(n_cst_application.itr_appl)
			Return -1
		End If
	End If
	
	If ai_criterio<>5 Then
		DELETE FROM mu_activ_t5
		WHERE ( mu_activ_t5.id_actividad = :al_actividad )   
		USING n_cst_application.itr_appl;
		If n_cst_application.itr_appl.SQLcode=-1 Then 
			PopulateError(20,"SQL Error")
			n_cst_application.of_sql_error(n_cst_application.itr_appl)
			Return -1
		End If
	End If
	Return 1	
Else
	Return -1
End If

end function

public function integer of_del_crioper (long al_operacion, integer ai_criterio);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 29 de Octubre de 2004.H:18:02
---------------------------------------------------
Funcion para eliminar las operaciones de todas las tablas
de criterios
---------------------------------------------------*/
If ai_criterio>=1 And ai_criterio<=5 Then
	If ai_criterio<>1 Then
		DELETE FROM mu_pro_t1
		WHERE ( mu_pro_t1.co_operacion = :al_operacion )   
		USING n_cst_application.itr_appl;
		If n_cst_application.itr_appl.SQLcode=-1 Then 
			PopulateError(20,"SQL Error")
			n_cst_application.of_sql_error(n_cst_application.itr_appl)
			Return -1
		End If
	End If
	
	If ai_criterio<>2 Then
		DELETE FROM mu_pro_t2
		WHERE ( mu_pro_t2.co_operacion = :al_operacion )   
		USING n_cst_application.itr_appl;
		If n_cst_application.itr_appl.SQLcode=-1 Then 
			PopulateError(20,"SQL Error")
			n_cst_application.of_sql_error(n_cst_application.itr_appl)
			Return -1
		End If
	End If
	
	If ai_criterio<>3 Then
		DELETE FROM mu_pro_t3
		WHERE ( mu_pro_t3.co_operacion = :al_operacion )   
		USING n_cst_application.itr_appl;
		If n_cst_application.itr_appl.SQLcode=-1 Then 
			PopulateError(20,"SQL Error")
			n_cst_application.of_sql_error(n_cst_application.itr_appl)
			Return -1
		End If
	End If
	
	If ai_criterio<>4 Then
		DELETE FROM mu_pro_t4
		WHERE ( mu_pro_t4.co_operacion = :al_operacion )   
		USING n_cst_application.itr_appl;
		If n_cst_application.itr_appl.SQLcode=-1 Then 
			PopulateError(20,"SQL Error")
			n_cst_application.of_sql_error(n_cst_application.itr_appl)
			Return -1
		End If
	End If
	
	If ai_criterio<>5 Then
		DELETE FROM mu_pro_t5
		WHERE ( mu_pro_t5.co_operacion = :al_operacion )   
		USING n_cst_application.itr_appl;
		If n_cst_application.itr_appl.SQLcode=-1 Then 
			PopulateError(20,"SQL Error")
			n_cst_application.of_sql_error(n_cst_application.itr_appl)
			Return -1
		End If
	End If
	Return 1	
Else
	Return -1
End If

end function

public function integer of_nombreturno (long al_turno, transaction atr_transaction);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 05 de Noviembre de 2004.H:18:00
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n que recupera la descripci$$HEX1$$f300$$ENDHEX$$n del turno/horario
relacionada con el c$$HEX1$$f300$$ENDHEX$$digo del turno.
---------------------------------------------------*/
String ls_dato
//-------------------------------------------------

If IsNull(al_turno)  Then
	Return -1
End If

	SELECT mu_m_turno.de_turno
	INTO :ls_dato
	FROM mu_m_turno
	WHERE mu_m_turno.id_turno = :al_turno
	USING atr_transaction;

If atr_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
End If


If atr_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1

end function

public function integer of_nombreactividad (long al_actividad, transaction atr_transaction);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:18:01
---------------------------------------------------
Obtiene la descripci$$HEX1$$f300$$ENDHEX$$n y el c$$HEX1$$f300$$ENDHEX$$digo de estado de la actividad
solo si esta registrada.
---------------------------------------------------*/
String 	ls_desc
Long		ll_estado
//---------------------------------------------------

If IsNull(al_actividad) Then
	Return -1
End If

  SELECT mu_m_actividad.de_actividad,mu_m_actividad.co_estado
    INTO :ls_desc,
			:ll_estado
    FROM mu_m_actividad  
   WHERE mu_m_actividad.id_actividad = :al_actividad   
   USING atr_transaction  ;

If atr_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
End If


If atr_transaction.SQLcode=100 Then
	Return -1
End If

ls_desc=trim(ls_desc)
is_retorno[1]=ls_desc
il_retorno[1]=ll_estado


Return 1
end function

public function integer of_nombre_operac_muestra (long al_operacion, transaction a_transaction);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 17 de Noviembre de 2004.H:16:54
---------------------------------------------------
Obtiene la descripci$$HEX1$$f300$$ENDHEX$$n y el c$$HEX1$$f300$$ENDHEX$$digo de estado de la operaci$$HEX1$$f300$$ENDHEX$$n
solo si esta registrada.
---------------------------------------------------*/
String 	ls_desc
Long		ll_estado
//---------------------------------------------------
If IsNull(al_operacion) Then
	Return -1
End If

  SELECT m_operacio_ct.de_operacion,m_operac_muestra.co_estado
    INTO :ls_desc,
	 		:ll_estado	 
    FROM m_operacio_ct,m_operac_muestra
   WHERE ( m_operacio_ct.co_tipoprod = 10) and
	      ( m_operac_muestra.co_operacion = :al_operacion ) AND
			( m_operac_muestra.co_operacion = m_operacio_ct.co_operacion )
   USING a_transaction;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_desc=trim(ls_desc)

is_retorno[1]=ls_desc
il_retorno[1]=ll_estado

Return 1
end function

public function integer of_nombrechablon (long al_chablon, transaction atr_transaction);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 23 de Noviembre de 2004.H:14:00
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n que recupera la descripci$$HEX1$$f300$$ENDHEX$$n del Chablon/Antid.
---------------------------------------------------*/
String ls_desc, ls_activo
Long ll_cantidad,ll_calibre
//-------------------------------------------------
If IsNull(al_chablon)  Then
	Return -1
End If
//***************************************************
		SELECT	mu_m_chablon.de_chablon,
					mu_m_chablon.activo,
					mu_m_chablon.cantidad,
					mu_m_chablon.id_calibre										
		INTO 		:ls_desc,
					:ls_activo,
					:ll_cantidad,
					:ll_calibre					
		FROM mu_m_chablon
		WHERE mu_m_chablon.id_chablon = :al_chablon
		USING atr_transaction;		
//***************************************************
If atr_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
End If


If atr_transaction.SQLcode=100 Then
	Return -1
End If

ls_desc=trim(ls_desc)

is_retorno[1]=ls_desc
is_retorno[2]=ls_activo
il_retorno[1]=ll_cantidad
il_retorno[2]=ll_calibre

Return 1

end function

public function integer of_nombrebordado (long al_bordado, transaction atr_transaction);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 23 de Noviembre de 2004.H:14:00
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n que recupera la descripci$$HEX1$$f300$$ENDHEX$$n del bordado
---------------------------------------------------*/
String ls_dato, ls_desc,ls_activo
Long ll_partes				
//----------------------------------------------------

If IsNull(al_bordado)  Then
	Return -1
End If
//****************************************************
	SELECT 	mu_m_bordado.de_bordado,
				mu_m_bordado.activo,
				mu_m_bordado.partes
	INTO 		:ls_desc,
				:ls_activo,
				:ll_partes
	FROM mu_m_bordado
	WHERE mu_m_bordado.id_bordado = :al_bordado
	USING atr_transaction;

If atr_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
End If
//****************************************************

If atr_transaction.SQLcode=100 Then
	Return -1
End If

ls_desc=trim(ls_desc)

is_retorno[1]=ls_desc
is_retorno[2]=ls_activo
il_retorno[1]=ll_partes

Return 1

end function

public function integer of_x_color_estado (long a_estado, transaction a_transaction);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 26 de Noviembre de 2004.H:17:01
---------------------------------------------------
Obtiene el criterio si el estado para la muestra es
por color o no.
---------------------------------------------------*/
String ls_dato
//--------------------------------------------------
If IsNull(a_estado)  Then
	Return -1
End If

  SELECT m_estado_muestra.por_color         
    INTO :ls_dato
    FROM m_estado_muestra  
   WHERE m_estado_muestra.co_estado = :a_estado 
	USING a_transaction;

If a_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)
is_retorno[1]=ls_dato
//---------------------------------------------------------------------
Return 1

end function

public function integer of_tono_color (long a_fabrica, long a_linea, long a_color, transaction a_transaction);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 26 de Noviembre de 2004.H:19:06
---------------------------------------------------
Obtiene el c$$HEX1$$f300$$ENDHEX$$digo de tono que posee el color para una 
f$$HEX1$$e100$$ENDHEX$$brica y l$$HEX1$$ed00$$ENDHEX$$nea determinada
---------------------------------------------------*/
Long ll_dato
//---------------------------------------------------
If IsNull(a_fabrica) Or IsNull(a_linea) Or IsNull(a_color) Then
	Messagebox("Error","Alguno de los parametros fabrica, Linea o color es nulo")
	Return -1
End If
				//---------------------------------------------------
				  SELECT m_colores.co_tono
				  	 INTO :ll_dato  
					 FROM m_colores  
					WHERE ( m_colores.co_fabrica = :a_fabrica ) and  
							( m_colores.co_linea = :a_linea ) and
							( m_colores.co_color = :a_color )
					USING a_transaction;
				//---------------------------------------------------

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Messagebox("Advertencia", "El color: " + String(a_color) + " no est$$HEX2$$e1002000$$ENDHEX$$creado en la fabrica:" + String(a_fabrica) + " linea: " + String(a_linea) )
	Return -1
End If

il_retorno[1]=ll_dato

Return 1
end function

public function integer of_nombretinta (long al_tinta, transaction atr_transaction);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mates 30 de Noviembre de 2004.H:11:00
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n que recupera la descripci$$HEX1$$f300$$ENDHEX$$n de la tinta del antideslizante
---------------------------------------------------*/
String ls_dato,ls_activo
//----------------------------------------------tr---

If IsNull(al_tinta)  Then
	Return -1
End If

	SELECT mu_m_tinta.de_tinta,
			 mu_m_tinta.activo
	INTO 	:ls_dato,
			:ls_activo
	FROM mu_m_tinta
	WHERE mu_m_tinta.id_tinta = :al_tinta
	USING atr_transaction;

If atr_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
End If


If atr_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)
is_retorno[1]=ls_dato
is_retorno[2]=ls_activo

Return 1

end function

public function long of_nombrecolor (long a_fabrica, long a_linea, long a_color, transaction a_transaction);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:11:21
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
String ls_dato
Long ll_dato

If IsNull(a_fabrica) Or IsNull(a_linea) Or IsNull(a_color) Then
	Return -1
End If

  SELECT m_colores.de_color,m_colores.co_tono
    INTO :ls_dato,
	 		:ll_dato
    FROM m_colores  
   WHERE ( m_colores.co_fabrica = :a_fabrica ) and  
         ( m_colores.co_linea = :a_linea ) and
         ( m_colores.co_color = :a_color )
   USING a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato
il_retorno[1]=ll_dato

Return 1
end function

public function integer of_constraints_deferred ();
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 02 de Diciembre de 2004.H:11:40
---------------------------------------------------
Con esta instrucci$$HEX1$$f300$$ENDHEX$$n se puede guardar datos sin que se controle 
la integridad, hasta el momento de hacer el 'Commit',
es decir, se pueden insertar datos en tablas de detalle
y finalmente en el maestro. O borrar datos del maestro
y luego de los detalles. Incluso borrar e insertar datos 
de maestro y detalle al mismo tiempo.
---------------------------------------------------*/
//****************************************************
EXECUTE IMMEDIATE "SET CONSTRAINTS ALL DEFERRED" 
USING n_cst_application.itr_appl;
//****************************************************
 
If n_cst_application.itr_appl.SQLcode=-1 Then 
 PopulateError(20,"SQL Error")
 n_cst_application.of_sql_error(n_cst_application.itr_appl)
 Return -1
End If
//-------------------------------------------------
Return 1

end function

public function integer of_validardescripcion (string as_desc, integer ai_cod, transaction atr_transaction);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Diciembre de 2004.H:11:00
---------------------------------------------------
---------------------------------------------------*/
Long ll_cont				
//----------------------------------------------------
If IsNull(as_desc) OR IsNull(ai_cod) Then
	Return -1
End If

Choose Case ai_cod
	Case 1 //Chablones
			//****************************************************
				  SELECT mu_m_chablon.id_chablon  
					 INTO :ll_cont
					 FROM mu_m_chablon
					WHERE (Upper(Trim(mu_m_chablon.de_chablon)) = Upper(Trim(:as_desc)))
					USING atr_transaction;
			//****************************************************		
	Case 2 //Bordados
			//****************************************************
				  SELECT mu_m_bordado.id_bordado  
					 INTO :ll_cont
					 FROM mu_m_bordado
					WHERE (Upper(Trim(mu_m_bordado.de_bordado)) = Upper(Trim(:as_desc)))
					USING atr_transaction;
			//****************************************************		
	Case 3 //Tintas
			//****************************************************
				  SELECT mu_m_tinta.id_tinta  
					 INTO :ll_cont
					 FROM mu_m_tinta
					WHERE (Upper(Trim(mu_m_tinta.de_tinta)) = Upper(Trim(:as_desc)))
					USING atr_transaction;
			//****************************************************		
End Choose
If atr_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
End If
//****************************************************

If atr_transaction.SQLcode=100 Then
	Return -1
End If

If IsNull(ll_cont) Then ll_cont=0

il_retorno[1]=ll_cont

Return 1

end function

public function integer of_nombremaqtin (long al_maquina, transaction atr_transaction);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:17:39
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n que devuelve la descripci$$HEX1$$f300$$ENDHEX$$n y disponibilidad del 
recurso de m$$HEX1$$e100$$ENDHEX$$quinas para tintorer$$HEX1$$ed00$$ENDHEX$$a
---------------------------------------------------*/
String ls_dispo, ls_desc
Long ll_cant
//-------------------------------------------------

If IsNull(al_maquina)  Then
	Return -1
End If

  SELECT sp_nom_m_maquina(mu_maq_tin.co_maquina),
  			mu_maq_tin.disponible,
			mu_maq_tin.cantidad_colas			  
    INTO :ls_desc,
	 		:ls_dispo,
			:ll_cant
    FROM mu_maq_tin  
   WHERE mu_maq_tin.co_maquina = :al_maquina 
	USING atr_transaction;

If atr_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
End If


If atr_transaction.SQLcode=100 Then
	Return -1
End If

ls_dispo=trim(ls_dispo)
ls_desc=trim(ls_desc)

is_retorno[1]=ls_desc
is_retorno[2]=ls_dispo
il_retorno[1]=ll_cant

Return 1
end function

public function integer of_nombrehilo (long al_hilo, transaction atr_transaction);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 03 de Diciembre de 2004.H:11:00
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n que recupera la descripci$$HEX1$$f300$$ENDHEX$$n del hilo
---------------------------------------------------*/
String ls_desc				
Long ll_hilo
//----------------------------------------------------
ll_hilo=Long(al_hilo)
If IsNull(ll_hilo)  Then
	Return -1
End If
//****************************************************
	  SELECT m_empaques.de_producto  
		 INTO :ls_desc
  	  	 FROM m_empaques  
    	WHERE (m_empaques.co_grupo = 40) AND  
	         (m_empaques.co_clasificacion in ('3','9')) AND
				(m_empaques.co_producto = :ll_hilo)	
		USING atr_transaction;
//****************************************************		
If atr_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
End If
//****************************************************

If atr_transaction.SQLcode=100 Then
	Return -1
End If

ls_desc=trim(ls_desc)

is_retorno[1]=ls_desc

Return 1


	
end function

public function integer of_commit ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 26 de Noviembre de 2004.H:15:40
---------------------------------------------------
Acepta los cambios hechos a la bd.
---------------------------------------------------*/
//*****************************************
	COMMIT USING n_cst_application.itr_appl ;
//*****************************************
Return 1
end function

public function integer of_rollback ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 26 de Noviembre de 2004.H:15:40
---------------------------------------------------
Deshace los cambios hechos a la bd.
---------------------------------------------------*/
//*****************************************
	ROLLBACK USING n_cst_application.itr_appl ;
//*****************************************
Return 1
end function

public function integer of_rollback (transaction atr_transaction);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 26 de Noviembre de 2004.H:15:40
---------------------------------------------------
Deshace los cambios hechos a la bd.
---------------------------------------------------*/
//*****************************************
	ROLLBACK USING atr_transaction ;
//*****************************************
Return 1
end function

public function integer of_commit (transaction atr_transaction);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 26 de Noviembre de 2004.H:15:40
---------------------------------------------------
Acepta los cambios hechos a la bd.
---------------------------------------------------*/
//*****************************************
	COMMIT USING atr_transaction ;
//*****************************************
Return 1
end function

public function string of_nombrenuevoreforma (string as_nr);Choose Case as_nr
	Case 'N'
		Return 'NUEVO'
	Case 'R'
		Return 'REFORMA'
	Case Else
		Return as_nr
End Choose
end function

public function string of_nombretono (long al_tono);Choose Case al_tono
	Case 1
		Return 'CLARO'
	Case 2
		Return 'MEDIO'
	Case 3
		Return 'OSCURO'
	Case Else
		Return String(al_tono)
End Choose
end function

public function integer of_actualizar_tarea_estado (long al_orden, long al_estado, long al_grupo, long al_cola_grupo, datetime adtm_fmovini, datetime adtm_fmovfin, long al_condicion, ref transaction a_transaction);//----------------------------------------------------------
	UPDATE 	mu_gantt
     	 SET 	mu_gantt.co_grupo 	= :al_grupo,   
           	mu_gantt.cola_grupo 	= :al_cola_grupo,   
         	mu_gantt.f_mov_ini 	= :adtm_fmovini,   
         	mu_gantt.f_mov_fin 	= :adtm_fmovfin,   
         	mu_gantt.condicion 	= :al_condicion
   	WHERE ( mu_gantt.nu_orden 	= :al_orden ) AND  
	         ( mu_gantt.co_estado = :al_estado) AND  
            ( mu_gantt.nu_sol_serv 	= 0 ) AND  
            ( mu_gantt.cons_color 	= 0 ) AND
	         ( mu_gantt.f_prog_ini IS NOT NULL )
	USING 	a_transaction;

//----------------------------------------------------------		
If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If
//-----------------------------------------------------------
 	UPDATE 	mu_gantt
     	SET 	mu_gantt.co_grupo 	= :al_grupo,   
         	mu_gantt.cola_grupo 	= :al_cola_grupo,   
         	mu_gantt.f_mov_ini 	= :adtm_fmovini,   
         	mu_gantt.f_mov_fin 	= :adtm_fmovfin,  
	 	      mu_gantt.f_prog_ini 	= :adtm_fmovini,   
         	mu_gantt.f_prog_fin 	= :adtm_fmovfin,    
         	mu_gantt.condicion 	= :al_condicion
    WHERE  ( mu_gantt.nu_orden 	= :al_orden ) AND  
	   	  ( mu_gantt.co_estado 	= :al_estado ) AND  
           ( mu_gantt.nu_sol_serv = 0 ) AND  
           ( mu_gantt.cons_color  = 0 ) AND
	        ( mu_gantt.f_prog_ini IS NULL )
	 USING 	a_transaction;
//----------------------------------------------------------		
If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If
//-----------------------------------------------------------
Return 1
end function

public function integer of_act_reacomoda_canc (ref transaction a_transaction);/*
* MODIFICADO: Septiembre 02 de 2009 - gagudelo - ohlondon
* A$$HEX1$$f100$$ENDHEX$$adir el filtro por tipo de producto
*/
//--------------------------------------------------------------------------------
UPDATE 	mu_gantt
SET 		mu_gantt.condicion=9
WHERE 	(mu_gantt.condicion IN (1,2,3)) 
			AND mu_gantt.nu_orden IN ( SELECT dt_mu_ord.nu_orden 
												  FROM dt_mu_ord, m_muestras
												 WHERE dt_mu_ord.condicion IN (2,3)
													AND m_muestras.co_fabrica  = dt_mu_ord.co_fabrica 
													AND m_muestras.co_linea    = dt_mu_ord.co_linea
													AND m_muestras.co_muestra  = dt_mu_ord.co_muestra
													AND m_muestras.co_tipoprod = :il_tipoprod )
USING a_transaction;													  
//--------------------------------------------------------------------------------
If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If

UPDATE 	mu_gantt
SET 		mu_gantt.condicion=mu_gantt.condicion+10
WHERE 	(mu_gantt.condicion IN (4,5,6)) 
			AND mu_gantt.nu_orden IN ( SELECT dt_mu_ord.nu_orden 
												  FROM dt_mu_ord, m_muestras
												 WHERE dt_mu_ord.condicion IN (2,3)
													AND m_muestras.co_fabrica  = dt_mu_ord.co_fabrica 
													AND m_muestras.co_linea    = dt_mu_ord.co_linea
													AND m_muestras.co_muestra  = dt_mu_ord.co_muestra
													AND m_muestras.co_tipoprod = :il_tipoprod )
USING a_transaction;													  

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If

//--------------------------------------------------------------------------------

UPDATE mu_gantt  
   SET co_estado = sp_mu_ao_estado(mu_gantt.co_operacion,
		               mu_gantt.id_actividad, :il_tipoprod)
 WHERE ( mu_gantt.condicion = 9 )
	AND mu_gantt.nu_orden IN ( SELECT dt_mu_ord.nu_orden 
										  FROM dt_mu_ord, m_muestras
										 WHERE dt_mu_ord.condicion = 9
											AND m_muestras.co_fabrica  = dt_mu_ord.co_fabrica 
											AND m_muestras.co_linea    = dt_mu_ord.co_linea
											AND m_muestras.co_muestra  = dt_mu_ord.co_muestra
											AND m_muestras.co_tipoprod = :il_tipoprod )

using a_transaction ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If

Return 1										
end function

public function integer of_nombremaqtin (long al_fabrica, long al_cs_maquina, transaction atr_transaction);/*******************************************************************************************************
* PROC./FUNC.: of_nombremaqtin
* ARG.		 : al_fabrica: Long. Codigo de la f$$HEX1$$e100$$ENDHEX$$brica a la que pertenece la m$$HEX1$$e100$$ENDHEX$$quina
					al_cs_maquina: Long. Consecutivo de registro de la m$$HEX1$$e100$$ENDHEX$$quina
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	Funci$$HEX1$$f300$$ENDHEX$$n que devuelve la descripci$$HEX1$$f300$$ENDHEX$$n y disponibilidad del 
					recurso de m$$HEX1$$e100$$ENDHEX$$quinas para tintorer$$HEX1$$ed00$$ENDHEX$$a.
* PRECOND.	 : *Se tengan los codigos de la f$$HEX1$$e100$$ENDHEX$$brica y consecutivo de la maquina seleccionados					
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Mi$$HEX1$$e900$$ENDHEX$$rcoles 19 de Enero de 2005. Hora: 12:02:15
********************************************************************************************************/
//VARIABLE DECLARATION
String 	ls_disponible, ls_descripcion
Long 		ll_cantidad_colas
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
If IsNull(al_fabrica) OR IsNull(al_cs_maquina) Then
	Return -1
End If
//************************************************
  SELECT sp_nom_m_maquina(mu_maq_tin.co_fabrica,mu_maq_tin.cs_maquina),
  			mu_maq_tin.disponible,
			mu_maq_tin.cantidad_colas			  
    INTO :ls_descripcion,
	 		:ls_disponible,
			:ll_cantidad_colas
    FROM mu_maq_tin  
   WHERE ( mu_maq_tin.co_fabrica = :al_fabrica ) 	AND
			( mu_maq_tin.cs_maquina = :al_cs_maquina )
	USING atr_transaction;
//************************************************
If atr_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
End If

If atr_transaction.SQLcode=100 Then
	Return -1
End If
ls_descripcion=trim(ls_descripcion)
ls_disponible=trim(ls_disponible)


is_retorno[1]=ls_descripcion
is_retorno[2]=ls_disponible
il_retorno[1]=ll_cantidad_colas
//------------------------------------------------------------------------------------------------------
Return 1
//END SCRIPT------------------------------------------------------------------------------------------------------

end function

public function integer of_actualizar_tarea_color_ss (long al_orden, long al_consec, long al_grupo, long al_cola_grupo, long al_fabrica, long al_maq_tin, long al_cola_maq_tin, datetime adtm_fmovini, datetime adtm_fmovfin, long al_condicion, ref transaction a_transaction);//----------------------------------------------------------
	 UPDATE 	mu_gantt
     	 SET 	mu_gantt.co_grupo 	= :al_grupo,   
           	mu_gantt.cola_grupo 	= :al_cola_grupo,
				mu_gantt.co_fabrica 	= :al_fabrica,   
				mu_gantt.cs_maquina 	= :al_maq_tin,   
         	mu_gantt.cola_tin  	= :al_cola_maq_tin,
         	mu_gantt.f_mov_ini 	= :adtm_fmovini,   
         	mu_gantt.f_mov_fin 	= :adtm_fmovfin,   
         	mu_gantt.condicion 	= :al_condicion
    WHERE 	( mu_gantt.nu_orden 	= :al_orden ) AND  
	         ( mu_gantt.consec 	= :al_consec) AND
	         ( mu_gantt.f_prog_ini IS NOT NULL )
	USING 	a_transaction;

//----------------------------------------------------------		
If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If
//-----------------------------------------------------------
	UPDATE 	mu_gantt
     	SET 	mu_gantt.co_grupo 	= :al_grupo,   
         	mu_gantt.cola_grupo 	= :al_cola_grupo,
				mu_gantt.co_fabrica 	= :al_fabrica,   
				mu_gantt.cs_maquina 	= :al_maq_tin,   
         	mu_gantt.cola_tin  	= :al_cola_maq_tin,
         	mu_gantt.f_mov_ini 	= :adtm_fmovini,   
         	mu_gantt.f_mov_fin 	= :adtm_fmovfin,  
	 	      mu_gantt.f_prog_ini 	= :adtm_fmovini,   
         	mu_gantt.f_prog_fin	= :adtm_fmovfin,    
         	mu_gantt.condicion 	= :al_condicion
    WHERE  	( mu_gantt.nu_orden 	= :al_orden ) AND  
	   	  	( mu_gantt.consec 	= :al_consec) AND
	        	( mu_gantt.f_prog_ini IS NULL )
	 USING 	a_transaction;
//----------------------------------------------------------	
If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If
//----------------------------------------------------------	
Return 1
end function

public function integer of_nombreactividadtipo (long al_actividad, long al_tipoprod, transaction atr_transaction);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:18:01
---------------------------------------------------
Obtiene la descripci$$HEX1$$f300$$ENDHEX$$n y el c$$HEX1$$f300$$ENDHEX$$digo de estado de la actividad
solo si esta registrada.
---------------------------------------------------*/
String 	ls_desc
Long		ll_estado
//---------------------------------------------------

If IsNull(al_actividad) Then
	Return -1
End If

  SELECT mu_m_actividad.de_actividad,mu_m_actividad.co_estado
    INTO :ls_desc,
			:ll_estado
    FROM mu_m_actividad  
   WHERE mu_m_actividad.id_actividad = :al_actividad   
	  AND mu_m_actividad.co_tipoprod  = :al_tipoprod
   USING atr_transaction  ;

If atr_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
End If


If atr_transaction.SQLcode=100 Then
	Return 0
End If

ls_desc=trim(ls_desc)
is_retorno[1]=ls_desc
il_retorno[1]=ll_estado


Return 1
end function

public function integer of_nombre_operac_muestra (long al_operacion, long al_tipoprod, transaction a_transaction);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 17 de Noviembre de 2004.H:16:54
---------------------------------------------------
Obtiene la descripci$$HEX1$$f300$$ENDHEX$$n y el c$$HEX1$$f300$$ENDHEX$$digo de estado de la operaci$$HEX1$$f300$$ENDHEX$$n
solo si esta registrada.
---------------------------------------------------*/
String 	ls_desc
Long		ll_estado
//---------------------------------------------------
If IsNull(al_operacion) Then
	Return -1
End If

  SELECT m_operacio_ct.de_operacion,m_operac_muestra.co_estado
    INTO :ls_desc,
	 		:ll_estado	 
    FROM m_operacio_ct,m_operac_muestra
   WHERE ( m_operacio_ct.co_tipoprod     = :al_tipoprod) and
	      ( m_operac_muestra.co_operacion = :al_operacion ) AND
			( m_operac_muestra.co_operacion = m_operacio_ct.co_operacion ) AND
			( m_operac_muestra.co_tipoprod  = m_operacio_ct.co_tipoprod )
   USING a_transaction;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return 0
End If

ls_desc=trim(ls_desc)

is_retorno[1]=ls_desc
il_retorno[1]=ll_estado

Return 1
end function

public function integer of_gettipomaquina (long al_recurso, transaction atr_transaction);
Long		ll_tipo_maquina



SELECT co_tipo_maquina  
  INTO :ll_tipo_maquina
  FROM m_recursos_tj   
 WHERE co_recurso = :al_recurso 
 USING atr_transaction  ;

If atr_transaction.SQLcode<0 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
End If


If atr_transaction.SQLcode=100 Then
	Return 0
End If

il_retorno[1]=ll_tipo_maquina

Return 1
end function

public function integer of_validarcodigo (long ai_codigo, integer ai_cod, transaction atr_transaction);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Diciembre de 2004.H:11:00
---------------------------------------------------
---------------------------------------------------*/
Long ll_cont				
//----------------------------------------------------
If IsNull(ai_codigo) OR IsNull(ai_cod) Then
	Return -1
End If

Choose Case ai_cod
	Case 1 //Chablones
			//****************************************************
				  SELECT mu_m_chablon.id_chablon  
					 INTO :ll_cont
					 FROM mu_m_chablon
					WHERE mu_m_chablon.id_chablon = :ai_codigo
					USING atr_transaction;
			//****************************************************		
	Case 2 //Bordados
			//****************************************************
				  SELECT mu_m_bordado.id_bordado  
					 INTO :ll_cont
					 FROM mu_m_bordado
					WHERE mu_m_bordado.id_bordado = :ai_codigo
					USING atr_transaction;
			//****************************************************		
	Case 3 //Tintas
			//****************************************************
				  SELECT mu_m_tinta.id_tinta  
					 INTO :ll_cont
					 FROM mu_m_tinta
					WHERE mu_m_tinta.id_tinta = :ai_codigo
					USING atr_transaction;
			//****************************************************		
End Choose
If atr_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
End If
//****************************************************

If atr_transaction.SQLcode=100 Then
	Return -1
End If

If IsNull(ll_cont) Then ll_cont=0

il_retorno[1]=ll_cont

Return 1

end function

public function integer of_act_reacomoda_canc (integer al_nu_orden, ref transaction a_transaction);/*
* ----------------------------------------------------------------------------
* MODIFICADO: Diciembre 23 de 2011 - ohlondon
* ----------------------------------------------------------------------------
* Al desprogramar se actualiza por orden 
* ----------------------------------------------------------------------------
*/

//--------------------------------------------------------------------------------
UPDATE 	mu_gantt
SET 		mu_gantt.condicion=9
WHERE 	(mu_gantt.condicion IN (1,2,3)) 
			AND mu_gantt.nu_orden = :al_nu_orden 
USING a_transaction;													  
//--------------------------------------------------------------------------------
If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If

UPDATE 	mu_gantt
SET 		mu_gantt.condicion=mu_gantt.condicion+10
WHERE 	(mu_gantt.condicion IN (4,5,6)) 
			AND mu_gantt.nu_orden = :al_nu_orden 
USING a_transaction;													  

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If

//--------------------------------------------------------------------------------
UPDATE mu_gantt  
   SET co_estado = sp_mu_ao_estado(mu_gantt.co_operacion,
		               mu_gantt.id_actividad, :il_tipoprod)
 WHERE ( mu_gantt.condicion = 9 )
	AND mu_gantt.nu_orden = :al_nu_orden 
using a_transaction ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If

Return 1										
end function

on n_cst_comun_orden.create
call super::create
end on

on n_cst_comun_orden.destroy
call super::destroy
end on

