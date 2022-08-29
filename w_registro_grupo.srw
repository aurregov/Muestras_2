HA$PBExportHeader$w_registro_grupo.srw
$PBExportComments$Ventana de Registro de grupos de la muestra para la programaci$$HEX1$$f300$$ENDHEX$$n. Algunas actividades de preproducci$$HEX1$$f300$$ENDHEX$$n emplean grupos de trabajo, aqui se componen con varios integrantes de control t$$HEX1$$e900$$ENDHEX$$cnico.Estos grupos pueden atender muestras simultaneamente
forward
global type w_registro_grupo from w_sheet
end type
type tab_detalle_grupo from tab within w_registro_grupo
end type
type tabpage_operaciones from userobject within tab_detalle_grupo
end type
type dw_operacion_grupo from u_dw_application within tabpage_operaciones
end type
type tabpage_operaciones from userobject within tab_detalle_grupo
dw_operacion_grupo dw_operacion_grupo
end type
type tabpage_actividades from userobject within tab_detalle_grupo
end type
type dw_actividad_grupo from u_dw_application within tabpage_actividades
end type
type tabpage_actividades from userobject within tab_detalle_grupo
dw_actividad_grupo dw_actividad_grupo
end type
type tabpage_recursos_tj from userobject within tab_detalle_grupo
end type
type dw_recurso_grupo from u_dw_application within tabpage_recursos_tj
end type
type tabpage_recursos_tj from userobject within tab_detalle_grupo
dw_recurso_grupo dw_recurso_grupo
end type
type tabpage_maq_tin from userobject within tab_detalle_grupo
end type
type dw_maquina_tintoreria from u_dw_application within tabpage_maq_tin
end type
type tabpage_maq_tin from userobject within tab_detalle_grupo
dw_maquina_tintoreria dw_maquina_tintoreria
end type
type tab_detalle_grupo from tab within w_registro_grupo
tabpage_operaciones tabpage_operaciones
tabpage_actividades tabpage_actividades
tabpage_recursos_tj tabpage_recursos_tj
tabpage_maq_tin tabpage_maq_tin
end type
type dw_grupo from u_dw_application within w_registro_grupo
end type
type gb_grupo from u_gb_base within w_registro_grupo
end type
type dw_integrante_grupo from u_dw_application within w_registro_grupo
end type
type gb_integrante from u_gb_base within w_registro_grupo
end type
end forward

global type w_registro_grupo from w_sheet
string tag = "Registro de Grupos de Trabajo"
integer width = 3662
integer height = 2116
string title = "Registro de Grupos de Trabajo"
string menuname = "m_grupo_muestras"
boolean maxbox = true
windowstate windowstate = maximized!
event ue_eliminar_grupo ( )
tab_detalle_grupo tab_detalle_grupo
dw_grupo dw_grupo
gb_grupo gb_grupo
dw_integrante_grupo dw_integrante_grupo
gb_integrante gb_integrante
end type
global w_registro_grupo w_registro_grupo

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 05 de Noviembre de 2004.H:14:53
---------------------------------------------------
---------------------------------------------------*/
Public:
	String is_where_busqueda
	Boolean ib_cambios=False,ib_reg=false,ib_save,ib_dbclk
	Long il_grupo, il_turno,il_co_fabrica, il_tipoprod//, il_estado
	DataWindowChild	idc_tecnico, idc_maqtin, idc_recurso, idc_turno,&
							idc_actividad,idc_estado
end variables

forward prototypes
public function integer of_buscar (long al_grupo)
public function integer of_carga_objtr ()
public function integer of_consecutivo ()
public function integer of_eliminar_grupo ()
public function integer of_error_grupo ()
public function integer of_guardar ()
public function integer of_newdt_grupo ()
public function integer of_ok_grupo ()
public function integer of_reset ()
public function integer of_verificar ()
public function integer of_carga_dddw ()
public function integer of_redraw (boolean al_redrawing)
public function integer of_validar_tecnico (string as_ctecnico)
public function integer of_filtrar_activ (long al_estado)
end prototypes

event ue_eliminar_grupo();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:09:41
---------------------------------------------------
Evento que delega la eliminaci$$HEX1$$f300$$ENDHEX$$n del grupo a la funci$$HEX1$$f300$$ENDHEX$$n
of_eliminar_grupo
---------------------------------------------------*/
of_Redraw(False)
of_eliminar_grupo()
of_Redraw(True)
end event

public function integer of_buscar (long al_grupo);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 04 de Noviembre de 2004.H:15:48
---------------------------------------------------
B$$HEX1$$fa00$$ENDHEX$$squeda de los grupos almacenados
---------------------------------------------------*/
Long ll_resultado
String ls_msj=''
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
If dw_grupo.RowCount()>0 Then
			of_Reset()
End If
//-------------------------------------------------------------------------------------------------
// Retrieve a los datos de la tabla de grupos 'm_mu_grupo'
ll_resultado = dw_grupo.Retrieve(al_grupo)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de los grupos.",StopSign!)		
		Return -1
	Case 0
		MessageBox("Advertencia!","El c$$HEX1$$f300$$ENDHEX$$digo del grupo no se encontr$$HEX1$$f300$$ENDHEX$$.",StopSign!)			
		Return -1
End Choose

//-------------------------------------------------------------------------------------------------
// Retrieve a los integrantes de la tabla 'dt_mu_grupo'
ll_resultado = dw_integrante_grupo.Retrieve(al_grupo)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de los integrantes de $$HEX1$$e900$$ENDHEX$$ste grupo.",StopSign!)
		Return -1
	Case 0
		ls_msj+='*Grupo sin integrantes ~n'
End Choose
//-------------------------------------------------------------------------------------------------
// Retrieve a los recursos del grupo en 'dt_mu_rec_gru'
ll_resultado = tab_detalle_grupo.tabpage_recursos_tj.dw_recurso_grupo.Retrieve(al_grupo)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de los recursos para el grupo.",StopSign!)
		Return -1
	Case 0
		ls_msj+='*Grupos sin recursos ~n'
End Choose
//-------------------------------------------------------------------------------------------------
// Retrieve a las m$$HEX1$$e100$$ENDHEX$$quinas TIN  de la tabla 'mu_gru_mtin'
ll_resultado = tab_detalle_grupo.tabpage_maq_tin.dw_maquina_tintoreria.Retrieve(al_grupo)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de las m$$HEX1$$e100$$ENDHEX$$quinas de tintorer$$HEX1$$ed00$$ENDHEX$$a para el grupo.",StopSign!)
		Return -1
	Case 0
		ls_msj+='*Grupo sin maquinas TIN ~n'
End Choose
//-------------------------------------------------------------------------------------------------
ll_resultado = tab_detalle_grupo.tabpage_actividades.dw_actividad_grupo.Retrieve(al_grupo)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de las actividades para el grupo.",StopSign!)
		Return -1
	Case 0
		ls_msj+='*Grupo sin actividades ~n'
