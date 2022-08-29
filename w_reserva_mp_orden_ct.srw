HA$PBExportHeader$w_reserva_mp_orden_ct.srw
forward
global type w_reserva_mp_orden_ct from w_sheet
end type
type dw_mp_x_reserva from u_dw_application within w_reserva_mp_orden_ct
end type
type cb_reiniciar from commandbutton within w_reserva_mp_orden_ct
end type
type cb_pedir_mp from commandbutton within w_reserva_mp_orden_ct
end type
type cb_reserva_mp from commandbutton within w_reserva_mp_orden_ct
end type
type cb_validar_mp from commandbutton within w_reserva_mp_orden_ct
end type
type dw_ordenes from u_dw_application within w_reserva_mp_orden_ct
end type
type dw_mp_x_ord from u_dw_application within w_reserva_mp_orden_ct
end type
type dw_opciones from u_dw_application within w_reserva_mp_orden_ct
end type
end forward

global type w_reserva_mp_orden_ct from w_sheet
integer width = 4823
integer height = 2516
string title = "Reserva MP Control Tecnico"
boolean maxbox = true
boolean resizable = true
dw_mp_x_reserva dw_mp_x_reserva
cb_reiniciar cb_reiniciar
cb_pedir_mp cb_pedir_mp
cb_reserva_mp cb_reserva_mp
cb_validar_mp cb_validar_mp
dw_ordenes dw_ordenes
dw_mp_x_ord dw_mp_x_ord
dw_opciones dw_opciones
end type
global w_reserva_mp_orden_ct w_reserva_mp_orden_ct

type variables
n_cst_reserva_mp_orden invo_reserva_mp


n_ds_application ids_mp_x_reserva_ord, ids_mp_x_reserva, ids_kx_mp, ids_mp, ids_peso_std_cono

Boolean ib_conectado_db2 = False
n_cst_conexiondb2 itr_Ordenesdb2
n_tr_base itr_sqlserver
Long ii_ordenes[]
Integer ii_Lead_Time_Tejido = 2
String is_co_centro_sap = '1110', ii_co_almacen_sap = '0100'
end variables

forward prototypes
public function integer of_reiniciar ()
end prototypes

public function integer of_reiniciar ();Long ll_rfind


dw_opciones.Modify( 'b_validar_mp.Enabled = "Yes"' )
dw_opciones.Modify( 'b_reserva_mp.Enabled = "No"' )
dw_opciones.Modify( 'b_pedir_mp.Enabled = "No"' )
//cb_validar_mp.Enabled = True
//cb_reserva_mp.Enabled = False
//cb_pedir_mp.Enabled = False

dw_ordenes.SetFilter( '' )
dw_ordenes.Filter()

// Si hay ordenes reservadas se habilita el boton de pedido de MP
ll_rfind = dw_ordenes.Find( 'indicador_mp=1', 1, dw_ordenes.RowCount() )
If ll_rfind > 0 Then
	//cb_pedir_mp.Enabled = True
	dw_opciones.Modify( 'b_pedir_mp.Enabled = "Yes"' )
End If


Return 1
end function

on w_reserva_mp_orden_ct.create
int iCurrent
call super::create
this.dw_mp_x_reserva=create dw_mp_x_reserva
this.cb_reiniciar=create cb_reiniciar
this.cb_pedir_mp=create cb_pedir_mp
this.cb_reserva_mp=create cb_reserva_mp
this.cb_validar_mp=create cb_validar_mp
this.dw_ordenes=create dw_ordenes
this.dw_mp_x_ord=create dw_mp_x_ord
this.dw_opciones=create dw_opciones
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_mp_x_reserva
this.Control[iCurrent+2]=this.cb_reiniciar
this.Control[iCurrent+3]=this.cb_pedir_mp
this.Control[iCurrent+4]=this.cb_reserva_mp
this.Control[iCurrent+5]=this.cb_validar_mp
this.Control[iCurrent+6]=this.dw_ordenes
this.Control[iCurrent+7]=this.dw_mp_x_ord
this.Control[iCurrent+8]=this.dw_opciones
end on

on w_reserva_mp_orden_ct.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_mp_x_reserva)
destroy(this.cb_reiniciar)
destroy(this.cb_pedir_mp)
destroy(this.cb_reserva_mp)
destroy(this.cb_validar_mp)
destroy(this.dw_ordenes)
destroy(this.dw_mp_x_ord)
destroy(this.dw_opciones)
end on

