HA$PBExportHeader$w_proceso_muestras.srw
$PBExportComments$Ventana de Registro de Operaciones de las muestras para la programaci$$HEX1$$f300$$ENDHEX$$n y el mantenimiento
forward
global type w_proceso_muestras from w_sheet
end type
type dw_verifica_precedencia from u_dw_application within w_proceso_muestras
end type
type tab_proceso from tab within w_proceso_muestras
end type
type tabpage_criteriotiempo from userobject within tab_proceso
end type
type dw_estimar_tiempo from u_dw_application within tabpage_criteriotiempo
end type
type tabpage_criteriotiempo from userobject within tab_proceso
dw_estimar_tiempo dw_estimar_tiempo
end type
type tabpage_grupos from userobject within tab_proceso
end type
type dw_grupo_operacion from u_dw_application within tabpage_grupos
end type
type tabpage_grupos from userobject within tab_proceso
dw_grupo_operacion dw_grupo_operacion
end type
type tabpage_recursos from userobject within tab_proceso
end type
type dw_recurso_operacion from u_dw_application within tabpage_recursos
end type
type tabpage_recursos from userobject within tab_proceso
dw_recurso_operacion dw_recurso_operacion
end type
type tabpage_maqtin from userobject within tab_proceso
end type
type dw_mu_maqtin_oper from u_dw_application within tabpage_maqtin
end type
type tabpage_maqtin from userobject within tab_proceso
dw_mu_maqtin_oper dw_mu_maqtin_oper
end type
type tabpage_precedencias from userobject within tab_proceso
end type
type dw_operaciones from u_dw_application within tabpage_precedencias
end type
type dw_actividades from u_dw_application within tabpage_precedencias
end type
type gb_actividades from groupbox within tabpage_precedencias
end type
type gb_operaciones from groupbox within tabpage_precedencias
end type
type tabpage_precedencias from userobject within tab_proceso
dw_operaciones dw_operaciones
dw_actividades dw_actividades
gb_actividades gb_actividades
gb_operaciones gb_operaciones
end type
type tab_proceso from tab within w_proceso_muestras
tabpage_criteriotiempo tabpage_criteriotiempo
tabpage_grupos tabpage_grupos
tabpage_recursos tabpage_recursos
tabpage_maqtin tabpage_maqtin
tabpage_precedencias tabpage_precedencias
end type
type dw_operacion from u_dw_application within w_proceso_muestras
end type
type gb_operacion from u_gb_base within w_proceso_muestras
end type
end forward

global type w_proceso_muestras from w_sheet
string tag = "Registro de Operaciones"
integer width = 3653
integer height = 2056
string title = "Registro de Operaciones"
string menuname = "m_proceso_muestras"
boolean maxbox = true
windowstate windowstate = maximized!
event ue_eliminar_operacion ( )
dw_verifica_precedencia dw_verifica_precedencia
tab_proceso tab_proceso
dw_operacion dw_operacion
gb_operacion gb_operacion
end type
global w_proceso_muestras w_proceso_muestras

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:10:22
---------------------------------------------------
---------------------------------------------------*/
Public:
	String is_where_busqueda,is_dispo,is_desc
	Boolean ib_cambios=False,ib_reg=False,ib_save,ib_nuevo,ib_dbclk
	Long il_operacion,il_co_estado,il_criterio,il_co_fabrica	,il_tipoprod
	DataWindowChild idc_estado,idc_tipoprod,idc_tipotej,idc_grupotalla,&
						idc_tono,idc_recurso,idc_talla,idc_tipomaquina,idc_grupoprod
						
DataWindowChild idc_actividad, idc_operacion												
end variables

forward prototypes
public function integer of_redraw (boolean al_redrawing)
public function integer of_reset ()
public function integer of_carga_objtr ()
public function integer of_carga_dddw (integer al_opc)
public function integer of_guardar ()
public function integer of_verificar ()
public function integer of_consecutivo ()
public function integer of_cargar_dwo (string as_num)
public function integer of_eliminar_operacion ()
public function integer of_ok_operacion ()
public function integer of_error_operacion ()
public function integer of_buscar (long al_operacion)
public function integer of_existe_operacion (integer al_operacion)
public function integer of_newid_oper ()
public function integer of_filtrar_talla (long al_grupotalla)
public function integer of_cargar_dddw ()
public function integer of_verifica_precedencia (long a_tipo, long a_codigo)
public function integer of_buscar (long al_operacion, long al_tipoprod)
public function integer of_existe_operacion (integer al_operacion, integer ai_tipoprod)
end prototypes

event ue_eliminar_operacion();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 25 de Octubre de 2004.H:18:25
---------------------------------------------------
---------------------------------------------------*/
of_Redraw(False)
of_eliminar_operacion()
of_Redraw(True)
end event

public function integer of_redraw (boolean al_redrawing);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:08:32
---------------------------------------------------
---------------------------------------------------*/
dw_operacion.SetRedraw(al_redrawing)
tab_proceso.tabpage_grupos.dw_grupo_operacion.SetRedraw(al_redrawing)
tab_proceso.tabpage_recursos.dw_recurso_operacion.SetRedraw(al_redrawing)
tab_proceso.tabpage_maqtin.dw_mu_maqtin_oper.SetRedraw(al_redrawing)
tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.SetRedraw(al_redrawing)

Return 1
end function

public function integer of_reset ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:10:31
---------------------------------------------------
---------------------------------------------------*/
dw_operacion.reset()
tab_proceso.tabpage_grupos.dw_grupo_operacion.reset()
tab_proceso.tabpage_recursos.dw_recurso_operacion.reset()
tab_proceso.tabpage_maqtin.dw_mu_maqtin_oper.reset()
tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.reset()

Return 1
end function

public function integer of_carga_objtr ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Septiembre de 2004.H:15:18
---------------------------------------------------
Carga los obj. de transacci$$HEX1$$f300$$ENDHEX$$n
---------------------------------------------------*/
dw_operacion.of_conexion(n_cst_application.itr_appl,True)
tab_proceso.tabpage_grupos.dw_grupo_operacion.of_conexion(n_cst_application.itr_appl,True)
tab_proceso.tabpage_recursos.dw_recurso_operacion.of_conexion(n_cst_application.itr_appl,True)
tab_proceso.tabpage_maqtin.dw_mu_maqtin_oper.of_conexion(n_cst_application.itr_appl,True)
tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.of_conexion(n_cst_application.itr_appl,True)


tab_proceso.tabpage_precedencias.dw_actividades.of_conexion(n_cst_application.itr_appl,True)
tab_proceso.tabpage_precedencias.dw_operaciones.of_conexion(n_cst_application.itr_appl,True)

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
		dw_operacion.getChild("co_estado",idc_estado)
		lo_comun.of_loaddddw(idc_estado,n_cst_application.is_user,n_cst_application.itr_appl)
End Choose
Return 1
end function

public function integer of_guardar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:17:25
---------------------------------------------------
Guarda despues de verificar. Devuelve 1 si es exitoso
---------------------------------------------------*/
long ll_operacion_control
DateTime ldt_fecha
String ls_usuario,ls_instancia
//-------------------------------------------------
If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If

//ll_operacion_control=il_operacion
//If il_operacion=0 Then
//	If of_consecutivo()<>1 Then
//		Return -1
//	End If
//	dw_operacion.SetItem(1,"co_operacion",il_operacion)
//End If
ls_instancia=Trim(ls_instancia)
dw_operacion.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)
tab_proceso.tabpage_grupos.dw_grupo_operacion.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)	
tab_proceso.tabpage_recursos.dw_recurso_operacion.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)	
tab_proceso.tabpage_maqtin.dw_mu_maqtin_oper.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)	
tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)	

tab_proceso.tabpage_precedencias.dw_actividades.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)	
tab_proceso.tabpage_precedencias.dw_operaciones.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)	

//If Not ib_reg Then
	of_newid_oper()
//End If
//---------------------------------------------------------------------------------
If dw_operacion.Update(true,false)<>1 Then 
	of_error_operacion()
	Return -1
End If

If tab_proceso.tabpage_grupos.dw_grupo_operacion.Update(true,false)<>1 Then 

	of_error_operacion()
	Return -1
End If

If tab_proceso.tabpage_recursos.dw_recurso_operacion.Update(true,false)<>1 Then 
	of_error_operacion()
	Return -1
End If

If tab_proceso.tabpage_maqtin.dw_mu_maqtin_oper.Update(true,false)<>1 Then 
	of_error_operacion()
	Return -1
End If

If tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.Update(true,false)<>1 Then 
	of_error_operacion()
	Return -1
End If


