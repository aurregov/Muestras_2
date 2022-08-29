HA$PBExportHeader$w_actividad_muestra.srw
$PBExportComments$Ventana de Registro de Actividades de la muestra para la programaci$$HEX1$$f300$$ENDHEX$$n
forward
global type w_actividad_muestra from w_sheet
end type
type dw_verifica_precedencia from u_dw_application within w_actividad_muestra
end type
type tab_actividad from tab within w_actividad_muestra
end type
type tabpage_criteriotiempo from userobject within tab_actividad
end type
type dw_estimar_tiempo from u_dw_application within tabpage_criteriotiempo
end type
type tabpage_criteriotiempo from userobject within tab_actividad
dw_estimar_tiempo dw_estimar_tiempo
end type
type tabpage_grupos from userobject within tab_actividad
end type
type dw_grupo_actividad from u_dw_application within tabpage_grupos
end type
type tabpage_grupos from userobject within tab_actividad
dw_grupo_actividad dw_grupo_actividad
end type
type tabpage_recursos from userobject within tab_actividad
end type
type dw_recurso_actividad from u_dw_application within tabpage_recursos
end type
type tabpage_recursos from userobject within tab_actividad
dw_recurso_actividad dw_recurso_actividad
end type
type tabpage_maqtin from userobject within tab_actividad
end type
type dw_mu_maqtin_activ from u_dw_application within tabpage_maqtin
end type
type tabpage_maqtin from userobject within tab_actividad
dw_mu_maqtin_activ dw_mu_maqtin_activ
end type
type tabpage_precedencias from userobject within tab_actividad
end type
type dw_operaciones from u_dw_application within tabpage_precedencias
end type
type dw_actividades from u_dw_application within tabpage_precedencias
end type
type gb_1 from groupbox within tabpage_precedencias
end type
type gb_2 from groupbox within tabpage_precedencias
end type
type tabpage_precedencias from userobject within tab_actividad
dw_operaciones dw_operaciones
dw_actividades dw_actividades
gb_1 gb_1
gb_2 gb_2
end type
type tab_actividad from tab within w_actividad_muestra
tabpage_criteriotiempo tabpage_criteriotiempo
tabpage_grupos tabpage_grupos
tabpage_recursos tabpage_recursos
tabpage_maqtin tabpage_maqtin
tabpage_precedencias tabpage_precedencias
end type
type dw_actividad from u_dw_application within w_actividad_muestra
end type
type gb_actividad from u_gb_base within w_actividad_muestra
end type
end forward

global type w_actividad_muestra from w_sheet
string tag = "Registro de Actividades"
integer width = 3648
integer height = 2532
string title = "Registro de Actividades"
string menuname = "m_actividad_muestras"
boolean maxbox = true
boolean vscrollbar = true
windowstate windowstate = maximized!
event ue_eliminar_actividad ( )
dw_verifica_precedencia dw_verifica_precedencia
tab_actividad tab_actividad
dw_actividad dw_actividad
gb_actividad gb_actividad
end type
global w_actividad_muestra w_actividad_muestra

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:10:22
---------------------------------------------------
---------------------------------------------------*/
Public:
	String is_where_busqueda,is_dispo
	Boolean ib_cambios=False,ib_reg=false,ib_save,ib_dbclk
	Long il_id_actividad,il_co_estado,il_criterio,il_co_fabrica, il_tipoprod
	DataWindowChild idc_estado,idc_tipoprod,idc_tipotej,idc_grupotalla,&
						idc_tono,idc_recurso,idc_talla, idc_grupoprod, idc_tipomaquina
						
DataWindowChild idc_actividad, idc_operacion						
end variables

forward prototypes
public function integer of_redraw (boolean al_redrawing)
public function integer of_buscar (long al_id_actividad)
public function integer of_reset ()
public function integer of_carga_objtr ()
public function integer of_carga_dddw (integer al_opc)
public function integer of_error_actividad ()
public function integer of_ok_actividad ()
public function integer of_guardar ()
public function integer of_eliminar_actividad ()
public function integer of_verificar ()
public function integer of_consecutivo ()
public function integer of_cargar_dwo (string as_num)
public function integer of_n_act ()
public function integer of_filtrar_talla (long al_grupotalla)
public function integer of_cargar_dddw ()
public function integer of_verifica_precedencia (long a_tipo, long a_codigo)
end prototypes

event ue_eliminar_actividad();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 25 de Octubre de 2004.H:18:25
---------------------------------------------------
---------------------------------------------------*/
of_Redraw(False)
of_eliminar_actividad()
of_Redraw(True)
end event

public function integer of_redraw (boolean al_redrawing);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:11:23
---------------------------------------------------
---------------------------------------------------*/

dw_actividad.SetRedraw(al_redrawing)
tab_actividad.tabpage_grupos.dw_grupo_actividad.SetRedraw(al_redrawing)
tab_actividad.tabpage_recursos.dw_recurso_actividad.SetRedraw(al_redrawing)
tab_actividad.tabpage_maqtin.dw_mu_maqtin_activ.SetRedraw(al_redrawing)
tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.SetRedraw(al_redrawing)

Return 1
end function

public function integer of_buscar (long al_id_actividad);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:10:26
---------------------------------------------------
Busqueda de las actividades almacenadas
---------------------------------------------------*/
Long ll_resultado, ll_i
String ls_msj=''
n_cst_comun_orden lo_comun
//-------------------------------------------------------------------------------------------------
If ib_cambios Then
	ll_resultado=MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
	If ll_resultado=2 Then
		Return -2
	End If
End If
ib_cambios=False
ib_reg=False
//-------------------------------------------------------------------------------------------------
If dw_actividad.RowCount()>0 Then
			of_Reset()
End If
//-------------------------------------------------------------------------------------------------
// Retrieve a los datos de la tabla de actividades 'm_mu_actividad'
ll_resultado = dw_actividad.Retrieve(al_id_actividad)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de la actividad.",StopSign!)		
		Return -1
	Case 0
		MessageBox("Advertencia!","La actividad no se encontr$$HEX1$$f300$$ENDHEX$$.",StopSign!)			
		Return -1
End Choose


//-------------------------------------------------------------------------------------------------
// Retrieve a los grupos de la tabla 'mu_gru_activ'
ll_resultado = tab_actividad.tabpage_grupos.dw_grupo_actividad.Retrieve(al_id_actividad)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de los grupos de la actividad.",StopSign!)
		Return -1
	Case 0
		ls_msj+='*Actividad sin grupos ~n'
End Choose
//-------------------------------------------------------------------------------------------------
// Retrieve a los recursos de la tabla 'mu_rec_activ'
ll_resultado = tab_actividad.tabpage_recursos.dw_recurso_actividad.Retrieve(al_id_actividad)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de los recursos para la actividad.",StopSign!)
		Return -1
	Case 0
		ls_msj+='*Actividad sin recursos tejido ~n'
End Choose
//-------------------------------------------------------------------------------------------------
// Retrieve a las m$$HEX1$$e100$$ENDHEX$$quinas de la tabla 'mu_maqtin_activ'
ll_resultado = tab_actividad.tabpage_maqtin.dw_mu_maqtin_activ.Retrieve(al_id_actividad)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de las m$$HEX1$$e100$$ENDHEX$$quinas de tintorer$$HEX1$$ed00$$ENDHEX$$a para la actividad.",StopSign!)
		Return -1
	Case 0
		ls_msj+='*Actividad sin recursos de m$$HEX1$$e100$$ENDHEX$$quinas de tintorer$$HEX1$$ed00$$ENDHEX$$a~n'
End Choose
//-------------------------------------------------------------------------------------------------
// Retrieve a los criterios de tiempos 'mu_activ_t#'
//Para el caso en que la actividad no tenga asignado un criterio de tiempo.
il_id_actividad = dw_actividad.GetItemNumber(1,'id_actividad')//al_id_actividad
il_criterio     = dw_actividad.GetItemNumber(1,'criterio_tiempo')
il_tipoprod     = dw_actividad.GetItemNumber(1, 'co_tipoprod')

If Not IsNull(il_criterio) Then
	of_cargar_dwo(String(il_criterio))
	ll_resultado = tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.Retrieve(al_id_actividad)
	Choose Case ll_resultado
		Case Is < 0 
			MessageBox("Advertencia!","Error recuperando datos de criterios de tiempo.",StopSign!)
			Return -1
		Case 0
			ls_msj+='*Actividad sin registros de tiempo para el criterio '+String(il_criterio)+'~n'
			ll_i = tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.InsertRow(0)			
			tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.SetItem(ll_i,"id_actividad",il_id_actividad)
	//		MessageBox("Advertencia!","No se encontraron criterios de tiempo para la actividad.",StopSign!)	
	//		of_reset()		
	//		Return -1
	End Choose
Else
	ls_msj+='*Actividad sin c$$HEX1$$f300$$ENDHEX$$digo de criterio de tiempo asignado~n'
	dw_actividad.SetItem(1,'criterio_tiempo',1)
	of_cargar_dwo('1')
