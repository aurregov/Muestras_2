HA$PBExportHeader$w_maestro_producto_alta_rotacion.srw
forward
global type w_maestro_producto_alta_rotacion from w_sheet
end type
type dw_producto from u_dw_application within w_maestro_producto_alta_rotacion
end type
end forward

global type w_maestro_producto_alta_rotacion from w_sheet
integer width = 2757
integer height = 1840
string title = "Maestro Producto Alta Rotacion"
boolean maxbox = true
boolean resizable = true
dw_producto dw_producto
end type
global w_maestro_producto_alta_rotacion w_maestro_producto_alta_rotacion

type variables
Integer ii_co_fabrica_mp = 2
end variables

event resize;call super::resize;
dw_producto.Resize( newwidth - dw_producto.x - 50, newheight - dw_producto.Y - 50 )
end event

on w_maestro_producto_alta_rotacion.create
int iCurrent
call super::create
this.dw_producto=create dw_producto
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_producto
end on

on w_maestro_producto_alta_rotacion.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_producto)
end on

event open;call super::open;/*
	FACL - 2017/10/25 - SA57405 - Ventana para administrar los productos de alta rotacion
*/

dw_producto.SetTransObject(n_cst_application.itr_appl)

//// Se configura el menu para quitar la opcion de borrado
//If IsValid( m_sheet ) Then
//	m_sheet.m_edicion.m_clear.Visible = False
//	m_sheet.m_edicion.m_clear.ToolbarItemVisible = False
//End If
end event

event ue_save;call super::ue_save;// Se omite el script del ancestro
If dw_producto.Update( True, False ) <> 1 Then
	MessageBox( 'Error', 'Ocurrio un error al guardar los productos' )
	Return
End If

COMMIT Using n_cst_application.itr_appl;

dw_producto.ResetUpdate()

MessageBox( 'Exito', 'Se guardaron los productos con exito!' )	
end event

event ue_find;call super::ue_find;// Se omite el script del ancestro
dw_producto.Retrieve()
end event

type dw_producto from u_dw_application within w_maestro_producto_alta_rotacion
integer x = 64
integer y = 40
integer width = 2537
integer height = 1536
string dataobject = "d_gr_dt_producto_alta_rotacion"
end type

event itemchanged;call super::itemchanged;

Long ll_co_producto_mp, ll_co_color_mp, ll_rfind
Integer li_ret
String ls_de_producto, ls_de_color_mp, ls_find
n_cst_comun lnvo_comun


Choose Case Dwo.Name
	Case 'co_producto_mp'
		ll_co_producto_mp = Long( data )
		li_ret = lnvo_comun.of_NombreMatPrima( ll_co_producto_mp, n_cst_application.itr_appl )
		If li_ret > 0 Then
			ls_de_producto = lnvo_comun.of_GetString( 1 )
			This.SetItem( Row, 'de_producto', ls_de_producto )
		Else
			Post MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'El producto ' + String( ll_co_producto_mp )  + ' no existe!' )
			Return 2
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
				Return 2
			End If
			
			ls_de_color_mp = lnvo_comun.of_GetString( 1 )
			This.SetItem( Row, 'de_color_mp', ls_de_color_mp )
		Else
			Post MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'El color ' + String( ll_co_color_mp )  + ' no existe!' )
			Return 2
		End If
End Choose
end event

event clicked;call super::clicked;If Row > 0 Then
	This.SetRow( Row )
End If
end event

