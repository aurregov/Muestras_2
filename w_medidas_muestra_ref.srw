HA$PBExportHeader$w_medidas_muestra_ref.srw
$PBExportComments$Para el menejo de medidas por referencia
forward
global type w_medidas_muestra_ref from w_sheet
end type
type dw_head_ref from u_dw_application within w_medidas_muestra_ref
end type
type tab_medidas from tab within w_medidas_muestra_ref
end type
type tabpage_1 from userobject within tab_medidas
end type
type cb_1 from commandbutton within tabpage_1
end type
type dw_validacion_est from u_dw_application within tabpage_1
end type
type dw_observacion from u_dw_application within tabpage_1
end type
type dw_medidas1 from u_dw_application within tabpage_1
end type
type tabpage_1 from userobject within tab_medidas
cb_1 cb_1
dw_validacion_est dw_validacion_est
dw_observacion dw_observacion
dw_medidas1 dw_medidas1
end type
type tabpage_2 from userobject within tab_medidas
end type
type cb_3 from commandbutton within tabpage_2
end type
type cb_2 from commandbutton within tabpage_2
end type
type dw_validacion from u_dw_application within tabpage_2
end type
type dw_med_rep from u_dw_application within tabpage_2
end type
type gb_1 from groupbox within tabpage_2
end type
type gb_2 from groupbox within tabpage_2
end type
type tabpage_2 from userobject within tab_medidas
cb_3 cb_3
cb_2 cb_2
dw_validacion dw_validacion
dw_med_rep dw_med_rep
gb_1 gb_1
gb_2 gb_2
end type
type tabpage_3 from userobject within tab_medidas
end type
type dw_teorica_mue from u_dw_application within tabpage_3
end type
type tabpage_3 from userobject within tab_medidas
dw_teorica_mue dw_teorica_mue
end type
type tab_medidas from tab within w_medidas_muestra_ref
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
type dw_partes1 from u_dw_application within w_medidas_muestra_ref
end type
type dw_detalle from u_dw_application within w_medidas_muestra_ref
end type
type dw_muestra from u_dw_application within w_medidas_muestra_ref
end type
type gb_referencia from u_gb_base within w_medidas_muestra_ref
end type
end forward

global type w_medidas_muestra_ref from w_sheet
integer width = 3744
integer height = 4140
string title = "Medidas por muestra"
string menuname = "m_medidas_mue"
boolean maxbox = true
windowstate windowstate = maximized!
event ue_copiar_datos ( )
event ue_borrar_medidas ( )
event ue_teorica ( )
event ue_informe_muestra ( )
event ue_ficha_tecnica ( )
dw_head_ref dw_head_ref
tab_medidas tab_medidas
dw_partes1 dw_partes1
dw_detalle dw_detalle
dw_muestra dw_muestra
gb_referencia gb_referencia
end type
global w_medidas_muestra_ref w_medidas_muestra_ref

type variables
boolean ib_cambios, ib_cambios_medReposadas = false

String is_where,is_where_copia

long il_fabrica,il_linea,il_muestra,il_talla,il_grupo_tlla,il_referencia,il_tipo_prod
long il_tipoprod,il_diseno,il_recurso=-1
long il_fabrica_ref ,il_linea_ref

DataWindowChild idc_parte_base,idc_parte_base11,idc_partebas

String is_usuario,is_dbase, is_tipo_muestra
datetime   idt_fecha
//2015-06-16 Solicitud: 51249 Ceiba/JJ
CONSTANT String MEDIDAS_MUESTRA = 'Medidas_Muestra'
end variables

forward prototypes
public function integer of_verificar ()
public function integer of_iniciar ()
public function integer of_verpulgadas ()
public function integer of_nombremuestra ()
public function integer of_partesbase ()
public function integer of_recuperar ()
public function integer of_existe (integer a_mensaje)
public function integer of_grabar ()
public function integer of_verificar_med_est ()
public function integer of_verificar_medidas (long al_row)
public function integer of_verificar_otro_recurso (integer a_mensaje)
public function long of_recuperar_diseno (ref long al_diseno)
public function long of_recurso_utilizado (ref long al_recurso, readonly long al_diseno)
public function integer of_diseno_automatico ()
public function integer of_verificar_borrado ()
public function long of_abrirventanaseleccionrecursosacopiar ()
end prototypes

event ue_copiar_datos();n_cst_param lou_param

If of_existe(1)<>1 Then
	Return
End If

If tab_medidas.tabpage_1.dw_medidas1.RowCount()>0 Then
	MessageBox("Advertencia!","La muestra tiene medidas, solo es posible hacer copia a muestra sin medidas.",StopSign!)
	Return
End If

OpenWithParm(w_opc_ref_recurso_bas_mue,is_where_copia)


lou_param = Message.PowerObjectParm


If Not IsValid(lou_param) Then
	Return 
End If

long ll_referencia, ll_fabrica,ll_linea,ll_muestra,ll_tipoprod,ll_recurso,ll_talla,ll_diseno,ll_grp_talla
	
is_where_copia=lou_param.is_vector[1]

ll_fabrica = lou_param.il_vector[1]
ll_linea   = lou_param.il_vector[2]
ll_referencia = lou_param.il_vector[3]
ll_talla=lou_param.il_vector[4]
ll_tipoprod=lou_param.il_vector[6]
ll_recurso=lou_param.il_vector[7]
ll_diseno=lou_param.il_vector[8]
ll_muestra = lou_param.il_vector[9]	
	
	
IF ll_talla <> il_talla THEN
	Messagebox("Advertencia","Para copiar las medidas la talla origen debe ser igual a la talla destino")
	Return 
END IF
	
n_ds_application lds_1

lds_1=create n_ds_application
lds_1.DataObject=tab_medidas.tabpage_1.dw_medidas1.DataObject
lds_1.SetTransObject(n_cst_application.itr_appl)

DataWindowChild ldc_1

lds_1.getChild("co_partebas",ldc_1)

n_cst_comun lo_comun

lo_comun.of_loaddddw(ldc_1,-1,n_cst_application.itr_appl)

long i,ll_tot

ll_tot = lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_diseno,ll_recurso)

If ll_tot<=0 Then
	MessageBox("Advertencia!","No se han parametrizado las medidas para el recurso que seleccion$$HEX1$$f300$$ENDHEX$$.",StopSign!)
	Return
End If
tab_medidas.tabpage_1.dw_medidas1.setRedraw(False)
lds_1.RowsCopy(1,ll_tot,Primary!,tab_medidas.tabpage_1.dw_medidas1,1,Primary!)

For i=1 to ll_tot
	tab_medidas.tabpage_1.dw_medidas1.setItem(i,"co_fabrica",il_fabrica)
	tab_medidas.tabpage_1.dw_medidas1.setItem(i,"co_linea",il_linea)
	tab_medidas.tabpage_1.dw_medidas1.setItem(i,"co_muestra",il_muestra)
	tab_medidas.tabpage_1.dw_medidas1.setItem(i,"co_diseno",il_diseno)
	tab_medidas.tabpage_1.dw_medidas1.setItem(i,"co_recurso",il_recurso)
Next

/////////////////////////////////////////////////
//Medidas Reposadas
/////////////////////////////////////////////////
lds_1=create n_ds_application
lds_1.DataObject = tab_medidas.tabpage_2.dw_med_rep.DataObject
lds_1.SetTransObject(n_cst_application.itr_appl)

ll_tot = lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_recurso,ll_diseno)

If ll_tot<=0 Then
	MessageBox("Advertencia!","No se han parametrizado las medidas reposadas para el recurso que seleccion$$HEX1$$f300$$ENDHEX$$.",StopSign!)
	Return
End If
tab_medidas.tabpage_1.dw_medidas1.setRedraw(False)
lds_1.RowsCopy(1,ll_tot,Primary!,tab_medidas.tabpage_2.dw_med_rep,1,Primary!)

For i=1 to ll_tot
	tab_medidas.tabpage_2.dw_med_rep.setItem(i,"co_fabrica",il_fabrica)
	tab_medidas.tabpage_2.dw_med_rep.setItem(i,"co_linea",il_linea)
	tab_medidas.tabpage_2.dw_med_rep.setItem(i,"co_muestra",il_muestra)
	tab_medidas.tabpage_2.dw_med_rep.setItem(i,"co_diseno",il_diseno)
	tab_medidas.tabpage_2.dw_med_rep.setItem(i,"co_recurso",il_recurso)
Next

//////////////////////////////////////////////////
lds_1=create n_ds_application
//lds_1.DataObject = tab_medidas.tabpage_2.dw_med_rep.DataObject
lds_1.DataObject = tab_medidas.tabpage_1.dw_observacion.DataObject
lds_1.SetTransObject(n_cst_application.itr_appl)

ll_tot = lds_1.Retrieve(ll_recurso, ll_fabrica,ll_linea,ll_muestra, ll_talla, ll_diseno )

If ll_tot > 0 Then

	tab_medidas.tabpage_1.dw_observacion.setRedraw(False)
	lds_1.RowsCopy(1,ll_tot,Primary!,tab_medidas.tabpage_1.dw_observacion,1,Primary!)
	
	For i=1 to ll_tot
		tab_medidas.tabpage_1.dw_observacion.setItem(i,"co_fabrica",il_fabrica)
		tab_medidas.tabpage_1.dw_observacion.setItem(i,"co_linea",il_linea)
		tab_medidas.tabpage_1.dw_observacion.setItem(i,"co_muestra",il_muestra)
		tab_medidas.tabpage_1.dw_observacion.setItem(i,"co_diseno",il_diseno)
		tab_medidas.tabpage_1.dw_observacion.setItem(i,"co_recurso",il_recurso)
		tab_medidas.tabpage_1.dw_observacion.setItem(i,"co_talla", il_talla )	
	Next

	tab_medidas.tabpage_1.dw_observacion.setRedraw(True)
Else
		tab_medidas.tabpage_1.dw_observacion.insertrow(1)
		tab_medidas.tabpage_1.dw_observacion.setItem(1,"co_fabrica",il_fabrica)
		tab_medidas.tabpage_1.dw_observacion.setItem(1,"co_linea",il_linea)
		tab_medidas.tabpage_1.dw_observacion.setItem(1,"co_muestra",il_muestra)
		tab_medidas.tabpage_1.dw_observacion.setItem(1,"co_diseno",il_diseno)
		tab_medidas.tabpage_1.dw_observacion.setItem(1,"co_recurso",il_recurso)
		tab_medidas.tabpage_1.dw_observacion.setItem(1,"co_talla", il_talla )	
	
End If

of_verPulgadas()

tab_medidas.tabpage_1.dw_medidas1.SetRedraw(True)
end event