If tab_proceso.tabpage_precedencias.dw_actividades.Update(true,false)<>1 Then 
	of_error_operacion()
	Return -1
End If

If tab_proceso.tabpage_precedencias.dw_operaciones.Update(true,false)<>1 Then 
	of_error_operacion()
	Return -1
End If

//---------------------------------------------------------------------------------
dw_operacion.ResetUpdate()
tab_proceso.tabpage_grupos.dw_grupo_operacion.ResetUpdate()
tab_proceso.tabpage_recursos.dw_recurso_operacion.ResetUpdate()
tab_proceso.tabpage_maqtin.dw_mu_maqtin_oper.ResetUpdate()
tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.ResetUpdate()

tab_proceso.tabpage_precedencias.dw_actividades.ResetUpdate()
tab_proceso.tabpage_precedencias.dw_operaciones.ResetUpdate()

//
Return 1
end function

public function integer of_verificar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:15:26
---------------------------------------------------
Verificaci$$HEX1$$f300$$ENDHEX$$n de los datos antes de grabar
---------------------------------------------------*/
Long ll_pos,ll_tot,i,ll_actividad,ll_operacion
//---------------------------------------------------------------------------------------------
If dw_operacion.RowCount()<=0 Then
	Return -1
End If
//---------------------------------------------------------------------------------------------
If dw_operacion.GetItemNumber(1,'co_operacion')=0 Then
	MessageBox("Advertencia!","Debe elegir un c$$HEX1$$f300$$ENDHEX$$digo de operaci$$HEX1$$f300$$ENDHEX$$n existente~nDigite un c$$HEX1$$f300$$ENDHEX$$digo o DobleClick en la casilla 'Cod. Operaci$$HEX1$$f300$$ENDHEX$$n'",StopSign!)
	Return -1
End If
//---------------------------------------------------------------------------------------------
//If tab_proceso.tabpage_grupos.dw_grupo_operacion.RowCount()+tab_proceso.tabpage_recursos.dw_recurso_operacion.RowCount()+&
//	tab_proceso.tabpage_maqtin.dw_mu_maqtin_oper.RowCount()<=0 Then
//	MessageBox("Advertencia!","La operaci$$HEX1$$f300$$ENDHEX$$n debe tener por lo menos, un $$HEX1$$ed00$$ENDHEX$$tem de los recursos asignado.",StopSign!)
//	Return -1
//End If
//----------------------------------------------------------------------------------------
If tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.RowCount()<=0 Then
	MessageBox("Advertencia!","La operaci$$HEX1$$f300$$ENDHEX$$n debe tener por lo menos un tiempo asignado.",StopSign!)
	Return -1
