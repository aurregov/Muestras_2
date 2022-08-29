HA$PBExportHeader$w_medidas_referencia.srw
$PBExportComments$Para el menejo de medidas por referencia
forward
global type w_medidas_referencia from w_sheet
end type
type st_1 from statictext within w_medidas_referencia
end type
type dw_partes1 from u_dw_application within w_medidas_referencia
end type
type dw_detalle from u_dw_application within w_medidas_referencia
end type
type dw_referencia from u_dw_application within w_medidas_referencia
end type
type gb_referencia from u_gb_base within w_medidas_referencia
end type
type gb_1 from u_gb_base within w_medidas_referencia
end type
end forward

global type w_medidas_referencia from w_sheet
integer width = 3639
integer height = 1892
string title = "Medidas por referencias"
string menuname = "m_medidas_ref"
boolean maxbox = true
windowstate windowstate = maximized!
event ue_informe_referencia ( )
event ue_copiar_datos ( )
event ue_borrar_medidas ( )
event ue_teorica ( )
st_1 st_1
dw_partes1 dw_partes1
dw_detalle dw_detalle
dw_referencia dw_referencia
gb_referencia gb_referencia
gb_1 gb_1
end type
global w_medidas_referencia w_medidas_referencia

type variables
boolean ib_cambios

String is_where,is_where_copia

long il_fabrica,il_linea,il_referencia,il_talla,il_calidad
long il_tipoprod,il_recurso,il_diseno

DataWindowChild idc_parte_base,idc_talla, idc_parte_base11
end variables

forward prototypes
public function integer of_verificar ()
public function integer of_verpulgadas ()
public function integer of_iniciar ()
public function integer of_nombrereferencia ()
public function integer of_partesbase ()
public function integer of_recuperar ()
public function integer of_existe (integer a_mensaje)
public function integer of_actualizaborrados ()
public function integer of_grabar ()
end prototypes

event ue_informe_referencia();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 02 de Diciembre de 2002 HORA 12:02:14:578
// 
// El informe de las referencias
//////////////////////////////////////////////////////////////////////////

If ib_cambios Then
	MessageBox("Advertencia!","Existen cambios sin guardar, por favor verifique.",StopSign!)
	Return
End If


If dw_referencia.RowCount()=0 Then
	MessageBox("Advertencia!","Debe seleccionar una referencia.",StopSign!)
	Return
End If

If dw_detalle.RowCount()=0 Then
	MessageBox("Advertencia!","No existen medidas.",StopSign!)
	Return
End If

n_cst_param lo_param

lo_param.il_vector[1]=il_fabrica
lo_param.il_vector[2]=il_linea
lo_param.il_vector[3]=il_referencia
lo_param.il_vector[4]=il_talla
lo_param.il_vector[5]=il_calidad
lo_param.il_vector[6]=il_recurso
lo_param.il_vector[7]=il_diseno

OpenSheetWithParm(w_inf_referencia,lo_param,ParentWindow(),2,Original!)

end event

event ue_copiar_datos();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 09 de Diciembre de 2002 HORA 11:50:06:968
// 
// Para copiar los datos de otra referencia+recurso
//////////////////////////////////////////////////////////////////////////
n_cst_param lou_param

If of_existe(1)<>1 Then
	Return
End If

If dw_detalle.RowCount()>0 Then
	MessageBox("Advertencia!","La referencia tiene medidas, solo es posible hacer copia a referencias sin medidas.",StopSign!)
	Return
End If

//If dw_referencia.AcceptText()<>1 Then
//	Return
//End If
//
OpenWithParm(w_opc_ref_recurso,is_where_copia)


lou_param = Message.PowerObjectParm


If Not IsValid(lou_param) Then
	Return 
End If

long ll_fabrica,ll_linea,ll_referencia,ll_calidad,ll_recurso,ll_talla,ll_diseno
	
is_where_copia=lou_param.is_vector[1]
	
ll_fabrica=lou_param.il_vector[1]
ll_linea=lou_param.il_vector[2]
ll_referencia=lou_param.il_vector[3]
ll_talla=lou_param.il_vector[4]
ll_calidad=lou_param.il_vector[5]
ll_recurso=lou_param.il_vector[7]
ll_diseno=lou_param.il_vector[8]
	