End Choose
//-------------------------------------------------------------------------------------------------
/*
* MODIFICADO: Agosto 20 de 2009 - ohlondon
*/
ll_resultado = tab_detalle_grupo.tabpage_operaciones.dw_operacion_grupo.Retrieve(al_grupo, il_tipoprod )
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de las operaciones para el grupo.",StopSign!)
		Return -1
	Case 0
		ls_msj+='*Grupo sin operaciones ~n'
End Choose
il_grupo = dw_grupo.GetItemNumber(1,'id_grupo')//al_grupo
il_turno = dw_grupo.GetItemNumber(1,'id_turno')
//il_estado = dw_grupo.GetItemNumber(1,'co_estado')
//of_filtrar_activ (il_estado) Requerimiento V.3.0
If IsNull(il_turno) Then
	il_turno=0
End If
Title='Registro de Grupos de Trabajo | Turno: '+String(il_turno)
//-------------------------------------------------------------------------------------------------
of_redraw(True)
If Not ib_save Then
	MessageBox("Grupo Nro. "+String(il_grupo),'Grupo Cargado!~n'+ls_msj,Information!)
Else
	ib_save=False
End If
ib_reg=true
Return 1
end function

public function integer of_carga_objtr ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 04 de Noviembre de 2004.H:15:47
---------------------------------------------------
Carga los obj. de transacci$$HEX1$$f300$$ENDHEX$$n
---------------------------------------------------*/
dw_grupo.of_conexion(n_cst_application.itr_appl,True)
dw_integrante_grupo.of_conexion(n_cst_application.itr_appl,True)
tab_detalle_grupo.tabpage_recursos_tj.dw_recurso_grupo.of_conexion(n_cst_application.itr_appl,True)
tab_detalle_grupo.tabpage_maq_tin.dw_maquina_tintoreria.of_conexion(n_cst_application.itr_appl,True)
tab_detalle_grupo.tabpage_actividades.dw_actividad_grupo.of_conexion(n_cst_application.itr_appl,True)
tab_detalle_grupo.tabpage_operaciones.dw_operacion_grupo.of_conexion(n_cst_application.itr_appl,True)

Return 1

end function

public function integer of_consecutivo ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 05 de Noviembre de 2004.H:10:34
---------------------------------------------------
Generaci$$HEX1$$f300$$ENDHEX$$n del consecutivo. Devuelve -1 si el proceso no fu$$HEX1$$e900$$ENDHEX$$
exitoso.
----------------------------------------------------
Consulta del consecutivo
El codigo para las grupos de trabajo ser$$HEX2$$e1002000$$ENDHEX$$para el 
ID '32'<--- creada en tiempo de dise$$HEX1$$f100$$ENDHEX$$o
Log del registro :
Table  : cf_consecutivos@crydes
Fields : co_fabrica 		= 2
			id_documento 	= 32
			cs_documento 	= *(ini)
			ob_documento 	= Grupos de Trabajo-Programaci$$HEX1$$f300$$ENDHEX$$n
			sw_replica		= 0
			instancia		= crydes01/nicdes01
---------------------------------------------------*/
Boolean lb_continuar
Long ll_cantidad
n_ds_application lds_cant_grupo
//--------------------------------------------------
lds_cant_grupo = CREATE n_ds_application
lds_cant_grupo.of_load('d_nro_grupo')
lds_cant_grupo.of_conexion(n_cst_application.itr_appl,True)
lb_continuar=True
DO WHILE lb_continuar //*
	il_grupo = n_cst_application.of_consecutive(n_cst_application.ii_fabrica,32,n_cst_application.itr_appl)
   If il_grupo<=0 Then
		il_grupo=0
		MessageBox("Advertencia!","No se pudo determinar el consecutivo del grupo de trabajo para registrar.",StopSign!)
		Return -1
	End If
	
	ll_cantidad = lds_cant_grupo.Retrieve(il_grupo)
	If ll_cantidad<= 0 Then
			MessageBox("Advertencia!","Error recuperando la cuenta del c$$HEX1$$f300$$ENDHEX$$digo del Grupo(ds).",StopSign!)		
			Return -1						
	End If
	ll_cantidad = lds_cant_grupo.GetItemNumber(1,'nro_grupo')
	If ll_cantidad=0 Then
		lb_continuar=False
	End If
LOOP //*
DESTROY lds_cant_grupo
//<------
//MessageBox('INFO','# consecutivo de grupo:'+String(il_grupo),Information!)
If il_grupo>0 Then
	Return 1
End If
//
Return -1
end function

public function integer of_eliminar_grupo ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 04 de Noviembre de 2004.H:15:50
---------------------------------------------------
Elimina el grupo
-------------------------------------------------------------------------------------*/
long ll_respuesta
n_cst_comun_orden lo_comun
//-------------------------------------------------------------------------------------
If dw_grupo.RowCount()<1 Then
	Return -1
End If

If Not ib_reg Then
	MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Grupo no registrado!.",Information!)
	Return -1
End If
////-------------------------------------------------------------------------------------
ll_respuesta = MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","$$HEX2$$bf002000$$ENDHEX$$Desea eliminar este Grupo y sus datos relacionados?",Question!,YesNo!,2)
If ll_respuesta<>1 Then
	Return -1
End If
//-------------------------------------------------------------------------------------
dw_grupo.DeleteRow(0)
dw_integrante_grupo.RowsMove(1,dw_integrante_grupo.RowCount(),Primary!,dw_integrante_grupo,dw_integrante_grupo.DeletedCount()+1,Delete!)
tab_detalle_grupo.tabpage_recursos_tj.dw_recurso_grupo.RowsMove(1,tab_detalle_grupo.tabpage_recursos_tj.dw_recurso_grupo.RowCount(),Primary!,tab_detalle_grupo.tabpage_recursos_tj.dw_recurso_grupo,tab_detalle_grupo.tabpage_recursos_tj.dw_recurso_grupo.DeletedCount()+1,Delete!)
tab_detalle_grupo.tabpage_maq_tin.dw_maquina_tintoreria.RowsMove(1,tab_detalle_grupo.tabpage_maq_tin.dw_maquina_tintoreria.RowCount(),Primary!,tab_detalle_grupo.tabpage_maq_tin.dw_maquina_tintoreria,tab_detalle_grupo.tabpage_maq_tin.dw_maquina_tintoreria.DeletedCount()+1,Delete!)
//********************/!!!/**********************************************************************************************************************
tab_detalle_grupo.tabpage_actividades.dw_actividad_grupo.RowsMove(1,tab_detalle_grupo.tabpage_actividades.dw_actividad_grupo.RowCount(),Primary!,tab_detalle_grupo.tabpage_actividades.dw_actividad_grupo,tab_detalle_grupo.tabpage_actividades.dw_actividad_grupo.DeletedCount()+1,Delete!)
tab_detalle_grupo.tabpage_operaciones.dw_operacion_grupo.RowsMove(1,tab_detalle_grupo.tabpage_operaciones.dw_operacion_grupo.RowCount(),Primary!,tab_detalle_grupo.tabpage_operaciones.dw_operacion_grupo,tab_detalle_grupo.tabpage_operaciones.dw_operacion_grupo.DeletedCount()+1,Delete!)
//********************/!!!/**********************************************************************************************************************
//-------------------------------------------------------------------------------------
If dw_integrante_grupo.Update()<>1 Then
	of_error_grupo()
	Return -1
