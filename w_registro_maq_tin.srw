HA$PBExportHeader$w_registro_maq_tin.srw
$PBExportComments$Ventana de Registro de m$$HEX1$$e100$$ENDHEX$$quinas de tintorer$$HEX1$$ed00$$ENDHEX$$a de la muestra para la programaci$$HEX1$$f300$$ENDHEX$$n
forward
global type w_registro_maq_tin from w_sheet
end type
type tab_maq from tab within w_registro_maq_tin
end type
type tabpage_activ from userobject within tab_maq
end type
type dw_actividades from u_dw_application within tabpage_activ
end type
type tabpage_activ from userobject within tab_maq
dw_actividades dw_actividades
end type
type tabpage_oper from userobject within tab_maq
end type
type dw_operaciones from u_dw_application within tabpage_oper
end type
type tabpage_oper from userobject within tab_maq
dw_operaciones dw_operaciones
end type
type tabpage_grup from userobject within tab_maq
end type
type dw_grupos from u_dw_application within tabpage_grup
end type
type tabpage_grup from userobject within tab_maq
dw_grupos dw_grupos
end type
type tab_maq from tab within w_registro_maq_tin
tabpage_activ tabpage_activ
tabpage_oper tabpage_oper
tabpage_grup tabpage_grup
end type
type dw_maquina_tin from u_dw_application within w_registro_maq_tin
end type
type gb_maquina_tin from u_gb_base within w_registro_maq_tin
end type
end forward

global type w_registro_maq_tin from w_sheet
string tag = "Registro de M$$HEX1$$e100$$ENDHEX$$quinas de Tintorer$$HEX1$$ed00$$ENDHEX$$a"
integer width = 3374
integer height = 2372
string title = "Registro de M$$HEX1$$e100$$ENDHEX$$quinas de Tintorer$$HEX1$$ed00$$ENDHEX$$a"
string menuname = "m_registro_maq_tin"
boolean maxbox = true
windowstate windowstate = maximized!
event ue_eliminar_maquina ( )
tab_maq tab_maq
dw_maquina_tin dw_maquina_tin
gb_maquina_tin gb_maquina_tin
end type
global w_registro_maq_tin w_registro_maq_tin

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:18:04
---------------------------------------------------
---------------------------------------------------*/
Public:

	Boolean ib_cambios, ib_reg,ib_save,ib_nuevo,ib_dbclk	
	Long il_fabrica,il_maquina,il_co_fabrica
	String is_desc,is_vec_desc[]
	DatawindowChild idc_actividad,idc_operacion, idc_turno
	
	long il_turno
end variables

forward prototypes
public function integer of_buscar ()
public function integer of_reset ()
public function integer of_redraw (boolean ab_redreawing)
public function integer of_carga_dddw ()
public function integer of_carga_objtr ()
public function integer of_consecutivo ()
public function integer of_eliminar_maquina ()
public function integer of_ok_maquina ()
public function integer of_newid_maquina ()
public function integer of_verificar ()
public function integer of_error_maquina ()
public function integer of_guardar ()
public function integer of_existe_maquina (long al_fabrica, long al_maquina)
end prototypes

event ue_eliminar_maquina();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:18:03
---------------------------------------------------
---------------------------------------------------*/
//of_Redraw(False)
//of_eliminar_maquina()
//of_Redraw(True)
end event

public function integer of_buscar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de noviembre de 2004.H:18:00
---------------------------------------------------
Busqueda de las m$$HEX1$$e100$$ENDHEX$$quinas almacenadas
---------------------------------------------------*/
Long ll_resultado, ll_i,ll_maquina
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
If dw_maquina_tin.RowCount()>0 Then
			of_Reset()
End If
//-------------------------------------------------------------------------------------------------
ll_resultado = dw_maquina_tin.Retrieve(il_fabrica,il_maquina)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de la m$$HEX1$$e100$$ENDHEX$$quina de tintorer$$HEX1$$ed00$$ENDHEX$$a",StopSign!)		
		Return -1
	Case 0
		MessageBox("Advertencia!","La maquina no se encontr$$HEX2$$f3002000$$ENDHEX$$registrada.",StopSign!)	
		Return -1
End Choose
//-------------------------------------------------------------------------------------------------
ll_resultado = tab_maq.tabpage_activ.dw_actividades.Retrieve(il_fabrica,il_maquina)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de las actividades asignadas a la m$$HEX1$$e100$$ENDHEX$$quina.",StopSign!)
		Return -1
	Case 0
		ls_msj+='*M$$HEX1$$e100$$ENDHEX$$quina sin actividades asignadas ~n'
End Choose
//-------------------------------------------------------------------------------------------------
ll_resultado = tab_maq.tabpage_oper.dw_operaciones.Retrieve(il_fabrica,il_maquina)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de las operaciones de la m$$HEX1$$e100$$ENDHEX$$quina.",StopSign!)
		Return -1
	Case 0
		ls_msj+='*M$$HEX1$$e100$$ENDHEX$$quina sin operaciones asignadas ~n'
End Choose
//-------------------------------------------------------------------------------------------------
ll_resultado = tab_maq.tabpage_grup.dw_grupos.Retrieve(il_fabrica,il_maquina)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de los grupos para la m$$HEX1$$e100$$ENDHEX$$quina.",StopSign!)
		Return -1
	Case 0
		ls_msj+='*M$$HEX1$$e100$$ENDHEX$$quina sin grupos asignados ~n'
