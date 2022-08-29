HA$PBExportHeader$w_m_causas_mod_fmp.srw
forward
global type w_m_causas_mod_fmp from w_simple
end type
end forward

global type w_m_causas_mod_fmp from w_simple
integer width = 1792
integer height = 1288
string title = "Causas Modificaci$$HEX1$$f300$$ENDHEX$$n FMP"
end type
global w_m_causas_mod_fmp w_m_causas_mod_fmp

on w_m_causas_mod_fmp.create
call super::create
end on

on w_m_causas_mod_fmp.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;this.x = 1
this.y = 1

dw_general.Retrieve()
end event

event ue_save;call super::ue_save;If IsValid(dw_general) Then
	dw_general.Update()
	MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Datos guardados con $$HEX1$$e900$$ENDHEX$$xito.")
End If	
end event

type dw_general from w_simple`dw_general within w_m_causas_mod_fmp
integer x = 64
integer width = 1586
integer height = 940
string dataobject = "dw_m_causas_mod_fmp"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event dw_general::ue_insertrow;Long ll_fila, li_max

ll_fila = This.InsertRow(0)

  SELECT max(co_causa)  
    INTO :li_max  
    FROM m_causas_mod_fmp
	  using n_cst_application.itr_appl;

if isNull(li_max) then
	li_max = 1
else
	li_max = li_max + 1
end if

This.ScrollToRow(ll_fila)
this.setItem(ll_fila, "co_causa", li_max)
this.acceptText()
This.SetColumn(1)
This.SetFocus()
end event

type gb_general from w_simple`gb_general within w_m_causas_mod_fmp
integer x = 23
integer y = 24
integer width = 1691
integer height = 1060
end type