End If

If tab_detalle_grupo.tabpage_recursos_tj.dw_recurso_grupo.Update()<>1 Then
	of_error_grupo()
	Return -1
End If

If tab_detalle_grupo.tabpage_maq_tin.dw_maquina_tintoreria.Update()<>1 Then
	of_error_grupo()
	Return -1
End If

If tab_detalle_grupo.tabpage_actividades.dw_actividad_grupo.Update()<>1 Then
	of_error_grupo()
	Return -1
End If

If tab_detalle_grupo.tabpage_operaciones.dw_operacion_grupo.Update()<>1 Then
	of_error_grupo()
	Return -1
End If

If dw_grupo.Update()<>1 Then
	of_error_grupo()
	Return -1
End If
//-----------------------------------------------------------------------------
of_Reset()
of_ok_grupo()

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Grupo de Trabajo <"+String(il_grupo)+"> ha sido eliminado exitosamente.")
Return 1
end function

public function integer of_error_grupo ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 04 de Noviembre de 2004.H:15:53
---------------------------------------------------
Deshace los cambios hechos a la bd.
---------------------------------------------------*/
//************************************************
ROLLBACK USING n_cst_application.itr_appl;
//************************************************
Return 1
end function

public function integer of_guardar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 04 de Noviembre de 2004.H:15:54
---------------------------------------------------
Guarda despues de verificar. Devuelve 1 si es exitoso
---------------------------------------------------*/
long ll_grupo_control
DateTime ldt_fecha
String ls_usuario,ls_instancia
//-------------------------------------------------
If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If
//-------------------------------------------------
ll_grupo_control=il_grupo
If il_grupo=0 Then
	If of_consecutivo()<>1 Then
		Return -1
	End If
	dw_grupo.SetItem(1,"id_grupo",il_grupo)
End If
//-------------------------------------------------
If ll_grupo_control=0 Then
	ls_instancia=Trim(ls_instancia)
	dw_grupo.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)
	dw_integrante_grupo.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)	
	tab_detalle_grupo.tabpage_recursos_tj.dw_recurso_grupo.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)	
	tab_detalle_grupo.tabpage_maq_tin.dw_maquina_tintoreria.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)		
	tab_detalle_grupo.tabpage_actividades.dw_actividad_grupo.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)
	tab_detalle_grupo.tabpage_operaciones.dw_operacion_grupo.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)
	of_newdt_grupo()
End If
//---------------------------------------------------------------------------------
If dw_grupo.Update(true,false)<>1 Then 
	of_error_grupo()
	Return -1
End If

If dw_integrante_grupo.Update(true,false)<>1 Then 
	of_error_grupo()
	Return -1
End If

If tab_detalle_grupo.tabpage_recursos_tj.dw_recurso_grupo.Update(true,false)<>1 Then 
	of_error_grupo()
	Return -1
End If

If tab_detalle_grupo.tabpage_maq_tin.dw_maquina_tintoreria.Update(true,false)<>1 Then 
	of_error_grupo()
	Return -1
End If
//********************/!!!/********************************************************
If tab_detalle_grupo.tabpage_actividades.dw_actividad_grupo.Update(true,false)<>1 Then 
	of_error_grupo()
	Return -1
End If

If tab_detalle_grupo.tabpage_operaciones.dw_operacion_grupo.Update(true,false)<>1 Then 
	of_error_grupo()
	Return -1
End If
//********************/!!!/********************************************************
//---------------------------------------------------------------------------------
dw_grupo.ResetUpdate()
dw_integrante_grupo.ResetUpdate()
tab_detalle_grupo.tabpage_recursos_tj.dw_recurso_grupo.ResetUpdate()
tab_detalle_grupo.tabpage_maq_tin.dw_maquina_tintoreria.ResetUpdate()
tab_detalle_grupo.tabpage_actividades.dw_actividad_grupo.ResetUpdate()
tab_detalle_grupo.tabpage_operaciones.dw_operacion_grupo.ResetUpdate()
//---------------------------------------------------------------------------------
Return 1
end function

public function integer of_newdt_grupo ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 04 de Noviembre de 2004.H:15:57
---------------------------------------------------
Asigna el c$$HEX1$$f300$$ENDHEX$$digo de los grupos para los registros 
detalle cuando se registra un grupo nuevo
---------------------------------------------------*/
Long ll_i
//-------------------------------------------------
For ll_i=1 To dw_integrante_grupo.RowCount()
	dw_integrante_grupo.SetItem(ll_i,'id_grupo',il_grupo)
Next
For ll_i=1 To tab_detalle_grupo.tabpage_recursos_tj.dw_recurso_grupo.RowCount()
	tab_detalle_grupo.tabpage_recursos_tj.dw_recurso_grupo.SetItem(ll_i,'id_grupo',il_grupo)
Next
For ll_i=1 To tab_detalle_grupo.tabpage_maq_tin.dw_maquina_tintoreria.RowCount()
	tab_detalle_grupo.tabpage_maq_tin.dw_maquina_tintoreria.SetItem(ll_i,'id_grupo',il_grupo)
Next
For ll_i=1 To tab_detalle_grupo.tabpage_actividades.dw_actividad_grupo.RowCount()
	tab_detalle_grupo.tabpage_actividades.dw_actividad_grupo.SetItem(ll_i,'id_grupo',il_grupo)
Next
For ll_i=1 To tab_detalle_grupo.tabpage_operaciones.dw_operacion_grupo.RowCount()
	tab_detalle_grupo.tabpage_operaciones.dw_operacion_grupo.SetItem(ll_i,'id_grupo',il_grupo)
Next
//-------------------------------------------------
Return 1
end function

public function integer of_ok_grupo ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 04 de Noviembre de 2004.H:13:58
---------------------------------------------------
Acepta los cambios hechos a la bd.
---------------------------------------------------*/
//*****************************************
COMMIT USING n_cst_application.itr_appl ;
//*****************************************
Return 1
end function

public function integer of_reset ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 04 de Noviembre de 2004.H:16:02
---------------------------------------------------
---------------------------------------------------*/
dw_grupo.reset()
dw_integrante_grupo.reset()
tab_detalle_grupo.tabpage_recursos_tj.dw_recurso_grupo.reset()
tab_detalle_grupo.tabpage_maq_tin.dw_maquina_tintoreria.reset()
tab_detalle_grupo.tabpage_actividades.dw_actividad_grupo.reset()
tab_detalle_grupo.tabpage_operaciones.dw_operacion_grupo.reset()

Return 1
end function

public function integer of_verificar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 04 de Noviembre de 2004.H:16:03	
---------------------------------------------------
Verificaci$$HEX1$$f300$$ENDHEX$$n de los datos antes de grabar
---------------------------------------------------*/
Long ll_pos
//---------------------------------------------------------------------------------------------
If dw_grupo.RowCount()<=0 Then
	Return -1
End If

//If dw_integrante_grupo.RowCount()<=0 Then
//	MessageBox("Advertencia!","El Grupo debe tener por lo menos un integrante asignado.",StopSign!)
//	Return -1
//End If

