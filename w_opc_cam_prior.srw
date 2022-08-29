HA$PBExportHeader$w_opc_cam_prior.srw
forward
global type w_opc_cam_prior from w_response
end type
type cbx_seleccionar from checkbox within w_opc_cam_prior
end type
type cb_buscar from commandbutton within w_opc_cam_prior
end type
type cb_cancelar from u_cb_application within w_opc_cam_prior
end type
type cb_aceptar from u_cb_application within w_opc_cam_prior
end type
type dw_consulta from u_dw_application within w_opc_cam_prior
end type
type dw_orden from u_dw_application within w_opc_cam_prior
end type
type gb_1 from groupbox within w_opc_cam_prior
end type
type gb_2 from groupbox within w_opc_cam_prior
end type
end forward

global type w_opc_cam_prior from w_response
string tag = "B$$HEX1$$fa00$$ENDHEX$$squeda de $$HEX1$$f300$$ENDHEX$$rdenes"
integer width = 3410
integer height = 1324
string title = "B$$HEX1$$fa00$$ENDHEX$$squeda de $$HEX1$$f300$$ENDHEX$$rdenes"
boolean controlmenu = false
cbx_seleccionar cbx_seleccionar
cb_buscar cb_buscar
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
dw_consulta dw_consulta
dw_orden dw_orden
gb_1 gb_1
gb_2 gb_2
end type
global w_opc_cam_prior w_opc_cam_prior

type variables
String is_where
end variables

forward prototypes
public function integer of_recuperar (string as_where)
public function integer of_where ()
end prototypes

public function integer of_recuperar (string as_where);String ls_sel_ini,ls_modString,ls_original
Long ll_pos

// Modificacion de la clausula where para la consulta del dw_consulta
ls_sel_ini = dw_consulta.Describe("DataWindow.Table.Select")
ls_original = ls_sel_ini

ls_sel_ini += as_where

dw_consulta.Modify("DataWindow.Table.Select = '" + ls_sel_ini + "'")

If dw_consulta.Retrieve() <= 0 Then
	MessageBox('Advertencia','No se encontraron registros para el criterio de b$$HEX1$$fa00$$ENDHEX$$squeda',StopSign!)
End If

dw_consulta.Modify("DataWindow.Table.Select = '" + ls_original + "'" )
dw_consulta.SetFocus()

Return 1
end function

public function integer of_where ();String ls_campo

is_where = ''

If dw_orden.accepttext( ) <> 1 Then
	This.TriggerEvent('losefocus')
	dw_orden.SetFocus()
	Return -1
End If

ls_campo = String(dw_orden.GetItemNumber(1,'orden'))
If ls_campo <> '' Or Not IsNull(ls_campo) Then
	is_where += " and dt_mu_ord.nu_orden = " + ls_campo
End If

ls_campo = String(dw_orden.GetItemNumber(1,'fabrica'))
If ls_campo <> '' Or Not IsNull(ls_campo) Then
	is_where += " and dt_mu_ord.co_fabrica = " + ls_campo
End If

ls_campo = String(dw_orden.GetItemNumber(1,'linea'))
If ls_campo <> '' Or Not IsNull(ls_campo) Then
	is_where += " and dt_mu_ord.co_linea = " + ls_campo
End If

ls_campo = String(dw_orden.GetItemNumber(1,'muestra'))
If ls_campo <> '' Or Not IsNull(ls_campo) Then
	is_where += " and dt_mu_ord.co_muestra = " + ls_campo
End If

ls_campo = Trim(dw_orden.GetItemString(1,'desarrollador'))
If ls_campo <> '' Or Not IsNull(ls_campo) Then
	is_where += " and Upper(dt_mu_ord.co_ctecnico) Like ~~'%" + ls_campo + "%~~'"
End If

ls_campo = String(dw_orden.GetItemNumber(1,'ejecutiva'))
If ls_campo <> '' Or Not IsNull(ls_campo) Then
	is_where += " and dt_mu_ord.co_ejecutiva = " + ls_campo
End If

ls_campo = String(dw_orden.GetItemNumber(1,'cliente'))
If ls_campo <> '' Or Not IsNull(ls_campo) Then
	is_where += " and m_muestras.co_cliente = " + ls_campo
End If

ls_campo = String(dw_orden.GetItemNumber(1,'sucursal'))
If ls_campo <> '' Or Not IsNull(ls_campo) Then
	is_where += " and m_muestras.co_sucursal = " + ls_campo
End If

ls_campo = dw_orden.GetItemString(1,'tipo_cliente')
If ls_campo <> '' Or Not IsNull(ls_campo) Then
	is_where += " and  ( m_muestras.tipo_muestra = ~~'" + ls_campo + "~~' )"
End If

ls_campo = Trim(dw_orden.GetItemString(1,'codigo_diseno'))
If ls_campo <> '' Or Not IsNull(ls_campo) Then
	is_where += " and Upper(m_muestras.co_diseno_muestra) Like ~~'%" + ls_campo + "%~~'"
End If