End Choose
//-------------------------------------------------------------------------------------------------
il_fabrica = dw_maquina_tin.GetItemNumber(1,'co_fabrica')
il_maquina = dw_maquina_tin.GetItemNumber(1,'cs_maquina')
ll_maquina = dw_maquina_tin.GetItemNumber(1,'co_maquina')
//-------------------------------------------------------------------------------------------------
of_redraw(True)
If Not ib_save Then
	MessageBox("M$$HEX1$$e100$$ENDHEX$$quina de Tintorer$$HEX1$$ed00$$ENDHEX$$a Nro. "+String(ll_maquina)+" -F$$HEX1$$e100$$ENDHEX$$b. "+String(il_fabrica)+" -Consec. "+String(il_maquina),'Informaci$$HEX1$$f300$$ENDHEX$$n de M$$HEX1$$e100$$ENDHEX$$quina cargada!~n'+ls_msj,Information!)
Else
	ib_save=False
End If
ib_reg=TRUE
ib_nuevo=FALSE
dw_maquina_tin.SetColumn('disponible')
Return 1
end function

public function integer of_reset ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:18:12
---------------------------------------------------
---------------------------------------------------*/
dw_maquina_tin.reset()
tab_maq.tabpage_activ.dw_actividades.reset()
tab_maq.tabpage_oper.dw_operaciones.reset()
tab_maq.tabpage_grup.dw_grupos.reset()
Return 1
end function

public function integer of_redraw (boolean ab_redreawing);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:18:21
---------------------------------------------------
---------------------------------------------------*/
dw_maquina_tin.SetRedraw(ab_redreawing)
tab_maq.tabpage_activ.dw_actividades.SetRedraw(ab_redreawing)
tab_maq.tabpage_oper.dw_operaciones.SetRedraw(ab_redreawing)
tab_maq.tabpage_grup.dw_grupos.SetRedraw(ab_redreawing)

Return 1
end function

public function integer of_carga_dddw ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:17:52
---------------------------------------------------
---------------------------------------------------*/
n_cst_comun lo_comun
//-------------------------------------------------
dw_maquina_tin.GetChild("id_turno",idc_turno)
lo_comun.of_loaddddw(idc_turno,n_cst_application.itr_appl)



tab_maq.tabpage_activ.dw_actividades.GetChild("id_actividad",idc_actividad)
//idc_actividad.Describe('Object.de_estado.Visible=False')
lo_comun.of_loaddddw(idc_actividad,n_cst_application.itr_appl)
tab_maq.tabpage_oper.dw_operaciones.GetChild("co_operacion",idc_operacion)
lo_comun.of_loaddddw(idc_operacion,n_cst_application.itr_appl)
Return 1
end function

public function integer of_carga_objtr ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:18:12
---------------------------------------------------
---------------------------------------------------*/
dw_maquina_tin.of_conexion(n_cst_application.itr_appl,True)
tab_maq.tabpage_activ.dw_actividades.of_conexion(n_cst_application.itr_appl,True)
tab_maq.tabpage_oper.dw_operaciones.of_conexion(n_cst_application.itr_appl,True)
tab_maq.tabpage_grup.dw_grupos.of_conexion(n_cst_application.itr_appl,True)
Return 1

end function

public function integer of_consecutivo ();///*-------------------------------------------------
//	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
//	Date		: Viernes 05 de Noviembre de 2004.H:10:34
//---------------------------------------------------
//Generaci$$HEX1$$f300$$ENDHEX$$n del consecutivo. Devuelve -1 si el proceso no fu$$HEX1$$e900$$ENDHEX$$
//exitoso.
//----------------------------------------------------
//Consulta del consecutivo
//El codigo para las m$$HEX1$$e100$$ENDHEX$$quinas de tintorer$$HEX1$$ed00$$ENDHEX$$a ser$$HEX2$$e1002000$$ENDHEX$$para el 
//ID '36'<--- creada en tiempo de dise$$HEX1$$f100$$ENDHEX$$o
//Log del registro :
//Table  : cf_consecutivos@crydes
//Fields : co_fabrica 		= 2
//			id_documento 	= 36
//			cs_documento 	= *(ini)
//			ob_documento 	= M$$HEX1$$e100$$ENDHEX$$quinas de Tintorer$$HEX1$$ed00$$ENDHEX$$a-Programaci$$HEX1$$f300$$ENDHEX$$n
//			sw_replica		= 0
//			instancia		= crydes01/nicdes01
//---------------------------------------------------*/
//Boolean lb_continuar
//Long ll_cantidad
//n_ds_application lds_cant_maquina
////--------------------------------------------------
//lds_cant_maquina = CREATE n_ds_application
//lds_cant_maquina.of_load('d_nro_maquina')
//lds_cant_maquina.of_conexion(n_cst_application.itr_appl,True)
//lb_continuar=True
//DO WHILE lb_continuar //*
//	il_maquina = n_cst_application.of_consecutive(n_cst_application.ii_fabrica,36,n_cst_application.itr_appl)
//   If il_maquina<=0 Then
//		il_maquina=0
//		MessageBox("Advertencia!","No se pudo determinar el consecutivo de la m$$HEX1$$e100$$ENDHEX$$quina de tintorer$$HEX1$$ed00$$ENDHEX$$a para registrar.",StopSign!)
//		Return -1
//	End If
//	
//	ll_cantidad = lds_cant_maquina.Retrieve(il_maquina)
//	If ll_cantidad<= 0 Then
//			MessageBox("Advertencia!","Error recuperando la cuenta del c$$HEX1$$f300$$ENDHEX$$digo de las m$$HEX1$$e100$$ENDHEX$$quinas(ds).",StopSign!)		
//			Return -1						
//	End If
//	ll_cantidad = lds_cant_maquina.GetItemNumber(1,'nro_maquina')
//	If ll_cantidad=0 Then
//		lb_continuar=False
//	End If
//LOOP //*
//DESTROY lds_cant_maquina
////<------
////MessageBox('INFO','# consecutivo de grupo:'+String(il_maquina),Information!)
//If il_maquina>0 Then
//	Return 1
//End If
////
Return -1
end function

