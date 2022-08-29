HA$PBExportHeader$w_bus_m_grupos_tlla.srw
$PBExportComments$busqueda de grupos de talla
forward
global type w_bus_m_grupos_tlla from w_base_busqueda
end type
end forward

global type w_bus_m_grupos_tlla from w_base_busqueda
string title = "Grupos de talla"
end type
global w_bus_m_grupos_tlla w_bus_m_grupos_tlla

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();
io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_grupo_tlla")

Return 1
end function

on w_bus_m_grupos_tlla.create
call super::create
end on

on w_bus_m_grupos_tlla.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve()
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_grupos_tlla
end type

event sle_1::modified;of_filtro("de_grupo_tlla like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_m_grupos_tlla
string text = "Digite grupo talla :"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_grupos_tlla
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_grupos_tlla
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_grupos_tlla
integer x = 59
integer width = 1175
string dataobject = "d_dddw_m_grupos_tlla"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_grupos_tlla
string text = "Grupos de talla"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_grupos_tlla
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda de grupos talla"
end type

