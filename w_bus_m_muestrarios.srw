HA$PBExportHeader$w_bus_m_muestrarios.srw
forward
global type w_bus_m_muestrarios from w_base_busqueda
end type
end forward

global type w_bus_m_muestrarios from w_base_busqueda
string title = "Muestrario"
end type
global w_bus_m_muestrarios w_bus_m_muestrarios

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_muestrario")

Return 1
end function

on w_bus_m_muestrarios.create
call super::create
end on

on w_bus_m_muestrarios.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve(io_param.il_vector[1],&
              io_param.il_vector[2],&
				  io_param.il_vector[3])
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_muestrarios
end type

event sle_1::modified;of_filtro("de_muestrario like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_m_muestrarios
string text = "Digite muestrario:"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_muestrarios
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_muestrarios
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_muestrarios
integer x = 69
integer width = 1143
string dataobject = "d_lista_m_muestrarios"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_muestrarios
string text = "Muestrarios"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_muestrarios
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda de muestrario"
end type

