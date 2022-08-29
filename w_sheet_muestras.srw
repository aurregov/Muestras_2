HA$PBExportHeader$w_sheet_muestras.srw
$PBExportComments$Backup de la version anterior
forward
global type w_sheet_muestras from w_sheet
end type
type dw_muestra from u_dw_application within w_sheet_muestras
end type
type gb_muestra from u_gb_base within w_sheet_muestras
end type
type tab_1 from tab within w_sheet_muestras
end type
type tabpage_1 from userobject within tab_1
end type
type dw_dt_muestras_col from u_dw_application within tabpage_1
end type
type dw_dt_muestras from u_dw_application within tabpage_1
end type
type gb_detalle from u_gb_base within tabpage_1
end type
type gb_colores from u_gb_base within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_dt_muestras_col dw_dt_muestras_col
dw_dt_muestras dw_dt_muestras
gb_detalle gb_detalle
gb_colores gb_colores
end type
type tabpage_2 from userobject within tab_1
end type
type dw_observacion from u_dw_application within tabpage_2
end type
type gb_1 from groupbox within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_observacion dw_observacion
gb_1 gb_1
end type
type tab_1 from tab within w_sheet_muestras
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
end forward

global type w_sheet_muestras from w_sheet
integer x = 0
integer y = 0
integer width = 3662
integer height = 1552
string title = "Muestras"
string menuname = "m_muestra"
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
event ue_ficha_tecnica ( )
event ue_refrescarcodigos ( )
event ue_borrar_muestra ( )
event ue_cambiar_estado_color ( )
event ue_cambiar_estado_todos ( )
event ue_copiar_matprima ( )
dw_muestra dw_muestra
gb_muestra gb_muestra
tab_1 tab_1
end type
global w_sheet_muestras w_sheet_muestras

type prototypes
// Declare this as your Local External Function
FUNCTION ulong GetTempPathA (long nBufferLength, &
   ref string lpBuffer  ) LIBRARY "KERNEL32.DLL" alias for "GetTempPathA;Ansi"


end prototypes

type variables
datawindowchild idc_fabrica,idc_linea,idc_grupos_vta, &
                idc_sgrupo_vta,idc_tipo_tejido,idc_tallas_por_grupo, &
					 idc_ref_exp,idc_talla_exp,idc_colores_exp,&
					 idc_partebas,idc_col_ad,idc_col_ad_1,&
					 idc_partebas11
					 
long il_co_cliente, il_co_sucursal, &
     il_fila_sel,il_talla,&
	  il_fila_col,il_color,&
     il_fabrica,il_linea,il_muestra,il_tipo_prod, il_grupo_talla

boolean ib_cambios=false

String is_co_ref_exp,is_co_talla_exp,is_co_color_exp,&
       is_tipo_solicitud, is_nu_orden, is_de_referencia

long il_col_ad_usado=0

String is_where_busqueda

String is_desarrollador

Date id_fecha_solicitud, id_fe_entrega

long il_ejecutiva
end variables

forward prototypes
public function integer of_haydatosfil (datawindow a_dw)
public function integer of_retrieve_cliente ()
public function integer of_colorestodos ()
public function integer of_cargar_dddw (long a_fabrica)
public function integer of_retrieve_tipo_prod ()
public function integer of_datos_dt_solicitud (long a_fabrica, long a_solicitud, string a_ref_exp)
public function integer of_haydatos (datawindow a_dw)
public function integer of_insertardiseno ()
public function integer of_nombrerestrictivo ()
public function integer of_redraw (boolean a_redrawing)
public function integer of_buscar (long a_fabrica, long a_linea, long a_muestra)
public function integer of_grabar ()
public function integer of_validar ()
public function integer of_filtro_color (long a_color, long a_fila)
public function integer of_datos_solicitud (long a_fabrica, long a_solicitud)
public function integer of_filtro_talla (long a_talla, string a_talla_exp, long a_fila)
public function integer of_borrablancos (datawindow a_dw)
end prototypes

event ue_ficha_tecnica();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 12 de Noviembre de 2002 HORA 10:31:26:734
// 
// Para el manejo de la ficha tecnica de muestras
//////////////////////////////////////////////////////////////////////////

If dw_muestra.RowCount()=0 Then Return 

n_cst_param lo_param

lo_param.il_vector[1]=il_fabrica
lo_param.il_vector[2]=il_linea
lo_param.il_vector[3]=il_muestra
lo_param.il_vector[4]=il_talla
//lo_param.il_vector[5]=il_diseno
//lo_param.il_vector[6]=il_recurso

If il_talla=-1 Then
	MessageBox("Advertencia!","No se pudo determinar la talla.",StopSign!)
	Return
End If


OpenSheetWithParm(w_inf_muestra_medidas,lo_param,This.ParentWindow(),2,Original!)

end event

event ue_refrescarcodigos();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 27 de Noviembre de 2002 HORA 09:36:17:578
// 
// Para refrescar las listas desplegables
//////////////////////////////////////////////////////////////////////////

idc_partebas.Retrieve(il_tipo_prod)

end event

event ue_borrar_muestra();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 25 de Agosto de 2003 HORA 12:30:38:153
// 
// Se elimina la muestra
//////////////////////////////////////////////////////////////////////////

long ll_Res

ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea eliminar esta muestra y toda su informaci$$HEX1$$f300$$ENDHEX$$n relacionada ?",Question!,YesNo!,2)

If ll_res<>1 Then
	Return 
End If

  DELETE FROM m_disenos_muestras  
   WHERE ( m_disenos_muestras.co_fabrica = :il_fabrica ) AND  
         ( m_disenos_muestras.co_linea = :il_linea ) AND  
         ( m_disenos_muestras.co_muestra = :il_muestra )   
           using  n_cst_application.itr_appl;
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If

  DELETE FROM dt_medidas_est  
   WHERE ( dt_medidas_est.co_fabrica = :il_fabrica ) AND  
         ( dt_medidas_est.co_linea = :il_linea ) AND  
         ( dt_medidas_est.co_muestra = :il_muestra )   
           using  n_cst_application.itr_appl;
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If

  DELETE FROM m_proref_muestras  
   WHERE ( m_proref_muestras.co_fabrica = :il_fabrica ) AND  
         ( m_proref_muestras.co_linea = :il_linea ) AND  
         ( m_proref_muestras.co_muestra = :il_muestra )   
           using  n_cst_application.itr_appl;
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If

  DELETE FROM dt_muestras_col  
   WHERE ( dt_muestras_col.co_fabrica = :il_fabrica ) AND  
         ( dt_muestras_col.co_linea = :il_linea ) AND  
         ( dt_muestras_col.co_muestra = :il_muestra )   
           using  n_cst_application.itr_appl;
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If

  DELETE FROM dt_muestras  
   WHERE ( dt_muestras.co_fabrica = :il_fabrica ) AND  
         ( dt_muestras.co_linea = :il_linea ) AND  
         ( dt_muestras.co_muestra = :il_muestra )   
           using  n_cst_application.itr_appl;
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If


dw_muestra.DeleteRow(0)

If dw_muestra.update()<>1 Then
	RollBack using n_cst_application.itr_appl ;
	Return
End If

Commit using n_cst_application.itr_appl ;

tab_1.tabpage_1.dw_dt_muestras.Reset()
tab_1.tabpage_1.dw_dt_muestras_col.Reset()

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Muestra eliminada exitosamente.")






end event

event ue_cambiar_estado_color();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 13 de Septiembre de 2003 HORA 14:26:09:218
// 
// Cuando se cambia el estado de un color de una muestra
//////////////////////////////////////////////////////////////////////////
long ll_res

If ib_cambios Then
	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea guardar los cambios ?",Question!,YesNo!,2)
	If ll_res<>1 Then
		Return
	End If
	If of_grabar()<>1 Then
		Return
	End If
End If

If il_color=-1 Then
	MessageBox("Advertencia!","Debe seleccionar un color.",StopSign!)
	Return
End If

n_cst_param lo_param

