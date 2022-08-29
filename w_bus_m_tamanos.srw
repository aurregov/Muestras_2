HA$PBExportHeader$w_bus_m_tamanos.srw
forward
global type w_bus_m_tamanos from w_base_busqueda
end type
end forward

global type w_bus_m_tamanos from w_base_busqueda
string title = "Tama$$HEX1$$f100$$ENDHEX$$os"
end type
global w_bus_m_tamanos w_bus_m_tamanos

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_tamano")

Return 1
end function

on w_bus_m_tamanos.create
call super::create
end on

on w_bus_m_tamanos.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve()
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_tamanos
end type

event sle_1::modified;of_filtro("nu_docenas ="+text)
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_m_tamanos
string text = "Digite docenas:"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_tamanos
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_tamanos
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_tamanos
string dataobject = "d_lista_m_tamanos"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_tamanos
string text = "Tama$$HEX1$$f100$$ENDHEX$$os"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_tamanos
string text = "B$$HEX1$$fa00$$ENDHEX$$esqueda"
end type

