HA$PBExportHeader$w_bus_m_proveedores_mp.srw
forward
global type w_bus_m_proveedores_mp from w_base_busqueda
end type
end forward

global type w_bus_m_proveedores_mp from w_base_busqueda
string title = "Proveedor"
end type
global w_bus_m_proveedores_mp w_bus_m_proveedores_mp

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_proveedor")

Return 1
end function

on w_bus_m_proveedores_mp.create
call super::create
end on

on w_bus_m_proveedores_mp.destroy
call super::destroy
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 01 de Abril de 2003 HORA 14:43:26:546
// 
// Los argumentos son en el orden: fabrica,producto, calidad, matiz, carac, color
//////////////////////////////////////////////////////////////////////////
dw_1.Retrieve(io_param.il_vector[1],&
              io_param.il_vector[2],&
				  io_param.il_vector[3],&
				  io_param.il_vector[4],&
				  io_param.il_vector[5],&
				  io_param.il_vector[6]) 
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_proveedores_mp
end type

event sle_1::modified;of_filtro("de_proveedor like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_m_proveedores_mp
string text = "Digite descripci$$HEX1$$f300$$ENDHEX$$n:"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_proveedores_mp
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_proveedores_mp
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_proveedores_mp
integer x = 73
integer width = 1143
string dataobject = "d_lista_m_proveedores_mp"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_proveedores_mp
string text = "Proveedores"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_proveedores_mp
string text = "Proveedor"
end type

