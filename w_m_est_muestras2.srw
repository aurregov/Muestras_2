HA$PBExportHeader$w_m_est_muestras2.srw
$PBExportComments$Ventana para el registro del estado de las muestras.~r~nMantenimiento de programaci$$HEX1$$f300$$ENDHEX$$n. Existe una ventana de administracion de igual nombre en el lib. 'muestrasw.pbl', esta toma el mismo nombre con un n$$HEX1$$fa00$$ENDHEX$$mero '2' adicional al final del nombre
forward
global type w_m_est_muestras2 from w_sheet
end type
type dw_general from u_dw_application within w_m_est_muestras2
end type
type dw_proceso_precede from u_dw_application within w_m_est_muestras2
end type
type dw_actividad_precede from u_dw_application within w_m_est_muestras2
end type
type gb_act_prec from u_gb_base within w_m_est_muestras2
end type
type gb_estado from u_gb_base within w_m_est_muestras2
end type
type gb_proc_prec from u_gb_base within w_m_est_muestras2
end type
end forward

global type w_m_est_muestras2 from w_sheet
string tag = "Registro de Estados"
integer width = 3547
integer height = 1944
string title = "Registro de Estados"
string menuname = "m_estado_muestras"
boolean maxbox = true
windowstate windowstate = maximized!
event ue_eliminar_estado ( )
dw_general dw_general
dw_proceso_precede dw_proceso_precede
dw_actividad_precede dw_actividad_precede
gb_act_prec gb_act_prec
gb_estado gb_estado
gb_proc_prec gb_proc_prec
end type
global w_m_est_muestras2 w_m_est_muestras2

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 02 de Noviembre de 2004.H:11:02
---------------------------------------------------
---------------------------------------------------*/
Public:
	String is_where_busqueda
	Boolean ib_cambios=False,ib_reg=false,ib_save
	Long il_estado, il_tipoprod
	DataWindowChild idc_actividad, idc_operacion
end variables

forward prototypes
public function integer of_reset ()
public function integer of_redraw (boolean ab_redrawing)
public function integer of_error_estado ()
public function integer of_ok_estado ()
public function integer of_carga_objtr ()
public function integer of_eliminar_estado ()
public function integer of_guardar ()
public function integer of_consecutivo ()
public function integer of_asig_consec ()
public function integer of_verificar ()
public function integer of_carga_dddw ()
public function integer of_buscar (long al_estado)
end prototypes

event ue_eliminar_estado();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Noviembre de 2004.H:18:25
---------------------------------------------------
---------------------------------------------------*/
of_Redraw(False)
of_eliminar_estado()
of_Redraw(True)
end event

public function integer of_reset ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 02 de Noviembre de 2004.H:11:03
---------------------------------------------------
---------------------------------------------------*/
dw_general.reset()
dw_actividad_precede.reset()
dw_proceso_precede.reset()

Return 1
end function

public function integer of_redraw (boolean ab_redrawing);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Noviembre de 2004.H:09:53
---------------------------------------------------
---------------------------------------------------*/
dw_general.SetRedraw(ab_redrawing)
dw_proceso_precede.SetRedraw(ab_redrawing)
dw_actividad_precede.SetRedraw(ab_redrawing)

Return 1
end function

public function integer of_error_estado ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Noviembre de 2004.H:10:54
---------------------------------------------------
Deshace los cambios hechos a la bd.
---------------------------------------------------*/
//************************************************
ROLLBACK USING n_cst_application.itr_appl;
//************************************************
Return 1
end function

public function integer of_ok_estado ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Octubre de 2004.H:15:40
---------------------------------------------------
Acepta los cambios hechos a la bd.
---------------------------------------------------*/
//*****************************************
COMMIT USING n_cst_application.itr_appl ;
//*****************************************
Return 1
end function