lo_param.il_vector[1]=il_fabrica
lo_param.il_vector[2]=il_linea
lo_param.il_vector[3]=il_muestra
lo_param.il_vector[4]=il_talla
lo_param.il_vector[5]=il_color

lo_param.is_vector[1]=dw_muestra.getItemString(1,"de_muestra")


OpenWithParm(w_cambio_estado_color,lo_param)

lo_param=message.PowerObjectParm

//////////////////////////////////////////////////////////////////////////
// El retorno es el estado en que queda el color, el ultimo que se coloca, 
// o si dan cancelar retorna nada
//////////////////////////////////////////////////////////////////////////

If Not IsValid(lo_param) Then
	Return 
End If

If il_fila_col>0 Then
	tab_1.tabpage_1.dw_dt_muestras_col.&
	SetItem(il_fila_col,"co_estado",lo_param.il_vector[1])
End If






end event

event ue_cambiar_estado_todos;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 08 de Octubre de 2003 HORA 14:08:33:450
// 
// Para cambiar el estado de todos los colores
//////////////////////////////////////////////////////////////////////////



long ll_res

If ib_cambios Then
	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea guardar los cambios ?",Question!,YesNo!,2)
	If ll_res<>1 Then
		Return
	End If
	If of_grabar()<>1 Then
		Return
	End If
End If

n_cst_param lo_param

lo_param.il_vector[1]=il_fabrica
lo_param.il_vector[2]=il_linea
lo_param.il_vector[3]=il_muestra
//lo_param.il_vector[4]=il_talla
//lo_param.il_vector[5]=il_color

lo_param.is_vector[1]=dw_muestra.getItemString(1,"de_muestra")


OpenWithParm(w_cambio_estado_color_gen,lo_param)

lo_param=message.PowerObjectParm

//////////////////////////////////////////////////////////////////////////
// El retorno es el estado en que queda el color, el ultimo que se coloca, 
// o si dan cancelar retorna nada
//////////////////////////////////////////////////////////////////////////

If Not IsValid(lo_param) Then
	Return 
End If

//////////////////////////////////////////////////////////////////////////
// Disparo el evento de recuperar
// 
//////////////////////////////////////////////////////////////////////////
of_buscar(il_fabrica,il_linea,il_muestra)





end event

event ue_copiar_matprima();//////////////////////////////////////////////////////////////////////////
// Copia de la materia prima
// 
//////////////////////////////////////////////////////////////////////////

end event

public function integer of_haydatosfil (datawindow a_dw);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 30 de Septiembre de 2002 HORA 11:28:17:203
// 
// Cuenta los datos incluyendo los filtrados
//////////////////////////////////////////////////////////////////////////



of_borraBlancos(a_dw)

If a_dw.RowCount() + a_dw.FilteredCount ( ) >0 Then
	Return 1
Else
	Return -1
End If
end function

public function integer of_retrieve_cliente ();//////////////////////////////////////////////////////////////////////////
// Recupero los procesos adicionales por cliente y sucursal
// 
//////////////////////////////////////////////////////////////////////////
//long ll_tot
//ll_tot=tab_1.tabpage_2.dw_m_proceso_ad.Retrieve(il_co_cliente,il_co_sucursal)
//If ll_tot>0 Then
//	of_filtro_pa(1)
//	ll_tot=tab_1.tabpage_2.dw_dt_colores_ad.Retrieve(il_co_cliente,il_co_sucursal,il_fabrica,il_linea)
//End If


Return 1
end function

public function integer of_colorestodos ();long i
If tab_1.tabpage_1.dw_dt_muestras_col.RowCount()=0 Then
	For i=1 To idc_colores_exp.RowCount()
		tab_1.tabpage_1.dw_dt_muestras_col.InsertRow(0)
		tab_1.tabpage_1.dw_dt_muestras_col.SetItem(i,"co_color_exp",&
		idc_colores_exp.GetItemString(i,"co_color"))
		
		tab_1.tabpage_1.dw_dt_muestras_col.SetItem(i,"co_talla",il_talla)
	Next
End If


Return 1






















end function

public function integer of_cargar_dddw (long a_fabrica);n_cst_comun lo_comun
lo_comun.of_loadDddw(idc_linea,a_fabrica,n_cst_application.itr_appl)
lo_comun.of_loadDddw(idc_grupos_vta,a_fabrica,n_cst_application.itr_appl)
lo_comun.of_loadDddw(idc_sgrupo_vta,a_fabrica,n_cst_application.itr_appl)

Return 1
end function

public function integer of_retrieve_tipo_prod ();n_cst_comun lo_comun
lo_comun.of_loadDddw(idc_tipo_tejido,il_tipo_prod,n_cst_application.itr_appl)

lo_comun.of_loadDddw(idc_partebas,il_tipo_prod,n_cst_application.itr_appl)

//tab_1.tabpage_3.dw_m_parte_bas.Retrieve(il_tipo_prod)
//se deb cargar un drop down con las partes del producto
Return 1
end function

public function integer of_datos_dt_solicitud (long a_fabrica, long a_solicitud, string a_ref_exp);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 08 de Octubre de 2002 HORA 09:55:09:468
// 
// Datos del detalle de la solicitud
//////////////////////////////////////////////////////////////////////////
If IsNull(a_ref_exp) Then a_ref_exp=""

a_ref_exp=trim(a_ref_exp)


  SELECT min(dt_solicitudes.nu_orden),   
         min(dt_solicitudes.de_referencia)  
    INTO :is_nu_orden,   
         :is_de_referencia  
    FROM dt_solicitudes  
   WHERE ( dt_solicitudes.co_fabrica = :a_fabrica ) AND  
         ( dt_solicitudes.nu_solicitud = :a_solicitud ) AND  
         ( dt_solicitudes.co_ref_exp = :a_ref_exp ) using n_cst_application.itr_appl  ;


If n_cst_application.itr_appl.SqlCode = -1 Then
	is_nu_orden=""
	is_de_referencia=""
	MessageBox("Advertencia!","Hubo un error al consultar detalle de Solicitudes.~n~nNota: " + n_cst_application.itr_appl.SqlErrText )
	Return -1
ElseIf n_cst_application.itr_appl.SqlCode = 100 Then
	is_nu_orden=""
	is_de_referencia=""
End If

Return 1











end function

public function integer of_haydatos (datawindow a_dw);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 26 de Septiembre de 2002 HORA 11:56:53:906
// 
// Verifica si existen o no tallas
//////////////////////////////////////////////////////////////////////////


of_borraBlancos(a_dw) 

If a_dw.RowCount()>0 Then
	Return 1
Else
	Return -1
End If
end function

public function integer of_insertardiseno ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 15 de Agosto de 2003 HORA 09:48:15:979
// 
// Se inseran los dise$$HEX1$$f100$$ENDHEX$$os de las muestra en todas las tallas con 
// c$$HEX1$$f300$$ENDHEX$$digo 1
//////////////////////////////////////////////////////////////////////////


String ls_diseno

ls_diseno=dw_muestra.getItemString(1,"co_diseno_muestra")


  INSERT INTO m_disenos_muestras  
         ( co_fabrica,   
           co_linea,   
           co_muestra,   
           co_talla,   
           co_diseno,   
           de_diseno,   
           fe_creacion,   
           fe_actualizacion,   
           usuario,   
           instancia )  
     SELECT dt_muestras.co_fabrica,   
            dt_muestras.co_linea,   
            dt_muestras.co_muestra,   
            dt_muestras.co_talla,   
            1,   
            :ls_diseno,   
            current,   
            current,   
            user,   
            DBSERVERNAME  
       FROM dt_muestras  
      WHERE ( dt_muestras.co_fabrica = :il_fabrica ) AND  
            ( dt_muestras.co_linea = :il_linea ) AND  
            ( dt_muestras.co_muestra = :il_muestra ) AND  
            ( dt_muestras.co_talla not in (  SELECT m_disenos_muestras.co_talla  
                                               FROM m_disenos_muestras  
                                              WHERE ( m_disenos_muestras.co_fabrica = :il_fabrica ) AND  
                                                    ( m_disenos_muestras.co_linea = :il_linea ) AND  
                                                    ( m_disenos_muestras.co_muestra = :il_muestra ) AND  
                                                    ( m_disenos_muestras.co_diseno = 1 )   
                                                     ))  using n_cst_application.itr_appl ;
																	  
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If
																	  
