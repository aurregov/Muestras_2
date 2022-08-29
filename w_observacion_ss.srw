HA$PBExportHeader$w_observacion_ss.srw
$PBExportComments$Para el registro de la observacion de las solicitudes de servicio
forward
global type w_observacion_ss from w_response
end type
type st_1 from statictext within w_observacion_ss
end type
type mle_observacion from multilineedit within w_observacion_ss
end type
type cb_cancelar from commandbutton within w_observacion_ss
end type
type cb_aceptar from commandbutton within w_observacion_ss
end type
type dw_complemento from u_dw_application within w_observacion_ss
end type
type dw_observacion from u_dw_application within w_observacion_ss
end type
type gb_1 from groupbox within w_observacion_ss
end type
end forward

global type w_observacion_ss from w_response
integer x = 32
integer y = 32
integer width = 4101
integer height = 2020
string title = "Solicitudes de servicio de la orden"
st_1 st_1
mle_observacion mle_observacion
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
dw_complemento dw_complemento
dw_observacion dw_observacion
gb_1 gb_1
end type
global w_observacion_ss w_observacion_ss

type variables
n_cst_param 	io_param
end variables

forward prototypes
public function integer of_recurperar ()
public function integer of_borrar_blancos ()
end prototypes

public function integer of_recurperar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 10 de Agosto de 2005 HORA 08:37:08:328
// 
// Recupera la informaci$$HEX1$$f300$$ENDHEX$$n de las observaciones existentes y la complementa
// con las que deberian tener, estas al final se borran en caso de que no se
// ingrese informaci$$HEX1$$f300$$ENDHEX$$n
//////////////////////////////////////////////////////////////////////////
long i,ll_tot,ll_pos,ll_sol_serv,ll_actividad,ll_color,ll_fila,ll_consec
String ls_actividad, ls_color_cli,ls_color_hilaza

ll_tot=dw_observacion.Retrieve(io_param.il_vector[1])

If ll_tot<0 Then
	MessageBox("Advertencia!","Error recuperando observaciones.",StopSign!)
	Return -1
End If

ll_tot=dw_complemento.Retrieve(io_param.il_vector[1])

If ll_tot<0 Then
	MessageBox("Advertencia!","Error recuperando observaciones.",StopSign!)
	Return -1
End If

For i=1 To ll_tot
	ll_consec=dw_complemento.GetItemNumber(i,"consec")
	ll_pos=dw_observacion.Find("consec="+String(ll_consec),&
	1,dw_observacion.RowCount())
	
	If ll_pos=0 Then
		ll_sol_serv=dw_complemento.GetItemNumber(i,"nu_sol_serv")
		ll_actividad=dw_complemento.GetItemNumber(i,"id_actividad")
		ll_color    =dw_complemento.GetItemNumber(i,"co_color"    )
		ls_actividad=dw_complemento.GetItemString(i,"de_actividad")
		ls_color_cli=dw_complemento.GetItemString(i,"color_cli")
		ls_color_hilaza=dw_complemento.GetItemString(i,"color_hilaza")
		
		ll_fila=dw_observacion.InsertRow(0)
		dw_observacion.SetItem(ll_fila,"nu_orden",io_param.il_vector[1])
		dw_observacion.SetItem(ll_fila,"consec",ll_consec)
		dw_observacion.SetItem(ll_fila,"id_actividad",ll_actividad)
		dw_observacion.SetItem(ll_fila,"co_color",ll_color)
		dw_observacion.SetItem(ll_fila,"de_actividad",ls_actividad)
		dw_observacion.SetItem(ll_fila,"color_cli",ls_color_cli)
		dw_observacion.SetItem(ll_fila,"color_hilaza",ls_color_hilaza)
	End If
Next


Return 1

end function

public function integer of_borrar_blancos ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 10 de Agosto de 2005 HORA 10:31:34:843
// 
// Borra las filas que no tiene observaciones
//////////////////////////////////////////////////////////////////////////
long ll_tot,i
String ls_observacion

