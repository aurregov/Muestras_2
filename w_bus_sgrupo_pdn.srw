HA$PBExportHeader$w_bus_sgrupo_pdn.srw
forward
global type w_bus_sgrupo_pdn from w_base_busqueda
end type
end forward

global type w_bus_sgrupo_pdn from w_base_busqueda
string title = "Subgrupo de venta"
end type
global w_bus_sgrupo_pdn w_bus_sgrupo_pdn

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_sgrupo_pdn")

Return 1
end function

on w_bus_sgrupo_pdn.create
call super::create
end on

on w_bus_sgrupo_pdn.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve(io_param.il_vector[1])
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_sgrupo_pdn
end type

event sle_1::modified;of_filtro("de_sgrupo_pdn like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_sgrupo_pdn
string text = "Digite subgrupo :"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_sgrupo_pdn
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_sgrupo_pdn
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_sgrupo_pdn
integer x = 64
integer width = 1147
string dataobject = "d_lista_m_sgrupos_pdn"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_sgrupo_pdn
string text = "subgrupos"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_sgrupo_pdn
string text = "B$$HEX1$$fa00$$ENDHEX$$esqueda subgrupo"
end type