public function integer of_eliminar_maquina ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:17:52
---------------------------------------------------
Elimina m$$HEX1$$e100$$ENDHEX$$quina
-------------------------------------------------------------------------------------*/
Long ll_respuesta, ll_maquina
n_cst_comun_orden lo_comun
//-------------------------------------------------------------------------------------
If dw_maquina_tin.RowCount()<1 Then
	Return -1
End If

If Not ib_reg Then
	MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","M$$HEX1$$e100$$ENDHEX$$quina no registrada!.",Information!)
	Return -1
End If
////-------------------------------------------------------------------------------------
ll_respuesta = MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","$$HEX2$$bf002000$$ENDHEX$$Desea eliminar esta m$$HEX1$$e100$$ENDHEX$$quina del registro y sus datos relacionados?",Question!,YesNo!,2)
If ll_respuesta<>1 Then
	Return -1
End If
//-------------------------------------------------------------------------------------
ll_maquina = dw_maquina_tin.GetItemNumber(1,'co_maquina')
dw_maquina_tin.DeleteRow(0)
tab_maq.tabpage_activ.dw_actividades.RowsMove(1,tab_maq.tabpage_activ.dw_actividades.RowCount(),Primary!,tab_maq.tabpage_activ.dw_actividades,tab_maq.tabpage_activ.dw_actividades.DeletedCount()+1,Delete!)
tab_maq.tabpage_oper.dw_operaciones.RowsMove(1,tab_maq.tabpage_oper.dw_operaciones.RowCount(),Primary!,tab_maq.tabpage_oper.dw_operaciones,tab_maq.tabpage_oper.dw_operaciones.DeletedCount()+1,Delete!)
tab_maq.tabpage_grup.dw_grupos.RowsMove(1,tab_maq.tabpage_grup.dw_grupos.RowCount(),Primary!,tab_maq.tabpage_grup.dw_grupos,tab_maq.tabpage_grup.dw_grupos.DeletedCount()+1,Delete!)
//-------------------------------------------------------------------------------------
If tab_maq.tabpage_activ.dw_actividades.Update()<>1 Then
	of_error_maquina()
	Return -1
End If

If tab_maq.tabpage_oper.dw_operaciones.Update()<>1 Then
	of_error_maquina()
	Return -1
End If

If tab_maq.tabpage_grup.dw_grupos.Update()<>1 Then
	of_error_maquina()
	Return -1
End If

If dw_maquina_tin.Update()<>1 Then
	of_error_maquina()
	Return -1
End If
//-----------------------------------------------------------------------------
of_Reset()
of_ok_maquina()
//-----------------------------------------------------------------------------
MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","M$$HEX1$$e100$$ENDHEX$$quina de Tintorer$$HEX1$$ed00$$ENDHEX$$a Nro. "+String(ll_maquina)+"-F$$HEX1$$e100$$ENDHEX$$b. "+String(il_fabrica)+"-Cons. "+String(il_maquina)+" ha sido eliminada del registro satisfactoriamente.")
Return 1
end function

public function integer of_ok_maquina ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:17:52
---------------------------------------------------
Acepta los cambios hechos a la bd.
---------------------------------------------------*/
//*****************************************
COMMIT USING n_cst_application.itr_appl ;
//*****************************************
Return 1
end function

public function integer of_newid_maquina ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:17:52
---------------------------------------------------
Asigna el c$$HEX1$$f300$$ENDHEX$$digo de la m$$HEX1$$e100$$ENDHEX$$quina para los registros 
detalle
---------------------------------------------------*/
Long ll_i
//-------------------------------------------------
For ll_i=1 To tab_maq.tabpage_activ.dw_actividades.RowCount()
	tab_maq.tabpage_activ.dw_actividades.SetItem(ll_i,'co_fabrica',il_fabrica)
	tab_maq.tabpage_activ.dw_actividades.SetItem(ll_i,'cs_maquina',il_maquina)
Next
For ll_i=1 To tab_maq.tabpage_oper.dw_operaciones.RowCount()
	tab_maq.tabpage_oper.dw_operaciones.SetItem(ll_i,'co_fabrica',il_fabrica)
	tab_maq.tabpage_oper.dw_operaciones.SetItem(ll_i,'cs_maquina',il_maquina)
Next
For ll_i=1 To tab_maq.tabpage_grup.dw_grupos.RowCount()
	tab_maq.tabpage_grup.dw_grupos.SetItem(ll_i,'co_fabrica',il_fabrica)
	tab_maq.tabpage_grup.dw_grupos.SetItem(ll_i,'cs_maquina',il_maquina)
Next

//-------------------------------------------------
Return 1
end function

public function integer of_verificar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:17:52
---------------------------------------------------
Verificaci$$HEX1$$f300$$ENDHEX$$n de los datos antes de grabar
---------------------------------------------------*/
Long ll_pos
//---------------------------------------------------------------------------------------------
If dw_maquina_tin.RowCount()<=0 Then
	Return -1
End If

If dw_maquina_tin.GetItemNumber(1,'co_fabrica')=0 Then
	MessageBox("Advertencia!","Debe elegir un c$$HEX1$$f300$$ENDHEX$$digo de f$$HEX1$$e100$$ENDHEX$$brica existente.~nDigite un c$$HEX1$$f300$$ENDHEX$$digo o DobleClick en la casilla 'Cons. M$$HEX1$$e100$$ENDHEX$$quina*'",StopSign!)
	Return -1
End If
/*~nDigite un c$$HEX1$$f300$$ENDHEX$$digo o DobleClick en la casilla 'Cod. m$$HEX1$$e100$$ENDHEX$$quina'*/

If dw_maquina_tin.GetItemNumber(1,'cs_maquina')=0 Then
	MessageBox("Advertencia!","Debe elegir un c$$HEX1$$f300$$ENDHEX$$digo de m$$HEX1$$e100$$ENDHEX$$quina existente para la f$$HEX1$$e100$$ENDHEX$$brica # "+String(il_fabrica)+"~nDigite un c$$HEX1$$f300$$ENDHEX$$digo o DobleClick en la casilla 'Cons. M$$HEX1$$e100$$ENDHEX$$quina*'",StopSign!)
	Return -1
