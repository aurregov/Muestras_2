HA$PBExportHeader$w_mano_obra_ref_new.srw
$PBExportComments$Para administrar la mano de obra de las referencias en firme
forward
global type w_mano_obra_ref_new from w_sheet
end type
type dw_sp_cp_mo_printex from u_dw_application within w_mano_obra_ref_new
end type
type dw_operaciones_copia from u_dw_application within w_mano_obra_ref_new
end type
type dw_observaciones_copia from u_dw_application within w_mano_obra_ref_new
end type
type tab_1 from tab within w_mano_obra_ref_new
end type
type tabpage_operaciones from userobject within tab_1
end type
type dw_operaciones from u_dw_application within tabpage_operaciones
end type
type gb_operaciones from u_gb_base within tabpage_operaciones
end type
type tabpage_operaciones from userobject within tab_1
dw_operaciones dw_operaciones
gb_operaciones gb_operaciones
end type
type tabpage_observaciones from userobject within tab_1
end type
type dw_observaciones_60 from u_dw_application within tabpage_observaciones
end type
type gb_observaciones from u_gb_base within tabpage_observaciones
end type
type tabpage_observaciones from userobject within tab_1
dw_observaciones_60 dw_observaciones_60
gb_observaciones gb_observaciones
end type
type tabpage_teorica from userobject within tab_1
end type
type st_1 from statictext within tabpage_teorica
end type
type dw_cambio_reo_rec from u_dw_application within tabpage_teorica
end type
type dw_teorica from u_dw_application within tabpage_teorica
end type
type gb_1 from u_gb_base within tabpage_teorica
end type
type gb_2 from u_gb_base within tabpage_teorica
end type
type tabpage_teorica from userobject within tab_1
st_1 st_1
dw_cambio_reo_rec dw_cambio_reo_rec
dw_teorica dw_teorica
gb_1 gb_1
gb_2 gb_2
end type
type tabpage_printex from userobject within tab_1
end type
type dw_planta from u_dw_application within tabpage_printex
end type
type cb_1 from commandbutton within tabpage_printex
end type
type gb_3 from groupbox within tabpage_printex
end type
type tabpage_printex from userobject within tab_1
dw_planta dw_planta
cb_1 cb_1
gb_3 gb_3
end type
type tab_1 from tab within w_mano_obra_ref_new
tabpage_operaciones tabpage_operaciones
tabpage_observaciones tabpage_observaciones
tabpage_teorica tabpage_teorica
tabpage_printex tabpage_printex
end type
type dw_log_borradas from u_dw_application within w_mano_obra_ref_new
end type
type dw_observaciones from u_dw_application within w_mano_obra_ref_new
end type
type dw_referencia from u_dw_application within w_mano_obra_ref_new
end type
type gb_referencia from u_gb_base within w_mano_obra_ref_new
end type
end forward

global type w_mano_obra_ref_new from w_sheet
integer width = 3959
integer height = 7440
string title = "Mano de obra por referencia"
string menuname = "m_ref_firme"
boolean maxbox = true
windowstate windowstate = maximized!
event ue_copiar_mano_obra ( )
event ue_inf_mo_referencia ( )
dw_sp_cp_mo_printex dw_sp_cp_mo_printex
dw_operaciones_copia dw_operaciones_copia
dw_observaciones_copia dw_observaciones_copia
tab_1 tab_1
dw_log_borradas dw_log_borradas
dw_observaciones dw_observaciones
dw_referencia dw_referencia
gb_referencia gb_referencia
end type
global w_mano_obra_ref_new w_mano_obra_ref_new

type variables
DataWindowChild  idc_planta,idc_centro,idc_subcentro,idc_recurso,&
                 idc_centro1,idc_subcentro1,idc_recurso1,idc_planta1

long il_fabrica,il_linea,il_referencia,il_talla, &
     il_tipo_prod,il_calidad
	  
DateTime idt_ano_mes

String is_where,is_where_copia

long il_recurso_adicional=0

boolean ib_cambios,ib_cambioObservaciones
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
public function integer of_teorica (ref decimal a_teorica, ref long a_minutos, ref long a_segundos, ref long a_seg_solo, integer a_tipo)
public function integer of_recurso_teorica (long a_recurso, string a_de_recurso)
public function integer of_calculartiempo ()
end prototypes

event ue_copiar_mano_obra();////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 15 de Junio de 2005 HORA 09:05:33:703
// 
// Se habilita la opci$$HEX1$$f300$$ENDHEX$$n de hacer copia parcial de mano de obra de una referencia
// a otra
//////////////////////////////////////////////////////////////////////////

long   	ll_res,i,ll_grp_talla,ll_tot,j,ll_tot2,ll_res_obs
long 		ll_planta, ll_chk, ll_pos
String 	ls_obser,ls_filtro_centro,ls_subcentro,ls_operacion,ls_recurso,&
         ls_tmp
long  	ll_centro_autoriza[]
n_cst_param lou_param

u_dw_application ldw_tmp


long ll_operacion,ll_orden,ll_centro,ll_subcentro,ll_recurso,ll_pro_ori,&
     ll_pro_des, ll_prioridad


//If ib_cambios Then
//	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
//	If ll_res=2 Then
//		Return
//	End If
//End If
//
//ib_cambios=False

//ib_cambioobservaciones=False

lou_param.is_vector[1]=is_where
lou_param.is_vector[2]="COPIAR"

OpenWithParm(w_opc_ref,lou_param)

lou_param = Message.PowerObjectParm

If Not IsValid(lou_param) Then
	Return
End If

//////////////////////////////////////////////////////////////////////////
// Puede ser necesario utilizar los sinonimos si se copia de otra fabrica
// 
//////////////////////////////////////////////////////////////////////////


If lou_param.is_vector[2]="SINONIMO" Then
	dw_operaciones_copia.DataObject="d_m_preref1_sin"
	dw_observaciones_copia.DataObject="d_ob_m_proref1_sin"
Else
	dw_operaciones_copia.DataObject="d_m_preref1"
	dw_observaciones_copia.DataObject="d_ob_m_proref1"	
End If

dw_operaciones_copia.SetTransObject(n_cst_application.itr_appl)

long ll_fabrica,ll_linea,ll_referencia,ll_talla,ll_calidad,ll_tipo_prod

//////////////////////////////////////////////////////////////////////////
// Creo un datastore e inserto filas en blanco en los child para que no 
// pida los argumentos..
//////////////////////////////////////////////////////////////////////////

//dw_operaciones_copia.SetTransObject(n_cst_application.itr_appl)

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
//	OpenWithParm(w_sel_planat,il_fabrica)
//	
//	ll_planta=Message.DoubleParm
//	
//	If IsNull(ll_planta) Then ll_planta=0
//	
//	If ll_planta=0 Then
//		MessageBox("Advertencia!","No se pudo determinar la planta.",StopSign!)
//		Return
//	End If
	ll_planta=0
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
	
