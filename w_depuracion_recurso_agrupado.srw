HA$PBExportHeader$w_depuracion_recurso_agrupado.srw
forward
global type w_depuracion_recurso_agrupado from w_sheet
end type
type dw_ordenes from u_dw_application within w_depuracion_recurso_agrupado
end type
type dw_log from u_dw_application within w_depuracion_recurso_agrupado
end type
type dw_recurso from u_dw_application within w_depuracion_recurso_agrupado
end type
type dw_parametro from u_dw_application within w_depuracion_recurso_agrupado
end type
end forward

global type w_depuracion_recurso_agrupado from w_sheet
integer width = 4270
integer height = 2116
string title = "Depuracion Recurso Agrupado"
boolean maxbox = true
boolean resizable = true
dw_ordenes dw_ordenes
dw_log dw_log
dw_recurso dw_recurso
dw_parametro dw_parametro
end type
global w_depuracion_recurso_agrupado w_depuracion_recurso_agrupado

type variables
Long ii_cs_depuracion

n_cst_reserva_mp_orden invo_reserva_mp
end variables

forward prototypes
public function integer of_pr_depurar_fichas_mp (long al_co_recuso_agrupado, long al_co_muestra, integer ai_sw_accion)
end prototypes

public function integer of_pr_depurar_fichas_mp (long al_co_recuso_agrupado, long al_co_muestra, integer ai_sw_accion);Long ll_error
String ls_error


DECLARE depurar_fichas_mp PROCEDURE FOR pr_depurar_fichas_mp(:al_co_recuso_agrupado, :al_co_muestra, :ai_sw_accion)
Using n_cst_application.itr_appl;

CLOSE depurar_fichas_mp;


EXECUTE depurar_fichas_mp;



IF n_cst_application.itr_appl.SQLCode >= 0 THEN
	FETCH depurar_fichas_mp INTO :ii_cs_depuracion ;	
End If

IF n_cst_application.itr_appl.SQLCode < 0 THEN
	ll_error = n_cst_application.itr_appl.SQLCode
	ls_error = n_cst_application.itr_appl.SQLErrText
	ROLLBACK Using n_cst_application.itr_appl;
	CLOSE depurar_fichas_mp;

	MessageBox("Advertencia - Error de Base Datos","Error al ejecutar el procedimiento almacenado <pr_depurar_fichas_mp>"+&
			"~n~nError : "+ String(ll_error) + " - "+ trim(ls_error) + "~n~nConsulte con el administrador del sistema",StopSign!)
	Return -1
End If


Return ii_cs_depuracion
end function

event resize;call super::resize;
dw_log.Resize( newwidth - dw_log.x - 50, newheight - dw_log.Y - 50 )
dw_recurso.Resize( newwidth - dw_recurso.x - 50, dw_recurso.height )
end event

on w_depuracion_recurso_agrupado.create
int iCurrent
call super::create
this.dw_ordenes=create dw_ordenes
this.dw_log=create dw_log
this.dw_recurso=create dw_recurso
this.dw_parametro=create dw_parametro
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_ordenes
this.Control[iCurrent+2]=this.dw_log
this.Control[iCurrent+3]=this.dw_recurso
this.Control[iCurrent+4]=this.dw_parametro
end on

on w_depuracion_recurso_agrupado.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_ordenes)
destroy(this.dw_log)
destroy(this.dw_recurso)
destroy(this.dw_parametro)
end on

event open;call super::open;/*
	FACL - 2019/03/08 - SA56847 - Ventana para manejar la simulacion de depuracion
*/

dw_parametro.SetTransObject(n_cst_application.itr_appl)
dw_log.SetTransObject(n_cst_application.itr_appl)
dw_recurso.SetTransObject(n_cst_application.itr_appl)


dw_parametro.InsertRow(0)


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

event ue_save;call super::ue_save;// Se omite el script del ancestro
//If dw_producto.Update( True, False ) <> 1 Then
//	MessageBox( 'Error', 'Ocurrio un error al guardar los productos' )
//	Return
//End If

//COMMIT Using n_cst_application.itr_appl;

//dw_producto.ResetUpdate()

//MessageBox( 'Exito', 'Se guardaron los productos con exito!' )	
end event

event ue_find;call super::ue_find;// Se omite el script del ancestro

