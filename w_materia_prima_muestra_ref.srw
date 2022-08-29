HA$PBExportHeader$w_materia_prima_muestra_ref.srw
$PBExportComments$Para el manejo de lo referente a mano de obra, con todos los colores
forward
global type w_materia_prima_muestra_ref from w_sheet
end type
type st_7 from statictext within w_materia_prima_muestra_ref
end type
type dw_partesinicial from datawindow within w_materia_prima_muestra_ref
end type
type dw_mpinicial from datawindow within w_materia_prima_muestra_ref
end type
type cb_3 from commandbutton within w_materia_prima_muestra_ref
end type
type em_1 from editmask within w_materia_prima_muestra_ref
end type
type cb_2 from commandbutton within w_materia_prima_muestra_ref
end type
type cb_foto from commandbutton within w_materia_prima_muestra_ref
end type
type dw_colores1_mp from u_dw_application within w_materia_prima_muestra_ref
end type
type em_basepeso from editmask within w_materia_prima_muestra_ref
end type
type st_5 from statictext within w_materia_prima_muestra_ref
end type
type dw_verifica_color from u_dw_application within w_materia_prima_muestra_ref
end type
type dw_colores1 from u_dw_application within w_materia_prima_muestra_ref
end type
type dw_head_ref from u_dw_application within w_materia_prima_muestra_ref
end type
type rb_un_col from radiobutton within w_materia_prima_muestra_ref
end type
type rb_todos_col from radiobutton within w_materia_prima_muestra_ref
end type
type dw_partes from u_dw_application within w_materia_prima_muestra_ref
end type
type dw_colores from u_dw_application within w_materia_prima_muestra_ref
end type
type tab_1 from tab within w_materia_prima_muestra_ref
end type
type tabpage_1 from userobject within tab_1
end type
type st_2 from statictext within tabpage_1
end type
type dw_mp from u_dw_application within tabpage_1
end type
type gb_mp from u_gb_base within tabpage_1
end type
type tabpage_1 from userobject within tab_1
st_2 st_2
dw_mp dw_mp
gb_mp gb_mp
end type
type tabpage_2 from userobject within tab_1
end type
type st_1 from statictext within tabpage_2
end type
type dw_observacion from u_dw_application within tabpage_2
end type
type gb_observacion from u_gb_base within tabpage_2
end type
type tabpage_2 from userobject within tab_1
st_1 st_1
dw_observacion dw_observacion
gb_observacion gb_observacion
end type
type tabpage_3 from userobject within tab_1
end type
type st_4 from statictext within tabpage_3
end type
type dw_mat_prima2 from datawindow within tabpage_3
end type
type sle_opcion from singlelineedit within tabpage_3
end type
type cb_1 from commandbutton within tabpage_3
end type
type dw_resumen_mp from datawindow within tabpage_3
end type
type sle_color from singlelineedit within tabpage_3
end type
type st_3 from statictext within tabpage_3
end type
type gb_1 from groupbox within tabpage_3
end type
type tabpage_3 from userobject within tab_1
st_4 st_4
dw_mat_prima2 dw_mat_prima2
sle_opcion sle_opcion
cb_1 cb_1
dw_resumen_mp dw_resumen_mp
sle_color sle_color
st_3 st_3
gb_1 gb_1
end type
type tabpage_4 from userobject within tab_1
end type
type dw_composicion from u_dw_application within tabpage_4
end type
type tabpage_4 from userobject within tab_1
dw_composicion dw_composicion
end type
type tabpage_5 from userobject within tab_1
end type
type st_6 from statictext within tabpage_5
end type
type dw_dt_muestras_fert from u_dw_application within tabpage_5
end type
type gb_fert from u_gb_base within tabpage_5
end type
type tabpage_5 from userobject within tab_1
st_6 st_6
dw_dt_muestras_fert dw_dt_muestras_fert
gb_fert gb_fert
end type
type tab_1 from tab within w_materia_prima_muestra_ref
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type
type dw_head from u_dw_application within w_materia_prima_muestra_ref
end type
type gb_head from u_gb_base within w_materia_prima_muestra_ref
end type
type gb_color from u_gb_base within w_materia_prima_muestra_ref
end type
type gb_partes from u_gb_base within w_materia_prima_muestra_ref
end type
type gb_2 from u_gb_base within w_materia_prima_muestra_ref
end type
end forward

global type w_materia_prima_muestra_ref from w_sheet
integer width = 5225
integer height = 5748
string title = "Ficha de materia prima de muestras"
string menuname = "m_mat_prima_muestra"
boolean maxbox = true
windowstate windowstate = maximized!
event ue_copiar_mp ( )
event ue_borrar_mat_prima ( )
event ue_ficha_tecnica ( )
event ue_copia_parte ( )
event ue_cambio_parte ( )
event ue_copia_todos ( )
event ue_composicion_destruccion ( )
event ue_copia_basico ( )
event ue_borra_mp_color ( )
event ue_copiar_mp_col ( )
event ue_actualiza_composicion_mue ( )
st_7 st_7
dw_partesinicial dw_partesinicial
dw_mpinicial dw_mpinicial
cb_3 cb_3
em_1 em_1
cb_2 cb_2
cb_foto cb_foto
dw_colores1_mp dw_colores1_mp
em_basepeso em_basepeso
st_5 st_5
dw_verifica_color dw_verifica_color
dw_colores1 dw_colores1
dw_head_ref dw_head_ref
rb_un_col rb_un_col
rb_todos_col rb_todos_col
dw_partes dw_partes
dw_colores dw_colores
tab_1 tab_1
dw_head dw_head
gb_head gb_head
gb_color gb_color
gb_partes gb_partes
gb_2 gb_2
end type
global w_materia_prima_muestra_ref w_materia_prima_muestra_ref

type variables
String is_where,is_nom_centro,is_where_copia, is_peso

Long il_fabrica,il_linea,il_cntopcion, il_muestra,il_talla,il_color,il_opcion,il_referencia,il_diseno,il_co_muestrario,il_calidad, &
		il_tipoprod, il_centro, il_fabrica_ref, il_linea_ref, il_recurso, il_fila_parte,il_nu_partemp,il_co_parte,il_co_combinacion,&
		il_fila_color, il_basepeso, il_PARTEMP_GEN, il_COMBINA_GEN  

boolean ib_cambios, ib_cambio_observaciones, ib_find
decimal ide_FACTOR_MUESTRA_A_PDN
DataWindowChild idc_talla, idwc_talla_fert, idwc_color_fert

n_ds_application ids_observacion, ids_muestra_referencia , ids_temporadas

n_cst_seg_muestras	invo_seg_muestras //SA54453 - Ceiba/jjmonsal - 31-03-2016: se crea la variable de seguridad y se organiza declaracion de variables
//Ds para la fusion con los datos de SIS
uo_dsbase	ids_Datos_SAP

end variables

forward prototypes
public function integer of_verificamuestracolor (long a_color)
public function integer of_verificamuestratalla ()
public function integer of_resetvar ()
public function integer of_existe (long a_mensaje)
public function long of_opcionColor (long a_color)
public function integer of_nombrepartecombinacion ()
public function integer of_headmod (string a_columna)
public function long of_verificar_partemp (long a_partemp)
public function long of_verifica_col (long a_color, long a_opcion)
public function long of_cantidadcolores ()
public function integer of_insertarparte ()
public function integer of_borra_parte1 (long a_nupartemp)
public function integer of_doubleclick ()
public function long of_copiampcol1 (long a_color, long a_opcion)
public function integer of_verificarproductomp (string a_columna, long a_fila, string a_dato)
public function integer of_buscarproducto ()
public function integer of_filtro (long al_parte, long al_fila_parte, long al_col, long al_fila_col, long al_opcion)
public function integer of_filtrar ()
public function integer of_copiamp2 ()
public function integer of_copiamp1 ()
public function integer of_pesos_x_color ()
public function integer of_controlmo ()
public function integer of_resetdw ()
public function integer of_nombremateriaprima ()
public function integer of_recuperar ()
public function integer of_verificar_parte_combinacion (long a_fabrica, long a_linea, long a_muestra, long a_talla)
public function integer of_borra_col1 (long a_color, long a_opcion)
public function integer of_grabar ()
public function integer of_validar ()
public function integer of_consultar_referencia (long an_fabrica, long an_linea, long an_muestra, long an_talla)
public function integer of_cambio_muestrario (long an_fabrica, long an_linea, long an_muestra, long an_talla, long an_diseno, long an_muestrario)
public function integer of_consultar_muestra_col ()
public function integer of_valiar_muestrario_color (long an_muestrario, long an_color)
public function integer of_crear_color_en_referencia (long an_muestrario, long an_color, long an_diseno, long an_recurso, string as_id_peso)
public function integer of_validar_muestrario_x_col (long an_muestrario, long an_color)
public function integer of_validar_matprima (transaction a_transaction, long an_producto, long an_color, long an_fabrica)
public function integer of_verificar_temporada (string as_temporada, string as_coleccion, string as_tema)
public function string of_nombretemporada (string as_temp, string as_colec, string as_tema)
public function long of_recuperar_diseno (ref long al_diseno)
public function long of_recurso_utilizado (ref long al_recurso, long al_diseno)
public function integer wf_actualizar_recurso_cierra (long al_muestra, long al_linea, long al_fabrica)
public function integer wf_actualizar_recurso_nocierra (long al_muestra, long al_linea, long al_fabrica)
public function boolean of_mail_cambio ()
public function integer wf_actrecursocotmodificado ()
public subroutine wf_configpermiopcionesmenu ()
public subroutine wf_recinfpermisosxopcion ()
public subroutine wf_configopcionesmenu ()
public function uo_dsbase wf_copiardwcolores ()
public function uo_dsbase wf_copiardw_mp ()
public function uo_dsbase wf_copiardwpartes ()
public subroutine wf_cargavalorcampoenpdn ()
public subroutine wf_pintarcheckcampoenpdn (readonly long al_fila)
public subroutine wf_poblards_iniciales ()
public subroutine wf_copiarsetdatossap (uo_dsbase ads_datos)
public function long of_recurso_agrupa (long al_recurso)
public function long of_consultar_recursoagrupa (long al_recurso)
end prototypes

event ue_copiar_mp();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 12 de Abril de 2003 HORA 11:09:08:406
// 
// Para copiar materia prima de otra muestra
//////////////////////////////////////////////////////////////////////////
Datetime ldt_fecha
String ls_usuario,ls_instancia, ls_observacion,ls_tmp, ls_error
long ll_co_diseno,ll_pos, ll_chk, ll_tot,ll_res_obs, ll_f, ll_poscol,ll_tot_col, ll_muestrario_col,ll_fila, &
		j, ll_filas, ll_cant,ll_cant1, ll_res,i, ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_color,ll_tipoprod,&
		ll_cons, ll_diseno, ll_muestrario, ll_muestrario_vigente, ll_error

n_ds_application lds_v
n_cst_param lo_param

lds_v=create n_ds_application

If dw_head.AcceptText()<>1 Then
	MessageBox("Advertencia!","Muestra no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	Return
End If


If tab_1.tabpage_1.dw_mp.RowCount()>0 Then
	MessageBox("Advertencia!","La muestra tiene productos de materia prima, s$$HEX1$$f300$$ENDHEX$$lo es posible hacer copia a muestras sin materia prima.",StopSign!)
	Return
End If

If dw_partes.RowCount()>0 Then
	MessageBox("Advertencia!","La muestra tiene Partes de materia prima, s$$HEX1$$f300$$ENDHEX$$lo es posible hacer copia a muestras sin Partes.",StopSign!)
	Return
End If

OpenWithParm(w_opc_mat_prima_muestra_ref,is_where)

lo_param=Message.PowerObjectParm

If Not IsValid(lo_param) Then
	Return 
End If

SetPointer(HourGlass!)

ll_res_obs=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea copiar las observaciones ?",Question!,YesNo!,2)

SetPointer(HourGlass!)
 
ll_fabrica    =  lo_param.il_vector[1]
ll_linea      =  lo_param.il_vector[2]
ll_muestra    =  lo_param.il_vector[3]
ll_talla      =  lo_param.il_vector[4]

ll_diseno = lo_param.il_vector[7]
ll_muestrario = lo_param.il_vector[8] 

//////////////////////////////////////////////////////////////////////////
// se verifica si las combinaciones son compatibles entre las dos muestras
// en caso de que la origen tenga, y la destino no, se insertan
//////////////////////////////////////////////////////////////////////////

  SELECT count(*)  
    INTO :ll_cant  
    FROM m_combina_muestras  
   WHERE ( m_combina_muestras.co_fabrica = :ll_fabrica ) AND  
         ( m_combina_muestras.co_linea = :ll_linea ) AND  
         ( m_combina_muestras.co_muestra = :ll_muestra ) AND  
         ( m_combina_muestras.co_talla = :ll_talla ) 
			using n_cst_application.itr_appl;

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If

If IsNull(ll_cant) Then ll_cant=0

  SELECT count(*)  
    INTO :ll_cant1  
    FROM m_combina_muestras  
   WHERE ( m_combina_muestras.co_fabrica = :il_fabrica ) AND  
         ( m_combina_muestras.co_linea = :il_linea ) AND  
         ( m_combina_muestras.co_muestra = :il_muestra ) AND  
         ( m_combina_muestras.co_talla = :il_talla ) 
			using n_cst_application.itr_appl;

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If

If IsNull(ll_cant1) Then ll_cant1=0

If ll_cant>0 and ll_cant1>0 Then
//////////////////////////////////////////////////////////////////////////
// Si ambas muestras tienen combinaciones hay que verificar que sean
// las mismas.
//////////////////////////////////////////////////////////////////////////
	
	lds_v.DataObject="d_verif_combina"
	
	lds_v.SetTransObject(n_cst_application.itr_appl)
	
	ll_tot=lds_v.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla,&
	                      il_fabrica,il_linea,il_muestra,il_talla)
								 
	If ll_tot<0 Then
		Return
	End If
								 
	If ll_tot>0 Then
		MessageBox("Advertencia!","Existe diferencia entre las combinaciones de las muestras, "+&
		" la combinaci$$HEX1$$f300$$ENDHEX$$n "+String(lds_v.GetItemNumber(1,"co_combinacion"))+" es "+&
		Trim(lds_v.GetItemString(1,"de_combinacion"))+", en la muestra origen y "+&
		Trim(lds_v.GetItemString(1,"de_combinacion_1"))+" en la destino, por favor verifique.",StopSign!)
		Return 

	End If
End If	
//////////////////////////////////////////////////////////////////////////
// Inserto las combinaciones de una en otra en caso de que no existan
// 
//////////////////////////////////////////////////////////////////////////
  INSERT INTO m_combina_muestras  
         ( co_fabrica,   
           co_linea,   
           co_muestra,   
           co_talla,   
           co_combinacion,   
           de_combinacion,   
           fe_creacion,   
           fe_actualizacion,   
           usuario,   
           instancia )  
     SELECT :il_fabrica,   
            :il_linea,   
            :il_muestra,   
            :il_talla,   
            m_combina_muestras.co_combinacion,   
            m_combina_muestras.de_combinacion,   
            CURRENT,   
            CURRENT,   
            USER,   
            DBSERVERNAME  
       FROM m_combina_muestras  
      WHERE ( m_combina_muestras.co_fabrica = :ll_fabrica ) AND  
            ( m_combina_muestras.co_linea = :ll_linea ) AND  
            ( m_combina_muestras.co_muestra = :ll_muestra ) AND  
            ( m_combina_muestras.co_talla = :ll_talla ) AND  
            ( m_combina_muestras.co_combinacion not in (  SELECT m_combina_muestras.co_combinacion  
                                                            FROM m_combina_muestras  
                                                           WHERE ( m_combina_muestras.co_fabrica = :il_fabrica ) AND  
                                                                 ( m_combina_muestras.co_linea = :il_linea ) AND  
                                                                 ( m_combina_muestras.co_muestra = :il_muestra ) AND  
                                                                 ( m_combina_muestras.co_talla = :il_talla )  ))   
using n_cst_application.itr_appl;


If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If

Commit using n_cst_application.itr_appl;

/////////////////////////////////////////////////
//IF isnull(il_referencia) or il_referencia= -1 THEN
//	Messagebox("Advertencia","Referencia no valida")
//	Return
//END IF	

IF Not isnull(il_referencia) AND il_referencia <> 0 THEN
	//SA56752 - Ceiba/reariase - 08-05-2017
	//dw_head_ref.retrieve(ll_fabrica,ll_linea,il_referencia,ll_talla,il_calidad,ll_diseno,ll_muestrario )
	dw_head_ref.retrieve(ll_fabrica,ll_linea,il_referencia,ll_talla,il_calidad,ll_diseno,ll_muestrario,ll_muestra)
	//Fin SA56752
END IF	
/////////////////////////////////////////////////

tab_1.tabpage_1.dw_mp.SetRedraw(False)
dw_partes.SetRedraw(False)

is_where_copia  =  lo_param.is_vector[1]

n_ds_application lds_1

lds_1=create n_ds_application
//////////////////////////////////////////////////////////////////////////
// Se copian las partes
// 
//////////////////////////////////////////////////////////////////////////
lds_1.DataObject=dw_partes.DataObject

lds_1.SetTransObject(n_cst_application.itr_appl)
ll_res=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_diseno, ll_muestrario)

If (ll_res < 0) Then
	tab_1.tabpage_1.dw_mp.SetRedraw(True)
	dw_partes.SetRedraw(True)
	Destroy lds_1
	Return
ELSEIf (ll_res = 0) Then
	tab_1.tabpage_1.dw_mp.SetRedraw(True)
	dw_partes.SetRedraw(True)
	Destroy lds_1
	MessageBox("Advertencia!","No se encontraron partes para la "+&
	           "materia prima de la muestra seleccionada." ,Exclamation!)
	Return
End If

//Tambien actualizar fecha,usuario,instancia
If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return 
End If

IF lds_1.rowscopy( 1,ll_res,Primary!,dw_partes,1,Primary!) < 0 THEN
	Messagebox('Advertencia','fallo al realizar el copiado de informacion sobre materia prima')
END IF 

For i=1 To ll_res
	dw_partes.SetItem(i,"co_fabrica",il_fabrica)
	dw_partes.SetItem(i,"co_linea",il_linea)
	dw_partes.SetItem(i,"co_muestra",il_muestra)
	dw_partes.SetItem(i,"co_talla",il_talla)
	
Next
//////////////////////////////////////////////////////////////////////////
// Se copian los colores
// 
//////////////////////////////////////////////////////////////////////////
lds_1.DataObject=dw_colores.DataObject
lds_1.SetTransObject(n_cst_application.itr_appl)
ll_res=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_muestrario,ll_diseno)

If (ll_res < 0) Then
	tab_1.tabpage_1.dw_mp.SetRedraw(True)
	dw_partes.SetRedraw(True)
	Destroy lds_1
	///MessageBox("Advertencia!","No se encontraron los colores.",StopSign!)
	Return
ELSEIf (ll_res = 0) Then
	tab_1.tabpage_1.dw_mp.SetRedraw(True)
	dw_partes.SetRedraw(True)
	Destroy lds_1
	MessageBox("Advertencia!","No se encontraron colores para la "+&
	           "materia prima de la muestra seleccionada." ,Exclamation!)
	Return
End If
///////////////////////////////////////
///////////////////////////////////////
dw_colores1.Reset()
For i=1 To ll_res
	ll_color=lds_1.GetItemNumber(i,"co_color")
//	ll_poscol=dw_verifica_color.find("co_color="+String(ll_color),1,ll_tot_col)
	//If ll_poscol>0 Then
		ll_f=dw_colores1.InsertRow(0)
		dw_colores1.SetItem(ll_f,"co_color",ll_color)
	//End If
Next

ll_tot_col=dw_colores1.RowCount()
//////////////////////////////////////////////////////////////////////////
// Se abre la ventana para seleccionar los colores
// 
//////////////////////////////////////////////////////////////////////////
OpenWithParm(w_sel_color_copia,dw_colores1)
//////////////////////////////////////////////////////////////////////////
// Solo se deben copiar los colores seleccionados
// 
//////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////
// puede que algunos colores existan, es necesario verificar antes de 
// hacer la copia
//////////////////////////////////////////////////////////////////////////

IF il_muestra <> ll_muestra THEN

		DECLARE pr_cunsulta_muestrario PROCEDURE FOR sp_muestrario_mues(
		:il_fabrica, :il_linea )
		Using n_cst_application.itr_appl;
		
		
		EXECUTE pr_cunsulta_muestrario;
		
		ll_error = n_cst_application.itr_appl.SQLCode
		
		IF n_cst_application.itr_appl.SQLCode < 0 THEN
			ls_error = n_cst_application.itr_appl.SQLErrText
			ROLLBACK Using n_cst_application.itr_appl;
			CLOSE pr_cunsulta_muestrario;
		
			MessageBox("Advertencia - Error de Base Datos","Error al ejecutar el procedimiento almacenado <sp_muestrario_mues> al consultar muestrario vigente"+&
					"~n~nError : "+ String(ll_error) + " - "+ trim(ls_error) + "~n~nConsulte con el administrador del sistema",StopSign!)
			Return
		End If
		
		FETCH pr_cunsulta_muestrario INTO :ll_muestrario_vigente ;
		
		ll_error = n_cst_application.itr_appl.SQLCode
		IF ll_error < 0 THEN
			ls_error = n_cst_application.itr_appl.SQLErrText
			CLOSE pr_cunsulta_muestrario;
			ROLLBACK;
			MessageBox("Advertencia - Error de Base de Datos","Error en la lectura de los datos en la ejecuci$$HEX1$$f300$$ENDHEX$$n del procedimiento <sp_muestrario_mues>"+&
				"~n~nError: "+ String(ll_error) + " - "+ trim(ls_error) +"~n~nConsulte con el Administrador del Sistema",StopSign!)			
			Return
		End If
	END IF

For i=1 To ll_res
	
	ll_color=lds_1.GetItemNumber(i,"co_color")
	ll_co_diseno=lds_1.GetItemNumber(i,"co_diseno")
	/*
	* MODIFICADO: Agosto 28 de 2009 - gagudelo- ohlondon
	* Debe verificar que exista el color pero en el Dise$$HEX1$$f100$$ENDHEX$$o de
	* la muestra destino.
	*/
	
	ll_pos=dw_colores.Find("co_color="+String(ll_color)+" and co_diseno="+&
	String(il_diseno),1,dw_colores.RowCount())

	ll_chk=dw_colores1.Find("co_color="+String(ll_color)+" and chk=1",1,ll_tot_col)
	
	If ll_pos=0 and ll_chk > 0 Then
		lds_1.SetItem(i,"co_fabrica",il_fabrica)
		lds_1.SetItem(i,"co_linea",il_linea)
		lds_1.SetItem(i,"co_muestra",il_muestra)
		lds_1.SetItem(i,"co_talla",il_talla)
		
		lds_1.SetItem(i,"co_diseno",il_diseno)
		lds_1.SetItem(i,"cnt_opcion",il_diseno)
		lds_1.SetItem(i,"co_recurso",dw_head.object.co_recurso[1])
		lds_1.SetItem(i,"de_recurso",dw_head.object.de_recurso[1])
	
		lds_1.SetItem(i,'fe_creacion',ldt_fecha)
		lds_1.SetItem(i,'fe_actualizacion',ldt_fecha)
		lds_1.SetItem(i,'usuario',ls_usuario)
		lds_1.SetItem(i,'instancia',ls_instancia)
		
		IF il_muestra <> ll_muestra THEN
			lds_1.SetItem(i,'co_muestrario',ll_muestrario_vigente)
		END IF	
		
		IF lds_1.rowscopy( i,i,Primary!,dw_colores,dw_colores.RowCount()+1,Primary!) <0 THEN 
			Messagebox('Advertencia','fallo al realizar el copiado de informacion')
		END IF 
	End If	
Next

//////////////////////////////////////////////////////////////////////////
// Se copia la materia prima
// 
//////////////////////////////////////////////////////////////////////////

//lds_1.DataObject=tab_1.tabpage_1.dw_mp.DataObject
lds_1.DataObject = 'd_copiador_mp'

lds_1.SetTransObject(n_cst_application.itr_appl)
	
ll_res=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_diseno,ll_muestrario)

If ll_res<=0 Then
	tab_1.tabpage_1.dw_mp.SetRedraw(True)
	dw_partes.SetRedraw(True)
	Destroy lds_1
	MessageBox("Advertencia!","No se ha parametrizado la materia prima para la muestra seleccionada.",StopSign!)
	Return
End If

tab_1.tabpage_1.dw_mp.SetFilter("")
tab_1.tabpage_1.dw_mp.Filter()

ll_res = dw_colores1.rowcount()

For i=1 To ll_res
	ll_chk = dw_colores1.GetitemNumber(i,"chk")
	ll_color = dw_colores1.GetItemNumber(i,"co_color")
	ll_co_diseno = ll_diseno //lds_1.GetItemNumber(i,"co_diseno")
	lds_1.SetFilter("")
	lds_1.Filter()	
	IF ll_chk = 1 THEN
		ll_fila = dw_colores.Find("co_color=" + String(ll_color),1,dw_colores.Rowcount())
		IF ll_fila > 0 THEN
			ll_muestrario_col = dw_colores.GetitemNumber (ll_fila,"co_muestrario")
		END IF
		ll_fila = tab_1.tabpage_1.dw_mp.Find("co_color=" + String(ll_color),1,tab_1.tabpage_1.dw_mp.Rowcount())
		IF ll_fila = 0 THEN
			lds_1.SetFilter("co_color= "+String(ll_color) + " and co_diseno=" + String(ll_co_diseno) )
			lds_1.Filter()
			ll_filas = lds_1.Rowcount()
			IF ll_filas > 0 THEN
				FOR j =1 TO ll_filas
						lds_1.SetItem(j,"co_fabrica",il_fabrica)
						lds_1.SetItem(j,"co_linea",il_linea)
						lds_1.SetItem(j,"co_muestra",il_muestra)
						lds_1.SetItem(j,"co_talla",il_talla)
						
						IF LEN(String(lds_1.Object.co_producto_mp[j],'')) > 8 AND Trim(String(lds_1.Object.co_matiz_mp[j],'')) = ''  THEN 
							lds_1.Object.co_matiz_mp[j] = 0
							lds_1.Object.co_caracteristi_mp[j] = 0
						END IF
						
						lds_1.SetItem(j,"co_diseno",il_diseno) 
						
						lds_1.SetItem(j,'fe_creacion',ldt_fecha)
						lds_1.SetItem(j,'fe_actualizacion',ldt_fecha)
						lds_1.SetItem(j,'usuario',ls_usuario)
						lds_1.SetItem(j,'instancia',ls_instancia)						
				NEXT
					if of_valiar_muestrario_color(ll_muestrario_col, ll_color) <> 1 Then
						Return
					End if						
					IF lds_1.rowscopy(1,ll_filas,Primary!,tab_1.tabpage_1.dw_mp,tab_1.tabpage_1.dw_mp.Rowcount() + 1,Primary!) <0 THEN 
						Messagebox('Advertencia','fallo al realizar el copiado de informacion')
					END IF 
			END IF	
		END IF	
	END IF		
Next

of_nombreParteCombinacion()

of_filtro(dw_partes.GetItemNumber(1,"nu_partemp"),&
					1,&
					dw_colores.GetItemNumber(1,"co_color"),&
					1,dw_colores.GetItemNumber(1,"co_diseno"))
						
If ll_res_obs<>1 Then
	tab_1.tabpage_1.dw_mp.SetRedraw(True)
	dw_partes.SetRedraw(True)
	Destroy lds_1
	Return
End If

lds_1.DataObject=ids_observacion.DataObject
lds_1.SetTransObject(n_cst_application.itr_appl)

ll_res=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_muestrario,ll_diseno)

If ll_res<=0 Then
	tab_1.tabpage_1.dw_mp.SetRedraw(True)
	dw_partes.SetRedraw(True)
	Destroy lds_1
	MessageBox("Advertencia!","No se encontraron observaciones, por favor verifique.",StopSign!)
	Return
End If

ids_observacion.Reset()
ls_observacion=lds_1.GetItemString(1,"obs_fmp")


tab_1.tabpage_2.dw_observacion.Reset()
For i=1 to 4
	ls_tmp=Trim(mid(ls_observacion,70 * (i -1)+1,70))
	tab_1.tabpage_2.dw_observacion.InsertRow(0)
	tab_1.tabpage_2.dw_observacion.SetItem(i,1,ls_tmp)
Next

//////////////////////////////////////////////////////////////////////////
// Se cambia la variable para que las observaciones se guarden al final
// 
//////////////////////////////////////////////////////////////////////////
ib_cambio_observaciones=True
tab_1.tabpage_1.dw_mp.SetRedraw(True)
dw_partes.SetRedraw(True)
Destroy lds_1


end event

event ue_borrar_mat_prima();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 14 de Abril de 2003 HORA 10:55:43:296
// 
// Permite borrar la materia prima que se tiene en pantalla
// borra la tabla de consolidado
// se borran las observaciones si la ref no esta en otros 
// colores
//////////////////////////////////////////////////////////////////////////

If dw_partes.RowCount()=0 Then 
	Return
End If

long ll_res

ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Esta seguro de eliminar la materia prima ?",Question!,YesNo!,2)
If ll_res=2 Then
	Return
End If

