HA$PBExportHeader$w_reserva_mp_adicional_ct.srw
forward
global type w_reserva_mp_adicional_ct from w_sheet
end type
type dw_1 from u_dw_application within w_reserva_mp_adicional_ct
end type
type dw_mp_x_reserva from u_dw_application within w_reserva_mp_adicional_ct
end type
type dw_opciones from u_dw_application within w_reserva_mp_adicional_ct
end type
end forward

global type w_reserva_mp_adicional_ct from w_sheet
integer width = 3758
integer height = 2064
string title = "Reserva MP Control Tecnico Adicionales"
boolean maxbox = true
boolean resizable = true
dw_1 dw_1
dw_mp_x_reserva dw_mp_x_reserva
dw_opciones dw_opciones
end type
global w_reserva_mp_adicional_ct w_reserva_mp_adicional_ct

type variables
Integer ii_co_fabrica_mp = 2
n_cst_reserva_mp_orden invo_reserva_mp



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


If ll_rfind > 0 Then
	//cb_pedir_mp.Enabled = True
	dw_opciones.Modify( 'b_pedir_mp.Enabled = "Yes"' )
End If


Return 1
end function

on w_reserva_mp_adicional_ct.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.dw_mp_x_reserva=create dw_mp_x_reserva
this.dw_opciones=create dw_opciones
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.dw_mp_x_reserva
this.Control[iCurrent+3]=this.dw_opciones
end on

on w_reserva_mp_adicional_ct.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_1)
destroy(this.dw_mp_x_reserva)
destroy(this.dw_opciones)
end on

event open;call super::open;/*
	FACL - 2018/02/19 - SA58161 - Ventana para realizar la reserva adicion para Control Tecnico	
*/

dw_opciones.InsertRow(0)

dw_mp_x_reserva.of_Conexion(n_cst_application.itr_appl,True)

invo_reserva_mp = Create n_cst_reserva_mp_orden
invo_reserva_mp.of_Set_Dw_Mp_Adicional( dw_mp_x_reserva ) 

// Se configura el menu
If IsValid( m_sheet ) Then
	m_sheet.m_edicion.m_insertar.Visible = True
	m_sheet.m_edicion.m_insertar.ToolbarItemVisible = True
	
	m_sheet.m_edicion.m_clear.Visible = True
	m_sheet.m_edicion.m_clear.ToolbarItemVisible = True

	m_sheet.m_archivo.m_buscar.Visible = False
	m_sheet.m_archivo.m_buscar.ToolbarItemVisible = False

	m_sheet.m_archivo.m_guardar.Visible = False
	m_sheet.m_archivo.m_guardar.ToolbarItemVisible = False

	m_sheet.m_archivo.m_guardarcomo.ToolbarItemVisible = True
	m_sheet.m_archivo.m_guardarcomo.Visible = True
End If

dw_mp_x_reserva.Modify( "co_reserva_sap.Visible= 'No',  nu_orden_agrupada.Visible= 'No'" )

dw_mp_x_reserva.InsertRow( 0 )
end event

event ue_find;call super::ue_find;// Se cargan los datos de las ordenes por Reserva
If invo_reserva_mp.Of_Cargar_Ordenes_x_Reserva( ) > 0 Then
	This.of_Reiniciar()
End If

end event

event close;call super::close;Destroy invo_reserva_mp
end event

event resize;call super::resize;
//dw_ordenes.Resize( newwidth - dw_ordenes.X - 50, newheight - dw_ordenes.Y - 200 )

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

type dw_1 from u_dw_application within w_reserva_mp_adicional_ct
integer x = 41
integer y = 1884
integer width = 3639
integer height = 176
integer taborder = 30
boolean bringtotop = true
string title = "Opciones"
string dataobject = "d_ff_opciones_reserva_mp_add_ct"
boolean vscrollbar = false
boolean resizable = true
boolean livescroll = false
end type

type dw_mp_x_reserva from u_dw_application within w_reserva_mp_adicional_ct
integer x = 41
integer y = 40
integer width = 3639
integer height = 1616
integer taborder = 20
string title = "MP Adicional"
string dataobject = "d_gr_dt_mu_ord_reserva_agrupada_add"
boolean hscrollbar = true
end type

event itemchanged;call super::itemchanged;/*
	FACL - 2018/02/20 - SAXXXXX - Se 
*/

