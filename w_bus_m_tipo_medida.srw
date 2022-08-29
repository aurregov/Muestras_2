HA$PBExportHeader$w_bus_m_tipo_medida.srw
forward
global type w_bus_m_tipo_medida from w_base_busqueda
end type
end forward

global type w_bus_m_tipo_medida from w_base_busqueda
string title = "Tipos de medidas"
end type
global w_bus_m_tipo_medida w_bus_m_tipo_medida

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"id_tipo_med")

Return 1
end function

on w_bus_m_tipo_medida.create
call super::create
end on

on w_bus_m_tipo_medida.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve()
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_tipo_medida
end type

type st_1 from w_base_busqueda`st_1 within w_bus_m_tipo_medida
string text = "Digite tipo medida :"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_tipo_medida
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_tipo_medida
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_tipo_medida
integer x = 55
integer width = 1170
string dataobject = "d_lista_m_tipo_medida"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_tipo_medida
string text = "Tipos de medidas"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_tipo_medida
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda Tipos de medidas"
end type

