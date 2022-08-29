HA$PBExportHeader$w_bus_m_grupos_vta.srw
forward
global type w_bus_m_grupos_vta from w_base_busqueda
end type
end forward

global type w_bus_m_grupos_vta from w_base_busqueda
string tag = " "
string title = "Grupo de venta"
end type
global w_bus_m_grupos_vta w_bus_m_grupos_vta

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();
io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_grupo_vta")

Return 1
end function

on w_bus_m_grupos_vta.create
call super::create
end on

on w_bus_m_grupos_vta.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve(io_param.il_vector[1])
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_grupos_vta
end type

event sle_1::modified;of_filtro("de_grupo_vta like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_m_grupos_vta
integer width = 503
string text = "Digite grupo de venta :"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_grupos_vta
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_grupos_vta
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_grupos_vta
integer x = 64
integer width = 1143
string dataobject = "d_lista_m_grupos_vta"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_grupos_vta
string text = "Grupos de venta"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_grupos_vta
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda de Grupos venta"
end type