End If
//-------------------------------------------------------------------------------------------------
il_co_estado = dw_actividad.GetItemNumber(1,'co_estado')
dw_actividad.SetFocus( )
dw_actividad.SetColumn('de_actividad')
Title='Registro de Actividades | Actividad: '+String(al_id_actividad)+'| Estado: '+String(il_co_estado)
//-------------------------------------------------------------------------------------------------
of_redraw(True)
If Not ib_save Then
	MessageBox("Actividad Nro. "+String(il_id_actividad),'Actividad Cargada!~n'+ls_msj,Information!)
Else
	ib_save=False
End If
ib_reg=true

lo_comun.of_loaddddw(idc_actividad,il_tipoprod,n_cst_application.itr_appl)
lo_comun.of_loaddddw(idc_operacion,il_tipoprod,n_cst_application.itr_appl)


ll_resultado = tab_actividad.tabpage_precedencias.dw_actividades.Retrieve(al_id_actividad)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando actividades predecesoras.",StopSign!)
		Return -1
	Case 0
		ls_msj+='*Actividad sin actividades predecesoras~n'
End Choose

ll_resultado = tab_actividad.tabpage_precedencias.dw_operaciones.Retrieve(al_id_actividad)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando operaciones predecesoras.",StopSign!)
		Return -1
	Case 0
		ls_msj+='*Actividad sin operaciones predecesoras~n'
End Choose

Return 1
end function

public function integer of_reset ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:10:31
---------------------------------------------------
---------------------------------------------------*/
dw_actividad.reset()
tab_actividad.tabpage_grupos.dw_grupo_actividad.reset()
tab_actividad.tabpage_recursos.dw_recurso_actividad.reset()
tab_actividad.tabpage_maqtin.dw_mu_maqtin_activ.reset()
tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.reset()

Return 1
end function

public function integer of_carga_objtr ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Septiembre de 2004.H:15:18
---------------------------------------------------
Carga los obj. de transacci$$HEX1$$f300$$ENDHEX$$n
---------------------------------------------------*/
dw_actividad.of_conexion(n_cst_application.itr_appl,True)
tab_actividad.tabpage_grupos.dw_grupo_actividad.of_conexion(n_cst_application.itr_appl,True)
tab_actividad.tabpage_recursos.dw_recurso_actividad.of_conexion(n_cst_application.itr_appl,True)
tab_actividad.tabpage_maqtin.dw_mu_maqtin_activ.of_conexion(n_cst_application.itr_appl,True)
tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.of_conexion(n_cst_application.itr_appl,True)

tab_actividad.tabpage_precedencias.dw_actividades.of_conexion(n_cst_application.itr_appl,True)
tab_actividad.tabpage_precedencias.dw_operaciones.of_conexion(n_cst_application.itr_appl,True)
dw_verifica_precedencia.of_conexion(n_cst_application.itr_appl,True)

Return 1

end function

public function integer of_carga_dddw (integer al_opc);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:14:35
---------------------------------------------------
---------------------------------------------------*/
n_cst_comun lo_comun
//-------------------------------------------------
Choose Case al_opc
	Case 1
		dw_actividad.getChild("co_estado",idc_estado)
		lo_comun.of_loaddddw(idc_estado,n_cst_application.itr_appl)
End Choose
Return 1
end function

public function integer of_error_actividad ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:15:40
---------------------------------------------------
Deshace los cambios hechos a la bd.
---------------------------------------------------*/
//************************************************
ROLLBACK USING n_cst_application.itr_appl;
//************************************************
Return 1
end function

public function integer of_ok_actividad ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:15:40
---------------------------------------------------
Acepta los cambios hechos a la bd.
---------------------------------------------------*/
//*****************************************
COMMIT USING n_cst_application.itr_appl ;
//*****************************************
Return 1
end function

public function integer of_guardar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:17:25
---------------------------------------------------
Guarda despues de verificar. Devuelve 1 si es exitoso
---------------------------------------------------*/
Long ll_actividad_control
DateTime ldt_fecha
String ls_usuario,ls_instancia
//---------------------------------------------------
If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If
//---------------------------------------------------
ll_actividad_control=il_id_actividad
If il_id_actividad=0 Then
	If of_consecutivo()<>1 Then
		Return -1
	End If
	dw_actividad.SetItem(1,"id_actividad",il_id_actividad)
End If

If ll_actividad_control=0 Then
	ls_instancia=Trim(ls_instancia)
	dw_actividad.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)
	tab_actividad.tabpage_grupos.dw_grupo_actividad.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)	
	tab_actividad.tabpage_recursos.dw_recurso_actividad.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)	
	tab_actividad.tabpage_maqtin.dw_mu_maqtin_activ.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)	
	tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)	
	
	tab_actividad.tabpage_precedencias.dw_actividades.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)	
	tab_actividad.tabpage_precedencias.dw_operaciones.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)	
	of_n_act()
End If
//---------------------------------------------------------------------------------
If dw_actividad.Update(true,false)<>1 Then 
	of_error_actividad()
	Return -1
End If

If tab_actividad.tabpage_grupos.dw_grupo_actividad.Update(true,false)<>1 Then 
	of_error_actividad()
	Return -1
End If

If tab_actividad.tabpage_recursos.dw_recurso_actividad.Update(true,false)<>1 Then 
	of_error_actividad()
	Return -1
End If

If tab_actividad.tabpage_maqtin.dw_mu_maqtin_activ.Update(true,false)<>1 Then 
	of_error_actividad()
	Return -1
End If

If tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.Update(true,false)<>1 Then 
	of_error_actividad()
	Return -1
End If

If tab_actividad.tabpage_precedencias.dw_actividades.Update(true,false)<>1 Then 
	of_error_actividad()
	Return -1
End If

If tab_actividad.tabpage_precedencias.dw_operaciones.Update(true,false)<>1 Then 
	of_error_actividad()
	Return -1
End If


//---------------------------------------------------------------------------------
dw_actividad.ResetUpdate()
tab_actividad.tabpage_grupos.dw_grupo_actividad.ResetUpdate()
tab_actividad.tabpage_recursos.dw_recurso_actividad.ResetUpdate()
tab_actividad.tabpage_maqtin.dw_mu_maqtin_activ.ResetUpdate()
tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.ResetUpdate()

tab_actividad.tabpage_precedencias.dw_actividades.ResetUpdate()
tab_actividad.tabpage_precedencias.dw_operaciones.ResetUpdate()
//
Return 1
end function

public function integer of_eliminar_actividad ();/*-------------------------------------------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:17:21
//-------------------------------------------------------------------------------------
Elimina la actividad.
-------------------------------------------------------------------------------------*/
long ll_respuesta
n_cst_comun_orden lo_comun
//-------------------------------------------------------------------------------------
If dw_actividad.RowCount()<1 Then
	Return -1
End If

If Not ib_reg Then
	MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Actividad no registrada!.",Information!)
	Return -1
End If
////-------------------------------------------------------------------------------------
ll_respuesta = MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","$$HEX2$$bf002000$$ENDHEX$$Desea eliminar actividad y sus datos relacionados?",Question!,YesNo!,2)
If ll_respuesta<>1 Then
	Return -1
End If
//-------------------------------------------------------------------------------------
If lo_comun.of_del_criactiv(il_id_actividad,il_criterio)<>1 Then
	of_error_actividad()
	Return -1
End If
dw_actividad.DeleteRow(0)
tab_actividad.tabpage_grupos.dw_grupo_actividad.RowsMove(1,tab_actividad.tabpage_grupos.dw_grupo_actividad.RowCount(),Primary!,tab_actividad.tabpage_grupos.dw_grupo_actividad,tab_actividad.tabpage_grupos.dw_grupo_actividad.DeletedCount()+1,Delete!)
tab_actividad.tabpage_recursos.dw_recurso_actividad.RowsMove(1,tab_actividad.tabpage_recursos.dw_recurso_actividad.RowCount(),Primary!,tab_actividad.tabpage_recursos.dw_recurso_actividad,tab_actividad.tabpage_recursos.dw_recurso_actividad.DeletedCount()+1,Delete!)
tab_actividad.tabpage_maqtin.dw_mu_maqtin_activ.RowsMove(1,tab_actividad.tabpage_maqtin.dw_mu_maqtin_activ.RowCount(),Primary!,tab_actividad.tabpage_maqtin.dw_mu_maqtin_activ,tab_actividad.tabpage_maqtin.dw_mu_maqtin_activ.DeletedCount()+1,Delete!)
tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.RowsMove(1,tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.RowCount(),Primary!,tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo,tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.DeletedCount()+1,Delete!)
//-------------------------------------------------------------------------------------
If tab_actividad.tabpage_grupos.dw_grupo_actividad.Update()<>1 Then
	of_error_actividad()
	Return -1
End If

If tab_actividad.tabpage_recursos.dw_recurso_actividad.Update()<>1 Then
	of_error_actividad()
	Return -1
End If

If tab_actividad.tabpage_maqtin.dw_mu_maqtin_activ.Update()<>1 Then
	of_error_actividad()
	Return -1
End If

If tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.Update()<>1 Then
	of_error_actividad()
	Return -1
