HA$PBExportHeader$n_cst_muestra_a_referencia.sru
$PBExportComments$Objeto para copiar datos de una muestra a una referencia
forward
global type n_cst_muestra_a_referencia from nonvisualobject
end type
end forward

global type n_cst_muestra_a_referencia from nonvisualobject autoinstantiate
end type

type variables
long il_fabricaRef, il_lineaRef, il_referencia,il_tallaRef,&
     il_calidadRef=1, il_colorRef,&
	  il_fabricaMue, il_lineaMue, il_muestra, il_tallaMue,&
	  il_calidadMue=1, il_colorMue, il_opcionMpMuestra, il_co_composicion
	  
Transaction itr_transaction

long il_disenoRef,il_muestrarioRef,il_recursoRef

String is_observacion, is_deDiseno

long il_swCopiaMo,il_swCopiaFt

long il_tipoProd=10
end variables

forward prototypes
public function integer of_setfabricaref (long a_fabricaref)
public function integer os_setlinearef (long a_linearef)
public function integer of_setreferencia (long a_referencia)
public function integer of_settallaref (long a_tallaref)
public function integer of_setcolorref (long a_colorref)
public function integer of_setlineamue (long a_lineamue)
public function integer of_setmuestra (long a_muestra)
public function integer of_settallamue (long a_tallamue)
public function integer of_setcalidadmue (long a_calidadmue)
public function integer of_setcolormue (long a_colormue)
public function integer of_setTransaction (transaction a_transaction)
public function integer of_setdisenoref (long a_disenoref)
public function integer of_setmuestrarioref (long a_muestrarioref)
public function integer of_existeref ()
public function integer of_setRecursoref (long a_recursoref)
public function integer of_setlinearef (long a_linearef)
public function integer of_setcalidadref (long a_calidadRef)
public function integer of_existerefmo ()
public function integer of_existerefft ()
public function integer of_existerefmp ()
public function integer of_setobservacion (string a_observacion)
public function integer of_setdediseno (string a_dediseno)
public function integer of_setswcopiamo (integer a_swcopiamo)
public function integer of_setSwCopiaFt (long a_swCopiaFt)
public function integer of_copiamo ()
public function integer of_setfabricamue (long a_fabricamue)
public function integer of_setOpcionMpMues (long a_opcionMpMues)
public function integer of_copiamp ()
public function integer of_settipoprod (long a_tipoprod)
public function integer of_controlmo ()
public function integer of_copiaft ()
public function integer of_actualizarcambio ()
public function integer of_actualizarEstado ()
public function integer of_actualizarcambiocolor ()
public function integer of_setcomposicion (long a_composicion)
end prototypes

public function integer of_setfabricaref (long a_fabricaref);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 23 de Enero de 2003 HORA 13:18:09:156
// 
// 
//////////////////////////////////////////////////////////////////////////


il_fabricaRef=a_fabricaRef

Return 1
end function

public function integer os_setlinearef (long a_linearef);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 23 de Enero de 2003 HORA 13:19:07:890
// 
// 
//////////////////////////////////////////////////////////////////////////


il_lineaRef=a_lineaRef

Return 1
end function

public function integer of_setreferencia (long a_referencia);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 23 de Enero de 2003 HORA 13:19:32:796
// 
// 
//////////////////////////////////////////////////////////////////////////
il_referencia=a_referencia

REturn 1
end function

public function integer of_settallaref (long a_tallaref);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 23 de Enero de 2003 HORA 13:20:03:453
// 
// 
//////////////////////////////////////////////////////////////////////////
il_tallaRef=a_tallaRef

Return 1
end function

public function integer of_setcolorref (long a_colorref);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 23 de Enero de 2003 HORA 13:20:03:453
// 
// 
//////////////////////////////////////////////////////////////////////////
il_colorRef=a_colorRef

Return 1
end function

public function integer of_setlineamue (long a_lineamue);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 23 de Enero de 2003 HORA 14:08:13:796
// 
// 
//////////////////////////////////////////////////////////////////////////
il_lineaMue=a_lineaMue

Return 1
end function

public function integer of_setmuestra (long a_muestra);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 23 de Enero de 2003 HORA 14:09:08:765
// 
// 
//////////////////////////////////////////////////////////////////////////


il_muestra=a_muestra

Return 1
end function

public function integer of_settallamue (long a_tallamue);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 23 de Enero de 2003 HORA 14:09:42:453
// 
// 
//////////////////////////////////////////////////////////////////////////


il_tallaMue=a_tallaMue

Return 1
end function

public function integer of_setcalidadmue (long a_calidadmue);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 23 de Enero de 2003 HORA 14:10:37:531
// 
// 
//////////////////////////////////////////////////////////////////////////


il_calidadMue=a_calidadMue

Return 1
end function

public function integer of_setcolormue (long a_colormue);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 23 de Enero de 2003 HORA 14:11:15:343
// 
// 
//////////////////////////////////////////////////////////////////////////

il_colorMue=a_colorMue

Return 1
end function