Return 1


end function

public function integer of_nombrerestrictivo ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 23 de Agosto de 2003 HORA 15:19:45:161
// 
// Para colocar el nombre del recurso restrictivo cuando se recupera..
//////////////////////////////////////////////////////////////////////////
n_cst_comun lo_comun
long ll_tot,i,ll_rec,ll_res

ll_tot=tab_1.tabpage_1.dw_dt_muestras.RowCount()

For i=1 to ll_tot
	ll_rec=tab_1.tabpage_1.dw_dt_muestras.GetItemNumber(i,"id_rec_rest")
	ll_res=lo_comun.of_nombrerecursorestrictivo( ll_rec,n_cst_application.itr_appl /*transaction a_transaction */)
	
	If ll_res=1 Then
		tab_1.tabpage_1.dw_dt_muestras.SetItem(i,"de_rec_rest",lo_comun.of_getString(1))
	End If

Next


Return 1
end function

public function integer of_redraw (boolean a_redrawing);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 16 de Octubre de 2002 HORA 15:43:57:250
// 
// Redraw al momento de guardar
//////////////////////////////////////////////////////////////////////////


tab_1.tabpage_1.dw_dt_muestras.SetRedraw(a_redrawing)
tab_1.tabpage_1.dw_dt_muestras_col.SetRedraw(a_redrawing)

Return 1
end function

public function integer of_buscar (long a_fabrica, long a_linea, long a_muestra);//////////////////////////////////////////////////////////////////////////
// Se utiliza 0 para nueva
// 
//////////////////////////////////////////////////////////////////////////
n_cst_comun  lo_comun

Long ll_res

If ib_cambios Then
	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
	
	If ll_res=2 Then
		Return -2
	End If
End If

ib_cambios=False

tab_1.tabpage_1.dw_dt_muestras.Reset()

ll_res=dw_muestra.Retrieve(a_fabrica,a_linea,a_muestra)
If ll_res<0 Then
	MessageBox("Advertencia!","Error recuperando datos.",StopSign!)
	dw_muestra.InsertRow(0)
	Return -1
End If

//////////////////////////////////////////////////////////////////////////
// coloco la desc del tipo de medida
// 
//////////////////////////////////////////////////////////////////////////
long ll_tipo_med

ll_tipo_med=dw_muestra.GetItemNumber(1,"id_tipo_med")

ll_Res=lo_comun.of_nombretipomedida(ll_tipo_med /*long a_tipo_medida*/, &
                                    n_cst_application.itr_appl/*transaction a_transaction */)
												
If ll_res=1 Then
	dw_muestra.SetItem(1,"de_tipo_med",lo_comun.of_getString(1))
End If



If ll_res=0 Then
	dw_muestra.InsertRow(0)
	MessageBox("Advertencia!","No se encontr$$HEX2$$f3002000$$ENDHEX$$la muestra.",StopSign!)

//	dw_muestra.SetItem(1,"co_fabrica",a_fabrica)
//	dw_muestra.SetItem(1,"co_muestra",a_muestra)
//	of_cargar_dddw(a_fabrica)
	Return -1
End If
long   ll_cliente,ll_sucursal
String   ls_tipo_muestra




ll_cliente=dw_muestra.GetItemNumber(1,"co_cliente")
ll_sucursal=dw_muestra.GetItemNumber(1,"co_sucursal")
ls_tipo_muestra=dw_muestra.GetItemString(1,"tipo_muestra")

ll_res=lo_comun.of_nombrecliente( ll_cliente,ll_sucursal,&
       ls_tipo_muestra,n_cst_application.itr_appl)
		 
If ll_res=1 Then
	dw_muestra.SetItem(1,"de_cliente",lo_comun.of_getString(1))
End If

//////////////////////////////////////////////////////////////////////////
// Se coloca la desripcion de la ejecutiva
// 
//////////////////////////////////////////////////////////////////////////
long ll_ejecutiva

ll_ejecutiva=dw_muestra.GetItemNumber(1,"co_ejecutiva")

ll_res=lo_comun.of_nombreejecutiva(ls_tipo_muestra /*string a_tipo*/,&
                                   ll_ejecutiva/*long a_codigo*/,&
											  n_cst_application.itr_appl/*transaction a_transaction */)
											  
If ll_res=1 Then
	dw_muestra.SetItem(1,"de_ejecutiva",lo_comun.of_getString(1))
End If
	

//



//////////////////////////////////////////////////////////////////////////
// Paso las observaciones al dw que las muestra en la tercera carpeta
// 
//////////////////////////////////////////////////////////////////////////
String ls_observacion

tab_1.tabpage_2.dw_observacion.Reset()
tab_1.tabpage_2.dw_observacion.InsertRow(0)

ls_observacion=dw_muestra.GetItemString(1,"de_observacion")
ls_observacion=Trim(ls_observacion)

tab_1.tabpage_2.dw_observacion.SetItem(1,1,ls_observacion)

il_co_cliente=0
il_co_sucursal=0
il_talla=-1
il_color=-1


il_tipo_prod=dw_muestra.GetItemNumber(1,"co_tipoprod")

of_retrieve_tipo_prod()


il_grupo_talla=dw_muestra.GetItemNumber(1,"co_grupo_tlla")



lo_comun.of_loadDddw(idc_tallas_por_grupo,il_grupo_talla,n_cst_application.itr_appl)
//////////////////////////////////////////////////////////////////////////
// Carga la fabrica y la linea para la lista de colores
// 
//////////////////////////////////////////////////////////////////////////

il_fabrica=dw_muestra.GetItemNumber(1,"co_fabrica") 
il_linea=dw_muestra.GetItemNumber(1,"co_linea")
il_muestra=dw_muestra.GetItemNumber(1,"co_muestra")


long ll_solicitud

ll_solicitud=dw_muestra.getItemNumber(1,"nu_solicitud")

If of_datos_solicitud(il_fabrica,ll_solicitud)<>1 Then
	Return -1
End If

String ls_co_ref_exp

ls_co_ref_exp=dw_muestra.getItemString(1,"co_ref_exp")

lo_comun.of_loadDddw(idc_ref_exp,il_fabrica,ll_solicitud,il_linea,n_cst_application.itr_appl )

lo_comun.of_loadDddw(idc_colores_exp,il_fabrica,ll_solicitud,ls_co_ref_exp,n_cst_application.itr_appl )
lo_comun.of_loadDddw(idc_talla_exp,il_fabrica,ll_solicitud,il_linea,ls_co_ref_exp,n_cst_application.itr_appl )

of_cargar_dddw(il_fabrica)

//////////////////////////////////////////////////////////////////////////
// Tomo los datos de la muestra para recuperar el detalle
// 
//////////////////////////////////////////////////////////////////////////

long ll_tot,ll_talla,i,ll_color





ll_tot=tab_1.tabpage_1.dw_dt_muestras.Retrieve(il_fabrica,il_linea,il_muestra)

//////////////////////////////////////////////////////////////////////////
// Coloca nombre de recurso restrictivo
// 
//////////////////////////////////////////////////////////////////////////

of_nombreRestrictivo()

If ll_tot>0 Then
	tab_1.tabpage_1.dw_dt_muestras_col.Retrieve(il_fabrica,il_linea,il_muestra,0,0)	
	
//////////////////////////////////////////////////////////////////////////
// Coloco los nombres de los colores
// 
//////////////////////////////////////////////////////////////////////////
	tab_1.tabpage_1.dw_dt_muestras_col.SetFilter("")
	tab_1.tabpage_1.dw_dt_muestras_col.Filter()
	
	For i=1 To tab_1.tabpage_1.dw_dt_muestras_col.RowCount()
		ll_color=tab_1.tabpage_1.dw_dt_muestras_col.GetItemNumber(i,"co_color")
		ll_res=lo_comun.of_nombrecolor( il_Fabrica,il_linea,ll_color,n_cst_application.itr_appl)
		If ll_res=1 then
			tab_1.tabpage_1.dw_dt_muestras_col.SetItem(i,"de_color",lo_comun.of_getstring(1))
		End If
	Next
	

	
	of_filtro_talla(tab_1.tabpage_1.dw_dt_muestras.GetItemNumber(1,"co_talla"),&
	                tab_1.tabpage_1.dw_dt_muestras.GetItemString(1,"co_talla_exp"),&
						 1)
						 
	