event ue_borrar_medidas();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 27 de Diciembre de 2002 HORA 09:36:12:281
// 
// Para borrar las medidas de una referencia
//////////////////////////////////////////////////////////////////////////
If tab_medidas.tabpage_1.dw_medidas1.RowCount()=0 Then
	Return
End If
long ll_res

ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Esta seguro de borrar las medidas ?",Question!,YesNo!,2)
If ll_res=2 Then
	Return
End If

IF of_verificar_borrado() > 0 THEN
	MessageBox("Advertencia!"," Recurso con materia prima, Borre primero la materia prima de este recurso.")
	Return
END IF	


DO WHILE tab_medidas.tabpage_1.dw_medidas1.RowCount()>0
	tab_medidas.tabpage_1.dw_medidas1.DeleteRow(0)
LOOP

DO WHILE tab_medidas.tabpage_2.dw_med_rep.RowCount()>0
	tab_medidas.tabpage_2.dw_med_rep.DeleteRow(0)
LOOP

DO WHILE tab_medidas.tabpage_1.dw_observacion.RowCount()>0
	tab_medidas.tabpage_1.dw_observacion.DeleteRow(0)
LOOP

If of_grabar()<>1 Then
	Return
End If

dw_muestra.Reset()
dw_head_ref.Reset()
tab_medidas.tabpage_2.dw_validacion.Reset()

Commit using n_cst_application.itr_appl ;

ib_cambios=False

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Las medidas se borraron satisfactoriamente.")



end event

event ue_teorica();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 08 de Agosto de 2003 HORA 10:18:15:910
// 
// Para el manejo de la producci$$HEX1$$f300$$ENDHEX$$n te$$HEX1$$f300$$ENDHEX$$rica de muestras en un recurso dado
//////////////////////////////////////////////////////////////////////////

n_cst_param lo_param


If il_recurso=-1 or il_fabrica=-1 or il_linea=-1 or il_muestra=-1 or &
   il_talla=-1 Then
	
	Return
	
End If

lo_param.il_vector[1]=il_recurso
lo_param.il_vector[2]=il_fabrica
lo_param.il_vector[3]=il_linea
lo_param.il_vector[4]=il_muestra
lo_param.il_vector[5]=il_talla
lo_param.il_vector[6]=il_tipoprod
lo_param.is_vector[1] = ""


OpenWithParm(w_teorica_muestra,lo_param)






end event

event ue_informe_muestra();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 21 de Agosto de 2003 HORA 16:55:05:328
// 
// Para facilitar la sacada de las muestras y materia prima de una muestra
// se envian los datos como parametros
//////////////////////////////////////////////////////////////////////////

n_cst_param lo_param

lo_param.il_vector[1]=il_fabrica
lo_param.il_vector[2]=il_linea
lo_param.il_vector[3]=il_muestra
lo_param.il_vector[4]=il_talla
lo_param.il_vector[5]=il_diseno
lo_param.il_vector[6]=il_recurso


OpenSheetWithParm(w_inf_muestra_medidas,lo_param,ParentWindow(),2,Original!)
end event

event ue_ficha_tecnica();//////////////////////////////////////////////////////////////////////////
// MODIFICADO Agosto 19 de 2009 - gagudelo - ohlondon
// LLama el reporte de la ficha tecnica para la muestra
// 
//////////////////////////////////////////////////////////////////////////

n_cst_param lo_param

lo_param.il_vector[1]  = il_fabrica
lo_param.il_vector[2]  = il_linea
lo_param.il_vector[3]  = il_muestra
lo_param.il_vector[4]  = il_talla
lo_param.il_vector[5]  = il_diseno 
lo_param.il_vector[6]  = il_recurso 
lo_param.il_vector[7]  = il_referencia
lo_param.il_vector[8]  = il_grupo_tlla
lo_param.il_vector[9]  = il_tipoprod
lo_param.il_vector[10] = il_fabrica_ref
lo_param.il_vector[11] = il_linea_ref

lo_param.is_vector[1]  = is_tipo_muestra

OpenSheetWithParm(w_inf_med_mue,lo_param,This.ParentWindow(),0,Original!)

end event

public function integer of_verificar ();Long ll_error
String ls_error
long ll_tot,i,ll_medida,ll_medida1,ll_res

if tab_medidas.tabpage_1.dw_medidas1.accepttext()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

if tab_medidas.tabpage_2.dw_med_rep.accepttext()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If


// Se verifica que el recurso no exista para otro dise$$HEX1$$f100$$ENDHEX$$o de la misma
// muestra
ll_res = of_verificar_otro_recurso(1)

IF ll_res < 0 THEN
	RETURN -1
ELSEIF ll_res = 1 THEN 
	MessageBox("Advertencia!","No puede asignar un nuevo dise$$HEX1$$f100$$ENDHEX$$o para el mismo recurso.",StopSign!)
	RETURN -1
END IF

////////////////////////////////////////////////////////////////////////////
//// Se ordenan los datos y verifica que no se
//// repitan
////////////////////////////////////////////////////////////////////////////

tab_medidas.tabpage_1.dw_medidas1.SetRedraw(False)
tab_medidas.tabpage_1.dw_medidas1.SetSort("co_partebas A")
tab_medidas.tabpage_1.dw_medidas1.Sort()

ll_tot=tab_medidas.tabpage_1.dw_medidas1.RowCount()

String ls_medida, ls_medida1, ls_desc_medida

For i=1 To ll_tot - 1
	ll_medida  = tab_medidas.tabpage_1.dw_medidas1.GetItemNumber(i  ,"co_partebas")
	ll_medida1 = tab_medidas.tabpage_1.dw_medidas1.GetItemNumber(i+1,"co_partebas")
	
	If ll_medida=ll_medida1 Then		
		ls_desc_medida=Trim(tab_medidas.tabpage_1.dw_medidas1.Describe(&
		"Evaluate('LookUpDisplay(co_partebas) ', " &
        + String(i) + ")"))
		  
		tab_medidas.SelectTab(1)
		
		tab_medidas.tabpage_1.dw_medidas1.SetSort("orden_partebas A")
		tab_medidas.tabpage_1.dw_medidas1.Sort()
		tab_medidas.tabpage_1.dw_medidas1.SetRedraw(True)
		tab_medidas.tabpage_1.dw_medidas1.SetFocus()

  
		MessageBox("Advertencia!","La siguiente medida est$$HEX2$$e1002000$$ENDHEX$$repetida "+ls_desc_medida+&
		". Por favor verifique.",StopSign!)
		Return -1
	End If
	
Next

tab_medidas.tabpage_1.dw_medidas1.SetSort("orden_partebas A")
tab_medidas.tabpage_1.dw_medidas1.Sort()
tab_medidas.tabpage_1.dw_medidas1.SetRedraw(True)

tab_medidas.tabpage_2.dw_med_rep.Sort()
ll_tot = tab_medidas.tabpage_2.dw_med_rep.RowCount()
/*
*------------------------------------------------------------------
* ESTA VALIDACION NO APLICAPARA ROPA
*------------------------------------------------------------------
*/
IF il_tipoprod = 10 THEN
	////////////////////////////////////////////////////////////////////////////
	//// En las medidas reposadas se deben tener 6, y todas con valores
	/***********************************************************
	SA51249 - Ceiba/JJ - Julio 14 2015
	Comentario: Se modifica la validacion- la anterior permitia solo tener 6 medidas reposadas,
	la nueva validacion permite menos de 2 medidas reposadas
	***********************************************************/
	If ll_tot<2 Then
		tab_medidas.SelectTab(2)	
		MessageBox("Advertencia!","Se deben tener como minimo 2 medidas reposadas.",StopSign!)
		Return -1
	End If
END IF
Decimal lde_cm

For i=1 To ll_tot

	lde_cm = tab_medidas.tabpage_2.dw_med_rep.GetItemDecimal(i,"ca_cm")
	
	If IsNull(lde_cm) Then lde_cm=0
	
	//////////////////////////////////////////////////////////////////////////
	// Si la medida no es mayor a 0 se debe hacer la advertencia
	// 
	//////////////////////////////////////////////////////////////////////////
	
	If lde_cm<=0 Then
		ls_desc_medida=Trim(tab_medidas.tabpage_2.dw_med_rep.Describe(&
		"Evaluate('LookUpDisplay(id_med_rep) ', " &
        + String(i) + ")"))
		  
		tab_medidas.SelectTab(2)		
		tab_medidas.tabpage_2.dw_med_rep.SetFocus()
		
		MessageBox("Advertencia!","La medida de : "+ls_desc_medida+&
		". No es v$$HEX1$$e100$$ENDHEX$$lida, por favor verifique.",StopSign!)
		Return -1		
	End If
	
	ls_medida  = tab_medidas.tabpage_2.dw_med_rep.GetItemString(i  ,"id_med_rep")
	
	If i<ll_tot Then
		ls_medida1 = tab_medidas.tabpage_2.dw_med_rep.GetItemString(i+1,"id_med_rep")
	
	
		If ls_medida=ls_medida1 Then
			ls_desc_medida=Trim(tab_medidas.tabpage_2.dw_med_rep.Describe(&
			"Evaluate('LookUpDisplay(id_med_rep) ', " &
			  + String(i) + ")"))
			  
			tab_medidas.SelectTab(2)		
			
			MessageBox("Advertencia!","La siguiente medida est$$HEX2$$e1002000$$ENDHEX$$repetida: "+ls_desc_medida+&
			". Por favor verifique.",StopSign!)
			Return -1
		End If
	End If
Next
/*
* MODIFICADO: Agosto 11 de 2009 - ohlondon
* Se debe verificar cada medida porque de ahora en adelante pueden ser m$$HEX1$$e100$$ENDHEX$$s de 6.
* Se env$$HEX1$$ed00$$ENDHEX$$a cero al m$$HEX1$$e900$$ENDHEX$$todo para que sepa que debe hacer la validacion para todas
* las filas del dw_med_rep.
*/

IF of_verificar_medidas(0) = -1 THEN
	RETURN -1
END IF