n_ds_application lds_1

lds_1=create n_ds_application

lds_1.DataObject=dw_detalle.DataObject

lds_1.SetTransObject(n_cst_application.itr_appl)

//co_partebas
DataWindowChild ldc_1

lds_1.getChild("co_partebas",ldc_1)

n_cst_comun lo_comun

lo_comun.of_loaddddw(ldc_1,-1,n_cst_application.itr_appl)

long i,ll_tot

ll_tot=lds_1.Retrieve(ll_fabrica,ll_linea,ll_referencia,ll_talla,ll_calidad,ll_diseno,ll_recurso)

If ll_tot<=0 Then
	MessageBox("Advertencia!","No se han parametrizado las medidas para el recurso que seleccion$$HEX1$$f300$$ENDHEX$$.",StopSign!)
	Return
End If
dw_detalle.setRedraw(False)
lds_1.RowsCopy(1,ll_tot,Primary!,dw_detalle,1,Primary!)

For i=1 to ll_tot
	dw_detalle.setItem(i,"co_fabrica",il_fabrica)
	dw_detalle.setItem(i,"co_linea",il_linea)
	dw_detalle.setItem(i,"co_referencia",il_referencia)
	dw_detalle.setItem(i,"co_talla",il_talla)
	dw_detalle.setItem(i,"co_fabrica",il_fabrica)
	dw_detalle.setItem(i,"co_calidad",il_calidad)
	dw_detalle.setItem(i,"co_recurso",il_recurso)
	dw_detalle.setItem(i,"co_diseno",il_diseno)
Next

of_verPulgadas()

dw_detalle.SetRedraw(True)
end event

event ue_borrar_medidas();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 27 de Diciembre de 2002 HORA 09:36:12:281
// 
// Para borrar las medidas de una referencia
//////////////////////////////////////////////////////////////////////////
If dw_detalle.RowCount()=0 Then
	Return
End If
long ll_res

ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Esta seguro de borrar las medidas ?",Question!,YesNo!,2)
If ll_res=2 Then
	Return
End If

DO WHILE dw_detalle.RowCount()>0
	dw_detalle.DeleteRow(0)
LOOP

If of_grabar()<>1 Then
	Return
End If

dw_referencia.Reset()

Commit using n_cst_application.itr_appl ;

ib_cambios=False

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Las medidas se borraron satisfactoriamente.")



end event

event ue_teorica();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 08 de Agosto de 2003 HORA 08:47:11:822
// 
// Para el ingreso de la teoriaca de una referencia
//////////////////////////////////////////////////////////////////////////

n_cst_param lo_param


If il_recurso=-1 or il_fabrica=-1 or il_linea=-1 or il_referencia=-1 or &
   il_talla=-1 or il_calidad=-1 Then
	
	Return
	
End If

lo_param.il_vector[1]=il_recurso
lo_param.il_vector[2]=il_fabrica
lo_param.il_vector[3]=il_linea
lo_param.il_vector[4]=il_referencia
lo_param.il_vector[5]=il_talla
lo_param.il_vector[6]=il_calidad

Messagebox('Var','il_recurso='+String(il_recurso)+'~n'+&
'il_fabrica='+String(il_fabrica)+'~n'+&
'il_linea='+String(il_linea)+'~n'+&
'il_referencia='+String(il_referencia)+'~n'+&
'il_talla='+String(il_talla)+'~n'+&
'il_calidad='+String(il_calidad)+'~n')

OpenWithParm(w_teorica_referencia,lo_param)





end event

public function integer of_verificar ();If dw_detalle.accepttext()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

Return 1



end function

public function integer of_verpulgadas ();n_cst_comun lo_pulg
Long i


