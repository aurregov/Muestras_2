HA$PBExportHeader$w_bus_m_licencias.srw
forward
global type w_bus_m_licencias from w_base_busqueda
end type
end forward

global type w_bus_m_licencias from w_base_busqueda
string title = "Licencias"
end type
global w_bus_m_licencias w_bus_m_licencias

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();//co_licencia
io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_licencia")

Return 1
end function

on w_bus_m_licencias.create
call super::create
end on

on w_bus_m_licencias.destroy
call super::destroy
end on

event open;call super::open;dw_1.retrieve()
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_licencias
end type

event sle_1::modified;of_filtro("de_licencia like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_m_licencias
string text = "Digite licencia:"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_licencias
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_licencias
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_licencias
integer x = 59
integer width = 1157
string dataobject = "d_lista_m_licencias"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_licencias
string text = "Lista de licencias"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_licencias
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda de licencia"
end type