public function integer of_carga_objtr ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Septiembre de 2004.H:15:18
---------------------------------------------------
Carga los obj. de transacci$$HEX1$$f300$$ENDHEX$$n
---------------------------------------------------*/
dw_general.of_conexion(n_cst_application.itr_appl,True)
dw_proceso_precede.of_conexion(n_cst_application.itr_appl,True)
dw_actividad_precede.of_conexion(n_cst_application.itr_appl,True)

Return 1

end function

public function integer of_eliminar_estado ();/*-------------------------------------------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:17:21
//-------------------------------------------------------------------------------------
Elimina el turno.
-------------------------------------------------------------------------------------*/
long ll_respuesta
n_cst_comun_orden lo_comun
//-------------------------------------------------------------------------------------
If dw_general.RowCount()<1 Then
	Return -1
End If

If Not ib_reg Then
	MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Estado no registrada!.",Information!)
	Return -1
End If
////-------------------------------------------------------------------------------------
ll_respuesta = MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","$$HEX2$$bf002000$$ENDHEX$$Desea eliminar este estado y sus datos relacionados?",Question!,YesNo!,2)
If ll_respuesta<>1 Then
	Return -1
End If
//-------------------------------------------------------------------------------------
dw_general.DeleteRow(0)
dw_actividad_precede.RowsMove(1,dw_actividad_precede.RowCount(),Primary!,dw_actividad_precede,dw_actividad_precede.DeletedCount()+1,Delete!)
dw_proceso_precede.RowsMove(1,dw_proceso_precede.RowCount(),Primary!,dw_proceso_precede,dw_proceso_precede.DeletedCount()+1,Delete!)
//-------------------------------------------------------------------------------------
If dw_actividad_precede.Update()<>1 Then
	of_error_estado()
	Return -1
End If

If dw_proceso_precede.Update()<>1 Then
	of_error_estado()
	Return -1
End If

If dw_general.Update()<>1 Then
	of_error_estado()
	Return -1
End If
//-----------------------------------------------------------------------------
of_Reset()
of_ok_estado()

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Estado <"+String(il_estado)+"> ha sido eliminado exitosamente.")
Return 1
end function

public function integer of_guardar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Noviembre de 2004.H:17:25
---------------------------------------------------
Guarda despues de verificar. Devuelve 1 si es exitoso
---------------------------------------------------*/
Long ll_estado_control
DateTime ldt_fecha
String ls_usuario,ls_instancia
//--------------------------------------------------------------------
If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If
//--------------------------------------------------------------------
ll_estado_control=il_estado
If il_estado=0 Then
	If of_consecutivo()<>1 Then
		Return -1
	End If
	dw_general.SetItem(1,"co_estado",il_estado)
End If
//
If ll_estado_control=0 Then
	ls_instancia=Trim(ls_instancia)
	dw_general.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)
	dw_actividad_precede.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)	
	dw_proceso_precede.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)	
	of_asig_consec()
End If
//---------------------------------------------------------------------------------
If dw_general.Update(true,false)<>1 Then 
	of_error_estado()
	Return -1
End If

If dw_actividad_precede.Update(true,false)<>1 Then 
	of_error_estado()
	Return -1
End If

If dw_proceso_precede.Update(true,false)<>1 Then 
	of_error_estado()
	Return -1
End If
//---------------------------------------------------------------------------------
dw_general.ResetUpdate()
dw_actividad_precede.ResetUpdate()
dw_proceso_precede.ResetUpdate()
Return 1
end function

public function integer of_consecutivo ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Noviembre de 2004.H:18:20
---------------------------------------------------
Generaci$$HEX1$$f300$$ENDHEX$$n del consecutivo. Devuelve -1 si el proceso no fu$$HEX1$$e900$$ENDHEX$$
exitoso.
----------------------------------------------------
Consulta del consecutivo
El codigo para los estados de muestras ser$$HEX2$$e1002000$$ENDHEX$$para el 
ID '31'<--- creada en tiempo de dise$$HEX1$$f100$$ENDHEX$$o
Log del registro :
Table  : cf_consecutivos@crydes
Fields : co_fabrica 		= 2
			id_documento 	= 31
			cs_documento 	= *(ini)
			ob_documento 	= Estados de Muestras-Programaci$$HEX1$$f300$$ENDHEX$$n
			sw_replica		= 0
			instancia		= crydes01/nicdes01
