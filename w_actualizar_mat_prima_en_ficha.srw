HA$PBExportHeader$w_actualizar_mat_prima_en_ficha.srw
forward
global type w_actualizar_mat_prima_en_ficha from w_response
end type
type cb_borrar from commandbutton within w_actualizar_mat_prima_en_ficha
end type
type sle_1 from singlelineedit within w_actualizar_mat_prima_en_ficha
end type
type cb_5 from commandbutton within w_actualizar_mat_prima_en_ficha
end type
type cbx_todos from checkbox within w_actualizar_mat_prima_en_ficha
end type
type sle_lineatodas from singlelineedit within w_actualizar_mat_prima_en_ficha
end type
type sle_fabtodas from singlelineedit within w_actualizar_mat_prima_en_ficha
end type
type cb_4 from commandbutton within w_actualizar_mat_prima_en_ficha
end type
type cb_3 from commandbutton within w_actualizar_mat_prima_en_ficha
end type
type cb_2 from commandbutton within w_actualizar_mat_prima_en_ficha
end type
type cb_1 from commandbutton within w_actualizar_mat_prima_en_ficha
end type
type dw_2 from u_dw_base within w_actualizar_mat_prima_en_ficha
end type
type dw_1 from u_dw_base within w_actualizar_mat_prima_en_ficha
end type
end forward

global type w_actualizar_mat_prima_en_ficha from w_response
integer width = 3872
integer height = 1476
string title = "Actualizar Materia Prima en Fichas"
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = main!
cb_borrar cb_borrar
sle_1 sle_1
cb_5 cb_5
cbx_todos cbx_todos
sle_lineatodas sle_lineatodas
sle_fabtodas sle_fabtodas
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_2 dw_2
dw_1 dw_1
end type
global w_actualizar_mat_prima_en_ficha w_actualizar_mat_prima_en_ficha

type variables
/***********************************************************
SA50536 - Ceiba/jjmonsal - 20-04-2016
Comentario: Opcion en MUESTRAS para recodificar MP
***********************************************************/
n_cst_c_actualizarmp_en_ficha		inov_ActMP_Ficha	//Controlador Programa
end variables

forward prototypes
public subroutine wf_mostrarselecciontodasfab (readonly boolean as_bool)
public subroutine wf_mostrarselecciontodaslineas (readonly boolean as_bool)
public subroutine wf_poblarregfmpseleccionados ()
public subroutine wf_deleteinfofmpseleccionadas ()
public subroutine wf_rep_fmp_recursocotmodificado ()
public subroutine wf_autoselecccionfmpsimilares (readonly long al_fila)
public subroutine wf_cancelar (readonly string as_param, str_param astr_param)
public subroutine wf_saveas (uo_dsbase ads)
public subroutine wf_filtrarsoloseleccionados (ref uo_dsbase ads)
end prototypes