ll_tot=dw_operaciones_copia.Retrieve(ll_fabrica,ll_linea,ll_referencia,ll_talla,ll_calidad)
If ll_tot<=0 Then
	MessageBox("Advertencia!","La referencia seleccionada no tiene parametrizada la mano de obra.",StopSign!)
	Return
End If
//////////////////////////////////////////////////////////////////////////
// Se crea un filtro para que el usuario solo vea operaciones de los 
// centros que tiene autorizados en el sistema
//////////////////////////////////////////////////////////////////////////
of_centroAutorizado(ll_centro_autoriza)

For i=1 To UpperBound(ll_centro_autoriza)
	ls_filtro_centro+="co_centro="+String(ll_centro_autoriza[i])+" or "
Next

ls_filtro_centro=mid(ls_filtro_centro,1, len(ls_filtro_centro) - 4)

dw_operaciones_copia.SetFilter(ls_filtro_centro)
dw_operaciones_copia.Filter()

ll_tot=dw_operaciones_copia.RowCount( )

OpenWithParm(w_operaciones_copia,dw_operaciones_copia)		  


ll_res_obs=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea copiar las observaciones ?",Question!,YesNo!,2)
//////////////////////////////////////////////////////////////////////////
// Ingreso las operaciones de la referencia recuperada
// 
//////////////////////////////////////////////////////////////////////////
ldw_tmp=tab_1.tabpage_operaciones.dw_operaciones

For i=1 to ll_tot
	ll_chk=dw_operaciones_copia.GetItemNumber(i,"chk")
//////////////////////////////////////////////////////////////////////////
// Solo se adicionan las operaciones seleccionadas y que no esten ya
// en la lista, para cuando no tiene nada todo se adiciona facilmente
//////////////////////////////////////////////////////////////////////////
	
	If ll_chk=1 Then
		ll_operacion=dw_operaciones_copia.GetItemNumber(i,"co_operacion")
		
		ll_pos=ldw_tmp.Find("co_operacion="+&
		String(ll_operacion),1,ldw_tmp.RowCount())
		
		If ll_pos=0 Then			
//////////////////////////////////////////////////////////////////////////
// Si es en la misma fabrica se copia exactamente la planta, en caso 
// contrario el usuarion la selecciono
//////////////////////////////////////////////////////////////////////////
			If ll_fabrica=il_fabrica Then
				ll_planta=dw_operaciones_copia.GetItemNumber(i,"co_planta")
			End If
			ll_centro=dw_operaciones_copia.GetItemNumber(i,"co_centro")
			ll_subcentro=dw_operaciones_copia.GetItemNumber(i,"co_subcentro")
			ll_recurso=dw_operaciones_copia.GetItemNumber(i,"co_recurso")
			
			ls_subcentro=dw_operaciones_copia.GetItemString(i,"cde_subcentro")
			ls_recurso  =dw_operaciones_copia.GetItemString(i,"cde_recurso")
			ls_operacion=dw_operaciones_copia.GetItemString(i,"cde_operacion")
			
			ll_pos=ldw_tmp.InsertRow(0)
			
			ldw_tmp.SetItem(ll_pos,"co_fabrica",il_fabrica)
			ldw_tmp.SetItem(ll_pos,"co_linea",il_linea)
			ldw_tmp.SetItem(ll_pos,"co_referencia",il_referencia)
			ldw_tmp.SetItem(ll_pos,"co_talla",il_talla)
			ldw_tmp.SetItem(ll_pos,"co_calidad",il_calidad)
			ldw_tmp.SetItem(ll_pos,"co_operacion",ll_operacion)
			
			If ll_planta<>0 Then
				ldw_tmp.SetItem(ll_pos,"co_planta",ll_planta)
			End If
			
			ldw_tmp.SetItem(ll_pos,"co_centro",ll_centro)
			ldw_tmp.SetItem(ll_pos,"co_subcentro",ll_subcentro)
			ldw_tmp.SetItem(ll_pos,"co_recurso",ll_recurso)
			
			ldw_tmp.SetItem(ll_pos,"cde_subcentro",ls_subcentro)
			ldw_tmp.SetItem(ll_pos,"cde_recurso",ls_recurso)
			ldw_tmp.SetItem(ll_pos,"cde_operacion",ls_operacion)
		End If	
	End If
Next

//////////////////////////////////////////////////////////////////////////
// Se copian las observaciones de mano de obra
// 
//////////////////////////////////////////////////////////////////////////

	
If ll_res_obs=1 Then
	dw_observaciones_copia.SetTransObject(n_cst_application.itr_appl)
	
	ll_tot=dw_observaciones_copia.Retrieve(ll_fabrica,&
	                                       ll_linea,&
														ll_referencia,&
														ll_talla,&
														ll_calidad)
														
														
	If ll_tot<=0 Then
		Return
	End If
	
	ls_obser=dw_observaciones_copia.GetItemString(1,"observacion")
	tab_1.tabpage_observaciones.dw_observaciones_60.Reset()
	For i=1 to 12
		ls_tmp=Trim(mid(ls_obser,60 * (i -1)+1,60))
		tab_1.tabpage_observaciones.dw_observaciones_60.InsertRow(0)
		tab_1.tabpage_observaciones.dw_observaciones_60.SetItem(i,1,ls_tmp)
	Next
	
	ib_cambioobservaciones=True
End If	

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!",&
"Recuerde ingresar el consecutivo (orden) de las operaciones copiadas,~n~r"+&
"esto se debe hacer con el objetivo de verficar la infomraci$$HEX1$$f300$$ENDHEX$$n copiada.",&
Information!)