End If

of_retrieve_cliente()

dw_muestra.SetFocus()

Return 1
end function

public function integer of_grabar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 26 de Septiembre de 2002 HORA 15:54:27:468
// 
// Retorna 1 si el proceso es exitoso
//////////////////////////////////////////////////////////////////////////

long i,ll_tot

of_borraBlancos(tab_1.tabpage_1.dw_dt_muestras)
//////////////////////////////////////////////////////////////////////////
// Cuando la esta insertando el codigo de muestra es 0 y asigna un
// consecutivo 
// el tipo es 25 para las muestras, se define con marta oct 4 de 2002
//////////////////////////////////////////////////////////////////////////
If il_muestra=0 Then
	
	il_muestra = n_cst_application.&
	of_consecutive(n_cst_application.ii_fabrica,25,n_cst_application.itr_appl)
   If il_muestra<=0 Then
		il_muestra=0
		MessageBox("Advertencia!","No se pudo determinar el consecutivo de la muestra.",StopSign!)
		Return -1
	//SA56753 Ceiba/reariase - 16-05-2017
	Else
		Commit Using n_cst_application.itr_appl;
	//Fin Sa56753
	End If
	dw_muestra.SetItem(1,"co_muestra",il_muestra)
	
//////////////////////////////////////////////////////////////////////////
// Si no tiene fecha de desarrollo se asigna la del sistema
// 
//////////////////////////////////////////////////////////////////////////
	date ld_fecha_desarrollo
	
	ld_fecha_desarrollo=dw_muestra.GetItemDate(1,"fe_desarrollo")
	
	If IsNull(ld_fecha_desarrollo) Then
		
		DateTime ldt_fecha
		String ls_usuario,ls_instancia,ls_ref_ant
		
		If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
														 ldt_fecha,ls_usuario,ls_instancia) Then
			Return -1
		End If		
		
		dw_muestra.setItem(1,"fe_desarrollo",Date(ldt_fecha))
		
	end If	
	
End If

ll_tot=tab_1.tabpage_1.dw_dt_muestras.RowCount()

For i=1 To ll_tot
	tab_1.tabpage_1.dw_dt_muestras.SetItem(i,"co_fabrica",il_fabrica)
	tab_1.tabpage_1.dw_dt_muestras.SetItem(i,"co_linea",il_linea)
	tab_1.tabpage_1.dw_dt_muestras.SetItem(i,"co_muestra",il_muestra)
Next

tab_1.tabpage_1.dw_dt_muestras_col.setFilter("")
tab_1.tabpage_1.dw_dt_muestras_col.filter()

of_borrablancos( tab_1.tabpage_1.dw_dt_muestras_col)

ll_tot=tab_1.tabpage_1.dw_dt_muestras_col.RowCount()


n_ds_application lds_1

lds_1=create n_ds_application

lds_1.DataObject="d_dt_est_col_mues"

lds_1.SetTransObject(n_cst_application.itr_appl)

long ll_estado,ll_color,ll_f,ll_talla

For i=1 To ll_tot
	tab_1.tabpage_1.dw_dt_muestras_col.SetItem(i,"co_fabrica",il_fabrica)
	tab_1.tabpage_1.dw_dt_muestras_col.SetItem(i,"co_linea",il_linea)
	tab_1.tabpage_1.dw_dt_muestras_col.SetItem(i,"co_muestra",il_muestra)
	
//////////////////////////////////////////////////////////////////////////
// Si son registros nuevos, hay que ingresar en el detalle de estados en 1
// 
//////////////////////////////////////////////////////////////////////////
	If tab_1.tabpage_1.dw_dt_muestras_col.GetItemStatus(i,0,primary!)=New! Or &
	   tab_1.tabpage_1.dw_dt_muestras_col.GetItemStatus(i,0,primary!)=NewModified!	Then
		
		ll_estado=tab_1.tabpage_1.dw_dt_muestras_col.GetItemNumber(i,"co_estado") 
		
		ll_color=tab_1.tabpage_1.dw_dt_muestras_col.GetItemNumber(i,"co_color") 
		
		ll_talla=tab_1.tabpage_1.dw_dt_muestras_col.GetItemNumber(i,"co_talla") 
		
		If ll_estado=1 Then
			ll_f=lds_1.InsertRow(0)
			lds_1.SetItem(ll_f,"co_fabrica",il_fabrica)
			lds_1.SetItem(ll_f,"co_linea",il_linea)
			lds_1.SetItem(ll_f,"co_muestra",il_muestra)
			lds_1.SetItem(ll_f,"co_talla",ll_talla)
			lds_1.SetItem(ll_f,"co_color",ll_color)
			lds_1.SetItem(ll_f,"co_estado",1)
			lds_1.SetItem(ll_f,"consecutivo",1)
		End If
	End If
Next

//////////////////////////////////////////////////////////////////////////
// Paso las observaciones al dw_definitivo
// 
//////////////////////////////////////////////////////////////////////////
String ls_observacion

ls_observacion=tab_1.tabpage_2.dw_observacion.GetItemString(1,1)

dw_muestra.SetItem(1,"de_observacion",ls_observacion)


If dw_muestra.Update(true,false)<>1 Then 
	RollBack Using n_cst_application.itr_appl;
	Return -1
End If


If tab_1.tabpage_1.dw_dt_muestras.Update(true,false)<>1 Then 
	RollBack Using n_cst_application.itr_appl;
	Return -1
End If


//////////////////////////////////////////////////////////////////////////
// Cuando se crea la muesta se ingresa el dise$$HEX1$$f100$$ENDHEX$$o 1
// con el mismo dise$$HEX1$$f100$$ENDHEX$$o de la muestra en m_disenos_muestras
//////////////////////////////////////////////////////////////////////////

If of_insertarDiseno()<>1 Then
	RollBack Using n_cst_application.itr_appl;
	Return -1
End If	


If tab_1.tabpage_1.dw_dt_muestras_col.Update(true,false)<>1 Then 
	RollBack Using n_cst_application.itr_appl;
	Return -1
End If

//////////////////////////////////////////////////////////////////////////
// Se actualiza la insercion del estado inicial del color, cuando son nuevos
// 
//////////////////////////////////////////////////////////////////////////
If lds_1.Update(true,false)<>1 Then 
	RollBack Using n_cst_application.itr_appl;
	Return -1
End If



dw_muestra.ResetUpdate()
tab_1.tabpage_1.dw_dt_muestras.ResetUpdate()
tab_1.tabpage_1.dw_dt_muestras_col.ResetUpdate()


Return 1























end function

public function integer of_validar ();If dw_muestra.RowCount()=0 Then
	Return -1
End If


If dw_muestra.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos de la muestra no v$$HEX1$$e100$$ENDHEX$$lidos",StopSign!)
	Return -1
End If

If tab_1.tabpage_1.dw_dt_muestras.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos de detalle no v$$HEX1$$e100$$ENDHEX$$lidos",StopSign!)
	Return -1
End If

If tab_1.tabpage_1.dw_dt_muestras_col.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos de colores no v$$HEX1$$e100$$ENDHEX$$lidos",StopSign!)
	Return -1
End If

If tab_1.tabpage_2.dw_observacion.AcceptText()<>1 Then
	MessageBox("Advertencia!","Observaciones de muestra no v$$HEX1$$e100$$ENDHEX$$lidos",StopSign!)
	Return -1
End If

If Not dw_muestra.of_completedata() Then
	Return -1
End If



//////////////////////////////////////////////////////////////////////////
// se verifica que existan los colores, que no sean nulos, y que no
// se repitan
//////////////////////////////////////////////////////////////////////////

