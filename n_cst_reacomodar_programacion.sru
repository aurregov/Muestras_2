HA$PBExportHeader$n_cst_reacomodar_programacion.sru
$PBExportComments$Custom Object que reacomoda las ordenes de producci$$HEX1$$f300$$ENDHEX$$n seg$$HEX1$$fa00$$ENDHEX$$n la prioridad que $$HEX1$$e900$$ENDHEX$$stas tengan asignadas
forward
global type n_cst_reacomodar_programacion from nonvisualobject
end type
end forward

global type n_cst_reacomodar_programacion from nonvisualobject autoinstantiate
end type

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 22 de Diciembre de 2004.H:17:06
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
Long il_tipoprod

PROTECTED:
	n_ds_application 				ids_ordenes 		//Lista de las ordenes que se van a reacomodar
	n_cst_programacion_ordenes iuo_programacion 	//Este obj. hace la programaci$$HEX1$$f300$$ENDHEX$$n de ordenes
																//DWObj:d_ordenes_prioridad
	n_cst_comun_orden 				iou_comun																
	Long il_nu_orden															
	DateTime idtm_fechahora_actual
end variables

forward prototypes
public function integer of_reacomodarprogramacion ()
public function integer of_load_ds ()
public function integer of_rb ()
public function integer of_cmt ()
public function integer of_win_stepit ()
public function integer of_win_yield ()
end prototypes

public function integer of_reacomodarprogramacion ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 21 de Diciembre de 2004.H:17:06
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------------------------
String 				ls_msj
Integer 				li_res
Long 					ll_i,ll_j,ll_nu_orden,ll_recurso
n_ds_application 	lds_act_tarea
//*****************************************
/*Se carga una lista de las $$HEX1$$f300$$ENDHEX$$rdenes en proceso, 
que son las que est$$HEX1$$e100$$ENDHEX$$n en estados: programadas y en proceso 
productivo; est$$HEX1$$e100$$ENDHEX$$s son las que est$$HEX1$$e100$$ENDHEX$$n en este momento con tareas 
programadas y se deben reacomodar.*/
If of_win_yield () <> 1 Then 
	iuo_programacion.of_rb()
	Return -3
End If
If of_load_ds ()<>1 Then
		Return -1
End If
If of_win_yield () <> 1 Then 
	iuo_programacion.of_rb()
	Return -3
End If
//*****************************************
/*Se actualiza el estado de las tareas no iniciadas de estas
$$HEX1$$f300$$ENDHEX$$rdenes, este proceso hace que queden temporalmente como no 
programadas, para reacomodarlas m$$HEX1$$e100$$ENDHEX$$s tarde en la lista de programaci$$HEX1$$f300$$ENDHEX$$n.*/
/*Actualizar las tareas de estas ordenes, colocarlas en estado 
no programadas, solo las que est$$HEX1$$e100$$ENDHEX$$n 
Condiciones mu_gantt
2.	PROGRAMADA 
3.	LISTA PARA INICIAR 
-->9.	NO PROGRAMADA*/
If iou_comun.of_act_reacomoda_canc(n_cst_application.itr_appl)<>1 Then 
		iou_comun.of_rollback(n_cst_application.itr_appl)
		MessageBox('Advertencia','Error al actualizar el estado de las tareas de las $$HEX1$$f300$$ENDHEX$$rdenes en proceso para la reacomodaci$$HEX1$$f300$$ENDHEX$$n',StopSign!)
		Return -1
End If
If of_win_yield () <> 1 Then 
	iuo_programacion.of_rb()
	Return -3
End If
//////*****************************************
ids_ordenes.SetSort('prioridad A, nu_orden A')
ids_ordenes.Sort()
//-----------------------------------------------------------------------------
//TENER PRESENTE PARA LA EJECUCI$$HEX1$$d300$$ENDHEX$$N DEL PROCESO
/*SI EL PROCESO QUE EFECTUA LA INVOCACION DEL OBJETO ES POR LA NOCHE:
	idtm_fechahora_actual=RelativeDate(idtm_fechahora_actual,1)
	//Para el d$$HEX1$$ed00$$ENDHEX$$a siguiente*/
//-----------------------------------------------------------------------------
n_cst_application.of_selectserver(n_cst_application.itr_appl,idtm_fechahora_actual,ls_msj,ls_msj)
If of_win_yield () <> 1 Then 
	iuo_programacion.of_rb()
	Return -3
End If
If of_win_yield () <> 1 Then 
	iuo_programacion.of_rb()
	Return -3
End If
//-----------------------------------------------------------------------------
If iuo_programacion.of_load_ids()<>1 Then
		Return -1
End If
If of_win_yield () <> 1 Then 
	iuo_programacion.of_rb()
	Return -3
End If
//-----------------------------------------------------------------------------
ll_j=ids_ordenes.RowCount()
For ll_i=1 To ll_j
		If of_win_yield () <> 1 Then 
			iuo_programacion.of_rb()
			Return -3
		End If
		ll_nu_orden=ids_ordenes.GetItemNumber(ll_i,'nu_orden')
		ll_recurso=ids_ordenes.GetItemNumber(ll_i,'co_recurso')
		iuo_programacion.of_set_recurso(ll_recurso)
		li_res = iuo_programacion.of_programarorden(ll_nu_orden,idtm_fechahora_actual)
		If li_res <> 1 Then
			   Messagebox('Var','Cancelado en ll_i='+String(ll_i)+'~r~n'+&
				"Motivo "+String(li_res))
				iuo_programacion.of_rb()
				If li_res = -3 Then
						Return li_res
				End If
				MessageBox('Advertencia','Error en el proceso de reacomodaci$$HEX1$$f300$$ENDHEX$$n para la orden # '+String(ll_nu_orden),StopSign!)
				Return -1			
		End If
		/*of_win_stepit ()*/