//	  DELETE FROM ob_m_proref  
//			WHERE ( ob_m_proref.co_fabrica = :il_fabrica ) AND  
//					( ob_m_proref.co_linea = :il_linea ) AND  
//					( ob_m_proref.co_referencia = :il_referencia ) AND  
//					( ob_m_proref.co_talla = :il_talla ) AND  
//					( ob_m_proref.co_calidad = :il_calidad )   
//					  using n_cst_application.itr_appl ;
//						  
//			If n_cst_application.itr_appl.SQLcode=-1 Then 
//				PopulateError(20,"SQL Error")
//				n_cst_application.of_sql_error(n_cst_application.itr_appl)
//				Destroy lds_operacion
//				Destroy lds_proref
//				
//				Return
//			End If								  
///////////////////////////////////////////////////////////////////////////
//// Asigno la observacion de la referencia desde la cual se esta copiando
//// 
////////////////////////////////////////////////////////////////////////////
//	If lou_param.is_vector[2]="SINONIMO" Then
//		  SELECT ob_m_proref_sin.observacion  
//			 INTO :ls_obser  
//			 FROM ob_m_proref_sin  
//			WHERE ( ob_m_proref_sin.co_fabrica = :ll_fabrica ) AND  
//					( ob_m_proref_sin.co_linea = :ll_linea ) AND  
//					( ob_m_proref_sin.co_referencia = :ll_referencia ) AND  
//					( ob_m_proref_sin.co_talla = :ll_talla ) AND  
//					( ob_m_proref_sin.co_calidad = :ll_calidad )   
//					using n_cst_application.itr_appl ;
//
//				If n_cst_application.itr_appl.SQLcode=-1 Then 
//					PopulateError(20,"SQL Error")
//					n_cst_application.of_sql_error(n_cst_application.itr_appl)
//					Destroy lds_operacion
//					Destroy lds_proref
//					
//					Return
//				End If		
//				
//	ELSE
//		  SELECT ob_m_proref.observacion  
//			 INTO :ls_obser  
//			 FROM ob_m_proref  
//			WHERE ( ob_m_proref.co_fabrica = :ll_fabrica ) AND  
//					( ob_m_proref.co_linea = :ll_linea ) AND  
//					( ob_m_proref.co_referencia = :ll_referencia ) AND  
//					( ob_m_proref.co_talla = :ll_talla ) AND  
//					( ob_m_proref.co_calidad = :ll_calidad )   
//					using n_cst_application.itr_appl ;
//
//				If n_cst_application.itr_appl.SQLcode=-1 Then 
//					PopulateError(20,"SQL Error")
//					n_cst_application.of_sql_error(n_cst_application.itr_appl)
//					Destroy lds_operacion
//					Destroy lds_proref
//					
//					Return
//				End If				
//	End If
////////////////////////////////////////////////////////////////////////////
//// Solo si existia observaci$$HEX1$$f300$$ENDHEX$$n en la referencia desde la cual se esta copiando
//// se copia en este lugar
////////////////////////////////////////////////////////////////////////////
//
//			If n_cst_application.itr_appl.SQLcode=0 Then 
//				  INSERT INTO ob_m_proref  
//								( co_fabrica,   
//								  co_linea,   
//								  co_referencia,   
//								  co_talla,   
//								  co_calidad,   
//								  observacion)  
//					  VALUES ( :il_fabrica,   
//								  :il_linea,   
//								  :il_referencia,   
//								  :il_talla,   
//								  :il_calidad,   
//								  :ls_obser)  using n_cst_application.itr_appl ;
//				
//				
//				If n_cst_application.itr_appl.SQLcode=-1 Then 
//					PopulateError(20,"SQL Error")
//					n_cst_application.of_sql_error(n_cst_application.itr_appl)
//					Destroy lds_operacion
//					Destroy lds_proref
//					
//					Return
//				End If					
//		End If						
//End If
//
//Commit using n_cst_application.itr_appl ;
//
//of_recuperar()
//
//MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Informaci$$HEX1$$f300$$ENDHEX$$n copiada exitosamente.")
//

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

For i=1 To tab_1.tabpage_operaciones.dw_operaciones.RowCount()
	tab_1.tabpage_operaciones.dw_operaciones.SetItem(i,"orden_operacion",i)
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

n_cst_comun lo_comun

Return 1













end function

public function integer of_descripcion ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 22 de Octubre de 2002 HORA 08:09:33:125
// 
// Para colocar la descripci$$HEX1$$f300$$ENDHEX$$n de los campos ocultos
//////////////////////////////////////////////////////////////////////////
//
//long i,ll_tot,ll_centro,ll_subcentro,ll_recurso,ll_operacion
//
//String ls_des
//
//ll_tot=tab_1.tabpage_operaciones.dw_operaciones.rowCount()
//n_cst_comun lo_comun
//For i=1 to ll_tot
//	ll_centro=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i,"co_centro")
//	ll_subcentro=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i,"co_subcentro")
//	ll_recurso=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i,"co_recurso")
//	ll_operacion=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i,"co_operacion")
//	
//	lo_comun.of_nombreSubcentro(il_tipo_prod,ll_centro,ll_subcentro,n_cst_application.itr_appl)
//	ls_des=lo_comun.of_getString(1)
//	tab_1.tabpage_operaciones.dw_operaciones.SetItem(i,"cde_subcentro",ls_des)
//	
//	lo_comun.of_nombreRecurso(ll_recurso,il_tipo_prod,ll_centro,ll_subcentro,n_cst_application.itr_appl)
//	ls_des=lo_comun.of_getString(1)
//	
//	tab_1.tabpage_operaciones.dw_operaciones.SetItem(i,"cde_recurso",ls_des)
//	
//	lo_comun.of_nombreOperacion(il_tipo_prod,ll_operacion,n_cst_application.itr_appl)
//	ls_des=lo_comun.of_getString(1)
//	tab_1.tabpage_operaciones.dw_operaciones.SetItem(i,"cde_operacion",ls_des)
//Next
//
Return 1













end function

public function integer of_verificar ();If  tab_1.tabpage_operaciones.dw_operaciones.AcceptText()<>1 Then
	tab_1.selecttab(tab_1.tabpage_operaciones)
	MessageBox("Advertencia!","Informaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	Return -1
end If


If tab_1.tabpage_observaciones.dw_observaciones_60.AcceptText()<>1 Then
	tab_1.selecttab(tab_1.tabpage_observaciones)
	MessageBox("Advertencia!","Informaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida en observaciones.",StopSign!)
	Return -1
end If

If tab_1.tabpage_teorica.dw_teorica.AcceptText()<>1 Then
	tab_1.selecttab(tab_1.tabpage_teorica)
	MessageBox("Advertencia!","Informaci$$HEX1$$f300$$ENDHEX$$n de Te$$HEX1$$f300$$ENDHEX$$rica no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	Return -1
end If

If Not tab_1.tabpage_teorica.dw_teorica.of_completedata( ) Then
	tab_1.selecttab(tab_1.tabpage_teorica)
	//MessageBox("Advertencia!","Informaci$$HEX1$$f300$$ENDHEX$$n de Te$$HEX1$$f300$$ENDHEX$$rica no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	Return -1
end If


long i,ll_tot,ll_talla,ll_calidad,ll_centro1


For i=1 To tab_1.tabpage_operaciones.dw_operaciones.RowCount()
	ll_talla=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i,"co_talla")
	ll_calidad=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i,"co_calidad")
	If IsNull(ll_talla) And IsNull(ll_calidad) Then
		tab_1.tabpage_operaciones.dw_operaciones.DeleteRow(i)
		i -- 
	End If
Next

//////////////////////////////////////////////////////////////////////////
// Verifico los datos existentes
// 
//////////////////////////////////////////////////////////////////////////
long ll_operacion,ll_orden,ll_planta,ll_centro,ll_subcentro,ll_recurso
ll_tot=tab_1.tabpage_operaciones.dw_operaciones.rowCount()


tab_1.tabpage_operaciones.dw_operaciones.sort()

