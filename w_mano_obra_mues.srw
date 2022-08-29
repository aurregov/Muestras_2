HA$PBExportHeader$w_mano_obra_mues.srw
$PBExportComments$Para el manejo de la mano de obra de muestras
forward
global type w_mano_obra_mues from w_sheet
end type
type dw_operacionesini from datawindow within w_mano_obra_mues
end type
type dw_head_ref from u_dw_application within w_mano_obra_mues
end type
type dw_observaciones_60 from u_dw_application within w_mano_obra_mues
end type
type dw_observaciones from u_dw_application within w_mano_obra_mues
end type
type st_1 from statictext within w_mano_obra_mues
end type
type dw_dt_m_proref_mues from u_dw_application within w_mano_obra_mues
end type
type dw_operaciones from u_dw_application within w_mano_obra_mues
end type
type dw_muestra from u_dw_application within w_mano_obra_mues
end type
type gb_referencia from u_gb_base within w_mano_obra_mues
end type
type gb_operaciones from u_gb_base within w_mano_obra_mues
end type
type gb_recurso_adicional from u_gb_base within w_mano_obra_mues
end type
type gb_observaciones from u_gb_base within w_mano_obra_mues
end type
end forward

global type w_mano_obra_mues from w_sheet
integer width = 3648
integer height = 2468
string title = "Mano de obra por muestra"
string menuname = "m_ref_muestra"
boolean maxbox = true
windowstate windowstate = maximized!
event ue_ficha_tecnica ( )
event ue_copiar_mano_obra ( )
event ue_borrar_mano_obra ( )
event ue_copia_mano_obra_referencia ( )
dw_operacionesini dw_operacionesini
dw_head_ref dw_head_ref
dw_observaciones_60 dw_observaciones_60
dw_observaciones dw_observaciones
st_1 st_1
dw_dt_m_proref_mues dw_dt_m_proref_mues
dw_operaciones dw_operaciones
dw_muestra dw_muestra
gb_referencia gb_referencia
gb_operaciones gb_operaciones
gb_recurso_adicional gb_recurso_adicional
gb_observaciones gb_observaciones
end type
global w_mano_obra_mues w_mano_obra_mues

type variables
DataWindowChild  idc_planta,idc_centro,idc_subcentro,idc_recurso,&
                 idc_operacion,idc_talla,&
					  idc_centro1,idc_subcentro1,idc_recurso1,idc_planta1

long il_fabrica,il_linea,il_muestra,il_talla, &
     il_tipo_prod,il_calidad,il_referencia, il_fabrica_ref, il_linea_ref
	  
DateTime idt_ano_mes

String is_where,is_where_copia, is_textoHtml

long il_recurso_adicional=0

boolean ib_cambios,ib_cambios1,ib_cambioObservaciones

n_ds_application ids_muestra_referencia 
end variables

forward prototypes
public function integer of_resetdddw ()
public function integer of_centroautorizado (ref long a_centroautorizado[])
public function string of_espacios (string a_cad, integer a_tam)
public function integer of_verificar ()
public function integer of_nombremuestra ()
public function integer of_existe (integer a_mensaje)
public function integer of_iniciar ()
public function integer of_actualiza_dt_ref_elemento ()
public function integer of_recuperar ()
public function integer of_grabar ()
public function integer of_descripcion1 ()
public function integer of_descripcion ()
public function integer of_validarecursomuestra ()
public function integer of_consultar_referencia ()
public subroutine wf_poblards_iniciales ()
public subroutine wf_genrepmodsobreoperaciones ()
public function uo_dsbase wf_copiardwoperaciones ()
end prototypes

event ue_ficha_tecnica();
If dw_muestra.RowCount()=0 Then Return 

n_cst_param lo_param

lo_param.il_vector[1]  = il_fabrica
lo_param.il_vector[2]  = il_linea
lo_param.il_vector[3]  = il_muestra
lo_param.il_vector[4]  = il_talla
lo_param.il_vector[5]  = dw_muestra.GetItemNumber(1,"co_grupo_tlla")
lo_param.il_vector[6]  = dw_muestra.GetItemNumber(1,"co_tipoprod")
lo_param.il_vector[7]  = il_fabrica_ref
lo_param.il_vector[8]  = il_linea_ref
lo_param.il_vector[9]  = dw_muestra.GetItemNumber(1,"co_cliente")
lo_param.il_vector[10] = dw_muestra.GetItemNumber(1,"co_sucursal")
lo_param.il_vector[11] = dw_muestra.GetItemNumber(1,"co_tipo_tejido")

IF Not isnull(il_referencia) AND il_referencia <> 0 THEN
	lo_param.il_vector[12] = il_referencia
ELSE
	lo_param.il_vector[12] = 0
END IF
lo_param.is_vector[1]  = dw_muestra.GetItemString(1,"desarrollador")
lo_param.is_vector[2]  = dw_muestra.GetItemString(1,"tipo_muestra")
lo_param.is_vector[3]  = dw_muestra.GetItemString(1,"de_muestra")

OpenSheetWithParm(w_inf_mo_mue,lo_param,This.ParentWindow(),2,Original!)

end event

event ue_copiar_mano_obra();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 17 de Mayo de 2004 HORA 11:15:26:781
// 
// Copia de mano de obra de muestras, si se tienen datos b$$HEX1$$e100$$ENDHEX$$sicos, se verifican
// y se complementan
//////////////////////////////////////////////////////////////////////////


long ll_res,i,ll_tot,j,ll_tot2,ll_res_obs
String ls_obser
n_cst_param lou_param

//If dw_operaciones.RowCount()>0 Then
//	MessageBox("Advertencia!","No se puede hacer la copia porque la muestra tiene operaciones.",StopSign!)
//	Return
//End If

If ib_cambios or ib_cambios1 Then
	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
	If ll_res=2 Then
		Return
	End If
End If


ib_cambios=False
ib_cambios1=False
ib_cambioobservaciones=False


OpenWithParm(w_opc_mues,is_where_copia)

lou_param = Message.PowerObjectParm

dw_dt_m_proref_mues.Reset()

DatawindowChild ldc_operacion,ldc_centro,ldc_subcentro,ldc_planta,ldc_recurso,&
                ldc_recurso1,ldc_planta1,ldc_centro1,ldc_subcentro1

long ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_calidad,ll_tipo_prod

n_ds_application lds_operacion,lds_proref

//////////////////////////////////////////////////////////////////////////
// Creo un datastore e inserto filas en blanco en los child para que no 
// pida los argumentos..
//////////////////////////////////////////////////////////////////////////


lds_operacion=Create n_ds_application

lds_operacion.DataObject=dw_operaciones.DataObject
lds_operacion.SetTransObject(n_cst_application.itr_appl)


lds_operacion.GetChild("co_operacion",ldc_operacion)
ldc_operacion.InsertRow(0)

lds_operacion.getChild("co_planta",ldc_planta)
ldc_planta.InsertRow(0)

lds_operacion.getChild("co_centro",ldc_centro)
ldc_centro.InsertRow(0)

lds_operacion.getChild("co_subcentro",ldc_subcentro)
ldc_subcentro.InsertRow(0)

lds_operacion.getChild("co_recurso",ldc_recurso)
ldc_recurso.InsertRow(0)


lds_proref=Create n_ds_application

lds_proref.DataObject=dw_dt_m_proref_mues.DataObject
lds_proref.SetTransObject(n_cst_application.itr_appl)


lds_proref.getChild("co_recurso",ldc_recurso1)
ldc_recurso1.InsertRow(0)

lds_proref.getChild("co_planta",ldc_planta1)
ldc_planta1.InsertRow(0)

lds_proref.getChild("co_centro",ldc_centro1)
ldc_centro1.InsertRow(0)

lds_proref.getChild("co_subcentro",ldc_subcentro1)
ldc_subcentro1.InsertRow(0)

If Not IsValid(lou_param) Then
	Return
End If



is_where_copia=lou_param.is_vector[1]

ll_fabrica=lou_param.il_vector[1]
ll_linea=lou_param.il_vector[2]
ll_muestra=lou_param.il_vector[3]
ll_talla=lou_param.il_vector[4]
	
ll_calidad=1 //siempre es calidad 1
//////////////////////////////////////////////////////////////////////////
// Si se est$$HEX2$$e1002000$$ENDHEX$$copiando de una fabrica diferente
//
// Determino cual es la planta en la que se va a procesar esta referencia
// 
// Coloca por defecto la planta seleccionada en todas las operaciones y
// posteriormente se puede modificar esta informaci$$HEX1$$f300$$ENDHEX$$n
//////////////////////////////////////////////////////////////////////////
If il_fabrica<>ll_fabrica Then
	OpenWithParm(w_sel_planat,il_fabrica)
	
	long ll_planta
	
	ll_planta=Message.DoubleParm
	
	If IsNull(ll_planta) Then ll_planta=0
	
	If ll_planta=0 Then
		MessageBox("Advertencia!","No se pudo determinar la planta.",StopSign!)
		Return
	End If
End If

ll_tot=lds_operacion.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_calidad)
If ll_tot<=0 Then
	MessageBox("Advertencia!","La muestra seleccionada no tiene parametrizada la mano de obra.",StopSign!)
	Destroy lds_operacion
	Destroy lds_proref
	Return
End If



ll_tipo_prod=lds_operacion.GetItemNumber(1,"co_tipoprod")

If ll_tipo_prod<>il_tipo_prod then
	MessageBox("Advertencia!","No se puede hacer copia de mano de obra a muestras de diferente tipo de producto, por favor verifique",StopSign!)
	Return
End If

//////////////////////////////////////////////////////////////////////////
// En caso de que se tengan operaciones, es es caso de mo basica, se debe
// verificar que sean las mismas, y en el mismo orden
//////////////////////////////////////////////////////////////////////////
long ll_tot1,ll_operacion1,ll_operacion2

ll_tot1=dw_operaciones.RowCount()

If ll_tot1>0 Then
	If ll_tot<>ll_tot1 Then
		MessageBox("Advertencia!","Esta tratando de copiar de una muestra que tiene operaciones diferentes, por favor verifique.",StopSign!)
		Return
	End If
	
	For i=1 To ll_tot
		ll_operacion1=lds_operacion.GetItemNumber(i,"co_operacion")
		ll_operacion2=dw_operaciones.GetItemNumber(i,"co_operacion")
		
		If IsNull(ll_operacion1) Then ll_operacion1=-1
		If IsNull(ll_operacion2) Then ll_operacion2=-1
		
		If ll_operacion1<>ll_operacion2 Then
			MessageBox("Advertencia!","Esta tratando de copiar de una muestra que tiene operaciones diferentes, o no est$$HEX1$$e100$$ENDHEX$$n en el mismo orden, por favor verifique.",StopSign!)
			Return		
		End If
	Next
End If

ll_res_obs=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea copiar las observaciones ?",Question!,YesNo!,2)
//////////////////////////////////////////////////////////////////////////
// Ingreso las operaciones de la referencia recuperada
// 
//////////////////////////////////////////////////////////////////////////
long ll_operacion,ll_orden,ll_centro,ll_subcentro,ll_recurso,ll_pro_ori,&
	  ll_pro_des, ll_prioridad
	  
