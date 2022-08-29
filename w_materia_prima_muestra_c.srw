HA$PBExportHeader$w_materia_prima_muestra_c.srw
$PBExportComments$Para el manejo de lo referente a mano de obra, con todos los colores
forward
global type w_materia_prima_muestra_c from w_sheet
end type
type rb_un_col from radiobutton within w_materia_prima_muestra_c
end type
type rb_todos_col from radiobutton within w_materia_prima_muestra_c
end type
type dw_partes from u_dw_application within w_materia_prima_muestra_c
end type
type dw_colores from u_dw_application within w_materia_prima_muestra_c
end type
type tab_1 from tab within w_materia_prima_muestra_c
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
type tab_1 from tab within w_materia_prima_muestra_c
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
type dw_head from u_dw_application within w_materia_prima_muestra_c
end type
type gb_head from u_gb_base within w_materia_prima_muestra_c
end type
type gb_color from u_gb_base within w_materia_prima_muestra_c
end type
type gb_partes from u_gb_base within w_materia_prima_muestra_c
end type
end forward

global type w_materia_prima_muestra_c from w_sheet
integer width = 3831
integer height = 2376
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
rb_un_col rb_un_col
rb_todos_col rb_todos_col
dw_partes dw_partes
dw_colores dw_colores
tab_1 tab_1
dw_head dw_head
gb_head gb_head
gb_color gb_color
gb_partes gb_partes
end type
global w_materia_prima_muestra_c w_materia_prima_muestra_c

type variables
String is_where,is_nom_centro,is_where_copia

long il_fabrica,il_linea,il_muestra,il_talla,il_color,il_opcion

String is_peso

long   il_tipoprod, il_centro

boolean ib_cambios, ib_cambio_observaciones

long il_fila_parte,il_nu_partemp,il_co_parte,il_co_combinacion,il_fila_color

DataWindowChild idc_talla

long il_PARTEMP_GEN, il_COMBINA_GEN  

n_ds_application ids_observacion

decimal ide_FACTOR_MUESTRA_A_PDN
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
end prototypes

event ue_copiar_mp();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 12 de Abril de 2003 HORA 11:09:08:406
// 
// Para copiar materia prima de otra muestra
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
	MessageBox("Advertencia!","La muestra tiene productos de materia prima, solo es posible hacer copia a muestras sin materia prima.",StopSign!)
	Return
End If

OpenWithParm(w_opc_mat_prima_muestra_c,is_where_copia)

lo_param=Message.PowerObjectParm

If Not IsValid(lo_param) Then
	Return 
End If

ll_res_obs=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea copiar las observaciones ?",Question!,YesNo!,2)

SetPointer(HourGlass!)

long ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_color,&
     ll_tipoprod,ll_cons

  
ll_fabrica    =  lo_param.il_vector[1]
ll_linea      =  lo_param.il_vector[2]
ll_muestra    =  lo_param.il_vector[3]
ll_talla      =  lo_param.il_vector[4]

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

is_where_copia  =  lo_param.is_vector[1]

n_ds_application lds_1

lds_1=create n_ds_application
//////////////////////////////////////////////////////////////////////////
// Se copian las partes
// 
//////////////////////////////////////////////////////////////////////////
lds_1.DataObject=dw_partes.DataObject

lds_1.SetTransObject(n_cst_application.itr_appl)

long ll_res,i

ll_res=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla)

If ll_res<=0 Then
	tab_1.tabpage_1.dw_mp.SetRedraw(True)
	dw_partes.SetRedraw(True)
	Destroy lds_1
	MessageBox("Advertencia!","No se ha parametrizado la materia prima para la muestra seleccionada.",StopSign!)
	Return
End If

Datetime ldt_fecha
String ls_usuario,ls_instancia
//Tambien actualizar fecha,usuario,instancia
If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return 
End If

lds_1.rowscopy( 1,ll_res,Primary!,dw_partes,1,Primary!)

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

ll_res=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla)

If ll_res<=0 Then
	tab_1.tabpage_1.dw_mp.SetRedraw(True)
	dw_partes.SetRedraw(True)
	Destroy lds_1
	MessageBox("Advertencia!","No se encontraron los colores.",StopSign!)
	Return
End If

//////////////////////////////////////////////////////////////////////////
// puede que algunos colores existan, es necesario verificar antes de 
// hacer la copia
//////////////////////////////////////////////////////////////////////////

//lds_1.rowscopy( 1,ll_res,Primary!,dw_colores,1,Primary!)

long ll_cnt_opcion,ll_pos

For i=1 To ll_res
	
	ll_color=lds_1.GetItemNumber(i,"co_color")
	ll_cnt_opcion=lds_1.GetItemNumber(i,"cnt_opcion")
	
	ll_pos=dw_colores.Find("co_color="+String(ll_color)+" and cnt_opcion="+&
	String(ll_cnt_opcion),1,dw_colores.RowCount())
	
	If ll_pos=0 Then
		lds_1.SetItem(i,"co_fabrica",il_fabrica)
		lds_1.SetItem(i,"co_linea",il_linea)
		lds_1.SetItem(i,"co_muestra",il_muestra)
		lds_1.SetItem(i,"co_talla",il_talla)
	
		lds_1.SetItem(i,'fe_creacion',ldt_fecha)
		lds_1.SetItem(i,'fe_actualizacion',ldt_fecha)
		lds_1.SetItem(i,'usuario',ls_usuario)
		lds_1.SetItem(i,'instancia',ls_instancia)
		
		lds_1.rowscopy( i,i,Primary!,dw_colores,dw_colores.RowCount()+1,Primary!)
	End If
	
	
