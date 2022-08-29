HA$PBExportHeader$w_bus_disenos_sin_usar.srw
forward
global type w_bus_disenos_sin_usar from w_base_busqueda
end type
end forward

global type w_bus_disenos_sin_usar from w_base_busqueda
integer width = 1769
integer height = 1408
string title = "Dise$$HEX1$$f100$$ENDHEX$$os Sin Usar"
end type
global w_bus_disenos_sin_usar w_bus_disenos_sin_usar

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();
io_retorno.is_vector[1]=dw_1.GetItemString(il_fila,"de_diseno")

Return 1
end function

on w_bus_disenos_sin_usar.create
call super::create
end on

on w_bus_disenos_sin_usar.destroy
call super::destroy
end on

event open;call super::open;IF IsValid(io_param) THEN 
	IF Trim(io_param.is_vector[1]) <> '' THEN
		dw_1.Retrieve()
		sle_1.Text = Trim(io_param.is_vector[1])
		sle_1.event modified( )
	END IF
END IF
	
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_disenos_sin_usar
integer x = 585
integer width = 1070
end type

event sle_1::modified;of_filtro("descripcion like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_disenos_sin_usar
integer width = 416
string text = "Digite Descripci$$HEX1$$f300$$ENDHEX$$n:"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_disenos_sin_usar
integer x = 549
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_disenos_sin_usar
integer x = 901
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_disenos_sin_usar
integer x = 87
integer y = 276
integer width = 1563
integer height = 828
string dataobject = "d_lista_m_codigos_disenos"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_disenos_sin_usar
integer width = 1691
integer height = 960
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_disenos_sin_usar
integer width = 1691
end type