End If

If dw_actividad.Update()<>1 Then
	of_error_actividad()
	Return -1
End If
//-----------------------------------------------------------------------------
of_Reset()
of_ok_actividad()

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Actividad <"+String(il_id_actividad)+"> ha sido eliminado exitosamente.")
Return 1
end function

public function integer of_verificar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:15:26
---------------------------------------------------
Verificaci$$HEX1$$f300$$ENDHEX$$n de los datos antes de grabar
---------------------------------------------------*/
Long ll_pos,ll_tot,ll_actividad,ll_operacion,i
//---------------------------------------------------------------------------------------------
If dw_actividad.RowCount()<=0 Then
	Return -1
End If

//Modificaci$$HEX1$$f300$$ENDHEX$$n----------------------------------------------------------------------------------
//If tab_actividad.tabpage_grupos.dw_grupo_actividad.RowCount()+tab_actividad.tabpage_recursos.dw_recurso_actividad.RowCount()+&
//	tab_actividad.tabpage_maqtin.dw_mu_maqtin_activ.RowCount()<=0 Then
//	MessageBox("Advertencia!","La actividad debe tener por lo menos, un $$HEX1$$ed00$$ENDHEX$$tem de recurso asignado.",StopSign!)
//	Return -1
//End If
//----------------------------------------------------------------------------------------------
//ll_pos=dw_actividad.GetItemNumber(1,'criterio_tiempo')
If tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.RowCount()<=0 Then
	MessageBox("Advertencia!","La actividad debe tener por lo menos, un tiempo asignado.",StopSign!)
	Return -1
