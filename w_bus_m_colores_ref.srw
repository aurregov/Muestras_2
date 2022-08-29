HA$PBExportHeader$w_bus_m_colores_ref.srw
$PBExportComments$Para las partes de materia prima
forward
global type w_bus_m_colores_ref from w_base_busqueda
end type
end forward

global type w_bus_m_colores_ref from w_base_busqueda
integer width = 1435
string title = "Colores"
end type
global w_bus_m_colores_ref w_bus_m_colores_ref

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();
io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_color")

Return 1
end function

on w_bus_m_colores_ref.create
call super::create
end on

on w_bus_m_colores_ref.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve(io_param.il_vector[1], &
              io_param.il_vector[2], &
				  io_param.il_vector[3], &
				  io_param.il_vector[4], &
				  io_param.il_vector[5])

end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_colores_ref
end type

event sle_1::modified;of_filtro("de_color like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_m_colores_ref
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_colores_ref
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_colores_ref
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_colores_ref
integer x = 55
integer width = 1262
string dataobject = "d_lista_m_colores_ref"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_colores_ref
integer width = 1349
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_colores_ref
integer width = 1349
string text = "Colores"
end type

