HA$PBExportHeader$w_cambio_condicion_orden.srw
$PBExportComments$Para cambiar la condicion de la orden
forward
global type w_cambio_condicion_orden from w_response
end type
type dw_sp_mov from u_dw_application within w_cambio_condicion_orden
end type
type cb_2 from u_cb_application within w_cambio_condicion_orden
end type
type cb_1 from u_cb_application within w_cambio_condicion_orden
end type
type dw_movimiento from u_dw_application within w_cambio_condicion_orden
end type
type dw_detalle from u_dw_application within w_cambio_condicion_orden
end type
type dw_orden from u_dw_application within w_cambio_condicion_orden
end type
type gb_1 from groupbox within w_cambio_condicion_orden
end type
type gb_2 from groupbox within w_cambio_condicion_orden
end type
type gb_3 from groupbox within w_cambio_condicion_orden
end type
end forward

global type w_cambio_condicion_orden from w_response
integer width = 2898
integer height = 1564
string title = "Cambio de condici$$HEX1$$f300$$ENDHEX$$n de la orden"
dw_sp_mov dw_sp_mov
cb_2 cb_2
cb_1 cb_1
dw_movimiento dw_movimiento
dw_detalle dw_detalle
dw_orden dw_orden
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_cambio_condicion_orden w_cambio_condicion_orden

type variables
n_cst_param io_param
end variables

forward prototypes
public function integer of_mover ()
public function integer of_recuperardetalle ()
public function integer of_recuperar ()
end prototypes

public function integer of_mover ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 02 de Febrero de 2005 HORA 14:41:55:390
// 
// 
//////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////
// Verifica que tenga la info adecuada
// 
//////////////////////////////////////////////////////////////////////////

long ll_condicion, ll_res,ll_orden

String ls_tecnico


If dw_movimiento.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos para el movimiento.",StopSign!)
	Return -1
End If

If Not dw_movimiento.of_completedata( ) Then
	Return -1
End If

ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Est$$HEX2$$e1002000$$ENDHEX$$seguro de mover la orden ?",Question!,YesNo!,2)

If ll_res<>1 Then
	Return 1
End If
ll_condicion=dw_movimiento.GetItemNumber(1,"condicion")
ls_tecnico=dw_movimiento.GetItemString(1,"co_ctecnico")

ll_orden=io_param.il_vector[1]

ll_res=dw_sp_mov.Retrieve(ll_orden,ll_condicion,ls_tecnico)

If ll_res<=0 Then
	Return -1
End If

ll_res=dw_sp_mov.GetItemNumber(1,1)

If ll_res<>1 Then
	Return -1
End If

Return 1


Return 1
end function

public function integer of_recuperardetalle ();long ll_tot

ll_tot=dw_detalle.Retrieve(io_param.il_vector[1] )

If ll_tot<=0 Then
	Return ll_tot
End If


Return 1



Return 1
end function

public function integer of_recuperar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 02 de Febrero de 2005 HORA 14:04:08:078
// 
// Carga la informaci$$HEX1$$f300$$ENDHEX$$n de la orden y los movimientos que ha tenido
//////////////////////////////////////////////////////////////////////////
long ll_tot

ll_tot=dw_orden.Retrieve(io_param.il_vector[1] )

If ll_tot<=0 Then
	Return ll_tot
End If

of_recuperarDetalle()


Return 1
end function

on w_cambio_condicion_orden.create
int iCurrent
call super::create
this.dw_sp_mov=create dw_sp_mov
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_movimiento=create dw_movimiento
this.dw_detalle=create dw_detalle
this.dw_orden=create dw_orden
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_sp_mov
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.dw_movimiento
this.Control[iCurrent+5]=this.dw_detalle
this.Control[iCurrent+6]=this.dw_orden
this.Control[iCurrent+7]=this.gb_1
this.Control[iCurrent+8]=this.gb_2
this.Control[iCurrent+9]=this.gb_3
end on

on w_cambio_condicion_orden.destroy
call super::destroy
destroy(this.dw_sp_mov)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_movimiento)
destroy(this.dw_detalle)
destroy(this.dw_orden)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 02 de Febrero de 2005 HORA 14:01:13:375
// 
// 
//////////////////////////////////////////////////////////////////////////



long ll_res


io_param=message.powerObjectParm

If Not IsValid(io_param) Then
	Close(This)
End If

dw_orden.SetTransObject(n_cst_application.itr_appl)
dw_detalle.SetTransObject(n_cst_application.itr_appl)
dw_movimiento.SetTransObject(n_cst_application.itr_appl)
dw_sp_mov.SetTransObject(n_cst_application.itr_appl)

of_recuperar()

dw_movimiento.InsertRow(0)




end event

type dw_sp_mov from u_dw_application within w_cambio_condicion_orden
boolean visible = false
integer x = 151
integer y = 1296
integer width = 311
integer height = 152
integer taborder = 0
string dataobject = "d_sp_mu_est_orden"
boolean vscrollbar = false
boolean border = true
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_2 from u_cb_application within w_cambio_condicion_orden
integer x = 1253
integer y = 1316
integer width = 352
integer taborder = 30
string text = "&Cerrar"
end type

event clicked;call super::clicked;Close(Parent)
end event

type cb_1 from u_cb_application within w_cambio_condicion_orden
integer x = 2030
integer y = 424
integer width = 352
integer taborder = 20
string text = "&Mover"
end type

event clicked;call super::clicked;

If of_mover()<>1 Then
	RollBack using n_cst_application.itr_appl;
End If

Commit using n_cst_application.itr_appl;

of_recuperarDetalle()
end event

type dw_movimiento from u_dw_application within w_cambio_condicion_orden
integer x = 50
integer y = 388
integer width = 1591
integer height = 180
string dataobject = "d_ext_mov_orden"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;//
end event

type dw_detalle from u_dw_application within w_cambio_condicion_orden
integer x = 50
integer y = 720
integer width = 2706
integer height = 512
integer taborder = 0
string dataobject = "d_detalle_mov_orden"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;//
end event

type dw_orden from u_dw_application within w_cambio_condicion_orden
integer x = 50
integer y = 72
integer width = 2725
integer height = 212
integer taborder = 0
string dataobject = "d_datos_orden_mov"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;//
end event

type gb_1 from groupbox within w_cambio_condicion_orden
integer x = 32
integer y = 20
integer width = 2793
integer height = 288
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Datos de la orden"
end type

type gb_2 from groupbox within w_cambio_condicion_orden
integer x = 32
integer y = 636
integer width = 2793
integer height = 632
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle de movimientos"
end type

type gb_3 from groupbox within w_cambio_condicion_orden
integer x = 32
integer y = 324
integer width = 2793
integer height = 280
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Movimiento"
end type

