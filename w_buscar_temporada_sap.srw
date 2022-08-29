HA$PBExportHeader$w_buscar_temporada_sap.srw
$PBExportComments$permite buscar la temporada,  se halla con los campos de coleccion y tema en espacios
forward
global type w_buscar_temporada_sap from w_base_busqueda
end type
end forward

global type w_buscar_temporada_sap from w_base_busqueda
integer width = 2011
string title = "Seleccionar Temporada"
end type
global w_buscar_temporada_sap w_buscar_temporada_sap

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();
io_retorno.is_vector[1] = Trim(dw_1.GetItemString(il_fila,"co_temporada"))
io_retorno.is_vector[2] = Trim(dw_1.GetItemString(il_fila,"co_coleccion"))
io_retorno.is_vector[3] = Trim(dw_1.GetItemString(il_fila,"co_tema"))
io_retorno.is_vector[4] = Trim(dw_1.GetItemString(il_fila,"de_temporada"))

Return 1
end function

on w_buscar_temporada_sap.create
call super::create
end on

on w_buscar_temporada_sap.destroy
call super::destroy
end on

event open;call super::open;
dw_1.Retrieve()
end event

type sle_1 from w_base_busqueda`sle_1 within w_buscar_temporada_sap
integer x = 768
integer y = 68
integer width = 1147
textcase textcase = anycase!
end type

event sle_1::modified;of_filtro("de_temporada like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_buscar_temporada_sap
integer x = 69
integer width = 677
string text = "Digite descripci$$HEX1$$f300$$ENDHEX$$n Temporada:"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_buscar_temporada_sap
integer x = 654
integer y = 1212
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_buscar_temporada_sap
integer x = 1006
integer y = 1212
end type

type dw_1 from w_base_busqueda`dw_1 within w_buscar_temporada_sap
integer x = 59
integer y = 260
integer width = 1870
integer height = 868
string dataobject = "d_dddw_tb_temporada"
end type

type gb_1 from w_base_busqueda`gb_1 within w_buscar_temporada_sap
integer width = 1938
end type

type gb_2 from w_base_busqueda`gb_2 within w_buscar_temporada_sap
integer width = 1934
end type