of_recuperar(is_where)

Return 1
end function

on w_opc_cam_prior.create
int iCurrent
call super::create
this.cbx_seleccionar=create cbx_seleccionar
this.cb_buscar=create cb_buscar
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.dw_consulta=create dw_consulta
this.dw_orden=create dw_orden
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_seleccionar
this.Control[iCurrent+2]=this.cb_buscar
this.Control[iCurrent+3]=this.cb_cancelar
this.Control[iCurrent+4]=this.cb_aceptar
this.Control[iCurrent+5]=this.dw_consulta
this.Control[iCurrent+6]=this.dw_orden
this.Control[iCurrent+7]=this.gb_1
this.Control[iCurrent+8]=this.gb_2
end on

on w_opc_cam_prior.destroy
call super::destroy
destroy(this.cbx_seleccionar)
destroy(this.cb_buscar)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.dw_consulta)
destroy(this.dw_orden)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;
dw_consulta.of_conexion(n_cst_application.itr_appl,True)
dw_orden.InsertRow(0)
dw_orden.SetItem(1,'tipo_cliente','EX')
end event

type cbx_seleccionar from checkbox within w_opc_cam_prior
integer x = 2459
integer y = 1100
integer width = 901
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Seleccionar todos los registros"
boolean lefttext = true
end type

event clicked;
If This.Checked = True Then
	dw_consulta.SelectRow(0,True)
Else
	dw_consulta.SelectRow(0,False)
End If
end event

type cb_buscar from commandbutton within w_opc_cam_prior
integer x = 448
integer y = 928
integer width = 343
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar"
end type

event clicked;
of_where()
end event

type cb_cancelar from u_cb_application within w_opc_cam_prior
integer x = 1925
integer y = 1088
integer taborder = 50
string text = "&Cancelar"
end type

event clicked;call super::clicked;n_cst_param_orden luo_parametros

luo_parametros.ib_vector[1] = False

CloseWithReturn(Parent,luo_parametros)
end event

type cb_aceptar from u_cb_application within w_opc_cam_prior
integer x = 1490
integer y = 1088
integer taborder = 40
string text = "&Aceptar"
end type

event clicked;call super::clicked;Long ll_row,ll_cont
n_cst_param_orden luo_parametros

If dw_consulta.RowCount() > 0 then 
	If cbx_seleccionar.Checked = True Then
		luo_parametros.il_vector = dw_consulta.Object.dt_mu_ord_nu_orden.Primary
		If UpperBound(luo_parametros.il_vector) = 0 Then
			luo_parametros.ib_vector[1] = False
		Else
			luo_parametros.ib_vector[1] = True
		End If
	Else
		ll_row = dw_consulta.GetSelectedRow(0)
		If ll_row = 0 Then
			MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','Debe seleccionar por lo menos un registro')
			Return -1
		End If
		Do While ll_row > 0
			ll_cont++
			luo_parametros.il_vector[ll_cont] = dw_consulta.Object.dt_mu_ord_nu_orden[ll_row]
			ll_row = dw_consulta.GetSelectedRow(ll_row)
			luo_parametros.ib_vector[1] = True
		Loop
		
	End If
Else
	luo_parametros.ib_vector[1] = False
End If 


CloseWithReturn(Parent,luo_parametros)
end event

type dw_consulta from u_dw_application within w_opc_cam_prior
integer x = 1344
integer y = 96
integer width = 1979
integer height = 904
integer taborder = 30
string dataobject = "d_consulta_orden"
boolean hscrollbar = true
end type

event getfocus;//
end event

event clicked;call super::clicked;String ls_type

If cbx_seleccionar.Checked = False Then
	ls_type = dwo.Type
	
	If ls_type = 'column' Then
		If This.IsSelected(row) Then
			This.SelectRow(row,False)
		Else
			This.SelectRow(row,True)
		End If
	End If
End If
end event

event retrieveend;call super::retrieveend;If rowcount > 0 Then 
	cbx_seleccionar.Enabled = True
Else
	cbx_seleccionar.Enabled = False
End If
end event

type dw_orden from u_dw_application within w_opc_cam_prior
integer x = 46
integer y = 84
integer width = 1202
integer height = 816
string dataobject = "d_ext_datos_orden_muestra"
boolean controlmenu = true
boolean vscrollbar = false
end type

event itemchanged;call super::itemchanged;Long ll_cliente,ll_sucursal
String ls_tipo_muestra,ls_tipo_cliente,ls_ejecutiva
n_cst_comun_orden luo_comun

