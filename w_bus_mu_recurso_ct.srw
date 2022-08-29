HA$PBExportHeader$w_bus_mu_recurso_ct.srw
$PBExportComments$Buscador de recursos de muestras
forward
global type w_bus_mu_recurso_ct from w_base_busqueda
end type
end forward

global type w_bus_mu_recurso_ct from w_base_busqueda
string title = "Recursos de tejido de muestras"
end type
global w_bus_mu_recurso_ct w_bus_mu_recurso_ct

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_recurso")

Return 1
end function

on w_bus_mu_recurso_ct.create
call super::create
end on

on w_bus_mu_recurso_ct.destroy
call super::destroy
end on

event open;call super::open;/*
* MODIFICADO: Julio 30 de 2009 - ohlondon
* Se debe adicionar el filtro por el tipo de producto si lo env$$HEX1$$ed00$$ENDHEX$$an
*/
Long	ll_tipoprod

If IsValid(io_param) Then
	ll_tipoprod = io_param.il_vector[1]	
	IF IsNull (ll_tipoprod) THEN
		ll_tipoprod = -1
	END IF
	
	dw_1.Retrieve(ll_tipoprod)
ELSE
	dw_1.Retrieve()
End If
	
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_mu_recurso_ct
integer limit = 146
end type

event sle_1::modified;If of_validarcadena(Text)<>1 Then Return -1
of_filtro("descripcion like '%"+text+"%'")
//dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_mu_recurso_ct
string text = "Digite recurso :"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_mu_recurso_ct
integer x = 288
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_mu_recurso_ct
integer x = 640
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_mu_recurso_ct
integer x = 69
integer width = 1157
string dataobject = "d_lista_mu_recurso_ct_x_tipoprod"
boolean hscrollbar = true
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_mu_recurso_ct
string text = "Lista de recursos"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_mu_recurso_ct
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda"
end type