Next

//////////////////////////////////////////////////////////////////////////
// Se copia la materia prima
// 
//////////////////////////////////////////////////////////////////////////

lds_1.DataObject=tab_1.tabpage_1.dw_mp.DataObject

lds_1.SetTransObject(n_cst_application.itr_appl)
	
ll_res=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_color,ll_cons)

If ll_res<=0 Then
	tab_1.tabpage_1.dw_mp.SetRedraw(True)
	dw_partes.SetRedraw(True)
	Destroy lds_1
	MessageBox("Advertencia!","No se ha parametrizado la materia prima para la muestra seleccionada.",StopSign!)
	Return
End If

lds_1.rowscopy( 1,ll_res,Primary!,tab_1.tabpage_1.dw_mp,1,Primary!)

For i=1 To ll_res
	tab_1.tabpage_1.dw_mp.SetItem(i,"co_fabrica",il_fabrica)
	tab_1.tabpage_1.dw_mp.SetItem(i,"co_linea",il_linea)
	tab_1.tabpage_1.dw_mp.SetItem(i,"co_muestra",il_muestra)
	tab_1.tabpage_1.dw_mp.SetItem(i,"co_talla",il_talla)
	
	tab_1.tabpage_1.dw_mp.SetItem(i,'fe_creacion',ldt_fecha)
	tab_1.tabpage_1.dw_mp.SetItem(i,'fe_actualizacion',ldt_fecha)
	tab_1.tabpage_1.dw_mp.SetItem(i,'usuario',ls_usuario)
	tab_1.tabpage_1.dw_mp.SetItem(i,'instancia',ls_instancia)	
Next



of_nombreParteCombinacion()

of_filtro(dw_partes.GetItemNumber(1,"nu_partemp") /*long al_parte*/,&
					1/*long al_fila*/,&
					dw_colores.GetItemNumber(1,"co_color")/*long al_co_color*/,&
					1/*fila color */,dw_colores.GetItemNumber(1,"cnt_opcion"))
						


If ll_res_obs<>1 Then
	tab_1.tabpage_1.dw_mp.SetRedraw(True)
	dw_partes.SetRedraw(True)
	Destroy lds_1
	Return
End If

lds_1.DataObject=ids_observacion.DataObject

lds_1.SetTransObject(n_cst_application.itr_appl)
	
ll_res=lds_1.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla)

If ll_res<=0 Then
	tab_1.tabpage_1.dw_mp.SetRedraw(True)
	dw_partes.SetRedraw(True)
	Destroy lds_1
	MessageBox("Advertencia!","No se encontraron observaciones, por favor verifique.",StopSign!)
	Return
End If

ids_observacion.Reset()

String ls_observacion,ls_tmp


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

lo_param.il_vector[1]=il_fabrica
lo_param.il_vector[2]=il_linea
lo_param.il_vector[3]=il_muestra
lo_param.il_vector[4]=il_talla
lo_param.il_vector[5]=il_centro

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

OpenSheetWithParm(w_inf_matprima_mues,lo_param,This.ParentWindow(),0,Original!)

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
	MessageBox("Advertencia!","La muestra tiene productos de materia prima, solo es posible hacer copia a muestras sin materia prima.",StopSign!)
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

lds_1.rowscopy( 1,ll_res,Primary!,dw_partes,1,Primary!)

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
decimal lde_dato

//dw_colores
//////////////////////////////////////////////////////////////////////////
// Copio los datos para cada uno de los colores y opciones que se tienen
// 
//////////////////////////////////////////////////////////////////////////
ll_tot1=dw_colores.RowCount()

For j=1 To ll_tot1
	
	ll_color=dw_colores.GetItemnumber(j,"co_color")
	ll_opcion=dw_colores.GetItemnumber(j,"cnt_opcion")
	
	lds_1.SetFilter("co_color="+String(ll_color)+" and cnt_opcion="+String(ll_opcion))
	lds_1.Filter()
	
	ll_tot=lds_1.RowCount()
	
	For i=1 To ll_tot
		ll_fila=tab_1.tabpage_1.dw_mp.InsertRow(0)
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"co_fabrica",il_fabrica)
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"co_linea",il_linea)
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"co_muestra",il_muestra)
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"co_talla",il_talla)
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"co_color",ll_color)
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"cnt_opcion",ll_opcion)
		
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"co_tipoprod",il_tipoprod)
		
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"co_centro",12)
		
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"co_proveedor",999)
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
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"peso_mp",lde_dato)	
	
		ll_dato=lds_1.GetItemNUmber(i,"nu_conos")
		tab_1.tabpage_1.dw_mp.SetItem(ll_fila,"nu_conos",ll_dato)	
		
		
	Next

Next

of_nombreParteCombinacion()