tab_1.tabpage_1.dw_dt_muestras_col.SetFilter("")
tab_1.tabpage_1.dw_dt_muestras_col.Filter()

tab_1.tabpage_1.dw_dt_muestras_col.Sort()

long ll_tot,i,ll_col,ll_col1,ll_tal,ll_pos,ll_tal1

ll_tot=tab_1.tabpage_1.dw_dt_muestras_col.RowCount()

For i=1 To ll_tot
	ll_tal=tab_1.tabpage_1.dw_dt_muestras_col.GetItemNumber(i,"co_talla")
	ll_col=tab_1.tabpage_1.dw_dt_muestras_col.GetItemNumber(i,"co_color")
	If IsNUll(ll_col) Then
		ll_pos=tab_1.tabpage_1.dw_dt_muestras.Find("co_talla="+String(ll_tal),1,&
		tab_1.tabpage_1.dw_dt_muestras.RowCount())
		
		If ll_pos>0 then
			tab_1.tabpage_1.dw_dt_muestras.SetRow(ll_pos)
//			of_filtro_talla(tab_1.tabpage_1.dw_dt_muestras.GetItemNumber(ll_pos,"co_talla"),&
//			tab_1.tabpage_1.dw_dt_muestras.GetItemString(ll_pos,"co_talla_exp"),ll_pos)
		End If
		MessageBox("Advertencia!","Existen colores no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
		Return -1

	End If
	
	If i<ll_tot Then
		ll_col1=tab_1.tabpage_1.dw_dt_muestras_col.GetItemNumber(i+1,"co_color")
		ll_tal1=tab_1.tabpage_1.dw_dt_muestras_col.GetItemNumber(i+1,"co_talla")
		If ll_tal=ll_tal1 and ll_col=ll_col1 Then
			ll_pos=tab_1.tabpage_1.dw_dt_muestras.Find("co_talla="+String(ll_tal),1,&
			tab_1.tabpage_1.dw_dt_muestras.RowCount())
			
			If ll_pos>0 then
				tab_1.tabpage_1.dw_dt_muestras.SetRow(ll_pos)
//				of_filtro_talla(tab_1.tabpage_1.dw_dt_muestras.GetItemNumber(ll_pos,"co_talla"),&
//				tab_1.tabpage_1.dw_dt_muestras.GetItemString(ll_pos,"co_talla_exp"),ll_pos)
			End If
			MessageBox("Advertencia!","El color "+String(ll_col)+" est$$HEX2$$e1002000$$ENDHEX$$repetido.",StopSign!)
			Return -1
		End If
	End If		
Next


Return 1
















end function

public function integer of_filtro_color (long a_color, long a_fila);String ls_filtro

If il_fila_sel<=0 Then 
	Return -1
End If

tab_1.tabpage_1.dw_dt_muestras_col.SelectRow(0,False)
tab_1.tabpage_1.dw_dt_muestras_col.SelectRow(a_fila,True)

il_fila_col=a_fila

If IsNull(a_color) Then a_color=0

il_color=a_color

ls_filtro="co_talla="+String(il_talla)+" and co_color="+String(il_color)

Return 1
end function

public function integer of_datos_solicitud (long a_fabrica, long a_solicitud);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 03 de Febrero de 2003 HORA 17:35:46:281
// 
// 
//////////////////////////////////////////////////////////////////////////

If IsNull(a_fabrica) or a_solicitud=0 Then
	SetNull(il_co_cliente)
	SetNull(il_co_sucursal)
	SetNUll(is_tipo_solicitud)
	SetNull(is_desarrollador)
	SetNull(id_fecha_solicitud)
	SetNull(id_fe_entrega)
	SetNull(il_ejecutiva)
	Return 1
End If


  SELECT h_solicitudes.co_cliente,   
         h_solicitudes.co_sucursal,
			h_solicitudes.tipo_solicitud,
			h_solicitudes.co_ctecnico,
			h_solicitudes.fe_solicitud,
			h_solicitudes.fe_entrega,
			h_solicitudes.co_ejecutiva
    INTO :il_co_cliente,   
         :il_co_sucursal,
			:is_tipo_solicitud,
			:is_desarrollador,
			:id_fecha_solicitud,
			:id_fe_entrega,
			:il_ejecutiva
    FROM h_solicitudes  
   WHERE ( h_solicitudes.co_fabrica = :a_fabrica ) AND  
         ( h_solicitudes.nu_solicitud = :a_solicitud ) using n_cst_application.itr_appl  ;

If n_cst_application.itr_appl.SqlCode = -1 Then
	il_co_cliente=-1
	il_co_sucursal=-1
	is_tipo_solicitud=""
	MessageBox("Advertencia!","Hubo un error al consultar Solicitudes.~n~nNota: " + n_cst_application.itr_appl.SqlErrText )
	Return -1
ElseIf n_cst_application.itr_appl.SqlCode = 100 Then
	il_co_cliente=0
	il_co_sucursal=0
	is_tipo_solicitud=""
	MessageBox("Advertencia!","La soliciatud no existe. Por favor revisar.")
	Return -1
End If

Return 1
end function

public function integer of_filtro_talla (long a_talla, string a_talla_exp, long a_fila);String ls_filtro,ls_filtro_exp

tab_1.tabpage_1.dw_dt_muestras.SelectRow(0,False)
tab_1.tabpage_1.dw_dt_muestras.SelectRow(a_fila,True)

If IsNull(a_talla) Then a_talla=-1
If IsNull(a_talla_exp) Then a_talla_exp="-1"

ls_filtro="co_talla="+String(a_talla)
ls_filtro_exp="co_talla_exp='"+String(a_talla_exp)+"'"

il_fila_sel=a_fila

il_talla=a_talla

tab_1.tabpage_1.dw_dt_muestras_col.SetFilter(ls_filtro)
tab_1.tabpage_1.dw_dt_muestras_col.Filter()

long ll_color
If tab_1.tabpage_1.dw_dt_muestras_col.RowCount()>0 Then
	ll_color=tab_1.tabpage_1.dw_dt_muestras_col.GetItemNumber(1,"co_color")
	of_filtro_color(ll_color,1)
Else
	ll_color=-1
	of_filtro_color(ll_color,-1)
End If



idc_colores_exp.SetFilter(ls_filtro_exp)
idc_colores_exp.Filter()

long ll_pos

ll_pos=idc_tallas_por_grupo.find("#1="+String(il_talla),1,idc_tallas_por_grupo.rowCount())


Return 1































end function

public function integer of_borrablancos (datawindow a_dw);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 26 de Septiembre de 2002 HORA 11:53:43:031
// 
// Borra las filas en blanco
//////////////////////////////////////////////////////////////////////////

long i

For i=1 to a_dw.RowCount()
	If  a_dw.GetItemStatus(i,0,Primary!)=New! Then
		a_dw.DeleteRow(i)
		i --
	End If
Next

Return 1
end function

on w_sheet_muestras.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_muestra" then this.MenuID = create m_muestra
this.dw_muestra=create dw_muestra
this.gb_muestra=create gb_muestra
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_muestra
this.Control[iCurrent+2]=this.gb_muestra
this.Control[iCurrent+3]=this.tab_1
end on

on w_sheet_muestras.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_muestra)
destroy(this.gb_muestra)
destroy(this.tab_1)
end on

event open;call super::open;n_cst_comun lo_comun


dw_muestra.SetTransObject(n_cst_application.itr_appl)


tab_1.tabpage_1.dw_dt_muestras.SetTransObject(n_cst_application.itr_appl)
tab_1.tabpage_1.dw_dt_muestras_col.SetTransObject(n_cst_application.itr_appl)


//////////////////////////////////////////////////////////////////////////
// Recupera las fabricas del ususario
// 
//////////////////////////////////////////////////////////////////////////


dw_muestra.getChild("co_fabrica",idc_fabrica)

lo_comun.of_loaddddw( idc_fabrica,n_cst_application.is_user,n_cst_application.itr_appl)

dw_muestra.getChild("co_linea",idc_linea)