event open;call super::open;/*
	FACL - 2017/10/12 - SA57405 - Ventana para realizar la reserva de materia prima para las ordenes de muestras
	
	
estado_reserva:
0 - Sin Ficha de Materia Prima.
1 - Sin Fecha de Tejido.
2 - Sin Agrupacion.
3 - Agrupado.
4 - Sin Kardex de MP.
5 - Con Kardex de MP.
6 - Por Reservar
7 - Reservado
8 - Por Pedir MP.
9 - Pedido
	
*/

dw_opciones.InsertRow(0)

dw_ordenes.of_Conexion(n_cst_application.itr_appl,True)
dw_mp_x_ord.of_Conexion(n_cst_application.itr_appl,True)

invo_reserva_mp = Create n_cst_reserva_mp_orden
invo_reserva_mp.of_Set_dw_ordenes( dw_ordenes )

// Se configura el menu
If IsValid( m_sheet ) Then
	m_sheet.m_edicion.m_insertar.Visible = False
	m_sheet.m_edicion.m_insertar.ToolbarItemVisible = False
	
	m_sheet.m_edicion.m_clear.Visible = False
	m_sheet.m_edicion.m_clear.ToolbarItemVisible = False

	m_sheet.m_archivo.m_guardar.Visible = False
	m_sheet.m_archivo.m_guardar.ToolbarItemVisible = False

	m_sheet.m_archivo.m_guardarcomo.ToolbarItemVisible = True
	m_sheet.m_archivo.m_guardarcomo.Visible = True
End If

end event

event ue_find;call super::ue_find;// Se cargan los datos de las ordenes por Reserva
If invo_reserva_mp.Of_Cargar_Ordenes_x_Reserva( ) > 0 Then
	This.of_Reiniciar()
End If

end event

event close;call super::close;Destroy invo_reserva_mp
end event

event resize;call super::resize;
dw_ordenes.Resize( newwidth - dw_ordenes.X - 50, newheight - dw_ordenes.Y - 200 )

dw_opciones.Y = newheight - 180
dw_opciones.Resize(  newwidth - dw_opciones.X - 50, Height )


//cb_validar_mp.Y = newheight - 120
//cb_reiniciar.Y = cb_validar_mp.Y
//cb_reserva_mp.Y = cb_validar_mp.Y
//cb_pedir_mp.Y = cb_validar_mp.Y
//st_orden.Y = cb_validar_mp.Y
//sle_orden.Y = cb_validar_mp.Y
//cb_buscar.Y = cb_validar_mp.Y





end event

type dw_mp_x_reserva from u_dw_application within w_reserva_mp_orden_ct
boolean visible = false
integer x = 78
integer y = 268
integer width = 4370
integer height = 1224
integer taborder = 20
boolean titlebar = true
string title = "Resumen MP x Kx"
string dataobject = "d_gr_dt_mu_ord_reserva_agrupada"
boolean controlmenu = true
boolean hscrollbar = true
boolean resizable = true
end type

event doubleclicked;call super::doubleclicked;String ls_filtro

If Row = 0 Then 
	ls_filtro = ''
Else
	ls_filtro = 'co_producto_mp = ' + String( This.GetItemNumber( Row, 'co_producto_mp' ) ) &
		+ ' AND co_color_mp = ' + String( This.GetItemNumber( Row, 'co_color_mp' ) )
End IF
	

dw_mp_x_ord.SetFilter( ls_filtro )
dw_mp_x_ord.Filter()
end event

event itemchanged;call super::itemchanged;/*
	FACL - 2019/10/15 - SA60054 - Se controla los datos ingresados para nu_conos_fijo y ca_gramos_fijo
*/

Long ll_nu_conos, ll_orden_agrupada, ll_rfind
Decimal ldc_gramos, ldc_gramos_reserva, ldc_porc_reserva, ldc_inventario_disponible
String ls_find


Choose Case Dwo.Name
	// Se verifica que se encuentre en un estado valido hacer los cambios
	Case 'nu_conos_fijo' , 'ca_gramos_fijo'
		ll_orden_agrupada = This.GetItemNumber( Row, 'nu_orden_agrupada' )
		
		ls_find = 'nu_orden = ' + String( ll_orden_agrupada ) + ' and estado_reserva IN ( 3,4,5,6 )'
		ll_rfind = dw_ordenes.Find( ls_find, 1, dw_ordenes.RowCount() )
		If ll_rfind > 0 Then
			// ok	
		Else
			Post MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'La agrupacion no permite cambios en la Materia Prima!' )
			Return 2		
		End If
	Case Else
		Return 2
