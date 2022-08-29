HA$PBExportHeader$w_pedir_clave_reorden.srw
forward
global type w_pedir_clave_reorden from w_response
end type
type dw_dato from datawindow within w_pedir_clave_reorden
end type
type cb_2 from commandbutton within w_pedir_clave_reorden
end type
type cb_1 from commandbutton within w_pedir_clave_reorden
end type
end forward

global type w_pedir_clave_reorden from w_response
integer width = 1294
integer height = 448
string title = "Autorizacion Reorden"
boolean controlmenu = false
dw_dato dw_dato
cb_2 cb_2
cb_1 cb_1
end type
global w_pedir_clave_reorden w_pedir_clave_reorden

event open;call super::open;/*
	FACL - 2019//07/03 - SA60164 - Se crea ventana para pedir clave de Modificacion de Fechas Ordenes de Fabricacion de SIS
*/
dw_dato.InsertRow(0)
end event

on w_pedir_clave_reorden.create
int iCurrent
call super::create
this.dw_dato=create dw_dato
this.cb_2=create cb_2
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_dato
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_1
end on

on w_pedir_clave_reorden.destroy
call super::destroy
destroy(this.dw_dato)
destroy(this.cb_2)
destroy(this.cb_1)
end on

type dw_dato from datawindow within w_pedir_clave_reorden
integer x = 160
integer y = 60
integer width = 878
integer height = 116
integer taborder = 10
string title = "none"
string dataobject = "d_ff_clave_reorden_sis"
boolean border = false
boolean livescroll = true
end type

type cb_2 from commandbutton within w_pedir_clave_reorden
integer x = 622
integer y = 224
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancelar"
boolean cancel = true
end type

event clicked;CloseWithReturn( Parent, 0 )
end event

type cb_1 from commandbutton within w_pedir_clave_reorden
integer x = 165
integer y = 220
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
boolean default = true
end type

event clicked;

If dw_dato.AcceptText() <> 1 Then Return


Long ll_ret
String ls_clave, ls_clave_digitada
n_cst_comun lnvo_comun

ls_clave_digitada = Trim( dw_dato.GetItemString( 1, 'clave' ) )
// Se carga la clave para reordenar SIS
ll_ret=lnvo_comun.of_ValorConstante( "REORDENA_SIS",n_cst_application.itr_appl )
If ll_ret = 1 Then
	ls_clave = Trim( lnvo_comun.of_GetString(1) )
	If ls_clave = ls_clave_digitada Then
		CloseWithReturn( Parent, 1 )
	Else
		MessageBox( 'Advertencia' , 'La clave no es valida' )
	End If
Else
	CloseWithReturn( Parent, 0 )
End If




end event

