HA$PBExportHeader$w_med_ref.srw
$PBExportComments$Nuevas medidas de referencia
forward
global type w_med_ref from w_sheet
end type
type tab_1 from tab within w_med_ref
end type
type tabpage_1 from userobject within tab_1
end type
type dw_panel from u_dw_application within tabpage_1
end type
type dw_detalle from u_dw_application within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_panel dw_panel
dw_detalle dw_detalle
end type
type tabpage_2 from userobject within tab_1
end type
type dw_validacion from u_dw_application within tabpage_2
end type
type dw_med_rep from u_dw_application within tabpage_2
end type
type gb_1 from groupbox within tabpage_2
end type
type gb_2 from groupbox within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_validacion dw_validacion
dw_med_rep dw_med_rep
gb_1 gb_1
gb_2 gb_2
end type
type tab_1 from tab within w_med_ref
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type st_1 from statictext within w_med_ref
end type
type dw_referencia from u_dw_application within w_med_ref
end type
type gb_referencia from u_gb_base within w_med_ref
end type
end forward

global type w_med_ref from w_sheet
integer width = 3657
integer height = 3620
boolean titlebar = false
string title = ""
string menuname = "m_medidas_ref"
boolean controlmenu = false
boolean minbox = false
boolean border = false
windowstate windowstate = maximized!
event ue_informe_referencia ( )
event ue_copiar_datos ( )
event ue_borrar_medidas ( )
event ue_teorica ( )
event ue_exportar_plantillas ( )
tab_1 tab_1
st_1 st_1
dw_referencia dw_referencia
gb_referencia gb_referencia
end type
global w_med_ref w_med_ref

type variables
boolean ib_cambios

String is_where,is_where_copia

long il_fabrica,il_linea,il_referencia,il_talla,il_calidad
long il_tipoprod,il_recurso,il_diseno

DataWindowChild idc_parte_base,idc_talla, idc_med_rep,idc_parte_base1
end variables

forward prototypes
public function integer of_nombrereferencia ()
public function integer of_partesbase ()
public function integer of_parte_base_rep ()
public function integer of_verificar ()
public function integer of_verpulgadas ()
public function integer of_iniciar ()
public function integer of_actualizaborrados ()
public function integer of_grabar ()
public function integer of_recuperar_encabezado ()
public function integer of_recuperar_detalle ()
public function integer of_cambio_recurso ()
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

If tab_1.tabpage_1.dw_detalle.RowCount()=0 Then
	MessageBox("Advertencia!","No existen medidas.",StopSign!)
	Return
End If

n_cst_param lo_param

lo_param.il_vector[1]=il_fabrica
lo_param.il_vector[2]=il_linea
lo_param.il_vector[3]=il_referencia
lo_param.il_vector[4]=il_talla
lo_param.il_vector[5]=il_calidad
lo_param.il_vector[6]=il_diseno
lo_param.il_vector[7]=il_recurso


OpenSheetWithParm(w_inf_med_ref,lo_param,ParentWindow(),2,Original!)

end event

event ue_copiar_datos();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 09 de Diciembre de 2002 HORA 11:50:06:968
// 
// Para copiar los datos de otra referencia+recurso
//////////////////////////////////////////////////////////////////////////
n_cst_param lou_param


If tab_1.tabpage_1.dw_detalle.RowCount()>0 Then
	MessageBox("Advertencia!","La referencia tiene medidas, solo es posible hacer copia a referencias sin medidas.",StopSign!)
	Return
End If

//If dw_referencia.AcceptText()<>1 Then
//	Return
//End If
//
OpenWithParm(w_opc_ref_recurso_bas,is_where_copia)


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

lds_1.DataObject=tab_1.tabpage_1.dw_detalle.DataObject

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
tab_1.tabpage_1.dw_detalle.setRedraw(False)
lds_1.RowsCopy(1,ll_tot,Primary!,tab_1.tabpage_1.dw_detalle,1,Primary!)

For i=1 to ll_tot
	tab_1.tabpage_1.dw_detalle.setItem(i,"co_fabrica",il_fabrica)
	tab_1.tabpage_1.dw_detalle.setItem(i,"co_linea",il_linea)
	tab_1.tabpage_1.dw_detalle.setItem(i,"co_referencia",il_referencia)
	tab_1.tabpage_1.dw_detalle.setItem(i,"co_talla",il_talla)
	tab_1.tabpage_1.dw_detalle.setItem(i,"co_fabrica",il_fabrica)
	tab_1.tabpage_1.dw_detalle.setItem(i,"co_calidad",il_calidad)
	tab_1.tabpage_1.dw_detalle.setItem(i,"co_recurso",il_recurso)
	tab_1.tabpage_1.dw_detalle.setItem(i,"co_diseno",il_diseno)
	
	//////////////////////////////////////////////////////////////////////////
	// Si la talla es diferente no se deben copiar las medidas
	// 
	//////////////////////////////////////////////////////////////////////////
	
	If ll_talla<>il_talla Then
		tab_1.tabpage_1.dw_detalle.setItem(i,"ca_cm","")
		tab_1.tabpage_1.dw_detalle.setItem(i,"cadena","")
		tab_1.tabpage_1.dw_detalle.setItem(i,"pasadas","")
	End If
