HA$PBExportHeader$w_programacion_orden.srw
$PBExportComments$Window Object para la interfaz de la programaci$$HEX1$$f300$$ENDHEX$$n de tiempos de las ordenes registradas de las muestras.
forward
global type w_programacion_orden from w_sheet
end type
type cb_update from commandbutton within w_programacion_orden
end type
type cb_programar from u_cb_application within w_programacion_orden
end type
type dw_fe_ini from u_dw_application within w_programacion_orden
end type
type dw_tareas_gantt from u_dw_application within w_programacion_orden
end type
type dw_orden from u_dw_application within w_programacion_orden
end type
type gb_orden from u_gb_base within w_programacion_orden
end type
type gb_tareas from u_gb_base within w_programacion_orden
end type
end forward

global type w_programacion_orden from w_sheet
integer width = 3653
integer height = 2604
string title = "Programaci$$HEX1$$f300$$ENDHEX$$n de $$HEX1$$f300$$ENDHEX$$rdenes de producci$$HEX1$$f300$$ENDHEX$$n"
string menuname = "m_programacion_orden"
boolean maxbox = true
windowstate windowstate = maximized!
cb_update cb_update
cb_programar cb_programar
dw_fe_ini dw_fe_ini
dw_tareas_gantt dw_tareas_gantt
dw_orden dw_orden
gb_orden gb_orden
gb_tareas gb_tareas
end type
global w_programacion_orden w_programacion_orden

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 21 de Diciembre de 2004.H:17:06
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
PRIVATE:
	n_cst_param 					iuo_param	
	n_cst_comun_orden 			iuo_comun 
	n_cst_programacion_ordenes iuo_programacion //Objeto de la programaci$$HEX1$$f300$$ENDHEX$$n
	Long il_nu_orden,il_fabrica,il_linea,il_muestra
	Boolean ib_cambios,ib_save,ib_from_orden
	DateTime idtm_fhserver

	//SA51505 - Ceiba/JJ - 18-08-2015
	n_cst_c_orden_pdn		inv_orden_pdn
end variables

forward prototypes
public function integer of_programar ()
public function integer of_carga_objtr ()
public function integer of_guardar ()
public function integer of_verificar ()
public function integer of_reset ()
public function integer of_redraw (boolean ab_redrawing)
public function long of_buscar ()
protected subroutine of_settitle (readonly string as_title)
public function integer of_act_fe_programacion (long an_nro_orden, datetime adt_fecha)
public function boolean wf_validarcamporecursohabilitado () throws exception
public subroutine wf_setpropertiescamporecurso (readonly boolean al_bool)
public subroutine wf_cargarrecursomuestrabasica () throws exception
public function boolean wf_validarcargarrecursomuestrabasica () throws exception
public function integer of_fecha_entrega (datetime adt_fecha, long an_nro_orden)
end prototypes

public function integer of_programar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 20 de Diciembre de 2004.H:17:06
---------------------------------------------------
---------------------------------------------------*/
DateTime ldtm_fe_ini
Long 		ll_recurso , ll_res
Integer 	li_res
String 	ls_msj, ls_tipo_muestra, ls_fecha, ls_hora
n_ds_application lds_fmovfin_max
DateTime	ldtm_fmovfin_max
Date     ld_fmovfin_max, ld_fe_entrega
Time     lt_fmovfin_max
s_base_parametros lstr_parametro, lstr_parametro_ret

//-------------------------------------------------
If dw_fe_ini.AcceptText()<>1 Then
	dw_fe_ini.SetFocus()
	Return -1
End If

If IsNull(il_nu_orden) OR il_nu_orden<=0 Then
	MessageBox('Advertencia','C$$HEX1$$f300$$ENDHEX$$digo de la orden no es v$$HEX1$$e100$$ENDHEX$$lido para realizar la programaci$$HEX1$$f300$$ENDHEX$$n.',StopSign!)
	Return -1
End If

ll_recurso=dw_orden.GetItemNumber(1,'co_recurso')
If IsNull(ll_recurso) OR ll_recurso<0 Then
	MessageBox('Advertencia','El c$$HEX1$$f300$$ENDHEX$$digo del recurso para la muestra de la orden no es v$$HEX1$$e100$$ENDHEX$$lido.',StopSign!)
	Return -1
End If

ls_tipo_muestra=dw_orden.GetItemString(1,'tipo_muestra')
If IsNull(ls_tipo_muestra) OR ls_tipo_muestra= ' ' Then
	MessageBox('Advertencia','El tipo de muestra para la muestra de la orden no es v$$HEX1$$e100$$ENDHEX$$lido.',StopSign!)
	Return -1
End If

//-----------------------------------------------------------------
ldtm_fe_ini=dw_fe_ini.GetItemDateTime(1,'fe_ini_prog')
If IsNull(ldtm_fe_ini) Then
	MessageBox('Advertencia','La fecha hora inicial para la programaci$$HEX1$$f300$$ENDHEX$$n no es v$$HEX1$$e100$$ENDHEX$$lida. Verifique.',StopSign!)
	Return -1
End If
n_cst_application.of_selectserver(n_cst_application.itr_appl,idtm_fhserver,ls_msj,ls_msj)
If ldtm_fe_ini<idtm_fhserver Then
		dw_fe_ini.SetItem(1,'fe_ini_prog',idtm_fhserver)
		dw_fe_ini.Modify("fe_ini_prog_t.Text='"+String(idtm_fhserver,'yyyy/mm/dd - hh:mm')+"'")
		ldtm_fe_ini=idtm_fhserver