Choose Case dwo.Name
	Case 'sucursal','cliente','tipo_cliente'
		If dwo.Name = 'sucursal' Then 
			ll_sucursal = Long(Data)
		Else
			ll_sucursal = This.GetItemNumber(1,'sucursal')
		End If
		If dwo.Name = 'cliente' Then 
			ll_cliente = Long(Data)
		Else
			ll_cliente = This.GetItemNumber(1,'cliente')  
		End If
		If dwo.Name = 'tipo_cliente' Then 
			ls_tipo_cliente = Data
		Else
			ls_tipo_cliente = This.GetItemString(1,'tipo_cliente')
		End If
		If ll_sucursal > 0 And ll_cliente > 0 &
		   And ( ls_tipo_cliente <> '' Or  Not IsNull(ls_tipo_cliente)) Then
			If luo_comun.of_nombrecliente(ll_cliente, &
													ll_sucursal, &
													ls_tipo_cliente, &
													n_cst_application.itr_appl) > 0 Then
         	This.SetItem(1,'de_cliente',luo_comun.of_getstring(1))
			Else
				MessageBox('Advertencia','No se pudo hallar la descripci$$HEX1$$f300$$ENDHEX$$n del cliente para' + &
				           ' el criterio definido',StopSign!)
 			   This.SetItem(1,'de_cliente','')
			End If
		End If
	Case 'desarrollador'
		If This.of_validarcadena(Data) <> 1 Then Return 1	
		If Trim(Data) <> '' And Not IsNull(Data) Then
			If luo_comun.of_nombredesarrollador(Lower(Data),n_cst_application.itr_appl) > 0 Then
         	This.SetItem(1,'de_desarrollador',luo_comun.of_getstring(1))															
			Else
				MessageBox('Advertencia','No se pudo hallar la descripci$$HEX1$$f300$$ENDHEX$$n del desarrollador ' + &
				           'para el criterio definido',StopSign!)
				Return 2
			End If
		ElseIf Len(Data) > 0 Then
			MessageBox('Advertencia','No se permiten espacios en blanco para el criterio ' + &
			            'de b$$HEX1$$fa00$$ENDHEX$$squeda', StopSign!)
			Return 1
		Else
			This.SetItem(1,'de_desarrollador','')
		End If
	Case 'ejecutiva' 
		If Long(Data) > 0 And &
		   This.GetItemNumber(1,'fabrica') > 0 And &
			This.GetItemNumber(1,'linea') > 0 And &
			This.GetItemNumber(1,'muestra') > 0 Then
			If luo_comun.of_tipo_muestra(This.GetItemNumber(1,'fabrica'), &
			                             This.GetItemNumber(1,'linea'), &
											     This.GetItemNumber(1,'muestra'), &
											  	  n_cst_application.itr_appl) > 0 Then
				ls_tipo_muestra = luo_comun.of_getstring(1)
				If luo_comun.of_nombreejecutiva(ls_tipo_muestra,Long(Data), &
														  n_cst_application.itr_appl) > 0 Then
					This.SetItem(1,'de_ejecutiva',luo_comun.of_getstring(1))														  
				Else
					MessageBox('Advertencia','No se pudo hallar la descripci$$HEX1$$f300$$ENDHEX$$n de la' + &
					           'ejecutiva con los criterios dados',StopSign!)
					Return 2
				End If
			Else
				MessageBox('Advertencia','No se pudo hallar el tipo de la muestra',StopSign!)
			End If
		ElseIf Long(Data) > 0 Then
			luo_comun.of_nombreejecutiva('EX',Long(Data),n_cst_application.itr_appl)
			ls_ejecutiva = luo_comun.of_getstring(1) + " (EX) "
			luo_comun.of_nombreejecutiva('NA',Long(Data),n_cst_application.itr_appl)
			ls_ejecutiva += luo_comun.of_getstring(1) + " (NA)"
			This.SetItem(1,'de_ejecutiva',ls_ejecutiva)														  
		End If
	Case 'codigo_diseno'
		If This.of_validarcadena(Data) <> 1 Then Return 1
		If Trim(Data) = '' And Len(Data) > 0 Then
			MessageBox('Advertencia','No se permiten espacios en blanco para el criterio ' + &
			            'de b$$HEX1$$fa00$$ENDHEX$$squeda', StopSign!)
			Return 1
		End If
	Case 'tipo_cliente'
		
End Choose
end event

event getfocus;//
end event

event itemerror;call super::itemerror;String ls_campo
Long   ll_null

ls_campo = dwo.Name
SetNull(ll_null)

Choose Case dwo.Name
	Case 'orden','fabrica','linea','muestra','cliente','sucursal','ejecutiva'
		If Long(Data) = 0 Then
			This.SetItem(row,ls_campo,ll_null)
			
			If ls_campo = 'ejecutiva' Then 
				This.SetItem(1,'de_ejecutiva','')
			End If
			
			If ls_campo = 'cliente' Or ls_campo = 'sucursal' Then
				This.SetItem(1,'de_cliente','')
			End If
			
			Return 3
		End If
	Case 'desarrollador','codigo_diseno'
		Return 1
End Choose


end event

type gb_1 from groupbox within w_opc_cam_prior
integer x = 37
integer y = 32
integer width = 1248
integer height = 1028
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Datos de la orden"
end type

type gb_2 from groupbox within w_opc_cam_prior
integer x = 1298
integer y = 32
integer width = 2062
integer height = 1028
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "$$HEX1$$d300$$ENDHEX$$rdenes"
end type