---------------------------------------------------*/
Boolean lb_continuar
Long ll_cantidad
n_ds_application lds_cant_estado
//--------------------------------------------------
lds_cant_estado = CREATE n_ds_application
lds_cant_estado.of_load('d_nro_estado')
lds_cant_estado.of_conexion(n_cst_application.itr_appl,True)
	
lb_continuar=True
DO WHILE lb_continuar //*
	il_estado = n_cst_application.of_consecutive(n_cst_application.ii_fabrica,31,n_cst_application.itr_appl)
   If il_estado<=0 Then
		il_estado=0
		MessageBox("Advertencia!","No se pudo determinar el consecutivo del estado de la muestra.",StopSign!)
		Return -1
	End If
	
	ll_cantidad = lds_cant_estado.Retrieve(il_estado)
	If ll_cantidad<=0 Then
			MessageBox("Advertencia!","Error recuperando la cuenta del c$$HEX1$$f300$$ENDHEX$$digo de Estado(ds).",StopSign!)		
			Return -1						
	End If
	ll_cantidad = lds_cant_estado.GetItemNumber(1,'nro_estado')
	If ll_cantidad=0 Then
		lb_continuar=False
	End If
LOOP //*
DESTROY lds_cant_estado
//<------
//MessageBox('INFO','# consecutivo de estado:'+String(il_estado),Information!)
If il_estado>0 Then
	Return 1
End If
//
Return -1
end function

public function integer of_asig_consec ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Noviembre de 2004.H:12:00
---------------------------------------------------
---------------------------------------------------*/
Long ll_i
//-------------------------------------------------
For ll_i=1 To dw_actividad_precede.RowCount()
	dw_actividad_precede.SetItem(ll_i,'co_estado',il_estado)
Next
For ll_i=1 To dw_proceso_precede.RowCount()
	dw_proceso_precede.SetItem(ll_i,'co_estado',il_estado)
Next
//----------
Return 1
end function

public function integer of_verificar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Noviembre de 2004.H:15:26
---------------------------------------------------
Verificaci$$HEX1$$f300$$ENDHEX$$n de los datos antes de grabar
---------------------------------------------------*/
Long ll_pos
//---------------------------------------------------------------------------------------------
If dw_general.RowCount()<=0 Then
	Return -1
End If
//----------------------------------------------------------------------------------
If dw_general.AcceptText()<>1 Then
	Trigger Event key(Key1!,2)
	//MessageBox("Advertencia!","Datos del estado no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If dw_actividad_precede.AcceptText()<>1 Then
	Trigger Event key(Key2!,2)
	//MessageBox("Advertencia!","Datos de las actividades predecesoras no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If dw_proceso_precede.AcceptText()<>1 Then
	Trigger Event key(Key3!,2)
	//MessageBox("Advertencia!","Datos de las operaciones predecesoras no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If
//----------------------------------------------------------------------------------------
If Not dw_general.of_completedata() Then
	Trigger Event key(Key1!,2)
	Return -1
End If
If Not dw_actividad_precede.of_completedata() Then
	Trigger Event key(Key2!,2)
	Return -1
End If
If Not dw_proceso_precede.of_completedata() Then
	Trigger Event key(Key3!,2)
	Return -1
End If
//----------------------------------------------------------------------------------------
Return 1
end function

public function integer of_carga_dddw ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Noviembre de 2004.H:15:35
---------------------------------------------------
---------------------------------------------------*/
n_cst_comun lo_comun
//-------------------------------------------------
dw_actividad_precede.GetChild("id_actividad",idc_actividad)
lo_comun.of_loaddddw(idc_actividad,il_tipoprod,n_cst_application.itr_appl)
dw_proceso_precede.GetChild("co_operacion",idc_operacion)
lo_comun.of_loaddddw(idc_operacion,il_tipoprod,n_cst_application.itr_appl)