Next

tab_1.tabpage_1.dw_detalle.SetRedraw(True)

//////////////////////////////////////////////////////////////////////////
// Se copian tambien las medidas reposadas en caso de que existan
// 
//////////////////////////////////////////////////////////////////////////

If tab_1.tabpage_2.dw_med_rep.rowCount()=0 Then
	lds_1.DataObject=tab_1.tabpage_2.dw_med_rep.DataObject
	lds_1.SetTransObject(n_cst_application.itr_appl)

   //Messagebox('Var','ll_tot='+String(ll_tot)+'~n')
	ll_tot=lds_1.Retrieve(ll_fabrica,ll_linea,ll_referencia,ll_talla,ll_calidad,ll_diseno,ll_recurso)

	tab_1.tabpage_2.dw_med_rep.setRedraw(False)
	lds_1.RowsCopy(1,ll_tot,Primary!,tab_1.tabpage_2.dw_med_rep,1,Primary!)

	For i=1 to ll_tot
		tab_1.tabpage_2.dw_med_rep.setItem(i,"co_fabrica",il_fabrica)
		tab_1.tabpage_2.dw_med_rep.setItem(i,"co_linea",il_linea)
		tab_1.tabpage_2.dw_med_rep.setItem(i,"co_referencia",il_referencia)
		tab_1.tabpage_2.dw_med_rep.setItem(i,"co_talla",il_talla)
		tab_1.tabpage_2.dw_med_rep.setItem(i,"co_fabrica",il_fabrica)
		tab_1.tabpage_2.dw_med_rep.setItem(i,"co_calidad",il_calidad)
		tab_1.tabpage_2.dw_med_rep.setItem(i,"co_recurso",il_recurso)
		tab_1.tabpage_2.dw_med_rep.setItem(i,"co_diseno",il_diseno)
		//////////////////////////////////////////////////////////////////////////
		// Si la talla es diferente no se deben copiar las medidas 
		// 
		//////////////////////////////////////////////////////////////////////////

		
		If ll_talla<>il_talla Then
			tab_1.tabpage_2.dw_med_rep.setItem(i,"ca_cm",0)
			tab_1.tabpage_2.dw_med_rep.setItem(i,"ca_pulg","")
		End If
	Next

	of_verPulgadas()
	tab_1.tabpage_2.dw_med_rep.setRedraw(True)
End If

ib_cambios=True


end event

event ue_borrar_medidas();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 27 de Diciembre de 2002 HORA 09:36:12:281
// 
// Para borrar las medidas de una referencia
//////////////////////////////////////////////////////////////////////////
long ll_res,ll_tot,ll_tot1

ll_tot=tab_1.tabpage_1.dw_detalle.RowCount()
ll_tot1=tab_1.tabpage_2.dw_med_rep.RowCount()

If ll_tot=0 and ll_tot1=0 Then
	Return
End If

ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Esta seguro de borrar las medidas ?",Question!,YesNo!,2)
If ll_res=2 Then
	Return
End If

DO WHILE tab_1.tabpage_1.dw_detalle.RowCount()>0
	tab_1.tabpage_1.dw_detalle.DeleteRow(0)
LOOP

DO WHILE tab_1.tabpage_2.dw_med_rep.RowCount()>0
	tab_1.tabpage_2.dw_med_rep.DeleteRow(0)
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

//Messagebox('Var','il_recurso='+String(il_recurso)+'~n'+&
//'il_fabrica='+String(il_fabrica)+'~n'+&
//'il_linea='+String(il_linea)+'~n'+&
//'il_referencia='+String(il_referencia)+'~n'+&
//'il_talla='+String(il_talla)+'~n'+&
//'il_calidad='+String(il_calidad)+'~n')

OpenWithParm(w_teorica_referencia,lo_param)





end event

event ue_exportar_plantillas();OpenSheet(w_lista_referencias_con_medida,ParentWindow(),2,Original!)
end event

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


Return 1
end function

public function integer of_partesbase ();long i,ll_tot,ll_cod,ll_clasificacion,ll_f

ll_tot=idc_parte_base.RowCount()

For i=1 To ll_tot
	
	ll_cod=idc_parte_base.GetItemNumber(i,"co_partebas")
	ll_clasificacion=idc_parte_base.GetItemNumber(i,"co_clasificacion")
	If not IsNull(ll_cod) and ll_clasificacion=1 Then
		
		ll_f=tab_1.tabpage_1.dw_detalle.InsertRow(0)
		tab_1.tabpage_1.dw_detalle.SetItem(ll_f,"co_fabrica",il_fabrica)
		tab_1.tabpage_1.dw_detalle.SetItem(ll_f,"co_linea",il_linea)
		tab_1.tabpage_1.dw_detalle.SetItem(ll_f,"co_referencia",il_referencia)
		tab_1.tabpage_1.dw_detalle.SetItem(ll_f,"co_tipoprod",il_tipoprod)
		tab_1.tabpage_1.dw_detalle.SetItem(ll_f,"co_calidad",il_calidad)
		tab_1.tabpage_1.dw_detalle.SetItem(ll_f,"co_partebas",ll_cod)
		tab_1.tabpage_1.dw_detalle.SetItem(ll_f,"co_talla",il_talla)
		tab_1.tabpage_1.dw_detalle.SetItem(ll_f,"co_recurso",il_recurso)
		tab_1.tabpage_1.dw_detalle.SetItem(ll_f,"co_diseno",il_diseno)
	End If
