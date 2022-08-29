HA$PBExportHeader$w_bus_m_bpl_pabcode.srw
forward
global type w_bus_m_bpl_pabcode from w_base_busqueda
end type
end forward

global type w_bus_m_bpl_pabcode from w_base_busqueda
string title = "BPLAN Pabcode"
end type
global w_bus_m_bpl_pabcode w_bus_m_bpl_pabcode

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();io_retorno.is_vector[1]=dw_1.GetItemString(il_fila,"bpl_co_pabcode")

Return 1
end function

on w_bus_m_bpl_pabcode.create
call super::create
end on

on w_bus_m_bpl_pabcode.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve()
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_bpl_pabcode
end type

event sle_1::modified;call super::modified;of_filtro("bpl_de_pabcode like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_m_bpl_pabcode
string text = "Digite pabcode :"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_bpl_pabcode
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_bpl_pabcode
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_bpl_pabcode
integer x = 69
integer width = 1147
string dataobject = "d_lista_m_bpl_pabcode"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_bpl_pabcode
string text = "Pabcode"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_bpl_pabcode
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda BPLAN Pabcode"
end type

