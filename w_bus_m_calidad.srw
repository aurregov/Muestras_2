HA$PBExportHeader$w_bus_m_calidad.srw
forward
global type w_bus_m_calidad from w_base_busqueda
end type
end forward

global type w_bus_m_calidad from w_base_busqueda
string title = "b$$HEX1$$fa00$$ENDHEX$$squeda de calidad"
end type
global w_bus_m_calidad w_bus_m_calidad

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();
io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_calidad")

Return 1
end function

on w_bus_m_calidad.create
call super::create
end on

on w_bus_m_calidad.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve()
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_calidad
end type

event sle_1::modified;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 08 de Febrero de 2003 HORA 13:16:40:500
// 
// OverWrite Ancestor Script
//////////////////////////////////////////////////////////////////////////


of_filtro("de_calidad like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_m_calidad
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_calidad
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_calidad
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_calidad
string dataobject = "d_lista_m_calidades"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_calidad
string text = "Lista de calidades"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_calidad
string text = "Calidad"
end type

