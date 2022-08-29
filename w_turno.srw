HA$PBExportHeader$w_turno.srw
$PBExportComments$Ventana con la que interactuar$$HEX2$$e1002000$$ENDHEX$$el usuario para el registro y modificacion de los turnos/Horarios
forward
global type w_turno from w_sheet
end type
type st_horas from u_st_base within w_turno
end type
type dw_det_turno from u_dw_application within w_turno
end type
type dw_turno from u_dw_application within w_turno
end type
type gb_m_turno from u_gb_base within w_turno
end type
type gb_dt_turno from u_gb_base within w_turno
end type
type cb_aceptar from u_cb_application within w_turno
end type
type cb_cancel from u_cb_application within w_turno
end type
end forward

global type w_turno from w_sheet
string tag = "Mantenimiento de Horarios"
integer width = 1714
integer height = 1628
string title = "Mantenimiento de Horarios"
string menuname = "m_turno"
event ue_eliminar_turno ( )
st_horas st_horas
dw_det_turno dw_det_turno
dw_turno dw_turno
gb_m_turno gb_m_turno
gb_dt_turno gb_dt_turno
cb_aceptar cb_aceptar
cb_cancel cb_cancel
end type
global w_turno w_turno

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:15:31
---------------------------------------------------
---------------------------------------------------*/
Public:

	Long il_id_turno, il_itemerror=0
	Boolean ib_ret
	Boolean ib_cambios=False,ib_save
end variables

forward prototypes
public function integer of_buscar ()
public function integer of_guardar ()
public function integer of_carga_objtr ()
public function integer of_reset ()
public function integer of_ret_horas (long al_id_turno)
public function integer of_redraw (boolean ab_redraw)
public function integer of_horas_sem ()
public function integer of_verificar ()
public function integer of_error_turno ()
public function integer of_eliminar_turno ()
public function integer of_ok_turno ()
end prototypes

event ue_eliminar_turno();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:09:45
---------------------------------------------------
---------------------------------------------------*/
of_Redraw(False)
of_eliminar_turno()
dw_turno.InsertRow(0)
of_horas_sem()
of_Redraw(True)


end event

public function integer of_buscar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 14 de Octubre de 2004.H:17:05
---------------------------------------------------
---------------------------------------------------*/
Long ll_pos,ll_a
//---------------------------------------------------
If ib_cambios Then
	ll_a=MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
	If ll_a=2 Then
		Return -2
	End If
End If
ib_cambios=False
//---------------------------------------------------
of_redraw(false)
ib_ret=false
ll_pos = dw_turno.Retrieve(il_id_turno)
Choose Case ll_pos
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos del turno.",StopSign!)
		Return -1
	Case 0
		If MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","El c$$HEX1$$f300$$ENDHEX$$digo del turno no existe!.~nDesea crearlo como nuevo?",&
						Question!,YesNo!,1)=2 Then
			of_reset()
			dw_turno.InsertRow(0)			
			dw_turno.SetFocus()			
			dw_turno.SetColumn('id_turno')			
		Else
			of_reset()
			dw_turno.InsertRow(0)
			dw_turno.SetItem(1,'id_turno',il_id_turno)
			For ll_a=1 To 7
				ll_pos=dw_det_turno.InsertRow(0)
				dw_det_turno.SetItem(ll_pos,'id_turno',il_id_turno)
				dw_det_turno.SetItem(ll_pos,'dia',ll_a)
			Next			
		End If
	Case 1		
		ll_pos = dw_det_turno.Retrieve(il_id_turno)
		Choose Case ll_pos
			Case Is < 0 
				MessageBox("Advertencia!","Error recuperando horarios del turno.",StopSign!)		
				Return -1
			Case 0
				For ll_a=1 To 7
					ll_pos=dw_det_turno.InsertRow(0)
					dw_det_turno.SetItem(ll_pos,'id_turno',il_id_turno)
					dw_det_turno.SetItem(ll_pos,'dia',ll_a)
				Next
				MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","El turno no tiene ning$$HEX1$$fa00$$ENDHEX$$n dia con horario asignado!.",Information!)
			//Case 1				
		End Choose
		ib_ret=true
		of_redraw(True)
		If Not ib_save Then
			MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","El turno ha sido cargado!.",Information!)
		Else
			ib_save=False
		End If		
