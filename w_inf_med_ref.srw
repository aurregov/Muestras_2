HA$PBExportHeader$w_inf_med_ref.srw
$PBExportComments$Para las medidas de las referencias con el nuevo esquema
forward
global type w_inf_med_ref from w_report
end type
type dw_head from u_dw_application within w_inf_med_ref
end type
type dw_tiempo from u_dw_application within w_inf_med_ref
end type
type dw_referencia from u_dw_application within w_inf_med_ref
end type
type gb_1 from groupbox within w_inf_med_ref
end type
type gb_2 from groupbox within w_inf_med_ref
end type
type gb_referencia from u_gb_base within w_inf_med_ref
end type
end forward

global type w_inf_med_ref from w_report
integer width = 3936
integer height = 2056
string title = "Ficha de medidas de una referencia"
string menuname = "m_report_medidas_ref"
windowstate windowstate = maximized!
dw_head dw_head
dw_tiempo dw_tiempo
dw_referencia dw_referencia
gb_1 gb_1
gb_2 gb_2
gb_referencia gb_referencia
end type
global w_inf_med_ref w_inf_med_ref

type variables
n_cst_param io_param

long 			il_piso,il_pasillo,il_parqueadero,il_ca_aguja,il_nu_galga
decimal{2} 	ide_diam_cilindro
String		is_de_equipo


boolean ib_cambios

String is_where,is_where_copia

long il_fabrica,il_linea,il_referencia,il_talla,il_calidad
long il_tipoprod,il_recurso,il_diseno

DataWindowChild idc_parte_base,idc_talla, idc_parte_base11




end variables

forward prototypes
public function long of_recursomaquina (long a_maquina)
public function integer of_iniciar ()
public function integer of_nombrereferencia ()
public function integer of_teorica ()
public function long of_muestrario ()
public function integer of_datosmaquina (long a_maquina)
end prototypes

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

public function integer of_iniciar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 16 de Agosto de 2003 HORA 13:46:14:072
// 
// Reset
//////////////////////////////////////////////////////////////////////////
dw_report.Reset()


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
long ll_n

SetNull(ll_n)

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
dw_referencia.SetItem(1,"co_talla",ll_n)
dw_referencia.SetItem(1,"de_talla","")
dw_referencia.SetItem(1,"co_recurso",ll_n)
dw_referencia.SetItem(1,"de_recurso_tejido","")

il_talla=-1
il_recurso=-1
lo_comun.of_loadDddw(idc_talla,il_fabrica,il_linea,il_referencia,1,n_cst_application.itr_appl)

Return 1
end function

public function integer of_teorica ();long ll_res


dw_tiempo.SetTransObject(n_cst_application.itr_appl)

ll_res=dw_tiempo.Retrieve(il_recurso,&
   	                    il_fabrica,&
								  il_linea,&
							     il_referencia,&
								  il_talla,&
								  il_calidad)
								  
If ll_res<0 Then
	//Close(This)
	Return -1
End If

If ll_res=0 Then	
	dw_tiempo.InsertRow(0)
	dw_tiempo.SetItem(1,"co_recurso",il_recurso)
	dw_tiempo.SetItem(1,"co_fabrica",il_fabrica)
	dw_tiempo.SetItem(1,"co_linea",il_linea)
	dw_tiempo.SetItem(1,"co_referencia",il_referencia)
	dw_tiempo.SetItem(1,"co_talla",il_talla)
	dw_tiempo.SetItem(1,"co_calidad",il_calidad)
	
	MessageBox("Advertencia!","No se determin$$HEX2$$f3002000$$ENDHEX$$la producci$$HEX1$$f300$$ENDHEX$$n te$$HEX1$$f300$$ENDHEX$$rica.",StopSign!)

End If



DWObject dwo_a

dwo_a= dw_tiempo.Object.produccion_teo

dw_tiempo.Trigger Event ItemChanged(1,dwo_a,String(dw_tiempo.GetItemDecimal(1,"produccion_teo")))

dw_tiempo.of_color("produccion_teo",0)
dw_tiempo.of_color("minutos",0)
dw_tiempo.of_color("segundos",0)
dw_tiempo.of_color("solo_seg",0)


Return 1
end function

