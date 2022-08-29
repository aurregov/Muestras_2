HA$PBExportHeader$w_inf_orden_pdn.srw
$PBExportComments$W para las ordenes de producci$$HEX1$$f300$$ENDHEX$$n
forward
global type w_inf_orden_pdn from w_report
end type
type dw_muestra from u_dw_application within w_inf_orden_pdn
end type
type cbx_medidas from checkbox within w_inf_orden_pdn
end type
type dw_color from u_dw_application within w_inf_orden_pdn
end type
type cbx_basica from checkbox within w_inf_orden_pdn
end type
type dw_tiempo from u_dw_application within w_inf_orden_pdn
end type
type gb_referencia from u_gb_base within w_inf_orden_pdn
end type
type gb_3 from u_gb_base within w_inf_orden_pdn
end type
type gb_medidas from groupbox within w_inf_orden_pdn
end type
end forward

global type w_inf_orden_pdn from w_report
integer width = 3785
integer height = 2152
string title = "Ficha t$$HEX1$$e900$$ENDHEX$$cnica de orden de producci$$HEX1$$f300$$ENDHEX$$n"
boolean maxbox = false
windowstate windowstate = maximized!
dw_muestra dw_muestra
cbx_medidas cbx_medidas
dw_color dw_color
cbx_basica cbx_basica
dw_tiempo dw_tiempo
gb_referencia gb_referencia
gb_3 gb_3
gb_medidas gb_medidas
end type
global w_inf_orden_pdn w_inf_orden_pdn

type variables
n_cst_param 		io_param
n_ds_application	ids_observaciones
DataWindowChild 	idc_talla

long il_fabrica=-1,il_linea=-1,il_muestra=-1,il_talla,il_calidad=1,il_diseno,il_recurso,il_tipoprod, &
		il_nu_orden, il_piso,il_pasillo,il_parqueadero,il_ca_aguja,il_nu_galga, il_cliente,il_sucursal, &
		il_solicitud,il_tipo_medida, il_color, il_opcion
decimal{2} 	ide_diam_cilindro
String		is_de_equipo, is_ref_exp,is_tipo_tejido, is_rec_rest,is_forma_tejer,is_recurso, is_tipo_muestra, &
				is_rec_muestraBasica
end variables

forward prototypes
public function integer of_nombremuestra ()
public function long of_recursomaquina (long a_maquina)
public function long of_solicitudmuestra ()
public function integer of_datosmaquina (long a_maquina)
public function integer of_recuperar ()
public function integer of_info_orden ()
public function integer of_teorica ()
public function long wf_cargarrecursoordenp (readonly long al_orden)
end prototypes

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
												il_muestra/*long a_referencia*/, &
												n_cst_application.itr_appl/*transaction a_transaction */)
long ll_n

SetNull(ll_n)

If ll_res=1 Then
	dw_muestra.SetItem(1,"de_muestra",lo_comun.of_getString(1))
	dw_muestra.SetItem(1,"co_tipoprod",lo_comun.of_getLong(1))
	//il_tipoprod=lo_comun.of_getLong(1)
	//lo_comun.of_loaddddw(idc_parte_base/*datawindowchild a_dw*/, &
	//                     il_tipoProd/*long a_num1*/,&
	//							n_cst_application.itr_appl/*transaction a_transaction */)
	
	//il_grupo_tlla=lo_comun.of_getLong(2)	
	//dw_muestra.SetItem(1,"co_grupo_tlla",lo_comun.of_getLong(2))							

Else
	dw_muestra.SetItem(1,"de_muestra","")
//	il_tipoprod=-1
End If
dw_muestra.SetItem(1,"talla",ll_n)
dw_muestra.SetItem(1,"co_recurso",ll_n)
dw_muestra.SetItem(1,"de_recurso_tejido","")

il_talla=-1

//lo_comun.of_loadDddw(idc_talla,il_fabrica,il_linea,il_muestra,1,n_cst_application.itr_appl)

Return 1
end function

public function long of_recursomaquina (long a_maquina);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 02 de Diciembre de 2002 HORA 10:30:19:546
// 
// Determina de que recurso es una maquina
//////////////////////////////////////////////////////////////////////////
long ll_recurso

  SELECT m_maquinas_tj.co_recurso  
    INTO :ll_recurso  
    FROM m_maquinas_tj  
   WHERE m_maquinas_tj.co_maquina = :a_maquina  using n_cst_application.itr_appl ;

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If
//////////////////////////////////////////////////////////////////////////
// Si no lo encuetra, se retorna un valor no v$$HEX1$$e100$$ENDHEX$$lido (-1)
// 
//////////////////////////////////////////////////////////////////////////

If n_cst_application.itr_appl.SQLcode=100 then
	Return -1
End If

Return ll_Recurso
end function

public function long of_solicitudmuestra ();//////////////////////////////////////////////////////////////////////////
// Para determinar cual es la solicitud de la muestra seleccionada
// 
//////////////////////////////////////////////////////////////////////////
long		ll_tipo_tejido, ll_restri,ll_recurso,ll_res,ll_recurso_ord
string	ls_forma_tejer
n_cst_comun lo_comun

  SELECT m_muestras.nu_solicitud,
         m_muestras.tipo_muestra,
			m_muestras.co_cliente,
			m_muestras.co_sucursal,
			m_muestras.co_ref_exp,
			m_muestras.co_tipo_tejido,
			m_muestras.bpl_co_tipoprod,
			m_muestras.id_tipo_med
    INTO :il_solicitud,
	      :is_tipo_muestra,
			:il_cliente,
			:il_sucursal,
			:is_ref_exp,
			:ll_tipo_tejido,
			:ls_forma_tejer,
			:il_tipo_medida
    FROM m_muestras  
   WHERE ( m_muestras.co_fabrica = :il_fabrica ) AND  
         ( m_muestras.co_linea = :il_linea ) AND  
         ( m_muestras.co_muestra = :il_muestra ) using n_cst_application.itr_appl   ;
			
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If
	