lo_comun.of_loadDddw(idc_linea,0,n_cst_application.itr_appl)


dw_muestra.getChild("co_grupo_vta",idc_grupos_vta)
lo_comun.of_loadDddw(idc_grupos_vta,-1,n_cst_application.itr_appl)

dw_muestra.getChild("co_sgrupo_vta",idc_sgrupo_vta)
lo_comun.of_loadDddw(idc_sgrupo_vta,-1,n_cst_application.itr_appl)

dw_muestra.getChild("co_tipo_tejido",idc_tipo_tejido)
lo_comun.of_loadDddw(idc_tipo_tejido,10,n_cst_application.itr_appl)

dw_muestra.getChild("co_ref_exp",idc_ref_exp)
lo_comun.of_loadDddw(idc_ref_exp,0,0,0,n_cst_application.itr_appl)

//////////////////////////////////////////////////////////////////////////
// tallas por grupo
// co_talla
//////////////////////////////////////////////////////////////////////////

tab_1.tabpage_1.dw_dt_muestras.getChild("co_talla",idc_tallas_por_grupo )
lo_comun.of_loadDddw(idc_tallas_por_grupo,17,n_cst_application.itr_appl)

//////////////////////////////////////////////////////////////////////////
// Capturo los estilos de colores exp
// 
//////////////////////////////////////////////////////////////////////////

tab_1.tabpage_1.dw_dt_muestras_col.GetChild("co_color_exp",idc_colores_exp )
lo_comun.of_loadDddw(idc_colores_exp,0,0,"0",n_cst_application.itr_appl)

tab_1.tabpage_1.dw_dt_muestras.GetChild("co_talla_exp",idc_talla_exp )
lo_comun.of_loadDddw(idc_talla_exp,0,0,0,"0",n_cst_application.itr_appl)

tab_1.tabpage_2.dw_observacion.InsertRow(0)

il_co_cliente=0
il_co_sucursal=0
il_talla=-1
il_color=-1

dw_muestra.SetFocus()

//////////////////////////////////////////////////////////////////////////
// Se carga la lista de fabricas permitidas para el usuario
// 
//////////////////////////////////////////////////////////////////////////

DataWindowChild ldc_fabrica

dw_muestra.getChild("co_fabrica",ldc_fabrica)
ldc_fabrica.SetTransObject(n_cst_application.itr_appl)
If ldc_fabrica.Retrieve(n_cst_application.is_user)<=0 Then
	MessageBox("Advertencia!","El usuario no tiene fabricas asignadas.",StopSign!)
	Return
End If
end event

event ue_find;n_cst_param lou_param
Int    li_cliente,li_sucursal
String ls_tpped


OpenWithParm(w_opc_muestra,is_where_busqueda)

lou_param = Message.PowerObjectParm
of_Redraw(False)
If IsValid(lou_param) Then
	of_buscar(lou_param.il_vector[1],lou_param.il_vector[2],lou_param.il_vector[3])		
	is_where_busqueda=lou_param.is_vector[1]
End If

of_Redraw(True)
//

end event

event ue_save;call super::ue_save;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 20 de Septiembre de 2002 HORA 14:57:10:546
// 
// Aca se guardan los datos..
//////////////////////////////////////////////////////////////////////////

If of_validar()<>1 Then
	Return
End If
of_Redraw(False)
If of_grabar()<>1 Then
	of_Redraw(True)
	Return
End If

Commit Using n_cst_application.itr_appl;

long ll_muestra

ll_muestra=dw_muestra.getItemNUmber(1,"co_muestra")

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","La muestra "+String(ll_muestra)+" se registr$$HEX2$$f3002000$$ENDHEX$$satisfactoriamente.")

ib_cambios=False

of_buscar(il_fabrica,il_linea,il_muestra)

of_Redraw(True)

end event

type dw_muestra from u_dw_application within w_sheet_muestras
integer x = 37
integer y = 52
integer width = 3552
integer height = 464
string dataobject = "d_m_muestras"
boolean vscrollbar = false
end type

event getfocus;call super::getfocus;gb_muestra.of_color(True)
end event

event losefocus;call super::losefocus;gb_muestra.of_color(False)
end event

event ue_insertrow;Long ll_res
If ib_cambios Then
	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
	
	If ll_res=2 Then
	 Return
	End If
End If


This.Reset()
tab_1.tabpage_1.dw_dt_muestras.Reset()
tab_1.tabpage_1.dw_dt_muestras_col.Reset()

tab_1.tabpage_2.dw_observacion.Reset()
tab_1.tabpage_2.dw_observacion.InsertRow(0)




//dw_detalle.Reset()
il_muestra=0
long ll_1

call super::ue_insertrow	
end event

event itemchanged;call super::itemchanged;if il_err_item_change>0 Then
	Return 2
End If

If dwo.name="de_muestra" then
	If of_validarcadena( data)<>1 Then
		Return 2
	End If
End If

long ll_solicitud,ll_null,ll_res,ll_cliente,ll_dato
String ls_referencia,ls_tipo_muestra

n_cst_comun lo_comun

If dwo.name="co_fabrica" Then
	If of_hayDatos(tab_1.tabpage_1.dw_dt_muestras)=1 Then
		MessageBox("Advertencia!","Existen tallas, y no se puede modificar el dato.",StopSign!)
		Return 2
	End If
	SetItem(row,"nu_solicitud",0)
	SetItem(row,"co_ref_exp","")
//////////////////////////////////////////////////////////////////////////
// Cargar los datos que dependen de la fabrica
// 
//////////////////////////////////////////////////////////////////////////
	il_fabrica=Long(Data)
	il_linea=getItemNumber(row,"co_linea")
	ll_solicitud=GetItemNumber(row,"nu_solicitud")
	ls_referencia=Trim(GetItemString(row,"co_ref_exp"))	
	
	of_cargar_dddw(il_fabrica)
	
	lo_comun.of_loadDddw(idc_ref_exp,il_fabrica,ll_solicitud,il_linea,n_cst_application.itr_appl)
	lo_comun.of_loadDddw(idc_colores_exp,il_fabrica,ll_solicitud,ls_referencia,n_cst_application.itr_appl)
	lo_comun.of_loadDddw(idc_talla_exp,il_fabrica,ll_solicitud,il_linea,ls_referencia,n_cst_application.itr_appl)

	If of_datos_solicitud(il_fabrica,ll_solicitud)<>1 Then
		Return 2
	End If

   If of_datos_dt_solicitud(il_fabrica,ll_solicitud,ls_referencia)<>1 Then
		Return 2
   End If
	
	setitem(1,"co_cliente",il_co_cliente)
	setitem(1,"co_sucursal",il_co_sucursal)
   SetItem(1,"tipo_muestra",is_tipo_solicitud)
	
	SetItem(1,"de_muestra",is_de_referencia)
   SetItem(1,"de_coleccion",is_nu_orden)
	
ElseIf dwo.name="co_linea" Then
	If of_hayDatos(tab_1.tabpage_1.dw_dt_muestras)=1 Then
		MessageBox("Advertencia!","Existen tallas, y no se puede modificar el dato.",StopSign!)
		Return 2
	End If	
	il_fabrica=GetItemNumber(row,"co_fabrica")
	il_linea=Long(Data)
	ll_solicitud=GetItemNumber(row,"nu_solicitud")
	ls_referencia=Trim(GetItemString(row,"co_ref_exp"))	
	
	lo_comun.of_loadDddw(idc_ref_exp,il_fabrica,ll_solicitud,il_linea,n_cst_application.itr_appl)
	
	lo_comun.of_loadDddw(idc_colores_exp,il_fabrica,ll_solicitud,ls_referencia,n_cst_application.itr_appl)
End If

If dwo.name="co_tipoprod" Then
//////////////////////////////////////////////////////////////////////////
// Verificar que no existan partes base
// 
//////////////////////////////////////////////////////////////////////////
	il_tipo_prod=Long(Data)
	SetItem(1,"co_tipo_tejido",0)
	of_retrieve_tipo_prod()	
	
