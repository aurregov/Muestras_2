HA$PBExportHeader$w_bus_m_recurso.srw
$PBExportComments$Para buscar los recursos de tejido bien sea que cierren o no cierren, esa parte va a llegar implicita en el datawindow que se le mande
forward
global type w_bus_m_recurso from w_base_busqueda
end type
end forward

global type w_bus_m_recurso from w_base_busqueda
string title = "Recursos de tejido"
end type
global w_bus_m_recurso w_bus_m_recurso

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_recurso")

Return 1
end function

on w_bus_m_recurso.create
call super::create
end on

on w_bus_m_recurso.destroy
call super::destroy
end on

event open;call super::open;/*
* MODIFICADO: Julio 30 de 2009 - ohlondon
* Se debe adicionar el filtro por el tipo de producto si lo env$$HEX1$$ed00$$ENDHEX$$an
*/
//d_lista_m_recurso_sicierra
//d_lista_m_recurso_nocierra

IF IsValid(io_param) THEN
	IF TRIM(String(io_param.is_vector[1],'')) <> '' THEN
		dw_1.Dataobject = io_param.is_vector[1]
		dw_1.SetTransObject(n_cst_application.itr_appl)
		dw_1.Retrieve(io_param.il_vector[1])	
	ELSE
		MessageBox('Advertencia','Error en la asignacion de la consulta.', StopSign!)
	END IF
	
	IF io_param.il_vector[1] > 0 THEN
		dw_1.SetFilter(io_param.is_vector[2])
		dw_1.Filter()
	END IF
END IF



end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_recurso
integer limit = 146
end type

event sle_1::modified;If of_validarcadena(Text)<>1 Then Return -1
of_filtro("descripcion like '%"+text+"%'")
//dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_m_recurso
string text = "Digite recurso :"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_recurso
integer x = 288
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_recurso
integer x = 640
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_recurso
integer x = 69
integer width = 1157
string dataobject = "d_lista_m_recurso_tj_x_tipoprod"
boolean hscrollbar = true
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_recurso
string text = "Lista de recursos"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_recurso
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda"
end type