dwItemStatus l_status	  
	  
For i=1 to ll_tot
	ll_operacion=lds_operacion.GetItemNumber(i,"co_operacion")
	ll_orden=lds_operacion.GetItemNumber(i,"orden_operacion")
//////////////////////////////////////////////////////////////////////////
// Si es en la misma fabrica se copia exactamente la planta, en caso 
// contrario el usuarion la selecciono
//////////////////////////////////////////////////////////////////////////
	
	If ll_fabrica=il_fabrica Then
		ll_planta=lds_operacion.GetItemNumber(i,"co_planta")
	End If

	ll_centro=lds_operacion.GetItemNumber(i,"co_centro")
	ll_subcentro=lds_operacion.GetItemNumber(i,"co_subcentro")
	ll_recurso=lds_operacion.GetItemNumber(i,"co_recurso")
	
//////////////////////////////////////////////////////////////////////////
// Para el primer registro se deja nulo el recurso.
// 
//////////////////////////////////////////////////////////////////////////
	If i=1 Then
		SetNull(ll_recurso)
	end If
	

//////////////////////////////////////////////////////////////////////////
// El registro puede o no existir
// 
//////////////////////////////////////////////////////////////////////////
	If ll_tot1>0 Then
		l_status=dw_operaciones.GetItemStatus(i,0,Primary!)
	Else
		l_status=new!
	End If
	

	If l_status=new! Or l_status=NewModified! Then	
		
			  INSERT INTO m_proref_muestras  
							( co_fabrica,   
							  co_linea,   
							  co_muestra,   
							  co_talla,   
							  co_tipoprod,   
							  co_operacion,   
							  orden_operacion,   
							  co_planta,   
							  co_centro,   
							  co_subcentro,   
							  co_recurso)  
				  VALUES ( :il_fabrica,   
							  :il_linea,   
							  :il_muestra,   
							  :il_talla,   
							  :il_tipo_prod,   
							  :ll_operacion,   
							  :ll_orden,   
							  :ll_planta,   
							  :ll_centro,   
							  :ll_subcentro,   
							  :ll_recurso) using n_cst_application.itr_appl ;
							  
							  
		If n_cst_application.itr_appl.SQLcode=-1 Then 
			PopulateError(20,"SQL Error")
			n_cst_application.of_sql_error(n_cst_application.itr_appl)
	
			Destroy lds_operacion
			Destroy lds_proref
			
			Return
		End If
		
	Else  //debe hacer update de algunos campos
		  UPDATE m_proref_muestras  
			  SET orden_operacion = :ll_orden,   
					co_planta = :ll_planta,   
					co_centro = :ll_centro,   
					co_subcentro = :ll_subcentro,   
					co_recurso = :ll_recurso  
			WHERE ( m_proref_muestras.co_fabrica = :il_fabrica ) AND  
					( m_proref_muestras.co_linea = :il_linea ) AND  
					( m_proref_muestras.co_muestra = :il_muestra ) AND  
					( m_proref_muestras.co_talla = :il_talla ) AND  
					( m_proref_muestras.co_tipoprod = :il_tipo_prod ) AND
					( m_proref_muestras.co_operacion = :ll_operacion )
					 using n_cst_application.itr_appl ;
								  
							  
		If n_cst_application.itr_appl.SQLcode=-1 Then 
			PopulateError(20,"SQL Error")
			n_cst_application.of_sql_error(n_cst_application.itr_appl)
	
			Destroy lds_operacion
			Destroy lds_proref
			
			Return
		End If

		
		
	End If	
	
	ll_pro_ori=lds_operacion.GetItemNumber(i,"cs_proref")
	
	ll_tot2=lds_proref.Retrieve(ll_pro_ori)
	
	If ll_tot2=-1 Then
		rollback using n_cst_application.itr_appl ;
		MessageBox("Advertencia!","No fue posible recuperar los recursos adicionales.",StopSign!)
		Destroy lds_operacion
		Destroy lds_proref
		
		Return
	End If
	
	If ll_tot2>0 Then
//////////////////////////////////////////////////////////////////////////
// Tomo el consecutivo que se asigno al $$HEX1$$fa00$$ENDHEX$$ltimo dato registrado
// 
//////////////////////////////////////////////////////////////////////////
		  SELECT m_proref_muestras.cs_proref  
			 INTO :ll_pro_des  
			 FROM m_proref_muestras  
			WHERE ( m_proref_muestras.co_fabrica = :il_fabrica ) AND  
					( m_proref_muestras.co_linea = :il_linea ) AND  
					( m_proref_muestras.co_muestra = :il_muestra ) AND  
					( m_proref_muestras.co_talla = :il_talla ) AND 
					( m_proref_muestras.co_operacion = :ll_operacion )
					  using n_cst_application.itr_appl ;
					  
		If n_cst_application.itr_appl.SQLcode=-1 Then 
			PopulateError(20,"SQL Error")
			n_cst_application.of_sql_error(n_cst_application.itr_appl)
			Destroy lds_operacion
			Destroy lds_proref
			
			Return
		End If							  
		If IsNull(ll_pro_des) Then ll_pro_des=0
		
		If ll_pro_des<=0 Then
			rollback using n_cst_application.itr_appl ;
			MessageBox("Advertencia!","Error en el consecutivo de proceso adicional destino.",StopSign!)
			Destroy lds_operacion
			Destroy lds_proref
			
			Return
		End If
		
		For j=1 To ll_tot2
			ll_recurso=lds_proref.GetItemNumber(j,"co_recurso")
//////////////////////////////////////////////////////////////////////////
// Se utiliza la misma planta cuando el dato se copia de la misma fabrica
// 
//////////////////////////////////////////////////////////////////////////
			If ll_fabrica=il_fabrica Then
				ll_planta=lds_proref.GetItemNumber(j,"co_planta")
			End If
			ll_centro=lds_proref.GetItemNumber(j,"co_centro")
			ll_subcentro=lds_proref.GetItemNumber(j,"co_subcentro")
			ll_prioridad=lds_proref.GetItemNumber(j,"prioridad")
//////////////////////////////////////////////////////////////////////////
// Inserto el registro en dt_m_proref, es posible que exista, en caso de que 
// se este haciendo actualizacion
//////////////////////////////////////////////////////////////////////////
			  DELETE FROM dt_m_proref_mues  
						WHERE ( dt_m_proref_mues.cs_proref = :ll_pro_des ) AND  
								( dt_m_proref_mues.co_recurso = :ll_recurso )   
								 using n_cst_application.itr_appl ;

			If n_cst_application.itr_appl.SQLcode=-1 Then 
				PopulateError(20,"SQL Error")
				n_cst_application.of_sql_error(n_cst_application.itr_appl)
				Destroy lds_operacion
				Destroy lds_proref
				
				Return
			End If		
			
			
					
				  INSERT INTO dt_m_proref_mues  
								( cs_proref,   
								  co_recurso,   
								  co_planta,   
								  co_centro,   
								  co_subcentro,   
								  prioridad)  
					  VALUES ( :ll_pro_des,   
								  :ll_recurso,   
								  :ll_planta,   
								  :ll_centro,   
								  :ll_subcentro,   
								  :ll_prioridad) using n_cst_application.itr_appl ;
					  
			If n_cst_application.itr_appl.SQLcode=-1 Then 
				PopulateError(20,"SQL Error")
				n_cst_application.of_sql_error(n_cst_application.itr_appl)
				Destroy lds_operacion
				Destroy lds_proref
				
				Return
			End If		

			
		Next

	
	End If
Next

If ll_res_obs=1 Then
	  DELETE FROM ob_m_proref_mues  
			WHERE ( ob_m_proref_mues.co_fabrica = :il_fabrica ) AND  
					( ob_m_proref_mues.co_linea = :il_linea ) AND  
					( ob_m_proref_mues.co_muestra = :il_muestra ) AND  
					( ob_m_proref_mues.co_talla = :il_talla ) AND  
					( ob_m_proref_mues.co_calidad = :il_calidad )   
					  using n_cst_application.itr_appl ;
					  
			If n_cst_application.itr_appl.SQLcode=-1 Then 
				PopulateError(20,"SQL Error")
				n_cst_application.of_sql_error(n_cst_application.itr_appl)
				Destroy lds_operacion
				Destroy lds_proref
				
				Return
			End If								  
//////////////////////////////////////////////////////////////////////////
// Asigno la observacion de la muestra desde la cual se esta copiando
// 
//////////////////////////////////////////////////////////////////////////
	  SELECT ob_m_proref_mues.observacion  
		 INTO :ls_obser  
		 FROM ob_m_proref_mues 
		WHERE ( ob_m_proref_mues.co_fabrica = :ll_fabrica ) AND  
				( ob_m_proref_mues.co_linea = :ll_linea ) AND  
				( ob_m_proref_mues.co_muestra = :ll_muestra ) AND  
				( ob_m_proref_mues.co_talla = :ll_talla ) AND  
				( ob_m_proref_mues.co_calidad = :ll_calidad )   
				using n_cst_application.itr_appl ;

			If n_cst_application.itr_appl.SQLcode=-1 Then 
				PopulateError(20,"SQL Error")
				n_cst_application.of_sql_error(n_cst_application.itr_appl)
				Destroy lds_operacion
				Destroy lds_proref
				
				Return
			End If		
//////////////////////////////////////////////////////////////////////////
// Solo si existia observaci$$HEX1$$f300$$ENDHEX$$n en la referencia desde la cual se esta copiando
// se copia en este lugar
//////////////////////////////////////////////////////////////////////////

			If n_cst_application.itr_appl.SQLcode=0 Then 
				  INSERT INTO ob_m_proref_mues  
								( co_fabrica,   
								  co_linea,   
								  co_muestra,   
								  co_talla,   
								  co_calidad,   
								  observacion)  
					  VALUES ( :il_fabrica,   
								  :il_linea,   
								  :il_muestra,   
								  :il_talla,   
								  :il_calidad,   
								  :ls_obser)  using n_cst_application.itr_appl ;
				
				
				If n_cst_application.itr_appl.SQLcode=-1 Then 
					PopulateError(20,"SQL Error")
					n_cst_application.of_sql_error(n_cst_application.itr_appl)
					Destroy lds_operacion
					Destroy lds_proref
					
					Return
				End If	
				
			End If						
End If


Commit using n_cst_application.itr_appl ;

of_recuperar()

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Informaci$$HEX1$$f300$$ENDHEX$$n copiada exitosamente.")






end event

event ue_borrar_mano_obra();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 22 de Enero de 2003 HORA 09:12:36:296
// 
// Para borrar la mano de obra de una muestra
//////////////////////////////////////////////////////////////////////////

If dw_muestra.RowCount()=0 Then 
	Return
End If

long ll_res

ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Esta seguro de eliminar la mano de obra de la muestra ?",Question!,YesNo!,2)
If ll_res=2 Then
	Return
End If

DO WHILE dw_operaciones.RowCount()>0
	dw_operaciones.DeleteRow(0)
LOOP

DO WHILE dw_dt_m_proref_mues.RowCount()>0
	dw_dt_m_proref_mues.DeleteRow(0)