If tab_detalle_grupo.tabpage_recursos_tj.dw_recurso_grupo.RowCount()>0 Then
	If tab_detalle_grupo.tabpage_maq_tin.dw_maquina_tintoreria.RowCount()>0 Then
		MessageBox("Advertencia!","El Grupo no debe tener asignados items de recursos de tejido y maquinar$$HEX1$$ed00$$ENDHEX$$a al mismo tiempo.",StopSign!)
		Return -1
	End If
End If
//----------------------------------------------------------------------------------
//Pueden haber grupos solo con integrantes, sin ning$$HEX1$$fa00$$ENDHEX$$n recurso asignado.
//If tab_detalle_grupo.tabpage_recursos_tj.dw_recurso_grupo.RowCount()+tab_detalle_grupo.tabpage_maq_tin.dw_maquina_tintoreria.RowCount()<=0 Then
//	MessageBox("Advertencia!","El Grupo debe tener por lo menos, un $$HEX1$$ed00$$ENDHEX$$tem de algun recurso.",StopSign!)
//	Return -1
//End If
//----------------------------------------------------------------------------------------------
//If tab_detalle_grupo.tabpage_actividades.dw_actividad_grupo.RowCount()<=0 Then
//	MessageBox("Advertencia!","El Grupo debe tener por lo menos una actividad asignada.",StopSign!)
//	Return -1
//End If
//----------------------------------------------------------------------------------------------
//If tab_detalle_grupo.tabpage_operaciones.dw_operacion_grupo.RowCount()<=0 Then
//	MessageBox("Advertencia!","El Grupo debe tener por lo menos una actividad asignada.",StopSign!)
//	Return -1
//End If
//----------------------------------------------------------------------------------------------
If dw_grupo.AcceptText()<>1 Then
	//MessageBox("Advertencia!","Datos del grupo de trabajo no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Trigger Event key(Key1!,2)
	Return -1
End If

If dw_integrante_grupo.AcceptText()<>1 Then
	//MessageBox("Advertencia!","Datos de los integrantes del grupo no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Trigger Event key(Key2!,2)
	Return -1
End If

If tab_detalle_grupo.tabpage_operaciones.dw_operacion_grupo.AcceptText()<>1 Then
	//MessageBox("Advertencia!","Datos de las operaciones no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Trigger Event key(Key3!,2)
	Return -1
End If

If tab_detalle_grupo.tabpage_actividades.dw_actividad_grupo.AcceptText()<>1 Then
	//MessageBox("Advertencia!","Datos de las actividades no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Trigger Event key(Key4!,2)
	Return -1
End If

If tab_detalle_grupo.tabpage_recursos_tj.dw_recurso_grupo.AcceptText()<>1 Then
	//MessageBox("Advertencia!","Datos de los recursos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Trigger Event key(Key5!,2)
	Return -1
End If

If tab_detalle_grupo.tabpage_maq_tin.dw_maquina_tintoreria.AcceptText()<>1 Then
	//MessageBox("Advertencia!","Datos de las m$$HEX1$$e100$$ENDHEX$$quinas de tintorer$$HEX1$$ed00$$ENDHEX$$a no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Trigger Event key(Key6!,2)
	Return -1
End If
//----------------------------------------------------------------------------------------
If Not dw_grupo.of_completedata() Then
	Trigger Event key(Key1!,2)
	Return -1
End If
If Not dw_integrante_grupo.of_completedata() Then
	Trigger Event key(Key2!,2)
	Return -1
End If

If Not tab_detalle_grupo.tabpage_operaciones.dw_operacion_grupo.of_completedata() Then
	Trigger Event key(Key3!,2)
	Return -1
End If

If Not tab_detalle_grupo.tabpage_actividades.dw_actividad_grupo.of_completedata() Then
	Trigger Event key(Key4!,2)
	Return -1
End If

If Not tab_detalle_grupo.tabpage_recursos_tj.dw_recurso_grupo.of_completedata() Then
	Trigger Event key(Key5!,2)
	Return -1
End If

If Not tab_detalle_grupo.tabpage_maq_tin.dw_maquina_tintoreria.of_completedata() Then
	Trigger Event key(Key6!,2)
	Return -1
End If
//----------------------------------------------------------------------------------------
Return 1
end function

public function integer of_carga_dddw ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 05 de Noviembre de 2004.H:18:00
---------------------------------------------------
---------------------------------------------------*/
n_cst_comun lo_comun
//-------------------------------------------------
dw_grupo.GetChild("id_turno",idc_turno)
lo_comun.of_loaddddw(idc_turno,n_cst_application.itr_appl)
//dw_grupo.GetChild("co_estado",idc_estado)
//lo_comun.of_loaddddw(idc_estado,n_cst_application.itr_appl)
dw_integrante_grupo.GetChild("co_ctecnico",idc_tecnico)
lo_comun.of_loaddddw(idc_tecnico,n_cst_application.itr_appl)
//tab_detalle_grupo.tabpage_recursos_tj.dw_recurso_grupo.GetChild("co_recurso",idc_recurso)
//lo_comun.of_loaddddw(idc_recurso,n_cst_application.ii_fabrica,n_cst_application.itr_appl)
//tab_detalle_grupo.tabpage_maq_tin.dw_maquina_tintoreria.GetChild("co_maquina",idc_maqtin)
//lo_comun.of_loaddddw(idc_maqtin,n_cst_application.itr_appl)
//tab_detalle_grupo.tabpage_actividades.dw_actividad_grupo.GetChild("id_actividad",idc_actividad)
//idc_actividad.Describe('Object.de_estado.Visible=False')
//lo_comun.of_loaddddw(idc_actividad,n_cst_application.itr_appl)

Return 1
end function

public function integer of_redraw (boolean al_redrawing);/*-------------------------------------------------
	Develr.  : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 04 de Noviembre de 2004.
---------------------------------------------------
---------------------------------------------------*/

dw_integrante_grupo.SetRedraw(al_redrawing)
tab_detalle_grupo.tabpage_recursos_tj.dw_recurso_grupo.SetRedraw(al_redrawing)
tab_detalle_grupo.tabpage_maq_tin.dw_maquina_tintoreria.SetRedraw(al_redrawing)
tab_detalle_grupo.tabpage_actividades.dw_actividad_grupo.SetRedraw(al_redrawing)
tab_detalle_grupo.tabpage_operaciones.dw_operacion_grupo.SetRedraw(al_redrawing)
Return 1
end function

public function integer of_validar_tecnico (string as_ctecnico);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 11 de Noviembre de 2004.H:16:49
---------------------------------------------------
Funcion que valida de la existencia del codigo del tecnico
en algun grupo de muestra registrado.
---------------------------------------------------*/
n_ds_application lds_ctecnico
Integer li_res
//---------------------------------------------------
If IsNull(as_ctecnico) or as_ctecnico='' Then
	Return -1
End If
//---------------------------------------------------
lds_ctecnico = CREATE n_ds_application
lds_ctecnico.of_load('d_nro_tecnico')
lds_ctecnico.of_conexion(n_cst_application.itr_appl,True)
li_res = lds_ctecnico.Retrieve(as_ctecnico)
If li_res<0 Then
	MessageBox("Advertencia!","Error recuperando informaci$$HEX1$$f300$$ENDHEX$$n de la existencia del tecnico en otro grupo.",StopSign!)
	DESTROY lds_ctecnico
	Return -1
