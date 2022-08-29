HA$PBExportHeader$w_bus_grupo_act.srw
$PBExportComments$Ventana de b$$HEX1$$fa00$$ENDHEX$$squeda para los grupos de actividades
forward
global type w_bus_grupo_act from w_base_busqueda
end type
end forward

global type w_bus_grupo_act from w_base_busqueda
string tag = "B$$HEX1$$fa00$$ENDHEX$$squeda de Grupos de Trabajo"
integer width = 1518
integer height = 1420
string title = "B$$HEX1$$fa00$$ENDHEX$$squeda de Grupos de Trabajo"
end type
global w_bus_grupo_act w_bus_grupo_act

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:16:48
---------------------------------------------------
---------------------------------------------------*/
io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"id_grupo")
io_retorno.is_vector[1]=dw_1.GetItemString(il_fila,"de_grupo")

Return 1
end function

on w_bus_grupo_act.create
call super::create
end on

on w_bus_grupo_act.destroy
call super::destroy
end on

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:17:12
---------------------------------------------------
--------------------------------------------------*/
Long ll_res
//-------------------------------------------------

/*
* MODIFICADO: Julio 30 de 2009 - ohlondon
* Se debe adicionar el filtro por el tipo de producto si lo env$$HEX1$$ed00$$ENDHEX$$an
*/
Long	ll_tipoprod
dw_1.of_conexion(n_cst_application.itr_appl,True)
//lo_param.il_vector[1]---> actividad
//lo_param.il_vector[2]---> tipo prod

ll_res = dw_1.Retrieve()

Choose Case ll_res
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos para la selecci$$HEX1$$f300$$ENDHEX$$n de grupos.",StopSign!)		
		Return -1
	Case 0
		MessageBox("Advertencia!","No hay datos para la selecci$$HEX1$$f300$$ENDHEX$$n de grupos.",StopSign!)	
		Return -1
End Choose


IF IsValid(io_param) THEN
	IF io_param.il_vector[1] > 0 THEN
	   dw_1.SetFilter("co_tipoprod = "+String(io_param.il_vector[2]))
		dw_1.Filter()
	END IF
END IF

end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_grupo_act
integer width = 777
integer limit = 50
end type

event sle_1::modified;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 15 de Octubre de 2004.H:17:23	
---------------------------------------------------
---------------------------------------------------*/
If of_validarcadena(Text)<>1 Then Return -1
of_filtro("Match(Upper(de_grupo),Upper('"+text+"'))")
//dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_grupo_act
string text = "Digite descripci$$HEX1$$f300$$ENDHEX$$n :"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_grupo_act
integer x = 398
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_grupo_act
integer x = 750
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_grupo_act
integer width = 1298
string dataobject = "d_lista_grupo_act"
boolean hscrollbar = true
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_grupo_act
integer width = 1454
string text = "Lista de Grupos de Trabajo"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_grupo_act
integer width = 1454
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda"
end type

