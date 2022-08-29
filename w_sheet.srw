HA$PBExportHeader$w_sheet.srw
$PBExportComments$ventana tipo sheet, (esta venta contiene men$$HEX1$$fa00$$ENDHEX$$s y datawindows, w_report es heredada de esta)
forward
global type w_sheet from w_base
end type
end forward

global type w_sheet from w_base
string menuname = "m_sheet"
boolean maxbox = false
boolean resizable = false
end type
global w_sheet w_sheet

type variables
Protected:
                 u_dw_base  idw_data
      

end variables

forward prototypes
public subroutine of_setdatawindow (u_dw_base adw_datawindow)
end prototypes

public subroutine of_setdatawindow (u_dw_base adw_datawindow);
idw_data = adw_datawindow
end subroutine

on w_sheet.create
call super::create
if this.MenuName = "m_sheet" then this.MenuID = create m_sheet
end on

on w_sheet.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;m_base lm_menu

lm_menu = This.MenuId

//Deshabilitar opciones deacuerdo al perfil del usuario  
n_cst_application.inv_seguridad.of_seguridad(lm_menu,"w_application")
end event

event ue_close;
Close(This)
end event

event ue_copy;
If IsValid(idw_data) Then
	idw_data.Copy()
End If	
end event

event ue_cut;
If IsValid(idw_data) Then
	idw_data.Cut()
End If	
end event

event ue_deleterow;
If IsValid(idw_data) Then
	idw_data.Event ue_deleterow()
End If	
end event

event ue_filter;
If IsValid(idw_data) Then
	idw_data.Event ue_filter()
End If	
end event

event ue_undo;
If IsValid(idw_data) Then
	idw_data.Undo()
End If	
end event

event ue_save;
If IsValid(idw_data) Then
	idw_data.Event ue_update()
End If	
end event

event ue_print;
If IsValid(idw_data) Then
	idw_data.Event ue_print()
End If	
end event

event ue_paste;
If IsValid(idw_data) Then
	idw_data.Paste()
End If	
end event

event ue_insertrow;
If IsValid(idw_data) Then
	idw_data.Event ue_insertrow()
End If	
end event

event ue_sort;
If IsValid(idw_data) Then
	idw_data.Event ue_sort()
End If	
end event

event ue_preview;
If IsValid(idw_data) Then
	idw_data.Event ue_preview(ab_preview)
End If	
end event

event ue_saveas;
If IsValid(idw_data) Then
	idw_data.Event ue_saveas()
Else
	MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","No se han indicado datos para Guardar como... !.",Exclamation!)
End If	
end event

event ue_find;
If IsValid(idw_data) Then
	idw_data.Event ue_find()
End If	
end event

