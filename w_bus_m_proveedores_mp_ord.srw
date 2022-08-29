HA$PBExportHeader$w_bus_m_proveedores_mp_ord.srw
$PBExportComments$Window Object para la b$$HEX1$$fa00$$ENDHEX$$squeda de los proveedores de materia prima para las solicitudes de servicio de las ordenes de producci$$HEX1$$f300$$ENDHEX$$n de las muestras registradas
forward
global type w_bus_m_proveedores_mp_ord from w_base_busqueda
end type
end forward

global type w_bus_m_proveedores_mp_ord from w_base_busqueda
integer width = 1568
string title = "B$$HEX1$$fa00$$ENDHEX$$squeda de Proveedores"
end type
global w_bus_m_proveedores_mp_ord w_bus_m_proveedores_mp_ord

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:09:21
---------------------------------------------------
---------------------------------------------------*/
io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_proveedor")
//---------------------------------------------------
Return 1
end function

on w_bus_m_proveedores_mp_ord.create
call super::create
end on

on w_bus_m_proveedores_mp_ord.destroy
call super::destroy
end on

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:09:21
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
dw_1.Retrieve() 
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_proveedores_mp_ord
integer width = 814
integer limit = 30
end type

event sle_1::modified;If of_validarcadena (Text)<>1 Then Return -1
of_filtro("Match(Upper(de_proveedor),Upper('"+text+"'))")
//dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_m_proveedores_mp_ord
string text = "Digite descripci$$HEX1$$f300$$ENDHEX$$n:"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_proveedores_mp_ord
integer x = 398
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_proveedores_mp_ord
integer x = 750
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_proveedores_mp_ord
integer x = 73
integer width = 1399
string dataobject = "d_lista_m_proveedores_mp_ord"
boolean hscrollbar = true
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_proveedores_mp_ord
integer width = 1490
string text = "Proveedores"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_proveedores_mp_ord
integer width = 1490
string text = "Proveedor"
end type

