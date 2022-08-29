HA$PBExportHeader$w_depuracion_adm_recurso.srw
forward
global type w_depuracion_adm_recurso from w_sheet
end type
type dw_recurso from u_dw_application within w_depuracion_adm_recurso
end type
end forward

global type w_depuracion_adm_recurso from w_sheet
integer width = 1125
integer height = 1164
string title = "Agrupacion Recurso para Depuracion"
string menuname = "m_sheet_solicitud"
boolean maxbox = true
boolean resizable = true
dw_recurso dw_recurso
end type
global w_depuracion_adm_recurso w_depuracion_adm_recurso

type variables
Long ii_cs_depuracion
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
dw_recurso.Resize( newwidth - dw_recurso.x - 50, newheight - dw_recurso.Y - 50 )
end event

on w_depuracion_adm_recurso.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_sheet_solicitud" then this.MenuID = create m_sheet_solicitud
this.dw_recurso=create dw_recurso
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_recurso
end on

on w_depuracion_adm_recurso.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_recurso)
end on

event open;call super::open;/*
	FACL - 2019/03/11 - SA56847 - Ventana para administrar los agrupacion de recursos para la depuracion
*/

dw_recurso.SetTransObject(n_cst_application.itr_appl)

end event

event ue_save;call super::ue_save;// Se omite el script del ancestro
If dw_recurso.Update( True, False ) <> 1 Then
	MessageBox( 'Error', 'Ocurrio un error al guardar los productos' )
	Return
End If

COMMIT Using n_cst_application.itr_appl;

dw_recurso.ResetUpdate()

MessageBox( 'Exito', 'Se guardaron los productos con exito!' )	
end event

event ue_find;call super::ue_find;// Se omite el script del ancestro

dw_recurso.Retrieve( )


end event

type dw_recurso from u_dw_application within w_depuracion_adm_recurso
integer x = 18
integer y = 32
integer width = 1015
integer height = 904
string dataobject = "d_gr_depuracion_agrupa_recurso"
boolean hscrollbar = true
end type

event clicked;call super::clicked;If Row > 0 Then
	This.SetRow( Row )
End If
end event

event itemchanged;call super::itemchanged;//Return 2
end event