Long ll_co_recurso, ll_co_muestra
Integer li_sw_accion


If dw_parametro.AcceptText() <> 1 Then Return

ii_cs_depuracion = 0
ll_co_recurso = dw_parametro.GetItemNumber( 1, 'co_recurso_agrupado' )
ll_co_muestra = dw_parametro.GetItemNumber( 1, 'co_muestra' )
li_sw_accion = dw_parametro.GetItemNumber( 1, 'sw_accion' )

If ll_co_recurso <= 0 Or IsNull( ll_co_recurso ) Then Return


If IsNull( ll_co_muestra ) Then ll_co_muestra = 0
	

//If ll_co_muestra <= 0 Or  Then Return


If This.of_Pr_Depurar_Fichas_MP( ll_co_recurso, ll_co_muestra, li_sw_accion ) < 0 Then
	Return
End If

dw_recurso.Retrieve( ii_cs_depuracion )
dw_log.Retrieve( ii_cs_depuracion )

ROLLBACK Using n_cst_application.itr_appl;
end event

event close;call super::close;Destroy invo_reserva_mp
end event

type dw_ordenes from u_dw_application within w_depuracion_recurso_agrupado
boolean visible = false
integer x = 174
integer y = 728
integer width = 2245
integer height = 916
boolean titlebar = true
string title = "Ordenes SIS"
string dataobject = "d_gr_consulta_ordenes_sis"
boolean controlmenu = true
end type

event clicked;call super::clicked;If Row > 0 Then
	This.SetRow( Row )
End If
end event

event doubleclicked;call super::doubleclicked;opensheet(w_depuracion_adm_recurso, Parent,6,original!)
end event

event itemchanged;call super::itemchanged;Return 2
end event

type dw_log from u_dw_application within w_depuracion_recurso_agrupado
integer x = 50
integer y = 376
integer width = 4055
integer height = 1508
string dataobject = "d_gr_depuracion_agrupado_log"
end type

event clicked;call super::clicked;If Row > 0 Then
	This.SetRow( Row )
End If
end event

event itemchanged;call super::itemchanged;Return 2
end event

event doubleclicked;call super::doubleclicked;String ls_co_material, ls_co_talla
Long ll_co_referencia, ll_co_talla, ll_co_recursos[], ll_i

If Row = 0 Then Return

Choose Case Dwo.Name
	Case 'nro_ordenes_sis'
		ll_co_referencia = This.GetItemNumber( Row, 'co_referencia' )
		ll_co_talla = This.GetItemNumber( Row, 'co_talla' )
		
		
		ls_co_material = String( ll_co_referencia )
		ls_co_talla = String( ll_co_talla,'00' )
		
		For ll_i = 1 To dw_recurso.RowCount()
			ll_co_recursos[ ll_i ] = dw_recurso.GetItemNumber( ll_i, 'co_recurso' )
		Next
		
		If dw_recurso.RowCount() > 0 Then
			If Not IsValid( invo_reserva_mp ) Then
				invo_reserva_mp = Create n_cst_reserva_mp_orden
				
				If invo_reserva_mp.of_Conectar_DB2() < 0 Then
					Destroy invo_reserva_mp
					Return 0
				End If				
			End If
			
			dw_ordenes.SetTransObject( invo_reserva_mp.itr_Ordenesdb2 )
			
			dw_ordenes.Reset()
			dw_ordenes.Visible = True
			dw_ordenes.Retrieve( ls_co_material, ls_co_talla, ll_co_recursos )
		End If
		
End Choose
end event

type dw_recurso from u_dw_application within w_depuracion_recurso_agrupado
integer x = 2894
integer y = 4
integer width = 1207
integer height = 348
string dataobject = "d_gr_depuracion_agrupado_recurso"
end type

event clicked;call super::clicked;If Row > 0 Then
	This.SetRow( Row )
End If
end event

event itemchanged;call super::itemchanged;Return 2
end event

event doubleclicked;call super::doubleclicked;opensheet(w_depuracion_adm_recurso, Parent,6,original!)
end event

type dw_parametro from u_dw_application within w_depuracion_recurso_agrupado
integer x = 64
integer y = 40
integer width = 2725
integer height = 164
string dataobject = "d_ff_depuracion_agrupado"
end type

event clicked;call super::clicked;If Row > 0 Then
	This.SetRow( Row )
End If
end event