LOOP

  DELETE FROM dt_m_proref_mues  
   WHERE dt_m_proref_mues.cs_proref in (SELECT cs_proref 
	                                      FROM m_proref_muestras 
													  WHERE ( m_proref_muestras.co_fabrica = :il_fabrica ) AND
													        ( m_proref_muestras.co_linea = :il_linea ) AND 
															  ( m_proref_muestras.co_muestra = :il_muestra ) AND
															  ( m_proref_muestras.co_talla = :il_talla ))
  using n_cst_application.itr_appl        ;
  
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If

//////////////////////////////////////////////////////////////////////////
// Borro las observaciones
// 
//////////////////////////////////////////////////////////////////////////

  DELETE FROM ob_m_proref_mues  
   WHERE ( ob_m_proref_mues.co_fabrica = :il_fabrica ) AND  
         ( ob_m_proref_mues.co_linea = :il_linea ) AND  
         ( ob_m_proref_mues.co_muestra = :il_muestra ) AND  
         ( ob_m_proref_mues.co_talla = :il_talla )             
  using n_cst_application.itr_appl        ;
  
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If

ib_cambioobservaciones=False


If of_grabar()<>1 Then
	Return
End If

Commit Using n_cst_application.itr_appl ;

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Mano de obra eliminada adecuadamente.")

end event

event ue_copia_mano_obra_referencia();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 21 de Junio de 2003 HORA 17:59:59:066
// 
// se copia mano de obra de una referencia a una muestra
// esta fue una idea de jaime ceballos
//////////////////////////////////////////////////////////////////////////


long ll_res,i,ll_tot,j,ll_tot2,ll_res_obs
String ls_obser
n_cst_param lou_param

If dw_operaciones.RowCount()>0 Then
	MessageBox("Advertencia!","No se puede hacer la copia porque la muestra tiene operaciones.",StopSign!)
	Return
End If

If ib_cambios or ib_cambios1 Then
	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
	If ll_res=2 Then
		Return
	End If
End If


ib_cambios=False
ib_cambios1=False
ib_cambioobservaciones=False

//////////////////////////////////////////////////////////////////////////
// Se selecciona la referencia origen de los datos
// 
//////////////////////////////////////////////////////////////////////////


OpenWithParm(w_opc_ref,is_where_copia)

lou_param = Message.PowerObjectParm

dw_dt_m_proref_mues.Reset()

DatawindowChild ldc_operacion,ldc_centro,ldc_subcentro,ldc_planta,ldc_recurso,&
                ldc_recurso1,ldc_planta1,ldc_centro1,ldc_subcentro1

long ll_fabrica,ll_linea,ll_referencia,ll_talla,ll_calidad,ll_tipo_prod

n_ds_application lds_operacion,lds_proref

//////////////////////////////////////////////////////////////////////////
// Creo un datastore e inserto filas en blanco en los child para que no 
// pida los argumentos..
//////////////////////////////////////////////////////////////////////////


lds_operacion=Create n_ds_application

lds_operacion.DataObject="d_m_preref"
lds_operacion.SetTransObject(n_cst_application.itr_appl)


lds_operacion.GetChild("co_operacion",ldc_operacion)
ldc_operacion.InsertRow(0)

lds_operacion.getChild("co_planta",ldc_planta)
ldc_planta.InsertRow(0)

lds_operacion.getChild("co_centro",ldc_centro)
ldc_centro.InsertRow(0)

lds_operacion.getChild("co_subcentro",ldc_subcentro)
ldc_subcentro.InsertRow(0)

lds_operacion.getChild("co_recurso",ldc_recurso)
ldc_recurso.InsertRow(0)


lds_proref=Create n_ds_application

lds_proref.DataObject="d_dt_m_proref"
lds_proref.SetTransObject(n_cst_application.itr_appl)


lds_proref.getChild("co_recurso",ldc_recurso1)
ldc_recurso1.InsertRow(0)

lds_proref.getChild("co_planta",ldc_planta1)
ldc_planta1.InsertRow(0)

lds_proref.getChild("co_centro",ldc_centro1)
ldc_centro1.InsertRow(0)

lds_proref.getChild("co_subcentro",ldc_subcentro1)
ldc_subcentro1.InsertRow(0)



If IsValid(lou_param) Then
	
	is_where_copia=lou_param.is_vector[1]
	
	ll_fabrica=lou_param.il_vector[1]
	ll_linea=lou_param.il_vector[2]
	ll_referencia=lou_param.il_vector[3]
	ll_talla=lou_param.il_vector[4]
		
	ll_calidad=lou_param.il_vector[5]
	
	ll_tipo_prod=lou_param.il_vector[6]
	
//////////////////////////////////////////////////////////////////////////
// Si se est$$HEX2$$e1002000$$ENDHEX$$copiando de una fabrica diferente
//
// Determino cual es la planta en la que se va a procesar esta referencia
// 
// Coloca por defecto la planta seleccionada en todas las operaciones y
// posteriormente se puede modificar esta informaci$$HEX1$$f300$$ENDHEX$$n
//////////////////////////////////////////////////////////////////////////
	If il_fabrica<>ll_fabrica Then
		OpenWithParm(w_sel_planat,il_fabrica)
		
		long ll_planta
		
		ll_planta=Message.DoubleParm
		
		If IsNull(ll_planta) Then ll_planta=0
		
		If ll_planta=0 Then
			MessageBox("Advertencia!","No se pudo determinar la planta.",StopSign!)
			Return
		End If
	End If

	ll_tot=lds_operacion.Retrieve(ll_fabrica,ll_linea,ll_referencia,ll_talla,ll_calidad)
	If ll_tot<=0 Then
		MessageBox("Advertencia!","La referencia seleccionada no tiene parametrizada la mano de obra.",StopSign!)
		Destroy lds_operacion
		Destroy lds_proref
		Return
	End If
	
//	ll_tipo_prod=lds_operacion.GetItemNumber(1,"co_tipoprod")
//
//	If ll_tipo_prod<>il_tipo_prod then
//		MessageBox("Advertencia!","No se puede hacer copia de mano de obra a muestras de diferente tipo de producto, por favor verifique",StopSign!)
//		Return
//	End If
//

   ll_res_obs=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea copiar las observaciones ?",Question!,YesNo!,2)
//////////////////////////////////////////////////////////////////////////
// Ingreso las operaciones de la referencia recuperada
// 
//////////////////////////////////////////////////////////////////////////
	long ll_operacion,ll_orden,ll_centro,ll_subcentro,ll_recurso,ll_pro_ori,&
	     ll_pro_des, ll_prioridad
		  
	For i=1 to ll_tot
		ll_operacion=lds_operacion.GetItemNumber(i,"co_operacion")
		ll_orden=lds_operacion.GetItemNumber(i,"orden_operacion")
//////////////////////////////////////////////////////////////////////////
// Si es en la misma fabrica se copia exactamente la planta, en caso 
// contrario el usuarion la selecciono
//////////////////////////////////////////////////////////////////////////
		
		If ll_fabrica=il_fabrica Then
			ll_planta=lds_operacion.GetItemNumber(i,"co_planta")
		End If

		ll_centro=lds_operacion.GetItemNumber(i,"co_centro")
		ll_subcentro=lds_operacion.GetItemNumber(i,"co_subcentro")
		ll_recurso=lds_operacion.GetItemNumber(i,"co_recurso")
		
				  INSERT INTO m_proref_muestras  
								( co_fabrica,   
								  co_linea,   
								  co_muestra,   
								  co_talla,   
								  co_tipoprod,   
								  co_operacion,   
								  orden_operacion,   
								  co_planta,   
								  co_centro,   
								  co_subcentro,   
								  co_recurso)  
					  VALUES ( :il_fabrica,   
								  :il_linea,   
								  :il_muestra,   
								  :il_talla,   
								  :il_tipo_prod,   
								  :ll_operacion,   
								  :ll_orden,   
								  :ll_planta,   
								  :ll_centro,   
								  :ll_subcentro,   
								  :ll_recurso) using n_cst_application.itr_appl ;
								  
								  
		If n_cst_application.itr_appl.SQLcode=-1 Then 
			PopulateError(20,"SQL Error")
			n_cst_application.of_sql_error(n_cst_application.itr_appl)

			Destroy lds_operacion
			Destroy lds_proref
			
			Return
		End If	
		
		
		ll_pro_ori=lds_operacion.GetItemNumber(i,"cs_proref")
		
		ll_tot2=lds_proref.Retrieve(ll_pro_ori)

		If ll_tot2=-1 Then

			rollback using n_cst_application.itr_appl ;
			MessageBox("Advertencia!","No fue posible recuperar los recursos adicionales.",StopSign!)
			Destroy lds_operacion
			Destroy lds_proref
			
			Return
		End If
		
		If ll_tot2>0 Then
//////////////////////////////////////////////////////////////////////////
// Tomo el consecutivo que se asigno al $$HEX1$$fa00$$ENDHEX$$ltimo dato registrado
// 
//////////////////////////////////////////////////////////////////////////
			  SELECT m_proref_muestras.cs_proref  
				 INTO :ll_pro_des  
				 FROM m_proref_muestras  
				WHERE ( m_proref_muestras.co_fabrica = :il_fabrica ) AND  
						( m_proref_muestras.co_linea = :il_linea ) AND  
						( m_proref_muestras.co_muestra = :il_muestra ) AND  
						( m_proref_muestras.co_talla = :il_talla ) AND 
						( m_proref_muestras.co_operacion = :ll_operacion )
						  using n_cst_application.itr_appl ;
						  
			If n_cst_application.itr_appl.SQLcode=-1 Then 
				PopulateError(20,"SQL Error")
				n_cst_application.of_sql_error(n_cst_application.itr_appl)
				Destroy lds_operacion
				Destroy lds_proref
				
				Return
			End If	
			Messagebox('Var','ll_pro_des='+String(ll_pro_des)+'~n')
			
			If IsNull(ll_pro_des) Then ll_pro_des=0
			
			If ll_pro_des<=0 Then
				rollback using n_cst_application.itr_appl ;
				MessageBox("Advertencia!","Error en el consecutivo de proceso adicional destino.",StopSign!)
				Destroy lds_operacion
				Destroy lds_proref
				
				Return
			End If
			
			For j=1 To ll_tot2
				ll_recurso=lds_proref.GetItemNumber(j,"co_recurso")
//////////////////////////////////////////////////////////////////////////
// Se utiliza la misma planta cuando el dato se copia de la misma fabrica
// 
//////////////////////////////////////////////////////////////////////////
				If ll_fabrica=il_fabrica Then
					ll_planta=lds_proref.GetItemNumber(j,"co_planta")
				End If
				ll_centro=lds_proref.GetItemNumber(j,"co_centro")
				ll_subcentro=lds_proref.GetItemNumber(j,"co_subcentro")
				ll_prioridad=lds_proref.GetItemNumber(j,"prioridad")