ElseIf li_res>0 Then
		MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo de t$$HEX1$$e900$$ENDHEX$$cnico ya est$$HEX2$$e1002000$$ENDHEX$$registrado en :~n"+&
					  "Id. Grupo: "+String(lds_ctecnico.GetItemNumber(1,'id_grupo'))+"~n"+&
					  "Desc. Grupo: "+Trim(lds_ctecnico.GetItemString(1,'de_grupo'))+"~nNo puede seleccionarlo.",Information!)	
		DESTROY lds_ctecnico			
		Return -1
End If
DESTROY lds_ctecnico
//---------------------------------------------------
Return 1

end function

public function integer of_filtrar_activ (long al_estado);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 11 de Noviembre de 2004.H:14:49
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n que filtra las actividades para el registro del grupo
seg$$HEX1$$fa00$$ENDHEX$$n el estado seleccionado
---------------------------------------------------*/
String ls_filtro
//---------------------------------------------------
//idc_actividad.SetFilter("")
//idc_actividad.Filter()
//If Not IsNull(al_estado) Then
//	ls_filtro='co_estado='+String(al_estado)
//	idc_actividad.SetFilter(ls_filtro)
//	idc_actividad.Filter()
//	If idc_actividad.RowCount()=0 Then
//		MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','No hay actividades para este estado.',Information!)
//	End If
//End If
//---------------------------------------------------
Return 1

end function

on w_registro_grupo.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_grupo_muestras" then this.MenuID = create m_grupo_muestras
this.tab_detalle_grupo=create tab_detalle_grupo
this.dw_grupo=create dw_grupo
this.gb_grupo=create gb_grupo
this.dw_integrante_grupo=create dw_integrante_grupo
this.gb_integrante=create gb_integrante
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_detalle_grupo
this.Control[iCurrent+2]=this.dw_grupo
this.Control[iCurrent+3]=this.gb_grupo
this.Control[iCurrent+4]=this.dw_integrante_grupo
this.Control[iCurrent+5]=this.gb_integrante
end on

on w_registro_grupo.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.tab_detalle_grupo)
destroy(this.dw_grupo)
destroy(this.gb_grupo)
destroy(this.dw_integrante_grupo)
destroy(this.gb_integrante)
end on

event open;call super::open;/***********************************************************
SA54492 - Ceiba/jjmonsal - 28-03-2016
Comentario: Reporte de solicitudes de dllo calcetines - validando con jaime ceballos se detecta que se requiere discriminar cuales grupo 
trabajan en desarrollo color y tintoreria y cuales No 
Se modifica d_m_mu_grupo se adiciona el campo SN_Dllo_Color CHAR(1) a la tabla m_mu_grupo
se refrescan capacidad de actualizacion 
***********************************************************/
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 04 de Noviembre de 2004.H:15:21
---------------------------------------------------
---------------------------------------------------*/
of_carga_objtr()
of_carga_dddw()
//--------------------------------------------------
end event

event key;call super::key;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 04 de Noviembre de 2004.H:15:22
---------------------------------------------------
Uso del ctrl, keyflags=2
---------------------------------------------------*/
IF keyflags = 2 THEN // Keyflags para el 'Ctrl'
	Choose Case Key
		Case Key1!			
			dw_grupo.SetFocus()
		Case Key2!			
			dw_integrante_grupo.SetFocus()
		Case Key3!			
			tab_detalle_grupo.SelectTab(tab_detalle_grupo.tabpage_operaciones)				
			tab_detalle_grupo.tabpage_operaciones.dw_operacion_grupo.SetFocus()			
		Case Key4!		
			tab_detalle_grupo.SelectTab(tab_detalle_grupo.tabpage_actividades)				
			tab_detalle_grupo.tabpage_actividades.dw_actividad_grupo.SetFocus()					
		Case Key5!
			tab_detalle_grupo.SelectTab(tab_detalle_grupo.tabpage_recursos_tj)
			tab_detalle_grupo.tabpage_recursos_tj.dw_recurso_grupo.SetFocus()				
		Case Key6!			
			tab_detalle_grupo.SelectTab(tab_detalle_grupo.tabpage_maq_tin)
			tab_detalle_grupo.tabpage_maq_tin.dw_maquina_tintoreria.SetFocus()						
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
	Date		: Jueves 04 de Noviembre de 2004.H:15:40
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lou_param
//-------------------------------------------------
Open(w_opc_grupo_muestras)

lou_param = Message.PowerObjectParm

If IsValid(lou_param) Then	
	of_redraw(False)
	il_tipoprod = lou_param.il_vector[2]
	of_buscar(lou_param.il_vector[1])	
	is_where_busqueda=lou_param.is_vector[1]
End If
//---------------------------------------------------
end event

event ue_save;call super::ue_save;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes de Noviembre de 2004.H:11:32
---------------------------------------------------
Guarda datos del grupo
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
of_ok_grupo()
//***********************************************
il_grupo = dw_grupo.GetItemNumber(1,"id_grupo")
MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","El grupo~'"+String(il_grupo)+"~' se registr$$HEX2$$f3002000$$ENDHEX$$satisfactoriamente.")
ib_cambios=False
ib_save=True
of_buscar(il_grupo)
//---------------------------------------------------------------------------
end event

type tab_detalle_grupo from tab within w_registro_grupo
integer x = 1573
integer y = 504
integer width = 2048
integer height = 1408
integer taborder = 30
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
tabpage_operaciones tabpage_operaciones
tabpage_actividades tabpage_actividades
tabpage_recursos_tj tabpage_recursos_tj
tabpage_maq_tin tabpage_maq_tin
end type

on tab_detalle_grupo.create
this.tabpage_operaciones=create tabpage_operaciones
this.tabpage_actividades=create tabpage_actividades
this.tabpage_recursos_tj=create tabpage_recursos_tj
this.tabpage_maq_tin=create tabpage_maq_tin
this.Control[]={this.tabpage_operaciones,&
this.tabpage_actividades,&
this.tabpage_recursos_tj,&
this.tabpage_maq_tin}
end on

on tab_detalle_grupo.destroy
destroy(this.tabpage_operaciones)
destroy(this.tabpage_actividades)
destroy(this.tabpage_recursos_tj)
destroy(this.tabpage_maq_tin)
end on

type tabpage_operaciones from userobject within tab_detalle_grupo
integer x = 18
integer y = 160
integer width = 2011
integer height = 1232
long backcolor = 80269524
string text = "Operaciones~r~n(Ctrl+3)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_operacion_grupo dw_operacion_grupo
end type

on tabpage_operaciones.create
this.dw_operacion_grupo=create dw_operacion_grupo
this.Control[]={this.dw_operacion_grupo}
end on

on tabpage_operaciones.destroy
destroy(this.dw_operacion_grupo)
end on