Next

Return 1




















end function

public function integer of_parte_base_rep ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 06 de Diciembre de 2003 HORA 16:00:06:583
// 
// Partes base para las medidas reposadas
//////////////////////////////////////////////////////////////////////////

long 		i,ll_tot,ll_cod,ll_clasificacion,ll_f
String 	ls_med_rep

ll_tot=idc_med_rep.RowCount()

For i=1 To ll_tot
	
	ls_med_rep=idc_med_rep.GetItemString(i,"id_med_rep")

	ll_f=tab_1.tabpage_2.dw_med_rep.InsertRow(0)
	tab_1.tabpage_2.dw_med_rep.SetItem(ll_f,"co_fabrica",il_fabrica)
	tab_1.tabpage_2.dw_med_rep.SetItem(ll_f,"co_linea",il_linea)
	tab_1.tabpage_2.dw_med_rep.SetItem(ll_f,"co_referencia",il_referencia)
	tab_1.tabpage_2.dw_med_rep.SetItem(ll_f,"co_tipoprod",il_tipoprod)
	tab_1.tabpage_2.dw_med_rep.SetItem(ll_f,"co_calidad",il_calidad)
	tab_1.tabpage_2.dw_med_rep.SetItem(ll_f,"id_med_rep",ls_med_rep)
	tab_1.tabpage_2.dw_med_rep.SetItem(ll_f,"co_talla",il_talla)
	tab_1.tabpage_2.dw_med_rep.SetItem(ll_f,"co_recurso",il_recurso)
	tab_1.tabpage_2.dw_med_rep.SetItem(ll_f,"co_diseno",il_diseno)
	
Next

Return 1




















end function

public function integer of_verificar ();

If tab_1.tabpage_1.dw_detalle.accepttext()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos en medidas de tejido.",StopSign!)
	Return -1
End If

If tab_1.tabpage_2.dw_med_rep.accepttext()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos en medidas reposadas.",StopSign!)
	Return -1
End If

//////////////////////////////////////////////////////////////////////////
// Se ordenan los datos y verifica que no se
// repitan
//////////////////////////////////////////////////////////////////////////
tab_1.tabpage_1.dw_detalle.SetRedraw(False)
tab_1.tabpage_1.dw_detalle.SetSort("co_partebas A")
tab_1.tabpage_1.dw_detalle.Sort()

long ll_tot,i,ll_medida,ll_medida1,ll_res

ll_tot=tab_1.tabpage_1.dw_detalle.RowCount()

String ls_medida, ls_medida1, ls_desc_medida

For i=1 To ll_tot - 1
	ll_medida  = tab_1.tabpage_1.dw_detalle.GetItemNumber(i  ,"co_partebas")
	ll_medida1 = tab_1.tabpage_1.dw_detalle.GetItemNumber(i+1,"co_partebas")
	
	If ll_medida=ll_medida1 Then		
		ls_desc_medida=Trim(tab_1.tabpage_1.dw_detalle.Describe(&
		"Evaluate('LookUpDisplay(co_partebas) ', " &
        + String(i) + ")"))
		  
		tab_1.SelectTab(1)
		
		tab_1.tabpage_1.dw_detalle.SetSort("orden_partebas A")
		tab_1.tabpage_1.dw_detalle.Sort()
		tab_1.tabpage_1.dw_detalle.SetRedraw(True)
		tab_1.tabpage_1.dw_detalle.SetFocus()

  
		MessageBox("Advertencia!","La siguiente medida est$$HEX2$$e1002000$$ENDHEX$$repetida "+ls_desc_medida+&
		". Por favor verifique.",StopSign!)
		Return -1
	End If
	
Next

tab_1.tabpage_1.dw_detalle.SetSort("orden_partebas A")
tab_1.tabpage_1.dw_detalle.Sort()
tab_1.tabpage_1.dw_detalle.SetRedraw(True)

tab_1.tabpage_2.dw_med_rep.Sort()
ll_tot=tab_1.tabpage_2.dw_med_rep.RowCount()

//////////////////////////////////////////////////////////////////////////
// En las medidas reposadas se deben tener 6, y todas con valores
/***********************************************************
SA51249 - Ceiba/JJ - Julio 14 2015
Comentario: Se modifica la validacion- la anterior permitia solo tener 6 medidas reposadas,
la nueva validacion permite menos de 2 medidas reposadas
***********************************************************/
If ll_tot< 2 Then
	tab_1.SelectTab(2)	
	MessageBox("Advertencia!","Se deben tener como minimo 2 medidas reposadas.",StopSign!)
	Return -1