End If
/* ~nDigite un c$$HEX1$$f300$$ENDHEX$$digo o DobleClick en la casilla 'Cod. m$$HEX1$$e100$$ENDHEX$$quina'*/
//If dw_maquina_tin.AcceptText()<>1 Then
//	MessageBox("Advertencia!","Datos de la m$$HEX1$$e100$$ENDHEX$$quina no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
//	//Return -1
//End If
//----------------------------------------------------------------------------------
//If of_validar_horario_maq (dw_maquina_tin.GetItemTime(1,'hora_inicio'),&
//				dw_maquina_tin.GetItemNumber(1,'nu_horas')) <> 1 Then
//		Return -1
//End If
//----------------------------------------------------------------------------------
//If tab_maq.tabpage_activ.dw_actividades.RowCount()+tab_maq.tabpage_oper.dw_operaciones.RowCount()<=0 Then
//	MessageBox("Advertencia!","La m$$HEX1$$e100$$ENDHEX$$quina debe tener por lo menos una operaci$$HEX1$$f300$$ENDHEX$$n o una actividad asignada.",StopSign!)
//	Return -1
//End If
////----------------------------------------------------------------------------------------------
//If tab_maq.tabpage_grup.dw_grupos.RowCount()<=0 Then
//	MessageBox("Advertencia!","La m$$HEX1$$e100$$ENDHEX$$quina debe estar asignada por lo menos a un grupo.",StopSign!)
//	Return -1
//End If
//----------------------------------------------------------------------------------------------
If dw_maquina_tin.AcceptText()<>1 Then
	Trigger Event key(Key1!,2)
	//MessageBox("Advertencia!","Datos de la m$$HEX1$$e100$$ENDHEX$$quina no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If tab_maq.tabpage_activ.dw_actividades.AcceptText()<>1 Then
	Trigger Event key(Key2!,2)
	//MessageBox("Advertencia!","Datos de las actividades no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If tab_maq.tabpage_oper.dw_operaciones.AcceptText()<>1 Then
	Trigger Event key(Key3!,2)
	//MessageBox("Advertencia!","Datos de las operaciones no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If tab_maq.tabpage_grup.dw_grupos.AcceptText()<>1 Then
	Trigger Event key(Key4!,2)
	//MessageBox("Advertencia!","Datos de los grupos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

//----------------------------------------------------------------------------------------
If Not dw_maquina_tin.of_completedata() Then
	Trigger Event key(Key1!,2)
	Return -1
End If
If Not tab_maq.tabpage_activ.dw_actividades.of_completedata() Then
	Trigger Event key(Key2!,2)
	Return -1
End If
If Not tab_maq.tabpage_oper.dw_operaciones.of_completedata() Then
	Trigger Event key(Key3!,2)
	Return -1
End If
If Not tab_maq.tabpage_grup.dw_grupos.of_completedata() Then
	Trigger Event key(Key4!,2)
	Return -1
End If
//----------------------------------------------------------------------------------------
Return 1
end function

public function integer of_error_maquina ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:17:52
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
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 17 de Noviembre de 2004.H:14:23
---------------------------------------------------
Guarda despues de verificar. Devuelve 1 si es exitoso
---------------------------------------------------*/
Long ll_maquina_control
DateTime ldt_fecha
String ls_usuario,ls_instancia
//-------------------------------------------------
If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If
//ll_maquina_control=il_maquina
//If il_maquina=0 Then
//	If of_consecutivo()<>1 Then
//		Return -1
//	End If
//	dw_maquina_tin.SetItem(1,"co_maquina",il_maquina)
//End If
ls_instancia=Trim(ls_instancia)
dw_maquina_tin.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)
tab_maq.tabpage_activ.dw_actividades.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)	
tab_maq.tabpage_oper.dw_operaciones.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)	
tab_maq.tabpage_grup.dw_grupos.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)		
//If Not ib_reg Then
	of_newid_maquina()
//End If
//---------------------------------------------------------------------------------
If dw_maquina_tin.Update(True,False)<>1 Then 
	of_error_maquina()
	Return -1
End If

If tab_maq.tabpage_activ.dw_actividades.Update(True,False)<>1 Then 
	of_error_maquina()
	Return -1
End If

If tab_maq.tabpage_oper.dw_operaciones.Update(True,False)<>1 Then 
	of_error_maquina()
	Return -1
End If

If tab_maq.tabpage_grup.dw_grupos.Update(True,False)<>1 Then 
	of_error_maquina()
	Return -1
End If
//---------------------------------------------------------------------------------
dw_maquina_tin.ResetUpdate()
tab_maq.tabpage_activ.dw_actividades.ResetUpdate()
tab_maq.tabpage_oper.dw_operaciones.ResetUpdate()
tab_maq.tabpage_grup.dw_grupos.ResetUpdate()
//
Return 1

end function