For i=1 To ll_tot
	ll_talla=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i,"co_talla")
	If IsNull(ll_talla) Then
		MessageBox("Advertencia!","Talla no v$$HEX1$$e100$$ENDHEX$$lida en fila "+String(i)+".",StopSign!)
		Return -1
	End If

	ll_calidad=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i,"co_calidad")

	If IsNull(ll_calidad) Then
		MessageBox("Advertencia!","Calidad no v$$HEX1$$e100$$ENDHEX$$lida en fila "+String(i)+".",StopSign!)
		Return -1
	End If

   ll_operacion=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i,"co_operacion")

	If IsNull(ll_operacion) Then
		MessageBox("Advertencia!","Operaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida en fila "+String(i)+".",StopSign!)
		Return -1
	End If
	
   ll_orden=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i,"orden_operacion")

	If IsNull(ll_orden) Then
		MessageBox("Advertencia!","Orden no v$$HEX1$$e100$$ENDHEX$$lida en fila "+String(i)+".",StopSign!)
		Return -1
	End If
	
   ll_planta=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i,"co_planta")

	If IsNull(ll_planta) Then
		MessageBox("Advertencia!","Planta no v$$HEX1$$e100$$ENDHEX$$lida en fila "+String(i)+".",StopSign!)
		Return -1
	End If

   ll_centro=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i,"co_centro")

	If IsNull(ll_centro) Then
		MessageBox("Advertencia!","Planta no v$$HEX1$$e100$$ENDHEX$$lida en fila "+String(i)+".",StopSign!)
		Return -1
	End If
	
   ll_subcentro=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i,"co_subcentro")

	If IsNull(ll_subcentro) Then
		MessageBox("Advertencia!","Subcentro no v$$HEX1$$e100$$ENDHEX$$lida en fila "+String(i)+".",StopSign!)
		Return -1
	End If

   ll_recurso=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i,"co_recurso")

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

tab_1.tabpage_operaciones.dw_operaciones.SetSort("co_operacion")
tab_1.tabpage_operaciones.dw_operaciones.Sort()

String ls_operacion
long ll_op,ll_op1
For i=1 To tab_1.tabpage_operaciones.dw_operaciones.RowCount()
	If i<tab_1.tabpage_operaciones.dw_operaciones.RowCount() Then
		ll_op=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i,"co_operacion")
		ll_op1=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i+1,"co_operacion")
		
		If ll_op=ll_op1 Then
			tab_1.tabpage_operaciones.dw_operaciones.SetSort("orden_operacion")
			tab_1.tabpage_operaciones.dw_operaciones.Sort()
			
			ls_operacion=Trim(tab_1.tabpage_operaciones.dw_operaciones.GetItemString(i,"cde_operacion"))
			
			MessageBox("Advertencia!","La operaci$$HEX1$$f300$$ENDHEX$$n "+ls_operacion+" est$$HEX2$$e1002000$$ENDHEX$$m$$HEX1$$e100$$ENDHEX$$s de una vez, por favor verifique",StopSign!)
			Return -1

		End If
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
tab_1.tabpage_operaciones.dw_operaciones.Reset()

dw_observaciones.Reset()
tab_1.tabpage_observaciones.dw_observaciones_60.Reset()

For i=1 to 12
	tab_1.tabpage_observaciones.dw_observaciones_60.InsertRow(0)
	tab_1.tabpage_observaciones.dw_observaciones_60.SetItem(i,1,"")
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


tab_1.tabpage_operaciones.dw_operaciones.Reset()


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

tab_1.tabpage_operaciones.dw_operaciones.Reset()



tab_1.tabpage_observaciones.dw_observaciones_60.Reset()

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

tab_1.tabpage_operaciones.dw_operaciones.SetSort("orden_operacion")
tab_1.tabpage_operaciones.dw_operaciones.Sort()

ll_tot=tab_1.tabpage_operaciones.dw_operaciones.Retrieve(il_fabrica,il_linea,il_referencia,il_talla,il_calidad)

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


ll_tot=tab_1.tabpage_teorica.dw_teorica.Retrieve(il_fabrica,il_linea,il_referencia,il_talla,il_calidad)

If ll_tot<0 Then
	MessageBox("Advertencia!","Error recuperando Te$$HEX1$$f300$$ENDHEX$$rica.",StopSign!)
	Return -1
End If

of_CalcularTiempo()



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
tab_1.tabpage_observaciones.dw_observaciones_60.Reset()
For i=1 to 12
	ls_tmp=Trim(mid(ls_obser,60 * (i -1)+1,60))
	tab_1.tabpage_observaciones.dw_observaciones_60.InsertRow(0)
	tab_1.tabpage_observaciones.dw_observaciones_60.SetItem(i,1,ls_tmp)
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




If tab_1.tabpage_observaciones.dw_observaciones_60.RowCount()<>12 Then
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

//////////////////////////////////////////////////////////////////////////
// Se registran las borradas en el log.
// Solicitud de Servicio 6731
//////////////////////////////////////////////////////////////////////////
If of_logBorradas()<>1 Then
	Return -1
End If

If tab_1.tabpage_operaciones.dw_operaciones.Update(True,False)<>1 Then
	Return -1
End If


tab_1.tabpage_teorica.dw_teorica.of_datosactualizacion(ldt_fecha /*datetime a_fecha*/,&
												                   ls_usuario/*string a_usuario*/,&
																		 ls_instancia/*string a_instancia */)

If tab_1.tabpage_teorica.dw_teorica.Update(True,False)<>1 Then
	Return -1
End If


If dw_log_borradas.Update(True,False)<>1 Then
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
		ls_tmp+=lo_c.of_espacios( tab_1.tabpage_observaciones.dw_observaciones_60.GetItemString(i,1),&
		                     60)
		
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

ll_tot=tab_1.tabpage_operaciones.dw_operaciones.deletedcount( )

dw_log_borradas.Reset()

For i=1 To ll_tot
	dw_log_borradas.InsertRow(0)
	ll_dato=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i,"co_fabrica",delete!,true)
	dw_log_borradas.SetItem(i,"co_fabrica",ll_dato)	
	
	ll_dato=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i,"co_linea",delete!,true)
	dw_log_borradas.SetItem(i,"co_linea",ll_dato)	
	
	ll_dato=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i,"co_referencia",delete!,true)
	dw_log_borradas.SetItem(i,"co_referencia",ll_dato)
	
	ll_dato=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i,"co_talla",delete!,true)
	dw_log_borradas.SetItem(i,"co_talla",ll_dato)	
	
	ll_dato=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i,"co_calidad",delete!,true)
	dw_log_borradas.SetItem(i,"co_calidad",ll_dato)	
	
	ll_dato=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i,"co_operacion",delete!,true)
	dw_log_borradas.SetItem(i,"co_operacion",ll_dato)	
	
	ll_dato=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i,"co_planta",delete!,true)
	dw_log_borradas.SetItem(i,"co_planta",ll_dato)	
	
	ll_dato=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i,"co_centro",delete!,true)
	dw_log_borradas.SetItem(i,"co_centro",ll_dato)	
	
	ll_dato=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i,"co_subcentro",delete!,true)
	dw_log_borradas.SetItem(i,"co_subcentro",ll_dato)	
	
	ll_dato=tab_1.tabpage_operaciones.dw_operaciones.GetItemNumber(i,"co_recurso",delete!,true)
	dw_log_borradas.SetItem(i,"co_recurso",ll_dato)	
	
	dw_log_borradas.SetItem(i,"programa","MUESTRAS")	
	dw_log_borradas.SetItem(i,"fe_actualizacion",ldt_fecha)	
	dw_log_borradas.SetItem(i,"usuario",ls_usuario)	
	dw_log_borradas.SetItem(i,"instancia",ls_instancia)	
	
	