Next
//MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','La reacomodaci$$HEX1$$f300$$ENDHEX$$n de las tareas de las $$HEX1$$f300$$ENDHEX$$rdenes se registraron satisfactoriamente.',Information!)	
//-----------------------------------------------------------------------------
Return 1
//****************************************************************
//lds_act_tarea = CREATE n_ds_application
//lds_act_tarea.of_load('d_act_est_tarea_reacom')
//lds_act_tarea.of_conexion(n_cst_application.itr_appl,True)
//ll_j = lds_act_tarea.Retrieve()
//Choose Case ll_j
//	Case Is < 0
//		MessageBox('Advertencia','Error en la solicitud de la informaci$$HEX1$$f300$$ENDHEX$$n de las tareas de las $$HEX1$$f300$$ENDHEX$$rdenes en proceso para la reacomodaci$$HEX1$$f300$$ENDHEX$$n',StopSign!)
//		Return -1
//	Case 0
//		MessageBox('Advertencia','No se encontr$$HEX2$$f3002000$$ENDHEX$$informaci$$HEX1$$f300$$ENDHEX$$n de las tareas de las $$HEX1$$f300$$ENDHEX$$rdenes en proceso para la reacomodaci$$HEX1$$f300$$ENDHEX$$n',StopSign!)
//		Return -1
//End Choose
////*****************************************
//For ll_i=1 To ll_j
//	lds_act_tarea.SetItem(ll_i,'condicion',9) // NO PROGRAMADA
//Next
////*****************************************
//If lds_act_tarea.Update(/*True,False*/)<>1 Then 
//	iou_comun.of_rollback(n_cst_application.itr_appl)
//	MessageBox('Advertencia','Error al actualizar el estado de las tareas de las $$HEX1$$f300$$ENDHEX$$rdenes en proceso para la reacomodaci$$HEX1$$f300$$ENDHEX$$n',StopSign!)
//	Return -1
//End If
//lds_act_tarea = CREATE n_ds_application
//lds_act_tarea.of_load('d_act_est_tarea_reacom_sp')
//lds_act_tarea.of_conexion(n_cst_application.itr_appl,True)
//lds_act_tarea.Retrieve()
//lds_act_tarea.SaveAs('D:\IS\candrico\Scripts\SaveAs\dw_reacomodo.xls',Excel5!,True)
//Las $$HEX1$$f300$$ENDHEX$$rdenes se ordenan seg$$HEX1$$fa00$$ENDHEX$$n la prioridad y si tienen la misma por el # orden
end function

public function integer of_load_ds ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 29 de Diciembre de 2004.H:15:36
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
ids_ordenes = CREATE n_ds_application
ids_ordenes.of_load('d_ordenes_prioridad')
ids_ordenes.of_conexion(n_cst_application.itr_appl,True)
//-------------------------------------------------
//Informaci$$HEX1$$f300$$ENDHEX$$n de las $$HEX1$$f300$$ENDHEX$$rdenes (c$$HEX1$$f300$$ENDHEX$$digo_orden,prioridad,fecha_fin $$HEX1$$fa00$$ENDHEX$$ltima tarea orden max.f_mov_fin)
Choose Case ids_ordenes.Retrieve()
	Case Is < 0
		MessageBox('Advertencia','Error en la solicitud de la informaci$$HEX1$$f300$$ENDHEX$$n de las $$HEX1$$f300$$ENDHEX$$rdenes para reacomodar su programaci$$HEX1$$f300$$ENDHEX$$n',StopSign!)
		Return -1
	Case 0
		MessageBox('Advertencia','No se encontraron $$HEX1$$f300$$ENDHEX$$rdenes para reacomodar programaci$$HEX1$$f300$$ENDHEX$$n',Information!)
		Return -1
End Choose
//*********************************************
//Las $$HEX1$$f300$$ENDHEX$$rdenes se ordenan seg$$HEX1$$fa00$$ENDHEX$$n la prioridad y si tienen la misma por el # orden
ids_ordenes.SetSort('prioridad A, nu_orden A')
ids_ordenes.Sort()
//*********************************************
//-------------------------------------------------
Return 1
end function

public function integer of_rb ();iou_comun.of_rollback(n_cst_application.itr_appl)
Return 1
end function

public function integer of_cmt ();Long ll_i
ll_i = iou_comun.of_commit(n_cst_application.itr_appl)
Return ll_i


end function

public function integer of_win_stepit ();Return w_procesando_programacion.of_StepIt()

end function

public function integer of_win_yield ();/*******************************************************************************************************
* PROC./FUNC.: of_win_yield
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	Obtiene el control del objeto para verificar la cancelaci$$HEX1$$f300$$ENDHEX$$n del proceso
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Martes 02 de Febrero de 2005. Hora: 11:46:40
********************************************************************************************************/
//VARIABLE DECLARATION
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
//SetPointer(Arrow!)
Yield()
If IsValid(w_procesando_programacion) Then
	If w_procesando_programacion.of_get_estado() Then
			Return -1
	End If
End If
Return 1
//END SCRIPT------------------------------------------------------------------------------------------------------

end function

on n_cst_reacomodar_programacion.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_reacomodar_programacion.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

