HA$PBExportHeader$w_bus_tallas_muestra.srw
forward
global type w_bus_tallas_muestra from w_base_busqueda
end type
end forward

global type w_bus_tallas_muestra from w_base_busqueda
string title = "Tallas por muesta"
end type
global w_bus_tallas_muestra w_bus_tallas_muestra

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_talla")

Return 1
end function

on w_bus_tallas_muestra.create
call super::create
end on

on w_bus_tallas_muestra.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve(io_param.il_vector[1],&
              io_param.il_vector[2],&
				  io_param.il_vector[3])
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_tallas_muestra
end type

event sle_1::modified;of_filtro("de_talla like '%"+text+"%'")

end event

type st_1 from w_base_busqueda`st_1 within w_bus_tallas_muestra
string text = "Digite talla :"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_tallas_muestra
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_tallas_muestra
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_tallas_muestra
string dataobject = "d_lista_tallas_muestra"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_tallas_muestra
string text = "Tallas de la muesta"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_tallas_muestra
string text = "Buscar talla"
end type