End Choose
of_horas_sem()
of_redraw(True)

Return 1

end function

public function integer of_guardar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:17:25
---------------------------------------------------
Guarda despues de verificar. Devuelve 1 si es exitoso
---------------------------------------------------*/
DateTime ldt_fecha
String ls_usuario,ls_instancia
//---------------------------------------------------
If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If
//---------------------------------------------------
ls_instancia = trim(ls_instancia)

If ib_ret Then
	dw_turno.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)
	dw_det_turno.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)	
End If
//---------------------------------------------------------------------------------
If dw_turno.Update(true,false)<>1 Then 
	of_error_turno()
	Return -1
End If

If dw_det_turno.Update(true,false)<>1 Then 
	of_error_turno()
	Return -1
End If
//---------------------------------------------------------------------------------
dw_turno.ResetUpdate()
dw_det_turno.ResetUpdate()

Return 1
end function

public function integer of_carga_objtr ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:14:48
---------------------------------------------------
Carga los obj. de transacci$$HEX1$$f300$$ENDHEX$$n
---------------------------------------------------*/
dw_turno.of_conexion(n_cst_application.itr_appl,True)
dw_det_turno.of_conexion(n_cst_application.itr_appl,True)

Return 1

end function

public function integer of_reset ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 14 de Octubre de 2004.H:14:35
---------------------------------------------------
---------------------------------------------------*/
dw_turno.Reset()
dw_det_turno.Reset()
Return 1
end function

public function integer of_ret_horas (long al_id_turno);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 14 de Octubre de 2004.H:17:05
---------------------------------------------------
---------------------------------------------------*/
il_id_turno = al_id_turno
Return of_buscar()
end function

public function integer of_redraw (boolean ab_redraw);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 14 de Octubre de 2004.H:17:56
---------------------------------------------------
---------------------------------------------------*/
dw_turno.SetRedraw(ab_redraw)
dw_det_turno.SetRedraw(ab_redraw)

Return 1
end function

public function integer of_horas_sem ();/*-------------------------------------------------

	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:11:25
---------------------------------------------------
---------------------------------------------------*/
If dw_det_turno.RowCount()>0 Then
	st_horas.Visible=True
	st_horas.Text = 'Horario Semanal: '+String(dw_det_turno.GetItemDecimal(1,'compute_horas'),'##.00')
Else 
	st_horas.Visible=False
End If

Return 1
end function

public function integer of_verificar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:15:26
---------------------------------------------------
Verificaci$$HEX1$$f300$$ENDHEX$$n de los datos antes de grabar
---------------------------------------------------*/
Long ll_pos
//-------------------------------------------------

If dw_turno.RowCount()<=0 /*OR dw_det_turno.RowCount()<=0*/ Then
	Return -1
End If
//--------------------------------------------
If dw_turno.AcceptText()<>1 Then
	//MessageBox("Advertencia!","Datos del encabezado del turno no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Trigger Event key(Key1!,2)
	Return -1
End If

If dw_det_turno.AcceptText()<>1 Then
	//MessageBox("Advertencia!","Datos de los horarios no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Trigger Event key(Key2!,2)
	Return -1
End If

If dw_turno.modifiedcount() + dw_det_turno.modifiedcount() <= 0 Then
	Return -1
End If

If Not dw_turno.of_completedata() Then
	Trigger Event key(Key1!,2)
	Return -1
End If

If Not dw_det_turno.of_completedata() Then
	Trigger Event key(Key2!,2)
	Return -1
End If

