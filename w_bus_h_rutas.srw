HA$PBExportHeader$w_bus_h_rutas.srw
forward
global type w_bus_h_rutas from w_base_busqueda
end type
end forward

global type w_bus_h_rutas from w_base_busqueda
string title = "Rutas"
end type
global w_bus_h_rutas w_bus_h_rutas

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();//nu_ruta
io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"nu_ruta")

Return 1
end function

event open;call super::open;dw_1.Retrieve(io_param.il_vector[1])
end event

on w_bus_h_rutas.create
call super::create
end on

on w_bus_h_rutas.destroy
call super::destroy
end on

type sle_1 from w_base_busqueda`sle_1 within w_bus_h_rutas
end type

event sle_1::modified;of_filtro("de_ruta like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_h_rutas
string text = "Digite ruta:"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_h_rutas
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_h_rutas
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_h_rutas
integer x = 59
integer width = 1161
string dataobject = "d_lista_h_rutas"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_h_rutas
string text = "Rutas"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_h_rutas
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda de rutas"
end type