public function long of_muestrario ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 02 de Abril de 2003 HORA 12:14:05:218
// 
// el muestrario es el m$$HEX1$$e100$$ENDHEX$$ximo de fab+lin+ref+talla+cal en dt_ref_x_col
//////////////////////////////////////////////////////////////////////////
long ll_muestrario,ll_tot

//////////////////////////////////////////////////////////////////////////
// Se debe definir la referencia de venta de la ref de pdn
// 
//////////////////////////////////////////////////////////////////////////
n_ds_application lds_1

lds_1=create n_ds_application

lds_1.DataObject="d_dt_vta_pdn_mues"

lds_1.SetTransObject(n_cst_application.itr_appl)

ll_tot=lds_1.retrieve(il_fabrica,&
               		 il_linea,&
					       il_referencia,&
							 il_talla,&
					       il_calidad)
					
If ll_tot<=0 Then
	Destroy lds_1
	MessageBox("Advertencia!","No se determin$$HEX2$$f3002000$$ENDHEX$$la referencia de venta.",StopSign!)
	Return -1
End If

long ll_fabricav,ll_lineav,ll_referenciav,ll_tallav,ll_calidadv

ll_fabricav=lds_1.GetItemNumber(1,"co_fabricav")
ll_lineav=lds_1.GetItemNumber(1,"co_lineav")
ll_referenciav=lds_1.GetItemNumber(1,"co_referenciav")
ll_tallav=lds_1.GetItemNumber(1,"co_tallav")
ll_calidadv=lds_1.GetItemNumber(1,"co_calidadv")

destroy lds_1


  SELECT max(dt_ref_x_col.co_muestrario)  
    INTO :ll_muestrario  
    FROM dt_ref_x_col  
   WHERE ( dt_ref_x_col.co_fabrica = :ll_fabricav ) AND  
         ( dt_ref_x_col.co_linea = :ll_lineav) AND  
         ( dt_ref_x_col.co_referencia = :ll_referenciav ) AND  
         ( dt_ref_x_col.co_talla = :ll_tallav ) AND  
         ( dt_ref_x_col.co_calidad = :ll_calidadv )   
		using	n_cst_application.itr_appl;
			
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If
			
If n_cst_application.itr_appl.SQLcode=100 or IsNull(ll_muestrario) Then
	MessageBox("Advertencia!","No fue posible determinar el muestrario.",StopSign!)
	Return -1
End If


Return ll_muestrario
			
			
			
			
Return 1			


end function

public function integer of_datosmaquina (long a_maquina);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 21 de Agosto de 2003 HORA 15:07:02:442
// 
// informaci$$HEX1$$f300$$ENDHEX$$n de m$$HEX1$$e100$$ENDHEX$$quina y recurso en lugares separados
//////////////////////////////////////////////////////////////////////////


SetNull(il_piso)
SetNull(il_pasillo)
SetNull(il_parqueadero)
SetNull(ide_diam_cilindro)
SetNull(il_ca_aguja)
SetNull(il_nu_galga)
SetNull(is_de_equipo)

If isnull(a_maquina) Then
//////////////////////////////////////////////////////////////////////////
// cuando no se tiene la maquina solo se colocan los datos del recurso
// 
//////////////////////////////////////////////////////////////////////////
  SELECT m_recursos_tj.diam_cilindro,   
         m_recursos_tj.ca_aguja,   
         m_recursos_tj.nu_galga,   
         m_recursos_tj.de_modelo  
    INTO :ide_diam_cilindro,   
         :il_ca_aguja,   
         :il_nu_galga,   
         :is_de_equipo  
    FROM m_recursos_tj  
  WHERE ( m_recursos_tj.co_recurso = :il_recurso )   
           using n_cst_application.itr_appl  ;

	If n_cst_application.itr_appl.SQLcode=-1 Then 
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(n_cst_application.itr_appl)
		Return -1
	End If
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

on w_inf_med_ref.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_report_medidas_ref" then this.MenuID = create m_report_medidas_ref
this.dw_head=create dw_head
this.dw_tiempo=create dw_tiempo
this.dw_referencia=create dw_referencia
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_referencia=create gb_referencia
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_head
this.Control[iCurrent+2]=this.dw_tiempo
this.Control[iCurrent+3]=this.dw_referencia
this.Control[iCurrent+4]=this.gb_1
this.Control[iCurrent+5]=this.gb_2
this.Control[iCurrent+6]=this.gb_referencia
end on