End If
//----------------------------------------------------------------------------------------
If dw_actividad.AcceptText()<>1 Then
	Trigger Event key(Key1!,2)
	MessageBox("Advertencia!","Datos de la actividad no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If tab_actividad.tabpage_grupos.dw_grupo_actividad.AcceptText()<>1 Then
	Trigger Event key(Key3!,2)
	MessageBox("Advertencia!","Datos de los grupos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If tab_actividad.tabpage_recursos.dw_recurso_actividad.AcceptText()<>1 Then
	Trigger Event key(Key4!,2)
	MessageBox("Advertencia!","Datos de los recursos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If tab_actividad.tabpage_maqtin.dw_mu_maqtin_activ.AcceptText()<>1 Then
	Trigger Event key(Key5!,2)
	MessageBox("Advertencia!","Datos de los recursos TIN no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.AcceptText()<>1 Then
	Trigger Event key(Key2!,2)
	MessageBox("Advertencia!","Datos de criterio de tiempo para la actividad no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If tab_actividad.tabpage_precedencias.dw_actividades.AcceptText()<>1 Then
	Trigger Event key(Key6!,2)
	MessageBox("Advertencia!","Datos de actividades precedentes no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If tab_actividad.tabpage_precedencias.dw_operaciones.AcceptText()<>1 Then
	Trigger Event key(Key6!,2)
	MessageBox("Advertencia!","Datos de operaciones precedentes no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If


//----------------------------------------------------------------------------------------
If Not dw_actividad.of_completedata() Then
	Trigger Event key(Key1!,2)
	Return -1
End If
If Not tab_actividad.tabpage_grupos.dw_grupo_actividad.of_completedata() Then
	Trigger Event key(Key3!,2)
	Return -1
End If
If Not tab_actividad.tabpage_recursos.dw_recurso_actividad.of_completedata() Then
	Trigger Event key(Key4!,2)
	Return -1
End If
If Not tab_actividad.tabpage_maqtin.dw_mu_maqtin_activ.of_completedata() Then
	Trigger Event key(Key5!,2)
	Return -1
End If
If Not tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.of_completedata() Then
	Trigger Event key(Key2!,2)
	Return -1
End If

If Not tab_actividad.tabpage_precedencias.dw_actividades.of_completedata() Then
	Trigger Event key(Key6!,2)
	Return -1
End If

If Not tab_actividad.tabpage_precedencias.dw_operaciones.of_completedata() Then
	Trigger Event key(Key6!,2)
	Return -1
End If

ll_tot=tab_actividad.tabpage_precedencias.dw_actividades.RowCount()

For i=1 To ll_tot
	ll_actividad=tab_actividad.tabpage_precedencias.dw_actividades.&
	GetItemNumber(i,"id_actividad_pre")
	
	If of_verifica_precedencia(2,ll_actividad)<>1 Then
		Return -1
	End If

Next

ll_tot=tab_actividad.tabpage_precedencias.dw_operaciones.RowCount()

For i=1 To ll_tot
	ll_operacion=tab_actividad.tabpage_precedencias.dw_operaciones.&
	GetItemNumber(i,"co_operacion")
	
	If of_verifica_precedencia(1,ll_operacion)<>1 Then
		Return -1
	End If

Next

Return 1



end function

public function integer of_consecutivo ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 30 de Septiembre de 2004.H:18:20
---------------------------------------------------
Generaci$$HEX1$$f300$$ENDHEX$$n del consecutivo. Devuelve -1 si el proceso no fu$$HEX1$$e900$$ENDHEX$$
exitoso.
----------------------------------------------------
Consulta del consecutivo
El codigo para las actividades de muestras ser$$HEX2$$e1002000$$ENDHEX$$para el 
ID '28'<--- creada en tiempo de dise$$HEX1$$f100$$ENDHEX$$o
Log del registro :
Table  : cf_consecutivos@crydes
Fields : co_fabrica 		= 2
			id_documento 	= 28
			cs_documento 	= *(ini)
			ob_documento 	= Actividades Muestra-Programaci$$HEX1$$f300$$ENDHEX$$n
			sw_replica		= 0
			instancia		= crydes01/nicdes01
---------------------------------------------------*/
Boolean lb_continuar
Long ll_cantidad
n_ds_application lds_cant_actividad
//--------------------------------------------------
lds_cant_actividad = CREATE n_ds_application
lds_cant_actividad.of_load('d_nro_actividad')
lds_cant_actividad.of_conexion(n_cst_application.itr_appl,True)
	
lb_continuar=True
DO WHILE lb_continuar //*
	il_id_actividad = n_cst_application.of_consecutive(n_cst_application.ii_fabrica,28,n_cst_application.itr_appl)
   If il_id_actividad<=0 Then
		il_id_actividad=0
		MessageBox("Advertencia!","No se pudo determinar el consecutivo de la actividad de muestra para programar.",StopSign!)
		Return -1
	End If
	
	ll_cantidad = lds_cant_actividad.Retrieve(il_id_actividad)
	If ll_cantidad<= 0 Then
			MessageBox("Advertencia!","Error recuperando la cuenta del c$$HEX1$$f300$$ENDHEX$$digo de actividad(ds).",StopSign!)		
			Return -1						
	End If
	ll_cantidad = lds_cant_actividad.GetItemNumber(1,'nro_actividad')
	If ll_cantidad=0 Then
		lb_continuar=False
	End If
LOOP //*
DESTROY lds_cant_actividad
//<------
//MessageBox('INFO','# consecutivo de actividad:'+String(il_id_actividad),Information!)
If il_id_actividad>0 Then
	Return 1
End If
//
Return -1
end function

public function integer of_cargar_dwo (string as_num);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 25 de Octubre de 2004.H:15:42
---------------------------------------------------
Carga los DWObj. seg$$HEX1$$fa00$$ENDHEX$$n el criterio de tiempo
---------------------------------------------------*/
n_cst_comun lo_comun
//-------------------------------------------------
//MessageBox('DWO','DWO='+as_num)
If Match(as_num,'[1-6]') Then	
	tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.of_load('d_mu_activ_t'+Trim(as_num))		
	tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.of_conexion(n_cst_application.itr_appl,True)	
	Choose Case as_num
		Case '1'			
			tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.InsertRow(0)
			tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.SetItem(1,"id_actividad",il_id_actividad)
			tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.SetItemStatus(1,0,Primary!,DataModified!)
			tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.SetItemStatus(1,0,Primary!,NotModified!)
			tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.SetItemStatus(1,0,Primary!,New!)
			tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.SetFocus()
			tab_actividad.tabpage_criteriotiempo.Text='Criterio tiempo: Constante (Ctrl+2)'			
		Case '2'
			tab_actividad.tabpage_criteriotiempo.Text='Criterio tiempo: Cilindros/Nueva-Reforma (Ctrl+2)'
		Case '3'// Cargar la lista de tipoprod & tipo_tejido			
//			tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.GetChild('co_tipoprod',idc_tipoprod)
//			lo_comun.of_loaddddw(idc_tipoprod,n_cst_application.itr_appl)
			tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.getChild("co_tipo_tejido",idc_tipotej)
			lo_comun.of_loadDddw(idc_tipotej,il_tipoprod,n_cst_application.itr_appl)//Parametro tipoprod=10
			idc_tipotej.SetSort('co_tipo_tejido A')
			idc_tipotej.Sort()
			tab_actividad.tabpage_criteriotiempo.Text='Criterio tiempo: Producto/Tejido/Cilindros (Ctrl+2)'
		Case '4'// Cargar la lista de grupo_talla
			tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.GetChild('co_grupo_tlla',idc_grupotalla)//!!! En dise$$HEX1$$f100$$ENDHEX$$o solo es editable no lista!
			lo_comun.of_loaddddw(idc_grupotalla,n_cst_application.itr_appl)
			idc_grupotalla.SetSort('co_grupo_tlla A')
			idc_grupotalla.Sort()
//			tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.GetChild('co_talla',idc_talla)//!!! En dise$$HEX1$$f100$$ENDHEX$$o solo es editable no lista!
//			lo_comun.of_loaddddw(idc_talla,n_cst_application.itr_appl)
//			idc_talla.SetSort('co_talla A')
//			idc_talla.Sort()
			tab_actividad.tabpage_criteriotiempo.Text='Criterio tiempo: GrupoTalla/Talla(Ctrl+2)'
		Case '5'// Cargar la lista de Tono ???????	
//			tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.GetChild('co_tono',idc_tono)//!!! En dise$$HEX1$$f100$$ENDHEX$$o solo es editable no lista!
//			lo_comun.of_loaddddw(idc_tono,n_cst_application.itr_appl)			
			tab_actividad.tabpage_criteriotiempo.Text='Criterio tiempo: Tonos (Ctrl+2)'
			
		Case '6'// Cargar la lista de Grupo tipo de producto y Tipo Maquina
			tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.GetChild('co_grupoprod',idc_grupoprod)
			lo_comun.of_loaddddw(idc_grupoprod, il_tipoprod , n_cst_application.itr_appl)

			tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.GetChild('tipo_maquina', idc_tipomaquina)
			lo_comun.of_loaddddw(idc_tipomaquina,il_tipoprod,n_cst_application.itr_appl)		
			
			tab_actividad.tabpage_criteriotiempo.Text='Criterio tiempo: Prenda/Alimentadores (Ctrl+2)'
	End Choose	
Else
	MessageBox('Error','Error en el c$$HEX1$$f300$$ENDHEX$$digo de criterio',StopSign!)
	Return -1
End If
il_criterio=Long(as_num)
Return 1
end function

public function integer of_n_act ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 25 de Octubre de 2004.H:19:00
---------------------------------------------------
Asigna el valor de las actividades para los registros 
detalle cuando se registra una actividad nueva
---------------------------------------------------*/
Long ll_i
//-------------------------------------------------
For ll_i=1 To tab_actividad.tabpage_grupos.dw_grupo_actividad.RowCount()
	tab_actividad.tabpage_grupos.dw_grupo_actividad.SetItem(ll_i,'id_actividad',il_id_actividad)
Next
For ll_i=1 To tab_actividad.tabpage_recursos.dw_recurso_actividad.RowCount()
	tab_actividad.tabpage_recursos.dw_recurso_actividad.SetItem(ll_i,'id_actividad',il_id_actividad)
Next
For ll_i=1 To tab_actividad.tabpage_maqtin.dw_mu_maqtin_activ.RowCount()
	tab_actividad.tabpage_maqtin.dw_mu_maqtin_activ.SetItem(ll_i,'id_actividad',il_id_actividad)
Next
For ll_i=1 To tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.RowCount()
	tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.SetItem(ll_i,'id_actividad',il_id_actividad)
Next
//----------
Return 1
end function

public function integer of_filtrar_talla (long al_grupotalla);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 28 de Octubre de 2004.H:15:32
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n para filtrar los c$$HEX1$$f300$$ENDHEX$$digos de la talla seg$$HEX1$$fa00$$ENDHEX$$n el 
c$$HEX1$$f300$$ENDHEX$$digo del grupo de la talla
---------------------------------------------------*/
//String ls_f
n_cst_comun lo_comun
//-------------------------------------------------
//idc_talla.SetFilter("")
//idc_talla.Filter()
//ls_f='co_grupo_tlla='+as_grupotalla
//idc_talla.SetFilter(ls_f)
//idc_talla.Filter()
//idc_talla.Sort()
tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.GetChild('co_talla',idc_talla)
lo_comun.of_loaddddw(idc_talla,al_grupotalla,n_cst_application.itr_appl)
idc_talla.SetSort('co_talla A')
idc_talla.Sort()

Return 1
end function

public function integer of_cargar_dddw ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Viernes 15 de Abril de 2005 HORA 13:38:53:640
// 
// 
//////////////////////////////////////////////////////////////////////////


n_cst_comun lo_comun
//-------------------------------------------------
tab_actividad.tabpage_precedencias.dw_actividades.GetChild("id_actividad_pre",idc_actividad)
lo_comun.of_loaddddw(idc_actividad,10,n_cst_application.itr_appl)

tab_actividad.tabpage_precedencias.dw_operaciones.GetChild("co_operacion",idc_operacion)
lo_comun.of_loaddddw(idc_operacion,10,n_cst_application.itr_appl)



Return 1
end function

public function integer of_verifica_precedencia (long a_tipo, long a_codigo);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Lunes 18 de Abril de 2005 HORA 14:47:41:062
// 
// 
//////////////////////////////////////////////////////////////////////////

Long ll_tot,ll_pos,ll_nivel
String ls_cad,ls_msj,ls_cad1

If a_tipo=1 Then
	ls_cad="operaci$$HEX1$$f300$$ENDHEX$$n"
Else
	ls_cad="actividad"
End If

ll_tot=dw_verifica_precedencia.Retrieve(a_tipo,a_codigo, il_tipoprod )

If ll_tot>0 Then
	ll_pos=dw_verifica_precedencia.&
	find("tipo1=2 and id1="+String(il_id_actividad),1,ll_tot)
	
	If ll_pos>0 Then
		ll_nivel=dw_verifica_precedencia.GetItemNumber(ll_pos,"nivel")
		If ll_nivel=1 Then
			ls_cad1="directa"
		Else
			ls_cad1="indirecta"
		End If
		ls_msj="La "+ls_cad+" "+String(a_codigo)+" tiene como predecesora "+ls_cad1+" la actividad "+&
		String(il_id_actividad)+"."		
		
		MessageBox("Advertencia!",ls_msj,StopSign!)
		Return -1
	End If
	
End If

Return 1
end function

on w_actividad_muestra.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_actividad_muestras" then this.MenuID = create m_actividad_muestras
this.dw_verifica_precedencia=create dw_verifica_precedencia
this.tab_actividad=create tab_actividad
this.dw_actividad=create dw_actividad
this.gb_actividad=create gb_actividad
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_verifica_precedencia
this.Control[iCurrent+2]=this.tab_actividad
this.Control[iCurrent+3]=this.dw_actividad
this.Control[iCurrent+4]=this.gb_actividad
end on

on w_actividad_muestra.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_verifica_precedencia)
destroy(this.tab_actividad)
destroy(this.dw_actividad)
destroy(this.gb_actividad)
end on

event key;call super::key;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:09:22
---------------------------------------------------
Uso del ctrl, keyflags=2
---------------------------------------------------*/
IF keyflags = 2 THEN // Keyflags para el 'Ctrl'
	Choose Case Key
		Case Key1!			
			dw_actividad.SetFocus()
		Case Key2!			
			tab_actividad.SelectTab(tab_actividad.tabpage_criteriotiempo)
			tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo.SetFocus()				
		Case Key3!
			tab_actividad.SelectTab(tab_actividad.tabpage_grupos)
			tab_actividad.tabpage_grupos.dw_grupo_actividad.SetFocus()			
		Case Key4!			
			tab_actividad.SelectTab(tab_actividad.tabpage_recursos)
			tab_actividad.tabpage_recursos.dw_recurso_actividad.SetFocus()		
		Case Key5!
			tab_actividad.SelectTab(tab_actividad.tabpage_maqtin)		
			tab_actividad.tabpage_maqtin.dw_mu_maqtin_activ.SetFocus()				
	End Choose
End If
end event

event closequery;call super::closequery;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 28 de Septiembre de 2004.H:15:12
---------------------------------------------------
---------------------------------------------------*/
If ib_cambios Then
	If MessageBox('Validaci$$HEX1$$f300$$ENDHEX$$n','Se perder$$HEX1$$e100$$ENDHEX$$n los cambios realizados. Desea continuar?',Question!,YesNo!,2)=2 Then
		Return 1
	Else
		Return 0
	End If
End If
end event

event ue_find;call super::ue_find;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:15:41
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lou_param
//-------------------------------------------------
Open(w_opc_actividad_muestra)

lou_param = Message.PowerObjectParm

If IsValid(lou_param) Then	
	of_redraw(False)
	of_buscar(lou_param.il_vector[1])	
	is_where_busqueda=lou_param.is_vector[1]
//Else //Opcion Cancelar de la ventana de b$$HEX1$$fa00$$ENDHEX$$squeda...
//	MessageBox('Error','Error en los datos devueltos en la b$$HEX1$$fa00$$ENDHEX$$squeda.',StopSign!)
End If
//---------------------------------------------------
end event

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 21 de Octubre de 2004.H:11:27
---------------------------------------------------
---------------------------------------------------*/
of_carga_objtr()
of_carga_dddw(1)
of_cargar_dddw()
//-------------------------------------------------

end event

event ue_save;call super::ue_save;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 26 de Octubre de 2004.H:10:24
---------------------------------------------------
Guardad datos de actividad
---------------------------------------------------*/
If of_verificar()<>1 Then
	Return
End If

of_Redraw(False)
If of_guardar()<>1 Then
	of_Redraw(True)
	Return
End If
// Acepta los cambios en la BD. si todo sale bien
of_ok_actividad()
//***********************************************
il_id_actividad = dw_actividad.GetItemNumber(1,"id_actividad")
MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","La actividad ~'"+String(il_id_actividad)+"~' se registr$$HEX2$$f3002000$$ENDHEX$$satisfactoriamente.")
ib_cambios=False
ib_save=True
of_buscar(il_id_actividad)
//---------------------------------------------------------------------------
end event

type dw_verifica_precedencia from u_dw_application within w_actividad_muestra
boolean visible = false
integer x = 155
integer y = 1844
integer width = 498
integer height = 500
integer taborder = 60
string dataobject = "d_sp_mu_preced"
boolean vscrollbar = false
boolean livescroll = false
end type

type tab_actividad from tab within w_actividad_muestra
integer x = 37
integer y = 584
integer width = 3438
integer height = 1216
integer taborder = 50
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
tabpage_criteriotiempo tabpage_criteriotiempo
tabpage_grupos tabpage_grupos
tabpage_recursos tabpage_recursos
tabpage_maqtin tabpage_maqtin
tabpage_precedencias tabpage_precedencias
end type

on tab_actividad.create
this.tabpage_criteriotiempo=create tabpage_criteriotiempo
this.tabpage_grupos=create tabpage_grupos
this.tabpage_recursos=create tabpage_recursos
this.tabpage_maqtin=create tabpage_maqtin
this.tabpage_precedencias=create tabpage_precedencias
this.Control[]={this.tabpage_criteriotiempo,&
this.tabpage_grupos,&
this.tabpage_recursos,&
this.tabpage_maqtin,&
this.tabpage_precedencias}
end on

on tab_actividad.destroy
destroy(this.tabpage_criteriotiempo)
destroy(this.tabpage_grupos)
destroy(this.tabpage_recursos)
destroy(this.tabpage_maqtin)
destroy(this.tabpage_precedencias)
end on

type tabpage_criteriotiempo from userobject within tab_actividad
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3401
integer height = 1096
long backcolor = 80269524
string text = "Criterio tiempo (Ctrl+2)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_estimar_tiempo dw_estimar_tiempo
end type

on tabpage_criteriotiempo.create
this.dw_estimar_tiempo=create dw_estimar_tiempo
this.Control[]={this.dw_estimar_tiempo}
end on

on tabpage_criteriotiempo.destroy
destroy(this.dw_estimar_tiempo)
end on

type dw_estimar_tiempo from u_dw_application within tabpage_criteriotiempo
integer x = 55
integer y = 56
integer width = 3328
integer height = 992
integer taborder = 20
string dataobject = "d_mu_activ_t4"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 25 de Octubre de 2004.H:16:40
---------------------------------------------------
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,255)

end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 28 de Octubre de 2004.H:11:45
---------------------------------------------------
---------------------------------------------------*/
Long ll_pos,ll_i
String ls_exp
//-------------------------------------------------
//d_mu_activ_t2 OR //d_mu_activ_t3
If dwo.name = 'cilindros' Then
	If This.of_existcolumn('nuevo_reforma') Then//d_mu_activ_t2
		ls_exp="Match(nuevo_reforma,~'"+This.GetItemString(row,'nuevo_reforma')+"~')"
		ls_exp=dwo.name+"="+data+" AND "+ls_exp	
		ll_pos=find(ls_exp,1,RowCount())
		If ll_pos>0 then		
			MessageBox("Advertencia!","Cilindros y Reforma ya seleccionados.",StopSign!)
			Return 2
		End If
	Else //d_mu_activ_t3
		ls_exp="co_tipo_tejido="+String(This.GetItemNumber(row,'co_tipo_tejido'))
		ls_exp=dwo.name+"="+data+" AND "+ls_exp	
		ll_pos=Find(ls_exp,1,RowCount())
		If ll_pos>0 then		
			MessageBox("Advertencia!","Cilindros y Tipo de tejido ya seleccionados.",StopSign!)
			Return 2
		End If
	End If
End If

If dwo.name = 'nuevo_reforma' Then
	ls_exp='cilindros='+String(This.GetItemNumber(row,'cilindros'))
	ls_exp="Match("+dwo.name+",~'"+data+"~') AND "+ls_exp	
	ll_pos=find(ls_exp,1,RowCount())	
	If ll_pos>0 then		
		MessageBox("Advertencia!","Cilindros y Reforma ya seleccionados.",StopSign!)
		Return 2
	End If
End If
//-------------------------------------------------
//d_mu_activ_t3
If dwo.name = 'co_tipo_tejido' Then
	ls_exp='cilindros='+String(This.GetItemNumber(row,'cilindros'))
	ls_exp=dwo.name+"="+data+" AND "+ls_exp	
	ll_pos=Find(ls_exp,1,RowCount())
	If ll_pos>0 then
		MessageBox("Advertencia!","El tipo de tejido y los Cilindros est$$HEX1$$e100$$ENDHEX$$n seleccionados.",StopSign!)
		Return 2
	End If
	ll_pos=idc_tipotej.Find('co_ttejido='+Data,1,idc_tipotej.RowCount())
	This.SetItem(row,'de_tipo_tejido',Trim(idc_tipotej.GetItemString(ll_pos,'de_ttejido')))
End If
//-------------------------------------------------
//d_mu_activ_t4
If dwo.name = 'co_grupo_tlla' Then
//	ls_exp="co_talla="+String(This.GetItemNumber(row,'co_talla'))
//	ls_exp=dwo.name+"="+data+" AND "+ls_exp
//	//MessageBox('ls_exp',ls_exp)
//	ll_pos=Find(ls_exp,1,RowCount())
//	If ll_pos>0 then		
//		MessageBox("Advertencia!","Grupo talla & Talla ya seleccionados.",StopSign!)
//		Return 2
//	End If
	ll_pos=idc_grupotalla.Find('co_grupo_tlla='+Data,1,idc_grupotalla.RowCount())
	This.SetItem(row,'de_grupo_tlla',Trim(idc_grupotalla.GetItemString(ll_pos,'de_grupo_tlla')))
	SetNull(ll_i)
	This.SetItem(row,'co_talla',ll_i)
	This.SetItem(row,'de_talla','')
	of_filtrar_talla(Long(Data))//Filtra las tallas por el grupotalla seleccionado	
End If

If dwo.name = 'co_talla' Then
	ls_exp="co_grupo_tlla="+String(This.GetItemNumber(row,'co_grupo_tlla'))
	ls_exp=dwo.name+"="+data+" AND "+ls_exp	
	ll_pos=find(ls_exp,1,RowCount())
	If ll_pos>0 then		
		MessageBox("Advertencia!","Grupo talla & Talla ya seleccionados.",StopSign!)						
		Return 2
	End If
	ll_pos=idc_talla.Find("co_talla="+Data,1,idc_talla.RowCount())
	ls_exp=idc_talla.GetItemString(ll_pos,'de_talla')
	This.SetItem(row,'de_talla',Trim(ls_exp))
End If
//-------------------------------------------------
//d_mu_activ_t5
If dwo.name = 'co_tono' Then
	ll_pos=find("co_tono="+data,1,RowCount())
	If ll_pos>0 then
		MessageBox("Advertencia!","El tono ya est$$HEX2$$e1002000$$ENDHEX$$seleccionado.",StopSign!)
		Return 2
	End If
End If
//--------------------------------------------------
ib_cambios=True
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 25 de Octubre de 2004.H:16:40
---------------------------------------------------
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,0)
end event

event rowfocuschanged;call super::rowfocuschanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 17 de Noviembre de 2004.H:11:20
---------------------------------------------------
---------------------------------------------------*/
//--------------------------------------------------------------------
If CurrentRow<=0 Then Return
//--------------------------------------------------------------------
If This.of_existcolumn('co_talla') Then
	If currentrow>0 and Not IsNull(currentrow) Then
			of_filtrar_talla(This.GetItemNumber(currentrow,'co_grupo_tlla'))
	End If
End If
//---------------------------------------------------
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 25 de Octubre de 2004.H:11:55
---------------------------------------------------
---------------------------------------------------*/
Long ll_i,ll_res
n_cst_comun_orden lo_comun
//-------------------------------------------------
If dw_actividad.Rowcount()<=0 Then
	MessageBox("Advertencia!","Debe especificar la actividad para la muestra.",StopSign!)
	Return
End If
///
ll_i = dw_actividad.GetItemNumber(1,'criterio_tiempo')
If IsNull(ll_i) And il_id_actividad<>0 Then
	MessageBox("Advertencia!","Debe especificar un criterio de tiempo.",StopSign!)
	Return
End If
//-------------------------------------------------
If il_criterio=1 Then
	Return
End If
//-------------------------------------------------
//Solo tiene 4 opciones posibles para criterio tiempo 2
If il_criterio=2 And This.RowCount()>=4 Then
	Return
End If
//-------------------------------------------------	
//-------------------------------------------------
//Solo tiene 3 opciones posibles para criterio tiempo 5
If This.of_existcolumn('co_tono') And This.RowCount()>=3 Then
	Return
End If
//-------------------------------------------------	
Super::Event ue_insertRow()
ll_i = This.GetRow()
This.SetItem(ll_i,"id_actividad",il_id_actividad)

//-------------------------------------------------	
If This.of_existcolumn('co_tipoprod') Then
	ll_res=lo_comun.of_nombretipoprod(GetItemNumber(ll_i,'co_tipoprod'),n_cst_application.itr_appl)
	If ll_res<>1 Then
		MessageBox("Advertencia!","El valor de tipo producto por defecto no es v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return
	End If
	SetItem(ll_i,"de_tipoprod",Trim(lo_comun.of_getString(1)))
End If

If This.of_existcolumn('co_grupo_tlla') Then
	ll_res=lo_comun.of_nombregrupotalla(GetItemNumber(ll_i,'co_grupo_tlla'),n_cst_application.itr_appl)
	If ll_res<>1 Then
		MessageBox("Advertencia!","El valor de grupo talla por defecto no es v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return
	End If
	SetItem(ll_i,"de_grupo_tlla",Trim(lo_comun.of_getString(1)))
	of_filtrar_talla(GetItemNumber(ll_i,'co_grupo_tlla'))
End If
//-------------------------------------------------	
This.SetItemStatus(ll_i,0,Primary!,DataModified!)
This.SetItemStatus(ll_i,0,Primary!,NotModified!)
This.SetItemStatus(ll_i,0,Primary!,New!)

end event

event ue_deleterow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 15 de Diciembre de 2004.H:17:06
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
If il_criterio=1 Then
	Return
End If
Super::Event ue_deleteRow()
end event

type tabpage_grupos from userobject within tab_actividad
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3401
integer height = 1096
long backcolor = 80269524
string text = "Grupos (Ctrl+3)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_grupo_actividad dw_grupo_actividad
end type

on tabpage_grupos.create
this.dw_grupo_actividad=create dw_grupo_actividad
this.Control[]={this.dw_grupo_actividad}
end on

on tabpage_grupos.destroy
destroy(this.dw_grupo_actividad)
end on

type dw_grupo_actividad from u_dw_application within tabpage_grupos
integer x = 55
integer y = 56
integer width = 1609
integer height = 992
integer taborder = 20
string dataobject = "d_mu_gru_activ"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:17:10
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lo_param
//--------------------------------------------------------------------
If Row<=0 Then Return
//--------------------------------------------------------------------
If dwo.name="id_grupo" then
		lo_param.il_vector[1]=il_id_actividad
		lo_param.il_vector[2]=il_tipoprod
		OpenWithParm(w_bus_grupo_act,lo_param)
		lo_param=Message.PowerObjectParm
		If IsValid(lo_param) Then
			SetText(String(lo_param.il_vector[1]))
			AcceptText()
			SetColumn('de_grupo')
			//SetItem(row,'de_grupo',lo_param.is_vector[1])		
		End If		
End If
end event

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:09:31
---------------------------------------------------
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,255)
end event

event itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:16:53
---------------------------------------------------
---------------------------------------------------*/
Long ll_pos, ll_resultado,ll_grupo
n_cst_comun_orden lo_comun //orden.lib
//-------------------------------------------------
If il_err_item_change<>0 Then
	Return 2
End If
//--------------------------------------------------------------------
If dwo.name="id_grupo" Then
	ll_pos=find("id_grupo="+data,1,RowCount())
	If ll_pos>0 then
		MessageBox("Advertencia!","El grupo ya est$$HEX2$$e1002000$$ENDHEX$$seleccionado.",StopSign!)
		//Setitem(row,'de_grupo','')
		Return 2
	End If
	ll_grupo=Long(Data)
	ll_resultado=lo_comun.of_nombregrupoact(ll_grupo,n_cst_application.itr_appl)
	If ll_resultado<>1 Then
		MessageBox("Advertencia!","Grupo de actividad no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_grupo",Trim(lo_comun.of_getString(1)))
End If
//--------------------------------------------------------------
ib_cambios = True
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:09:31
---------------------------------------------------
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,0)
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:15:30
---------------------------------------------------
---------------------------------------------------*/
Long ll_i
//-------------------------------------------------
If dw_actividad.Rowcount()<=0 Then
	MessageBox("Advertencia!","Debe especificar la actividad para la muestra.",StopSign!)
	Return
End If
//-------------------------------------------------
Super::Event ue_insertRow()
ll_i = This.GetRow()
This.SetItem(ll_i,"id_actividad",il_id_actividad)
This.SetColumn('id_grupo')
This.SetItemStatus(ll_i,0,Primary!,New!)

end event

event itemerror;call super::itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 10 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Integer li_null
String ls_col
//-------------------------------------------------
If dwo.name='id_grupo' Then
	If Long(Data)=0 Then
		SetNull(li_null)
		ls_col=dwo.name
		This.SetItem(row,ls_col,li_null)
		This.SetItem(row,'de_grupo','')		
		Return 3
	End If
End If
end event

type tabpage_recursos from userobject within tab_actividad
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3401
integer height = 1096
long backcolor = 80269524
string text = "Recursos Tejido (Ctrl+4)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_recurso_actividad dw_recurso_actividad
end type

on tabpage_recursos.create
this.dw_recurso_actividad=create dw_recurso_actividad
this.Control[]={this.dw_recurso_actividad}
end on

on tabpage_recursos.destroy
destroy(this.dw_recurso_actividad)
end on

type dw_recurso_actividad from u_dw_application within tabpage_recursos
integer x = 55
integer y = 56
integer width = 1719
integer height = 992
integer taborder = 40
string dataobject = "d_mu_rec_activ"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:17:57
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lo_param
//--------------------------------------------------------------------
If Row<=0 Then Return
//--------------------------------------------------------------------

If dwo.name="co_recurso" Then
	lo_param.il_vector[1] = il_tipoprod
	OpenWithParm(w_bus_m_recurso_tj, lo_param)
	lo_param=Message.PowerObjectParm
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
		AcceptText()
		SetColumn('de_recurso')
	End If
End If
end event

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:09:31
---------------------------------------------------
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,255)
end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:16:53
---------------------------------------------------
---------------------------------------------------*/
Long ll_dato,ll_res,ll_pos
n_cst_comun lo_comun
//-------------------------------------------------
If il_err_item_change<>0 Then
	Return 2
End If
//--------------------------------------------------------------------
If dwo.name="co_recurso" Then
	ll_pos=find("co_recurso="+data,1,RowCount())
	If ll_pos>0 then
		MessageBox("Advertencia!","El recurso ya est$$HEX2$$e1002000$$ENDHEX$$seleccionado.",StopSign!)
		//Setitem(row,'de_recurso','')
		Return 2
	End If
	ll_dato=Long(Data)
	ll_res=lo_comun.of_nombrerecursotj(ll_dato,n_cst_application.itr_appl)
	If ll_res<>1 Then
		MessageBox("Advertencia!","Recurso no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(Row,"de_recurso",Trim(lo_comun.of_getString(1)))
End If
//--------------------------------------------------------------
ib_cambios = True
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:09:31
---------------------------------------------------
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,0)
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:15:30
---------------------------------------------------
---------------------------------------------------*/
Long ll_i
//-------------------------------------------------
If dw_actividad.Rowcount()<=0 Then
	MessageBox("Advertencia!","Debe especificar la actividad para la muestra.",StopSign!)
	Return
End If
//-------------------------------------------------
Super::Event ue_insertRow()
ll_i = This.GetRow()
This.SetItem(ll_i,"id_actividad",il_id_actividad)
This.SetColumn('co_recurso')
This.SetItemStatus(ll_i,0,Primary!,New!)
end event

event itemerror;call super::itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 10 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Integer li_null
String ls_col
//-------------------------------------------------
If dwo.name='co_recurso' Then
	If Long(Data)=0 Then
		SetNull(li_null)
		ls_col=dwo.name
		This.SetItem(row,ls_col,li_null)
		This.SetItem(row,'de_recurso','')		
		Return 3
	End If		
End If
end event

type tabpage_maqtin from userobject within tab_actividad
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3401
integer height = 1096
long backcolor = 80269524
string text = "M$$HEX1$$e100$$ENDHEX$$quinas Tintorer$$HEX1$$ed00$$ENDHEX$$a (Ctrl+5)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_mu_maqtin_activ dw_mu_maqtin_activ
end type

on tabpage_maqtin.create
this.dw_mu_maqtin_activ=create dw_mu_maqtin_activ
this.Control[]={this.dw_mu_maqtin_activ}
end on

on tabpage_maqtin.destroy
destroy(this.dw_mu_maqtin_activ)
end on

type dw_mu_maqtin_activ from u_dw_application within tabpage_maqtin
integer x = 55
integer y = 56
integer width = 3154
integer height = 992
integer taborder = 50
string dataobject = "d_mu_maqtin_activ"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:17:57
---------------------------------------------------
---------------------------------------------------*/
Long ll_fabrica,ll_maquina,ll_pos
n_cst_param lo_param
//-------------------------------------------------
If Row=0 Then Return
//-------------------------------------------------
If dwo.name="co_fabrica" OR dwo.name="cs_maquina" Then
		Open(w_bus_recursotin_act)
		lo_param=Message.PowerObjectParm
		If IsValid(lo_param) Then
				//ib_dbclk=True
				//il_co_fabrica=This.GetItemNumber(row,'co_fabrica')
				//This.SetItem(row,'co_fabrica',lo_param.il_vector[1])
				//SetText(String(lo_param.il_vector[2]))
				//AcceptText()
				//SetColumn('de_maquina')
				//SetItem(Row,"de_maquina",lo_param.is_vector[1])
				ll_fabrica=lo_param.il_vector[1]
				ll_maquina=lo_param.il_vector[2]
				ll_pos=This.Find("co_fabrica="+String(ll_fabrica)+" AND cs_maquina="+String(ll_maquina),1,This.RowCount())
				If ll_pos>0 then
					MessageBox("Advertencia!","Esta m$$HEX1$$e100$$ENDHEX$$quina ya esta seleccionada para la f$$HEX1$$e100$$ENDHEX$$brica # "+String(ll_fabrica)+&
									" y el consec. # "+String(ll_maquina),StopSign!)			
					Return 2
				End If
				This.SetItem(row,'co_fabrica',ll_fabrica)
				This.SetItem(row,'cs_maquina',ll_maquina)
				This.SetItem(row,'de_maquina',lo_param.is_vector[1])		
		End If
End If
ib_cambios=True
end event

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:09:31
---------------------------------------------------
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,255)
end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:16:53
---------------------------------------------------
---------------------------------------------------*/
Boolean lb_desc
Long ll_dato,ll_res,ll_pos,ll_cs_maquina,ll_co_fabrica
n_cst_comun_orden lo_comun
//-------------------------------------------------
If il_err_item_change<>0 Then
	Return 2
End If
//--------------------------------------------------------------------
lb_desc=False
If dwo.name="co_fabrica" Then
	ll_cs_maquina=This.GetItemNumber(row,'cs_maquina')
	If IsNull(ll_cs_maquina) Then Return 0
	ll_pos=This.Find("co_fabrica="+data+" AND cs_maquina="+String(ll_cs_maquina),1,This.RowCount())
	If ll_pos>0 then
		MessageBox("Advertencia!","Esta f$$HEX1$$e100$$ENDHEX$$brica ya esta seleccionada para el consecutivo de m$$HEX1$$e100$$ENDHEX$$quina # "+String(ll_cs_maquina),StopSign!)
		//Setitem(row,'de_maquina','')
		Return 2
	End If
	ll_co_fabrica=Long(Data)	
	lb_desc=True
End If
//--------------------------------------------------------------------
If dwo.name="cs_maquina" Then
	ll_co_fabrica=This.GetItemNumber(row,'co_fabrica')
	If IsNull(ll_co_fabrica) Then Return 0
	ll_pos=find("co_fabrica="+String(ll_co_fabrica)+" AND cs_maquina="+Data,1,This.RowCount())
	If ll_pos>0 then
		MessageBox("Advertencia!","Esta m$$HEX1$$e100$$ENDHEX$$quina ya esta seleccionada para la fabrica # "+String(ll_co_fabrica),StopSign!)
		//Setitem(row,'de_maquina','')
		If ib_dbclk Then
				This.SetItem(row,'co_fabrica',il_co_fabrica)
		End If
		ib_dbclk=False
		Return 2
	End If
	ll_cs_maquina=Long(Data)	
	lb_desc=True
End If
//--------------------------------------------------------------------
If lb_desc Then
			ll_res=lo_comun.of_nombreMaqTin(ll_co_fabrica,ll_cs_maquina,n_cst_application.itr_appl)
			If ll_res<>1 Then
				MessageBox("Advertencia!","La m$$HEX1$$e100$$ENDHEX$$quina de tintorer$$HEX1$$ed00$$ENDHEX$$a no es v$$HEX1$$e100$$ENDHEX$$lida en el registro.",StopSign!)
				If ib_dbclk Then
						This.SetItem(row,'co_fabrica',il_co_fabrica)
				End If
				ib_dbclk=False
				Return 2
			End If
			SetItem(Row,"de_maquina",Trim(lo_comun.of_getString(1)))
End If
//--------------------------------------------------------------
ib_dbclk=False
ib_cambios = True
//--------------------------------------------------------------------
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:09:31
---------------------------------------------------
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,0)
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:15:30
---------------------------------------------------
---------------------------------------------------*/
Long ll_i
//-------------------------------------------------
If dw_actividad.Rowcount()<=0 Then
	MessageBox("Advertencia!","Debe especificar la actividad para la muestra.",StopSign!)
	Return
End If
//-------------------------------------------------
Super::Event ue_insertRow()
ll_i = This.GetRow()
This.SetItem(ll_i,"id_actividad",il_id_actividad)
This.SetColumn('co_fabrica')
This.SetItemStatus(ll_i,0,Primary!,New!)
end event

event itemerror;call super::itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 10 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Integer li_null
String ls_col
//-------------------------------------------------
If dwo.name='co_fabrica' OR dwo.name='cs_maquina' Then
	If Long(Data)=0 Then
		SetNull(li_null)
		ls_col=dwo.name
		This.SetItem(row,ls_col,li_null)
		This.SetItem(row,'de_maquina','')		
		Return 3
	End If		
End If
end event

type tabpage_precedencias from userobject within tab_actividad
integer x = 18
integer y = 104
integer width = 3401
integer height = 1096
long backcolor = 80269524
string text = "Precedencias"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_operaciones dw_operaciones
dw_actividades dw_actividades
gb_1 gb_1
gb_2 gb_2
end type

on tabpage_precedencias.create
this.dw_operaciones=create dw_operaciones
this.dw_actividades=create dw_actividades
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.dw_operaciones,&
this.dw_actividades,&
this.gb_1,&
this.gb_2}
end on

