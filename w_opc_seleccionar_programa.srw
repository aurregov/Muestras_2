HA$PBExportHeader$w_opc_seleccionar_programa.srw
$PBExportComments$/***********************************************************~r~nSA54453 - Ceiba/jjmonsal - 05-05-2016~r~nComentario: Mantenimiento Restriccion de Usuarios para Fichas de Materia Prima~r~n***********************************************************/
forward
global type w_opc_seleccionar_programa from w_response
end type
type dw_prog from datawindow within w_opc_seleccionar_programa
end type
type cbx_todos from checkbox within w_opc_seleccionar_programa
end type
type cb_cancelar from commandbutton within w_opc_seleccionar_programa
end type
type cb_aceptar from commandbutton within w_opc_seleccionar_programa
end type
end forward

global type w_opc_seleccionar_programa from w_response
integer width = 2441
integer height = 1000
string title = "Seleccionar"
dw_prog dw_prog
cbx_todos cbx_todos
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
end type
global w_opc_seleccionar_programa w_opc_seleccionar_programa

type variables
str_param				istr_param
n_cst_seg_muestras	invo_seg_muestras


CONSTANT STRING PROGRAMA = 'Prog'


end variables

forward prototypes
public subroutine wf_limpiarprogramas ()
end prototypes

public subroutine wf_limpiarprogramas ();/********************************************************************
SA50536 - Ceiba/jjmonsal - 19-04-2016 FunctionName wf_limpiarProgramas
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
	istr_param.a_long3[] =lstr_param.a_long3[]
CATCH(Throwable le_error)
	Messagebox("Error limpiando Programas", le_error.getmessage(), StopSign!)
End Try
end subroutine

on w_opc_seleccionar_programa.create
int iCurrent
call super::create
this.dw_prog=create dw_prog
this.cbx_todos=create cbx_todos
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_prog
this.Control[iCurrent+2]=this.cbx_todos
this.Control[iCurrent+3]=this.cb_cancelar
this.Control[iCurrent+4]=this.cb_aceptar
end on

on w_opc_seleccionar_programa.destroy
call super::destroy
destroy(this.dw_prog)
destroy(this.cbx_todos)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
end on

event open;call super::open;/***********************************************************
SA54453 - Ceiba/jjmonsal - 10-05-2016
Comentario: Permitir Abrir la seleccion multiple de Programas y opciones 
***********************************************************/
str_param lstr_paramNula
TRY
	
	istr_param = Message.powerobjectparm
	IF istr_param.a_string1[1] = PROGRAMA THEN
		THIS.Title = 'Seleccionar Programas'
	ELSE 
		THIS.Title = 'Seleccionar Opciones'
	END IF 
	
	//Se instancia objeto seguridad para obtener la conexion a la BD: Seguridad
	invo_seg_muestras = CREATE n_cst_seg_muestras //Inicializar entidad para la conexion a seguridad de Muestras
	invo_seg_muestras.of_CargarTransaccionalSeg() //Cargar Transacional de Seguridad
	
	//Recuperar las fabricas que tiene asociadas el Usuario
	dw_prog.SetTransObject(invo_seg_muestras.of_gettransaccionseg()) //Asociar la transaccional de Seguridad al objeto
	dw_prog.retrieve(n_cst_application.ii_application,istr_param.a_long3[1],istr_param.a_long3[2])
	
	//Limpiar campos/ubicaciones para almacenar Programas
	istr_param.a_long3 = lstr_paramNula.a_long3
CATCH(Exception le_error)
	Messagebox("Error al Seleccionar el programa", le_error.getmessage(), StopSign!)
End Try
end event

event close;call super::close;/***********************************************************
SA54453 - Ceiba/jjmonsal - 10-05-2016
Comentario: Limpiar objetos en memoria
***********************************************************/
IF IsValid(invo_seg_muestras) THEN 
	DESTROY(invo_seg_muestras)
END IF 
end event

type dw_prog from datawindow within w_opc_seleccionar_programa
integer x = 73
integer y = 116
integer width = 2290
integer height = 624
integer taborder = 10
string title = "Programas"
string dataobject = "d_gr_sq_seleccion_prog"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event sqlpreview;string	ls
ls = sqlSyntax
end event

type cbx_todos from checkbox within w_opc_seleccionar_programa
integer x = 2117
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
string text = "Todos"
end type

event clicked;/********************************************************************
SA54453 - Ceiba/jjmonsal - 10-05-2016 FunctionName cbx_Todas.clicked()
<DESC> Description: Seleccionar las fabricas </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Long ll_filas, ll_fila

ll_filas = dw_Prog.Rowcount( )
IF ll_filas > 0 THEN
	FOR ll_fila = 1 TO ll_filas
		IF THIS.Checked THEN
			dw_Prog.Object.Seleccion[ll_fila] = 'S'
		ELSE
			dw_Prog.Object.Seleccion[ll_fila] = 'N'
		END IF		
	NEXT
END IF 
end event

type cb_cancelar from commandbutton within w_opc_seleccionar_programa
integer x = 1349
integer y = 768
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
SA54453 - Ceiba/jjmonsal - 10-05-2016 FunctionName Cancelar 
<DESC> Description: cancelar la seleccion de fabricas</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
close(parent)
end event

type cb_aceptar from commandbutton within w_opc_seleccionar_programa
integer x = 745
integer y = 768
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
SA54453 - Ceiba/jjmonsal - 10-05-2016 FunctionName Aceptar
<DESC> Description: llenar la estructura para la ventana quien inovca de la Seleccion de las fabricas </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Long 			ll_fila, ll_filas
uo_dsbase	lds_ProgSel

TRY
	lds_ProgSel = CREATE uo_dsbase
	lds_ProgSel.dataobject = dw_Prog.dataobject
	lds_ProgSel.settransobject(invo_seg_muestras.of_gettransaccionseg()) //Asociar la transaccional de Seguridad al objeto
	
	dw_Prog.RowsCopy(1, dw_Prog.RowCount(), Primary!, lds_ProgSel, 1, Primary!)
	lds_ProgSel.setFilter(" Seleccion = '"+n_cst_c_actualizarmp_en_ficha.SI+"' ")
	lds_ProgSel.Filter()
	
	ll_filas = lds_ProgSel.RowCount()
	FOR ll_fila = 1 To ll_filas	
		IF lds_ProgSel.Object.Seleccion[ll_fila] = n_cst_c_actualizarmp_en_ficha.SI THEN
			istr_param.a_long3[ll_fila] = lds_ProgSel.Object.co_opcion[ll_fila] //Opcion se llama el campo, pero se refiere al programa, esto por el hecho de que en la tabla estan parametrizados asi
		END IF
	NEXT
	
	Destroy(lds_ProgSel)	
	CloseWithReturn(parent,istr_param)
CATCH(Throwable le_error)
	Messagebox("Error Seleccionando Programas", le_error.getmessage(), StopSign!)
End Try
end event