Long ll_co_producto_mp, ll_co_color_mp, ll_rfind, ll_nulo
Integer li_ret, li_nu_conos
String ls_de_producto, ls_de_color_mp, ls_find
Decimal ldc_peso_std, ldc_gr_necesidad, ldc_gr_reserva, ldc_inventario_disponible
n_cst_comun lnvo_comun

SetNull( ll_nulo )
Choose Case Dwo.Name
	Case 'co_producto_mp'
		ll_co_producto_mp = Long( data )
		li_ret = lnvo_comun.of_NombreMatPrima( ll_co_producto_mp, n_cst_application.itr_appl )
		If li_ret > 0 Then
			ls_de_producto = lnvo_comun.of_GetString( 1 )
			This.SetItem( Row, 'de_producto', ls_de_producto )
			This.SetItem( Row, 'co_color_mp', ll_nulo )
			This.SetItem( Row, 'de_color_mp', ll_nulo )
			This.SetItem( Row, 'peso_mp_estandar', ll_nulo )
			This.SetItem( Row, 'ca_gramos_necesidad', ll_nulo )
			This.SetItem( Row, 'ca_gramos_reserva', ll_nulo )
			This.SetItem( Row, 'inventario_disponible', ll_nulo )
		Else
			Post MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'Materia Prima ' + String( ll_co_producto_mp )  + ' no existe registrado!' )
			Return 1
		End If
	Case 'co_color_mp'
		ll_co_producto_mp = This.GetItemNumber( Row, 'co_producto_mp' )
		ll_co_color_mp = Long( data )
		li_ret = lnvo_comun.of_NombreColor_MP( ii_co_fabrica_mp, ll_co_producto_mp, ll_co_color_mp, n_cst_application.itr_appl)
		If li_ret > 0 Then
			ls_find = 'co_producto_mp = ' + String ( ll_co_producto_mp ) + ' AND co_color_mp = ' + String( ll_co_color_mp )
			ll_rfind = This.Find( ls_find, 1, This.RowCount() )
			If ll_rfind = Row Then
				ll_rfind = This.Find( ls_find, ll_rfind + 1, This.RowCount() + 1 )
			End IF
			If ll_rfind > 0 Then
				Post MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'El registro ya existe!' )
				Return 1
			End If
			
			li_ret = invo_reserva_mp.of_Producto_Alta_Rotacion( ll_co_producto_mp, ll_co_color_mp )
			If li_ret = 1 Then
				Post MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'El Material ' + String(ll_co_producto_mp) + ' Color ' + String(ll_co_color_mp) +' es de Alta Rotacion!' )
				Return 1
			End If
			
			ls_de_color_mp = lnvo_comun.of_GetString( 1 )
			This.SetItem( Row, 'de_color_mp', ls_de_color_mp )
			This.SetItem( Row, 'peso_mp_estandar', ll_nulo )
			This.SetItem( Row, 'ca_gramos_necesidad', ll_nulo )
			This.SetItem( Row, 'ca_gramos_reserva', ll_nulo )
			This.SetItem( Row, 'inventario_disponible', ll_nulo )
		Else
			Post MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'El color ' + String( ll_co_color_mp )  + ' no existe registrado!' )
			Return 1
		End If
	Case 'nu_conos'
		ldc_peso_std = This.GetItemDecimal( Row, 'peso_mp_estandar' )
		If ldc_peso_std > 0 Then
			li_nu_conos = Integer( Data )
			ldc_inventario_disponible = This.GetItemDecimal( Row, 'inventario_disponible' )
			
			ldc_gr_necesidad = ldc_peso_std * li_nu_conos
			
			This.SetItem( Row, 'ca_gramos_necesidad', ldc_gr_necesidad )

			If ldc_inventario_disponible > 0 Then
				If ldc_gr_necesidad < ldc_inventario_disponible Then
					ldc_gr_reserva = ldc_gr_necesidad
				Else
					ldc_gr_reserva = 0
				End If
				
				This.SetItem( Row, 'ca_gramos_reserva', ldc_gr_reserva )
			End If
			
			

		End If
End Choose
end event

event ue_insertrow;call super::ue_insertrow;This.SetColumn( 'co_producto_mp' )
end event

event itemerror;// Se omite el script del ancestro

// Se selecciona el texto
This.SelectText(1, Len(This.GetText()) )
// Reject the data value with no message box
Return 1
end event

