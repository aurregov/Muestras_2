HA$PBExportHeader$w_bus_turno.srw
$PBExportComments$Ventana para la b$$HEX1$$fa00$$ENDHEX$$squeda de los turnos/horarion
forward
global type w_bus_turno from w_base_busqueda
end type
end forward

global type w_bus_turno from w_base_busqueda
string tag = "B$$HEX1$$fa00$$ENDHEX$$squeda de Turnos"
integer width = 1554
string title = "B$$HEX1$$fa00$$ENDHEX$$squeda de Turnos"
end type
global w_bus_turno w_bus_turno

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:16:48
---------------------------------------------------
---------------------------------------------------*/
io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"id_turno")

Return 1
end function

on w_bus_turno.create
call super::create
end on

on w_bus_turno.destroy
call super::destroy
end on

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:17:12
---------------------------------------------------
---------------------------------------------------*/
dw_1.of_conexion(n_cst_application.itr_appl,True)
dw_1.Retrieve()
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_turno
integer width = 741
integer limit = 80
end type

event sle_1::modified;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:17:23	
---------------------------------------------------
---------------------------------------------------*/
If of_validarcadena(Text)<>1 Then Return -1
of_filtro("Match(Upper(de_turno),Upper('"+text+"'))")
//dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_turno
string text = "Digite descripci$$HEX1$$f300$$ENDHEX$$n:"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_turno
integer x = 398
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_turno
integer x = 750
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_turno
integer width = 1335
string dataobject = "d_lista_turno"
boolean hscrollbar = true
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_turno
integer width = 1490
string text = "Lista de Turnos"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_turno
integer width = 1490
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda"
end type