public subroutine wf_mostrarselecciontodasfab (readonly boolean as_bool);/********************************************************************
SA50536 - Ceiba/jjmonsal - 19-04-2016 FunctionName wf_MostrarSeleccionTodasFab
<DESC> Description: mostrar * </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
sle_FabTodas.Visible = as_bool
end subroutine

public subroutine wf_mostrarselecciontodaslineas (readonly boolean as_bool);/********************************************************************
SA50536 - Ceiba/jjmonsal - 19-04-2016 FunctionName wf_MostrarSeleccionTodasLineas
<DESC> Description: mostrar * </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
sle_LineaTodas.Visible = as_bool
end subroutine

public subroutine wf_poblarregfmpseleccionados ();/********************************************************************
SA50536 - Ceiba/jjmonsal - 19-04-2016 FunctionName of_MostrarSeleccionTodasFab
<DESC> Description: Inovcar of_PoblarRegFmpSeleccionados de la Controladora </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
uo_dsbase			lds_fmpSeleccionadas
Exception ex
ex = create Exception
TRY
	lds_fmpSeleccionadas = create uo_dsbase
	lds_fmpSeleccionadas.dataobject='d_sq_gr_cambio_pdto_color_mp_dt'
	lds_fmpSeleccionadas.settransobject(n_cst_application.itr_appl)
	
	IF dw_2.RowsCopy(1,dw_2.RowCount(), Primary!, lds_fmpSeleccionadas, 1, Primary!) <0 THEN
		ex.setmessage("Error Poblando datos FMP Seleccionadas.")
		Throw ex
	END IF 
	
	inov_ActMP_Ficha.of_PoblarRegFmpSeleccionados(lds_fmpSeleccionadas)	
	Destroy(lds_fmpSeleccionadas)
CATCH(Exception ex1)
	Throw ex1
End Try

end subroutine

public subroutine wf_deleteinfofmpseleccionadas ();/********************************************************************
SA50536 - Ceiba/jjmonsal - 19-04-2016 FunctionName wf_DeleteInfoFMPSeleccionadas
<DESC> Description: Inovcar of_DeleteInfoFMPSeleccionadas de la Controladora </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
TRY
	inov_ActMP_Ficha.of_DeleteInfoFMPSeleccionadas()	
CATCH(Exception ex1)
	Throw ex1
End Try

end subroutine

public subroutine wf_rep_fmp_recursocotmodificado ();/********************************************************************
SA50536 - Ceiba/jjmonsal - 19-04-2016 FunctionName: wf_Rep_Fmp_RecursoCotModificado
<DESC> Description: Inovcar of_Rep_Fmp_RecursoCotModificado de la Controladora </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
uo_dsbase			lds_fmpSeleccionadas
Exception ex
ex = create Exception
TRY
	inov_ActMP_Ficha.of_Rep_Fmp_RecursoCotModificado()
CATCH(Exception ex1)
	Throw ex1
End Try

end subroutine

public subroutine wf_autoselecccionfmpsimilares (readonly long al_fila);/********************************************************************
SA50536 - Ceiba/jjmonsal - 19-04-2016 FunctionName wf_autoSelecccionFmpSimilares
<DESC> Description: Inovcar of_DeleteInfoFMPSeleccionadas de la Controladora </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> al_fila, es la fila del detalle que se esta evaluando  </ARGS> 
<USAGE> En caso de seleccionar un registro se deben buscar los similares y seleccionarlos tambien 
Si se captura el query para la recuperacion del detalle (dw_2) se observa que en el caso de que 
ambos registros este repetidos, es por que hay un campo que lo diferencia, este es cnt_opcion<USAGE>
***********************************************************/
Long		ll_fila, ll_filas, ll_fab, ll_lin, ll_muestra, ll_ref, ll_talla, &
			ll_color, ll_parte, ll_combinacion
String	ls_asignacion, ls_accion

ll_fab			= dw_2.getItemNumber(al_fila,'co_fabrica')
ll_lin			= dw_2.getItemNumber(al_fila,'co_linea')
ll_muestra		= dw_2.getItemNumber(al_fila,'co_muestra')
ll_ref			= dw_2.getItemNumber(al_fila,'co_referencia_ref')
ll_talla			= dw_2.getItemNumber(al_fila,'co_talla')
ll_color			= dw_2.getItemNumber(al_fila,'co_color')
ll_parte			= dw_2.getItemNumber(al_fila,'co_partemp')
ll_combinacion	= dw_2.getItemNumber(al_fila,'co_combinacion')
ls_asignacion	= dw_2.getItemString(al_fila,'seleccionar')

//Si esta el grupo de datos similares en S, al seleccionar uno, entonces poner los demas en N, o viceversa
IF ls_asignacion = 'S' THEN 
	ls_accion = 'N'
ELSE 
	ls_accion = 'S'
END IF 

ll_filas = dw_2.ROWCOUNT()
FOR ll_fila = 1 TO ll_filas
	IF (ll_fab = dw_2.getItemNumber(ll_fila,'co_fabrica'))			AND &
		(ll_lin = dw_2.getItemNumber(ll_fila,'co_linea'))				AND & 
		(ll_muestra = dw_2.getItemNumber(ll_fila,'co_muestra'))		AND & 
		(ll_ref = dw_2.getItemNumber(ll_fila,'co_referencia_ref'))	AND & 
		(ll_talla = dw_2.getItemNumber(ll_fila,'co_talla'))			AND & 
		(ll_color = dw_2.getItemNumber(ll_fila,'co_color'))			AND & 
		(ll_parte = dw_2.getItemNumber(ll_fila,'co_partemp'))			AND & 
		(IsNull(ll_combinacion) OR ll_combinacion = 0 )					THEN 
		//Es una fmp similar a la anterior 
		dw_2.Object.Seleccionar[ll_fila] = ls_accion
	ELSEIF (ll_fab = dw_2.getItemNumber(ll_fila,'co_fabrica'))				AND &
		(ll_lin = dw_2.getItemNumber(ll_fila,'co_linea'))						AND & 
		(ll_muestra = dw_2.getItemNumber(ll_fila,'co_muestra'))				AND & 
		(ll_ref = dw_2.getItemNumber(ll_fila,'co_referencia_ref'))			AND & 
		(ll_talla = dw_2.getItemNumber(ll_fila,'co_talla'))					AND & 
		(ll_color = dw_2.getItemNumber(ll_fila,'co_color'))					AND & 
		(ll_parte = dw_2.getItemNumber(ll_fila,'co_partemp'))					AND & 
		(ll_combinacion	= dw_2.getItemNumber(ll_fila,'co_combinacion')) THEN
		//Es una fmp similar a la anterior 
		dw_2.Object.Seleccionar[ll_fila] = ls_accion
	END IF 