ElseIf dwo.name="nu_solicitud" Then

	il_fabrica=getItemNumber(Row,"co_fabrica")
	il_linea=getItemNumber(Row,"co_linea")
	ll_solicitud=Long(Data)

	If of_datos_solicitud(il_fabrica,ll_solicitud)<>1 Then
		Return 2
	End If
	setitem(1,"co_cliente",il_co_cliente)
	setitem(1,"co_sucursal",il_co_sucursal)
	SetItem(1,"tipo_muestra",is_tipo_solicitud)
	SetItem(1,"fe_desarrollo",id_fecha_solicitud)
	SetItem(1,"fe_entrega",id_fe_entrega)
	SetItem(1,"co_ejecutiva",il_ejecutiva)
	
	ls_tipo_muestra=GetItemString(1,"tipo_muestra")
	
	ll_res=lo_comun.of_nombreejecutiva(ls_tipo_muestra /*string a_tipo*/,&
	                                   ll_dato/*long a_codigo*/,&
												  n_cst_application.itr_appl/*transaction a_transaction */)
   If ll_res=1 Then
		SetItem(1,"de_ejecutiva",lo_comun.of_getString(1))				
   End If
	
	ls_referencia=Trim(GetItemString(row,"co_ref_exp"))
	
	lo_comun.of_loadDddw(idc_ref_exp,il_fabrica,ll_solicitud,il_linea,n_cst_application.itr_appl)
	lo_comun.of_loadDddw(idc_colores_exp,il_fabrica,ll_solicitud,ls_referencia,n_cst_application.itr_appl)
	lo_comun.of_loadDddw(idc_talla_exp,il_fabrica,ll_solicitud,il_linea,ls_referencia,n_cst_application.itr_appl)
	
	of_retrieve_cliente()

   If of_datos_dt_solicitud(il_fabrica,ll_solicitud,ls_referencia)<>1 Then
		Return 2
	End If
	
	SetItem(1,"de_muestra",is_de_referencia)
   SetItem(1,"de_coleccion",is_nu_orden)
	SetItem(1,"desarrollador",is_desarrollador)
	
	
ElseIf dwo.name="co_ref_exp" Then
	If of_hayDatos(tab_1.tabpage_1.dw_dt_muestras)=1 Then
		MessageBox("Advertencia!","Existen tallas, y no se puede modificar el dato.",StopSign!)
		Return 2
	End If
	
	il_fabrica=getItemNumber(Row,"co_fabrica")
	ll_solicitud=GetItemNumber(row,"nu_solicitud")
	ls_referencia=Trim(Data)
	lo_comun.of_loadDddw(idc_colores_exp,il_fabrica,ll_solicitud,ls_referencia,n_cst_application.itr_appl)
	lo_comun.of_loadDddw(idc_talla_exp,il_fabrica,ll_solicitud,il_linea,ls_referencia,n_cst_application.itr_appl)

   If of_datos_dt_solicitud(il_fabrica,ll_solicitud,ls_referencia)<>1 Then
		Return 2
	End If
	SetItem(1,"de_muestra",is_de_referencia)
   SetItem(1,"de_coleccion",is_nu_orden)
	
	
ElseIf dwo.name="co_grupo_tlla" Then
	If of_hayDatos(tab_1.tabpage_1.dw_dt_muestras)=1 Then
		MessageBox("Advertencia!","Existen tallas, y no se puede modificar el dato.",StopSign!)
		Return 2
	End If
	il_grupo_talla=Long(Data)
	lo_comun.of_loadDddw(idc_tallas_por_grupo,il_grupo_talla,n_cst_application.itr_appl )
ElseIf dwo.name="tipo_muestra" Then
	ll_solicitud=getItemNumber(Row,"nu_solicitud")
	If ll_solicitud<>0 Then
		MessageBox("Advertencia!","No puede cambiar el tipo de muestra.",StopSign!)
		Return 2
	End If
ElseIf dwo.name="co_cliente" Then
	ll_solicitud=GetItemNumber(Row,"nu_solicitud")
	If ll_solicitud<>0 Then
		MessageBox("Advertencia!","Este dato es de la solicitud, y no se puede cambiar.",StopSign!)
		Return 2
	End If
	SetNull(ll_null)
	SetItem(1,"co_sucursal",ll_null)
