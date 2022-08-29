HA$PBExportHeader$w_bus_tallas_referencia.srw
$PBExportComments$para buscar las tallas de una referencia
forward
global type w_bus_tallas_referencia from w_base_busqueda
end type
end forward

global type w_bus_tallas_referencia from w_base_busqueda
string title = "Tallas por referencia"
end type
global w_bus_tallas_referencia w_bus_tallas_referencia

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_talla")

Return 1
end function

on w_bus_tallas_referencia.create
call super::create
end on

on w_bus_tallas_referencia.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve(io_param.il_vector[1],&
              io_param.il_vector[2],&
				  io_param.il_vector[3],&
				  io_param.il_vector[4])
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_tallas_referencia
end type

event sle_1::modified;of_filtro("de_talla like '%"+text+"%'")

end event

type st_1 from w_base_busqueda`st_1 within w_bus_tallas_referencia
string text = "Digite talla :"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_tallas_referencia
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_tallas_referencia
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_tallas_referencia
string dataobject = "d_lista_tallas_referencia"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_tallas_referencia
string text = "Tallas de referencia"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_tallas_referencia
string text = "Buscar talla"
end type

