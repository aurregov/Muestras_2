HA$PBExportHeader$w_bus_operacion.srw
$PBExportComments$Para buscar las operaciones en el el registro
forward
global type w_bus_operacion from w_base_busqueda
end type
end forward

global type w_bus_operacion from w_base_busqueda
integer width = 1422
string title = "Operaciones"
end type
global w_bus_operacion w_bus_operacion

type variables
n_cst_param1 io_param1
end variables

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_operacion")

Return 1
end function

on w_bus_operacion.create
call super::create
end on

on w_bus_operacion.destroy
call super::destroy
end on

event open;io_param1=Message.PowerObjectParm

dw_1.SetTransObject(n_cst_application.itr_appl)

dw_1.Retrieve(io_param1.il_vector[1],&
              io_param1.il_vector[2],&
				  io_param1.il_vector[3],&
				  io_param1.il_vector_centros )
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_operacion
end type

event sle_1::modified;of_filtro("de_operacion like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_operacion
string text = "Digite operaci$$HEX1$$f300$$ENDHEX$$n:"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_operacion
integer x = 274
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_operacion
integer x = 626
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_operacion
integer x = 69
integer width = 1243
string dataobject = "d_lista_operaciones"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_operacion
integer width = 1344
string text = "Operaciones"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_operacion
integer width = 1344
string text = "B$$HEX1$$fa00$$ENDHEX$$esqueda"
end type