public function integer of_existe_maquina (long al_fabrica, long al_maquina);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:18:10
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n que revisa que el c$$HEX1$$f300$$ENDHEX$$digo introducido este registrado
en la tabla 'm_maq_tin' y que no est$$HEX2$$e9002000$$ENDHEX$$en 'mu_maq_tin'
---------------------------------------------------*/
Long ll_resultado,ll_cont
String ls_de_maquina
n_ds_application lds_maquina
//---------------------------------------------------
lds_maquina = CREATE n_ds_application
lds_maquina.of_load('d_nro_maqtin')
lds_maquina.of_conexion(n_cst_application.itr_appl,True)
ll_resultado = lds_maquina.Retrieve(al_fabrica,al_maquina)
Choose Case ll_resultado
	Case Is <= 0 
		MessageBox("Advertencia!","Error recuperando datos de la m$$HEX1$$e100$$ENDHEX$$quina de tintorer$$HEX1$$ed00$$ENDHEX$$a registrada en muestras",StopSign!)		
		Return -1	
	Case 1
		ll_cont=lds_maquina.GetItemNumber(1,'nro_maquina')
		If ll_cont > 0 Then
			MessageBox("Advertencia!","La m$$HEX1$$e100$$ENDHEX$$quina de tintorer$$HEX1$$ed00$$ENDHEX$$a con consecutivo # "+String(al_maquina)+" en Fab. # "+String(al_fabrica)+" ya est$$HEX2$$e1002000$$ENDHEX$$registrada",StopSign!)
			Return -1				
		End If
		lds_maquina.of_load('d_bus_m_maq_tin')
		lds_maquina.of_conexion(n_cst_application.itr_appl,True)
		ll_resultado = lds_maquina.Retrieve(al_fabrica,al_maquina)
		Choose Case ll_resultado
			Case Is <0
				MessageBox("Advertencia!","Error recuperando datos de la existencia externa de la m$$HEX1$$e100$$ENDHEX$$quina de tintorer$$HEX1$$ed00$$ENDHEX$$a.",StopSign!)		
				Return -1
			Case 0
				MessageBox("Advertencia!","El consecutivo de m$$HEX1$$e100$$ENDHEX$$quina de tintorer$$HEX1$$ed00$$ENDHEX$$a # "+String(al_maquina)+" con Fab. # "+String(al_fabrica)+" no existe en el registro externo.",StopSign!)		
				Return -1
			Case 1
				is_vec_desc[1]=String(lds_maquina.GetItemNumber(1,'co_maquina'))
				is_vec_desc[2]=lds_maquina.GetItemString(1,'de_marca')
				is_vec_desc[3]=lds_maquina.GetItemString(1,'de_tipo')
				is_vec_desc[4]=String(lds_maquina.GetItemDecimal(1,'peso_min'))
				is_vec_desc[5]=String(lds_maquina.GetItemDecimal(1,'peso_med'))
				is_vec_desc[6]=String(lds_maquina.GetItemDecimal(1,'peso_max'))
				//ib_nuevo=true
				//dw_maquina_tin.SetItem(1,'de_maquina',lds_maquina.GetItemString(1,'de_maquina'))
			Case Else
				MessageBox("Advertencia!","El c$$HEX1$$f300$$ENDHEX$$digo de la m$$HEX1$$e100$$ENDHEX$$quina posee m$$HEX1$$e100$$ENDHEX$$s de una instancia en el registro externo.",StopSign!)		
				Return -1
			End Choose
End Choose
DESTROY lds_maquina
//-------------------------------------------------------------------------------------------------------------------------------------
Return 1
end function

on w_registro_maq_tin.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_registro_maq_tin" then this.MenuID = create m_registro_maq_tin
this.tab_maq=create tab_maq
this.dw_maquina_tin=create dw_maquina_tin
this.gb_maquina_tin=create gb_maquina_tin
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_maq
this.Control[iCurrent+2]=this.dw_maquina_tin
this.Control[iCurrent+3]=this.gb_maquina_tin
end on

on w_registro_maq_tin.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.tab_maq)
destroy(this.dw_maquina_tin)
destroy(this.gb_maquina_tin)
end on

event key;call super::key;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:15:40
---------------------------------------------------
Uso del ctrl, keyflags=2
---------------------------------------------------*/
If keyflags = 2 THEN // Keyflags para el 'Ctrl'
	Choose Case Key
		Case Key1!			
			dw_maquina_tin.SetFocus()
		Case Key2!			
			tab_maq.SelectTab(tab_maq.tabpage_activ)
			tab_maq.tabpage_activ.dw_actividades.SetFocus()			
		Case Key3!			
			tab_maq.SelectTab(tab_maq.tabpage_oper)
			tab_maq.tabpage_oper.dw_operaciones.SetFocus()					
		Case Key4!			
			tab_maq.SelectTab(tab_maq.tabpage_grup)
			tab_maq.tabpage_grup.dw_grupos.SetFocus()						
	End Choose
End If
end event

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:16:37
---------------------------------------------------
---------------------------------------------------*/
of_carga_objtr()
of_carga_dddw()
//-------------------------------------------------

end event

event ue_find;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:15:41
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lou_param
//-------------------------------------------------
Open(w_opc_maq_tin)
lou_param = Message.PowerObjectParm
If IsValid(lou_param) Then	
	of_redraw(False)
	il_fabrica=lou_param.il_vector[1]
	il_maquina=lou_param.il_vector[2]
	of_buscar()
End If
//---------------------------------------------------
end event

event ue_save;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:18:24
---------------------------------------------------
Guardar datos de la m$$HEX1$$e100$$ENDHEX$$quina
---------------------------------------------------*/
Long ll_maquina
//-------------------------------------------------
If of_verificar()<>1 Then
	Return
End If

of_Redraw(False)
If of_guardar()<>1 Then
	of_Redraw(True)
	Return
End If
// Acepta los cambios en la BD. si todo sale bien
of_ok_maquina()
//***********************************************
il_fabrica= dw_maquina_tin.GetItemNumber(1,"co_fabrica")
il_maquina= dw_maquina_tin.GetItemNumber(1,"cs_maquina")
ll_maquina=	dw_maquina_tin.GetItemNumber(1,"co_maquina")
MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","La m$$HEX1$$e100$$ENDHEX$$quina de tintorer$$HEX1$$ed00$$ENDHEX$$a # ~'"+String(ll_maquina)+"~' de la f$$HEX1$$e100$$ENDHEX$$brica # "+String(il_fabrica)+" con consecutivo # "+String(il_maquina)+" se registr$$HEX2$$f3002000$$ENDHEX$$satisfactoriamente.")
ib_cambios=False
ib_save=true
of_buscar()
//---------------------------------------------------------------------------
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

