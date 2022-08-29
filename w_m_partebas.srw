HA$PBExportHeader$w_m_partebas.srw
forward
global type w_m_partebas from w_simple
end type
end forward

global type w_m_partebas from w_simple
integer width = 2487
string title = "Partes B$$HEX1$$e100$$ENDHEX$$sicas"
end type
global w_m_partebas w_m_partebas

on w_m_partebas.create
call super::create
end on

on w_m_partebas.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;this.x = 1
this.y = 1

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Por favor no utilice esta opci$$HEX1$$f300$$ENDHEX$$n, actualmente se esta manejando un nuevo maestro de partes para las medidas.")
MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Por favor no utilice esta opci$$HEX1$$f300$$ENDHEX$$n, actualmente se esta manejando un nuevo maestro de partes para las medidas.")
MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Por favor no utilice esta opci$$HEX1$$f300$$ENDHEX$$n, actualmente se esta manejando un nuevo maestro de partes para las medidas.")


end event

type dw_general from w_simple`dw_general within w_m_partebas
integer y = 108
integer width = 2345
integer height = 860
string dataobject = "dw_m_partebas"
end type

type gb_general from w_simple`gb_general within w_m_partebas
integer width = 2409
end type

