HA$PBExportHeader$w_mu_recurso_ct.srw
$PBExportComments$Recursos de tejido de muestras
forward
global type w_mu_recurso_ct from w_simple
end type
end forward

global type w_mu_recurso_ct from w_simple
integer width = 2569
integer height = 1140
string title = "Recursos de tejido para muestras"
end type
global w_mu_recurso_ct w_mu_recurso_ct

on w_mu_recurso_ct.create
call super::create
end on

on w_mu_recurso_ct.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_general from w_simple`dw_general within w_mu_recurso_ct
integer x = 50
integer y = 52
integer width = 2450
string dataobject = "d_mu_recurso_ct"
end type

event dw_general::doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 23 de Febrero de 2005 HORA 10:25:51:265
// 
// 
//////////////////////////////////////////////////////////////////////////

n_cst_param lo_param

If dwo.name="co_recurso" Then
	Open(w_bus_m_recurso_tj)

	lo_param=Message.PowerObjectParm

	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
		AcceptText()
	End If
End If
end event

event dw_general::itemchanged;call super::itemchanged;long ll_dato,ll_res
n_cst_comun lo_comun

If dwo.name="co_recurso" Then
	ll_dato=Long(Data)
	
	If IsNull(ll_dato) Then
		SetItem(row,"de_recurso","")		
		Return 0
	End If	
	
	ll_res=lo_comun.of_nombreRecursoTj(ll_dato,n_cst_application.itr_appl)
	
	If ll_res<>1 Then 
		MessageBox("Advertencia!","Recurso no v$$HEX1$$e100$$ENDHEX$$lido",StopSign!)
		Return 2								 
	End If

	SetItem(Row,"descripcion",lo_comun.of_getString(1))
End If

end event

type gb_general from w_simple`gb_general within w_mu_recurso_ct
integer x = 23
integer y = 0
integer width = 2510
end type