End Choose

Choose Case Dwo.Name
	Case 'nu_conos_fijo' 
		ll_nu_conos = Long( Data )
		ldc_gramos = This.GetItemDecimal( Row, 'ca_gramos_fijo' )
		// Se controla que no pueda ingresar cero
		If ll_nu_conos = 0 Then
			Post MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'El numero de conos no puede ser cero' )
			Return 2
		End If
		
	Case 'ca_gramos_fijo'
		ldc_gramos = Dec( Data )
		ldc_gramos_reserva = This.GetItemDecimal( Row, 'ca_gramos_necesidad' )
		ldc_inventario_disponible = This.GetItemDecimal( Row, 'inventario_disponible' )
		// Se verifica que no supere el inventario disponible
		If ldc_gramos > ldc_inventario_disponible Then
			Post MessageBox( 'Atenc$$HEX1$$f300$$ENDHEX$$n', 'Gramos a reservar superan el inventario disponible' )
			Return 2
		// Si la cantidad ingresada fija es mayor que la reserva
		ElseIf ldc_gramos > ldc_gramos_reserva And invo_reserva_mp.ii_control_tope_reserva = 1 Then
			// se verifica que no supere el % Permitido
			If ldc_gramos > ldc_gramos_reserva *( 1 + invo_reserva_mp.idc_Porc_Encim_Res/100 ) Then
				ldc_porc_reserva = (ldc_gramos - ldc_gramos_reserva ) / ldc_gramos_reserva
				Post MessageBox( 'Atenc$$HEX1$$f300$$ENDHEX$$n', 'Gramos a reservar superan la cantidad por encima de  ' + String(ldc_porc_reserva, '0%' ) )
				Return 2
			End If
		End If
	Case Else
		Return 2
End Choose
end event

event buttonclicked;call super::buttonclicked;/*
	FACL - 2019/10/11 - SA60054 - Se almacena los datos de reserva ingresados
*/

Long ll_agrupa


Choose Case Dwo.Name
	Case 'b_aplicar'
		If This.RowCount() = 0 Then Return
		This.Visible = False	
		// se guarda los datos de la reserva fija
		If invo_reserva_mp.of_Act_Reserva_Fijo( This )  > 0 Then
			// Se valida la materia prima de nuevo
			dw_opciones.Event ButtonClicked( 1, 0, dw_opciones.Object.b_validar_mp )
		End If
End Choose

end event

type cb_reiniciar from commandbutton within w_reserva_mp_orden_ct
boolean visible = false
integer x = 1929
integer y = 2208
integer width = 343
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Reagrupar"
end type

event clicked;
Parent.of_Reiniciar()
end event

type cb_pedir_mp from commandbutton within w_reserva_mp_orden_ct
boolean visible = false
integer x = 3291
integer y = 2208
integer width = 343
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Pedir MP"
end type

event clicked;

If dw_ordenes.AcceptText() <> 1 Then
	Return -1
End If

If invo_reserva_mp.of_Pedir_MP_SIS() > 0 Then

End If

end event

type cb_reserva_mp from commandbutton within w_reserva_mp_orden_ct
boolean visible = false
integer x = 2853
integer y = 2208
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Reservar MP"
end type

event clicked;


If dw_ordenes.AcceptText() <> 1 Then
	Return -1
End If

If invo_reserva_mp.of_Reservar_MP_Sap() > 0 Then
	cb_pedir_mp.Enabled = True
End If

end event

type cb_validar_mp from commandbutton within w_reserva_mp_orden_ct
boolean visible = false
integer x = 2409
integer y = 2208
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Validar MP"
end type

event clicked;
If dw_ordenes.AcceptText() <> 1 Then
	Return -1
End If

If invo_reserva_mp.of_Validar_MP() > 0 Then
	cb_reserva_mp.Enabled = True
End If

cb_reiniciar.Enabled = True

end event

