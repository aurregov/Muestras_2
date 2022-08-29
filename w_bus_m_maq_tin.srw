HA$PBExportHeader$w_bus_m_maq_tin.srw
$PBExportComments$Ventana de b$$HEX1$$fa00$$ENDHEX$$squeda para las maquinas de tintoreria que no est$$HEX1$$e100$$ENDHEX$$n registradas.
forward
global type w_bus_m_maq_tin from w_base_busqueda
end type
end forward

global type w_bus_m_maq_tin from w_base_busqueda
string tag = "B$$HEX1$$fa00$$ENDHEX$$squeda de M$$HEX1$$e100$$ENDHEX$$quinas de Tintorer$$HEX1$$ed00$$ENDHEX$$a"
integer width = 2551
integer height = 1420
string title = "B$$HEX1$$fa00$$ENDHEX$$squeda de M$$HEX1$$e100$$ENDHEX$$quinas de Tintorer$$HEX1$$ed00$$ENDHEX$$a"
end type
global w_bus_m_maq_tin w_bus_m_maq_tin

type variables
PUBLIC:
	Boolean ib_cancelar
end variables

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:17:48
---------------------------------------------------
---------------------------------------------------*/
io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_fabrica")
io_retorno.il_vector[2]=dw_1.GetItemNumber(il_fila,"cs_maquina")
io_retorno.is_vector[1]=dw_1.GetItemString(il_fila,"de_maquina")

Return 1
end function

on w_bus_m_maq_tin.create
call super::create
end on

on w_bus_m_maq_tin.destroy
call super::destroy
end on

event open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$coles 17 de Noviembre de 2004.H:09:08
---------------------------------------------------
--------------------------------------------------*/
Long ll_res
//-------------------------------------------------
dw_1.of_conexion(n_cst_application.itr_appl,True)
ll_res = dw_1.Retrieve()
Choose Case ll_res
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos para la selecci$$HEX1$$f300$$ENDHEX$$n de m$$HEX1$$e100$$ENDHEX$$quinas de tintorer$$HEX1$$ed00$$ENDHEX$$a.",StopSign!)		
		Return -1
	Case 0
		MessageBox("Advertencia!","No hay datos para la selecci$$HEX1$$f300$$ENDHEX$$n de m$$HEX1$$e100$$ENDHEX$$quinas de tintorer$$HEX1$$ed00$$ENDHEX$$a..",StopSign!)	
		Return -1
End Choose
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_maq_tin
integer width = 1765
integer limit = 172
end type

event sle_1::modified;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$coles 17 de Noviembre de 2004.H:09:08
---------------------------------------------------
---------------------------------------------------*/
If of_validarcadena(Text)<>1 Then Return -1
of_filtro("Match(Upper(de_maquina),Upper('"+text+"'))")
//dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_m_maq_tin
integer x = 142
integer width = 462
string text = "Digite descripci$$HEX1$$f300$$ENDHEX$$n :"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_maq_tin
integer x = 910
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_maq_tin
integer x = 1262
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_maq_tin
integer x = 73
integer y = 288
integer width = 2377
integer height = 832
string dataobject = "d_bus_m_maq_tin_gnrl"
boolean hscrollbar = true
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_maq_tin
integer width = 2478
string text = "Lista de M$$HEX1$$e100$$ENDHEX$$quinas de Tintorer$$HEX1$$ed00$$ENDHEX$$a"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_maq_tin
integer width = 2478
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda"
end type

