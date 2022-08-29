HA$PBExportHeader$w_bus_hilos.srw
$PBExportComments$Window Object para la b$$HEX1$$fa00$$ENDHEX$$squeda de los hilos para los bordados en la orden
forward
global type w_bus_hilos from w_base_busqueda
end type
end forward

global type w_bus_hilos from w_base_busqueda
integer width = 1600
string title = "B$$HEX1$$fa00$$ENDHEX$$squeda de Hilos"
end type
global w_bus_hilos w_bus_hilos

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:09:21
---------------------------------------------------
---------------------------------------------------*/
io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_producto")
io_retorno.is_vector[1]=dw_1.GetItemString(il_fila,"de_producto")
//---------------------------------------------------
Return 1
end function

on w_bus_hilos.create
call super::create
end on

on w_bus_hilos.destroy
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

type sle_1 from w_base_busqueda`sle_1 within w_bus_hilos
integer width = 814
integer limit = 45
end type

event sle_1::modified;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 13 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
If of_validarcadena (Text)<>1 Then Return -1
of_filtro("Match(Upper(de_producto),Upper('"+text+"'))")
//dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_hilos
string text = "Digite descripci$$HEX1$$f300$$ENDHEX$$n:"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_hilos
integer x = 434
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_hilos
integer x = 786
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_hilos
integer x = 73
integer width = 1435
string dataobject = "d_lista_hilos"
boolean hscrollbar = true
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_hilos
integer width = 1527
string text = "Hilos"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_hilos
integer width = 1527
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda"
end type