////////////////////////////////////////////////////////////////////////////
//// JUAN FERNANDO VASQUEZ DUQUE 
//// Jueves 31 de Agosto de 2006 HORA 09:48:56:109
//// 
//// En las medidas reposadas se debe mirar si no hay diferentes en otros
//// recursos y mostrar mensaje de advertencia.
////////////////////////////////////////////////////////////////////////////
//
/*
decimal lde_ma,lde_mb,lde_mc,lde_md,lde_me,lde_mf

lde_ma=tab_medidas.tabpage_2.dw_med_rep.GetItemDecimal(1,"ca_cm")
lde_mb=tab_medidas.tabpage_2.dw_med_rep.GetItemDecimal(2,"ca_cm")
lde_mc=tab_medidas.tabpage_2.dw_med_rep.GetItemDecimal(3,"ca_cm")
lde_md=tab_medidas.tabpage_2.dw_med_rep.GetItemDecimal(4,"ca_cm")
lde_me=tab_medidas.tabpage_2.dw_med_rep.GetItemDecimal(5,"ca_cm")
lde_mf=tab_medidas.tabpage_2.dw_med_rep.GetItemDecimal(6,"ca_cm")

ll_tot=tab_medidas.tabpage_2.dw_validacion.Retrieve(&
		 			 il_recurso,&
		          il_fabrica,&
					 il_linea,&
					 il_muestra ,&
					 il_talla,&
					 il_diseno,&
					 lde_ma,&
					 lde_mb,&
					 lde_mc,&
					 lde_md,&
					 lde_me,&
					 lde_mf)

If ll_tot < 0 Then
	ll_error = n_cst_application.itr_appl.sqlcode
	ls_error = n_cst_application.itr_appl.SqlErrtext
	
   MessageBox("Error!","Error verificando las medidas, Error:" + String( ll_error ) + "-" + ls_error ,StopSign!)
	Return -1
End If
					 
If ll_tot>0 Then
   MessageBox("Advertencia!","La referencia tiene medidas reposadas diferentes en otros recursos.~n~r"+&
	"Por definici$$HEX1$$f300$$ENDHEX$$n estas medidas deber$$HEX1$$ed00$$ENDHEX$$an ser iguales en todos los casos.",StopSign!)
	

	ll_res = MessageBox("Advertencia!","La referencia tiene medidas reposadas diferentes en otros recursos ~n~r$$HEX2$$bf002000$$ENDHEX$$Desea guardar los datos ?",Question!,YesNo!,2)
   If ll_res = 2 Then
		Return -1
	End If
End If
*/
Return 1



end function

public function integer of_iniciar ();//////////////////////////////////////////////////////////////////////////
// 
// 
//////////////////////////////////////////////////////////////////////////

il_fabrica=-1
il_linea=-1
il_muestra=-1
il_talla=-1
il_tipoProd=10
il_diseno=-1
il_recurso=-1

dw_muestra.Reset()
dw_head_ref.Reset()
tab_medidas.tabpage_1.dw_medidas1.Reset()
tab_medidas.tabpage_2.dw_med_rep.Reset()
tab_medidas.tabpage_2.dw_validacion.Reset()
tab_medidas.tabpage_1.dw_observacion.Reset()

ib_cambios=False

Return 1
end function

public function integer of_verpulgadas ();n_cst_comun lo_pulg
Long i,ll_tot

ll_tot=tab_medidas.tabpage_2.dw_med_rep.RowCount()


For i=1 to ll_tot
	tab_medidas.tabpage_2.dw_med_rep.SetItem(i,"ca_pulg",lo_pulg.of_mmToPulg(&
	tab_medidas.tabpage_2.dw_med_rep.GetItemDecimal(i,"ca_cm")))	
Next

Return 0


end function

public function integer of_nombremuestra ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 22 de Marzo de 2003 HORA 14:26:55:234
// 
// Datos de la muestra
//////////////////////////////////////////////////////////////////////////


If il_fabrica=-1 or il_linea=-1 or il_muestra=-1 Then
	Return -1
End If

n_cst_comun lo_comun

long ll_res

ll_res=lo_comun.of_nombreMuestra(il_fabrica /*long a_fabrica*/,&
                                    il_linea/*long a_linea*/, &
												il_muestra/*long a_referencia*/,&
												n_cst_application.is_user, &
												n_cst_application.itr_appl/*transaction a_transaction */)
long ll_n

SetNull(ll_n)

If ll_res=1 Then
	dw_muestra.SetItem(1,"de_muestra",lo_comun.of_getString(1))
	dw_muestra.SetItem(1,"co_tipoprod",lo_comun.of_getLong(1))
	il_tipoprod=lo_comun.of_getLong(1)
	il_tipo_prod = il_tipoprod 
	lo_comun.of_loaddddw(idc_parte_base/*datawindowchild a_dw*/, &
	                     il_tipoProd/*long a_num1*/,&
								n_cst_application.itr_appl/*transaction a_transaction */)

	lo_comun.of_loadDddw(idc_partebas,il_tipo_prod,n_cst_application.itr_appl)

	il_grupo_tlla=lo_comun.of_getLong(2)	
	dw_muestra.SetItem(1,"co_grupo_tlla",lo_comun.of_getLong(2))							
ELSEIf ll_res=0 Then
	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La muestra no existe o no es v$$HEX1$$e100$$ENDHEX$$lida para el usuario. Por favor verifique.")
	Return -1
Else
	dw_muestra.SetItem(1,"de_muestra","")
	il_tipoprod=-1
End If
dw_muestra.SetItem(1,"talla",ll_n)
dw_muestra.SetItem(1,"co_recurso",ll_n)
dw_muestra.SetItem(1,"de_recurso_tejido","")
//
il_talla=-1

//lo_comun.of_loadDddw(idc_talla,il_fabrica,il_linea,il_muestra,1,n_cst_application.itr_appl)

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
		dw_detalle.SetItem(ll_f,"co_muestra",il_muestra)
		dw_detalle.SetItem(ll_f,"co_tipoprod",il_tipoprod)
		dw_detalle.SetItem(ll_f,"co_partebas",ll_cod)
		dw_detalle.SetItem(ll_f,"co_talla",il_talla)
		dw_detalle.SetItem(ll_f,"co_diseno",il_diseno)
		dw_detalle.SetItem(ll_f,"co_recurso",il_recurso)
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
long i, ll_fila

If dw_muestra.Retrieve(il_fabrica,il_linea,il_muestra)<=0 Then
	dw_muestra.Reset()
	dw_detalle.Reset()
	Return 1
End If

String 			 ls_obser,ls_tmp
long 				 ll_tot,ll_res,ll_filas,ll_grupoprod,ll_recurso
DataWindowChild ldc_1
n_cst_comun 	 lo_comun


il_tipoProd     = dw_muestra.GetItemNumber(1,"co_tipoprod")
is_tipo_muestra = dw_muestra.GetItemString(1,"tipo_muestra")

/*
MODIFICADO Agosto 11 de 2009 - ohlondon
*/

ll_grupoprod = dw_muestra.GetItemNumber(1,"co_grupoprod")

If ll_grupoprod=-1 or isnull(ll_grupoprod) Then
	ll_grupoprod = 0 
End If
 	
/*
* Se deben recuperar las medidas del Grupo de tipo de producto
*/
tab_medidas.tabpage_2.dw_med_rep.GetChild("id_med_rep",ldc_1)
ldc_1.SetTransObject(n_cst_application.itr_appl)
ldc_1.Retrieve(ll_grupoprod)

il_tipo_prod = il_tipoprod 
lo_comun.of_loaddddw(idc_parte_base/*datawindowchild a_dw*/, &
	                     il_tipoProd/*long a_num1*/,&
								n_cst_application.itr_appl/*transaction a_transaction */)

lo_comun.of_loadDddw(idc_partebas,il_tipo_prod,n_cst_application.itr_appl)

//-----------------------------------------------------


dw_muestra.SetItem(1,"talla",il_talla)
dw_muestra.SetItem(1,"co_diseno",il_diseno)

ll_res=lo_comun.of_nombredisenomuestra( il_fabrica,il_linea, il_muestra,il_talla,&
il_diseno,n_cst_application.itr_appl)

If ll_res=1 Then
	dw_muestra.SetItem(1,"de_diseno",lo_comun.of_getString(1))
End If
dw_muestra.SetItem(1,"co_recurso",il_recurso)
/*
HABILITAR CAMBIO DISE$$HEX1$$d100$$ENDHEX$$O RECURSO OHLONDON 20110119


dw_muestra.Modify("co_recurso.Background.Color='79471120'")
dw_muestra.Modify("co_recurso.Protect='1'")
*/
il_grupo_tlla=dw_muestra.GetItemNumber(1,"co_grupo_tlla")

ll_res=lo_comun.of_nombretalla( il_grupo_tlla, il_talla, n_cst_application.itr_appl)

If ll_res=1 Then
	dw_muestra.SetItem(1,"de_talla",lo_comun.of_getString(1))
End If


//dw_detalle.Retrieve( il_recurso,il_fabrica,il_linea,il_muestra,il_talla,il_diseno)

IF Not isnull(il_referencia) AND il_referencia <> 0 THEN
	//SA52991 - E00526 - Ceiba/reariase - 27-02-2017
	ll_recurso      = dw_muestra.GetItemNumber(1,"co_recurso")
	dw_head_ref.retrieve(il_fabrica_ref,il_linea_ref, il_muestra)
//	dw_head_ref.retrieve(il_fabrica_ref,il_linea_ref, il_referencia,0,0,0,0 )
END IF	


/* FACL - 2018/29/26 - SA59440 - Se desactiva codigo que cambia el dataobject
If il_fabrica = 5 Then
	tab_medidas.tabpage_1.dw_medidas1.DataObject = 'd_dt_med_mue_tolerancia'
Else
	tab_medidas.tabpage_1.dw_medidas1.DataObject = 'd_dt_med_mue'
End if 
tab_medidas.tabpage_1.dw_medidas1.SetTransObject(n_cst_application.itr_appl)
*/

// FACL - 2018/29/26 - SA59440 - Si la fabrica es 5 muestra el campo de tolerancia
If il_fabrica = 5 Then
	tab_medidas.tabpage_1.dw_medidas1.Modify( 'tolerancia.width="242"' )
Else
	tab_medidas.tabpage_1.dw_medidas1.Modify( 'tolerancia.width="0"' )
End if 


tab_medidas.tabpage_1.dw_medidas1.retrieve(il_fabrica,il_linea,il_muestra,il_diseno,il_recurso )
tab_medidas.tabpage_2.dw_med_rep.retrieve(il_fabrica,il_linea,il_muestra,il_recurso, il_diseno )


tab_medidas.tabpage_3.dw_teorica_mue.retrieve(il_fabrica,il_linea,il_muestra,il_talla )

//////////////////////////////////////////////////////////////////////////
// Coloco la descripcion si son pulgadas
// 
//////////////////////////////////////////////////////////////////////////
//of_verPulgadas()

ll_filas = tab_medidas.tabpage_1.dw_observacion.Retrieve( il_recurso,il_fabrica,il_linea,il_muestra,il_talla,il_diseno)

IF ll_filas =0 THEN
	ll_fila = tab_medidas.tabpage_1.dw_observacion.insertrow(0)
	tab_medidas.tabpage_1.dw_observacion.setitem( ll_fila, "co_recurso",il_recurso) 
	tab_medidas.tabpage_1.dw_observacion.setitem( ll_fila, "co_fabrica", il_fabrica) 
	tab_medidas.tabpage_1.dw_observacion.setitem( ll_fila, "co_linea", il_linea) 
	tab_medidas.tabpage_1.dw_observacion.setitem( ll_fila, "co_muestra", il_muestra) 
	tab_medidas.tabpage_1.dw_observacion.setitem( ll_fila, "co_talla", il_talla) 
	tab_medidas.tabpage_1.dw_observacion.setitem( ll_fila, "co_diseno", il_diseno) 
