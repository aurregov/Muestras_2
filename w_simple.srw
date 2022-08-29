HA$PBExportHeader$w_simple.srw
$PBExportComments$Para los maestros
forward
global type w_simple from w_sheet
end type
type dw_general from u_dw_base within w_simple
end type
type gb_general from u_gb_base within w_simple
end type
end forward

global type w_simple from w_sheet
integer width = 2043
integer height = 1228
dw_general dw_general
gb_general gb_general
end type
global w_simple w_simple

type variables
Protected:
         String           is_select_original
         String           is_usuario,is_instancia
         DateTime     idt_fecha
             
end variables

on w_simple.create
int iCurrent
call super::create
this.dw_general=create dw_general
this.gb_general=create gb_general
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_general
this.Control[iCurrent+2]=this.gb_general
end on

on w_simple.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_general)
destroy(this.gb_general)
end on

event open;call super::open;

If dw_general.of_Conexion(n_cst_application.itr_appl,True) <> 1 Then
	MessageBox("Error","No se ha podido establecer conexi$$HEX1$$f300$$ENDHEX$$n con la base de datos !. ",StopSign!)
	Close(This)
Else	
	is_select_original = dw_general.Describe('DataWindow.Table.Select')
	If is_select_original = '?' Or is_select_original = '!' Then
		MessageBox("Error","Se ha producido un error determinando el select !. ",StopSign!)
		Close(This)
	End If
End If	
	
//m_base lm_menu
//
//lm_menu = This.MenuId
//
////Deshabilitar opciones deacuerdo al perfil del usuario  
//n_cst_application.inv_seguridad.of_seguridad(lm_menu,"w_application")
end event

event closequery;
If dw_general.ModifiedCount() > 0 Or dw_general.DeletedCount() > 0 Then
	If MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Desea salir sin guardar los cambios ?.",Question!,YesNo!) = 2 Then
		Return 1
	End If	
End If	
end event

type dw_general from u_dw_base within w_simple
integer x = 69
integer y = 96
integer width = 1879
integer height = 872
boolean bringtotop = true
end type

event ue_update;Long         ll_i,ll_n
dwItemStatus l_status

If This.of_CompleteData() Then
	//Tambien actualizar fecha,usuario,instancia
	If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
													 idt_fecha,is_usuario,is_instancia) Then
		Return
	End If
	ll_n = This.RowCount()
	For ll_i = 1 To ll_n
		l_status = This.GetItemStatus(ll_i,0,Primary!)
		If l_status <> NotModified! Then
			//si el DataWindow tiene fe_actualizacion,usuario,instancia
			//entonces actualizarlas
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
	Else
		RollBack Using n_cst_application.itr_appl;
		MessageBox("Error","Se ha producido un error actualizando los datos !",StopSign!)
	End If
End If	
This.SetFocus()



end event

event ue_find;String ls_where,ls_error

If dw_general.ModifiedCount() > 0 Or dw_general.DeletedCount() > 0 Then
	If MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Desea buscar sin guardar los cambios ?.",Question!,YesNo!) = 2 Then
		Return 
	End If	
End If

OpenWithParm(w_find,This)
ls_where = Message.StringParm
If ls_where <> '?' Then
	ls_error = This.Modify("DataWindow.Table.Select='"+is_select_original+ls_where+"'")
	If ls_error = "" Then
		This.Retrieve()
	Else
		MessageBox("Error","Se ha producido un error determinando el select !. "+ls_error,StopSign!)
	End If
End If	
This.SetFocus()
end event

type gb_general from u_gb_base within w_simple
integer x = 41
integer y = 44
integer width = 1938
integer height = 956
integer taborder = 20
end type

