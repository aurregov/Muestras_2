HA$PBExportHeader$w_bus_coleccion.srw
$PBExportComments$permite buscar la temporada,  se halla con los campos de coleccion y tema en espacios
forward
global type w_bus_coleccion from w_base_busqueda
end type
end forward

global type w_bus_coleccion from w_base_busqueda
end type
global w_bus_coleccion w_bus_coleccion

on w_bus_coleccion.create
call super::create
end on

on w_bus_coleccion.destroy
call super::destroy
end on

event open;call super::open;io_param=Message.PowerObjectParm


dw_1.SetTransObject(n_cst_application.itr_appl)

dw_1.Retrieve()
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_coleccion
end type

event sle_1::modified;call super::modified;of_filtro("descripcion like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_coleccion
string text = "Digite : Colecci$$HEX1$$f300$$ENDHEX$$n"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_coleccion
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_coleccion
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_coleccion
string dataobject = "d_coleccion"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_coleccion
string text = "Colecciones"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_coleccion
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda Colecci$$HEX1$$f300$$ENDHEX$$n"
end type