If IsNull(il_solicitud) Then
	il_solicitud=0
End If

ll_res=lo_comun.of_nombrebpltipoprod(ls_forma_tejer /*string a_bpl_tipprod*/,&
                                     n_cst_application.itr_appl/*transaction a_transaction */)
												 
If ll_res=1 Then
	is_forma_tejer=lo_comun.of_getString(1)
Else
	is_forma_tejer=""
End If

ll_res=lo_comun.of_nombretipotejido(il_tipoprod, ll_tipo_tejido /*long a_co_tejido*/,&
                                 n_cst_application.itr_appl/*transaction a_transaction */)
											
If ll_res=1 Then
	is_tipo_tejido=lo_comun.of_getString(1)
Else
	is_tipo_tejido=""
End If

/***********************************************************
SA51505 - Ceiba/JJ - 15-10-2015
Comentario: El valor de ll_recurso_ord se recupera del nuevo campo co_recurso del repositorio de ordenes - dt_mu_ord 
el recurso para recuperar Medidas y medidas reposadas debe ser de dt_muestras 
***********************************************************/
  SELECT dt_muestras.id_rec_rest
  			,dt_muestras.co_recurso
    INTO :ll_restri
		 		,:ll_recurso
    FROM dt_muestras
   WHERE ( dt_muestras.co_fabrica = :il_fabrica ) AND  
         ( dt_muestras.co_linea = :il_linea ) AND  
         ( dt_muestras.co_muestra = :il_muestra ) //AND  ( dt_muestras.co_talla = :il_talla )   
			using n_cst_application.itr_appl   ;
			
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

//SA51505 - Ceiba/JJ - 15-10-2015: Se carga Recurso de dt_mu_ord.co_recurso
ll_recurso_ord = wf_CargarRecursoOrdenP(il_nu_orden)
IF ll_recurso_ord = -1 THEN RETURN -1 

//Recurso Restrictivo 
ll_res=lo_comun.of_nombrerecursotj( ll_restri,n_cst_application.itr_appl)												
If ll_res=1 Then
	is_rec_rest=lo_comun.of_getString(1)
Else
	is_rec_rest=""
End If

//Recurso Muestra Basica 
ll_res=lo_comun.of_nombrerecursotj( ll_recurso, n_cst_application.itr_appl)												
If ll_res=1 Then
	is_rec_muestraBasica=String(ll_recurso)+" "+lo_comun.of_getString(1)
Else
	is_rec_muestraBasica=""
End If

//Recurso Orden
ll_res=lo_comun.of_nombrerecursotj( ll_recurso_ord, n_cst_application.itr_appl)	
												
If ll_res=1 Then
	is_recurso="("+String(ll_recurso_ord)+") "+lo_comun.of_getString(1) 
	il_recurso = ll_recurso
Else
	is_recurso=""
End If

Return il_solicitud
end function

public function integer of_datosmaquina (long a_maquina);//////////////////////////////////////////////////////////////////////////
// Los datos del recurso se asignan por separado a los de la m$$HEX1$$e100$$ENDHEX$$quina
// 
//////////////////////////////////////////////////////////////////////////
SetNull(il_piso)
SetNull(il_pasillo)
SetNull(il_parqueadero)
SetNull(ide_diam_cilindro)
SetNull(il_ca_aguja)
SetNull(il_nu_galga)
SetNull(is_de_equipo)

If isnull(a_maquina) Then
  SELECT m_recursos_tj.diam_cilindro,   
         m_recursos_tj.ca_aguja,   
         m_recursos_tj.nu_galga,   
         m_recursos_tj.de_modelo  
    INTO :ide_diam_cilindro,   
         :il_ca_aguja,   
         :il_nu_galga,   
         :is_de_equipo  
    FROM m_recursos_tj  
   WHERE m_recursos_tj.co_recurso = :il_recurso   using n_cst_application.itr_appl  ;

	If n_cst_application.itr_appl.SQLcode=-1 Then 
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(n_cst_application.itr_appl)
		Return -1
	End If
	//////////////////////////////////////////////////////////////////////////
	// Si no se encuentra, se registra como un error
	// 
	//////////////////////////////////////////////////////////////////////////
	
	If n_cst_application.itr_appl.SQLcode=100 Then 
		Return -1
	End If
	is_de_equipo=Trim(is_de_equipo)
Else	  
  SELECT m_maquinas_tj.nu_piso,   
         m_maquinas_tj.nu_pasillo,   
         m_maquinas_tj.nu_parqueadero,   
         m_recursos_tj.diam_cilindro,   
         m_recursos_tj.ca_aguja,   
         m_recursos_tj.nu_galga,   
         m_recursos_tj.de_modelo  
    INTO :il_piso,   
         :il_pasillo,   
         :il_parqueadero,   
         :ide_diam_cilindro,   
         :il_ca_aguja,   
         :il_nu_galga,   
         :is_de_equipo  
    FROM m_equipos,   
         m_maquinas_tj,   
         m_recursos_tj  
   WHERE ( m_maquinas_tj.co_equipo = m_equipos.co_equipo ) and  
         ( m_maquinas_tj.co_fabrica_eq = m_equipos.co_fabrica_eq ) and  
         ( m_recursos_tj.co_recurso = m_maquinas_tj.co_recurso ) and  
         ( ( m_maquinas_tj.co_maquina = :a_maquina ) ) using n_cst_application.itr_appl  ;

	If n_cst_application.itr_appl.SQLcode=-1 Then 
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(n_cst_application.itr_appl)
		Return -1
	End If
	//////////////////////////////////////////////////////////////////////////
	// Si no se encuentra, se registra como un error
	// 
	//////////////////////////////////////////////////////////////////////////
	
	If n_cst_application.itr_appl.SQLcode=100 Then 
		Return -1
	End If
	is_de_equipo=Trim(is_de_equipo)