//***
If dw_det_turno.GetItemDecimal(1,'compute_horas')<=0 Then
		MessageBox("Advertencia!","La cantidad total de horas del turno debe ser mayor a cero.",StopSign!)
	Return -1
End If
//***

Return 1
end function

public function integer of_error_turno ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:15:40
---------------------------------------------------
Deshace los cambios hechos a la bd.
---------------------------------------------------*/
//************************************************
ROLLBACK USING n_cst_application.itr_appl;
//************************************************
Return 1
end function

public function integer of_eliminar_turno ();/*-------------------------------------------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:17:21
//-------------------------------------------------------------------------------------
Elimina el turno.
-------------------------------------------------------------------------------------*/
long ll_respuesta
//-------------------------------------------------------------------------------------
If dw_turno.RowCount()<1 Then
	Return -1
End If

If Not ib_ret Then
	MessageBox("Advertencia!","No puede eliminar un turno no registrado!.",StopSign!)
	Return -1
End If
//-------------------------------------------------------------------------------------
ll_respuesta = MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","$$HEX2$$bf002000$$ENDHEX$$Desea eliminar este turno y todos sus horarios ?",Question!,YesNo!,2)
If ll_respuesta<>1 Then
	Return -1
End If
//-------------------------------------------------------------------------------------
dw_det_turno.RowsDiscard(1, dw_det_turno.DeletedCount(), Delete!)
dw_det_turno.RowsMove(1,dw_det_turno.RowCount(),Primary!,dw_det_turno,1,Delete!)
dw_turno.DeleteRow(0)
//-------------------------------------------------------------------------------------
If dw_det_turno.Update()<>1 Then
	of_error_turno()
	Return -1
End If

If dw_turno.Update()<>1 Then
	of_error_turno()
	Return -1
End If

of_Reset()
of_ok_turno()

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Turno <"+String(il_id_turno)+"> ha sido eliminado exitosamente.")
Return 1
end function

public function integer of_ok_turno ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:15:40
---------------------------------------------------
Acepta los cambios hechos a la bd.
---------------------------------------------------*/
//*****************************************
COMMIT USING n_cst_application.itr_appl ;
//*****************************************
Return 1
end function

on w_turno.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_turno" then this.MenuID = create m_turno
this.st_horas=create st_horas
this.dw_det_turno=create dw_det_turno
this.dw_turno=create dw_turno
this.gb_m_turno=create gb_m_turno
this.gb_dt_turno=create gb_dt_turno
this.cb_aceptar=create cb_aceptar
this.cb_cancel=create cb_cancel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_horas
this.Control[iCurrent+2]=this.dw_det_turno
this.Control[iCurrent+3]=this.dw_turno
this.Control[iCurrent+4]=this.gb_m_turno
this.Control[iCurrent+5]=this.gb_dt_turno
this.Control[iCurrent+6]=this.cb_aceptar
this.Control[iCurrent+7]=this.cb_cancel
end on

on w_turno.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_horas)
destroy(this.dw_det_turno)
destroy(this.dw_turno)
destroy(this.gb_m_turno)
destroy(this.gb_dt_turno)
destroy(this.cb_aceptar)
destroy(this.cb_cancel)
end on

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 12 de Octubre de 2004.H:17:36
---------------------------------------------------
---------------------------------------------------*/
of_carga_objtr()
of_reset()
dw_turno.InsertRow(0)
end event

event ue_save;call super::ue_save;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:15:22
---------------------------------------------------
Evento guardar los datos del turno.
---------------------------------------------------*/
Long ll_nu_orden

If of_verificar()<>1 Then
	Return
End If

If of_guardar()<>1 Then
	of_Redraw(True)
	Return
End If

//Funci$$HEX1$$f300$$ENDHEX$$n que realiza el commit
of_ok_turno()

il_id_turno = dw_turno.GetItemNumber(1,"id_turno")
MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","El turno ~'"+String(il_id_turno)+"~' se registr$$HEX2$$f3002000$$ENDHEX$$satisfactoriamente.")
ib_cambios=False
ib_save=true
of_buscar()
of_Redraw(True)
//----------------------------------------------------------------
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

