HA$PBExportHeader$w_cambio_codigo_color.srw
$PBExportComments$Para cambiar el c$$HEX1$$f300$$ENDHEX$$digo de un color en una muestra
forward
global type w_cambio_codigo_color from w_response
end type
type dw_verif_color from u_dw_application within w_cambio_codigo_color
end type
type cb_2 from u_cb_application within w_cambio_codigo_color
end type
type cb_cambiar from u_cb_application within w_cambio_codigo_color
end type
type dw_colores from u_dw_application within w_cambio_codigo_color
end type
type gb_1 from groupbox within w_cambio_codigo_color
end type
type dw_sp_cambio from u_dw_application within w_cambio_codigo_color
end type
end forward

global type w_cambio_codigo_color from w_response
integer width = 2254
integer height = 652
string title = "Cambio de c$$HEX1$$f300$$ENDHEX$$digo de color"
dw_verif_color dw_verif_color
cb_2 cb_2
cb_cambiar cb_cambiar
dw_colores dw_colores
gb_1 gb_1
dw_sp_cambio dw_sp_cambio
end type
global w_cambio_codigo_color w_cambio_codigo_color

type variables
n_cst_param io_param
end variables

on w_cambio_codigo_color.create
int iCurrent
call super::create
this.dw_verif_color=create dw_verif_color
this.cb_2=create cb_2
this.cb_cambiar=create cb_cambiar
this.dw_colores=create dw_colores
this.gb_1=create gb_1
this.dw_sp_cambio=create dw_sp_cambio
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_verif_color
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_cambiar
this.Control[iCurrent+4]=this.dw_colores
this.Control[iCurrent+5]=this.gb_1
this.Control[iCurrent+6]=this.dw_sp_cambio
end on

on w_cambio_codigo_color.destroy
call super::destroy
destroy(this.dw_verif_color)
destroy(this.cb_2)
destroy(this.cb_cambiar)
destroy(this.dw_colores)
destroy(this.gb_1)
destroy(this.dw_sp_cambio)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Martes 08 de Febrero de 2005 HORA 08:09:47:843
// 
// 
//////////////////////////////////////////////////////////////////////////

io_param=message.PowerObjectParm

If Not IsValid(io_param) Then
	Close(This)
	Return
End If


dw_verif_color.SetTransObject(n_cst_application.itr_appl)

dw_colores.InsertRow(0)

dw_sp_cambio.SetTransObject(n_cst_application.itr_appl)
end event

type dw_verif_color from u_dw_application within w_cambio_codigo_color
boolean visible = false
integer x = 87
integer y = 420
integer width = 389
integer height = 128
integer taborder = 0
string dataobject = "d_verif_cambio_col"
boolean vscrollbar = false
end type

event getfocus;//
end event

type cb_2 from u_cb_application within w_cambio_codigo_color
integer x = 1111
integer y = 424
integer taborder = 30
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;call super::clicked;close(Parent)
end event

type cb_cambiar from u_cb_application within w_cambio_codigo_color
integer x = 809
integer y = 424
integer taborder = 20
string text = "&Aceptar"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Lunes 07 de Febrero de 2005 HORA 17:40:15:734
// 
// Cambio de c$$HEX1$$f300$$ENDHEX$$digo de color de muestra
//////////////////////////////////////////////////////////////////////////