End If
iuo_programacion.il_tipoprod = dw_orden.GetItemNumber(1, 'co_tipoprod')

//*************************************
//iuo_programacion = CREATE n_cst_programacion_ordenes
//Asigno el recurso de la muestra de la orden
If iuo_programacion.of_load_ids()<>1 Then
		Return -1
End If
//*************************************
iuo_programacion.of_set_recurso(ll_recurso)
iuo_programacion.of_set_tipo_muestra(ls_tipo_muestra) 

//*************************************
/*iuo_param.is_vector[1]=/*Title*/'Procesando programaci$$HEX1$$f300$$ENDHEX$$n de la orden # '+String(il_nu_orden)
iuo_param.il_vector[1]=dw_tareas_gantt.RowCount()
OpenWithParm(w_procesando_programacion,iuo_param)*/
//*************************************
SetPointer(HourGlass!)
OpenWithParm(w_procesando_programacion,'Procesando programaci$$HEX1$$f300$$ENDHEX$$n de la orden # '+String(il_nu_orden))
/***********************************************************
SA51505 - Ceiba/JJ - 18-08-2015
Comentario: se adiciona los get y set para poder tener acceso a la fabrica - linea y muestra y asi validar si ya fue convertida a referencia
***********************************************************/
iuo_programacion.of_setfabricamuestra(il_fabrica)
iuo_programacion.of_setlinea(il_linea)
iuo_programacion.of_setmuestra(il_muestra)
li_res=iuo_programacion.of_ProgramarOrden(il_nu_orden,ldtm_fe_ini)/*...*/
//*************************************
If li_res<> 1 Then
		iuo_programacion.of_rb()
		Close(w_procesando_programacion)
		If li_res = -3 Then/*cancelaci$$HEX1$$f300$$ENDHEX$$n*/
				MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','El proceso de programaci$$HEX1$$f300$$ENDHEX$$n ha sido cancelado por el usuario',Information!)
				Return li_res
		End If
		MessageBox('Advertencia','Error en el proceso de programaci$$HEX1$$f300$$ENDHEX$$n de la orden #'+String(il_nu_orden),StopSign!)
		Return -1
End If
//DESTROY iuo_programacion
//dw_tareas_gantt.Retrieve(il_nu_orden)
//*************************************
dw_orden.SetItem(1,'condicion',2)//SE ASIGNA LA CONDICION DE 'PROGRAMADA'

ll_res = of_guardar()
If ll_res<>1 Then
	Close(w_procesando_programacion)
	Return -1
End If
iuo_comun.of_commit(n_cst_application.itr_appl)
Close(w_procesando_programacion)
//*********************************************************************************************
lds_fmovfin_max= CREATE n_ds_application
lds_fmovfin_max.of_load('d_sp_fmovfin_max')
lds_fmovfin_max.of_conexion(n_cst_application.itr_appl,True)
li_res=lds_fmovfin_max.Retrieve(il_nu_orden)
Choose Case li_res
	Case Is <0
		MessageBox('Advertencia','Error en la consulta de la fecha de terminaci$$HEX1$$f300$$ENDHEX$$n de la $$HEX1$$fa00$$ENDHEX$$ltima tarea de la orden # '+String(il_nu_orden)+'.',StopSign!)	
	Case 0
		MessageBox('Advertencia','No se encontraron datos para la fecha de terminaci$$HEX1$$f300$$ENDHEX$$n de la $$HEX1$$fa00$$ENDHEX$$ltima tarea de la orden # '+String(il_nu_orden)+'.',StopSign!)	
End Choose
ldtm_fmovfin_max=lds_fmovfin_max.GetItemDateTime(1,'max_mov_fin')
//*********************************************************************************************
If Not IsNull(ldtm_fmovfin_max) Then
	ls_msj='Fecha de terminaci$$HEX1$$f300$$ENDHEX$$n $$HEX1$$fa00$$ENDHEX$$ltima tarea: '+String(ldtm_fmovfin_max,'yyyy/mm/dd hh:mm') + '~n'
Else
	ls_msj=''
End If

// FACL - 2018/12/27 - SA59572 -  Se agrega la fecha de entrega al mensaje 
ld_fe_entrega = dw_orden.GetItemDate(1, 'fe_entrega')
ls_msj += 'Fecha Entrega: '
If ld_fe_entrega > Date( '1900/01/01' ) Then 
	ls_msj += String( ld_fe_entrega, 'yyyy/mm/dd' ) + '~n'
Else
	If Not IsNull(ldtm_fmovfin_max) Then
		ld_fe_entrega = Date( ldtm_fmovfin_max )
	End If
	ls_msj += '~n'
End If

