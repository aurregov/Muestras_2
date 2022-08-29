HA$PBExportHeader$w_bus_m_rec_restri.srw
$PBExportComments$Lista de recursos restrictivos
forward
global type w_bus_m_rec_restri from w_base_busqueda
end type
end forward

global type w_bus_m_rec_restri from w_base_busqueda
integer width = 1659
string title = "Recurso restrictivo"
end type
global w_bus_m_rec_restri w_bus_m_rec_restri

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"id")

Return 1
end function

on w_bus_m_rec_restri.create
call super::create
end on

on w_bus_m_rec_restri.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve()
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_rec_restri
integer width = 869
end type

event sle_1::modified;of_filtro("(rec_rest like '%"+text+"%') or (cil_agu_gal like '%"+text+"%')")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_m_rec_restri
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_rec_restri
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_rec_restri
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_rec_restri
integer width = 1349
string dataobject = "d_lista_m_rec_restri"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_rec_restri
integer width = 1536
string text = "Lista de recursos restrictivos"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_rec_restri
integer width = 1536
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda de recurso"
end type

