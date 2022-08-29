HA$PBExportHeader$w_mano_obra_ref_old.srw
$PBExportComments$Para administrar la mano de obra de las referencias en firme
forward
global type w_mano_obra_ref_old from w_sheet
end type
type dw_log_borradas from u_dw_application within w_mano_obra_ref_old
end type
type dw_observaciones_60 from u_dw_application within w_mano_obra_ref_old
end type
type dw_observaciones from u_dw_application within w_mano_obra_ref_old
end type
type st_1 from statictext within w_mano_obra_ref_old
end type
type dw_dt_m_proref from u_dw_application within w_mano_obra_ref_old
end type
type dw_operaciones from u_dw_application within w_mano_obra_ref_old
end type
type dw_referencia from u_dw_application within w_mano_obra_ref_old
end type
type gb_referencia from u_gb_base within w_mano_obra_ref_old
end type
type gb_operaciones from u_gb_base within w_mano_obra_ref_old
end type
type gb_recurso_adicional from u_gb_base within w_mano_obra_ref_old
end type
type gb_observaciones from u_gb_base within w_mano_obra_ref_old
end type
end forward

global type w_mano_obra_ref_old from w_sheet
integer width = 3639
integer height = 2040
string title = "Mano de obra por referencia"
string menuname = "m_ref_firme"
boolean maxbox = true
windowstate windowstate = maximized!
event ue_copiar_mano_obra ( )
event ue_inf_mo_referencia ( )
dw_log_borradas dw_log_borradas
dw_observaciones_60 dw_observaciones_60
dw_observaciones dw_observaciones
st_1 st_1
dw_dt_m_proref dw_dt_m_proref
dw_operaciones dw_operaciones
dw_referencia dw_referencia
gb_referencia gb_referencia
gb_operaciones gb_operaciones
gb_recurso_adicional gb_recurso_adicional
gb_observaciones gb_observaciones
end type
global w_mano_obra_ref_old w_mano_obra_ref_old

type variables
DataWindowChild  idc_planta,idc_centro,idc_subcentro,idc_recurso,&
                 idc_operacion,&
					  idc_centro1,idc_subcentro1,idc_recurso1,idc_planta1

long il_fabrica,il_linea,il_referencia,il_talla, &
     il_tipo_prod,il_calidad
	  
DateTime idt_ano_mes

String is_where,is_where_copia

long il_recurso_adicional=0

boolean ib_cambios,ib_cambios1,ib_cambioObservaciones
end variables

forward prototypes
public function integer of_ordenoperacion ()
public function integer of_centroautorizado (ref long a_centroautorizado[])
public function integer of_descripcion1 ()
public function integer of_descripcion ()
public function integer of_verificar ()
public function integer of_resetdddw ()
public function integer of_iniciar ()
public function integer of_nombrereferencia ()
public function integer of_resetdw ()
public function integer of_headmod (string a_columna)
public function integer of_recuperar ()
public function integer of_actualiza_dt_ref_elemento ()
public function integer of_grabar ()
public function integer of_logborradas ()
end prototypes

event ue_copiar_mano_obra();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE     
// Miercoles 30 de Octubre de 2002 HORA 17:39:56:656
// 
// Proceso para copiar la mano de obra de otra referencia
//////////////////////////////////////////////////////////////////////////
long ll_res,i,ll_grp_talla,ll_tot,j,ll_tot2,ll_res_obs
String ls_obser
n_cst_param lou_param

If dw_operaciones.RowCount()>0 Then
	MessageBox("Advertencia!","No se puede hacer la copia porque la referencia tiene operaciones.",StopSign!)
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

lou_param.is_vector[1]=is_where
lou_param.is_vector[2]="COPIAR"


OpenWithParm(w_opc_ref,lou_param)

lou_param = Message.PowerObjectParm


If Not IsValid(lou_param) Then
	Return
End If
n_ds_application lds_operacion,lds_proref
//////////////////////////////////////////////////////////////////////////
// Puede ser necesario utilizar los sinonimos si se copia de otra fabrica
// 
//////////////////////////////////////////////////////////////////////////

lds_operacion=Create n_ds_application

If lou_param.is_vector[2]="SINONIMO" Then
	lds_operacion.DataObject="d_m_preref1_sin"
	
Else
	lds_operacion.DataObject="d_m_preref1"
	
End If

dw_dt_m_proref.Reset()

DatawindowChild ldc_operacion,ldc_centro,ldc_subcentro,ldc_planta,ldc_recurso,&
                ldc_recurso1,ldc_planta1,ldc_centro1,ldc_subcentro1

long ll_fabrica,ll_linea,ll_referencia,ll_talla,ll_calidad,ll_tipo_prod



//////////////////////////////////////////////////////////////////////////
// Creo un datastore e inserto filas en blanco en los child para que no 
// pida los argumentos..
//////////////////////////////////////////////////////////////////////////

lds_operacion.SetTransObject(n_cst_application.itr_appl)


lds_proref=Create n_ds_application

lds_proref.DataObject=dw_dt_m_proref.DataObject
lds_proref.SetTransObject(n_cst_application.itr_appl)


lds_proref.getChild("co_recurso",ldc_recurso1)
ldc_recurso1.InsertRow(0)

lds_proref.getChild("co_planta",ldc_planta1)
ldc_planta1.InsertRow(0)

lds_proref.getChild("co_centro",ldc_centro1)
ldc_centro1.InsertRow(0)

lds_proref.getChild("co_subcentro",ldc_subcentro1)
ldc_subcentro1.InsertRow(0)





is_where=lou_param.is_vector[1]
	
ll_fabrica=lou_param.il_vector[1]
ll_linea=lou_param.il_vector[2]
ll_referencia=lou_param.il_vector[3]
ll_talla=lou_param.il_vector[4]
ll_calidad=lou_param.il_vector[5]
ll_tipo_prod=lou_param.il_vector[6]
	