If dw_colores.AcceptText()<>1 Then
	MessageBox("Advertencia!","Colores no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If

If Not dw_colores.of_completedata( ) Then
	Return
End If

Long ll_color,ll_color1

ll_color=dw_colores.GetItemNumber(1,"co_color")

If ll_color<0 /*Or ll_color>9999 */ Then
	MessageBox("Advertencia!","Color no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
	Return
End IF


ll_color1=dw_colores.GetItemNumber(1,"co_color1")

If ll_color1<0 /*Or ll_color1>9999 */Then
	MessageBox("Advertencia!","Color NUEVO no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
	Return
End IF

If ll_color=ll_color1 Then
	MessageBox("Advertencia!","Los colores no pueden ser iguales.",StopSign!)
	Return
End If

//////////////////////////////////////////////////////////////////////////
// Se verifica que el color exista, y que el color nuevo no exista
// 
//////////////////////////////////////////////////////////////////////////
long ll_tot,ll_pos,ll_res

ll_tot=dw_verif_color.Retrieve(io_param.il_vector[1], /*fabrica*/&
                               io_param.il_vector[2],/*linea*/&
										 io_param.il_vector[3],/*muestra*/&
										 io_param.il_vector[4],/*talla*/&
										 ll_color, /*color actual*/&
										 ll_color1) /*color nuevo*/


If ll_tot<=0 Then
	MessageBox("Advertencia!","Colores no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If

ll_pos=dw_verif_color.Find("co_color="+String(ll_color),1,ll_tot)

If ll_pos<=0 Then
	MessageBox("Advertencia!","El color indicado no existe en la meustra.",StopSign!)
	Return
End If

ll_pos=dw_verif_color.Find("co_color="+String(ll_color1),1,ll_tot)

If ll_pos>0 Then
	MessageBox("Advertencia!","El color NUEVO ya existe en la muesta.",StopSign!)
	Return
End If

//////////////////////////////////////////////////////////////////////////
// Se ejecuta el procedimiento que hace el cambio
// 
//////////////////////////////////////////////////////////////////////////

ll_tot=dw_sp_cambio.Retrieve(	io_param.il_vector[1], /*fabrica*/&
                             	io_param.il_vector[2],/*linea*/&
										io_param.il_vector[3],/*muestra*/&
										io_param.il_vector[4],/*talla*/&
										ll_color, /*color actual*/&
										ll_color1) /*color nuevo*/

If ll_tot<=0 Then
	RollBack using n_cst_application.itr_appl;
	Return 
End If

ll_pos=dw_sp_cambio.GetItemNumber(1,1)

If ll_pos<>1 Then
	RollBack using n_cst_application.itr_appl;
	Return 
End If
	
Commit using n_cst_application.itr_appl;


//ll_res=MessageBox("Advertencia!"," Se cambio adecuadamente el color,~n~r"+&
//"$$HEX2$$bf002000$$ENDHEX$$Desea cambiar otro Color ?",Question!,YesNo!,2)
//If ll_res<>1 Then
CloseWithReturn(Parent,"OK")
//	Return
//End If
//
//dw_colores.Reset()
//dw_colores.InsertRow(0)
//dw_colores.setFocus()
//	
end event

type dw_colores from u_dw_application within w_cambio_codigo_color
integer x = 133
integer y = 108
integer width = 1897
integer height = 184
string dataobject = "d_ext_cambio_color"
boolean vscrollbar = false
end type

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Martes 08 de Febrero de 2005 HORA 09:28:03:875
// 
// 
//////////////////////////////////////////////////////////////////////////


If row<=0 Then
	Return
End If


n_cst_param lo_param
If dwo.name="co_color1" then
	lo_param.il_vector[1]=io_param.il_vector[1]
	lo_param.il_vector[2]=io_param.il_vector[2]

	OpenWithParm(w_bus_m_colores,lo_param)

	lo_param=Message.PowerObjectParm

	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
		AcceptText()
	End If


End If
end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Martes 08 de Febrero de 2005 HORA 09:26:18:140
// 
// 
//////////////////////////////////////////////////////////////////////////
Long ll_color,ll_res
n_cst_comun lo_comun

If dwo.name="co_color1" Then
	ll_color=Long(Data)
	ll_res=lo_comun.of_nombrecolor(io_param.il_vector[1],/*fab*/&
	                               io_param.il_vector[2],/*lin*/&
											 ll_color,n_cst_application.itr_appl)
	If ll_res<>1 Then
		MessageBox("Advertencia!","Color NUEVO no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_color",lo_comun.of_getString(1))
End If
end event

event getfocus;//
end event

type gb_1 from groupbox within w_cambio_codigo_color
integer x = 64
integer y = 24
integer width = 2085
integer height = 352
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cambio de c$$HEX1$$f300$$ENDHEX$$digo de color"
end type

type dw_sp_cambio from u_dw_application within w_cambio_codigo_color
boolean visible = false
integer x = 1463
integer y = 412
integer width = 389
integer height = 128
integer taborder = 0
string dataobject = "d_sp_mu_cambio_col"
boolean vscrollbar = false
end type

event getfocus;//
end event