For i=1 to dw_detalle.RowCount()
	dw_detalle.SetItem(i,"ca_largo_pul",lo_pulg.of_mmToPulg(&
	dw_detalle.GetItemDecimal(i,"ca_largo")))	

	dw_detalle.SetItem(i,"ca_ancho_pul",lo_pulg.of_mmToPulg(&
	dw_detalle.GetItemDecimal(i,"ca_ancho")))	

	dw_detalle.SetItem(i,"ca_largo_sine_pul",lo_pulg.of_mmToPulg(&
	dw_detalle.GetItemDecimal(i,"ca_largo_sine")))	

	dw_detalle.SetItem(i,"ca_ancho_sine_pul",lo_pulg.of_mmToPulg(&
	dw_detalle.GetItemDecimal(i,"ca_ancho_sine")))	
	
	dw_detalle.SetItem(i,"ca_largo_repos_pul",lo_pulg.of_mmToPulg(&
	dw_detalle.GetItemDecimal(i,"ca_largo_repos")))	
	
	dw_detalle.SetItem(i,"ca_ancho_repos_pul",lo_pulg.of_mmToPulg(&
	dw_detalle.GetItemDecimal(i,"ca_ancho_repos")))	
	
	dw_detalle.SetItem(i,"ca_desperdicio_pul",lo_pulg.of_mmToPulg(&
	dw_detalle.GetItemDecimal(i,"ca_desperdicio")))	

	dw_detalle.SetItem(i,"ca_ancho_maq_pul",lo_pulg.of_mmToPulg(&
	dw_detalle.GetItemDecimal(i,"ca_ancho_maq")))		
	

 Next


Return 0
end function

public function integer of_iniciar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 21 de Marzo de 2003 HORA 16:48:30:046
// 
// 
//////////////////////////////////////////////////////////////////////////



il_fabrica=-1
il_linea=-1
il_referencia=-1
il_talla=-1
il_calidad=1
il_tipoProd=10
il_recurso=-1
il_diseno=-1

dw_referencia.Reset()
dw_detalle.Reset()
//.InsertRow(0)


ib_cambios=False

Return 1
end function

public function integer of_nombrereferencia ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 10 de Diciembre de 2002 HORA 08:26:47:109
// 
// Para colocar el nombre de la referencia
//////////////////////////////////////////////////////////////////////////

If il_fabrica=-1 or il_linea=-1 or il_referencia=-1 Then
	Return -1
End If

n_cst_comun lo_comun

long ll_res

ll_res=lo_comun.of_nombrereferencia(il_fabrica /*long a_fabrica*/,&
                                    il_linea/*long a_linea*/, &
												il_referencia/*long a_referencia*/, &
												n_cst_application.itr_appl/*transaction a_transaction */)



If ll_res=1 Then
	dw_referencia.SetItem(1,"de_referencia",lo_comun.of_getString(1))
	dw_referencia.SetItem(1,"co_tipoprod",lo_comun.of_getLong(1))
	il_tipoprod=lo_comun.of_getLong(1)
	lo_comun.of_loaddddw(idc_parte_base/*datawindowchild a_dw*/, &
	                     il_tipoProd/*long a_num1*/,&
								n_cst_application.itr_appl/*transaction a_transaction */)
	
		


Else
	dw_referencia.SetItem(1,"de_referencia","")
	il_tipoprod=-1
End If
long ll_n

SetNull(ll_n)

dw_referencia.SetItem(1,"co_talla",ll_n)
dw_referencia.SetItem(1,"co_recurso",ll_n)
dw_referencia.SetItem(1,"de_recurso_tejido","")

il_talla=-1
il_recurso=-1


Return 1
end function

public function integer of_partesbase ();long i,ll_tot,ll_cod,ll_clasificacion,ll_f

ll_tot=idc_parte_base.RowCount()

For i=1 To ll_tot
	
	ll_cod=idc_parte_base.GetItemNumber(i,"co_partebas")
	ll_clasificacion=idc_parte_base.GetItemNumber(i,"co_clasificacion")
	If not IsNull(ll_cod) and ll_clasificacion=1 Then
		
		ll_f=dw_detalle.InsertRow(0)
		dw_detalle.SetItem(ll_f,"co_fabrica",il_fabrica)
		dw_detalle.SetItem(ll_f,"co_linea",il_linea)
		dw_detalle.SetItem(ll_f,"co_referencia",il_referencia)
		dw_detalle.SetItem(ll_f,"co_tipoprod",il_tipoprod)
		dw_detalle.SetItem(ll_f,"co_calidad",il_calidad)
		dw_detalle.SetItem(ll_f,"co_partebas",ll_cod)
		dw_detalle.SetItem(ll_f,"co_talla",il_talla)
		dw_detalle.SetItem(ll_f,"co_recurso",il_recurso)
		dw_detalle.SetItem(ll_f,"co_diseno",il_diseno)
	End If
