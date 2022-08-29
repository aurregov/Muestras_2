HA$PBExportHeader$w_m_causas_repeticiones.srw
forward
global type w_m_causas_repeticiones from w_simple
end type
end forward

global type w_m_causas_repeticiones from w_simple
integer width = 2240
integer height = 1632
string title = "Causas Repeticiones"
end type
global w_m_causas_repeticiones w_m_causas_repeticiones

on w_m_causas_repeticiones.create
call super::create
end on

on w_m_causas_repeticiones.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;this.x = 1
this.y = 1

dw_general.Retrieve()
end event

event ue_save;call super::ue_save;//If IsValid(dw_general) Then
//	If dw_general.Update() < 0 Then
//		ROLLBACK USING n_cst_application.itr_appl;
//		MessageBox('Atenci$$HEX1$$f300$$ENDHEX$$n','Ocurrio un inconveniente al actualizar la base de datos')
//		Return
//	End if
//	
//	COMMIT USING n_cst_application.itr_appl;
//	MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Datos guardados con $$HEX1$$e900$$ENDHEX$$xito.")
//End If	
end event

type dw_general from w_simple`dw_general within w_m_causas_repeticiones
integer x = 64
integer width = 2080
integer height = 1324
string dataobject = "d_gr_m_causa_repeticion"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event dw_general::ue_update;Long         ll_i,ll_n, ll_tipoprod
String ls_descripcion
dwItemStatus l_status

If This.of_CompleteData() Then
	//Tambien actualizar fecha,usuario,instancia
	If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
													 idt_fecha,is_usuario,is_instancia) Then
		Return
	End If
	ll_n = This.RowCount()
	For ll_i = 1 To ll_n
		
		ls_descripcion = Trim(This.GetItemString(ll_i,'de_causa_repeticion'))
		//valida que no este en blanco
		If Isnull(ls_descripcion) or ls_descripcion = '' Then
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Hay registros con el campo descripci$$HEX1$$f300$$ENDHEX$$n en blanco.")
			Return
		End if
		
		ll_tipoprod = This.GetItemNumber(ll_i,'co_tipoprod')
		//valida que no este en blanco
		If Isnull(ll_tipoprod) or ll_tipoprod <= 0 Then
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Hay registros con el campo tipo producto en blanco.")
			Return
		End if
		
		l_status = This.GetItemStatus(ll_i,0,Primary!)
		If l_status <> NotModified! Then
			//si el DataWindow tiene fe_actualizacion,usuario,instancia
			//entonces actualizarlas
			If This.of_ExistColumn('fe_creacion') Then
				If Isnull(This.GetItemDateTime(ll_i,'fe_creacion')) Then
					This.SetItem(ll_i,'fe_creacion',idt_fecha)
				End if
			End If
			If This.of_ExistColumn('fe_actualizacion') Then
				This.SetItem(ll_i,'fe_actualizacion',idt_fecha)
			End If
			If This.of_ExistColumn('usuario') Then
				This.SetItem(ll_i,'usuario',is_usuario)
			End If	
			If This.of_ExistColumn('instancia') Then
				This.SetItem(ll_i,'instancia',is_instancia)
			End If	
		End If
	Next
	If This.Update(True) = 1 Then
		Commit Using n_cst_application.itr_appl;
		MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Datos guardados con $$HEX1$$e900$$ENDHEX$$xito.")
	Else
		RollBack Using n_cst_application.itr_appl;
		MessageBox("Error","Se ha producido un error actualizando los datos !",StopSign!)
	End If
End If	
This.SetFocus()



end event

type gb_general from w_simple`gb_general within w_m_causas_repeticiones
integer x = 23
integer y = 24
integer width = 2162
integer height = 1432
end type