//////////////////////////////////////////////////////////////////////////
// Inserto el registro en dt_m_proref
// 
//////////////////////////////////////////////////////////////////////////
					  INSERT INTO dt_m_proref_mues  
									( cs_proref,   
									  co_recurso,   
									  co_planta,   
									  co_centro,   
									  co_subcentro,   
									  prioridad)  
						  VALUES ( :ll_pro_des,   
									  :ll_recurso,   
									  :ll_planta,   
									  :ll_centro,   
									  :ll_subcentro,   
									  :ll_prioridad) using n_cst_application.itr_appl ;
						  
				If n_cst_application.itr_appl.SQLcode=-1 Then 
					PopulateError(20,"SQL Error")
					n_cst_application.of_sql_error(n_cst_application.itr_appl)
					Destroy lds_operacion
					Destroy lds_proref
					
					Return
				End If		

				
			Next

		
		End If
	Next
	
	If ll_res_obs=1 Then
		  DELETE FROM ob_m_proref_mues  
				WHERE ( ob_m_proref_mues.co_fabrica = :il_fabrica ) AND  
						( ob_m_proref_mues.co_linea = :il_linea ) AND  
						( ob_m_proref_mues.co_muestra = :il_muestra ) AND  
						( ob_m_proref_mues.co_talla = :il_talla ) AND  
						( ob_m_proref_mues.co_calidad = :il_calidad )   
						  using n_cst_application.itr_appl ;
						  
				If n_cst_application.itr_appl.SQLcode=-1 Then 
					PopulateError(20,"SQL Error")
					n_cst_application.of_sql_error(n_cst_application.itr_appl)
					Destroy lds_operacion
					Destroy lds_proref
					
					Return
				End If								  
//////////////////////////////////////////////////////////////////////////
// Asigno la observacion de la muestra desde la cual se esta copiando
// 
//////////////////////////////////////////////////////////////////////////
		  SELECT ob_m_proref.observacion  
			 INTO :ls_obser  
			 FROM ob_m_proref  
			WHERE ( ob_m_proref.co_fabrica = :ll_fabrica ) AND  
					( ob_m_proref.co_linea = :ll_linea ) AND  
					( ob_m_proref.co_referencia = :ll_referencia ) AND  
					( ob_m_proref.co_talla = :ll_talla ) AND  
					( ob_m_proref.co_calidad = :ll_calidad )   
					using n_cst_application.itr_appl ;

				If n_cst_application.itr_appl.SQLcode=-1 Then 
					PopulateError(20,"SQL Error")
					n_cst_application.of_sql_error(n_cst_application.itr_appl)
					Destroy lds_operacion
					Destroy lds_proref
					
					Return
				End If		
//////////////////////////////////////////////////////////////////////////
// Solo si existia observaci$$HEX1$$f300$$ENDHEX$$n en la referencia desde la cual se esta copiando
// se copia en este lugar
//////////////////////////////////////////////////////////////////////////

				If n_cst_application.itr_appl.SQLcode=0 Then 
					  INSERT INTO ob_m_proref_mues  
									( co_fabrica,   
									  co_linea,   
									  co_muestra,   
									  co_talla,   
									  co_calidad,   
									  observacion)  
						  VALUES ( :il_fabrica,   
									  :il_linea,   
									  :il_muestra,   
									  :il_talla,   
									  :il_calidad,   
									  :ls_obser)  using n_cst_application.itr_appl ;
					
					
					If n_cst_application.itr_appl.SQLcode=-1 Then 
						PopulateError(20,"SQL Error")
						n_cst_application.of_sql_error(n_cst_application.itr_appl)
						Destroy lds_operacion
						Destroy lds_proref
						
						Return
					End If	
					
				End If						
	End If

	
	Commit using n_cst_application.itr_appl ;
	
	of_recuperar()
	
	MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Informaci$$HEX1$$f300$$ENDHEX$$n copiada exitosamente desde la Referencia.")

End If










end event

public function integer of_resetdddw ();idc_centro.Reset()
idc_centro.InsertRow(0)

idc_operacion.Reset()
idc_operacion.InsertRow(0)

idc_planta.Reset()
idc_planta.InsertRow(0)

idc_recurso.Reset()
idc_recurso.InsertRow(0)

idc_subcentro.Reset()
idc_subcentro.InsertRow(0)



Return 1
end function

public function integer of_centroautorizado (ref long a_centroautorizado[]);//////////////////////////////////////////////////////////////////////////
// Las operaciones se deben filtrar de acuerdo al perfil del usuario
// 2 Contro tecnico
// 3 Empaque
// 4 control tec + empaque
// 1 Admon de DB
//////////////////////////////////////////////////////////////////////////

	If n_cst_application.ii_perfil=3 Then	
		a_centroautorizado[1]=52
		a_centroautorizado[3]=56
	ElseIf n_cst_application.ii_perfil=1 or &
		    n_cst_application.ii_perfil=4 or &
			 n_cst_application.ii_perfil=2 Then	
		a_centroautorizado[1]=12
		a_centroautorizado[2]=22
		a_centroautorizado[3]=32	
		a_centroautorizado[4]=52
		a_centroautorizado[5]=54
		a_centroautorizado[6]=56
   End If
	
Return 1
end function

public function string of_espacios (string a_cad, integer a_tam);String ls_cad


ls_cad=a_cad

If IsNull(ls_cad) then ls_cad=""

Do While (Len(ls_cad)<a_tam)
	ls_cad=ls_cad+" "	
Loop

Return ls_cad
end function