If dw_partes.RowCount()>0 and dw_colores.RowCount()>0 Then

	of_filtro(dw_partes.GetItemNumber(1,"nu_partemp") /*long al_parte*/,&
						1/*long al_fila*/,&
						dw_colores.GetItemNumber(1,"co_color")/*long al_co_color*/,&
						1/*fila color */,dw_colores.GetItemNumber(1,"cnt_opcion"))
						
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
ll_opcion=dw_colores.GetItemNumber(il_fila_color,"cnt_opcion")

ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea borrar la materia prima del color "+&
String(ll_color)+", opci$$HEX1$$f300$$ENDHEX$$n "+String(ll_opcion)+" ?",Question!,YesNo!,2)

If ll_res<>1 Then
	Return
End If

tab_1.tabpage_1.dw_mp.SetRedraw(False)

ls_filtro="co_color="+String(ll_color)+" and cnt_opcion="+String(ll_opcion)
tab_1.tabpage_1.dw_mp.SetFilter(ls_filtro)
tab_1.tabpage_1.dw_mp.Filter()

do while (tab_1.tabpage_1.dw_mp.RowCount()>0) 
	tab_1.tabpage_1.dw_mp.DeleteRow(0)
loop	

tab_1.tabpage_1.dw_mp.SetRedraw(True)

of_filtrar()
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
		ll_opcion=dw_colores.GetItemNumber(i,"cnt_opcion")
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
		
	CASE "co_linea"
		//dw_head.SetItem(1,"co_linea",ll_null)
		//il_linea=-1
		dw_head.SetItem(1,"co_muestra",ll_null)
		il_muestra=-1
		dw_head.SetItem(1,"de_muestra",ls_null)
		dw_head.SetItem(1,"co_talla",ll_null)
		il_talla=-1
		dw_head.SetItem(1,"de_talla",ls_null)
		
	CASE "co_muestra"
		//dw_head.SetItem(1,"co_linea",ll_null)
		//il_linea=-1
		//dw_head.SetItem(1,"co_muestra",ll_null)
		//il_muestra=-1
		//dw_head.SetItem(1,"de_muestra",ls_null)
		dw_head.SetItem(1,"co_talla",ll_null)
		il_talla=-1
		dw_head.SetItem(1,"de_talla",ls_null)
		
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
//		dw_head.SetItem(1,"cnt_opcion",ll_null)
//		il_cons=-1
//		dw_head.SetItem(1,"de_cnt_opcion",ls_null)
//		dw_head.SetItem(1,"co_recurso",ll_null)
//		dw_head.SetItem(1,"de_recurso",ls_null)
//		dw_head.SetItem(1,"id_peso",ls_null)
//		dw_head.SetItem(1,"sw_excepcion",0)		
		

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

tab_1.tabpage_1.dw_mp.setFilter("co_color="+String(a_color)+" and cnt_opcion="+String(a_opcion))

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
ll_opc1=dw_colores.GetItemNumber(1,"cnt_opcion")

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
     " and cnt_opcion="+String(ll_opc1) )
	  
tab_1.tabpage_1.dw_mp.Filter()

n_ds_application lds_1

lds_1=create n_ds_application

lds_1.DataObject=tab_1.tabpage_1.dw_mp.DataObject

tab_1.tabpage_1.dw_mp.rowsCopy(1,tab_1.tabpage_1.dw_mp.RowCount(),Primary!,&
                                  lds_1,1,Primary!)
											 
Long ll_tot,i

ll_tot=lds_1.RowCount()

For i=1 To ll_tot
	lds_1.SetItem(i,"co_color",a_color)
	lds_1.SetItem(i,"cnt_opcion",a_opcion)
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

If idw_data<>tab_1.tabpage_1.dw_mp Then
	Return -1
End If

n_cst_param lo_param
Long ll_fila


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
	ls_filtro+=" and co_color= "+String(al_col)+" and cnt_opcion="+String(al_opcion) 
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
dw_colores.GetItemNumber(il_fila_color,"cnt_opcion"))

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

lds_1.DataObject=tab_1.tabpage_1.dw_mp.DataObject

ll_col=dw_colores.GetItemNumber(il_fila_color,"co_color")
ll_opcion=dw_colores.GetItemNumber(il_fila_color,"cnt_opcion")

ls_filtro="co_color= "+String(ll_col)+" and cnt_opcion="+String(ll_opcion) 

//Messagebox('Var','ls_filtro='+ls_filtro+'~n')

tab_1.tabpage_1.dw_mp.SetFilter(ls_filtro)
tab_1.tabpage_1.dw_mp.Filter()

tab_1.tabpage_1.dw_mp.rowsCopy(1,tab_1.tabpage_1.dw_mp.RowCount(),Primary!,&
                                  lds_1,1,Primary!)
											 
lds_1.Sort()

Long i,ll_tot,lim1,lim2,k,ll_fila,ll_nu_partemp,ll_nu_mp,ll_co_partemp,ll_co_combinacion

ll_fila=il_fila_color

ll_tot=dw_colores.RowCount()

For i=1 To ll_tot
	il_fila_color=i
	ll_col=dw_colores.GetItemNumber(il_fila_color,"co_color")
	ll_opcion=dw_colores.GetItemNumber(il_fila_color,"cnt_opcion")

	ls_filtro="co_color= "+String(ll_col)+" and cnt_opcion="+String(ll_opcion) 
	
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

lds_1.DataObject=tab_1.tabpage_1.dw_mp.DataObject

