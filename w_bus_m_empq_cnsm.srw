HA$PBExportHeader$w_bus_m_empq_cnsm.srw
forward
global type w_bus_m_empq_cnsm from w_base_busqueda
end type
end forward

global type w_bus_m_empq_cnsm from w_base_busqueda
string title = "Empaque consumo"
end type
global w_bus_m_empq_cnsm w_bus_m_empq_cnsm

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_empq_cnsm")

Return 1
end function

on w_bus_m_empq_cnsm.create
call super::create
end on

on w_bus_m_empq_cnsm.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve()
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_empq_cnsm
integer x = 695
integer width = 512
end type

event sle_1::modified;of_filtro("de_empq_cnsm like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_m_empq_cnsm
integer width = 585
string text = "Digite empaque consumo :"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_empq_cnsm
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_empq_cnsm
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_empq_cnsm
integer x = 55
integer width = 1166
string dataobject = "d_lista_m_empq_cnsm"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_empq_cnsm
string text = "Empaque consumo"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_empq_cnsm
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda empaque de consumo"
end type