type dw_ordenes from u_dw_application within w_reserva_mp_orden_ct
integer x = 41
integer y = 36
integer width = 4640
integer height = 2144
string dataobject = "d_gr_ordenes_x_reserva_mp"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;call super::itemchanged;Integer li_dato, li_estado_reserva
Long ll_row, ll_agrupa_orden, ll_agrupa_orden_nuevo
String ls_find
Choose Case Dwo.Name
	Case 'agrupa_orden'		
		// Despues de reservado no se permite modificar la agrupacion
		If This.GetItemNumber( Row, 'estado_reserva' ) >= 7 Then
			Return 2
		End If
		
		ll_agrupa_orden = This.GetItemNumber( Row, 'agrupa_orden' )
		li_estado_reserva = This.GetItemNumber( Row, 'estado_reserva' )

		// Se controla que no pueda usar una agrupacion que ya se reservo
		ll_agrupa_orden_nuevo = Long( data )
		ls_find = 'agrupa_orden = ' + String( ll_agrupa_orden_nuevo ) + ' and estado_reserva >= 7'
		ll_row = This.Find( ls_find, 1, This.RowCount() )
		If ll_row > 0 Then
			Post MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'La agrupacion no se puede usar, ya tiene reserva!' )
			Return 2
		End If	
		
		This.SetItem( Row, 'estado_reserva', 3 )
		// Se actualiza el estado de la agrupacion actual
		If ll_agrupa_orden > 0 And li_estado_reserva >= 5 Then
			li_dato = Long( data )
			ls_find = 'agrupa_orden = ' + String( ll_agrupa_orden )
			ll_row = This.Find( ls_find, 1, This.RowCount() )
			Do While ll_row > 0
				If ll_row <> Row Then
					This.SetItem( ll_row, 'estado_reserva', 3 )
				End If
				ll_row = This.Find( ls_find, ll_row + 1, This.RowCount() + 1 )
			Loop
		End If
		// Se actualiza estado de la agrupacion destino
		ls_find = 'agrupa_orden = ' + String( ll_agrupa_orden_nuevo )
		ll_row = This.Find( ls_find, 1, This.RowCount() )
		Do While ll_row > 0
			If ll_row <> Row Then
				This.SetItem( ll_row, 'estado_reserva', 3 )
			End If
			ll_row = This.Find( ls_find, ll_row + 1, This.RowCount() + 1 )
		Loop
		
		
	Case 'sw_reserva', 'sw_pedir_mp'	
		
		ll_agrupa_orden = This.GetItemNumber( Row, 'agrupa_orden' )
		li_estado_reserva = This.GetItemNumber( Row, 'estado_reserva' )
		If ll_agrupa_orden > 0 And li_estado_reserva >= 5 Then
			li_dato = Long( data )
			ls_find = 'agrupa_orden = ' + String( ll_agrupa_orden )
			ll_row = This.Find( ls_find, 1, This.RowCount() )
			Do While ll_row > 0
				If ll_row <> Row Then
					This.SetItem( ll_row, String( Dwo.Name ), li_dato )
				End If
				ll_row = This.Find( ls_find, ll_row + 1, This.RowCount() + 1 )
			Loop
		Else
			Return 2 
		End If
		
End Choose
end event

event rbuttondown;call super::rbuttondown;String ls_find
Long ll_rfind, ll_row, ll_nro_consec
Integer li_dato
Date ld_fecha

If This.AcceptText() <> 1 Then Return

Choose Case Dwo.Name
	Case 'sw_reserva', 'sw_pedir_mp'
		ls_find = String( Dwo.Name ) + ' > 0'
		ll_rfind = This.Find( ls_find, 1, This.RowCount() )
		If ll_rfind > 0 Then
			li_dato = 0
		Else
			li_dato = 1
		End If
		// Se marcan todos los registros que esten validos
		If Dwo.Name = 'sw_reserva' Then
			ls_find = 'estado_reserva IN ( 5,6 )'
		Else
			ls_find = 'estado_reserva IN ( 7,8 )'
		End If
		ll_row = This.Find( ls_find, 1, This.RowCount() )
		Do While ll_row > 0
			This.SetItem( ll_row, String( Dwo.Name ), li_dato )
			ll_row = This.Find( ls_find, ll_row + 1, This.RowCount() + 1 )
		Loop
	Case 'fe_entrega_tejido', 'fe_entrega_cliente'
		If Row = 0 Then Return 0
		ld_fecha = This.GetItemDate( Row, 'fe_entrega_cliente' )
		// Se calcula el siguiente consecutivo
		ll_nro_consec = 1000
		ls_find = 'agrupa_orden >= 1000 And agrupa_orden < 10000 AND agrupa_orden >= ' + String( ll_nro_consec )
		ll_row = This.Find( ls_find, 1, This.RowCount() )
		Do While ll_row > 0
			ll_nro_consec = This.GetItemNumber( ll_row, 'agrupa_orden' ) + 1
			ls_find = 'agrupa_orden >= 1000 And agrupa_orden < 10000 AND agrupa_orden >= ' + String( ll_nro_consec )
			ll_row = This.Find( ls_find, ll_row + 1, This.RowCount() + 1 )
		Loop
		
		
		ls_find = 'fe_entrega_cliente = Date("' + String( ld_fecha, 'yyyy/mm/dd' ) + '") And estado_reserva in ( 2, 3, 4) And ( IsNull(agrupa_orden) Or agrupa_orden <= 0 )'
		ll_row = This.Find( ls_find, 1, This.RowCount() )
		Do While ll_row > 0
			If This.GetItemNumber( ll_row, 'agrupa_orden' ) > 0 Then
				// No se Toca
			Else
				This.SetItem( ll_row, 'agrupa_orden', ll_nro_consec )
				This.SetItem( ll_row, 'estado_reserva', 3 )
				ll_nro_consec ++
			End If
			ll_row = This.Find( ls_find, ll_row + 1, This.RowCount() + 1 )
		Loop
		
		
