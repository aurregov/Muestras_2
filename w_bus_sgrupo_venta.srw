HA$PBExportHeader$w_bus_sgrupo_venta.srw
forward
global type w_bus_sgrupo_venta from w_base_busqueda
end type
end forward

global type w_bus_sgrupo_venta from w_base_busqueda
string title = "Subgrupo de venta"
end type
global w_bus_sgrupo_venta w_bus_sgrupo_venta

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_sgrupo_vta")

Return 1
end function

on w_bus_sgrupo_venta.create
call super::create
end on

on w_bus_sgrupo_venta.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve(io_param.il_vector[1])
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_sgrupo_venta
end type

event sle_1::modified;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 10 de Febrero de 2003 HORA 08:09:10:890
// 
// OverWrite Ancestor script
//////////////////////////////////////////////////////////////////////////

of_filtro("de_sgrupo_vta like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_sgrupo_venta
string text = "Digite subgrupo:"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_sgrupo_venta
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_sgrupo_venta
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_sgrupo_venta
integer x = 73
integer width = 1161
string dataobject = "d_lista_m_sgrupos_vta"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_sgrupo_venta
string text = "Lista de subgrupos"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_sgrupo_venta
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda subgrupo venta"
end type