Next



Return 1
end function

public function integer of_teorica (ref decimal a_teorica, ref long a_minutos, ref long a_segundos, ref long a_seg_solo, integer a_tipo);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Viernes 18 de Marzo de 2005 HORA 16:57:48:234
// 
// Para cuando se cambia la teorica
//////////////////////////////////////////////////////////////////////////
decimal{2} lde_teorica,lde_seg
long       ll_min,ll_seg,ll_seg_solo
If a_tipo=1 Then
	
	lde_seg=1200/a_teorica
	ll_seg_solo=Truncate(lde_seg,0)
	ll_min=Truncate(lde_seg/60,0)
	ll_seg=lde_seg - ll_min * 60
	
	a_minutos=ll_min
	a_segundos=ll_seg
	a_seg_solo=ll_seg_solo
ElseIf a_tipo=2 or a_tipo=3 Then

	lde_seg=a_segundos+a_minutos*60
	ll_seg_solo=Truncate(lde_seg,0)
	
	a_teorica=1200/lde_seg

	a_minutos=Truncate(lde_seg/60,0)
	a_segundos=lde_seg - a_minutos * 60
	a_seg_solo=ll_seg_solo
ElseIf a_tipo=4 Then 
	lde_seg=a_seg_solo
	
	ll_seg_solo=Truncate(lde_seg,0)
	
	a_teorica=1200/lde_seg

	a_minutos=Truncate(lde_seg/60,0)
	a_segundos=lde_seg - a_minutos * 60
	a_seg_solo=ll_seg_solo
	
End If

Return 1
end function

public function integer of_recurso_teorica (long a_recurso, string a_de_recurso);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Martes 22 de Marzo de 2005 HORA 08:46:34:062
// 
// Funci$$HEX1$$f300$$ENDHEX$$n para adicionar recursos en la teorica, si ya existe no hace nada
// cuando no existe ingresa el nuevo registro.
//////////////////////////////////////////////////////////////////////////
long ll_pos


ll_pos=tab_1.tabpage_teorica.dw_teorica.find("co_recurso="+String(a_recurso),&
       1,tab_1.tabpage_teorica.dw_teorica.RowCount())
		 


If ll_pos>0 Then
	Return 1
End If

ll_pos=tab_1.tabpage_teorica.dw_teorica.InsertRow(0)
tab_1.tabpage_teorica.dw_teorica.SetItem(ll_pos,"co_fabrica",il_fabrica)
tab_1.tabpage_teorica.dw_teorica.SetItem(ll_pos,"co_linea",il_linea)
tab_1.tabpage_teorica.dw_teorica.SetItem(ll_pos,"co_referencia",il_referencia)
tab_1.tabpage_teorica.dw_teorica.SetItem(ll_pos,"co_talla",il_talla)
tab_1.tabpage_teorica.dw_teorica.SetItem(ll_pos,"co_calidad",il_calidad)

tab_1.tabpage_teorica.dw_teorica.SetItem(ll_pos,"co_recurso",a_recurso)
tab_1.tabpage_teorica.dw_teorica.SetItem(ll_pos,"de_recurso",a_de_recurso)

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Este recurso no tiene te$$HEX1$$f300$$ENDHEX$$rica, recuerde ingresarla.")

		 
Return 1		 
end function

public function integer of_calculartiempo ();long i,ll_tot,ll_min,ll_seg,ll_solo_seg
decimal  lde_teorica

ll_tot=tab_1.tabpage_teorica.dw_teorica.RowCount()

For i=1 to ll_tot

	lde_teorica=tab_1.tabpage_teorica.dw_teorica.GetItemDecimal(i,"produccion_teo")
	
	of_teorica(lde_teorica /*ref decimal a_teorica*/,&
	           ll_min/*ref long a_minutos*/,&
				  ll_seg/*ref long a_segundos*/,&
				  ll_solo_seg/*ref long a_seg_solo*/,&
				  1/*integer a_tipo */)

	tab_1.tabpage_teorica.dw_teorica.SetItem(i,"minutos",ll_min)
	tab_1.tabpage_teorica.dw_teorica.SetItem(i,"segundos",ll_seg)
	tab_1.tabpage_teorica.dw_teorica.SetItem(i,"solo_seg",ll_solo_seg)
	
	tab_1.tabpage_teorica.dw_teorica.SetItemStatus(i,0,Primary!,NotModified!)
	
Next

Return 1
end function

on w_mano_obra_ref_new.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_ref_firme" then this.MenuID = create m_ref_firme
this.dw_sp_cp_mo_printex=create dw_sp_cp_mo_printex
this.dw_operaciones_copia=create dw_operaciones_copia
this.dw_observaciones_copia=create dw_observaciones_copia
this.tab_1=create tab_1
this.dw_log_borradas=create dw_log_borradas
this.dw_observaciones=create dw_observaciones
this.dw_referencia=create dw_referencia
this.gb_referencia=create gb_referencia
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_sp_cp_mo_printex
this.Control[iCurrent+2]=this.dw_operaciones_copia
this.Control[iCurrent+3]=this.dw_observaciones_copia
this.Control[iCurrent+4]=this.tab_1
this.Control[iCurrent+5]=this.dw_log_borradas
this.Control[iCurrent+6]=this.dw_observaciones
this.Control[iCurrent+7]=this.dw_referencia
this.Control[iCurrent+8]=this.gb_referencia
end on

on w_mano_obra_ref_new.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_sp_cp_mo_printex)
destroy(this.dw_operaciones_copia)
destroy(this.dw_observaciones_copia)
destroy(this.tab_1)
destroy(this.dw_log_borradas)
destroy(this.dw_observaciones)
destroy(this.dw_referencia)
destroy(this.gb_referencia)
end on

event open;call super::open;dw_sp_cp_mo_printex.SetTransObject(n_cst_application.itr_appl)

dw_referencia.SetTransObject(n_cst_application.itr_appl)

dw_observaciones.SetTransObject(n_cst_application.itr_appl)
dw_observaciones_copia.SetTransObject(n_cst_application.itr_appl)

tab_1.tabpage_operaciones.dw_operaciones.SetTransObject(n_cst_application.itr_appl)
dw_operaciones_copia.SetTransObject(n_cst_application.itr_appl)

tab_1.tabpage_teorica.dw_teorica.SetTransObject(n_cst_application.itr_appl)