If ll_tipo_prod<>il_tipo_prod then
	MessageBox("Advertencia!","No se puede hacer copia de mano de obra a referencias de diferente tipo de producto, por favor verifique",StopSign!)
	Return
End If


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

//	If dw_referencia.Retrieve(il_fabrica,il_linea,il_referencia)<=0 Then
//		dw_referencia.Reset()
//		dw_operaciones.Reset()
//		of_resetDddw()
//		Return
//	End If
//	
il_tipo_prod=dw_referencia.GetItemNumber(1,"co_tipoprod")
ll_grp_talla=dw_referencia.GetItemNumber(1,"co_grupo_tlla")
	
dw_referencia.SetItem(1,"co_talla",il_talla)
dw_referencia.SetItem(1,"co_calidad",il_calidad)
	
ll_tot=lds_operacion.Retrieve(ll_fabrica,ll_linea,ll_referencia,ll_talla,ll_calidad)
If ll_tot<=0 Then
	MessageBox("Advertencia!","La referencia seleccionada no tiene parametrizada la mano de obra.",StopSign!)
	Destroy lds_operacion
	Destroy lds_proref
	Return
End If

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
	
			  INSERT INTO m_proref  
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
				  VALUES ( :il_fabrica,   
							  :il_linea,   
							  :il_referencia,   
							  :il_talla,   
							  :il_calidad,   
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
		  SELECT m_proref.cs_proref  
			 INTO :ll_pro_des  
			 FROM m_proref  
			WHERE ( m_proref.co_fabrica = :il_fabrica ) AND  
					( m_proref.co_linea = :il_linea ) AND  
					( m_proref.co_referencia = :il_referencia ) AND  
					( m_proref.co_talla = :il_talla ) AND  
					( m_proref.co_calidad = :il_calidad )  and
					( m_proref.co_operacion = :ll_operacion )
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
/////////////////////////////////////////////////////////////////////////
// Inserto el registro en dt_m_proref
// 
//////////////////////////////////////////////////////////////////////////
				  INSERT INTO dt_m_proref  
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
	  DELETE FROM ob_m_proref  
			WHERE ( ob_m_proref.co_fabrica = :il_fabrica ) AND  
					( ob_m_proref.co_linea = :il_linea ) AND  
					( ob_m_proref.co_referencia = :il_referencia ) AND  
					( ob_m_proref.co_talla = :il_talla ) AND  
					( ob_m_proref.co_calidad = :il_calidad )   
					  using n_cst_application.itr_appl ;
						  
			If n_cst_application.itr_appl.SQLcode=-1 Then 
				PopulateError(20,"SQL Error")
				n_cst_application.of_sql_error(n_cst_application.itr_appl)
				Destroy lds_operacion
				Destroy lds_proref
				
				Return
			End If								  
/////////////////////////////////////////////////////////////////////////
// Asigno la observacion de la referencia desde la cual se esta copiando
// 
//////////////////////////////////////////////////////////////////////////
	If lou_param.is_vector[2]="SINONIMO" Then
		  SELECT ob_m_proref_sin.observacion  
			 INTO :ls_obser  
			 FROM ob_m_proref_sin  
			WHERE ( ob_m_proref_sin.co_fabrica = :ll_fabrica ) AND  
					( ob_m_proref_sin.co_linea = :ll_linea ) AND  
					( ob_m_proref_sin.co_referencia = :ll_referencia ) AND  
					( ob_m_proref_sin.co_talla = :ll_talla ) AND  
					( ob_m_proref_sin.co_calidad = :ll_calidad )   
					using n_cst_application.itr_appl ;

				If n_cst_application.itr_appl.SQLcode=-1 Then 
					PopulateError(20,"SQL Error")
					n_cst_application.of_sql_error(n_cst_application.itr_appl)
					Destroy lds_operacion
					Destroy lds_proref
					
					Return
				End If		
				
	ELSE
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
	End If
//////////////////////////////////////////////////////////////////////////
// Solo si existia observaci$$HEX1$$f300$$ENDHEX$$n en la referencia desde la cual se esta copiando
// se copia en este lugar
//////////////////////////////////////////////////////////////////////////

			If n_cst_application.itr_appl.SQLcode=0 Then 
				  INSERT INTO ob_m_proref  
								( co_fabrica,   
								  co_linea,   
								  co_referencia,   
								  co_talla,   
								  co_calidad,   
								  observacion)  
					  VALUES ( :il_fabrica,   
								  :il_linea,   
								  :il_referencia,   
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

event ue_inf_mo_referencia();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 14 de Noviembre de 2002 HORA 14:30:16:750
// 
// Para la mano de obra de una referencia
//////////////////////////////////////////////////////////////////////////
n_cst_param lo_param

lo_param.il_vector[1]=il_fabrica
lo_param.il_vector[2]=il_linea
lo_param.il_vector[3]=il_referencia

If il_talla=-1 Then
	MessageBox("Advertencia!","No se pudo determinar la talla.",StopSign!)
	Return
End If


OpenSheetWithParm(w_inf_mo_ref,lo_param,This.ParentWindow(),2,Original!)

end event

public function integer of_ordenoperacion ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 05 de Noviembre de 2002 HORA 08:18:49:328
// 
// Para colocar el orden de las operaciones cuando se hace un delete o 
// un insert
//////////////////////////////////////////////////////////////////////////
long i

For i=1 To dw_operaciones.RowCount()
	dw_operaciones.SetItem(i,"orden_operacion",i)
Next

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

public function integer of_descripcion1 ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 23 de Octubre de 2002 HORA 09:53:50:781
// 
// Para la descripci$$HEX1$$f300$$ENDHEX$$n en dt_m_proref
//////////////////////////////////////////////////////////////////////////


long i,ll_tot,ll_centro,ll_subcentro,ll_recurso

String ls_des

ll_tot=dw_dt_m_proref.rowCount()
n_cst_comun lo_comun
For i=1 to ll_tot
	ll_centro=dw_dt_m_proref.GetItemNumber(i,"co_centro")
	ll_subcentro=dw_dt_m_proref.GetItemNumber(i,"co_subcentro")
	ll_recurso=dw_dt_m_proref.GetItemNumber(i,"co_recurso")
	
	lo_comun.of_nombreSubcentro(il_tipo_prod,ll_centro,ll_subcentro,n_cst_application.itr_appl)
	ls_des=lo_comun.of_getString(1)
	dw_dt_m_proref.SetItem(i,"cde_subcentro",ls_des)
	
	lo_comun.of_nombreRecurso(ll_recurso,il_tipo_prod,ll_centro,ll_subcentro,n_cst_application.itr_appl)
	ls_des=lo_comun.of_getString(1)
	dw_dt_m_proref.SetItem(i,"cde_recurso",ls_des)
Next

Return 1













end function

public function integer of_descripcion ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 22 de Octubre de 2002 HORA 08:09:33:125
// 
// Para colocar la descripci$$HEX1$$f300$$ENDHEX$$n de los campos ocultos
//////////////////////////////////////////////////////////////////////////

long i,ll_tot,ll_centro,ll_subcentro,ll_recurso,ll_operacion

String ls_des

ll_tot=dw_operaciones.rowCount()
n_cst_comun lo_comun
For i=1 to ll_tot
	ll_centro=dw_operaciones.GetItemNumber(i,"co_centro")
	ll_subcentro=dw_operaciones.GetItemNumber(i,"co_subcentro")
	ll_recurso=dw_operaciones.GetItemNumber(i,"co_recurso")
	ll_operacion=dw_operaciones.GetItemNumber(i,"co_operacion")
	
	lo_comun.of_nombreSubcentro(il_tipo_prod,ll_centro,ll_subcentro,n_cst_application.itr_appl)
	ls_des=lo_comun.of_getString(1)
	dw_operaciones.SetItem(i,"cde_subcentro",ls_des)
	
	lo_comun.of_nombreRecurso(ll_recurso,il_tipo_prod,ll_centro,ll_subcentro,n_cst_application.itr_appl)
	ls_des=lo_comun.of_getString(1)
	
	dw_operaciones.SetItem(i,"cde_recurso",ls_des)
	
	lo_comun.of_nombreOperacion(il_tipo_prod,ll_operacion,n_cst_application.itr_appl)
	ls_des=lo_comun.of_getString(1)
	dw_operaciones.SetItem(i,"cde_operacion",ls_des)
Next

Return 1













end function

public function integer of_verificar ();If dw_operaciones.AcceptText()<>1 Then
	MessageBox("Advertencia!","Informaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	Return -1
end If

If dw_dt_m_proref.AcceptText()<>1 Then
	MessageBox("Advertencia!","Informaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida en adicionales.",StopSign!)
	Return -1
end If

If dw_observaciones_60.AcceptText()<>1 Then
	MessageBox("Advertencia!","Informaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida en observaciones.",StopSign!)
	Return -1
end If


long i,ll_tot,ll_talla,ll_calidad,ll_centro1


For i=1 To dw_operaciones.RowCount()
	ll_talla=dw_operaciones.GetItemNumber(i,"co_talla")
	ll_calidad=dw_operaciones.GetItemNumber(i,"co_calidad")
	If IsNull(ll_talla) And IsNull(ll_calidad) Then
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


dw_operaciones.sort()

For i=1 To ll_tot
	ll_talla=dw_operaciones.GetItemNumber(i,"co_talla")
	If IsNull(ll_talla) Then
		MessageBox("Advertencia!","Talla no v$$HEX1$$e100$$ENDHEX$$lida en fila "+String(i)+".",StopSign!)
		Return -1
	End If

	ll_calidad=dw_operaciones.GetItemNumber(i,"co_calidad")

	If IsNull(ll_calidad) Then
		MessageBox("Advertencia!","Calidad no v$$HEX1$$e100$$ENDHEX$$lida en fila "+String(i)+".",StopSign!)
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
//////////////////////////////////////////////////////////////////////////
// Verifoc que el centro tenga un orden parecido a "orden" que no
// pare primero por 52 y luego 32 por decir algo
//////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////
// Yolanda
// se quita el control por inconveniente en orden de centros con algunas++
// referencias existentes
// 28/6/2003 12:30
//////////////////////////////////////////////////////////////////////////

//   If i<ll_tot Then
//		ll_centro1=dw_operaciones.GetItemNumber(i+1,"co_centro")
//		If IsNull(ll_centro1) Then ll_centro1=99
//		If ll_centro>ll_centro1 Then
//			MessageBox("Advertencia!","El centro de la fila "+(String(i+1))+" no es v$$HEX1$$e100$$ENDHEX$$lido, o tiene un orden inadecuado.",StopSign!)
//			Return -1
//
//		End If
//	End If
	
	
Next
	

	
//////////////////////////////////////////////////////////////////////////
// Verifico que no se esten repitiendo operaciones
// 
//////////////////////////////////////////////////////////////////////////

dw_operaciones.SetSort("co_operacion")
dw_operaciones.Sort()

String ls_operacion
long ll_op,ll_op1
For i=1 To dw_operaciones.RowCount()
	If i<dw_operaciones.RowCount() Then
		ll_op=dw_operaciones.GetItemNumber(i,"co_operacion")
		ll_op1=dw_operaciones.GetItemNumber(i+1,"co_operacion")
		
		If ll_op=ll_op1 Then
			dw_operaciones.SetSort("orden_operacion")
			dw_operaciones.Sort()
			
			ls_operacion=Trim(dw_operaciones.GetItemString(i,"cde_operacion"))
			
			MessageBox("Advertencia!","La operaci$$HEX1$$f300$$ENDHEX$$n "+ls_operacion+" est$$HEX2$$e1002000$$ENDHEX$$m$$HEX1$$e100$$ENDHEX$$s de una vez, por favor verifique",StopSign!)
			Return -1

		End If
	End If
Next
	
	
	
For i=1 To dw_dt_m_proref.RowCount()
	ll_planta=dw_dt_m_proref.GetItemNumber(i,"co_planta")
	ll_centro=dw_dt_m_proref.GetItemNumber(i,"co_centro")
	If IsNull(ll_planta) And IsNull(ll_centro) Then
		dw_operaciones.DeleteRow(i)
		i -- 
	End If
Next



ll_tot=dw_dt_m_proref.rowCount()

For i=1 To ll_tot
   ll_planta=dw_dt_m_proref.GetItemNumber(i,"co_planta")

	If IsNull(ll_planta) Then
		MessageBox("Advertencia!","Planta no v$$HEX1$$e100$$ENDHEX$$lida en adicionales fila "+String(i)+".",StopSign!)
		Return -1
	End If

   ll_centro=dw_dt_m_proref.GetItemNumber(i,"co_centro")

	If IsNull(ll_centro) Then
		MessageBox("Advertencia!","Planta no v$$HEX1$$e100$$ENDHEX$$lida en adicionales fila "+String(i)+".",StopSign!)
		Return -1
	End If
	
   ll_subcentro=dw_dt_m_proref.GetItemNumber(i,"co_subcentro")

	If IsNull(ll_subcentro) Then
		MessageBox("Advertencia!","Subcentro no v$$HEX1$$e100$$ENDHEX$$lida en adiconales fila "+String(i)+".",StopSign!)
		Return -1
	End If

   ll_recurso=dw_dt_m_proref.GetItemNumber(i,"co_recurso")

	If IsNull(ll_recurso) Then
		MessageBox("Advertencia!","Recurso no v$$HEX1$$e100$$ENDHEX$$lida en adicionales fila "+String(i)+".",StopSign!)
		Return -1
	End If
	
Next
	



return 1	
	
	
	
	
	
	
	
	

end function

public function integer of_resetdddw ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 10 de Julio de 2003 HORA 11:46:48:765
// 
// 
//////////////////////////////////////////////////////////////////////////

idc_operacion.Reset()
idc_operacion.InsertRow(0)

idc_planta.reset()
idc_planta.InsertRow(0)


idc_centro.Reset()
idc_centro.InsertRow(0)

idc_recurso.Reset()
idc_recurso.InsertRow(0)

idc_subcentro.Reset()
idc_subcentro.InsertRow(0)



Return 1
end function

public function integer of_iniciar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 22 de Enero de 2003 HORA 14:07:45:296
// 
// 
//////////////////////////////////////////////////////////////////////////
long i

il_fabrica=-1
il_linea=-1
il_referencia=-1
il_talla=-1
il_calidad=1 //??

dw_referencia.Reset()
dw_operaciones.Reset()
dw_dt_m_proref.Reset()
dw_observaciones.Reset()
dw_observaciones_60.Reset()

For i=1 to 12
	dw_observaciones_60.InsertRow(0)
	dw_observaciones_60.SetItem(i,1,"")
Next

ib_cambios=False
//ib_cambio_observaciones=False

Return 1
end function

public function integer of_nombrereferencia ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 22 de Enero de 2003 HORA 12:00:49:406
// 
// 
//////////////////////////////////////////////////////////////////////////


dw_operaciones.Reset()
dw_dt_m_proref.Reset()

If il_fabrica=-1 or il_linea=-1 or il_referencia=-1 Then
	Return -1
End If

n_cst_comun lo_comun

long ll_res

ll_res=lo_comun.of_nombrereferencia(il_fabrica /*long a_fabrica*/,&
                                    il_linea/*long a_linea*/, &
												il_referencia/*long a_referencia*/, &
												n_cst_application.itr_appl/*transaction a_transaction */)
long ll_n

SetNull(ll_n)

If ll_res=1 Then
	dw_referencia.SetItem(1,"de_referencia",lo_comun.of_getString(1))
	il_tipo_prod=lo_comun.of_getLong(1)
Else
	dw_referencia.SetItem(1,"de_referencia","")
	il_tipo_prod=-1
End If

il_talla=-1

//lo_comun.of_loadDddw(idc_talla,il_fabrica,il_linea,il_referencia,1,n_cst_application.itr_appl)

Return 1
end function

public function integer of_resetdw ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 20 de Agosto de 2003 HORA 17:35:49:826
// 
// Limpia las dw
//////////////////////////////////////////////////////////////////////////

dw_operaciones.Reset()

dw_dt_m_proref.Reset()

dw_observaciones_60.Reset()

Return 1



end function

public function integer of_headmod (string a_columna);long ll_null
String ls_null

SetNUll(ll_null)

SetNull(ls_null)

of_resetDw()

CHOOSE CASE a_columna
	CASE "co_fabrica"
		dw_referencia.SetItem(1,"co_linea",ll_null)
		il_linea=-1
		dw_referencia.SetItem(1,"co_referencia",ll_null)
		il_referencia=-1
		dw_referencia.SetItem(1,"de_referencia",ls_null)
		
		il_calidad=1
		dw_referencia.SetItem(1,"co_calidad",1)
		
		dw_referencia.SetItem(1,"co_talla",ll_null)
		il_talla=-1
		dw_referencia.SetItem(1,"de_talla",ls_null)
	
	CASE "co_linea"
		//dw_referencia.SetItem(1,"co_linea",ll_null)
		//il_linea=-1
		dw_referencia.SetItem(1,"co_referencia",ll_null)
		il_referencia=-1
		dw_referencia.SetItem(1,"de_referencia",ls_null)
		
		il_calidad=1
		dw_referencia.SetItem(1,"co_calidad",1)
		
		dw_referencia.SetItem(1,"co_talla",ll_null)
		il_talla=-1
		dw_referencia.SetItem(1,"de_talla",ls_null)

   CASE "co_referencia"
		//dw_referencia.SetItem(1,"co_linea",ll_null)
		//il_linea=-1
		//dw_referencia.SetItem(1,"co_referencia",ll_null)
		//il_referencia=-1
		//dw_referencia.SetItem(1,"de_referencia",ls_null)
		
		il_calidad=1
		dw_referencia.SetItem(1,"co_calidad",1)
		
		dw_referencia.SetItem(1,"co_talla",ll_null)
		il_talla=-1
		dw_referencia.SetItem(1,"de_talla",ls_null)


	CASE "co_calidad"
//		dw_referencia.SetItem(1,"co_linea",ll_null)
//		il_linea=-1
//		dw_referencia.SetItem(1,"co_referencia",ll_null)
//		il_referencia=-1
//		dw_referencia.SetItem(1,"de_referencia",ls_null)
//		
//		il_calidad=1
//		dw_referencia.SetItem(1,"co_calidad",1)
		
		dw_referencia.SetItem(1,"co_talla",ll_null)
		il_talla=-1
		dw_referencia.SetItem(1,"de_talla",ls_null)
END CHOOSE



Return 1
end function

public function integer of_recuperar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 31 de Octubre de 2002 HORA 08:16:41:343
// 
// Recupera los datos en pantalla
//////////////////////////////////////////////////////////////////////////
n_cst_comun 	lo_comun
long 				i,ll_tot,ll_grp_talla,ll_res
String 			ls_obser,ls_tmp

dw_referencia.reset()

dw_referencia.InsertRow(0)

dw_referencia.setItem(1,"co_fabrica",il_fabrica)
dw_referencia.setItem(1,"co_linea",il_linea)
dw_referencia.setItem(1,"co_referencia",il_referencia)
dw_referencia.setItem(1,"co_calidad",il_calidad)
dw_referencia.setItem(1,"co_talla",il_talla)

//////////////////////////////////////////////////////////////////////////
// Actualiza descripcion de referencia y talla
// 
//////////////////////////////////////////////////////////////////////////
ll_res=lo_comun.of_nombreReferencia( il_fabrica,il_linea,il_referencia,&
       n_cst_application.itr_appl)
If ll_res=1 Then	
	dw_referencia.SetItem(1,"de_referencia",lo_comun.of_getString(1))
	il_tipo_prod=lo_comun.of_getLong(1)
End If


ll_res=lo_comun.of_nombrereferenciatalla(il_fabrica,&
                                         il_linea/*long a_linea*/,&
													  il_referencia/*long a_referencia*/,&
													  il_talla/*long a_talla*/,&
													  il_calidad/*long a_calidad*/,&
													  n_cst_application.itr_appl/*transaction a_transaction */)

If ll_res=1 Then
	dw_referencia.setItem(1,"de_talla",lo_comun.of_getString(1))
End If

dw_operaciones.SetSort("orden_operacion")
dw_operaciones.Sort()

ll_tot=dw_operaciones.Retrieve(il_fabrica,il_linea,il_referencia,il_talla,il_calidad)

If ll_tot<0 Then
	MessageBox("Advertencia!","Error recuperando datos.",StopSign!)
	Return -1
End If


of_descripcion()

If ll_tot=0 Then
	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea copiar la mano de obra de otra referencia ?",Question!,YesNo!,2)
	If ll_res=1 Then
		postEvent("ue_copiar_mano_obra")
	End If	
End If


ll_tot=dw_observaciones.Retrieve(il_fabrica,il_linea,il_referencia,il_talla,il_calidad)
If ll_tot<0 Then
	MessageBox("Advertencia!","Error recuperando datos.",StopSign!)
	Return -1
End If

If ll_tot=0 Then
	dw_observaciones.InsertRow(0)
	dw_observaciones.SetItem(1,"co_fabrica",il_fabrica)
	dw_observaciones.SetItem(1,"co_linea",il_linea)
	dw_observaciones.SetItem(1,"co_referencia",il_referencia)
	dw_observaciones.SetItem(1,"co_talla",il_talla)
	dw_observaciones.SetItem(1,"co_calidad",il_calidad)
End If
//////////////////////////////////////////////////////////////////////////
// Coloco los datos de las observaciones en el dw de varias l$$HEX1$$ed00$$ENDHEX$$neas
// 
//////////////////////////////////////////////////////////////////////////

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

//lo_comun.of_loadDddw( idc_talla, il_fabrica,il_linea,il_referencia,il_calidad,n_cst_application.itr_appl)

Return 1

end function

public function integer of_actualiza_dt_ref_elemento ();////////////////////////////////////////////////////////////////////////////
//// JUAN FERNANDO VASQUEZ DUQE 
//// Martes 22 de Octubre de 2002 HORA 14:19:50:875
//// 
//// ya este no se acutaliza por que se hace con un trigger
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

public function integer of_grabar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 30 de Enero de 2004 HORA 14:24:47:391
// 
// Almacena los datos en DB
//////////////////////////////////////////////////////////////////////////
DateTime ldt_fecha
String ls_usuario,ls_instancia

If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If




If dw_observaciones_60.RowCount()<>12 Then
	MessageBox("Advertencia!","Observaciones no v$$HEX1$$e100$$ENDHEX$$lidas.",StopSign!)
	Return -1
End If

n_cst_comun lo_c
n_ds_application lds_1
lds_1=Create n_ds_application
lds_1.DataObject="d_cierres_tj"
lds_1.SetTransObject(n_cst_application.itr_appl)

If lds_1.Retrieve()<>1 Then
	MessageBox("Advertencia!","No determino a$$HEX1$$f100$$ENDHEX$$o y/o mes contable.",StopSign!)
	Return -1
End If

idt_ano_mes=lds_1.GetItemDateTime(1,1)

//////////////////////////////////////////////////////////////////////////
// Se actualiza la tabla dt_ref_elemento y luego se llama un SP
// 
//////////////////////////////////////////////////////////////////////////


If of_actualiza_dt_ref_elemento()<>1 Then
	Return -1
End If

//////////////////////////////////////////////////////////////////////////
// Se registran las borradas en el log.
// Solicitud de Servicio 6731
//////////////////////////////////////////////////////////////////////////
If of_logBorradas()<>1 Then
	Return -1
End If

If dw_operaciones.Update()<>1 Then
	RollBack using n_cst_application.itr_appl ;
	Return -1
End If

If dw_dt_m_proref.Update()<>1 Then
	RollBack using n_cst_application.itr_appl ;
	Return -1
End If

If dw_log_borradas.Update()<>1 Then
	RollBack using n_cst_application.itr_appl ;
	Return -1
End If

//////////////////////////////////////////////////////////////////////////
// Si se ha realizado algun cambio en las observaciones se actualiza
// 
//////////////////////////////////////////////////////////////////////////

String ls_tmp
long i
If ib_cambioobservaciones	Then
	For i=1 to 12
		ls_tmp+=lo_c.of_espacios( dw_observaciones_60.GetItemString(i,1),&
		                     60)
		
	Next
	
	dw_observaciones.setItem(1,"observacion",ls_tmp)
	
	If dw_observaciones.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
		Return -1
	End If
	
	If dw_observaciones.Update()<>1 Then
		RollBack using n_cst_application.itr_appl ;
		Return -1
	End If
End If



Return 1
end function

public function integer of_logborradas ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Viernes 11 de Febrero de 2005 HORA 08:19:51:156
// 
// Se registran las borradas
// Solicitud de Servicio 6731
//////////////////////////////////////////////////////////////////////////
DateTime ldt_fecha
String ls_usuario,ls_instancia

If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If




long ll_tot,i,ll_dato

ll_tot=dw_operaciones.deletedcount( )

dw_log_borradas.Reset()

For i=1 To ll_tot
	dw_log_borradas.InsertRow(0)
	ll_dato=dw_operaciones.GetItemNumber(i,"co_fabrica",delete!,true)
	dw_log_borradas.SetItem(i,"co_fabrica",ll_dato)	
	
	ll_dato=dw_operaciones.GetItemNumber(i,"co_linea",delete!,true)
	dw_log_borradas.SetItem(i,"co_linea",ll_dato)	
	
	ll_dato=dw_operaciones.GetItemNumber(i,"co_referencia",delete!,true)
	dw_log_borradas.SetItem(i,"co_referencia",ll_dato)
	
	ll_dato=dw_operaciones.GetItemNumber(i,"co_talla",delete!,true)
	dw_log_borradas.SetItem(i,"co_talla",ll_dato)	
	
	ll_dato=dw_operaciones.GetItemNumber(i,"co_calidad",delete!,true)
	dw_log_borradas.SetItem(i,"co_calidad",ll_dato)	
	
	ll_dato=dw_operaciones.GetItemNumber(i,"co_operacion",delete!,true)
	dw_log_borradas.SetItem(i,"co_operacion",ll_dato)	
	
	ll_dato=dw_operaciones.GetItemNumber(i,"co_planta",delete!,true)
	dw_log_borradas.SetItem(i,"co_planta",ll_dato)	
	
	ll_dato=dw_operaciones.GetItemNumber(i,"co_centro",delete!,true)
	dw_log_borradas.SetItem(i,"co_centro",ll_dato)	
	
	ll_dato=dw_operaciones.GetItemNumber(i,"co_subcentro",delete!,true)
	dw_log_borradas.SetItem(i,"co_subcentro",ll_dato)	
	
	ll_dato=dw_operaciones.GetItemNumber(i,"co_recurso",delete!,true)
	dw_log_borradas.SetItem(i,"co_recurso",ll_dato)	
	
	dw_log_borradas.SetItem(i,"programa","MUESTRAS")	
	dw_log_borradas.SetItem(i,"fe_actualizacion",ldt_fecha)	
	dw_log_borradas.SetItem(i,"usuario",ls_usuario)	
	dw_log_borradas.SetItem(i,"instancia",ls_instancia)	
	
	
Next



Return 1
end function

on w_mano_obra_ref_old.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_ref_firme" then this.MenuID = create m_ref_firme
this.dw_log_borradas=create dw_log_borradas
this.dw_observaciones_60=create dw_observaciones_60
this.dw_observaciones=create dw_observaciones
this.st_1=create st_1
this.dw_dt_m_proref=create dw_dt_m_proref
this.dw_operaciones=create dw_operaciones
this.dw_referencia=create dw_referencia
this.gb_referencia=create gb_referencia
this.gb_operaciones=create gb_operaciones
this.gb_recurso_adicional=create gb_recurso_adicional
this.gb_observaciones=create gb_observaciones
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_log_borradas
this.Control[iCurrent+2]=this.dw_observaciones_60
this.Control[iCurrent+3]=this.dw_observaciones
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.dw_dt_m_proref
this.Control[iCurrent+6]=this.dw_operaciones
this.Control[iCurrent+7]=this.dw_referencia
this.Control[iCurrent+8]=this.gb_referencia
this.Control[iCurrent+9]=this.gb_operaciones
this.Control[iCurrent+10]=this.gb_recurso_adicional
this.Control[iCurrent+11]=this.gb_observaciones
end on

on w_mano_obra_ref_old.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_log_borradas)
destroy(this.dw_observaciones_60)
destroy(this.dw_observaciones)
destroy(this.st_1)
destroy(this.dw_dt_m_proref)
destroy(this.dw_operaciones)
destroy(this.dw_referencia)
destroy(this.gb_referencia)
destroy(this.gb_operaciones)
destroy(this.gb_recurso_adicional)
destroy(this.gb_observaciones)
end on

event open;call super::open;dw_referencia.SetTransObject(n_cst_application.itr_appl)
dw_dt_m_proref.SetTransObject(n_cst_application.itr_appl)
dw_observaciones.SetTransObject(n_cst_application.itr_appl)
dw_operaciones.SetTransObject(n_cst_application.itr_appl)

dw_log_borradas.SetTransObject(n_cst_application.itr_appl)

dw_operaciones.getChild("co_planta",idc_planta)
dw_operaciones.getChild("co_centro",idc_centro)
dw_operaciones.getChild("co_subcentro",idc_subcentro)
dw_operaciones.getChild("co_recurso",idc_recurso)
dw_operaciones.getChild("co_operacion",idc_operacion)


dw_dt_m_proref.getChild("co_centro",idc_centro1)
dw_dt_m_proref.getChild("co_subcentro",idc_subcentro1)
dw_dt_m_proref.getChild("co_recurso",idc_recurso1)
dw_dt_m_proref.getChild("co_planta",idc_planta1)

idc_centro1.InsertRow(0)
idc_subcentro1.InsertRow(0)
idc_recurso1.InsertRow(0)
idc_planta1.InsertRow(0)

//dw_referencia.getchild("co_talla",idc_talla)

//idc_talla.insertRow(0)

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

lou_param.is_vector[1]=is_where_copia
lou_param.is_vector[2]="BUSCAR"

OpenWithParm(w_opc_ref,lou_param)

lou_param = Message.PowerObjectParm

dw_dt_m_proref.Reset()

If IsValid(lou_param) Then
	
	is_where_copia=lou_param.is_vector[1]
	
	il_fabrica=lou_param.il_vector[1]
	il_linea=lou_param.il_vector[2]
	il_referencia=lou_param.il_vector[3]
	il_talla=lou_param.il_vector[4]
	il_calidad=lou_param.il_vector[5]
	
	of_recuperar()
End If
















end event

event ue_save;call super::ue_save;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 22 de Octubre de 2002 HORA 10:15:01:812
// 
// Aca se almacena la informaci$$HEX1$$f300$$ENDHEX$$n
//////////////////////////////////////////////////////////////////////////
If of_verificar()<>1 Then
	Return
End If

If of_grabar()<>1 then
	Return
End If

ib_cambios=False
ib_cambios1=False

Commit using n_cst_application.itr_appl ;

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Datos guardados con exito.")

of_recuperar()



end event

type dw_log_borradas from u_dw_application within w_mano_obra_ref_old
boolean visible = false
integer x = 233
integer y = 1748
integer width = 649
integer height = 232
integer taborder = 60
string dataobject = "d_log_m_proref"
boolean hscrollbar = true
end type

type dw_observaciones_60 from u_dw_application within w_mano_obra_ref_old
integer x = 87
integer y = 1348
integer width = 3451
integer height = 356
integer taborder = 60
string dataobject = "d_ext_observaciones_60"
boolean livescroll = false
end type

event itemchanged;call super::itemchanged;If of_validarCadena(data)<>1 Then
	Return 2
End If
	
ib_cambioObservaciones=true
end event

type dw_observaciones from u_dw_application within w_mano_obra_ref_old
boolean visible = false
integer x = 87
integer y = 1224
integer width = 905
integer height = 200
integer taborder = 50
string dataobject = "d_ob_m_proref"
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

type st_1 from statictext within w_mano_obra_ref_old
integer x = 78
integer y = 884
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

type dw_dt_m_proref from u_dw_application within w_mano_obra_ref_old
integer x = 50
integer y = 1016
integer width = 3502
integer height = 272
integer taborder = 40
string dataobject = "d_dt_m_proref"
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
n_cst_comun lo_comun

long ll_centro,ll_subcentro

If dwo.name="co_subcentro" then
	ll_centro=GetItemNumber(row,"co_centro")
	lo_comun.of_loadDddw(idc_subcentro1,il_tipo_prod,ll_centro,n_cst_application.itr_appl)
End If

If dwo.name="co_recurso" Then
	ll_centro=GetItemNumber(row,"co_centro")
	ll_subcentro=GetItemNumber(row,"co_subcentro")
	lo_comun.of_loadDddw(idc_recurso1,il_tipo_prod,ll_centro,ll_subcentro,n_cst_application.itr_appl)
End If
ib_cambios=True

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

type dw_operaciones from u_dw_application within w_mano_obra_ref_old
integer x = 50
integer y = 320
integer width = 3515
integer height = 552
integer taborder = 20
string dataobject = "d_m_preref"
boolean hscrollbar = true
end type

event getfocus;call super::getfocus;gb_operaciones.of_color(True)
end event

event losefocus;call super::losefocus;gb_operaciones.of_color(False)
end event

event ue_insertrow;//////////////////////////////////////////////////////////////////////////
// coloco los datos que no se ven
// 
//////////////////////////////////////////////////////////////////////////
long ll_f

ll_f=GetRow()

If ll_f=RowCount() Then
	ll_f=InsertRow(0)
Else
	ll_f=InsertRow(ll_f)
End If

ScrollToRow(ll_f)

SetItem(ll_f,"co_fabrica",il_fabrica)
SetItem(ll_f,"co_linea",il_linea)
SetItem(ll_f,"co_referencia",il_referencia)
SetItem(ll_f,"co_talla",il_talla)
SetItem(ll_f,"co_calidad",il_calidad)

SetItem(ll_f,"orden_operacion",ll_f)

SetColumn("co_planta")

of_ordenOperacion()
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

End If








end event

event itemchanged;call super::itemchanged;If il_err_item_change<>0 Then
	Return 2
End If
long ll_null,ll_pos

SetNull(ll_null)

If dwo.name="co_operacion" Then
//////////////////////////////////////////////////////////////////////////
// No se pueden repetir operaciones
// 
//////////////////////////////////////////////////////////////////////////
//	ll_pos=find("co_operacion="+Data,1,RowCount())
//	If ll_pos>0 Then
//		MessageBox("Advertencia!","No puede tener m$$HEX1$$e100$$ENDHEX$$s de una vez esta operaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
//		Return 2
//	End If
//
	
	SetItem(row,"ccambio_operacion",1)
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

ib_cambios=true
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
	Retrieve(il_fabrica,il_linea,il_referencia,il_talla,il_calidad)
	ll_pos=Find("orden_operacion="+String(ll_orden),1,RowCount())
	ll_fila=ll_pos
End If

n_cst_comun lo_comun

If ll_fila>0 Then
	il_recurso_adicional=GetItemNumber(ll_fila,"cs_proref")
	If IsNull(il_recurso_adicional) Then il_recurso_adicional=0

	SelectRow(0,False)
	SelectRow(ll_fila,True)
	
	dw_dt_m_proref.Retrieve(il_recurso_adicional)
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

dw_dt_m_proref.Reset()
end event

event ue_deleterow;call super::ue_deleterow;
of_ordenOperacion()
end event

event ue_dwnprocessenter;if this.AcceptText() < 0 then
  Return 1
end if
//co_recurso
if this.GetColumn() = 11 then
 if this.GetRow() = this.RowCount() then
	TriggerEvent("ue_insertrow")
   Return 1
 end if
end if

Send(Handle(this),256,9,Long(0,0))
return 1

end event

event sqlpreview;call super::sqlpreview;//MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!",sqlsyntax)

end event

type dw_referencia from u_dw_application within w_mano_obra_ref_old
integer x = 50
integer y = 64
integer width = 3419
integer height = 180
string dataobject = "d_h_preref_mo"
boolean vscrollbar = false
end type

event getfocus;call super::getfocus;gb_referencia.of_color(True)
end event

event losefocus;gb_referencia.of_color(False)
end event

event itemchanged;call super::itemchanged;long ll_dato,ll_res,ll_pos
n_cst_comun lo_comun

String ls_dato

If il_err_item_change<>0 Then
	Return 2
End If

//If dw_operaciones.RowCount()>0 Then
//	MessageBox("Advertencia!","No se pueden cambiar datos, porque existe detalle.",StopSign!)
//	Return 2
//End If

//////////////////////////////////////////////////////////////////////////
// Los datos que se utilizan aca son parte de la clave primaria
// 
//////////////////////////////////////////////////////////////////////////
If ib_cambios Then
	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
	If ll_res=2 Then
		Return 2
	End If
	ib_cambios=False
End If

If dwo.name="co_fabrica" Then
	il_fabrica=Long(Data)
	of_headMod(dwo.name)
End If

If dwo.name="co_linea" Then
	il_linea=Long(Data)
	of_headMod(dwo.name)
End If

If dwo.name="co_referencia" Then
	il_referencia=long(Data)
	ll_res=lo_comun.of_nombreReferencia( il_fabrica,il_linea,il_referencia,n_cst_application.itr_appl)
	If ll_res=1 Then	
		SetItem(1,"de_referencia",lo_comun.of_getString(1))
		il_tipo_prod=lo_comun.of_getLong(1)
	Else
		il_referencia=-1
		MessageBox("Advertencia!","Referencia no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
	of_headMod(dwo.name)
End If

If dwo.name="co_calidad" Then
	il_calidad=Long(Data)
	of_headMod(dwo.name)
End If

If dwo.name="co_talla" Then
	il_talla=long(Data)
	ll_res=lo_comun.of_nombreReferenciaTalla( il_fabrica,il_linea,il_referencia,il_talla,il_calidad,&
	                                       n_cst_application.itr_appl)
	If ll_res=1 Then	
		SetItem(1,"de_talla",lo_comun.of_getString(1))
	Else
		il_talla=-1
		MessageBox("Advertencia!","Talla no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
	of_headMod(dwo.name)
	of_recuperar()
End If
end event

event ue_insertrow;long ll_res,ll_f
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

event doubleclicked;call super::doubleclicked;If Row=0 Then Return

n_cst_param lo_param

DWObject ldwo_1

If dwo.name="co_talla" Then
	lo_param.il_vector[1]=GetItemNumber(1,"co_fabrica")
	lo_param.il_vector[2]=GetItemNumber(1,"co_linea")
	lo_param.il_vector[3]=GetItemNumber(1,"co_referencia")
	lo_param.il_vector[4]=GetItemNumber(1,"co_calidad")
	
	OpenWithParm(w_bus_tallas_referencia,lo_param)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If
End If
end event

type gb_referencia from u_gb_base within w_mano_obra_ref_old
integer x = 18
integer y = 8
integer width = 3579
integer height = 256
integer taborder = 0
string text = "Referencia"
end type

type gb_operaciones from u_gb_base within w_mano_obra_ref_old
integer x = 18
integer y = 260
integer width = 3579
integer height = 708
integer taborder = 0
string text = "Operaciones"
end type

type gb_recurso_adicional from u_gb_base within w_mano_obra_ref_old
integer x = 18
integer y = 968
integer width = 3579
integer height = 328
integer taborder = 30
string text = "Recursos adicionales"
end type

type gb_observaciones from u_gb_base within w_mano_obra_ref_old
integer x = 18
integer y = 1300
integer width = 3579
integer height = 428
integer taborder = 0
string text = "Observaciones"
end type