tab_1.tabpage_1.dw_mp.rowsCopy(1,tab_1.tabpage_1.dw_mp.RowCount(),Primary!,&
                                  lds_1,1,Primary!)
											 
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
			lds_1.SetItem(k,"cnt_opcion",il_opcion)
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
	ll_opc=lds_1.GetItemNumber(i,"cnt_opcion")
	ls_bus="co_color="+String(ll_color)+" and cnt_opcion="+String(ll_opc)
	
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

ids_observacion.Reset()

tab_1.tabpage_3.dw_resumen_mp.Reset()

tab_1.tabpage_3.dw_mat_prima2.Reset()


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
	tab_1.tabpage_1.dw_mp.SetItem(i,"peso_muestra", lde_peso_prod/ide_FACTOR_MUESTRA_A_PDN)
Next
Return 1

end function

public function integer of_recuperar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 29 de Marzo de 2003 HORA 17:08:27:937
// 
// recupera los datos
//////////////////////////////////////////////////////////////////////////

long ll_tot

If il_fabrica=-1 or il_linea=-1 or il_muestra=-1 or il_talla=-1  Then
	
	Return -2
End If

of_resetDw()

ll_tot=dw_head.Retrieve(il_fabrica,il_linea,il_muestra,il_talla)
		 
If ll_tot<0 Then
	Return -1
End If

If ll_tot=0 then
	dw_head.InsertRow(0)
	dw_head.SetItem(1,"co_fabrica",il_fabrica)
	dw_head.SetItem(1,"co_linea",il_linea)
	dw_head.SetItem(1,"co_muestra",il_muestra)
	dw_head.SetItem(1,"co_talla",il_talla)
//	dw_head.SetItem(1,"co_color",il_color)
//	dw_head.SetItem(1,"cnt_opcion",il_cons)
End If

//////////////////////////////////////////////////////////////////////////
// Coloco las descripciones del header
// 
//////////////////////////////////////////////////////////////////////////
Long ll_res
n_cst_comun lo_comun


ll_res=lo_comun.of_nombreMuestra(il_fabrica /*long a_fabrica*/,&
                                    il_linea/*long a_linea*/, &
												il_muestra/*long a_muestra*/, &
												n_cst_application.itr_appl/*transaction a_transaction */)

If ll_res=1 Then
	dw_head.SetItem(1,"de_muestra",lo_comun.of_getString(1))
	il_tipoprod=lo_comun.of_getLong(1)
End If
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

//////////////////////////////////////////////////////////////////////////
// Recupero los colores y coloco el nombre del recurso
// 
//////////////////////////////////////////////////////////////////////////

ll_tot=dw_colores.Retrieve(il_fabrica,il_linea,il_muestra,il_talla)

long ll_co_recurso,i

For i=1 To ll_tot
	ll_co_recurso=dw_head.GetItemNumber(i,"co_Recurso")

	ll_res=lo_comun.of_nombreRecursoTj( ll_co_recurso/*long a_recurso*/,&                            
   								  n_cst_application.itr_appl/*transaction a_transaction */)
												 
	If ll_res=1 Then
		dw_colores.SetItem(i,"de_recurso",lo_comun.of_getString(1))
	End If


	ll_res=lo_comun.of_nombrecolor( il_fabrica/*long a_fabrica*/,&
                         il_linea/*long a_linea*/, &
								 il_color/*long a_color*/, &
							 	 n_cst_application.itr_appl/*transaction a_transaction */)

	If ll_res=1 Then
		dw_head.SetItem(1,"de_color",lo_comun.of_getString(1))											
	End If
Next
//////////////////////////////////////////////////////////////////////////
// Se colocan los pesos de los colores
// 
//////////////////////////////////////////////////////////////////////////
of_pesos_x_color()

long ll_tot1
//////////////////////////////////////////////////////////////////////////
// Recupero el detalle
// 
//////////////////////////////////////////////////////////////////////////

ll_tot1=dw_partes.Retrieve(il_fabrica,il_linea,il_muestra,il_talla   )
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
	ll_res=tab_1.tabpage_1.dw_mp.Retrieve(il_fabrica,il_linea,il_muestra,il_talla)
	
	tab_1.tabpage_1.dw_mp.SetFilter("")
	tab_1.tabpage_1.dw_mp.Filter()

	of_nombreParteCombinacion()
//////////////////////////////////////////////////////////////////////////
// se selecciona por defecto la ultima fila
// 
//////////////////////////////////////////////////////////////////////////
						
   dw_partes.SetFocus()		
	dw_partes.SetRow(ll_tot1)
	dw_partes.ScrollToRow(ll_tot1)
Else
//////////////////////////////////////////////////////////////////////////
// Cuando esta aca es que no tiene datos y pregunta si los desea copiar...
// ojo con el copiar, hay que verificarlo
//////////////////////////////////////////////////////////////////////////
	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea copiar la meteria prima de otra muestra ?",Question!,YesNo!,2)
	If ll_res=1 Then
		PostEvent("ue_copiar_mp")
	End If

End If