tab_1.tabpage_teorica.dw_cambio_reo_rec.SetTransObject(n_cst_application.itr_appl)


dw_log_borradas.SetTransObject(n_cst_application.itr_appl)

tab_1.tabpage_operaciones.dw_operaciones.getChild("co_planta",idc_planta)
tab_1.tabpage_operaciones.dw_operaciones.getChild("co_centro",idc_centro)
tab_1.tabpage_operaciones.dw_operaciones.getChild("co_subcentro",idc_subcentro)
tab_1.tabpage_operaciones.dw_operaciones.getChild("co_recurso",idc_recurso)

idc_centro1.InsertRow(0)
idc_subcentro1.InsertRow(0)
idc_recurso1.InsertRow(0)
idc_planta1.InsertRow(0)

tab_1.tabpage_printex.dw_planta.insertRow(0)

//dw_referencia.getchild("co_talla",idc_talla)

//idc_talla.insertRow(0)

of_resetDddw()
end event

event ue_find;call super::ue_find;n_cst_param lou_param
Int    li_cliente,li_sucursal
String ls_tpped,ls_obser
long   ll_grp_talla,ll_res,ll_tot

If ib_cambios Then
	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
	If ll_res=2 Then
		Return
	End If
End If

ib_cambios=False
ib_cambioobservaciones=false

lou_param.is_vector[1]=is_where_copia
lou_param.is_vector[2]="BUSCAR"

OpenWithParm(w_opc_ref,lou_param)

lou_param = Message.PowerObjectParm



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
	RollBack using n_cst_application.itr_appl ;
	Return
End If

ib_cambios=False

Commit using n_cst_application.itr_appl ;

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Datos guardados con exito.")

of_recuperar()



end event

type dw_sp_cp_mo_printex from u_dw_application within w_mano_obra_ref_new
boolean visible = false
integer x = 1710
integer y = 1828
integer width = 544
integer height = 232
integer taborder = 60
string dataobject = "d_sp_cp_mo_printex"
boolean hscrollbar = true
end type

type dw_operaciones_copia from u_dw_application within w_mano_obra_ref_new
boolean visible = false
integer x = 837
integer y = 2132
integer width = 649
integer height = 232
integer taborder = 60
string dataobject = "d_m_preref2"
boolean hscrollbar = true
end type

type dw_observaciones_copia from u_dw_application within w_mano_obra_ref_new
boolean visible = false
integer x = 123
integer y = 2128
integer width = 649
integer height = 232
integer taborder = 60
string dataobject = "d_ob_m_proref"
boolean hscrollbar = true
end type

type tab_1 from tab within w_mano_obra_ref_new
event create ( )
event destroy ( )
integer x = 27
integer y = 264
integer width = 3566
integer height = 1468
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_operaciones tabpage_operaciones
tabpage_observaciones tabpage_observaciones
tabpage_teorica tabpage_teorica
tabpage_printex tabpage_printex
end type

on tab_1.create
this.tabpage_operaciones=create tabpage_operaciones
this.tabpage_observaciones=create tabpage_observaciones
this.tabpage_teorica=create tabpage_teorica
this.tabpage_printex=create tabpage_printex
this.Control[]={this.tabpage_operaciones,&
this.tabpage_observaciones,&
this.tabpage_teorica,&
this.tabpage_printex}
end on

on tab_1.destroy
destroy(this.tabpage_operaciones)
destroy(this.tabpage_observaciones)
destroy(this.tabpage_teorica)
destroy(this.tabpage_printex)
end on

type tabpage_operaciones from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3529
integer height = 1348
long backcolor = 80269524
string text = "Operaciones"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_operaciones dw_operaciones
gb_operaciones gb_operaciones
end type

on tabpage_operaciones.create
this.dw_operaciones=create dw_operaciones
this.gb_operaciones=create gb_operaciones
this.Control[]={this.dw_operaciones,&
this.gb_operaciones}
end on

on tabpage_operaciones.destroy
destroy(this.dw_operaciones)
destroy(this.gb_operaciones)
end on

type dw_operaciones from u_dw_application within tabpage_operaciones
integer x = 46
integer y = 60
integer width = 3433
integer height = 1260
integer taborder = 30
string dataobject = "d_m_preref"
boolean hscrollbar = true
end type

event getfocus;call super::getfocus;gb_operaciones.of_color(True)
end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Martes 14 de Junio de 2005 HORA 14:49:38:359
// 
// 
//////////////////////////////////////////////////////////////////////////
n_cst_comun lo_comun
long ll_null,ll_pos,ll_res,ll_centro,ll_subcentro,&
     ll_centro_autoriza[],&
	  ll_dato,ll_operacion

If il_err_item_change<>0 Then
	Return 2
End If



SetNull(ll_null)

If dwo.name="co_operacion" Then
	ll_centro=GetItemNumber(row,"co_centro")
	ll_subcentro=GetItemNumber(row,"co_subcentro")

	of_centroAutorizado(ll_centro_autoriza)
	
	ll_dato=long(data)
	
	ll_res=lo_comun.of_nombreOperacionCentro(il_tipo_prod /*long a_tipoprod*/,&
	                                         ll_dato/*long a_operacion*/,&
														  ll_centro/*long a_centro*/,&
														  ll_subcentro/*long a_subcentro*/,&
														  ll_centro_autoriza/*long a_centros_permiso*/,&
														  n_cst_application.itr_appl/*transaction a_transaction */)


	If ll_res<>1 Then
		MessageBox("Advertencia!","Operaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida o no es del centro adecuado.",StopSign!)
		Return 2
	End If
	SetItem(row,"cde_operacion",lo_comun.of_getString(1))
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

String lsde_recurso

