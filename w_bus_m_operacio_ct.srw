HA$PBExportHeader$w_bus_m_operacio_ct.srw
$PBExportComments$Para la busqueda de operaciones de control trcnico
forward
global type w_bus_m_operacio_ct from w_base_busqueda
end type
end forward

global type w_bus_m_operacio_ct from w_base_busqueda
string title = "Operaciones"
end type
global w_bus_m_operacio_ct w_bus_m_operacio_ct

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_operacion")

Return 1
end function

on w_bus_m_operacio_ct.create
call super::create
end on

on w_bus_m_operacio_ct.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve(io_param.il_vector[1])
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_operacio_ct
end type

event sle_1::modified;If of_validarcadena(Text)<>1 Then Return -1
of_filtro("Match(Upper(de_operacion),Upper('"+text+"'))")
//dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_m_operacio_ct
string text = "Digite operaci$$HEX1$$f300$$ENDHEX$$n:"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_operacio_ct
integer x = 288
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_operacio_ct
integer x = 640
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_operacio_ct
integer x = 59
integer width = 1161
string dataobject = "d_lista_m_operacio_ct"
boolean hscrollbar = true
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_operacio_ct
string text = "Lista de operaciones"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_operacio_ct
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda de operaci$$HEX1$$f300$$ENDHEX$$n"
end type