//SA56888 - Ceiba/reariase - 06/06/2017
ls_msj = ls_msj + '$$HEX1$$bf00$$ENDHEX$$Desea cambiar la fecha de entrega?'
ll_res = MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','La programaci$$HEX1$$f300$$ENDHEX$$n de la orden # '+String(il_nu_orden)+' se registr$$HEX2$$f3002000$$ENDHEX$$satisfactoriamente.~n'+ls_msj,Information!,YesNo!,2)	
If ll_res = 1 Then
	
	// FACL - 2018/12/27 - SA59572 -  Se agrega parametro fe_entrega a la ventana para ingresar la nueva fecha de entrega
	lstr_parametro.hay_parametros = True
	lstr_parametro.fecha[1] = ld_fe_entrega
	lstr_parametro.fecha[2] = Date( ldtm_fmovfin_max )
	
	//openwithparm(w_fec_entrega_prog,String(ldtm_fmovfin_max))
	openwithparm(w_fec_entrega_prog, lstr_parametro )
	
	lstr_parametro_ret = Message.PowerObjectParm
	
	If lstr_parametro_ret.hay_parametros Then
		ld_fe_entrega = lstr_parametro_ret.fecha[1]
		// FACL - 2018/12/27 - SA59572 -  Se actualiza la fecha de entrega en la orden
		If ld_fe_entrega = dw_orden.GetItemDate(1, 'fe_entrega') And dw_orden.ModifiedCount() = 0 Then
			//No se actualiza
		Else
			dw_orden.SetItem( 1, 'fe_entrega', ld_fe_entrega )
			This.of_Guardar()			
		End If
	End If
		
	/*
	ls_msj  = Message.stringparm
	ls_fecha = Mid(ls_msj,1,10)
	ls_hora  = Mid(ls_msj,12,19)
	ld_fmovfin_max   = Date(ls_fecha) 
	lt_fmovfin_max	  = Time(ls_hora)
	ldtm_fmovfin_max = dateTime(ld_fmovfin_max, lt_fmovfin_max)
	dw_orden.SetItem(1,'fe_prog_fin',ldtm_fmovfin_max)
	dw_orden.SetItem(1,'fe_mov_fin',ldtm_fmovfin_max)
	*/
	ib_save=True
Else
	// FACL - 2018/12/27 - SA59572 -  Si no selecciona fecha y esta en blanco se inicializa con la ultima fecha de terminacion de tareas
	If ld_fe_entrega > Date( '1900/01/01' ) Then 
	Else
		ld_fe_entrega = Date( ldtm_fmovfin_max )
		dw_orden.SetItem( 1, 'fe_entrega', ld_fe_entrega )
		This.of_Guardar()
	End If
End If
// FACL - 2018/12/27 - SA59572 -  Se quita actualizacion de fecha a las tareas
//of_fecha_entrega(ldtm_fmovfin_max,il_nu_orden)



//MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','La programaci$$HEX1$$f300$$ENDHEX$$n de la orden # '+String(il_nu_orden)+' se registr$$HEX2$$f3002000$$ENDHEX$$satisfactoriamente.~n'+ls_msj,Information!)	
//Fin SA56888
//*************************************
ib_save=True
of_buscar()
//*************************************
Return 1
end function

public function integer of_carga_objtr ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 21 de Diciembre de 2004.H:14:48
---------------------------------------------------
Carga los obj. de transacci$$HEX1$$f300$$ENDHEX$$n
---------------------------------------------------*/
dw_orden.of_conexion(n_cst_application.itr_appl,True)
dw_tareas_gantt.of_conexion(n_cst_application.itr_appl,True)
Return 1
end function

public function integer of_guardar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 30 de Septiembre de 2004.H:17:25
---------------------------------------------------
Guarda despues de verificar. Devuelve 1 si es exitoso
---------------------------------------------------*/
long ll_i,ll_tot
DateTime ldt_fecha
String ls_usuario,ls_instancia,ls_filtro
u_dw_application ldw_c, ldw_p
n_cst_comun_orden lo_obj

If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If
ls_instancia = trim(ls_instancia)
dw_orden.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)
//dw_tareas_gantt.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)
/*----------------------------------------------
Update
----------------------------------------------*/
If dw_orden.Update(True,False)<>1 Then 
	iuo_comun.of_rollback(n_cst_application.itr_appl)
	Return -1
End If

//If dw_tareas_gantt.Update(True,False)<>1 Then 
//	iuo_comun.of_rollback(n_cst_application.itr_appl)
//	Return -1
//End If
//----------------------------------------------
il_fabrica = dw_orden.GetItemNumber(1,'co_fabrica')
il_linea = dw_orden.GetItemNumber(1,'co_linea')
il_muestra = dw_orden.GetItemNumber(1,'co_muestra')
//----------------------------------------------
dw_orden.ResetUpdate()
//dw_tareas_gantt.ResetUpdate()
Return 1
end function

public function integer of_verificar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 21 de diciiembre de 2004.H:12:40
---------------------------------------------------
Verificaci$$HEX1$$f300$$ENDHEX$$n de los datos antes de grabar
---------------------------------------------------*/
Long ll_pos,ll_cod

If dw_orden.RowCount()=0 Then
	Return -1
End If
//--------------------------------------------
//Verificaci$$HEX1$$f300$$ENDHEX$$n de 
//--------------------------------------------
If dw_orden.AcceptText()<>1 Then	
	Trigger Event key(Key1!,2)
	Return -1
End If

If dw_tareas_gantt.AcceptText()<>1 Then
	Trigger Event key(Key2!,2)
	Return -1
End If
//-----------------------------------------------------------------------------
If Not dw_orden.of_completedata() Then
	Trigger Event key(Key1!,2)	
	Return -1
End If
If Not dw_tareas_gantt.of_completedata() Then
	Trigger Event key(Key2!,2)	
	Return -1