End Choose
	
end event

event doubleclicked;call super::doubleclicked;Long ll_ordenes[], ll_row, ll_pr
Long ll_agrupa_orden
String ls_find, ls_filtro

If Row = 0 Then Return
If This.AcceptText() <> 1 Then Return

Choose Case Dwo.Name
	Case 'nu_orden', 'agrupa_orden'
		If Dwo.Name = 'nu_orden' Then
			ll_ordenes[1] = This.GetItemNumber( Row, 'nu_orden' )
		Else
			ll_agrupa_orden = This.GetItemNumber( Row, 'agrupa_orden' )
		
			ls_find = 'agrupa_orden = ' + String( ll_agrupa_orden )
			ll_row = This.Find( ls_find, 1, This.RowCount() )
			Do While ll_row > 0
				ll_ordenes[UpperBound(ll_ordenes) +1 ] = This.GetItemNumber( ll_row, 'nu_orden' )
				ll_row = This.Find( ls_find, ll_row + 1, This.RowCount() + 1 )
			Loop
		End If
		If UpperBound(ll_ordenes) > 0 Then
			dw_mp_x_ord.Retrieve( ll_ordenes )
			dw_mp_x_ord.Visible = True
			
			// Se marcan los partes de hilo cerrado con el color negativo para tenerlos en cuenta en la reserva
			ls_find = 'co_partemp in (' + invo_reserva_mp.is_co_parte_hilo_cerrado + ')'
			dw_mp_x_ord.SetFilter( ls_find )
			dw_mp_x_ord.Filter()
			
			For ll_pr = 1 To dw_mp_x_ord.RowCount()
				dw_mp_x_ord.SetItem( ll_pr, 'co_partemp', -dw_mp_x_ord.GetItemNumber( ll_pr, 'co_partemp' ) )		
			Next
			dw_mp_x_ord.SetFilter('')
			dw_mp_x_ord.Filter()
			dw_mp_x_ord.Sort()
			dw_mp_x_ord.GroupCalc()
	
		End If
	Case 'estado_mp'
		ll_agrupa_orden = This.GetItemNumber( Row, 'agrupa_orden' )
		If ll_agrupa_orden > 0 Then
			ls_find = 'agrupa_orden = ' + String( ll_agrupa_orden )
			ll_row = This.Find( ls_find, 1, This.RowCount() )
			Do While ll_row > 0
				If ls_filtro <> '' Then ls_filtro += ','
				ls_filtro += String( This.GetItemNumber( ll_row, 'nu_orden' ) )
				ll_row = This.Find( ls_find, ll_row + 1, This.RowCount() + 1 )
			Loop
			
			dw_mp_x_reserva.SetRedraw( False )
			invo_reserva_mp.of_Mostrar_MP_x_Reserva( dw_mp_x_reserva )
			
			ls_filtro = 'nu_orden_agrupada IN (' + ls_filtro + ')'
			dw_mp_x_reserva.SetFilter( ls_filtro )
			dw_mp_x_reserva.Filter()
			dw_mp_x_reserva.Sort()
			// Se descartan los registros que no cumplen
			If dw_mp_x_reserva.FilteredCount() > 0 Then
				dw_mp_x_reserva.RowsDiscard( 1, dw_mp_x_reserva.FilteredCount(), Filter! )
			End IF
			
			dw_mp_x_reserva.SetRedraw( True )
			If dw_mp_x_reserva.RowCount() > 0 Then
				dw_mp_x_reserva.Visible = True
			End If
		End If
		