on tabpage_precedencias.destroy
destroy(this.dw_operaciones)
destroy(this.dw_actividades)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type dw_operaciones from u_dw_application within tabpage_precedencias
integer x = 1659
integer y = 84
integer width = 1614
integer height = 920
integer taborder = 50
string dataobject = "d_mu_pr_ac_op"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:15:30
---------------------------------------------------
---------------------------------------------------*/
Long ll_i
//-------------------------------------------------
If dw_actividad.Rowcount()<=0 Then
	MessageBox("Advertencia!","Debe especificar la actividad para la muestra.",StopSign!)
	Return
End If
//-------------------------------------------------
Super::Event ue_insertRow()
ll_i = This.GetRow()
This.SetItem(ll_i,"id_actividad",il_id_actividad)

end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Noviembre de 2004.H:09:05
---------------------------------------------------
---------------------------------------------------*/
Long ll_pos, ll_resultado, ll_estado_operacion
n_cst_comun_orden lo_comun //orden.lib
//-------------------------------------------------
If il_err_item_change<>0 Then
	Return 2
End If
//--------------------------------------------------------------------
If dwo.name="co_operacion" Then
	ll_pos=Find("co_operacion="+data,1,RowCount())
	If ll_pos>0 then
		MessageBox("Advertencia!","La operaci$$HEX1$$f300$$ENDHEX$$n predecesora ya est$$HEX2$$e1002000$$ENDHEX$$seleccionada.",StopSign!)
		//Setitem(row,'de_operacion','')
		Return 2
	End If
	ll_pos=idc_operacion.Find("co_operacion="+data,1,idc_operacion.RowCount())
	