End If
//-----------------------------------------------------------------------------
Return 1
end function

public function integer of_reset ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 29 de Septiembre de 2004.H:15:49
---------------------------------------------------
---------------------------------------------------*/
dw_orden.Reset()
dw_tareas_gantt.Reset()
//---------------------------------------------------
Return 1
end function

public function integer of_redraw (boolean ab_redrawing);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 22 de Septiembre de 2004.H:15:47
---------------------------------------------------
---------------------------------------------------*/
dw_orden.SetRedraw(ab_redrawing)
dw_tareas_gantt.SetRedraw(ab_redrawing)
//---------------------------------------------------
Return 1
end function

public function long of_buscar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 22 de Septiembre de 2004.H:17:05
//---------------------------------------------------
	Buscar las ordenes almacenadas
//---------------------------------------------------*/
Long ll_resultado,ll_i,ll_estado_orden
String ls_tipo_muestra,ls_co_ctecnico,ls_msj
Datawindowchild ldwc_orden, ldwc_grupo
//-------------------------------------------------------------------------------------------------
TRY
cb_programar.Enabled=True
If dw_orden.RowCount()>0 Then
			of_Reset()
End If
//-------------------------------------------------------------------------------------------------
ll_resultado = dw_orden.Retrieve(il_fabrica,il_linea,il_muestra,il_nu_orden)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de la orden para la programaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
		cb_programar.Enabled=False
		dw_fe_ini.Modify("fe_ini_prog.Background.Mode='0'")
		dw_fe_ini.Modify("fe_ini_prog.Background.Color='67108864'")
		dw_fe_ini.Enabled=False
		Return -1
	Case 0
		MessageBox("Advertencia!","La orden no ha sido encontrada en el registro.",StopSign!)	
		cb_programar.Enabled=False
		dw_fe_ini.Modify("fe_ini_prog.Background.Mode='0'")
		dw_fe_ini.Modify("fe_ini_prog.Background.Color='67108864'")
		dw_fe_ini.Enabled=False
		
		of_reset()
		Return -1
End Choose
dw_fe_ini.InsertRow(0)
n_cst_application.of_selectserver(n_cst_application.itr_appl,idtm_fhserver,ls_msj,ls_msj)
dw_fe_ini.SetItem(1,'fe_ini_prog',idtm_fhserver)
dw_fe_ini.Modify("fe_ini_prog_t.Text='"+String(idtm_fhserver,'yyyy/mm/dd - hh:mm')+"'")
cb_programar.Visible = True

cb_update.Visible    = True  
////-------------------------------------------------------------------------------------------------
ll_resultado = dw_tareas_gantt.Retrieve(il_nu_orden)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de las tareas de la orden # "+ String(il_nu_orden),StopSign!)
		cb_programar.Enabled=False
		dw_fe_ini.Modify("fe_ini_prog.Background.Mode='0'")
		dw_fe_ini.Modify("fe_ini_prog.Background.Color='67108864'")
		dw_fe_ini.Enabled=False
		Return -1
	Case 0		
		MessageBox("Advertencia","La orden # "+String(il_nu_orden)+' no posee tareas que puedan ser programadas.',StopSign!)
		cb_programar.Enabled=False
		dw_fe_ini.Modify("fe_ini_prog.Background.Mode='0'")
		dw_fe_ini.Modify("fe_ini_prog.Background.Color='67108864'")
		dw_fe_ini.Enabled=False		
		Return -1
	Case Else
		ls_msj=""
End Choose
of_redraw(true)
//ib_era = true
If Not ib_save Then
	Post MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Orden No: "+String(il_nu_orden)+' cargada!'+ls_msj,Information!)
Else
	ib_save=False
End If
//of_settitle('')
//**********************************************************************************************************
ll_estado_orden=dw_orden.GetItemNumber(1,'condicion')
If ll_estado_orden <> 1 /*No Registrada*/ Then	
	cb_programar.Enabled=False
	dw_fe_ini.Modify("fe_ini_prog.Background.Mode='0'")
	dw_fe_ini.Modify("fe_ini_prog.Background.Color='67108864'")
	dw_fe_ini.Enabled=False
	If dw_orden.GetChild('condicion',ldwc_orden) > 0 Then
		ll_i=ldwc_orden.Find('condicion='+String(ll_estado_orden),1,ldwc_orden.RowCount())
		If ll_i > 0 Then
				This.Title='Programaci$$HEX1$$f300$$ENDHEX$$n de $$HEX1$$f300$$ENDHEX$$rdenes de producci$$HEX1$$f300$$ENDHEX$$n | ESTADO: '+ldwc_orden.GetItemString(ll_i,'de_condicion')
		End If
	End If		
Else
	cb_programar.Enabled=True
	dw_fe_ini.Modify("fe_ini_prog.Background.Mode='0'")
	dw_fe_ini.Modify("fe_ini_prog.Background.Color='1073741824'")
	dw_fe_ini.Enabled=True		
	dw_fe_ini.SetFocus()
	dw_fe_ini.SetItem(1,'fe_ini_prog',idtm_fhserver)
	dw_fe_ini.Modify("fe_ini_prog_t.Text='"+String(idtm_fhserver,'yyyy/mm/dd - hh:mm')+"'")
	This.Title='Programaci$$HEX1$$f300$$ENDHEX$$n de $$HEX1$$f300$$ENDHEX$$rdenes de producci$$HEX1$$f300$$ENDHEX$$n'