End Choose


end event

type dw_mp_x_ord from u_dw_application within w_reserva_mp_orden_ct
boolean visible = false
integer x = 82
integer y = 704
integer width = 4571
integer height = 1468
boolean bringtotop = true
boolean titlebar = true
string title = "Info MP x Reservar"
string dataobject = "d_gr_mp_x_ordenes_x_reserva"
boolean controlmenu = true
boolean hscrollbar = true
boolean resizable = true
end type

event itemchanged;call super::itemchanged;Return 2
end event

type dw_opciones from u_dw_application within w_reserva_mp_orden_ct
integer x = 32
integer y = 2172
integer width = 4334
integer height = 176
integer taborder = 20
boolean bringtotop = true
string title = "Opciones"
string dataobject = "d_ff_opciones_reserva_mp_ct"
boolean vscrollbar = false
boolean resizable = true
boolean livescroll = false
end type

event buttonclicked;call super::buttonclicked;Long ll_orden, ll_rfind, ll_row_ant, ll_row_new
String ls_orden, ls_find

Choose Case Dwo.Name
	Case 'b_buscar'
		If This.AcceptText() <> 1 Then Return 0

		ll_orden = This.GetItemNumber( 1, 'nu_orden' )
		ls_find = 'nu_orden = ' + String( ll_orden )
		ll_rfind = dw_ordenes.Find( ls_find, 1, dw_ordenes.RowCount() )
		If ll_rfind > 0 Then
			ll_row_ant = dw_ordenes.GetRow() 
			
			dw_ordenes.ScrollToRow( ll_rfind )
			ll_row_new = dw_ordenes.GetRow() 
			// Si no cambio de foco se realiza el posicionamiento manual
			If ll_row_ant = ll_row_new And ll_rfind <> ll_row_new Then
				dw_ordenes.Object.datawindow.verticalscrollposition = ll_rfind
			End If
			dw_ordenes.SelectRow( 0, False )
			dw_ordenes.SelectRow( ll_rfind, True )
			dw_ordenes.SetColumn( 'agrupa_orden' )
			dw_ordenes.SetFocus()
		ElseIf ll_rfind = 0 Then
			MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'No se encontro la Orden: ' + ls_orden  )			
		End If
	Case 'b_reagrupar'
		dw_ordenes.SelectRow( 0, False )
		Parent.of_Reiniciar()
	Case 'b_validar_mp'
		If dw_ordenes.AcceptText() <> 1 Then
			Return -1
		End If
		dw_ordenes.SelectRow( 0, False )
		This.Modify( "b_validar_mp.Text='Validando ...'" )
		This.Modify( 'b_validar_mp.Enabled = "No"' )
		Yield()
		SetPointer( HourGlass! )
		
		If invo_reserva_mp.of_Validar_MP() > 0 Then
			This.Modify( 'b_reservar_mp.Enabled = "Yes"' )
		End If
		SetPointer( Arrow! )
		This.Modify( 'b_validar_mp.Enabled = "Yes"' )
		This.Modify( "b_validar_mp.Text='Validar MP'" )
		This.Modify( 'b_reagrupar.Enabled = "Yes"' )
	Case 'b_reservar_mp'
		If dw_ordenes.AcceptText() <> 1 Then
			Return -1
		End If
		This.Modify( "b_reservar_mp.Text='Reservando ...'" )
		This.Modify( 'b_reservar_mp.Enabled = "No"' )		
		dw_ordenes.SelectRow( 0, False )
		If invo_reserva_mp.of_Reservar_MP_Sap() > 0 Then
			This.Modify( 'b_pedir_mp.Enabled = "Yes"' )
		End If
		This.Modify( "b_reservar_mp.Text='Reservar MP'" )
		This.Modify( 'b_reservar_mp.Enabled = "Yes"' )		
	Case 'b_pedir_mp'
		If dw_ordenes.AcceptText() <> 1 Then
			Return -1
		End If
		This.Modify( "b_pedir_mp.Text='Pedir MP ...'" )
		This.Modify( 'b_pedir_mp.Enabled = "No"' )		
		dw_ordenes.SelectRow( 0, False )
		If invo_reserva_mp.of_Pedir_MP_SIS() > 0 Then
		
		End If
		This.Modify( "b_pedir_mp.Text='Pedir MP'" )
		This.Modify( 'b_pedir_mp.Enabled = "Yes"' )		
	
End Choose
end event