type dw_opciones from u_dw_application within w_reserva_mp_adicional_ct
integer x = 41
integer y = 1688
integer width = 3639
integer height = 176
integer taborder = 20
boolean bringtotop = true
string title = "Opciones"
string dataobject = "d_ff_opciones_reserva_mp_add_ct"
boolean vscrollbar = false
boolean resizable = true
boolean livescroll = false
end type

event buttonclicked;call super::buttonclicked;Long ll_orden, ll_rfind, ll_row_ant, ll_row_new, ll_ret
String ls_orden, ls_find

Choose Case Dwo.Name
	Case 'b_validar_mp'
		If dw_mp_x_reserva.AcceptText() <> 1 Then
			Return -1
		End If
		dw_mp_x_reserva.SelectRow( 0, False )
		This.Modify( "b_validar_mp.Text='Validando ...' b_validar_mp.Enabled = 'No'" )
		Yield()
		SetPointer( HourGlass! )
		
		If invo_reserva_mp.of_Validar_MP_Adicional( True ) > 0 Then
			This.Modify( 'b_reservar_mp.Enabled = "Yes"' )
		End If
		SetPointer( Arrow! )
		This.Modify( 'b_validar_mp.Text="Validar MP" b_validar_mp.Enabled = "Yes"' )
	Case 'b_reservar_mp'
		If dw_mp_x_reserva.AcceptText() <> 1 Then
			Return -1
		End If
		dw_mp_x_reserva.SelectRow( 0, False )
		
		
		ls_find = 'nu_conos = 0 Or IsNull(nu_conos)'
		ll_rfind = dw_mp_x_reserva.Find( ls_find, 1, dw_mp_x_reserva.RowCount() )
		If ll_rfind > 0 Then
			MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'Existe Materia Prima con cantidad de conos 0' )
			Return -1
		End If
		
		
		// Se vuelve a Validar la MP
		This.Modify( "b_validar_mp.Text='Validando ...' b_validar_mp.Enabled = 'No' b_reservar_mp.Enabled = 'No'" )
		Yield()
		SetPointer( HourGlass! )	
		ll_ret = invo_reserva_mp.of_Validar_MP_Adicional( False )
		This.Modify( 'b_validar_mp.Text="Validar MP" b_validar_mp.Enabled = "Yes" b_reservar_mp.Enabled = "Yes"' )
		If ll_ret <= 0 Then
			Return
		End If
		SetPointer( Arrow! )
		
		
		This.Modify( 'b_reservar_mp.Enabled = "Yes"' )
		// Se realizan las validaciones para realizar Reserva en SAP y Pedido en SIS
		ls_find = 'IsNull(inventario_disponible)'
		ll_rfind = dw_mp_x_reserva.Find( ls_find, 1, dw_mp_x_reserva.RowCount() )
		If ll_rfind > 0 Then
			MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'No ha validado MP!' )
			Return -1
		End If
		
		ls_find = 'ca_gramos_reserva > inventario_disponible'
		ll_rfind = dw_mp_x_reserva.Find( ls_find, 1, dw_mp_x_reserva.RowCount() )
		If ll_rfind > 0 Then
			MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'No puede reservar mas del inventario Disponible' )
			Return -1
		End If		
		
		ls_find = 'ca_gramos_reserva = 0 Or IsNull(ca_gramos_reserva)'
		ll_rfind = dw_mp_x_reserva.Find( ls_find, 1, dw_mp_x_reserva.RowCount() )
		If ll_rfind > 0 Then
			MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'Hay materiales con Gr. Reserva iguales a cero' )
			Return -1
		End If
		
		
		// Se realiza la reserva de sap y el pedido de SIS
		This.Modify( "b_reservar_mp.Text='Reservando ...' b_reservar_mp.Enabled = 'No'" )
		SetPointer( HourGlass! )
		ll_ret = invo_reserva_mp.of_Reserva_Pide_MP_Adicional()
		If ll_ret = 1 Then
			dw_mp_x_reserva.Reset()
			dw_mp_x_reserva.InsertRow(0)
		End If
		SetPointer( Arrow! )
		This.Modify( "b_reservar_mp.Text='Reservar y Pedir MP' b_reservar_mp.Enabled = 'Yes'" )
	
End Choose


end event

event ue_insertrow;// Se omite el script del ancestro


end event