event key;call super::key;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:12:02
---------------------------------------------------
---------------------------------------------------*/
IF keyflags = 2 THEN 
	Choose Case Key
	Case Key1!		
		dw_turno.SetFocus()
	Case Key2!
		dw_det_turno.SetFocus()	
	End Choose
End If
end event

event ue_find;call super::ue_find;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:16:59
---------------------------------------------------
Funcion para invocar la ventana de busqueda para los
turnos
---------------------------------------------------*/
n_cst_param lo_param
//---------------------------------------------------
Open(w_opc_turno)
lo_param=Message.PowerObjectParm
If IsValid(lo_param) Then
	il_id_turno=lo_param.il_vector[1]
	of_buscar()
End If

end event

type st_horas from u_st_base within w_turno
boolean visible = false
integer x = 73
integer y = 1312
integer width = 622
integer height = 64
integer weight = 700
long textcolor = 134217729
string text = "Horario Semanal:"
end type

type dw_det_turno from u_dw_application within w_turno
integer x = 256
integer y = 480
integer width = 1207
integer height = 800
integer taborder = 20
string dataobject = "d_mu_dt_turno"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;call super::rowfocuschanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 14 de Octubre de 2004.H:14:36
---------------------------------------------------
---------------------------------------------------*/
//--------------------------------------------------------------------
If CurrentRow<=0 Then Return
//--------------------------------------------------------------------
of_horas_sem()
end event

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:08:35
---------------------------------------------------
---------------------------------------------------*/
gb_dt_turno.of_color(True)
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:08:35
---------------------------------------------------
---------------------------------------------------*/
gb_dt_turno.of_color(False)
of_horas_sem()
end event

event itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 14 de Octubre de 2004.H:15:23
---------------------------------------------------
---------------------------------------------------*/
Long ll_pos
Decimal{2} lde_sum
//---------------------------------------------------
If dwo.name='horas' Then
/* Se elimina esta validaci$$HEX1$$f300$$ENDHEX$$n de cantidad de horas semanales,
	ya que se necesita manejar horarios extendidos, grupos con
	varios integrantes pueden trabajar de las 6:00 a las 22:00,
	6 d$$HEX1$$ed00$$ENDHEX$$as a la semana */
//	lde_sum = (This.GetItemDecimal(1,'compute_horas') - This.GetItemDecimal(row,'horas'))+ Dec(Data)
//	If  ll_sum > 50 Then//Se valida que el n$$HEX1$$fa00$$ENDHEX$$mero total de horas semanales no sobrepase el l$$HEX1$$ed00$$ENDHEX$$mite de 50hrs/sem
//		MessageBox('Advertencia','El n$$HEX1$$fa00$$ENDHEX$$mero de horas semanales '+String(lde_sum)+' ha excedido el l$$HEX1$$ed00$$ENDHEX$$mite(50hrs./sem) .',StopSign!)
//		This.SetText(String(This.GetItemDecimal(row,'horas')))
//		Return 2
//	End If	
End If
//---------------------------------------------------
ib_cambios=True
//---------------------------------------------------

end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:08:12
---------------------------------------------------
OverWrite!
---------------------------------------------------*/
end event

event sqlpreview;call super::sqlpreview;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 4 de Octubre de 2004.H:17:23
---------------------------------------------------
---------------------------------------------------*/
//MessageBox('SQLPreview','SQLSYNTAX: ~n'+sqlsyntax+'~n#Fila: '+&
	//			String(row))
end event

event ue_deleterow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:10:23
---------------------------------------------------
Overwrite!
---------------------------------------------------*/

end event

event itemerror;call super::itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 06 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Integer li_null
String ls_col
//-------------------------------------------------
If dwo.name='horas' Then
	If Long(Data)=0 Then
		SetNull(li_null)
		ls_col=dwo.name
		This.SetItem(row,ls_col,li_null)
		Return 3
	End If	
