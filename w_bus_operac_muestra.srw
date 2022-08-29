HA$PBExportHeader$w_bus_operac_muestra.srw
$PBExportComments$Ventana de b$$HEX1$$fa00$$ENDHEX$$squeda para las operaciones de las muestras
forward
global type w_bus_operac_muestra from w_base_busqueda
end type
end forward

global type w_bus_operac_muestra from w_base_busqueda
string tag = "B$$HEX1$$fa00$$ENDHEX$$squeda de Operaciones"
integer width = 1563
integer height = 1420
string title = "B$$HEX1$$fa00$$ENDHEX$$squeda de Operaciones"
end type
global w_bus_operac_muestra w_bus_operac_muestra

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:17:48
---------------------------------------------------
---------------------------------------------------*/
io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_operacion")
io_retorno.is_vector[1]=dw_1.GetItemString(il_fila,"de_operacion")

Return 1
end function

on w_bus_operac_muestra.create
call super::create
end on

on w_bus_operac_muestra.destroy
call super::destroy
end on

event open;call super::open;/*-------------------------------------------------
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
		MessageBox("Advertencia!","Error recuperando datos para la selecci$$HEX1$$f300$$ENDHEX$$n de operaciones.",StopSign!)		
		Return -1
	Case 0
		MessageBox("Advertencia!","No hay datos para la selecci$$HEX1$$f300$$ENDHEX$$n de operaciones.",StopSign!)	
		Return -1
End Choose


IF IsValid(io_param) THEN
	IF io_param.il_vector[1] > 0 THEN
	   dw_1.SetFilter("co_tipoprod = "+String(io_param.il_vector[1]))
		dw_1.Filter()
	END IF
END IF

end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_operac_muestra
integer width = 850
integer limit = 50
end type

event sle_1::modified;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$coles 17 de Noviembre de 2004.H:09:08
---------------------------------------------------
---------------------------------------------------*/
If of_validarcadena(Text)<>1 Then Return -1
of_filtro("Match(Upper(de_operacion),Upper('"+text+"')) AND co_tipoprod = "+String(io_param.il_vector[1]))
//dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_operac_muestra
string text = "Digite descripci$$HEX1$$f300$$ENDHEX$$n :"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_operac_muestra
integer x = 434
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_operac_muestra
integer x = 786
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_operac_muestra
integer x = 69
integer width = 1408
string dataobject = "d_lista_operac_muestra"
boolean hscrollbar = true
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_operac_muestra
integer width = 1490
string text = "Lista de Operaciones"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_operac_muestra
integer width = 1490
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda"
end type