NEXT 





end subroutine

public subroutine wf_cancelar (readonly string as_param, str_param astr_param);/********************************************************************
SA50536 - Ceiba/jjmonsal - 19-04-2016 FunctionName wf_cancelar
<DESC> Description: Cancelar la seleccion </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
str_param	lstr_paramNulo
Try	
	CHOOSE CASE as_param
		CASE 'co_fabrica' 
			inov_ActMP_Ficha.of_Setistr_param(lstr_paramNulo)
			
		CASE 'co_linea' 
			astr_param.a_long2 = lstr_paramNulo.a_long2
			inov_ActMP_Ficha.of_Setistr_param(astr_param)
	END CHOOSE
CATCH(Exception ex)
	ex.setmessage("Error al cancelar la seleccion "+String(as_param)+".")
	Throw ex
End Try
end subroutine

public subroutine wf_saveas (uo_dsbase ads);/********************************************************************
SA50536 - Ceiba/jjmonsal - 19-04-2016 FunctionName wf_saveas
<DESC> Description: Cancelar la seleccion </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
String  ls_file,ls_path
Integer li_value

li_value = GetFileSaveName("Guardar como...", &
                           ls_path,ls_file,"XLS",&
									"Excel (*.XLS), *.XLS,"+&
									"Texto (*.TXT), *.TXT")
If li_value = 1 Then
	If Upper(Right(Trim(ls_path),3)) = "TXT" Then
		ads.SaveAs(ls_path,Text!,True)
	ElseIf Upper(Right(Trim(ls_path),3)) = "XLS" Then	
		ads.SaveAs(ls_path,Excel!,True)
	Else
		ads.SaveAs(ls_path, Excel!, TRUE)
	End If	
End If	
			
			
			
									
	


end subroutine

public subroutine wf_filtrarsoloseleccionados (ref uo_dsbase ads);/********************************************************************
SA50536 - Ceiba/jjmonsal - 19-04-2016 FunctionName wf_filtrarSoloSeleccionados
<DESC> Description: solo filtrar los seleccionados </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Exception ex
ex = create Exception
TRY 
	ads.setFilter(" Seleccionar = '"+n_cst_c_actualizarmp_en_ficha.SI+"' ")
	ads.Filter() 
	IF ads.rowcount() <= 0 THEN
		ex.setmessage("No se ha Seleccionado ningun registro ")
		Throw ex
	END IF 
CATCH(Exception ex1)
	Throw ex1
End try
	
end subroutine

on w_actualizar_mat_prima_en_ficha.create
int iCurrent
call super::create
this.cb_borrar=create cb_borrar
this.sle_1=create sle_1
this.cb_5=create cb_5
this.cbx_todos=create cbx_todos
this.sle_lineatodas=create sle_lineatodas
this.sle_fabtodas=create sle_fabtodas
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_2=create dw_2
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_borrar
this.Control[iCurrent+2]=this.sle_1
this.Control[iCurrent+3]=this.cb_5
this.Control[iCurrent+4]=this.cbx_todos
this.Control[iCurrent+5]=this.sle_lineatodas
this.Control[iCurrent+6]=this.sle_fabtodas
this.Control[iCurrent+7]=this.cb_4
this.Control[iCurrent+8]=this.cb_3
this.Control[iCurrent+9]=this.cb_2
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.dw_2
this.Control[iCurrent+12]=this.dw_1
end on

on w_actualizar_mat_prima_en_ficha.destroy
call super::destroy
destroy(this.cb_borrar)
destroy(this.sle_1)
destroy(this.cb_5)
destroy(this.cbx_todos)
destroy(this.sle_lineatodas)
destroy(this.sle_fabtodas)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_2)
destroy(this.dw_1)
end on

event open;call super::open;/***********************************************************
SA50536 - Ceiba/jjmonsal - 20-04-2016
Comentario: Opcion en MUESTRAS para recodificar MP
Se adicinan los campos de Fabrica y Linea al Ds: d_gr_cambio_producto_color_mp, 
adicional la ayuda de doubleclick con la opcion de elegir una o varias fabricas y lineas
Se adiciona el campo Seleccioar al ds: d_gr_muestra_ref_x_producto_color con la opcion
de seleccionar solo las Fmp que se desean afectar.
Se creo: n_cst_c_actualizarmp_en_ficha
***********************************************************/
dw_1.InsertRow(0)
dw_2.SetTransObject(n_cst_application.itr_appl)