Next

Return 1




















end function

public function integer of_recuperar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 31 de Octubre de 2002 HORA 08:16:41:343
// 
// Recupera los datos en pantalla
//////////////////////////////////////////////////////////////////////////
long i

If dw_referencia.Retrieve(il_fabrica,il_linea,il_referencia)<=0 Then
	dw_referencia.Reset()
	dw_detalle.Reset()
	//of_resetDddw()
	Return 1
End If
String ls_obser,ls_tmp
long ll_tot,ll_res
n_cst_comun lo_comun

il_tipoProd=dw_referencia.GetItemNumber(1,"co_tipoprod")

dw_referencia.SetItem(1,"co_talla",il_talla)
dw_referencia.SetItem(1,"co_calidad",il_calidad)
dw_referencia.SetItem(1,"co_diseno",il_diseno)

ll_res=lo_comun.of_nombrediseno( il_fabrica,il_linea, il_referencia,il_talla,&
il_calidad, il_diseno,n_cst_application.itr_appl)

If ll_res=1 Then
	dw_referencia.SetItem(1,"de_diseno",lo_comun.of_getString(1))
End If
//////////////////////////////////////////////////////////////////////////
// coloco el nombre de la talla
// 
//////////////////////////////////////////////////////////////////////////
ll_res=lo_comun.of_nombrereferenciatalla(il_fabrica /*long a_fabrica*/,&
                                         il_linea/*long a_linea*/,&
													  il_referencia/*long a_referencia*/,&
													  il_talla/*long a_talla*/,&
													  il_calidad/*long a_calidad*/,&
													  n_cst_application.itr_appl/*transaction a_transaction */)
													  
If ll_res=1 Then
	dw_referencia.SetItem(1,"de_talla",lo_comun.of_getString(1))
End If
													  



dw_detalle.Retrieve(il_fabrica,il_linea,il_referencia,il_talla,il_calidad,il_diseno,il_recurso)

//////////////////////////////////////////////////////////////////////////
// Coloco la descripcion si son pulgadas
// 
//////////////////////////////////////////////////////////////////////////
of_verPulgadas()

//////////////////////////////////////////////////////////////////////////
// Se eliminan los espacios a la derecha en las observaciones
// 
//////////////////////////////////////////////////////////////////////////

For i=1 to dw_detalle.RowCount()

	String ls_dato
	
	ls_dato=dw_detalle.GetItemString(i,"de_observacion")
	ls_dato=trim(ls_dato)
	dw_detalle.SetItem(i,"de_observacion",ls_dato)
	dw_detalle.SetItemStatus(i,0,Primary!,NotModified!	)
	dw_detalle.SetItemStatus(i,"de_observacion",Primary!,NotModified!	)
 Next


//////////////////////////////////////////////////////////////////////////
// Ahora coloco el equivalente de las medidas en pulgadas
// 
//////////////////////////////////////////////////////////////////////////


lo_comun.of_loadDddw(idc_talla,il_fabrica,il_linea,il_referencia,il_calidad,n_cst_application.itr_appl)

lo_comun.of_loadDddw(idc_parte_base,il_tipoProd,n_cst_application.itr_appl)



//////////////////////////////////////////////////////////////////////////
// Coloco el nombre de recurso seleccionado en la ventana anterior
// 
//////////////////////////////////////////////////////////////////////////
dw_referencia.SetItem(1,"co_recurso",il_recurso)

ll_res=lo_comun.of_nombreRecursoTj(il_recurso,n_cst_application.itr_appl)

If ll_res=1 Then
	dw_referencia.SetItem(1,"de_recurso_tejido",lo_comun.of_getString(1))	
End If

Return 1

end function

public function integer of_existe (integer a_mensaje);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 10 de Diciembre de 2002 HORA 10:05:05:687
// 
// Para verificar si existen los datos
//////////////////////////////////////////////////////////////////////////
If dw_referencia.RowCount()=0 then
	MessageBox("Advertencia!","Debe especificar la referencia.",StopSign!)
	Return -1
