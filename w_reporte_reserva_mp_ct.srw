HA$PBExportHeader$w_reporte_reserva_mp_ct.srw
$PBExportComments$SA57405- Reporte de Reservas de Materia Prima para control tecnico
forward
global type w_reporte_reserva_mp_ct from w_report
end type
type dw_parametro from u_dw_application within w_reporte_reserva_mp_ct
end type
end forward

global type w_reporte_reserva_mp_ct from w_report
integer width = 3954
integer height = 2372
string title = "Reporte Reserva MP Control Tecnico"
dw_parametro dw_parametro
end type
global w_reporte_reserva_mp_ct w_reporte_reserva_mp_ct

type variables
Long il_orden_adicional = 999999
end variables

on w_reporte_reserva_mp_ct.create
int iCurrent
call super::create
this.dw_parametro=create dw_parametro
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_parametro
end on

on w_reporte_reserva_mp_ct.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_parametro)
end on

event open;call super::open;/*
	FACL - 2017/10/30 - SA57405- Reporte de Reservas de Materia Prima para control tecnico
*/

dw_parametro.InsertRow( 0 )

dw_report.of_Conexion( n_cst_application.itr_appl, True)
dw_report.Modify("DataWindow.Print.Preview=Yes")
end event

event ue_find;/*
	FACL - 2017/10/30 - SA57405 - Se carga la informacion de la reserva de SAP
	
	Se omite el script del ancestro
*/
Long ll_co_reserva_sap, ll_nu_orden, ll_filas
Date ld_inicio, ld_final

If dw_parametro.AcceptText() <> 1 Then Return

ll_co_reserva_sap = dw_parametro.GetItemNumber( 1, 'co_reserva_sap' )
ll_nu_orden = dw_parametro.GetItemNumber( 1, 'nu_orden' )
ld_inicio = dw_parametro.GetItemDate( 1, 'fe_inicio' )
ld_final = dw_parametro.GetItemDate( 1, 'fe_final' )

If IsNull( ll_co_reserva_sap ) Then ll_co_reserva_sap = 0 
// Si tiene reserva no 
If IsNull( ll_nu_orden ) Or ll_co_reserva_sap > 0 Then ll_nu_orden = 0
// Se mueve la fecha final al siguiente dia para cargar los registros del dia final
ld_final = RelativeDate( ld_final, 1 )

ll_filas = dw_report.Retrieve( ll_co_reserva_sap, ll_nu_orden, ld_inicio, ld_final )
If ll_filas > 0 Then
	// ok
	dw_report.SetFocus()
ElseIf ll_filas = 0 Then
	MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'No se encontro informacion de la reserva' )
	REturn
Else
	MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'Ocurrio un error al consultar la reserva' )
	REturn
End If
	
end event

event resize;/*
	FACL - 2017/10/30 - SA57405 - Se redimiension el dw del reporte
	
	Se omite el script del ancestro
*/


dw_report.Resize( Newwidth - dw_report.X - 50, newheight - dw_report.Y - 50 )
dw_parametro.Resize( dw_report.width, dw_parametro.height )

end event

type dw_report from w_report`dw_report within w_reporte_reserva_mp_ct
integer x = 55
integer y = 204
integer width = 3712
integer height = 1876
string dataobject = "d_tb_reporte_reserva_mp_control_tecnico"
end type

event dw_report::itemchanged;call super::itemchanged;Return 2
end event

type dw_parametro from u_dw_application within w_reporte_reserva_mp_ct
integer x = 50
integer y = 44
integer width = 3127
integer height = 148
boolean bringtotop = true
string dataobject = "d_ff_ext_parm_rep_reserva_mp_ct"
boolean vscrollbar = false
boolean livescroll = false
end type

event itemchanged;call super::itemchanged;/*
	FACL - 2017

*/
Long ll_nu_orden, ll_co_reserva_sap, ll_filas

n_ds_application lds_orden

Choose Case Dwo.Name
	Case 'nu_orden'
		ll_nu_orden = Long( Data )
		// FACL 
		If ll_nu_orden = il_orden_adicional Then
			SetNull(ll_co_reserva_sap)
			This.SetItem( Row, 'co_reserva_sap', ll_co_reserva_sap )
		ElseIf ll_nu_orden > 0 Then
			lds_orden = CREATE n_ds_application
			lds_orden.of_Load( 'd_gr_dt_mu_ord_x_ordenes' )
			lds_orden.of_Conexion( n_cst_application.itr_appl, True )			
			
			ll_filas = lds_orden.Retrieve( {ll_nu_orden} )
			If ll_filas > 0 Then
				ll_co_reserva_sap = lds_orden.GetItemNumber( 1, 'co_reserva_sap' )
				This.SetItem( Row, 'co_reserva_sap', ll_co_reserva_sap )
			ElseIf ll_filas = 0 Then
				MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'La Orden No existe!' )
				Return 2
			Else
				MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'Fallo la consulta de la Orden!' )
				Return 2
			End If			
		End If
End Choose
end event