inov_ActMP_Ficha = CREATE n_cst_c_actualizarmp_en_ficha
end event

type cb_borrar from commandbutton within w_actualizar_mat_prima_en_ficha
boolean visible = false
integer x = 3406
integer y = 1160
integer width = 398
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Borrar Anterior"
end type

event clicked;
Try
	// Se borran los registros en caso de tener registros con error
	wf_DeleteInfoFMPSeleccionadas() 
	
	commit Using n_cst_application.itr_appl;
CATCH(Throwable le_error)
	Rollback Using n_cst_application.itr_appl;
	Messagebox("Error al Procesar", le_error.getmessage())
End Try
end event

type sle_1 from singlelineedit within w_actualizar_mat_prima_en_ficha
integer x = 3406
integer y = 52
integer width = 398
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type cb_5 from commandbutton within w_actualizar_mat_prima_en_ficha
boolean visible = false
integer x = 3406
integer y = 156
integer width = 398
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Reg a Procesar"
end type

event clicked;Long ll_filas, ll_fila

ll_filas = Long(sle_1.Text)
IF ll_filas > 0 THEN
	FOR ll_fila = 1 TO ll_filas

			dw_2.Object.Seleccionar[ll_fila] = 'S'

	NEXT
END IF 
end event

type cbx_todos from checkbox within w_actualizar_mat_prima_en_ficha
integer x = 3136
integer y = 240
integer width = 247
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todos"
end type

event clicked;/********************************************************************
SA50536 - Ceiba/jjmonsal - 19-04-2016 FunctionName cbx_Todos.clicked()
<DESC> Description: Seleccionar las fabricas </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Long ll_filas, ll_fila

ll_filas = dw_2.Rowcount( )
IF ll_filas > 0 THEN
	FOR ll_fila = 1 TO ll_filas
		IF THIS.Checked THEN
			dw_2.Object.Seleccionar[ll_fila] = 'S'
		ELSE
			dw_2.Object.Seleccionar[ll_fila] = 'N'
		END IF		
	NEXT
END IF 
end event

type sle_lineatodas from singlelineedit within w_actualizar_mat_prima_en_ficha
boolean visible = false
integer x = 302
integer y = 188
integer width = 59
integer height = 44
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = " * "
boolean border = false
end type

type sle_fabtodas from singlelineedit within w_actualizar_mat_prima_en_ficha
boolean visible = false
integer x = 59
integer y = 188
integer width = 59
integer height = 44
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = " * "
boolean border = false
end type

type cb_4 from commandbutton within w_actualizar_mat_prima_en_ficha
integer x = 3406
integer y = 868
integer width = 398
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Guardar Como"
end type

event clicked;/********************************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016 FunctionName guardar como
<DESC> Description: Guardar como solo registros seleccionados </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
uo_dsbase			lds_fmpSeleccionadas
Exception ex
ex = create Exception
TRY
	If IsValid(dw_2) Then
		lds_fmpSeleccionadas = create uo_dsbase
		lds_fmpSeleccionadas.dataobject='d_sq_gr_cambio_pdto_color_mp_dt'
		lds_fmpSeleccionadas.settransobject(n_cst_application.itr_appl)
		
		IF dw_2.RowsCopy(1,dw_2.RowCount(), Primary!, lds_fmpSeleccionadas, 1, Primary!) <0 THEN
			ex.setmessage("No se ha seleccionado ningun registro.")
			Throw ex
		END IF 
		wf_filtrarSoloSeleccionados(lds_fmpSeleccionadas)
		wf_saveas(lds_fmpSeleccionadas)
		//dw_2.Event ue_saveas()
		
		IF IsValid(lds_fmpSeleccionadas) THEN 
			Destroy(lds_fmpSeleccionadas)
		END IF 
	Else
		MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","No se han indicado datos para Guardar como... !.",Exclamation!)
	End If
	
CATCH(Exception ex1)
	IF IsValid(lds_fmpSeleccionadas) THEN 
		Destroy(lds_fmpSeleccionadas)
	END IF 
	Messagebox("Error Guardar Como", ex1.getmessage(), StopSign!)
End Try

end event

type cb_3 from commandbutton within w_actualizar_mat_prima_en_ficha
integer x = 3406
integer y = 708
integer width = 398
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Recodificados"
end type

event clicked;/***********************************************************
SA50536 - Ceiba/jjmonsal - 25-04-2016
Comentario: Opcion en MUESTRAS para recodificar MP
Se modifica los argumentos de recuperacion de los recodificados
***********************************************************/
Long ll_producto, ll_color, ll_reg
String ls_mensaje
str_param	lstr_param

