HA$PBExportHeader$w_bus_m_carac_vta.srw
forward
global type w_bus_m_carac_vta from w_base_busqueda
end type
end forward

global type w_bus_m_carac_vta from w_base_busqueda
string title = "caracteristica de venta"
end type
global w_bus_m_carac_vta w_bus_m_carac_vta

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_carac_vta")

Return 1
end function

on w_bus_m_carac_vta.create
call super::create
end on

on w_bus_m_carac_vta.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve(io_param.il_vector[1])
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_carac_vta
end type

event sle_1::modified;of_filtro("de_carac_vta like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_m_carac_vta
integer width = 485
string text = "Digite caracateristica:"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_carac_vta
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_carac_vta
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_carac_vta
integer x = 69
integer y = 272
integer width = 1143
string dataobject = "d_lista_m_carac_vta"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_carac_vta
string text = "Lista de caracteristicas"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_carac_vta
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda caracteristica venta"
end type