END IF	

//////////////////////////////////////////////////////////////////////////
// Se eliminan los espacios a la derecha en las observaciones
// 
//////////////////////////////////////////////////////////////////////////

//For i=1 to dw_detalle.RowCount()
//
//	String ls_dato
//	
//	ls_dato=dw_detalle.GetItemString(i,"de_observacion")
//	ls_dato=trim(ls_dato)
//	dw_detalle.SetItem(i,"de_observacion",ls_dato)
//	dw_detalle.SetItemStatus(i,0,Primary!,NotModified!	)
//	dw_detalle.SetItemStatus(i,"de_observacion",Primary!,NotModified!	)
// Next
//

//////////////////////////////////////////////////////////////////////////
// Ahora coloco el equivalente de las medidas en pulgadas
// 
//////////////////////////////////////////////////////////////////////////


//lo_comun.of_loadDddw(idc_talla,il_fabrica,il_linea,il_referencia,il_calidad,n_cst_application.itr_appl)

////lo_comun.of_loadDddw(idc_parte_base,il_tipoProd,n_cst_application.itr_appl)

//////////////////////////////////////////////////////////////////////////
// Coloco el nombre de recurso seleccionado en la ventana anterior
// 
//////////////////////////////////////////////////////////////////////////

ll_res=lo_comun.of_nombreRecursoTj(il_recurso,n_cst_application.itr_appl)

If ll_res=1 Then
	dw_muestra.SetItem(1,"de_recurso_tejido",lo_comun.of_getString(1))
	
End If


Return 1

end function

public function integer of_existe (integer a_mensaje);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 10 de Diciembre de 2002 HORA 10:05:05:687
// 
// Para verificar si existen los datos
//////////////////////////////////////////////////////////////////////////
If dw_muestra.RowCount()=0 then
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