End If


If il_fabrica=-1 Then
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

If il_referencia=-1 Then
	If a_mensaje=1 Then
		MessageBox("Advertencia!","Referencia no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	End If
	Return -1
End If

If il_talla=-1 Then
	If a_mensaje=1 Then
		MessageBox("Advertencia!","Talla no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	End If
	Return -1
End If

If il_calidad=-1 Then
	If a_mensaje=1 Then
		MessageBox("Advertencia!","Calidad no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	End If
	Return -1
End If


If il_recurso=-1 Then
	If a_mensaje=1 Then
		MessageBox("Advertencia!","Recurso no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
	End If
	Return -1
End If

If il_diseno=-1 Then
	If a_mensaje=1 Then
		MessageBox("Advertencia!","Dise$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
	End If
	Return -1
End If

String ls_des

ls_des=dw_referencia.GetItemString(1,"de_recurso_tejido")

If IsNull(ls_des) Then ls_des=""

If len(ls_des)=0 Then
	If a_mensaje=1 Then
		MessageBox("Advertencia!","Recurso no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
	End If		
	Return -1
End If

ls_des=dw_referencia.GetItemString(1,"de_referencia")

If IsNull(ls_des) Then ls_des=""

If len(ls_des)=0 Then
	If a_mensaje=1 Then
		MessageBox("Advertencia!","Referencia no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	End If		
	Return -1
End If

If a_mensaje=1 Then
	Return 1
End If
//////////////////////////////////////////////////////////////////////////
// Verifico si existen medidas para los datos seleccionados
// y pregunto si los quiere recuperar
//////////////////////////////////////////////////////////////////////////

long ll_cant

  SELECT count(*)  
    INTO :ll_cant  
    FROM dt_medidas_est_ref  
   WHERE ( dt_medidas_est_ref.co_centro = 12 ) AND  
         ( dt_medidas_est_ref.co_subcentro = 12 ) AND  
         ( dt_medidas_est_ref.co_recurso = :il_recurso ) AND  
         ( dt_medidas_est_ref.co_fabrica = :il_fabrica ) AND  
         ( dt_medidas_est_ref.co_linea = :il_linea ) AND  
         ( dt_medidas_est_ref.co_referencia = :il_referencia ) AND  
         ( dt_medidas_est_ref.co_talla = :il_talla ) AND  
         ( dt_medidas_est_ref.co_calidad = :il_calidad ) AND 
			( dt_medidas_est_ref.co_diseno = :il_diseno ) AND 
         ( dt_medidas_est_ref.co_tipoprod = :il_tipoprod ) 
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
		of_recuperar()
	End If
	
Else
	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea copiar las medidas de otra referencia ?",Question!,YesNo!,2)
	If ll_res=1 Then
		PostEvent("ue_copiar_datos")
	End If
End If

Return 1


end function

public function integer of_actualizaborrados ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 12 de Noviembre de 2003 HORA 14:20:07:831
// 
// Es necesario hacer un update antes del delete para los
// trigger que actualmente se estan manejando
//////////////////////////////////////////////////////////////////////////
long ll_tot,i
long ll_partebas

ll_tot=dw_detalle.deletedcount()


For i=1 To ll_tot
	ll_partebas=dw_detalle.GetItemNumber(i,"co_partebas",delete!,True)
	
//////////////////////////////////////////////////////////////////////////
// Se actualiza el dato de instancia
// 
//////////////////////////////////////////////////////////////////////////
	  UPDATE dt_medidas_est_ref  
     SET instancia = DBSERVERNAME
   WHERE ( dt_medidas_est_ref.co_centro = 12 ) AND  
         ( dt_medidas_est_ref.co_subcentro = 12 ) AND  
         ( dt_medidas_est_ref.co_recurso = :il_recurso ) AND  
         ( dt_medidas_est_ref.co_fabrica = :il_fabrica ) AND  
         ( dt_medidas_est_ref.co_linea = :il_linea ) AND  
         ( dt_medidas_est_ref.co_referencia = :il_referencia ) AND  
         ( dt_medidas_est_ref.co_talla = :il_talla ) AND  
         ( dt_medidas_est_ref.co_calidad = :il_calidad ) AND  
         ( dt_medidas_est_ref.co_diseno = :il_diseno ) AND  
         ( dt_medidas_est_ref.co_tipoprod = :il_tipoprod ) AND  
         ( dt_medidas_est_ref.co_partebas = :ll_partebas ) 
			using n_cst_application.itr_appl;

	If n_cst_application.itr_appl.SQLcode=-1 Then 
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(n_cst_application.itr_appl)
		Return -1
	End If


	
Next


Return 1
end function

public function integer of_grabar ();DateTime ldt_fecha
String ls_usuario,ls_instancia

If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If


If dw_detalle.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
	Return -1
End If

If of_actualizaborrados()<>1 Then
	MessageBox("Advertencia!","Datos no guardados.",StopSign!)
	Return -1
End If


If dw_detalle.Update()<>1 Then
	RollBack using n_cst_application.itr_appl ;
	Return -1
End If


Return 1
end function

on w_medidas_referencia.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_medidas_ref" then this.MenuID = create m_medidas_ref
this.st_1=create st_1
this.dw_partes1=create dw_partes1
this.dw_detalle=create dw_detalle
this.dw_referencia=create dw_referencia
this.gb_referencia=create gb_referencia
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.dw_partes1
this.Control[iCurrent+3]=this.dw_detalle
this.Control[iCurrent+4]=this.dw_referencia
this.Control[iCurrent+5]=this.gb_referencia
this.Control[iCurrent+6]=this.gb_1
end on

on w_medidas_referencia.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_1)
destroy(this.dw_partes1)
destroy(this.dw_detalle)
destroy(this.dw_referencia)
destroy(this.gb_referencia)
destroy(this.gb_1)
end on

event open;call super::open;n_cst_comun lo_comun

dw_referencia.SetTransObject(n_cst_application.itr_appl)
dw_detalle.SetTransObject(n_cst_application.itr_appl)

dw_detalle.GetChild("co_partebas",idc_parte_base)
lo_comun.of_loadDddw(idc_parte_base,-1,n_cst_application.itr_appl)

dw_partes1.GetChild("co_partebas",idc_parte_base11)
idc_parte_base.ShareData(idc_parte_base11)

dw_detalle.ShareData(dw_partes1)

dw_partes1.of_color("co_partebas",0)
dw_partes1.of_color("ca_largo",0)

dw_referencia.GetChild("talla",idc_talla)
lo_comun.of_loadDddw(idc_talla,-1,-1,-1,-1,n_cst_application.itr_appl)

//////////////////////////////////////////////////////////////////////////
// Inicializo las variables de instancia
// 
//////////////////////////////////////////////////////////////////////////

of_iniciar()
end event

event ue_find;call super::ue_find;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 25 de Noviembre de 2002 HORA 11:21:36:093
// 
// Recupera los datos existentes para permitirmodificar las medidas de
// la referencia
//////////////////////////////////////////////////////////////////////////

n_cst_param lou_param
Int    li_cliente,li_sucursal
String ls_tpped,ls_obser
long   ll_grp_talla,ll_res,ll_tot

If ib_cambios  Then
	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
	If ll_res=2 Then
		Return
	End If
End If

ib_cambios=False



OpenWithParm(w_opc_ref_recurso,is_where)

lou_param = Message.PowerObjectParm

dw_detalle.Reset()

If Not IsValid(lou_param) Then
	dw_referencia.Reset()
	dw_detalle.Reset()
	Return 
End If

is_where=lou_param.is_vector[1]

il_fabrica=lou_param.il_vector[1]
il_linea=lou_param.il_vector[2]
il_referencia=lou_param.il_vector[3]
il_talla=lou_param.il_vector[4]
il_calidad=lou_param.il_vector[5]
il_recurso=lou_param.il_vector[7]
il_diseno=lou_param.il_vector[8]

of_recuperar()


















end event

event ue_save;call super::ue_save;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 25 de Noviembre de 2002 HORA 12:22:39:906
// 
// Verifica y almacena los cambios realizados
//////////////////////////////////////////////////////////////////////////

MessageBox("Advertencia!","Actualmente se tiene una nueva versi$$HEX1$$f300$$ENDHEX$$n del sistema de medidas de de referencias.",StopSign!)
Return


//If of_verificar()<>1 Then
//	Return
//End If
//
//If of_grabar()<>1 then
//	Return
//End If
//
//Commit using n_cst_application.itr_appl ;
//
//ib_cambios=False
//
//MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","La informaci$$HEX1$$f300$$ENDHEX$$n se guardo satisfactoriamente.")
//
end event

type st_1 from statictext within w_medidas_referencia
integer x = 37
integer y = 1548
integer width = 1001
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "CTRL+T para actualizar la producci$$HEX1$$f300$$ENDHEX$$n te$$HEX1$$f300$$ENDHEX$$rica"
boolean focusrectangle = false
end type

type dw_partes1 from u_dw_application within w_medidas_referencia
integer x = 41
integer y = 340
integer width = 622
integer height = 1148
integer taborder = 30
boolean enabled = false
string dataobject = "d_dt_medidas_est_ref"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

type dw_detalle from u_dw_application within w_medidas_referencia
integer x = 672
integer y = 340
integer width = 2885
integer height = 1148
integer taborder = 20
string dataobject = "d_dt_medidas_est_ref"
boolean hscrollbar = true
boolean livescroll = false
end type

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 25 de Noviembre de 2002 HORA 11:50:15:953
// 
// Se crean todas las partes base en caso de que
// no existan
//////////////////////////////////////////////////////////////////////////

If dwo.name="co_partebas_t" Then
	
	If of_existe(1)<>1 Then
		Return
	End If
	
	If il_talla<0 Then
		MessageBox("Advertencia!","Debe especificar la talla.",StopSign!)
		Return
	End If		
	
	If RowCount()=0 Then
		of_partesBase()
	End If
End If

//If dwo.name="de_observacion" Then
//	If row>0 Then
//		String ls_dato
//		ls_dato=GetItemString(row,"de_observacion")
//		ls_dato=Trim(ls_Dato)
//		SetItem(row,"de_observacion",ls_dato)
//	End If
//End If
end event

event itemchanged;call super::itemchanged;n_cst_comun lo_pulg
String ls_cad,ls_col

ls_col=dwo.name

ls_cad=This.Describe(dwo.name+"_pul.X")

If ls_cad<>"!" Then
	SetItem(row,dwo.name+"_pul",lo_pulg.of_mmToPulg(Dec(Data)))
End If

If right(ls_col,4)="_pul" Then
	ls_col=mid(ls_col,1,len(ls_col) -4)
	SetItem(row,ls_col,lo_pulg.of_PulgTomm(Data))
End If


ib_cambios=true
end event

event ue_insertrow;If of_existe(1)<>1 Then
	Return
End If

long i

Super::Event ue_insertRow()

i=GetRow()

dw_detalle.SetItem(i,"co_fabrica",il_fabrica)
dw_detalle.SetItem(i,"co_linea",il_linea)
dw_detalle.SetItem(i,"co_referencia",il_referencia)
dw_detalle.SetItem(i,"co_calidad",il_calidad)
dw_detalle.SetItem(i,"co_tipoprod",il_tipoProd)
dw_detalle.SetItem(i,"co_talla",il_talla)
dw_detalle.SetItem(i,"co_recurso",il_recurso)
dw_detalle.SetItem(i,"co_diseno",il_diseno)

end event

event scrollvertical;call super::scrollvertical;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 31 de Enero de 2003 HORA 14:19:57:687
// 
// 
//////////////////////////////////////////////////////////////////////////

dw_partes1.Object.datawindow.verticalscrollposition = scrollpos
end event

event sqlpreview;call super::sqlpreview;//MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!",sqlsyntax)

end event

type dw_referencia from u_dw_application within w_medidas_referencia
integer x = 50
integer y = 64
integer width = 3511
integer height = 180
string dataobject = "d_h_preref"
boolean vscrollbar = false
end type

event getfocus;call super::getfocus;gb_referencia.of_color(True)
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

ll_f=GetRow()

This.SetItem(ll_f,"co_calidad",il_calidad)



end event

event itemchanged;call super::itemchanged;long ll_Dato
n_cst_comun lo_comun
long ll_res

If il_err_item_change<>0 Then 
	Return 2
End If

If dw_detalle.RowCount()>0 Then
	MessageBox("Advertencia!","No se pueden modificar datos porque existe detalle.",StopSign!)
	Return 2
End If


If dwo.name="co_fabrica" Then
	il_fabrica=Long(Data)
	of_nombreReferencia()
End If

If dwo.name="co_linea" Then
	il_linea=Long(Data)
	of_nombreReferencia()
End If

If dwo.name="co_referencia" Then
	il_referencia=Long(Data)
	of_nombreReferencia()
End If

If dwo.name="co_recurso" Then
	ll_dato=long(Data)
	ll_res=lo_comun.of_nombrerecursotj( ll_dato,n_cst_application.itr_appl)
	If ll_res<>1 Then
		MessageBox("Advertencia!","Recurso no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_recurso_tejido",lo_comun.of_getString(1))
	il_recurso=ll_dato
End If

If dwo.name="co_calidad" Then
	il_calidad=long(Data)
End If

If dwo.name="co_talla" Then
	il_talla=Long(Data)
	ll_res=lo_comun.of_nombrereferenciatalla( il_fabrica,il_linea /*long a_linea*/,&
	                                          il_referencia/*long a_referencia*/,&
															il_talla/*long a_talla*/,&
															il_calidad/*long a_calidad*/,&
															n_cst_application.itr_appl/*transaction a_transaction */)
															
	If ll_res<>1 Then
		il_talla=-1
		MessageBox("Advertencia!","Talla no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If

	SetItem(1,"de_talla",lo_comun.of_getString(1))
End If

If dwo.name="co_diseno" Then
	ll_dato=Long(Data)
	
	ll_res=lo_comun.of_nombrediseno(il_fabrica,il_linea, il_referencia,il_talla,&
	il_calidad,ll_dato,n_cst_application.itr_appl)
	
	If ll_res<>1 then
		MessageBox("Advertencia!","Dise$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If	
	SetItem(1,"de_diseno",lo_comun.of_getString(1))
	il_diseno=ll_dato
End If


of_existe(0)
end event

event losefocus;call super::losefocus;gb_referencia.of_color(False)
end event

event ue_deleterow;If dw_detalle.RowCount()>0 Then
	MessageBox("Advertencia!","No deben existir medidas.",StopSign!)
	Return
End If

Super::Event ue_deleteRow()


end event

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 21 de Marzo de 2003 HORA 16:19:24:421
// 
// Dise$$HEX1$$f100$$ENDHEX$$os de la referencia
//////////////////////////////////////////////////////////////////////////


If Row=0 Then 
	Return 
End If

n_cst_param lo_param


If dwo.name="co_diseno" Then
	lo_param.il_vector[1]=il_fabrica
	lo_param.il_vector[2]=il_linea
	lo_param.il_vector[3]=il_referencia
	lo_param.il_vector[4]=il_talla
	lo_param.il_vector[5]=il_calidad //calidad
	
	OpenWithParm(w_busins_m_disenos,lo_param)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
		SetItem(row,"de_diseno",lo_param.is_vector[1])
	End If
	
End If

If dwo.name="co_recurso" Then
	Open(w_bus_m_recurso_tj)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If
	
	
End If

If dwo.name="co_talla" Then

	//Messagebox('Var','il_fabrica='+String(il_fabrica)+'~n'+&
	//'il_linea='+String(il_linea)+'~n'+&
	//'il_referencia='+String(il_referencia)+'~n'+&
	//'il_calidad='+String(il_calidad)+'~n')	
		
	lo_param.il_vector[1]=il_fabrica
	lo_param.il_vector[2]=il_linea
	lo_param.il_vector[3]=il_referencia
	lo_param.il_vector[4]=il_calidad
	
	OpenWithParm(w_bus_tallas_referencia,lo_param)

	lo_param=Message.PowerObjectParm

	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If	
End If
	
end event

type gb_referencia from u_gb_base within w_medidas_referencia
integer x = 18
integer y = 8
integer width = 3579
integer height = 256
string text = "Referencia"
end type

type gb_1 from u_gb_base within w_medidas_referencia
integer x = 18
integer y = 280
integer width = 3579
integer height = 1252
integer taborder = 20
string text = "Medidas"
end type