on w_inf_med_ref.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_head)
destroy(this.dw_tiempo)
destroy(this.dw_referencia)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_referencia)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 16 de Agosto de 2003 HORA 13:50:16:669
// 
// se actualiza la ventana para que sea parametrizable o se ingresen los datos
//////////////////////////////////////////////////////////////////////////
n_cst_comun lo_comun
long ll_res

idw_data=dw_report


io_param=Message.PowerObjectParm

dw_referencia.SetTransObject(n_cst_application.itr_appl)

dw_referencia.insertRow(0)

If IsValid(io_param) Then
	
	il_fabrica=io_param.il_vector[1]
	il_linea=io_param.il_vector[2]
	il_referencia=io_param.il_vector[3]
	il_talla=io_param.il_vector[4]
	il_calidad=io_param.il_vector[5]
	il_diseno=io_param.il_vector[6]
	il_recurso=io_param.il_vector[7]
	

	dw_referencia.SetItem(1,"co_fabrica",il_fabrica)
	dw_referencia.setItem(1,"co_linea",il_linea)
	dw_referencia.setItem(1,"co_referencia",il_referencia)
	dw_referencia.setItem(1,"co_talla",il_talla)
	dw_referencia.setItem(1,"co_calidad",il_calidad)
	dw_referencia.setItem(1,"co_recurso",il_recurso)
	dw_referencia.setItem(1,"co_diseno",il_diseno)
	
	ll_res=lo_comun.of_nombrereferencia(il_fabrica /*long a_fabrica*/,&
	                                    il_linea /*long a_linea*/,&
													il_referencia/*long a_referencia*/,&
													n_cst_application.itr_appl/*transaction a_transaction */)
													
	If ll_res=1 Then
		dw_referencia.SetItem(1,"de_referencia",lo_comun.of_getString(1))
	End If
	
	
	ll_res=lo_comun.of_nombrereferenciatalla(il_fabrica /*long a_fabrica*/,&
	                                         il_linea/*long a_linea*/,& 
														  il_referencia/*long a_referencia*/,&
														  il_talla/*long a_talla*/, &
														  il_calidad/*long a_calidad*/,& 
														  n_cst_application.itr_appl/*transaction a_transaction */)
	If ll_res=1 Then
		dw_referencia.SetItem(1,"de_talla",lo_comun.of_getString(1))
	End If	
	
	
	ll_res=lo_comun.of_nombrerecursotj( il_recurso/*long a_recurso*/,&
	                                    n_cst_application.itr_appl/*transaction a_transaction */)
	If ll_res=1 Then
		dw_referencia.SetItem(1,"de_recurso_tejido",lo_comun.of_getString(1))
	End If	
	
	ll_res=lo_comun.of_nombrediseno(il_fabrica /*long a_fabrica*/,&
	                                il_linea/*long a_linea*/,&
											  il_referencia/*long a_referencia*/,&
											  il_talla/*long a_talla*/,&
											  il_calidad/*long a_calidad*/,&
											  il_diseno/*long a_diseno*/,&
											  n_cst_application.itr_appl/*transaction a_transaction */)
											  
	If ll_res=1 Then
		dw_referencia.SetItem(1,"de_diseno",lo_comun.of_getString(1))
	End If												  

End If

							
dw_head.InsertRow(0)

dw_report.SetTransObject(n_cst_application.itr_appl)


end event

event resize;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 21 de Agosto de 2003 HORA 15:02:02:769
// 
// OverWrite!!
//////////////////////////////////////////////////////////////////////////

end event