type dw_operacion_grupo from u_dw_application within tabpage_operaciones
integer x = 18
integer y = 24
integer width = 1975
integer height = 1184
integer taborder = 20
string dataobject = "d_grupo_operacion1"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 19 de Noviembre de 2004.H:11:30
---------------------------------------------------
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,255)
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 19 de Noviembre de 2004.H:11:30
---------------------------------------------------
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,0)
end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 19 de Noviembre de 2004.H:09:05
---------------------------------------------------
---------------------------------------------------*/
Long ll_pos, ll_resultado
n_cst_comun_orden lo_comun //orden.lib
//-------------------------------------------------
If il_err_item_change<>0 Then
	Return 2
End If
//--------------------------------------------------------------------
If dwo.name="co_operacion" Then
	ll_pos=Find("co_operacion="+data,1,RowCount())
	If ll_pos>0 then
		MessageBox("Advertencia!","La operaci$$HEX1$$f300$$ENDHEX$$n ya est$$HEX2$$e1002000$$ENDHEX$$seleccionada.",StopSign!)
		Return 2
	End If

	ll_resultado=lo_comun.of_nombre_operac_muestra(Long(Data),il_tipoprod, n_cst_application.itr_appl)

	//ll_resultado=lo_comun.of_nombre_operac_muestra(Long(Data),n_cst_application.itr_appl)
	If ll_resultado<>1 Then
		MessageBox("Advertencia!","Operaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_operacion",trim(lo_comun.of_getString(1)))
//	ll_pos=idc_operacion.Find('co_operacion='+Data,1,idc_operacion.RowCount())	
//	ll_estado_operacion = idc_operacion.GetItemNumber(ll_pos,'co_estado')
//	If il_estado = ll_estado_operacion then
//		MessageBox("Advertencia!","No es permitido que el estado actual del registro y estado de $$HEX1$$e900$$ENDHEX$$sta operaci$$HEX1$$f300$$ENDHEX$$n sean el mismo!.",StopSign!)
//		Setitem(row,'de_operacion','')
//		Return 2
//	End If	
//	SetItem(row,"de_operacion",idc_operacion.GetItemString(ll_pos,'de_operacion'))
End If
//--------------------------------------------------------------
ib_cambios = True
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 11 de Noviembre de 2004.H:14:00
---------------------------------------------------
---------------------------------------------------*/
Long ll_i
//-------------------------------------------------
If dw_grupo.Rowcount()<=0 Then
	MessageBox("Advertencia!","Debe especificar datos del grupo.",StopSign!)
	Return
End If
//-------------------------------------------------
Super::Event ue_insertRow()
ll_i = This.GetRow()
This.SetItem(ll_i,"id_grupo",il_grupo)
This.SetItem(ll_i,"co_tipoprod",il_tipoprod)
This.SetColumn('co_operacion')
This.SetItemStatus(ll_i,0,Primary!,New!)

end event

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 19 de Noviembre de 2004.H:18:10
---------------------------------------------------
---------------------------------------------------*/
Long ll_pos
n_cst_param lo_param
//-------------------------------------------------
If Row=0 Then Return
//-------------------------------------------------
If dwo.name="co_operacion" then
	   lo_param.il_vector[1]  = il_tipoprod
		OpenWithParm(w_bus_operac_muestra, lo_param)
		lo_param=Message.PowerObjectParm
		If IsValid(lo_param) Then
//			If lo_param.il_vector[1]=GetItemNumber(row,String(dwo.name)) Then Return 0
			SetText(String(lo_param.il_vector[1]))
			AcceptText()
			SetColumn('de_operacion')
//			If This.Trigger Event itemchanged(row,dwo,String(lo_param.il_vector[1]))=0 Then
//					SetColumn('de_operacion')
//			Else
//					SetItem(row,String(dwo.name),GetItemNumber(row,String(dwo.name)))					
//			End If
//			SetItem(row,'de_operacion',lo_param.is_vector[1])
		End If		
End If
//-------------------------------------------------
end event

event itemerror;call super::itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 10 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Integer li_null
String ls_col
//-------------------------------------------------
If dwo.name='co_operacion' Then
	If Long(Data)=0 Then
		SetNull(li_null)
		ls_col=dwo.name
		This.SetItem(row,ls_col,li_null)
		This.SetItem(row,'de_operacion','')		
		Return 3
	End If
End If
end event

type tabpage_actividades from userobject within tab_detalle_grupo
event create ( )
event destroy ( )
integer x = 18
integer y = 160
integer width = 2011
integer height = 1232
long backcolor = 80269524
string text = "Actividades~r~n(Ctrl+4)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_actividad_grupo dw_actividad_grupo
end type

on tabpage_actividades.create
this.dw_actividad_grupo=create dw_actividad_grupo
this.Control[]={this.dw_actividad_grupo}
end on

on tabpage_actividades.destroy
destroy(this.dw_actividad_grupo)
end on

type dw_actividad_grupo from u_dw_application within tabpage_actividades
integer x = 18
integer y = 24
integer width = 1975
integer height = 1184
integer taborder = 60
string dataobject = "d_grupo_activ1"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 19 de Noviembre de 2004.H:11:30
---------------------------------------------------
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,255)
end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 11 de Noviembre de 2004.H:14:35
---------------------------------------------------
---------------------------------------------------*/
Long ll_pos, ll_resultado
n_cst_comun_orden lo_comun //orden.lib
//-------------------------------------------------
If il_err_item_change<>0 Then
	Return 2
End If
//--------------------------------------------------------------------
If dwo.name="id_actividad" Then
	ll_pos=Find("id_actividad="+data,1,RowCount())
	If ll_pos>0 then
		MessageBox("Advertencia!","La actividad ya est$$HEX2$$e1002000$$ENDHEX$$seleccionado.",StopSign!)		
		Return 2
	End If	
////////	ll_resultado=lo_comun.of_nombreactividadtipo( /*long al_actividad*/, /*long al_tipoprod*/, /*transaction atr_transaction */)
	ll_resultado=lo_comun.of_nombreactividad(Long(Data),n_cst_application.itr_appl)
	If ll_resultado<>1 Then
		MessageBox("Advertencia!","Actividad no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_actividad",Trim(lo_comun.of_getString(1)))
//	ll_pos=idc_actividad.Find('id_actividad='+Data,1,idc_actividad.RowCount())
//	SetItem(row,"de_actividad",idc_actividad.GetItemString(ll_pos,'de_actividad'))
//	ll_estado_actividad = idc_actividad.GetItemNumber(ll_pos,'co_estado')
End If
//--------------------------------------------------------------
ib_cambios = True
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 19 de Noviembre de 2004.H:11:30
---------------------------------------------------
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,0)
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 11 de Noviembre de 2004.H:14:00
---------------------------------------------------
---------------------------------------------------*/
Long ll_i
//-------------------------------------------------
If dw_grupo.Rowcount()<=0 Then
	MessageBox("Advertencia!","Debe especificar datos del grupo.",StopSign!)
	Return
End If
//-------------------------------------------------
Super::Event ue_insertRow()
ll_i = This.GetRow()
This.SetItem(ll_i,"id_grupo",il_grupo)
This.SetColumn('id_actividad')
This.SetItemStatus(ll_i,0,Primary!,New!)

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
If dwo.name="id_actividad" then
	lo_param.il_vector[1]  = il_tipoprod
	OpenWithParm(w_bus_actividad, lo_param)
	lo_param=Message.PowerObjectParm
	If IsValid(lo_param) Then
