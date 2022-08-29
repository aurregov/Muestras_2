HA$PBExportHeader$w_bus_m_ctecnico.srw
$PBExportComments$Ventana de b$$HEX1$$fa00$$ENDHEX$$squeda para los t$$HEX1$$e900$$ENDHEX$$cnicos o desarrolladores de la orden
forward
global type w_bus_m_ctecnico from w_base_busqueda
end type
end forward

global type w_bus_m_ctecnico from w_base_busqueda
string tag = "B$$HEX1$$fa00$$ENDHEX$$squeda de T$$HEX1$$e900$$ENDHEX$$cnicos/Desarrolladores"
integer width = 1531
integer height = 1420
string title = "B$$HEX1$$fa00$$ENDHEX$$squeda de T$$HEX1$$e900$$ENDHEX$$cnicos/Desarrolladores"
end type
global w_bus_m_ctecnico w_bus_m_ctecnico

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:17:48
---------------------------------------------------
---------------------------------------------------*/
io_retorno.is_vector[1]=dw_1.GetItemString(il_fila,"co_ctecnico")
io_retorno.is_vector[2]=dw_1.GetItemString(il_fila,"de_ctecnico")

Return 1
end function

on w_bus_m_ctecnico.create
call super::create
end on

on w_bus_m_ctecnico.destroy
call super::destroy
end on

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:17:12
---------------------------------------------------
--------------------------------------------------*/
Long ll_res
//-------------------------------------------------
dw_1.of_conexion(n_cst_application.itr_appl,True)
ll_res = dw_1.Retrieve()
Choose Case ll_res
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos para la selecci$$HEX1$$f300$$ENDHEX$$n de T$$HEX1$$e900$$ENDHEX$$cnicos/desarrolladores.",StopSign!)		
		Return -1
	Case 0
		MessageBox("Advertencia!","No hay datos para la selecci$$HEX1$$f300$$ENDHEX$$n de T$$HEX1$$e900$$ENDHEX$$cnicos/desarrolladores.",StopSign!)	
		Return -1
End Choose
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_m_ctecnico
integer width = 814
integer limit = 50
end type

event sle_1::modified;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:17:23	
---------------------------------------------------
---------------------------------------------------*/
If of_validarcadena(Text)<>1 Then Return -1
of_filtro("Match(Upper(de_ctecnico),Upper('"+text+"'))")
//dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_m_ctecnico
string text = "Digite descripci$$HEX1$$f300$$ENDHEX$$n :"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_m_ctecnico
integer x = 398
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_m_ctecnico
integer x = 750
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_m_ctecnico
integer x = 69
integer width = 1371
string dataobject = "d_lista_m_ctecnico"
boolean hscrollbar = true
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_m_ctecnico
integer width = 1454
string text = "Lista de T$$HEX1$$e900$$ENDHEX$$cnicos/Desarrolladores"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_m_ctecnico
integer width = 1454
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda"
end type

