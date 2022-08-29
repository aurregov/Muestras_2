HA$PBExportHeader$w_filtros_copiadores.srw
$PBExportComments$para la busqueda de los colores y los muetrarios
forward
global type w_filtros_copiadores from w_response
end type
type cb_2 from commandbutton within w_filtros_copiadores
end type
type cb_1 from commandbutton within w_filtros_copiadores
end type
type dw_filtro from datawindow within w_filtros_copiadores
end type
end forward

global type w_filtros_copiadores from w_response
integer x = 0
integer y = 0
integer width = 850
integer height = 1240
string title = "Filtro de "
cb_2 cb_2
cb_1 cb_1
dw_filtro dw_filtro
end type
global w_filtros_copiadores w_filtros_copiadores

type variables
String is_muestra
str_param	istr_param, istr_filtro
end variables

forward prototypes
public subroutine of_llenar_colores ()
end prototypes

public subroutine of_llenar_colores ();Long ll_filas, ll_str, ll_fila
String ls_seleccion
ll_filas = dw_filtro.Rowcount( )
ll_str = 1

FOR ll_fila = 1 To ll_filas 
	ls_seleccion = TRIM(String(dw_filtro.object.seleccion[ll_fila],''))
	IF ls_seleccion = '1' THEN
		istr_filtro.a_string1[ll_str] = String(dw_filtro.Object.dato[ll_fila])
		istr_filtro.a_string2[ll_str] = String(dw_filtro.Object.dato2[ll_fila])
		ll_str += 1
	END IF	
NEXT

CloseWithReturn(w_filtros_copiadores,istr_filtro)
end subroutine

on w_filtros_copiadores.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_filtro=create dw_filtro
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.dw_filtro
end on

on w_filtros_copiadores.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_filtro)
end on

event open;call super::open;Long ll_fila, ll_filas

istr_param = Message.powerobjectparm

ll_filas = UpperBound(istr_param.a_string1)

FOR ll_fila = 1 TO ll_filas
	dw_filtro.Object.dato[ll_fila] = istr_param.a_string1[ll_fila] 
	dw_filtro.Object.dato2[ll_fila] = istr_param.a_string2[ll_fila] 	
NEXT

dw_filtro.Object.dato_t.text = istr_param.a_string3[1]

THIS.title = 'Filtro de '+istr_param.a_string3[1]




end event

type cb_2 from commandbutton within w_filtros_copiadores
integer x = 430
integer y = 1016
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancelar"
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_filtros_copiadores
integer x = 59
integer y = 1016
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;of_llenar_colores()


end event

type dw_filtro from datawindow within w_filtros_copiadores
integer x = 46
integer y = 44
integer width = 731
integer height = 916
integer taborder = 10
string title = "none"
string dataobject = "de_filtro"
boolean vscrollbar = true
boolean livescroll = true
end type