If dw_head.AcceptText()<>1 Then
	MessageBox("Advertencia!","Muestra no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	Return
End If

DO WHILE dw_partes.RowCount()>0
	dw_partes.DeleteRow(0)
LOOP

//DO WHILE dw_colores.RowCount()>0
//	dw_colores.DeleteRow(0)
//LOOP
dw_colores.Reset()

tab_1.tabpage_1.dw_mp.SetFilter("")
tab_1.tabpage_1.dw_mp.Filter()

DO WHILE tab_1.tabpage_1.dw_mp.RowCount()>0
	tab_1.tabpage_1.dw_mp.DeleteRow(0)
LOOP

//dw_head.DeleteRow(0)
//
If of_grabar()<>1 Then
	Return
End If

long ll_cant_col
//////////////////////////////////////////////////////////////////////////
// Se borran las observaciones
// 
//////////////////////////////////////////////////////////////////////////

  DELETE FROM dt_fmp_obs_muestras  
		WHERE ( dt_fmp_obs_muestras.co_fabrica = :il_fabrica ) AND  
				( dt_fmp_obs_muestras.co_linea = :il_linea ) AND  
				( dt_fmp_obs_muestras.co_muestra = :il_muestra ) AND  
				( dt_fmp_obs_muestras.co_talla = :il_talla )  
				 using n_cst_application.itr_appl ;
				 
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If
	
//End If

Commit Using n_cst_application.itr_appl ;

dw_head.Reset()

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Materia prima eliminada satisfactoriamente.")



end event

event ue_ficha_tecnica();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 01 de Abril de 2003 HORA 14:49:05:390
// 
// 
//////////////////////////////////////////////////////////////////////////

n_cst_param lo_param

lo_param.il_vector[1]= il_fabrica
lo_param.il_vector[2]= il_linea
lo_param.il_vector[3]= il_muestra
lo_param.il_vector[4]= il_talla
lo_param.il_vector[5]= il_centro
lo_param.il_vector[6]= il_diseno 
lo_param.il_vector[7]= il_co_muestrario

IF Not isnull(il_referencia) AND il_referencia <> 0 THEN
	lo_param.il_vector[8] = il_referencia
ELSE
	lo_param.il_vector[8] = 0
END IF

lo_param.il_vector[9]= il_tipoprod
lo_param.il_vector[10]= il_fabrica_ref
lo_param.il_vector[11]= il_linea_ref


// FACL - 2019/01/22 - SA59582  - Se agrega el codigo de la Tela
If dw_head.RowCount() > 0 Then
	lo_param.il_vector[12]= dw_head.GetItemNumber( 1, 'co_tela' )
Else
	lo_param.il_vector[12] = 0
End If

//long ll_tipo_prod, ll_grupo_tlla
////////////////////////////////////////////////////////////////////////////
//// Se determinan la talla y el tipo de producto
//// 
////////////////////////////////////////////////////////////////////////////
//
//  SELECT m_muestras.co_tipoprod,   
//         m_muestras.co_grupo_tlla  
//    INTO :ll_tipo_prod,   
//         :ll_grupo_tlla  
//    FROM m_muestras  
//   WHERE ( m_muestras.co_fabrica = :il_fabrica ) AND  
//         ( m_muestras.co_linea = :il_linea ) AND  
//         ( m_muestras.co_muestra = :il_muestra ) using n_cst_application.itr_appl ;
//
//If n_cst_application.itr_appl.SQLcode=-1 Then 
//	PopulateError(20,"SQL Error")
//	n_cst_application.of_sql_error(n_cst_application.itr_appl)
//	Return
//End If
//
//If n_cst_application.itr_appl.SQLcode=100 Then 
//	MessageBox("Advertencia!","No se encontr$$HEX2$$f3002000$$ENDHEX$$la muestra.",StopSign!)
//	Return
//End If
//
//lo_param.il_vector[5]=ll_grupo_tlla
//
//lo_param.il_vector[6]=ll_tipo_prod
//
//lo_param.il_vector[7]=12 //centro
//
//If il_talla=-1 Then
//	MessageBox("Advertencia!","No se pudo determinar la talla.",StopSign!)
//	Return
//End If
//

OpenSheetWithParm(w_inf_fichamp,lo_param,This.ParentWindow(),0,Original!)

end event

event ue_copia_parte;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 14 de Abril de 2003 HORA 15:20:30:984
// 
// Copia la materia prima en todos los colores
//////////////////////////////////////////////////////////////////////////
If rb_todos_col.Checked Then
	MessageBox("Advertencia!","Debe tener seleccionado un solo color.",StopSign!)
	Return
End If
of_copiamp1()

end event

event ue_copia_todos();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 11 de Junio de 2003 HORA 14:28:24:939
// 
// Copia la materia prima en todos los colores
//////////////////////////////////////////////////////////////////////////
If rb_todos_col.Checked Then
	MessageBox("Advertencia!","Debe tener seleccionado un solo color.",StopSign!)
	Return
End If
of_copiamp2()

end event

event ue_composicion_destruccion();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 11 de Agosto de 2003 HORA 13:51:01:738
// 
// Para el manejo de la composicion por destruccion en las muestras
//////////////////////////////////////////////////////////////////////////

If il_fabrica=-1 or il_linea=-1 or il_muestra=-1 or il_talla=-1 or &
	il_color=-1 or il_opcion=-1 Then
	
	Return
	
End If

n_cst_param lo_param

lo_param.il_vector[1]=il_fabrica
lo_param.il_vector[2]=il_linea
lo_param.il_vector[3]=il_muestra
lo_param.il_vector[4]=il_talla
lo_param.il_vector[5]=il_color
lo_param.il_vector[6]=il_opcion


OpenWithParm(w_copm_dest_muestras,lo_param)

end event

event ue_copia_basico();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 09 de Diciembre de 2003 HORA 11:45:50:452
// 
// Para copiar la materia prima basica de una muestra, como plantilla para
// la muestra
//////////////////////////////////////////////////////////////////////////


n_cst_param lo_param
long ll_tot,ll_res_obs

If dw_head.AcceptText()<>1 Then
	MessageBox("Advertencia!","Muestra no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	Return
End If


If tab_1.tabpage_1.dw_mp.RowCount()>0 Then
	MessageBox("Advertencia!","La muestra tiene productos de materia prima, solo es posible hacer copia a muestras sin materia prima.",StopSign!)
	Return
End If

If dw_partes.RowCount()>0 Then
	MessageBox("Advertencia!","La muestra tiene partes de materia prima, solo es posible hacer copia a muestras sin partes.",StopSign!)
	Return
End If


OpenWithParm(w_opc_mat_prima_muestra_c_basica_t,"")

lo_param=Message.PowerObjectParm

If Not IsValid(lo_param) Then
	Return 
End If


SetPointer(HourGlass!)

long ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_color

  
ll_fabrica    =  lo_param.il_vector[1]
ll_linea      =  lo_param.il_vector[2]
ll_muestra    =  lo_param.il_vector[3]
ll_talla      =  lo_param.il_vector[4]

//////////////////////////////////////////////////////////////////////////
// Se verifica que las partes y combinaciones sean las mismas para todos 
// los colores de la muestra que se busco
//////////////////////////////////////////////////////////////////////////
If of_verificar_parte_combinacion(ll_fabrica,ll_linea,ll_muestra,ll_talla)<>1 Then
	Return 
End If

//////////////////////////////////////////////////////////////////////////
// se verifica si las combinaciones son compatibles entre las dos muestras
// en caso de que la origen tenga, y la destino no, se insertan
//////////////////////////////////////////////////////////////////////////
long ll_cant,ll_cant1

  SELECT count(*)  
    INTO :ll_cant  
    FROM m_combina_muestras  
   WHERE ( m_combina_muestras.co_fabrica = :ll_fabrica ) AND  
         ( m_combina_muestras.co_linea = :ll_linea ) AND  
         ( m_combina_muestras.co_muestra = :ll_muestra ) AND  
         ( m_combina_muestras.co_talla = :ll_talla ) 
			using n_cst_application.itr_appl;

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If

If IsNull(ll_cant) Then ll_cant=0

  SELECT count(*)  
    INTO :ll_cant1  
    FROM m_combina_muestras  
   WHERE ( m_combina_muestras.co_fabrica = :il_fabrica ) AND  
         ( m_combina_muestras.co_linea = :il_linea ) AND  
         ( m_combina_muestras.co_muestra = :il_muestra ) AND  
         ( m_combina_muestras.co_talla = :il_talla ) 
			using n_cst_application.itr_appl;

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If

If IsNull(ll_cant1) Then ll_cant1=0

If ll_cant>0 and ll_cant1>0 Then
//////////////////////////////////////////////////////////////////////////
// Si ambas muestras tienen combinaciones hay que verificar que sean
// las mismas.
//////////////////////////////////////////////////////////////////////////
	n_ds_application lds_v
	
	lds_v=create n_ds_application
	
	lds_v.DataObject="d_verif_combina"
	
	lds_v.SetTransObject(n_cst_application.itr_appl)
	
	ll_tot=lds_v.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla,&
	                      il_fabrica,il_linea,il_muestra,il_talla)
								 
	If ll_tot<0 Then
		Return
	End If
								 
	If ll_tot>0 Then
		MessageBox("Advertencia!","Existe diferencia entre las combinaciones de las muestras, "+&
		" la combinaci$$HEX1$$f300$$ENDHEX$$n "+String(lds_v.GetItemNumber(1,"co_combinacion"))+" es "+&
		Trim(lds_v.GetItemString(1,"de_combinacion"))+", en la muestra origen y "+&
		Trim(lds_v.GetItemString(1,"de_combinacion_1"))+" en la destino, por favor verifique.",StopSign!)
		Return 

	End If
End If	
//////////////////////////////////////////////////////////////////////////
// Inserto las combinaciones de una en otra en caso de que no existan
// 
//////////////////////////////////////////////////////////////////////////
  INSERT INTO m_combina_muestras  
         ( co_fabrica,   
           co_linea,   
           co_muestra,   
           co_talla,   
           co_combinacion,   
           de_combinacion,   
           fe_creacion,   
           fe_actualizacion,   
           usuario,   
           instancia )  
     SELECT :il_fabrica,   
            :il_linea,   
            :il_muestra,   
            :il_talla,   
            m_combina_muestras.co_combinacion,   
            m_combina_muestras.de_combinacion,   
            CURRENT,   
            CURRENT,   
            USER,   
            DBSERVERNAME  
       FROM m_combina_muestras  
      WHERE ( m_combina_muestras.co_fabrica = :ll_fabrica ) AND  
            ( m_combina_muestras.co_linea = :ll_linea ) AND  
            ( m_combina_muestras.co_muestra = :ll_muestra ) AND  
            ( m_combina_muestras.co_talla = :ll_talla ) AND  
            ( m_combina_muestras.co_combinacion not in (  SELECT m_combina_muestras.co_combinacion  
                                                            FROM m_combina_muestras  
                                                           WHERE ( m_combina_muestras.co_fabrica = :il_fabrica ) AND  
                                                                 ( m_combina_muestras.co_linea = :il_linea ) AND  
                                                                 ( m_combina_muestras.co_muestra = :il_muestra ) AND  
                                                                 ( m_combina_muestras.co_talla = :il_talla )  ))   
using n_cst_application.itr_appl;


If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If

Commit using n_cst_application.itr_appl;

tab_1.tabpage_1.dw_mp.SetRedraw(False)
dw_partes.SetRedraw(False)

//////////////////////////////////////////////////////////////////////////
// Se crean las partes de materia prima
// 
//////////////////////////////////////////////////////////////////////////

n_ds_application lds_1

lds_1=create n_ds_application

lds_1.DataObject="d_dt_fmp_mue1_cp"    //dw_partes.DataObject

lds_1.SetTransObject(n_cst_application.itr_appl)

long ll_res,i

ll_res=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla)

If ll_res<=0 Then
	tab_1.tabpage_1.dw_mp.SetRedraw(True)
	dw_partes.SetRedraw(True)
	Destroy lds_1
	MessageBox("Advertencia!","No hay materia prima parametrizada.",StopSign!)
	Return
End If

Datetime ldt_fecha
String ls_usuario,ls_instancia
//Tambien actualizar fecha,usuario,instancia
If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return 
End If

IF lds_1.rowscopy( 1,ll_res,Primary!,dw_partes,1,Primary!) < 0 THEN 
	Messagebox('Advertencia','fallo al realizar el copiado de informacion sobre copia basica')
END IF 

For i=1 To ll_res
	dw_partes.SetItem(i,"co_fabrica",il_fabrica)
	dw_partes.SetItem(i,"co_linea",il_linea)
	dw_partes.SetItem(i,"co_muestra",il_muestra)
	dw_partes.SetItem(i,"co_talla",il_talla)
	
Next
//////////////////////////////////////////////////////////////////////////
// Se procede a copiar la mat prima
// 
//////////////////////////////////////////////////////////////////////////

lds_1.DataObject="d_dt_fmp_mue1_col_opc_t" //tab_1.tabpage_1.dw_mp.DataObject

lds_1.SetTransObject(n_cst_application.itr_appl)
								 
ll_tot=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla)

If ll_tot<=0 Then
	tab_1.tabpage_1.dw_mp.SetRedraw(True)
	dw_partes.SetRedraw(True)
	Destroy lds_1
	MessageBox("Advertencia!","No se ha parametrizado la materia prima para la muestra seleccionada.",StopSign!)
	Return
End If

long ll_dato, ll_fila,j,ll_tot1,ll_opcion
decimal lde_dato, lde_peso_mp
String ls_dato

//dw_colores
//////////////////////////////////////////////////////////////////////////
// Copio los datos para cada uno de los colores y opciones que se tienen
// 
//////////////////////////////////////////////////////////////////////////
ll_tot1=dw_colores.RowCount()

For j=1 To ll_tot1
	
	ll_color=dw_colores.GetItemnumber(j,"co_color")
	ll_opcion=dw_colores.GetItemnumber(j,"co_diseno")
	
	lds_1.SetFilter("co_color="+String(ll_color)+" and co_diseno="+String(ll_opcion))
	lds_1.Filter()
	
	ll_tot=lds_1.RowCount()
	
	For i=1 To ll_tot
		ll_fila=tab_1.tabpage_1.dw_mp.InsertRow(0)
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"co_fabrica",il_fabrica)
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"co_linea",il_linea)
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"co_muestra",il_muestra)
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"co_talla",il_talla)
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"co_color",ll_color)
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"co_diseno",ll_opcion)
		
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"co_tipoprod",il_tipoprod)
		
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"co_centro",12)
		/***********************************************************
		SA53303 - Ceiba - 22-07-2015 -- (ll_fila,"co_proveedor",999)
		Comentario: Se modifica el proveedor generico al 99 debido a la Falla 53303
		***********************************************************/
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"co_proveedor",99)
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"mp_lote",' ')
	
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"co_fabrica_mp",2)
		
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,'fe_creacion',ldt_fecha)
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,'fe_actualizacion',ldt_fecha)
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,'usuario',ls_usuario)
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,'instancia',ls_instancia)	
		
		
		ll_dato=lds_1.GetItemNUmber(i,"nu_partemp")
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,'nu_partemp',ll_dato)
		
		ll_dato=lds_1.GetItemNUmber(i,"nu_mp")
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,'nu_mp',ll_dato)	
		
		ll_dato=lds_1.GetItemNUmber(i,"co_partemp")
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,'co_partemp',ll_dato)	
		
		ll_dato=lds_1.GetItemNUmber(i,"co_fabrica_mp")
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,'co_fabrica_mp',ll_dato)	
		
		ll_dato=lds_1.GetItemNUmber(i,"co_producto_mp")
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,'co_producto_mp',ll_dato)
		
		ll_dato=lds_1.GetItemNUmber(i,"co_color_mp")
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,'co_color_mp',ll_dato)	
		
		lde_dato=lds_1.GetItemDecimal(i,"peso_mp")
		//SA56750 - Ceiba renaries - 23/06/2017
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"peso_muestra",lde_dato)
		If ide_FACTOR_MUESTRA_A_PDN <> 0 Then
			tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"peso_mp",lde_dato*ide_FACTOR_MUESTRA_A_PDN)
		End If		
		//Fin SA56750	
		ll_dato=lds_1.GetItemNUmber(i,"nu_conos")
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"nu_conos",ll_dato)	
		/*
		* MODIFICADO: Agosto 13 de 2009 - ohlondon
		* Se deben copiar los ultimos parametros adicionados: Alimentador
		* PortaHilo, Enhebrado, posicion y tension
		*/
		ls_dato=lds_1.GetItemString(i,"alimentador")
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"alimentador",ls_dato)	
		
		ls_dato=lds_1.GetItemString(i,"portahilo")
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"portahilo",ls_dato)	
		
		ls_dato=lds_1.GetItemString(i,"enhebrado")
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"enhebrado",ls_dato)	
		
		ls_dato=lds_1.GetItemString(i,"posicion")
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"posicion",ls_dato)	

		ls_dato=lds_1.GetItemString(i,"tension")
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"tension",ls_dato)	

	Next

Next

of_nombreParteCombinacion()

If dw_partes.RowCount()>0 and dw_colores.RowCount()>0 Then

	of_filtro(dw_partes.GetItemNumber(1,"nu_partemp") /*long al_parte*/,&
						1/*long al_fila*/,&
						dw_colores.GetItemNumber(1,"co_color")/*long al_co_color*/,&
						1/*fila color */,dw_colores.GetItemNumber(1,"co_diseno"))
						
End If
tab_1.tabpage_1.dw_mp.SetRedraw(True)
dw_partes.SetRedraw(True)
Destroy lds_1


end event

event ue_borra_mp_color();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 18 de Mayo de 2005 HORA 15:53:32:171
// 
// Permite borrar la materia prima de un color especifico
//////////////////////////////////////////////////////////////////////////
Long   ll_color,ll_res,ll_opcion
String ls_filtro

If il_fila_color<=0 Then
	MessageBox("Advertencia!","Debe especificar un color.",StopSign!)
	Return
End If

ll_color=dw_colores.GetItemNumber(il_fila_color,"co_color")
ll_opcion=dw_colores.GetItemNumber(il_fila_color,"co_diseno")

ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea borrar la materia prima del color "+&
String(ll_color)+", opci$$HEX1$$f300$$ENDHEX$$n "+String(ll_opcion)+" ?",Question!,YesNo!,2)

If ll_res<>1 Then
	Return
End If

tab_1.tabpage_1.dw_mp.SetRedraw(False)

ls_filtro="co_color="+String(ll_color)+" and co_diseno="+String(ll_opcion)
tab_1.tabpage_1.dw_mp.SetFilter(ls_filtro)
tab_1.tabpage_1.dw_mp.Filter()

do while (tab_1.tabpage_1.dw_mp.RowCount()>0) 
	tab_1.tabpage_1.dw_mp.DeleteRow(0)
loop	

tab_1.tabpage_1.dw_mp.SetRedraw(True)

of_filtrar()
end event

event ue_copiar_mp_col();// ===============================================================================
// MODIFICADO: Septiembre 07 de 2009 - ohlondon
// ===============================================================================

long ll_muestrario_vigente, ll_error, ll_color_destino,ll_diseno,ll_muestrario
long ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_color,ll_tipoprod,ll_cons
long ll_res, i, j, ll_filas, ll_fila
String ls_error
long ll_tot,ll_res_obs, ll_f, ll_poscol,ll_tot_col, ll_muestrario_col

n_cst_param lo_param

n_ds_application lds_temp
lds_temp = create n_ds_application

If dw_head.AcceptText()<>1 Then
	MessageBox("Advertencia!","Muestra no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	Return
End If

If tab_1.tabpage_1.dw_mp.RowCount()>0 Then
	MessageBox("Advertencia!","La muestra tiene productos de materia prima, s$$HEX1$$f300$$ENDHEX$$lo es posible hacer copia a muestras sin materia prima.",StopSign!)
	Return
End If

If dw_partes.RowCount()>0 Then
	MessageBox("Advertencia!","La muestra tiene Partes de materia prima, s$$HEX1$$f300$$ENDHEX$$lo es posible hacer copia a muestras sin Partes.",StopSign!)
	Return
End If

// Si hay detalle de colores pero no se selecciona ninguno:
If dw_colores.RowCount() > 0 and dw_colores.GetRow() = 0 Then
	MessageBox("$$HEX1$$a100$$ENDHEX$$Advertencia!","Debe seleccionar el color destino para hacerle la copia de materia prima.",Exclamation!)
	Return
ELSEIF dw_colores.RowCount() = 0 THEN
	MessageBox("$$HEX1$$a100$$ENDHEX$$Advertencia!","Debe insertar al menos un color para poder hacer uso de esta opci$$HEX1$$f300$$ENDHEX$$n.",Exclamation!)
	RETURN 
End If
ll_color_destino = dw_colores.GetItemNumber(dw_colores.GetRow(), 'co_color') 

// ===============================================================================
// Se selecciona la muestra de la cual se tomaran el detalle de los colores
// ===============================================================================
OpenWithParm(w_opc_mat_prima_muestra_ref,is_where)

lo_param=Message.PowerObjectParm

If Not IsValid(lo_param) Then
	Return 
End If

SetPointer(HourGlass!)
  
ll_fabrica    = lo_param.il_vector[1]
ll_linea      = lo_param.il_vector[2]
ll_muestra    = lo_param.il_vector[3]
ll_talla      = lo_param.il_vector[4]

ll_diseno     = lo_param.il_vector[7]
ll_muestrario = lo_param.il_vector[8] 

// ===============================================================================
// se verifica si las combinaciones son compatibles entre las dos muestras
// en caso de que la origen tenga, y la destino no, se insertan
// ===============================================================================
long ll_cant,ll_cant1

  SELECT count(*)  
    INTO :ll_cant  
    FROM m_combina_muestras  
   WHERE ( m_combina_muestras.co_fabrica = :ll_fabrica ) AND  
         ( m_combina_muestras.co_linea = :ll_linea ) AND  
         ( m_combina_muestras.co_muestra = :ll_muestra ) AND  
         ( m_combina_muestras.co_talla = :ll_talla ) 
			using n_cst_application.itr_appl;

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If

If IsNull(ll_cant) Then ll_cant=0

  SELECT count(*)  
    INTO :ll_cant1  
    FROM m_combina_muestras  
   WHERE ( m_combina_muestras.co_fabrica = :il_fabrica ) AND  
         ( m_combina_muestras.co_linea = :il_linea ) AND  
         ( m_combina_muestras.co_muestra = :il_muestra ) AND  
         ( m_combina_muestras.co_talla = :il_talla ) 
			using n_cst_application.itr_appl;

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If

If IsNull(ll_cant1) Then ll_cant1=0

If ll_cant>0 and ll_cant1>0 Then
// ===============================================================================
// Si ambas muestras tienen combinaciones hay que verificar que sean
// las mismas.
// ===============================================================================
	n_ds_application lds_v
	
	lds_v=create n_ds_application
	
	lds_v.DataObject="d_verif_combina"
	
	lds_v.SetTransObject(n_cst_application.itr_appl)
	
	ll_tot=lds_v.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla,&
	                      il_fabrica,il_linea,il_muestra,il_talla)
								 
	If ll_tot<0 Then
		Return
	End If
								 
	If ll_tot>0 Then
		MessageBox("Advertencia!","Existe diferencia entre las combinaciones de las muestras, "+&
		" la combinaci$$HEX1$$f300$$ENDHEX$$n "+String(lds_v.GetItemNumber(1,"co_combinacion"))+" es "+&
		Trim(lds_v.GetItemString(1,"de_combinacion"))+", en la muestra origen y "+&
		Trim(lds_v.GetItemString(1,"de_combinacion_1"))+" en la destino, por favor verifique.",StopSign!)
		Return 

	End If
End If	
// ===============================================================================
// Inserto las combinaciones de una en otra en caso de que no existan
// 
// ===============================================================================
INSERT INTO m_combina_muestras  
		( co_fabrica,   
		  co_linea,   
		  co_muestra,   
		  co_talla,   
		  co_combinacion,   
		  de_combinacion,   
		  fe_creacion,   
		  fe_actualizacion,   
		  usuario,   
		  instancia )  
  SELECT :il_fabrica,   
			:il_linea,   
			:il_muestra,   
			:il_talla,   
			m_combina_muestras.co_combinacion,   
			m_combina_muestras.de_combinacion,   
			CURRENT,   
			CURRENT,   
			USER,   
			DBSERVERNAME  
	 FROM m_combina_muestras  
	WHERE ( m_combina_muestras.co_fabrica = :ll_fabrica ) AND  
			( m_combina_muestras.co_linea = :ll_linea ) AND  
			( m_combina_muestras.co_muestra = :ll_muestra ) AND  
			( m_combina_muestras.co_talla = :ll_talla ) AND  
			( m_combina_muestras.co_combinacion not in (  SELECT m_combina_muestras.co_combinacion  
																			FROM m_combina_muestras  
																		  WHERE ( m_combina_muestras.co_fabrica = :il_fabrica ) AND  
																				  ( m_combina_muestras.co_linea = :il_linea ) AND  
																				  ( m_combina_muestras.co_muestra = :il_muestra ) AND  
																				  ( m_combina_muestras.co_talla = :il_talla )  ))   
using n_cst_application.itr_appl;


If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If

IF Not isnull(il_referencia) AND il_referencia <> 0 THEN
	//SA56752 - Ceiba/reariase - 08-05-2017
	//dw_head_ref.retrieve(ll_fabrica,ll_linea,il_referencia,ll_talla,il_calidad,ll_diseno,ll_muestrario )
	dw_head_ref.retrieve(ll_fabrica,ll_linea,il_referencia,ll_talla,il_calidad,ll_diseno,ll_muestrario,ll_muestra )
	//SA56752
END IF	
/////////////////////////////////////////////////

tab_1.tabpage_1.dw_mp.SetRedraw(False)
dw_partes.SetRedraw(False)
is_where_copia  =  lo_param.is_vector[1]

// ===============================================================================
// Se copian las partes
// ===============================================================================
lds_temp.DataObject = dw_partes.DataObject

lds_temp.SetTransObject(n_cst_application.itr_appl)

ll_res = lds_temp.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_diseno, ll_muestrario)

If (ll_res < 0) Then
	tab_1.tabpage_1.dw_mp.SetRedraw(True)
	dw_partes.SetRedraw(True)
	Destroy lds_temp
//	MessageBox("Advertencia!","Ocurri$$HEX2$$f3002000$$ENDHEX$$un error al recuperar las partes de la "+&
//	           "materia prima para la muestra seleccionada, por lo tanto no se "+&
//				  "realizar$$HEX2$$e1002000$$ENDHEX$$la copia." ,StopSign!)
	rollback using n_cst_application.itr_appl;
 	Return
ELSEIf (ll_res = 0) Then
	tab_1.tabpage_1.dw_mp.SetRedraw(True)
	dw_partes.SetRedraw(True)
	Destroy lds_temp
	MessageBox("Advertencia!","No se encontraron partes para la "+&
	           "materia prima de la muestra seleccionada." ,Exclamation!)
	Rollback using n_cst_application.itr_appl;
	Return
End If

Datetime ldt_fecha
String ls_usuario,ls_instancia
//Tambien actualizar fecha,usuario,instancia
If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Rollback using n_cst_application.itr_appl;
	Return 
End If

IF lds_temp.rowscopy( 1,ll_res,Primary!,dw_partes,1,Primary!) <0 THEN 
	Messagebox('Advertencia','fallo al realizar el copiado de informacion sobre Partes')
END IF 

For i=1 To ll_res
	dw_partes.SetItem(i,"co_fabrica",il_fabrica)
	dw_partes.SetItem(i,"co_linea",il_linea)
	dw_partes.SetItem(i,"co_muestra",il_muestra)
	dw_partes.SetItem(i,"co_talla",il_talla)	
Next

// ===============================================================================
// Se copian los colores
// ===============================================================================
lds_temp.DataObject = dw_colores.DataObject

lds_temp.SetTransObject(n_cst_application.itr_appl)

ll_res=lds_temp.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_muestrario,ll_diseno)

If (ll_res < 0) Then
	tab_1.tabpage_1.dw_mp.SetRedraw(True)
	dw_partes.SetRedraw(True)
	Destroy lds_temp
	Rollback using n_cst_application.itr_appl;
	Return
ELSEIf (ll_res = 0) Then
	tab_1.tabpage_1.dw_mp.SetRedraw(True)
	dw_partes.SetRedraw(True)
	Destroy lds_temp
	MessageBox("Advertencia!","No se encontraron colores para la "+&
	           "materia prima de la muestra seleccionada." ,Exclamation!)
	Rollback using n_cst_application.itr_appl;			  
	Return
End If

// Se genera la lista de colores desde los que se puede realiza la copia. 
// (colores origen)
dw_colores1_mp.Reset()
For i=1 To ll_res
	ll_color=lds_temp.GetItemNumber(i,"co_color")
	ll_f=dw_colores1_mp.InsertRow(0)
	dw_colores1_mp.SetItem(ll_f,"co_color",ll_color)
Next

ll_tot_col=dw_colores1_mp.RowCount()

// Se abre la ventana para seleccionar los colores
OpenWithParm(w_sel_color_copia_mp,dw_colores1_mp)

long ll_co_diseno,ll_pos, ll_chk 

IF il_muestra <> ll_muestra THEN
	DECLARE pr_cunsulta_muestrario PROCEDURE FOR sp_muestrario_mues(
	:il_fabrica, :il_linea )
	Using n_cst_application.itr_appl;
	
	
	EXECUTE pr_cunsulta_muestrario;
	
	ll_error = n_cst_application.itr_appl.SQLCode
	
	IF n_cst_application.itr_appl.SQLCode < 0 THEN
		ls_error = n_cst_application.itr_appl.SQLErrText
		ROLLBACK Using n_cst_application.itr_appl;
		CLOSE pr_cunsulta_muestrario;
	
		MessageBox("Advertencia - Error de Base Datos","Error al ejecutar el procedimiento almacenado <sp_muestrario_mues> al consultar muestrario vigente"+&
				"~n~nError : "+ String(ll_error) + " - "+ trim(ls_error) + "~n~nConsulte con el administrador del sistema",StopSign!)
		Return
	End If
	
	FETCH pr_cunsulta_muestrario INTO :ll_muestrario_vigente ;
	
	ll_error = n_cst_application.itr_appl.SQLCode
	IF ll_error < 0 THEN
		ls_error = n_cst_application.itr_appl.SQLErrText
		CLOSE pr_cunsulta_muestrario;
		Rollback using n_cst_application.itr_appl;
		MessageBox("Advertencia - Error de Base de Datos","Error en la lectura de los datos en la ejecuci$$HEX1$$f300$$ENDHEX$$n del procedimiento <sp_muestrario_mues>"+&
			"~n~nError: "+ String(ll_error) + " - "+ trim(ls_error) +"~n~nConsulte con el Administrador del Sistema",StopSign!)			
		Return
	End If
END IF

// Se copia la materia prima
lds_temp.DataObject = 'd_copiador_mp'
								
lds_temp.SetTransObject(n_cst_application.itr_appl)

ll_res=lds_temp.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_diseno,ll_muestrario)

If ll_res<=0 Then
	tab_1.tabpage_1.dw_mp.SetRedraw(True)
	dw_partes.SetRedraw(True)
	Destroy lds_temp
	MessageBox("Advertencia!","No se ha parametrizado la materia prima para la muestra seleccionada.",StopSign!)
	Rollback using n_cst_application.itr_appl;
	Return
End If

tab_1.tabpage_1.dw_mp.SetFilter("")
tab_1.tabpage_1.dw_mp.Filter()
/*
* Este es el codigo que se encarga de recorrer los colores que fueron seleccionados
* como origen para pasar el detalle al color destino
*/
ll_res = dw_colores1_mp.SetFilter("chk=1")
dw_colores1_mp.Filter()

ll_res = dw_colores1_mp.rowcount()

For i=1 To ll_res
	ll_color      = dw_colores1_mp.GetItemNumber(i,"co_color")
	ll_co_diseno = ll_diseno 
	
	lds_temp.SetFilter("")
	lds_temp.Filter()	
	/* 
	* Se obtiene el muestrario del color Destino, es decir el seleccionado 
	* en el detalle dw_colores
	*/
 	ll_muestrario_col = dw_colores.GetitemNumber (dw_colores.GetRow(),"co_muestrario")
	
	ll_fila = tab_1.tabpage_1.dw_mp.Find("co_color=" + String(ll_color),1,tab_1.tabpage_1.dw_mp.Rowcount())
	IF ll_fila = 0 THEN
		lds_temp.SetFilter("co_color= "+String(ll_color) + " and co_diseno=" + String(ll_co_diseno) )
		lds_temp.Filter()
		ll_filas = lds_temp.Rowcount()
		IF ll_filas > 0 THEN
			FOR j =1 TO ll_filas
				lds_temp.SetItem(j,"co_fabrica",il_fabrica)
				lds_temp.SetItem(j,"co_linea",il_linea)
				lds_temp.SetItem(j,"co_muestra",il_muestra)
				lds_temp.SetItem(j,"co_talla",il_talla)
				lds_temp.SetItem(j,"co_diseno",il_diseno) 
				lds_temp.SetItem(j,'fe_creacion',ldt_fecha)
				lds_temp.SetItem(j,'fe_actualizacion',ldt_fecha)
				lds_temp.SetItem(j,'usuario',ls_usuario)
				lds_temp.SetItem(j,'instancia',ls_instancia)						
			NEXT
			/*
			IF of_valiar_muestrario_color(ll_muestrario_col, ll_color_destino) <> 1 THEN
				Rollback using n_cst_application.itr_appl;
				Return
			END IF*/
			lds_temp.rowscopy(1,ll_filas,Primary!,tab_1.tabpage_1.dw_mp,tab_1.tabpage_1.dw_mp.Rowcount() + 1,Primary!)
		END IF	
	END IF	
Next 

// El detalle copiado, se debe cargar al color destino, por tanto se reasigna el 
// c$$HEX1$$f300$$ENDHEX$$digo del color.
ll_filas = tab_1.tabpage_1.dw_mp.Rowcount()
IF ll_filas > 0 THEN				
	FOR j =1 TO ll_filas
		tab_1.tabpage_1.dw_mp.SetItem(j,'co_color',ll_color_destino)					
	NEXT
END IF

of_nombreParteCombinacion()

of_filtro(dw_partes.GetItemNumber(1,"nu_partemp") /*long al_parte*/,&
					1/*long al_fila*/,&
					dw_colores.GetItemNumber(1,"co_color")/*long al_co_color*/,&
					1/*fila color */,dw_colores.GetItemNumber(1,"co_diseno"))						


ll_res_obs=MessageBox("$$HEX1$$a100$$ENDHEX$$Advertencia!","$$HEX1$$bf00$$ENDHEX$$Desea copiar las observaciones?",Question!,YesNo!,2)

If ll_res_obs<>1 Then
	tab_1.tabpage_1.dw_mp.SetRedraw(True)
	dw_partes.SetRedraw(True)
	Destroy lds_temp
	Rollback using n_cst_application.itr_appl;
	Return
End If

lds_temp.DataObject=ids_observacion.DataObject

lds_temp.SetTransObject(n_cst_application.itr_appl)
	
ll_res=lds_temp.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_muestrario,ll_diseno)

If ll_res<=0 Then
	tab_1.tabpage_1.dw_mp.SetRedraw(True)
	dw_partes.SetRedraw(True)
	Destroy lds_temp
	MessageBox("Advertencia!","No se encontraron observaciones, por favor verifique.",StopSign!)
	Rollback using n_cst_application.itr_appl;
	Return
End If

ids_observacion.Reset()

String ls_observacion,ls_tmp


ls_observacion=lds_temp.GetItemString(1,"obs_fmp")


tab_1.tabpage_2.dw_observacion.Reset()
For i=1 to 4
	ls_tmp=Trim(mid(ls_observacion,70 * (i -1)+1,70))
	tab_1.tabpage_2.dw_observacion.InsertRow(0)
	tab_1.tabpage_2.dw_observacion.SetItem(i,1,ls_tmp)
Next

// ===============================================================================
// Se cambia la variable para que las observaciones se guarden al final
// ===============================================================================


ib_cambio_observaciones=True


tab_1.tabpage_1.dw_mp.SetRedraw(True)
dw_partes.SetRedraw(True)
Destroy lds_temp
Commit using n_cst_application.itr_appl;


end event

event ue_actualiza_composicion_mue();
n_cst_param lo_param

lo_param.il_vector[1]=il_fabrica
lo_param.il_vector[2]=il_linea
lo_param.il_vector[3]=il_muestra
lo_param.il_vector[4]=il_talla
//lo_param.il_vector[5]=il_calidad
//lo_param.il_vector[6]=il_muestrario


OpenWithParm(w_actualiza_composicion_mue,lo_param)
end event

public function integer of_verificamuestracolor (long a_color);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 08 de Enero de 2003 HORA 12:09:09:234
// 
// 
// Verifica si si la referencia esta con el color en dt_muestras_col
//////////////////////////////////////////////////////////////////////////
long ll_dato


  SELECT dt_muestras_col.co_fabrica  
    INTO :ll_dato  
    FROM dt_muestras_col  
   WHERE ( dt_muestras_col.co_fabrica = :il_fabrica ) AND  
         ( dt_muestras_col.co_linea = :il_linea ) AND  
         ( dt_muestras_col.co_muestra = :il_muestra ) AND  
         ( dt_muestras_col.co_talla = :il_talla ) AND    
         ( dt_muestras_col.co_color = :a_color )
			
			using n_cst_application.itr_appl ;
			
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If
			
If n_cst_application.itr_appl.SQLcode=100 Then 
	Return -1
End If

Return 1
end function

public function integer of_verificamuestratalla ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 29 de Marzo de 2003 HORA 17:41:15:937
// 
// para verificar la talla de una muestra
//////////////////////////////////////////////////////////////////////////


long ll_dato


  SELECT dt_muestras_col.co_fabrica  
    INTO :ll_dato  
    FROM dt_muestras_col  
   WHERE ( dt_muestras_col.co_fabrica = :il_fabrica ) AND  
         ( dt_muestras_col.co_linea = :il_linea ) AND  
         ( dt_muestras_col.co_muestra = :il_muestra ) AND  
         ( dt_muestras_col.co_talla = :il_talla )			
			using n_cst_application.itr_appl ;
			
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If
			
If n_cst_application.itr_appl.SQLcode=100 Then 
	Return -1
End If

Return 1
end function

public function integer of_resetvar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 29 de Marzo de 2003 HORA 16:47:08:828
// 
// Se hace un reset de las variables del pk
//////////////////////////////////////////////////////////////////////////



il_fabrica=-1
il_linea=-1
il_muestra=-1
il_talla=-1
il_color=-1
il_opcion=-1

ib_cambios=False
ib_cambio_observaciones=False

is_peso=""


Return 1
end function

public function integer of_existe (long a_mensaje);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 16 de Diciembre de 2002 HORA 10:29:55:109
// 
// Verifica si existen los datos
//////////////////////////////////////////////////////////////////////////

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


If a_mensaje=1 Then
	Return 1
End If

Return 1
end function

public function long of_opcionColor (long a_color);Long ll_tot,i,ll_max=0,ll_col,ll_opcion


ll_tot=dw_colores.rowCount()

For i=1 To ll_tot
	ll_col=dw_colores.getitemnumber(i,"co_color")
	If ll_col=a_color Then
		ll_opcion=dw_colores.GetItemNumber(i,"co_diseno")
		If ll_opcion>ll_max Then
			ll_max=ll_opcion
		End If
	End If
Next
If ll_max>0 Then
	Return ll_max+1
Else
	Return 1
End If
	
end function

public function integer of_nombrepartecombinacion ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 16 de Diciembre de 2002 HORA 11:31:20:890
// 
// Para colocar el nombre de las partes o combinaciones
//////////////////////////////////////////////////////////////////////////
n_cst_comun lo_c


Long i,ll_tot,ll_parte,ll_combinacion,ll_res

ll_tot=dw_partes.RowCount()