If il_diseno=-1 Then
	If a_mensaje=1 Then
		MessageBox("Advertencia!","Dise$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
	End If
	Return -1
End If

If il_recurso=-1 Then
	If a_mensaje=1 Then
		MessageBox("Advertencia!","Recurso no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
	End If
	Return -1
End If

String ls_des

ls_des=dw_muestra.GetItemString(1,"de_muestra")

If IsNull(ls_des) Then ls_des=""

If len(ls_des)=0 Then
	If a_mensaje=1 Then
		MessageBox("Advertencia!","Muestra no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
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
    FROM dt_med_mue
   WHERE ( co_recurso = :il_recurso ) AND  	
	      ( co_fabrica = :il_fabrica ) AND  
         ( co_linea   = :il_linea )   AND  
         ( co_muestra = :il_muestra ) AND  
         ( co_talla   = :il_talla )   AND  
			( co_diseno  = :il_diseno )
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
	// Se verifica que el recurso no exista para otro dise$$HEX1$$f100$$ENDHEX$$o de la misma
	// muestra
	ll_res = of_verificar_otro_recurso(0)
	
	IF ll_res < 0 THEN
		RETURN 1
	ELSEIF ll_res = 1 THEN 
		MessageBox("Advertencia!","Ya existe este recurso en otro dise$$HEX1$$f100$$ENDHEX$$o. Por favor verifique.",StopSign!)
		RETURN 2
	END IF
	
	dw_head_ref.Reset()
	tab_medidas.tabpage_1.dw_medidas1.Reset()
	tab_medidas.tabpage_2.dw_med_rep.Reset()
	tab_medidas.tabpage_2.dw_validacion.Reset()
	tab_medidas.tabpage_1.dw_observacion.Reset()
	
	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea copiar las medidas de otra muestra ?",Question!,YesNo!,2)
	If ll_res=1 Then
		PostEvent("ue_copiar_datos")
	End If
End If

Return 1


end function

public function integer of_grabar ();//////////////////////////////////////////////////////////////////////////
//  
// 
//////////////////////////////////////////////////////////////////////////

DateTime ldt_fecha
String ls_usuario,ls_instancia,ls_observacion, ls_obs
Long ll_filas , ll_inicial, ll_partebas

If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If


If tab_medidas.tabpage_1.dw_medidas1.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
	Return -1
End If

If tab_medidas.tabpage_2.dw_med_rep.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
	Return -1
End If
//2015-06-16 Solicitud: 51249 Ceiba/JJ
IF ib_cambios_medReposadas THEN of_AbrirVentanaSeleccionRecursosACopiar()

If tab_medidas.tabpage_1.dw_observacion.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
	Return -1
End If


If tab_medidas.tabpage_1.dw_medidas1.Update()<>1 Then
	RollBack using n_cst_application.itr_appl ;
	Return -1
End If

/*
ll_filas = tab_medidas.tabpage_1.dw_medidas1.rowcount( )

FOR ll_inicial = 1 TO ll_filas
	ll_partebas = Long(tab_medidas.tabpage_1.dw_medidas1.Object.co_partebas[ll_inicial])
	ls_obs = tab_medidas.tabpage_1.dw_medidas1.Object.de_observacion[ll_inicial]
	update dt_med_mue 
	set de_observacion = :ls_obs
	WHERE co_fabrica = :il_fabrica
	AND co_linea = :il_linea
	AND co_muestra = :il_muestra
	AND co_partebas =  :ll_partebas
	USING n_cst_application.itr_appl
	;
	
	IF n_cst_application.itr_appl.sqlcode = -1 then
		MessageBox('','')
	END IF
NEXT
*/
//2015-06-16 Solicitud: 51249 Ceiba/JJ
//Permitir al User tomar la decisi$$HEX1$$f300$$ENDHEX$$n de cambiar las medidas reposadas en las medidas muestra en todos los recursos o el seleccionado
//of_AbrirVentanaSeleccionRecursosACopiar()

If tab_medidas.tabpage_2.dw_med_rep.Update()<>1 Then
	RollBack using n_cst_application.itr_appl ;
	Return -1
End If

IF tab_medidas.tabpage_1.dw_observacion.Rowcount() > 0 THEN
	tab_medidas.tabpage_1.dw_observacion.accepttext()
	ls_observacion = TRIM(tab_medidas.tabpage_1.dw_observacion.getitemsTring(1,"de_observacion"))
END IF	

//Ivan Escobar 16 01 2014
//se saca esta validacion ya que cuando borran las medidas no 
//actualizaba las observaciones y sacaba error de clave primaria.
If tab_medidas.tabpage_1.dw_observacion.Update()<>1 Then
	RollBack using n_cst_application.itr_appl ;
	Return -1
End If	

//If isnull(ls_observacion) Or ls_observacion="" THEN
//Else
//	If tab_medidas.tabpage_1.dw_observacion.Update()<>1 Then
//		RollBack using n_cst_application.itr_appl ;
//		Return -1
//	End If
//End if	
//
/*
HABILITAR CAMBIO DISE$$HEX1$$d100$$ENDHEX$$O RECURSO OHLONDON 20110119

dw_muestra.Modify("co_recurso.Background.Color='79471120'")
dw_muestra.Modify("co_recurso.Protect='1'")
*/

//SA52991 - E00526 - Ceiba/reariase - 09-02-2017
tab_medidas.tabpage_3.dw_teorica_mue.Retrieve(il_fabrica,il_linea,il_muestra,il_talla)
//Fin SA52991

Return 1
end function

public function integer of_verificar_med_est ();Return 1
end function

public function integer of_verificar_medidas (long al_row);/* 
* =================================================================================
* MODIFICADO: Agosto 11 de 2009 - ohlondon
*
* Se debe verificar que cada medida no est$$HEX2$$e9002000$$ENDHEX$$con valores en cm diferentes en otros
* recuros
* Se env$$HEX1$$ed00$$ENDHEX$$a cero al m$$HEX1$$e900$$ENDHEX$$todo para que sepa que debe hacer la validacion para todas
* las filas del dw_med_rep.
* Se env$$HEX1$$ed00$$ENDHEX$$a un valor <> de cero para que el m$$HEX1$$e900$$ENDHEX$$todo sepa que hace la validacion para
* la fila que indique dicho valor
* =================================================================================
*/
Long		ll_row, ll_rows, ll_diferentes, ll_error, ll_res, ll_ini
String 	ls_medida, ls_error
decimal 	lde_ca_cm
tab_medidas.tabpage_2.dw_med_rep.AcceptText()
// Si en el parametro envian cero quiere decir que se deben validar
// todas las filas
IF al_row = 0 THEN
	ll_rows = tab_medidas.tabpage_2.dw_med_rep.RowCount()
	ll_ini = 1
ELSE
	// Si se envia un dato diferente de cero (mayor que cero) se
	// valida solo la fila enviada en dicho parametro.
	ll_rows = al_row
	ll_ini  = al_row 
END IF
tab_medidas.tabpage_2.dw_validacion.SetRedraw(FALSE)
FOR ll_row = ll_ini TO ll_rows	
	lde_ca_cm = tab_medidas.tabpage_2.dw_med_rep.GetItemDecimal(ll_row,"ca_cm")
	ls_medida = tab_medidas.tabpage_2.dw_med_rep.GetItemString(ll_row,"id_med_rep")
	
	ll_diferentes = tab_medidas.tabpage_2.dw_validacion.Retrieve(&
						 il_recurso,&
						 il_fabrica,&
						 il_linea,&
						 il_muestra ,&
						 il_talla,&
						 il_diseno,&
						 ls_medida,&
						 lde_ca_cm)
	
	If ll_diferentes < 0 Then
		ll_error = n_cst_application.itr_appl.sqlcode
		ls_error = n_cst_application.itr_appl.SqlErrtext
		
		MessageBox("Error!","Error verificando las medidas, Error:" + String( ll_error ) + "-" + ls_error ,StopSign!)
		tab_medidas.tabpage_2.dw_validacion.SetRedraw(TRUE)
		Return -1
	ELSEIF ll_diferentes > 0 THEN
		
	   IF al_row = 0 THEN
			ll_res = MessageBox("Advertencia!","La referencia tiene medidas reposadas diferentes en otros recursos; "+&
														  "por definici$$HEX1$$f300$$ENDHEX$$n estas medidas deber$$HEX1$$ed00$$ENDHEX$$an ser iguales en todos los casos.~n~r"+&
														  "$$HEX1$$bf00$$ENDHEX$$Desea continuar guardando los datos?",Question!,YesNo!,2)
		ELSE
			ll_res = MessageBox("Advertencia!","La referencia tiene medidas reposadas diferentes en otros recursos; "+&
														  "por definici$$HEX1$$f300$$ENDHEX$$n estas medidas deber$$HEX1$$ed00$$ENDHEX$$an ser iguales en todos los casos.~n~r"+&
														  "$$HEX1$$bf00$$ENDHEX$$Desea continuar?",Question!,YesNo!,2)
		END IF
		
		If ll_res = 2 Then
			tab_medidas.tabpage_2.dw_validacion.SetRedraw(TRUE)
			Return -1
		End If
	End If
NEXT
tab_medidas.tabpage_2.dw_validacion.SetRedraw(TRUE)
RETURN 1
end function

public function integer of_verificar_otro_recurso (integer a_mensaje);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 10 de Diciembre de 2002 HORA 10:05:05:687
// 
// Para verificar si existen los datos
//////////////////////////////////////////////////////////////////////////
If dw_muestra.RowCount()=0 then
	MessageBox("Advertencia!","Debe especificar la referencia.",StopSign!)
	Return -1
End If

If il_fabrica=-1 Then
	Return 0
End If

If il_linea=-1 Then
	Return 0
End If

If il_muestra=-1 Then
	Return 0
End If

If il_talla=-1 Then
	Return 0
End If

If il_diseno=-1 Then
	Return 0
End If

If il_recurso=-1 Then
	Return 0
End If


//////////////////////////////////////////////////////////////////////////
// Verifico si existe el recurso para otro dise$$HEX1$$f100$$ENDHEX$$o en la misma muestra
//////////////////////////////////////////////////////////////////////////

long ll_cant

  SELECT count(*)  
    INTO :ll_cant  
    FROM dt_med_mue
   WHERE ( dt_med_mue.co_recurso = :il_recurso ) AND  	
	      ( dt_med_mue.co_fabrica = :il_fabrica ) AND  
         ( dt_med_mue.co_linea   = :il_linea ) AND  
         ( dt_med_mue.co_muestra = :il_muestra )  AND
         ( dt_med_mue.co_talla   = :il_talla ) AND 
			( dt_med_mue.co_diseno <> :il_diseno )
	using n_cst_application.itr_appl;
			
		
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If
			
If IsNull(ll_cant) then 
	ll_cant=0
End If

If ll_cant>0 Then
	Return 1 
End If

Return 0
end function

public function long of_recuperar_diseno (ref long al_diseno);
Long ll_retorno, ll_recurso

//recuperar el dise$$HEX1$$f100$$ENDHEX$$o con la ingresada del recurso
 SELECT FIRST 1 co_diseno, count(*)
 into :al_diseno, :ll_retorno
    FROM dt_med_mue
  WHERE ( co_recurso = :il_recurso ) AND  	
	      ( co_fabrica = :il_fabrica ) AND  
         ( co_linea   = :il_linea )   AND  
         ( co_muestra = :il_muestra ) AND  
         ( co_talla   = :il_talla )  
	Group By co_diseno		
	using n_cst_application.itr_appl;

IF ll_retorno = 0 THEN
	SELECT co_recurso
	INTO :ll_recurso
	FROM dt_muestras
	WHERE ( dt_muestras.co_fabrica = :il_fabrica) AND  
			( dt_muestras.co_linea = :il_linea) AND  
			( dt_muestras.co_muestra = :il_muestra )  
	using n_cst_application.itr_appl;
	
	IF ll_recurso = il_recurso THEN
		al_diseno = 1
		ll_retorno = 1
	END IF
END IF


RETURN ll_retorno
end function

public function long of_recurso_utilizado (ref long al_recurso, readonly long al_diseno);long ll_cant

SELECT count(*), co_recurso  
    INTO :ll_cant, :al_recurso
    FROM dt_med_mue
   WHERE ( co_fabrica = :il_fabrica ) AND  
         ( co_linea   = :il_linea )   AND  
         ( co_muestra = :il_muestra ) AND  
         ( co_talla   = :il_talla )   AND  
			( co_diseno  = :al_diseno )
	GROUP BY co_recurso
	using n_cst_application.itr_appl;
			
			
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If
			
If n_cst_application.itr_appl.SQLcode=100 Then 
	Return 0
End If

RETURN ll_cant
end function

public function integer of_diseno_automatico ();String ls_diseno_muestra
Long	ll_fabrica, ll_linea, ll_muestra, ll_cons, ll_insert, ll_null
DateTime ldt_hoy
n_cst_param lo_param

SetNull(ll_null)

datastore		lds_datos, lds_disenomuestra
lds_datos		= CREATE datastore
lds_disenomuestra = CREATE datastore

ll_fabrica  = dw_muestra.Object.co_fabrica[1]
ll_linea = dw_muestra.Object.co_linea[1]
ll_muestra = dw_muestra.Object.co_muestra[1]

lds_datos.Dataobject = 'd_m_muestras'
lds_datos.Settransobject( n_cst_application.itr_appl) 
lds_datos.Retrieve(ll_fabrica, ll_linea, ll_muestra)

lds_disenomuestra.Dataobject = 'd_listains_m_disenos_muestras'
lds_disenomuestra.Settransobject( n_cst_application.itr_appl)
lds_disenomuestra.Retrieve(il_fabrica,il_linea,il_muestra, il_talla)

If ( MessageBox('Atenci$$HEX1$$f300$$ENDHEX$$n','El c$$HEX1$$f300$$ENDHEX$$digo de dise$$HEX1$$f100$$ENDHEX$$o no ha sido especificado.'+ &
	  '$$HEX1$$bf00$$ENDHEX$$Desea crear uno Nuevo?',Question!,YesNo!,1) = 1 )  THEN 
	lo_param.is_vector[1] = Trim(lds_datos.GetItemString(1,'de_muestra'))
	OpenWithParm(w_m_codigos_disenos,lo_param)
	
	lo_param = Message.PowerObjectParm
	If (IsValid(lo_param) ) THEN 
		ls_diseno_muestra=lo_param.is_vector[1]

		ll_cons = Long(lds_disenomuestra.Describe("Evaluate('max(co_diseno for all)', 0)"))
		If IsNull(ll_cons) Then ll_cons=0		
		ll_cons++
		il_diseno = ll_cons
		ll_insert = lds_disenomuestra.Insertrow( 0)
		
		lds_disenomuestra.SetItem(ll_insert,"co_fabrica",il_fabrica)
		lds_disenomuestra.SetItem(ll_insert,"co_linea",il_linea)
		lds_disenomuestra.SetItem(ll_insert,"co_muestra",il_muestra)
		lds_disenomuestra.SetItem(ll_insert,"co_talla",il_talla)
		lds_disenomuestra.SetItem(ll_insert,"co_diseno",ll_cons)
		lds_disenomuestra.SetItem(ll_insert,"de_diseno",ls_diseno_muestra)
		lds_disenomuestra.SetItem(ll_insert,"fe_creacion",DateTime(Date(today()),Time(now())))
		lds_disenomuestra.SetItem(ll_insert,"fe_actualizacion",DateTime(Date(today()),Time(now())))
		lds_disenomuestra.SetItem(ll_insert,"usuario",gs_usuario)
		lds_disenomuestra.SetItem(ll_insert,"instancia",gs_instancia)		
		ldt_hoy = DateTime(Date(today()),Time(now()))
		
		UPDATE m_codigos_disenos
		SET 	(sw_usado, fe_actualizacion, usuario, instancia) = (1, :ldt_hoy, :gs_usuario, :gs_instancia)    
		WHERE m_codigos_disenos.de_diseno = :ls_diseno_muestra
		USING n_cst_application.itr_appl;
		
		dw_muestra.Object.co_diseno[1] = ll_cons
		dw_muestra.object.de_diseno[1] = ls_diseno_muestra		
		
		lds_disenomuestra.update( )
		
		COMMIT using n_cst_application.itr_appl;
	End If
ELSE
	il_diseno = ll_null
	RETURN -1
End If

return 1
end function

public function integer of_verificar_borrado ();LONG ll_borrar

SELECT count(dt_fmp_muestras.co_fabrica)
INTO :ll_borrar
FROM 	dt_fmp_muestras,   
		h_fmp_muestras  
WHERE ( dt_fmp_muestras.co_fabrica = h_fmp_muestras.co_fabrica ) 
AND ( dt_fmp_muestras.co_linea = h_fmp_muestras.co_linea ) 
AND ( dt_fmp_muestras.co_muestra = h_fmp_muestras.co_muestra )
AND ( dt_fmp_muestras.co_talla = h_fmp_muestras.co_talla ) 
AND ( dt_fmp_muestras.co_color = h_fmp_muestras.co_color ) 
AND ( dt_fmp_muestras.CO_DISENO = h_fmp_muestras.CO_DISENO ) 
AND ( h_fmp_muestras.CO_RECURSO = :il_recurso ) 
AND ( dt_fmp_muestras.co_fabrica = :il_fabrica )
AND ( dt_fmp_muestras.co_linea = :il_linea ) 
AND ( dt_fmp_muestras.co_muestra = :il_muestra ) 
AND ( dt_fmp_muestras.CO_DISENO =  :il_diseno)
USING n_cst_application.itr_appl;


RETURN ll_borrar
end function

public function long of_abrirventanaseleccionrecursosacopiar ();//=========================================================================
// Funcion	:	of_AbrirVentanaSeleccionRecursosACopiar
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Junio 17 de 2015 - Johannes Monsalve
// OBJETIVO	:	Abrir la ventana para seleccionar los recursos con los que deseo sincromizar la informacion
//					Copiar la informacion modificada, borrada o insertada de la 
//					pesta$$HEX1$$f100$$ENDHEX$$a de reposadas en la opcion Muestra Basica del menu principal
//=========================================================================
//2015-06-16 Solicitud: 51249 Ceiba/JJ
str_param	lstr_param

lstr_param.a_long1[1] = Long(il_muestra)
lstr_param.a_long1[2] = Long(il_recurso)
lstr_param.a_long1[3] = Long(il_muestra)
lstr_param.a_long1[4] =	Long(il_fabrica)
lstr_param.a_long1[5] = Long(il_linea)
lstr_param.a_long1[6] = Long(il_talla)
lstr_param.a_long1[7] = Long(tab_medidas.tabpage_2.dw_med_rep.GetItemNumber(1, "co_diseno"))//DISE$$HEX1$$d100$$ENDHEX$$O DE ORIGEN
//Se envia el nombre del programa para saber como debe comportarse
lstr_param.a_string3[1] = 'Medidas_Muestra'
//Se envia el dw para luego generar un copia, setearles el co_recurso y luego actualizarlos 
lstr_param.a_dw1[1] = tab_medidas.tabpage_2.dw_med_rep

OpenWithParm(w_copiar_recursos,lstr_param)

return 1
end function

on w_medidas_muestra_ref.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_medidas_mue" then this.MenuID = create m_medidas_mue
this.dw_head_ref=create dw_head_ref
this.tab_medidas=create tab_medidas
this.dw_partes1=create dw_partes1
this.dw_detalle=create dw_detalle
this.dw_muestra=create dw_muestra
this.gb_referencia=create gb_referencia
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_head_ref
this.Control[iCurrent+2]=this.tab_medidas
this.Control[iCurrent+3]=this.dw_partes1
this.Control[iCurrent+4]=this.dw_detalle
this.Control[iCurrent+5]=this.dw_muestra
this.Control[iCurrent+6]=this.gb_referencia
end on

on w_medidas_muestra_ref.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_head_ref)
destroy(this.tab_medidas)
destroy(this.dw_partes1)
destroy(this.dw_detalle)
destroy(this.dw_muestra)
destroy(this.gb_referencia)
end on

event open;call super::open;n_cst_comun lo_comun

dw_muestra.SetTransObject(n_cst_application.itr_appl)
dw_detalle.SetTransObject(n_cst_application.itr_appl)

dw_head_ref.SetTransObject(n_cst_application.itr_appl)

tab_medidas.tabpage_1.dw_medidas1.SetTransObject(n_cst_application.itr_appl)
tab_medidas.tabpage_2.dw_med_rep.SetTransObject(n_cst_application.itr_appl)
tab_medidas.tabpage_1.dw_observacion.SetTransObject(n_cst_application.itr_appl)
tab_medidas.tabpage_2.dw_validacion.SetTransObject(n_cst_application.itr_appl)

tab_medidas.tabpage_1.dw_validacion_est.SetTransObject(n_cst_application.itr_appl)

tab_medidas.tabpage_3.dw_teorica_mue.SetTransObject(n_cst_application.itr_appl)


//////////////////////////////////////////////////////////////////////////
tab_medidas.tabpage_1.dw_medidas1.GetChild("co_partebas",idc_partebas)
il_tipo_prod=10
lo_comun.of_loadDddw(idc_partebas,il_tipo_prod,n_cst_application.itr_appl)

of_iniciar()

//dw_detalle.GetChild("co_partebas",idc_parte_base)
//lo_comun.of_loadDddw(idc_parte_base,-1,n_cst_application.itr_appl)

//dw_partes1.GetChild("co_partebas",idc_parte_base11)
//idc_parte_base.ShareData(idc_parte_base11)
//
//dw_detalle.ShareData(dw_partes1)
//
//dw_partes1.of_color("co_partebas",0)
//dw_partes1.of_color("ca_largo",0)

//////////////////////////////////////////////////////////////////////////
// Inicializo las variables de instancia
// 
//////////////////////////////////////////////////////////////////////////


//If dw_detalle.of_refrescarParametros()<>1 Then
//	MessageBox("Advertencia!","Error determinando la fecha.",StopSign!)
//	Return
//End If

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



//OpenWithParm(w_opc_nue_recurso,is_where)
OpenWithParm(w_opc_ref_recurso_bas_mue,is_where)

lou_param = Message.PowerObjectParm

	dw_head_ref.Reset()
	tab_medidas.tabpage_1.dw_medidas1.Reset()
	tab_medidas.tabpage_2.dw_med_rep.Reset()
	tab_medidas.tabpage_2.dw_validacion.Reset()
	tab_medidas.tabpage_1.dw_observacion.Reset()	
	tab_medidas.tabpage_3.dw_teorica_mue.Reset()	



If Not IsValid(lou_param) Then
	dw_muestra.Reset()
	dw_head_ref.Reset()
	tab_medidas.tabpage_1.dw_medidas1.Reset()
	tab_medidas.tabpage_2.dw_med_rep.Reset()
	tab_medidas.tabpage_2.dw_validacion.Reset()
	tab_medidas.tabpage_1.dw_observacion.Reset()	
	tab_medidas.tabpage_3.dw_teorica_mue.Reset()	
	Return 
End If

is_where=lou_param.is_vector[1]

il_fabrica 		= lou_param.il_vector[1]
il_linea   		= lou_param.il_vector[2]
il_referencia	= lou_param.il_vector[3]
il_talla			= lou_param.il_vector[4]
il_tipoprod		= lou_param.il_vector[6]
il_recurso		= lou_param.il_vector[7]
il_diseno		= lou_param.il_vector[8]
il_muestra 		= lou_param.il_vector[9]
il_fabrica_ref = lou_param.il_vector[10]
il_linea_ref   = lou_param.il_vector[11]

	 
of_recuperar()
end event

event ue_save;call super::ue_save;//////////////////////////////////////////////////////////////////////////////
////// JUAN FERNANDO VASQUEZ DUQE 
////// Lunes 25 de Noviembre de 2002 HORA 12:22:39:906
////// 
////// Verifica y almacena los cambios realizados
//////////////////////////////////////////////////////////////////////////////
//
//MessageBox("Advertencia!","Existe una nueva versi$$HEX1$$f300$$ENDHEX$$n del sistema de medidas de muestras.",StopSign!)
//Return


If of_verificar()<>1 Then
	Return
End If

If of_grabar()<>1 then
	Return
End If

Commit using n_cst_application.itr_appl ;

ib_cambios=False
ib_cambios_medReposadas = False
MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","La informaci$$HEX1$$f300$$ENDHEX$$n se guardo satisfactoriamente.")

end event

type dw_head_ref from u_dw_application within w_medidas_muestra_ref
integer x = 27
integer y = 256
integer width = 3579
integer height = 160
integer taborder = 20
string dataobject = "d_h_fmp_mue_ref"
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

type tab_medidas from tab within w_medidas_muestra_ref
event create ( )
event destroy ( )
integer x = 41
integer y = 436
integer width = 3570
integer height = 1624
integer taborder = 40
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
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type

on tab_medidas.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on tab_medidas.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

type tabpage_1 from userobject within tab_medidas
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3534
integer height = 1504
long backcolor = 80269524
string text = "Medidas (Ctrl+2)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
cb_1 cb_1
dw_validacion_est dw_validacion_est
dw_observacion dw_observacion
dw_medidas1 dw_medidas1
end type

on tabpage_1.create
this.cb_1=create cb_1
this.dw_validacion_est=create dw_validacion_est
this.dw_observacion=create dw_observacion
this.dw_medidas1=create dw_medidas1
this.Control[]={this.cb_1,&
this.dw_validacion_est,&
this.dw_observacion,&
this.dw_medidas1}
end on

on tabpage_1.destroy
destroy(this.cb_1)
destroy(this.dw_validacion_est)
destroy(this.dw_observacion)
destroy(this.dw_medidas1)
end on

type cb_1 from commandbutton within tabpage_1
integer x = 3296
integer y = 24
integer width = 201
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Partes"
end type

event clicked;//////////////////////////////////////////////////////////////////////////
// Ingresa las partes basicas del producto
// 
//////////////////////////////////////////////////////////////////////////
If il_diseno = -1 OR il_talla=-1  or isnull(il_recurso) Or il_recurso =-1 Then
	MessageBox("Advertencia!","Debe especificar el dise$$HEX1$$f100$$ENDHEX$$o, la talla y el recurso.",StopSign!)
	Return
End If	

If dw_medidas1.RowCount()=0 Then
	
	long i,ll_tot,ll_cod,ll_clasificacion,ll_f
	
	
	ll_tot=idc_partebas.RowCount()
	
	For i=1 To ll_tot
		
		ll_cod=idc_partebas.GetItemNumber(i,"co_partebas")
		ll_clasificacion=idc_partebas.GetItemNumber(i,"co_clasificacion")
		If not IsNull(ll_cod) and ll_clasificacion=1 Then
			
			ll_f=tab_medidas.tabpage_1.dw_medidas1.InsertRow(0)
			tab_medidas.tabpage_1.dw_medidas1.SetItem(ll_f,"co_fabrica",il_fabrica)
			tab_medidas.tabpage_1.dw_medidas1.SetItem(ll_f,"co_linea",il_linea)
			tab_medidas.tabpage_1.dw_medidas1.SetItem(ll_f,"co_muestra",il_muestra)
			tab_medidas.tabpage_1.dw_medidas1.SetItem(ll_f,"co_talla",il_talla)
			tab_medidas.tabpage_1.dw_medidas1.SetItem(ll_f,"co_tipoprod",il_tipo_prod)
			
			tab_medidas.tabpage_1.dw_medidas1.SetItem(ll_f,"co_partebas",ll_cod)
			
			tab_medidas.tabpage_1.dw_medidas1.SetItem(ll_f,"co_diseno",il_diseno)
			
			tab_medidas.tabpage_1.dw_medidas1.SetItem(ll_f,"co_recurso",il_recurso)		
		End If
	Next
END IF
Return 1


end event

type dw_validacion_est from u_dw_application within tabpage_1
integer x = 27
integer y = 916
integer width = 1010
integer height = 332
integer taborder = 20
string dataobject = "d_valida_med_mue"
boolean hscrollbar = true
boolean border = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_observacion from u_dw_application within tabpage_1
event ue_move pbm_move
integer x = 27
integer y = 1284
integer width = 2839
integer height = 200
string dataobject = "dgr_obs_dt_med_mue"
boolean hscrollbar = true
boolean vscrollbar = false
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event ue_move;//x=1440
//y=284
end event

event getfocus;call super::getfocus;tabtextcolor=Rgb(0,0,255)
end event

event itemchanged;call super::itemchanged;ib_cambios=True
end event

event losefocus;call super::losefocus;tabtextcolor=Rgb(0,0,0)
end event

event ue_insertrow;//long i,ll_recurso
//
//
//If il_talla=-1 or isnull(il_recurso) or il_recurso=-1  Then
//	MessageBox("Advertencia!","Debe especificar talla y recurso para las medidas.",StopSign!)
//	Return
//End If
//Super::Event ue_insertRow()
//
//i=GetRow()
//
//
//SetItem(i,"co_fabrica",il_fabrica)
//SetItem(i,"co_linea",il_linea)
//SetItem(i,"co_muestra",il_muestra)
//SetItem(i,"co_talla",il_talla)
//SetItem(i,"co_diseno",il_diseno)  
//SetItem(i,"co_recurso",il_recurso )  

end event

type dw_medidas1 from u_dw_application within tabpage_1
event ue_move pbm_move
integer x = 18
integer width = 3241
integer height = 888
string dataobject = "d_dt_med_mue"
boolean hscrollbar = true
boolean border = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_move;//x=1440
//y=284
end event

event getfocus;call super::getfocus;tabtextcolor=Rgb(0,0,255)
end event

event itemchanged;call super::itemchanged;ib_cambios=True
Long	ll_parte_bas, ll_filas,ll_res
String ls_medida, ls_medida_ant

ls_medida_ant = this.getitemstring( row, "ca_cm")

Accepttext()

choose case dwo.name
	case "co_partebas", "ca_cm"
		ll_parte_bas = this.getitemnumber(row, "co_partebas")
		ls_medida = this.getitemstring( row, "ca_cm")
		ll_filas = 0
		IF not isnull(ll_parte_bas) AND not isnull(ls_medida) THEN
			ll_filas = dw_validacion_est.retrieve( il_recurso,il_fabrica, il_linea,il_muestra,il_diseno,ll_parte_bas,ls_medida, il_talla )
		END IF	
		IF ll_filas > 0 Then			
			ll_res = MessageBox("Advertencia!","La muestra tiene medidas diferentes en otros recursos ~n~r Por definici$$HEX1$$f300$$ENDHEX$$n estas medidas deber$$HEX1$$ed00$$ENDHEX$$an ser iguales en todos los casos ~n~r $$HEX2$$bf002000$$ENDHEX$$Est$$HEX2$$e1002000$$ENDHEX$$seguro(a) de aplicar los cambios?",Question!,YesNo!,2)
		   If ll_res = 2 Then
				this.setitem(row,"ca_cm",ls_medida_ant)
			End If
		End if	
		dw_validacion_est.reset()
		Return 2
end choose
end event

event losefocus;call super::losefocus;tabtextcolor=Rgb(0,0,0)
end event

event ue_insertrow;long i,ll_recurso


If il_talla=-1 or il_recurso=-1 or isnull(il_recurso) Then
	MessageBox("Advertencia!","Debe especificar talla y recurso para las medidas.",StopSign!)
	Return
End If
Super::Event ue_insertRow()

i=GetRow()


SetItem(i,"co_fabrica",il_fabrica)
SetItem(i,"co_linea",il_linea)
SetItem(i,"co_muestra",il_muestra)
SetItem(i,"co_tipoprod",il_tipo_Prod)
SetItem(i,"co_talla",il_talla)
SetItem(i,"co_diseno",il_diseno)  
SetItem(i,"co_recurso",il_recurso )  

end event

event itemerror;If IsNull(data) Then
	Return 2
Else
	Return 1	
End If	

end event

type tabpage_2 from userobject within tab_medidas
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3534
integer height = 1504
long backcolor = 80269524
string text = "Reposadas (Ctrl+3)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
cb_3 cb_3
cb_2 cb_2
dw_validacion dw_validacion
dw_med_rep dw_med_rep
gb_1 gb_1
gb_2 gb_2
end type

on tabpage_2.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.dw_validacion=create dw_validacion
this.dw_med_rep=create dw_med_rep
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_3,&
this.cb_2,&
this.dw_validacion,&
this.dw_med_rep,&
this.gb_1,&
this.gb_2}
end on

on tabpage_2.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.dw_validacion)
destroy(this.dw_med_rep)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type cb_3 from commandbutton within tabpage_2
integer x = 3168
integer y = 180
integer width = 233
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Norma"
end type

