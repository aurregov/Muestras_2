HA$PBExportHeader$w_bus_recurso_pdn_mo.srw
$PBExportComments$Para buscar las operaciones en el el registro
forward
global type w_bus_recurso_pdn_mo from w_base_busqueda
end type
end forward

global type w_bus_recurso_pdn_mo from w_base_busqueda
integer width = 1422
string title = "Recursos producci$$HEX1$$f300$$ENDHEX$$n"
end type
global w_bus_recurso_pdn_mo w_bus_recurso_pdn_mo

type variables
n_cst_param1 io_param1
end variables

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_recurso")

Return 1
end function

on w_bus_recurso_pdn_mo.create
call super::create
end on

on w_bus_recurso_pdn_mo.destroy
call super::destroy
end on

event open;call super::open;

dw_1.Retrieve(io_param.il_vector[1],/*tipo prod*/& 
              io_param.il_vector[2],/*centro*/&
				  io_param.il_vector[3])/*subcentro*/
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_recurso_pdn_mo
end type

event sle_1::modified;of_filtro("de_recurso like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_recurso_pdn_mo
string text = "Digite operaci$$HEX1$$f300$$ENDHEX$$n:"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_recurso_pdn_mo
integer x = 274
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_recurso_pdn_mo
integer x = 626
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_recurso_pdn_mo
integer x = 69
integer width = 1243
string dataobject = "d_recursos_pdn_lista"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_recurso_pdn_mo
integer width = 1344
string text = "Operaciones"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_recurso_pdn_mo
integer width = 1344
string text = "B$$HEX1$$fa00$$ENDHEX$$esqueda"
end type