long ll_parte
If dw_colores.RowCount()>0 Then
	If ll_tot1>0 Then
		ll_parte=dw_partes.GetItemNumber(ll_tot1,"nu_partemp")
	Else
		ll_parte=-1
	End If
	
	of_filtro(ll_parte /*long al_parte*/,&
               ll_tot1/*long al_fila*/,&
					dw_colores.GetItemNumber(1,"co_color")/*long al_co_color*/,&
					1/*long fila color */,dw_colores.GetItemNumber(1,"cnt_opcion"))
End If					

//////////////////////////////////////////////////////////////////////////
// Recurpero las observaciones
// 
//////////////////////////////////////////////////////////////////////////

ll_tot=ids_observacion.Retrieve(il_fabrica,il_linea,il_muestra,il_talla)

String ls_observacion,ls_tmp

If ll_tot>0 Then
	ls_observacion=ids_observacion.GetItemString(1,"obs_fmp")
End If

tab_1.tabpage_2.dw_observacion.Reset()
For i=1 to 4
	ls_tmp=Trim(mid(ls_observacion,70 * (i -1)+1,70))
	tab_1.tabpage_2.dw_observacion.InsertRow(0)
	tab_1.tabpage_2.dw_observacion.SetItem(i,1,ls_tmp)
Next


Return 1











end function

public function integer of_verificar_parte_combinacion (long a_fabrica, long a_linea, long a_muestra, long a_talla);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 11 de Diciembre de 2003 HORA 13:04:21:414
// 
// Se verifica que los colores de la muestra seleccionadas tengan las mismas
// partes, esto se confirm$$HEX2$$f3002000$$ENDHEX$$con Oscar Acosta de Control T$$HEX1$$e900$$ENDHEX$$cnico
//////////////////////////////////////////////////////////////////////////

n_ds_application lds_1

lds_1=create n_ds_application

lds_1.DataObject="d_dt_fmp_mue1_cp_verif"

lds_1.SetTransObject(n_cst_application.itr_appl)


long i,ll_tot,ll_consec,ll_consec1

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
     " and cnt_opcion="+String(a_opcion) )
	  
tab_1.tabpage_1.dw_mp.Filter()


Do While tab_1.tabpage_1.dw_mp.RowCount()>0 
	tab_1.tabpage_1.dw_mp.DeleteRow(0)
Loop

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
DateTime ldt_fecha
String ls_usuario,ls_instancia

If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If



tab_1.tabpage_1.dw_mp.SetFilter("")
tab_1.tabpage_1.dw_mp.Filter()


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

ll_tot=dw_partes.RowCount()

For i=1 To ll_tot
	ll_parte=dw_partes.GetItemNumber(i,"co_partemp")
	ll_combinacion=dw_partes.GetItemNumber(i,"co_combinacion")
	ll_nupartemp=dw_partes.GetItemNumber(i,"nu_partemp")
	
	tab_1.tabpage_1.dw_mp.SetFilter("nu_partemp="+String(ll_nupartemp))
	tab_1.tabpage_1.dw_mp.Filter()
	
	ll_tot1=tab_1.tabpage_1.dw_mp.RowCount()
	
	For j=1 to ll_tot1
		tab_1.tabpage_1.dw_mp.SetItem(j,"co_partemp",ll_parte)
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



n_cst_comun lo_c

String ls_tmp

If ib_cambio_observaciones and dw_head.RowCount()>0 Then

	For i=1 to 4
		ls_tmp+=lo_c.of_espacios( tab_1.tabpage_2.dw_observacion.GetItemString(i,1),&
									70)
		
	Next	
	
	
	If ids_observacion.Rowcount()=0 Then
		ids_observacion.InsertRow(0)
		ids_observacion.SetItem(1,"co_fabrica",il_fabrica)
		ids_observacion.SetItem(1,"co_linea",il_linea)
		ids_observacion.SetItem(1,"co_muestra",il_muestra)
		ids_observacion.SetItem(1,"co_talla",il_talla)
   End If
	
	ids_observacion.SetItem(1,"obs_fmp",ls_tmp)
	
	If ids_observacion.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
		RollBack Using n_cst_application.itr_appl;
		Return -1
	End If			
	
	If ids_observacion.Update(True,False)<>1 Then
		RollBack Using n_cst_application.itr_appl;
		Return -1
	End If	
	
End If
	
ids_observacion.ResetUpdate()
tab_1.tabpage_1.dw_mp.ResetUpdate()
dw_colores.ResetUpdate()
Return 1








end function

public function integer of_validar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 12 de Abril de 2003 HORA 13:33:25:515
// 
// 
//////////////////////////////////////////////////////////////////////////


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
		dw_colores.GetItemNumber(i,"cnt_opcion"))
		
		ll_tot2=tab_1.tabpage_1.dw_mp.RowCount()
		
		If ll_tot2=0 Then
			
			//MessageBox("Advertencia!","Existen partes sin materia prima, por favor verifique.",StopSign!)
			//Return -1
			ll_sin_mp++
			ll_color1=dw_colores.GetItemNumber(i,"co_color")
			ll_opc1=dw_colores.GetItemNumber(i,"cnt_opcion")
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
Next

If of_controlMo()<>1 Then
	MessageBox("Advertencia!","La muestra no tiene recursos asignados para tejido en la mano de obra.",StopSign!)
	//of_iniciar()
	Return -1
End If

Return 1
	
end function