event clicked;String 		ls_key , ls_path
long 			ll
OLEObject	xlapp

/*
* Del .ini, se trae con el nombre de la secci$$HEX1$$f300$$ENDHEX$$n "rutanorma" y el nombre
* de la clave se arma asi:  'NORMAS'+ codigo del tipo de producto
*/
SetPointer(HourGlass!) 
ls_key = "NORMAS"+String(il_tipo_prod)
ls_path = n_cst_application.of_GetProfile ( n_cst_application.is_pathfileconf, "rutanombre", ls_key)
IF ls_path = '' THEN 
	MessageBox("$$HEX1$$a100$$ENDHEX$$Atenci$$HEX1$$f300$$ENDHEX$$n!", "No esta disponible el sitio de Normas para el tipo de producto "+String(il_tipo_prod))
	RETURN
END IF
xlApp = Create OLEObject
// Connect to Excel and check the return code
ll = xlApp.ConnectToNewObject( "Excel.Sheet" )
if ll < 0  then
	MessageBox("Connect to Excel Failed!",string(ll))
   return -1
end if

xlApp.Application.Workbooks.Open(ls_path, false) 
xlApp.Application.Visible = true 
end event

type cb_2 from commandbutton within tabpage_2
integer x = 3168
integer y = 36
integer width = 233
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Partes"
end type