Return 1
end function

public function integer of_buscar (long al_estado);/*-------------------------------------------------
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
If dw_general.RowCount()>0 Then
			of_Reset()
End If
//-------------------------------------------------------------------------------------------------
// Retrieve a los datos de la tabla de estados 'm_estado_muestra'
ll_resultado = dw_general.Retrieve(al_estado)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos del estado de muestra.",StopSign!)		
		Return -1
	Case 0
		MessageBox("Advertencia!","El estado solicitado no se encontr$$HEX1$$f300$$ENDHEX$$.",StopSign!)			
		Return -1
End Choose
////-------------------------------------------------------------------------------------------------
// Retrieve a las actividades predecesoras de la tabla 'mu_pre_activ'
ll_resultado = dw_actividad_precede.Retrieve(al_estado)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de las actividades predecesoras.",StopSign!)
		Return -1
	Case 0
		ls_msj+='*Estado sin actividades predecesoras ~n'
End Choose
////-------------------------------------------------------------------------------------------------
// Retrieve a los procesos predecesoras de la tabla 'mu_pre_oper'
ll_resultado = dw_proceso_precede.Retrieve(al_estado, il_tipoprod)
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de las operaciones predecesoras.",StopSign!)
		Return -1
	Case 0
		ls_msj+='*Estado sin operaciones predecesoras ~n'
End Choose
////-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
il_estado = dw_general.GetItemNumber(1,'co_estado')//al_estado
//-------------------------------------------------------------------------------------------------
//dw_general.of_color( 'co_tipoprod', 0)
//dw_general.Modify("co_tipoprod.Protect='1'")
//dw_general.Modify("co_tipoprod.Edit.DisplayOnly=Yes")
dw_general.SetItem(1,"co_tipoprod", il_tipoprod ) 

of_redraw(True)
If Not ib_save Then
	MessageBox("Estado Nro. "+String(il_estado),'Estado cargado!~n'+ls_msj,Information!)
Else
	ib_save=False
End If
ib_reg=true
Return 1
end function

on w_m_est_muestras2.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_estado_muestras" then this.MenuID = create m_estado_muestras
this.dw_general=create dw_general
this.dw_proceso_precede=create dw_proceso_precede
this.dw_actividad_precede=create dw_actividad_precede
this.gb_act_prec=create gb_act_prec
this.gb_estado=create gb_estado
this.gb_proc_prec=create gb_proc_prec
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_general
this.Control[iCurrent+2]=this.dw_proceso_precede
this.Control[iCurrent+3]=this.dw_actividad_precede
this.Control[iCurrent+4]=this.gb_act_prec
this.Control[iCurrent+5]=this.gb_estado
this.Control[iCurrent+6]=this.gb_proc_prec
end on

on w_m_est_muestras2.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_general)
destroy(this.dw_proceso_precede)
destroy(this.dw_actividad_precede)
destroy(this.gb_act_prec)
destroy(this.gb_estado)
destroy(this.gb_proc_prec)
end on

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

event key;call super::key;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Noviembre de 2004.H:09:22
---------------------------------------------------
Uso del ctrl, keyflags=2
---------------------------------------------------*/
IF keyflags = 2 THEN // Keyflags para el 'Ctrl'
	Choose Case Key
		Case Key1!			
			dw_general.SetFocus()
		Case Key2!			
			dw_actividad_precede.SetFocus()
		Case Key3!			
			dw_proceso_precede.SetFocus()				
	End Choose
End If
end event

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Noviembre de 2004.H:12:40
---------------------------------------------------
---------------------------------------------------*/
of_carga_objtr()
of_carga_dddw()
//-------------------------------------------------
end event

event ue_find;call super::ue_find;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Noviembre de 2004.H:15:41
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lou_param
//-------------------------------------------------
Open(w_opc_estado_muestras)