End If
/****************************************************************************************************
SA51505 - Ceiba/JJ - 15-10-2015
Comentario: Verificar si se debe habilitar o no el campo recurso
***********************************************************/
IF wf_ValidarCampoRecursoHabilitado() THEN 
	wf_setPropertiesCampoRecurso(TRUE)
ELSE
	wf_setPropertiesCampoRecurso(FALSE)
END IF

Integer li_tipoprod
li_tipoprod = dw_orden.GetItemNumber(1, 'co_tipoprod')

dw_tareas_gantt.GetChild('co_grupo',ldwc_grupo) 
ldwc_grupo.SetTransObject(n_cst_application.itr_appl)
ldwc_grupo.Retrieve(li_tipoprod)
////-------------------------------------------------------------------------------------------------
Return 1
CATCH(Throwable le_error)
	Messagebox("Error Cargar Orden Producci$$HEX1$$f300$$ENDHEX$$n", le_error.getmessage(), StopSign!)
End Try
end function

protected subroutine of_settitle (readonly string as_title);Title="Programaci$$HEX1$$f300$$ENDHEX$$n de Ordenes de Producci$$HEX1$$f300$$ENDHEX$$n | "
Title+="Orden "+String(il_nu_orden)+" / "+String(il_fabrica)+" / "+String(il_linea)+" / "+String(il_muestra)
end subroutine

public function integer of_act_fe_programacion (long an_nro_orden, datetime adt_fecha);/*-------------------------------------------------
	Develr.	: Yovanny G$$HEX1$$e100$$ENDHEX$$lvez Zuluaga
	Date		: Miercoles 31 de Agosto de 2005
//---------------------------------------------------*/

UPDATE dt_mu_ord
SET fe_programacion = :adt_fecha
WHERE nu_orden = :an_nro_orden
using n_cst_application.itr_appl ;

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
Else
	Commit using n_cst_application.itr_appl;
End If


RETURN 1
end function

public function boolean wf_validarcamporecursohabilitado () throws exception;/********************************************************************
SA51505 - wf_ValidarCampoRecursoHabilitado Ceiba/JJ - 18-08-2015
<DESC> Description: Indica si el campo recurso esta habilitado o No </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> El Campo recurso esta habilitado si ya fue convertido a referencia si aun No 
		se ha convertido a referencia, no esta habilitado </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	IF inv_orden_pdn.of_ValidarCampoRecursoHabilitado(il_fabrica,il_linea,il_muestra,dw_orden.getitemnumber(1,'co_Recurso') ) THEN 
		RETURN TRUE
	ELSE 
		RETURN FALSE
	END IF 
catch( Throwable ex1 )
	ex1.setmessage( "No se pudo verificar si el recurso es modificable o No")
	Throw ex1
End try
end function

public subroutine wf_setpropertiescamporecurso (readonly boolean al_bool);/********************************************************************
SA51505 - wf_SetPropertiesCampoRecurso Ceiba/JJ - 18-08-2015
<DESC> Description: si el campo recurso esta habilitado o No tiene un color, y es o no protegido
		Se modifica el dw con readonly para Permitir cambiar el Recurso de la orden por uno que este habilitado </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> al_bool </ARGS> 
<USAGE> cargar las propiedades indicadas </USAGE>
********************************************************************/	
IF al_bool THEN //CAMPO HABILITADO
	dw_orden.Modify("DataWindow.ReadOnly='No'") //Permite Modificar el recurso 
	dw_orden.Modify("co_recurso.Background.Color='1073741824'")//White 
	dw_orden.SetTabOrder(21, 29)
	dw_orden.Modify("co_recurso.Protect='0'")
	
	dw_orden.Modify("co_ctecnico.Background.Mode='0'")
	dw_orden.Modify("co_ctecnico.Background.Color='67108864'")//ButtonFace
	dw_orden.Modify("co_ctecnico.TabSequence='0'")
	dw_orden.Modify("co_ctecnico.Protect='1'")
	dw_orden.Modify("Tipo.TabSequence='0'")
	dw_orden.Modify("Tipo.Background.Mode='0'")
	dw_orden.Modify("Tipo.Background.Color='67108864'")//ButtonFace
	dw_orden.Modify("Tipo.Protect='1'")
	dw_orden.Modify("co_ejecutiva.TabSequence='0'")	
	dw_orden.Modify("co_ejecutiva.Background.Mode='0'")
	dw_orden.Modify("co_ejecutiva.Background.Color='67108864'")	//ButtonFace
	dw_orden.Modify("co_ejecutiva.Protect='1'")
	dw_orden.Modify("sacar_peso.TabSequence='0'")	
	dw_orden.Modify("sacar_peso.Background.Mode='0'")
	dw_orden.Modify("sacar_peso.Background.Color='67108864'")//ButtonFace
	dw_orden.Modify("sacar_peso.Protect='1'")	
ELSE //CAMPO DESHABILITADO
	dw_orden.Modify("DataWindow.ReadOnly='Yes'")  //Solo lectura 
	dw_orden.Modify("co_recurso.Background.Color='67108864'")//ButtonFace
	dw_orden.SetTabOrder(21, 0)
	dw_orden.Modify("co_recurso.Protect='1'")
END IF


end subroutine