//			If lo_param.il_vector[1]=GetItemNumber(row,String(dwo.name)) Then Return 0
		SetText(String(lo_param.il_vector[1]))		 
		AcceptText()
		SetColumn('de_actividad')
//			If This.Trigger Event itemchanged(row,dwo,String(lo_param.il_vector[1]))=0 Then
//					SetColumn('de_actividad')
//			Else
//				SetItem(row,String(dwo.name),GetItemNumber(row,String(dwo.name)))					
//			End If
//			SetItem(row,'de_actividad',lo_param.is_vector[1])
	End If		
End If
//-------------------------------------------------
end event

event itemerror;call super::itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 10 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Integer li_null
String ls_col
//-------------------------------------------------
If dwo.name='id_actividad' Then
	If Long(Data)=0 Then
		SetNull(li_null)
		ls_col=dwo.name
		This.SetItem(row,ls_col,li_null)
		This.SetItem(row,'de_actividad','')		
		Return 3
	End If
End If
end event

type tabpage_recursos_tj from userobject within tab_detalle_grupo
event create ( )
event destroy ( )
integer x = 18
integer y = 160
integer width = 2011
integer height = 1232
long backcolor = 80269524
string text = "Recursos Tej.~r~n(Ctrl+5)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_recurso_grupo dw_recurso_grupo
end type

on tabpage_recursos_tj.create
this.dw_recurso_grupo=create dw_recurso_grupo
this.Control[]={this.dw_recurso_grupo}
end on

on tabpage_recursos_tj.destroy
destroy(this.dw_recurso_grupo)
end on

type dw_recurso_grupo from u_dw_application within tabpage_recursos_tj
integer x = 18
integer y = 24
integer width = 1975
integer height = 1184
integer taborder = 40
string dataobject = "d_dt_mu_rec_gru"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 19 de Noviembre de 2004.H:11:30
---------------------------------------------------
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,255)
end event

event itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 05 de Noviembre de 2004.H:17:32
---------------------------------------------------
---------------------------------------------------*/
Long ll_pos,ll_recurso, ll_resultado
n_cst_comun_orden lo_comun //orden.lib
//-------------------------------------------------
If il_err_item_change<>0 Then
	Return 2
End If
//--------------------------------------------------------------------
If dwo.name="co_recurso" Then
	ll_pos=find("co_recurso="+data,1,RowCount())
	If ll_pos>0 then
		MessageBox("Advertencia!","El recurso fue seleccionado anteriormente.",StopSign!)
		Return 2
	End If
	ll_recurso=Long(Data)
	ll_resultado=lo_comun.of_nombrerecursotj(ll_recurso,n_cst_application.itr_appl)
	If ll_resultado<>1 Then
		MessageBox("Advertencia!","Recurso no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		 Return 2
	End If
	SetItem(row,"de_recurso",Trim(lo_comun.of_getString(1)))
	//
	//	ll_pos=idc_recurso.Find('co_recurso='+Data,1,idc_recurso.RowCount())
	//	SetItem(row,"de_recurso",idc_recurso.GetItemString(ll_pos,'descripcion'))
End If
//--------------------------------------------------------------
ib_cambios = True
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 19 de Noviembre de 2004.H:11:30
---------------------------------------------------
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,0)
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 05 de Noviembre de 2004.H:17:23
---------------------------------------------------
---------------------------------------------------*/
Long ll_i
//-------------------------------------------------
If dw_grupo.Rowcount()<=0 Then
	MessageBox("Advertencia!","Debe especificar los datos del grupo.",StopSign!)
	Return
End If
//-------------------------------------------------
Super::Event ue_insertRow()
ll_i = This.GetRow()
This.SetItem(ll_i,"id_grupo",il_grupo)
This.SetColumn('co_recurso')
This.SetItemStatus(ll_i,0,Primary!,New!)

end event

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 05 de Noviembre de 2004.H:17:32
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lo_param
//-------------------------------------------------
If Row=0 Then Return

If dwo.name="co_recurso" Then
	lo_param.il_vector[1] = il_tipoprod
	OpenWithParm(w_bus_m_recurso_tj, lo_param)
	lo_param=Message.PowerObjectParm
	If IsValid(lo_param) Then
//		If lo_param.il_vector[1]=GetItemNumber(row,String(dwo.name)) Then Return 0
		SetText(String(lo_param.il_vector[1]))		 
		AcceptText()
		SetColumn('de_recurso')
//		If This.Trigger Event itemchanged(row,dwo,String(lo_param.il_vector[1]))=0 Then
//				SetColumn('de_recurso')
//		Else
//			SetItem(row,String(dwo.name),GetItemNumber(row,String(dwo.name)))					
//		End If
//		//No lo asigna.SetItem(row,'de_operacion',lo_param.is_vector[1])
	End If
End If
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

type tabpage_maq_tin from userobject within tab_detalle_grupo
event create ( )
event destroy ( )
integer x = 18
integer y = 160
integer width = 2011
integer height = 1232
long backcolor = 80269524
string text = "M$$HEX1$$e100$$ENDHEX$$quinas Tintorer$$HEX1$$ed00$$ENDHEX$$a~r~n(Ctrl+6)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_maquina_tintoreria dw_maquina_tintoreria
end type

on tabpage_maq_tin.create
this.dw_maquina_tintoreria=create dw_maquina_tintoreria
this.Control[]={this.dw_maquina_tintoreria}
end on

on tabpage_maq_tin.destroy
destroy(this.dw_maquina_tintoreria)
end on

type dw_maquina_tintoreria from u_dw_application within tabpage_maq_tin
integer x = 18
integer y = 32
integer width = 1975
integer height = 1184
integer taborder = 50
string dataobject = "d_mu_gru_mtin"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 19 de Noviembre de 2004.H:11:30
---------------------------------------------------
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,255)
end event

event itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 05 de Noviembre de 2004.H:17:32
---------------------------------------------------
---------------------------------------------------*/
Boolean lb_desc
Long ll_pos, ll_resultado,ll_cs_maquina,ll_co_fabrica
n_cst_comun_orden lo_comun //orden.lib
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
			ll_resultado=lo_comun.of_nombreMaqTin(ll_co_fabrica,ll_cs_maquina,n_cst_application.itr_appl)
			If ll_resultado<>1 Then
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
	Date		: Viernes 19 de Noviembre de 2004.H:11:30
---------------------------------------------------
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,0)
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 05 de Noviembre de 2004.H:17:23
---------------------------------------------------
---------------------------------------------------*/
Long ll_i
//-------------------------------------------------
If dw_grupo.Rowcount()<=0 Then
	MessageBox("Advertencia!","Debe especificar los datos del grupo.",StopSign!)
	Return
End If
//-------------------------------------------------
Super::Event ue_insertRow()
ll_i = This.GetRow()
This.SetItem(ll_i,"id_grupo",il_grupo)
This.SetColumn('co_fabrica')
This.SetItemStatus(ll_i,0,Primary!,New!)