lou_param = Message.PowerObjectParm

If IsValid(lou_param) Then	
	of_redraw(False)
	il_tipoprod = 10 //lou_param.il_vector[2]
	of_carga_dddw( )

	of_buscar(lou_param.il_vector[1])	
	dw_general.SetItem(1,'co_tipoprod', il_tipoprod)
	
	is_where_busqueda=lou_param.is_vector[1]
//Else //Opcion Cancelar de la ventana de b$$HEX1$$fa00$$ENDHEX$$squeda...
//	MessageBox('Error','Error en los datos devueltos en la b$$HEX1$$fa00$$ENDHEX$$squeda.',StopSign!)
End If
//---------------------------------------------------
end event

event ue_save;call super::ue_save;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Noviembre de 2004.H:10:24
---------------------------------------------------
Guardar datos del estado
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
of_ok_estado()
//***********************************************
il_estado   = dw_general.GetItemNumber(1,"co_estado")
il_tipoprod = dw_general.GetItemNumber(1,"co_tipoprod")
MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!", "El estado ~'"+String(il_estado)+"~' se registr$$HEX2$$f3002000$$ENDHEX$$satisfactoriamente.")
ib_cambios=False
ib_save=True
of_buscar(il_estado)

//---------------------------------------------------------------------------
end event

type dw_general from u_dw_application within w_m_est_muestras2
integer x = 146
integer y = 160
integer width = 3182
integer height = 160
string dataobject = "d_m_estado_muestra2"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 02 de Noviembre de 2004.H:10:54
---------------------------------------------------
---------------------------------------------------*/
gb_estado.of_color(True)
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 02 de Noviembre de 2004.H:10:57
---------------------------------------------------
---------------------------------------------------*/
gb_estado.of_color(False)
end event

event ue_deleterow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 02 de Noviembre de 2004.H:10:58
---------------------------------------------------
Overwrite!
---------------------------------------------------*/
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 02 de Noviembre de 2004.H:18:16
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
il_estado=0
il_tipoprod=10 
Parent.title="Registro de Estados de Muestra."
Call Super::ue_insertrow
This.SetItem(1,'co_estado',il_estado)
This.SetItem(1,'co_tipoprod',il_tipoprod)
//This.of_color( 'co_tipoprod', 1)
//This.Modify("co_tipoprod.Protect='0'")
This.SetColumn('de_estado')

ib_reg=false


end event

event sqlpreview;call super::sqlpreview;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 02 de Noviembre de 2004.H:11:06
---------------------------------------------------
---------------------------------------------------*/

end event

event itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 02 de Noviembre de 2004.H:15:00
---------------------------------------------------
---------------------------------------------------*/
If dwo.name = 'de_estado' Then		
		If Trim(Data)='' AND Not IsNull(Data) Then
			MessageBox('Advertencia','Texto de la descripci$$HEX1$$f300$$ENDHEX$$n del estado no es v$$HEX1$$e100$$ENDHEX$$lido.S$$HEX1$$f300$$ENDHEX$$lo hay espacios en blanco',StopSign!)
			Return 1
		End If
		If This.of_validarcadena(Data)<>1 Then 
			Return 1
		End If	
End If
IF dwo.name = 'co_tipoprod' Then		
	il_tipoprod = Long(data)
	of_carga_dddw( )
	of_buscar(il_estado)
END IF
//--------------------------------------------------------------
ib_cambios = True
end event

event itemerror;call super::itemerror;If dwo.name='de_estado' Then
		Return 1	
End If
end event

type dw_proceso_precede from u_dw_application within w_m_est_muestras2
integer x = 1755
integer y = 544
integer width = 1627
integer height = 1192
integer taborder = 30
string dataobject = "d_mu_prec_oper_x_tipoprod"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Noviembre de 2004.H:08:58
---------------------------------------------------
---------------------------------------------------*/
Long ll_i
//-------------------------------------------------
If dw_general.Rowcount()<=0 Then
	MessageBox("Advertencia!","Debe especificar el estado para la muestra.",StopSign!)
	Return