event clicked;//////////////////////////////////////////////////////////////////////////
// Se toman las partes y se colocan todas
// 
//////////////////////////////////////////////////////////////////////////
DatawindowChild ldc_1
Long 		ll_grupoprod

ll_grupoprod = dw_muestra.GetItemNumber(1,"co_grupoprod")

If ll_grupoprod=-1 or isnull(ll_grupoprod) Then
	MessageBox("Advertencia!","Debe especificar el Grupo de Tipo de Producto para la muestra.",StopSign!)
	dw_muestra.SetColumn('co_grupoprod' )
	dw_muestra.SetFocus()
	Return
End If

If dw_med_rep.RowCount()>0 Then
	Return
End If

If il_talla=-1  or isnull(il_recurso) Or il_recurso =-1 Then
	MessageBox("Advertencia!","Debe especificar la talla y el recurso.",StopSign!)
	Return
End If	
/*
* Se deben recuperar las medidas del Grupo de tipo de producto
*/
dw_med_rep.GetChild("id_med_rep",ldc_1)
ldc_1.SetTransObject(n_cst_application.itr_appl)
ldc_1.Retrieve(ll_grupoprod)

long i,ll_tot
String ls_med_rep

ll_tot=ldc_1.RowCount()

For i=1 to ll_tot
	
	ls_med_rep=ldc_1.GetItemString(i,"id_med_rep")
	dw_med_rep.InsertRow(0)
	
	dw_med_rep.SetItem(i,"co_fabrica",il_fabrica)
	dw_med_rep.SetItem(i,"co_linea",il_linea)
	dw_med_rep.SetItem(i,"co_muestra",il_muestra)
	dw_med_rep.SetItem(i,"co_talla",il_talla)
	dw_med_rep.SetItem(i,"co_diseno",il_diseno) //se maneja un solo dise$$HEX1$$f100$$ENDHEX$$o
	dw_med_rep.SetItem(i,"co_tipoprod",il_tipo_prod)
	dw_med_rep.SetItem(i,"id_med_rep",ls_med_rep)
	dw_med_rep.SetItem(i,"co_recurso",il_recurso)	
Next

end event

type dw_validacion from u_dw_application within tabpage_2
integer x = 1349
integer y = 72
integer width = 1591
integer height = 1036
integer taborder = 50
string dataobject = "d_valida_med_rep_mue_gral"
boolean hscrollbar = true
boolean border = true
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

type dw_med_rep from u_dw_application within tabpage_2
event ue_move pbm_move
integer x = 27
integer y = 72
integer width = 1243
integer height = 1036
string dataobject = "d_dt_med_mue_rep"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event ue_move;//x=1440
//y=284
end event

event getfocus;call super::getfocus;tabtextcolor=Rgb(0,0,255)
end event

event itemchanged;call super::itemchanged;n_cst_comun lo_pulg
//2015-06-16 Solicitud: 51249 Ceiba/JJ
If dwo.name="ca_cm" Then
	SetItem(row,"ca_pulg",lo_pulg.of_mmToPulg(Dec(Data)))
	SetItem(row,"fe_actualizacion",today())			
	SetItem(row,"usuario",gs_usuario)		
	SetItem(row,"instancia",gs_instancia)	
ElseIf dwo.name="ca_pulg" Then
	SetItem(row,"ca_cm",lo_pulg.of_PulgTomm(Data))
	SetItem(row,"fe_actualizacion",today())			
	SetItem(row,"usuario",gs_usuario)		
	SetItem(row,"instancia",gs_instancia)	
End If

IF dwo.name="ca_cm" oR dwo.name="ca_pulg" THEN
	IF of_verificar_medidas( row) = -1 THEN
		RETURN 1
	END IF
END IF

ib_cambios=True
//2015-06-16 Solicitud: 51249 Ceiba/JJ - 51249
ib_cambios_medReposadas = True 
end event

event losefocus;call super::losefocus;tabtextcolor=Rgb(0,0,0)
end event

event ue_insertrow;long i


If il_talla=-1 or il_recurso=-1 or isnull(il_recurso) Then
	MessageBox("Advertencia!","Debe especificar talla y recurso para las medidas.",StopSign!)
	Return
End If

Super::Event ue_insertRow()

i=GetRow()

SetItem(i,"co_fabrica",il_fabrica)
SetItem(i,"co_linea",il_linea)
SetItem(i,"co_muestra",il_muestra)
SetItem(i,"co_tipoprod",il_tipo_Prod)
SetItem(i,"co_talla",il_talla)
SetItem(i,"co_diseno",il_diseno)  
SetItem(i,"co_recurso",il_recurso )  
//2015-06-16 Solicitud: 51249 Ceiba/JJ
SetItem(i,"fe_actualizacion",today())			
SetItem(i,"usuario",gs_usuario)		
SetItem(i,"instancia",gs_instancia)	
end event

event itemerror;RETURN 1
end event

event ue_deleterow;call super::ue_deleterow;/***********************************************************
SA52837 Ceiba/JJ
Comentario: Validar si una fila o no eliminada
***********************************************************/
Long ll_Del
ll_Del = THIS.DeletedCount( )
IF ll_Del > 0 THEN ib_cambios_medReposadas = True


end event

type gb_1 from groupbox within tabpage_2
integer x = 1321
integer y = 4
integer width = 1696
integer height = 1148
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Medidas diferentes"
end type

type gb_2 from groupbox within tabpage_2
integer x = 9
integer y = 4
integer width = 1294
integer height = 1148
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type tabpage_3 from userobject within tab_medidas
integer x = 18
integer y = 104
integer width = 3534
integer height = 1504
long backcolor = 80269524
string text = "Producci$$HEX1$$f300$$ENDHEX$$n Te$$HEX1$$f300$$ENDHEX$$rica (Ctrl+4)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_teorica_mue dw_teorica_mue
end type

on tabpage_3.create
this.dw_teorica_mue=create dw_teorica_mue
this.Control[]={this.dw_teorica_mue}
end on

on tabpage_3.destroy
destroy(this.dw_teorica_mue)
end on

type dw_teorica_mue from u_dw_application within tabpage_3
event ue_move pbm_move
integer x = -5
integer y = 8
integer width = 3534
integer height = 984
integer taborder = 20
string dataobject = "d_m_producc_teo_mue_ing"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event ue_move;//x=1440
//y=284
end event

event getfocus;call super::getfocus;tabtextcolor=Rgb(0,0,255)
end event

event itemchanged;call super::itemchanged;n_cst_comun lo_pulg

If dwo.name="ca_cm" Then
	SetItem(row,"ca_pulg",lo_pulg.of_mmToPulg(Dec(Data)))
ElseIf dwo.name="ca_pulg" Then
	SetItem(row,"ca_cm",lo_pulg.of_PulgTomm(Data))
