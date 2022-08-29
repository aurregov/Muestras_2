HA$PBExportHeader$w_bus_ejecutivo_vendedor.srw
$PBExportComments$Para mostrar la lista de ejecutivos o vendedores segun el caso
forward
global type w_bus_ejecutivo_vendedor from w_base_busqueda
end type
end forward

global type w_bus_ejecutivo_vendedor from w_base_busqueda
integer width = 1390
integer height = 1404
string title = "B$$HEX1$$fa00$$ENDHEX$$squeda de ejecutivo(a)/Vendedor"
end type
global w_bus_ejecutivo_vendedor w_bus_ejecutivo_vendedor

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 28 de Enero de 2004 HORA 16:53:00:414
// 
// Se debe seleccionar el dato segun sea nacional o de
// exportacion
//////////////////////////////////////////////////////////////////////////

If io_param.is_vector[1]="EX" Then
	io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_ejecutiva")
Else
	io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_vendedor")
end If

Return 1
end function

on w_bus_ejecutivo_vendedor.create
call super::create
end on

on w_bus_ejecutivo_vendedor.destroy
call super::destroy
end on

event open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 28 de Enero de 2004 HORA 16:33:53:828
// 
// Se asigna el dw adecuado dependiendo de si es
// nacional o de exportaciones
//////////////////////////////////////////////////////////////////////////


io_param=Message.PowerObjectParm

If io_param.is_vector[1]="EX" Then
	dw_1.DataObject="d_lista_m_ejecutivas_exp"
Else
	dw_1.DataObject="d_lista_m_vendedor"
End If

dw_1.SetTransObject(n_cst_application.itr_appl)

dw_1.Retrieve()
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_ejecutivo_vendedor
integer limit = 30
end type

event sle_1::modified;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 28 de Enero de 2004 HORA 16:38:28:065
// 
// El filtro se hace segun si el cliente es nacional o de exportaci$$HEX1$$f300$$ENDHEX$$n
//////////////////////////////////////////////////////////////////////////

If of_validarcadena(Text)<>1 Then Return -1
If io_param.is_vector[1]="EX" Then
	of_filtro("de_ejecutiva like '%"+text+"%'")
Else
	of_filtro("de_vendedor like '%"+text+"%'")
End If

dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_ejecutivo_vendedor
string text = "Digite descripci$$HEX1$$f300$$ENDHEX$$n:"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_ejecutivo_vendedor
integer x = 311
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_ejecutivo_vendedor
integer x = 663
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_ejecutivo_vendedor
integer x = 55
integer width = 1202
string dataobject = "d_lista_m_vendedor"
boolean hscrollbar = true
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_ejecutivo_vendedor
integer width = 1303
string text = "Lista"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_ejecutivo_vendedor
integer width = 1298
string text = "Vendedor"
end type