public function integer of_setTransaction (transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 23 de Enero de 2003 HORA 14:17:44:578
// 
// 
//////////////////////////////////////////////////////////////////////////


itr_transaction=a_transaction

Return 1
end function

public function integer of_setdisenoref (long a_disenoref);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 23 de Enero de 2003 HORA 15:14:29:281
// 
// Para ajustar el dise$$HEX1$$f100$$ENDHEX$$o de la referencia
//////////////////////////////////////////////////////////////////////////



il_disenoRef=a_disenoRef

Return 1
end function

public function integer of_setmuestrarioref (long a_muestrarioref);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 23 de Enero de 2003 HORA 15:15:06:703
// 
// Para colocaar el muestrario de la referencia
//////////////////////////////////////////////////////////////////////////

il_muestrarioRef=a_muestrarioRef

Return 1
end function

public function integer of_existeref ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 23 de Enero de 2003 HORA 14:12:47:312
// 
// Verifica si la referencia existe
//////////////////////////////////////////////////////////////////////////

Long ll_fabrica

  select dt_ref_x_col.co_fabrica  
    into :ll_fabrica  
    from dt_ref_x_col  
   where ( dt_ref_x_col.co_fabrica = :il_fabricaref ) and  
         ( dt_ref_x_col.co_linea = :il_linearef ) and  
         ( dt_ref_x_col.co_referencia = :il_referencia ) and  
         ( dt_ref_x_col.co_talla = :il_tallaref ) and  
         ( dt_ref_x_col.co_calidad = :il_calidadref ) and  
         ( dt_ref_x_col.co_color = :il_colorref ) 
	using itr_transaction  ;


If itr_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(itr_transaction)
	Return -1
End If

If itr_transaction.SQLcode=100 Then
	Return -1
End If

If IsNull(ll_fabrica) Then
	Return -1
End If



Return 1
end function

public function integer of_setRecursoref (long a_recursoref);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 24 de Enero de 2003 HORA 08:06:51:234
// 
// 
//////////////////////////////////////////////////////////////////////////

il_recursoRef=a_recursoRef

Return 1


end function

public function integer of_setlinearef (long a_linearef);
il_lineaRef=a_lineaRef

Return 1
end function

public function integer of_setcalidadref (long a_calidadRef);il_calidadRef=a_calidadRef

Return 1
end function

public function integer of_existerefmo ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 23 de Enero de 2003 HORA 14:17:44:578
// 
// Determina si existe mano de obra de una referencia
//////////////////////////////////////////////////////////////////////////
Long ll_fabrica

  select distinct m_proref.co_fabrica  
    into :ll_fabrica  
    from m_proref  
   where ( m_proref.co_fabrica = :il_fabricaref ) and  
         ( m_proref.co_linea = :il_linearef ) and  
         ( m_proref.co_referencia = :il_referencia ) and  
         ( m_proref.co_talla = :il_tallaref ) and  
         ( m_proref.co_calidad = :il_calidadref ) 
	using itr_transaction  ;


If itr_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(itr_transaction)
	Return -1
End If

If itr_transaction.SQLcode=100 Then
	Return -1
End If

If IsNull(ll_fabrica) Then
	Return -1
End If



Return 1
end function

public function integer of_existerefft ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 23 de Enero de 2003 HORA 14:46:05:312
// 
// Determina si existen medidas de una referencia, la ficha tecnica
//////////////////////////////////////////////////////////////////////////
long ll_fabrica

  select distinct dt_medidas_est_ref.co_fabrica  
    into :ll_fabrica  
    from dt_medidas_est_ref  
   where ( dt_medidas_est_ref.co_centro =12 ) and
	      ( dt_medidas_est_ref.co_subcentro =12 ) and
			( dt_medidas_est_ref.co_recurso = : il_recursoRef) and
	      ( dt_medidas_est_ref.co_fabrica = :il_fabricaref ) and  
         ( dt_medidas_est_ref.co_linea = :il_linearef ) and  
         ( dt_medidas_est_ref.co_referencia = :il_referencia ) and  
         ( dt_medidas_est_ref.co_talla = :il_tallaref ) and  
         ( dt_medidas_est_ref.co_calidad = :il_calidadref )   
	using itr_transaction  ;

If itr_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(itr_transaction)
	Return -1
End If

If itr_transaction.SQLcode=100 Then
	Return -1
End If

If IsNull(ll_fabrica) Then
	Return -1
End If



Return 1
end function

public function integer of_existerefmp ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 23 de Enero de 2003 HORA 14:51:20:109
// 
// Para determinar si existe materia prima de una referencia
//////////////////////////////////////////////////////////////////////////
long ll_fabrica


  select distinct dt_fmp.co_fabrica  
    into :ll_fabrica  
    from dt_fmp  
   where ( dt_fmp.co_fabrica = :il_fabricaref ) and  
         ( dt_fmp.co_linea = :il_linearef ) and  
         ( dt_fmp.co_referencia = :il_referencia ) and  
         ( dt_fmp.co_talla = :il_tallaref ) and  
         ( dt_fmp.co_calidad = :il_calidadref ) and  
         ( dt_fmp.co_diseno = :il_disenoref ) and  
         ( dt_fmp.co_color = :il_colorref ) and  
         ( dt_fmp.co_muestrario = :il_muestrarioref ) 
	using itr_transaction  ;


If itr_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(itr_transaction)
	Return -1
End If

If itr_transaction.SQLcode=100 Then
	Return -1
End If

If IsNull(ll_fabrica) Then
	Return -1
End If

Return 1


end function

public function integer of_setobservacion (string a_observacion);is_observacion=a_observacion

Return 1
end function

public function integer of_setdediseno (string a_dediseno);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 19 de Febrero de 2003 HORA 08:16:23:343
// 
// Para asignar la descripcion del dise$$HEX1$$f100$$ENDHEX$$o
//////////////////////////////////////////////////////////////////////////

is_deDiseno=a_deDiseno

Return 1
end function

public function integer of_setswcopiamo (integer a_swcopiamo);il_swCopiaMo=a_swCopiaMo

Return 1
end function

public function integer of_setSwCopiaFt (long a_swCopiaFt);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 20 de Febrero de 2003 HORA 11:21:01:328
// 
// Sw para la copia de ficha tecnica o de medidas
//////////////////////////////////////////////////////////////////////////
il_swCopiaFt=a_swCopiaFt

Return 1
end function

public function integer of_copiamo ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 24 de Enero de 2003 HORA 09:24:20:750
// 
// of_copiaMo()
// Para la copia de la mano de obra
//////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////
// se borra el detalle de la mano de obra, estos son los procesos
// adicionales
//////////////////////////////////////////////////////////////////////////
//
//  DELETE FROM dt_m_proref  
//   WHERE dt_m_proref.cs_proref in (  SELECT m_proref.cs_proref  
//                                       FROM m_proref  
//                                      WHERE ( m_proref.co_fabrica = :il_fabricaRef ) AND  
//                                            ( m_proref.co_linea = :il_lineaRef ) AND  
//                                            ( m_proref.co_referencia = :il_referencia ) AND  
//                                            ( m_proref.co_talla = :il_tallaRef ) AND  
//                                            ( m_proref.co_calidad = :il_calidadRef )  ) 
//	using itr_transaction  ;
//
//
//If itr_transaction.SQLcode=-1 Then
//	PopulateError(20,"SQL Error")
//	n_cst_application.of_sql_error(itr_transaction)
//	Return -1
//End If
//
//
//  DELETE FROM m_proref  
//   WHERE ( m_proref.co_fabrica = :il_fabricaRef ) AND  
//         ( m_proref.co_linea = :il_lineaRef ) AND  
//         ( m_proref.co_referencia = :il_referencia ) AND  
//         ( m_proref.co_talla = :il_tallaRef ) AND  
//         ( m_proref.co_calidad = :il_calidadRef )   
//	using itr_transaction  ;
//
//
//If itr_transaction.SQLcode=-1 Then
//	PopulateError(20,"SQL Error")
//	n_cst_application.of_sql_error(itr_transaction)
//	Return -1
//End If
//
//////////////////////////////////////////////////////////////////////////
// Inserto los detalles en m_proref
// 
//////////////////////////////////////////////////////////////////////////
  insert into m_proref  
         ( co_fabrica,   
           co_linea,   
           co_referencia,   
           co_talla,   
           co_calidad,   
           co_operacion,   
           orden_operacion,   
           co_planta,   
           co_centro,   
           co_subcentro,   
           co_recurso)  
     select :il_fabricaref,   
            :il_linearef,   
            :il_referencia,   
            :il_tallaref,   
            :il_calidadref,   
            m_proref_muestras.co_operacion,   
            m_proref_muestras.orden_operacion,   
            m_proref_muestras.co_planta,   
            m_proref_muestras.co_centro,   
            m_proref_muestras.co_subcentro,   
            m_proref_muestras.co_recurso  
       from m_proref_muestras  
      where ( m_proref_muestras.co_fabrica = :il_fabricamue ) and  
            ( m_proref_muestras.co_linea = :il_lineamue ) and  
            ( m_proref_muestras.co_muestra = :il_muestra ) and
				( m_proref_muestras.co_talla = :il_tallamue )
	using itr_transaction  ;


If itr_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(itr_transaction)
	Return -1
End If

//////////////////////////////////////////////////////////////////////////
// Ahora hay que insertar el detalle en dt_m_proref
// 
//////////////////////////////////////////////////////////////////////////


n_ds_application lds_1
lds_1=create n_ds_application
lds_1.DataObject="d_copia_m_proref_muestras"
lds_1.SetTransObject(itr_transaction)

n_ds_application lds_2
lds_2=create n_ds_application
lds_2.DataObject="d_copia_m_proref"
lds_2.SetTransObject(itr_transaction)


long ll_tot,ll_tot1,ll_pos,i, ll_opMue,ll_conMue,ll_conRef

ll_tot=lds_1.Retrieve(il_fabricaMue,il_lineaMue,il_muestra,il_tallaMue)

ll_tot1=lds_2.Retrieve(il_fabricaRef,il_lineaRef,il_referencia,il_tallaRef,il_calidadRef)

If ll_tot<0 or ll_tot1<0 Then
	Destroy lds_1
	Destroy lds_2
	Return -1
End If

//Datawindow d1,d2
//
//d1=w_copia_mta_ref.tab_1.tabpage_4.dw_mues
//
//d1.dataObject=lds_1.DataObject
//
//lds_1.rowsCopy(1,lds_1.RowCount(),Primary!,d1,1,primary!)
//
//d2=w_copia_mta_ref.tab_1.tabpage_4.dw_refe
//
//d2.dataObject=lds_2.DataObject
//
//lds_2.rowsCopy(1,lds_2.RowCount(),Primary!,d2,1,primary!)
//
For i=1 To ll_tot
	ll_opMue=lds_1.GetItemNumber(i,"co_operacion")
	ll_conMue=lds_1.GetItemNumber(i,"cs_proref")
	
	ll_pos=lds_2.find("co_operacion="+String(ll_opMue),1,ll_tot1)
	
	If ll_pos<=0 Then
		MessageBox("Advertencia!","No se pudo copiar la mano de obra.",StopSign!)
		Return -1
	End If
	ll_conRef=lds_2.GetItemNumber(ll_pos,"cs_proref")
	
	  INSERT INTO dt_m_proref  
         ( cs_proref,   
           co_recurso,   
           co_planta,   
           co_centro,   
           co_subcentro,   
           prioridad)  
     SELECT :ll_conRef,   
            dt_m_proref_mues.co_recurso,   
            dt_m_proref_mues.co_planta,   
            dt_m_proref_mues.co_centro,   
            dt_m_proref_mues.co_subcentro,   
            dt_m_proref_mues.prioridad  
       FROM dt_m_proref_mues  
      WHERE dt_m_proref_mues.cs_proref = :ll_conMue
		using itr_transaction  ;
	
	
	If itr_transaction.SQLcode=-1 Then
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(itr_transaction)
		Destroy lds_1
		Destroy lds_2
		Return -1
	End If

	
Next

Destroy lds_1
Destroy lds_2

//////////////////////////////////////////////////////////////////////////
// las observaciones ??
// 
//////////////////////////////////////////////////////////////////////////
  INSERT INTO ob_m_proref  
         ( co_fabrica,   
           co_linea,   
           co_referencia,   
           co_talla,   
           co_calidad,   
           observacion,   
           fe_actualizacion,   
           usuario,   
           instancia )  
     SELECT :il_fabricaref,   
            :il_linearef,   
            :il_referencia,   
            :il_tallaref,   
            :il_calidadref,   
            ob_m_proref_mues.observacion,   
            ob_m_proref_mues.fe_actualizacion,   
            ob_m_proref_mues.usuario,   
            ob_m_proref_mues.instancia  
       FROM ob_m_proref_mues  
      WHERE ( ob_m_proref_mues.co_fabrica = :il_fabricamue ) AND  
            ( ob_m_proref_mues.co_linea = :il_lineamue ) AND  
            ( ob_m_proref_mues.co_muestra = :il_muestra ) AND  
            ( ob_m_proref_mues.co_talla = :il_tallamue ) AND  
            ( ob_m_proref_mues.co_calidad = 1 )   
	using itr_transaction  ;


If itr_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(itr_transaction)
	Return -1
End If


Return 1
end function

public function integer of_setfabricamue (long a_fabricamue);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 10 de Abril de 2003 HORA 15:07:35:328
// 
// 
//////////////////////////////////////////////////////////////////////////



il_fabricamue=a_fabricaMue


Return 1
end function

public function integer of_setOpcionMpMues (long a_opcionMpMues);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 10 de Abril de 2003 HORA 15:12:05:687
// 
// 
//////////////////////////////////////////////////////////////////////////


il_opcionMpMuestra=a_opcionMpMues

Return 1
end function

public function integer of_copiamp ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 24 de Enero de 2003 HORA 10:25:08:250
// 
// Copia de materia prima esta es por color..
//////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////
// Borro el detalle de la ficha de materia prima que se habia
// creado.
//////////////////////////////////////////////////////////////////////////

//  DELETE FROM dt_fmp  
//   WHERE ( dt_fmp.co_fabrica = :il_fabricaRef ) AND  
//         ( dt_fmp.co_linea = :il_lineaRef ) AND  
//         ( dt_fmp.co_referencia = :il_referencia ) AND  
//         ( dt_fmp.co_talla = :il_tallaRef ) AND  
//         ( dt_fmp.co_calidad = :il_calidadRef ) AND  
//         ( dt_fmp.co_diseno = :il_disenoRef ) AND  
//         ( dt_fmp.co_color = :il_colorRef ) AND  
//         ( dt_fmp.co_muestrario = :il_muestrarioRef )   
// 	using itr_transaction  ;
//
//
//If itr_transaction.SQLcode=-1 Then
//	PopulateError(20,"SQL Error")
//	n_cst_application.of_sql_error(itr_transaction)
//	Return -1
//End If
//
//////////////////////////////////////////////////////////////////////////
// Borro el encabezado
// 
//////////////////////////////////////////////////////////////////////////
//
//  DELETE FROM h_fmp  
//   WHERE ( h_fmp.co_fabrica = :il_fabricaRef ) AND  
//         ( h_fmp.co_linea = :il_lineaRef ) AND  
//         ( h_fmp.co_referencia = :il_referencia ) AND  
//         ( h_fmp.co_talla = :il_tallaRef ) AND  
//         ( h_fmp.co_calidad = :il_calidadRef ) AND  
//         ( h_fmp.co_diseno = :il_disenoRef ) AND  
//         ( h_fmp.co_color = :il_colorRef ) AND  
//         ( h_fmp.co_muestrario = :il_muestrarioRef )   
//	using itr_transaction  ;
//
//
//If itr_transaction.SQLcode=-1 Then
//	PopulateError(20,"SQL Error")
//	n_cst_application.of_sql_error(itr_transaction)
//	Return -1
//End If
//

//////////////////////////////////////////////////////////////////////////
// Se verifica si el dise$$HEX1$$f100$$ENDHEX$$o existe, en caso contrario se inserta
// 
//////////////////////////////////////////////////////////////////////////
Long ll_dato

  select m_disenos.co_fabrica  
    into :ll_dato  
    from m_disenos
   where ( m_disenos.co_fabrica = :il_fabricaref) and  
         ( m_disenos.co_linea = :il_linearef ) and  
         ( m_disenos.co_referencia = :il_referencia ) and  
         ( m_disenos.co_talla = :il_tallaref ) and  
         ( m_disenos.co_calidad = :il_calidadref ) and  
         ( m_disenos.co_diseno = :il_disenoref )   
         using itr_transaction  ;

If itr_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(itr_transaction)
	Return -1
End If

If itr_transaction.SQLcode=100 Then
	  insert into m_disenos  
         ( co_fabrica,   
           co_linea,   
           co_referencia,   
           co_talla,   
           co_calidad,   
           co_diseno,   
           de_diseno,   
           fe_creacion)  
  values ( :il_fabricaRef,   
           :il_lineaREf,   
           :il_referencia,   
           :il_tallaRef,   
           :il_calidadRef,   
           :il_disenoRef,   
           :is_deDiseno,   
           current) 
         Using itr_transaction  ;

	If itr_transaction.SQLcode=-1 Then
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(itr_transaction)
		Return -1
	End If	
	
end If
//////////////////////////////////////////////////////////////////////////
// Se crean las combinaciones
// 
//////////////////////////////////////////////////////////////////////////
  INSERT INTO m_combinaciones  
         ( co_fabrica,   
           co_linea,   
           co_referencia,   
           co_calidad,   
           co_talla,   
           co_combinacion,   
           de_combinacion,   
           fe_creacion,   
           fe_actualizacion,   
           usuario,   
           instancia )  
     SELECT :il_fabricaref,   
            :il_linearef,   
            :il_referencia,   
            :il_calidadref,   
            :il_tallaref,   
            m_combina_muestras.co_combinacion,   
            m_combina_muestras.de_combinacion,   
            m_combina_muestras.fe_creacion,   
            m_combina_muestras.fe_actualizacion,   
            m_combina_muestras.usuario,   
            m_combina_muestras.instancia  
       FROM m_combina_muestras  
      WHERE m_combina_muestras.co_fabrica =:il_fabricamue and
		      m_combina_muestras.co_linea = :il_lineamue and
				m_combina_muestras.co_muestra = :il_muestra and
				m_combina_muestras.co_talla = :il_tallamue and
		      m_combina_muestras.co_combinacion not in (  SELECT m_combinaciones.co_combinacion  
                                                          FROM m_combinaciones  
                                                         WHERE ( m_combinaciones.co_fabrica = :il_fabricaref ) AND  
                                                               ( m_combinaciones.co_linea = :il_linearef ) AND  
                                                               ( m_combinaciones.co_referencia = :il_referencia ) AND  
                                                               ( m_combinaciones.co_calidad = :il_calidadref ) AND  
                                                               ( m_combinaciones.co_talla = :il_tallaref )   
                                                                )  

         Using itr_transaction  ;

	If itr_transaction.SQLcode=-1 Then
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(itr_transaction)
		Return -1
	End If	

//////////////////////////////////////////////////////////////////////////
// Se inserta en h_fmp, el encabezado
// 
//////////////////////////////////////////////////////////////////////////

  insert into h_fmp  
         ( co_fabrica,   
           co_linea,   
           co_referencia,   
           co_talla,   
           co_calidad,   
           co_diseno,   
           co_color,   
           co_muestrario,
           co_recurso,   
           id_peso,   
           fe_creacion)  
     select :il_fabricaref,   
            :il_linearef,   
            :il_referencia,   
            :il_tallaref,   
            :il_calidadref,   
            :il_disenoref,   
            :il_colorref,   
            :il_muestrarioref,   
            h_fmp_muestras.co_recurso,   
            h_fmp_muestras.id_peso,
				current  
       from h_fmp_muestras  
      where ( h_fmp_muestras.co_fabrica = :il_fabricamue ) and  
            ( h_fmp_muestras.co_linea = :il_lineamue ) and  
            ( h_fmp_muestras.co_muestra = :il_muestra ) and  
            ( h_fmp_muestras.co_talla = :il_tallamue ) and  
            ( h_fmp_muestras.co_color = :il_colormue ) and
				( h_fmp_muestras.cnt_opcion = :il_opcionMpMuestra )
	using itr_transaction  ;


If itr_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(itr_transaction)
	Return -1
End If

  insert into dt_fmp  
         ( co_fabrica,   
           co_linea,   
           co_referencia,   
           co_talla,   
           co_calidad,   
           co_diseno,   
           co_color,   
           co_muestrario,   
           co_centro,   
           nu_partemp,   
           nu_mp,   
           co_tipoprod,   
           co_partemp,   
           co_combinacion,   
           co_fabrica_mp,   
           co_producto_mp,   
           calidad_mp,   
           co_matiz_mp,   
           co_caracteristi_mp,   
           co_color_mp,   
           peso_mp,   
           nu_conos,   
           fe_creacion)  
     select :il_fabricaref,   
            :il_linearef,   
            :il_referencia,   
            :il_tallaref,   
            :il_calidadref,   
            :il_disenoref,   
            :il_colorref,   
            :il_muestrarioref,
            dt_fmp_muestras.co_centro,   
            dt_fmp_muestras.nu_partemp,   
            dt_fmp_muestras.nu_mp,   
            dt_fmp_muestras.co_tipoprod,   
            dt_fmp_muestras.co_partemp,   
            dt_fmp_muestras.co_combinacion,   
            dt_fmp_muestras.co_fabrica_mp,   
            dt_fmp_muestras.co_producto_mp,   
            dt_fmp_muestras.calidad_mp,   
            dt_fmp_muestras.co_matiz_mp,   
            dt_fmp_muestras.co_caracteristi_mp,   
            dt_fmp_muestras.co_color_mp,   
            dt_fmp_muestras.peso_mp,   
            dt_fmp_muestras.nu_conos,   
            current
       from dt_fmp_muestras  
      where ( dt_fmp_muestras.co_fabrica = :il_fabricaMue ) and  
            ( dt_fmp_muestras.co_linea = :il_lineaMue ) and  
            ( dt_fmp_muestras.co_muestra = :il_muestra ) and  
            ( dt_fmp_muestras.co_talla = :il_tallaMue ) and  
            ( dt_fmp_muestras.co_color = :il_colorMue ) and
				( dt_fmp_muestras.cnt_opcion = : il_opcionMpMuestra )
	using itr_transaction  ;


If itr_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(itr_transaction)
	Return -1
End If				


//////////////////////////////////////////////////////////////////////////
// observaciones
// hay que verificar que no existan,porque pueden ser varios colores
//////////////////////////////////////////////////////////////////////////

long ll_verifica

  SELECT dt_fmp_observacion.co_fabrica  
    INTO :ll_verifica  
    FROM dt_fmp_observacion  
   WHERE ( dt_fmp_observacion.co_fabrica = :il_FabricaRef ) AND  
         ( dt_fmp_observacion.co_linea = :il_lineaRef ) AND  
         ( dt_fmp_observacion.co_referencia = :il_referencia ) AND  
         ( dt_fmp_observacion.co_talla = :il_tallaRef ) AND  
         ( dt_fmp_observacion.co_calidad = :il_calidadRef ) AND  
         ( dt_fmp_observacion.co_diseno = :il_disenoRef ) AND  
         ( dt_fmp_observacion.co_muestrario = :il_muestrarioRef ) 
	using itr_transaction  ;


If itr_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(itr_transaction)
	Return -1
End If	

If itr_transaction.SQLcode=100 Then

  INSERT INTO dt_fmp_observacion  
         ( co_fabrica,   
           co_linea,   
           co_referencia,   
           co_talla,   
           co_calidad,   
           co_diseno,   
           co_muestrario,   
           obs_fmp,   
           fe_creacion,   
           fe_actualizacion,   
           usuario,   
           instancia )  
     SELECT :il_fabricaref,   
            :il_linearef,   
            :il_referencia,   
            :il_tallaref,   
            :il_calidadref,   
            :il_disenoref,   
            :il_muestrarioref,   
            dt_fmp_obs_muestras.obs_fmp,   
            dt_fmp_obs_muestras.fe_creacion,   
            dt_fmp_obs_muestras.fe_actualizacion,   
            dt_fmp_obs_muestras.usuario,   
            dt_fmp_obs_muestras.instancia  
       FROM dt_fmp_obs_muestras  
      WHERE ( dt_fmp_obs_muestras.co_fabrica = :il_fabricamue ) AND  
            ( dt_fmp_obs_muestras.co_linea = :il_lineamue ) AND  
            ( dt_fmp_obs_muestras.co_muestra = :il_muestra ) AND  
            ( dt_fmp_obs_muestras.co_talla = :il_tallamue )  AND
			( dt_fmp_obs_muestras.co_diseno = :il_disenoRef ) AND  
         ( dt_fmp_obs_muestras.co_muestrario = :il_muestrarioRef ) 				
	using itr_transaction  ;

	
	If itr_transaction.SQLcode=-1 Then
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(itr_transaction)
		Return -1
	End If					

End If

Return 1
end function

public function integer of_settipoprod (long a_tipoprod);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 10 de Julio de 2003 HORA 16:14:36:998
// 
// Para asignar el tipo de producto
//////////////////////////////////////////////////////////////////////////

il_tipoProd=a_tipoProd

Return 1
end function

public function integer of_controlmo ();long ll_cerrado,ll_tejido,ll_res
n_cst_comun lo_comun


ll_res=lo_comun.of_valorconstante( "CERRADO", n_cst_application.itr_appl)

If ll_res<>1 Then
	Return -1
End If
ll_cerrado=lo_comun.of_getDecimal(1)

ll_res=lo_comun.of_valorconstante( "TEJIDO", n_cst_application.itr_appl)

If ll_res<>1 Then
	Return -1
End If
ll_tejido=lo_comun.of_getDecimal(1)

long ll_operacion

      SELECT MIN ( co_operacion )                                  
        INTO :ll_operacion
        FROM m_proref r                                            
       WHERE r.co_fabrica    = :il_fabricaRef                    
         AND r.co_linea      = :il_lineaRef                          
         AND r.co_referencia = :il_referencia
         AND r.co_talla      = :il_tallaRef                      
         AND r.co_calidad    = :il_calidadRef                        
         AND r.co_centro IN ( SELECT c.co_centro                   
                                FROM m_centros_pdn c               
                               WHERE c.co_tipoprod = :il_tipoProd
                                 AND c.tipo IN ( :ll_tejido,:ll_cerrado ) )
											
	using n_cst_application.itr_appl;	
	
	
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

If IsNull(ll_operacion) Then
	Return -1
End If

Return 1
end function

public function integer of_copiaft ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 24 de Enero de 2003 HORA 08:49:41:968
// 
// Funcion para la copia de la ficha tecnica
//////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////
// Borro las medidas actuales, en caso de que existan
// 
//////////////////////////////////////////////////////////////////////////
//  DELETE FROM dt_medidas_est_ref  
//   WHERE ( dt_medidas_est_ref.co_centro = 12 ) AND  
//         ( dt_medidas_est_ref.co_subcentro = 12 ) AND  
//         ( dt_medidas_est_ref.co_recurso = :il_recursoRef ) AND  
//         ( dt_medidas_est_ref.co_fabrica = :il_fabricaRef ) AND  
//         ( dt_medidas_est_ref.co_linea = :il_lineaRef ) AND  
//         ( dt_medidas_est_ref.co_referencia = :il_referencia ) AND  
//         ( dt_medidas_est_ref.co_talla = :il_tallaRef ) AND  
//         ( dt_medidas_est_ref.co_calidad = :il_calidadRef ) 
//	using itr_transaction  ;
//
//
//If itr_transaction.SQLcode=-1 Then
//	PopulateError(20,"SQL Error")
//	n_cst_application.of_sql_error(itr_transaction)
//	Return -1
//End If
//
//  insert into dt_medidas_est_ref  
//         ( co_centro,   
//           co_subcentro,   
//           co_recurso,   
//           co_fabrica,   
//           co_linea,   
//           co_referencia,   
//           co_talla,   
//           co_calidad,   
//           co_tipoprod,   
//           co_partebas,   
//           ca_largo,   
//           ca_ancho,   
//           ca_largo_sine,   
//           ca_ancho_sine,   
//           ca_largo_repos,   
//           ca_ancho_repos,   
//           ca_desperdicio,   
//           cadena,   
//           pasadas,   
//           ca_ancho_maq,   
//           de_observacion)  
//     select 12,   
//            12,   
//            :il_recursoref,   
//            :il_fabricaref,   
//            :il_linearef,   
//            :il_referencia,   
//            :il_tallaref,   
//            :il_calidadref,   
//            dt_medidas_est.co_tipoprod,   
//            dt_medidas_est.co_partebas,   
//            dt_medidas_est.ca_largo,   
//            dt_medidas_est.ca_ancho,   
//            dt_medidas_est.ca_largo_sine,   
//            dt_medidas_est.ca_ancho_sine,   
//            dt_medidas_est.ca_largo_repos,   
//            dt_medidas_est.ca_ancho_repos,   
//            dt_medidas_est.ca_desperdicio,   
//            dt_medidas_est.cadena,   
//            dt_medidas_est.pasadas,   
//            dt_medidas_est.ca_ancho_maq,   
//            dt_medidas_est.de_observacion  
//       from dt_medidas_est  
//      where ( dt_medidas_est.co_recurso = :il_recursoRef ) and  
//		      ( dt_medidas_est.co_fabrica = :il_fabricamue ) and  
//            ( dt_medidas_est.co_linea = :il_lineamue ) and  
//            ( dt_medidas_est.co_muestra = :il_muestra ) and  
//            ( dt_medidas_est.co_talla = :il_tallamue )   
//	using itr_transaction  ;
//
//
//If itr_transaction.SQLcode=-1 Then
//	PopulateError(20,"SQL Error")
//	n_cst_application.of_sql_error(itr_transaction)
//	Return -1
//End If
//

//////////////////////////////////////////////////////////////////////////
// Copia de las nuevas medidas
// 
// Se considera solo el dise$$HEX1$$f100$$ENDHEX$$o 1
//////////////////////////////////////////////////////////////////////////

  INSERT INTO dt_med_ref  
         ( co_centro,   
           co_subcentro,   
           co_recurso,   
           co_fabrica,   
           co_linea,   
           co_referencia,   
           co_talla,   
           co_calidad,   
           co_diseno,   
           co_tipoprod,   
           co_partebas,   
           ca_cm,   
           cadena,   
           pasadas,   
           de_observacion,   
           fe_actualizacion,   
           usuario,   
           instancia )  
     SELECT 12,   
            12,   
            :il_recursoref,   
            :il_fabricaref,   
            :il_linearef,   
            :il_referencia,   
            :il_tallaref,   
            :il_calidadref,
            1,   
            dt_med_mue.co_tipoprod,   
            dt_med_mue.co_partebas,   
            dt_med_mue.ca_cm,   
            dt_med_mue.cadena,   
            dt_med_mue.pasadas,   
            dt_med_mue.de_observacion,   
            CURRENT,   
            USER,   
            DBSERVERNAME  
       FROM dt_med_mue  
      WHERE ( dt_med_mue.co_fabrica = :il_fabricamue ) and  
            ( dt_med_mue.co_linea = :il_lineamue ) and  
            ( dt_med_mue.co_muestra = :il_muestra ) and  
            ( dt_med_mue.co_talla = :il_tallamue )   and
            ( dt_med_mue.co_diseno = 1 ) AND
	    		( dt_med_mue.co_recurso = (SELECT co_recurso 
														FROM dt_muestras m
														WHERE dt_med_mue.co_fabrica = m.co_fabrica AND  
															 dt_med_mue.co_linea = m.co_linea AND  
															 dt_med_mue.co_muestra = m.co_muestra AND  
															 dt_med_mue.co_talla = m.co_talla )) 
		using itr_transaction  ;


If itr_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(itr_transaction)
	Return -1
End If			


  INSERT INTO dt_med_ref_rep  
         ( co_centro,   
           co_subcentro,   
           co_recurso,   
           co_fabrica,   
           co_linea,   
           co_referencia,   
           co_talla,   
           co_calidad,   
           co_diseno,   
           co_tipoprod,   
           id_med_rep,   
           ca_cm,   
           fe_actualizacion,   
           usuario,   
           instancia )  
     SELECT 12,   
            12,   
            :il_recursoref,   
            :il_fabricaref,   
            :il_linearef,   
            :il_referencia,   
            :il_tallaref,   
            :il_calidadref,
            1,   
            dt_med_mue_rep.co_tipoprod,   
            dt_med_mue_rep.id_med_rep,   
            dt_med_mue_rep.ca_cm,   
            CURRENT,   
            USER,   
            DBSERVERNAME    
       FROM dt_med_mue_rep  
      WHERE ( dt_med_mue_rep.co_fabrica = :il_fabricamue ) AND  
            ( dt_med_mue_rep.co_linea = :il_lineamue ) AND  
            ( dt_med_mue_rep.co_muestra = :il_muestra ) AND  
            ( dt_med_mue_rep.co_talla = :il_tallamue ) AND  
            ( dt_med_mue_rep.co_diseno = 1 )     AND
	    		( dt_med_mue_rep.co_recurso = (SELECT co_recurso 
														FROM dt_muestras m
														WHERE dt_med_mue_rep.co_fabrica = m.co_fabrica AND  
															 dt_med_mue_rep.co_linea = m.co_linea AND  
															 dt_med_mue_rep.co_muestra = m.co_muestra AND  
															 dt_med_mue_rep.co_talla = m.co_talla )) 
		using itr_transaction  ;


If itr_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(itr_transaction)
	Return -1
End If		

//////////////////////////////////////////////////////////////////////////
// Se copia la teorica de la muestra a la referencia
// 
//////////////////////////////////////////////////////////////////////////
  INSERT INTO m_producc_teo  
         ( co_recurso,   
           co_fabrica,   
           co_linea,   
           co_referencia,   
           co_talla,   
           co_calidad,   
           produccion_teo,   
           fe_actualizacion,   
           usuario,   
           instancia,
			  estado )  
     SELECT :il_recursoref,   
            :il_fabricaref,   
            :il_linearef,   
            :il_referencia,   
            :il_tallaref,   
            :il_calidadref,
            m_producc_teo_mues.produccion_teo,   
            CURRENT,   
            USER,   
            DBSERVERNAME,
				m_producc_teo_mues.estado
       FROM m_producc_teo_mues  
      WHERE ( m_producc_teo_mues.co_recurso = :il_recursoref ) AND  
            ( m_producc_teo_mues.co_fabrica = :il_fabricamue) AND  
            ( m_producc_teo_mues.co_linea = :il_lineamue ) AND  
            ( m_producc_teo_mues.co_muestra = :il_muestra ) and
				( m_producc_teo_mues.co_talla = :il_tallamue )
using itr_transaction  ;


If itr_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(itr_transaction)
	Return -1
End If		




Return 1



end function

public function integer of_actualizarcambio ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 12 de Febrero de 2003 HORA 14:15:06:812
// 
// Cuando se hace una copia esta funcion actualiza la tabla dt_muestras_ref
// que es un log de las copias de muestras a referencias.

//////////////////////////////////////////////////////////////////////////
n_ds_application lds_1

lds_1=create n_ds_application

lds_1.DataObject="d_dt_muestras_ref"

lds_1.SetTransObject(itr_transaction)

long ll_tot

ll_tot=lds_1.Retrieve(il_fabricaMue,il_lineaMue,il_muestra,il_tallaMue,&
             il_fabricaRef,il_lineaRef,il_referencia,il_tallaRef)


If ll_tot=0 then
	lds_1.INsertRow(0)
	lds_1.SetItem(1,"co_fabrica",il_fabricaMue)
	lds_1.SetItem(1,"co_linea",il_lineaMue)
	lds_1.SetItem(1,"co_muestra",il_muestra)
	lds_1.SetItem(1,"co_talla",il_tallaMue)
	lds_1.SetItem(1,"co_fabrica_ref",il_fabricaRef)
	lds_1.SetItem(1,"co_linea_ref",il_lineaRef)
	lds_1.SetItem(1,"co_referencia_ref",il_referencia)
	lds_1.SetItem(1,"co_talla_ref",il_tallaRef)
	lds_1.SetItem(1,"sw_copia_mo",il_swcopiaMo)
	lds_1.SetItem(1,"sw_copia_ft",il_swcopiaFt)
	lds_1.SetItem(1,"co_composicion",il_co_composicion)
End If	
lds_1.SetItem(1,"de_observacion",is_observacion)	

DateTime ldt_fecha
String ls_usuario,ls_instancia

If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If



If lds_1.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
	Destroy lds_1
	Return -1
End If

If lds_1.Update()<>1 Then
	RollBack Using itr_transaction ;
	Return 1
End If

Destroy lds_1

Return 1
end function

public function integer of_actualizarEstado ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 16 de Marzo de 2004 HORA 15:36:06:366
// 
// Se actualiza el estado a 20, que es aprobada
//////////////////////////////////////////////////////////////////////////

long ll_consec

  SELECT max(dt_est_col_mues.consecutivo)  
    INTO :ll_consec  
    FROM dt_est_col_mues  
   WHERE ( dt_est_col_mues.co_fabrica = :il_fabricamue) AND  
         ( dt_est_col_mues.co_linea = :il_lineamue ) AND  
         ( dt_est_col_mues.co_muestra = :il_muestra ) AND  
         ( dt_est_col_mues.co_talla = :il_tallamue ) AND  
         ( dt_est_col_mues.co_color = :il_colormue )   
          using n_cst_application.itr_appl ;

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

If IsNull(ll_consec) Then
	ll_consec=0
End If

ll_consec++

  INSERT INTO dt_est_col_mues  
         ( co_fabrica,   
           co_linea,   
           co_muestra,   
           co_talla,   
           co_color,   
           consecutivo,   
           co_estado,   
           observacion,   
           fe_creacion,   
           fe_actualizacion,   
           usuario,   
           instancia,   
           co_ctecnico )  
  VALUES ( :il_fabricamue,   
           :il_lineamue,   
           :il_muestra,   
           :il_tallamue,   
           :il_colormue,   
           :ll_consec,   
           20,   
           '',   
           current,   
           current,   
           USER,   
           DBSERVERNAME,   
           null )  
			  using n_cst_application.itr_appl;



If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

  UPDATE dt_muestras_col  
     SET co_estado = 20,   
         fe_estado = current  
   WHERE ( dt_muestras_col.co_fabrica = :il_fabricamue) AND  
         ( dt_muestras_col.co_linea = :il_lineamue ) AND  
         ( dt_muestras_col.co_muestra = :il_muestra ) AND  
         ( dt_muestras_col.co_talla = :il_tallamue ) AND  
         ( dt_muestras_col.co_color = :il_colormue )   
      using n_cst_application.itr_appl;



If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If


Return 1
end function

public function integer of_actualizarcambiocolor ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 19 de Febrero de 2003 HORA 16:19:04:515
// 
// Para cuando se hacen cambios incluyendo hasta el color
//////////////////////////////////////////////////////////////////////////


n_ds_application lds_1

lds_1=create n_ds_application

lds_1.DataObject="d_dt_mues_ref_col"

lds_1.SetTransObject(itr_transaction)

long ll_tot

ll_tot=lds_1.Retrieve(il_fabricaMue,il_lineaMue,il_muestra,il_tallaMue,&
             il_fabricaRef,il_lineaRef,il_referencia,il_tallaRef,il_colorRef)

If ll_tot=0 then
	lds_1.InsertRow(0)
	lds_1.SetItem(1,"co_fabrica",il_fabricaMue)
	lds_1.SetItem(1,"co_linea",il_lineaMue)
	lds_1.SetItem(1,"co_muestra",il_muestra)
	lds_1.SetItem(1,"co_talla",il_tallaMue)
	lds_1.SetItem(1,"co_fabrica_ref",il_fabricaRef)
	lds_1.SetItem(1,"co_linea_ref",il_lineaRef)
	lds_1.SetItem(1,"co_referencia_ref",il_referencia)
	lds_1.SetItem(1,"co_talla_ref",il_tallaRef)
	lds_1.SetItem(1,"co_color",il_colorRef)
	
	If of_actualizarEstado()<>1 Then
		Return -1
	End If
	
End If	

DateTime ldt_fecha
String ls_usuario,ls_instancia

If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If

If lds_1.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
	Destroy lds_1
	Return -1
End If

If lds_1.Update()<>1 Then
	RollBack Using itr_transaction ;
	Return 1
End If

Destroy lds_1

Return 1
end function

public function integer of_setcomposicion (long a_composicion);
il_co_composicion=a_composicion 


Return 1
end function

on n_cst_muestra_a_referencia.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_muestra_a_referencia.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