type dw_report from w_report`dw_report within w_inf_med_ref
integer x = 9
integer y = 604
integer width = 3625
integer height = 1208
integer taborder = 0
string dataobject = "d_inf_med_ref"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event dw_report::ue_find;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 09 de Enero de 2003 HORA 15:18:05:312
// 
// Verifico que existan datos de maquina y que esa maquina si sea del
// recurso que se selecciono.
//////////////////////////////////////////////////////////////////////////


long ll_maquina,ll_recurso
String ls_ref_ant

If dw_head.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If

If dw_referencia.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If
//////////////////////////////////////////////////////////////////////////
// Es posible que la impresion sea sin especificar m$$HEX1$$e100$$ENDHEX$$quina o 
// producci$$HEX1$$f300$$ENDHEX$$n teorica
//////////////////////////////////////////////////////////////////////////


ll_maquina=long(dw_head.GetItemString(1,"maquina"))

If Not IsNull(ll_maquina) Then
	ll_recurso=il_recurso
	
	If of_recursoMaquina(ll_maquina)<>ll_recurso Then
		MessageBox("Advertencia!","La m$$HEX1$$e100$$ENDHEX$$quina no pertenece al recurso seleccionado, por favor verifique.",StopSign!)
		Return
	End If
End If


//////////////////////////////////////////////////////////////////////////
// Coloco los datos teoricos
// 
//////////////////////////////////////////////////////////////////////////
of_teorica()


long ll_min,ll_seg,ll_t

ll_min=dw_tiempo.GetItemNumber(1,"minutos")

If IsNull(ll_min) Then ll_min=0

ll_seg=dw_tiempo.GetItemNumber(1,"segundos")

If IsNull(ll_seg) Then ll_seg=0

ll_t=ll_min * 60 + ll_seg

//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 04 de Agosto de 2003 HORA 09:49:00:021
// 
// Se omite la validaci$$HEX1$$f300$$ENDHEX$$n del tiempo por requerimiento de Jaime Ceballos
//////////////////////////////////////////////////////////////////////////



//If ll_t=0 Then
//	MessageBox("Advertencia!","Debe especificar minutos y/o segundos.",StopSign!)
//	Return
//End If
String ls_tiempo
If ll_min>0 Then
	ls_tiempo+=String(ll_min)+" m "
End If

If ll_seg>0 Then
	ls_tiempo+=String(ll_seg)+" s "
End If

ls_tiempo+=" = "+String(ll_t)+" seg "

Modify("teorico_seg.text='"+ls_tiempo+"'")

Decimal{2} lde_docenas

lde_docenas=dw_tiempo.GetItemDecimal(1,"produccion_teo")

Modify("doc_turno.text='"+String(lde_docenas)+"'")



ls_ref_ant=dw_head.GetItemString(1,"ref_ant")




//////////////////////////////////////////////////////////////////////////
// Tomo la fecha del servidor
// 
//////////////////////////////////////////////////////////////////////////
DateTime ldt_fecha
String ls_usuario,ls_instancia

	If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
													 ldt_fecha,ls_usuario,ls_instancia) Then
		Return
	End If

//////////////////////////////////////////////////////////////////////////
// Recupero los datos de la maquina
// 
//////////////////////////////////////////////////////////////////////////

If of_datosMaquina(ll_maquina)<>1 Then
	Return 
End If
String ls_ref

ls_ref=String(il_fabrica)+" "+&
       String(il_linea)+" "+&
		 String(il_referencia)
		 

Modify("fecha.text='"+String(ldt_fecha,"YYYY/MM/DD hh:mm")+" "+ls_usuario+"'")


Modify("ref_ant.text='"+ls_ref_ant+"'")
Modify("ref_ant1.text='"+ls_ref_ant+"'")


Modify("maquina.text='"+String(ll_maquina)+"'")
Modify("maquina1.text='"+String(ll_maquina)+"'")

Modify("referencia.text='"+ls_ref+"'")
Modify("referencia1.text='"+ls_ref+"'")

Modify("equipo.text='"+is_de_equipo+"'")
Modify("equipo1.text='"+is_de_equipo+"'")

String ls_talla
long ll_res

n_cst_comun lo_comun

ll_res=lo_comun.of_nombreReferenciaTalla(il_fabrica,&
                                         il_linea,&
													  il_referencia,&
													  il_talla,&
													  il_calidad,n_cst_application.itr_appl)

If ll_res<>1 Then
	MessageBox("Advertencia!","No se pudo determinar la talla.",StopSign!)
	Return
End If

ls_talla=lo_comun.of_getString(1)

If IsNull(ls_talla) or Trim(ls_talla)="" Then
	MessageBox("Advertencia!","No se pudo determinar la talla.",StopSign!)
	Return
End If

Modify("talla.text='"+ls_talla+"'")
Modify("talla1.text='"+ls_talla+"'")

Modify("galga.text='"+String(ide_diam_cilindro)+"X"+String(il_ca_aguja)+&
"-"+String(il_nu_galga)+"'")

Modify("galga1.text='"+String(ide_diam_cilindro)+"X"+String(il_ca_aguja)+&
"-"+String(il_nu_galga)+"'")
//MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Retrieve")

long ll_diseno

ll_diseno=dw_referencia.GetItemNumber(1,"co_diseno")

If IsNull(ll_diseno) then ll_diseno = -1


//Messagebox('Var','il_fabrica='+String(il_fabrica)+'~n'+&
//'il_linea='+String(il_linea)+'~n'+&
//'il_referencia='+String(il_referencia)+'~n'+&
//'il_talla='+String(il_talla)+'~n'+&
//'il_calidad='+String(il_calidad)+'~n'+&
//'ll_diseno='+String(ll_diseno)+'~n')


ll_res=lo_comun.of_nombrediseno(il_fabrica /*long a_fabrica*/,&
                         il_linea /*long a_linea*/,&
								 il_referencia/*long a_referencia*/, &
								 il_talla/*long a_talla*/,&
								 il_calidad/*long a_calidad*/, &
								 ll_diseno/*long a_diseno*/, &
								 n_cst_application.itr_appl/*transaction a_transaction */)

If ll_res=1 Then	
	Modify("diseno.text='("+String(ll_diseno)+") "+lo_comun.of_getString(1)+"'")
	Modify("diseno1.text='("+String(ll_diseno)+") "+lo_comun.of_getString(1)+"'")
Else
	MessageBox("Advertencia!","Dise$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
	Return
End If


If Retrieve(il_fabrica,&
            il_linea,&
			   il_referencia,&
			   il_talla,&
			   il_calidad,&
			   il_recurso,&
			   ll_diseno) <=0 Then
			
	MessageBox("Advertencia!","No se pudo recuperar la informaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
	Return
End If
		

String ls_bpl_co_tipprod,ls_nom_tipprod

ls_bpl_co_tipprod=GetItemString(1,"bpl_co_tipprod")

lo_comun.of_nombreBplTipoProd(ls_bpl_co_tipprod,n_cst_application.itr_appl)
ls_nom_tipprod=lo_comun.of_getString(1)

Modify("forma_tejer.text='"+ls_nom_tipprod+"'")
Modify("forma_tejer1.text='"+ls_nom_tipprod+"'")

long ll_cliente,ll_sucursal

ll_cliente=GetItemNumber(1,"co_cliente")
ll_sucursal=GetItemNumber(1,"co_sucursal")

String ls_cliente

lo_comun.of_nombreClienteNal(ll_cliente,ll_sucursal,n_cst_application.itr_appl)
ls_cliente=lo_comun.of_getString(1)

ls_cliente=String(ll_cliente)+" "+String(ll_sucursal)+" "+ls_cliente

Modify("cliente.text='"+ls_cliente+"'")
Modify("cliente1.text='"+ls_cliente+"'")

Modify("pasillo.text='"+String(il_pasillo)+"'")
Modify("pasillo1.text='"+String(il_pasillo)+"'")

Modify("parqueo.text='"+String(il_parqueadero)+"'")
Modify("parqueo1.text='"+String(il_parqueadero)+"'")

Modify("rec.text='"+String(il_recurso)+"'")

long 		ll_muestrario
String  	ls_muestrario

ll_muestrario=of_muestrario()

If ll_muestrario=-1 Then
	Return 
End If

ll_res=lo_comun.of_nombremuestrario(il_fabrica,&
                                    il_linea,&
												ll_muestrario,&
												n_cst_application.itr_appl)
If ll_res=1 Then
	ls_muestrario="("+String(ll_muestrario)+") "+lo_comun.of_getString(1)
	Modify("muestrario.text='"+ls_muestrario+"'")
End If

////////////////////////////////////////////////////////////////////////////
// Toca hacer lo siguiente, porque no funciona el getchild,
// 
//////////////////////////////////////////////////////////////////////////


long i

n_ds_application lds_1

lds_1=create n_ds_application

lds_1.DataObject="d_inf_det_ref_bas"

lds_1.SetTransObject(n_cst_application.itr_appl)

lds_1.Retrieve(12,12,il_recurso,&
                     il_fabrica,&
							il_linea,&
							il_referencia,&
							il_talla,&
							il_calidad,&
							ll_diseno)
							
String ls_obser,ls_cad1,ls_cad2
For i=1 To lds_1.RowCount()
	ls_cad1=lds_1.GetItemString(i,"de_observacion")
	If Trim(ls_cad1)<>"" Then
		ls_cad1=trim(ls_Cad1)
		ls_cad2=lds_1.GetItemString(i,"de_partebas")
		ls_cad2=trim(ls_Cad2)
		ls_obser+=ls_cad2+": "+ls_cad1+"~n~r"
	End If
Next
If len(ls_obser)>0 Then
	ls_obser=mid(ls_obser,1,len(ls_obser) -2)
	Modify("observacion.text='"+ls_obser+"'")
End If

end event

event dw_report::getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 02 de Diciembre de 2002 HORA 13:57:58:296
// 
// OverWrite!!
//////////////////////////////////////////////////////////////////////////

end event

type dw_head from u_dw_application within w_inf_med_ref
integer x = 23
integer y = 364
integer width = 558
integer height = 168
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_ext_maq_ref_ant"
boolean vscrollbar = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 02 de Diciembre de 2002 HORA 13:57:58:296
// 
// OverWrite!!
//////////////////////////////////////////////////////////////////////////

end event

type dw_tiempo from u_dw_application within w_inf_med_ref
integer x = 745
integer y = 364
integer width = 1591
integer height = 176
integer taborder = 0
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_m_producc_teo"
boolean vscrollbar = false
end type

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 09 de Enero de 2003 HORA 15:23:25:953
// 
// 
//////////////////////////////////////////////////////////////////////////
Decimal lde_produc,lde_seg
long ll_min,ll_seg,ll_seg_solo

If dwo.name="produccion_teo" Then
	lde_produc=Dec(Data)
	
	If IsNull(lde_produc) Then lde_produc=0
	
	If lde_produc=0 Then Return 2
	
	lde_seg=1200/lde_produc
	ll_seg_solo=Truncate(lde_seg,0)
	ll_min=Truncate(lde_seg/60,0)
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
	
	lde_produc=1200/lde_seg
	SetItem(1,"produccion_teo",lde_produc)

	ll_min=Truncate(lde_seg/60,0)
	ll_seg=lde_seg - ll_min * 60
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

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 09 de Enero de 2003 HORA 16:42:45:687
// 
// 
//////////////////////////////////////////////////////////////////////////

end event

type dw_referencia from u_dw_application within w_inf_med_ref
integer x = 50
integer y = 64
integer width = 3511
integer height = 180
boolean bringtotop = true
string dataobject = "d_h_preref"
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


If dwo.name="co_diseno" Then
	lo_param.il_vector[1]=il_fabrica
	lo_param.il_vector[2]=il_linea
	lo_param.il_vector[3]=il_referencia
	lo_param.il_vector[4]=il_talla
	lo_param.il_vector[5]=1 //calidad
	
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

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 21 de Agosto de 2003 HORA 14:22:41:425
// 
// Overwrite!
//////////////////////////////////////////////////////////////////////////

end event

event itemchanged;call super::itemchanged;long ll_Dato
n_cst_comun lo_comun
long ll_res

If il_err_item_change<>0 Then 
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

dw_report.reset()

end event

event losefocus;call super::losefocus;gb_referencia.of_color(False)
end event

event ue_insertrow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 16 de Agosto de 2003 HORA 13:47:21:464
// 
// OverWrite!
//////////////////////////////////////////////////////////////////////////

end event

event ue_deleterow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 16 de Agosto de 2003 HORA 13:47:44:370
// 
// OverWrite!
//////////////////////////////////////////////////////////////////////////

end event

type gb_1 from groupbox within w_inf_med_ref
integer x = 9
integer y = 300
integer width = 603
integer height = 264
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Datos adicionales"
end type

type gb_2 from groupbox within w_inf_med_ref
integer x = 677
integer y = 300
integer width = 2139
integer height = 264
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Producci$$HEX1$$f300$$ENDHEX$$n te$$HEX1$$f300$$ENDHEX$$rica"
end type

type gb_referencia from u_gb_base within w_inf_med_ref
integer x = 18
integer y = 8
integer width = 3579
integer height = 256
integer taborder = 0
string text = "Referencia"
end type