public subroutine wf_cargarrecursomuestrabasica () throws exception;/********************************************************************
SA51505 - wf_CargarRecursoMuestraBasica() Ceiba/JJ - 18-08-2015
<DESC> Description: Indica si el campo recurso esta habilitado o No </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> si no se ha convertido a referencia la muestra y el recurso no esta 
habilitado se debe validar si en la muestra ya fue cambiado el recurso por uno habilitado </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	IF inv_orden_pdn.of_CargarRecursoMuestraBasica(il_fabrica,il_linea,il_muestra) THEN
		dw_orden.setItem(1,'co_recurso', inv_orden_pdn.of_getRecursoMuestraBasica())
	END IF 
catch( Throwable ex1 )
	ex1.setmessage( "No se pudo verificar si el recurso es modificable o No")
	Throw ex1
End try
end subroutine

public function boolean wf_validarcargarrecursomuestrabasica () throws exception;/********************************************************************
SA51505 Ceiba/JJ - 18-08-2015 - wf_validarCargarRecursoMuestraBasica() 
<DESC> Description: Indica si el campo recurso esta habilitado o No </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> si no se ha convertido a referencia la muestra y el recurso no esta 
habilitado se debe validar si en la muestra ya fue cambiado el recurso por uno habilitado </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	//Ceiba/JJ - 30-10-2015
	//Refrescar orden de producci$$HEX1$$f300$$ENDHEX$$n al cambiar por recurso habilitado para desarrollo en la muestra b$$HEX1$$e100$$ENDHEX$$sica, para el caso en donde la muestra no ha sido convertida a referencia
	/*IF inv_orden_pdn.of_ValidarCargarCampoRecursoMuestraOrden(il_fabrica,il_linea,il_muestra,dw_dt_mu_ord.getItemNumber(1,'co_Recurso')) &
		AND (inv_orden_pdn.of_puedeModificar(il_estado_orden)) THEN*/
	IF inv_orden_pdn.of_ValidarCargarCampoRecursoMuestraOrden(il_fabrica,il_linea,il_muestra) THEN		
		RETURN TRUE
	ELSE 
		RETURN FALSE
	END IF 
catch( Throwable ex1 )
	ex1.setmessage( "No se pudo verificar si el recurso es modificable o No")
	Throw ex1
End try
end function

public function integer of_fecha_entrega (datetime adt_fecha, long an_nro_orden);/*-------------------------------------------------
	Develr.	: Ren$$HEX2$$e9002000$$ENDHEX$$Arias Esparza
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 14 de Junio de 2017.H:14:40
//---------------------------------------------------
	Fecha de Entrega de las Ordenes
//---------------------------------------------------*/

Integer li_consec

SELECT MAX(consec)
INTO   :li_consec
FROM   mu_gantt
WHERE nu_orden = :an_nro_orden
using n_cst_application.itr_appl ;

If li_consec > 0 Then

	UPDATE mu_gantt
	SET 	f_prog_fin = :adt_fecha,
			f_mov_fin  = :adt_fecha
	WHERE nu_orden   = :an_nro_orden
	AND   consec     = :li_consec
	using n_cst_application.itr_appl ;

	If n_cst_application.itr_appl.SQLcode=-1 Then 
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(n_cst_application.itr_appl)
		Return -1
	Else
		Commit using n_cst_application.itr_appl;
	End If
Else
	MessageBox("Error", "No hay consecutivo de $$HEX1$$f300$$ENDHEX$$rdenes")
	Return -1
End If

RETURN 1
end function

on w_programacion_orden.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_programacion_orden" then this.MenuID = create m_programacion_orden
this.cb_update=create cb_update
this.cb_programar=create cb_programar
this.dw_fe_ini=create dw_fe_ini
this.dw_tareas_gantt=create dw_tareas_gantt
this.dw_orden=create dw_orden
this.gb_orden=create gb_orden
this.gb_tareas=create gb_tareas
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_update
this.Control[iCurrent+2]=this.cb_programar
this.Control[iCurrent+3]=this.dw_fe_ini
this.Control[iCurrent+4]=this.dw_tareas_gantt
this.Control[iCurrent+5]=this.dw_orden
this.Control[iCurrent+6]=this.gb_orden
this.Control[iCurrent+7]=this.gb_tareas
end on

on w_programacion_orden.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_update)
destroy(this.cb_programar)
destroy(this.dw_fe_ini)
destroy(this.dw_tareas_gantt)
destroy(this.dw_orden)
destroy(this.gb_orden)
destroy(this.gb_tareas)
end on

event ue_find;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 21 de Diciembre de 2004.H:17:06
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
Open(w_opc_orden)
If IsValid(Message.PowerObjectParm) Then
	iuo_param = Message.PowerObjectParm
	il_fabrica=iuo_param.il_vector[1]
	il_linea=iuo_param.il_vector[2]
	il_muestra=iuo_param.il_vector[3]
	il_nu_orden=iuo_param.il_vector[4]
	ib_save=False
	of_buscar()
End If

	
end event

event closequery;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 28 de Septiembre de 2004.H:15:12
---------------------------------------------------
---------------------------------------------------*/
//If ib_cambios Then
//	If MessageBox('Validaci$$HEX1$$f300$$ENDHEX$$n','Se perder$$HEX1$$e100$$ENDHEX$$n los cambios realizados. Desea continuar?',Question!,YesNo!,2)=2 Then
//		Return 1
//	Else
//		Return 0
//	End If
//End If
//---------------------------------------------------



