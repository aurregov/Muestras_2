HA$PBExportHeader$w_m_grupos_cmps.srw
forward
global type w_m_grupos_cmps from w_simple
end type
end forward

global type w_m_grupos_cmps from w_simple
integer width = 1687
integer height = 1832
string title = "Grupos de Composici$$HEX1$$f300$$ENDHEX$$n (w_m_grupos_cmps)"
end type
global w_m_grupos_cmps w_m_grupos_cmps

on w_m_grupos_cmps.create
call super::create
end on

on w_m_grupos_cmps.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;this.x = 1
this.y = 1
end event

type dw_general from w_simple`dw_general within w_m_grupos_cmps
integer x = 64
integer width = 1545
integer height = 1528
string dataobject = "dw_m_grupos_cmps"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event ue_insertrow();Long ll_fila, li_max

ll_fila = This.InsertRow(0)

  SELECT max(co_grupo)  
    INTO :li_max  
    FROM m_grupos_cmps
	  using n_cst_application.itr_appl;

if isNull(li_max) then
	li_max = 1
else
	li_max = li_max + 1
end if

This.ScrollToRow(ll_fila)
this.setItem(ll_fila, "co_grupo", li_max)
this.acceptText()
This.SetColumn(1)
This.SetFocus()
end event

type gb_general from w_simple`gb_general within w_m_grupos_cmps
integer x = 23
integer y = 24
integer width = 1627
integer height = 1632
end type