//////////////////////////////////////////////////////////////////////////
// Verifico la precedencia de la operacion
// 
//////////////////////////////////////////////////////////////////////////

	
	If of_verifica_precedencia(1,long(Data))<>1 Then
		Return 2
	End If

	
	SetItem(row,"de_operacion",Trim(idc_operacion.GetItemString(ll_pos,'de_operacion')))
//	ll_resultado=lo_comun.of_nombreoperacion(10,Long(Data),n_cst_application.itr_appl)
//	If ll_resultado<>1 Then
//		MessageBox("Advertencia!","Operaci$$HEX1$$f300$$ENDHEX$$n predecesora no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
//		Return 2
//	End If
//	SetItem(row,"de_operaci$$HEX1$$f300$$ENDHEX$$n",lo_comun.of_getString(1))
End If
//--------------------------------------------------------------
ib_cambios = True
end event

type dw_actividades from u_dw_application within tabpage_precedencias
integer x = 55
integer y = 84
integer width = 1358
integer height = 920
integer taborder = 40
string dataobject = "d_mu_pr_ac_ac"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:09:31
---------------------------------------------------
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,255)
end event

event itemerror;call super::itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 10 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Integer li_null
String ls_col
//-------------------------------------------------
If dwo.name='id_grupo' Then
	If Long(Data)=0 Then
		SetNull(li_null)
		ls_col=dwo.name
		This.SetItem(row,ls_col,li_null)
		This.SetItem(row,'de_grupo','')		
		Return 3
	End If