If dw_1.AcceptText() <= 0 Then 
	Return -1
End if

//toma los datos del origen
ll_producto = dw_1.GetItemNumber(1,'co_producto_mp_destino')
ll_color = dw_1.GetItemNumber(1,'co_color_mp_destino')

//valida que se digite el producto destino
If Isnull(ll_producto) or ll_producto <= 0 Then
	MessageBox('Atenci$$HEX1$$f300$$ENDHEX$$n','No se ha digitado el producto destino.')
	Return 1
End if
//valida que se digite el color destino
If Isnull(ll_color) or ll_color < 0 Then
	MessageBox('Atenci$$HEX1$$f300$$ENDHEX$$n','No se ha digitado el color destino.')
	Return 1
End if

//Obtener los vectores de fabricas - lineas
lstr_param = inov_ActMP_Ficha.of_getIstr_param()

//consulta el detalle
ll_reg = dw_2.Retrieve(ll_producto, ll_color, -1, -1,-1,lstr_param.a_long1[],lstr_param.a_long2[])

If ll_reg = 0 Then
	MessageBox('Atenci$$HEX1$$f300$$ENDHEX$$n','No se encontraron datos para el producto ' + String(ll_producto) + ' color ' + String(ll_color) + ' destino')
	Return 1
ElseIf ll_reg = 0 Then
	MessageBox('Atenci$$HEX1$$f300$$ENDHEX$$n','Ocurrio un inconveniente al consultar los datos.')
	Return 1
End if

Return 1

end event

type cb_2 from commandbutton within w_actualizar_mat_prima_en_ficha
integer x = 3406
integer y = 388
integer width = 398
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Consulta Origen"
end type

event clicked;/***********************************************************
SA50536 - Ceiba/jjmonsal - 20-04-2016
Comentario: Opcion en MUESTRAS para recodificar MP - Adicion Fabrica - Linea
Se altera el repositorio cambio_producto_color_mp para la adicion de la columna Linea 
***********************************************************/
Long 			ll_producto, ll_color, ll_calidad, ll_matiz,ll_caract, &
				ll_reg, ll_fab, ll_linea
String 		ls_mensaje
str_param	lstr_param
TRY
If dw_1.AcceptText() <= 0 Then 
	Return -1
End if

ls_mensaje = ''
//toma los datos del origen
ll_fab		= dw_1.GetItemNumber(1,'co_fabrica')
ll_linea		= dw_1.GetItemNumber(1,'co_linea')
ll_producto	= dw_1.GetItemNumber(1,'co_producto_mp_origen')
ll_color		= dw_1.GetItemNumber(1,'co_color_mp_origen')
ll_calidad	= dw_1.GetItemNumber(1,'calidad_mp_origen')
ll_matiz		= dw_1.GetItemNumber(1,'co_matiz_mp_origen')
ll_caract	= dw_1.GetItemNumber(1,'co_caracteristi_mp_origen')

//Validacion de informacion Origen
inov_ActMP_Ficha.of_validarInformacionOri(ll_fab,ll_linea,ll_producto, ll_color, &
						ll_calidad,ll_matiz,ll_caract,ls_mensaje)

