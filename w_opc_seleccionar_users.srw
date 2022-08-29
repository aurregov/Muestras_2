HA$PBExportHeader$w_opc_seleccionar_users.srw
$PBExportComments$/***********************************************************~r~nSA54453 - Ceiba/jjmonsal - 27-05-2016~r~nComentario: Mantenimiento Restriccion de Usuarios para Fichas de Materia Prima~r~n***********************************************************/
forward
global type w_opc_seleccionar_users from w_base_busqueda
end type
type cbx_todos from checkbox within w_opc_seleccionar_users
end type
end forward

global type w_opc_seleccionar_users from w_base_busqueda
integer width = 1902
integer height = 1488
cbx_todos cbx_todos
end type
global w_opc_seleccionar_users w_opc_seleccionar_users

type variables
str_param	istr_param
end variables

forward prototypes
public function integer of_filtro (string a_filtro)
end prototypes

public function integer of_filtro (string a_filtro);dw_1.SetFilter(a_filtro)
dw_1.Filter()

il_fila=0

dw_1.SelectRow(0,False)

If dw_1.RowCount()<=0 Then
	IF a_filtro <> "de_usuario like '%%'" THEN 
		MessageBox('Advertencia','No se encontro informaci$$HEX1$$f300$$ENDHEX$$n para el filtro')
	END IF 
	//Si filtra registros
	dw_1.SetFilter('')
	dw_1.Filter()	
End If
of_filaSel(1)

Return 1
end function

on w_opc_seleccionar_users.create
int iCurrent
call super::create
this.cbx_todos=create cbx_todos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_todos
end on

on w_opc_seleccionar_users.destroy
call super::destroy
destroy(this.cbx_todos)
end on

event open;call super::open;/***********************************************************
SA54453 - Ceiba/jjmonsal - 10-05-2016
Comentario: Permitir Abrir la seleccion multiple de Usuarios 
***********************************************************/
TRY	
	dw_1.retrieve('')
	
CATCH(Exception le_error)
	Messagebox("Error al Seleccionar los Usuarios", le_error.getmessage(), StopSign!)
End Try
end event

type sle_1 from w_base_busqueda`sle_1 within w_opc_seleccionar_users
integer x = 466
integer width = 1143
textcase textcase = anycase!
end type

event sle_1::modified;of_filtro("de_usuario like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_opc_seleccionar_users
integer width = 366
string text = "Digite Usuario: "
alignment alignment = right!
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_opc_seleccionar_users
integer x = 329
integer y = 1244
end type

event cb_aceptar::clicked;/********************************************************************
SA54453 - Ceiba/jjmonsal - 10-05-2016 FunctionName Aceptar
<DESC> Description: llenar la estructura para la ventana quien inovca de la Seleccion de las fabricas </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Long 			ll_fila, ll_filas
uo_dsbase	lds_UserSel

TRY
	lds_UserSel = CREATE uo_dsbase
	lds_UserSel.dataobject = dw_1.dataobject
	lds_UserSel.settransobject(n_cst_application.itr_appl)
	
	dw_1.SetFilter('')
	dw_1.Filter()	
	
	dw_1.RowsCopy(1, dw_1.RowCount(), Primary!, lds_UserSel, 1, Primary!)
	lds_UserSel.setFilter(" Seleccion = '"+n_cst_c_actualizarmp_en_ficha.SI+"' ")
	lds_UserSel.Filter()
	
	ll_filas = lds_UserSel.RowCount()
	FOR ll_fila = 1 To ll_filas	
		IF lds_UserSel.Object.Seleccion[ll_fila] = n_cst_c_actualizarmp_en_ficha.SI THEN
			istr_param.a_string1[ll_fila] = Trim(lds_UserSel.Object.co_usuario[ll_fila]) //Codigo Usuario
		END IF
	NEXT
	
	Destroy(lds_UserSel)	
	CloseWithReturn(parent,istr_param)
CATCH(Throwable le_error)
	Messagebox("Error Seleccionando Programas", le_error.getmessage(), StopSign!)
End Try
end event

type cb_cancelar from w_base_busqueda`cb_cancelar within w_opc_seleccionar_users
integer x = 887
integer y = 1244
end type

type dw_1 from w_base_busqueda`dw_1 within w_opc_seleccionar_users
integer x = 96
integer y = 332
integer width = 1650
string dataobject = "d_gr_sq_seleccion_users"
end type

event dw_1::sqlpreview;call super::sqlpreview;string ls
ls = sqlsyntax

end event

type gb_1 from w_base_busqueda`gb_1 within w_opc_seleccionar_users
integer y = 252
integer width = 1774
end type

type gb_2 from w_base_busqueda`gb_2 within w_opc_seleccionar_users
integer width = 1769
end type

type cbx_todos from checkbox within w_opc_seleccionar_users
integer x = 1509
integer y = 196
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
SA54453 - Ceiba/jjmonsal - 10-05-2016 FunctionName cbx_Todos.clicked()
<DESC> Description: Seleccionar las fabricas </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Long ll_filas, ll_fila

ll_filas = dw_1.Rowcount( )
IF ll_filas > 0 THEN
	FOR ll_fila = 1 TO ll_filas
		IF THIS.Checked THEN
			dw_1.Object.Seleccion[ll_fila] = 'S'
		ELSE
			dw_1.Object.Seleccion[ll_fila] = 'N'
		END IF		
	NEXT
END IF 
end event