End If
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:09:31
---------------------------------------------------
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,0)
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:15:30
---------------------------------------------------
---------------------------------------------------*/
Long ll_i
//-------------------------------------------------
If dw_actividad.Rowcount()<=0 Then
	MessageBox("Advertencia!","Debe especificar la actividad para la muestra.",StopSign!)
	Return
End If
//-------------------------------------------------
Super::Event ue_insertRow()
ll_i = This.GetRow()
This.SetItem(ll_i,"id_actividad",il_id_actividad)

end event

event itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Viernes 15 de Abril de 2005 HORA 13:36:07:609
// 
// 
//////////////////////////////////////////////////////////////////////////
Long ll_pos, ll_resultado, ll_estado_actividad,ll_tot,ll_nivel
n_cst_comun_orden lo_comun //orden.lib
//-------------------------------------------------
If il_err_item_change<>0 Then
	Return 2
End If
//--------------------------------------------------------------------
If dwo.name="id_actividad_pre" Then
	ll_pos=find("id_actividad_pre="+data,1,RowCount())
	If ll_pos>0 then
		MessageBox("Advertencia!","La actividad predecesora ya est$$HEX2$$e1002000$$ENDHEX$$seleccionada.",StopSign!)
		//Setitem(row,'de_actividad','')
		Return 2
	End If
	ll_pos=idc_actividad.Find("id_actividad="+data,1,idc_actividad.RowCount())
	If ll_pos<=0 Then
		MessageBox("Advertencia!","Actividad no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If	
	
//////////////////////////////////////////////////////////////////////////
// Verifica la precedencia de la actividad
// 
//////////////////////////////////////////////////////////////////////////
	If of_verifica_precedencia(2,long(Data))<>1 Then
		Return 2
	End If
	
	SetItem(row,"de_actividad",Trim(idc_actividad.GetItemString(ll_pos,'de_actividad')))
//	ll_resultado=lo_comun.of_nombreactividad(ll_actividad,n_cst_application.itr_appl)
//	If ll_resultado<>1 Then
//		MessageBox("Advertencia!","Actividad predecesora no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
//		Return 2
//	End If
//	SetItem(row,"de_actividad",lo_comun.of_getString(1))
End If
//--------------------------------------------------------------
ib_cambios = True
end event

type gb_1 from groupbox within tabpage_precedencias
integer x = 23
integer y = 24
integer width = 1477
integer height = 1016
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Actividades predecesoras"
end type

type gb_2 from groupbox within tabpage_precedencias
integer x = 1595
integer y = 24
integer width = 1723
integer height = 1016
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Operaciones predecesoras"
end type

type dw_actividad from u_dw_application within w_actividad_muestra
integer x = 73
integer y = 68
integer width = 3365
integer height = 480
string dataobject = "d_mu_m_actividad"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:09:31
---------------------------------------------------
---------------------------------------------------*/
gb_actividad.of_color(True)
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:09:31
---------------------------------------------------
---------------------------------------------------*/
gb_actividad.of_color(False)
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:12:00
---------------------------------------------------
---------------------------------------------------*/
Long ll_res,ll_c
//-------------------------------------------------
If ib_cambios Then
	ll_res=MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
	
	If ll_res=2 Then
	 Return
	End If
End If
//--------------------------------------------------
of_reset()
il_id_actividad=0
Parent.title="Registro de Actividades."
Call Super::ue_insertrow
This.SetItem(1,'id_actividad',il_id_actividad)
ll_c=This.GetItemNumber(1,'criterio_tiempo')
If IsNull(ll_c) Then
 	ll_c=1 //Criterio tiempo 1
End If
of_cargar_dwo(String(ll_c))
This.SetFocus( )
This.SetColumn('de_actividad')
ib_reg=false
SetNull(il_tipoprod)


end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:14:34
---------------------------------------------------
---------------------------------------------------*/
Long ll_i, ll_criterio_ant
String ls_dwo_criterio,ls_de_act
n_cst_comun  lo_comun
u_dw_application ldw_criterio
//-------------------------------------------------
If il_err_item_change<>0 Then
	Return 2
End If
//-------------------------------------------------
If dwo.name = 'co_estado' Then	
	il_co_estado = Long(Data)
	ll_i=idc_estado.Find('co_estado='+Data,1,idc_estado.RowCount())
	This.SetItem(row,'de_estado',Trim(idc_estado.GetItemString(ll_i,'de_estado')))
End If
//--------------------------------------------------------------
If dwo.name = 'criterio_tiempo' Then
	ll_criterio_ant = GetItemNumber(row, 'criterio_tiempo')
	IF IsNull(il_tipoprod) THEN
		MessageBox('Advertencia','Es necesario seleccionar primero el tipo de producto.', Exclamation!)
		SetText(String(ll_criterio_ant))
		SetFocus()
		SetColumn("co_tipoprod")
		Return 1	
	ELSE
		ldw_criterio = tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo
		If ldw_criterio.RowCount()>0 AND (ldw_criterio.ModifiedCount() + ldw_criterio.DeletedCount())>0 Then
			If MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","$$HEX1$$bf00$$ENDHEX$$Desea cambiar de criterio de tiempo?",Question!,YesNo!,2)=2 Then
				Return 2		
			End If
		End If
		//***************************************************************************
		of_cargar_dwo(Data)
		ll_i=ldw_criterio.Retrieve(il_id_actividad)
		Choose Case ll_i
			Case Is < 0
				MessageBox('Advertencia','Error en la b$$HEX1$$fa00$$ENDHEX$$squeda de tiempos para el criterio de tiempo ~''+Data+'~'',StopSign!)
				Return 1
			Case 0
				ldw_criterio.Event ue_insertrow()
				If Long(Data)=1 Then of_cargar_dwo('1')
		End Choose
	END IF
End If
//--------------------------------------------------------------
If dwo.name = 'de_actividad' Then		
		If Trim(Data)='' AND Not IsNull(Data) Then
			MessageBox('Advertencia','Texto de la descripci$$HEX1$$f300$$ENDHEX$$n de la actividad no es v$$HEX1$$e100$$ENDHEX$$lido.S$$HEX1$$f300$$ENDHEX$$lo hay espacios en blanco',StopSign!)
			Return 1
		End If
		If This.of_validarcadena(Data)<>1 Then 
			Return 1
		End If	
End If

//--------------------------------------------------------------
// MODIFICADO: Agosto 14 de 2009 - ohlondon
//--------------------------------------------------------------
If dwo.name = 'co_tipoprod' Then		
	il_tipoprod = Long (data)
	lo_comun.of_loaddddw(idc_grupoprod, il_tipoprod , n_cst_application.itr_appl)
	lo_comun.of_loaddddw(idc_tipomaquina,il_tipoprod,n_cst_application.itr_appl)		
	lo_comun.of_loadDddw(idc_tipotej,il_tipoprod,n_cst_application.itr_appl)
	lo_comun.of_loaddddw(idc_actividad,il_tipoprod,n_cst_application.itr_appl)
	lo_comun.of_loaddddw(idc_operacion,il_tipoprod,n_cst_application.itr_appl)

	//dw_actividades
End If

//--------------------------------------------------------------
If dwo.name = 'criterio_tiempo' Then	
	ldw_criterio = tab_actividad.tabpage_criteriotiempo.dw_estimar_tiempo
	If ldw_criterio.RowCount()>0 AND (ldw_criterio.ModifiedCount() + ldw_criterio.DeletedCount())>0 Then
		If MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","$$HEX1$$bf00$$ENDHEX$$Desea cambiar de criterio de tiempo?",Question!,YesNo!,2)=2 Then
			Return 2		
		End If
	End If
	//***************************************************************************
	of_cargar_dwo(Data)
	ll_i=ldw_criterio.Retrieve(il_id_actividad)
	Choose Case ll_i
		Case Is < 0
			MessageBox('Advertencia','Error en la b$$HEX1$$fa00$$ENDHEX$$squeda de tiempos para el criterio de tiempo ~''+Data+'~'',StopSign!)
			Return 1
		Case 0
			ldw_criterio.Event ue_insertrow()
			If Long(Data)=1 Then of_cargar_dwo('1')
	End Choose
End If
//--------------------------------------------------------------
ib_cambios = True

end event

event ue_deleterow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:17:25
---------------------------------------------------
Overwrite!
--------------------------------------------------*/
end event

event itemerror;call super::itemerror;If dwo.name='de_actividad' OR  dwo.name='criterio_tiempo' Then
		Return 1	
End If
end event

type gb_actividad from u_gb_base within w_actividad_muestra
integer x = 37
integer y = 12
integer width = 3438
integer height = 548
integer taborder = 0
long backcolor = 67108864
string text = "Registro de Actividad (Ctrl+1)"
end type