//Obtener los vectores de fabricas - lineas
lstr_param = inov_ActMP_Ficha.of_getIstr_param()
sle_1.Text = 'Consultando ...'
//consulta el detalle
ll_reg = dw_2.Retrieve(ll_producto, ll_color, ll_calidad, ll_matiz,ll_caract,lstr_param.a_long1[],lstr_param.a_long2[])
sle_1.Text = ''
If ll_reg = 0 Then
	MessageBox('Atenci$$HEX1$$f300$$ENDHEX$$n','No se encontraron datos para el producto ' + String(ll_producto) + ' color ' + String(ll_color) + ls_mensaje)
	Return 1
ElseIf ll_reg = 0 Then
	MessageBox('Atenci$$HEX1$$f300$$ENDHEX$$n','Ocurrio un inconveniente al consultar los datos.')
	Return 1
End if
cbx_todos.Checked = True 
cbx_todos.event clicked( ) //Por defecto en la columna "Seleccionar" deben salir todos los registros marcados
Return 1
CATCH(Throwable le_error)
	ROLLBACK;
	Messagebox("Error Consulta Origen", le_error.getmessage())
End Try

end event

type cb_1 from commandbutton within w_actualizar_mat_prima_en_ficha
integer x = 3406
integer y = 548
integer width = 398
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Procesar"
end type

event clicked;/***********************************************************
SA50536 - Ceiba/jjmonsal - 21-04-2016
Comentario: Opcion en MUESTRAS para recodificar MP
Se Crea of_validarInformacionOri y of_ValidarInformacionDest en el objeto Creado: n_cst_c_actualizarmp_en_ficha para validaciones
Se adicionan validaciones y se adiciona funcionalidad por defecto seleccionados todos, y si se da procesar validar tanto origen como destino
***********************************************************/
Long		ll_producto, ll_color, ll_calidad, ll_matiz,ll_caract, ll_reg, ll_producto_destino, &
			ll_color_destino, ll_fab, ll_linea
String	ls_mensaje
n_ds_application	lds_datos

TRY
	If dw_1.AcceptText() <= 0 Then 
		Return -1
	End if
	
	IF dw_2.Rowcount()=0 THEN cb_2.event clicked( ) //Si se procesa sin Consultar Orgien: primero se recupera luego se procesa
	
	ls_mensaje = ''
	//toma los datos del origen
	ll_fab					= dw_1.GetItemNumber(1,'co_fabrica')
	ll_linea					= dw_1.GetItemNumber(1,'co_linea')
	ll_producto 			= dw_1.GetItemNumber(1,'co_producto_mp_origen')
	ll_color 				= dw_1.GetItemNumber(1,'co_color_mp_origen')
	ll_calidad 				= dw_1.GetItemNumber(1,'calidad_mp_origen')
	ll_matiz 				= dw_1.GetItemNumber(1,'co_matiz_mp_origen')
	ll_caract 				= dw_1.GetItemNumber(1,'co_caracteristi_mp_origen')
	ll_producto_destino 	= dw_1.GetItemNumber(1,'co_producto_mp_destino')
	ll_color_destino 		= dw_1.GetItemNumber(1,'co_color_mp_destino')
	
	//Validacion de informacion Origen
	inov_ActMP_Ficha.of_validarInformacionOri(ll_fab,ll_linea,ll_producto, ll_color, &
							ll_calidad,ll_matiz,ll_caract,ls_mensaje)
	
	//Validacion de informacion Destino						
	inov_ActMP_Ficha.of_ValidarInformacionDest(ll_producto_destino,ll_color_destino)						
	
	lds_datos = CREATE n_ds_application
	lds_datos.of_load(dw_1.DataObject)
	lds_datos.of_conexion(n_cst_application.itr_appl,True)
	
	//se copia el registro a insertar
	dw_1.RowsCopy(1, 1, Primary!, lds_datos, 1, Primary!)
	sle_1.Text = 'Marcando ' + String( dw_2.RowCount() ) + '...'
	//Poblar los registro de las fmp seleccionadas - Detalle 
	wf_PoblarRegFmpSeleccionados() //SA50536 - Ceiba/jjmonsal - 25-04-2016
	
	IF ISNULL(lds_datos.getItemnumber(1,'calidad_mp_origen')) THEN
		lds_datos.SetItem(1,'calidad_mp_origen',1)
	END IF 
	IF ISNULL(lds_datos.getItemnumber(1,'co_matiz_mp_origen')) THEN
		lds_datos.SetItem(1,'co_matiz_mp_origen',0)
	END IF 
	IF ISNULL(lds_datos.getItemnumber(1,'co_caracteristi_mp_origen')) THEN
		lds_datos.SetItem(1,'co_caracteristi_mp_origen',0)
	END IF 
	
	//asigna los otros campos
	lds_datos.SetItem(1,'de_producto','')
	lds_datos.SetItem(1,'calidad_mp_destino',1)
	lds_datos.SetItem(1,'co_matiz_mp_destino',0)
	lds_datos.SetItem(1,'co_caracteristi_mp_destino',0)
	lds_datos.SetItem(1,'estado',0)
	sle_1.Text = 'Marcando Cambio Producto ...'
	//inserta el registro
	If lds_datos.Update() > 0 Then
		sle_1.Text = 'Cambiando ' + String( dw_2.RowCount() ) + ' Regs ...'
		// Invoca el procedure que recodifica los datos
		Declare cc_recodifica_datos  Procedure For pr_cambio_producto_color_mp_n() 
		  using n_cst_application.itr_appl;
		Execute cc_recodifica_datos;
		sle_1.Text = ''
		If n_cst_application.itr_appl.SqlCode < 0 Then
			ls_mensaje = n_cst_application.itr_appl.SqlErrText
			Rollback Using n_cst_application.itr_appl;
			MessageBox("Advertencia","No se pudo ejecutar el"+&
											 " procedimiento para actualizar la materia prima"+".~n~n"+ls_mensaje)
			Destroy lds_datos
			CLOSE cc_recodifica_datos; 
			Return -1
		Else
			sle_1.Text = 'Creando Log ' + String( dw_2.RowCount() ) + ' Regs ...'
			//Realizar proceso de informar sobre cambios a fmp y limpiar la informacion del detalle para futuros usos
			wf_Rep_Fmp_RecursoCotModificado()
			sle_1.Text = 'Quitando Marca ' + String( dw_2.RowCount() ) + ' Regs ...'
			wf_DeleteInfoFMPSeleccionadas() //SA50536 - Ceiba/jjmonsal - 25-04-2016
			//commita los datos
			commit Using n_cst_application.itr_appl;
			sle_1.Text = 'Termino Cambio ' + String( dw_2.RowCount() ) + ' Regs!'
			MessageBox('Atenci$$HEX1$$f300$$ENDHEX$$n','Se actualizaron los datos para la materia prima.')
		End If
		
		CLOSE cc_recodifica_datos; 
	Else
		Rollback Using n_cst_application.itr_appl;
		MessageBox('Atenci$$HEX1$$f300$$ENDHEX$$n','Ocurrio un inconveniente al insertar registro para la actualizaci$$HEX1$$f300$$ENDHEX$$n.')
		Destroy lds_datos
		Return 1
	End if
	
	Destroy lds_datos
	Return 1
