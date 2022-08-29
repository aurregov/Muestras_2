HA$PBExportHeader$w_bus_m_grupos.srw
$PBExportComments$Para la b$$HEX1$$fa00$$ENDHEX$$squeda de los grupos de materias primas
forward
global type w_bus_m_grupos from w_base_busqueda
end type
end forward

global type w_bus_m_grupos from w_base_busqueda
string title = "Grupos de materia prima"
end type
global w_bus_m_grupos w_bus_m_grupos

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_grupo")

Return 1
end function

on w_bus_m_grupos.create
call super::create
end on

on w_bus_m_grupos.destroy
call super::destroy
end on

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_grupos
end type

event sle_1::modified;call super::modified;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 12 de Agosto de 2003 HORA 08:21:27:472
// 
// 
//////////////////////////////////////////////////////////////////////////
of_filtro("de_grupo like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_m_grupos
string text = "Digite grupo :"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_grupos
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_grupos
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_grupos
integer x = 64
integer width = 1129
string dataobject = "d_lista_m_grupos"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_grupos
string text = "Grupos de materia prima"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_grupos
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda"
end type