For i=1 To ll_tot
	ll_parte=dw_partes.GetItemNumber(i,"co_partemp")
	ll_combinacion=dw_partes.GetItemNumber(i,"co_combinacion")
	If IsNull(ll_parte) Then 
		ll_parte=il_PARTEMP_GEN
		//dw_partes.SetItem(i,"co_partemp",ll_parte)
	End If
	If IsNull(ll_combinacion) Then 
		ll_combinacion=il_COMBINA_GEN
		//dw_partes.SetItem(i,"co_combinacion",ll_combinacion)
	End If
	If ll_parte<>il_PARTEMP_GEN Then
		ll_res=lo_c.of_nombrepartemp(il_tipoprod,ll_parte,n_cst_application.itr_appl)
	ElseIf ll_combinacion<>il_COMBINA_GEN Then
		ll_res=lo_c.of_nombreCombinaMuestra( il_fabrica,il_linea, il_muestra,&
	                   il_talla, ll_combinacion,n_cst_application.itr_appl)
	End If
	dw_partes.SetItem(i,"de_parte_combinacion",lo_c.of_getString(1))
Next
Return 1



end function

public function integer of_headmod (string a_columna);long ll_null
String ls_null

SetNUll(ll_null)

SetNull(ls_null)

of_resetDw()

CHOOSE CASE a_columna
	CASE "co_fabrica"
		dw_head.SetItem(1,"co_linea",ll_null)
		il_linea=-1
		dw_head.SetItem(1,"co_muestra",ll_null)
		il_muestra=-1
		dw_head.SetItem(1,"de_muestra",ls_null)
		dw_head.SetItem(1,"co_talla",ll_null)
		il_talla=-1
		dw_head.SetItem(1,"de_talla",ls_null)
		//////////////////		
		dw_head.SetItem(1,"co_diseno",ll_null)
		dw_head.SetItem(1,"de_diseno",ls_null)
		il_diseno=-1
		dw_head.SetItem(1,"co_muestrario",ll_null)
		dw_head.SetItem(1,"de_muestrario",ls_null)		
		il_co_muestrario=-1
		il_referencia=-1
		//////////////////
	CASE "co_linea"
		//dw_head.SetItem(1,"co_linea",ll_null)
		//il_linea=-1
		dw_head.SetItem(1,"co_muestra",ll_null)
		il_muestra=-1
		dw_head.SetItem(1,"de_muestra",ls_null)
		dw_head.SetItem(1,"co_talla",ll_null)
		il_talla=-1
		dw_head.SetItem(1,"de_talla",ls_null)
		//////////////////		
		dw_head.SetItem(1,"co_diseno",ll_null)
		dw_head.SetItem(1,"de_diseno",ls_null)
		il_diseno=-1
		dw_head.SetItem(1,"co_muestrario",ll_null)
		dw_head.SetItem(1,"de_muestrario",ls_null)		
		il_co_muestrario=-1
		il_referencia=-1
		//////////////////		
	CASE "co_muestra"
		//dw_head.SetItem(1,"co_linea",ll_null)
		//il_linea=-1
		//dw_head.SetItem(1,"co_muestra",ll_null)
		//il_muestra=-1
		//dw_head.SetItem(1,"de_muestra",ls_null)
		dw_head.SetItem(1,"co_talla",ll_null)
		il_talla=-1
		dw_head.SetItem(1,"de_talla",ls_null)
		//////////////////		
		dw_head.SetItem(1,"co_diseno",ll_null)
		dw_head.SetItem(1,"de_diseno",ls_null)
		il_diseno=-1
		dw_head.SetItem(1,"co_muestrario",ll_null)
		dw_head.SetItem(1,"de_muestrario",ls_null)		
		il_co_muestrario=-1
		il_referencia=-1		
		//////////////////
	CASE "co_talla"
		//dw_head.SetItem(1,"co_linea",ll_null)
		//il_linea=-1
//		dw_head.SetItem(1,"co_muestra",ll_null)
//		il_muestra=-1
//		dw_head.SetItem(1,"de_muestra",ls_null)
//		dw_head.SetItem(1,"co_talla",ll_null)
//		il_talla=-1
//		dw_head.SetItem(1,"de_talla",ls_null)
//		dw_head.SetItem(1,"co_color",ll_null)
//		il_color=-1
//		dw_head.SetItem(1,"de_color",ls_null)
//		dw_head.SetItem(1,"co_diseno",ll_null)
//		il_cons=-1
//		dw_head.SetItem(1,"de_co_diseno",ls_null)
//		dw_head.SetItem(1,"co_recurso",ll_null)
//		dw_head.SetItem(1,"de_recurso",ls_null)
//		dw_head.SetItem(1,"id_peso",ls_null)
//		dw_head.SetItem(1,"sw_excepcion",0)		
		//////////////////		
		dw_head.SetItem(1,"co_diseno",ll_null)
		dw_head.SetItem(1,"de_diseno",ls_null)
		il_diseno=-1
		dw_head.SetItem(1,"co_muestrario",ll_null)
		dw_head.SetItem(1,"de_muestrario",ls_null)		
		il_co_muestrario=-1
		//////////////////		
	CASE "co_diseno"		
		//////////////////		
//		dw_head.SetItem(1,"de_diseno",ls_null)
//		il_diseno=-1
		dw_head.SetItem(1,"co_muestrario",ll_null)
		dw_head.SetItem(1,"de_muestrario",ls_null)		
		il_co_muestrario=-1
		//////////////////				
END CHOOSE

Return 1
end function

public function long of_verificar_partemp (long a_partemp);long ll_tot

If IsNull(a_partemp) Then
	Return 0
End If

tab_1.tabpage_1.dw_mp.SetRedraw(False)

tab_1.tabpage_1.dw_mp.setFilter("nu_partemp="+String(a_partemp))

tab_1.tabpage_1.dw_mp.Filter()

ll_tot=tab_1.tabpage_1.dw_mp.RowCount()

of_filtrar()

tab_1.tabpage_1.dw_mp.SetRedraw(True)

Return ll_tot
end function

public function long of_verifica_col (long a_color, long a_opcion);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 12 de Abril de 2003 HORA 13:47:56:078
// 
// cuando el color es nulo, se debe permitir
//////////////////////////////////////////////////////////////////////////
long ll_tot

If IsNull(a_color) Or IsNull(a_opcion) Then
	Return 0
End If

tab_1.tabpage_1.dw_mp.SetRedraw(False)

tab_1.tabpage_1.dw_mp.setFilter("co_color="+String(a_color)+" and co_diseno="+String(a_opcion))

tab_1.tabpage_1.dw_mp.Filter()

ll_tot=tab_1.tabpage_1.dw_mp.RowCount()

of_filtrar()

tab_1.tabpage_1.dw_mp.SetRedraw(True)

Return ll_tot
end function

public function long of_cantidadcolores ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 27 de Diciembre de 2002 HORA 10:51:10:640
// 
// Retorna la cantidad de colores que existen
// en caso de ser 0 se borran las observaciones
//////////////////////////////////////////////////////////////////////////

long ll_cant

  SELECT count(*)  
    INTO :ll_cant  
    FROM h_fmp_muestras  
   WHERE ( h_fmp_muestras.co_fabrica = :il_fabrica ) AND  
         ( h_fmp_muestras.co_linea = :il_linea ) AND  
         ( h_fmp_muestras.co_muestra = :il_muestra ) AND  
         ( h_fmp_muestras.co_talla = :il_talla ) 
			using n_cst_application.itr_appl;

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

If n_cst_application.itr_appl.SQLcode=100 Then 
	RollBack using n_cst_application.itr_appl ;
	Return -1
End If

If IsNull(ll_cant) Then 
	ll_cant=0
End If

Return ll_cant
end function

public function integer of_insertarparte ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 14 de Marzo de 2003 HORA 14:08:08:453
// 
// Se inserta una fila para facilitar la digitaci$$HEX1$$f300$$ENDHEX$$n
//////////////////////////////////////////////////////////////////////////

tab_1.tabpage_1.dw_mp.SetRedraw(False)



tab_1.tabpage_1.dw_mp.SetFilter("")
tab_1.tabpage_1.dw_mp.Filter()


		
long ll_tot,i,ll_pos,ll_tot1,ll_parte

ll_tot=tab_1.tabpage_1.dw_mp.RowCount()
ll_tot1=dw_partes.RowCount()

For i=1 To ll_tot
	ll_parte=tab_1.tabpage_1.dw_mp.GetItemNumber(i,"nu_partemp")
	ll_pos=dw_partes.Find("nu_partemp="+String(ll_parte),1,ll_tot1)
	If ll_pos>0 then
		tab_1.tabpage_1.dw_mp.SetItem(i,"nu_partemp",ll_pos)
	End If
Next

For i=1 To ll_tot1
	dw_partes.SetItem(i,"nu_partemp",i)
Next

tab_1.tabpage_1.dw_mp.SetRedraw(True)
Return 1
end function

public function integer of_borra_parte1 (long a_nupartemp);
tab_1.tabpage_1.dw_mp.Setredraw(False)

tab_1.tabpage_1.dw_mp.SetFilter("nu_partemp="+String(a_nupartemp))
	  
tab_1.tabpage_1.dw_mp.Filter()


Do While tab_1.tabpage_1.dw_mp.RowCount()>0 
	tab_1.tabpage_1.dw_mp.DeleteRow(0)
Loop

tab_1.tabpage_1.dw_mp.SetRedraw(True)


Return 1
end function

public function integer of_doubleclick ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 20 de Enero de 2003 HORA 15:13:56:796
// 
// Para hacer le efecto de dobleclick con el teclado, con f9
//////////////////////////////////////////////////////////////////////////
Datawindow ldw_1

ldw_1=idw_data

If Not IsValid(ldw_1) Then
	Return -1
End If

String ls_col
long ll_row

ls_col=ldw_1.GetColumnName ( )
ll_row=ldw_1.GetRow()
DWObject ldwo_1

CHOOSE CASE ls_col
	CASE "co_color"
		ldwo_1=ldw_1.object.co_color
	case "co_color"
	   ldwo_1=ldw_1.object.co_color
   case "co_partemp"
	   ldwo_1=ldw_1.object.co_partemp 
   case "co_combinacion"
	   ldwo_1=ldw_1.object.co_combinacion 
   case "co_producto_mp"
	   ldwo_1=ldw_1.object.co_producto_mp 
   case "co_color_mp"
	   ldwo_1=ldw_1.object.co_color_mp 
   case "co_matiz_mp"
	   ldwo_1=ldw_1.object.co_matiz_mp 
   case "co_caracteristi_mp"
	   ldwo_1=ldw_1.object.co_caracteristi_mp 
   case "co_proveedor"
	   ldwo_1=ldw_1.object.co_proveedor 	
END CHOOSE



If Not IsValid(ldwo_1) Then
	Return -1
End If

ldw_1.Post event DoubleClicked(0,0,ll_row,ldwo_1)

Return 1
end function

public function long of_copiampcol1 (long a_color, long a_opcion);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 14 de Abril de 2003 HORA 10:33:22:515
// 
// Copia la materia prima del colo1, en un color nuevo creado
//////////////////////////////////////////////////////////////////////////

long ll_res

tab_1.tabpage_1.dw_mp.Setredraw(False)

long ll_col1,ll_opc1

ll_col1=dw_colores.GetItemNumber(1,"co_color")
ll_opc1=dw_colores.GetItemNumber(1,"co_diseno")

n_cst_param lo_param

lo_param.il_vector[1]=ll_col1
lo_param.il_vector[2]=ll_opc1

OpenWithParm(w_color_opcion,lo_param)

lo_param=Message.PowerObjectParm

If Not IsValid(lo_param) Then
	Return -1
End If

ll_col1=lo_param.il_vector[1]
ll_opc1=lo_param.il_vector[2]


tab_1.tabpage_1.dw_mp.SetFilter("co_color="+String(ll_col1)+&
     " and co_diseno="+String(ll_opc1) )
	  
tab_1.tabpage_1.dw_mp.Filter()

n_ds_application lds_1

lds_1=create n_ds_application

//lds_1.DataObject=tab_1.tabpage_1.dw_mp.DataObject
lds_1.DataObject='d_copiador_mp'

tab_1.tabpage_1.dw_mp.rowsCopy(1,tab_1.tabpage_1.dw_mp.RowCount(),Primary!,&
                                  lds_1,1,Primary!)
											 
Long ll_tot,i

ll_tot=lds_1.RowCount()

For i=1 To ll_tot
	lds_1.SetItem(i,"co_color",a_color)
	lds_1.SetItem(i,"co_diseno",a_opcion)
Next

lds_1.rowsCopy(1,lds_1.RowCount(),Primary!,tab_1.tabpage_1.dw_mp,1,Primary!)

Destroy lds_1

of_filtrar()

tab_1.tabpage_1.dw_mp.SetRedraw(True)


Return 1
end function

public function integer of_verificarproductomp (string a_columna, long a_fila, string a_dato);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 19 de Diciembre de 2002 HORA 11:32:24:062
// 
// Se verifica que el producto sea v$$HEX1$$e100$$ENDHEX$$lido, cuando estan todos los datos
//////////////////////////////////////////////////////////////////////////


long ll_fabrica_mp,ll_producto_mp,ll_calidad_mp,ll_matiz_mp,ll_caracteristi_mp,&
     ll_color_mp,ll_res,ll_proveedor
	  
	  

ll_fabrica_mp=tab_1.tabpage_1.dw_mp.GetItemNumber(a_fila,"co_fabrica_mp")
ll_producto_mp=tab_1.tabpage_1.dw_mp.GetItemNumber(a_fila,"co_producto_mp")
ll_calidad_mp=tab_1.tabpage_1.dw_mp.GetItemNumber(a_fila,"calidad_mp")
ll_matiz_mp=tab_1.tabpage_1.dw_mp.GetItemNumber(a_fila,"co_matiz_mp")
ll_caracteristi_mp=tab_1.tabpage_1.dw_mp.GetItemNumber(a_fila,"co_caracteristi_mp")
ll_color_mp=tab_1.tabpage_1.dw_mp.GetItemNumber(a_fila,"co_color_mp")
ll_proveedor=tab_1.tabpage_1.dw_mp.GetItemNumber(a_fila,"co_proveedor")

If a_columna="co_fabrica_mp" Then
	ll_fabrica_mp=Long(a_dato)
End If

If a_columna="co_producto_mp" Then
	ll_producto_mp=Long(a_dato)
End If

If a_columna="calidad_mp" Then
	ll_calidad_mp=Long(a_dato)
End If

If a_columna="co_matiz_mp" Then
	ll_matiz_mp=Long(a_dato)
End If

If a_columna="co_caracteristi_mp" Then
	ll_caracteristi_mp=Long(a_dato)
End If

If a_columna="co_color_mp" Then
	ll_color_mp=Long(a_dato)
	
	ll_res = of_validar_matprima(n_cst_application.itr_appl,ll_producto_mp,ll_color_mp,ll_fabrica_mp)
	If ll_res <> 1 Then
		MessageBox("Advertencia!","Existe por lo menos una combinaci$$HEX1$$f300$$ENDHEX$$n producto - matiz - caracter$$HEX1$$ed00$$ENDHEX$$stica - color - calidad en estado obsoleto ",StopSign!)
		Return -1
	End If
	
End If

If a_columna="co_proveedor" Then
	ll_proveedor=Long(a_dato)
End If


If IsNull(ll_fabrica_mp) or IsNull(ll_producto_mp) or IsNull(ll_calidad_mp) or &
   IsNull(ll_matiz_mp)   or IsNull(ll_caracteristi_mp) or IsNull(ll_color_mp) or &
	IsNull(ll_proveedor)Then
	
//////////////////////////////////////////////////////////////////////////
// Si hay algun dato nulo, entonces se toma como v$$HEX1$$e100$$ENDHEX$$lido el registo que
// se esta haciendo
//////////////////////////////////////////////////////////////////////////
	
	Return 1
End If


n_ds_application lds_1

lds_1=create n_ds_application

lds_1.DataObject="d_m_prod_proveedor"

lds_1.SetTransObject(n_cst_application.itr_appl)

ll_res=lds_1.Retrieve(ll_fabrica_mp,ll_producto_mp,ll_calidad_mp,ll_matiz_mp,&
                     ll_caracteristi_mp,ll_color_mp,ll_proveedor)
							
If ll_res<=0 Then
	MessageBox("Advertencia!","El producto no existe, o no tiene proveedor, por favor verifique.",StopSign!)
	Return -1
End If

//////////////////////////////////////////////////////////////////////////
// Determino el estado del color, para que sea v$$HEX1$$e100$$ENDHEX$$lido, debe ser A $$HEX2$$f3002000$$ENDHEX$$D
// 
//////////////////////////////////////////////////////////////////////////
long ll_pos

ll_pos=lds_1.find("#1='A'",1,lds_1.RowCount())

If ll_pos>0 Then
	Return 1
End If

ll_pos=lds_1.find("#1='D'",1,lds_1.RowCount())


If ll_pos>0 Then
	Return 1
Else
	MessageBox("Advertencia!","El estado del color no es v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
	Return -1
End If


Return 1
end function

public function integer of_buscarproducto ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 06 de Junio de 2003 HORA 14:12:22:062
// 
// Permite buscar los productos de materia prima
// debe tener la fila del dw de materias primas
// debe estar seleccionado ese dw
//////////////////////////////////////////////////////////////////////////
n_cst_param lo_param
Long 			ll_fila

If idw_data<>tab_1.tabpage_1.dw_mp Then
	Return -1
End If

ll_fila=idw_data.GetRow()


Open(w_opc_producto)

lo_param=Message.PowerObjectParm

If Not IsValid(lo_param) Then
	Return -1
End If

idw_data.setItem(ll_fila,"co_producto_mp",lo_param.il_vector[1])
idw_data.setItem(ll_fila,"calidad_mp",lo_param.il_vector[2])
idw_data.setItem(ll_fila,"co_matiz_mp",lo_param.il_vector[3])
idw_data.setItem(ll_fila,"co_caracteristi_mp",lo_param.il_vector[4])
idw_data.setItem(ll_fila,"co_color_mp",lo_param.il_vector[5])

idw_data.setItem(ll_fila,"de_producto",lo_param.is_vector[1])



Return 1
end function

public function integer of_filtro (long al_parte, long al_fila_parte, long al_col, long al_fila_col, long al_opcion);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 12 de Diciembre de 2002 HORA 16:44:04:687
// 
// Para filtrar la materia prima por parte
//////////////////////////////////////////////////////////////////////////
long ll_co_parte,ll_co_combinacion

If IsNull(al_parte) Then al_parte=-1
If IsNull(al_col) Then al_col=-1
If IsNull(al_opcion) Then al_opcion=-1

String ls_filtro

ls_filtro="nu_partemp="+String(al_parte)

If rb_un_col.checked Then
	ls_filtro+=" and co_color= "+String(al_col)+" and co_diseno="+String(al_opcion) 
End If

//Messagebox('Var','ls_filtro='+ls_filtro+'~n')
tab_1.tabpage_1.dw_mp.SetFilter(ls_filtro)
tab_1.tabpage_1.dw_mp.Filter()
tab_1.tabpage_1.dw_mp.Sort()

of_nombreMateriaPrima()

il_fila_parte=al_fila_parte

dw_partes.SelectRow(0,False)
dw_partes.SelectRow(al_fila_parte,True)
dw_partes.ScrollToRow(al_fila_parte)

dw_colores.SelectRow(0,False)
dw_colores.SelectRow(al_fila_col,True)
dw_colores.ScrollToRow(al_fila_col)

ls_filtro =" co_color= "+String(al_col)
 
tab_1.tabpage_5.dw_dt_muestras_fert.SetFilter(ls_filtro)
tab_1.tabpage_5.dw_dt_muestras_fert.Filter()
tab_1.tabpage_5.dw_dt_muestras_fert.Sort()

String	ls_nombre, ls_temp, ls_colec, ls_tema
Long		ll_fila
FOR ll_fila = 1 to tab_1.tabpage_5.dw_dt_muestras_fert.RowCount()
	ls_temp  = tab_1.tabpage_5.dw_dt_muestras_fert.GetItemString(ll_fila, 'co_temporada') 
	ls_colec = tab_1.tabpage_5.dw_dt_muestras_fert.GetItemString(ll_fila, 'co_coleccion') 
	ls_tema  = tab_1.tabpage_5.dw_dt_muestras_fert.GetItemString(ll_fila, 'co_tema') 
	
	ls_nombre = of_nombretemporada( ls_temp, ls_colec, ls_tema)
	tab_1.tabpage_5.dw_dt_muestras_fert.SetItem(ll_fila, 'de_temporada', ls_nombre)
NEXT

il_nu_partemp=al_parte

il_color=al_col

il_fila_color=al_fila_col

il_opcion=al_opcion

Return 1
end function

public function integer of_filtrar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 15 de Abril de 2003 HORA 15:44:38:406
// 
// 
//////////////////////////////////////////////////////////////////////////


long ll_tot_parte,ll_tot_color

ll_tot_parte=dw_partes.RowCount()
ll_tot_color=dw_colores.RowCount()
dw_colores.accepttext( )

If ll_tot_parte<1 Then
	Return -1
End If
If ll_tot_color<1 then
	Return -1
End If

If il_fila_parte<1 Then
	Return -1
End If

If il_fila_color<1 Then
	Return -1
End If

If il_fila_color>ll_tot_color Then
	il_fila_color=ll_tot_color
End If

If Il_fila_parte>ll_tot_parte Then
	il_fila_parte=ll_tot_parte
End If

of_filtro(dw_partes.GetItemNumber(il_fila_parte,"nu_partemp"),il_fila_parte,&
			dw_colores.GetItemNumber(il_fila_color,"co_color"),il_fila_color,&
			dw_colores.GetItemNumber(il_fila_color,"co_diseno"))

Return 1
end function

public function integer of_copiamp2 ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 11 de Junio de 2003 HORA 13:53:27:750
// 
// Copia los pesos de todos los partes en los otros colores de carta
//////////////////////////////////////////////////////////////////////////


long ll_res,j,ll_col,ll_opcion,ll_pos
decimal{2} lde_peso
String ls_filtro,ls_filtro1

If il_fila_color<=0 Then
	MessageBox("Advertencia!","Debe seleccionar un color.",StopSign!)
	Return -1
End If

ll_res=MessageBox("Advertencia!","Se van a copiar los pesos de este color en todos los colores de carta, el proceso se hace para todas las partes o combinaciones.~n $$HEX2$$bf002000$$ENDHEX$$Desea continuar ?",Question!,YesNo!,2)
If ll_res=2 Then
	Return 1
End If

tab_1.tabpage_1.dw_mp.Setredraw(False)



n_ds_application lds_1

lds_1=create n_ds_application

//lds_1.DataObject=tab_1.tabpage_1.dw_mp.DataObject
lds_1.DataObject='d_copiador_mp'

ll_col=dw_colores.GetItemNumber(il_fila_color,"co_color")
ll_opcion=dw_colores.GetItemNumber(il_fila_color,"co_diseno")

ls_filtro="co_color= "+String(ll_col)+" and co_diseno="+String(ll_opcion) 

//Messagebox('Var','ls_filtro='+ls_filtro+'~n')

tab_1.tabpage_1.dw_mp.SetFilter(ls_filtro)
tab_1.tabpage_1.dw_mp.Filter()

IF tab_1.tabpage_1.dw_mp.rowsCopy(1,tab_1.tabpage_1.dw_mp.RowCount(),Primary!,&
                                  lds_1,1,Primary!) <0 THEN 
	Messagebox('Advertencia','fallo al realizar el copiado de informacion sobre materia prima')
END IF 											 
											 
lds_1.Sort()

Long i,ll_tot,lim1,lim2,k,ll_fila,ll_nu_partemp,ll_nu_mp,ll_co_partemp,ll_co_combinacion

ll_fila=il_fila_color

ll_tot=dw_colores.RowCount()

For i=1 To ll_tot
	il_fila_color=i
	ll_col=dw_colores.GetItemNumber(il_fila_color,"co_color")
	ll_opcion=dw_colores.GetItemNumber(il_fila_color,"co_diseno")

	ls_filtro="co_color= "+String(ll_col)+" and co_diseno="+String(ll_opcion) 
	
	//Messagebox('Var','ls_filtro='+ls_filtro+'~n')
	
	tab_1.tabpage_1.dw_mp.setFilter(ls_filtro)
	tab_1.tabpage_1.dw_mp.filter()
	
	lim1=tab_1.tabpage_1.dw_mp.RowCount()
	lim2=lds_1.RowCount()

	For j=1 To lim2 
		ll_nu_partemp=lds_1.getItemNumber(j,"nu_partemp")
		ll_nu_mp=lds_1.getItemNumber(j,"nu_mp")
		ll_co_partemp=lds_1.getItemNumber(j,"co_partemp")
		ll_co_combinacion=lds_1.getItemNumber(j,"co_combinacion")
		
		If IsNull(ll_co_combinacion) Then
			ls_filtro1="nu_partemp="+String(ll_nu_partemp)+&
			" and nu_mp="+String(ll_nu_mp)+&
			" and co_partemp="+String(ll_co_partemp)+&
			" and isnull(co_combinacion)"
		Else
			ls_filtro1="nu_partemp="+String(ll_nu_partemp)+&
			" and nu_mp="+String(ll_nu_mp)+&
			" and co_partemp="+String(ll_co_partemp)+&
			" and co_combinacion="+String(ll_co_combinacion)
		End If
		//Messagebox('Var','ls_filtro1='+ls_filtro1+'~n')
		ll_pos=tab_1.tabpage_1.dw_mp.find(ls_filtro1,1,lim1)
		//Messagebox('Var','ll_pos='+String(ll_pos)+'~n')
		If ll_pos>0 Then
			lde_peso=lds_1.GetItemDecimal(j,"peso_mp")
			tab_1.tabpage_1.dw_mp.SetItem(ll_pos,"peso_mp",lde_peso)
		End If
	Next
Next


Destroy lds_1

il_fila_color=ll_fila

of_filtrar()

tab_1.tabpage_1.dw_mp.SetRedraw(True)

Return 1
end function

public function integer of_copiamp1 ();long ll_res,j
decimal{2} lde_peso

ll_res=MessageBox("Advertencia!","Se van a igualar las materias primas y los pesos en todos los colores de carta, esto se hace solo para la parte seleccionada.~n $$HEX2$$bf002000$$ENDHEX$$Desea continuar ?",Question!,YesNo!,2)
If ll_res=2 Then
	Return 1
End If

tab_1.tabpage_1.dw_mp.Setredraw(False)

n_ds_application lds_1

lds_1=create n_ds_application

lds_1.DataObject='d_copiador_mp'
//lds_1.DataObject=tab_1.tabpage_1.dw_mp.DataObject

IF tab_1.tabpage_1.dw_mp.rowsCopy(1,tab_1.tabpage_1.dw_mp.RowCount(),Primary!,&
                                  lds_1,1,Primary!) < 0 THEN 
	Messagebox('Advertencia','fallo al realizar el copiado de informacion sobre materia prima')
END IF 											
											 
lds_1.Sort()

Long i,ll_tot,lim1,lim2,k,ll_fila

ll_fila=il_fila_color

ll_tot=dw_colores.RowCount()

For i=1 To ll_tot
	il_fila_color=i
	of_filtrar()
	lim1=tab_1.tabpage_1.dw_mp.RowCount()
	lim2=lds_1.RowCount()
	If lim1<lim2 Then
		For k=1 To lim2
			lds_1.SetItem(k,"co_color",il_color)
			lds_1.SetItem(k,"co_diseno",il_opcion)
		Next
      lds_1.RowsCopy(lim1+1,lim2,Primary!,tab_1.tabpage_1.dw_mp,&
		lim1+1,Primary!)		
	End If
	For j=1 To lim2 
		lde_peso=lds_1.GetItemDecimal(j,"peso_mp")
		tab_1.tabpage_1.dw_mp.SetItem(j,"peso_mp",lde_peso)
	Next
Next


Destroy lds_1

il_fila_color=ll_fila

of_filtrar()

tab_1.tabpage_1.dw_mp.SetRedraw(True)

Return 1
end function

public function integer of_pesos_x_color ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 02 de Julio de 2003 HORA 15:52:54:552
// 
// 
//////////////////////////////////////////////////////////////////////////



long i,ll_tot,ll_color,ll_pos,ll_opc
decimal{2} lde_peso,lde_peso1
String ls_bus

n_ds_application lds_1

lds_1=create n_ds_application

lds_1.DataObject="d_peso_x_color_mue"

lds_1.SetTransObject(n_cst_application.itr_appl)

ll_tot=dw_colores.RowCount()

For i=1 to ll_tot
	dw_colores.SetItem(i,"peso_color",0)
Next



ll_tot=lds_1.retrieve(il_fabrica, il_linea, il_muestra, il_talla)

For i=1 to ll_tot
	ll_color=lds_1.GetItemNumber(i,"co_color")
	ll_opc=lds_1.GetItemNumber(i,"co_diseno")
	ls_bus="co_color="+String(ll_color)+" and co_diseno="+String(ll_opc)
	
	ll_pos=dw_colores.find(ls_bus,1,dw_colores.RowCount())
	If ll_pos>0 Then
		lde_peso=lds_1.GetItemDecimal(i,"peso_color")
		dw_colores.SetItem(ll_pos,"peso_color",lde_peso)
	End If
Next

//////////////////////////////////////////////////////////////////////////
// EL SISTEMA hace una notificaci$$HEX1$$f300$$ENDHEX$$n de advertencia en caso de que existan
// pesos diferentes
//////////////////////////////////////////////////////////////////////////
ll_tot=dw_colores.RowCount()

For i=1 to ll_tot
	If i<ll_tot Then
	   lde_peso=dw_colores.GetItemDecimal(i,"peso_color")
		lde_peso1=dw_colores.GetItemDecimal(i+1,"peso_color")
		 
		If (lde_peso<>lde_peso1) Then
			MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Existen pesos diferentes "+&
			String(lde_peso,"#,###.00")+", "+String(lde_peso1,"#,###.00")+".")
			Destroy lds_1
			Return -1
		End If
	End If
Next
		
Destroy lds_1

Return 1
end function

public function integer of_controlmo ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 10 de Julio de 2003 HORA 15:24:42:635
// 
//  Se activa nuevamente esta validacion
//  Gloria Patricia Giraldo Rold$$HEX1$$e100$$ENDHEX$$n
//  Lorena del Socorro Sossa Zapata
//////////////////////////////////////////////////////////////////////////


long ll_cerrado,ll_tejido,ll_res
n_cst_comun lo_comun