End If
//----------------------------------------------------------------------------------------
If dw_operacion.AcceptText()<>1 Then
	Trigger Event key(Key1!,2)
	//MessageBox("Advertencia!","Datos de la operaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If tab_proceso.tabpage_grupos.dw_grupo_operacion.AcceptText()<>1 Then
	Trigger Event key(Key3!,2)
	//MessageBox("Advertencia!","Datos de los grupos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If tab_proceso.tabpage_recursos.dw_recurso_operacion.AcceptText()<>1 Then
	Trigger Event key(Key4!,2)
	//MessageBox("Advertencia!","Datos de los recursos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If tab_proceso.tabpage_maqtin.dw_mu_maqtin_oper.AcceptText()<>1 Then
	Trigger Event key(Key5!,2)
	//MessageBox("Advertencia!","Datos de los recursos de m$$HEX1$$e100$$ENDHEX$$quina de tintorer$$HEX1$$ed00$$ENDHEX$$a no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.AcceptText()<>1 Then
	Trigger Event key(Key2!,2)
	//MessageBox("Advertencia!","Datos de criterio de tiempo para la operaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If tab_proceso.tabpage_precedencias.dw_actividades.AcceptText()<>1 Then
	Trigger Event key(Key6!,2)
	MessageBox("Advertencia!","Datos de actividades precedentes no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If tab_proceso.tabpage_precedencias.dw_operaciones.AcceptText()<>1 Then
	Trigger Event key(Key6!,2)
	MessageBox("Advertencia!","Datos de operaciones precedentes no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If


//----------------------------------------------------------------------------------------
If Not dw_operacion.of_completedata() Then
	Trigger Event key(Key1!,2)
	Return -1
End If
If Not tab_proceso.tabpage_grupos.dw_grupo_operacion.of_completedata() Then
	Trigger Event key(Key3!,2)
	Return -1
End If
If Not tab_proceso.tabpage_recursos.dw_recurso_operacion.of_completedata() Then
	Trigger Event key(Key4!,2)
	Return -1
End If
If Not tab_proceso.tabpage_maqtin.dw_mu_maqtin_oper.of_completedata() Then
	Trigger Event key(Key5!,2)
	Return -1
End If
If Not tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.of_completedata() Then
	Trigger Event key(Key2!,2)
	Return -1
End If

If Not tab_proceso.tabpage_precedencias.dw_actividades.of_completedata() Then
	Trigger Event key(Key6!,2)
	Return -1
End If

If Not tab_proceso.tabpage_precedencias.dw_operaciones.of_completedata() Then
	Trigger Event key(Key6!,2)
	Return -1
End If

ll_tot=tab_proceso.tabpage_precedencias.dw_actividades.RowCount()

For i=1 To ll_tot
	ll_actividad=tab_proceso.tabpage_precedencias.dw_actividades.&
	GetItemNumber(i,"id_actividad")
	
	If of_verifica_precedencia(2,ll_actividad)<>1 Then
		Return -1
	End If

Next

ll_tot=tab_proceso.tabpage_precedencias.dw_operaciones.RowCount()

For i=1 To ll_tot
	ll_operacion=tab_proceso.tabpage_precedencias.dw_operaciones.&
	GetItemNumber(i,"co_operacion_pre")
	
	If of_verifica_precedencia(1,ll_operacion)<>1 Then
		Return -1
	End If

Next


//----------------------------------------------------------------------------------------
Return 1
//----------------------------------------------------------------------------------------
end function

public function integer of_consecutivo ();
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 30 de Septiembre de 2004.H:18:20
---------------------------------------------------
Generaci$$HEX1$$f300$$ENDHEX$$n del consecutivo. Devuelve -1 si el proceso no fu$$HEX1$$e900$$ENDHEX$$
exitoso.
----------------------------------------------------
Consulta del consecutivo
El codigo para las operaciones de muestras ser$$HEX2$$e1002000$$ENDHEX$$para el 
ID '29'<--- creada en tiempo de dise$$HEX1$$f100$$ENDHEX$$o
Log del registro :
Table  : cf_consecutivos@crydes
Fields : co_fabrica 		= 2
			id_documento 	= 29
			cs_documento 	= *(ini)
			ob_documento 	= Operaciones Muestra-Programaci$$HEX1$$f300$$ENDHEX$$n
			sw_replica		= 0
			instancia		= crydes01/nicdes01
---------------------------------------------------*/
Boolean lb_continuar
Long ll_cantidad
n_ds_application lds_cant_proceso
//--------------------------------------------------
lds_cant_proceso = CREATE n_ds_application
lds_cant_proceso.of_load('d_nro_operacion')
lds_cant_proceso.of_conexion(n_cst_application.itr_appl,True)
	
lb_continuar=True
DO WHILE lb_continuar //*
	il_operacion = n_cst_application.of_consecutive(n_cst_application.ii_fabrica,29,n_cst_application.itr_appl)
   If il_operacion<=0 Then
		il_operacion=0
		MessageBox("Advertencia!","No se pudo determinar el consecutivo de la operaci$$HEX1$$f300$$ENDHEX$$n de muestra para programar.",StopSign!)
		Return -1
	End If
	
	ll_cantidad = lds_cant_proceso.Retrieve(il_operacion)
	If ll_cantidad<= 0 Then
			MessageBox("Advertencia!","Error recuperando la cuenta del c$$HEX1$$f300$$ENDHEX$$digo de operaci$$HEX1$$f300$$ENDHEX$$n(ds).",StopSign!)		
			Return -1						
	End If
	ll_cantidad = lds_cant_proceso.GetItemNumber(1,'nro_operacion')
	If ll_cantidad=0 Then
		lb_continuar=False
	End If
LOOP //*
DESTROY lds_cant_proceso
//<------
//MessageBox('INFO','# consecutivo de operacion:'+String(il_operacion),Information!)
If il_operacion>0 Then
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
	tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.of_load('d_mu_pro_t'+Trim(as_num))	
	tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.of_conexion(n_cst_application.itr_appl,True)
	Choose Case as_num
		Case '1'			
			tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.InsertRow(0)
			tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.SetItem(1,"co_operacion",il_operacion)
			tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.SetItem(1,"co_tipoprod",il_tipoprod)
			tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.SetItemStatus(1,0,Primary!,DataModified!)
			tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.SetItemStatus(1,0,Primary!,NotModified!)
			tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.SetItemStatus(1,0,Primary!,New!)
			tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.SetFocus()
			tab_proceso.tabpage_criteriotiempo.Text ='Criterio tiempo: Constante (Ctrl+2)'
		Case '2'
			tab_proceso.tabpage_criteriotiempo.Text='Criterio tiempo: Cilindros/Nueva-Reforma (Ctrl+2)'
		Case '3'// Cargar la lista de tipoprod & tipo_tejido			
//			tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.GetChild('co_tipoprod',idc_tipoprod)
//			lo_comun.of_loaddddw(idc_tipoprod,n_cst_application.itr_appl)
			tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.getChild("co_tipo_tejido",idc_tipotej)
			lo_comun.of_loaddddw(idc_tipotej,10,n_cst_application.itr_appl)//Parametro tipoprod=10 PROPENSO A  CAMBIOS!!
			idc_tipotej.SetSort('co_tipo_tejido A')
			idc_tipotej.Sort()
			tab_proceso.tabpage_criteriotiempo.Text='Criterio tiempo: Producto/Tejido (Ctrl+2)'
		Case '4'// Cargar la lista de grupo_talla
			tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.GetChild('co_grupo_tlla',idc_grupotalla)//!!! En dise$$HEX1$$f100$$ENDHEX$$o solo es editable no lista!
			lo_comun.of_loaddddw(idc_grupotalla,n_cst_application.itr_appl)
			idc_grupotalla.SetSort('co_grupo_tlla A')
			idc_grupotalla.Sort()
//			tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.GetChild('co_talla',idc_talla)//!!! En dise$$HEX1$$f100$$ENDHEX$$o solo es editable no lista!
//			lo_comun.of_loaddddw(idc_talla,n_cst_application.itr_appl)
//			idc_talla.SetSort('co_talla A')
//			idc_talla.Sort()
			tab_proceso.tabpage_criteriotiempo.Text='Criterio tiempo: GrupoTalla/Talla(Ctrl+2)'
		Case '5'// Cargar la lista de Tono ???????	
//			tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.GetChild('co_tono',idc_tono)//!!! En dise$$HEX1$$f100$$ENDHEX$$o solo es editable no lista!
//			lo_comun.of_loaddddw(idc_tono,n_cst_application.itr_appl)			
			tab_proceso.tabpage_criteriotiempo.Text='Criterio tiempo: Tonos (Ctrl+2)'
		Case '6'// Cargar la lista de Grupo tipo de producto y Tipo Maquina
			tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.GetChild('co_grupoprod',idc_grupoprod)
			lo_comun.of_loaddddw(idc_grupoprod, il_tipoprod , n_cst_application.itr_appl)

			tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.GetChild('co_tipo_maquina', idc_tipomaquina)
			lo_comun.of_loaddddw(idc_tipomaquina,il_tipoprod,n_cst_application.itr_appl)		
			
			tab_proceso.tabpage_criteriotiempo.Text='Criterio tiempo: Prenda/Alimentadores (Ctrl+2)'
			
	End Choose	
Else
	MessageBox('Error','C$$HEX1$$f300$$ENDHEX$$digo de criterio tiempo inv$$HEX1$$e100$$ENDHEX$$lido',StopSign!)
	Return -1
End If
il_criterio=Long(as_num)
Return 1
end function

public function integer of_eliminar_operacion ();/*-------------------------------------------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:17:21
//-------------------------------------------------------------------------------------
Elimina la operacion registrada en la BD.
-------------------------------------------------------------------------------------*/
long ll_respuesta
n_cst_comun_orden lo_comun
//-------------------------------------------------------------------------------------
If dw_operacion.RowCount()<1 Then
	Return -1
End If

If Not ib_reg Then
	MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Operaci$$HEX1$$f300$$ENDHEX$$n no registrada!.",Information!)
	Return -1
End If
////-------------------------------------------------------------------------------------
ll_respuesta = MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","$$HEX2$$bf002000$$ENDHEX$$Desea eliminar operaci$$HEX1$$f300$$ENDHEX$$n y sus datos relacionados?",Question!,YesNo!,2)
If ll_respuesta<>1 Then
	Return -1
End If
//-------------------------------------------------------------------------------------
If lo_comun.of_del_crioper(il_operacion,il_criterio)<>1 Then
	of_error_operacion()
	Return -1
End If
dw_operacion.DeleteRow(0)
tab_proceso.tabpage_grupos.dw_grupo_operacion.RowsMove(1,tab_proceso.tabpage_grupos.dw_grupo_operacion.RowCount(),Primary!,tab_proceso.tabpage_grupos.dw_grupo_operacion,tab_proceso.tabpage_grupos.dw_grupo_operacion.DeletedCount()+1,Delete!)
tab_proceso.tabpage_recursos.dw_recurso_operacion.RowsMove(1,tab_proceso.tabpage_recursos.dw_recurso_operacion.RowCount(),Primary!,tab_proceso.tabpage_recursos.dw_recurso_operacion,tab_proceso.tabpage_recursos.dw_recurso_operacion.DeletedCount()+1,Delete!)
tab_proceso.tabpage_maqtin.dw_mu_maqtin_oper.RowsMove(1,tab_proceso.tabpage_maqtin.dw_mu_maqtin_oper.RowCount(),Primary!,tab_proceso.tabpage_maqtin.dw_mu_maqtin_oper,tab_proceso.tabpage_maqtin.dw_mu_maqtin_oper.DeletedCount()+1,Delete!)
tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.RowsMove(1,tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.RowCount(),Primary!,tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo,tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.DeletedCount()+1,Delete!)
//-------------------------------------------------------------------------------------
If tab_proceso.tabpage_grupos.dw_grupo_operacion.Update()<>1 Then
	of_error_operacion()
	Return -1
End If

If tab_proceso.tabpage_recursos.dw_recurso_operacion.Update()<>1 Then
	of_error_operacion()
	Return -1
End If

If tab_proceso.tabpage_maqtin.dw_mu_maqtin_oper.Update()<>1 Then
	of_error_operacion()
	Return -1
End If

If tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.Update()<>1 Then
	of_error_operacion()
	Return -1
End If

If dw_operacion.Update()<>1 Then
	of_error_operacion()
	Return -1
End If
//-----------------------------------------------------------------------------
of_Reset()
of_ok_operacion()

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Operaci$$HEX1$$f300$$ENDHEX$$n <"+String(il_operacion)+"> ha sido eliminado exitosamente.")
Return 1
end function

public function integer of_ok_operacion ();/*-------------------------------------------------
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

public function integer of_error_operacion ();/*-------------------------------------------------
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

public function integer of_buscar (long al_operacion);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:10:26
---------------------------------------------------
Busqueda de las operaciones almacenadas
* -----------------------------------------------------------------------------
* MODIFICADO: Agosto 18 de 2009 - ohlondon
* -----------------------------------------------------------------------------
* Se deben recuperar los detalles con el tipo de producto del encabezado
* -----------------------------------------------------------------------------
*/

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
If dw_operacion.RowCount()>0 Then
			of_Reset()
End If
//-------------------------------------------------------------------------------------------------
// Retrieve a los datos de la tabla de operaciones 'm_operac_muestra'
ll_resultado = dw_operacion.Retrieve(al_operacion)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de la operaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)		
		Return -1
	Case 0
		MessageBox("Advertencia!","La operaci$$HEX1$$f300$$ENDHEX$$n no se encontr$$HEX1$$f300$$ENDHEX$$.",StopSign!)	
//		of_reset()		
		Return -1
End Choose
/* -----------------------------------------------------------------------------
* MODIFICADO: Agosto 18 de 2009 - ohlondon
* -----------------------------------------------------------------------------
* Se deben recuperar los detalles con el tipo de producto del encabezado
* -----------------------------------------------------------------------------
*/
il_tipoprod  = dw_operacion.GetItemNumber(1, 'co_tipoprod')


//-------------------------------------------------------------------------------------------------
// Retrieve a los grupos de la tabla 'mu_gru_oper'
ll_resultado = tab_proceso.tabpage_grupos.dw_grupo_operacion.Retrieve(al_operacion, il_tipoprod)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de los grupos de la operaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
		Return -1
	Case 0
		ls_msj+='*Operaci$$HEX1$$f300$$ENDHEX$$n sin grupos ~n'
//		MessageBox("Advertencia!","No se encontraron grupos para la operaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)	
//		of_reset()		
//		Return -1
End Choose
//-------------------------------------------------------------------------------------------------
// Retrieve a los recursos de la tabla 'mu_rec_oper'
ll_resultado = tab_proceso.tabpage_recursos.dw_recurso_operacion.Retrieve(al_operacion)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de los recursos para la operaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
		Return -1
	Case 0
		ls_msj+='*Operaci$$HEX1$$f300$$ENDHEX$$n sin recursos tejido~n'
//		MessageBox("Advertencia!","No se encontraron recursos para la operaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)	
//		of_reset()		
//		Return -1
End Choose
//-------------------------------------------------------------------------------------------------
// Retrieve a las m$$HEX1$$e100$$ENDHEX$$quinas de la tabla 'mu_maqtin_oper'
ll_resultado = tab_proceso.tabpage_maqtin.dw_mu_maqtin_oper.Retrieve(al_operacion, il_tipoprod)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de las m$$HEX1$$e100$$ENDHEX$$quinas de tintorer$$HEX1$$ed00$$ENDHEX$$a para la operaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
		Return -1
	Case 0
		ls_msj+='*Operaci$$HEX1$$f300$$ENDHEX$$n sin recursos de m$$HEX1$$e100$$ENDHEX$$quinas de tintorer$$HEX1$$ed00$$ENDHEX$$a ~n'
//		MessageBox("Advertencia!","No se encontraron recursos de m$$HEX1$$e100$$ENDHEX$$quinas para la operaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)	
//		of_reset()		
//		Return -1
End Choose
//-------------------------------------------------------------------------------------------------
// Retrieve a los criterios de tiempos 'mu_pro_t#'
il_operacion = dw_operacion.GetItemNumber(1, 'co_operacion')//al_operacion
il_criterio  = dw_operacion.GetItemNumber(1, 'criterio_tiempo')

If Not IsNull(il_criterio) Then
		of_cargar_dwo(String(il_criterio))
		ll_resultado = tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.Retrieve(al_operacion, il_tipoprod)
		Choose Case ll_resultado
			Case Is < 0 
				MessageBox("Advertencia!","Error recuperando datos de criterios de tiempo.",StopSign!)
				Return -1
			Case 0
				ls_msj+='*Operaci$$HEX1$$f300$$ENDHEX$$n sin registros de tiempo para el criterio '+String(il_criterio)+'~n'
				ll_i = tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.InsertRow(0)			
				tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.SetItem(ll_i,"co_operacion",il_operacion)
		//		MessageBox("Advertencia!","No se encontraron criterios de tiempo para la operaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)	
		//		of_reset()		
		//		Return -1
		End Choose
Else
	ls_msj+='*Operaci$$HEX1$$f300$$ENDHEX$$n sin c$$HEX1$$f300$$ENDHEX$$digo de criterio de tiempo asignado~n'
	dw_operacion.SetItem(1,'criterio_tiempo',1)
	of_cargar_dwo('1')
End If


//-------------------------------------------------------------------------------------------------
il_co_estado = dw_operacion.GetItemNumber(1,'co_estado')
dw_operacion.SetFocus( )
dw_operacion.SetColumn('co_operacion')
Title='Registro de Operaciones | Operaci$$HEX1$$f300$$ENDHEX$$n: '+String(al_operacion)+'| Estado: '+String(il_co_estado)
//-------------------------------------------------------------------------------------------------
of_redraw(True)
If Not ib_save Then
	MessageBox("Operaci$$HEX1$$f300$$ENDHEX$$n Nro. "+String(il_operacion),'Operaci$$HEX1$$f300$$ENDHEX$$n Cargada!~n'+ls_msj,Information!)
Else
	ib_save=False
End If
ib_reg=true
ib_nuevo=false

lo_comun.of_loaddddw(idc_actividad,il_tipoprod,n_cst_application.itr_appl)
lo_comun.of_loaddddw(idc_operacion,il_tipoprod,n_cst_application.itr_appl)

ll_resultado = tab_proceso.tabpage_precedencias.dw_actividades.Retrieve(al_operacion)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando actividades predecesoras.",StopSign!)
		Return -1
	Case 0
		ls_msj+='*Actividad sin actividades predecesoras~n'
End Choose

ll_resultado = tab_proceso.tabpage_precedencias.dw_operaciones.Retrieve(al_operacion, il_tipoprod)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando operaciones predecesoras.",StopSign!)
		Return -1
	Case 0
		ls_msj+='*Actividad sin operaciones predecesoras~n'
End Choose


Return 1
end function

public function integer of_existe_operacion (integer al_operacion);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 19 de Noviembre de 2004.H:18:10
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n que revisa que el c$$HEX1$$f300$$ENDHEX$$digo introducido este registrado
en la tabla 'm_operacio_ct' y que no est$$HEX2$$e9002000$$ENDHEX$$en 'm_operac_muestra'
---------------------------------------------------*/
Long ll_resultado,ll_cont
String ls_de_operacion
n_ds_application lds_operacion
//---------------------------------------------------
lds_operacion = CREATE n_ds_application
lds_operacion.of_load('d_nro_operacion')
lds_operacion.of_conexion(n_cst_application.itr_appl,True)
ll_resultado = lds_operacion.Retrieve(al_operacion)
Choose Case ll_resultado
	Case Is <= 0 
		MessageBox("Advertencia!","Error recuperando datos de la operaci$$HEX1$$f300$$ENDHEX$$n en el registro de muestras",StopSign!)		
		Return -1	
	Case 1
		ll_cont=lds_operacion.GetItemNumber(1,'nro_operacion')
		If ll_cont > 0 Then
			MessageBox("Advertencia!","El c$$HEX1$$f300$$ENDHEX$$digo de la operaci$$HEX1$$f300$$ENDHEX$$n "+String(al_operacion)+" ya est$$HEX2$$e1002000$$ENDHEX$$registrado",StopSign!)
			Return -1				
		End If
		lds_operacion.of_load('d_bus_m_operacio_ct')
		lds_operacion.of_conexion(n_cst_application.itr_appl,True)
		ll_resultado = lds_operacion.Retrieve(10,al_operacion)/*Argum:Tipoprod:10*/		
		Choose Case ll_resultado
			Case Is <0
				MessageBox("Advertencia!","Error recuperando datos de la existencia externa de la operaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
				Return -1
			Case 0
				MessageBox("Advertencia!","El c$$HEX1$$f300$$ENDHEX$$digo de la operaci$$HEX1$$f300$$ENDHEX$$n '"+String(al_operacion)+"' no existe en el registro externo.",StopSign!)		
				Return -1
			Case 1
				is_desc=lds_operacion.GetItemString(1,'de_operacion')
				//dw_operacion.SetItem(1,'de_operacion',lds_operacion.GetItemString(1,'de_operacion'))
			Case Else
				MessageBox("Advertencia!","El c$$HEX1$$f300$$ENDHEX$$digo de la operaci$$HEX1$$f300$$ENDHEX$$n posee m$$HEX1$$e100$$ENDHEX$$s de una instancia en el registro externo.",StopSign!)		
				Return -1
		End Choose
End Choose
DESTROY lds_operacion
//-------------------------------------------------------------------------------------------------------------------------------------
Return 1
end function

public function integer of_newid_oper ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 25 de Octubre de 2004.H:19:00
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n para asignar el consecutivo de las operaciones a los DW
---------------------------------------------------*/
Long ll_i
//-------------------------------------------------
For ll_i=1 To tab_proceso.tabpage_grupos.dw_grupo_operacion.RowCount()
	tab_proceso.tabpage_grupos.dw_grupo_operacion.SetItem(ll_i,'co_operacion',il_operacion)
Next
For ll_i=1 To tab_proceso.tabpage_recursos.dw_recurso_operacion.RowCount()
	tab_proceso.tabpage_recursos.dw_recurso_operacion.SetItem(ll_i,'co_operacion',il_operacion)
Next
For ll_i=1 To tab_proceso.tabpage_maqtin.dw_mu_maqtin_oper.RowCount()
	tab_proceso.tabpage_maqtin.dw_mu_maqtin_oper.SetItem(ll_i,'co_operacion',il_operacion)
Next
For ll_i=1 To tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.RowCount()
	tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.SetItem(ll_i,'co_operacion',il_operacion)
Next
//----------
Return 1
end function

public function integer of_filtrar_talla (long al_grupotalla);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 28 de Octubre de 2004.H:15:32
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n que filtra la talla seg$$HEX1$$fa00$$ENDHEX$$n el grupo escogido
---------------------------------------------------*/
//String ls_f
n_cst_comun lo_comun
////-------------------------------------------------
//idc_talla.SetFilter("")
//idc_talla.Filter()
//ls_f='co_grupo_tlla='+as_grupotalla
//idc_talla.SetFilter(ls_f)
//idc_talla.Filter()
//idc_talla.Sort()
tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.GetChild('co_talla',idc_talla)
lo_comun.of_loaddddw(idc_talla,al_grupotalla,n_cst_application.itr_appl)
idc_talla.SetSort('co_talla A')
idc_talla.Sort()
Return 1
end function

public function integer of_cargar_dddw ();n_cst_comun lo_comun
//-------------------------------------------------
tab_proceso.tabpage_precedencias.dw_actividades.GetChild("id_actividad",idc_actividad)
lo_comun.of_loaddddw(idc_actividad,10,n_cst_application.itr_appl)

tab_proceso.tabpage_precedencias.dw_operaciones.GetChild("co_operacion_pre",idc_operacion)
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

ll_tot=dw_verifica_precedencia.Retrieve(a_tipo,a_codigo,il_tipoprod )

If ll_tot>0 Then
	ll_pos=dw_verifica_precedencia.&
	find("tipo1=1 and id1="+String(il_operacion),1,ll_tot)
	
	If ll_pos>0 Then
		ll_nivel=dw_verifica_precedencia.GetItemNumber(ll_pos,"nivel")
		If ll_nivel=1 Then
			ls_cad1="directa"
		Else
			ls_cad1="indirecta"
		End If
		ls_msj="La "+ls_cad+" "+String(a_codigo)+" tiene como predecesora "+ls_cad1+" la operaci$$HEX1$$f300$$ENDHEX$$n "+&
		String(il_operacion)+"."		
		
		MessageBox("Advertencia!",ls_msj,StopSign!)
		Return -1
	End If
	
End If

Return 1
end function

public function integer of_buscar (long al_operacion, long al_tipoprod);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:10:26
---------------------------------------------------
Busqueda de las operaciones almacenadas
* -----------------------------------------------------------------------------
* MODIFICADO: Agosto 18 de 2009 - ohlondon
* -----------------------------------------------------------------------------
* Se deben recuperar los detalles con el tipo de producto del encabezado
* -----------------------------------------------------------------------------
*/

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
If dw_operacion.RowCount()>0 Then
			of_Reset()
End If
//-------------------------------------------------------------------------------------------------
// Retrieve a los datos de la tabla de operaciones 'm_operac_muestra'
ll_resultado = dw_operacion.Retrieve(al_operacion, al_tipoprod)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de la operaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)		
		Return -1
	Case 0
		MessageBox("Advertencia!","La operaci$$HEX1$$f300$$ENDHEX$$n no se encontr$$HEX1$$f300$$ENDHEX$$.",StopSign!)	
//		of_reset()		
		Return -1
End Choose
/* -----------------------------------------------------------------------------
* MODIFICADO: Agosto 18 de 2009 - ohlondon
* -----------------------------------------------------------------------------
* Se deben recuperar los detalles con el tipo de producto del encabezado
* -----------------------------------------------------------------------------
*/
il_tipoprod  = dw_operacion.GetItemNumber(1, 'co_tipoprod')


//-------------------------------------------------------------------------------------------------
// Retrieve a los grupos de la tabla 'mu_gru_oper'
ll_resultado = tab_proceso.tabpage_grupos.dw_grupo_operacion.Retrieve(al_operacion, il_tipoprod)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de los grupos de la operaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
		Return -1
	Case 0
		ls_msj+='*Operaci$$HEX1$$f300$$ENDHEX$$n sin grupos ~n'
//		MessageBox("Advertencia!","No se encontraron grupos para la operaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)	
//		of_reset()		
//		Return -1
End Choose
//-------------------------------------------------------------------------------------------------
// Retrieve a los recursos de la tabla 'mu_rec_oper'
ll_resultado = tab_proceso.tabpage_recursos.dw_recurso_operacion.Retrieve(al_operacion)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de los recursos para la operaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
		Return -1
	Case 0
		ls_msj+='*Operaci$$HEX1$$f300$$ENDHEX$$n sin recursos tejido~n'
//		MessageBox("Advertencia!","No se encontraron recursos para la operaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)	
//		of_reset()		
//		Return -1
End Choose
//-------------------------------------------------------------------------------------------------
// Retrieve a las m$$HEX1$$e100$$ENDHEX$$quinas de la tabla 'mu_maqtin_oper'
ll_resultado = tab_proceso.tabpage_maqtin.dw_mu_maqtin_oper.Retrieve(al_operacion, il_tipoprod)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de las m$$HEX1$$e100$$ENDHEX$$quinas de tintorer$$HEX1$$ed00$$ENDHEX$$a para la operaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
		Return -1
	Case 0
		ls_msj+='*Operaci$$HEX1$$f300$$ENDHEX$$n sin recursos de m$$HEX1$$e100$$ENDHEX$$quinas de tintorer$$HEX1$$ed00$$ENDHEX$$a ~n'
//		MessageBox("Advertencia!","No se encontraron recursos de m$$HEX1$$e100$$ENDHEX$$quinas para la operaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)	
//		of_reset()		
//		Return -1
End Choose
//-------------------------------------------------------------------------------------------------
// Retrieve a los criterios de tiempos 'mu_pro_t#'
il_operacion = dw_operacion.GetItemNumber(1, 'co_operacion')//al_operacion
il_criterio  = dw_operacion.GetItemNumber(1, 'criterio_tiempo')

If Not IsNull(il_criterio) Then
		of_cargar_dwo(String(il_criterio))
		ll_resultado = tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.Retrieve(al_operacion, il_tipoprod)
		Choose Case ll_resultado
			Case Is < 0 
				MessageBox("Advertencia!","Error recuperando datos de criterios de tiempo.",StopSign!)
				Return -1
			Case 0
				ls_msj+='*Operaci$$HEX1$$f300$$ENDHEX$$n sin registros de tiempo para el criterio '+String(il_criterio)+'~n'
				ll_i = tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.InsertRow(0)			
				tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.SetItem(ll_i,"co_operacion",il_operacion)
		//		MessageBox("Advertencia!","No se encontraron criterios de tiempo para la operaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)	
		//		of_reset()		
		//		Return -1
		End Choose
Else
	ls_msj+='*Operaci$$HEX1$$f300$$ENDHEX$$n sin c$$HEX1$$f300$$ENDHEX$$digo de criterio de tiempo asignado~n'
	dw_operacion.SetItem(1,'criterio_tiempo',1)
	of_cargar_dwo('1')
End If


//-------------------------------------------------------------------------------------------------
il_co_estado = dw_operacion.GetItemNumber(1,'co_estado')
dw_operacion.SetFocus( )
dw_operacion.SetColumn('co_operacion')
Title='Registro de Operaciones | Operaci$$HEX1$$f300$$ENDHEX$$n: '+String(al_operacion)+'| Estado: '+String(il_co_estado)
//-------------------------------------------------------------------------------------------------
of_redraw(True)
If Not ib_save Then
	MessageBox("Operaci$$HEX1$$f300$$ENDHEX$$n Nro. "+String(il_operacion),'Operaci$$HEX1$$f300$$ENDHEX$$n Cargada!~n'+ls_msj,Information!)
Else
	ib_save=False
End If
ib_reg=true
ib_nuevo=false

lo_comun.of_loaddddw(idc_actividad,il_tipoprod,n_cst_application.itr_appl)
lo_comun.of_loaddddw(idc_operacion,il_tipoprod,n_cst_application.itr_appl)

ll_resultado = tab_proceso.tabpage_precedencias.dw_actividades.Retrieve(al_operacion, al_tipoprod)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando actividades predecesoras.",StopSign!)
		Return -1
	Case 0
		ls_msj+='*Actividad sin actividades predecesoras~n'
End Choose

ll_resultado = tab_proceso.tabpage_precedencias.dw_operaciones.Retrieve(al_operacion, il_tipoprod)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando operaciones predecesoras.",StopSign!)
		Return -1
	Case 0
		ls_msj+='*Actividad sin operaciones predecesoras~n'
End Choose


Return 1
end function

public function integer of_existe_operacion (integer al_operacion, integer ai_tipoprod);/*-------------------------------------------------
MODIFICADO: Octubre 08 de 2009 - gaudelo - ohlondon
---------------------------------------------------
> Verifica si la operacion existe para ese tipo de 
  producto
---------------------------------------------------*/
Long ll_resultado,ll_cont
String ls_de_operacion
n_ds_application lds_operacion
//---------------------------------------------------
lds_operacion = CREATE n_ds_application
lds_operacion.of_load('d_nro_operacion_tipoprod')
lds_operacion.of_conexion(n_cst_application.itr_appl,True)

ll_resultado = lds_operacion.Retrieve(al_operacion, ai_tipoprod)

Choose Case ll_resultado
	Case Is <= 0 
		MessageBox("Advertencia!","Error recuperando datos de la operaci$$HEX1$$f300$$ENDHEX$$n en el registro de muestras",StopSign!)		
		Return -1	
	Case 1
		ll_cont=lds_operacion.GetItemNumber(1,'nro_operacion')
		If ll_cont > 0 Then
			MessageBox("Advertencia!","El c$$HEX1$$f300$$ENDHEX$$digo de la operaci$$HEX1$$f300$$ENDHEX$$n "+String(al_operacion)+" ya est$$HEX2$$e1002000$$ENDHEX$$registrado para"+&
			                          " el tipo de producto "+String(ai_tipoprod),StopSign!)
			Return -1				
		End If
		lds_operacion.of_load('d_bus_m_operacio_ct')
		lds_operacion.of_conexion(n_cst_application.itr_appl,True)
		ll_resultado = lds_operacion.Retrieve(ai_tipoprod,al_operacion)
		Choose Case ll_resultado
			Case Is <0
				MessageBox("Advertencia!","Error recuperando datos de la existencia externa de la operaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
				Return -1
			Case 0
				MessageBox("Advertencia!","El c$$HEX1$$f300$$ENDHEX$$digo de la operaci$$HEX1$$f300$$ENDHEX$$n '"+String(al_operacion)+"' no existe en el registro externo.",StopSign!)		
				Return -1
			Case 1
				is_desc=lds_operacion.GetItemString(1,'de_operacion')
				//dw_operacion.SetItem(1,'de_operacion',lds_operacion.GetItemString(1,'de_operacion'))
			Case Else
				MessageBox("Advertencia!","El c$$HEX1$$f300$$ENDHEX$$digo de la operaci$$HEX1$$f300$$ENDHEX$$n posee m$$HEX1$$e100$$ENDHEX$$s de una instancia en el registro externo.",StopSign!)		
				Return -1
		End Choose
End Choose
DESTROY lds_operacion
//-------------------------------------------------------------------------------------------------------------------------------------
Return 1
end function

on w_proceso_muestras.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_proceso_muestras" then this.MenuID = create m_proceso_muestras
this.dw_verifica_precedencia=create dw_verifica_precedencia
this.tab_proceso=create tab_proceso
this.dw_operacion=create dw_operacion
this.gb_operacion=create gb_operacion
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_verifica_precedencia
this.Control[iCurrent+2]=this.tab_proceso
this.Control[iCurrent+3]=this.dw_operacion
this.Control[iCurrent+4]=this.gb_operacion
end on

on w_proceso_muestras.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_verifica_precedencia)
destroy(this.tab_proceso)
destroy(this.dw_operacion)
destroy(this.gb_operacion)
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
			dw_operacion.SetFocus()
		Case Key2!			
			tab_proceso.SelectTab(tab_proceso.tabpage_criteriotiempo)
			tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.SetFocus()			
		Case Key3!
			tab_proceso.SelectTab(tab_proceso.tabpage_grupos)
			tab_proceso.tabpage_grupos.dw_grupo_operacion.SetFocus()			
		Case Key4!			
			tab_proceso.SelectTab(tab_proceso.tabpage_recursos)
			tab_proceso.tabpage_recursos.dw_recurso_operacion.SetFocus()		
		Case Key5!
			tab_proceso.SelectTab(tab_proceso.tabpage_maqtin)		
			tab_proceso.tabpage_maqtin.dw_mu_maqtin_oper.SetFocus()				
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
Open(w_opc_proceso_muestras)

lou_param = Message.PowerObjectParm

If IsValid(lou_param) Then	
	of_redraw(False)
	/*
	* MODIFICADO: Agosto 19 de 2009 - ohlondon 
	* Se debe consultar con la clave primaria que ahora es operacion
	* y tipo de producto.
	* 
   *	of_buscar(lou_param.il_vector[1])	
	*/
	of_buscar(lou_param.il_vector[1], lou_param.il_vector[2])	
	
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
Guardar datos de operaci$$HEX1$$f300$$ENDHEX$$n
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
of_ok_operacion()
//***********************************************
il_operacion = dw_operacion.GetItemNumber(1,"co_operacion")
il_tipoprod  = dw_operacion.GetItemNumber(1,"co_tipoprod")
MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","La operaci$$HEX1$$f300$$ENDHEX$$n ~'"+String(il_operacion)+"~' se registr$$HEX2$$f3002000$$ENDHEX$$satisfactoriamente.")
ib_cambios=False
ib_save=True
of_buscar(il_operacion, il_tipoprod)
//---------------------------------------------------------------------------
end event

type dw_verifica_precedencia from u_dw_application within w_proceso_muestras
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

type tab_proceso from tab within w_proceso_muestras
integer x = 73
integer y = 460
integer width = 3438
integer height = 1220
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

on tab_proceso.create
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

on tab_proceso.destroy
destroy(this.tabpage_criteriotiempo)
destroy(this.tabpage_grupos)
destroy(this.tabpage_recursos)
destroy(this.tabpage_maqtin)
destroy(this.tabpage_precedencias)
end on

type tabpage_criteriotiempo from userobject within tab_proceso
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3401
integer height = 1100
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
integer width = 3291
integer height = 928
integer taborder = 30
string dataobject = "d_mu_pro_t1"
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
//d_mu_proc_t2
If dwo.name = 'cilindros' Then
	If This.of_existcolumn('nuevo_reforma') Then
		ls_exp="Match(nuevo_reforma,~'"+This.GetItemString(row,'nuevo_reforma')+"~')"
		ls_exp=dwo.name+"="+data+" AND "+ls_exp	
		ll_pos=find(ls_exp,1,RowCount())
		If ll_pos>0 then		
			MessageBox("Advertencia!","Cilindros y Reforma ya seleccionados.",StopSign!)
			Return 2
		End If
	Else
		ls_exp="co_tipo_tejido="+String(This.GetItemNumber(row,'co_tipo_tejido'))
		ls_exp=dwo.name+"="+data+" AND "+ls_exp	
		ll_pos=find(ls_exp,1,RowCount())
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
//d_mu_proc_t3
If dwo.name = 'co_tipo_tejido' Then
	ls_exp='cilindros='+String(This.GetItemNumber(row,'cilindros'))
	ls_exp=dwo.name+"="+data+" AND "+ls_exp	
	ll_pos=find(ls_exp,1,RowCount())
	If ll_pos>0 then
		MessageBox("Advertencia!","El tipo de tejido y los Cilindros est$$HEX1$$e100$$ENDHEX$$n seleccionados.",StopSign!)
		Return 2
	End If
	ll_pos=idc_tipotej.Find('co_ttejido='+Data,1,idc_tipotej.RowCount())
	This.SetItem(row,'de_tipo_tejido',Trim(idc_tipotej.GetItemString(ll_pos,'de_ttejido')))
End If
//-------------------------------------------------
//d_mu_proc_t4
If dwo.name = 'co_grupo_tlla' Then
//	ls_exp="co_talla="+String(This.GetItemNumber(row,'co_talla'))
//	ls_exp=dwo.name+"="+data+" AND "+ls_exp
//	ll_pos=find(ls_exp,1,RowCount())
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
//d_mu_proc_t5
If dwo.name = 'co_tono' Then
	ll_pos=find("co_tono="+data,1,RowCount())
	If ll_pos>0 then
		MessageBox("Advertencia!","El tono ya est$$HEX2$$e1002000$$ENDHEX$$seleccionado.",StopSign!)
		Return 2
	End If
End If
//--------------------------------------------------
if dw_operacion.GetItemNumber(1, 'criterio_tiempo') = 1 THEN
	tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.SetItem(1,"co_operacion",il_operacion)
	tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.SetItem(1,"co_tipoprod",il_tipoprod)
END IF			
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
If dw_operacion.Rowcount()<=0 Then
	MessageBox("Advertencia!","Debe especificar la operaci$$HEX1$$f300$$ENDHEX$$n para la muestra.",StopSign!)
	Return
End If
ll_i = dw_operacion.GetItemNumber(1,'criterio_tiempo')
If IsNull(ll_i) And il_operacion<>0 Then
	MessageBox("Advertencia!","Debe especificar un criterio de tiempo.",StopSign!)
	Return
End If
//-------------------------------------------------
/*
Se quita para que deje borrar
If il_criterio=1 Then
	Return
End If
*/
If il_criterio=1 THEN
	IF This.RowCount() = 1 Then
		Return
	ELSEIF This.RowCount() = 0 Then
		of_cargar_dwo('1')
		Return
	END IF
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
This.SetItem(ll_i,"co_operacion",il_operacion)
//-------------------------------------------------	
If This.of_existcolumn('co_tipoprod') Then	
	SetItem(ll_i,'co_tipoprod', il_tipoprod)
	
	ll_res=lo_comun.of_nombretipoprod(GetItemNumber(ll_i,'co_tipoprod'),n_cst_application.itr_appl)
	If ll_res<>1 Then
		MessageBox("Advertencia!","El valor de tipo producto por defecto no es v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return
	End If
	If This.of_existcolumn('de_tipoprod') Then
		SetItem(ll_i,"de_tipoprod",Trim(lo_comun.of_getString(1)))
	End If
End If
//-------------------------------------------------	
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
/*
If il_criterio=1 Then
	Return
End If
*/
Super::Event ue_deleteRow()
end event

type tabpage_grupos from userobject within tab_proceso
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3401
integer height = 1100
long backcolor = 80269524
string text = "Grupos (Ctrl+3)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_grupo_operacion dw_grupo_operacion
end type

on tabpage_grupos.create
this.dw_grupo_operacion=create dw_grupo_operacion
this.Control[]={this.dw_grupo_operacion}
end on

on tabpage_grupos.destroy
destroy(this.dw_grupo_operacion)
end on

type dw_grupo_operacion from u_dw_application within tabpage_grupos
integer x = 55
integer y = 56
integer width = 2272
integer height = 928
integer taborder = 20
string dataobject = "d_mu_gru_oper"
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
//-------------------------------------------------
If Row=0 Then Return

If dwo.name="id_grupo" then
		lo_param.il_vector[1]=il_operacion
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

event itemchanged;call super::itemchanged;/*-------------------------------------------------
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
		MessageBox("Advertencia!","Grupo de la operaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_grupo",lo_comun.of_getString(1))
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
If dw_operacion.Rowcount()<=0 Then
	MessageBox("Advertencia!","Debe especificar la operaci$$HEX1$$f300$$ENDHEX$$n para la muestra.",StopSign!)
	Return
End If
//-------------------------------------------------
Super::Event ue_insertRow()
ll_i = This.GetRow()
This.SetItem(ll_i,"co_operacion",il_operacion)
This.SetItem(ll_i,"co_tipoprod",il_tipoprod)
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

type tabpage_recursos from userobject within tab_proceso
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3401
integer height = 1100
long backcolor = 80269524
string text = "Recursos Tejido (Ctrl+4)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_recurso_operacion dw_recurso_operacion
end type

on tabpage_recursos.create
this.dw_recurso_operacion=create dw_recurso_operacion
this.Control[]={this.dw_recurso_operacion}
end on

on tabpage_recursos.destroy
destroy(this.dw_recurso_operacion)
end on

type dw_recurso_operacion from u_dw_application within tabpage_recursos
integer x = 55
integer y = 56
integer width = 2313
integer height = 928
integer taborder = 40
string dataobject = "d_mu_rec_oper"
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
//-------------------------------------------------
If Row=0 Then Return

If dwo.name="co_recurso" Then
	lo_param.il_vector[1]=il_tipoprod

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
	SetItem(Row,"de_recurso",lo_comun.of_getString(1))
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
If dw_operacion.Rowcount()<=0 Then
	MessageBox("Advertencia!","Debe especificar la operaci$$HEX1$$f300$$ENDHEX$$n para la muestra.",StopSign!)
	Return
End If
//-------------------------------------------------
Super::Event ue_insertRow()
ll_i = This.GetRow()
This.SetItem(ll_i,"co_operacion",il_operacion)
This.SetColumn('co_operacion')
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

type tabpage_maqtin from userobject within tab_proceso
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3401
integer height = 1100
long backcolor = 80269524
string text = "Recursos M$$HEX1$$e100$$ENDHEX$$quinas Tintorer$$HEX1$$ed00$$ENDHEX$$a (Ctrl+5)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_mu_maqtin_oper dw_mu_maqtin_oper
end type

on tabpage_maqtin.create
this.dw_mu_maqtin_oper=create dw_mu_maqtin_oper
this.Control[]={this.dw_mu_maqtin_oper}
end on

on tabpage_maqtin.destroy
destroy(this.dw_mu_maqtin_oper)
end on

type dw_mu_maqtin_oper from u_dw_application within tabpage_maqtin
integer x = 55
integer y = 56
integer width = 2866
integer height = 928
integer taborder = 50
string dataobject = "d_mu_maqtin_oper"
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
If dw_operacion.Rowcount()<=0 Then
	MessageBox("Advertencia!","Debe especificar la operaci$$HEX1$$f300$$ENDHEX$$n para la muestra.",StopSign!)
	Return
End If
//-------------------------------------------------
Super::Event ue_insertRow()
ll_i = This.GetRow()
This.SetItem(ll_i,"co_operacion",il_operacion)
This.SetItem(ll_i,"co_tipoprod",il_tipoprod)
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
If dwo.name='co_fabrica' or dwo.name='cs_maquina' Then
	If Long(Data)=0 Then
		SetNull(li_null)
		ls_col=dwo.name
		This.SetItem(row,ls_col,li_null)
		This.SetItem(row,'de_maquina','')		
		Return 3
	End If		
End If
end event

type tabpage_precedencias from userobject within tab_proceso
integer x = 18
integer y = 104
integer width = 3401
integer height = 1100
long backcolor = 80269524
string text = "Precedencias"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_operaciones dw_operaciones
dw_actividades dw_actividades
gb_actividades gb_actividades
gb_operaciones gb_operaciones
end type

on tabpage_precedencias.create
this.dw_operaciones=create dw_operaciones
this.dw_actividades=create dw_actividades
this.gb_actividades=create gb_actividades
this.gb_operaciones=create gb_operaciones
this.Control[]={this.dw_operaciones,&
this.dw_actividades,&
this.gb_actividades,&
this.gb_operaciones}
end on

on tabpage_precedencias.destroy
destroy(this.dw_operaciones)
destroy(this.dw_actividades)
destroy(this.gb_actividades)
destroy(this.gb_operaciones)
end on

type dw_operaciones from u_dw_application within tabpage_precedencias
integer x = 1536
integer y = 84
integer width = 1751
integer height = 920
integer taborder = 20
string dataobject = "d_mu_pr_op_op"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Lunes 18 de Abril de 2005 HORA 17:16:20:046
// 
// 
//////////////////////////////////////////////////////////////////////////

Long ll_pos, ll_resultado, ll_estado_operacion
n_cst_comun_orden lo_comun //orden.lib
//-------------------------------------------------
If il_err_item_change<>0 Then
	Return 2
End If
//--------------------------------------------------------------------
If dwo.name="co_operacion_pre" Then
	ll_pos=Find("co_operacion_pre="+data,1,RowCount())
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

event ue_insertrow;Long ll_i
//-------------------------------------------------
If dw_operacion.Rowcount()<=0 Then
	MessageBox("Advertencia!","Debe especificar la operaci$$HEX1$$f300$$ENDHEX$$n para la muestra.",StopSign!)
	Return
End If
//-------------------------------------------------
Super::Event ue_insertRow()
ll_i = This.GetRow()
This.SetItem(ll_i,"co_operacion",il_operacion)
This.SetItem(ll_i,"co_tipoprod",il_tipoprod)
end event

event getfocus;call super::getfocus;gb_operaciones.textcolor=Rgb(0,0,255)
end event

event losefocus;call super::losefocus;gb_operaciones.textcolor=Rgb(0,0,0)
end event

type dw_actividades from u_dw_application within tabpage_precedencias
integer x = 55
integer y = 84
integer width = 1385
integer height = 920
string dataobject = "d_mu_pr_op_ac"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:09:31
---------------------------------------------------
---------------------------------------------------*/
gb_actividades.textcolor=Rgb(0,0,255)


end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
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
If dwo.name="id_actividad" Then
	ll_pos=find("id_actividad="+data,1,RowCount())
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

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:09:31
---------------------------------------------------
---------------------------------------------------*/
gb_actividades.textcolor=Rgb(0,0,0)

end event

event ue_insertrow;Long ll_i
//-------------------------------------------------
If dw_operacion.Rowcount()<=0 Then
	MessageBox("Advertencia!","Debe especificar la operaci$$HEX1$$f300$$ENDHEX$$n para la muestra.",StopSign!)
	Return
End If
//-------------------------------------------------
Super::Event ue_insertRow()
ll_i = This.GetRow()
This.SetItem(ll_i,"co_operacion",il_operacion)

end event

type gb_actividades from groupbox within tabpage_precedencias
integer x = 23
integer y = 24
integer width = 1477
integer height = 1016
integer taborder = 10
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

type gb_operaciones from groupbox within tabpage_precedencias
integer x = 1522
integer y = 24
integer width = 1806
integer height = 1016
integer taborder = 20
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

type dw_operacion from u_dw_application within w_proceso_muestras
integer x = 110
integer y = 72
integer width = 3328
integer height = 320
string dataobject = "d_m_operac_muestra2"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:09:31
---------------------------------------------------
---------------------------------------------------*/
gb_operacion.of_color(True)
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:09:31
---------------------------------------------------
---------------------------------------------------*/
gb_operacion.of_color(False)
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:12:00
---------------------------------------------------
---------------------------------------------------*/
Long ll_res,ll_c
//-------------------------------------------------
If ib_cambios Then
	ll_res=MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","$$HEX1$$bf00$$ENDHEX$$Desea descartar los cambios?",Question!,YesNo!,2)
	
	If ll_res=2 Then
	 Return
	End If
End If
//--------------------------------------------------
of_reset()
il_operacion=0
Parent.title="Registro de Operaciones"
Call Super::ue_insertrow
This.SetItem(1,'co_operacion',il_operacion)
ll_c=This.GetItemNumber(1,'criterio_tiempo')

If IsNull(ll_c) Then
 	ll_c=1 //Criterio tiempo 1
End If
il_criterio = ll_c
/*
Se quita para que no lo cargue por defecto
of_cargar_dwo(String(ll_c))
*/
This.SetFocus( )
This.SetColumn('co_operacion')
ib_reg=false
ib_nuevo=true
SetNull(il_tipoprod)

end event

event itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:14:34
---------------------------------------------------
---------------------------------------------------*/
Long ll_i,ll_c, ll_operacion, ll_operacion_ant
Integer li_res, li_tipoprod_ant, li_tipoprod
String ls_dwo_criterio,ls_operacion, ls_oper_ant
u_dw_application ldw_criterio

Long ll_criterio_ant
String ls_de_act
n_cst_comun  lo_comun

//-------------------------------------------------
If il_err_item_change<>0 Then
	Return 2
End If

ll_operacion_ant = GetItemNumber(row,'co_operacion')
li_tipoprod_ant  = GetItemNumber(row,'co_tipoprod')
ls_oper_ant      = GetItemString(row,'de_operacion')
//-------------------------------------------------
If dwo.name = 'co_operacion' Then
	
	//****
	If Not ib_nuevo Then
		If ib_cambios and il_operacion>0 Then
			li_res=MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
			If li_res=2 Then
				Return 2		
			End If				
		End If
		of_redraw(False)			
		of_reset()
		il_operacion=Long(Data)
		dw_operacion.InsertRow(0)		
		dw_operacion.SetItem(1,'co_operacion',il_operacion)
		dw_operacion.SetItem(1,'de_operacion',is_desc)
		ll_c=This.GetItemNumber(1,'criterio_tiempo')
		If IsNull(ll_c) Then
			ll_c=1 //Criterio tiempo 1
		End If
		of_cargar_dwo(String(ll_c))
		This.SetFocus( )
		This.SetColumn('co_estado')
		of_redraw(True)
		ib_nuevo=True
	Else
		il_operacion=Long(Data)
		dw_operacion.SetItem(1,'de_operacion',is_desc)
	End If	
	Return 0	
End If

//-------------------------------------------------
If dwo.name = 'co_estado' Then	
	il_co_estado = Long(Data)
	ll_i=idc_estado.Find('co_estado='+Data,1,idc_estado.RowCount())
	This.SetItem(row,'de_estado',idc_estado.GetItemString(ll_i,'de_estado'))
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
	
		ldw_criterio = tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo
		If ldw_criterio.RowCount()>0 AND (ldw_criterio.ModifiedCount() + ldw_criterio.DeletedCount())>0 Then
			If MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","$$HEX1$$bf00$$ENDHEX$$Desea cambiar de criterio de tiempo ?",Question!,YesNo!,2)=2 Then
				Return 2		
			End If
		End If
		//***************************************************************************
		of_cargar_dwo(Data)
		ll_i=ldw_criterio.Retrieve(il_operacion, il_tipoprod)
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

//--------------------------------------------------------------
// MODIFICADO: Agosto 14 de 2009 - ohlondon
//--------------------------------------------------------------
If dwo.name = 'co_tipoprod' Then		
	
	il_tipoprod = Long (data)
	
	// Se debe preguntar por los detalles asociados a la operacion:
	// Si alguno de ellos tiene informacion se debe obligar a borrala
	// antes de cambiar el tipo de producto
	
	lo_comun.of_loaddddw(idc_grupoprod, il_tipoprod , n_cst_application.itr_appl)
	lo_comun.of_loaddddw(idc_tipomaquina,il_tipoprod,n_cst_application.itr_appl)		
	lo_comun.of_loadDddw(idc_tipotej,il_tipoprod,n_cst_application.itr_appl)
	lo_comun.of_loaddddw(idc_actividad,il_tipoprod,n_cst_application.itr_appl)
	lo_comun.of_loaddddw(idc_operacion,il_tipoprod,n_cst_application.itr_appl)

	//dw_actividades
End If

If dwo.name = 'co_operacion' OR dwo.name = 'co_tipoprod' Then	
	IF ( NOT IsNull(il_tipoprod) AND il_tipoprod <> 0 ) AND &
		( NOT IsNull(il_operacion) AND il_operacion <> 0 ) THEN
		//Busqueda de existencia del codigo de la operaci$$HEX1$$f300$$ENDHEX$$n
		If of_existe_operacion(il_operacion, il_tipoprod) <> 1 Then
			This.SetItem(row,'co_operacion', ll_operacion_ant )
			This.SetItem(row,'co_tipoprod', li_tipoprod_ant  )
			This.SetItem(row,'de_operacion', ls_oper_ant )
			il_operacion = ll_operacion_ant
			il_tipoprod  = li_tipoprod_ant 
			Return 2		
		End If
	END IF
	
	IF tab_proceso.tabpage_criteriotiempo.dw_estimar_tiempo.RowCount() > 0 OR &
	   tab_proceso.tabpage_grupos.dw_grupo_operacion.RowCount()        > 0 OR &
      tab_proceso.tabpage_recursos.dw_recurso_operacion.RowCount()    > 0 OR &
	   tab_proceso.tabpage_maqtin.dw_mu_maqtin_oper.RowCount()         > 0 OR &
	   tab_proceso.tabpage_precedencias.dw_actividades.RowCount()      > 0 OR &
	   tab_proceso.tabpage_precedencias.dw_operaciones.RowCount()      > 0 THEN
		MessageBox("Advertencia","Para cambiar de tipo de producto debe borrar primero la informaci$$HEX1$$f300$$ENDHEX$$n de los detalles.")
		This.SetItem(row,'co_operacion', ll_operacion_ant )
		This.SetItem(row,'co_tipoprod', li_tipoprod_ant  )
		This.SetItem(row,'de_operacion', ls_oper_ant )
		il_operacion = ll_operacion_ant
		il_tipoprod  = li_tipoprod_ant 
		RETURN 1
		
	END IF
	
END IF

ib_cambios = True
end event

event ue_deleterow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 25 de Octubre de 2004.H:17:25
---------------------------------------------------
Overwrite!
--------------------------------------------------*/
end event

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 19 de Noviembre de 2004.H:18:10
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lo_param
//-------------------------------------------------
If Row=0 Then Return
//-------------------------------------------------
If dwo.name="co_operacion" then
		lo_param.il_vector[1]=10 /*C$$HEX1$$f300$$ENDHEX$$digo de tipo de producto para argumento de b$$HEX1$$fa00$$ENDHEX$$squeda*/
		OpenWithParm(w_bus_m_operacio_ct,lo_param)
		lo_param=Message.PowerObjectParm
		If IsValid(lo_param) Then
			SetText(String(lo_param.il_vector[1]))			
			AcceptText()
			SetColumn('co_estado')
		End If		
End If
//-------------------------------------------------
end event

event itemerror;call super::itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 06 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Integer li_null
//-------------------------------------------------
If dwo.name='co_estado' Then
	If Long(Data)=0 Then
		SetNull(li_null)
		This.SetItem(row,String(dwo.name),li_null)		
		SetItem(row,'de_operacion','')	//???	
		Return 3
	End If	
End If

If dwo.name = 'co_operacion'Then
	Return 3
ELSE
	Return 1
End If

end event

type gb_operacion from u_gb_base within w_proceso_muestras
integer x = 73
integer y = 16
integer width = 3438
integer height = 396
integer taborder = 0
long backcolor = 67108864
string text = "Registro de Operaci$$HEX1$$f300$$ENDHEX$$n (Ctrl+1)"
end type

