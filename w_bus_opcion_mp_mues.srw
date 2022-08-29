HA$PBExportHeader$w_bus_opcion_mp_mues.srw
$PBExportComments$Opcion de materia prima para muestras
forward
global type w_bus_opcion_mp_mues from w_base_busqueda
end type
end forward

global type w_bus_opcion_mp_mues from w_base_busqueda
string title = "Opciones de materia prima"
end type
global w_bus_opcion_mp_mues w_bus_opcion_mp_mues

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();
io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"cnt_opcion")

Return 1
end function

on w_bus_opcion_mp_mues.create
call super::create
end on

on w_bus_opcion_mp_mues.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve(io_param.il_vector[1],&
              io_param.il_vector[2],&
				  io_param.il_vector[3],&
				  io_param.il_vector[4],&
				  io_param.il_vector[5])
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_opcion_mp_mues
end type

event sle_1::modified;of_filtro("de_cnt_opcion like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_opcion_mp_mues
string text = "Digite opci$$HEX1$$f300$$ENDHEX$$n:"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_opcion_mp_mues
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_opcion_mp_mues
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_opcion_mp_mues
string dataobject = "d_lista_opcion_mp_muestra"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_opcion_mp_mues
string text = "Opci$$HEX1$$f300$$ENDHEX$$n de materia prima"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_opcion_mp_mues
string text = "Opci$$HEX1$$f300$$ENDHEX$$n de materia prima"
end type

