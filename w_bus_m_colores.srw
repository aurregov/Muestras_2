HA$PBExportHeader$w_bus_m_colores.srw
$PBExportComments$Para las partes de materia prima
forward
global type w_bus_m_colores from w_base_busqueda
end type
end forward

global type w_bus_m_colores from w_base_busqueda
integer width = 1399
string title = "Colores"
end type
global w_bus_m_colores w_bus_m_colores

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();
io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_color")

Return 1
end function

on w_bus_m_colores.create
call super::create
end on

on w_bus_m_colores.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve(io_param.il_vector[1],io_param.il_vector[2])

end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_colores
integer x = 411
integer width = 777
integer limit = 30
end type

event sle_1::modified;If of_validarcadena(Text)<>1 Then Return -1
of_filtro("de_color like '%"+text+"%'")
//dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_m_colores
string text = "Digite Color :"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_colores
integer x = 288
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_colores
integer x = 640
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_colores
integer x = 55
integer width = 1225
string dataobject = "d_lista_m_colores"
boolean hscrollbar = true
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_colores
integer width = 1312
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_colores
integer width = 1312
end type

