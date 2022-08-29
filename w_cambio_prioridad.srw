HA$PBExportHeader$w_cambio_prioridad.srw
forward
global type w_cambio_prioridad from w_sheet
end type
type dw_ordenes from u_dw_application within w_cambio_prioridad
end type
type dw_cambio_prioridad from u_dw_application within w_cambio_prioridad
end type
type gb_1 from groupbox within w_cambio_prioridad
end type
type gb_2 from groupbox within w_cambio_prioridad
end type
end forward

global type w_cambio_prioridad from w_sheet
integer width = 3625
integer height = 1764
string title = "Cambiar prioridad de $$HEX1$$f300$$ENDHEX$$rdenes"
dw_ordenes dw_ordenes
dw_cambio_prioridad dw_cambio_prioridad
gb_1 gb_1
gb_2 gb_2
end type
global w_cambio_prioridad w_cambio_prioridad

type variables
n_cst_param_orden iuo_parametros
end variables

on w_cambio_prioridad.create
int iCurrent
call super::create
this.dw_ordenes=create dw_ordenes
this.dw_cambio_prioridad=create dw_cambio_prioridad
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_ordenes
this.Control[iCurrent+2]=this.dw_cambio_prioridad
this.Control[iCurrent+3]=this.gb_1
this.Control[iCurrent+4]=this.gb_2
end on

on w_cambio_prioridad.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_ordenes)
destroy(this.dw_cambio_prioridad)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event ue_find;
Open(w_opc_cam_prior)

iuo_parametros = Message.PowerObjectParm

If iuo_parametros.ib_vector[1] = False Then
	Return 
End If

dw_ordenes.Retrieve(iuo_parametros.il_vector)
end event

event open;call super::open;
m_sheet.m_edicion.m_insertar.Enabled = False
m_sheet.m_edicion.m_clear.Enabled = False
m_sheet.m_ayuda.m_contenido.Enabled = False
m_sheet.m_archivo.m_imprimir.Enabled = False
dw_ordenes.of_conexion(n_cst_application.itr_appl,True)
dw_cambio_prioridad.InsertRow(0)
end event

event ue_save;
If dw_ordenes.GetNextModified(0,Primary!) > 0 Then
	If dw_ordenes.Update() > 0 Then
		Commit Using n_cst_application.itr_appl;
		MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','Se han cambiado la prioridades con $$HEX1$$e900$$ENDHEX$$xito')
		dw_ordenes.SelectRow(0,False)
	Else
		RollBack Using n_cst_application.itr_appl;
		MessageBox('Advertencia','Ha ocurrido un error cambiando las prioridades',Stopsign!)
	End If
End If
end event

event closequery;call super::closequery;
If dw_ordenes.GetNextModified(0,Primary!) > 0 Then
	If MessageBox('Validaci$$HEX1$$f300$$ENDHEX$$n','Desea salir sin guardar los cambios ?.', &
	               Question!,YesNo!,1) = 2 Then
		Return 1
	Else
		Return 0
	End If			
End If
end event

type dw_ordenes from u_dw_application within w_cambio_prioridad
integer x = 64
integer y = 388
integer width = 3470
integer height = 1128
integer taborder = 20
string dataobject = "d_lista_orden_prioridad"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event clicked;call super::clicked;String ls_type

ls_type = dwo.Type

If ls_type = 'text' Then
	If This.GetSelectedRow(0) > 0 Then
		This.SelectRow(0,False)
	Else
		This.SelectRow(0,True)
	End If
ElseIf ls_type = 'column' Then
	If This.IsSelected(Row) Then
		This.SelectRow(Row,False)
	Else
		This.SelectRow(Row,True)
	End If
End If


end event

type dw_cambio_prioridad from u_dw_application within w_cambio_prioridad
integer x = 64
integer y = 80
integer width = 3410
integer height = 184
string dataobject = "d_ext_cambio_prioridad"
boolean vscrollbar = false
end type

event itemchanged;call super::itemchanged;Long ll_row

Choose Case dwo.Name
	Case 'prioridad'
		ll_row = dw_ordenes.GetSelectedRow(0)
		Do While ll_row > 0 
			dw_ordenes.SetItem(ll_row,'dt_mu_ord_prioridad',Long(Data))
			dw_ordenes.SelectRow(ll_row,False)
			ll_row = dw_ordenes.GetSelectedRow(ll_row)
		Loop
End Choose
end event

type gb_1 from groupbox within w_cambio_prioridad
integer x = 23
integer y = 16
integer width = 3561
integer height = 260
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Prioridad"
end type

type gb_2 from groupbox within w_cambio_prioridad
integer x = 23
integer y = 320
integer width = 3561
integer height = 1232
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Prioridad $$HEX1$$f300$$ENDHEX$$rdenes"
end type