End If
end event

type dw_turno from u_dw_application within w_turno
integer x = 73
integer y = 96
integer width = 1499
integer height = 192
string dataobject = "d_mu_m_turno"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 14 de Octubre de 2004.H:16:16
---------------------------------------------------
---------------------------------------------------*/
gb_m_turno.of_color(True)
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:08:35
---------------------------------------------------
---------------------------------------------------*/
gb_m_turno.of_color(False)
end event

event itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 14 de Octubre de 2004.H:14:30
---------------------------------------------------
---------------------------------------------------*/
If dwo.name = 'id_turno' Then	
	If of_ret_horas(Long(Data)) <> 1 Then
		Return 2
	End If	
	dw_turno.SetColumn('id_turno')	
End If
//---------------------------------------------------
If dwo.name = 'de_turno' Then
		If Trim(Data)='' AND Not IsNull(Data) Then
			MessageBox('Advertencia','Texto de la descripci$$HEX1$$f300$$ENDHEX$$n del turno no es v$$HEX1$$e100$$ENDHEX$$lido.S$$HEX1$$f300$$ENDHEX$$lo hay espacios en blanco',StopSign!)
			Return 1
		End If
		If This.of_validarcadena(Data)<>1 Then 
			Return 1
		End If	
		If IsNumber(String(GetItemNumber(1,'id_turno'))) Then
			ib_cambios=True	
		End If
End If
//---------------------------------------------------
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 14 de Octubre de 2004.H:17:12
---------------------------------------------------
Overwrite
---------------------------------------------------*/
end event

event sqlpreview;call super::sqlpreview;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 4 de Octubre de 2004.H:17:23
---------------------------------------------------
---------------------------------------------------*/
//MessageBox('SQLPreview','SQLSYNTAX: ~n'+sqlsyntax+'~n#Fila: '+&
//				String(row))
end event

event ue_deleterow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:17:52
---------------------------------------------------
Overwrite!
---------------------------------------------------*/

end event

event itemfocuschanged;call super::itemfocuschanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 06 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
//--------------------------------------------------------------------
If Row<=0 Then Return
//--------------------------------------------------------------------
If dwo.name='de_turno' AND Not ib_ret AND dw_det_turno.RowCount()<>7 Then
	dw_turno.SetColumn('id_turno')
End If
end event

event itemerror;call super::itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 06 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Integer li_null
String ls_col
//-------------------------------------------------
If dwo.name='id_turno' Then
	If Long(Data)=0 Then
		of_reset()
		dw_turno.InsertRow(0)
		dw_turno.SetFocus()			
		dw_turno.SetColumn('id_turno')
		of_horas_sem()
		ib_cambios=False
		Return 3
	Else
		Post SetItem(row,String(dwo.name),dw_turno.GetItemNumber(row,String(dwo.name)))
		//Return 1
	End If		

End If
//--------------------------------------------------
If dwo.name='de_turno' Then
		Return 1	
End If
end event

type gb_m_turno from u_gb_base within w_turno
integer x = 37
integer width = 1609
integer height = 352
integer taborder = 0
string text = "Turno (Ctrl+1)"
end type

type gb_dt_turno from u_gb_base within w_turno
integer x = 37
integer y = 416
integer width = 1609
integer height = 992
integer taborder = 0
string text = "Detalle Horas (Ctrl+2)"
end type

type cb_aceptar from u_cb_application within w_turno
integer x = 73
integer y = 1248
integer taborder = 0
string text = "&Aceptar"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 14 de Octubre de 2004.H:18:00
---------------------------------------------------
---------------------------------------------------*/
end event

type cb_cancel from u_cb_application within w_turno
integer x = 475
integer y = 1248
integer taborder = 0
string text = "&Cancel"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 14 de Octubre de 2004.H:18:02
---------------------------------------------------
---------------------------------------------------*/
Close(Parent)
end event

