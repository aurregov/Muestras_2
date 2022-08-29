HA$PBExportHeader$w_opc_seleccionar_linea.srw
$PBExportComments$/***********************************************************~r~nSA50536 - Ceiba/jjmonsal - 19-04-2016~r~nComentario: Opcion en MUESTRAS para recodificar MP~r~n***********************************************************/
forward
global type w_opc_seleccionar_linea from w_response
end type
type cbx_todas from checkbox within w_opc_seleccionar_linea
end type
type dw_linea from datawindow within w_opc_seleccionar_linea
end type
type cb_cancelar from commandbutton within w_opc_seleccionar_linea
end type
type cb_aceptar from commandbutton within w_opc_seleccionar_linea
end type
end forward

global type w_opc_seleccionar_linea from w_response
string tag = "Seleccionar Linea"
integer width = 1911
integer height = 1088
string title = "Seleccionar Linea"
cbx_todas cbx_todas
dw_linea dw_linea
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
end type
global w_opc_seleccionar_linea w_opc_seleccionar_linea

type variables
str_param			istr_param

end variables

forward prototypes
public subroutine wf_limpiarlineas ()
end prototypes

public subroutine wf_limpiarlineas ();/********************************************************************
SA50536 - Ceiba/jjmonsal - 19-04-2016 FunctionName wf_limpiarLineas
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
	istr_param.a_long2[] =lstr_param.a_long2[]
CATCH(Throwable le_error)
	Messagebox("Error limpiando lineas", le_error.getmessage(), StopSign!)
End Try
end subroutine

on w_opc_seleccionar_linea.create
int iCurrent
call super::create
this.cbx_todas=create cbx_todas
this.dw_linea=create dw_linea
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_todas
this.Control[iCurrent+2]=this.dw_linea
this.Control[iCurrent+3]=this.cb_cancelar
this.Control[iCurrent+4]=this.cb_aceptar
end on

on w_opc_seleccionar_linea.destroy
call super::destroy
destroy(this.cbx_todas)
destroy(this.dw_linea)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
end on

event open;call super::open;/***********************************************************
SA50536 - Ceiba/jjmonsal - 25-04-2016
Comentario: Opcion en MUESTRAS para recodificar MP
***********************************************************/
TRY
	istr_param = Message.powerobjectparm
	//Recuperar las fabricas que tiene asociadas el Usuario
	dw_linea.SetTransObject(n_cst_application.itr_appl)
	dw_linea.retrieve(istr_param.a_long1[])
	
	//Limpiar Lineas anteriormente seleccionadas
	wf_limpiarLineas()
CATCH(Exception le_error)
	Messagebox("Error al Seleccionar las Lineas", le_error.getmessage(), StopSign!)
End Try
end event

type cbx_todas from checkbox within w_opc_seleccionar_linea
integer x = 1577
integer y = 40
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

ll_filas = dw_linea.Rowcount( )
IF ll_filas > 0 THEN
	FOR ll_fila = 1 TO ll_filas
		IF THIS.Checked THEN
			dw_linea.Object.Seleccion[ll_fila] = 'S'
		ELSE
			dw_linea.Object.Seleccion[ll_fila] = 'N'
		END IF		
	NEXT
END IF 
end event

type dw_linea from datawindow within w_opc_seleccionar_linea
integer x = 73
integer y = 128
integer width = 1755
integer height = 660
integer taborder = 10
string title = "Lineas"
string dataobject = "d_sq_gr_seleccion_linea"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event sqlpreview;String ls_SQLSyntax 
ls_SQLSyntax = SQLSyntax
end event

type cb_cancelar from commandbutton within w_opc_seleccionar_linea
integer x = 1006
integer y = 844
integer width = 343
integer height = 100
integer taborder = 20
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
<DESC> Description: cancelar la seleccion de lineas</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
close(parent)
end event

type cb_aceptar from commandbutton within w_opc_seleccionar_linea
integer x = 421
integer y = 844
integer width = 343
integer height = 100
integer taborder = 10
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
uo_dsbase lds_lineaSel

TRY
	lds_lineaSel = CREATE uo_dsbase
	lds_lineaSel.dataobject = dw_linea.dataobject
	lds_lineaSel.settransobject(n_cst_application.itr_appl)
	
	dw_linea.RowsCopy(1, dw_linea.RowCount(), Primary!, lds_lineaSel, 1, Primary!)
	lds_lineaSel.setFilter(" Seleccion = '"+n_cst_c_actualizarmp_en_ficha.SI+"' ")
	lds_lineaSel.Filter()
	
	ll_filas = lds_lineaSel.RowCount()
	FOR ll_fila = 1 To ll_filas	
		IF lds_lineaSel.Object.Seleccion[ll_fila] = n_cst_c_actualizarmp_en_ficha.SI THEN
			istr_param.a_long2[ll_fila] = lds_lineaSel.Object.co_linea[ll_fila]
		END IF
	NEXT
	
	Destroy(lds_lineaSel)	
	CloseWithReturn(parent,istr_param)
CATCH(Throwable le_error)
	Messagebox("Error Seleccionando Fabricas", le_error.getmessage(), StopSign!)
End Try
end event

