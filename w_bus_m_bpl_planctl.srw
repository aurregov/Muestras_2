HA$PBExportHeader$w_bus_m_bpl_planctl.srw
forward
global type w_bus_m_bpl_planctl from w_base_busqueda
end type
end forward

global type w_bus_m_bpl_planctl from w_base_busqueda
string title = "BPLAN Planctl"
end type
global w_bus_m_bpl_planctl w_bus_m_bpl_planctl

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();io_retorno.is_vector[1]=dw_1.GetItemString(il_fila,"bpl_co_planctl")

Return 1
end function

on w_bus_m_bpl_planctl.create
call super::create
end on

on w_bus_m_bpl_planctl.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve()
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_bpl_planctl
end type

event sle_1::modified;of_filtro("bpl_de_planctl like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_m_bpl_planctl
string text = "Digite plan :"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_bpl_planctl
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_bpl_planctl
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_bpl_planctl
integer x = 59
integer width = 1138
string dataobject = "d_lista_m_bpl_planctl"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_bpl_planctl
string text = "Planes"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_bpl_planctl
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda planctl"
end type