CATCH(Throwable le_error)
	Rollback Using n_cst_application.itr_appl;
	Messagebox("Error al Procesar", le_error.getmessage())
End Try
end event

type dw_2 from u_dw_base within w_actualizar_mat_prima_en_ficha
integer x = 41
integer y = 312
integer width = 3333
integer height = 1032
integer taborder = 20
string title = "Fichas de Materia Prima"
string dataobject = "d_gr_muestra_ref_x_producto_color"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;//
end event

event sqlpreview;call super::sqlpreview;String ls_SQLSyntax 
ls_SQLSyntax = SQLSyntax
end event

event itemchanged;call super::itemchanged;/***********************************************************
SA50536 - Ceiba/jjmonsal - 22-04-2016
Comentario: Opcion en MUESTRAS para recodificar MP
En caso de seleccionar un registro se deben buscar los similares y seleccionarlos tambien 
***********************************************************/

CHOOSE CASE Dwo.Name
	CASE 'seleccionar'
		wf_autoSelecccionFmpSimilares(THIS.getRow())
END CHOOSE

end event

type dw_1 from u_dw_base within w_actualizar_mat_prima_en_ficha
integer x = 41
integer y = 24
integer width = 3086
integer height = 240
string dataobject = "d_gr_cambio_producto_color_mp"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;//
end event

event doubleclicked;call super::doubleclicked;/***********************************************************
SA50536 - Ceiba/jjmonsal - 20-04-2016
Comentario: Opcion en MUESTRAS para recodificar MP
Se implementa logica para control de logica double click entre columnas
Fabricas en el inov_ActMP_Ficha.istr_param.a_long1
Lineas en el inov_ActMP_Ficha.istr_param.a_long2
***********************************************************/
Long			ll_nulo
str_param	lstr_param, lstr_paramTmp
n_cst_comun	luo_comun

