HA$PBExportHeader$w_buscar_temporada.srw
$PBExportComments$permite buscar la temporada,  se halla con los campos de coleccion y tema en espacios
forward
global type w_buscar_temporada from w_base_busqueda
end type
end forward

global type w_buscar_temporada from w_base_busqueda
end type
global w_buscar_temporada w_buscar_temporada

on w_buscar_temporada.create
call super::create
end on

on w_buscar_temporada.destroy
call super::destroy
end on

event open;call super::open;io_param=Message.PowerObjectParm


dw_1.SetTransObject(n_cst_application.itr_appl)

dw_1.Retrieve()
end event

type sle_1 from w_base_busqueda`sle_1 within w_buscar_temporada
end type

event sle_1::modified;call super::modified;of_filtro("descripcion like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_buscar_temporada
string text = "Digite : Temporada"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_buscar_temporada
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_buscar_temporada
end type

type dw_1 from w_base_busqueda`dw_1 within w_buscar_temporada
string dataobject = "d_temporada"
end type

type gb_1 from w_base_busqueda`gb_1 within w_buscar_temporada
string text = "Temporadas"
end type

type gb_2 from w_base_busqueda`gb_2 within w_buscar_temporada
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda Temporada"
end type