End If

Decimal lde_cm

For i=1 To ll_tot

	lde_cm=tab_1.tabpage_2.dw_med_rep.GetItemDecimal(i,"ca_cm")
	
	If IsNull(lde_cm) Then lde_cm=0
	
	//////////////////////////////////////////////////////////////////////////
	// Si la medida no es mayor a 0 se debe hacer la advertencia
	// 
	//////////////////////////////////////////////////////////////////////////
	
	If lde_cm<=0 Then
		ls_desc_medida=Trim(tab_1.tabpage_2.dw_med_rep.Describe(&
		"Evaluate('LookUpDisplay(id_med_rep) ', " &
        + String(i) + ")"))
		  
		tab_1.SelectTab(2)		
		tab_1.tabpage_2.dw_med_rep.SetFocus()
		
		MessageBox("Advertencia!","La medida de : "+ls_desc_medida+&
		". No es v$$HEX1$$e100$$ENDHEX$$lida, por favor verifique.",StopSign!)
		Return -1		
	End If
	
	ls_medida  = tab_1.tabpage_2.dw_med_rep.GetItemString(i  ,"id_med_rep")
	
	If i<ll_tot Then
		ls_medida1 = tab_1.tabpage_2.dw_med_rep.GetItemString(i+1,"id_med_rep")
	
	
		If ls_medida=ls_medida1 Then
			ls_desc_medida=Trim(tab_1.tabpage_2.dw_med_rep.Describe(&
			"Evaluate('LookUpDisplay(id_med_rep) ', " &
			  + String(i) + ")"))
			  
			tab_1.SelectTab(2)		
			
			MessageBox("Advertencia!","La siguiente medida est$$HEX2$$e1002000$$ENDHEX$$repetida: "+ls_desc_medida+&
			". Por favor verifique.",StopSign!)
			Return -1
		End If
	End If
Next

//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Jueves 31 de Agosto de 2006 HORA 09:48:56:109
// 
// En las medidas reposadas se debe mirar si no hay diferentes en otros
// recursos y mostrar mensaje de advertencia.
//////////////////////////////////////////////////////////////////////////

decimal lde_ma,lde_mb,lde_mc,lde_md,lde_me,lde_mf


lde_ma=tab_1.tabpage_2.dw_med_rep.GetItemDecimal(1,"ca_cm")
lde_mb=tab_1.tabpage_2.dw_med_rep.GetItemDecimal(2,"ca_cm")
lde_mc=tab_1.tabpage_2.dw_med_rep.GetItemDecimal(3,"ca_cm")
lde_md=tab_1.tabpage_2.dw_med_rep.GetItemDecimal(4,"ca_cm")
lde_me=tab_1.tabpage_2.dw_med_rep.GetItemDecimal(5,"ca_cm")
lde_mf=tab_1.tabpage_2.dw_med_rep.GetItemDecimal(6,"ca_cm")

ll_tot=tab_1.tabpage_2.dw_validacion.&
       Retrieve(il_recurso,&
		          il_fabrica,&
					 il_linea,&
					 il_referencia,&
					 il_talla,&
					 il_calidad,&
					 il_diseno,&
					 lde_ma,&
					 lde_mb,&
					 lde_mc,&
					 lde_md,&
					 lde_me,&
					 lde_mf)
					 
If ll_tot>0 Then
   MessageBox("Advertencia!","La referencia tiene medidas reposadas diferentes en otros recursos.~n~r"+&
	"Por definici$$HEX1$$f300$$ENDHEX$$n estas medidas deber$$HEX1$$ed00$$ENDHEX$$an ser iguales en todos los casos.",StopSign!)
	

	ll_res=MessageBox("Advertencia!","La referencia tiene medidas reposadas diferentes en otros recursos ~n~r$$HEX2$$bf002000$$ENDHEX$$Desea guardar los datos ?",Question!,YesNo!,2)
   If ll_res=2 Then
		Return -1
	End If
End If

					 

//
//	  UPDATE dt_med_ref  
//     SET instancia = DBSERVERNAME
//   WHERE ( dt_med_ref.co_centro = 12 ) AND  
//         ( dt_med_ref.co_subcentro = 12 ) AND  
//         ( dt_med_ref.co_recurso = :il_recurso ) AND  
//         ( dt_med_ref.co_fabrica = :il_fabrica ) AND  
//         ( dt_med_ref.co_linea = :il_linea ) AND  
//         ( dt_med_ref.co_referencia = :il_referencia ) AND  
//         ( dt_med_ref.co_talla = :il_talla ) AND  
//         ( dt_med_ref.co_calidad = :il_calidad ) AND  
//         ( dt_med_ref.co_diseno = :il_diseno ) AND  
//         ( dt_med_ref.co_tipoprod = :il_tipoprod ) AND  
//         ( dt_med_ref.co_partebas = :ll_partebas ) 
//			using n_cst_application.itr_appl;
//
//





