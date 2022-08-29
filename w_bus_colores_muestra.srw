HA$PBExportHeader$w_bus_colores_muestra.srw
forward
global type w_bus_colores_muestra from w_base_busqueda
end type
end forward

global type w_bus_colores_muestra from w_base_busqueda
integer width = 1399
string title = "Colores de muestra"
end type
global w_bus_colores_muestra w_bus_colores_muestra

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_color")

Return 1
end function

on w_bus_colores_muestra.create
call super::create
end on

on w_bus_colores_muestra.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve(io_param.il_vector[1],&
              io_param.il_vector[2],&
				  io_param.il_vector[3],&
				  io_param.il_vector[4])
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_colores_muestra
end type

event sle_1::modified;call super::modified;of_filtro("de_color like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_colores_muestra
string text = "Digite color:"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_colores_muestra
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_colores_muestra
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_colores_muestra
integer x = 69
integer width = 1193
string dataobject = "d_lista_colores_muestra"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_colores_muestra
integer width = 1298
string text = "Colores"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_colores_muestra
integer width = 1298
string text = "B$$HEX1$$fa00$$ENDHEX$$esqueda"
end type