End If



Return 1
end function

public function integer of_recuperar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 5 de Octubre de 2004.H:18:21
---------------------------------------------------
---------------------------------------------------*/
//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 20 de Junio de 2003 HORA 08:05:48:984
// 
// Recupero los datos del dw
//////////////////////////////////////////////////////////////////////////
Long ll_dato, ll_maquina, ll_rec_maq, ll_solicitud, ll_tot,ll_tipo_graf, ll_res, ll_diseno, &
		ll_min,ll_seg,ll_t
n_cst_comun lo_comun
String ls_talla, ls_cad1,ls_cad2,ls_cad_ini, ls_cad_fin, ls_cliente, ls_ruta, ls_nombrefoto, ls_nombresilueta 
Decimal lde_docenas
n_ds_application lds_1

lds_1=create n_ds_application

If dw_muestra.AcceptText()<>1 Then
	Return -1
End If

If dw_color.AcceptText()<>1 Then
	MessageBox("Advertencia!","Color no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
	Return -1
End If

ll_maquina=dw_muestra.GetItemNumber(1,"co_maquina")

If Not IsNull(ll_maquina) Then
	ll_rec_maq=of_recursoMaquina(ll_maquina)	

	If ll_rec_maq=-1 Then
		Return -1
	End If


	If ll_rec_maq<>il_recurso Then
		MessageBox("Advertencia!","La m$$HEX1$$e100$$ENDHEX$$quina no pertenece al recurso seleccionado.",StopSign!)
		Return 1
	End If

End If

If of_datosMaquina(ll_maquina)<>1 Then
	Return -1
End If
//***********************************************
//If cbx_basica.Checked Then
//	dw_report.DataObject="d_inf_orden_pdn"
////	dw_report.DataObject="d_inf_muestra2_med_basico"
//Else
//	//dw_report.DataObject="d_inf_muestra2_med"
//End If
dw_report.DataObject="d_inf_orden_pdn"
dw_report.SetTransObject(n_cst_application.itr_appl)

ll_solicitud=of_solicitudMuestra()

If ll_solicitud=-1 Then
	Return 1
End If


If il_recurso<>0 Then
	dw_report.Modify("maquina.text='"+String(ll_maquina)+"'")	
	dw_report.Modify("equipo.text='"+is_de_equipo+"'")		
	dw_report.Modify("galga.text='"+String(ide_diam_cilindro)+"X"+String(il_ca_aguja)+&
	"-"+String(il_nu_galga)+"'")		
	dw_report.Modify("pasillo.text='"+String(il_pasillo)+"'")		
	dw_report.Modify("parqueo.text='"+String(il_parqueadero)+"'")	
	dw_report.Modify("rec.text='"+String(il_recurso)+"'")
Else
	dw_report.Modify("maquina.text=''")	
	dw_report.Modify("equipo.text=''")		
	dw_report.Modify("galga.text=''")		
	dw_report.Modify("pasillo.text=''")		
	dw_report.Modify("parqueo.text=''")	
	dw_report.Modify("rec.text=''")	
End If

//<--()***************************************************************************************************************
ll_tot=dw_report.Retrieve(il_fabrica,il_linea,il_muestra,il_talla,il_diseno,il_recurso,il_color,il_opcion,il_nu_orden)
//***************************************************************************************************************
commit using n_cst_application.itr_appl ;

If ll_tot>0 Then
	il_tipoprod=dw_report.getItemNumber(1,"co_tipoprod")
	ll_tipo_graf=dw_report.getItemNumber(1,"id_tipo_graf")
End If
//////////////////////////////////////////////////////////////////////////
// Coloco el caracter de enter al final de cada linea en 
// el objeto 
//////////////////////////////////////////////////////////////////////////

String ls_tmp="",ls_obser,ls_tmp1
int i
If cbx_basica.Checked Then
	ls_obser=dw_report.GetItemString(1,"de_observacion")	
	For i=1 to 12
		ls_tmp1=mid(ls_obser,60 * (i -1)+1,60)
		ls_tmp1=Trim(ls_tmp1)
		If len(ls_tmp1)>0 Then
			ls_tmp+=ls_tmp1+"~n"	
		End If
	Next	
	dw_report.SetItem(1,"de_observacion",ls_tmp)	
	//Messagebox('Var','ls_tmp='+ls_tmp+'~n')
end If

//////////////////////////////////////////////////////////////////////////
// Se modifican las observaciones
//////////////////////////////////////////////////////////////////////////

ids_observaciones.Retrieve(il_fabrica,il_linea,il_muestra,il_talla,il_calidad)

If ids_observaciones.RowCount()>0 Then
	ls_obser=ids_observaciones.GetItemString(1,"observacion")

	For i=1 to 12
		ls_tmp1=mid(ls_obser,60 * (i -1)+1,60)
		ls_tmp1=Trim(ls_tmp1)
		If len(ls_tmp)>0 Then
			ls_tmp+=ls_tmp1+"~n"	
		End If
	Next	
	
End If
//Messagebox('Var','ls_tmp='+ls_tmp+'~n')
dw_report.Modify("observaciones.text='"+ls_tmp+"'")

//////////////////////////////////////////////////////////////////////////
// coloco la observacion de las medidas
//////////////////////////////////////////////////////////////////////////

lds_1.DataObject="d_inf_det_mues1"
lds_1.SetTransObject(n_cst_application.itr_appl)
lds_1.Retrieve(il_fabrica,&
					il_linea,&
					il_muestra,&
					il_talla,& 
					il_diseno,&
					il_recurso)
							
ls_obser=""

For i=1 To lds_1.RowCount()
	ls_cad1=lds_1.GetItemString(i,"de_observacion")
	If Trim(ls_cad1)<>"" Then
		ls_cad1=trim(ls_Cad1)
		ls_cad2=lds_1.GetItemString(i,"de_partebas")
		ls_cad2=trim(ls_Cad2)
		ls_obser+=ls_cad2+": "+ls_cad1+", "
	End If
Next
//Messagebox('Var','ls_obser='+ls_obser+'~n')
If len(ls_obser)>0 Then
	ls_obser=mid(ls_obser,1,len(ls_obser) -2)
	dw_report.Modify("observacion.text='"+ls_obser+"'")
End If

ll_res=lo_comun.of_nombremuestratalla( il_fabrica,il_linea,&
       il_muestra,il_talla,n_cst_application.itr_appl)

If ll_res<>1 Then
	MessageBox("Advertencia!","No se pudo determinar la talla.",StopSign!)
	Return -1
End If

ls_talla="("+String(il_talla)+") "+lo_comun.of_getString(1)

If IsNull(ls_talla) or Trim(ls_talla)="" Then
	MessageBox("Advertencia!","No se pudo determinar la talla.",StopSign!)
	Return -1
End If

dw_report.Modify("talla.text='"+ls_talla+"'")
ll_diseno=dw_muestra.GetItemNumber(1,"co_diseno")

If IsNull(ll_diseno) then ll_diseno = -1

ll_res=lo_comun.of_nombredisenomuestra( il_fabrica,&
       il_linea,il_muestra,il_talla,il_diseno, n_cst_application.itr_appl)


If ll_res=1 Then	
	dw_report.Modify("de_diseno.text='("+String(ll_diseno)+") "+lo_comun.of_getString(1)+"'")
Else
	dw_report.Modify("de_diseno.text='("+String(ll_diseno)+")'")
	MessageBox("Advertencia!","Dise$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
	Return -1
End If

//////////////////////////////////////////////////////////////////////////
// Se coloca el c$$HEX1$$f300$$ENDHEX$$digo de barras de la fab-lin-muestra-solicitud
//////////////////////////////////////////////////////////////////////////

//ls_cad_ini=String(il_fabrica)+"/"+String(il_linea)+"/"+String(il_muestra)+&
//           "/"+String(il_talla)+"/"+String(il_nu_orden)
ls_cad_ini=String(il_nu_orden)
//***************************************************************************
n_cst_barcode lo_barcode

ls_cad_fin=lo_barcode.of_code128Jk(ls_cad_ini)

//Messagebox('Var','ls_cad_fin='+ls_cad_fin+'~n')
//<--()***************************************************************************
//dw_report.modify("solicitud.text='"+String(ll_solicitud)+"'") //NO MUESTRO LA SOLICITUD

//***************************************************************************
dw_report.modify("barcode1.text='"+ls_cad_fin+"'")
dw_report.modify("barcode2.text='"+ls_cad_ini+"'")

//Messagebox('Var','is_ref_exp='+is_ref_exp+'~n')
dw_report.modify("estilo.text='"+is_ref_exp+"'")
dw_report.modify("tipo_tejido.text='"+is_tipo_tejido+"'")
dw_report.modify("forma_tejer.text='"+is_forma_tejer+"'")
dw_report.modify("recurso_restrictivo.text='"+is_rec_rest+"'")
dw_report.modify("recurso.text='"+is_recurso+"'") 
dw_report.modify("t_recurso_muestra.text='"+is_rec_muestraBasica+"'") 

If dw_report.of_existcolumn("id_tipo_med") Then
	ll_dato=dw_report.GetItemNumber(1,"id_tipo_med")
	ll_res=lo_comun.of_nombretipomedida(ll_dato,&
													n_cst_application.itr_appl)
													
	If ll_res=1 Then
	
		dw_report.modify("medida.text='("+String(ll_dato)+") "+lo_comun.of_getString(1)+"'")
	End If

End If
//////////////////////////////////////////////////////////////////////////
// Las muestras solo son de tipo nacional o exportacion
// 
//////////////////////////////////////////////////////////////////////////
ll_res=lo_comun.of_nombrecliente( il_cliente,&
                                  il_sucursal,is_tipo_muestra,n_cst_application.itr_appl)

//dw_report.Modify("co_cliente.text='"+String(il_cliente)+" "+String(il_sucursal)+"'")


If ll_res=1 Then
	dw_report.Modify("desc_cliente.text='("+String(il_cliente)+"-"+&
	String(il_sucursal)+") "+lo_comun.of_getString(1)+"'")

End If

DateTime ldt_fecha
String ls_usuario,ls_instancia,ls_ref_ant

If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If

dw_report.Modify("fecha.text='"+String(ldt_fecha,"YYYY/MM/DD hh:mm")+" "+ls_usuario+"'")

dw_report.Modify("ref_ant.text='"+ls_ref_ant+"'")
dw_report.Modify("ref_ant1.text='"+ls_ref_ant+"'")


IF il_fabrica = 4 THEN
	ll_Res=lo_comun.of_nombrefabrica(2 /*long a_fabrica*/,&
                                 n_cst_application.itr_appl/*transaction a_transaction */)
ELSE
	ll_Res=lo_comun.of_nombrefabrica(il_fabrica /*long a_fabrica*/,&
                                 n_cst_application.itr_appl/*transaction a_transaction */)
END IF
										
If ll_res=1 Then
	dw_report.Modify("nombre_fabrica.text='"+lo_comun.of_getString(1)+"'")

End If

//////////////////////////////////////////////////////////////////////////
// Selecciono el tipo de grafico a imprimir
// 
//////////////////////////////////////////////////////////////////////////
//open(w_tipo_grafico)
//
//n_cst_param lo_param
//
//lo_param=message.powerobjectparm


//dw_report.Modify("p_calcetin.Filename='tipo_"+String(ll_tipo_graf)+".bmp'")

//Messagebox('Var','il_tipo_medida='+String(il_tipo_medida)+'~n'+&
//'ll_tipo_graf='+String(ll_tipo_graf)+'~n')

If cbx_basica.Checked Then
	
//	gb_medidas.height=1316
//	dw_report.height=1220
	/*
	If Not IsNull(il_tipo_medida) Then
		dw_report.Modify("p_medida.Filename='med_tip"+String(ll_tipo_graf)+&
		"_med"+String(il_tipo_medida)+".bmp'")
	Else
		dw_report.Modify("p_medida.Filename=''")
	End If
	
	* ==========================================================================
	* Se debe tomar la foto y si no la encuentra en la ruta especificada
	* debe tomar la silueta de la ruta del aplicativo
 	* ==========================================================================
	*/
	
	ll_res = lo_comun.of_nombresilueta( il_fabrica, il_linea, il_muestra, n_cst_application.itr_appl)
	IF (ll_res = -1) THEN
		RETURN -1
	ELSEIF (ll_res = 1) THEN
		ls_nombresilueta = Trim(lo_comun.of_getstring(1))
	END IF

	// Esta funcion devuelve el valor de la constante FOTOS+<tipoprod> 
	// en ella est$$HEX2$$e1002000$$ENDHEX$$contenida la ruta de donde se toma las fotos de 
	// las muestras
	ll_res = lo_comun.of_valorconstante( 'FOTOS'+String(il_tipoprod), n_cst_application.itr_appl)
		
	IF (ll_res = -1) THEN
		RETURN -1
	ELSEIF (ll_res = 1) THEN
		ls_ruta = Trim(lo_comun.of_getstring(1))
		ls_nombrefoto = 'm_'+String(il_muestra)+'.jpg'
		IF Right(ls_ruta, 1) <> '\' THEN ls_ruta  = ls_ruta+"\"
	END IF
	
	// PARA PRUEBAS ls_ruta = ''
	IF FileExists(ls_ruta+ls_nombrefoto) THEN
		// Si NO existe la silueta se configura la foto como la imagen de la muestra
		dw_report.Modify("p_medida.Filename='"+ls_ruta+ls_nombrefoto+"'")
	ELSEIF FileExists(ls_nombresilueta) THEN
		// Si existe la silueta se configura como la imagen de la muestra
		dw_report.Modify("p_medida.Filename='"+ls_nombresilueta+"'")
	ELSE
		// Si no existe ni la foto ni la silueta entonces no se configura la imagen.
		dw_report.Modify("p_medida.Filename=''")
	END IF
	string ls
	ls = dw_report.Modify("p_medida.originalsize='1'")
	
else

	gb_medidas.height=632
	dw_report.height=540
		
		
	If Not IsNull(il_tipo_medida) Then
		dw_report.Modify("p_medida.Filename='medidas_"+String(il_tipo_medida)+".bmp'")
	Else
		dw_report.Modify("p_medida.Filename=''")
	End If

End If

/*
* MODIFICADO: Agosto 25 de 2009 - gagudelo - ohlondon
*/
of_teorica( )

lde_docenas=dw_tiempo.GetItemDecimal(1,"produccion_teo")
dw_report.Modify("t_ciclo.text='"+String(lde_docenas)+"'")

ll_min=dw_tiempo.GetItemNumber(1,"minutos")

If IsNull(ll_min) Then ll_min=0

ll_seg=dw_tiempo.GetItemNumber(1,"segundos")

If IsNull(ll_seg) Then ll_seg=0

ll_t=ll_min * 60 + ll_seg

String ls_tiempo
If ll_min>0 Then
	ls_tiempo+=String(ll_min)+" m "
End If

If ll_seg>0 Then
	ls_tiempo+=String(ll_seg)+" s "
End If

ls_tiempo+=" = "+String(ll_t)+" seg "

dw_report.Modify("teorico_seg.text='"+ls_tiempo+"'")




//dw_report.Modify("dw_composicion.DataObject='d_comp_mues' ")

//dw_report.Modify("dw_composicion.Nest_Arguments=((~"2~"),(~"2~"),(~"46~"),(~"1~")) ")

/* Carlos andres rico
	Descr: Efecto ciclo en min.seg.
*/
//If IsValid(dw_report.Object.compute_ciclo) then
//	Dec lde_seg
//	Long ll_seg_solo, ll_min, ll_seg
//	lde_seg=dw_report.GetItemDecimal(1,'compute_ciclo')
//	ll_seg_solo=Truncate(lde_seg,0)
//	ll_min=Truncate(lde_seg/60,0)
//	ll_seg=lde_seg - ll_min * 60
//	dw_report.Modify("t_ciclo.Text='Min: "+String(ll_min)+" Seg: "+ &
//							String(ll_seg)+" (ciclo: "+String(Truncate(lde_seg,2))+")'")
//End IF

Return 1
end function

public function integer of_info_orden ();//****************************************
Integer 		li_colcount,li_i
//****************************************
li_colcount = Integer(dw_muestra.Describe("DataWindow.Column.Count"))
For li_i = 1 To li_colcount 
		If Long(dw_muestra.Describe("#"+String(li_i)+".TabSequence")) > 0 Then
				dw_muestra.Modify("#"+String(li_i)+".Protect='1'")
				dw_muestra.Modify("#"+String(li_i)+".BackGround.Mode='0'")									
				dw_muestra.Modify("#"+String(li_i)+".Background.Color='67108864'")
		End If
Next
li_colcount = Integer(dw_color.Describe("DataWindow.Column.Count"))
For li_i = 1 To li_colcount 
		If Long(dw_color.Describe("#"+String(li_i)+".TabSequence")) > 0 Then
				dw_color.Modify("#"+String(li_i)+".Protect='1'")
				dw_color.Modify("#"+String(li_i)+".BackGround.Mode='0'")									
				dw_color.Modify("#"+String(li_i)+".Background.Color='67108864'")
		End If
Next
//****************************************
Return 1
end function

public function integer of_teorica ();long ll_res


dw_tiempo.SetTransObject(n_cst_application.itr_appl)

ll_res=dw_tiempo.Retrieve(il_recurso,&
   	                    il_fabrica,&
								  il_linea,&
							     il_muestra,&
								  il_talla)
								  
If ll_res<0 Then
	//Close(This)
	Return -1
End If

If ll_res=0 Then	
	dw_tiempo.InsertRow(0)
	dw_tiempo.SetItem(1,"co_recurso",il_recurso)
	dw_tiempo.SetItem(1,"co_fabrica",il_fabrica)
	dw_tiempo.SetItem(1,"co_linea",il_linea)
	dw_tiempo.SetItem(1,"co_muestra",il_muestra)
	dw_tiempo.SetItem(1,"co_talla",il_talla)
	
//	MessageBox("Advertencia!","No se determin$$HEX2$$f3002000$$ENDHEX$$la producci$$HEX1$$f300$$ENDHEX$$n te$$HEX1$$f300$$ENDHEX$$rica.",StopSign!)

End If



DWObject dwo_a

dwo_a= dw_tiempo.Object.produccion_teo

dw_tiempo.Trigger Event ItemChanged(1,dwo_a,String(dw_tiempo.GetItemDecimal(1,"produccion_teo")))




Return 1
end function

public function long wf_cargarrecursoordenp (readonly long al_orden);/********************************************************************
SA51505 - wf_cargarRecursoOrdenP - Ceiba/JJ - 15-10-2015
<DESC> Description: Retornar el recurso (co_recurso)  del campo adicionado al repositorio de ordenes de producion
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> obtener dato solicitado </USAGE>
********************************************************************/	
Long ll_filas, ll_recurso 
Exception ex
n_ds_application lds_recurso 

ex = create Exception
lds_recurso=create n_ds_application

lds_recurso.DataObject="d_recurso_mu_orden"
lds_recurso.SetTransObject(n_cst_application.itr_appl)
ll_filas = lds_recurso.Retrieve(al_Orden)
IF ll_filas > 0 THEN 
	RETURN lds_recurso.GetItemNumber(1,'co_recurso')
ELSEIF ll_filas = 0 THEN 
	return -1 
END IF 
end function

on w_inf_orden_pdn.create
int iCurrent
call super::create
this.dw_muestra=create dw_muestra
this.cbx_medidas=create cbx_medidas
this.dw_color=create dw_color
this.cbx_basica=create cbx_basica
this.dw_tiempo=create dw_tiempo
this.gb_referencia=create gb_referencia
this.gb_3=create gb_3
this.gb_medidas=create gb_medidas
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_muestra
this.Control[iCurrent+2]=this.cbx_medidas
this.Control[iCurrent+3]=this.dw_color
this.Control[iCurrent+4]=this.cbx_basica
this.Control[iCurrent+5]=this.dw_tiempo
this.Control[iCurrent+6]=this.gb_referencia
this.Control[iCurrent+7]=this.gb_3
this.Control[iCurrent+8]=this.gb_medidas
end on

on w_inf_orden_pdn.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_muestra)
destroy(this.cbx_medidas)
destroy(this.dw_color)
destroy(this.cbx_basica)
destroy(this.dw_tiempo)
destroy(this.gb_referencia)
destroy(this.gb_3)
destroy(this.gb_medidas)
end on

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 5 de Octubre de 2004.H:17:45
---------------------------------------------------

---------------------------------------------------*/
//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 21 de Enero de 2003 HORA 17:47:21:781
// 
// 
//////////////////////////////////////////////////////////////////////////
long ll_res, ll_n
n_cst_comun lo_comun
n_cst_param lo_param


lo_param=Message.PowerObjectParm

dw_muestra.InsertRow(0)

dw_color.insertRow(0)

ids_observaciones=create n_ds_application

ids_observaciones.DataObject="d_obproref_mues"

ids_observaciones.SetTransObject(n_cst_application.itr_appl)
//******************
of_info_orden()
//******************
If IsValid(lo_param) Then
	IF UpperBound(lo_param.il_vector)>=4 Then
		il_fabrica=lo_param.il_vector[1]
		il_linea=lo_param.il_vector[2]
		il_muestra=lo_param.il_vector[3]
		il_talla=lo_param.il_vector[4]		
		il_nu_orden=lo_param.il_vector[5]

		il_diseno=1 //asume por defecto
	
		dw_muestra.SetItem(1,"co_fabrica",il_fabrica)
		dw_muestra.SetItem(1,"co_linea",il_linea)
		dw_muestra.SetItem(1,"co_muestra",il_muestra)
		dw_muestra.SetItem(1,"talla",il_talla)
		dw_muestra.SetItem(1,"co_diseno",il_diseno) //dise$$HEX1$$f100$$ENDHEX$$o por defecto, puede necesitarse cambiar
		This.PostEvent("ue_find")//carga los dw
	End If
End If
	
dw_report.SetTransObject(n_cst_application.itr_appl)

If il_fabrica=-1 or il_linea=-1 or il_muestra=-1 Then
	Return -1
End If

ll_res=lo_comun.of_nombreMuestra(il_fabrica /*long a_fabrica*/,&
                                 il_linea/*long a_linea*/, &
											il_muestra/*long a_muestra*/, &
											n_cst_application.itr_appl/*transaction a_transaction */)
SetNull(ll_n)

If ll_res=1 Then
	dw_muestra.SetItem(1,"de_muestra",lo_comun.of_getString(1))
	il_tipoProd=lo_comun.of_getLong(1)
Else
	dw_muestra.SetItem(1,"de_muestra","")
	il_tipoProd=-1
End If

//////////////////////////////////////////////////////////////////////////
// se coloca el nombre de la talla de la muestra
// 
//////////////////////////////////////////////////////////////////////////

ll_res=lo_comun.of_nombremuestratalla( il_fabrica,il_linea,&
       il_muestra, il_talla,  n_cst_application.itr_appl)
		 
If ll_res=1 Then
	dw_muestra.SetItem(1,"de_talla",lo_comun.of_getString(1))
End If

//////////////////////////////////////////////////////////////////////////
// Nombre del recurso
// 
//////////////////////////////////////////////////////////////////////////
ll_res=lo_comun.of_nombrerecursotj(il_recurso /*long a_recurso*/,&
                                   n_cst_application.itr_appl/*transaction a_transaction */)

If ll_res=1 Then
	dw_muestra.SetItem(1,"de_recurso_tejido",lo_comun.of_getString(1))
End If

//////////////////////////////////////////////////////////////////////////
// NOmbre del dise$$HEX1$$f100$$ENDHEX$$o de la muestra
// 
//////////////////////////////////////////////////////////////////////////
ll_res=lo_comun.of_nombredisenomuestra( il_fabrica/*long a_fabrica*/,&
                                        il_linea/*long a_linea*/,&
													 il_muestra/*long a_muestra*/,&
													 il_talla/*long a_talla*/,&
													 il_diseno/*long a_diseno*/,&
													 n_cst_application.itr_appl/*transaction a_transaction */)
													 
													 
If ll_res=1 Then
	dw_muestra.SetItem(1,"de_diseno",lo_comun.of_getString(1))
End If													 

//il_talla=-1

lo_comun.of_loadDddw(idc_talla,il_fabrica,il_linea,il_muestra,n_cst_application.itr_appl)

//////////////////////////////////////////////////////////////////////////
// Asigno el ds para las observaciones
// 
//////////////////////////////////////////////////////////////////////////

idw_data=dw_report

Return 1
end event

event resize;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 03 de Marzo de 2003 HORA 13:42:19:515
// 
// OverWrite...
//////////////////////////////////////////////////////////////////////////

dw_report.SetRedraw(False)
gb_medidas.width  = newwidth - 30
gb_medidas.height = newheight - 620 
dw_report.width  = newwidth - 80
dw_report.height = newheight - 640 
dw_report.SetRedraw(True)

end event

event ue_find;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 20 de Junio de 2003 HORA 10:41:38:156
// 
// OverWrite ancestor
//////////////////////////////////////////////////////////////////////////
of_recuperar()
end event

event ue_print;If cbx_medidas.Checked Then
	dw_report.Event ue_print()
End If

end event

type dw_report from w_report`dw_report within w_inf_orden_pdn
integer x = 37
integer y = 616
integer width = 3547
integer height = 1216
integer taborder = 0
string dataobject = "d_inf_orden_pdn"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type dw_muestra from u_dw_application within w_inf_orden_pdn
integer x = 50
integer y = 64
integer width = 3511
integer height = 180
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_muestras_med"
boolean vscrollbar = false
end type

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

If dwo.name="co_recurso" Then
	Open(w_bus_m_recurso_tj)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If
	
	
End If

end event

event getfocus;call super::getfocus;gb_referencia.of_color(True)
end event

event itemchanged;call super::itemchanged;long ll_Dato
n_cst_comun lo_comun
long ll_res

If il_err_item_change<>0 Then 
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

//If dwo.name="co_tipoprod" Then
//	il_tipoProd=Long(Data)
//End If

If dwo.name="co_diseno" Then
	ll_dato=Long(Data)
	
	ll_res=lo_comun.of_nombreDisenoMuestra(il_fabrica,il_linea, il_muestra,il_talla,&
	ll_dato,n_cst_application.itr_appl)
	
	If ll_res<>1 then
		MessageBox("Advertencia!","Dise$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If	
	SetItem(1,"de_diseno",lo_comun.of_getString(1))
	il_diseno=ll_dato
End If

If dwo.name="talla" Then
	ll_dato=Long(Data)
	
	ll_res=lo_comun.of_nombremuestratalla( il_fabrica,il_linea,&
	       il_muestra,ll_dato,n_cst_application.itr_appl)

	If ll_res<>1 then
		MessageBox("Advertencia!","Talla no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
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
End If
//of_existe(0)
end event

event losefocus;call super::losefocus;gb_referencia.of_color(False)
end event

event ue_insertrow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 20 de Junio de 2003 HORA 13:37:32:039
// 
// OverWrite
//////////////////////////////////////////////////////////////////////////

end event

event ue_deleterow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 20 de Junio de 2003 HORA 13:37:52:414
// 
// overwrite!!
//////////////////////////////////////////////////////////////////////////

end event

type cbx_medidas from checkbox within w_inf_orden_pdn
boolean visible = false
integer x = 3008
integer y = 68
integer width = 430
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Medidas y MO"
boolean checked = true
end type

type dw_color from u_dw_application within w_inf_orden_pdn
integer x = 64
integer y = 344
integer width = 3511
integer height = 96
integer taborder = 20
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_ext_color_opcion"
boolean vscrollbar = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 29 de Agosto de 2003 HORA 13:51:19:943
// 
// overwrite para el color de la composicion
//////////////////////////////////////////////////////////////////////////

end event

event doubleclicked;call super::doubleclicked;n_cst_param lo_param

If dwo.name="co_color" Then
	lo_param.il_vector[1]=il_fabrica
	lo_param.il_vector[2]=il_linea
	lo_param.il_vector[3]=il_muestra
	lo_param.il_vector[4]=il_talla

	OpenWithParm(w_bus_colores_muestra,lo_param)

	lo_param=Message.PowerObjectParm

	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If
End If

end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 29 de Agosto de 2003 HORA 14:45:03:068
// 
// Color
//////////////////////////////////////////////////////////////////////////
long ll_res
n_cst_comun lo_comun


If dwo.name="co_color" Then

	il_color=Long(Data)

	ll_res=lo_comun.of_nombremuestracolor( il_fabrica,il_linea,il_muestra,il_talla,&
	                                       il_color,n_cst_application.itr_appl)
	If ll_res<>1 Then	
		il_color=-1
		MessageBox("Advertencia!","Color no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If	
	SetItem(1,"de_color",lo_comun.of_getString(1))
	il_opcion=1
	SetItem(1,"cnt_opcion",1)
End If

If dwo.name="cnt_opcion" Then
	il_opcion=Long(Data)
End If

end event

type cbx_basica from checkbox within w_inf_orden_pdn
integer x = 1888
integer y = 348
integer width = 402
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Ficha b$$HEX1$$e100$$ENDHEX$$sica"
boolean checked = true
end type

type dw_tiempo from u_dw_application within w_inf_orden_pdn
boolean visible = false
integer x = 1582
integer y = 1808
integer width = 2034
integer height = 156
integer taborder = 30
boolean bringtotop = true
boolean enabled = false
boolean titlebar = true
string title = "Dw para calcular teorica"
string dataobject = "d_m_producc_teo_mues_bas"
boolean vscrollbar = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 09 de Enero de 2003 HORA 16:42:45:687
// 
// 
//////////////////////////////////////////////////////////////////////////

end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 09 de Enero de 2003 HORA 15:23:25:953
// 
// 
//////////////////////////////////////////////////////////////////////////
Decimal lde_produc,lde_seg
long ll_min,ll_seg,ll_seg_solo, ll_kte_seg

IF il_tipoprod = 10 THEN
	ll_kte_seg = 1200
ELSE
	ll_kte_seg = 28800
END IF

If dwo.name="produccion_teo" Then
	lde_produc=Dec(Data)
	
	If IsNull(lde_produc) Then lde_produc=0
	
	If lde_produc=0 Then Return 2
	
	lde_seg     = ll_kte_seg /lde_produc
	ll_seg_solo = Truncate(lde_seg,0)
	ll_min      = Truncate(lde_seg/60,0)
	ll_seg=lde_seg - ll_min * 60
	SetItem(1,"minutos",ll_min)
	SetItem(1,"segundos",ll_seg)
	SetItem(1,"solo_seg",ll_seg_solo)
End If

If dwo.name="segundos" Then
	lde_seg=Dec(data)
	
	If IsNull(lde_seg) Then lde_seg=0
	
	ll_min=GetItemNumber(1,"minutos")
	If IsNull(ll_min) Then ll_min=0
	lde_seg+=ll_min*60
	
	ll_seg_solo=Truncate(lde_seg,0)
	
	If lde_seg=0 Then Return 2
	
	lde_produc=ll_kte_seg /lde_seg
	SetItem(1,"produccion_teo",lde_produc)

	ll_min = Truncate(lde_seg/60,0)
	ll_seg = lde_seg - ll_min * 60
	SetItem(1,"solo_seg",ll_seg_solo)
	SetItem(1,"minutos",ll_min)
	SetItem(1,"segundos",ll_seg)
	SetText(String(ll_seg))
	Return 2
End If

If dwo.name="minutos" Then
	ll_min=long(Data)
	
	If IsNull(ll_min) Then ll_min=0
	
	ll_seg=GetItemNumber(1,"segundos")
	If IsNull(ll_seg) Then ll_seg=0
	lde_seg=ll_seg+ll_min*60
	
	ll_seg_solo=Truncate(lde_seg,0)
	
	If lde_seg=0 Then Return 2
	lde_produc=1200/lde_seg
	SetItem(1,"produccion_teo",lde_produc)

	ll_min=Truncate(lde_seg/60,0)
	ll_seg=lde_seg - ll_min * 60
	SetItem(1,"minutos",ll_min)
	SetItem(1,"segundos",ll_seg)	
	SetItem(1,"solo_seg",ll_seg_solo)
End If

If dwo.name="solo_seg" Then
	lde_seg=Dec(data)
	
	If IsNull(lde_seg) Then lde_seg=0
	
	If lde_seg=0 Then Return 2
	
	lde_produc=1200/lde_seg
	SetItem(1,"produccion_teo",lde_produc)

	ll_min=Truncate(lde_seg/60,0)
	ll_seg=lde_seg - ll_min * 60
	SetItem(1,"minutos",ll_min)
	SetItem(1,"segundos",ll_seg)
End If
	
end event

type gb_referencia from u_gb_base within w_inf_orden_pdn
integer width = 3621
integer height = 256
integer taborder = 0
string text = "ORDEN (Muestra)"
end type

type gb_3 from u_gb_base within w_inf_orden_pdn
integer y = 256
integer width = 3621
integer height = 224
integer taborder = 0
string text = "Color para la composici$$HEX1$$f300$$ENDHEX$$n"
end type

type gb_medidas from groupbox within w_inf_orden_pdn
integer y = 544
integer width = 3621
integer height = 1312
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Informe medidas y mano de obra para la orden de producci$$HEX1$$f300$$ENDHEX$$n"
end type