SetNull(ll_nulo)
Try	
	CHOOSE CASE Dwo.Name
		CASE 'co_fabrica' 
			wf_MostrarSeleccionTodasFab(False)
			wf_MostrarSeleccionTodasLineas(False)
			THIS.setItem(1,'co_fabrica',ll_nulo)
			THIS.setItem(1,'co_linea',ll_nulo)
			OpenWithParm(w_opc_seleccionar_fabrica,lstr_param)
			lstr_param=Message.PowerObjectParm
			IF IsValid(lstr_param) Then
				IF UPPERBOUND(lstr_param.a_long1[]) > 1 THEN 
					inov_ActMP_Ficha.of_setvariasfab(True)
					wf_MostrarSeleccionTodasFab(inov_ActMP_Ficha.of_getvariasfab( ) )
				ELSEIF UPPERBOUND(lstr_param.a_long1[]) = 0 THEN 
					RETURN 1
				ELSE
					THIS.setItem(1,'co_fabrica',lstr_param.a_long1[1])
				END IF 
				inov_ActMP_Ficha.of_Setistr_param(lstr_param)
			ELSE
				wf_cancelar(String(Dwo.Name),lstr_paramTmp)
			End IF
			
		CASE 'co_linea' 
			lstr_paramTmp = inov_ActMP_Ficha.of_getistr_param()
			wf_MostrarSeleccionTodasLineas(False)
			THIS.setItem(1,'co_linea',ll_nulo)
			IF IsNull(THIS.getItemNumber(1,'co_fabrica')) AND (inov_ActMP_Ficha.of_getvariasfab( ) = FALSE) THEN 
				MessageBox('Advertencia', 'Debe Ingresar la(s) Fabrica(s)')
				RETURN 1 
			ELSE //Es una o Son varias 
				lstr_param = inov_ActMP_Ficha.of_getistr_param( ) //Obtener la(s) Fabrica(s)
			END IF 
			OpenWithParm(w_opc_seleccionar_linea,lstr_param)
			lstr_param=Message.PowerObjectParm
			IF IsValid(lstr_param) Then
				IF UPPERBOUND(lstr_param.a_long2[]) > 1 THEN 
					inov_ActMP_Ficha.of_setvariasLineas(True)
					wf_MostrarSeleccionTodasLineas(inov_ActMP_Ficha.of_getvariasLineas( ) )
				ELSEIF UPPERBOUND(lstr_param.a_long2[]) = 0 THEN 
					RETURN 1
				ELSE
					THIS.setItem(1,'co_linea',lstr_param.a_long2[1])
				END IF 
				lstr_paramTmp.a_long2 = lstr_param.a_long2
				inov_ActMP_Ficha.of_Setistr_param(lstr_paramTmp)
			ELSE
				wf_cancelar(String(Dwo.Name),lstr_paramTmp)
			End IF
	END CHOOSE
CATCH(Throwable le_error)
	Messagebox("Error al seleccionar "+String(Dwo.Name)+".", le_error.getmessage())
End Try
end event

event itemchanged;call super::itemchanged;/***********************************************************
SA50536 - Ceiba/jjmonsal - 25-04-2016
Comentario: Opcion en MUESTRAS para recodificar MP
***********************************************************/
//Si se ejecuta itemchanged desea ingresar un solo codigo
Long			ll_nulo
str_param	lstr_param
Try
	SetNull(ll_nulo)	
	//Controlar que no se abra la ventana dobleclick se cancele y se dijite un #
	IF Not(IsValid(inov_ActMP_Ficha.of_getistr_param())) THEN 
		inov_ActMP_Ficha.of_setistr_param(lstr_param)
	END IF 
	CHOOSE CASE Dwo.Name
		CASE 'co_fabrica'
			THIS.setItem(1,'co_linea',ll_nulo)
			wf_MostrarSeleccionTodasFab(False) 		//Resetar indicaron que son varias Fabricas			
			wf_MostrarSeleccionTodasLineas(False)	//Resetar indicaron que son varias Lineas
		CASE 'co_linea'
			wf_MostrarSeleccionTodasLineas(False)	//Resetar indicaron que son varias Lineas
	END CHOOSE 
	inov_ActMP_Ficha.of_itemchanged(row,dwo,data)
CATCH(Exception le_error)
	Messagebox("Error al modificar el valor de "+String(Dwo.Name)+".", le_error.getmessage())
End Try
end event

