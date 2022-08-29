HA$PBExportHeader$w_bus_bordado_ord.srw
$PBExportComments$Objeto Ventana para la b$$HEX1$$fa00$$ENDHEX$$squeda de los bordados en las solicitudes de servicio.
forward
global type w_bus_bordado_ord from w_response
end type
type uo_bordado from u_cst_reg_bordado_ss within w_bus_bordado_ord
end type
type cb_grabar from u_cb_application within w_bus_bordado_ord
end type
type cb_nuevo from u_cb_application within w_bus_bordado_ord
end type
type cb_cancelar from u_cb_application within w_bus_bordado_ord
end type
type cb_aceptar from u_cb_application within w_bus_bordado_ord
end type
end forward

global type w_bus_bordado_ord from w_response
string tag = "B$$HEX1$$fa00$$ENDHEX$$squeda de Bordados"
integer width = 2309
integer height = 2096
string title = "B$$HEX1$$fa00$$ENDHEX$$squeda de Bordados"
uo_bordado uo_bordado
cb_grabar cb_grabar
cb_nuevo cb_nuevo
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
end type
global w_bus_bordado_ord w_bus_bordado_ord

on w_bus_bordado_ord.create
int iCurrent
call super::create
this.uo_bordado=create uo_bordado
this.cb_grabar=create cb_grabar
this.cb_nuevo=create cb_nuevo
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_bordado
this.Control[iCurrent+2]=this.cb_grabar
this.Control[iCurrent+3]=this.cb_nuevo
this.Control[iCurrent+4]=this.cb_cancelar
this.Control[iCurrent+5]=this.cb_aceptar
end on

on w_bus_bordado_ord.destroy
call super::destroy
destroy(this.uo_bordado)
destroy(this.cb_grabar)
destroy(this.cb_nuevo)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
end on

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:11:21
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lou_param
//---------------------------------------------------
If IsValid(Message.PowerObjectParm) Then
	lou_param=Message.PowerObjectParm
	If UpperBound(lou_param.is_vector)>=1 Then
		Title+=' | Actividad: '+Upper(lou_param.is_vector[1])
	End If	
End If
// Bloquea la modificacion del campo de activaci$$HEX1$$f300$$ENDHEX$$n
uo_bordado.of_set_activo(True)
uo_bordado.cb_buscar.Triggerevent(Clicked!)
//Filtra los resultados del dw para los que est$$HEX1$$e100$$ENDHEX$$n activos


end event

type uo_bordado from u_cst_reg_bordado_ss within w_bus_bordado_ord
integer x = 37
integer y = 32
integer width = 2267
integer height = 1824
integer taborder = 20
end type

on uo_bordado.destroy
call u_cst_reg_bordado_ss::destroy
end on

type cb_grabar from u_cb_application within w_bus_bordado_ord
integer x = 549
integer y = 1888
integer taborder = 40
string text = "&Guardar"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:12:11
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
uo_bordado.of_redraw(False)
If uo_bordado.Event ue_save()<>1 Then
	uo_bordado.of_redraw(True)
	Return
End If
uo_bordado.of_redraw(True)


end event

type cb_nuevo from u_cb_application within w_bus_bordado_ord
integer x = 219
integer y = 1888
integer taborder = 40
string text = "&Nuevo"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:12:11
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
uo_bordado.dw_bordado.TriggerEvent('ue_insertrow')

end event

type cb_cancelar from u_cb_application within w_bus_bordado_ord
integer x = 1792
integer y = 1888
integer taborder = 50
string text = "&Cancelar"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:12:21
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
Close(Parent)
end event

type cb_aceptar from u_cb_application within w_bus_bordado_ord
integer x = 1463
integer y = 1888
integer taborder = 40
string text = "&Aceptar"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:12:11
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lou_param
Long ll_bordado
//---------------------------------------------------
ll_bordado= uo_bordado.of_getid()
If ll_bordado<=0 Then
	MessageBox('Advertencia','Bordado no seleccionado',StopSign!)
	Return
End If
lou_param.il_vector[1] = ll_bordado
//----------------------------------------------------
CloseWithReturn(Parent,lou_param)
//----------------------------------------------------
end event