If dwo.name="co_recurso" Then
	ll_operacion=GetItemNumber(row,"co_operacion")
	ll_dato=long(Data)
	ll_centro=GetItemNumber(row,"co_centro")
	ll_subcentro=GetItemNumber(row,"co_subcentro")

	If ll_centro=12 Then
		ll_res=lo_comun.of_nombrerecursotj(ll_dato /*long a_recurso*/,&
		                                   n_cst_application.itr_appl/*transaction a_transaction */)
		If ll_res<>1 Then
			MessageBox("Advertencia!","Recurso de tejido no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
			Return 2
		End If
	Else
		ll_res=lo_comun.of_nombrerecursopdn(il_tipo_prod /*long a_tipo_prod*/,&
		                                    ll_centro/*long a_centro*/,&
														ll_subcentro/*long a_subcentro*/,&
														ll_dato/*long a_recurso*/,&
														n_cst_application.itr_appl/*transaction a_transaction */)
		If ll_res<>1 Then
			MessageBox("Advertencia!","Recurso de producci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
			Return 2
		End If
	End If
	SetItem(row,"cde_recurso",lo_comun.of_getString(1))
//	If ll_operacion=1 Then
////////////////////////////////////////////////////////////////////////////
//// Si la operacion es tejido, se debe verificar si el recurso
//// tine teorica, sino se ingresa un registro en blanco.
////////////////////////////////////////////////////////////////////////////
//		of_recurso_teorica(long(data),lsde_recurso)	
//	End If
End If


ib_cambios=true
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


end event

event losefocus;call super::losefocus;gb_operaciones.of_color(False)
end event

event sqlpreview;call super::sqlpreview;//MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!",sqlsyntax)

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

event doubleclicked;call super::doubleclicked;long ll_centro,ll_subcentro,ll_centro_autoriza[],&
     ll_operacion

If Row=0 Then Return

//////////////////////////////////////////////////////////////////////////
//parametro en el que se env$$HEX1$$ed00$$ENDHEX$$a adicionalmente un vector 
// 
//////////////////////////////////////////////////////////////////////////


n_cst_param1 lo_param1

n_cst_param  lo_retorno,lo_param

DWObject ldwo_1

If dwo.name="co_operacion" Then
	
	ll_centro=GetItemNumber(row,"co_centro")
	ll_subcentro=GetItemNumber(row,"co_subcentro")

	of_centroAutorizado(ll_centro_autoriza)
	
	lo_param1.il_vector[1]=10 //tipoprod
	lo_param1.il_vector[2]=ll_centro
	lo_param1.il_vector[3]=ll_subcentro
	
	lo_param1.il_vector_centros=ll_centro_autoriza
	
	OpenWithParm(w_bus_operacion,lo_param1)
	
	lo_retorno=Message.PowerObjectParm
	
	If IsValid(lo_retorno) Then
		SetText(String(lo_retorno.il_vector[1]))
	End If

End If

//////////////////////////////////////////////////////////////////////////
// Si la operaci$$HEX1$$f300$$ENDHEX$$n es tejido (ll_centro=12), se deben mostrar los 
// recursos de tejido, sino se muestran los recursos de producci$$HEX1$$f300$$ENDHEX$$n.
//////////////////////////////////////////////////////////////////////////
If dwo.name="co_recurso" Then
	ll_centro=GetItemNumber(row,"co_centro")
	ll_subcentro=GetItemNumber(row,"co_subcentro")
	ll_operacion=GetItemNumber(row,"co_operacion")
	
	If ll_centro=12 Then
		Open(w_bus_m_recurso_tj)
		lo_retorno=Message.PowerObjectParm
	Else
		lo_param.il_vector[1]=il_tipo_prod
		lo_param.il_vector[2]=ll_centro
		lo_param.il_vector[3]=ll_subcentro

		OpenWithParm(w_bus_recurso_pdn_mo,lo_param)
		
		lo_retorno=Message.PowerObjectParm
	End If
	
	If IsValid(lo_retorno) Then
		SetText(String(lo_retorno.il_vector[1]))
	End If
		
End If

//If dwo.name="co_matiz_mp" Then
//	lo_param.il_vector[1]=GetItemNumber(row,"co_fabrica_mp")
//	lo_param.il_vector[2]=GetItemNumber(row,"co_producto_mp")
//	lo_param.il_vector[3]=GetItemNumber(row,"calidad_mp")
//	
//	OpenWithParm(w_matiz,lo_param)
//	
//	lo_param=Message.PowerObjectParm
//	
//	If IsValid(lo_param) Then
//		SetText(String(lo_param.il_vector[1]))
//	End If
//End If

end event

type gb_operaciones from u_gb_base within tabpage_operaciones
integer x = 14
integer width = 3502
integer height = 1336
integer taborder = 20
string text = "Operaciones"
end type

type tabpage_observaciones from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3529
integer height = 1348
long backcolor = 80269524
string text = "Observaciones"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_observaciones_60 dw_observaciones_60
gb_observaciones gb_observaciones
end type

on tabpage_observaciones.create
this.dw_observaciones_60=create dw_observaciones_60
this.gb_observaciones=create gb_observaciones
this.Control[]={this.dw_observaciones_60,&
this.gb_observaciones}
end on

on tabpage_observaciones.destroy
destroy(this.dw_observaciones_60)
destroy(this.gb_observaciones)
end on

type dw_observaciones_60 from u_dw_application within tabpage_observaciones
integer x = 87
integer y = 76
integer width = 3387
integer height = 864
integer taborder = 70
string dataobject = "d_ext_observaciones_60"
boolean livescroll = false
end type

event itemchanged;call super::itemchanged;If of_validarCadena(data)<>1 Then
	Return 2
End If
	
ib_cambioObservaciones=true
end event

type gb_observaciones from u_gb_base within tabpage_observaciones
integer x = 18
integer y = 28
integer width = 3511
integer height = 960
integer taborder = 60
string text = "Observaciones"
end type

type tabpage_teorica from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3529
integer height = 1348
long backcolor = 80269524
string text = "Producci$$HEX1$$f300$$ENDHEX$$n Te$$HEX1$$f300$$ENDHEX$$rica"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
st_1 st_1
dw_cambio_reo_rec dw_cambio_reo_rec
dw_teorica dw_teorica
gb_1 gb_1
gb_2 gb_2
end type

on tabpage_teorica.create
this.st_1=create st_1
this.dw_cambio_reo_rec=create dw_cambio_reo_rec
this.dw_teorica=create dw_teorica
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.st_1,&
this.dw_cambio_reo_rec,&
this.dw_teorica,&
this.gb_1,&
this.gb_2}
end on

on tabpage_teorica.destroy
destroy(this.st_1)
destroy(this.dw_cambio_reo_rec)
destroy(this.dw_teorica)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type st_1 from statictext within tabpage_teorica
integer x = 78
integer y = 732
integer width = 1509
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Doble Click para ver cambios realizados en la te$$HEX1$$f300$$ENDHEX$$rica de un recurso."
boolean focusrectangle = false
end type

type dw_cambio_reo_rec from u_dw_application within tabpage_teorica
integer x = 50
integer y = 908
integer width = 3319
integer height = 384
integer taborder = 70
string dataobject = "d_log_m_producc_teo"
boolean hscrollbar = true
end type

type dw_teorica from u_dw_application within tabpage_teorica
integer x = 50
integer y = 72
integer width = 3319
integer height = 624
integer taborder = 60
string dataobject = "d_m_producc_teo_ing"
boolean hscrollbar = true
end type

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Viernes 18 de Marzo de 2005 HORA 17:38:30:000
// 
// 
//////////////////////////////////////////////////////////////////////////



Decimal lde_produc,lde_seg
long ll_min,ll_seg,ll_seg_solo

lde_produc=GetItemDecimal(row,"produccion_teo")
ll_min=GetItemNumber(row,"minutos")
ll_seg=GetItemNumber(row,"segundos")
ll_seg_solo=GetItemNumber(row,"solo_seg")


If dwo.name="produccion_teo" Then
	lde_produc=Dec(Data)
	of_teorica(lde_produc /*ref decimal a_teorica*/,&
	           ll_min/*ref long a_minutos*/,&
				  ll_seg/*ref long a_segundos*/,&
				  ll_seg_solo/*ref long a_seg_solo*/,&
				  1/*integer a_tipo */)
	
End If

If dwo.name="segundos" Then
	ll_seg=long(Data)
	of_teorica(lde_produc /*ref decimal a_teorica*/,&
	           ll_min/*ref long a_minutos*/,&
				  ll_seg/*ref long a_segundos*/,&
				  ll_seg_solo/*ref long a_seg_solo*/,&
				  3/*integer a_tipo */)

End If

If dwo.name="minutos" Then
	ll_min=long(Data)
	of_teorica(lde_produc /*ref decimal a_teorica*/,&
	           ll_min/*ref long a_minutos*/,&
				  ll_seg/*ref long a_segundos*/,&
				  ll_seg_solo/*ref long a_seg_solo*/,&
				  2/*integer a_tipo */)

End If

If dwo.name="solo_seg" Then
	ll_seg_solo=Long(Data)
	of_teorica(lde_produc /*ref decimal a_teorica*/,&
	           ll_min/*ref long a_minutos*/,&
				  ll_seg/*ref long a_segundos*/,&
				  ll_seg_solo/*ref long a_seg_solo*/,&
				  4/*integer a_tipo */)

End If

SetItem(row,"produccion_teo",lde_produc)
SetItem(row,"minutos",ll_min)
SetItem(row,"segundos",ll_seg)
SetItem(row,"solo_seg",ll_seg_solo)


	
end event

event ue_deleterow;//
MessageBox("Advertencia!","No se pueden borrar registros de te$$HEX1$$f300$$ENDHEX$$rica.",StopSign!)
Return

end event

event ue_insertrow;//
MessageBox("Advertencia!","No se pueden ingresar registros de te$$HEX1$$f300$$ENDHEX$$rica.",StopSign!)


end event

event doubleclicked;call super::doubleclicked;long ll_recurso

If row=0 Then
	Return
End If

ll_recurso=GetItemNumber(row,"co_recurso")

dw_cambio_reo_rec.Retrieve(ll_recurso,&
                           il_fabrica,&
									il_linea,&
									il_referencia,&
									il_talla,&
									il_calidad)
									
SelectRow(0,False)
SelectRow(Row,True)



end event

event sqlpreview;call super::sqlpreview;//String ls_cadena
//
//ls_cadena=sqlsyntax
//
//clipboard(ls_cadena)
//
//messagebox("hola",ls_cadena)
end event

type gb_1 from u_gb_base within tabpage_teorica
integer x = 18
integer y = 24
integer width = 3483
integer height = 780
integer taborder = 50
string text = "Recursos adicionales"
end type

type gb_2 from u_gb_base within tabpage_teorica
integer x = 18
integer y = 840
integer width = 3483
integer height = 476
integer taborder = 60
string text = "Cambios en la producci$$HEX1$$f300$$ENDHEX$$n te$$HEX1$$f300$$ENDHEX$$rica de un mismo recurso"
end type

type tabpage_printex from userobject within tab_1
integer x = 18
integer y = 104
integer width = 3529
integer height = 1348
long backcolor = 80269524
string text = "Copia Printex"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_planta dw_planta
cb_1 cb_1
gb_3 gb_3
end type

on tabpage_printex.create
this.dw_planta=create dw_planta
this.cb_1=create cb_1
this.gb_3=create gb_3
this.Control[]={this.dw_planta,&
this.cb_1,&
this.gb_3}
end on

on tabpage_printex.destroy
destroy(this.dw_planta)
destroy(this.cb_1)
destroy(this.gb_3)
end on

type dw_planta from u_dw_application within tabpage_printex
integer x = 155
integer y = 100
integer width = 672
integer height = 208
integer taborder = 70
string dataobject = "d_ext_planta_printex"
boolean vscrollbar = false
boolean livescroll = false
end type

type cb_1 from commandbutton within tabpage_printex
integer x = 901
integer y = 152
integer width = 343
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "P&rintex"
end type

event clicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 06 de Julio de 2005 HORA 08:41:49:031
// 
// Numero de la Solicitud: SA-9905
// Copiar la mano de obra a Printex
//////////////////////////////////////////////////////////////////////////
long ll_res

If tab_1.tabpage_operaciones.dw_operaciones.RowCount()=0 Then
	MessageBox("Advertencia!","No hay operaciones para copiar.",StopSign!)
	Return
End If


If ib_cambios Then
	MessageBox("Advertencia!","Favor guardar los cambios antes de continuar.",StopSign!)
	Return
End If


ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea copiar la mano de obra de esta referencia a Printex ?",Question!,YesNo!,2)
If ll_res<>1 Then
	Return
End If

If dw_planta.AcceptText()<>1 Then
	Return 
	
End If

Long ll_planta

ll_planta=dw_planta.GetItemNumber(1,"co_planta")

If IsNull(ll_planta) Then
	MessageBox("Advertencia!","Planta no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	Return
End If

If ll_planta<=0  Then
	MessageBox("Advertencia!","Planta no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	Return
End If

ll_res=dw_sp_cp_mo_printex.Retrieve(il_fabrica,il_linea,il_referencia,il_talla,il_calidad,ll_planta)

If ll_res<=0 Then
	RollBack USING n_cst_application.itr_appl;
	MessageBox("Advertencia!","No fue posible copiar la mano de obra a Printex.",StopSign!)
	Return
End If

ll_res=dw_sp_cp_mo_printex.GetItemNumber(1,"cantidad")

Commit USING n_cst_application.itr_appl;
                    
MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Fueron copiadas "+string(ll_res)+" operaciones a printex.")








end event

type gb_3 from groupbox within tabpage_printex
integer x = 119
integer y = 40
integer width = 1239
integer height = 352
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Copiar mano de obra a Printex"
end type

type dw_log_borradas from u_dw_application within w_mano_obra_ref_new
boolean visible = false
integer x = 965
integer y = 1792
integer width = 649
integer height = 232
integer taborder = 60
string dataobject = "d_log_m_proref"
boolean hscrollbar = true
end type

type dw_observaciones from u_dw_application within w_mano_obra_ref_new
boolean visible = false
integer x = 18
integer y = 1816
integer width = 905
integer height = 200
integer taborder = 50
string dataobject = "d_ob_m_proref"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;call super::getfocus;tab_1.tabpage_observaciones.gb_observaciones.of_color(True)
end event

event losefocus;call super::losefocus;tab_1.tabpage_observaciones.gb_observaciones.of_color(False)
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

type dw_referencia from u_dw_application within w_mano_obra_ref_new
integer x = 50
integer y = 60
integer width = 3419
integer height = 156
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

event ue_deleterow;call super::ue_deleterow;If tab_1.tabpage_operaciones.dw_operaciones.RowCount()>0 Then
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

type gb_referencia from u_gb_base within w_mano_obra_ref_new
integer x = 18
integer y = 8
integer width = 3579
integer height = 232
integer taborder = 0
string text = "Referencia"
end type