on w_materia_prima_muestra_c.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_mat_prima_muestra" then this.MenuID = create m_mat_prima_muestra
this.rb_un_col=create rb_un_col
this.rb_todos_col=create rb_todos_col
this.dw_partes=create dw_partes
this.dw_colores=create dw_colores
this.tab_1=create tab_1
this.dw_head=create dw_head
this.gb_head=create gb_head
this.gb_color=create gb_color
this.gb_partes=create gb_partes
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_un_col
this.Control[iCurrent+2]=this.rb_todos_col
this.Control[iCurrent+3]=this.dw_partes
this.Control[iCurrent+4]=this.dw_colores
this.Control[iCurrent+5]=this.tab_1
this.Control[iCurrent+6]=this.dw_head
this.Control[iCurrent+7]=this.gb_head
this.Control[iCurrent+8]=this.gb_color
this.Control[iCurrent+9]=this.gb_partes
end on

on w_materia_prima_muestra_c.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.rb_un_col)
destroy(this.rb_todos_col)
destroy(this.dw_partes)
destroy(this.dw_colores)
destroy(this.tab_1)
destroy(this.dw_head)
destroy(this.gb_head)
destroy(this.gb_color)
destroy(this.gb_partes)
end on

event ue_find;call super::ue_find;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 04 de Diciembre de 2002 HORA 17:20:05:156
// 
// Aca se abre la ventana de selecci$$HEX1$$f300$$ENDHEX$$n
//////////////////////////////////////////////////////////////////////////
n_cst_param lo_param


OpenWithParm(w_opc_mat_prima_muestra_c,is_where)

lo_param=Message.PowerObjectParm

If Not IsValid(lo_param) Then
	Return 
End If

SetPointer(HourGlass!)

il_fabrica    =  lo_param.il_vector[1]
il_linea      =  lo_param.il_vector[2]
il_muestra    =  lo_param.il_vector[3]
il_talla      =  lo_param.il_vector[4]
//il_color      =  lo_param.il_vector[5]
il_tipoprod   =  lo_param.il_vector[5]
//il_cons       =  lo_param.il_vector[7]

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


dw_head.SetTransObject(n_cst_application.itr_appl)
dw_colores.SetTransObject(n_cst_application.itr_appl)
tab_1.tabpage_1.dw_mp.SetTransObject(n_cst_application.itr_appl)
dw_partes.SetTransObject(n_cst_application.itr_appl)

tab_1.tabpage_3.dw_resumen_mp.SetTransObject(n_cst_application.itr_appl)

tab_1.tabpage_3.dw_mat_prima2.SetTransObject(n_cst_application.itr_appl)

dw_head.GetChild("co_talla",idc_talla)

n_cst_comun lo_c

lo_c.of_loadDddw(idc_talla,-1,-1,-1,n_cst_application.itr_appl)

Long ll_res

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

String   ls_UNIDAD_PDN,ls_UNIDAD_MUESTRA_FMP
decimal     lde_TAMANO_MUESTRA_FMP
	
	
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

ids_observacion.DataObject="d_dt_fmp_obs_muestras"

ids_observacion.SetTransObject(n_cst_application.itr_appl)
	
	
	
	
	
	
	
	
	
	
	
	
















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

If of_validar()<>1 Then
	dw_partes.SetRedraw(True)
	tab_1.tabpage_1.dw_mp.SetRedraw(True)
	Return
End If


ll_res=of_grabar()

If ll_res<>1 Then
	
	dw_partes.SetRedraw(True)
   tab_1.tabpage_1.dw_mp.SetRedraw(True)

	Return
End If

Commit Using n_cst_application.itr_appl;

ib_cambios=false

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Datos guardados con exito.")


of_recuperar()

dw_partes.SetRedraw(True)
tab_1.tabpage_1.dw_mp.SetRedraw(True)

end event

event closequery;call super::closequery;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 26 de Diciembre de 2002 HORA 14:23:07:203
// 
// Destroy
//////////////////////////////////////////////////////////////////////////

Destroy ids_observacion
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
ElseIF key= KeyF2! And keyflags=2 Then
	of_buscarProducto()
End If

	



end event

type rb_un_col from radiobutton within w_materia_prima_muestra_c
integer x = 2528
integer y = 132
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

type rb_todos_col from radiobutton within w_materia_prima_muestra_c
integer x = 2528
integer y = 72
integer width = 695
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

type dw_partes from u_dw_application within w_materia_prima_muestra_c
event ue_cambio_partes ( )
integer x = 2167
integer y = 276
integer width = 1518
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
	SetItem(row,"de_parte_combinacion",lo_c.of_getString(1))
	SetItem(row,"co_combinacion",ll_null)
	
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
il_fila_color,dw_colores.GetItemNumber(il_fila_color,"cnt_opcion"))




end event

type dw_colores from u_dw_application within w_materia_prima_muestra_c
integer x = 50
integer y = 272
integer width = 2011
integer height = 452
integer taborder = 40
string dataobject = "d_detalle_fmp_mues"
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
Long ll_res,ll_dato,ll_col_old,ll_opc_old,i