Return 1



end function

public function integer of_verpulgadas ();n_cst_comun lo_pulg
Long i,ll_tot

ll_tot=tab_1.tabpage_2.dw_med_rep.RowCount()


For i=1 to ll_tot
	tab_1.tabpage_2.dw_med_rep.SetItem(i,"ca_pulg",lo_pulg.of_mmToPulg(&
	tab_1.tabpage_2.dw_med_rep.GetItemDecimal(i,"ca_cm")))	
Next

Return 1
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
tab_1.tabpage_1.dw_detalle.Reset()

tab_1.tabpage_2.dw_med_rep.reset()
//.InsertRow(0)


ib_cambios=False

Return 1
end function

public function integer of_actualizaborrados ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 12 de Noviembre de 2003 HORA 14:20:07:831
// 
// Es necesario hacer un update antes del delete para los
// trigger que actualmente se estan manejando
//////////////////////////////////////////////////////////////////////////
long 			ll_tot,i
long 			ll_partebas
String    	ls_med_rep

ll_tot=tab_1.tabpage_1.dw_detalle.deletedcount()


For i=1 To ll_tot
	ll_partebas=tab_1.tabpage_1.dw_detalle.GetItemNumber(i,"co_partebas",delete!,True)
	
//////////////////////////////////////////////////////////////////////////
// Se actualiza el dato de instancia
// esto se hace antes de borrar para que la replicacion funcione adecuadamente
//////////////////////////////////////////////////////////////////////////
	  UPDATE dt_med_ref  
     SET instancia = DBSERVERNAME
   WHERE ( dt_med_ref.co_centro = 12 ) AND  
         ( dt_med_ref.co_subcentro = 12 ) AND  
         ( dt_med_ref.co_recurso = :il_recurso ) AND  
         ( dt_med_ref.co_fabrica = :il_fabrica ) AND  
         ( dt_med_ref.co_linea = :il_linea ) AND  
         ( dt_med_ref.co_referencia = :il_referencia ) AND  
         ( dt_med_ref.co_talla = :il_talla ) AND  
         ( dt_med_ref.co_calidad = :il_calidad ) AND  
         ( dt_med_ref.co_diseno = :il_diseno ) AND  
         ( dt_med_ref.co_tipoprod = :il_tipoprod ) AND  
         ( dt_med_ref.co_partebas = :ll_partebas ) 
			using n_cst_application.itr_appl;

	If n_cst_application.itr_appl.SQLcode=-1 Then 
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(n_cst_application.itr_appl)
		Return -1
	End If
	
Next


//////////////////////////////////////////////////////////////////////////
// se actualiza tambien la instancia en las medidas reposadas
// esto para garantizar la futura replicacion
//////////////////////////////////////////////////////////////////////////

ll_tot=tab_1.tabpage_2.dw_med_rep.deletedcount()

For i=1 To ll_tot
	ls_med_rep=tab_1.tabpage_2.dw_med_rep.GetItemString(i,"id_med_rep",delete!,True)
	
	
	  UPDATE dt_med_ref_rep  
     SET instancia = DBSERVERNAME
   WHERE ( dt_med_ref_rep.co_centro = 12 ) AND  
         ( dt_med_ref_rep.co_subcentro = 12 ) AND  
         ( dt_med_ref_rep.co_recurso = :il_recurso ) AND  
         ( dt_med_ref_rep.co_fabrica = :il_fabrica ) AND  
         ( dt_med_ref_rep.co_linea = :il_linea ) AND  
         ( dt_med_ref_rep.co_referencia = :il_referencia ) AND  
         ( dt_med_ref_rep.co_talla = :il_talla ) AND  
         ( dt_med_ref_rep.co_calidad = :il_calidad ) AND  
         ( dt_med_ref_rep.co_diseno = :il_diseno ) AND  
         ( dt_med_ref_rep.co_tipoprod = :il_tipoprod ) AND  
         ( dt_med_ref_rep.id_med_rep = :ls_med_rep ) 
			using n_cst_application.itr_appl;

	If n_cst_application.itr_appl.SQLcode=-1 Then 
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(n_cst_application.itr_appl)
		Return -1
	End If	
	
Next

Return 1
end function

public function integer of_grabar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 30 de Enero de 2004 HORA 14:47:12:774
// 
// 
//////////////////////////////////////////////////////////////////////////

DateTime ldt_fecha
String ls_usuario,ls_instancia

If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If


If tab_1.tabpage_1.dw_detalle.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
	Return -1
End If

If tab_1.tabpage_2.dw_med_rep.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
	Return -1
End If

If of_actualizaborrados()<>1 Then
	MessageBox("Advertencia!","Datos no guardados.",StopSign!)
	Return -1
End If


If tab_1.tabpage_1.dw_detalle.Update(True,False)<>1 Then
	RollBack using n_cst_application.itr_appl ;
	Return -1
End If


If tab_1.tabpage_2.dw_med_rep.Update(True,False)<>1 Then
	RollBack using n_cst_application.itr_appl ;
	Return -1