type tab_maq from tab within w_registro_maq_tin
integer x = 37
integer y = 544
integer width = 3269
integer height = 1280
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
tabpage_activ tabpage_activ
tabpage_oper tabpage_oper
tabpage_grup tabpage_grup
end type

on tab_maq.create
this.tabpage_activ=create tabpage_activ
this.tabpage_oper=create tabpage_oper
this.tabpage_grup=create tabpage_grup
this.Control[]={this.tabpage_activ,&
this.tabpage_oper,&
this.tabpage_grup}
end on

on tab_maq.destroy
destroy(this.tabpage_activ)
destroy(this.tabpage_oper)
destroy(this.tabpage_grup)
end on

type tabpage_activ from userobject within tab_maq
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3232
integer height = 1160
long backcolor = 80269524
string text = "Actividades(Ctrl+2)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_actividades dw_actividades
end type

on tabpage_activ.create
this.dw_actividades=create dw_actividades
this.Control[]={this.dw_actividades}
end on

on tabpage_activ.destroy
destroy(this.dw_actividades)
end on

type dw_actividades from u_dw_application within tabpage_activ
integer x = 18
integer y = 24
integer width = 1902
integer height = 1120
integer taborder = 20
string dataobject = "d_activ_mtin1"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:18:10
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lo_param
//-------------------------------------------------
If Row=0 Then Return
//-------------------------------------------------
If dwo.name="id_actividad" then
		Open(w_bus_actividad)
		lo_param=Message.PowerObjectParm
		If IsValid(lo_param) Then
			SetText(String(lo_param.il_vector[1]))
			AcceptText()
			SetColumn('de_actividad')
			//SetItem(row,'de_actividad',lo_param.is_vector[1])
		End If		
End If
//-------------------------------------------------
end event

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:18:04
---------------------------------------------------
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,255)
end event

event itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:18:04
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
Long ll_pos, ll_resultado, ll_estado_actividad
n_cst_comun_orden lo_comun //orden.lib
//-------------------------------------------------
If il_err_item_change<>0 Then
	Return 2
End If
//--------------------------------------------------------------------
If dwo.name="id_actividad" Then
	ll_pos=find("id_actividad="+data,1,RowCount())
	If ll_pos>0 then
		MessageBox("Advertencia!","La actividad ya est$$HEX2$$e1002000$$ENDHEX$$seleccionada.",StopSign!)
		//Setitem(row,'de_actividad','')
		Return 2
	End If	
	ll_resultado=lo_comun.of_nombreactividad(Long(Data),n_cst_application.itr_appl)
	If ll_resultado<>1 Then
		MessageBox("Advertencia!","Actividad no registrada.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_actividad",Trim(lo_comun.of_getString(1)))
//	ll_pos=idc_actividad.Find("id_actividad="+data,1,idc_actividad.RowCount())
//	SetItem(row,"de_actividad",idc_actividad.GetItemString(ll_pos,'de_actividad'))
End If
//--------------------------------------------------------------
ib_cambios = True
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:18:04
---------------------------------------------------
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,0)
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:18:04
---------------------------------------------------
---------------------------------------------------*/
Long ll_i
//-------------------------------------------------
If dw_maquina_tin.Rowcount()<=0 Then
	Return
End If

If il_fabrica=0 OR il_maquina=0 Then
	MessageBox("Advertencia!","Debe especificar una f$$HEX1$$e100$$ENDHEX$$brica y una m$$HEX1$$e100$$ENDHEX$$quina v$$HEX1$$e100$$ENDHEX$$lida para registrar las actividades.",StopSign!)
	Return
End If

//If il_maquina=0 Then
//	MessageBox("Advertencia!","Debe especificar un consecutivo de m$$HEX1$$e100$$ENDHEX$$quina v$$HEX1$$e100$$ENDHEX$$lido para registrar actividades.",StopSign!)
//	Return
//End If
//----------------------------------------------------
//If dw_maquina_tin.Rowcount()<=0 and il_maquina<>0 Then
//	MessageBox("Advertencia!","Debe especificar una m$$HEX1$$e100$$ENDHEX$$quina para el registro.",StopSign!)
//	Return
//End If
////-------------------------------------------------
Super::Event ue_insertRow()
ll_i = This.GetRow()
This.SetItem(ll_i,"co_fabrica",il_fabrica)
This.SetItem(ll_i,"cs_maquina",il_maquina)
This.SetColumn('id_actividad')
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

type tabpage_oper from userobject within tab_maq
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3232
integer height = 1160
long backcolor = 80269524
string text = "Operaciones(Ctrl+3)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_operaciones dw_operaciones
end type

on tabpage_oper.create
this.dw_operaciones=create dw_operaciones
this.Control[]={this.dw_operaciones}
end on

on tabpage_oper.destroy
destroy(this.dw_operaciones)
end on

type dw_operaciones from u_dw_application within tabpage_oper
integer x = 18
integer y = 24
integer width = 1902
integer height = 1120
integer taborder = 40
string dataobject = "d_operac_mtin1"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:18:10
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lo_param
//-------------------------------------------------
If Row=0 Then Return
//-------------------------------------------------
If dwo.name="co_operacion" then
		Open(w_bus_operac_muestra)
		lo_param=Message.PowerObjectParm
		If IsValid(lo_param) Then
			SetText(String(lo_param.il_vector[1]))
			AcceptText()
			SetColumn('de_operacion')
			//SetItem(row,'de_operacion',lo_param.is_vector[1])
		End If		
End If
//-------------------------------------------------
end event

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:18:02
---------------------------------------------------
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,255)
end event

event itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: M$$HEX1$$e100$$ENDHEX$$rtes 16 de Noviembre de 2004.H:18:05
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
		MessageBox("Advertencia!","La operaci$$HEX1$$f300$$ENDHEX$$n ya est$$HEX2$$e1002000$$ENDHEX$$seleccionada.",StopSign!)
		//Setitem(row,'de_operacion','')
		Return 2
	End If	
	ll_resultado=lo_comun.of_nombre_operac_muestra(Long(Data),n_cst_application.itr_appl)
	If ll_resultado<>1 Then
		MessageBox("Advertencia!","Operaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_operacion",Trim(lo_comun.of_getString(1)))
//	ll_pos=idc_operacion.Find("co_operacion="+data,1,idc_operacion.RowCount())
//	SetItem(row,"de_operacion",idc_operacion.GetItemString(ll_pos,'de_operacion'))
End If
//--------------------------------------------------------------
ib_cambios = True
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:18:02
---------------------------------------------------
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,0)
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Noviembre de 2004.H:08:58
---------------------------------------------------
---------------------------------------------------*/
Long ll_i
//-------------------------------------------------
If dw_maquina_tin.Rowcount()<=0 Then
	Return
End If

If il_fabrica=0 OR il_maquina=0 Then
	MessageBox("Advertencia!","Debe especificar una f$$HEX1$$e100$$ENDHEX$$brica y una m$$HEX1$$e100$$ENDHEX$$quina v$$HEX1$$e100$$ENDHEX$$lida para registrar las operaciones.",StopSign!)
	Return
End If


//If il_maquina=0 Then
//	MessageBox("Advertencia!","Debe especificar un consecutivo de m$$HEX1$$e100$$ENDHEX$$quina v$$HEX1$$e100$$ENDHEX$$lido para registrar las operaciones.",StopSign!)
//	Return
//End If
//If dw_maquina_tin.Rowcount()<=0 and il_maquina<>0 Then
//	MessageBox("Advertencia!","Debe especificar la m$$HEX1$$e100$$ENDHEX$$quina para el registro.",StopSign!)
//	Return
//End If
//-------------------------------------------------
Super::Event ue_insertRow()
ll_i = This.GetRow()
This.SetItem(ll_i,"co_fabrica",il_fabrica)
This.SetItem(ll_i,"cs_maquina",il_maquina)
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

type tabpage_grup from userobject within tab_maq
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3232
integer height = 1160
long backcolor = 80269524
string text = "Grupos(Ctrl+4)"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_grupos dw_grupos
end type

on tabpage_grup.create
this.dw_grupos=create dw_grupos
this.Control[]={this.dw_grupos}
end on

on tabpage_grup.destroy
destroy(this.dw_grupos)
end on

type dw_grupos from u_dw_application within tabpage_grup
integer x = 18
integer y = 24
integer width = 1938
integer height = 1120
integer taborder = 50
string dataobject = "d_grupo_mtin1"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:18:10
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lo_param
//-------------------------------------------------
If Row=0 Then Return

If dwo.name="id_grupo" then
		Open(w_bus_grupo_act)
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
	Date		: Martes 16 de Noviembre de 2004.H:18:04
---------------------------------------------------
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,255)
end event

event itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:16:53
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
		MessageBox("Advertencia!","Grupo asignado a la m$$HEX1$$e100$$ENDHEX$$quina no es v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_grupo",Trim(lo_comun.of_getString(1)))
End If
//--------------------------------------------------------------
ib_cambios = True
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:18:04
---------------------------------------------------
---------------------------------------------------*/
Tabtextcolor=Rgb(0,0,0)
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:18:05
---------------------------------------------------
---------------------------------------------------*/
Long ll_i
//-------------------------------------------------
If dw_maquina_tin.Rowcount()<=0 Then
	Return
End If

If il_fabrica=0 OR il_maquina=0 Then
	MessageBox("Advertencia!","Debe especificar una f$$HEX1$$e100$$ENDHEX$$brica y una m$$HEX1$$e100$$ENDHEX$$quina v$$HEX1$$e100$$ENDHEX$$lida para registrar los grupos.",StopSign!)
	Return
End If


//If il_maquina=0 Then
//	MessageBox("Advertencia!","Debe especificar un consecutivo de m$$HEX1$$e100$$ENDHEX$$quina v$$HEX1$$e100$$ENDHEX$$lido para registrar los grupos.",StopSign!)
//	Return
//End If
//If dw_maquina_tin.Rowcount()<=0 and il_maquina<>0 Then
//	MessageBox("Advertencia!","Debe especificar la maquina para el registro.",StopSign!)
//	Return
//End If
//-------------------------------------------------
Super::Event ue_insertRow()
ll_i = This.GetRow()
This.SetItem(ll_i,"co_fabrica",il_fabrica)
This.SetItem(ll_i,"cs_maquina",il_maquina)
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

type dw_maquina_tin from u_dw_application within w_registro_maq_tin
integer x = 73
integer y = 160
integer width = 2917
integer height = 320
string dataobject = "d_maq_tin_reg"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:18:31
---------------------------------------------------
---------------------------------------------------*/
gb_maquina_tin.of_color(True)
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:18:31
---------------------------------------------------
---------------------------------------------------*/
gb_maquina_tin.of_color(False)
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:17:52
---------------------------------------------------
---------------------------------------------------*/
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
il_fabrica=0
il_maquina=0
Call Super::ue_insertrow
//This.SetItem(1,'co_fabrica',il_fabrica)
//This.SetItem(1,'cs_maquina',il_maquina)
This.SetColumn('co_fabrica')
ib_reg=false
ib_nuevo=true


end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:18:10

---------------------------------------------------
---------------------------------------------------*/
Integer li_res
Time ltm_hora_inicio
Long ll_cs_maquina,ll_horas,ll_co_fabrica
Boolean lb_desc
//---------------------------------------------------
lb_desc=False
If dwo.name="co_fabrica" Then
	ll_cs_maquina=This.GetItemNumber(row,'cs_maquina')
	If IsNull(ll_cs_maquina) Then Return 0
	ll_co_fabrica=Long(Data)	
	lb_desc=True