If dwo.name="co_color" Then
	ll_col_old=GetItemNumber(row,"co_color")
	ll_opc_old=GetItemNumber(row,"cnt_opcion")
	
	If of_verifica_col(ll_col_old,ll_opc_old)>0 Then
		MessageBox("Advertencia!","El color tiene materias primas, no se puede modificar.",StopSign!)
		Return 2
	End If

	il_color=Long(Data)

	ll_res=lo_comun.of_nombremuestracolor( il_fabrica,il_linea,il_muestra,il_talla,&
	                                       il_color,n_cst_application.itr_appl)
	If ll_res=1 Then	
//		SetItem(1,"de_color",lo_comun.of_getString(1))
      If IsNull(ll_opc_old) Then
			SetItem(row,"cnt_opcion",of_opcioncolor(il_color))
		End If
	Else
		il_color=-1
		MessageBox("Advertencia!","Color no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
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

If dwo.name="de_cnt_opcion" Then
	ls_dato=GetItemString(Row,"de_cnt_opcion")
	If (IsNull(ls_dato) or Trim(ls_dato)="") And row>1 Then
		ll_col_old=GetItemNumber(row,"co_color")
		ll_opc_old=GetItemNumber(row,"cnt_opcion")
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

SetItem(ll_f,"co_fabrica",il_fabrica)
SetItem(ll_f,"co_linea",il_linea)
SetItem(ll_f,"co_muestra",il_muestra)
SetItem(ll_f,"co_talla",il_talla)

SetColumn("co_color")

If RowCount()>1 Then
	ls_id_peso=GetItemString(1,"id_peso")
	SetItem(ll_f,"id_peso",ls_id_peso)
End If


end event

event ue_deleterow;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 12 de Abril de 2003 HORA 13:57:07:156
// 
// 
//////////////////////////////////////////////////////////////////////////
long ll_col_old,ll_opc_old,ll_f,ll_res

If RowCount()=0 Then
	Return
End If

ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Est$$HEX2$$e1002000$$ENDHEX$$seguro de eliminar el color ?",Question!,YesNo!,2)
If ll_res=2 Then
	Return
End If


ll_f=GetRow()

ll_col_old=GetItemNumber(ll_f,"co_color")
ll_opc_old=GetItemNumber(ll_f,"cnt_opcion")

of_borra_col1(ll_col_old,ll_opc_old)
//If of_verifica_col(ll_col_old,ll_opc_old)>0 Then
//	MessageBox("Advertencia!","El color tiene materias primas, no se puede eliminar.",StopSign!)
//	Return 
//End If
//



deleteRow(0)
end event

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 30 de Mayo de 2003 HORA 09:46:04:078
// 
// selecciona color
//////////////////////////////////////////////////////////////////////////
n_cst_param lo_param

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
il_fila_color,GetItemNumber(il_fila_color,"cnt_opcion"))



end event

type tab_1 from tab within w_materia_prima_muestra_c
event create ( )
event destroy ( )
integer x = 55
integer y = 780
integer width = 3712
integer height = 1084
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
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
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
integer width = 3675
integer height = 964
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
integer width = 3520
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

event itemchanged;call super::itemchanged;If il_err_item_change<>0 Then
	Return 2
End If

n_cst_comun lo_c
long ll_dato,ll_res, ll_null
String ls_Dato, ls_null

SetNUll(ll_null)
SetNull(ls_null)