End If

tab_1.tabpage_1.dw_detalle.resetUpdate()
tab_1.tabpage_2.dw_med_rep.ResetUpdate()

Return 1
end function

public function integer of_recuperar_encabezado ();If dw_referencia.Retrieve(il_fabrica,il_linea,il_referencia)<=0 Then
	dw_referencia.Reset()
	tab_1.tabpage_1.dw_detalle.Reset()
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

public function integer of_recuperar_detalle ();Long i,ll_res
n_cst_comun lo_comun


tab_1.tabpage_1.dw_detalle.Retrieve(il_fabrica,il_linea,il_referencia,il_talla,il_calidad,il_diseno,il_recurso)

tab_1.tabpage_2.dw_med_rep.Retrieve(il_fabrica,il_linea,il_referencia,il_talla,il_calidad,il_diseno,il_recurso)
tab_1.tabpage_2.dw_validacion.reset()

//////////////////////////////////////////////////////////////////////////
// Coloco la descripcion si son pulgadas
// 
//////////////////////////////////////////////////////////////////////////
of_verPulgadas()

//////////////////////////////////////////////////////////////////////////
// Se eliminan los espacios a la derecha en las observaciones
// 
//////////////////////////////////////////////////////////////////////////

For i=1 to tab_1.tabpage_1.dw_detalle.RowCount()

	String ls_dato
	
	ls_dato=tab_1.tabpage_1.dw_detalle.GetItemString(i,"de_observacion")
	ls_dato=trim(ls_dato)
	tab_1.tabpage_1.dw_detalle.SetItem(i,"de_observacion",ls_dato)
	tab_1.tabpage_1.dw_detalle.SetItemStatus(i,0,Primary!,NotModified!	)
	tab_1.tabpage_1.dw_detalle.SetItemStatus(i,"de_observacion",Primary!,NotModified!	)
 Next


//////////////////////////////////////////////////////////////////////////
// Ahora coloco el equivalente de las medidas en pulgadas
// 
//////////////////////////////////////////////////////////////////////////


lo_comun.of_loadDddw(idc_talla,il_fabrica,il_linea,il_referencia,il_calidad,n_cst_application.itr_appl)

lo_comun.of_loadDddw(idc_parte_base,il_tipoProd,n_cst_application.itr_appl)

lo_comun.of_loadDddw(idc_med_rep,il_tipoProd,n_cst_application.itr_appl)


Return 1

end function

public function integer of_cambio_recurso ();

long ll_tot,ll_tot1,ll_res


of_recuperar_detalle()

ll_tot=tab_1.tabpage_1.dw_detalle.RowCount()
ll_tot1=tab_1.tabpage_2.dw_med_rep.RowCount()

If ll_tot=0 and ll_tot1=0 Then
	ll_res=MessageBox("Advertencia!","La Referencia no tiene medidas ~n~r$$HEX2$$bf002000$$ENDHEX$$Desea copiarlas de otra referencia ?",Question!,YesNo!,2)
	If ll_res=1 Then
		PostEvent("ue_copiar_datos")
	End If
End If
			
Return 1
end function

on w_med_ref.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_medidas_ref" then this.MenuID = create m_medidas_ref
this.tab_1=create tab_1
this.st_1=create st_1
this.dw_referencia=create dw_referencia
this.gb_referencia=create gb_referencia
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.dw_referencia
this.Control[iCurrent+4]=this.gb_referencia
end on

on w_med_ref.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.tab_1)
destroy(this.st_1)
destroy(this.dw_referencia)
destroy(this.gb_referencia)
end on

event open;call super::open;n_cst_comun lo_comun

dw_referencia.SetTransObject(n_cst_application.itr_appl)
tab_1.tabpage_1.dw_detalle.SetTransObject(n_cst_application.itr_appl)

tab_1.tabpage_2.dw_med_rep.SetTransObject(n_cst_application.itr_appl)
tab_1.tabpage_2.dw_validacion.SetTransObject(n_cst_application.itr_appl)


tab_1.tabpage_1.dw_detalle.GetChild("co_partebas",idc_parte_base)
lo_comun.of_loadDddw(idc_parte_base,-1,n_cst_application.itr_appl)

tab_1.tabpage_1.dw_panel.GetChild("co_partebas",idc_parte_base1)
idc_parte_Base.ShareData(idc_parte_base1)

tab_1.tabpage_1.dw_detalle.ShareData(tab_1.tabpage_1.dw_panel)

tab_1.tabpage_2.dw_med_rep.getChild("id_med_rep",idc_med_rep)
lo_comun.of_loadDddw(idc_med_rep,n_cst_application.itr_appl)


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



OpenWithParm(w_opc_ref_recurso_bas,is_where)

lou_param = Message.PowerObjectParm

tab_1.tabpage_1.dw_detalle.Reset()

If Not IsValid(lou_param) Then
	dw_referencia.Reset()
	tab_1.tabpage_1.dw_detalle.Reset()
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

tab_1.tabpage_1.dw_detalle.setRedraw(False)
tab_1.tabpage_2.dw_med_rep.setRedraw(False)