i=1

do while (i<=dw_observacion.RowCount())
	ls_observacion=dw_observacion.GetItemString(i,"observacion")
	If trim(ls_observacion)="" Then
		dw_observacion.DeleteRow(i)
		i --
	End If
	i ++
loop




Return 1

end function

on w_observacion_ss.create
int iCurrent
call super::create
this.st_1=create st_1
this.mle_observacion=create mle_observacion
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.dw_complemento=create dw_complemento
this.dw_observacion=create dw_observacion
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.mle_observacion
this.Control[iCurrent+3]=this.cb_cancelar
this.Control[iCurrent+4]=this.cb_aceptar
this.Control[iCurrent+5]=this.dw_complemento
this.Control[iCurrent+6]=this.dw_observacion
this.Control[iCurrent+7]=this.gb_1
end on

on w_observacion_ss.destroy
call super::destroy
destroy(this.st_1)
destroy(this.mle_observacion)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.dw_complemento)
destroy(this.dw_observacion)
destroy(this.gb_1)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Martes 09 de Agosto de 2005 HORA 17:43:54:781
// 
// Se toma la orden y se muestran las ss tanto las que tienen observacion
// como las que no.
//////////////////////////////////////////////////////////////////////////


io_param=message.PowerObjectParm

dw_complemento.of_conexion(n_cst_application.itr_appl,True)
dw_observacion.of_conexion(n_cst_application.itr_appl,True)

of_recurperar( )


end event

type st_1 from statictext within w_observacion_ss
integer x = 78
integer y = 1276
integer width = 1088
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Haga doble click para ver la obsrvaci$$HEX1$$f300$$ENDHEX$$n completa"
boolean focusrectangle = false
end type

type mle_observacion from multilineedit within w_observacion_ss
integer x = 73
integer y = 1352
integer width = 3895
integer height = 372
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean vscrollbar = true
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_cancelar from commandbutton within w_observacion_ss
integer x = 1701
integer y = 1804
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
end type

event clicked;close(Parent)
end event

type cb_aceptar from commandbutton within w_observacion_ss
integer x = 1344
integer y = 1804
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;If dw_observacion.AcceptText()<>1 Then
	MessageBox("Advertencia!","Hay observaciones no v$$HEX1$$e100$$ENDHEX$$lidas",StopSign!)
	Return
End If

of_borrar_blancos()

If dw_observacion.Update(True,False)<>1 Then
	RollBack using n_cst_application.itr_appl;
	Return
End If

Commit Using n_cst_application.itr_appl;

Close(Parent)
end event

type dw_complemento from u_dw_application within w_observacion_ss
boolean visible = false
integer x = 50
integer y = 1788
integer width = 718
integer height = 152
integer taborder = 0
string dataobject = "d_observacion_ss_complemento"
end type

type dw_observacion from u_dw_application within w_observacion_ss
integer x = 73
integer y = 68
integer width = 3895
integer height = 1144
string dataobject = "d_mu_soli_serv"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 10 de Agosto de 2005 HORA 09:04:46:218
// 
// Se muestra el detalle de la observacion en la parte inferior
//////////////////////////////////////////////////////////////////////////
String ls_observacion

If row<=0 Then
	Return
End If

ls_observacion=GetItemString(row,"observacion")

mle_observacion.text=ls_observacion


end event

event rowfocuschanged;call super::rowfocuschanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 10 de Agosto de 2005 HORA 09:10:36:296
// 
// Se resetea el texto que se muestra en la parte inferior
//////////////////////////////////////////////////////////////////////////


mle_observacion.text=""


end event

event getfocus;//
end event

event sqlpreview;call super::sqlpreview;//MessageBox("Advertencia!",sqlsyntax)
	

end event

type gb_1 from groupbox within w_observacion_ss
integer x = 18
integer y = 8
integer width = 4018
integer height = 1772
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Observaciones de las solicitudes de servicio de la orden"
end type

