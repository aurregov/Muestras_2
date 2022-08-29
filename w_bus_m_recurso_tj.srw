HA$PBExportHeader$w_bus_m_recurso_tj.srw
$PBExportComments$Para buscar los recursos de tejido
forward
global type w_bus_m_recurso_tj from w_base_busqueda
end type
end forward

global type w_bus_m_recurso_tj from w_base_busqueda
string title = "Recursos de tejido"
end type
global w_bus_m_recurso_tj w_bus_m_recurso_tj

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_recurso")

Return 1
end function

on w_bus_m_recurso_tj.create
call super::create
end on

on w_bus_m_recurso_tj.destroy
call super::destroy
end on

event open;call super::open;/*
* MODIFICADO: Julio 30 de 2009 - ohlondon
* Se debe adicionar el filtro por el tipo de producto si lo env$$HEX1$$ed00$$ENDHEX$$an
*/

dw_1.Retrieve()

IF IsValid(io_param) THEN
	IF io_param.il_vector[1] > 0 THEN
	   dw_1.SetFilter("co_tipoprod = "+String(io_param.il_vector[1]))
		dw_1.Filter()
	END IF
END IF


end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_recurso_tj
integer limit = 146
end type

event sle_1::modified;If of_validarcadena(Text)<>1 Then Return -1
of_filtro("descripcion like '%"+text+"%'")
//dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_m_recurso_tj
string text = "Digite recurso :"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_recurso_tj
integer x = 288
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_recurso_tj
integer x = 640
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_recurso_tj
integer x = 69
integer width = 1157
string dataobject = "d_lista_m_recurso_tj_x_tipoprod"
boolean hscrollbar = true
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_recurso_tj
string text = "Lista de recursos"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_recurso_tj
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda"
end type