of_recuperar_encabezado()
of_recuperar_detalle()

tab_1.tabpage_1.dw_detalle.setRedraw(True)
tab_1.tabpage_2.dw_med_rep.setRedraw(True)














end event

event ue_save;call super::ue_save;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 25 de Noviembre de 2002 HORA 12:22:39:906
// 
// Verifica y almacena los cambios realizados
//////////////////////////////////////////////////////////////////////////

If of_verificar()<>1 Then
	Return
End If

If of_grabar()<>1 then
	Return
End If

Commit using n_cst_application.itr_appl ;

ib_cambios=False


MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","La informaci$$HEX1$$f300$$ENDHEX$$n se guardo satisfactoriamente.")

tab_1.tabpage_1.dw_detalle.setRedraw(False)
tab_1.tabpage_2.dw_med_rep.setRedraw(False)

of_recuperar_detalle()

tab_1.tabpage_1.dw_detalle.setRedraw(True)
tab_1.tabpage_2.dw_med_rep.setRedraw(True)

end event

type tab_1 from tab within w_med_ref
event create ( )
event destroy ( )
integer x = 23
integer y = 296
integer width = 3575
integer height = 1320
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
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3538
integer height = 1200
long backcolor = 80269524
string text = "Medidas de tejido"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_panel dw_panel
dw_detalle dw_detalle
end type

on tabpage_1.create
this.dw_panel=create dw_panel
this.dw_detalle=create dw_detalle
this.Control[]={this.dw_panel,&
this.dw_detalle}
end on

on tabpage_1.destroy
destroy(this.dw_panel)
destroy(this.dw_detalle)
end on

type dw_panel from u_dw_application within tabpage_1
integer x = 37
integer y = 28
integer width = 942
integer height = 1148
integer taborder = 30
boolean enabled = false
string dataobject = "d_dt_med_ref"
boolean livescroll = false
end type

event constructor;call super::constructor;Modify("co_partebas.Background.Color='76788149'")
end event

type dw_detalle from u_dw_application within tabpage_1
integer x = 987
integer y = 28
integer width = 2501
integer height = 1148
integer taborder = 40
string dataobject = "d_dt_med_ref"
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
If il_recurso=-1 Then
	MessageBox("Advertencia!","No se ha especificado la referencia.",StopSign!)
	Return 
End If


If dwo.name="co_partebas_t" Then
	

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
ib_cambios=true
end event

event scrollvertical;call super::scrollvertical;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 31 de Enero de 2003 HORA 14:19:57:687
// 
// 
//////////////////////////////////////////////////////////////////////////

dw_panel.Object.datawindow.verticalscrollposition = scrollpos
end event

event sqlpreview;call super::sqlpreview;//MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!",sqlsyntax)

end event

event ue_insertrow;If il_recurso=-1 Then
	MessageBox("Advertencia!","No se ha especificado la referencia.",StopSign!)
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

ib_cambios=True

end event

event ue_deleterow;call super::ue_deleterow;ib_cambios=True
end event

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3538
integer height = 1200
long backcolor = 80269524
string text = "Medidas Reposadas"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_validacion dw_validacion
dw_med_rep dw_med_rep
gb_1 gb_1
gb_2 gb_2
end type

on tabpage_2.create
this.dw_validacion=create dw_validacion
this.dw_med_rep=create dw_med_rep
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.dw_validacion,&
this.dw_med_rep,&
this.gb_1,&
this.gb_2}
end on

on tabpage_2.destroy
destroy(this.dw_validacion)
destroy(this.dw_med_rep)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type dw_validacion from u_dw_application within tabpage_2
integer x = 1751
integer y = 76
integer width = 1591
integer height = 944
integer taborder = 40
string dataobject = "d_valida_med_rep"
boolean hscrollbar = true
boolean border = true
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

type dw_med_rep from u_dw_application within tabpage_2
integer x = 27
integer y = 76
integer width = 1591
integer height = 944
integer taborder = 30
string dataobject = "d_dt_med_ref_rep"
boolean hscrollbar = true
boolean border = true
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 06 de Diciembre de 2003 HORA 16:03:48:990
// 
// 
//////////////////////////////////////////////////////////////////////////
If il_recurso=-1 Then
	MessageBox("Advertencia!","No se ha especificado la referencia.",StopSign!)
	Return 
End If

If dwo.name="id_med_rep_t" Then
	
   If il_talla<0 Then
		MessageBox("Advertencia!","Debe especificar la talla.",StopSign!)
		Return
	End If		
	
	If RowCount()=0 Then
		of_parte_Base_rep()
	End If
End If
end event

event itemchanged;call super::itemchanged;n_cst_comun lo_pulg

If dwo.name="ca_cm" Then
	SetItem(row,"ca_pulg",lo_pulg.of_mmToPulg(Dec(Data)))
ElseIf dwo.name="ca_pulg" Then
	SetItem(row,"ca_cm",lo_pulg.of_PulgTomm(Data))
End If

ib_cambios=True


end event

