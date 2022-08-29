HA$PBExportHeader$w_bus_m_ttejido.srw
forward
global type w_bus_m_ttejido from w_base_busqueda
end type
end forward

global type w_bus_m_ttejido from w_base_busqueda
string title = "Tipo de tejido"
end type
global w_bus_m_ttejido w_bus_m_ttejido

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();//co_ttejido
io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_ttejido")

Return 1
end function

on w_bus_m_ttejido.create
call super::create
end on

on w_bus_m_ttejido.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve()
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_ttejido
end type

event sle_1::modified;of_filtro("de_ttejido like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_m_ttejido
string text = "Digite tejido:"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_ttejido
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_ttejido
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_ttejido
integer x = 73
integer width = 1152
string dataobject = "d_lista_m_ttejido"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_ttejido
string text = "Tipos tejido"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_ttejido
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda de tipo de tejido"
end type

