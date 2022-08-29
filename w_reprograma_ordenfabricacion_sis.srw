HA$PBExportHeader$w_reprograma_ordenfabricacion_sis.srw
forward
global type w_reprograma_ordenfabricacion_sis from w_sheet
end type
type dw_parametro from datawindow within w_reprograma_ordenfabricacion_sis
end type
type dw_maestro from u_dw_application within w_reprograma_ordenfabricacion_sis
end type
end forward

global type w_reprograma_ordenfabricacion_sis from w_sheet
integer width = 3529
integer height = 1984
string title = "Reprogramar Orden Fabricacion SIS"
dw_parametro dw_parametro
dw_maestro dw_maestro
end type
global w_reprograma_ordenfabricacion_sis w_reprograma_ordenfabricacion_sis

type variables
Boolean ib_conectado_db2 = False
n_cst_conexiondb2 itr_Ordenesdb2
end variables

on w_reprograma_ordenfabricacion_sis.create
int iCurrent
call super::create
this.dw_parametro=create dw_parametro
this.dw_maestro=create dw_maestro
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_parametro
this.Control[iCurrent+2]=this.dw_maestro
end on

on w_reprograma_ordenfabricacion_sis.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_parametro)
destroy(this.dw_maestro)
end on

event open;call super::open;/*
	FACL - 2019//07/03 - SA60164 - Se crea ventana para Modificacion de Fechas Ordenes de Fabricacion de SIS
*/


Open( w_pedir_clave_reorden )

If Message.DoubleParm = 0 Then 
	Close( This )
	Return -1
End If

// Se configura el menu
If IsValid( m_sheet ) Then
	m_sheet.m_edicion.m_insertar.Visible = False
	m_sheet.m_edicion.m_insertar.ToolbarItemVisible = False
	
	m_sheet.m_edicion.m_clear.Visible = False
	m_sheet.m_edicion.m_clear.ToolbarItemVisible = False

	m_sheet.m_archivo.m_guardar.Visible = True
	m_sheet.m_archivo.m_guardar.ToolbarItemVisible = True

//	m_sheet.m_archivo.m_guardarcomo.ToolbarItemVisible = True
//	m_sheet.m_archivo.m_guardarcomo.Visible = True
End If


Try
	itr_Ordenesdb2 = Create n_cst_conexiondb2
	itr_Ordenesdb2.of_CargarTransaccionalDB2( )
Catch(Exception ex1)
	Throw ex1 
	Close( This )	
	Return -1
End Try


dw_maestro.of_Conexion( itr_Ordenesdb2, True )

dw_parametro.InsertRow(0)

Return 1
end event

event close;call super::close;// Se termina la conexion a DB2
If IsValid( itr_Ordenesdb2 ) Then
	itr_Ordenesdb2.of_DisconnectTransaccionalDB2()
	Destroy itr_Ordenesdb2
End If
end event

event ue_find;call super::ue_find;Long ll_cs_orden, ll_filas
String ls_co_ordenfabricacion, ls_co_maquina

If dw_parametro.AcceptText() <> 1 Then Return

ll_cs_orden = dw_parametro.GetItemNumber( 1, 'cs_orden' )
ls_co_ordenfabricacion = Trim(dw_parametro.GetItemString( 1, 'co_ordenfabricacion' ))
ls_co_maquina = Trim(dw_parametro.GetItemString( 1, 'co_maquina' ))

If IsNull( ll_cs_orden ) Then ll_cs_orden = 0
If IsNull( ls_co_ordenfabricacion ) Or ls_co_ordenfabricacion = '' Then ls_co_ordenfabricacion = '0'
If IsNull( ls_co_maquina ) Or ls_co_maquina = '' Then ls_co_maquina = '0'

If ll_cs_orden = 0 And ls_co_ordenfabricacion ='0' And ls_co_maquina = '0' Then
	MessageBox( 'Atencion' , 'Debe ingresar por lo menos un parametro!' )
	Return
End If

ll_filas = dw_maestro.Retrieve( ls_co_ordenfabricacion, ll_cs_orden, ls_co_maquina )
If ll_filas = 0 Then
	MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'No se encontro informacion con los datos parametros!' )
End If
	

end event

event ue_save;call super::ue_save;// Se omite el script del ancestro

/*
	FACL - 2019/07/04 - Se guarda log, y se actualizan los campos de auditoria
*/


String ls_error
Long ll_row, ll_log
n_ds_application lds_log_mod

String ls_usuario, ls_instancia
DateTime ldt_fecha

// Se verifican los datos modificados
If dw_maestro.AcceptText() <> 1 Then Return

// Si no tiene modificaciones
If dw_maestro.ModifiedCount() = 0 Then Return

// Se obtiene los campos de auditoria
If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return
End If