end event

event ue_save;call super::ue_save;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 30 de Septiembre de 2004.H:12:37
---------------------------------------------------
Evento para  guardar los datos.
---------------------------------------------------*/
Return
of_Redraw(False)
If of_verificar()<>1 Then
	of_Redraw(True)
	Return
End If
//--------------------------------------------------
If of_guardar()<>1 Then
	of_Redraw(True)
	Return
End If
//**************************************************
//SE CONSIGNAN LOS CAMBIOS EN LA BD.
iuo_comun.of_commit(n_cst_application.itr_appl)
//**************************************************
il_nu_orden = dw_orden.getItemNUmber(1,"nu_orden")
MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","La programaci$$HEX1$$f300$$ENDHEX$$n de la orden #~'"+String(il_nu_orden)+"~' se registr$$HEX2$$f3002000$$ENDHEX$$satisfactoriamente.")
ib_cambios=False
ib_save=True
of_buscar()
of_Redraw(True)
//----------------------------------------------------------------
end event

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 21 de Diciembre de 2004.H:17:06
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
of_carga_objtr()
ib_from_orden=False
If IsValid(Message.PowerObjectParm) Then
	iuo_param=Message.PowerObjectParm
	If UpperBound(iuo_param.is_vector)>0 Then
			If iuo_param.is_vector[1]='ProgOrden' Then
					iuo_param = Message.PowerObjectParm
					il_fabrica=iuo_param.il_vector[1]
					il_linea=iuo_param.il_vector[2]
					il_muestra=iuo_param.il_vector[3]
					il_nu_orden=iuo_param.il_vector[4]
					ib_from_orden=True
					ib_save=False
					This.Post of_buscar()			
			End If
	End If
End If

//SA51505 - Ceiba/JJ - 18-08-2015
inv_orden_pdn = Create n_cst_c_orden_pdn
end event

event key;call super::key;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 21 de Diciembre de 2004.H:17:06
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
IF keyflags = 2 THEN // Keyflags para el 'Ctrl'
//	Choose Case Key
//			Case Key1!				
//				dw_orden.SetFocus()
//			Case Key2!		
//				dw_tareas_gantt.SetFocus()
//	End Choose
End If
end event

type cb_update from commandbutton within w_programacion_orden
boolean visible = false
integer x = 1915
integer y = 668
integer width = 421
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualizar Grupo"
end type

event clicked;String 		ls_usuario,ls_instancia
Datetime		ldt_fecha
Long 			ll_fila


n_cst_application.of_selectserver(n_cst_application.itr_appl,ldt_fecha,ls_usuario,ls_instancia)

FOR ll_fila = 1 To dw_tareas_gantt.RowCount()
	dw_tareas_gantt.SetItem(ll_fila, 'fe_actualizacion', ldt_fecha)
	dw_tareas_gantt.SetItem(ll_fila, 'usuario', ls_usuario)
NEXT

dw_tareas_gantt.Update() 
end event

type cb_programar from u_cb_application within w_programacion_orden
boolean visible = false
integer x = 1527
integer y = 668
integer width = 370
integer taborder = 50
string text = "&Programar"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 20 de Diciembre de 2004.H:17:06
---------------------------------------------------

---------------------------------------------------*/
n_cst_param 		lo_param
w_inf_orden_pdn 	lw_ficha
datetime 			ld_fecha
long     			ll_nro_orden

If dw_orden.GetItemNumber(1,'condicion') = 2 Then
	MessageBox('Advertencia','No puede programar una orden en estado PROGRAMADA',StopSign!)
	Return
End If
//----------------------------

If of_programar() = 1 THEN
	ld_fecha =dw_orden.GetitemDatetime(dw_orden.GetRow(),"fe_actualizacion")
	ll_nro_orden =dw_orden.GetitemNumber(dw_orden.GetRow(),"nu_orden")
	of_act_fe_programacion(ll_nro_orden,ld_fecha)	
	
	// Si todo quedo correctamente guardado se pregunta si desea imprimir la orden 
	IF MessageBox("Imprimir", "$$HEX1$$bf00$$ENDHEX$$Desea imprimir la orden?", Question!, YesNo!, 2) = 1 THEN
		
		lo_param.il_vector[1] = il_fabrica
		lo_param.il_vector[2] = il_linea
		lo_param.il_vector[3] = il_muestra
		lo_param.il_vector[4] = dw_orden.GetItemNumber(1, 'co_talla')
		lo_param.il_vector[5] = il_nu_orden

		OpenSheetWithParm(lw_ficha,lo_param,w_programacion_orden,2,Original!)
	END IF	
	
End If
//----------------------------
//Si el registro de la orden esta abierto y se ha invocado desde all$$HEX1$$ed00$$ENDHEX$$
//If IsValid(w_orden_pdn) And ib_from_orden Then
//		w_orden_pdn.of_refrescar_datos()
//End If
//--------------------------------------------------


end event

