HA$PBExportHeader$w_opc_seleccionar_fabrica.srw
$PBExportComments$/***********************************************************~r~nSA50536 - Ceiba/jjmonsal - 19-04-2016~r~nComentario: Opcion en MUESTRAS para recodificar MP~r~n***********************************************************/
forward
global type w_opc_seleccionar_fabrica from w_response
end type
type cbx_todas from checkbox within w_opc_seleccionar_fabrica
end type
type cb_cancelar from commandbutton within w_opc_seleccionar_fabrica
end type
type cb_aceptar from commandbutton within w_opc_seleccionar_fabrica
end type
type dw_fab from datawindow within w_opc_seleccionar_fabrica
end type
end forward

global type w_opc_seleccionar_fabrica from w_response
string tag = "Seleccionar Fabrica"
integer width = 1669
integer height = 908
string title = "Seleccionar Fabrica"
cbx_todas cbx_todas
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
dw_fab dw_fab
end type
global w_opc_seleccionar_fabrica w_opc_seleccionar_fabrica

type variables
str_param			istr_param

end variables

forward prototypes
public subroutine wf_limpiarfabricas ()
end prototypes

public subroutine wf_limpiarfabricas ();/********************************************************************
SA50536 - Ceiba/jjmonsal - 19-04-2016 FunctionName wf_limpiarFabricas
<DESC> Description: Limpiar lineas anteriormente seleccionadas </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Long			ll_fila, ll_nulo
str_param	lstr_param
SetNull(ll_nulo)
TRY
	istr_param.a_long1[] =lstr_param.a_long1[]
CATCH(Throwable le_error)
	Messagebox("Error limpiando Fabricas", le_error.getmessage(), StopSign!)
End Try
end subroutine

on w_opc_seleccionar_fabrica.create
int iCurrent
call super::create
this.cbx_todas=create cbx_todas
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.dw_fab=create dw_fab
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_todas
this.Control[iCurrent+2]=this.cb_cancelar
this.Control[iCurrent+3]=this.cb_aceptar
this.Control[iCurrent+4]=this.dw_fab
end on

on w_opc_seleccionar_fabrica.destroy
call super::destroy
destroy(this.cbx_todas)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.dw_fab)
end on

event open;call super::open;/***********************************************************
SA54453 - Ceiba/jjmonsal - 10-05-2016
Comentario: Permitir Abrir la seleccion multiple de Fabricas 
***********************************************************/
TRY
	istr_param = Message.powerobjectparm
	//Recuperar las fabricas que tiene asociadas el Usuario
	dw_fab.SetTransObject(n_cst_application.itr_appl)
	dw_fab.retrieve(n_cst_application.is_user)
CATCH(Exception le_error)
	Messagebox("Error al Seleccionar las Fabricas", le_error.getmessage(), StopSign!)
End Try
end event

type cbx_todas from checkbox within w_opc_seleccionar_fabrica
integer x = 1317
integer y = 32
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Todas"
end type

event clicked;/********************************************************************
SA50536 - Ceiba/jjmonsal - 19-04-2016 FunctionName cbx_Todas.clicked()
<DESC> Description: Seleccionar las fabricas </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Long ll_filas, ll_fila

ll_filas = dw_fab.Rowcount( )
IF ll_filas > 0 THEN
	FOR ll_fila = 1 TO ll_filas
		IF THIS.Checked THEN
			dw_fab.Object.Seleccion[ll_fila] = 'S'
		ELSE
			dw_fab.Object.Seleccion[ll_fila] = 'N'
		END IF		
	NEXT
END IF 
end event

type cb_cancelar from commandbutton within w_opc_seleccionar_fabrica
integer x = 809
integer y = 576
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

event clicked;/********************************************************************
SA50536 - Ceiba/jjmonsal - 19-04-2016 FunctionName Cancelar 
<DESC> Description: cancelar la seleccion de fabricas</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
close(parent)
end event

type cb_aceptar from commandbutton within w_opc_seleccionar_fabrica
integer x = 389
integer y = 576
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;/********************************************************************
SA50536 - Ceiba/jjmonsal - 19-04-2016 FunctionName Aceptar
<DESC> Description: llenar la estructura para la ventana quien inovca de la Seleccion de las fabricas </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Long ll_fila, ll_filas
uo_dsbase lds_fabSel

TRY
	lds_fabSel = CREATE uo_dsbase
	lds_fabSel.dataobject = dw_fab.dataobject
	lds_fabSel.settransobject(n_cst_application.itr_appl)
	
	dw_fab.RowsCopy(1, dw_fab.RowCount(), Primary!, lds_fabSel, 1, Primary!)
	lds_fabSel.setFilter(" Seleccion = '"+n_cst_c_actualizarmp_en_ficha.SI+"' ")
	lds_fabSel.Filter()
	
	ll_filas = lds_fabSel.RowCount()
	FOR ll_fila = 1 To ll_filas	
		IF lds_fabSel.Object.Seleccion[ll_fila] = n_cst_c_actualizarmp_en_ficha.SI THEN
			istr_param.a_long1[ll_fila] = lds_fabSel.Object.co_fabrica[ll_fila]
		END IF
	NEXT
	
	Destroy(lds_fabSel)	
	CloseWithReturn(parent,istr_param)
CATCH(Throwable le_error)
	Messagebox("Error Seleccionando Fabricas", le_error.getmessage(), StopSign!)
End Try
end event

type dw_fab from datawindow within w_opc_seleccionar_fabrica
integer x = 73
integer y = 116
integer width = 1513
integer height = 428
integer taborder = 10
string title = "Fabricas"
string dataobject = "d_sq_gr_seleccion_fabrica"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

