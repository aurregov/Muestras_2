HA$PBExportHeader$w_bus_h_composiciones.srw
forward
global type w_bus_h_composiciones from w_base_busqueda
end type
end forward

global type w_bus_h_composiciones from w_base_busqueda
string title = "Composici$$HEX1$$f300$$ENDHEX$$n"
end type
global w_bus_h_composiciones w_bus_h_composiciones

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_composicion")

Return 1
end function

on w_bus_h_composiciones.create
call super::create
end on

on w_bus_h_composiciones.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve()
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_h_composiciones
end type

event sle_1::modified;//de_composicion
of_filtro("de_composicion like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_h_composiciones
string text = "Digite composici$$HEX1$$f300$$ENDHEX$$n:"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_h_composiciones
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_h_composiciones
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_h_composiciones
integer x = 55
integer width = 1179
string dataobject = "d_lista_h_composiciones"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_h_composiciones
string text = "Lista de composiciones"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_h_composiciones
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda de composici$$HEX1$$f300$$ENDHEX$$n"
end type