End If

IF dwo.name="ca_cm" oR dwo.name="ca_pulg" THEN
	IF of_verificar_medidas( row) = -1 THEN
		RETURN 1
	END IF
END IF

ib_cambios=True
end event

event itemerror;RETURN 1
end event

event losefocus;call super::losefocus;tabtextcolor=Rgb(0,0,0)
end event

event ue_insertrow;long i


If il_talla=-1 or il_recurso=-1 or isnull(il_recurso) Then
	MessageBox("Advertencia!","Debe especificar talla y recurso para las medidas.",StopSign!)
	Return
End If

Super::Event ue_insertRow()

i=GetRow()

SetItem(i,"co_fabrica",il_fabrica)
SetItem(i,"co_linea",il_linea)
SetItem(i,"co_muestra",il_muestra)
SetItem(i,"co_tipoprod",il_tipo_Prod)
SetItem(i,"co_talla",il_talla)
SetItem(i,"co_diseno",il_diseno)  
SetItem(i,"co_recurso",il_recurso )  

end event

type dw_partes1 from u_dw_application within w_medidas_muestra_ref
boolean visible = false
integer x = 210
integer y = 400
integer width = 622
integer height = 1148
integer taborder = 30
boolean enabled = false
string dataobject = "d_dt_medidas_est"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

type dw_detalle from u_dw_application within w_medidas_muestra_ref
boolean visible = false
integer x = 3387
integer y = 552
integer width = 187
integer height = 240
integer taborder = 20
string dataobject = "d_dt_medidas_est"
boolean hscrollbar = true
boolean hsplitscroll = true
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

event itemchanged;call super::itemchanged;//n_cst_comun lo_pulg
//String ls_cad,ls_col
//
//ls_col=dwo.name
//
//ls_cad=This.Describe(dwo.name+"_pul.X")
//
//If ls_cad<>"!" Then
//	SetItem(row,dwo.name+"_pul",lo_pulg.of_mmToPulg(Dec(Data)))
//End If
//
//If right(ls_col,4)="_pul" Then
//	ls_col=mid(ls_col,1,len(ls_col) -4)
//	SetItem(row,ls_col,lo_pulg.of_PulgTomm(Data))
//End If
//
//
//ib_cambios=true
end event

event ue_insertrow;//If of_existe(1)<>1 Then
//	Return
//End If
//
//long i
//
//Super::Event ue_insertRow()
//
//i=GetRow()
//
//dw_detalle.SetItem(i,"co_fabrica",il_fabrica)
//dw_detalle.SetItem(i,"co_linea",il_linea)
//dw_detalle.SetItem(i,"co_muestra",il_muestra)
//dw_detalle.SetItem(i,"co_tipoprod",il_tipoProd)
//dw_detalle.SetItem(i,"co_talla",il_talla)
//dw_detalle.SetItem(i,"co_diseno",il_diseno)
//dw_detalle.SetItem(i,"co_recurso",il_recurso)
//
end event

event scrollvertical;call super::scrollvertical;////////////////////////////////////////////////////////////////////////////
//// JUAN FERNANDO VASQUEZ DUQE 
//// Viernes 31 de Enero de 2003 HORA 14:19:57:687
//// 
//// 
////////////////////////////////////////////////////////////////////////////
//
//dw_partes1.Object.datawindow.verticalscrollposition = scrollpos
end event

event sqlpreview;call super::sqlpreview;//MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!",sqlsyntax)

end event

event ue_deleterow;	 
If MessageBox("Eliminar Fila","Esta seguro(a) de eliminar la fila ?.",Question!,YesNo!,2) = 1 Then
	This.DeleteRow(0)
End If
This.SetFocus()
end event

type dw_muestra from u_dw_application within w_medidas_muestra_ref
integer x = 55
integer y = 64
integer width = 3511
integer height = 180
string dataobject = "d_muestras_medidas"
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

This.SetItem(ll_f,"co_tipoprod",il_tipoprod)


end event

event itemchanged;call super::itemchanged;long ll_Dato
n_cst_comun lo_comun
long ll_res, ll_grupoprod, ll_diseno, ll_retorno, ll_recurso
long ll_nulo 
string ls_nulo

SetNull(ll_nulo)
SetNull(ls_nulo)
		
DataWindowChild ldc_1


If il_err_item_change<>0 Then 
	Return 2
End If

If dw_detalle.RowCount()>0 Then
	MessageBox("Advertencia!","No se pueden modificar datos porque existe detalle.",StopSign!)
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
	//IF not IsNull(il_fabrica) AND  not IsNull(il_linea)  AND not IsNull(il_muestra) THEN
	IF of_nombreMuestra() = -1 THEN  RETURN 2 
	 
	ll_res = lo_comun.of_traergrupotipoprod( il_fabrica, il_linea, il_muestra, n_cst_application.itr_appl)
	If ll_res<>1 then
    	MessageBox("Advertencia!","Error al consultar el Grupo de tipo de producto para la muestra.~r~r"+&
		 									n_cst_application.itr_appl.SqlErrText,StopSign!)
		Return 1
	End If	
	SetItem(1,"co_grupoprod",lo_comun.of_getlong(1))
	
	ll_grupoprod = GetItemNumber(1,"co_grupoprod")
	
	If ll_grupoprod=-1 or isnull(ll_grupoprod) Then
		ll_grupoprod = 0 
	End If
 	
	/*
	* Se deben recuperar las medidas del Grupo de tipo de producto
	*/
	tab_medidas.tabpage_2.dw_med_rep.GetChild("id_med_rep",ldc_1)
	ldc_1.SetTransObject(n_cst_application.itr_appl)
	ldc_1.Retrieve(ll_grupoprod)	
End If

If dwo.name="co_tipoprod" Then
	il_tipoProd=Long(Data)
End If

If dwo.name="co_diseno" Then
	ll_dato=Long(Data)
	
	ll_res=lo_comun.of_nombreDisenoMuestra(il_fabrica,il_linea, il_muestra,il_talla,&
	ll_dato,n_cst_application.itr_appl)
	
	If ll_res<>1 then
		MessageBox("Advertencia!","Dise$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If	
	
	ll_retorno = of_recurso_Utilizado(ll_recurso, ll_dato)
	
	IF ll_retorno > 0 THEN
		IF ll_recurso <> THIS.Object.co_recurso[1] THEN
			MessageBox("Advertencia!","El Dise$$HEX1$$f100$$ENDHEX$$o esta siendo utilizado por otro recurso.",StopSign!)
			SetItem(1,"co_diseno", ll_nulo)
			SetItem(1,"de_diseno", ls_nulo)
		
			RETURN 1
		END IF
	END IF
	
	SetItem(1,"de_diseno",lo_comun.of_getString(1))
	il_diseno=ll_dato
End If

If dwo.name="talla" Then
	ll_dato=Long(Data)
	
	ll_res=lo_comun.of_nombremuestratalla( il_fabrica,il_linea,&
	       il_muestra,ll_dato,n_cst_application.itr_appl)

	If ll_res<>1 then
		MessageBox("Advertencia!","Talla no v$$HEX1$$e100$$ENDHEX$$lida para la muestra.",StopSign!)
		Return 2
	End If	
	SetItem(1,"de_talla",lo_comun.of_getString(1))
	il_talla=ll_dato
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
	
	ll_retorno  = of_recuperar_diseno(ll_diseno)
	
	IF ll_retorno > 0 THEN
		
		THIS.object.co_diseno.protect= TRUE
		ll_res=lo_comun.of_nombreDisenoMuestra(il_fabrica,il_linea, il_muestra,il_talla,&
		ll_diseno,n_cst_application.itr_appl)
		
		If ll_res<>1 then
			MessageBox("Advertencia!","Dise$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
			Return 2
		End If	
		SetItem(1,"co_diseno", ll_diseno)
		SetItem(1,"de_diseno",lo_comun.of_getString(1))
		il_diseno=ll_diseno		
	ELSE
		IF of_diseno_automatico() <> -1 THEN
			This.accepttext( )
		ELSE
			THIS.object.co_diseno.protect= FALSE
			SetItem(1,"co_diseno", ll_nulo)
			SetItem(1,"de_diseno", ls_nulo)
			il_diseno = -1
		END IF		
	END IF	
End If

///dw_head_ref.Reset()
tab_medidas.tabpage_1.dw_medidas1.Reset()
tab_medidas.tabpage_2.dw_med_rep.Reset()
tab_medidas.tabpage_2.dw_validacion.Reset()
tab_medidas.tabpage_1.dw_observacion.Reset()

IF of_existe(0) = 2 THEN
	SetNull(il_recurso)
	SetItem(1,"co_recurso",il_recurso)
	SetItem(1,"de_recurso_tejido",'')
	il_recurso = -1	
	RETURN 1
END IF

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


If dwo.name="talla" Then
	lo_param.il_vector[1]=il_fabrica
	lo_param.il_vector[2]=il_linea
	lo_param.il_vector[3]=il_muestra
	             
	OpenWithParm(w_bus_tallas_muestra,lo_param)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If
	
End If


If dwo.name="co_diseno" Then
	lo_param.il_vector[1]=il_fabrica
	lo_param.il_vector[2]=il_linea
	lo_param.il_vector[3]=il_muestra
	lo_param.il_vector[4]=il_talla
	

//Messagebox('Var','lo_param.il_vector[1]='+String(lo_param.il_vector[1])+'~n'+&
//'lo_param.il_vector[2]='+String(lo_param.il_vector[2])+'~n'+&
//'lo_param.il_vector[3]='+String(lo_param.il_vector[3])+'~n'+&
//'lo_param.il_vector[4]='+String(lo_param.il_vector[4])+'~n')

	OpenWithParm(w_busins_m_disenos_muestras,lo_param)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If
	
End If
Long ll_res 
If dwo.name="co_recurso" Then
	// Devuelve el resultado de evaluar la expresion if(co_diseno = 1,1,0)
	// de acuerdo al valor que tenga el campo co_diseno.
	ll_res = Long(dw_muestra.Describe("evaluate('if(co_diseno = 1,1,0)',1)" ) )

   // Si el valor es cero, quiere decir que se puede digitar o seleccionar
	// el recurso.
	// Si es uno, quiere decir que no se puede seleccionar otro recurso.
	IF ll_res =  0 THEN
	
		lo_param.il_vector[1]=il_Tipoprod
		OpenWithParm(w_bus_m_recurso_tj, lo_param)
		
		lo_param=Message.PowerObjectParm
		
		If IsValid(lo_param) Then
			SetText(String(lo_param.il_vector[1]))
		End If
			
	END IF	
	
End If

end event

event itemerror;RETURN 1
end event

type gb_referencia from u_gb_base within w_medidas_muestra_ref
integer x = 27
integer width = 3579
integer height = 256
string text = "Muestra"
end type

