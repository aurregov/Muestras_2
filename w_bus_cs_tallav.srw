HA$PBExportHeader$w_bus_cs_tallav.srw
forward
global type w_bus_cs_tallav from w_base_busqueda
end type
end forward

global type w_bus_cs_tallav from w_base_busqueda
integer height = 1472
string title = "Consecutivo talla"
end type
global w_bus_cs_tallav w_bus_cs_tallav

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();
io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"cs_talla")

Return 1
end function

on w_bus_cs_tallav.create
call super::create
end on

on w_bus_cs_tallav.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve(io_param.il_vector[1],/*favrica*/&
              io_param.il_vector[2], /*linea*/&
				  io_param.il_vector[3] /*talla*/)
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_cs_tallav
end type

event sle_1::modified;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 08 de Febrero de 2003 HORA 12:09:52:046
// 
// overwrite parent
//////////////////////////////////////////////////////////////////////////


of_filtro("de_talla like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_cs_tallav
string text = "Digite consecutivo:"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_cs_tallav
integer y = 1244
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_cs_tallav
integer y = 1244
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_cs_tallav
integer y = 308
string dataobject = "d_lista_cs_talla"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_cs_tallav
integer y = 236
string text = "Consecutivos"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_cs_tallav
string text = "Consecutivo Talla"
end type

