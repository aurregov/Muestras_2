HA$PBExportHeader$w_bus_m_unidades.srw
forward
global type w_bus_m_unidades from w_base_busqueda
end type
end forward

global type w_bus_m_unidades from w_base_busqueda
integer height = 1480
string title = "Unidades"
end type
global w_bus_m_unidades w_bus_m_unidades

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();
io_retorno.is_vector[1]=dw_1.GetItemString(il_fila,"co_unidad")

Return 1
end function

on w_bus_m_unidades.create
call super::create
end on

on w_bus_m_unidades.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve()
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_unidades
end type

event sle_1::modified;of_filtro("de_unidad like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_m_unidades
string text = "Digite unidad:"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_unidades
integer y = 1236
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_unidades
integer y = 1236
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_unidades
integer x = 64
integer y = 308
integer width = 1152
string dataobject = "d_lista_m_unidades"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_unidades
integer y = 224
string text = "unidades"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_unidades
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda de unidades"
end type