ElseIf dwo.name="co_sucursal" Then
	ll_solicitud=GetItemNumber(Row,"nu_solicitud")
	ll_cliente=GetItemNumber(Row,"co_cliente")
	ll_dato=Long(data)
	If ll_solicitud<>0 Then
		MessageBox("Advertencia!","Este dato es de la solicitud, y no se puede cambiar.",StopSign!)
		Return 2
	End If
	ls_tipo_muestra=GetItemString(Row,"tipo_muestra")	
	ll_res=lo_comun.of_nombrecliente(ll_cliente,ll_dato,&
	       ls_tipo_muestra,n_cst_application.itr_appl)
			 
	If ll_res<>1 Then
		MessageBox("Advertencia!","Sucursal no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
   SetItem(Row,"de_cliente",lo_comun.of_getString(1))
	
End If

If dwo.name="fe_entrega" Then
	ll_solicitud=GetItemNumber(Row,"nu_solicitud")
	If ll_solicitud<>0 Then
		MessageBox("Advertencia!","Este dato es de la solicitud, y no se puede cambiar.",StopSign!)
		Return 2
	End If	
End If

If dwo.name="id_tipo_med" Then
	ll_dato=long(data)
	ll_res=lo_comun.of_nombretipomedida(ll_dato /*long a_tipo_medida*/,&
	                                    n_cst_application.itr_appl/*transaction a_transaction */)
													
   If ll_res<>1 Then
		MessageBox("Advertencia!","Tipo de medida no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_tipo_med",lo_comun.of_getString(1))
End If

If dwo.name="co_ejecutiva" Then
	ls_tipo_muestra=GetItemString(1,"tipo_muestra")
	ll_dato=Long(Data)
	
	ll_res=lo_comun.of_nombreejecutiva(ls_tipo_muestra /*string a_tipo*/,&
	                                   ll_dato/*long a_codigo*/,&
												  n_cst_application.itr_appl/*transaction a_transaction */)
   If ll_res<>1 Then
		MessageBox("Advertencia!","Ejecutiva no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_ejecutiva",lo_comun.of_getString(1))												  
End If
												  


ib_cambios=True
end event

event ue_deleterow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 25 de Agosto de 2003 HORA 13:50:30:075
// 
// overwrite!!
//////////////////////////////////////////////////////////////////////////

end event

type gb_muestra from u_gb_base within w_sheet_muestras
integer x = 5
integer y = 8
integer width = 3602
integer height = 516
integer taborder = 0
string text = "Muestra"
end type

type tab_1 from tab within w_sheet_muestras
integer x = 14
integer y = 552
integer width = 3625
integer height = 724
integer taborder = 20
integer textsize = -8
integer weight = 700
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

event selectionchanged;//If newindex=1 Then
//	tab_1.tabpage_1.dw_dt_muestras.Setfocus()
//End If
end event

event getfocus;If SelectedTab=1 Then
	tab_1.tabpage_1.dw_dt_muestras.SetFocus()
End If
end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3589
integer height = 604
long backcolor = 80269524
string text = "Tallas y colores"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_dt_muestras_col dw_dt_muestras_col
dw_dt_muestras dw_dt_muestras
gb_detalle gb_detalle
gb_colores gb_colores
end type

on tabpage_1.create
this.dw_dt_muestras_col=create dw_dt_muestras_col
this.dw_dt_muestras=create dw_dt_muestras
this.gb_detalle=create gb_detalle
this.gb_colores=create gb_colores
this.Control[]={this.dw_dt_muestras_col,&
this.dw_dt_muestras,&
this.gb_detalle,&
this.gb_colores}
end on

on tabpage_1.destroy
destroy(this.dw_dt_muestras_col)
destroy(this.dw_dt_muestras)
destroy(this.gb_detalle)
destroy(this.gb_colores)
end on

type dw_dt_muestras_col from u_dw_application within tabpage_1
integer x = 1806
integer y = 56
integer width = 1669
integer height = 472
integer taborder = 20
string dataobject = "d_dt_muestras_col"
boolean hscrollbar = true
end type

event getfocus;call super::getfocus;gb_colores.of_color(True)
end event

event losefocus;call super::losefocus;gb_colores.of_color(False)
end event

event ue_insertrow;If il_talla<0 Then
	MessageBox("Advertencia!","Debe especificar la talla.",StopSign!)
	Return
End If

super::event ue_insertRow()

long ll_fila

ll_fila=getRow()

SetItem(ll_fila,"co_talla",il_talla)

SetColumn("co_color_exp")
end event

event itemfocuschanged;call super::itemfocuschanged;If row=0 Then Return
long ll_color,ll_res

If row<>il_fila_col Then
	//cambio la fila
	ll_color=GetItemNumber(row,"co_color")
	of_filtro_color(ll_color,row)
End If
SelectText(1,20)
end event

event itemchanged;call super::itemchanged;If il_err_item_change<>0 Then
	Return 2
End If
long ll_color,ll_pos,ll_res
n_cst_comun lo_comun
If dwo.name="co_color" Then
	ll_pos=find("co_color="+data,1,RowCount())
	If ll_pos>0 then
		MessageBox("Advertencia!","El color ya existe.",StopSign!)
		Return 2
	End If

	ll_color=Long(Data)
	ll_res=lo_comun.of_nombrecolor( il_fabrica,il_linea ,ll_color,n_cst_application.itr_appl)
	If ll_res<>1 Then
		MessageBox("Advertencia!","Color no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_color",lo_comun.of_getString(1))
	of_filtro_color(ll_color,row)
End If



end event

event ue_deleterow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 04 de Octubre de 2002 HORA 11:36:36:062
// 
// 
//////////////////////////////////////////////////////////////////////////
super::event ue_DeleteRow()
end event

event doubleclicked;call super::doubleclicked;If dwo.name="co_color_exp_t" Then
	If RowCount()=0 Then
	   of_coloresTodos()
	End If
End If

n_cst_param lo_param
long ll_null
SetNull(ll_null)

If Row>0 Then
	If dwo.name="filaa" Then
		This.RowsCopy(Row,Row,Primary!,This,row+1,Primary!)
		SetItem(row+1,"co_color",ll_null)
		Return
	End If
	
	If dwo.name="co_color" then
		lo_param.il_vector[1]=dw_muestra.GetItemNumber(1,"co_fabrica")
		lo_param.il_vector[2]=dw_muestra.GetItemNumber(1,"co_linea")
		
		OpenWithParm(w_bus_m_colores,lo_param)
		
		lo_param=Message.PowerObjectParm
		
		If IsValid(lo_param) Then
			SetText(String(lo_param.il_vector[1]))
		End If		

		
	End If
End If


end event

event sqlpreview;call super::sqlpreview;//MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!",sqlsyntax)

end event

type dw_dt_muestras from u_dw_application within tabpage_1
integer x = 32
integer y = 56
integer width = 1605
integer height = 476
string dataobject = "d_dt_muestras"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event getfocus;call super::getfocus;gb_detalle.of_color(True)
end event

event itemchanged;call super::itemchanged;If il_err_item_change<>0 Then
	Return 2
End If
long ll_pos
If dwo.name="co_talla" Then
//////////////////////////////////////////////////////////////////////////
// Verifico que la talla no exista
// 
//////////////////////////////////////////////////////////////////////////
	ll_pos=Find("co_talla="+Data,1,RowCount())
	
	If ll_pos>0 Then
		MessageBox("Advertencia!","La talla ya existe.",StopSign!)
		Return 2
	End If

	
	If of_hayDatos(tab_1.tabpage_1.dw_dt_muestras_col)=1 Then
		MessageBox("Advertencia!","No se puede cambiar porque existen colores.",StopSign!)
		Return 2
	End If
	
   of_filtro_talla(Long(Data),GetItemString(row,"co_talla_exp"),row)
ElseIf dwo.name="co_talla_exp" Then
	If of_hayDatos(tab_1.tabpage_1.dw_dt_muestras_col)=1 Then
		MessageBox("Advertencia!","No se puede cambiar porque existen colores.",StopSign!)
		Return 2
	End If
   of_filtro_talla(GetItemNumber(row,"co_talla"),data,row)
End If
long ll_res

n_cst_comun lo_comun

If dwo.name="id_rec_rest" Then
	ll_res=lo_comun.of_nombrerecursorestrictivo( long(data),n_cst_application.itr_appl)	
	
	If ll_res<>1 Then
		MessageBox("Advertencia!","Recurso restrictivo no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_rec_rest",lo_comun.of_getString(1))
end If

end event

event itemfocuschanged;call super::itemfocuschanged;If Row=0 Then Return

If row<>il_fila_sel Then
//////////////////////////////////////////////////////////////////////////
// Aca se debe verificar la informaci$$HEX1$$f300$$ENDHEX$$n para evitar inconsistencias
// 
//////////////////////////////////////////////////////////////////////////
	of_filtro_talla(GetItemNumber(row,"co_talla"),&
	GetItemString(row,"co_talla_exp"),row)
End If



end event

event losefocus;call super::losefocus;gb_detalle.of_color(False)
end event

event ue_insertrow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 27 de Septiembre de 2002 HORA 13:33:13:484
// 
// Verifico que exista la referencia
//////////////////////////////////////////////////////////////////////////
If dw_muestra.RowCount()=0 Then
	MessageBox("Advertencia!","Debe especificar la muestra.",StopSign!)
	Return
End If

String ls_co_ref_exp

ls_co_ref_exp=dw_muestra.getItemString(1,"co_ref_exp")

If IsNull(ls_co_ref_exp) Then ls_co_ref_exp=""

If len(ls_co_ref_exp)=0 Then
	MessageBox("Advertencia!","Debe seleccionar la referencia antes.",StopSign!)
	Return
End If

super::event ue_insertRow()



SetColumn("co_talla_exp")
end event

event ue_deleterow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 24 de Septiembre de 2002 HORA 08:49:00:953
// 
// Verifico los colores
//////////////////////////////////////////////////////////////////////////


If of_hayDatos(dw_dt_muestras_col)=1 Then
	MessageBox("Advertencia!","La muestra tiene colores registradas, debe eliminarlas antes.",StopSign!)
	Return
End If

Super::Event ue_deleteRow()


end event

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 23 de Agosto de 2003 HORA 14:42:40:271
// 
// Se muestra la lista de rec restri
//////////////////////////////////////////////////////////////////////////

n_cst_param lo_param

If dwo.name="id_rec_rest" Then
	Open(w_bus_m_rec_restri)

	lo_param=Message.PowerObjectParm

	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If
End If
end event

type gb_detalle from u_gb_base within tabpage_1
integer x = 5
integer width = 1659
integer height = 544
integer taborder = 0
string text = "Tallas"
end type

type gb_colores from u_gb_base within tabpage_1
integer x = 1719
integer width = 1819
integer height = 544
integer taborder = 0
string text = "Colores por talla"
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 3589
integer height = 604
long backcolor = 80269524
string text = "Observaciones"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_observacion dw_observacion
gb_1 gb_1
end type

on tabpage_2.create
this.dw_observacion=create dw_observacion
this.gb_1=create gb_1
this.Control[]={this.dw_observacion,&
this.gb_1}
end on

on tabpage_2.destroy
destroy(this.dw_observacion)
destroy(this.gb_1)
end on

type dw_observacion from u_dw_application within tabpage_2
integer x = 64
integer y = 132
integer width = 3383
integer height = 124
integer taborder = 20
string dataobject = "d_ext_observacion250"
boolean vscrollbar = false
end type

event itemchanged;call super::itemchanged;If of_validarcadena( Data)<>1 Then
	Return 2
End If
end event

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 15 de Enero de 2003 HORA 11:51:58:156
// 
// overwrite!
//////////////////////////////////////////////////////////////////////////

end event

type gb_1 from groupbox within tabpage_2
integer x = 32
integer y = 56
integer width = 3493
integer height = 220
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Observaciones de la muestra"
end type

