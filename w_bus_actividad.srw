HA$PBExportHeader$w_bus_actividad.srw
$PBExportComments$Ventana de b$$HEX1$$fa00$$ENDHEX$$squeda para las actividades
forward
global type w_bus_actividad from w_base_busqueda
end type
end forward

global type w_bus_actividad from w_base_busqueda
string tag = "B$$HEX1$$fa00$$ENDHEX$$squeda de Actividades"
integer width = 1531
integer height = 1420
string title = "B$$HEX1$$fa00$$ENDHEX$$squeda de Actividades"
end type
global w_bus_actividad w_bus_actividad

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:17:48
---------------------------------------------------
---------------------------------------------------*/
io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"id_actividad")
io_retorno.is_vector[1]=dw_1.GetItemString(il_fila,"de_actividad")

Return 1
end function

on w_bus_actividad.create
call super::create
end on

on w_bus_actividad.destroy
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
		MessageBox("Advertencia!","Error recuperando datos para la selecci$$HEX1$$f300$$ENDHEX$$n de actividades.",StopSign!)		
		Return -1
	Case 0
		MessageBox("Advertencia!","No hay datos para la selecci$$HEX1$$f300$$ENDHEX$$n de actividades.",StopSign!)	
		Return -1
End Choose


IF IsValid(io_param) THEN
	IF io_param.il_vector[1] > 0 THEN
	   dw_1.SetFilter("co_tipoprod = "+String(io_param.il_vector[1]))
		dw_1.Filter()
	END IF
END IF


end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_actividad
integer width = 814
integer limit = 50
end type

event sle_1::modified;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:17:23	
---------------------------------------------------
---------------------------------------------------*/
If of_validarcadena(Text)<>1 Then Return -1
of_filtro("Match(Upper(de_actividad),Upper('"+text+"'))")
//dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_actividad
string text = "Digite descripci$$HEX1$$f300$$ENDHEX$$n :"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_actividad
integer x = 398
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_actividad
integer x = 750
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_actividad
integer x = 69
integer width = 1371
string dataobject = "d_lista_actividad_tipoprod"
boolean hscrollbar = true
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_actividad
integer width = 1454
string text = "Lista de Actividades"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_actividad
integer width = 1454
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda"
end type