end event

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
	//lo_param.il_vector[1] = il_tipoprod
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

type dw_grupo from u_dw_application within w_registro_grupo
integer x = 96
integer y = 104
integer width = 3474
integer height = 324
string dataobject = "d_m_mu_grupo"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 04 de Noviembre de 2004.H:15:28
---------------------------------------------------
---------------------------------------------------*/
gb_grupo.of_color(True)
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 04 de Noviembre de 2004.H:15:28
---------------------------------------------------
---------------------------------------------------*/
gb_grupo.of_color(False)
end event

event itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 05 de Noviembre de 2004.H:15:12
---------------------------------------------------
---------------------------------------------------*/
Long ll_dato,ll_pos//,ll_resultado
n_cst_comun_orden lo_comun
//-------------------------------------------------
If il_err_item_change<>0 Then
	Return 2
End If
//-------------------------------------------------
If dwo.Name = 'id_turno' Then
	ll_dato = Long(Data)
	ll_pos=idc_turno.Find('id_turno='+Data,1,idc_turno.RowCount())	
	SetItem(row,"de_turno",idc_turno.GetItemString(ll_pos,'de_turno'))
//	ll_resultado = lo_comun.of_nombreturno(ll_dato,n_cst_application.itr_appl)
//	If ll_resultado<>1 then 
//		MessageBox("Advertencia!","Turno no registrado.",StopSign!)
//		Return 2
//	End If
//	SetItem(1,"de_turno",lo_comun.of_getString(1))
	il_turno = ll_dato	
End If
//--------------------------------------------------
//Requeriment: Registro de grupos v3.0.: No se debe manejar estado por grupo
//If dwo.Name = 'co_estado' Then
//	ll_dato = Long(Data)
//	ll_pos=idc_estado.Find('co_estado='+Data,1,idc_estado.RowCount())	
//	SetItem(row,"de_estado",idc_estado.GetItemString(ll_pos,'de_estado'))
//	of_filtrar_activ(Long(Data))
//End If
//--------------------------------------------------
If dwo.name = 'de_grupo' Then		
		If Trim(Data)='' AND Not IsNull(Data) Then
			MessageBox('Advertencia','Texto de la descripci$$HEX1$$f300$$ENDHEX$$n del grupo no es v$$HEX1$$e100$$ENDHEX$$lido.S$$HEX1$$f300$$ENDHEX$$lo hay espacios en blanco',StopSign!)
			Return 1
		End If
		If This.of_validarcadena(Data)<>1 Then 
			Return 1
		End If	
End If

If dwo.name = 'co_tipoprod' Then
	il_tipoprod = long(Data)
	 IF NOT (il_grupo=0) THEN
		of_buscar(il_grupo)
	END IF
End If
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 05 de Noviembre de 2004.H:15:12
---------------------------------------------------
//-------------------------------------------------*/
Long ll_res,ll_1
//-------------------------------------------------
If ib_cambios Then
	ll_res=MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
	
	If ll_res=2 Then
	 Return
	End If
End If
//--------------------------------------------------
of_reset()
il_grupo=0
Call Super::ue_insertrow
Title='Registro de Grupos de Trabajo'
This.SetColumn('de_grupo')
This.SetItem(1,'id_grupo',il_grupo)
ib_reg=false


end event

event ue_deleterow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 10 de Diciembre de 2004.H:10:52
---------------------------------------------------
Overwrite!
---------------------------------------------------*/

end event

event itemerror;call super::itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 13 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Long ll_null
//-------------------------------------------------
If dwo.name = 'cantidad_colas' Then
	If Long(Data)=0 Then		
		SetNull(ll_null)
		This.SetItem(row,String(dwo.name),ll_null)
		Return 3
	End If
End If

If dwo.name='de_grupo' Then
		Return 1	
End If

end event

type gb_grupo from u_gb_base within w_registro_grupo
string tag = "Registro de Grupos de Trabajo"
integer x = 37
integer y = 44
integer width = 3584
integer height = 412
integer taborder = 0
string text = "Registro de Grupo de Trabajo (Ctrl+1)"
end type

type dw_integrante_grupo from u_dw_application within w_registro_grupo
integer x = 73
integer y = 568
integer width = 1426
integer height = 1312
integer taborder = 20
string dataobject = "d_dt_mu_grupo"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 04 de Noviembre de 2004.H:15:28
---------------------------------------------------
---------------------------------------------------*/
gb_integrante.of_color(True)
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 04 de Noviembre de 2004.H:15:28
---------------------------------------------------
---------------------------------------------------*/
gb_integrante.of_color(False)
end event

event itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 05 de Noviembre de 2004.H:14:50
---------------------------------------------------
---------------------------------------------------*/
Long ll_pos, ll_resultado,ll_ctecnico
n_cst_comun_orden lo_comun //orden.lib
//-------------------------------------------------
If il_err_item_change<>0 Then
	Return 2
End If
//--------------------------------------------------------------------
If dwo.name="co_ctecnico" Then
	ll_pos = Find("Match(co_ctecnico,~'"+Trim(Data)+"~')",1,RowCount())
	If ll_pos>0 then
		MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo de t$$HEX1$$e900$$ENDHEX$$cnico ya est$$HEX2$$e1002000$$ENDHEX$$seleccionado.",StopSign!)	
		Return 2
	End If
	//***********************************************************************
	// Requirement: El integrante de un grupo no deber$$HEX1$$ed00$$ENDHEX$$a estar registrado en otro grupo.
	ll_pos=of_validar_tecnico(Data)	
	If ll_pos<>1 Then
		Return 2	
	End If
	//***********************************************************************	
	ll_pos = idc_tecnico.Find("Match(co_ctecnico,~'"+Trim(Data)+"~')",1,idc_tecnico.RowCount())	
	SetItem(row,"de_ctecnico",trim(idc_tecnico.GetItemString(ll_pos,'de_ctecnico')))
//	ll_resultado=lo_comun.of_nombredesarrollador(Data,n_cst_application.itr_appl)
//	If ll_resultado<>1 Then
//		MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo de t$$HEX1$$e900$$ENDHEX$$cnico no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
//		Return 2
//	End If
//	SetItem(row,"de_ctecnico",lo_comun.of_getString(1))	
End If
//--------------------------------------------------------------
ib_cambios = True
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 05 de Noviembre de 2004.H:15:17
---------------------------------------------------
---------------------------------------------------*/
Long ll_i
//-------------------------------------------------
If dw_grupo.Rowcount()<=0 Then
	MessageBox("Advertencia!","Debe especificar los datos del grupo.",StopSign!)
	Return
End If
//-------------------------------------------------
Super::Event ue_insertRow()
ll_i = This.GetRow()
This.SetItem(ll_i,"id_grupo",il_grupo)
This.SetColumn('co_ctecnico')
This.SetItemStatus(ll_i,0,Primary!,New!)

end event

type gb_integrante from u_gb_base within w_registro_grupo
string tag = "Integrante(s) de Grupo de Trabajo"
integer x = 37
integer y = 504
integer width = 1499
integer height = 1408
integer taborder = 0
string text = "Integrante(s) del Grupo (Ctrl+2)"
end type