event ue_insertrow;long i

If il_recurso=-1 Then
	MessageBox("Advertencia!","No se ha especificado la referencia.",StopSign!)
	Return 
End If

Super::Event ue_insertRow()

i=GetRow()

SetItem(i,"co_fabrica",il_fabrica)
SetItem(i,"co_linea",il_linea)
SetItem(i,"co_referencia",il_referencia)
SetItem(i,"co_calidad",il_calidad)
SetItem(i,"co_tipoprod",il_tipoProd)
SetItem(i,"co_talla",il_talla)
SetItem(i,"co_recurso",il_recurso)
SetItem(i,"co_diseno",il_diseno)

ib_cambios=True

end event

event ue_deleterow;call super::ue_deleterow;ib_cambios=True
end event

type gb_1 from groupbox within tabpage_2
integer x = 1723
integer y = 8
integer width = 1696
integer height = 1080
integer taborder = 50
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
integer y = 8
integer width = 1696
integer height = 1072
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Medias reposadas"
end type

type st_1 from statictext within w_med_ref
integer x = 37
integer y = 1648
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

type dw_referencia from u_dw_application within w_med_ref
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

String 	ls_null
long 		ll_null

SetNull(ll_null)
SetNull(ls_null)

If il_err_item_change<>0 Then 
	Return 2
End If

If ib_cambios Then
	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
	If ll_res=2 Then
		Return 2
	End If
End If

tab_1.tabpage_1.dw_detalle.Reset()
tab_1.tabpage_2.dw_med_rep.Reset()


If dwo.name="co_fabrica" Then
	il_fabrica=Long(Data)
	//of_nombreReferencia()
	il_linea=-1
	il_talla=-1
	il_referencia=-1
	//il_calidad=-1
	il_diseno=-1
	il_recurso=-1
	
	SetItem(1,"co_linea",ll_null)
	SetItem(1,"co_referencia",ll_null)
	SetItem(1,"de_referencia",ls_null)
	SetItem(1,"co_calidad",1)
	
	SetItem(1,"co_talla",ll_null)
	SetItem(1,"de_talla",ls_null)
	
	SetItem(1,"co_diseno",ll_null)
	SetItem(1,"de_diseno",ls_null)
	
	SetItem(1,"co_recurso",ll_null)
	SetItem(1,"de_recurso_tejido",ls_null)
	
End If

If dwo.name="co_linea" Then
	il_linea=Long(Data)
	//of_nombreReferencia()
	il_referencia=-1
	
	il_talla=-1
	//il_calidad=-1
	il_diseno=-1
	il_recurso=-1
	
	SetItem(1,"co_referencia",ll_null)
	SetItem(1,"de_referencia",ls_null)
	SetItem(1,"co_calidad",1)
	
	SetItem(1,"co_talla",ll_null)
	SetItem(1,"de_talla",ls_null)
	
	SetItem(1,"co_diseno",ll_null)
	SetItem(1,"de_diseno",ls_null)
	
	SetItem(1,"co_recurso",ll_null)
	SetItem(1,"de_recurso_tejido",ls_null)
	
End If

If dwo.name="co_referencia" Then
	il_referencia=Long(Data)
	of_nombreReferencia()

	//il_calidad=-1
	il_talla=-1

	il_diseno=-1
	il_recurso=-1
	
	SetItem(1,"co_calidad",1)
	
	SetItem(1,"co_talla",ll_null)
	SetItem(1,"de_talla",ls_null)
	
	SetItem(1,"co_diseno",ll_null)
	SetItem(1,"de_diseno",ls_null)
	
	SetItem(1,"co_recurso",ll_null)
	SetItem(1,"de_recurso_tejido",ls_null)
	
End If

If dwo.name="co_calidad" Then
	il_calidad=long(Data)

	il_talla=-1

	il_diseno=-1
	il_recurso=-1
	
	SetItem(1,"co_talla",ll_null)
	SetItem(1,"de_talla",ls_null)
	
	SetItem(1,"co_diseno",ll_null)
	SetItem(1,"de_diseno",ls_null)
	
	SetItem(1,"co_recurso",ll_null)
	SetItem(1,"de_recurso_tejido",ls_null)
	
	
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
	
	il_diseno=-1
	il_recurso=-1
	
	SetItem(1,"co_diseno",ll_null)
	SetItem(1,"de_diseno",ls_null)
	
	SetItem(1,"co_recurso",ll_null)
	SetItem(1,"de_recurso_tejido",ls_null)
	
	
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
	
	il_recurso=-1
	
	SetItem(1,"co_recurso",ll_null)
	SetItem(1,"de_recurso_tejido",ls_null)
	
	
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
	of_cambio_recurso()
End If

end event

event losefocus;call super::losefocus;gb_referencia.of_color(False)
end event

event ue_deleterow;If tab_1.tabpage_1.dw_detalle.RowCount()>0 Then
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

type gb_referencia from u_gb_base within w_med_ref
integer x = 18
integer y = 8
integer width = 3579
integer height = 256
string text = "Referencia"
end type