public function integer of_verificar ();If dw_operaciones.AcceptText()<>1 Then
	MessageBox("Advertencia!","Informaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	Return -1
end If

If dw_dt_m_proref_mues.AcceptText()<>1 Then
	MessageBox("Advertencia!","Informaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida en adicionales.",StopSign!)
	Return -1
end If

If dw_observaciones_60.AcceptText()<>1 Then
//If dw_observaciones.AcceptText()<>1 Then
	MessageBox("Advertencia!","Informaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida en observaciones.",StopSign!)
	Return -1
end If


long i,ll_tot,ll_talla,ll_calidad


For i=1 To dw_operaciones.RowCount()
	ll_talla=dw_operaciones.GetItemNumber(i,"co_talla")
	If IsNull(ll_talla) Then
		dw_operaciones.DeleteRow(i)
		i -- 
	End If
Next

//////////////////////////////////////////////////////////////////////////
// Verifico los datos existentes
// 
//////////////////////////////////////////////////////////////////////////
long ll_operacion,ll_orden,ll_planta,ll_centro,ll_subcentro,ll_recurso
ll_tot=dw_operaciones.rowCount()

For i=1 To ll_tot
	ll_talla=dw_operaciones.GetItemNumber(i,"co_talla")
	If IsNull(ll_talla) Then
		MessageBox("Advertencia!","Talla no v$$HEX1$$e100$$ENDHEX$$lida en fila "+String(i)+".",StopSign!)
		Return -1
	End If

   ll_operacion=dw_operaciones.GetItemNumber(i,"co_operacion")

	If IsNull(ll_operacion) Then
		MessageBox("Advertencia!","Operaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida en fila "+String(i)+".",StopSign!)
		Return -1
	End If
	
   ll_orden=dw_operaciones.GetItemNumber(i,"orden_operacion")

	If IsNull(ll_orden) Then
		MessageBox("Advertencia!","Orden no v$$HEX1$$e100$$ENDHEX$$lida en fila "+String(i)+".",StopSign!)
		Return -1
	End If
	
   ll_planta=dw_operaciones.GetItemNumber(i,"co_planta")

	If IsNull(ll_planta) Then
		MessageBox("Advertencia!","Planta no v$$HEX1$$e100$$ENDHEX$$lida en fila "+String(i)+".",StopSign!)
		Return -1
	End If

   ll_centro=dw_operaciones.GetItemNumber(i,"co_centro")

	If IsNull(ll_centro) Then
		MessageBox("Advertencia!","Planta no v$$HEX1$$e100$$ENDHEX$$lida en fila "+String(i)+".",StopSign!)
		Return -1
	End If
	
   ll_subcentro=dw_operaciones.GetItemNumber(i,"co_subcentro")

	If IsNull(ll_subcentro) Then
		MessageBox("Advertencia!","Subcentro no v$$HEX1$$e100$$ENDHEX$$lida en fila "+String(i)+".",StopSign!)
		Return -1
	End If

   ll_recurso=dw_operaciones.GetItemNumber(i,"co_recurso")

	If IsNull(ll_recurso) Then
		MessageBox("Advertencia!","Recurso no v$$HEX1$$e100$$ENDHEX$$lida en fila "+String(i)+".",StopSign!)
		Return -1
	End If
	
Next
	
	
For i=1 To dw_dt_m_proref_mues.RowCount()
	ll_planta=dw_dt_m_proref_mues.GetItemNumber(i,"co_planta")
	ll_centro=dw_dt_m_proref_mues.GetItemNumber(i,"co_centro")
	If IsNull(ll_planta) And IsNull(ll_centro) Then
		dw_operaciones.DeleteRow(i)
		i -- 
	End If
Next


ll_tot=dw_dt_m_proref_mues.rowCount()

For i=1 To ll_tot
   ll_planta=dw_dt_m_proref_mues.GetItemNumber(i,"co_planta")

	If IsNull(ll_planta) Then
		MessageBox("Advertencia!","Planta no v$$HEX1$$e100$$ENDHEX$$lida en adicionales fila "+String(i)+".",StopSign!)
		Return -1
	End If

   ll_centro=dw_dt_m_proref_mues.GetItemNumber(i,"co_centro")

	If IsNull(ll_centro) Then
		MessageBox("Advertencia!","Planta no v$$HEX1$$e100$$ENDHEX$$lida en adicionales fila "+String(i)+".",StopSign!)
		Return -1
	End If
	
   ll_subcentro=dw_dt_m_proref_mues.GetItemNumber(i,"co_subcentro")

	If IsNull(ll_subcentro) Then
		MessageBox("Advertencia!","Subcentro no v$$HEX1$$e100$$ENDHEX$$lida en adiconales fila "+String(i)+".",StopSign!)
		Return -1
	End If

   ll_recurso=dw_dt_m_proref_mues.GetItemNumber(i,"co_recurso")

	If IsNull(ll_recurso) Then
		MessageBox("Advertencia!","Recurso no v$$HEX1$$e100$$ENDHEX$$lida en adicionales fila "+String(i)+".",StopSign!)
		Return -1
	End If
	
Next
	
If of_validaRecursoMuestra()<>1 Then
	Return -1
End If


return 1	
	
	
	
	
	
	
	
	

end function

public function integer of_nombremuestra ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 21 de Enero de 2003 HORA 17:47:21:781
// 
// 
//////////////////////////////////////////////////////////////////////////

If il_fabrica=-1 or il_linea=-1 or il_muestra=-1 Then
	Return -1
End If

n_cst_comun lo_comun

long ll_res


ll_res=lo_comun.of_nombreMuestra(il_fabrica /*long a_fabrica*/,&
                                    il_linea/*long a_linea*/, &
												il_muestra/*long a_muestra*/, &
												n_cst_application.itr_appl/*transaction a_transaction */)
long ll_n

SetNull(ll_n)

If ll_res=1 Then
	dw_muestra.SetItem(1,"de_muestra",lo_comun.of_getString(1))
	il_tipo_prod=lo_comun.of_getLong(1)
Else
	dw_muestra.SetItem(1,"de_muestra","")
	il_tipo_prod=-1
End If

il_talla=-1

lo_comun.of_loadDddw(idc_talla,il_fabrica,il_linea,il_muestra,n_cst_application.itr_appl)


Return 1
end function

public function integer of_existe (integer a_mensaje);If il_fabrica=-1 Then
	If a_mensaje=1 Then
		MessageBox("Advertencia!","Fabrica no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	End If
	Return -1
End If

If il_linea=-1 Then
	If a_mensaje=1 Then
		MessageBox("Advertencia!","L$$HEX1$$ed00$$ENDHEX$$nea no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	End If
	Return -1
End If

If il_muestra=-1 Then
	If a_mensaje=1 Then
		MessageBox("Advertencia!","Muestra no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	End If
	Return -1
End If

If il_talla=-1 Then
	If a_mensaje=1 Then
		MessageBox("Advertencia!","Talla no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	End If
	Return -1
End If

If a_mensaje=1 Then
	Return 1
End If

n_cst_comun lo_comun 

lo_comun.of_loadDddw(idc_planta,n_cst_application.itr_appl)
lo_comun.of_loadDddw(idc_centro,il_tipo_prod,n_cst_application.itr_appl)


long ll_cant

  SELECT count(*)  
    INTO :ll_cant  
    FROM m_proref_muestras  
   WHERE ( m_proref_muestras.co_fabrica = :il_fabrica ) AND  
         ( m_proref_muestras.co_linea = :il_linea ) AND  
         ( m_proref_muestras.co_muestra = :il_muestra ) and
			( m_proref_muestras.co_talla = :il_talla )
			using n_cst_application.itr_appl;
			
			
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If
			
If n_cst_application.itr_appl.SQLcode=100 Then 
	Return 1
End If
			
If IsNull(ll_cant) then 
	ll_cant=0
End If
long ll_res=1
If ll_cant>0 Then
	//ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$La referencia tiene medidas parametrizadas en este recurso, desea recuperarlas ?",Question!,YesNo!,2)
	If ll_res=1 Then
		il_referencia = -1
		of_consultar_referencia()
		of_recuperar()
	End If
Else
	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea copiar la mano de obra de otra muestra ?",Question!,YesNo!,2)
	If ll_res=1 Then
		PostEvent("ue_copiar_mano_obra")
	End If

End If


Return 1
end function

public function integer of_iniciar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 22 de Enero de 2003 HORA 09:00:52:531
// 
// 
//////////////////////////////////////////////////////////////////////////

il_fabrica=-1
il_linea=-1
il_muestra=-1
il_talla=-1
il_referencia=-1

dw_muestra.Reset()
dw_operaciones.Reset()
dw_dt_m_proref_mues.Reset()
dw_observaciones_60.Reset()
//dw_observaciones.Reset()
dw_head_ref.reset()

ib_cambios=false
ib_cambios1=false
ib_cambioObservaciones=False

Return 1
end function

public function integer of_actualiza_dt_ref_elemento ();////////////////////////////////////////////////////////////////////////////
//// JUAN FERNANDO VASQUEZ DUQE 
//// Martes 22 de Octubre de 2002 HORA 14:19:50:875
//// 
//// 
////////////////////////////////////////////////////////////////////////////
//
//n_ds_application lds_1,lds_2
//
//lds_1=Create n_ds_application
//lds_1.DataObject="d_m_oper_elem"
//lds_1.SetTransObject(n_cst_application.itr_appl)
//
//
//lds_2=Create n_ds_application
//lds_2.DataObject="d_dt_ref_elemento"
//lds_2.SetTransObject(n_cst_application.itr_appl)
//
////////////////////////////////////////////////////////////////////////////
//// Recorro inicialmente las filas borradas
//// E inserto el registro de todas maneras
////////////////////////////////////////////////////////////////////////////
//
//Long i,ll_tot,ll_calidad,ll_operacion,ll_tot1,ll_elemento,j,ll_tot2,ll_pos
//
//ll_tot=dw_operaciones.DeletedCount()
//
//For i=1 To ll_tot
//	ll_calidad=dw_operaciones.GetItemNumber(i,"co_calidad",Delete!,false)
//	ll_operacion=dw_operaciones.GetItemNumber(i,"co_operacion",Delete!,false)
//	
//	ll_tot1=lds_1.Retrieve(il_tipo_prod,ll_operacion)
//	
//	If ll_tot1<0 Then
//		Return -1
//	End If
////////////////////////////////////////////////////////////////////////////
//// Recupero todos los dt_ref_elemento
//// 
////////////////////////////////////////////////////////////////////////////
//	
//	ll_tot2=lds_2.Retrieve(il_fabrica,il_linea,il_referencia,il_talla,ll_calidad,idt_ano_mes)
//
//	If ll_tot2<0 then
//		Return -1
//	End If
//	
//	For j=1 To ll_tot1
//		ll_elemento=lds_1.GetItemNumber(j,1)
////////////////////////////////////////////////////////////////////////////
//// Busco el elemento y su no existe lo inserto
//// 
////////////////////////////////////////////////////////////////////////////
//		ll_pos=lds_2.find("co_elemento="+String(ll_elemento),1,lds_2.RowCount())
//		If ll_pos=0 Then
//			ll_pos=lds_2.InsertRow(0)
//			lds_2.SetItem(ll_pos,"co_fabrica",il_fabrica)
//			lds_2.SetItem(ll_pos,"co_linea",il_linea)
//			lds_2.SetItem(ll_pos,"co_referencia",il_referencia)
//			lds_2.SetItem(ll_pos,"co_talla",il_talla)
//			lds_2.SetItem(ll_pos,"co_calidad",ll_calidad)
//			lds_2.SetItem(ll_pos,"ano_mes",idt_ano_mes)
//			lds_2.SetItem(ll_pos,"co_elemento",ll_elemento)
//		End If		
//		lds_2.SetItem(ll_pos,"id_control",0)
//		
//	Next
//	If lds_1.of_datosActualizacion()<>1 Then
//		Return -1
//	End If
//	
//	If lds_2.Update()<>1 then
//		return -1
//	End If
//	
//Next
//
//
//
//
//
//
//
//
//
//ll_tot=dw_operaciones.RowCount()
//
//For i=1 To ll_tot
//	
//	If dw_operaciones.GetItemNumber(i,"ccambio_operacion")=0 Then
//		Continue
//	End If
//	
//	ll_calidad=dw_operaciones.GetItemNumber(i,"co_calidad")
//	ll_operacion=dw_operaciones.GetItemNumber(i,"co_operacion")
//	
//	ll_tot1=lds_1.Retrieve(il_tipo_prod,ll_operacion)
//	
//	If ll_tot1<0 Then
//		Return -1
//	End If
////////////////////////////////////////////////////////////////////////////
//// Recupero todos los dt_ref_elemento
//// 
////////////////////////////////////////////////////////////////////////////
//	
//	ll_tot2=lds_2.Retrieve(il_fabrica,il_linea,il_referencia,il_talla,ll_calidad,idt_ano_mes)
//
//	If ll_tot2<0 then
//		Return -1
//	End If
//	
//	For j=1 To ll_tot1
//		ll_elemento=lds_1.GetItemNumber(j,1)
////////////////////////////////////////////////////////////////////////////
//// Busco el elemento y su no existe lo inserto
//// 
////////////////////////////////////////////////////////////////////////////
//		ll_pos=lds_2.find("co_elemento="+String(ll_elemento),1,lds_2.RowCount())
//		If ll_pos=0 Then
//			ll_pos=lds_2.InsertRow(0)
//			lds_2.SetItem(ll_pos,"co_fabrica",il_fabrica)
//			lds_2.SetItem(ll_pos,"co_linea",il_linea)
//			lds_2.SetItem(ll_pos,"co_referencia",il_referencia)
//			lds_2.SetItem(ll_pos,"co_talla",il_talla)
//			lds_2.SetItem(ll_pos,"co_calidad",ll_calidad)
//			lds_2.SetItem(ll_pos,"ano_mes",idt_ano_mes)
//			lds_2.SetItem(ll_pos,"co_elemento",ll_elemento)
//		End If		
//		lds_2.SetItem(ll_pos,"id_control",0)
//		
//	Next
//	If lds_1.of_datosActualizacion()<>1 Then
//		Return -1
//	End If
//	
//	If lds_2.Update()<>1 then
//		return -1
//	End If
//	
//Next
//
//
//
//
Return 1
//
//
//
//
end function

public function integer of_recuperar ();Long 		ll_grp_talla	,ll_tot,i
String 	ls_obser

//dw_operaciones.getChild("co_planta",idc_planta)
//dw_operaciones.getChild("co_centro",idc_centro)
//dw_operaciones.getChild("co_subcentro",idc_subcentro)
//dw_operaciones.getChild("co_recurso",idc_recurso)
//dw_operaciones.getChild("co_operacion",idc_operacion)

n_cst_comun lo_comun
dw_muestra.SetItem(1,2,il_calidad)
lo_comun.of_loadDddw( idc_talla, il_fabrica, il_linea, il_muestra,n_cst_application.itr_appl)

If dw_muestra.Retrieve(il_fabrica,il_linea,il_muestra,il_talla)<=0 Then
	dw_muestra.Reset()
	dw_head_ref.Reset()
	DW_MUESTRA.insertRow(0)
	dw_operaciones.Reset()
	of_resetDddw()
	il_referencia = -1
	Return -1
End If

il_tipo_prod=dw_muestra.GetItemNumber(1,"co_tipoprod")

dw_operaciones.SetSort("orden_operacion")
dw_operaciones.Sort()

dw_operaciones.Retrieve(il_fabrica,il_linea,il_muestra,il_talla)
wf_poblarDs_Iniciales() //SA53977 - Ceiba/jjmonsal - 06-12-2016
of_descripcion()

ll_tot=dw_observaciones.Retrieve(il_fabrica,il_linea,il_muestra,il_talla,il_calidad)
If ll_tot=0 Then
	dw_observaciones.InsertRow(0)
	dw_observaciones.SetItem(1,"co_fabrica",il_fabrica)
	dw_observaciones.SetItem(1,"co_linea",il_linea)
	dw_observaciones.SetItem(1,"co_muestra",il_muestra)
	dw_observaciones.SetItem(1,"co_talla",il_talla)
	dw_observaciones.SetItem(1,"co_calidad",il_calidad)
End If
//////////////////////////////////////////////////////////////////////////
// Coloco los datos de las observaciones en el dw de varias l$$HEX1$$ed00$$ENDHEX$$neas
// 
//////////////////////////////////////////////////////////////////////////
String ls_tmp
ls_obser=dw_observaciones.GetItemString(1,"observacion")
dw_observaciones_60.Reset()
For i=1 to 12
	ls_tmp=Trim(mid(ls_obser,60 * (i -1)+1,60))
	dw_observaciones_60.InsertRow(0)
	dw_observaciones_60.SetItem(i,1,ls_tmp)
Next
	
//////////////////////////////////////////////////////////////////////////
// Cargo las listas desplegables de planta y centro y operaciones
// 
//////////////////////////////////////////////////////////////////////////

lo_comun.of_loadDddw(idc_planta,n_cst_application.itr_appl)
lo_comun.of_loadDddw(idc_centro,il_tipo_prod,n_cst_application.itr_appl)
//of_cargarDddw(idc_operacion,il_tipo_prod)	

IF Not isnull(il_referencia) AND il_referencia <> 0 THEN
	dw_head_ref.Retrieve(il_fabrica_ref,il_linea_ref,il_referencia,il_talla,il_calidad,0,0,il_muestra)
END IF	

Return 1


end function

public function integer of_grabar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 22 de Octubre de 2002 HORA 10:44:27:921
// 
// Almacena los datos en DB
//////////////////////////////////////////////////////////////////////////
DateTime	ldt_fecha
String	ls_usuario,ls_instancia, ls_tmp
Long 		ll_oper, ll_opers, i

n_ds_application lds_1
Exception 			ex

try
	ex = create Exception
	If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
													 ldt_fecha,ls_usuario,ls_instancia) Then
		Return -1
	End If
	
	lds_1=Create n_ds_application
	lds_1.DataObject="d_cierres_tj"
	lds_1.SetTransObject(n_cst_application.itr_appl)
	
	If lds_1.Retrieve()<>1 Then
		MessageBox("Advertencia!","No determino a$$HEX1$$f100$$ENDHEX$$o y/o mes contable.",StopSign!)
		Return -1
	End If
	
	idt_ano_mes=lds_1.GetItemDateTime(1,1)
	
	Execute immediate "SET CONSTRAINTS ALL DEFERRED" using n_cst_application.itr_appl;
	
	If n_cst_application.itr_appl.SQLcode=-1 Then
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(n_cst_application.itr_appl)
		Return -1
	End If
	
	
	//////////////////////////////////////////////////////////////////////////
	// Se actualiza la tabla dt_ref_elemento y luego se llama un SP
	// 
	//////////////////////////////////////////////////////////////////////////
	If of_actualiza_dt_ref_elemento()<>1 Then
		Return -1
	End If
	
	wf_genRepModSobreOperaciones() //SA53977 - Ceiba/jjmonsal - 06-12-2016
	
	ll_opers = dw_operaciones.RowCount()
	dw_operaciones.Sort()
	
	FOR ll_oper = 1 to ll_opers
		dw_operaciones.SetItem(ll_oper,"orden_operacion", ll_oper * 10)
	NEXT
	
	If dw_operaciones.Update(True,False)<>1 Then
		Return -1
	End If
	
	If dw_dt_m_proref_mues.Update(True,False)<>1 Then
		Return -1
	End If
	
	//////////////////////////////////////////////////////////////////////////
	// Si se ha realizado algun cambio en las observaciones se actualiza
	// 
	//////////////////////////////////////////////////////////////////////////
	If ib_cambioobservaciones	Then
		For i=1 to dw_observaciones_60.Rowcount()
			ls_tmp+=of_espacios( dw_observaciones_60.GetItemString(i,1),60)		
		Next
		
		dw_observaciones.setItem(1,"observacion",ls_tmp)
	
		If dw_observaciones.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
			Return -1
		End If
		
		If dw_observaciones.Update(True,False)<>1 Then
			Return -1
		End If
	End If
	
	Return 1
CATCH(Exception exc)
	Throw exc
CATCH( Throwable th)
	Throw (th)
End try
end function

public function integer of_descripcion1 ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 23 de Octubre de 2002 HORA 09:53:50:781
// 
// Para la descripci$$HEX1$$f300$$ENDHEX$$n en dt_m_proref
//////////////////////////////////////////////////////////////////////////

n_cst_comun lo_comun

long i,ll_tot,ll_centro,ll_subcentro,ll_recurso,ll_res

String ls_des

ll_tot=dw_dt_m_proref_mues.rowCount()

For i=1 to ll_tot
	ll_centro=dw_dt_m_proref_mues.GetItemNumber(i,"co_centro")
	ll_subcentro=dw_dt_m_proref_mues.GetItemNumber(i,"co_subcentro")
	ll_recurso=dw_dt_m_proref_mues.GetItemNumber(i,"co_recurso")
	
	ll_res=lo_comun.of_nombresubcentro(il_tipo_prod,ll_centro,ll_subcentro,n_cst_application.itr_appl)
	If ll_res=1 Then
		ls_des=lo_comun.of_getString(1)
		dw_dt_m_proref_mues.SetItem(i,"cde_subcentro",ls_des)
	End If
	
	ll_res=lo_comun.of_nombreRecurso(ll_recurso,il_tipo_prod,ll_centro,ll_subcentro,n_cst_application.itr_appl)
	If ll_res=1 Then
		ls_des=lo_comun.of_getString(1)
		dw_dt_m_proref_mues.SetItem(i,"cde_recurso",ls_des)
	End IF
Next

Return 1













end function

public function integer of_descripcion ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 22 de Octubre de 2002 HORA 08:09:33:125
// 
// Para colocar la descripci$$HEX1$$f300$$ENDHEX$$n de los campos ocultos
//////////////////////////////////////////////////////////////////////////

long i,ll_tot,ll_centro,ll_subcentro,ll_recurso,ll_operacion,ll_res

String ls_des

n_cst_comun lo_comun

ll_tot=dw_operaciones.rowCount()

For i=1 to ll_tot
	ll_centro=dw_operaciones.GetItemNumber(i,"co_centro")
	ll_subcentro=dw_operaciones.GetItemNumber(i,"co_subcentro")
	ll_recurso=dw_operaciones.GetItemNumber(i,"co_recurso")
	ll_operacion=dw_operaciones.GetItemNumber(i,"co_operacion")
	
	ll_res=lo_comun.of_nombreSubcentro(il_tipo_prod,ll_centro,ll_subcentro,n_cst_application.itr_appl)
	If ll_res=1 Then
		ls_des=lo_comun.of_getString(1)
		dw_operaciones.SetItem(i,"cde_subcentro",ls_des)
	End If
	
	ll_res=lo_comun.of_nombreRecurso(ll_recurso,il_tipo_prod,ll_centro,ll_subcentro,n_cst_application.itr_appl)
	If ll_res=1 Then
		ls_des=lo_comun.of_getString(1)
		dw_operaciones.SetItem(i,"cde_recurso",ls_des)
	End If
	
	ll_res=lo_comun.of_nombreOperacion(il_tipo_prod,ll_operacion,n_cst_application.itr_appl)
	If ll_res=1 Then	
		ls_des=lo_comun.of_getString(1)
		dw_operaciones.SetItem(i,"cde_operacion",ls_des)
	End If
Next

Return 1













end function

public function integer of_validarecursomuestra ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Viernes 18 de Marzo de 2005 HORA 14:56:46:609
// 
// Verifica que el recurso de la muestra sea el mismo de tejido
//////////////////////////////////////////////////////////////////////////

long ll_recurso_mues,ll_pos,ll_recurso1


  SELECT min(dt_muestras.co_recurso)  
    INTO :ll_recurso_mues  
    FROM dt_muestras  
   WHERE ( dt_muestras.co_fabrica = :il_fabrica ) AND  
         ( dt_muestras.co_linea = :il_linea ) AND  
         ( dt_muestras.co_muestra = :il_muestra )   
           using n_cst_application.itr_appl;                    

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

If IsNull(ll_recurso_mues) Then
	MessageBox("Advertencia!","La muestra no tiene recurso, debe especificar alguno.",StopSign!)
	Return -1

End If

ll_pos=dw_operaciones.Find("co_operacion=1",1,&
		 dw_operaciones.RowCount())
		 
If ll_pos<=0 Then
	MessageBox("Advertencia!","La muestra no tiene la operaci$$HEX1$$f300$$ENDHEX$$n Tejido.",StopSign!)
	Return -1
End If

ll_recurso1=dw_operaciones.GetItemNumber(ll_pos,"co_recurso")

If ll_recurso1<>ll_recurso_mues Then
	MessageBox("Advertencia!","El recurso de tejido debe ser "+&
	String(ll_recurso_mues)+" que es el de la muestra.",StopSign!)
	Return -1
End If


Return 1
end function

public function integer of_consultar_referencia ();Long ll_filas

ll_filas = ids_muestra_referencia.retrieve(il_fabrica,il_linea, il_muestra,il_talla )

IF ll_filas <0 Then
Elseif ll_filas = 0 Then
Elseif ll_filas = 1 Then	
	il_referencia = ids_muestra_referencia.getitemNumber(1,"co_referencia_ref")
Elseif ll_filas > 1 Then
	dw_head_ref.reset()
End if


Return 1
end function

public subroutine wf_poblards_iniciales ();/***********************************************************
SA53977 - Ceiba/jjmonsal - 06-12-2016 FunctionName : wf_poblarDs_Iniciales
<DESC> Description: Copiar informacion del dw de operaciones para tener acceso a la imformacion incial y luego poder compararla</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Operaciones inicial carga al recuperar la info </USAGE>
********************************************************************/
Long			ll_filas
Exception	ex1
Try
	ex1 = create Exception
	ll_filas = dw_operaciones.RowCount()
	dw_operacionesini.dataobject = dw_operaciones.dataobject
	
	IF dw_operaciones.RowCount() <= 0 THEN RETURN 
	
	IF dw_operaciones.rowscopy(1,ll_filas, Primary!,dw_operacionesIni, 1, Primary!) < 0 THEN 
		ex1.setmessage('Ocurrio un error al copiar el set de datos de las mp de la Fmp')
		Throw ex1
	END IF
		
CATCH(Exception ex)
	Throw ex
CATCH( Throwable th)
	Throw th
End try
end subroutine

public subroutine wf_genrepmodsobreoperaciones ();/***********************************************************
SA53977 - Ceiba/jjmonsal - 06-12-2016 FunctionName : wf_genRepModSobreOperaciones
<DESC> Description: Copiar informacion del dw de operaciones para tener acceso a la imformacion incial y luego poder compararla</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Operaciones inicial carga al recuperar la info </USAGE>
********************************************************************/
Long							ll_filas, ll_referencia
Exception					ex1
n_cst_c_repModManObra	lonv_repModManObra
Try
	ex1 						= CREATE Exception
	lonv_repModManObra	= CREATE n_cst_c_repModManObra
	
	IF dw_head_ref.ROWCOUNT() > 0 THEN 
		ll_referencia = dw_head_ref.getItemNumber(1,'co_referencia')
	ELSEIF il_referencia = -1  THEN
		THIS.of_consultar_referencia()
	ELSE 
		ll_referencia	= il_referencia
	END IF 
	
	lonv_repModManObra.of_setReferencia(ll_referencia)
	lonv_repModManObra.of_setDeTalla(idc_talla.getItemString(1,'de_talla'))
	lonv_repModManObra.of_setil_tipo_prod(il_tipo_prod)
	
	lonv_repModManObra.of_genRepModSobreOperaciones(dw_muestra.getItemNumber(1, 'co_fabrica'),&
																	dw_muestra.getItemNumber(1, 'co_linea'),&
																	dw_muestra.getItemNumber(1, 'co_muestra'),&
																	wf_CopiarDwOperaciones(),&
																	dw_OperacionesIni)
		
CATCH(Exception ex)
	Messagebox("Ha ocurrido una excepci$$HEX1$$f300$$ENDHEX$$n", ex.getmessage(), StopSign!)
CATCH( Throwable th)
	Messagebox("Ha ocurrido una excepci$$HEX1$$f300$$ENDHEX$$n", th.getmessage(), StopSign!)
End try
end subroutine

public function uo_dsbase wf_copiardwoperaciones ();Long	ll_filas
Exception ex
uo_dsbase lds_operaciones
TRY
	ex = create Exception
	lds_operaciones				= CREATE uo_dsbase		
	lds_operaciones.dataobject = dw_operaciones.DataObject
	
	ll_filas = dw_operaciones.rowcount()
	
	IF ll_filas <= 0 THEN RETURN lds_operaciones
	
	IF dw_operaciones.rowscopy(1,ll_filas , Primary!, lds_operaciones, 1, Primary!) < 0 THEN 
		ex.setmessage('Ocurrio un error al copiar el set de datos de las Operaciones')
		Throw ex
	END IF
	RETURN lds_operaciones
CATCH( Throwable ex1)
	Throw ex1
End try
end function

on w_mano_obra_mues.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_ref_muestra" then this.MenuID = create m_ref_muestra
this.dw_operacionesini=create dw_operacionesini
this.dw_head_ref=create dw_head_ref
this.dw_observaciones_60=create dw_observaciones_60
this.dw_observaciones=create dw_observaciones
this.st_1=create st_1
this.dw_dt_m_proref_mues=create dw_dt_m_proref_mues
this.dw_operaciones=create dw_operaciones
this.dw_muestra=create dw_muestra
this.gb_referencia=create gb_referencia
this.gb_operaciones=create gb_operaciones
this.gb_recurso_adicional=create gb_recurso_adicional
this.gb_observaciones=create gb_observaciones
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_operacionesini
this.Control[iCurrent+2]=this.dw_head_ref
this.Control[iCurrent+3]=this.dw_observaciones_60
this.Control[iCurrent+4]=this.dw_observaciones
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.dw_dt_m_proref_mues
this.Control[iCurrent+7]=this.dw_operaciones
this.Control[iCurrent+8]=this.dw_muestra
this.Control[iCurrent+9]=this.gb_referencia
this.Control[iCurrent+10]=this.gb_operaciones
this.Control[iCurrent+11]=this.gb_recurso_adicional
this.Control[iCurrent+12]=this.gb_observaciones
end on

on w_mano_obra_mues.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_operacionesini)
destroy(this.dw_head_ref)
destroy(this.dw_observaciones_60)
destroy(this.dw_observaciones)
destroy(this.st_1)
destroy(this.dw_dt_m_proref_mues)
destroy(this.dw_operaciones)
destroy(this.dw_muestra)
destroy(this.gb_referencia)
destroy(this.gb_operaciones)
destroy(this.gb_recurso_adicional)
destroy(this.gb_observaciones)
end on

event open;call super::open;dw_muestra.SetTransObject(n_cst_application.itr_appl)
dw_dt_m_proref_mues.SetTransObject(n_cst_application.itr_appl)
dw_observaciones.SetTransObject(n_cst_application.itr_appl)
dw_operaciones.SetTransObject(n_cst_application.itr_appl)
dw_head_ref.SetTransObject(n_cst_application.itr_appl)

ids_muestra_referencia = CREATE n_ds_application

ids_muestra_referencia.of_load('dgr_muestra_referenica')
ids_muestra_referencia.of_conexion(n_cst_application.itr_appl,True)

dw_operaciones.getChild("co_planta",idc_planta)
dw_operaciones.getChild("co_centro",idc_centro)
dw_operaciones.getChild("co_subcentro",idc_subcentro)
dw_operaciones.getChild("co_recurso",idc_recurso)
dw_operaciones.getChild("co_operacion",idc_operacion)


dw_dt_m_proref_mues.getChild("co_centro",idc_centro1)
dw_dt_m_proref_mues.getChild("co_subcentro",idc_subcentro1)
dw_dt_m_proref_mues.getChild("co_recurso",idc_recurso1)
dw_dt_m_proref_mues.getChild("co_planta",idc_planta1)

idc_centro1.InsertRow(0)
idc_subcentro1.InsertRow(0)
idc_recurso1.InsertRow(0)
idc_planta1.InsertRow(0)

dw_muestra.getchild("co_talla",idc_talla)

n_cst_comun lo_comun

lo_comun.of_loadDddw(idc_talla,-1,-1,-1,n_cst_application.itr_appl)
il_calidad=1
of_resetDddw()
end event

event ue_find;call super::ue_find;n_cst_param lou_param
Int    li_cliente,li_sucursal
String ls_tpped,ls_obser
long   ll_grp_talla,ll_res,ll_tot

If ib_cambios or ib_cambios1 Then
	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
	If ll_res=2 Then
		Return
	End If
End If

ib_cambios=False
ib_cambios1=False
ib_cambioobservaciones=false

OpenWithParm(w_opc_mues_ref,is_where)

lou_param = Message.PowerObjectParm

dw_dt_m_proref_mues.Reset()

If IsValid(lou_param) Then
	
	is_where=lou_param.is_vector[1]
 	
	il_fabrica  	= lou_param.il_vector[1]
	il_linea	 	   = lou_param.il_vector[2]
	il_muestra 	   = lou_param.il_vector[3]
	il_talla		   = lou_param.il_vector[4]
	ll_grp_talla   = lou_param.il_vector[5]
	il_referencia 	= lou_param.il_vector[6]
	il_fabrica_ref	= lou_param.il_vector[7]
	il_linea_ref	= lou_param.il_vector[8]
	il_tipo_prod   = lou_param.il_vector[9]
	
	il_calidad=1
	
	of_recuperar()
End If	

end event

event ue_save;call super::ue_save;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 22 de Octubre de 2002 HORA 10:15:01:812
// 
// Aca se almacena la informaci$$HEX1$$f300$$ENDHEX$$n
//////////////////////////////////////////////////////////////////////////
//SA53977 - Ceiba/jjmonsal - 06-12-2016: Se controlas las excepciones
TRY
	If of_verificar()<>1 Then
		Return
	End If
	
	If of_grabar()<>1 then
		RollBack using n_cst_application.itr_appl ;
		Return
	End If
	
	ib_cambios=False
	ib_cambios1=False
	ib_cambioobservaciones=False
	
	Commit using n_cst_application.itr_appl ;
	
	MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","La informaci$$HEX1$$f300$$ENDHEX$$n se guardo satisfactoriamente.")
	
	of_recuperar()
CATCH(Exception ex)
	RollBack using n_cst_application.itr_appl ;
	Messagebox("A ocurrido una excepci$$HEX1$$f300$$ENDHEX$$n", "Fallo: " + ex.getmessage(), StopSign!)
	Return
CATCH( Throwable th)
	RollBack using n_cst_application.itr_appl ;
	Messagebox("A ocurrido una excepci$$HEX1$$f300$$ENDHEX$$n", "Fallo: " + th.getmessage(), StopSign!)
	Return
End try



end event

type dw_operacionesini from datawindow within w_mano_obra_mues
boolean visible = false
integer x = 1911
integer y = 400
integer width = 1563
integer height = 48
integer taborder = 30
boolean enabled = false
string title = "Operaciones Ini"
string dataobject = "d_m_proref_muestras"
boolean border = false
boolean livescroll = true
end type

type dw_head_ref from u_dw_application within w_mano_obra_mues
integer x = 50
integer y = 272
integer width = 1445
integer height = 160
integer taborder = 20
string dataobject = "d_h_fmp_mue_referencia"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;call super::getfocus;//gb_head.of_color(True)
end event

event itemchanged;call super::itemchanged;//long ll_dato,ll_res,ll_null
//n_cst_comun lo_comun
//
//String ls_dato,ls_null
//
//SetNull(ll_null)
//SetNull(ls_null)
//
//If il_err_item_change<>0 Then
//	Return 2
//End If
//
//If dwo.name="co_diseno" Then
//	il_diseno=Long(Data)
//
//	ll_res=lo_comun.of_nombreDiseno(il_fabrica,il_linea,il_referencia,il_talla,&
//	                il_calidad,il_diseno,n_cst_application.itr_appl)
//	If ll_res=1 Then	
//		SetItem(1,"de_diseno",lo_comun.of_getString(1))
//	Else
//		il_diseno=-1
//		MessageBox("Advertencia!","Dise$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
//		Return 2
//	End If
//	//of_headMod(dwo.name)
//End If
//
end event

event itemfocuschanged;call super::itemfocuschanged;selectText(1,20)
end event

event losefocus;call super::losefocus;//gb_head.of_color(False)
end event

event ue_insertrow;////long ll_res
////If ib_cambios Then
////	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
////	If ll_res=2 Then
////		Return
////	End If
////End If
////
////of_resetDw()
////of_resetVar()
////Reset()
////
////Super::Event ue_insertRow()
////
////
end event

event ue_deleterow;//If tab_1.tabpage_1.dw_partes.RowCount()>0 Then
//	MessageBox("Advertencia!","No deben existir partes.",StopSign!)
//	Return
//End If
//
//Super::Event ue_deleteRow()
//
end event

type dw_observaciones_60 from u_dw_application within w_mano_obra_mues
integer x = 46
integer y = 1624
integer width = 3520
integer height = 388
integer taborder = 60
string dataobject = "d_ext_observaciones_60"
boolean livescroll = false
end type

event itemchanged;call super::itemchanged;If of_validarCadena(data)<>1 Then
	Return 2
End If
	
ib_cambioObservaciones=true
end event

type dw_observaciones from u_dw_application within w_mano_obra_mues
boolean visible = false
integer x = 23
integer y = 2044
integer width = 3017
integer height = 80
integer taborder = 50
string dataobject = "d_obproref_mues"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;call super::getfocus;gb_observaciones.of_color(True)
end event

event losefocus;call super::losefocus;gb_observaciones.of_color(False)
end event

event ue_deleterow;//////////////////////////////////////////////////////////////////////////
// OverWrite!!
// 
//////////////////////////////////////////////////////////////////////////

end event

event ue_insertrow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 23 de Octubre de 2002 HORA 13:51:16:890
// 
// OverWrite!
//////////////////////////////////////////////////////////////////////////

end event

event itemchanged;call super::itemchanged;If of_validarCadena(data)<>1 Then
	Return 2
End If
	
ib_cambioObservaciones=true
end event

type st_1 from statictext within w_mano_obra_mues
integer x = 78
integer y = 1096
integer width = 1394
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Haga doble click en la operaci$$HEX1$$f300$$ENDHEX$$n para ver recursos adicionales"
boolean focusrectangle = false
end type

type dw_dt_m_proref_mues from u_dw_application within w_mano_obra_mues
integer x = 50
integer y = 1232
integer width = 3497
integer height = 312
integer taborder = 40
string dataobject = "d_dt_m_proref_mues"
boolean hscrollbar = true
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// Verifico que el co_proref sea v$$HEX1$$e100$$ENDHEX$$lido antes de habilitar el dw
// 
//////////////////////////////////////////////////////////////////////////

If il_recurso_adicional=0 Then
	//MessageBox("Advertencia!","Debe especificar la operaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
	Return
End If

Super::Event GetFocus()

gb_recurso_adicional.of_color(True)
end event

event ue_insertrow;call super::ue_insertrow;Long ll_f

ll_f=GetRow()

SetItem(ll_f,"cs_proref",il_recurso_adicional)

end event

event itemfocuschanged;call super::itemfocuschanged;//////////////////////////////////////////////////////////////////////////
// Carga los datos para los subcentros
// 
//////////////////////////////////////////////////////////////////////////

long ll_centro,ll_subcentro

n_cst_comun lo_comun 

If dwo.name="co_subcentro" then
	ll_centro=GetItemNumber(row,"co_centro")
	lo_comun.of_loadDddw(idc_subcentro1,il_tipo_prod,ll_centro,n_cst_application.itr_appl)
End If

If dwo.name="co_recurso" Then
	ll_centro=GetItemNumber(row,"co_centro")
	ll_subcentro=GetItemNumber(row,"co_subcentro")
	lo_comun.of_loadDddw(idc_recurso1,il_tipo_prod,ll_centro,ll_subcentro,n_cst_application.itr_appl)
End If


end event

event itemchanged;call super::itemchanged;If il_err_item_change<>0 Then
	Return 2
End If
long ll_null

SetNull(ll_null)

ib_cambios1=true

If dwo.name="co_centro" then
	SetItem(Row,"co_subcentro",ll_null)
	SetItem(row,"cde_subcentro","")

	SetItem(Row,"co_recurso",ll_null)
	SetItem(row,"cde_recurso","")
End If


long ll_pos
If dwo.name="co_subcentro" then
	ll_pos=idc_subcentro1.find("#1="+data,1,idc_subcentro1.rowCount())
	If ll_pos>0 Then
		SetItem(row,"cde_subcentro",idc_subcentro1.GetItemString(ll_pos,2))
	End If

	SetItem(Row,"co_recurso",ll_null)
	SetItem(row,"cde_recurso","")
	
End If

If dwo.name="co_recurso" Then
	ll_pos=idc_recurso1.find("#1="+data,1,idc_recurso1.rowCount())
	If ll_pos>0 Then
		SetItem(row,"cde_recurso",idc_recurso1.GetItemString(ll_pos,2))
	End If
End If


end event

event losefocus;call super::losefocus;gb_recurso_adicional.of_color(False)
end event

type dw_operaciones from u_dw_application within w_mano_obra_mues
integer x = 50
integer y = 532
integer width = 3515
integer height = 552
integer taborder = 20
string dataobject = "d_m_proref_muestras"
boolean hscrollbar = true
end type

event getfocus;call super::getfocus;gb_operaciones.of_color(True)
end event

event losefocus;call super::losefocus;gb_operaciones.of_color(False)
end event

event ue_insertrow;call super::ue_insertrow;//////////////////////////////////////////////////////////////////////////
// coloco los datos que no se ven
// 
//////////////////////////////////////////////////////////////////////////
long ll_f

ll_f=GetRow()

SetItem(ll_f,"co_fabrica",il_fabrica)
SetItem(ll_f,"co_linea",il_linea)
SetItem(ll_f,"co_muestra",il_muestra)
SetItem(ll_f,"co_talla",il_talla)

SetItem(ll_f,"co_tipoprod",il_tipo_prod)

IF ll_f > 1 THEN
	SetItem(ll_f,"orden_operacion", GetItemNumber(ll_f - 1,"orden_operacion") + 10)
ELSE
	SetItem(ll_f,"orden_operacion", 10)
END IF
SetColumn("co_planta")
end event

event itemfocuschanged;call super::itemfocuschanged;//////////////////////////////////////////////////////////////////////////
// Carga los datos para los subcentros
// 
//////////////////////////////////////////////////////////////////////////

long ll_centro,ll_subcentro,ll_centro_autoriza[]

n_cst_comun lo_comun
If dwo.name="co_subcentro" then
	ll_centro=GetItemNumber(row,"co_centro")
	lo_comun.of_loadDddw(idc_subcentro,il_tipo_prod,ll_centro,n_cst_application.itr_appl)
End If

If dwo.name="co_recurso" Then
	ll_centro=GetItemNumber(row,"co_centro")
	ll_subcentro=GetItemNumber(row,"co_subcentro")
	lo_comun.of_loadDddw(idc_recurso,il_tipo_prod,ll_centro,ll_subcentro,n_cst_application.itr_appl)
End If

If dwo.name="co_operacion" Then
	ll_centro=GetItemNumber(row,"co_centro")
	ll_subcentro=GetItemNumber(row,"co_subcentro")
	

	of_centroAutorizado(ll_centro_autoriza)
	
	idc_operacion.SetTransObject(n_cst_application.itr_appl)
	
	idc_operacion.Retrieve(idc_operacion,il_tipo_prod,ll_centro,ll_subcentro,ll_centro_autoriza)
	
	If idc_operacion.RowCount()=0 Then
		idc_operacion.InsertRow(0)
	End If	
	//of_cargarDddw(idc_operacion,il_tipo_prod,ll_centro,ll_subcentro)
End If

end event

event itemchanged;call super::itemchanged;If il_err_item_change<>0 Then
	Return 2
End If
long ll_null
long ll_pos

SetNull(ll_null)

If dwo.name="co_operacion" Then
	SetItem(row,"cde_operacion",1)
End If

If dwo.name="co_centro" then
	SetItem(Row,"co_subcentro",long(data))

	ll_pos=idc_subcentro.find("#1="+data,1,idc_subcentro.rowCount())
	If ll_pos>0 Then
		SetItem(row,"cde_subcentro",idc_subcentro.GetItemString(ll_pos,2))
	End If


	SetItem(Row,"co_recurso",ll_null)
	SetItem(row,"cde_recurso","")
End If



If dwo.name="co_subcentro" then
	ll_pos=idc_subcentro.find("#1="+data,1,idc_subcentro.rowCount())
	If ll_pos>0 Then
		SetItem(row,"cde_subcentro",idc_subcentro.GetItemString(ll_pos,2))
	End If

	SetItem(Row,"co_recurso",ll_null)
	SetItem(row,"cde_recurso","")
	
End If

If dwo.name="co_recurso" Then
	ll_pos=idc_recurso.find("#1="+data,1,idc_recurso.rowCount())
	If ll_pos>0 Then
		SetItem(row,"cde_recurso",idc_recurso.GetItemString(ll_pos,2))
	End If
End If

If dwo.name="co_operacion" Then
	ll_pos=idc_operacion.find("#1="+data,1,idc_operacion.rowCount())
	If ll_pos>0 Then
		SetItem(row,"cde_operacion",idc_operacion.GetItemString(ll_pos,2))
	End If
End If


end event

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////
// Verifico si tiene cs_proref
// 
//////////////////////////////////////////////////////////////////////////
If Row=0 Then Return

long ll_orden,ll_pos,ll_fila

ll_fila=Row
il_recurso_adicional=GetItemNumber(Row,"cs_proref")

If IsNull(il_recurso_adicional) Then il_recurso_adicional=0

If il_recurso_adicional=0 Then
	ll_orden=GetItemNumber(Row,"orden_operacion")
	If of_verificar()<>1 then
		Return 
	End If
	If of_grabar()<>1 Then
		Return
	End If
	Retrieve(il_fabrica,il_linea,il_muestra,il_talla)
	of_descripcion()
	ll_pos=Find("orden_operacion="+String(ll_orden),1,RowCount())
	ll_fila=ll_pos
End If

n_cst_comun lo_comun

If ll_fila>0 Then
	il_recurso_adicional=GetItemNumber(ll_fila,"cs_proref")
	If IsNull(il_recurso_adicional) Then il_recurso_adicional=0

	SelectRow(0,False)
	SelectRow(ll_fila,True)
	
	dw_dt_m_proref_mues.Retrieve(il_recurso_adicional)
	of_descripcion1()
	lo_comun.of_loadDddw(idc_planta1,n_cst_application.itr_appl)
	lo_comun.of_loadDddw(idc_centro1,il_tipo_prod,n_cst_application.itr_appl)
End If


end event

event rowfocuschanged;call super::rowfocuschanged;Long ll_res
If ib_cambios1 Then
	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
   If ll_res=2 Then
		Return
	End If
End If
//////////////////////////////////////////////////////////////////////////
// Deselecciono las filas y limpio la bandera
// 
//////////////////////////////////////////////////////////////////////////


SelectRow(0,False)

ib_cambios1=False

dw_dt_m_proref_mues.Reset()
end event

event ue_dwnprocessenter;if this.AcceptText() < 0 then
  Return 1
end if
//co_recurso
if this.GetColumn() = 11 then
 if this.GetRow() = this.RowCount() then
	PostEvent("ue_insertrow")
   Return 1
 end if
end if

Send(Handle(this),256,9,Long(0,0))
return 1

end event

type dw_muestra from u_dw_application within w_mano_obra_mues
integer x = 50
integer y = 64
integer width = 3419
integer height = 180
string dataobject = "d_head_mo_muestra"
boolean vscrollbar = false
end type

event getfocus;call super::getfocus;gb_referencia.of_color(True)
end event

event losefocus;call super::losefocus;gb_referencia.of_color(False)
end event

event itemchanged;call super::itemchanged;long ll_dato,ll_res
n_cst_comun lo_c

String ls_dato

If il_err_item_change<>0 Then
	Return 2
End If

If dw_operaciones.RowCount()>0 Then
	MessageBox("Advertencia!","No se pueden cambiar datos, porque existe detalle.",StopSign!)
	Return 2
End If

If dwo.name="co_fabrica" Then
	il_fabrica=Long(Data)
	of_nombreMuestra()
End If

If dwo.name="co_linea" Then
	il_linea=Long(Data)
	of_nombreMuestra()
End If

If dwo.name="co_muestra" Then
	il_muestra=Long(Data)
	of_nombreMuestra()

End If

If dwo.name="co_talla" Then
	il_talla=Long(Data)
End If

Of_existe(0)
end event

event ue_insertrow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 22 de Enero de 2003 HORA 09:00:30:015
// 
// 
//////////////////////////////////////////////////////////////////////////


long ll_res,ll_f
If ib_cambios Then
	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
	If ll_res=2 Then
		Return
	End If
End If

of_iniciar()

Super::Event ue_insertRow()

end event

event ue_deleterow;call super::ue_deleterow;If dw_operaciones.RowCount()>0 Then
	MessageBox("Advertencia!","No deben existir operaciones.",StopSign!)
	Return
End If

Super::Event ue_deleteRow()

end event

type gb_referencia from u_gb_base within w_mano_obra_mues
integer x = 18
integer y = 8
integer width = 3579
integer height = 256
integer taborder = 0
string text = "Muestra"
end type

type gb_operaciones from u_gb_base within w_mano_obra_mues
integer x = 18
integer y = 472
integer width = 3579
integer height = 708
integer taborder = 0
string text = "Operaciones"
end type

type gb_recurso_adicional from u_gb_base within w_mano_obra_mues
integer x = 18
integer y = 1180
integer width = 3579
integer height = 372
integer taborder = 30
string text = "Recursos adicionales"
end type

type gb_observaciones from u_gb_base within w_mano_obra_mues
integer x = 18
integer y = 1572
integer width = 3579
integer height = 456
integer taborder = 0
string text = "Observaciones"
end type