//////////////////////////////////////////////////////////////////////////
// 17 DE MARZO, CLAUDIA CHAPMAN
// NO CONTROLAR ESTA EXISTENCIA
//////////////////////////////////////////////////////////////////////////



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
        FROM m_proref_muestras r                                            
       WHERE r.co_fabrica    = :il_fabrica                    
         AND r.co_linea      = :il_linea                          
         AND r.co_muestra    = :il_muestra
         AND r.co_talla      = :il_talla                      
         AND r.co_centro IN ( SELECT c.co_centro                   
                                FROM m_centros_pdn c               
                               WHERE c.co_tipoprod = :il_tipoprod
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

public function integer of_resetdw ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 29 de Marzo de 2003 HORA 16:47:58:890
// 
// Se hace reset de los dw
//////////////////////////////////////////////////////////////////////////


////dw_head.Reset()
dw_partes.Reset()
tab_1.tabpage_1.dw_mp.Reset()
tab_1.tabpage_2.dw_observacion.Reset()
dw_colores.Reset()
dw_head_ref.reset()

ids_observacion.Reset()

tab_1.tabpage_3.dw_resumen_mp.Reset()

tab_1.tabpage_3.dw_mat_prima2.Reset()


tab_1.tabpage_5.dw_dt_muestras_fert.Reset()
Return 1

end function

public function integer of_nombremateriaprima ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 16 de Diciembre de 2002 HORA 12:33:22:640
// 
// Para colocar los nombres de las materias primas y el peso por unidad
//////////////////////////////////////////////////////////////////////////

long ll_tot,i,ll_producto,ll_fabrica,ll_res,ll_proveedor
String ls_nom
ll_tot=tab_1.tabpage_1.dw_mp.RowCount()
n_cst_comun lo_c
Decimal lde_peso_muestra,lde_peso_prod

For i=1 To ll_tot
	ll_producto=tab_1.tabpage_1.dw_mp.GetItemNumber(i,"co_producto_mp")
	ls_nom=tab_1.tabpage_1.dw_mp.GetItemString(i,"de_producto")
	If IsNull(ls_nom) or len(trim(ls_nom))=0 Then
		ll_res=lo_c.of_nombreMatPrima(ll_producto,n_cst_application.itr_appl)
		If ll_res=1 Then
			tab_1.tabpage_1.dw_mp.SetItem(i,"de_producto",lo_c.of_getString(1))
		End If
		ll_proveedor=tab_1.tabpage_1.dw_mp.GetItemNumber(i,"co_proveedor")
		ll_res=lo_c.of_nombreProveedor(ll_proveedor,n_cst_application.itr_appl)
		If ll_res=1 Then
			tab_1.tabpage_1.dw_mp.SetItem(i,"de_proveedor",lo_c.of_getString(1))
		End If
	End If
	lde_peso_prod=tab_1.tabpage_1.dw_mp.GetItemDecimal(i,"peso_mp")
	If ide_FACTOR_MUESTRA_A_PDN <> 0 Then
		tab_1.tabpage_1.dw_mp.SetItem(i,"peso_muestra",lde_peso_prod / ide_FACTOR_MUESTRA_A_PDN)
	End If

	//SA56750 - Ceiba reariase - 11/07/2017
	// Si es Ropa se multiplica
//	IF (il_tipoprod = 20)  THEN
//		IF (il_basepeso <> 0) THEN
//			tab_1.tabpage_1.dw_mp.SetItem(i,"peso_muestra",lde_peso_prod * il_basepeso)
//		END IF
//	ELSE
//		If ide_FACTOR_MUESTRA_A_PDN <> 0 Then
//			tab_1.tabpage_1.dw_mp.SetItem(i,"peso_muestra",lde_peso_prod / ide_FACTOR_MUESTRA_A_PDN)
//		End If
//	END IF
//Fin SA56750
	
//	tab_1.tabpage_1.dw_mp.SetItem(i,"peso_muestra", lde_peso_prod/ide_FACTOR_MUESTRA_A_PDN)
Next
Return 1

end function

public function integer of_recuperar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 29 de Marzo de 2003 HORA 17:08:27:937
// 
// recupera los datos
//////////////////////////////////////////////////////////////////////////
Long 		ll_tot, ll_fila, ll_res, ll_co_recurso,i, ll_parte, ll_tot1
String	ls_carac_talla, ls_carac_color, ls_nombre, ls_temp, ls_colec, ls_tema, ls_observacion,ls_tmp

TRY 
GarbageCollect()

n_cst_comun lo_comun

If il_fabrica=-1 or il_linea=-1 or il_muestra=-1 or il_talla=-1  Then
	
	Return -2
End If

of_consultar_referencia(il_fabrica,il_linea,il_muestra,il_talla)
of_resetDw()

ll_tot=dw_head.Retrieve(il_fabrica,il_linea,il_muestra,il_talla,il_co_muestrario,il_diseno)

If ll_tot<0 Then
	Return -1
End If

If ll_tot=0 then
	dw_head.InsertRow(0)
	dw_head.SetItem(1,"co_fabrica",il_fabrica)
	dw_head.SetItem(1,"co_linea",il_linea)
	dw_head.SetItem(1,"co_muestra",il_muestra)
	dw_head.SetItem(1,"co_talla",il_talla)
	dw_head.SetItem(1,"co_diseno",il_diseno )
	dw_head.SetItem(1,"co_muestrario",il_co_muestrario )
	dw_head.SetItem(1,"co_recurso",il_recurso)
	
//	dw_head.SetItem(1,"co_color",il_color)
//	dw_head.SetItem(1,"co_diseno",il_cons)
ELSE
	ll_res=lo_comun.of_nombreRecursoTj( Long(dw_head.Object.co_recurso[1]), n_cst_application.itr_appl)

	If ll_res=1 Then
		dw_head.SetItem(1,"de_recurso",lo_comun.of_getString(1))
	End If	
End If

wf_configPermiOpcionesMenu() //SA54453 - Ceiba/jjmonsal - 31-03-2016
//////////////////////////////////////////////////////////////////////////
// Coloco las descripciones del header 
//////////////////////////////////////////////////////////////////////////
ll_res=lo_comun.of_nombreMuestra(il_fabrica /*long a_fabrica*/,&
                                    il_linea/*long a_linea*/, &
												il_muestra/*long a_muestra*/, &
												n_cst_application.itr_appl/*transaction a_transaction */)

If ll_res=1 Then
	dw_head.SetItem(1,"de_muestra",lo_comun.of_getString(1))
	il_tipoprod=lo_comun.of_getLong(1)
End If
////////////////////////////////////////////
ll_res=lo_comun.of_nombreDisenoMuestra(il_fabrica,il_linea, il_muestra,il_talla,&
	il_diseno,n_cst_application.itr_appl)
	
	If ll_res = 1 then
		dw_head.SetItem(1,"de_diseno",lo_comun.of_getString(1))
	Else	
		il_diseno=-1
//		MessageBox("Advertencia!","Dise$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
//		Return 2
	End If	

/////////////////////////////////////////////
	ll_res=lo_comun.of_nombremuestrario( il_fabrica,il_linea,il_co_muestrario,&
	                n_cst_application.itr_appl)
	
	If ll_res=1 Then	
		dw_head.SetItem(1,"de_muestrario",lo_comun.of_getString(1))
	Else
//		il_diseno=-1
//		MessageBox("Advertencia!","Muestrario no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
//		Return 2
	End if	

//////////////////////////////////////////////////////////////////////////
// Coloco el nombre de la talla
// 
//////////////////////////////////////////////////////////////////////////

ll_res=lo_comun.of_nombremuestratalla( il_fabrica,il_linea,il_muestra,il_talla,&
													n_cst_application.itr_appl)
If ll_res=1 Then	
	dw_head.SetItem(1,"de_talla",lo_comun.of_getString(1))
Else
	il_talla=-1
	MessageBox("Advertencia!","Talla no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	Return 2
End If

/*
* =============================================================================
* MODIFICADO: Julio 31 de 2009 - ohlondon
* -----------------------------------------------------------------------------
* Se obtiene la cantidad Base que se uso en la toma del peso de m_muestras en
* base_peso.
* =============================================================================
*/
ll_res      = lo_comun.of_BasePesoMuestra(il_fabrica, il_linea, il_muestra, &
                                   n_cst_application.itr_appl)
il_basepeso = 1

IF (ll_res = 1) THEN
	em_basepeso.Text = lo_comun.of_getString(1)
	
	IF (il_tipoprod = 20) THEN
		il_basepeso = long(lo_comun.of_getString(1))
	END IF 
ELSEIF (ll_res = 0) THEN
	MessageBox("$$HEX1$$a100$$ENDHEX$$Atenci$$HEX1$$f300$$ENDHEX$$n!","La muestra no se encuentra. Por favor verifique.",Exclamation!)	
	RETURN -1
ELSE
	// ocurrio un error
	RETURN -1
END IF
// =============================================================================

il_calidad = 1
IF not isnull(il_referencia) AND il_referencia <> 0 THEN
	//SA56752 - Ceiba/reariase - 08-05-2017
	//dw_head_ref.retrieve(il_fabrica_ref,il_linea_ref,il_referencia,il_talla,il_calidad,il_diseno,il_co_muestrario)
	dw_head_ref.retrieve(il_fabrica_ref,il_linea_ref,il_referencia,il_talla,il_calidad,il_diseno,il_co_muestrario,il_muestra)
	//Fin SA56752
END IF	


//////////////////////////////////////////////////////////////////////////
// Recupero los colores y coloco el nombre del recurso
// 
//////////////////////////////////////////////////////////////////////////

ll_tot=dw_colores.Retrieve(il_fabrica,il_linea,il_muestra,il_talla,il_co_muestrario,il_diseno)

For i=1 To ll_tot
	ll_co_recurso=dw_head.GetItemNumber(1,"co_Recurso")
	

	ll_res=lo_comun.of_nombreRecursoTj( ll_co_recurso/*long a_recurso*/,&                            
   								  n_cst_application.itr_appl/*transaction a_transaction */)
												 
	If ll_res=1 Then
		dw_colores.SetItem(i,"de_recurso",lo_comun.of_getString(1))
	End If


	ll_res=lo_comun.of_nombrecolor( il_fabrica,il_linea,il_color,n_cst_application.itr_appl)

	If ll_res=1 Then
		dw_head.SetItem(1,"de_color",lo_comun.of_getString(1))											
	End If
Next

//Se colocan los pesos de los colores
of_pesos_x_color()
wf_CargaValorCampoEnPdn()//SA55583 - Ceiba/jjmonsal - 13-10-2016 - Cargar necesidad en produccion SAP - SIS

// Recupero el detalle
/* MODIFICADO: Agosto 28 de 2009 - gagudelo - ohlondon
	No es necesario enviar el muetrario para recuperar las partes */
ll_tot1=dw_partes.Retrieve(il_fabrica,il_linea,il_muestra,il_talla,il_diseno,il_co_muestrario )

//ll_tot1=dw_partes.Retrieve(il_fabrica,il_linea,il_muestra,il_talla,il_diseno)
If ll_tot1=-1 Then
	Return -1
End If
//////////////////////////////////////////////////////////////////////////
// Coloco el nombre de las partes o combinaciones
// y selecciono la primera fila
//////////////////////////////////////////////////////////////////////////

ll_tot1=dw_partes.RowCount()
If ll_tot1>0 Then
	il_tipoprod=dw_partes.GetItemNumber(ll_tot1,"co_tipoprod")
	ll_res=tab_1.tabpage_1.dw_mp.Retrieve(il_fabrica,il_linea,il_muestra,il_talla,il_diseno,il_co_muestrario)
//	ll_res=tab_1.tabpage_1.dw_mp.Retrieve(il_fabrica,il_linea,il_muestra,il_talla,il_diseno)
	
	tab_1.tabpage_1.dw_mp.SetFilter("")
	tab_1.tabpage_1.dw_mp.Filter()
	
	wf_PoblarDs_Iniciales() //SA55169 - Ceiba/jjmonsal - 03-10-2016

	of_nombreParteCombinacion()
//////////////////////////////////////////////////////////////////////////
// Se selecciona por defecto la ultima fila
//////////////////////////////////////////////////////////////////////////
						
   dw_partes.SetFocus()		
	dw_partes.SetRow(ll_tot1)
	dw_partes.ScrollToRow(ll_tot1)
Else
//////////////////////////////////////////////////////////////////////////
// Cuando esta aca es que no tiene datos y pregunta si los desea copiar...
// ojo con el copiar, hay que verificarlo
//////////////////////////////////////////////////////////////////////////
	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea copiar la materia prima de otra muestra ?",Question!,YesNo!,2)
	If ll_res=1 Then
		PostEvent("ue_copiar_mp")
	End If

End If

/*
* ============================================================================
* MODIFICADO: Diciembre 01 de 2011 - ohlondon
* ----------------------------------------------------------------------------
* RELACION FERT: Traer las tallas y colores de la caracteristica asociada a la
*                fabrica-linea
* ============================================================================
*/
IF NOT (il_fabrica = 5) THEN 
	tab_1.tabpage_5.dw_dt_muestras_fert.retrieve(il_fabrica,il_linea, il_muestra, il_talla ) 
	ll_res = lo_comun.of_obtener_caracteristica(il_fabrica,il_linea,n_cst_application.itr_appl)  
	IF ll_res = -1 THEN
		MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", lo_comun.of_getstring(1))
		tab_1.tabpage_5.dw_dt_muestras_fert.SetFocus()
		tab_1.tabpage_5.dw_dt_muestras_fert.SetColumn('co_fert')
	ELSE
		ls_carac_talla = lo_comun.of_getstring(1)
		ls_carac_color = lo_comun.of_getstring(2)
		
		IF IsNull(ls_carac_talla) OR Trim(ls_carac_talla ) = '' THEN
			ls_carac_talla  = 'TACALCETIN'
		END IF
		
		IF IsNull(ls_carac_color) OR Trim(ls_carac_color ) = '' THEN
			ls_carac_color  = 'COCALCETIN'
		END IF
		
		lo_comun.of_loadDddw(idwc_talla_fert, ls_carac_talla, n_cst_application.itr_appl)
		lo_comun.of_loadDddw(idwc_color_fert, ls_carac_color, n_cst_application.itr_appl)
				
	END IF
	
	ll_tot = tab_1.tabpage_5.dw_dt_muestras_fert.RowCount()		
	FOR ll_fila = 1 TO ll_tot
		ls_temp  = tab_1.tabpage_5.dw_dt_muestras_fert.GetItemString(ll_fila, 'co_temporada') 
		ls_colec = tab_1.tabpage_5.dw_dt_muestras_fert.GetItemString(ll_fila, 'co_coleccion') 
		ls_tema  = tab_1.tabpage_5.dw_dt_muestras_fert.GetItemString(ll_fila, 'co_tema') 
		
		ls_nombre = of_nombretemporada( ls_temp, ls_colec, ls_tema)
		tab_1.tabpage_5.dw_dt_muestras_fert.SetItem(ll_fila, 'de_temporada', ls_nombre)
	NEXT
END IF
// ---------------------------------------------------------------------------


If dw_colores.RowCount()>0 Then
	If ll_tot1>0 Then
		ll_parte=dw_partes.GetItemNumber(ll_tot1,"nu_partemp")
	Else
		ll_parte=-1
	End If
	
	of_filtro(ll_parte, ll_tot1,dw_colores.GetItemNumber(1,"co_color"),1,dw_colores.GetItemNumber(1,"co_diseno"))
End If					

//////////////////////////////////////////////////////////////////////////
// Recurpero las observaciones
//////////////////////////////////////////////////////////////////////////

ll_tot=ids_observacion.Retrieve(il_fabrica,il_linea,il_muestra,il_talla,il_co_muestrario, il_diseno )

If ll_tot>0 Then
	ls_observacion=ids_observacion.GetItemString(1,"obs_fmp")
End If

tab_1.tabpage_2.dw_observacion.Reset()
For i=1 to 4
	ls_tmp=Trim(mid(ls_observacion,70 * (i -1)+1,70))
	tab_1.tabpage_2.dw_observacion.InsertRow(0)
	tab_1.tabpage_2.dw_observacion.SetItem(i,1,ls_tmp)
Next

tab_1.tabpage_4.dw_composicion.retrieve(il_fabrica,il_linea, il_muestra, il_talla) 

//tab_1.tabpage_5.dw_dt_muestras_fert.retrieve(il_fabrica,il_linea, il_muestra, il_talla, il_color) 
GarbageCollect()
Return 1

CATCH(Throwable le_error)
	Messagebox("Error Recuperando Informaci$$HEX1$$f300$$ENDHEX$$n", le_error.getmessage(), StopSign!)
	Return -1
End Try
end function

public function integer of_verificar_parte_combinacion (long a_fabrica, long a_linea, long a_muestra, long a_talla);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 11 de Diciembre de 2003 HORA 13:04:21:414
// 
// Se verifica que los colores de la muestra seleccionadas tengan las mismas
// partes, esto se confirm$$HEX2$$f3002000$$ENDHEX$$con Oscar Acosta de Control T$$HEX1$$e900$$ENDHEX$$cnico
//////////////////////////////////////////////////////////////////////////
long i,ll_tot,ll_consec,ll_consec1
n_ds_application lds_1

lds_1=create n_ds_application

lds_1.DataObject="d_dt_fmp_mue1_cp_verif"

lds_1.SetTransObject(n_cst_application.itr_appl)

ll_tot=lds_1.Retrieve(a_fabrica,a_linea,a_muestra,a_talla)

If ll_tot<=0 Then
	MessageBox("Advertencia!","Materia prima no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	Return -1
End If

For i=1 To ll_tot

	ll_consec=lds_1.GetItemNumber(i,"consec")
   
	If i>1 Then
		ll_consec1 = lds_1.GetItemNumber(i - 1,"consec")
		
		If ll_consec=ll_consec1 Then
			MessageBox("Advertencia!","Los colores/opciones de la muestra seleccionada no tienen las mismas partes/combinaciones, por favor verifique.",StopSign!)
			Return -1
		End If

	End If

Next

Return 1
end function

public function integer of_borra_col1 (long a_color, long a_opcion);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 14 de Abril de 2003 HORA 10:33:22:515
// 
// Copia la materia prima del colo1, en un color nuevo creado
//////////////////////////////////////////////////////////////////////////

tab_1.tabpage_1.dw_mp.Setredraw(False)

If IsNull(a_color) Then a_color=-1
If IsNull(a_opcion) Then a_opcion=-1

tab_1.tabpage_1.dw_mp.SetFilter("co_color="+String(a_color)+&
     " and co_diseno="+String(a_opcion) )
	  
tab_1.tabpage_1.dw_mp.Filter()

//
//Do While tab_1.tabpage_1.dw_mp.RowCount()>0 
//	tab_1.tabpage_1.dw_mp.DeleteRow(0)
//Loop

of_filtrar()

tab_1.tabpage_1.dw_mp.SetRedraw(True)


Return 1
end function

public function integer of_grabar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 12 de Diciembre de 2002 HORA 18:11:02:390
// 
// Para guardar los datos
//////////////////////////////////////////////////////////////////////////
DateTime 		ldt_fecha
String 			ls_usuario,ls_instancia, ls_rec_mod,ls_tmp
n_cst_comun 	lo_c
u_ds_base		lds_recurso

GarbageCollect()

If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If

tab_1.tabpage_1.dw_mp.SetFilter("")
tab_1.tabpage_1.dw_mp.Filter()
tab_1.tabpage_5.dw_dt_muestras_fert.SetFilter("")
tab_1.tabpage_5.dw_dt_muestras_fert.Filter()

dw_head.object.cnt_opcion[1] = dw_head.Object.co_diseno[1]

If dw_head.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
	RollBack Using n_cst_application.itr_appl;
	Return -1
End If			

If tab_1.tabpage_1.dw_mp.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
	RollBack Using n_cst_application.itr_appl;
	Return -1
End If	

If dw_colores.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
	RollBack Using n_cst_application.itr_appl;
	Return -1
End If	

long i,j,ll_tot,ll_parte,ll_combinacion,ll_nupartemp,ll_tot1

//primera parte grabacion de las partes.
ll_tot=dw_partes.RowCount()

For i=1 To ll_tot
	ll_parte			=dw_partes.GetItemNumber(i,"co_partemp")
	ll_combinacion	=dw_partes.GetItemNumber(i,"co_combinacion")
	ll_nupartemp	=dw_partes.GetItemNumber(i,"nu_partemp")
	
	tab_1.tabpage_1.dw_mp.SetFilter("nu_partemp="+String(ll_nupartemp))
	tab_1.tabpage_1.dw_mp.Filter()
	
	ll_tot1=tab_1.tabpage_1.dw_mp.RowCount()
	
	For j=1 to ll_tot1
		tab_1.tabpage_1.dw_mp.SetItem(j,"co_partemp",ll_parte)
		tab_1.tabpage_1.dw_mp.SetItem(j,"cnt_opcion",dw_head.Object.cnt_opcion[1])
		tab_1.tabpage_1.dw_mp.SetItem(j,"co_diseno",dw_head.Object.co_diseno[1])
		tab_1.tabpage_1.dw_mp.SetItem(j,"co_combinacion",ll_combinacion)
	Next	
Next
//////////////////////////////////////////////////////////////////////////
// En caso de que se haga cambio de pesos de provisonales a definitivos
// se debe actualizar primero el detalle y luego el encabezado
//////////////////////////////////////////////////////////////////////////

boolean cambioPesos=false
string idPeso1,idPeso2

If dw_colores.RowCount()>0 Then
	idPeso1=dw_colores.GetItemString(1,"id_peso")
	If idPeso1="D" Then
		idPeso2=dw_colores.GetItemString(1,"id_peso",Primary!,true)
		If idPeso1<>idPeso2 Then
			cambioPesos=true
		End If
	End If
End If

If tab_1.tabpage_1.dw_mp.DeletedCount()>0 or cambioPesos Then
	
	If tab_1.tabpage_1.dw_mp.Update(True,False)<>1 Then
		RollBack Using n_cst_application.itr_appl;
		Return -1
	End If
	If dw_colores.Update(True,False)<>1 Then
		RollBack Using n_cst_application.itr_appl;
		Return -1
	End If
Else
	If dw_colores.Update(True,False)<>1 Then
		RollBack Using n_cst_application.itr_appl;
		Return -1
	End If

	If tab_1.tabpage_1.dw_mp.Update(True,False)<>1 Then
		RollBack Using n_cst_application.itr_appl;
		Return -1
	End If
End If

//Enviar correo cuando se modifico el recurso cotizado para que SAP lo vuelva a enviar 
lds_recurso						= CREATE u_ds_base
lds_recurso.dataobject 		= 'd_rec_cotizado' 
lds_recurso.SetTransobject( n_cst_application.itr_appl)

lds_recurso.retrieve( dw_head.Object.co_fabrica[1], dw_head.Object.co_linea[1], dw_head.Object.co_muestra[1])

IF lds_recurso.rowcount( ) > 0 THEN		
	//Validar que el Recurso que se modifico sea uno de los recusos cotizados
	IF (lds_recurso.object.co_reccotnocierra[1] = dw_head.object.co_recurso[1]) OR (lds_recurso.object.co_reccotcierra[1] = dw_head.object.co_recurso[1]) THEN
//		IF of_mail_cambio() THEN //SA52045 - Ceiba/jjmonsal - 09-12-2015
		IF wf_ActRecursoCotModificado() < 0 THEN 
			RollBack Using n_cst_application.itr_appl;
			RETURN -1 
		END IF 
	END IF
END IF

If ib_cambio_observaciones and dw_head.RowCount()>0 Then
	IF tab_1.tabpage_2.dw_observacion.Rowcount( ) > 0 THEN
		For i=1 to 4
			ls_tmp+=lo_c.of_espacios( tab_1.tabpage_2.dw_observacion.GetItemString(i,1),70)
		Next	
	END IF
	
	If ids_observacion.Rowcount()=0 Then
		//consulta si hay datos
		ids_observacion.Retrieve(il_fabrica,il_linea,il_muestra,il_talla,il_co_muestrario, il_diseno )
		If ids_observacion.Rowcount()=0 Then
			ids_observacion.InsertRow(0)
		End if
	END IF
	
	ids_observacion.SetItem(1,"co_fabrica",il_fabrica)
	ids_observacion.SetItem(1,"co_linea",il_linea)
	ids_observacion.SetItem(1,"co_muestra",il_muestra)
	ids_observacion.SetItem(1,"co_talla",il_talla)
	
	ids_observacion.SetItem(1,"co_muestrario",il_co_muestrario )
	ids_observacion.SetItem(1,"co_diseno", il_diseno )
	ids_observacion.SetItem(1,"obs_fmp",ls_tmp)
	
	
	If ids_observacion.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
		RollBack Using n_cst_application.itr_appl;
		Return -1
	End If			
	
	If ids_observacion.Update()<>1 Then
		RollBack Using n_cst_application.itr_appl;
		Return -1
	End If	
End If
If tab_1.tabpage_5.dw_dt_muestras_fert.DeletedCount()>0  OR tab_1.tabpage_5.dw_dt_muestras_fert.RowCount()>0 Then
	If tab_1.tabpage_5.dw_dt_muestras_fert.Update(True,False)<>1 Then
		RollBack Using n_cst_application.itr_appl;
		Return -1
	End If
END IF
	
ids_observacion.ResetUpdate()
tab_1.tabpage_1.dw_mp.ResetUpdate()
tab_1.tabpage_5.dw_dt_muestras_fert.ResetUpdate()
dw_colores.ResetUpdate()
GarbageCollect()
Return 1
end function

public function integer of_validar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 12 de Abril de 2003 HORA 13:33:25:515
// 
// 
//////////////////////////////////////////////////////////////////////////
Long		ll_return, ll_fila, ll_filas, ll_find
String	ls_temporada, ls_coleccion, ls_tema
GarbageCollect()
If dw_head.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos de muestra no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If dw_colores.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos de colores generales no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If


tab_1.tabpage_1.dw_mp.SetFilter("")
tab_1.tabpage_1.dw_mp.Filter()

//////////////////////////////////////////////////////////////////////////
// Se borran las filas que no se tocaron, las que tienen co_producto_mp null
// 
//////////////////////////////////////////////////////////////////////////
long i,ll_dato
i=1
DO WHILE i<=tab_1.tabpage_1.dw_mp.RowCount()
	ll_dato=tab_1.tabpage_1.dw_mp.GetItemNumber(i,"co_producto_mp")
	If IsNull(ll_dato) Then
		tab_1.tabpage_1.dw_mp.DeleteRow(i)
		i --
	end If
	i++
LOOP

//////////////////////////////////////////////////////////////////////////
// Se borran las filas de las partes que est$$HEX1$$e100$$ENDHEX$$n en blanco
// 
//////////////////////////////////////////////////////////////////////////
i=1
long ll_parte,ll_combinacion
Do While i<=dw_partes.RowCount()
	ll_parte=dw_partes.GetItemNumber(i,"co_partemp")
	ll_combinacion=dw_partes.GetItemNumber(i,"co_combinacion")
	
	If IsNull(ll_parte) and IsNull(ll_combinacion) Then
		dw_partes.DeleteRow(i)
		i --
	End If
	i ++
Loop

ll_find = dw_partes.Find('estado = "I"',1,dw_partes.RowCount()+1)
//si hay partes inactivas y la muestra no tiene referencia
If ll_find > 0 and dw_head_ref.RowCount() = 0 Then
	MessageBox("Advertencia!","Existen partes de materia prima inactivas para la muestra.")
	Return -1
End if


//////////////////////////////////////////////////////////////////////////
// Se borran las filas de colores que estan en blanco...
// 
//////////////////////////////////////////////////////////////////////////
i=1
long ll_color

dw_colores.SetRow(1)

Do While i<=dw_colores.RowCount()
	ll_color=dw_colores.GetItemNumber(i,"co_color")

	If IsNull(ll_color) Then
		dw_colores.DeleteRow(i)
		i --
	End If
	i ++
Loop


If tab_1.tabpage_1.dw_mp.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos de materia prima no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If tab_1.tabpage_2.dw_observacion.AcceptText()<>1 Then
	MessageBox("Advertencia!","Observaciones no v$$HEX1$$e100$$ENDHEX$$lidas.",StopSign!)
	Return -1
End If

tab_1.tabpage_5.dw_dt_muestras_fert.SetFilter("")
tab_1.tabpage_5.dw_dt_muestras_fert.Filter()

If tab_1.tabpage_5.dw_dt_muestras_fert.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos de Fert no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If


//////////////////////////////////////////////////////////////////////////
// Se verifica si el id_peso es P, el peso puede ser 0, en caso contrario No
// 
//////////////////////////////////////////////////////////////////////////
If dw_head.RowCount()=0 Then
	MessageBox("Advertencia!","No hay datos para guardar.",StopSign!)
	Return -1
End If

long ll_tot,ll_pos
decimal{2} lde_peso

ll_tot=dw_colores.RowCount()

If Not dw_colores.of_completeData() Then
	of_filtrar()
	Return -1
End If
//////////////////////////////////////////////////////////////////////////
// A continuacion se verifica que exista mp en todos los colores y
// que si el peso es permanente sea mayor a 0
// y que los otros datos existan
//////////////////////////////////////////////////////////////////////////

ll_tot=dw_colores.RowCount()

long 		ll_tot1,j,ll_tot2,k
String 	ls_id_peso

ll_tot1=dw_partes.RowCount()

//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Lunes 16 de Mayo de 2005 HORA 16:48:34:546
// 
// Se pueden tener colores sin materia prima, en ninguna de sus partes 
// Solicitud 8474
//////////////////////////////////////////////////////////////////////////
long ll_con_mp,ll_sin_mp,ll_color1,ll_opc1

For i=1 To ll_tot //colores
	ls_id_peso=dw_colores.GetItemString(i,"id_peso")
	ll_con_mp=0
	ll_sin_mp=0
	For j=1 To ll_tot1 //partes
		of_filtro(dw_partes.GetItemNumber(j,"nu_partemp"),j,&
		dw_colores.GetItemNumber(i,"co_color"),i,&
		dw_colores.GetItemNumber(i,"co_diseno"))
		
		ll_tot2=tab_1.tabpage_1.dw_mp.RowCount()
		
		If ll_tot2=0 Then
			
			//MessageBox("Advertencia!","Existen partes sin materia prima, por favor verifique.",StopSign!)
			//Return -1
			ll_sin_mp++
			ll_color1=dw_colores.GetItemNumber(i,"co_color")
			ll_opc1=dw_colores.GetItemNumber(i,"co_diseno")
			If ll_con_mp>0 Then
				j=ll_tot1+1
			End If
		Else
			ll_con_mp++
		End If

		For k=1 To ll_tot2
			//////////////////////////////////////////////////////////////////////////
			// Se verifica si existen datos nulos en los requeridos de la mataria
			// prima
			//////////////////////////////////////////////////////////////////////////
			If Not tab_1.tabpage_1.dw_mp.of_completeData(k) Then
				Return -1
			End If

			//////////////////////////////////////////////////////////////////////////
			// Cuando el peso es definitivo, hay que verificar que exista algun
			// valor adecuado.
			//////////////////////////////////////////////////////////////////////////

			If ls_id_peso<>"P" then

				lde_peso=tab_1.tabpage_1.dw_mp.GetItemDecimal(k,"peso_mp")		
				If IsNull(lde_peso) Then
					lde_peso=0
				End If

				If lde_peso=0 Then		
					MessageBox("Advertencia!","Existen pesos no v$$HEX1$$e100$$ENDHEX$$lidos, por favor verifique.",StopSign!)
					Return -1
				End If
			End If
		Next

	Next

	If ll_con_mp>0 Then
		If ll_sin_mp>0 Then
			MessageBox("Advertencia!","El color "+String(ll_color1)+&
			" opci$$HEX1$$f300$$ENDHEX$$n "+String(ll_opc1)+" tiene algunas partes sin materia prima, por favor verifique.",StopSign!)
			Return -1
		End If
	End If

	/*
	* ---------------------------------------------------------------------------
	* Se debe verificar que en la relacion (si se registra) se ingresen los datos 
	* necesarios
	* ---------------------------------------------------------------------------
	*/
	ll_color1 = dw_colores.GetItemNumber(i,"co_color")

	tab_1.tabpage_5.dw_dt_muestras_fert.SetFilter("")
	tab_1.tabpage_5.dw_dt_muestras_fert.Filter()
	
	If tab_1.tabpage_5.dw_dt_muestras_fert.AcceptText()<>1 Then
		MessageBox("Advertencia!","Datos de Fert no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
		Return -1
	End If
	
	tab_1.tabpage_5.dw_dt_muestras_fert.SetFilter("co_color = " + String(ll_color1))
	tab_1.tabpage_5.dw_dt_muestras_fert.Filter()
	
	
	ll_filas = tab_1.tabpage_5.dw_dt_muestras_fert.RowCount()
	
	IF ll_filas > 0 THEN 
		
		If Not tab_1.tabpage_5.dw_dt_muestras_fert.of_completeData(ll_filas) Then
			Return -1
		END IF
		
		/*
		* Y para cada fila se debe verificar que la combinacion de temporada coleccion y tema exista.
		*/
		FOR ll_fila = 1 TO ll_filas
			SetNull(ll_return)
			SetNull(ls_temporada)
			SetNull(ls_coleccion)
			SetNull(ls_tema)		
			ls_temporada = tab_1.tabpage_5.dw_dt_muestras_fert.GetItemString(ll_fila, 'co_temporada')
			ls_coleccion = tab_1.tabpage_5.dw_dt_muestras_fert.GetItemString(ll_fila, 'co_coleccion')
			ls_tema      = tab_1.tabpage_5.dw_dt_muestras_fert.GetItemString(ll_fila, 'co_tema')
			/*
			* Retorna:  1 Si existe 
			*           0 Si no existe
			*          -1 Si ocurrio un error en BD
			*          -2 Si no se digito la combinacion (minimo Temporada) 
			*/
			ll_return = of_verificar_temporada( ls_temporada, ls_coleccion, ls_tema)
			IF ll_return = -1 THEN
				Return -1
			ELSEIF ll_return = -2 THEN
				MessageBox("Error Fila "+String(ll_fila),"Debe digitar como m$$HEX1$$ed00$$ENDHEX$$nimo la temporada para la "+&
							  "combinaci$$HEX1$$f300$$ENDHEX$$n Temporada-Colecci$$HEX1$$f300$$ENDHEX$$n-Tema.",StopSign!)
				Return -1
			ELSEIF ll_return = 0 THEN
				MessageBox("Error Fila "+String(ll_fila),"No existe la combinaci$$HEX1$$f300$$ENDHEX$$n de Temporada-Colecci$$HEX1$$f300$$ENDHEX$$n-Tema: "+&
								ls_temporada+"-"+ls_coleccion+"-"+ls_tema+". Por favor verifique.",StopSign!)
				Return -1
			END IF
		NEXT		
	End If
Next


If of_controlMo()<>1 Then
	MessageBox("Advertencia!","La muestra no tiene recursos asignados para tejido en la mano de obra.",StopSign!)
	//of_iniciar()
	Return -1
End If
GarbageCollect()
Return 1
	
end function

public function integer of_consultar_referencia (long an_fabrica, long an_linea, long an_muestra, long an_talla);//Select 
//ids_muestra_referencia = CREATE n_ds_application
//
//ids_muestra_referencia.of_load('dgr_muestra_referenica')
//ids_muestra_referencia.of_conexion(n_cst_application.itr_appl,True)
//il_referencia=-1

//ll_linea = dw_head.GetitemNumber(1,"co_linea")
//ll_muestra = dw_head.GetitemNumber(1,"co_muestra")
//ll_talla = dw_head.SetItem(1,"co_talla",ll_null)

Long ll_filas

ll_filas = ids_muestra_referencia.retrieve(il_fabrica,il_linea, il_muestra,il_talla )

IF ll_filas <0 Then
Elseif ll_filas = 0 Then
Elseif ll_filas = 1 Then	
	il_referencia = ids_muestra_referencia.getitemNumber(1,"co_referencia_ref")
Elseif ll_filas > 1 Then
	dw_head_ref.reset()
End if

//dw_head_ref.retrieve(il_fabrica,il_linea, il_referencia, il_talla, il_calidad, il_diseno, il_co_muestrario,il_diseno )

Return 1
end function

public function integer of_cambio_muestrario (long an_fabrica, long an_linea, long an_muestra, long an_talla, long an_diseno, long an_muestrario);//Datetime ldt_fecha
//String ls_usuario,ls_instancia
//Long ll_color,ll_res,ll_f
//long ll_co_diseno,ll_pos, ll_chk
//
//dw_head_ref.retrieve(ll_fabrica,ll_linea, il_referencia, ll_talla, il_calidad, ll_diseno ,ll_muestrario )
///////////////////////////////////////////////////
//
//tab_1.tabpage_1.dw_mp.SetRedraw(False)
//dw_partes.SetRedraw(False)
//
////is_where_copia  =  lo_param.is_vector[1]
//
//ll_res = dw_partes.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_diseno,ll_muestrario)
//
//If ll_res<=0 Then
//	tab_1.tabpage_1.dw_mp.SetRedraw(True)
//	dw_partes.SetRedraw(True)
//	MessageBox("Advertencia!","No se ha parametrizado la materia prima para la muestra seleccionada.",StopSign!)
//	Return 0
//End If
//
////Tambien actualizar fecha,usuario,instancia
//If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
//												 ldt_fecha,ls_usuario,ls_instancia) Then
//	Return -1
//End If
//
////For i=1 To ll_res
////	dw_partes.SetItem(i,"co_fabrica",il_fabrica)
////	dw_partes.SetItem(i,"co_linea",il_linea)
////	dw_partes.SetItem(i,"co_muestra",il_muestra)
////	dw_partes.SetItem(i,"co_talla",il_talla)	
////Next
//
//////////////////////////////////////////////////////////////////////////////
//// Se copian los colores
////////////////////////////////////////////////////////////////////////////
//ll_res = dw_colores.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_muestrario,ll_diseno)
//
//If ll_res<=0 Then
//	tab_1.tabpage_1.dw_mp.SetRedraw(True)
//	dw_partes.SetRedraw(True)
//	MessageBox("Advertencia!","No se encontraron los colores.",StopSign!)
//	Return 0
//End If
/////////////////////////////////////////
/////////////////////////////////////////
//dw_colores1.Reset()
//For i=1 To ll_res
//	ll_color=lds_1.GetItemNumber(i,"co_color")
//		ll_f=dw_colores1.InsertRow(0)
//		dw_colores1.SetItem(ll_f,"co_color",ll_color)
//Next
//
//ll_tot_col=dw_colores1.RowCount()
////////////////////////////////////////////////////////////////////////////
//// Se abre la ventana para seleccionar los colores
////////////////////////////////////////////////////////////////////////////
//
//OpenWithParm(w_sel_color_copia,dw_colores1)

//////////////////////////////////////////////////////////////////////////
// Solo se deben copiar los colores seleccionados
//////////////////////////////////////////////////////////////////////////

//For i=1 To ll_res
//	
//	ll_color=lds_1.GetItemNumber(i,"co_color")
//	ll_co_diseno=lds_1.GetItemNumber(i,"co_diseno")
//	
//	ll_pos=dw_colores.Find("co_color="+String(ll_color)+" and co_diseno="+&
//	String(ll_co_diseno),1,dw_colores.RowCount())
//	
//	ll_chk=dw_colores1.Find("co_color="+String(ll_color)+" and chk=1",1,ll_tot_col)
//	
//	If ll_pos=0 and ll_chk > 0 Then
//		lds_1.SetItem(i,"co_fabrica",il_fabrica)
//		lds_1.SetItem(i,"co_linea",il_linea)
//		lds_1.SetItem(i,"co_muestra",il_muestra)
//		lds_1.SetItem(i,"co_talla",il_talla)
//		
//		lds_1.SetItem(i,"co_diseno",il_diseno)
//	
//		lds_1.SetItem(i,'fe_creacion',ldt_fecha)
//		lds_1.SetItem(i,'fe_actualizacion',ldt_fecha)
//		lds_1.SetItem(i,'usuario',ls_usuario)
//		lds_1.SetItem(i,'instancia',ls_instancia)
//		
//		lds_1.rowscopy( i,i,Primary!,dw_colores,dw_colores.RowCount()+1,Primary!)
//	End If
//	
//	
//Next
//
////////////////////////////////////////////////////////////////////////////
//// Se copia la materia prima
//// 
////////////////////////////////////////////////////////////////////////////
//
//lds_1.DataObject=tab_1.tabpage_1.dw_mp.DataObject
//
//lds_1.SetTransObject(n_cst_application.itr_appl)
//	
////ll_res=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_color,ll_cons)
//
////ll_res=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_diseno,ll_muestrario,ll_color,ll_cons)
//ll_res=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_diseno,ll_muestrario)
//
//If ll_res<=0 Then
//	tab_1.tabpage_1.dw_mp.SetRedraw(True)
//	dw_partes.SetRedraw(True)
//	Destroy lds_1
//	MessageBox("Advertencia!","No se ha parametrizado la materia prima para la muestra seleccionada.",StopSign!)
//	Return
//End If
//
////lds_1.rowscopy( 1,ll_res,Primary!,tab_1.tabpage_1.dw_mp,1,Primary!)
//tab_1.tabpage_1.dw_mp.SetFilter("")
//tab_1.tabpage_1.dw_mp.Filter()
//
//For i=1 To ll_res
//	ll_color = lds_1.GetItemNumber(i,"co_color")
//	ll_co_diseno = lds_1.GetItemNumber(i,"co_diseno")
//	
//	ll_pos=tab_1.tabpage_1.dw_mp.Find("co_color="+String(ll_color)+" and co_diseno="+&
//	String(ll_co_diseno),1,tab_1.tabpage_1.dw_mp.RowCount())
//	
//	ll_chk=dw_colores1.Find("co_color="+String(ll_color)+" and chk=1",1,ll_tot_col)
//
//	
//	If ll_pos=0 and ll_chk > 0 Then
////		tab_1.tabpage_1.dw_mp.SetItem(i,"co_fabrica",il_fabrica)
////		tab_1.tabpage_1.dw_mp.SetItem(i,"co_linea",il_linea)
////		tab_1.tabpage_1.dw_mp.SetItem(i,"co_muestra",il_muestra)
////		tab_1.tabpage_1.dw_mp.SetItem(i,"co_talla",il_talla)
////		
////		tab_1.tabpage_1.dw_mp.SetItem(i,"co_diseno",il_diseno) 
////		
////		tab_1.tabpage_1.dw_mp.SetItem(i,'fe_creacion',ldt_fecha)
////		tab_1.tabpage_1.dw_mp.SetItem(i,'fe_actualizacion',ldt_fecha)
////		tab_1.tabpage_1.dw_mp.SetItem(i,'usuario',ls_usuario)
////		tab_1.tabpage_1.dw_mp.SetItem(i,'instancia',ls_instancia)	
//
//		lds_1.SetItem(i,"co_fabrica",il_fabrica)
//		lds_1.SetItem(i,"co_linea",il_linea)
//		lds_1.SetItem(i,"co_muestra",il_muestra)
//		lds_1.SetItem(i,"co_talla",il_talla)
//		
//		lds_1.SetItem(i,"co_diseno",il_diseno) 
//		
//		lds_1.SetItem(i,'fe_creacion',ldt_fecha)
//		lds_1.SetItem(i,'fe_actualizacion',ldt_fecha)
//		lds_1.SetItem(i,'usuario',ls_usuario)
//		lds_1.SetItem(i,'instancia',ls_instancia)	
//		
//		
//		//lds_1.rowscopy( i,i,Primary!,tab_1.tabpage_1.dw_mp,1,Primary!)
//		
//		lds_1.rowscopy( i,i,Primary!,tab_1.tabpage_1.dw_mp,tab_1.tabpage_1.dw_mp.RowCount()+1,Primary!) //
//	End if	
//Next
//
//
//
//of_nombreParteCombinacion()
//
//of_filtro(dw_partes.GetItemNumber(1,"nu_partemp") /*long al_parte*/,&
//					1/*long al_fila*/,&
//					dw_colores.GetItemNumber(1,"co_color")/*long al_co_color*/,&
//					1/*fila color */,dw_colores.GetItemNumber(1,"co_diseno"))
//						
//
//
//If ll_res_obs<>1 Then
//	tab_1.tabpage_1.dw_mp.SetRedraw(True)
//	dw_partes.SetRedraw(True)
//	Destroy lds_1
//	Return
//End If
//
//lds_1.DataObject=ids_observacion.DataObject
//
//lds_1.SetTransObject(n_cst_application.itr_appl)
//	
//ll_res=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_muestrario,ll_diseno)
//
//If ll_res<=0 Then
//	tab_1.tabpage_1.dw_mp.SetRedraw(True)
//	dw_partes.SetRedraw(True)
//	Destroy lds_1
//	MessageBox("Advertencia!","No se encontraron observaciones, por favor verifique.",StopSign!)
//	Return
//End If
//
//ids_observacion.Reset()
//
//String ls_observacion,ls_tmp
//
//
//ls_observacion=lds_1.GetItemString(1,"obs_fmp")
//
//
//tab_1.tabpage_2.dw_observacion.Reset()
//For i=1 to 4
//	ls_tmp=Trim(mid(ls_observacion,70 * (i -1)+1,70))
//	tab_1.tabpage_2.dw_observacion.InsertRow(0)
//	tab_1.tabpage_2.dw_observacion.SetItem(i,1,ls_tmp)
//Next
//
////////////////////////////////////////////////////////////////////////////
//// Se cambia la variable para que las observaciones se guarden al final
//// 
////////////////////////////////////////////////////////////////////////////
//
//
//ib_cambio_observaciones=True
//
//
//tab_1.tabpage_1.dw_mp.SetRedraw(True)
//dw_partes.SetRedraw(True)
//Destroy lds_1
return 1
end function

public function integer of_consultar_muestra_col ();long ll_muestrario
setnull(ll_muestrario)

SELECT co_muestrario
INTO :ll_muestrario
FROM h_fmp_muestras 
WHERE  co_fabrica = :il_fabrica AND 
 co_linea = :il_linea AND 
 co_muestra = :il_muestra AND 
 co_talla = :il_talla AND 
 co_color = :il_color AND
 co_diseno = :il_diseno USING n_cst_application.itr_appl ;
 
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If
 
If n_cst_application.itr_appl.SQLcode = 0 Then 
	IF Not isnull(ll_muestrario) THEN
		Messagebox("Advertencia", "Este color ya est$$HEX2$$e1002000$$ENDHEX$$asociado en el muestrario:" + String(ll_muestrario))
		Return 0
	END IF	
End If


Return 1
end function

public function integer of_valiar_muestrario_color (long an_muestrario, long an_color);long ll_error, ll_return
String ls_error, ls_mensaje

////////////////////////////////////

DECLARE pr_validar_muestrario_col PROCEDURE FOR sp_validar_color_mues(
:il_fabrica, :il_linea, :il_muestra, :il_talla, :an_color, :an_muestrario  )
Using n_cst_application.itr_appl;


EXECUTE pr_validar_muestrario_col;

ll_error = n_cst_application.itr_appl.SQLCode

IF n_cst_application.itr_appl.SQLCode < 0 THEN
	ls_error = n_cst_application.itr_appl.SQLErrText
	ROLLBACK Using n_cst_application.itr_appl;
	CLOSE pr_validar_muestrario_col;

	MessageBox("Advertencia - Error de Base Datos","Error al ejecutar el procedimiento almacenado <sp_validar_color_mues> al validar muestrario color"+&
			"~n~nError : "+ String(ll_error) + " - "+ trim(ls_error) + "~n~nConsulte con el administrador del sistema",StopSign!)
	Return -1
End If

FETCH pr_validar_muestrario_col INTO :ll_return, :ls_mensaje ;

ll_error = n_cst_application.itr_appl.SQLCode
IF ll_error < 0 THEN
	ls_error = n_cst_application.itr_appl.SQLErrText
	CLOSE pr_validar_muestrario_col;
	ROLLBACK;
	MessageBox("Advertencia - Error de Base de Datos","Error en la lectura de los datos en la ejecuci$$HEX1$$f300$$ENDHEX$$n del procedimiento <sp_validar_color_mues>"+&
		"~n~nError: "+ String(ll_error) + " - "+ trim(ls_error) +"~n~nConsulte con el Administrador del Sistema",StopSign!)			
	Return -1
End If

CLOSE pr_validar_muestrario_col;

IF ll_return < 0 THEN
	Messagebox("Advertencia",ls_mensaje)
	Return ll_return
END IF	

////////////////////////////////////////
Return 1

end function

public function integer of_crear_color_en_referencia (long an_muestrario, long an_color, long an_diseno, long an_recurso, string as_id_peso);long ll_error, ll_return
String ls_error, ls_mensaje

////////////////////////////////////

DECLARE pr_crear_color_en_fmp PROCEDURE FOR sp_crear_color_en_fmp(
:il_fabrica, :il_linea, :il_muestra, :il_talla, :an_color,:an_diseno,:an_recurso,:as_id_peso,:an_muestrario  )
Using n_cst_application.itr_appl;


EXECUTE pr_crear_color_en_fmp;

ll_error = n_cst_application.itr_appl.SQLCode

IF n_cst_application.itr_appl.SQLCode < 0 THEN
	ls_error = n_cst_application.itr_appl.SQLErrText
	ROLLBACK Using n_cst_application.itr_appl;
	CLOSE pr_crear_color_en_fmp;

	MessageBox("Advertencia - Error de Base Datos","Error al ejecutar el procedimiento almacenado <sp_crear_color_en_fmp> al validar muestrario color"+&
			"~n~nError : "+ String(ll_error) + " - "+ trim(ls_error) + "~n~nConsulte con el administrador del sistema",StopSign!)
	Return -1
End If

FETCH pr_crear_color_en_fmp INTO :ll_return, :ls_mensaje ;

ll_error = n_cst_application.itr_appl.SQLCode
IF ll_error < 0 THEN
	ls_error = n_cst_application.itr_appl.SQLErrText
	CLOSE pr_crear_color_en_fmp;
	ROLLBACK;
	MessageBox("Advertencia - Error de Base de Datos","Error en la lectura de los datos en la ejecuci$$HEX1$$f300$$ENDHEX$$n del procedimiento <sp_crear_color_en_fmp>"+&
		"~n~nError: "+ String(ll_error) + " - "+ trim(ls_error) +"~n~nConsulte con el Administrador del Sistema",StopSign!)			
	Return -1
End If

CLOSE pr_crear_color_en_fmp;

IF ll_return < 0 THEN
	Messagebox("Advertencia",ls_mensaje)
	Return ll_return	
END IF	

////////////////////////////////////////
Return 1

end function

public function integer of_validar_muestrario_x_col (long an_muestrario, long an_color);long ll_error, ll_return
String ls_error, ls_mensaje

////////////////////////////////////

DECLARE pr_validar_muestrario_col PROCEDURE FOR sp_validar_color_mues(
:il_fabrica, :il_linea, :il_muestra, :il_talla, :an_color, :an_muestrario  )
Using n_cst_application.itr_appl;


EXECUTE pr_validar_muestrario_col;

ll_error = n_cst_application.itr_appl.SQLCode

IF n_cst_application.itr_appl.SQLCode < 0 THEN
	ls_error = n_cst_application.itr_appl.SQLErrText
	ROLLBACK Using n_cst_application.itr_appl;
	CLOSE pr_validar_muestrario_col;

	MessageBox("Advertencia - Error de Base Datos","Error al ejecutar el procedimiento almacenado <sp_validar_color_mues> al validar muestrario color"+&
			"~n~nError : "+ String(ll_error) + " - "+ trim(ls_error) + "~n~nConsulte con el administrador del sistema",StopSign!)
	Return -1
End If

FETCH pr_validar_muestrario_col INTO :ll_return, :ls_mensaje ;

ll_error = n_cst_application.itr_appl.SQLCode
IF ll_error < 0 THEN
	ls_error = n_cst_application.itr_appl.SQLErrText
	CLOSE pr_validar_muestrario_col;
	ROLLBACK;
	MessageBox("Advertencia - Error de Base de Datos","Error en la lectura de los datos en la ejecuci$$HEX1$$f300$$ENDHEX$$n del procedimiento <sp_validar_color_mues>"+&
		"~n~nError: "+ String(ll_error) + " - "+ trim(ls_error) +"~n~nConsulte con el Administrador del Sistema",StopSign!)			
	Return -1
End If

CLOSE pr_validar_muestrario_col;

IF ll_return = 0 THEN
ELSE	
	Messagebox("Advertencia",ls_mensaje)
	Return ll_return
END IF	

////////////////////////////////////////
Return 2

end function

public function integer of_validar_matprima (transaction a_transaction, long an_producto, long an_color, long an_fabrica);Long ll_error, ll_contador

If IsNull(an_producto) OR  IsNull(an_color)  Then
	Return 1
End If

//Se verifica que por lo menos haya una convinacion de producto - color activo

SELECT count(estado) 
INTO :ll_contador
FROM m_prod_proveedor 
WHERE co_producto = :an_producto
AND co_color = :an_color
AND  estado = "A" 
//AND  estado = "O" 
AND co_fabrica = :an_fabrica
  using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If

If ll_contador > 0 Then
	Return 1
Else
	Return 0
End If


Return 1
end function

public function integer of_verificar_temporada (string as_temporada, string as_coleccion, string as_tema);/* 
* ----------------------------------------------------------------------------
* MODIFICADO: Diciembre 21 de 2011 - ohlondono
* ----------------------------------------------------------------------------
* Se debe verificar que la combinacion de temporada coleccion y tema exista.
* Retorna:  1 Si existe 
*           0 Si no existe
*          -1 Si ocurrio un error en BD
*          -2 Si no se digito la combinacion (minimo Temporada) 
* ----------------------------------------------------------------------------
*/

long ll_existe

IF (IsNull(as_temporada) OR Trim(as_temporada) = '') AND  &
   (IsNull(as_coleccion) OR Trim(as_coleccion) = '') AND  &
	(IsNull(as_tema)      OR Trim(as_tema) = '') THEN
	RETURN -2
END IF

SELECT Count(*)
  INTO :ll_existe
  FROM tb_temporada
 WHERE ( co_temporada = :as_temporada ) AND  
	 	 ( co_coleccion = :as_coleccion ) AND  
		 ( co_tema      = :as_tema      )			
 USING n_cst_application.itr_appl;
			
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If
			
If n_cst_application.itr_appl.SQLcode=0 AND ll_existe = 0 Then 
	Return 0
End If

Return 1
end function

public function string of_nombretemporada (string as_temp, string as_colec, string as_tema);
String 	ls_nombre
Long 		ll_res

ls_nombre = ''

IF Not IsNull(as_temp) THEN
	ids_temporadas.SetFilter("")
	ids_temporadas.Filter()
	
	ids_temporadas.SetFilter("Trim(co_temporada) = '"+as_temp+"' AND Trim(co_coleccion) = '"+as_colec+"'"+&
									" AND Trim(co_tema) = '"+as_tema+"'")
	ids_temporadas.Filter()
	ll_res = ids_temporadas.RowCount()
	IF ll_res > 0 THEN 	  
		ls_nombre = ids_temporadas.GetItemString(1, 'de_temporada')
 	ELSEIF ll_res = 0 THEN 		 
		ls_nombre = 'TEMPORADA NO EXISTE'
 	END IF 
END IF

Return ls_nombre

//		tab_1.tabpage_5.dw_dt_muestras_fert.SetItem(Row, 'de_temporada', ls_nombre)


end function

public function long of_recuperar_diseno (ref long al_diseno);
Long ll_retorno

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


RETURN ll_retorno
end function

public function long of_recurso_utilizado (ref long al_recurso, long al_diseno);long ll_cant

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

public function integer wf_actualizar_recurso_cierra (long al_muestra, long al_linea, long al_fabrica);//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	wf_actualizar_recurso_cierra (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	se actualiza el estado en el recurso que cierra para que quede como enviado 
//-------------------------------------------------------------------------
// ARGUMENTO:	readonly long al_muestra, readonly long al_linea, readonly long al_fabrica 
// RETORNO	:	integer
//=========================================================================


UPDATE DT_MUESTRAS 
SET CO_ESTRECCIERRA = 3
WHERE CO_MUESTRA=:al_muestra
AND CO_LINEA =:al_linea
AND CO_FABRICA =:al_fabrica
USING n_cst_application.itr_appl;

IF n_cst_application.itr_appl.SQLcode=-1 THEN 
	ROLLBACK using n_cst_application.itr_appl;
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	RETURN -1
END IF

RETURN 1
end function

public function integer wf_actualizar_recurso_nocierra (long al_muestra, long al_linea, long al_fabrica);//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	wf_actualizar_recurso_nocierra (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	se actualiza el estado en el recurso que no cierra para que quede como enviado 
//-------------------------------------------------------------------------
// ARGUMENTO:	readonly long al_muestra, readonly long al_linea, readonly long al_fabrica 
// RETORNO	:	integer
//=========================================================================


UPDATE DT_MUESTRAS 
SET CO_ESTRECNOCIERRA = 3
WHERE CO_MUESTRA=:al_muestra
AND CO_LINEA =:al_linea
AND CO_FABRICA =:al_fabrica
USING n_cst_application.itr_appl;

IF n_cst_application.itr_appl.SQLcode=-1 THEN 
	ROLLBACK using n_cst_application.itr_appl;
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	RETURN -1
END IF

COMMIT using n_cst_application.itr_appl;

RETURN 1
end function

public function boolean of_mail_cambio ();String ls_usuario, ls_msg, ls_error, ls_asunto
Long ll_muestra, ll_fabrica, ll_linea, ll_solicitud, ll_existe, ll_inicio, ll_long, ll_recurso

u_ds_base			lds_datos
lds_datos		= 	CREATE u_ds_base

ll_muestra = dw_head.object.co_muestra[1]
ll_fabrica = dw_head.object.co_fabrica[1]
ll_linea = dw_head.object.co_linea[1]
ll_recurso = dw_head.object.co_recurso[1]

lds_datos.DataObject = 'd_datos_correo'
lds_datos.SetTransobject(n_cst_application.itr_appl)
lds_datos.retrieve(ll_muestra, ll_fabrica, ll_linea)
ll_existe = lds_datos.rowcount( )

IF ll_existe > 0 THEN
	
	ls_asunto='Referencia '+String(lds_datos.Object.co_referencia[1])
	
	ls_msg= " El material "+String(lds_datos.Object.co_referencia[1],'')+" talla: "+String(lds_datos.Object.co_talla[1],'')+&
			  " Recurso: "+String(ll_recurso)+" muestrario: "+String(lds_datos.Object.co_muestrario[1],'')+" ha sido modificado "+&
			  " por el usuario: "+n_cst_application.is_user+","+&
			  " en FICHA DE MATERIA PRIMA. Fecha de Creaci$$HEX1$$f300$$ENDHEX$$n (o modificaci$$HEX1$$f300$$ENDHEX$$n): "+String(DateTime(Date(Today()),Time(Now())))+""
	
	/*Dbedocal 2018-05-11
	//Declara y Ejecuta procedimiento almacenado para envio de correo, el programa es datos_maestros
	Declare pr_envia_mail Procedure For admpd.pr_envia_mail('datos_maestros',:ls_asunto,:ls_msg)
	Using n_cst_application.itr_appl;

	Execute pr_envia_mail;

	IF n_cst_application.itr_appl.SQLCode < 0 THEN
		ls_error = n_cst_application.itr_appl.SQLErrText
		CLOSE pr_envia_mail;
	
		MessageBox("Advertencia - Error de Base Datos","Error al ejecutar el procedimiento almacenado <pr_envia_mail> al enviar correos."+&
				"~n~nError : "+ String(n_cst_application.itr_appl.SQLCode) + " - "+ trim(ls_error) + "~n~nConsulte con el administrador del sistema",StopSign!)
		Return False
	End If

	// Cierra el procedimiento almacenado declarado
	Close pr_envia_mail;
	*/
	uo_correo	lnv_correo
	lnv_correo = CREATE uo_correo
	
	TRY
		lnv_correo.of_enviar_correo(ls_asunto, ls_msg, "datos_maestros")
	CATCH(Exception ex)
		Messagebox("Error", ex.getmessage())
	END TRY
	
	DESTROY lnv_correo
		
		RETURN TRUE
	ELSE
		RETURN FALSE
	END IF
end function

public function integer wf_actrecursocotmodificado ();/***********************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016
Comentario: Se adiciona la logica para poblar la informacion en la nueva tabla tr_ModFmp para el 
REPORTE POR MODIFICACI$$HEX1$$d300$$ENDHEX$$N EN FICHAS DE MATERIA PRIMA
se adiciona la variable local lnv_c_tr_modfmp y todo referente a su implementacion
========================================================================================================================================================
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName : wf_ActRecursoCotModificado
<DESC> Description:Esta funcion permite almacenar la informacion sobre las modificaciones realizada a los recursos cotizados
a los recursos cotizados cierra o no cierra </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Cuando se modifica un recurso cotizado cierra o no cierra se debe invocar esta funcion, ya esta validara si se debe almacenar o no</USAGE>
********************************************************************/
String						ls_rec_mod
n_cst_c_tr_modfmp			lnv_c_tr_modfmp //SA55169 - Ceiba/jjmonsal - 03-10-2016
n_cst_c_log_reccotizado	lnv_c_log_reccotizado

lnv_c_log_reccotizado	= CREATE n_cst_c_log_reccotizado		
lnv_c_tr_modfmp			= CREATE n_cst_c_tr_modfmp //SA55169 - Ceiba/jjmonsal - 03-10-2016

Exception ex
ex = create Exception
Try
	lnv_c_log_reccotizado.of_setFabrica(dw_head.Object.co_fabrica[1])
	lnv_c_log_reccotizado.of_setLinea(dw_head.Object.co_linea[1])
	lnv_c_log_reccotizado.of_setMuestra(dw_head.Object.co_muestra[1])
	lnv_c_log_reccotizado.of_setRecurso(dw_head.object.co_recurso[1])
	ls_rec_mod = lnv_c_log_reccotizado.of_recurso_mod(dw_head.Object.co_muestra[1], dw_head.Object.co_linea[1], dw_head.Object.co_fabrica[1], dw_head.object.co_recurso[1])
	IF ls_rec_mod = 'NO CIERRA' THEN
		wf_actualizar_recurso_nocierra( dw_head.Object.co_muestra[1], dw_head.Object.co_linea[1], dw_head.Object.co_fabrica[1])
	ELSEIF ls_rec_mod = 'CIERRA' THEN
		wf_actualizar_recurso_cierra( dw_head.Object.co_muestra[1], dw_head.Object.co_linea[1], dw_head.Object.co_fabrica[1])
	END IF
	
	IF lnv_c_log_reccotizado.of_cargarInfoReporteRecCotizado(ls_rec_mod,il_co_muestrario) = -1 THEN RETURN -1
	
	/*=============REPORTE POR MODIFICACI$$HEX1$$d300$$ENDHEX$$N EN FICHAS DE MATERIA PRIMA=================*///SA55169 - Ceiba/jjmonsal - 03-10-2016
	lnv_c_tr_modfmp.of_setinv_c_log_reccotizado(lnv_c_log_reccotizado)
	lnv_c_tr_modfmp.of_setvalorConvertidoaRef(lnv_c_log_reccotizado.of_getConverRef()) //Tener acceso a funcionalidad y los datos ya cargados en la entidad para log_recCotizado y no realizar las mismas peticiones
	//lnv_c_tr_modfmp.of_setDsDatosSap(ids_Datos_SAP) //Setear el Ds con los datos para la fusion de datos entre SIS y SAP
	lnv_c_tr_modfmp.of_cargarInfoReportePorModFMP(ls_rec_mod,wf_copiarDwColores(),wf_copiarDwPartes(),wf_copiarDw_Mp(),dw_mpinicial, dw_partesinicial)
	/*=================================================================================*/
	
	//Limpiar memoria 
	IF IsValid(lnv_c_log_reccotizado) THEN 
		Destroy lnv_c_log_reccotizado
	END IF 
	
	IF IsValid(lnv_c_tr_modfmp) THEN 
		Destroy lnv_c_tr_modfmp
	END IF 
RETURN 1
CATCH( Throwable ex1)
	Messagebox("Exepcion:", ex1.getmessage())
	RETURN -1 
End try
end function

public subroutine wf_configpermiopcionesmenu ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 31-03-2016 - FunctionName: wf_configPermiOpcionesMenu
<DESC> Description: Cargar la parametrizacion de lso permisos segun el maestro m_param_perEspxApli</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Segun permisos en el maestro m_param_perEspxApli se habilita guardar o borrar</USAGE>
********************************************************************/
TRY
	invo_seg_muestras.of_setFabrica(il_fabrica)
	invo_seg_muestras.of_setLinea(il_linea)
	invo_seg_muestras.of_setProgramaMatPrima()
	invo_seg_muestras.of_setArrayUsers()
	wf_recinfpermisosxopcion()
	wf_configOpcionesMenu()
CATCH( Throwable ex )
	Rollback;
	ex.setmessage("Error cargando permisos sobre el menu.")
	Throw ex
END TRY
end subroutine

public subroutine wf_recinfpermisosxopcion ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 31-03-2016 - FunctionName: wf_recInfPermisosxopcion
<DESC> Description: Cargar la parametrizacion de los permisos segun el maestro m_param_perEspxApli</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Carga permisos segun opcion </USAGE>
********************************************************************/
TRY
	invo_seg_muestras.of_setnombredataobject('d_sq_gr_m_param_perespxapli')
	invo_seg_muestras.of_recInfPermisosXOpcion()
CATCH( Throwable ex )
	Rollback;
	ex.setmessage("Error Recuperando permisos x opci$$HEX1$$f300$$ENDHEX$$n.")
	Throw ex
END TRY
end subroutine

public subroutine wf_configopcionesmenu ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 31-03-2016 - FunctionName: wf_configOpcionesMenu
<DESC> Description: Cargar la parametrizacion de los permisos segun el maestro m_param_perEspxApli</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Segun permisos en el maestro m_param_perEspxApli se habilita guardar o borrar</USAGE>
********************************************************************/
m_mat_prima_muestra lm_menu
TRY	
	lm_menu = THIS.menuid
	IF invo_seg_muestras.of_configOpcionGuardar() THEN 
		//Habilitar opcion Guardar
		lm_menu.m_archivo.m_guardar.Enabled = True
		cb_2.Enabled = True
	ELSE 
		//Deshabilitar opcion en el menu
		lm_menu.m_archivo.m_guardar.Enabled = False
		cb_2.Enabled = False
	END IF 
	
	IF invo_seg_muestras.of_configOpcionGuardarComo() THEN 
		//Habilitar opcion Guardar Como
		lm_menu.m_archivo.m_guardarcomo.Enabled = True
	ELSE 
		//Deshabilitar opcion en el menu
		lm_menu.m_archivo.m_guardarcomo.Enabled = False
	END IF 
	
CATCH( Throwable ex )
	Rollback;
	ex.setmessage("Error configurando opciones en el Menu.")
	Throw ex
END TRY
end subroutine

public function uo_dsbase wf_copiardwcolores ();/***********************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : wf_copiarDwColores
<DESC> Description: Copiar informacion del dw de colores para luego ser filtrada por solo aquellos que estan en Pdn</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> copia de dw de colores </USAGE>
********************************************************************/
Long	 ll_filas

uo_dsbase			lds_copiaColores
lds_copiaColores	= CREATE uo_dsbase		
lds_copiaColores.dataobject = dw_colores.DataObject

Exception ex
ex = create Exception
Try
	ll_filas = dw_colores.rowcount()
	IF dw_colores.rowscopy(1,ll_filas , Primary!, lds_copiaColores, 1, Primary!) < 0 THEN 
		ex.setmessage('Ocurrio un error al copiar el set de datos de los colores de la Fmp')
		Throw ex
	END IF 
	RETURN lds_copiaColores
CATCH( Throwable ex1)
	Throw ex1
End try
end function

public function uo_dsbase wf_copiardw_mp ();/***********************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : wf_copiarDwColores
<DESC> Description: Copiar informacion del dw de colores para luego ser filtrada por solo aquellos que estan en Pdn</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> copia de dw del detalle de la materia prima al presionar el guardar</USAGE>
Nota el dataobject del dw tiene por defecto el filtro co_color = 90 
********************************************************************/
Long		ll_filas
String	ls_filtroAnt

uo_dsbase			lds_mp
lds_mp				= CREATE uo_dsbase		
lds_mp.dataobject = tab_1.tabpage_1.dw_mp.DataObject

Exception ex
ex = create Exception
Try
	//Capturar filtro anterior, limpiar filtro, copiar set de datos y aplicar filtro anterior 
	ls_filtroAnt = tab_1.tabpage_1.dw_mp.Describe("Datawindow.Table.Filter")
	IF ls_filtroAnt = '?' THEN ls_filtroAnt = ''
	tab_1.tabpage_1.dw_mp.SetFilter('')
	tab_1.tabpage_1.dw_mp.Filter()
	tab_1.tabpage_1.dw_mp.Sort() 	
	
	ll_filas = tab_1.tabpage_1.dw_mp.rowcount()
	IF ll_filas = 0 THEN 
		//Si no tiene partes siga sin mostrar mensaje 
	ELSEIF tab_1.tabpage_1.dw_mp.rowscopy(1,ll_filas , Primary!, lds_mp, 1, Primary!) < 0 THEN 
		ex.setmessage('Ocurrio un error al copiar el set de datos de los colores de la Fmp')
		Throw ex
	END IF 

	tab_1.tabpage_1.dw_mp.SetFilter(ls_filtroAnt)
	tab_1.tabpage_1.dw_mp.Filter()
	tab_1.tabpage_1.dw_mp.Sort() 	
	
	RETURN lds_mp
CATCH( Throwable ex1)
	Throw ex1
End try
end function

public function uo_dsbase wf_copiardwpartes ();/***********************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : wf_copiarDwPartes
<DESC> Description: Copiar informacion del dw de partes para luego ser filtrada </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> copia de dw de colores al presionar el guardar</USAGE>
********************************************************************/
Long	 ll_filas

uo_dsbase			lds_copiaPartes
lds_copiaPartes	= CREATE uo_dsbase		
lds_copiaPartes.dataobject = dw_partes.DataObject

Exception ex
ex = create Exception
Try
	ll_filas = dw_partes.rowcount()
	IF ll_filas = 0 THEN 
		//Si no tiene partes siga sin mostrar mensaje 
	ELSEIF dw_partes.rowscopy(1,ll_filas , Primary!, lds_copiaPartes, 1, Primary!) < 0 THEN 
		ex.setmessage('Ocurrio un error al copiar el set de datos de partes de la Fmp')
		Throw ex
	END IF 
	RETURN lds_copiaPartes
CATCH( Throwable ex1)
	Throw ex1
End try
end function

public subroutine wf_cargavalorcampoenpdn ();/********************************************************************
SA55583 - Ceiba/jjmonsal - 21-09-2016 FunctionName : wf_CargaValorCampoEnPdn
<DESC> Description: Por cada color verificar por referencia - talla - color si esta en produccion o NO</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS>
********************************************************************/
Long							ll_color, ll_fila, ll_filas, ll_valorCampoEnPdn
n_cst_tb_ordenprevfab	lonv_tb_ordenprevfab
n_cst_llamado_sap			lonv_llamado_sap
Exception 	ex

Try
	ex 						= CREATE Exception
	lonv_tb_ordenprevfab	= CREATE n_cst_tb_ordenprevfab
	lonv_llamado_sap		= CREATE n_cst_llamado_sap
	
	lonv_tb_ordenprevfab.of_CargarTransaccionalDB2()	
	lonv_tb_ordenprevfab.of_PreparaAmbRecuperarInformacionDS()
	
	ll_filas = dw_colores.RowCount()
	
	FOR ll_fila = 1 TO ll_filas
		ll_color			= dw_colores.getitemNumber(ll_fila,'co_color')
		lonv_tb_ordenprevfab.of_RecuperarInformacionDS(il_referencia,il_talla,ll_color )
		IF lonv_tb_ordenprevfab.of_CargaValorCampoEnPdn() THEN 
			ll_valorCampoEnPdn = 1
			wf_PintarCheckCampoEnPDN(ll_fila)
		ELSE //Replicar Indicando que no esta en produccion en la FMP
			ll_valorCampoEnPdn = 0
		END IF
		//Para que Replicar en Muestra Basica por cada color si la logica al recuperar la informacion tambien se implemento en Muestra Basica
		//lonv_tb_ordenprevfab.of_ReplicarCambiosMuestraBasica(ll_valorCampoEnPdn,il_fabrica,il_linea,il_muestra,il_talla,ll_color)
	NEXT
	THIS.wf_copiarsetdatossap( lonv_tb_ordenprevfab.of_getDatosSap( ) )
	lonv_tb_ordenprevfab.of_DestruirTransaccional()
	
Catch(Exception ex1)
	Throw ex1
End Try
end subroutine

public subroutine wf_pintarcheckcampoenpdn (readonly long al_fila);/********************************************************************
SA55583 - Ceiba/jjmonsal - 21-09-2016 FunctionName : wf_PintarCheckCampoEnPDN
<DESC> Description: Pintar checkeado el campo en produccion, por defecto no aparece checkeado
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS>
********************************************************************/
Try
	dw_colores.setitem(al_fila,'sw_enpdn',1)	
Catch(Exception ex1)
	Throw ex1
End Try
end subroutine

public subroutine wf_poblards_iniciales ();/***********************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : wf_PoblarDs_MpInicial
<DESC> Description: Copiar informacion del dw de mp para tener acceso a la imformacion incial y luego poder compararla</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> mp inicial cargaa al recuperar la info </USAGE>
********************************************************************/
Long			ll_filas
Exception	ex
ex = create Exception
Try
	ll_filas = tab_1.tabpage_1.dw_mp.RowCount()
	dw_mpinicial.dataobject = tab_1.tabpage_1.dw_mp.DataObject
	
	IF tab_1.tabpage_1.dw_mp.rowscopy(1,ll_filas , Primary!, dw_mpinicial, 1, Primary!) < 0 THEN 
		ex.setmessage('Ocurrio un error al copiar el set de datos de las mp de la Fmp')
		Throw ex
	END IF 
	
	ll_filas = dw_partes.RowCount()
	dw_partesInicial.dataobject = dw_partes.DataObject
	
	IF dw_partes.rowscopy(1,ll_filas , Primary!, dw_partesInicial, 1, Primary!) < 0 THEN 
		ex.setmessage('Ocurrio un error al copiar el set de datos de las partes de la Fmp')
		Throw ex
	END IF
	
CATCH( Throwable ex1)
	Throw ex1
End try
end subroutine

public subroutine wf_copiarsetdatossap (uo_dsbase ads_datos);/***********************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : wf_copiarSetDatosSAP
<DESC> Description: Copiar informacion del ds SAP </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> mp inicial cargaa al recuperar la info </USAGE>
********************************************************************/
Long			ll_filas
Exception	ex
ex = create Exception
Try
	IF ISVALID(ids_Datos_SAP) THEN 
		DESTROY(ids_Datos_SAP)
	END IF 
	ids_Datos_SAP = create uo_dsbase
	ids_Datos_SAP.Dataobject= 'd_ex_gr_validarnecesidadenpdn'
	ids_Datos_SAP.SetTransobject(n_cst_application.itr_appl)
	
	IF ads_datos.Rowcount() <= 0 THEN RETURN 
	IF ads_datos.rowscopy(1,ads_datos.rowcount() , Primary!, ids_Datos_SAP, 1, Primary!) < 0 THEN 
		ex.setmessage('Ocurrio un error al copiar el set de datos SAP')
		Throw ex
	END IF 

CATCH( Throwable ex1)
	Throw ex1
End try
end subroutine

public function long of_recurso_agrupa (long al_recurso);//////////////////////////////////////////////////////////////////////////
// RENE ARIAS ESPARZA 
// Lunes 24 de Abril de 2017 HORA 10:26:07:039
// SA56239 Fichas de Materia Prima por Grupos de Recursos
// Funci$$HEX1$$f300$$ENDHEX$$n para saber si el recurso est$$HEX2$$e1002000$$ENDHEX$$agrupado o no
//////////////////////////////////////////////////////////////////////////

long ll_cant

SELECT count(*) 
    INTO :ll_cant
    FROM m_recursos_tj
   WHERE ( co_recursoagrupa = :al_recurso ) 
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

public function long of_consultar_recursoagrupa (long al_recurso);//////////////////////////////////////////////////////////////////////////
// RENE ARIAS ESPARZA 
// Lunes 24 de Abril de 2017 HORA 10:37:07:039
// SA56239 Fichas de Materia Prima por Grupos de Recursos
// Funci$$HEX1$$f300$$ENDHEX$$n para consultar el recurso agrupador
//////////////////////////////////////////////////////////////////////////

long ll_recursoagrupa

SELECT co_recursoagrupa 
    INTO :ll_recursoagrupa
    FROM m_recursos_tj
   WHERE ( co_recurso = :al_recurso ) 
	using n_cst_application.itr_appl;
			
			
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If
			
If n_cst_application.itr_appl.SQLcode=100 Then 
	Return 0
End If

RETURN ll_recursoagrupa
end function

on w_materia_prima_muestra_ref.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_mat_prima_muestra" then this.MenuID = create m_mat_prima_muestra
this.st_7=create st_7
this.dw_partesinicial=create dw_partesinicial
this.dw_mpinicial=create dw_mpinicial
this.cb_3=create cb_3
this.em_1=create em_1
this.cb_2=create cb_2
this.cb_foto=create cb_foto
this.dw_colores1_mp=create dw_colores1_mp
this.em_basepeso=create em_basepeso
this.st_5=create st_5
this.dw_verifica_color=create dw_verifica_color
this.dw_colores1=create dw_colores1
this.dw_head_ref=create dw_head_ref
this.rb_un_col=create rb_un_col
this.rb_todos_col=create rb_todos_col
this.dw_partes=create dw_partes
this.dw_colores=create dw_colores
this.tab_1=create tab_1
this.dw_head=create dw_head
this.gb_head=create gb_head
this.gb_color=create gb_color
this.gb_partes=create gb_partes
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_7
this.Control[iCurrent+2]=this.dw_partesinicial
this.Control[iCurrent+3]=this.dw_mpinicial
this.Control[iCurrent+4]=this.cb_3
this.Control[iCurrent+5]=this.em_1
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.cb_foto
this.Control[iCurrent+8]=this.dw_colores1_mp
this.Control[iCurrent+9]=this.em_basepeso
this.Control[iCurrent+10]=this.st_5
this.Control[iCurrent+11]=this.dw_verifica_color
this.Control[iCurrent+12]=this.dw_colores1
this.Control[iCurrent+13]=this.dw_head_ref
this.Control[iCurrent+14]=this.rb_un_col
this.Control[iCurrent+15]=this.rb_todos_col
this.Control[iCurrent+16]=this.dw_partes
this.Control[iCurrent+17]=this.dw_colores
this.Control[iCurrent+18]=this.tab_1
this.Control[iCurrent+19]=this.dw_head
this.Control[iCurrent+20]=this.gb_head
this.Control[iCurrent+21]=this.gb_color
this.Control[iCurrent+22]=this.gb_partes
this.Control[iCurrent+23]=this.gb_2
end on

on w_materia_prima_muestra_ref.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_7)
destroy(this.dw_partesinicial)
destroy(this.dw_mpinicial)
destroy(this.cb_3)
destroy(this.em_1)
destroy(this.cb_2)
destroy(this.cb_foto)
destroy(this.dw_colores1_mp)
destroy(this.em_basepeso)
destroy(this.st_5)
destroy(this.dw_verifica_color)
destroy(this.dw_colores1)
destroy(this.dw_head_ref)
destroy(this.rb_un_col)
destroy(this.rb_todos_col)
destroy(this.dw_partes)
destroy(this.dw_colores)
destroy(this.tab_1)
destroy(this.dw_head)
destroy(this.gb_head)
destroy(this.gb_color)
destroy(this.gb_partes)
destroy(this.gb_2)
end on

event ue_find;call super::ue_find;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 04 de Diciembre de 2002 HORA 17:20:05:156
// 
// Aca se abre la ventana de selecci$$HEX1$$f300$$ENDHEX$$n
//////////////////////////////////////////////////////////////////////////
n_cst_param lo_param

//OpenWithParm(w_opc_mat_prima_muestra_c,is_where)
OpenWithParm(w_opc_mat_prima_muestra_ref,is_where)

lo_param=Message.PowerObjectParm

If Not IsValid(lo_param) Then
	Return 
End If

ib_find = true

SetPointer(HourGlass!)

il_fabrica    =  lo_param.il_vector[1]
il_linea      =  lo_param.il_vector[2]
il_muestra    =  lo_param.il_vector[3]
il_talla      =  lo_param.il_vector[4]
il_tipoprod   =  lo_param.il_vector[5]

il_referencia = lo_param.il_vector[6]
il_diseno = lo_param.il_vector[7]
il_cntopcion = lo_param.il_vector[11]
il_co_muestrario = lo_param.il_vector[8] 

il_fabrica_ref = lo_param.il_vector[9] 
il_linea_ref   = lo_param.il_vector[10] 

is_where      =  lo_param.is_vector[1]

If of_controlMo()<>1 Then
	MessageBox("Advertencia!","La muestra no tiene recursos asignados para tejido en la mano de obra.",StopSign!)
	//of_iniciar()
	Return 
End If

dw_partes.SetRedraw(False)
tab_1.tabpage_1.dw_mp.SetRedraw(False)
of_recuperar()
dw_partes.SetRedraw(True)
tab_1.tabpage_1.dw_mp.SetRedraw(True)





end event

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 18 de Junio de 2003 HORA 16:49:51:442
// 
// 
//////////////////////////////////////////////////////////////////////////
Long			ll_res
String		ls_UNIDAD_PDN,ls_UNIDAD_MUESTRA_FMP
decimal		lde_TAMANO_MUESTRA_FMP
	
ids_muestra_referencia = CREATE n_ds_application
ids_temporadas         = CREATE n_ds_application
//
IF gs_usuario = 'jaceball' OR gs_usuario = 'jccalles' THEN
	cb_3.visible = true
END IF
	

ids_muestra_referencia.of_load('dgr_muestra_referenica')
ids_muestra_referencia.of_conexion(n_cst_application.itr_appl,True)

ids_temporadas.of_load('d_dddw_tb_temporada')
ids_temporadas.of_conexion(n_cst_application.itr_appl,True)
ids_temporadas.Retrieve()

dw_head.SetTransObject(n_cst_application.itr_appl)
dw_head_ref.SetTransObject(n_cst_application.itr_appl)

dw_colores.SetTransObject(n_cst_application.itr_appl)
tab_1.tabpage_1.dw_mp.SetTransObject(n_cst_application.itr_appl)
dw_partes.SetTransObject(n_cst_application.itr_appl)

tab_1.tabpage_3.dw_resumen_mp.SetTransObject(n_cst_application.itr_appl)

tab_1.tabpage_3.dw_mat_prima2.SetTransObject(n_cst_application.itr_appl)

tab_1.tabpage_4.dw_composicion.SetTransObject(n_cst_application.itr_appl)

tab_1.tabpage_5.dw_dt_muestras_fert.SetTransObject(n_cst_application.itr_appl)

tab_1.tabpage_5.dw_dt_muestras_fert.GetChild ( "co_talla_fert", idwc_talla_fert)

tab_1.tabpage_5.dw_dt_muestras_fert.GetChild ( "co_color_fert", idwc_color_fert)

dw_head.GetChild("co_talla",idc_talla)

n_cst_comun lo_c

lo_c.of_loadDddw(idc_talla,-1,-1,-1,n_cst_application.itr_appl)

ll_res=lo_c.of_nombrecentro( 10,12,n_cst_application.itr_appl)

If ll_res=1 Then
	is_nom_centro=lo_c.of_GetString(1)
End If

il_centro=12

//////////////////////////////////////////////////////////////////////////
// Asigno los valores de las constantes
// 
//////////////////////////////////////////////////////////////////////////

ll_res=lo_c.of_valorconstante( "PARTEMP_GEN",n_cst_application.itr_appl )

If ll_res=1 Then
	il_PARTEMP_GEN=Long(lo_c.of_getDecimal(1))
Else
	il_PARTEMP_GEN=999
End If


ll_res=lo_c.of_valorconstante( "COMBINA_GEN",n_cst_application.itr_appl )

If ll_res=1 Then
	il_COMBINA_GEN=Long(lo_c.of_getDecimal(1))
Else
	il_COMBINA_GEN=999
End If

	
ll_res=lo_c.of_valorConstante( "UNIDAD_PDN",n_cst_application.itr_appl )


If ll_res=1 Then
	ls_UNIDAD_PDN=lo_c.of_getString(1)
Else
	MessageBox("Advertencia!","No se pudo determinar la unidad de pdn",StopSign!)
End If

ll_res=lo_c.of_valorConstante( "UNIDAD_MUESTRA_FMP",n_cst_application.itr_appl )

If ll_res=1 Then
	ls_UNIDAD_MUESTRA_FMP=lo_c.of_getString(1)
Else
	MessageBox("Advertencia!","No se pudo determinar la unidad de muestras",StopSign!)
End If

ll_res=lo_c.of_valorConstante( "TAMANO_MUESTRA_FMP",n_cst_application.itr_appl )

If ll_res=1 Then
	lde_TAMANO_MUESTRA_FMP=lo_c.of_getDecimal(1)
Else
	MessageBox("Advertencia!","No se pudo determinar Tama$$HEX1$$f100$$ENDHEX$$o de la muestra.",StopSign!)
End If

ll_res=lo_c.of_factorconversion(ls_UNIDAD_PDN /*string a_origen*/,&
                                ls_UNIDAD_MUESTRA_FMP/*string a_destino*/,&
										  n_cst_application.itr_appl/*transaction a_transaction */)
										  
If ll_res=1 Then
	ide_FACTOR_MUESTRA_A_PDN=lo_c.of_getDecimal(1)
	If lde_TAMANO_MUESTRA_FMP<>0 Then
		ide_FACTOR_MUESTRA_A_PDN/=lde_TAMANO_MUESTRA_FMP
	End If	
Else
	MessageBox("Advertencia!","No se pudo determinar la conversi$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
End If
										  
ids_observacion=create n_ds_application
ids_observacion.DataObject="d_dt_fmp_obs_muestras_ref"
ids_observacion.SetTransObject(n_cst_application.itr_appl)
	
il_calidad = 1	
	
dw_verifica_color.SetTransObject(n_cst_application.itr_appl)	

/***********************************************************
SA54453 - Ceiba/jjmonsal - 31-03-2016
Comentario: Inicializar la controladora para permisos especiales restriccion FMP
***********************************************************/
invo_seg_muestras = CREATE n_cst_seg_muestras 
end event

event ue_save;call super::ue_save;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 12 de Diciembre de 2002 HORA 17:38:39:234
// 
// Guardar los datos
//////////////////////////////////////////////////////////////////////////
Long ll_Res
dw_partes.SetRedraw(False)
tab_1.tabpage_1.dw_mp.SetRedraw(False)
tab_1.tabpage_5.dw_dt_muestras_fert.SetRedraw(False)

If of_validar() <> 1 Then
	dw_partes.SetRedraw(True)
	tab_1.tabpage_1.dw_mp.SetRedraw(True)
	tab_1.tabpage_5.dw_dt_muestras_fert.SetRedraw(true)
	Return
End If

ll_res=of_grabar()

If ll_res<>1 Then
	
	dw_partes.SetRedraw(True)
   tab_1.tabpage_1.dw_mp.SetRedraw(True)
	tab_1.tabpage_5.dw_dt_muestras_fert.SetRedraw(True)


	Return
End If

Commit Using n_cst_application.itr_appl;

ib_cambios=false

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Datos guardados con $$HEX1$$e900$$ENDHEX$$xito.")


of_recuperar()

dw_partes.SetRedraw(True)
tab_1.tabpage_1.dw_mp.SetRedraw(True)
tab_1.tabpage_5.dw_dt_muestras_fert.SetRedraw(True)


end event

event closequery;call super::closequery;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 26 de Diciembre de 2002 HORA 14:23:07:203
// 
// Destroy
//////////////////////////////////////////////////////////////////////////

Destroy ids_observacion

IF IsValid (invo_seg_muestras) THEN //SA54453 - Ceiba/jjmonsal - 31-03-2016
	DESTROY invo_seg_muestras
END IF 
end event

event key;call super::key;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 14 de Abril de 2003 HORA 09:59:43:343
// 
// con control se seleccionan los dw para ganar tiempo
//////////////////////////////////////////////////////////////////////////
//
//Messagebox('Var','key='+String(key)+'~n'+&
//'keyflags='+String(keyflags)+'~n')
long ll_f

IF keyflags = 0 THEN
	
	If Key = KeyF6! Then
		dw_colores.SetFocus()

   ElseIF key = KeyF7! THEN
		tab_1.selectTab(tab_1.tabpage_1)
		ll_f=dw_partes.GetRow()
		If ll_f=dw_partes.RowCount() Then
			dw_partes.triggerEvent("ue_insertrow")
		Else
			dw_partes.ScrollToRow(ll_f+1)
			dw_partes.SetFocus()
		End If
	ELSEIF key = KeyF8! THEN
		tab_1.selectTab(tab_1.tabpage_1)
		tab_1.tabpage_1.dw_mp.SetFocus()
		tab_1.tabpage_1.dw_mp.setColumn("co_producto_mp")
		
	ElseIf  key= KeyF11! Then
		of_doubleClick()
	End If
End If

IF key= KeyF6! And keyflags=2 Then
	tab_1.selectTab(tab_1.tabpage_2)
	tab_1.tabpage_2.dw_observacion.SetFocus()
ElseIF key= KeyF7! And keyflags=2 Then
	tab_1.selectTab(tab_1.tabpage_3)
	tab_1.tabpage_3.cb_1.SetFocus()
	tab_1.tabpage_3.cb_1.TriggerEvent(Clicked!)
ElseIF key= KeyF8! And keyflags=2 Then
	tab_1.selectTab(tab_1.tabpage_5)
	tab_1.tabpage_5.dw_dt_muestras_fert.SetFocus()
//	tab_1.tabpage_5.cb_1.SetFocus()
//	tab_1.tabpage_5.cb_1.TriggerEvent(Clicked!)
ElseIF key= KeyF2! And keyflags=2 Then
	of_buscarProducto()
End If

	



end event

type st_7 from statictext within w_materia_prima_muestra_ref
integer x = 2638
integer y = 1232
integer width = 1920
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 79741120
string text = "Texto rojo : Significa que existen partes de materia prima en estado inactivo"
boolean focusrectangle = false
end type

type dw_partesinicial from datawindow within w_materia_prima_muestra_ref
boolean visible = false
integer x = 3291
integer y = 2532
integer width = 1120
integer height = 252
integer taborder = 130
boolean enabled = false
string title = "ds_partes"
string dataobject = "d_dt_fmp_muestras_c"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_mpinicial from datawindow within w_materia_prima_muestra_ref
boolean visible = false
integer x = 1938
integer y = 2528
integer width = 1298
integer height = 260
integer taborder = 120
boolean enabled = false
string title = "ds_mpInicial"
string dataobject = "d_dt_fmp_detalle_muestras_c"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_materia_prima_muestra_ref
boolean visible = false
integer x = 1179
integer y = 1240
integer width = 370
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Migrar Faltante"
end type

event clicked;open(w_pasar_dll_pdn)


end event

type em_1 from editmask within w_materia_prima_muestra_ref
integer x = 731
integer y = 1232
integer width = 233
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
string mask = "#####"
end type

type cb_2 from commandbutton within w_materia_prima_muestra_ref
integer x = 32
integer y = 1232
integer width = 695
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Copiar colores  a muestrario: "
end type

event clicked;String ls_muestrario
Long ll_res


n_cst_comun 	lo_comun
str_param		lstr_param

IF Trim(String(em_1.text,'')) = '' THEN 
	messagebox('Advertencia','Se debe diligenciar el muestrario a copiar')
	RETURN 1
ELSE
	ls_muestrario = Trim(String(em_1.text,''))
END IF

IF IsNumber(ls_muestrario) THEN
//	IF Long(ls_muestrario) <=  il_co_muestrario THEN
//		MessageBox("Advertencia!","Muestrario no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
//		Return 1
//	END IF
	
	ll_res=lo_comun.of_nombremuestrario( il_fabrica,il_linea,Long(ls_muestrario),n_cst_application.itr_appl)
		
	IF il_fabrica = 0  OR il_linea = 0 THEN
		MessageBox("Advertencia!","Se Debe diligenciar la informaci$$HEX1$$f300$$ENDHEX$$n para poder copiar",StopSign!)
		Return 1
	END IF
	
	If ll_res<>1 Then	
		MessageBox("Advertencia!","Muestrario no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 1
	End If	
	
	lstr_param.a_string1[1] = String(il_muestra)
	lstr_param.a_string1[2] = ls_muestrario	
	lstr_param.a_string1[3] = String(dw_head.Object.co_recurso[1])
	
	lstr_param.a_string1[4] = String(dw_head.Object.co_fabrica[1])
	lstr_param.a_string1[5] = String(dw_head.Object.co_linea[1])
	lstr_param.a_string1[6] = String(dw_head.Object.co_talla[1])
	lstr_param.a_string1[7] = String(dw_head.Object.co_diseno[1])
	lstr_param.a_string1[8] = String(dw_head.Object.co_muestrario[1])
	
	
	OpenWithParm(w_copiar_colores,lstr_param)
ELSE
	MessageBox("Advertencia!","Muestrario no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
	Return 1
END IF
end event

type cb_foto from commandbutton within w_materia_prima_muestra_ref
boolean visible = false
integer x = 1929
integer y = 484
integer width = 343
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Buscar Fotos"
end type

event clicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 25 de Febrero de 2003 HORA 14:37:29:578
// 
// se recupera la informaci$$HEX1$$f300$$ENDHEX$$n
//////////////////////////////////////////////////////////////////////////

long ll_tot,	ll_fila,	ll_muestra
Long ll_return


n_cst_comun  lo_comun
String 	ls_tipoprod, ls_ruta10, ls_ruta20, ls_nombrefoto , ls_muestra,&
			ls_fotomuestra 


 
n_ds_application lds_fotos
lds_fotos = CREATE n_ds_application

lds_fotos.of_load( 'dgr_lista_muestras')

lds_fotos.of_conexion( n_cst_application.itr_appl, TRUE)

ll_tot = lds_fotos.retrieve()

IF ll_tot<0 THEN
	Return -1
END IF

ll_return = lo_comun.of_valorconstante( 'FOTOS10', n_cst_application.itr_appl)
IF (ll_return = -1) THEN
	RETURN -1
ELSEIF (ll_return = 1) THEN
	ls_ruta10 = Trim(lo_comun.of_getstring(1))
	IF Right(ls_ruta10, 1) <> '\' THEN ls_ruta10  = ls_ruta10+"\"
END IF
 
ll_return = lo_comun.of_valorconstante( 'FOTOS20', n_cst_application.itr_appl)
IF (ll_return = -1) THEN
	RETURN -1
ELSEIF (ll_return = 1) THEN
	ls_ruta20 = Trim(lo_comun.of_getstring(1))
	IF Right(ls_ruta20, 1) <> '\' THEN ls_ruta20  = ls_ruta20+"\"
END IF
 
 
FOR ll_fila=1 To ll_tot
	ls_fotomuestra = lds_fotos.GetItemString(ll_fila,"foto_muestra")
	ls_tipoprod		= String(lds_fotos.GetItemNumber(ll_fila,"co_tipoprod"))
	ll_muestra     = lds_fotos.GetItemNumber(ll_fila,"co_muestra")

	IF ( NOT IsNull(ls_fotomuestra) AND Trim(ls_fotomuestra) <> '' ) THEN
		ls_nombrefoto = Trim(ls_fotomuestra)
		IF ls_tipoprod = '10' THEN
			IF FileExists(ls_ruta10+ls_nombrefoto) THEN
				lds_fotos.SetItem(ll_fila,'sw_tienefoto','S')
			END IF
		ELSEIF ls_tipoprod = '20' THEN
			IF FileExists(ls_ruta20+ls_nombrefoto) THEN
				lds_fotos.SetItem(ll_fila,'sw_tienefoto','S')
			END IF

		END IF
	END IF
NEXT

lds_fotos.SetFilter( "sw_tienefoto='S'")
lds_fotos.Filter()
IF lds_fotos.RowCount( ) > 0 THEN
	IF FileExists ("Muestras_con_foto.xls") THEN FileDelete("Muestras_con_foto.xls")
	lds_fotos.SaveAs("Muestras_con_foto.xls", Excel!, True)
END IF

RETURN 1
end event

type dw_colores1_mp from u_dw_application within w_materia_prima_muestra_ref
boolean visible = false
integer x = 1321
integer y = 2520
integer width = 521
integer height = 296
integer taborder = 110
string dataobject = "d_ext_copia_color_mp"
end type

type em_basepeso from editmask within w_materia_prima_muestra_ref
integer x = 1531
integer y = 536
integer width = 247
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
alignment alignment = right!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type st_5 from statictext within w_materia_prima_muestra_ref
integer x = 1536
integer y = 476
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Base Peso"
boolean focusrectangle = false
end type

type dw_verifica_color from u_dw_application within w_materia_prima_muestra_ref
boolean visible = false
integer x = 718
integer y = 2520
integer width = 393
integer height = 260
integer taborder = 100
string dataobject = "d_lista_colores_ref"
end type

type dw_colores1 from u_dw_application within w_materia_prima_muestra_ref
boolean visible = false
integer x = 101
integer y = 2520
integer width = 521
integer height = 292
integer taborder = 70
string dataobject = "d_ext_copia_color"
end type

type dw_head_ref from u_dw_application within w_materia_prima_muestra_ref
integer x = 27
integer y = 480
integer width = 1481
integer height = 160
integer taborder = 80
string dataobject = "d_h_fmp_mue_referencia"
boolean vscrollbar = false
boolean livescroll = false
end type

event doubleclicked;call super::doubleclicked;If Row=0 Then Return

n_cst_param lo_param

//DWObject ldwo_1

//If dwo.name="co_talla" Then
//	lo_param.il_vector[1]=GetItemNumber(1,"co_fabrica")
//	lo_param.il_vector[2]=GetItemNumber(1,"co_linea")
//	lo_param.il_vector[3]=GetItemNumber(1,"co_referencia")
//	lo_param.il_vector[4]=GetItemNumber(1,"co_calidad")
//	
//	OpenWithParm(w_bus_tallas_referencia,lo_param)
//	
//	lo_param=Message.PowerObjectParm
//	
//	If IsValid(lo_param) Then
//		SetText(String(lo_param.il_vector[1]))
//	End If
//End If
//
If dwo.name="co_diseno" Then
	lo_param.il_vector[1]=GetItemNumber(1,"co_fabrica")
	lo_param.il_vector[2]=GetItemNumber(1,"co_linea")
	lo_param.il_vector[3]=GetItemNumber(1,"co_referencia")
	lo_param.il_vector[4]=GetItemNumber(1,"co_talla")
	lo_param.il_vector[5]=GetItemNumber(1,"co_calidad")
	
	OpenWithParm(w_busins_m_disenos,lo_param)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If
End If
//

end event

event getfocus;call super::getfocus;gb_head.of_color(True)
end event

event itemchanged;call super::itemchanged;long ll_dato,ll_res,ll_null
n_cst_comun lo_comun

String ls_dato,ls_null

SetNull(ll_null)
SetNull(ls_null)

If il_err_item_change<>0 Then
	Return 2
End If

If dwo.name="co_diseno" Then
	il_diseno=Long(Data)

	ll_res=lo_comun.of_nombreDiseno(il_fabrica,il_linea,il_referencia,il_talla,&
	                il_calidad,il_diseno,n_cst_application.itr_appl)
	If ll_res=1 Then	
		SetItem(1,"de_diseno",lo_comun.of_getString(1))
	Else
		il_diseno=-1
		MessageBox("Advertencia!","Dise$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	//of_headMod(dwo.name)
End If

end event

event itemfocuschanged;call super::itemfocuschanged;selectText(1,20)
end event

event losefocus;call super::losefocus;gb_head.of_color(False)
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

type rb_un_col from radiobutton within w_materia_prima_muestra_ref
integer x = 2702
integer y = 528
integer width = 462
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "&Un color"
boolean checked = true
end type

event clicked;of_filtrar()
end event

type rb_todos_col from radiobutton within w_materia_prima_muestra_ref
integer x = 2702
integer y = 472
integer width = 832
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "&Todos los colores"
end type

event clicked;of_filtrar()
end event

type dw_partes from u_dw_application within w_materia_prima_muestra_ref
event ue_cambio_partes ( )
integer x = 2619
integer y = 748
integer width = 2016
integer height = 440
integer taborder = 20
string dataobject = "d_dt_fmp_muestras_c"
boolean hscrollbar = true
boolean livescroll = false
end type

event ue_cambio_partes();If tab_1.tabpage_1.dw_mp.RowCount()=0 Then
	tab_1.tabpage_1.dw_mp.PostEvent("ue_insertrow")
End If
tab_1.tabpage_1.dw_mp.SetFocus()
end event

event doubleclicked;call super::doubleclicked;If Row=0 Then Return

n_cst_param lo_param
long ll_tot,i

DWObject ldwo_1

//If dw_mp.rowcount()>0 Then
//	MessageBox("Advertencia!","No puede modificar la parte/combinaci$$HEX1$$f300$$ENDHEX$$n, porque tiene detalle.",StopSign!)
//	Return 
//End If


If dwo.name="co_partemp" Then
	lo_param.il_vector[1]=il_tipoprod
	
	OpenWithParm(w_busins_m_partemp,lo_param)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
		This.SetItem(row,'estado',lo_param.is_vector[1])
	End If
End If


If dwo.name="co_combinacion" Then
	lo_param.il_vector[1]=il_fabrica
	lo_param.il_vector[2]=il_linea
	lo_param.il_vector[3]=il_muestra
	lo_param.il_vector[4]=il_talla
	
	OpenWithParm(w_busins_m_combina_muestras,lo_param)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If
End If

If dwo.name="filaa" Then

	Long ll_cons,ll_f
	
	ll_cons = Long(This.Describe("Evaluate('max(nu_partemp for all)', 0)"))
	
	If IsNull(ll_cons) Then ll_cons=0
	
	ll_cons++
	
//	n_ds_application lds_1
//	lds_1=create n_ds_application
//	lds_1.DataObject=dw_mp.DataObject
//	
//	dw_mp.RowsCopy(1,dw_mp.RowCount(),Primary!,lds_1,1,Primary!)
//	
	super::event ue_insertRow()
	
	ll_f=GetRow()
	
	SetItem(ll_f,"nu_partemp",ll_cons)
	
	il_nu_partemp=ll_cons
	
//	ll_tot=lds_1.RowCount()
	
//	For i=1 To ll_tot
//		lds_1.SetItem(i,"nu_partemp",ll_cons)
//	Next
//	lds_1.RowsCopy(1,lds_1.RowCount(),Primary!,dw_mp,ll_tot,Primary!)
	
//	Destroy lds_1
	
End If

end event

event getfocus;call super::getfocus;gb_partes.of_color(True)
end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 08 de Enero de 2003 HORA 11:59:03:203
// 
// 
//////////////////////////////////////////////////////////////////////////


If il_err_item_change<>0 Then
	Return 2
End If
Long   ll_dato,ll_res,ll_null
String ls_dato

//If dw_mp.rowcount()>0 Then
//	MessageBox("Advertencia!","No puede modificar la parte/combinaci$$HEX1$$f300$$ENDHEX$$n, porque tiene detalle.",StopSign!)
//	Return 2
//End If

n_cst_comun lo_c

SetNull(ll_null)

If dwo.name="co_partemp" Then
	ll_dato=Long(Data)
	ll_res=lo_c.of_nombrepartemp(il_tipoprod,ll_dato,n_cst_application.itr_appl)
	If ll_res<>1 Then
		MessageBox("Advertencia!","Parte no v$$HEX1$$e100$$ENDHEX$$lida",StopSign!)
		Return 2
	End If
	//valida que la parte no este inactiva
	If lo_c.of_getString(2) <> 'A' Then
		MessageBox("Advertencia!","Parte no Activa",StopSign!)
		Return 2
	End If
	SetItem(row,"de_parte_combinacion",lo_c.of_getString(1))
	SetItem(row,"co_combinacion",ll_null)
	This.SetItem(row,'estado',lo_c.of_getString(2))
	
End If

If dwo.name="co_combinacion" Then
	ll_dato=Long(Data)
	ll_res=lo_c.of_nombreCombinaMuestra( il_fabrica,il_linea, il_muestra,&
	                                  il_talla, ll_dato,n_cst_application.itr_appl)
	If ll_res<>1 Then
		MessageBox("Advertencia!","Combinaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida",StopSign!)
		Return 2
	End If
	SetItem(row,"de_parte_combinacion",lo_c.of_getString(1))
	SetItem(row,"co_partemp",il_PARTEMP_GEN)
	
End If

ib_cambios=True

Post Event ue_cambio_partes()
end event

event losefocus;call super::losefocus;gb_partes.of_color(False)
end event

event ue_insertrow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 12 de Diciembre de 2002 HORA 14:23:38:515
// 
// Se asignan los valores ocultos y el consecutivo
//////////////////////////////////////////////////////////////////////////
If dw_head.RowCount()=0 Then
	MessageBox("Advertencia!","Debe especificar los datos generales.",StopSign!)
	Return
End If

If of_existe(1)<>1 Then
	Return
End If

Long ll_cons,ll_f

ll_cons = Long(This.Describe("Evaluate('max(nu_partemp for all)', 0)"))

If IsNull(ll_cons) Then ll_cons=0

ll_cons++

If RowCount()=0 Or GetRow()=RowCount() Then
	super::event ue_insertRow()
	ll_f=GetRow()

	SetItem(ll_f,"nu_partemp",ll_cons)

	il_nu_partemp=ll_cons
Else
	ll_f=InsertRow(GetRow())		
	of_insertarParte()
	il_nu_partemp=ll_f
	SetItem(ll_f,"nu_partemp",ll_f)
	il_nu_partemp=ll_f
	SetRow(ll_f)
	ScrollToRow(ll_f)
	SetColumn(1)
	SetFocus()	
End If
SetColumn("co_partemp")
end event

event ue_deleterow;long ll_parte_old,ll_f,ll_res


If RowCount()=0 Then
	Return
End If

ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Esta seguro de eliminar la fila ?",Question!,YesNo!,2)

If ll_res=2 Then
	Return
End If

ll_f=GetRow()
ll_parte_old=GetItemNumber(ll_f,"nu_partemp")

DeleteRow(0)

of_borra_parte1(ll_parte_old)

//If of_verificar_partemp(ll_parte_old)>0 Then
//	MessageBox("Advertencia!","La parte/combinaci$$HEX1$$f300$$ENDHEX$$n tiene materias primas, no se puede eliminar.",StopSign!)
//	Return 
//End If

of_insertarParte()

of_filtrar()



end event

event ue_dwnprocessenter;if this.AcceptText() < 0 then
  Return 1
end if

if this.GetColumn() = 10 then //descripcion
 if this.GetRow() = this.RowCount() then
	PostEvent("ue_insertrow")
   Return 1
 end if
end if

Send(Handle(this),256,9,Long(0,0))
return 1


end event

event rowfocuschanged;call super::rowfocuschanged;
If currentrow=0 Then Return

il_fila_parte=currentrow

SelectRow(0,False)
SelectRow(currentrow,True)

If dw_colores.RowCount()=0 Then
	Return
End If

If il_fila_parte=0 or il_fila_color=0 Then
	Return
End If

of_filtro(GetItemNumber(il_fila_parte,"nu_partemp"),il_fila_parte,&
			dw_colores.GetItemNumber(il_fila_color,"co_color"),&
			il_fila_color,dw_colores.GetItemNumber(il_fila_color,"co_diseno"))




end event

event sqlpreview;call super::sqlpreview;String ls 
ls = sqlSyntax
end event

type dw_colores from u_dw_application within w_materia_prima_muestra_ref
integer x = 50
integer y = 744
integer width = 2482
integer height = 452
integer taborder = 50
string dataobject = "d_detalle_fmp_mues_ref"
boolean hscrollbar = true
end type

event getfocus;call super::getfocus;gb_color.of_color(True)
end event

event losefocus;call super::losefocus;gb_color.of_color(False)
end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 11 de Abril de 2003 HORA 17:07:05:703
// 
// adicionado para permitir acceder a varios colores al mismo tiempo
//////////////////////////////////////////////////////////////////////////
n_cst_comun lo_comun
Long ll_res,ll_dato,ll_col_old,ll_opc_old,i,ll_muestrario,ll_color



If dwo.name="co_color" Then
	ll_col_old=GetItemNumber(row,"co_color")
	ll_opc_old=GetItemNumber(row,"co_diseno")
	
	If of_verifica_col(ll_col_old,ll_opc_old)>0 Then
		MessageBox("Advertencia!","El color tiene materias primas, no se puede modificar.",StopSign!)
		Return 2
	End If

	il_color=Long(Data)

	IF of_consultar_muestra_col( ) <> 1 THEN
			Return 2
	END IF	

	ll_res=lo_comun.of_nombremuestracolor( il_fabrica,il_linea,il_muestra,il_talla,&
	                                       il_color,n_cst_application.itr_appl)
	If ll_res=1 Then	
//		SetItem(1,"de_color",lo_comun.of_getString(1))
      If IsNull(ll_opc_old) Then
			SetItem(row,"co_diseno",of_opcioncolor(il_color))
			SetItem(row,"cnt_opcion",of_opcioncolor(il_color))
		End If
	Else
		il_color=-1
		MessageBox("Advertencia!","Color no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	
		If row > 1 Then
			of_copiaMpCol1(il_color,ll_opc_old)
		End If
End If

If dwo.name="co_recurso" Then
	ll_dato=Long(Data)
	
	ll_res=lo_comun.of_nombreRecursoTj(ll_dato,n_cst_application.itr_appl)
	
	If ll_res<>1 Then 
		MessageBox("Advertencia!","Recurso no v$$HEX1$$e100$$ENDHEX$$lido",StopSign!)
		Return 2								 
	End If

	SetItem(Row,"de_recurso",lo_comun.of_getString(1))
End If
String ls_dato

If dwo.name="de_co_diseno" Then
	ls_dato=GetItemString(Row,"de_co_diseno")
	If (IsNull(ls_dato) or Trim(ls_dato)="") And row>1 Then
		ll_col_old=GetItemNumber(row,"co_color")
		ll_opc_old=GetItemNumber(row,"co_diseno")
		of_copiaMpCol1(ll_col_old,ll_opc_old)
	End If
End If

If dwo.name="id_peso" Then
	If row<>1 Then
		MessageBox("Advertencia!","S$$HEX1$$f300$$ENDHEX$$lo se puede modificar en la primera fila.",StopSign!)
		Return 2
	End If

	For i=1 To RowCount()
		SetItem(i,"id_peso",data)
	Next
End If


If dwo.name="co_muestrario" Then 
	ll_muestrario=Long(Data)
	
	ll_res=lo_comun.of_nombremuestrario( il_fabrica,il_linea,ll_muestrario,&
	                n_cst_application.itr_appl)
						 
	ll_color = this.getitemNumber(row,"co_color")
	
	If ll_res=1 Then	
		if of_valiar_muestrario_color(ll_muestrario,ll_color) < 0 Then
			Return 2
		End if	
	Else
		MessageBox("Advertencia!","Muestrario no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
end if
end event

event ue_insertrow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 12 de Abril de 2003 HORA 10:58:07:359
// 
// 
//////////////////////////////////////////////////////////////////////////

Long ll_cons,ll_f
String ls_id_peso

super::event ue_insertRow()

ll_f=GetRow()

select first 1 cnt_opcion 
into :il_cntopcion
from h_fmp_muestras
where co_muestrario = :il_co_muestrario
and co_fabrica = :il_fabrica
and co_linea = :il_linea
and co_muestra = :il_muestra
and co_talla = :il_talla
and co_diseno = :il_diseno
using n_cst_application.itr_appl;

SetItem(ll_f,"co_fabrica",il_fabrica)
SetItem(ll_f,"co_linea",il_linea)
SetItem(ll_f,"co_muestra",il_muestra)
SetItem(ll_f,"co_talla",il_talla)
SetItem(ll_f,"co_diseno",il_diseno ) 
SetItem(ll_f,"cnt_opcion",il_diseno ) 
SetItem(ll_f,"co_muestrario",il_co_muestrario ) 
SetItem(ll_f,"co_recurso",dw_head.Object.co_recurso[1])
SetColumn("co_color")

If RowCount()>1 Then
	ls_id_peso=GetItemString(1,"id_peso")
	SetItem(ll_f,"id_peso",ls_id_peso)		
End If


end event

event ue_deleterow;
If RowCount()=0 Then
	Return
End If


Parent.event ue_borra_mp_color()


deleteRow(0)

IF THIS.Rowcount( ) = 0 THEN
		
	DELETE FROM dt_fmp_obs_muestras
	WHERE ( dt_fmp_obs_muestras.co_fabrica = :il_fabrica) 
	AND   dt_fmp_obs_muestras.co_linea = :il_linea
	AND  ( dt_fmp_obs_muestras.co_muestra = :il_muestra) 
	AND  ( dt_fmp_obs_muestras.co_talla = :il_talla ) 
	AND  ( dt_fmp_obs_muestras.co_muestrario = :il_co_muestrario) 
	AND  ( dt_fmp_obs_muestras.co_diseno = :il_diseno)
	USING n_cst_application.itr_appl
	;   
	
	tab_1.tabpage_2.dw_observacion.reset( )
END IF



//se pone en comentario debido a que se quedaban registros malos en la base de datos.

////////////////////////////////////////////////////////////////////////////
//// JUAN FERNANDO VASQUEZ DUQE 
//// Sabado 12 de Abril de 2003 HORA 13:57:07:156
//// 
//// 
////////////////////////////////////////////////////////////////////////////
//long ll_col_old,ll_opc_old,ll_f,ll_res, ll_observaciones, ll_inicio
//
//If RowCount()=0 Then
//	Return
//End If
//
//ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Est$$HEX2$$e1002000$$ENDHEX$$seguro de eliminar el color ?",Question!,YesNo!,2)
//If ll_res=2 Then
//	Return
//End If
//
//
//ll_f=GetRow()
//
//ll_col_old=GetItemNumber(ll_f,"co_color")
//ll_opc_old=GetItemNumber(ll_f,"co_diseno")
//
//of_borra_col1(ll_col_old,ll_opc_old)
////If of_verifica_col(ll_col_old,ll_opc_old)>0 Then
////	MessageBox("Advertencia!","El color tiene materias primas, no se puede eliminar.",StopSign!)
////	Return 
////End If
////
//
//deleteRow(0)
//
//IF THIS.Rowcount( ) = 0 THEN
//		
//	DELETE FROM dt_fmp_obs_muestras
//	WHERE ( dt_fmp_obs_muestras.co_fabrica = :il_fabrica) 
//	AND   dt_fmp_obs_muestras.co_linea = :il_linea
//	AND  ( dt_fmp_obs_muestras.co_muestra = :il_muestra) 
//	AND  ( dt_fmp_obs_muestras.co_talla = :il_talla ) 
//	AND  ( dt_fmp_obs_muestras.co_muestrario = :il_co_muestrario) 
//	AND  ( dt_fmp_obs_muestras.co_diseno = :il_diseno)
//	USING n_cst_application.itr_appl
//	;   
//	
//	tab_1.tabpage_2.dw_observacion.reset( )
//END IF
//
//Long 		ll_filas
//DataStore				lds_borrado_mt
//lds_borrado_mt		= 	CREATE DataStore
//
//lds_borrado_mt.DataObject = 'd_dt_fmp_detalle_muestras_borrar'
//lds_borrado_mt.SetTransObject(n_cst_application.itr_appl)
//
////ll_filas = lds_borrado_mt.Retrieve(il_fabrica, il_linea, il_muestra, il_talla, il_diseno, il_co_muestrario, ll_col_old)
////
////Do While ll_filas>0 
////	lds_borrado_mt.DeleteRow(0)
////	ll_filas = lds_borrado_mt.rowcount( )
////Loop
////
////ll_filas = lds_borrado_mt.Update( )
//
////MessageBox('','')
//
//
//
//
//
end event

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 30 de Mayo de 2003 HORA 09:46:04:078
// 
// selecciona color
//////////////////////////////////////////////////////////////////////////
n_cst_param lo_param
String ls_protect

If dwo.name="co_color" Then
	
	lo_param.il_vector[1]=GetItemNumber(1,"co_fabrica")
	lo_param.il_vector[2]=GetItemNumber(1,"co_linea")
	lo_param.il_vector[3]=GetItemNumber(1,"co_muestra")
	lo_param.il_vector[4]=GetItemNumber(1,"co_talla")

	OpenWithParm(w_bus_colores_muestra,lo_param)

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

event ue_dwnprocessenter;if this.AcceptText() < 0 then
  Return 1
end if

if this.GetColumn() = 10 then //descripcion
 if this.GetRow() = this.RowCount() then
	PostEvent("ue_insertrow")
   Return 1
 end if
end if

Send(Handle(this),256,9,Long(0,0))
return 1


end event

event rowfocuschanged;call super::rowfocuschanged;If currentrow=0 Then Return

il_fila_color=currentrow

SelectRow(0,False)
SelectRow(il_fila_color,True)

If dw_partes.RowCount()=0 Then Return

If il_fila_parte=0 or il_fila_color=0 Then
	Return
End If


of_filtro(dw_partes.GetItemNumber(il_fila_parte,"nu_partemp"),il_fila_parte,&
			dw_colores.GetItemNumber(il_fila_color,"co_color"),&
			il_fila_color,GetItemNumber(il_fila_color,"co_diseno"))
end event

event clicked;Long ll_col_old, ll_opc_old,ll_res, ll_muestrario //,il_color

If dwo.name="b_copiadorcol" Then
	ll_col_old=GetItemNumber(row,"co_color")
	ll_opc_old=GetItemNumber(row,"co_diseno")
	il_color = GetItemNumber(row,"co_color")
	ll_muestrario = GetItemNumber(row,"co_muestrario")
	
	If of_verifica_col(ll_col_old,ll_opc_old)>0 Then
		MessageBox("Advertencia!","El color tiene materias primas, no se puede modificar.",StopSign!)
		Return 2
	End If
	
	If this.rowcount() > 1 Then
		if of_valiar_muestrario_color(ll_muestrario, il_color) <> 1 Then
			Return 2
		End if							
		of_copiaMpCol1(il_color,ll_opc_old)
	End If
End If

end event

event rbuttondown;dwItemStatus l_status
long ll_resp, ll_muestrario, ll_co_recurso, ll_diseno
String ls_id_peso
Accepttext()
IF row > 0 THEN
	l_status = this.GetItemStatus(row, 0, Primary!)
	IF l_status <>	New! AND l_status <> NewModified! THEN
		
			il_color = GetItemNumber(row,"co_color")
			ll_muestrario = GetItemNumber(row,"co_muestrario")
			ll_co_recurso = GetItemNumber(row,"co_recurso")
			ll_diseno = GetItemNumber(row,"co_diseno")
			ls_id_peso = GetitemString(row,"id_peso")
			
			ll_resp = Messagebox("Advertencia","Desea pasar el color a nivel de referencia",Question!,YesNo!,2)
		
		IF ll_resp = 1 THEN
			IF of_validar_muestrario_x_col(ll_muestrario, il_color) > 1 THEN
				IF of_crear_color_en_referencia(ll_muestrario, il_color,ll_diseno,ll_co_recurso,ls_id_peso) = 1 THEN
					Messagebox("Notificaci$$HEX1$$f300$$ENDHEX$$n","El color fue creado a nivel de referencia")
				END IF	
			END IF	
		END IF
	END IF	
END IF	
end event

event sqlpreview;call super::sqlpreview;string ls
ls = sqlSyntax
end event

type tab_1 from tab within w_materia_prima_muestra_ref
event create ( )
event destroy ( )
integer x = 27
integer y = 1364
integer width = 4402
integer height = 1120
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
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
end on

event getfocus;//If SelectedTab=1 Then
//	tab_1.tabpage_1.dw_partes.SetFocus()
//	If tab_1.tabpage_1.dw_partes.RowCount()=0 Then
//		tab_1.tabpage_1.dw_partes.triggerEvent("ue_insertrow")
//	End If
//End If
end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 4366
integer height = 1000
long backcolor = 80269524
string text = "Materia prima"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
st_2 st_2
dw_mp dw_mp
gb_mp gb_mp
end type

on tabpage_1.create
this.st_2=create st_2
this.dw_mp=create dw_mp
this.gb_mp=create gb_mp
this.Control[]={this.st_2,&
this.dw_mp,&
this.gb_mp}
end on

on tabpage_1.destroy
destroy(this.st_2)
destroy(this.dw_mp)
destroy(this.gb_mp)
end on

type st_2 from statictext within tabpage_1
integer x = 73
integer y = 848
integer width = 2638
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Busqueda md (Ctrl+F2)   Mp una parte en todos los col (Ctrl+F3)   Copia peso todas las partes en todos los col (Ctrl+F4)"
boolean focusrectangle = false
end type

type dw_mp from u_dw_application within tabpage_1
event ue_move_co_prod ( )
integer x = 55
integer y = 72
integer width = 4251
integer height = 768
integer taborder = 40
string dataobject = "d_dt_fmp_detalle_muestras_c"
boolean hscrollbar = true
boolean livescroll = false
end type

event ue_move_co_prod();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 07 de Mayo de 2003 HORA 16:47:50:468
// 
// mueve el cursor a co_producto_mp
//////////////////////////////////////////////////////////////////////////
SetColumn("co_producto_mp")
end event

event getfocus;call super::getfocus;gb_mp.of_color(true)
end event

event itemchanged;call super::itemchanged;Decimal	lde_peso,lde_p1,lde_pf
long		ll_dato,ll_res, ll_null
String	ls_Dato, ls_null
uo_dsbase lds_color_mp

If il_err_item_change<>0 Then
	Return 2
End If

n_cst_comun lo_c

SetNUll(ll_null)
SetNull(ls_null)

If dwo.name="co_producto_mp" Then
	
	SetItem(row,"de_producto",lo_c.of_getString(1))	
	
	SetItem(row,"co_matiz_mp",ll_null)
	SetItem(row,"co_caracteristi_mp",ll_null)
	SetItem(row,"co_color_mp",ll_null)
	SetItem(row,"co_proveedor",99)
	SetItem(row,"de_proveedor",ls_null)
	SetItem(row,"de_color",ls_null)
	
	ll_dato=Long(Data)
	ll_res=lo_c.of_nombreMatPrima(ll_dato,n_cst_application.itr_appl)
	If ll_res<>1 Then
		MessageBox("Advertencia!","Producto no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		IF LEN(String(ll_dato,'')) > 8 THEN 
			This.Object.co_matiz_mp[Row] = 0
			This.Object.co_caracteristi_mp[Row] = 0
		END IF
		Return 2
	End If

	SetItem(row,"de_producto",lo_c.of_getString(1))
	
	
	SetItem(row,"co_matiz_mp",ll_null)
	SetItem(row,"co_caracteristi_mp",ll_null)
	SetItem(row,"co_color_mp",ll_null)
	SetItem(row,"co_proveedor",99)
	SetItem(row,"de_proveedor",ls_null)
	
	IF LEN(String(ll_dato,'')) > 8 THEN 
		This.Object.co_matiz_mp[Row] = 0
		This.Object.co_caracteristi_mp[Row] = 0
	END IF
	
end If

If dwo.name="peso_mp" Then
	lde_peso=Dec(Data)
	If ide_FACTOR_MUESTRA_A_PDN<>0 Then
		SetItem(row,"peso_muestra",lde_peso/ide_FACTOR_MUESTRA_A_PDN)
	End If
End If
/*
* ===========================================================================
* MODIFICADO 
* ---------------------------------------------------------------------------
* Se calcula el peso as$$HEX1$$ed00$$ENDHEX$$:
* De la muestra se trajo la base del peso; si es ropa, debe dividir por este
* valor el peso digitado, en cada una de las partes y este c$$HEX1$$e100$$ENDHEX$$lculo es el que
* se almacena como peso de una prenda.
* 
* Para calcetines se digita el peso de 6 unidades e internamente hace el 
* c$$HEX1$$e100$$ENDHEX$$lculo para una docena
* ===========================================================================
If dwo.name="peso_muestra" Then
	lde_peso=Dec(Data)
	If ide_FACTOR_MUESTRA_A_PDN<>0 Then
		SetItem(row,"peso_mp",lde_peso*ide_FACTOR_MUESTRA_A_PDN)
	End If
End If
*/
If dwo.name="peso_muestra" Then
	lde_peso=Dec(Data)
	// Si es Ropa se divide
	IF (il_tipoprod = 20)  THEN
		IF (il_basepeso <> 0) THEN
			SetItem(row,"peso_mp",lde_peso/il_basepeso)
		END IF
	ELSE
		If ide_FACTOR_MUESTRA_A_PDN <> 0 Then
			SetItem(row,"peso_mp",lde_peso*ide_FACTOR_MUESTRA_A_PDN)
		End If
	END IF
End If

If dwo.name="calidad_mp" Then
	SetItem(row,"co_matiz_mp",ll_null)
	SetItem(row,"co_caracteristi_mp",ll_null)
	//SetItem(row,"co_color_mp",ll_null)
	SetItem(row,"co_proveedor",99)
	SetItem(row,"de_proveedor",ls_null)
	
End If

If dwo.name="co_matiz_mp" Then
	SetItem(row,"co_caracteristi_mp",ll_null)
	//SetItem(row,"co_color_mp",ll_null)
	SetItem(row,"co_proveedor",99)
	SetItem(row,"de_proveedor",ls_null)
End If

If dwo.name="co_caracteristi_mp" Then
	//SetItem(row,"co_color_mp",ll_null)
	SetItem(row,"co_proveedor",99)
	SetItem(row,"de_proveedor",ls_null)
End If

If dwo.name="co_color" Then
	SetItem(row,"co_proveedor",99)
	SetItem(row,"de_proveedor",ll_null)
End If

//SA55169 - descripcion del color 
//FACL - SA56334 - Se optimiza Query y se consulta directamente el color
If dwo.name="co_color_mp" Then
	this.accepttext( )
	lds_color_mp = create uo_dsbase
	lds_color_mp.dataobject = 'd_gr_color_mat_prima_parm' // 'd_color_mat_prima'
	lds_color_mp.SetTransObject(n_cst_application.itr_appl)
	
	ll_res = lds_color_mp.of_Retrieve(GetItemNumber(row,"co_fabrica_mp"), GetItemNumber(row,"co_producto_mp"),&
									GetItemNumber(row,"calidad_mp"), GetItemNumber(row,"co_matiz_mp"),&
									GetItemNumber(row,"co_caracteristi_mp"), &
									This.GetItemNumber( Row,"co_color_mp") )
	

	//lds_color_mp.SetFilter(' co_color = '+String(GetItemNumber(row,"co_color_mp"))+' ')
	//ll_res = lds_color_mp.Filter( )
	
	//	ll_res = lo_c.of_nombrecolor_mp(THIS.getitemnumber(row,'co_fabrica'),THIS.getitemnumber(row,'co_producto_mp'),THIS.getitemnumber(row,'co_color_mp'),n_cst_application.itr_appl)
	
	If ll_res <= 0 Or lds_color_mp.rowcount() <= 0 Then
		MessageBox("Advertencia!","color no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		THIS.SetItem(row,"co_color_mp",ll_null)
		THIS.SetItem(row,"de_color",ls_null)
		Return 2
	End If
	THIS.SetItem(row,"de_color",String(lds_color_mp.getItemString(1,'de_color')))
End If

If dwo.name="co_producto_mp" or dwo.name="calidad_mp" or &
   dwo.name="co_matiz_mp" or dwo.name="co_caracteristi_mp" or &
	dwo.name="co_color_mp" or dwo.name="co_proveedor" Then
	
	If of_verificarproductomp(dwo.name,row,data)<>1 Then
		PostEvent("ue_move_co_prod")
		Return 2
	End If

End If	
		
If dwo.name="co_proveedor" Then
	ll_dato=Long(data)
	ll_res=lo_c.of_nombreProveedor(ll_dato,n_cst_application.itr_appl)
	If ll_res=1 Then
		SetItem(Row,"de_proveedor",lo_c.of_getString(1))
	End If
End If

end event

event losefocus;call super::losefocus;gb_mp.of_color(false)
end event

event ue_insertrow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 20 de Enero de 2003 HORA 12:00:01:421
// 
// Asigna valores para los campos que estan ocultos
//////////////////////////////////////////////////////////////////////////

Long ll_cons,ll_f, ll_muestrario

If rb_todos_col.Checked  or dw_colores.RowCount()=0 Then
	MessageBox("Advertencia!","Debe seleccionar un color.",StopSign!)
	Return
End If

If dw_partes.RowCount()=0 Then
	MessageBox("Advertencia!","Debe especificar la parte.",StopSign!)
	Return
End If
/*
	MODIFICADO: Octubre 01 de 2009 - gagudelo - ohlondon 
	ll_cons = Long(This.Describe("Evaluate('max(nu_mp for all)', 0)"))
	
	If IsNull(ll_cons) Then ll_cons=0
	
	ll_cons++
*/
If il_color=-1 Then
	MessageBox("Advertencia!","Debe especificar el color.",StopSign!)
	Return
End If

If il_nu_partemp=-1 Then
	MessageBox("Advertencia!","Debe especificar la parte.",StopSign!)
	Return
End If

//Probar 2009/08/05 Esta validaci$$HEX1$$f300$$ENDHEX$$n se adiciona para los casos en los que un color sea creado desde cero 
//sin copiarlo de otro y esta validacion se hacia solo en el copiador
ll_muestrario = dw_colores.GetItemNumber(il_fila_color,"co_muestrario")
if this.rowcount() = 0 Then
	if of_valiar_muestrario_color(ll_muestrario, il_color) <> 1 Then
		Return
	End if							
End if	
////////////////////////////////////////////////////////////////////////
This.SetRedraw(FALSE)
//super::event ue_insertRow()
//-----------------------------

//If RowCount()=0 Or GetRow()=RowCount() Then
	super::event ue_insertRow()
	ll_f=GetRow()
//Else
//	ll_f=InsertRow(GetRow())		
//	This.ScrollToRow(ll_f)
//	This.SetColumn(1)
//	This.SetFocus()
//End If

//-----------------------------

SetItem(ll_f,"nu_mp",ll_cons)
SetItem(ll_f,"nu_partemp",il_nu_partemp)

SetItem(ll_f,"co_fabrica",il_fabrica)
SetItem(ll_f,"co_linea",il_linea)
SetItem(ll_f,"co_muestra",il_muestra)
SetItem(ll_f,"co_talla",il_talla)
SetItem(ll_f,"co_color",il_color)
SetItem(ll_f,"co_diseno",il_opcion)
SetItem(ll_f,"cnt_opcion",il_opcion)
//SetItem(ll_f,"co_tipoprod",         GetItemNumber(ll_f -1,"co_tipoprod"))	
SetItem(ll_f,"co_tipoprod",  il_tipoprod )	

IF ll_f>1 THEN
	
	SetItem(ll_f,"co_fabrica_mp",       GetItemNumber(ll_f -1,"co_fabrica_mp"))	
	SetItem(ll_f,"co_producto_mp",      GetItemNumber(ll_f -1,"co_producto_mp"))	
	SetItem(ll_f,"calidad_mp",          GetItemNumber(ll_f -1,"calidad_mp"))	
	SetItem(ll_f,"co_matiz_mp",         GetItemNumber(ll_f -1,"co_matiz_mp"))	
	SetItem(ll_f,"co_caracteristi_mp",  GetItemNumber(ll_f -1,"co_caracteristi_mp"))	
	SetItem(ll_f,"co_color_mp",         GetItemNumber(ll_f -1,"co_color_mp"))	
	SetItem(ll_f,"co_centro",           GetItemNumber(ll_f -1,"co_centro"))	
	SetItem(ll_f,"co_partemp",          GetItemNumber(ll_f -1,"co_partemp"))	
	SetItem(ll_f,"co_combinacion",      GetItemNumber(ll_f -1,"co_combinacion"))	
	SetItem(ll_f,"peso_mp",             GetItemDecimal(ll_f -1,"peso_mp"))   
	SetItem(ll_f,"nu_conos",            GetItemNumber(ll_f -1,"nu_conos"))	
	SetItem(ll_f,"de_producto",   	   GetItemString(ll_f -1,"de_producto"))	
	SetItem(ll_f,"peso_muestra",        GetItemDecimal(ll_f -1,"peso_muestra"))	
	SetItem(ll_f,"co_proveedor",        GetItemNumber(ll_f -1,"co_proveedor"))	
	SetItem(ll_f,"mp_lote",             GetItemString(ll_f -1,"mp_lote"))	
	SetItem(ll_f,"de_proveedor",        GetItemString(ll_f -1,"de_proveedor"))	
	SetItem(ll_f,"alimentador",         GetItemString(ll_f -1,"alimentador"))	
  	SetItem(ll_f,"portahilo",           GetItemString(ll_f -1,"portahilo"))	
	SetItem(ll_f,"enhebrado",           GetItemString(ll_f -1,"enhebrado"))	
	SetItem(ll_f,"posicion",            GetItemString(ll_f -1,"posicion"))	
	SetItem(ll_f,"tension",             GetItemString(ll_f -1,"tension"))
ELSE
		
	SetItem(ll_f,"co_partemp",il_co_parte)
	SetItem(ll_f,"co_combinacion",il_co_combinacion)
	SetItem(ll_f,"co_tipoprod",il_tipoprod)
	
	//////////////////////////////////////////////////////////////////////////
	// JUAN FERNANDO VASQUEZ DUQE 
	// Martes 8 de Abril de 2003 HORA 15:52:26:687
	// 
	// VALORES POR DEFECTO QUE SE DEFINIERON CON LORENA
	//////////////////////////////////////////////////////////////////////////
	/***********************************************************
	SA53303 - Ceiba - 22-07-2015 -- (ll_f,"co_proveedor",999)
	Comentario: Se modifica el proveedor generico al 99 debido a la Falla 53303
	Se detecto que al recuperar la informacion de m_prod_proveedor con el dataobject d_m_prod_proveedor
	se tiene un criterio de filtro ( co_proveedor = XXXX or ( XXXX = 99) ) y si el generico es 99 siempre se cumplira la segunda condicion 
	***********************************************************/
	SetItem(ll_f,"co_proveedor",99)
	SetItem(ll_f,"mp_lote",' ')
	
	SetItem(ll_f,"co_fabrica_mp",2)
	
	Setcolumn("co_producto_mp")
	//////////////////////////////////////////////////////////////////////////
	// Se coloca por defecto el centro de tejido
	// 
	//////////////////////////////////////////////////////////////////////////
	
	SetItem(ll_f,"co_centro",12)
END IF
 
FOR ll_f = 1 to RowCount()
	SetItem(ll_f,"nu_mp",ll_f)
NEXT

This.SetRedraw(TRUE)
SetFocus()
SetColumn('co_producto_mp')

end event

event sqlpreview;call super::sqlpreview;String ls
ls = sqlSyntax

end event

event doubleclicked;call super::doubleclicked;Long	ll_res

If Row=0 Then Return

n_cst_param lo_param
n_cst_comun lo_c
DWObject		ldwo_1

If dwo.name="co_producto_mp" Then
	lo_param.il_vector[1]=il_tipoprod
	
	Open(w_materia_prima)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))		
		
		IF LEN(String(lo_param.il_vector[1],'')) > 8 THEN 
			This.Object.co_matiz_mp[Row] = 0
			This.Object.co_caracteristi_mp[Row] = 0
		END IF	
		
	End If

End If

If dwo.name="co_matiz_mp" Then
	lo_param.il_vector[1]=GetItemNumber(row,"co_fabrica_mp")
	lo_param.il_vector[2]=GetItemNumber(row,"co_producto_mp")
	lo_param.il_vector[3]=GetItemNumber(row,"calidad_mp")
	
	OpenWithParm(w_matiz,lo_param)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If
End If

If dwo.name="co_caracteristi_mp" Then
	lo_param.il_vector[1]=GetItemNumber(row,"co_fabrica_mp")
	lo_param.il_vector[2]=GetItemNumber(row,"co_producto_mp")
	lo_param.il_vector[3]=GetItemNumber(row,"calidad_mp")
	lo_param.il_vector[4]=GetItemNumber(row,"co_matiz_mp")	
	
	OpenWithParm(w_caracteristica_mp,lo_param)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If
End If

If dwo.name="co_color_mp" Then
	lo_param.il_vector[1]=GetItemNumber(row,"co_fabrica_mp")
	lo_param.il_vector[2]=GetItemNumber(row,"co_producto_mp")
	lo_param.il_vector[3]=GetItemNumber(row,"calidad_mp")
	lo_param.il_vector[4]=GetItemNumber(row,"co_matiz_mp")
	lo_param.il_vector[5]=GetItemNumber(row,"co_caracteristi_mp")
	
	OpenWithParm(w_color_mp,lo_param)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		// Verifica si el estado del color es descontinuado "D"
		IF lo_param.is_vector[1] = 'D' THEN
			// Si es "D", entonces se verifica si se quiere seleccionar con ese estado
			IF MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "$$HEX1$$bf00$$ENDHEX$$Seguro que desea seleccionar un color descontinuado?", Question!,YesNo!, 2) = 1 THEN
				SetText(String(lo_param.il_vector[1]))
			END IF
		ELSE
			// Si esta activo, no se verifica, solo se selecciona.
			SetText(String(lo_param.il_vector[1]))
			THIS.setItem(Row,'de_color',lo_param.is_vector[2])
			//this.accepttext( )
		END IF	
	
	End If
End If

If dwo.name="co_proveedor" Then
	lo_param.il_vector[1]=GetItemNumber(row,"co_fabrica_mp")
	lo_param.il_vector[2]=GetItemNumber(row,"co_producto_mp")
	lo_param.il_vector[3]=GetItemNumber(row,"calidad_mp")
	lo_param.il_vector[4]=GetItemNumber(row,"co_matiz_mp")
	lo_param.il_vector[5]=GetItemNumber(row,"co_caracteristi_mp")	
	lo_param.il_vector[6]=GetItemNumber(row,"co_color_mp")	
	
	OpenWithParm(w_bus_m_proveedores_mp,lo_param)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If
End If

end event

event ue_dwnprocessenter;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 15 de Marzo de 2003 HORA 09:34:53:812
// 
// 
//////////////////////////////////////////////////////////////////////////

Integer li_columna

IF il_tipoprod = 10 THEN
	li_columna = 31
ELSE
	li_columna = 34
END IF


if this.AcceptText() < 0 then
  Return 1
end if
//28 esmp lote
if this.GetColumn() = li_columna then 
	if this.GetRow() = this.RowCount() then
		PostEvent("ue_insertrow")
   	Return 1
 	end if
	
end if

Send(Handle(this),256,9,Long(0,0))
return 1

end event

event itemfocuschanged;call super::itemfocuschanged;If Row=0 then Return

SelectText(1,20)
If dwo.name="co_producto_mp" Then
	This.Object.DataWindow.HorizontalScrollPosition=1	
End If
end event

event dberror;Integer li_response
String  ls_error,ls_tab,ls_msg, ls_contenido, ls_directorio
long    ll_p1,ll_p2,ll_tot,i

Choose Case sqldbcode
	
//	Case -746
//		li_response = MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n", sqlerrtext ,Exclamation!,YesNo!) 		
	Case -268
		
		li_response = MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Se est$$HEX2$$e1002000$$ENDHEX$$tratando de ingresar un que registro que ya existe !. Desea ver los detalles ?.",Exclamation!,YesNo!) 
	
	Case -692
		li_response = MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Est$$HEX2$$e1002000$$ENDHEX$$tratando de eliminar un registro que ya es referenciado por otro archivo !. Desea ver los detalles ?.",Exclamation!,YesNo!) 
   Case -211 //error de bloqueo de sistema
		ls_error=sqlerrtext
		ll_p1=pos(ls_error,"(")
		ll_p2=pos(ls_error,")")
		ls_tab=mid(ls_error,ll_p1+1, ll_p2 -ll_p1 -1)
		n_ds_application lds_1
		
		lds_1=create n_ds_application
		
		lds_1.dataobject="d_sp_mu_table_lock"
		lds_1.Settransobject(n_cst_application.itr_appl)
		ll_tot=lds_1.Retrieve(ls_tab)
		
		If ll_tot>0 Then
			ls_msg="Bloqueo de "+ls_tab+"~n~r"
			
			ls_msg+="Los siguientes usuarios estan causando bloqueo, trate de ponerse en contacto con ellos ~n~r ~n~r"
			for i=1 To ll_tot
				ls_msg+=lds_1.GetItemString(i,"usuario")
				ls_msg+=lds_1.GetItemString(i,"tty")
				ls_msg+=lds_1.GetItemString(i,"tipo")+" ~n~r"
			next
			ls_msg+="Por favor pongase en contacto con el Administrador de Base de Datos si el problema persiste.~n~r"
			Messagebox("Problema de bloqueo en "+ls_tab,ls_msg,StopSign!)
      End If
		Destroy lds_1
	Case Else
		li_response = MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Se ha producido un error !. Desea ver los detalles ?.",Exclamation!,YesNo!) 
	
End Choose 


If li_response = 1 Then
	String ls_sel1,ls_name
	ls_sel1=Describe("DataWindow.Table.Select")
	ls_name=classname()
	clipboard(ls_sel1)

   MessageBox("Advertencia!",ls_sel1,StopSign!)

	Return 0
Else
	Return 1
End If	

/*
n_ms_base lob_mail
lob_mail=create n_ms_base

String ls_usuario,ls_directorio

ls_directorio=GetCurrentDirectory()		

ls_usuario=ProfileString("procesop.ini", "correo_error","usuario", "jfvasduq@local")

lob_mail.of_sendmailoutlook(ls_usuario,'MUESTRAS SQL (DW)',ls_directorio+"~n"+classname()+"~n"+&
dataObject+"~n"+Parent.ClassName()+"~nERROR~n"+sqlerrtext+&
"~nSENTENCIA~n"+sqlsyntax+"~nCODIGO DB~n"+String(sqldbcode)+"~nFila~n"+String(row))

Destroy lob_mail
*/

uo_correo	lnv_correo
lnv_correo = CREATE uo_correo

ls_contenido = ls_directorio+"~n"+classname()+"~n"+&
					dataObject+"~n"+Parent.ClassName()+"~nERROR~n"+sqlerrtext+&
					"~nSENTENCIA~n"+sqlsyntax+"~nCODIGO DB~n"+String(sqldbcode)+"~nFila~n"+String(row)
					
ls_directorio=GetCurrentDirectory()

TRY
	lnv_correo.of_enviar_correo('MUESTRAS SQL (DW)', ls_contenido, "correo_error")
CATCH(Exception ex)
	Messagebox("Error", ex.getmessage())
END TRY

DESTROY lnv_correo
end event

type gb_mp from u_gb_base within tabpage_1
integer x = 18
integer y = 12
integer width = 4320
integer height = 908
integer taborder = 40
string text = "Materia prima (F8)"
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 4366
integer height = 1000
long backcolor = 80269524
string text = "Observaciones (Ctrl+F6)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
st_1 st_1
dw_observacion dw_observacion
gb_observacion gb_observacion
end type

on tabpage_2.create
this.st_1=create st_1
this.dw_observacion=create dw_observacion
this.gb_observacion=create gb_observacion
this.Control[]={this.st_1,&
this.dw_observacion,&
this.gb_observacion}
end on

on tabpage_2.destroy
destroy(this.st_1)
destroy(this.dw_observacion)
destroy(this.gb_observacion)
end on

type st_1 from statictext within tabpage_2
integer x = 123
integer y = 516
integer width = 2098
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "NOTA: Las observaciones no son por color, son las mismas para todos los colores y opciones"
boolean focusrectangle = false
end type

type dw_observacion from u_dw_application within tabpage_2
integer x = 82
integer y = 96
integer width = 4155
integer height = 420
integer taborder = 20
string dataobject = "d_ext_observacion70"
end type

event ue_deleterow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 17 de Diciembre de 2002 HORA 13:44:56:468
// 
// OverWrite!
//////////////////////////////////////////////////////////////////////////

end event

event ue_insertrow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 17 de Diciembre de 2002 HORA 13:45:19:406
// 
// OverWrite!
//////////////////////////////////////////////////////////////////////////

end event

event itemchanged;call super::itemchanged;If of_validarcadena( data)<>1 Then
	Return 2
End If

ib_cambio_observaciones=true
end event

event getfocus;call super::getfocus;gb_observacion.of_Color(True)
end event

event losefocus;call super::losefocus;gb_observacion.of_Color(False)
end event

type gb_observacion from u_gb_base within tabpage_2
integer x = 18
integer y = 12
integer width = 4283
integer height = 588
string text = "Observaciones (Ctrl+F6)"
end type

type tabpage_3 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 4366
integer height = 1000
long backcolor = 80269524
string text = "Resumen Materia prima (Ctrl+F7)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
st_4 st_4
dw_mat_prima2 dw_mat_prima2
sle_opcion sle_opcion
cb_1 cb_1
dw_resumen_mp dw_resumen_mp
sle_color sle_color
st_3 st_3
gb_1 gb_1
end type

on tabpage_3.create
this.st_4=create st_4
this.dw_mat_prima2=create dw_mat_prima2
this.sle_opcion=create sle_opcion
this.cb_1=create cb_1
this.dw_resumen_mp=create dw_resumen_mp
this.sle_color=create sle_color
this.st_3=create st_3
this.gb_1=create gb_1
this.Control[]={this.st_4,&
this.dw_mat_prima2,&
this.sle_opcion,&
this.cb_1,&
this.dw_resumen_mp,&
this.sle_color,&
this.st_3,&
this.gb_1}
end on

on tabpage_3.destroy
destroy(this.st_4)
destroy(this.dw_mat_prima2)
destroy(this.sle_opcion)
destroy(this.cb_1)
destroy(this.dw_resumen_mp)
destroy(this.sle_color)
destroy(this.st_3)
destroy(this.gb_1)
end on

type st_4 from statictext within tabpage_3
integer x = 2926
integer y = 176
integer width = 631
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Composici$$HEX1$$f300$$ENDHEX$$n exacta"
boolean focusrectangle = false
end type

type dw_mat_prima2 from datawindow within tabpage_3
integer x = 2885
integer y = 236
integer width = 1422
integer height = 588
integer taborder = 70
string title = "none"
string dataobject = "d_sp_mu_compos"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type sle_opcion from singlelineedit within tabpage_3
integer x = 3438
integer y = 52
integer width = 352
integer height = 76
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79017397
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within tabpage_3
integer x = 3813
integer y = 48
integer width = 302
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Recuperar"
end type

event clicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 18 de Junio de 2003 HORA 16:47:57:129
// 
// 
//////////////////////////////////////////////////////////////////////////


sle_color.text=String(il_color)
sle_opcion.text=String(il_opcion)

dw_resumen_mp.Retrieve(il_fabrica,il_linea,&
il_muestra, il_talla, il_color, il_opcion) 

dw_mat_prima2.Retrieve(il_fabrica,il_linea,&
il_muestra, il_talla, il_color, il_opcion) 

end event

type dw_resumen_mp from datawindow within tabpage_3
integer x = 9
integer y = 16
integer width = 2843
integer height = 800
integer taborder = 60
string title = "none"
string dataobject = "d_resumen_mp_mues"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type sle_color from singlelineedit within tabpage_3
integer x = 3067
integer y = 52
integer width = 352
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79017397
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within tabpage_3
integer x = 2930
integer y = 60
integer width = 187
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Color:"
boolean focusrectangle = false
end type

type gb_1 from groupbox within tabpage_3
integer x = 2885
integer width = 1298
integer height = 156
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Recuperar Resumen"
end type

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 4366
integer height = 1000
long backcolor = 80269524
string text = "Composici$$HEX1$$f300$$ENDHEX$$n"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_composicion dw_composicion
end type

on tabpage_4.create
this.dw_composicion=create dw_composicion
this.Control[]={this.dw_composicion}
end on

on tabpage_4.destroy
destroy(this.dw_composicion)
end on

type dw_composicion from u_dw_application within tabpage_4
integer x = 9
integer y = 28
integer width = 4320
integer height = 552
integer taborder = 30
string dataobject = "d_composicion_muestra"
end type

event getfocus;call super::getfocus;//gb_observacion.of_Color(True)
end event

event itemchanged;call super::itemchanged;//If of_validarcadena( data)<>1 Then
//	Return 2
//End If
//
//ib_cambio_observaciones=true
end event

event losefocus;call super::losefocus;//gb_observacion.of_Color(False)
end event

event ue_insertrow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 17 de Diciembre de 2002 HORA 13:45:19:406
// 
// OverWrite!
//////////////////////////////////////////////////////////////////////////

end event

event ue_deleterow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 17 de Diciembre de 2002 HORA 13:44:56:468
// 
// OverWrite!
//////////////////////////////////////////////////////////////////////////

end event

type tabpage_5 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 4366
integer height = 1000
long backcolor = 80269524
string text = "Relaci$$HEX1$$f300$$ENDHEX$$n Fert (Ctrl+F8)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
st_6 st_6
dw_dt_muestras_fert dw_dt_muestras_fert
gb_fert gb_fert
end type

on tabpage_5.create
this.st_6=create st_6
this.dw_dt_muestras_fert=create dw_dt_muestras_fert
this.gb_fert=create gb_fert
this.Control[]={this.st_6,&
this.dw_dt_muestras_fert,&
this.gb_fert}
end on

on tabpage_5.destroy
destroy(this.st_6)
destroy(this.dw_dt_muestras_fert)
destroy(this.gb_fert)
end on

type st_6 from statictext within tabpage_5
integer x = 59
integer y = 848
integer width = 2638
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Doble click en Temporada, Colecci$$HEX1$$f300$$ENDHEX$$n y/o Tema para seleccionar"
boolean focusrectangle = false
end type

type dw_dt_muestras_fert from u_dw_application within tabpage_5
integer x = 59
integer y = 76
integer width = 4201
integer height = 764
integer taborder = 20
string title = "Relaci$$HEX1$$f300$$ENDHEX$$n Fert (Ctlr+F8)"
string dataobject = "d_dt_muestras_fert"
boolean hscrollbar = true
end type

event dberror;Integer li_response
String  ls_error,ls_tab,ls_msg, ls_contenido, ls_directorio
long    ll_p1,ll_p2,ll_tot,i

Choose Case sqldbcode
	
//	Case -746
//		li_response = MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n", sqlerrtext ,Exclamation!,YesNo!) 		
	Case -268
		
		li_response = MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Se est$$HEX2$$e1002000$$ENDHEX$$tratando de ingresar un que registro que ya existe !. Desea ver los detalles ?.",Exclamation!,YesNo!) 
	
	Case -692
		li_response = MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Est$$HEX2$$e1002000$$ENDHEX$$tratando de eliminar un registro que ya es referenciado por otro archivo !. Desea ver los detalles ?.",Exclamation!,YesNo!) 
   Case -211 //error de bloqueo de sistema
		ls_error=sqlerrtext
		ll_p1=pos(ls_error,"(")
		ll_p2=pos(ls_error,")")
		ls_tab=mid(ls_error,ll_p1+1, ll_p2 -ll_p1 -1)
		n_ds_application lds_1
		
		lds_1=create n_ds_application
		
		lds_1.dataobject="d_sp_mu_table_lock"
		lds_1.Settransobject(n_cst_application.itr_appl)
		ll_tot=lds_1.Retrieve(ls_tab)
		
		If ll_tot>0 Then
			ls_msg="Bloqueo de "+ls_tab+"~n~r"
			
			ls_msg+="Los siguientes usuarios estan causando bloqueo, trate de ponerse en contacto con ellos ~n~r ~n~r"
			for i=1 To ll_tot
				ls_msg+=lds_1.GetItemString(i,"usuario")
				ls_msg+=lds_1.GetItemString(i,"tty")
				ls_msg+=lds_1.GetItemString(i,"tipo")+" ~n~r"
			next
			ls_msg+="Por favor pongase en contacto con el Administrador de Base de Datos si el problema persiste.~n~r"
			Messagebox("Problema de bloqueo en "+ls_tab,ls_msg,StopSign!)
      End If
		Destroy lds_1
	Case Else
		li_response = MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Se ha producido un error !. Desea ver los detalles ?.",Exclamation!,YesNo!) 
	
End Choose 


If li_response = 1 Then
	String ls_sel1,ls_name
	ls_sel1=Describe("DataWindow.Table.Select")
	ls_name=classname()
	clipboard(ls_sel1)

   MessageBox("Advertencia!",ls_sel1,StopSign!)

	Return 0
Else
	Return 1
End If	

/*Dbedocal 2018-05-11
n_ms_base lob_mail
lob_mail=create n_ms_base

String ls_usuario,ls_directorio

ls_directorio=GetCurrentDirectory()		

ls_usuario=ProfileString("procesop.ini", "correo_error","usuario", "jfvasduq@local")

lob_mail.of_sendmailoutlook(ls_usuario,'MUESTRAS SQL (DW)',ls_directorio+"~n"+classname()+"~n"+&
dataObject+"~n"+Parent.ClassName()+"~nERROR~n"+sqlerrtext+&
"~nSENTENCIA~n"+sqlsyntax+"~nCODIGO DB~n"+String(sqldbcode)+"~nFila~n"+String(row))

Destroy lob_mail

*/
uo_correo	lnv_correo
lnv_correo = CREATE uo_correo

ls_directorio=GetCurrentDirectory()

ls_contenido = ls_directorio+"~n"+classname()+"~n"+&
					dataObject+"~n"+Parent.ClassName()+"~nERROR~n"+sqlerrtext+&
					"~nSENTENCIA~n"+sqlsyntax+"~nCODIGO DB~n"+String(sqldbcode)+"~nFila~n"+String(row)
					
					
TRY
	lnv_correo.of_enviar_correo('MUESTRAS SQL (DW)', ls_contenido, "correo_error" )
CATCH(Exception ex)
	Messagebox("Error", ex.getmessage())
END TRY

DESTROY lnv_correo
end event

event getfocus;call super::getfocus;gb_fert.of_color(true)
end event

event losefocus;call super::losefocus;gb_fert.of_color(false)
end event

event ue_dwnprocessenter;/*
* ----------------------------------------------------------------------------
* MODIFICADO: Noviembre 21 de 2011 - ohlondono
* ----------------------------------------------------------------------------
* 
* Asigna valores para los campos que estan ocultos
* ----------------------------------------------------------------------------
*/

Integer li_columna

li_columna = 11
 
// SE HABILITA CUANDO SE PERMITAN VARIOS FERT POR MUESTRA
//if this.AcceptText() < 0 then
//  Return 1
//end if
////11 Tema
//if this.GetColumn() = li_columna then 
//	if this.GetRow() = this.RowCount() then
//		PostEvent("ue_insertrow")
//   	Return 1
// 	end if	
//end if
//
//Send(Handle(this),256,9,Long(0,0))
//return 1

end event

event ue_insertrow;/* 
* ----------------------------------------------------------------------------
* MODIFICADO: Noviembre 21 de 2011 - ohlondono
* ----------------------------------------------------------------------------
* 
* Asigna valores para los campos que estan ocultos
* ----------------------------------------------------------------------------
*/
Long 				ll_cons,ll_f, ll_muestrario
n_cst_comun 	lo_comun
String			ls_carac_talla, ls_carac_color

ll_f = dw_head.RowCount() 
IF ll_f = 0 THEN RETURN

IF (il_fabrica = 5) THEN RETURN

// POR AHORA SE DEJARA INSERTAR SOLO UN DETALLE POR MUESTRA
If RowCount()=1  Then
	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "S$$HEX1$$f300$$ENDHEX$$lo es posible tener un fert por muestra")
	SetFocus()
	SetColumn('co_fert')
	RETURN
END IF
This.SetRedraw(FALSE)
//-----------------------------

If RowCount()=0 Or GetRow()=RowCount() Then
	super::event ue_insertRow()
	ll_f=GetRow()
Else
	ll_f=InsertRow(GetRow())		
	This.ScrollToRow(ll_f)
	This.SetColumn(1)
	This.SetFocus()
End If

//-----------------------------
SetItem(ll_f, "co_fabrica", il_fabrica)
SetItem(ll_f, "co_linea",   il_linea)
SetItem(ll_f, "co_muestra", il_muestra)
SetItem(ll_f, "co_talla",   il_talla)    
SetItem(ll_f, "co_color",   il_color) 
SetItem(ll_f, "co_categoria",   " ") 

IF ll_f>1 THEN	
	SetItem(ll_f, "co_fert",       GetItemString(ll_f -1,"co_fert"))	
	SetItem(ll_f, "co_categoria",  GetItemString(ll_f -1,"co_categoria"))	
	SetItem(ll_f, "co_talla_fert", GetItemString(ll_f -1,"co_talla_fert"))	
	SetItem(ll_f, "co_color_fert", GetItemString(ll_f -1,"co_color_fert"))	
	SetItem(ll_f, "co_temporada",  GetItemString(ll_f -1,"co_temporada"))	
	SetItem(ll_f, "co_coleccion",  GetItemString(ll_f -1,"co_coleccion"))	
	SetItem(ll_f, "co_tema",       GetItemString(ll_f -1,"co_tema"))	 
	SetItem(ll_f, "de_temporada",  GetItemString(ll_f -1,"de_temporada"))
END IF

/*
* ============================================================================
* MODIFICADO: Diciembre 01 de 2011 - ohlondon
* ----------------------------------------------------------------------------
* RELACION FERT: Traer las tallas y colores de la caracteristica asociada a la
*                fabrica-linea
* ============================================================================
*/

IF lo_comun.of_obtener_caracteristica(il_fabrica,il_linea,n_cst_application.itr_appl)  = -1 THEN
	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", lo_comun.of_getstring(1))
	SetFocus()
	SetColumn('co_fert')
	RETURN 
END IF

ls_carac_talla = lo_comun.of_getstring(1)
ls_carac_color = lo_comun.of_getstring(2)

IF IsNull(ls_carac_talla) OR Trim(ls_carac_talla ) = '' THEN
	ls_carac_talla  = 'TACALCETIN'
END IF

IF IsNull(ls_carac_color) OR Trim(ls_carac_color ) = '' THEN
	ls_carac_color  = 'COCALCETIN'
END IF

lo_comun.of_loadDddw(idwc_talla_fert, ls_carac_talla, n_cst_application.itr_appl)
lo_comun.of_loadDddw(idwc_color_fert, ls_carac_color, n_cst_application.itr_appl)
// ---------------------------------------------------------------------------

This.SetRedraw(TRUE)
SetFocus()
SetColumn('co_fert')

end event

event itemchanged;call super::itemchanged;datawindowchild 	ldwc_temporada
Long 					ll_res
String 				ls_dato, ls_temp, ls_colec, ls_tema 
 
This.AcceptText()
ids_temporadas.SetFilter("")
ids_temporadas.Filter()

CHOOSE CASE This.GetColumnName() 
		
	CASE 'co_temporada'
		ls_dato =  Trim(data) 
		ids_temporadas.SetFilter("Trim(co_temporada) = '"+ls_dato+"'")
		ids_temporadas.Filter()
		
		ll_res = ids_temporadas.RowCount()
		IF ll_res < 0 THEN 
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Ocurri$$HEX2$$f3002000$$ENDHEX$$un error al validar la temporada del Fert")
			SetNull(ls_dato)
			This.SetItem(Row, 'co_temporada', ls_dato)
			RETURN 1
		ELSEIF ll_res = 0 THEN 
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La temporada seleccionada no existe, por favor verifique.")
			SetNull(ls_dato)
			This.SetItem(Row, 'co_temporada', ls_dato)
			RETURN 1
		END IF 
		
	CASE 'co_coleccion'
		ls_dato = Trim(data)
		ids_temporadas.SetFilter("Trim(co_coleccion) = '"+ls_dato+"'")
		ids_temporadas.Filter()
		
		ll_res = ids_temporadas.RowCount()
		IF ll_res < 0 THEN 
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Ocurri$$HEX2$$f3002000$$ENDHEX$$un error al validar la colecci$$HEX1$$f300$$ENDHEX$$n del Fert")
			SetNull(ls_dato)
			This.SetItem(Row, 'co_coleccion', ls_dato)
			RETURN 1
		ELSEIF ll_res = 0 THEN 
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La colecci$$HEX1$$f300$$ENDHEX$$n seleccionada no existe, por favor verifique.")
			SetNull(ls_dato)
			This.SetItem(Row, 'co_coleccion', ls_dato)
			RETURN 1
		END IF
		
	CASE 'co_tema'
		ls_dato = Trim(data)
		ids_temporadas.SetFilter("Trim(co_tema) = '"+ls_dato+"'")
		ids_temporadas.Filter()
		
		ll_res = ids_temporadas.RowCount()
		IF ll_res < 0 THEN 
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Ocurri$$HEX2$$f3002000$$ENDHEX$$un error al validar el tema del Fert")
			SetNull(ls_dato)
			This.SetItem(Row, 'co_tema', ls_dato)
			RETURN 1
		ELSEIF ll_res = 0 THEN 
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El tema seleccionado no existe, por favor verifique.")
			SetNull(ls_dato)
			This.SetItem(Row, 'co_tema', ls_dato)
			RETURN 1
		END IF  	
		
	CASE 'co_talla_fert', 'co_talla_fert_1'
		ls_dato = Trim(data)
		ll_res = idwc_talla_fert.Find("co_talla = '"+ls_dato+"'", 1, idwc_talla_fert.RowCount())
		IF ll_res < 0 THEN 
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Ocurri$$HEX2$$f3002000$$ENDHEX$$un error al validar la talla del Fert")
			SetNull(ls_dato)
			This.SetItem(Row, 'co_talla_fert', ls_dato)
			RETURN 1
		ELSEIF ll_res = 0 THEN 
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La talla seleccionada no existe, por favor verifique.")
			SetNull(ls_dato)
			This.SetItem(Row, 'co_talla_fert', ls_dato)
			RETURN 1
		END IF 
		
	CASE 'co_color_fert', 'co_color_fert_1'
		ls_dato = Trim(data)
		ll_res = idwc_color_fert.Find("co_color = '"+ls_dato+"'", 1, idwc_color_fert.RowCount())
		IF ll_res < 0 THEN 
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Ocurri$$HEX2$$f3002000$$ENDHEX$$un error al validar el color del Fert")
			SetNull(ls_dato)
			This.SetItem(Row, 'co_color_fert', ls_dato)
			RETURN 1
		ELSEIF ll_res = 0 THEN 
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El color seleccionado no existe, por favor verifique.")
			SetNull(ls_dato)
			This.SetItem(Row, 'co_color_fert', ls_dato)
			RETURN 1
		END IF 
END CHOOSE
ls_temp  = This.GetItemString(row, 'co_temporada') 
ls_colec = This.GetItemString(row, 'co_coleccion') 
ls_tema  = This.GetItemString(row, 'co_tema') 

ls_dato = of_nombretemporada( ls_temp, ls_colec, ls_tema)
This.SetItem(Row, 'de_temporada', ls_dato)

//IF Not IsNull(ls_temp) THEN
//	ids_temporadas.SetFilter("")
//	ids_temporadas.Filter()
//	
//	ids_temporadas.SetFilter("Trim(co_temporada) = '"+ls_temp+"' AND Trim(co_coleccion) = '"+ls_colec+"'"+&
//									" AND Trim(co_tema) = '"+ls_tema+"'")
//	ids_temporadas.Filter()
//	ll_res = ids_temporadas.RowCount()
//	IF ll_res > 0 THEN 	  
//		ls_dato = ids_temporadas.GetItemString(1, 'de_temporada')
//		This.SetItem(Row, 'de_temporada', ls_dato)
// 	ELSEIF ll_res = 0 THEN 
//		SetNull(ls_dato)
//		This.SetItem(Row, 'de_temporada', ls_dato)
// 	END IF 
//END IF
//  
end event

event doubleclicked;call super::doubleclicked;If Row=0 Then Return

n_cst_param lo_param


If dwo.name="co_temporada" OR dwo.name="co_coleccion" OR dwo.name="co_tema" Then
	Open(w_buscar_temporada_sap )
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetItem(row, 'co_temporada', lo_param.is_vector[1])
		SetItem(row, 'co_coleccion', lo_param.is_vector[2])
		SetItem(row, 'co_tema',      lo_param.is_vector[3])
		SetItem(row, 'de_temporada', lo_param.is_vector[4])
	End If
End If
end event

event itemerror;call super::itemerror;RETURN 1
end event

type gb_fert from u_gb_base within tabpage_5
integer x = 18
integer y = 12
integer width = 4297
integer height = 920
integer taborder = 20
string text = "Relaci$$HEX1$$f300$$ENDHEX$$n Fert (Ctlr+F8)"
end type

type dw_head from u_dw_application within w_materia_prima_muestra_ref
integer x = 55
integer y = 52
integer width = 4603
integer height = 308
string dataobject = "d_h_fmp_muestras_c"
boolean vscrollbar = false
boolean livescroll = false
end type

event ue_insertrow;long ll_res
If ib_cambios Then
	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
	If ll_res=2 Then
		Return
	End If
End If

ib_find = FALSE

of_resetDw()
of_resetVar()
Reset()

Super::Event ue_insertRow()


end event

event getfocus;call super::getfocus;gb_head.of_color(True)
end event

event losefocus;call super::losefocus;gb_head.of_color(False)
end event

event itemchanged;call super::itemchanged;long ll_dato,ll_res, ll_ret, ll_null, ll_retorno, ll_recursoagrupa, ll_co_recurso
n_cst_comun lo_comun
n_cst_recurso	lnv_recursos
lnv_recursos = CREATE n_cst_recurso
String ls_dato,ls_null

SetNull(ll_null)
SetNull(ls_null)

If il_err_item_change<>0 Then
	Return 2
End If
                                                                
//////////////////////////////////////////////////////////////////////////
// si se cambian datos de la pk, se trata de recuperar otro registro en
// caso de que exista
//////////////////////////////////////////////////////////////////////////
CHOOSE CASE dwo.name
	CASE "co_fabrica","co_linea","co_muestra","co_talla"
		If ib_cambios Then
			ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
			If ll_res=2 Then
				Return 2
			End If
			ib_cambios=False
		End If
END CHOOSE

CHOOSE CASE dwo.name
	CASE "co_fabrica"
		il_fabrica=long(Data)	
		of_headMod(dwo.name)
		
	CASE "co_linea" 
		il_linea=long(data)
		of_headMod(dwo.name)
		
	CASE "co_muestra" 
		il_muestra=long(Data)
		ll_res=lo_comun.of_nombremuestra( il_fabrica,il_linea,il_muestra,n_cst_application.itr_appl)
		If ll_res=1 Then	
			SetItem(1,"de_muestra",lo_comun.of_getString(1))
			il_tipoprod=lo_comun.of_getLong(1)
			//MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!",row)
	
		Else
			il_muestra=-1
			MessageBox("Advertencia!","Muestra no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
			Return 2
		End If
		of_headMod(dwo.name)
		
	CASE "co_talla" 
		il_talla=long(Data)
		
		ll_res=lo_comun.of_nombremuestratalla( il_fabrica,il_linea,il_muestra,il_talla,&
															n_cst_application.itr_appl)
		If ll_res=1 Then	
			SetItem(1,"de_talla",lo_comun.of_getString(1))
		Else
			il_talla=-1
			MessageBox("Advertencia!","Talla no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
			Return 2
		End If
		//of_headMod(dwo.name)
	
		If of_controlMo()<>1 Then
			MessageBox("Advertencia!","La muestra no tiene recursos asignados para tejido en la mano de obra.",StopSign!)
			//of_iniciar()
			Return 2
		End If	
		of_headMod(dwo.name)
		//of_recuperar()
		
	CASE "co_diseno"
		il_diseno=Long(Data)
	
		ll_res=lo_comun.of_nombreDisenoMuestra(il_fabrica,il_linea, il_muestra,il_talla,&
		il_diseno,n_cst_application.itr_appl)
		
		If ll_res<>1 then
			il_diseno=-1
			MessageBox("Advertencia!","Dise$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
			Return 2
		End If	
		
		ll_retorno = of_recurso_Utilizado(ll_dato, il_diseno)
	
		IF ll_retorno > 0 THEN
			IF ll_dato <> THIS.Object.co_recurso[1] THEN
				MessageBox("Advertencia!","El Dise$$HEX1$$f100$$ENDHEX$$o esta siendo utilizado por otro recurso.",StopSign!)
				SetItem(1,"co_diseno", ll_null)
				SetItem(1,"de_diseno", ls_null)			
				RETURN 1
			END IF
		END IF
		
		
		SetItem(1,"de_diseno",lo_comun.of_getString(1))
		of_headMod(dwo.name)
		
	CASE "co_muestrario" 
		il_co_muestrario=Long(Data)
		
		ll_res=lo_comun.of_nombremuestrario( il_fabrica,il_linea,il_co_muestrario,&
							 n_cst_application.itr_appl)
		
		If ll_res=1 Then	
			SetItem(1,"de_muestrario",lo_comun.of_getString(1))
		Else
			il_diseno=-1
			MessageBox("Advertencia!","Debe ingresar un muestrario v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
			Return 2
		End If
		of_recuperar()
		
		ll_res=lnv_recursos.of_nombreRecursoTj( Long(THIS.Object.co_recurso[1]), n_cst_application.itr_appl)
												 
		IF ll_res=1 THEN
			SetItem(1,"de_recurso",lnv_recursos.of_getString(1))
		END IF
			
		
	CASE "co_recurso"
		
		ll_co_recurso = Long( data )	
		
		ll_res=lnv_recursos.of_nombreRecursoTj( ll_co_recurso, n_cst_application.itr_appl)
		// FACL - 2018-04-17 - SA56239 - Se verifica si el recurso agrupa, sino se obtiene el recurso que lo agrupa
		// Si el recurso es valido
		IF ll_res=1 THEN
			// Se verifica si es un recurso agrupado					
			ll_ret=of_recurso_agrupa( ll_co_recurso )
			If ll_ret = 0 Then // Si no lo es se toma el recurso que lo agrupa
				ll_recursoagrupa = of_consultar_recursoagrupa( ll_co_recurso )
				If ll_recursoagrupa < 0 Then
					Return 2
				End If
				// Si el recurso agrupado es igual al que tiene se rechaza el cambio
				If ll_recursoagrupa = This.GetItemNumber( Row, 'co_recurso' ) Then
					Return 2
				End If
				ll_res=lnv_recursos.of_nombreRecursoTj( ll_recursoagrupa, n_cst_application.itr_appl)
			Else
				ll_recursoagrupa = ll_co_recurso
			End If
		End If
			
		If ll_res = 1 Then
			THIS.Object.co_muestrario[1] = ll_null
			THIS.Object.de_muestrario[1] = ls_null
		
			dw_colores.reset( )
			dw_partes.reset( )
			tab_1.tabpage_1.dw_mp.reset( )
			tab_1.tabpage_2.dw_observacion.reset( )
			tab_1.tabpage_3.dw_mat_prima2.reset( )
			tab_1.tabpage_3.dw_resumen_mp.reset( )
			tab_1.tabpage_4.dw_composicion.reset( )
			tab_1.tabpage_5.dw_dt_muestras_fert.reset( )		
		
			SetItem(1,"de_recurso",lnv_recursos.of_getString(1))
			il_recurso = ll_recursoagrupa
			THIS.Object.co_diseno.Protect = true
			
			ll_retorno = of_recuperar_diseno(ll_dato)
			
			IF ll_retorno > 0 THEN
				
				THIS.object.co_diseno.protect= TRUE
				ll_res=lo_comun.of_nombreDisenoMuestra(il_fabrica,il_linea, il_muestra,il_talla,&
				ll_dato,n_cst_application.itr_appl)
				
				If ll_res<>1 then
					MessageBox("Advertencia!","Dise$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
					Return 2
				End If	
				SetItem(1,"co_diseno",ll_dato)
				SetItem(1,"de_diseno",lo_comun.of_getString(1))
				il_diseno=ll_dato
				
			ELSE				
				THIS.Object.co_diseno.Protect = FALSE
				MessageBox("Advertencia!","Debe ingresar un recurso v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
	
				SetItem(1,'co_recurso', ll_null)
				SetItem(1,'de_recurso', ls_null)	
				SetItem(1,"co_diseno", ll_null)
				SetItem(1,"de_diseno", ls_null)
				THIS.accepttext( )
				Return 2			
	
			END IF
			
			// Se deja el recurso agrupado
			If ll_recursoagrupa <> ll_co_recurso Then
				This.Post SetItem( Row, 'co_recurso', ll_recursoagrupa )				
			End If

			THIS.SetColumn( 'co_muestrario')
			THIS.SetFocus( )	
		ELSE
			THIS.Object.co_diseno.Protect = FALSE
			MessageBox("Advertencia!","Debe ingresar un recurso v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)

			SetItem(1,'co_recurso', ll_null)
			SetItem(1,'de_recurso', ls_null)			
			THIS.accepttext( )
			Return 2
		End If
		
		THIS.SetColumn( 'co_muestrario')
		THIS.SetFocus( )					
			
		//SA56239 - FACL - 2018-04-17 - Se comenta el codigo y se reorganiza la funcionalidad
		//SA56239 - Ceiba/reariase - 24-04-2017
//		ll_res=of_recurso_agrupa( Long(data) )
//		If ll_res = 0 Then
//			ll_recursoagrupa = of_consultar_recursoagrupa( Long(data) )
//			SetItem(1,'co_recurso', ll_recursoagrupa)
//			THIS.accepttext( )
//			Return 2
//		End If
		//Fin SA56239			

END CHOOSE
	
end event

event ue_deleterow;//If tab_1.tabpage_1.dw_partes.RowCount()>0 Then
//	MessageBox("Advertencia!","No deben existir partes.",StopSign!)
//	Return
//End If
//
//Super::Event ue_deleteRow()
//
end event

event doubleclicked;call super::doubleclicked;Long	ll_res

If Row=0 Then Return

n_cst_param lo_param
n_cst_recurso 	lnv_recursos
lnv_recursos = CREATE n_cst_recurso

str_param		lstr_parametro
DWObject 		ldwo_1

	
CHOOSE CASE dwo.name
	CASE "co_talla" 
		lo_param.il_vector[1]=GetItemNumber(1,"co_fabrica")
		lo_param.il_vector[2]=GetItemNumber(1,"co_linea")
		lo_param.il_vector[3]=GetItemNumber(1,"co_muestra")
		
		OpenWithParm(w_bus_tallas_muestra,lo_param)
		
		lo_param=Message.PowerObjectParm
		
		If IsValid(lo_param) Then
			SetText(String(lo_param.il_vector[1]))
		End If

	CASE "co_color" 
		lo_param.il_vector[1]=GetItemNumber(1,"co_fabrica")
		lo_param.il_vector[2]=GetItemNumber(1,"co_linea")
		lo_param.il_vector[3]=GetItemNumber(1,"co_muestra")
		lo_param.il_vector[4]=GetItemNumber(1,"co_talla")
		
		OpenWithParm(w_bus_colores_muestra,lo_param)
		
		lo_param=Message.PowerObjectParm
		
		If IsValid(lo_param) Then
			SetText(String(lo_param.il_vector[1]))
		End If
		
	CASE "co_recurso" 
		IF NOT(invo_seg_muestras.of_configOpcionGuardar()) THEN RETURN //SA54453 - Ceiba/jjmonsal - 31-03-2016
		IF ib_find THEN
			lstr_parametro.a_long1[1] = il_fabrica
			lstr_parametro.a_long1[2] = il_linea
			lstr_parametro.a_long1[3] = il_muestra
			lstr_parametro.a_long1[4] = il_talla
			
			OpenWithParm(w_recursos_ficha_mt_prima,lstr_parametro)	
			
			lstr_parametro=Message.PowerObjectParm
			
			If IsValid(lstr_parametro) Then
				SetText(String(lstr_parametro.a_long1[1]))
		
				
				ll_res=lnv_recursos.of_nombreRecursoTj( lstr_parametro.a_long1[1], n_cst_application.itr_appl)
														 
				IF ll_res=1 THEN
					SetItem(1,"de_recurso",lnv_recursos.of_getString(1))
				End If			
			END IF			
		ELSE
			
			Open(w_bus_m_recurso_tj)
			
			lo_param=Message.PowerObjectParm
			
			If IsValid(lo_param) Then
				SetText(String(lo_param.il_vector[1]))
		
				
				ll_res=lnv_recursos.of_nombreRecursoTj( lo_param.il_vector[1], n_cst_application.itr_appl)
														 
				IF ll_res=1 THEN
					SetItem(1,"de_recurso",lnv_recursos.of_getString(1))
				End If			
			END IF
		END IF
			
		
	CASE "co_diseno" 
			
		lo_param.il_vector[1]=GetItemNumber(1,"co_fabrica")
		lo_param.il_vector[2]=GetItemNumber(1,"co_linea")
		lo_param.il_vector[3]=GetItemNumber(1,"co_muestra")
		lo_param.il_vector[4]=GetItemNumber(1,"co_talla")
	
		OpenWithParm(w_busins_m_disenos_muestras,lo_param)
		
		lo_param=Message.PowerObjectParm
		
		If IsValid(lo_param) Then
			SetText(String(lo_param.il_vector[1]))
		End If
END CHOOSE
end event

event itemfocuschanged;call super::itemfocuschanged;selectText(1,20)
end event

event ue_dwnprocessenter;//
end event

event itemerror;//
end event

type gb_head from u_gb_base within w_materia_prima_muestra_ref
integer width = 4667
integer height = 384
integer taborder = 0
string text = "Datos de la muestra"
end type

type gb_color from u_gb_base within w_materia_prima_muestra_ref
integer x = 5
integer y = 692
integer width = 2565
integer height = 528
integer taborder = 40
string text = "Colores (F6)"
end type

type gb_partes from u_gb_base within w_materia_prima_muestra_ref
integer x = 2597
integer y = 692
integer width = 2071
integer height = 528
integer taborder = 60
string text = "Partes / Combinaciones (F7)"
end type

type gb_2 from u_gb_base within w_materia_prima_muestra_ref
integer y = 412
integer width = 4667
integer height = 256
integer taborder = 90
string text = "Datos de la Referencia"
end type

