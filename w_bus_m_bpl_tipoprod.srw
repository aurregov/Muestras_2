HA$PBExportHeader$w_bus_m_bpl_tipoprod.srw
forward
global type w_bus_m_bpl_tipoprod from w_base_busqueda
end type
end forward

global type w_bus_m_bpl_tipoprod from w_base_busqueda
string title = "BPL Tipo producto"
end type
global w_bus_m_bpl_tipoprod w_bus_m_bpl_tipoprod

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();
io_retorno.is_vector[1]=dw_1.GetItemString(il_fila,"bpl_co_tipoprod")

Return 1
end function

on w_bus_m_bpl_tipoprod.create
call super::create
end on

on w_bus_m_bpl_tipoprod.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve()
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_bpl_tipoprod
end type

event sle_1::modified;of_filtro("bpl_de_tipoprod like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_m_bpl_tipoprod
string text = "Digite tipo prod :"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_bpl_tipoprod
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_bpl_tipoprod
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_bpl_tipoprod
string dataobject = "d_lista_m_bpl_tipoprod"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_bpl_tipoprod
string text = "BPL Tipo prod"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_bpl_tipoprod
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda"
end type