End If
//-------------------------------------------------
Super::Event ue_insertRow()
ll_i = This.GetRow()
This.SetItem(ll_i,"co_estado",il_estado)
This.SetItem(ll_i,"co_tipoprod",il_tipoprod)
This.SetColumn('co_operacion')
This.SetItemStatus(ll_i,0,Primary!,New!)

end event

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Noviembre de 2004.H:09:42
---------------------------------------------------
---------------------------------------------------*/
gb_proc_prec.of_color(True)
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Noviembre de 2004.H:09:42
---------------------------------------------------
---------------------------------------------------*/
gb_proc_prec.of_color(False)
end event

event itemchanged;/*-------------------------------------------------
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
	ll_pos=idc_operacion.Find('co_operacion='+Data,1,idc_operacion.RowCount())	
	ll_estado_operacion = idc_operacion.GetItemNumber(ll_pos,'co_estado')
	If il_estado = ll_estado_operacion then
		MessageBox("Advertencia!","El estado actual del registro y el estado de $$HEX1$$e900$$ENDHEX$$sta operaci$$HEX1$$f300$$ENDHEX$$n son el mismo",StopSign!)
		//Setitem(row,'de_operacion','')
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

type dw_actividad_precede from u_dw_application within w_m_est_muestras2
integer x = 73
integer y = 544
integer width = 1609
integer height = 1184
integer taborder = 20
string dataobject = "d_mu_prec_activ"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Noviembre de 2004.H:08:56
---------------------------------------------------
---------------------------------------------------*/
gb_act_prec.of_color(True)
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Noviembre de 2004.H:08:56
---------------------------------------------------
---------------------------------------------------*/
gb_act_prec.of_color(False)
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Noviembre de 2004.H:08:58
---------------------------------------------------
---------------------------------------------------*/
Long ll_i
//-------------------------------------------------
If dw_general.Rowcount()<=0 Then
	MessageBox("Advertencia!","Debe especificar el estado para la muestra.",StopSign!)
	Return
End If
//-------------------------------------------------
Super::Event ue_insertRow()
ll_i = This.GetRow()
This.SetItem(ll_i,"co_estado",il_estado)
This.SetColumn('id_actividad')
This.SetItemStatus(ll_i,0,Primary!,New!)

end event

event itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Noviembre de 2004.H:09:05
---------------------------------------------------
---------------------------------------------------*/
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
		MessageBox("Advertencia!","La actividad predecesora ya est$$HEX2$$e1002000$$ENDHEX$$seleccionada.",StopSign!)
		//Setitem(row,'de_actividad','')
		Return 2
	End If
	ll_pos=idc_actividad.Find('id_actividad='+Data,1,idc_actividad.RowCount())
	ll_estado_actividad = idc_actividad.GetItemNumber(ll_pos,'co_estado')
	If il_estado = ll_estado_actividad then
		MessageBox("Advertencia!","El estado actual del registro y el estado de $$HEX1$$e900$$ENDHEX$$sta actividad son el mismo",StopSign!)
		//Setitem(row,'de_actividad','')
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

type gb_act_prec from u_gb_base within w_m_est_muestras2
integer x = 37
integer y = 480
integer width = 1673
integer height = 1280
integer taborder = 0
string text = "Actividad Predecesora (Ctrl+2)"
end type

type gb_estado from u_gb_base within w_m_est_muestras2
integer x = 37
integer y = 64
integer width = 3365
integer height = 352
integer taborder = 0
string text = "Registro de Estado (Ctrl+1)"
end type

type gb_proc_prec from u_gb_base within w_m_est_muestras2
integer x = 1719
integer y = 480
integer width = 1682
integer height = 1280
integer taborder = 0
string text = "Proceso Predecesor (Ctrl 3)"
end type