End If
//--------------------------------------------------------------------
If dwo.name="cs_maquina" Then
	ll_co_fabrica=This.GetItemNumber(row,'co_fabrica')
	If IsNull(ll_co_fabrica) Then Return 0	
	ll_cs_maquina=Long(Data)	
	lb_desc=True
End If
//--------------------------------------------------------------------
If lb_desc Then//dwo.name = 'cs_maquina' /*dwo.name = 'co_fabrica' Or*/Then	
	//ll_co_fabrica=This.GetItemNumber(row,'co_fabrica')
	If of_existe_maquina(ll_co_fabrica,ll_cs_maquina) <> 1 Then
		If ib_dbclk Then
			This.SetItem(row,'co_fabrica',il_co_fabrica)
		End If
		ib_dbclk=False
		Return 2		
	End If	
	If Not ib_nuevo Then
			If ib_cambios and il_maquina>0 Then
				li_res=MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
				If li_res=2 Then
					ib_dbclk=False
					Return 2		
				End If				
			End If
			of_redraw(False)
			il_maquina=ll_cs_maquina//This.GetItemNumber(row,'cs_maquina')
			of_reset()
			dw_maquina_tin.InsertRow(0)		
			il_fabrica=ll_co_fabrica//Long(Data)	
			dw_maquina_tin.SetItem(1,'co_fabrica',il_fabrica)
			dw_maquina_tin.SetItem(1,'cs_maquina',il_maquina)			
			of_redraw(True)
			ib_nuevo=True
	Else
		il_fabrica=ll_co_fabrica
		il_maquina=ll_cs_maquina
		dw_maquina_tin.SetItem(1,'co_maquina',Long(is_vec_desc[1]))
		dw_maquina_tin.SetItem(1,'de_marca',Trim(is_vec_desc[2]))
		dw_maquina_tin.SetItem(1,'de_tipo',Trim(is_vec_desc[3]))
		dw_maquina_tin.SetItem(1,'peso_min',Dec(is_vec_desc[4]))
		dw_maquina_tin.SetItem(1,'peso_med',Dec(is_vec_desc[5]))
		dw_maquina_tin.SetItem(1,'peso_max',Dec(is_vec_desc[6]))		
		//dw_maquina_tin.SetItem(1,'de_maquina',is_desc)
	End If	
	ib_dbclk=False
	Return 0		
End If
long ll_dato,ll_pos

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


//---------------------------------------------------
ib_dbclk=False
ib_cambios=True
//---------------------------------------------------


end event

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:18:10
---------------------------------------------------
---------------------------------------------------*/
Long ll_co_fabrica,ll_cs_maquina
n_cst_param lo_param
//-------------------------------------------------
If Row=0 Or ib_reg Then Return
//-------------------------------------------------
If dwo.name="co_fabrica" OR dwo.name="cs_maquina" Then
		Open(w_bus_m_maq_tin)
		lo_param=Message.PowerObjectParm
		If IsValid(lo_param) Then
			//ib_dbclk=True
			//SetText(String(lo_param.il_vector[2]))
			//il_co_fabrica=This.GetItemNumber(row,'co_fabrica')
			//This.SetItem(row,'co_fabrica',lo_param.il_vector[1])
			//AcceptText()
			//SetColumn('de_marca')
			//This.Post Event itemchanged(row,dwo,String(lo_param.il_vector[1]))
			//SetItem(row,'de_maquina',lo_param.is_vector[1])
				ll_co_fabrica=lo_param.il_vector[1]
				ll_cs_maquina=lo_param.il_vector[2]
				If of_existe_maquina(ll_co_fabrica,ll_cs_maquina) <> 1 Then
						Return
				End If	
				il_fabrica=ll_co_fabrica
				il_maquina=ll_cs_maquina
				dw_maquina_tin.SetItem(1,'co_fabrica',il_fabrica)
				dw_maquina_tin.SetItem(1,'cs_maquina',il_maquina)
				dw_maquina_tin.SetItem(1,'co_maquina',Long(is_vec_desc[1]))
				dw_maquina_tin.SetItem(1,'de_marca',Trim(is_vec_desc[2]))
				dw_maquina_tin.SetItem(1,'de_tipo',Trim(is_vec_desc[3]))
				dw_maquina_tin.SetItem(1,'peso_min',Dec(is_vec_desc[4]))
				dw_maquina_tin.SetItem(1,'peso_med',Dec(is_vec_desc[5]))
				dw_maquina_tin.SetItem(1,'peso_max',Dec(is_vec_desc[6]))
				SetColumn('de_marca')				
		End If		
End If
//-------------------------------------------------
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
Choose Case dwo.name
	Case 'cantidad_colas','nu_horas','cs_maquina','co_fabrica'
				If Long(Data)=0 Then
						SetNull(ll_null)
						This.SetItem(row,String(dwo.name),ll_null)						
						Choose Case dwo.name
								Case 'cs_maquina','co_fabrica'
									This.SetItem(row,'co_maquina',ll_null)
									This.SetItem(row,'de_marca','')
									This.SetItem(row,'de_tipo','')
									This.SetItem(row,'peso_min',ll_null)
									This.SetItem(row,'peso_med',ll_null)
									This.SetItem(row,'peso_max',ll_null)
						End Choose
						Return 3
				End If
End Choose
//-------------------------------------------------
end event

event sqlpreview;call super::sqlpreview;//messagebox('where',sqlsyntax)
end event

type gb_maquina_tin from u_gb_base within w_registro_maq_tin
integer x = 37
integer y = 64
integer width = 3273
integer height = 448
integer taborder = 0
string text = "Registro de M$$HEX1$$e100$$ENDHEX$$quina de Tintorer$$HEX1$$ed00$$ENDHEX$$a(Ctrl+1)"
end type