// Se llena el log de modificacion de fecha
lds_log_mod = CREATE n_ds_application
lds_log_mod.of_Load( 'd_gr_log_mod_fecha_ordenfab' )
lds_log_mod.of_Conexion( n_cst_application.itr_appl, True )
ll_row = dw_maestro.GetNextModified(0, Primary! )
Do While ll_row > 0
	ll_log = lds_log_mod.InsertRow( 0 )
	
	// Se registra el log
	lds_log_mod.SetItem( ll_log, 'co_ordenfabricacion', dw_maestro.GetItemString( ll_row, 'co_ordenfabricacion') )
	lds_log_mod.SetItem( ll_log, 'cs_orden', dw_maestro.GetItemNumber( ll_row, 'cs_orden') )
	lds_log_mod.SetItem( ll_log, 'fh_inicio_ant', dw_maestro.GetItemDateTime( ll_row, 'fh_inicio', Primary!, True ) )
	lds_log_mod.SetItem( ll_log, 'fh_fin_ant', dw_maestro.GetItemDateTime( ll_row, 'fh_fin', Primary!, True ) )
	lds_log_mod.SetItem( ll_log, 'fh_inicio_new', dw_maestro.GetItemDateTime( ll_row, 'fh_inicio' ) )
	lds_log_mod.SetItem( ll_log, 'fh_fin_new', dw_maestro.GetItemDateTime( ll_row, 'fh_fin') )
	lds_log_mod.SetItem( ll_log, 'fe_actualizacion', ldt_fecha )
	lds_log_mod.SetItem( ll_log, 'usuario', ls_usuario )
	
	// Se actualiza los campos de auditoria	
	dw_maestro.SetItem( ll_row, 'fh_actualizacion', ldt_fecha )
	dw_maestro.SetItem( ll_row, 'co_usuario', ls_usuario )
	
	ll_row = dw_maestro.GetNextModified(ll_row, Primary! )
Loop

// Se guarda el Log
If lds_log_mod.Update( True, False ) < 1 Then
	ls_error = 'Fallo actualizando el Log:~r~n' + n_cst_application.itr_appl.SQLErrText
	ROLLBACK USING itr_Ordenesdb2;
	ROLLBACK USING n_cst_application.itr_appl;
	MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'Ocurrio un error al guardar el log!~r~n' + ls_error )
// Se actualizan las fechas de las ordenes en SIS
ElseIf dw_maestro.Update( True, False ) < 1 Then
	ls_error = 'Fallo actualizando la Orden:~r~n' + itr_Ordenesdb2.SQLErrText
	ROLLBACK USING itr_Ordenesdb2;
	ROLLBACK USING n_cst_application.itr_appl;
	MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'Ocurrio un error al guardar las fechas de la orden en SIS!~r~n' + ls_error )
Else
	// Se hace commit en SIS y Muestras
	COMMIT USING itr_Ordenesdb2;
	COMMIT USING n_cst_application.itr_appl;
	MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'Se guardaron los datos con exito!' )
End If

Destroy lds_log_mod
end event

type dw_parametro from datawindow within w_reprograma_ordenfabricacion_sis
integer x = 69
integer y = 40
integer width = 3200
integer height = 132
integer taborder = 10
string title = "none"
string dataobject = "d_ff_param_reprog_orden_sis"
boolean border = false
boolean livescroll = true
end type

type dw_maestro from u_dw_application within w_reprograma_ordenfabricacion_sis
integer x = 69
integer y = 216
integer width = 3392
integer height = 1568
string dataobject = "d_gr_act_tb_ordenprevfab_sis"
boolean hscrollbar = true
end type

event itemchanged;call super::itemchanged;/*
	FACL - 2019/07/04 - Se verifica que las fechas no sean lejanas
*/

DateTime ldt_dato, ldt_inicio, ldt_fin
Date ld_dato
Long ll_dias

Choose Case Dwo.Name
	Case 'fh_inicio', 'fh_fin'
		ldt_dato = DateTime( data )
		ld_dato = Date(ldt_dato)
		
		ll_dias = DaysAfter( Today(), ld_dato )
		
//		If ll_dias < -60 Then
//			Post MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'La fecha es de mas de 60 dias atras!' )
//			Return 2
//		ElseIf ll_dias >= 365 Then
//			Post MessageBox( 'Atenci$$HEX1$$f300$$ENDHEX$$n', 'La fecha es de mas de un a$$HEX1$$f100$$ENDHEX$$o hacia adelante!' )
//			Return 2
//		End If	
		
		/*
		ldt_inicio	= This.GetItemDateTime( Row, 'fh_inicio' )
		ldt_fin	= This.GetItemDateTime( Row, 'fh_fin' )
		
		If String(  Dwo.Name ) = 'fh_inicio' Then
			ldt_inicio = ldt_dato
		Else
			ldt_fin = ldt_dato
		End If
		*/		
End Choose
end event