If dwo.name="co_producto_mp" Then
	ll_dato=Long(Data)
	ll_res=lo_c.of_nombreMatPrima(ll_dato,n_cst_application.itr_appl)
	If ll_res<>1 Then
		MessageBox("Advertencia!","Producto no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If

	SetItem(row,"de_producto",lo_c.of_getString(1))
	
	
	SetItem(row,"co_matiz_mp",ll_null)
	SetItem(row,"co_caracteristi_mp",ll_null)
	SetItem(row,"co_color_mp",ll_null)
	SetItem(row,"co_proveedor",99)
	SetItem(row,"de_proveedor",ls_null)
end If

Decimal lde_peso,lde_p1,lde_pf

If dwo.name="peso_mp" Then
	lde_peso=Dec(Data)
	If ide_FACTOR_MUESTRA_A_PDN<>0 Then
		SetItem(row,"peso_muestra",lde_peso/ide_FACTOR_MUESTRA_A_PDN)
	End If
End If

If dwo.name="peso_muestra" Then
	lde_peso=Dec(Data)
	If ide_FACTOR_MUESTRA_A_PDN<>0 Then
		SetItem(row,"peso_mp",lde_peso*ide_FACTOR_MUESTRA_A_PDN)
	End If
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



Long ll_cons,ll_f

If rb_todos_col.Checked  or dw_colores.RowCount()=0 Then
	MessageBox("Advertencia!","Debe seleccionar un color.",StopSign!)
	Return
End If

If dw_partes.RowCount()=0 Then
	MessageBox("Advertencia!","Debe especificar la parte.",StopSign!)
	Return
End If



ll_cons = Long(This.Describe("Evaluate('max(nu_mp for all)', 0)"))

If IsNull(ll_cons) Then ll_cons=0

ll_cons++

If il_color=-1 Then
	MessageBox("Advertencia!","Debe especificar el color.",StopSign!)
	Return
End If

If il_nu_partemp=-1 Then
	MessageBox("Advertencia!","Debe especificar la parte.",StopSign!)
	Return
End If


super::event ue_insertRow()

ll_f=GetRow()

SetItem(ll_f,"nu_mp",ll_cons)
SetItem(ll_f,"nu_partemp",il_nu_partemp)

SetItem(ll_f,"co_fabrica",il_fabrica)
SetItem(ll_f,"co_linea",il_linea)
SetItem(ll_f,"co_muestra",il_muestra)
SetItem(ll_f,"co_talla",il_talla)
SetItem(ll_f,"co_color",il_color)
SetItem(ll_f,"cnt_opcion",il_opcion)

SetItem(ll_f,"co_partemp",il_co_parte)
SetItem(ll_f,"co_combinacion",il_co_combinacion)
SetItem(ll_f,"co_tipoprod",il_tipoprod)

//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 8 de Abril de 2003 HORA 15:52:26:687
// 
// VALORES POR DEFECTO QUE SE DEFINIERON CON LORENA
//////////////////////////////////////////////////////////////////////////

SetItem(ll_f,"co_proveedor",999)
SetItem(ll_f,"mp_lote",' ')

SetItem(ll_f,"co_fabrica_mp",2)

Setcolumn("co_producto_mp")
//////////////////////////////////////////////////////////////////////////
// Se coloca por defecto el centro de tejido
// 
//////////////////////////////////////////////////////////////////////////

SetItem(ll_f,"co_centro",12)

end event

event sqlpreview;call super::sqlpreview;//MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!",sqlsyntax)

end event

event doubleclicked;call super::doubleclicked;If Row=0 Then Return

n_cst_param lo_param

DWObject ldwo_1

If dwo.name="co_producto_mp" Then
	lo_param.il_vector[1]=il_tipoprod
	
	Open(w_materia_prima)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
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
		SetText(String(lo_param.il_vector[1]))
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


if this.AcceptText() < 0 then
  Return 1
end if
//28 esmp lote
if this.GetColumn() = 27 then 
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

type gb_mp from u_gb_base within tabpage_1
integer x = 18
integer y = 12
integer width = 3616
integer height = 908
integer taborder = 40
string text = "Materia prima (F8)"
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 3675
integer height = 964
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
integer width = 2683
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
integer width = 2811
integer height = 588
string text = "Observaciones (Ctrl+F6)"
end type

type tabpage_3 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3675
integer height = 964
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
integer x = 2098
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
integer x = 2062
integer y = 236
integer width = 1298
integer height = 588
integer taborder = 70
string title = "none"
string dataobject = "d_sp_mu_compos"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type sle_opcion from singlelineedit within tabpage_3
integer x = 2610
integer y = 52
integer width = 357
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
integer x = 2999
integer y = 48
integer width = 329
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
integer width = 1993
integer height = 800
integer taborder = 60
string title = "none"
string dataobject = "d_resumen_mp_mues"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type sle_color from singlelineedit within tabpage_3
integer x = 2245
integer y = 52
integer width = 357
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
integer x = 2103
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
integer x = 2057
integer width = 1289
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

type dw_head from u_dw_application within w_materia_prima_muestra_c
integer x = 55
integer y = 52
integer width = 3589
integer height = 160
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

of_resetDw()
of_resetVar()
Reset()

Super::Event ue_insertRow()


end event

event getfocus;call super::getfocus;gb_head.of_color(True)
end event

event losefocus;call super::losefocus;gb_head.of_color(False)
end event

event itemchanged;call super::itemchanged;long ll_dato,ll_res,ll_null
n_cst_comun lo_comun

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


If dwo.name="co_fabrica" Then
	il_fabrica=long(Data)	
	of_headMod(dwo.name)
End If

If dwo.name="co_linea" Then
	il_linea=long(data)
	of_headMod(dwo.name)
End If

If dwo.name="co_muestra" Then
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
End If

If dwo.name="co_talla" Then
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
	
	of_recuperar()
End If

end event

event ue_deleterow;//If tab_1.tabpage_1.dw_partes.RowCount()>0 Then
//	MessageBox("Advertencia!","No deben existir partes.",StopSign!)
//	Return
//End If
//
//Super::Event ue_deleteRow()
//
end event

event doubleclicked;call super::doubleclicked;If Row=0 Then Return

n_cst_param lo_param

DWObject ldwo_1

If dwo.name="co_talla" Then
	lo_param.il_vector[1]=GetItemNumber(1,"co_fabrica")
	lo_param.il_vector[2]=GetItemNumber(1,"co_linea")
	lo_param.il_vector[3]=GetItemNumber(1,"co_muestra")
	
	OpenWithParm(w_bus_tallas_muestra,lo_param)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If
End If

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
end If
end event

event itemfocuschanged;call super::itemfocuschanged;selectText(1,20)
end event

type gb_head from u_gb_base within w_materia_prima_muestra_c
integer x = 18
integer y = 8
integer width = 3712
integer height = 212
integer taborder = 0
string text = "Datos de la muestra"
end type

type gb_color from u_gb_base within w_materia_prima_muestra_c
integer x = 18
integer y = 220
integer width = 2085
integer height = 528
integer taborder = 30
string text = "Colores (F6)"
end type

type gb_partes from u_gb_base within w_materia_prima_muestra_c
integer x = 2126
integer y = 220
integer width = 1614
integer height = 528
integer taborder = 40
string text = "Partes / Combinaciones (F7)"
end type

