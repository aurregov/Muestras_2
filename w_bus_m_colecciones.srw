HA$PBExportHeader$w_bus_m_colecciones.srw
forward
global type w_bus_m_colecciones from w_base_busqueda
end type
end forward

global type w_bus_m_colecciones from w_base_busqueda
string title = "Colecciones"
end type
global w_bus_m_colecciones w_bus_m_colecciones

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_coleccion")

Return 1
end function

on w_bus_m_colecciones.create
call super::create
end on

on w_bus_m_colecciones.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve()
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_colecciones
end type

event sle_1::modified;call super::modified;of_filtro("de_coleccion like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_m_colecciones
string text = "Digite colecci$$HEX1$$f300$$ENDHEX$$n:"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_colecciones
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_colecciones
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_colecciones
integer x = 59
integer width = 1161
string dataobject = "d_lista_m_colecciones"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_colecciones
string text = "colecciones"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_colecciones
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda "
end type