type dw_fe_ini from u_dw_application within w_programacion_orden
integer x = 37
integer y = 608
integer width = 1463
integer height = 160
integer taborder = 40
string dataobject = "d_ext_fe_ini_prog"
boolean vscrollbar = false
string icon = "OleGenReg!"
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 21 de Diciembre de 2004.H:17:06
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
//gb_tareas.of_color(True)
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 21 de Diciembre de 2004.H:17:06
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
//gb_tareas.of_color(False)
end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 21 de Diciembre de 2004.H:17:06
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
DateTime ldtm_fecha
If dwo.name='fe_ini_prog' Then
	ldtm_fecha=DateTime(Date(Left(Data,10)),Time(Mid(Data,12)))
	If  ldtm_fecha < idtm_fhserver Then
		MessageBox('Advertencia','La fecha que ha introducido es anterior a la actual.',StopSign!)
		Return 1
	End If
End If
end event

event itemerror;call super::itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 21 de Diciembre de 2004.H:17:06
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
If dwo.name='fe_ini_prog' Then
	//cb_programar.SetFocus()	
	SetItem(1,1,GetItemDateTime(1,1))	
	Return 1
End If
end event

type dw_tareas_gantt from u_dw_application within w_programacion_orden
integer x = 73
integer y = 864
integer width = 3474
integer height = 896
string dataobject = "d_tareas_orden_lista"
boolean hscrollbar = true
boolean border = true
string icon = "OleGenReg!"
borderstyle borderstyle = stylelowered!
end type

event getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 21 de Diciembre de 2004.H:17:06
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
//gb_tareas.of_color(True)
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 21 de Diciembre de 2004.H:17:06
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
//gb_tareas.of_color(False)
end event

type dw_orden from u_dw_application within w_programacion_orden
integer x = 73
integer y = 96
integer width = 3474
integer height = 452
string dataobject = "d_dt_mu_ord1"
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = styleshadowbox!
end type

event getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 21 de Diciembre de 2004.H:17:06
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
//gb_orden.of_color(True)
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 21 de Diciembre de 2004.H:17:06
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
//gb_orden.of_color(False)
end event

event constructor;call super::constructor;This.Modify("DataWindow.ReadOnly='Yes'")

This.Modify("co_ctecnico.Background.Mode='0'")
This.Modify("co_ctecnico.Background.Color='67108864'")
This.Modify("co_ctecnico.TabSequence='0'")
This.Modify("Tipo.TabSequence='0'")
This.Modify("Tipo.Background.Mode='0'")
This.Modify("Tipo.Background.Color='67108864'")
This.Modify("co_ejecutiva.Background.Mode='0'")
This.Modify("co_ejecutiva.Background.Color='67108864'")


end event

event itemchanged;call super::itemchanged;/***********************************************************
SA51505 - Ceiba/JJ - 18-08-2015
Comentario: Cargar la misma de recursos que hay en muestra basica 
***********************************************************/
Long			ll_res
n_cst_comun lo_comun

String zz = '12'
If dwo.name="co_recurso" and this.Describe("co_recurso.Protect") = '0' Then 
	/* Nombre de Recurso*/
	ll_res=lo_comun.of_nombrerecursomues(long(data) ,n_cst_application.itr_appl)
	If ll_res=1 then
		dw_orden.SetItem(1,"de_recurso",lo_comun.of_getString(1))	
	else 
		dw_orden.SetItem(1,"de_recurso",'')	
	End If
END IF
end event

event doubleclicked;call super::doubleclicked;/***********************************************************
SA51505 - Ceiba/JJ - 18-08-2015
Comentario: Cargar la misma de recursos que hay en muestra basica 
***********************************************************/
n_cst_param		lo_param
n_cst_comun 	lo_comun
Long				ll_res, li_tipoprod

THIS.Accepttext( )

If dwo.name="co_recurso" and this.Describe("co_recurso.Protect") = '0' Then 
	li_tipoprod = dw_orden.GetItemNumber(1, 'co_tipoprod')
	lo_param.il_vector[1] = li_tipoprod
	OpenWithParm(w_bus_mu_recurso_ct, lo_param)	
	lo_param=Message.PowerObjectParm	
	IF IsValid(lo_param) THEN	
		SetItem (getrow(), "co_recurso", lo_param.il_vector[1] )
		/* Nombre de Recurso*/
		ll_res=lo_comun.of_nombrerecursomues(lo_param.il_vector[1] ,n_cst_application.itr_appl)
		If ll_res=1 then
			dw_orden.SetItem(1,"de_recurso",lo_comun.of_getString(1))	
		End If
	ELSE
		RETURN
	END IF
END IF
end event

event retrieveend;call super::retrieveend;/********************************************************************
SA51505 - Retrieveend Ceiba/JJ - 18-08-2015
<DESC> Description: al recuperar los datos se carga recurso muestra basica o orden</DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> si no se ha convertido a referencia la muestra y el recurso no esta 
habilitado se debe validar si en la muestra ya fue cambiado el recurso por uno habilitado </USAGE>
********************************************************************/
TRY
	IF wf_validarCargarRecursoMuestraBasica() THEN
		wf_cargarrecursomuestrabasica()
	END IF 
CATCH(Throwable le_error)
	Messagebox("Error Programacion de ordenes", le_error.getmessage(), StopSign!)
End Try
end event

type gb_orden from u_gb_base within w_programacion_orden
integer x = 37
integer y = 32
integer width = 3547
integer height = 528
integer taborder = 20
string text = "Orden"
end type

type gb_tareas from u_gb_base within w_programacion_orden
integer x = 37
integer y = 768
integer width = 3547
integer height = 1024
integer taborder = 30
string text = "Tareas"
end type

