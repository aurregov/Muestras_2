HA$PBExportHeader$w_cfg_param_perespxapli.srw
$PBExportComments$/***********************************************************~r~nSA53453 - Ceiba/jjmonsal - 04-05-2016~r~nComentario: Mantenimiento Restriccion de Usuarios para Fichas de Materia Prima~r~n***********************************************************/
forward
global type w_cfg_param_perespxapli from w_sheet
end type
type cb_guardarcomo from commandbutton within w_cfg_param_perespxapli
end type
type cb_2 from commandbutton within w_cfg_param_perespxapli
end type
type cb_copiaruser from commandbutton within w_cfg_param_perespxapli
end type
type cb_importar from commandbutton within w_cfg_param_perespxapli
end type
type cbx_todos from checkbox within w_cfg_param_perespxapli
end type
type sle_opciontodas_mae from singlelineedit within w_cfg_param_perespxapli
end type
type sle_usuariotodos_mae from singlelineedit within w_cfg_param_perespxapli
end type
type sle_lineatodas_mae from singlelineedit within w_cfg_param_perespxapli
end type
type sle_fabtodas_mae from singlelineedit within w_cfg_param_perespxapli
end type
type sle_progtodos_mae from singlelineedit within w_cfg_param_perespxapli
end type
type cb_insertar from commandbutton within w_cfg_param_perespxapli
end type
type sle_progtodos from singlelineedit within w_cfg_param_perespxapli
end type
type sle_usuariotodos from singlelineedit within w_cfg_param_perespxapli
end type
type sle_lineatodas from singlelineedit within w_cfg_param_perespxapli
end type
type sle_fabtodas from singlelineedit within w_cfg_param_perespxapli
end type
type cb_1 from commandbutton within w_cfg_param_perespxapli
end type
type cb_buscar from commandbutton within w_cfg_param_perespxapli
end type
type dw_perespxapli from datawindow within w_cfg_param_perespxapli
end type
type dw_ex_param from datawindow within w_cfg_param_perespxapli
end type
end forward

global type w_cfg_param_perespxapli from w_sheet
integer width = 4105
integer height = 1744
string title = " Maestro de Permisos Especiales Muestras"
cb_guardarcomo cb_guardarcomo
cb_2 cb_2
cb_copiaruser cb_copiaruser
cb_importar cb_importar
cbx_todos cbx_todos
sle_opciontodas_mae sle_opciontodas_mae
sle_usuariotodos_mae sle_usuariotodos_mae
sle_lineatodas_mae sle_lineatodas_mae
sle_fabtodas_mae sle_fabtodas_mae
sle_progtodos_mae sle_progtodos_mae
cb_insertar cb_insertar
sle_progtodos sle_progtodos
sle_usuariotodos sle_usuariotodos
sle_lineatodas sle_lineatodas
sle_fabtodas sle_fabtodas
cb_1 cb_1
cb_buscar cb_buscar
dw_perespxapli dw_perespxapli
dw_ex_param dw_ex_param
end type
global w_cfg_param_perespxapli w_cfg_param_perespxapli

type variables
/***********************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016
Comentario: Mantenimiento Restriccion de Usuarios para Fichas de Materia Prima
Se crean las variables requeridas para el maestro de Permisos Especiales 
Objetos creados: n_cst_c_cfg_param_perespxapli y se instancia n_cst_seg_muestras
***********************************************************/
CONSTANT LONG RANGOINFOPC = 0
CONSTANT LONG RANGOSUPOPC = 2011
CONSTANT LONG RANGOINFPROG = 3001
CONSTANT LONG RANGOSUPPROG = 600406
CONSTANT STRING FILTRO = 'DWFILTRO'
CONSTANT STRING MAESTRO = 'DWMAE'
CONSTANT STRING PROGRAMA = 'Prog'
CONSTANT STRING OPCION = 'Opc'
CONSTANT LONG COD_PROG = 301512

n_cst_seg_muestras				invo_seg_muestras 
n_cst_c_cfg_param_perespxapli	invo_c_param_perespxapli			//Instancia para almacenar datos de filtro
n_cst_c_cfg_param_perespxapli	invo_c_param_perespxapli_maestro	//Instancia para almacenar datos del maestro



end variables

forward prototypes
public subroutine wf_cargardddw ()
public function long wf_doubleclicked (long row, dwobject dwo, ref n_cst_c_cfg_param_perespxapli acst_arg, readonly string as_param)
public subroutine wf_cancelar (readonly string as_param, str_param astr_param, ref n_cst_c_cfg_param_perespxapli acst_param)
public subroutine wf_mostrarselecciontodosprog (readonly boolean ab_bool, readonly string as_param)
public subroutine wf_mostrarselecciontodasfab (readonly boolean ab_bool, readonly string as_param)
public subroutine wf_mostrarselecciontodaslineas (readonly boolean ab_bool, readonly string as_param)
public subroutine wf_mostrarselecciontodosusers (readonly boolean ab_bool, readonly string as_param)
public function boolean wf_validarquesoloseingreseunregalavez ()
public subroutine wf_mostrarselecciontodasopc (readonly boolean ab_bool, readonly string as_param)
public subroutine wf_recuperarinformacionmaestro (readonly str_param astr_param)
public subroutine wf_resetvariablesindicadordetodos ()
public subroutine wf_postguardar ()
public subroutine wf_posteliminar ()
public function boolean wf_validarpermisos ()
public function string wf_getusuariosconpermisosadmin ()
public function boolean wf_getusuariosconpermisosparam ()
public subroutine wf_preopen ()
public function boolean wf_validarinforecuperarmaestro (readonly str_param astr_param)
end prototypes

public subroutine wf_cargardddw ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName wf_CargarDddw
<DESC> Description: Cargar la informacion de las listas desplegables</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE>Se encargar de Cargar la informacion de las listas desplegables.</USAGE>
********************************************************************/
DataWindowChild ldwc_Opciones, ldwc_Programas

Try 
	//Cargar el dddw para las Opciones 
	dw_perespxapli.GetChild("co_opcion", ldwc_Opciones)
	ldwc_Opciones.settransobject(invo_seg_muestras.of_gettransaccionseg()) //Asociar la transaccional de Seguridad al objeto
	ldwc_Opciones.Retrieve(n_cst_application.ii_application,RANGOINFOPC,RANGOSUPOPC) //Recuperar opciones solo validas para Muestras
	
	//Cargar el dddw para los Programas 
	dw_perespxapli.GetChild("co_programa", ldwc_Programas)
	ldwc_Programas.settransobject(invo_seg_muestras.of_gettransaccionseg()) //Asociar la transaccional de Seguridad al objeto
	ldwc_Programas.Retrieve(n_cst_application.ii_application,RANGOINFPROG,RANGOSUPPROG) //Recuperar opciones solo validas para Muestras

CATCH( Exception ex)
	ex.setmessage("Error al Cargar la informacion de las listas desplegables.")
	Throw ex
CATCH(Throwable le_error)
	Messagebox("Error Inesperado", le_error.getmessage(), StopSign!)
End Try
end subroutine

public function long wf_doubleclicked (long row, dwobject dwo, ref n_cst_c_cfg_param_perespxapli acst_arg, readonly string as_param);/********************************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016 FunctionName wf_CargarDddw
<DESC> Description: Cargar la informacion de las listas desplegables</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE>Se encargar de Cargar la informacion de las listas desplegables.</USAGE>
********************************************************************/
Long			ll_nulo
String		ls_nulo
str_param	lstr_param, lstr_paramAux
n_cst_comun	luo_comun
DataWindow	dw_parametros

//Detectar si se esta posicionado sobre dw_filtro o sobre el Maestro
IF as_param = FILTRO THEN 
	dw_parametros = dw_ex_param
ELSE
	dw_parametros = dw_perespxapli
END IF

SetNull(ll_nulo)
SetNull(ls_nulo)
Try	
	lstr_paramAux = acst_arg.of_getistr_param()
	CHOOSE CASE Dwo.Name
		CASE 'co_programa'
			dw_parametros.setColumn('co_fabrica')//Cambiar foco a la sgte columna
			wf_MostrarSeleccionTodosProg(False,as_param)
			dw_parametros.setItem(row,'co_programa',ll_nulo)
			lstr_param.a_long3[1]=RANGOINFPROG
			lstr_param.a_long3[2]=RANGOSUPPROG
			lstr_param.a_string1[3]=PROGRAMA
			OpenWithParm(w_opc_seleccionar_Programa,lstr_param)
			lstr_param=Message.PowerObjectParm
			IF IsValid(lstr_param) Then
				IF UPPERBOUND(lstr_param.a_long3[]) > 1 THEN 
					acst_arg.of_setVariosProg(True)
					wf_MostrarSeleccionTodosProg(acst_arg.of_getVariosProg( ),as_param)
				ELSEIF UPPERBOUND(lstr_param.a_long3[]) = 0 THEN 
					RETURN 1
				ELSE
					dw_parametros.setItem(row,'co_programa',lstr_param.a_long3[1])
				END IF
				lstr_paramAux.a_long3 = lstr_param.a_long3
				acst_arg.of_Setistr_param(lstr_paramAux)
			ELSE
				wf_cancelar(String(Dwo.Name),acst_arg.of_getistr_param(),acst_arg)				
			End IF		
			
		CASE 'co_fabrica' 
			wf_MostrarSeleccionTodasFab(False,as_param)
			wf_MostrarSeleccionTodasLineas(False,as_param)
			dw_parametros.setItem(row,'co_fabrica',ll_nulo)
			dw_parametros.setItem(row,'co_linea',ll_nulo)
			OpenWithParm(w_opc_seleccionar_fabrica,lstr_param)
			lstr_param=Message.PowerObjectParm
			IF IsValid(lstr_param) Then
				IF UPPERBOUND(lstr_param.a_long1[]) > 1 THEN 
					acst_arg.of_setvariasfab(True)
					wf_MostrarSeleccionTodasFab(acst_arg.of_getvariasfab( ),as_param )
				ELSEIF UPPERBOUND(lstr_param.a_long1[]) = 0 THEN 
					RETURN 1
				ELSE
					dw_parametros.setItem(row,'co_fabrica',lstr_param.a_long1[1])
				END IF 
				lstr_paramAux.a_long1 = lstr_param.a_long1
				lstr_paramAux.a_long2 = lstr_param.a_long2 //Limpiar Array Lineas
				acst_arg.of_Setistr_param(lstr_paramAux)
			ELSE
				wf_cancelar(String(Dwo.Name),acst_arg.of_getistr_param(),acst_arg)				
			End IF
			
		CASE 'co_linea' 
			wf_MostrarSeleccionTodasLineas(False,as_param)
			dw_parametros.setItem(row,'co_linea',ll_nulo)
			IF IsNull(dw_parametros.getItemNumber(row,'co_fabrica')) AND (acst_arg.of_getvariasfab( ) = FALSE) THEN 
				MessageBox('Advertencia', 'Debe Ingresar la(s) Fabrica(s)')
				RETURN 1 
			ELSE //Es una o Son varias 
				lstr_param = acst_arg.of_getistr_param( )
			END IF 
			OpenWithParm(w_opc_seleccionar_linea,lstr_param)
			lstr_param=Message.PowerObjectParm
			IF IsValid(lstr_param) Then
				IF UPPERBOUND(lstr_param.a_long2[]) > 1 THEN 
					acst_arg.of_setvariasLineas(True)
					wf_MostrarSeleccionTodasLineas(acst_arg.of_getvariasLineas( ),as_param )
				ELSEIF UPPERBOUND(lstr_param.a_long2[]) = 0 THEN 
					RETURN 1
				ELSE
					dw_parametros.setItem(row,'co_linea',lstr_param.a_long2[1])
				END IF 
				lstr_paramAux.a_long2 = lstr_param.a_long2
				acst_arg.of_Setistr_param(lstr_paramAux)
			ELSE
				wf_cancelar(String(Dwo.Name),acst_arg.of_getistr_param(),acst_arg)				
			End IF
		
		CASE 'co_opcion' 
			dw_parametros.setColumn('usuario')//Cambiar foco a la sgte columna			
			wf_MostrarSeleccionTodasOpc(False,as_param)
			dw_parametros.setItem(row,'co_opcion',ll_nulo)
			lstr_param.a_long3[1]=RANGOINFOPC
			lstr_param.a_long3[2]=RANGOSUPOPC
			lstr_param.a_string1[3]=OPCION
			OpenWithParm(w_opc_seleccionar_Programa,lstr_param)
			lstr_param=Message.PowerObjectParm
			IF IsValid(lstr_param) Then
				IF UPPERBOUND(lstr_param.a_long3[]) > 1 THEN //Se trabaja con long3 porque w_opc_seleccionar_Programa lo trabaja con esa posicion en la struct
					acst_arg.of_setVariasOpc(True)
					wf_MostrarSeleccionTodasOpc(acst_arg.of_getVariasOpc( ),as_param)
				ELSEIF UPPERBOUND(lstr_param.a_long3[]) = 0 THEN 
					RETURN 1
				ELSE
					dw_parametros.setItem(row,'co_opcion',lstr_param.a_long3[1])
				END IF
				lstr_paramAux.a_long4 = lstr_param.a_long3
				acst_arg.of_Setistr_param(lstr_paramAux)
			ELSE
				wf_cancelar(String(Dwo.Name),acst_arg.of_getistr_param(),acst_arg)				
			End IF	
			
		CASE 'usuario'
			wf_MostrarSeleccionTodosUsers(False,as_param)
			dw_parametros.setItem(row,'usuario',ls_nulo)
			OpenWithParm(w_opc_seleccionar_users,lstr_param)
			lstr_param=Message.PowerObjectParm
			IF IsValid(lstr_param) Then
				IF UPPERBOUND(lstr_param.a_string1[]) > 1 THEN 
					acst_arg.of_setVariosUsers(True)
					wf_MostrarSeleccionTodosUsers(acst_arg.of_getVariosUsers( ),as_param)
				ELSEIF UPPERBOUND(lstr_param.a_string1[]) = 0 THEN 
					RETURN 1
				ELSE
					dw_parametros.setItem(row,'usuario',lstr_param.a_string1[1])
				END IF 
				lstr_paramAux.a_string1 = lstr_param.a_string1
				acst_arg.of_Setistr_param(lstr_paramAux)
			ELSE
				wf_cancelar(String(Dwo.Name),acst_arg.of_getistr_param(),acst_arg)				
			End IF
	END CHOOSE
	RETURN 1
CATCH( Exception ex)
	ex.setmessage("Error al Cargar la informacion de las listas desplegables.")
	Throw ex
CATCH(Throwable le_error)
	Messagebox("Error Inesperado", le_error.getmessage(), StopSign!)
End Try
end function

public subroutine wf_cancelar (readonly string as_param, str_param astr_param, ref n_cst_c_cfg_param_perespxapli acst_param);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName wf_cancelar
<DESC> Description: mostrar * </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
str_param	lstr_paramNulo
Try	
	CHOOSE CASE as_param
		CASE 'co_programa'
			astr_param.a_long3 = lstr_paramNulo.a_long3
			acst_param.of_setVariosProg(False)
			
		CASE 'co_fabrica' 
			astr_param.a_long1 = lstr_paramNulo.a_long1
			acst_param.of_setVariasFab(False)
			astr_param.a_long2 = lstr_paramNulo.a_long2
			acst_param.of_setVariasLineas(False)
			
		CASE 'co_linea' 
			astr_param.a_long2 = lstr_paramNulo.a_long2
			acst_param.of_setVariasLineas(False)
			
		CASE 'usuario'
			astr_param.a_String1 = lstr_paramNulo.a_String1
			acst_param.of_setVariosUsers(False)
			
		CASE 'co_opcion'
			astr_param.a_long4 = lstr_paramNulo.a_long4
			acst_param.of_setVariasOpc(False)
			
	END CHOOSE
	
	//Setear structura con lo comun
	acst_param.of_Setistr_param(astr_param)
	
CATCH(Exception ex)
	ex.setmessage("Error al cancelar la seleccion "+String(as_param)+".")
	Throw ex
End Try
end subroutine

public subroutine wf_mostrarselecciontodosprog (readonly boolean ab_bool, readonly string as_param);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName wf_MostrarSeleccionTodosProg
<DESC> Description: mostrar * </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Try
	IF as_param = FILTRO THEN 
		sle_progTodos.Visible = ab_bool //Mostrar * dw Filtro 
	ELSE
		sle_progTodos_mae.Visible = ab_bool //Mostrar * dw Maestro 
	END IF
CATCH( Exception ex)
	ex.setmessage("Error al modificar indicador de todos los programas")
	Throw ex
End Try
end subroutine

public subroutine wf_mostrarselecciontodasfab (readonly boolean ab_bool, readonly string as_param);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName wf_MostrarSeleccionTodasFab
<DESC> Description: mostrar * </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Try
	IF as_param = FILTRO THEN 
		sle_FabTodas.Visible = ab_bool //Mostrar * dw Filtro 
	ELSE
		sle_FabTodas_mae.Visible = ab_bool //Mostrar * dw Maestro 
	END IF
CATCH( Exception ex)
	ex.setmessage("Error al modificar indicador de todas las fabricas")
	Throw ex
End Try
end subroutine

public subroutine wf_mostrarselecciontodaslineas (readonly boolean ab_bool, readonly string as_param);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName wf_MostrarSeleccionTodasLineas
<DESC> Description: mostrar * </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Try
	IF as_param = FILTRO THEN 
		sle_LineaTodas.Visible = ab_bool //Mostrar * dw Filtro 
	ELSE 
		sle_LineaTodas_mae.Visible = ab_bool //Mostrar * dw Maestro 
	END IF
CATCH( Exception ex)
	ex.setmessage("Error al modificar indicador de todas las Lineas")
	Throw ex
End Try
end subroutine

public subroutine wf_mostrarselecciontodosusers (readonly boolean ab_bool, readonly string as_param);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName wf_MostrarSeleccionTodosUsers
<DESC> Description: mostrar * </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Try
	IF as_param = FILTRO THEN 
		sle_usuarioTodos.Visible = ab_bool //Mostrar * dw Filtro 
	ELSE
		sle_usuarioTodos_mae.Visible = ab_bool //Mostrar * dw Maestro 
	END IF
	
CATCH( Exception ex)
	ex.setmessage("Error al modificar indicador de todos usuarios")
	Throw ex
End Try
end subroutine

public function boolean wf_validarquesoloseingreseunregalavez ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016 FunctionName wf_validarQueSoloSeIngreseUnregAlaVez
<DESC> Description: Validar que solo se cargue un Nuevo registro a la vez </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> Restringir que solo se cargue Nuevo registro a la vez, ya que en un solo mvto se pueden insertar muchos permisos</USAGE>
********************************************************************/
Long		ll_programa, ll_fabrica, ll_linea, ll_opcion
String	ls_Usuario

dwItemStatus	l_status
Exception		ex
Try 
	ex = create Exception
	IF dw_perespxapli.rowCount() <= 0 THEN 
		RETURN TRUE
	END IF
	l_status 	= dw_perespxapli.getItemstatus(1,0,primary!)
	ll_programa	= dw_perespxapli.getItemNumber(1,'co_programa')
	ll_fabrica	= dw_perespxapli.getItemNumber(1,'co_fabrica')
	ll_linea		= dw_perespxapli.getItemNumber(1,'co_linea')
	ll_opcion	= dw_perespxapli.getItemNumber(1,'co_opcion')
	ls_Usuario	= dw_perespxapli.getItemString(1,'usuario')
	
	IF (IsNull(ll_programa)) OR (IsNull(ll_fabrica)) OR (IsNull(ll_linea)) OR &
		(IsNull(ll_opcion)) OR (IsNull(ls_Usuario)) OR &
		(l_status = New! OR l_status = NewModified!) THEN 
			RETURN FALSE
	END IF
	RETURN TRUE 
CATCH( Exception ex1)
	ex1.setmessage("Error al Cargar la informacion de las listas desplegables.")
	Throw ex1
CATCH(Throwable le_error)
	Messagebox("Error Inesperado", le_error.getmessage(), StopSign!)
End Try
end function

public subroutine wf_mostrarselecciontodasopc (readonly boolean ab_bool, readonly string as_param);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName wf_MostrarSeleccionTodasOpc
<DESC> Description: mostrar * </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Try
	IF as_param = FILTRO THEN 
		//Mostrar * dw Filtro 
	ELSE
		sle_opciontodas_mae.Visible = ab_bool //Mostrar * dw Maestro 
	END IF
CATCH( Exception ex)
	ex.setmessage("Error al modificar indicador de todos los programas")
	Throw ex
End Try
end subroutine

public subroutine wf_recuperarinformacionmaestro (readonly str_param astr_param);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName wf_recuperarInformacionMaestro
<DESC> Description:Recuperar informacion requerida </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Exception ex
ex = create Exception
TRY
	//Parametros Recuperacion: 1 aplicacion , 2 programa, 3 fabrica, 4 linea, 5 opcion, 6 usuario
	IF dw_perespxapli.Retrieve(invo_seg_muestras.of_getcodaplicacion( ) , &
									astr_param.a_long3[] , &
									astr_param.a_long1[], &
									astr_param.a_long2[], & 
									0, &
									astr_param.a_string1[]) <= 0 THEN 
		Ex.setmessage("No se ha encontrado ningun dato.")
		Throw Ex
	END IF 
CATCH(Exception le_error)
	Messagebox("Error al Guardar", le_error.getmessage(), StopSign!)
End Try
end subroutine

public subroutine wf_resetvariablesindicadordetodos ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName wf_resetVariablesIndicadorDeTodos
<DESC> Description: Limpiar * </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Exception ex
ex = create Exception
TRY
	invo_c_param_perespxapli_maestro.of_resetVariablesIndicadorDeTodos()
	THIS.wf_mostrarselecciontodasFab(invo_c_param_perespxapli_maestro.of_getvariasFab( ) ,MAESTRO)
	THIS.wf_mostrarselecciontodasLineas(invo_c_param_perespxapli_maestro.of_getvariasLineas( ) ,MAESTRO)
	THIS.wf_mostrarselecciontodosProg(invo_c_param_perespxapli_maestro.of_getvariosProg( ) ,MAESTRO)
	THIS.wf_mostrarselecciontodasOpc(invo_c_param_perespxapli_maestro.of_getvariasOpc( ) ,MAESTRO)	
	THIS.wf_mostrarselecciontodosUsers(invo_c_param_perespxapli_maestro.of_getvariosUsers( ) ,MAESTRO)		
CATCH(Exception le_error)
	Messagebox("Error al Guardar", le_error.getmessage(), StopSign!)
End Try
end subroutine

public subroutine wf_postguardar ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName Wf_PostGuardar
<DESC> Description: Despues de Guardar </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
str_param	lstr_param
TRY
	//Obtener los vectores de fabricas - lineas - opciones - usuarios
	lstr_param = invo_c_param_perespxapli_maestro.of_getIstr_param()	
	
	//reset varibles para observar*
	wf_resetVariablesIndicadorDeTodos()
	
	IF wf_validarInfoRecuperarMaestro(lstr_param) THEN
		cb_buscar.event clicked( )
	ELSE 
		//Recuperar Informacion del maestro
		wf_recuperarInformacionMaestro(lstr_param)
	END IF 
	
CATCH(Exception le_error)
	Messagebox("Error al Guardar", le_error.getmessage(), StopSign!)
End Try
end subroutine

public subroutine wf_posteliminar ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName wf_PostEliminar
<DESC> Description: Despues de Eliminar </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Exception ex
TRY
	//Limpiar Filtro
	IF dw_perespxapli.SetFilter("") = -1 THEN 
		ex.setmessage("Ocurrio un error al limpiar el filtro para eliminar los datos eliminados")
		Throw ex
	ELSE 
		dw_perespxapli.Filter()
	END IF 
	
	cb_buscar.event clicked( )	
CATCH(Exception le_error)
	Messagebox("Error al Post Eliminar", le_error.getmessage(), StopSign!)
End Try
end subroutine

public function boolean wf_validarpermisos ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName wf_ValidarPermisos
<DESC> Description: Validar Permisos </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
String			ls_UsersPermisos,ls_array[]
Long 				ll_cont

Exception		ex
n_cst_string 	lnv_string

Try
	ex = Create Exception
	SetNull(ls_UsersPermisos)
	ls_UsersPermisos = wf_getUsuariosConPermisosAdmin()

	lnv_string.of_convertirstring_array(ls_UsersPermisos,ls_array)
	
	FOR ll_cont=1 to upperbound(ls_array[]) //Limite array
		IF gs_usuario = ls_array[ll_cont] THEN
			RETURN TRUE
		END IF
	NEXT
	
	IF wf_getUsuariosConPermisosParam() THEN RETURN TRUE
	ex.setmessage("El usuario: "+gs_usuario +" No tiene permisos para acceder a la siguiente opcion.")
	THROW ex
	
CATCH(Exception le_error)
	Messagebox("Error de Permisos", le_error.getmessage())
	CLose(THIS)
	RETURN FALSE 
End Try
end function

public function string wf_getusuariosconpermisosadmin ();/********************************************************************
54453 - Ceiba/jjmonsal - 21-06-2016 FunctionName wf_getUsuariosConPermisosAdmin
<DESC> Description: OBTENER Usuarios Con Permisos admin - los que estan en las constantes</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
String			ls_UsersPermisos
Long 				ll_cont

Exception		ex
n_cst_comun		lo_comun

Try
	ex = Create Exception
	IF lo_comun.of_valorconstante("USER_ING_PERM_ESPECIALES", n_cst_application.itr_appl) = -1 THEN 
		ex.setmessage('Fallo lectura de la constante USER_ING_PERM_ESPECIALES')
		THROW ex
	ELSE 
		ls_UsersPermisos = lo_comun.of_getstring(1)
	END IF 

	RETURN ls_UsersPermisos
	
CATCH(Exception le_error)
	THROW ex
End Try
end function

public function boolean wf_getusuariosconpermisosparam ();/********************************************************************
54453 - Ceiba/jjmonsal - 21-06-2016 FunctionName wf_getUsuariosConPermisosParam
<DESC> Description: OBTENER Usuarios Con Permisos parametrizados por el admon - los que estan parametrizados en m_param_perespxapli</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
String			ls_null
Long 				ll_cont

Exception		ex
n_cst_comun		lo_comun

Try
	ex = Create Exception
	invo_seg_muestras.of_setOpcionGenerica(COD_PROG)
	invo_seg_muestras.of_setProgramaGenerico(COD_PROG)
	invo_seg_muestras.of_setArrayUsers()
	
	invo_seg_muestras.of_setnombredataobject('d_sq_gr_validaruser_perespxapli')
	invo_seg_muestras.of_recInfPermisosParaValidarIngreso()

	IF invo_seg_muestras.of_tieneparameaccesoalprograma() THEN 
		RETURN true
	ELSE 
		RETURN false
	END IF 
	
CATCH(Exception le_error)
	THROW ex
End Try
end function

public subroutine wf_preopen ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 22-06-2016 FunctionName wf_preOpen
<DESC> Description: Antes de Abrir la Ventana </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
TRY
	invo_seg_muestras = CREATE n_cst_seg_muestras //Inicializar entidad para la conexion a seguridad de Muestras
	invo_seg_muestras.of_CargarTransaccionalSeg() //Cargar Transacional de Seguridad
	
CATCH(Exception le_error)
	Messagebox("Error al Tratar de Iniciarlizar el Programa", le_error.getmessage(), StopSign!)
	Close(This)
End Try
end subroutine

public function boolean wf_validarinforecuperarmaestro (readonly str_param astr_param);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName wf_validarInfoRecuperarMaestro
<DESC> Description: Validar Recuperar informacion requerida </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Exception ex
ex = create Exception
TRY
	//Parametros Recuperacion: 1 aplicacion , 2 programa, 3 fabrica, 4 linea, 5 opcion, 6 usuario
	IF IsNull(astr_param.a_long3[]) OR IsNull(astr_param.a_long1[]) OR &
		IsNull(astr_param.a_long2[]) OR IsNull(astr_param.a_string1[]) THEN 
		Return False
	END IF 
	Return True
CATCH(Exception le_error)
	Messagebox("Error al Guardar", le_error.getmessage(), StopSign!)
End Try
end function

on w_cfg_param_perespxapli.create
int iCurrent
call super::create
this.cb_guardarcomo=create cb_guardarcomo
this.cb_2=create cb_2
this.cb_copiaruser=create cb_copiaruser
this.cb_importar=create cb_importar
this.cbx_todos=create cbx_todos
this.sle_opciontodas_mae=create sle_opciontodas_mae
this.sle_usuariotodos_mae=create sle_usuariotodos_mae
this.sle_lineatodas_mae=create sle_lineatodas_mae
this.sle_fabtodas_mae=create sle_fabtodas_mae
this.sle_progtodos_mae=create sle_progtodos_mae
this.cb_insertar=create cb_insertar
this.sle_progtodos=create sle_progtodos
this.sle_usuariotodos=create sle_usuariotodos
this.sle_lineatodas=create sle_lineatodas
this.sle_fabtodas=create sle_fabtodas
this.cb_1=create cb_1
this.cb_buscar=create cb_buscar
this.dw_perespxapli=create dw_perespxapli
this.dw_ex_param=create dw_ex_param
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_guardarcomo
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_copiaruser
this.Control[iCurrent+4]=this.cb_importar
this.Control[iCurrent+5]=this.cbx_todos
this.Control[iCurrent+6]=this.sle_opciontodas_mae
this.Control[iCurrent+7]=this.sle_usuariotodos_mae
this.Control[iCurrent+8]=this.sle_lineatodas_mae
this.Control[iCurrent+9]=this.sle_fabtodas_mae
this.Control[iCurrent+10]=this.sle_progtodos_mae
this.Control[iCurrent+11]=this.cb_insertar
this.Control[iCurrent+12]=this.sle_progtodos
this.Control[iCurrent+13]=this.sle_usuariotodos
this.Control[iCurrent+14]=this.sle_lineatodas
this.Control[iCurrent+15]=this.sle_fabtodas
this.Control[iCurrent+16]=this.cb_1
this.Control[iCurrent+17]=this.cb_buscar
this.Control[iCurrent+18]=this.dw_perespxapli
this.Control[iCurrent+19]=this.dw_ex_param
end on

on w_cfg_param_perespxapli.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_guardarcomo)
destroy(this.cb_2)
destroy(this.cb_copiaruser)
destroy(this.cb_importar)
destroy(this.cbx_todos)
destroy(this.sle_opciontodas_mae)
destroy(this.sle_usuariotodos_mae)
destroy(this.sle_lineatodas_mae)
destroy(this.sle_fabtodas_mae)
destroy(this.sle_progtodos_mae)
destroy(this.cb_insertar)
destroy(this.sle_progtodos)
destroy(this.sle_usuariotodos)
destroy(this.sle_lineatodas)
destroy(this.sle_fabtodas)
destroy(this.cb_1)
destroy(this.cb_buscar)
destroy(this.dw_perespxapli)
destroy(this.dw_ex_param)
end on

event open;call super::open;/***********************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016
Comentario: Solicitud para Gestionar Mantenimiento Restriccion de Usuarios para Fichas de Materia Prima
Esta opcion permite el ingreso a los usuarios registrados en la constante USER_ING_PERM_ESPECIALES, los administradores
Para matricular una nueva opcion para asignarle permisos, se debe matricular en dt_opcxaplj
***********************************************************/
Boolean	lb_TienePermisos
TRY
	wf_preOpen()
	lb_TienePermisos = wf_ValidarPermisos()
	IF NOT(lb_TienePermisos) THEN RETURN 
	
	dw_ex_param.InsertRow(0)
	
	dw_perespxapli.SetTransObject(n_cst_application.itr_appl) //Asociar la transaccional de Aplicacion al objeto
	
	wf_CargarDddw() //Cargar la informacion de las listas desplegables
	
	//Inicializacion de Controladora 
	invo_c_param_perespxapli 			= CREATE n_cst_c_cfg_param_perespxapli	//dw Filtro
	invo_c_param_perespxapli_maestro = CREATE n_cst_c_cfg_param_perespxapli	//dw Maestro
CATCH(Exception le_error)
	Messagebox("Error abriendo maestro de permisos especiales:", le_error.getmessage(), StopSign!)
End Try
end event

event ue_insertrow;call super::ue_insertrow;/***********************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016
Comentario: Mantenimiento Restriccion de Usuarios para Fichas de Materia Prima
***********************************************************/
long ll_newrow

Exception ex
Try
	ex = create Exception
	IF wf_validarQueSoloSeIngreseUnregAlaVez() THEN 
		ll_newrow = dw_perespxapli.InsertRow(1) //Se debe insertar en la primera fila para permitir visualizar los * 
		dw_perespxapli.ScrollToRow(ll_newrow)
		dw_perespxapli.SetItem(ll_newrow,'co_aplicacion', n_cst_application.ii_application)
	ELSE  //si ya se ha insertado un registro no permitir insertar uno nuevo
		ex.setmessage("Solo se permite insertar un nuevo registro cada vez, debido que se puede seleccionar uno o varios datos de cada campo.")  
		Throw ex
	END IF 

CATCH(Exception le_error)
	Messagebox("Error insertando una nueva fila en permisos especiales.", le_error.getmessage())
End Try
end event

event ue_save;call super::ue_save;/***********************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016
Comentario: Mantenimiento Restriccion de Usuarios para Fichas de Materia Prima
***********************************************************/
Long			ll_prog, ll_fab, ll_linea, ll_opc
String		ls_user
Exception	ex
ex = create Exception
TRY
	dw_perespxapli.accepttext( )
	//Capturar los Datos del datos del maestro en la inserccion de un nuevo reg
	ll_prog	= dw_perespxapli.GetItemNumber(1,'co_programa')
	ll_fab	= dw_perespxapli.GetItemNumber(1,'co_fabrica')
	ll_linea	= dw_perespxapli.GetItemNumber(1,'co_linea')
	ll_opc	= dw_perespxapli.GetItemNumber(1,'co_opcion')
	ls_user	= dw_perespxapli.GetItemString(1,'usuario')
	
	//Validar que se ingrese informacion para la creacion de permisos nuevos 
	invo_c_param_perespxapli_maestro.of_validarCamposMaestro(ll_prog, ll_fab, ll_linea, ll_opc, ls_user)
	
	invo_c_param_perespxapli_maestro.of_guardarMaestro()
//	dw_perespxapli.setitemstatus(dw_perespxapli.getrow(),0,Primary!,DataModified!)
	//Se actualizan cambios en caso de existir en el detalle recuperado
	IF dw_perespxapli.update() < 0  Then 
		ex.setMessage('Ocurrio al actualizar informacion en el maestro de permisos especiales')
		throw ex
	END IF

	//Commitar Operacion
	invo_c_param_perespxapli_maestro.of_commit()

	wf_PostGuardar()	
	
CATCH(Exception le_error)
	invo_c_param_perespxapli_maestro.of_rollback() //ROLLBACK
	Messagebox("Error al Guardar", le_error.getmessage(), StopSign!)
End Try

end event

event ue_find;call super::ue_find;/***********************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016
Comentario: Mantenimiento Restriccion de Usuarios para Fichas de Materia Prima
***********************************************************/
cb_Buscar.event clicked( )
end event

event ue_deleterow;call super::ue_deleterow;long 			ll_filas , ll_fila
uo_dsbase	lds_perespxapli
Exception	ex
TRY 
	ex = Create Exception
	IF MessageBox('Advertencia!','Est$$HEX2$$e1002000$$ENDHEX$$seguro de eliminar los registros seleccionados?', Question!, Yesno!,2) = 1 THEN
		IF dw_perespxapli.SetFilter(" Seleccion = 'S' ") = -1 THEN 
			ex.setmessage("Ocurrio un error al establecer el filtro para eliminar los datos seleccionados")
			Throw ex
		ELSE 
			dw_perespxapli.Filter()
		END IF 
		ll_filas = dw_perespxapli.rowcount()
		
		IF ll_filas <= 0 THEN
			ex.setmessage("No se ha Seleccionado ningun registro para eliminar")
			Throw ex
		ELSE		
			FOR ll_fila = 1 TO ll_filas
				dw_perespxapli.deleteRow(0)
			NEXT
		END IF 
		
		IF dw_perespxapli.update() < 0 THEN 
			ex.setmessage("Ha ocurrido una inconsistensia al tratar de Eliminar Informaci$$HEX1$$f300$$ENDHEX$$n.")
			Throw ex
		END IF 		
//		invo_c_param_perespxapli_maestro.of_eliminarMaestro(lds_perespxapli) //En la controladora al realizar el deleterow esta creando la sentencia incorrecta
		invo_c_param_perespxapli_maestro.of_commit( )
		wf_PostEliminar()	
	END IF

CATCH(Exception le_error)
	invo_c_param_perespxapli_maestro.of_rollback( )
	wf_PostEliminar()
	Messagebox("Advertencia!", le_error.getmessage(), StopSign!)
End Try
end event

type cb_guardarcomo from commandbutton within w_cfg_param_perespxapli
integer x = 3296
integer y = 828
integer width = 544
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Guardar Como"
end type

event clicked;uo_dsbase			lds_PermSeleccionadas
Exception ex
ex = create Exception
TRY
	If IsValid(dw_perespxapli) Then
		lds_PermSeleccionadas = create uo_dsbase
		lds_PermSeleccionadas.dataobject='d_sq_gr_m_param_perespxapli'
		lds_PermSeleccionadas.settransobject(n_cst_application.itr_appl)
		
		IF dw_perespxapli.RowsCopy(1,dw_perespxapli.RowCount(), Primary!, lds_PermSeleccionadas, 1, Primary!) <0 THEN
			ex.setmessage("No se ha seleccionado ningun registro.")
			Throw ex
		END IF 
		invo_c_param_perespxapli_maestro.of_filtrarSoloSeleccionados(lds_PermSeleccionadas)
		invo_c_param_perespxapli_maestro.of_saveas(lds_PermSeleccionadas)
		
		IF IsValid(lds_PermSeleccionadas) THEN 
			Destroy(lds_PermSeleccionadas)
		END IF 
	Else
		MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","No se han indicado datos para Guardar como... !.",Exclamation!)
	End If
	
CATCH(Exception ex1)
	IF IsValid(lds_PermSeleccionadas) THEN 
		Destroy(lds_PermSeleccionadas)
	END IF 
	Messagebox("Error Guardar Como", ex1.getmessage(), StopSign!)
End Try

end event

type cb_2 from commandbutton within w_cfg_param_perespxapli
boolean visible = false
integer x = 2624
integer y = 28
integer width = 343
integer height = 48
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Prueba"
end type

event clicked;String	ls_mensaje
Long		ll_fila
str_param	lstr_param

lstr_param = invo_c_param_perespxapli.of_getistr_param( )

ls_mensaje += "Estructura:" 
ls_mensaje += "~r~n"

ls_mensaje += "Programas:" 
ls_mensaje += "~r~n"

FOR ll_fila=1 TO UPPERBOUND(lstr_param.a_long3)
	ls_mensaje += ""+String(lstr_param.a_long3[ll_fila])+ " " 
	ls_mensaje += "~r~n"
NEXT

ls_mensaje += "Fabrica:" 
ls_mensaje += "~r~n"

FOR ll_fila=1 TO UPPERBOUND(lstr_param.a_long1)
	ls_mensaje += ""+String(lstr_param.a_long1[ll_fila])+ " " 
	ls_mensaje += "~r~n"
NEXT

ls_mensaje += "Lineas:" 
ls_mensaje += "~r~n"

FOR ll_fila=1 TO UPPERBOUND(lstr_param.a_long2)
	ls_mensaje += ""+String(lstr_param.a_long2[ll_fila])+ " " 
	ls_mensaje += "~r~n"
NEXT

ls_mensaje += "opcion:" 
ls_mensaje += "~r~n"

FOR ll_fila=1 TO UPPERBOUND(lstr_param.a_long4)
	ls_mensaje += ""+String(lstr_param.a_long4[ll_fila])+ " " 
	ls_mensaje += "~r~n"
NEXT

ls_mensaje += "Users:" 
ls_mensaje += "~r~n"

FOR ll_fila=1 TO UPPERBOUND(lstr_param.a_string1)
	ls_mensaje += ""+String(lstr_param.a_string1[ll_fila])+ " " 
	ls_mensaje += "~r~n"
NEXT

messageBox('Datos',ls_mensaje)

end event

type cb_copiaruser from commandbutton within w_cfg_param_perespxapli
integer x = 3296
integer y = 480
integer width = 544
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Copiar de Usuario Ref."
end type

event clicked;/***********************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016
Comentario: Mantenimiento Restriccion de Usuarios para Fichas de Materia Prima
Copiar permisos de un Usuario de ref a los demas seleccionados
***********************************************************/
TRY
	w_opc_copiarusuarioref w_to_open
	Open(w_to_open)
CATCH(Exception le_error)
	Messagebox("Error Copiando", le_error.getmessage(), StopSign!)
End Try

end event

type cb_importar from commandbutton within w_cfg_param_perespxapli
integer x = 3296
integer y = 656
integer width = 544
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Importar Archivo Plano"
end type

event clicked;/***********************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016
Comentario: Mantenimiento Restriccion de Usuarios para Fichas de Materia Prima
Importar un archivo plano con los permisos 
***********************************************************/
n_cst_importfile	lnv_svc_importfile		//AutoInstanciable
uo_dsbase			lds_perespxapli
TRY 
	invo_c_param_perespxapli_maestro.of_cargarDS(lds_perespxapli,dw_perespxapli.dataObject)
	IF lnv_svc_importFile.of_importFile(lds_perespxapli) THEN 
		invo_c_param_perespxapli_maestro.of_guardarcambios(lds_perespxapli)
		invo_c_param_perespxapli_maestro.of_commit()
	END IF 
CATCH(Exception le_error)
	invo_c_param_perespxapli_maestro.of_rollback( )
	Messagebox("Error al Importar Archivo", le_error.getmessage(), StopSign!)
End Try
end event

type cbx_todos from checkbox within w_cfg_param_perespxapli
integer x = 2912
integer y = 224
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

ll_filas = dw_perespxapli.Rowcount( )
IF ll_filas > 0 THEN
	FOR ll_fila = 1 TO ll_filas
		IF THIS.Checked THEN
			dw_perespxapli.Object.Seleccion[ll_fila] = 'S'
		ELSE
			dw_perespxapli.Object.Seleccion[ll_fila] = 'N'
		END IF		
	NEXT
END IF 
end event

type sle_opciontodas_mae from singlelineedit within w_cfg_param_perespxapli
boolean visible = false
integer x = 1810
integer y = 412
integer width = 59
integer height = 44
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = " * "
boolean border = false
boolean displayonly = true
end type

type sle_usuariotodos_mae from singlelineedit within w_cfg_param_perespxapli
boolean visible = false
integer x = 2537
integer y = 412
integer width = 59
integer height = 44
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = " * "
boolean border = false
boolean displayonly = true
end type

type sle_lineatodas_mae from singlelineedit within w_cfg_param_perespxapli
boolean visible = false
integer x = 1618
integer y = 412
integer width = 59
integer height = 44
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = " * "
boolean border = false
boolean displayonly = true
end type

type sle_fabtodas_mae from singlelineedit within w_cfg_param_perespxapli
boolean visible = false
integer x = 1413
integer y = 412
integer width = 59
integer height = 44
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = " * "
boolean border = false
boolean displayonly = true
end type

type sle_progtodos_mae from singlelineedit within w_cfg_param_perespxapli
boolean visible = false
integer x = 370
integer y = 412
integer width = 59
integer height = 44
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = " * "
boolean border = false
boolean displayonly = true
end type

type cb_insertar from commandbutton within w_cfg_param_perespxapli
integer x = 3296
integer y = 304
integer width = 544
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Insertar Usuario"
end type

event clicked;/***********************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016
Comentario: Mantenimiento Restriccion de Usuarios para Fichas de Materia Prima
Insertar una combinacion de datos nuevos, se genera un plano 
***********************************************************/
Parent.TriggerEvent("ue_insertRow")
end event

type sle_progtodos from singlelineedit within w_cfg_param_perespxapli
boolean visible = false
integer x = 110
integer y = 148
integer width = 46
integer height = 40
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "* "
boolean border = false
boolean displayonly = true
end type

type sle_usuariotodos from singlelineedit within w_cfg_param_perespxapli
boolean visible = false
integer x = 1216
integer y = 148
integer width = 46
integer height = 40
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "* "
boolean border = false
boolean displayonly = true
end type

type sle_lineatodas from singlelineedit within w_cfg_param_perespxapli
boolean visible = false
integer x = 841
integer y = 148
integer width = 46
integer height = 40
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "* "
boolean border = false
boolean displayonly = true
end type

type sle_fabtodas from singlelineedit within w_cfg_param_perespxapli
boolean visible = false
integer x = 466
integer y = 148
integer width = 46
integer height = 40
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "* "
boolean border = false
boolean displayonly = true
end type

type cb_1 from commandbutton within w_cfg_param_perespxapli
boolean visible = false
integer x = 2629
integer y = 92
integer width = 343
integer height = 48
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Prueba"
end type

event clicked;String	ls_mensaje
Long		ll_fila
str_param	lstr_param

lstr_param = invo_c_param_perespxapli_maestro.of_getistr_param( )

ls_mensaje += "Estructura:" 
ls_mensaje += "~r~n"

ls_mensaje += "Programas:" 
ls_mensaje += "~r~n"

FOR ll_fila=1 TO UPPERBOUND(lstr_param.a_long3)
	ls_mensaje += ""+String(lstr_param.a_long3[ll_fila])+ " " 
	ls_mensaje += "~r~n"
NEXT

ls_mensaje += "Fabrica:" 
ls_mensaje += "~r~n"

FOR ll_fila=1 TO UPPERBOUND(lstr_param.a_long1)
	ls_mensaje += ""+String(lstr_param.a_long1[ll_fila])+ " " 
	ls_mensaje += "~r~n"
NEXT

ls_mensaje += "Lineas:" 
ls_mensaje += "~r~n"

FOR ll_fila=1 TO UPPERBOUND(lstr_param.a_long2)
	ls_mensaje += ""+String(lstr_param.a_long2[ll_fila])+ " " 
	ls_mensaje += "~r~n"
NEXT

ls_mensaje += "opcion:" 
ls_mensaje += "~r~n"

FOR ll_fila=1 TO UPPERBOUND(lstr_param.a_long4)
	ls_mensaje += ""+String(lstr_param.a_long4[ll_fila])+ " " 
	ls_mensaje += "~r~n"
NEXT

ls_mensaje += "Users:" 
ls_mensaje += "~r~n"

FOR ll_fila=1 TO UPPERBOUND(lstr_param.a_string1)
	ls_mensaje += ""+String(lstr_param.a_string1[ll_fila])+ " " 
	ls_mensaje += "~r~n"
NEXT

messageBox('Datos',ls_mensaje)

end event

type cb_buscar from commandbutton within w_cfg_param_perespxapli
integer x = 1701
integer y = 124
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar"
end type

event clicked;/***********************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016
Comentario: Mantenimiento Restriccion de Usuarios para Fichas de Materia Prima
Logica para Recuperar la Informacion segun el filtro seleccionado
***********************************************************/
Long			ll_fab, ll_linea,ll_prog
String		ls_user
str_param	lstr_param
Exception	Ex
TRY 
	Ex = CREATE Exception
	If dw_ex_param.AcceptText() <= 0 Then 
		Return -1
	End if
	
	//Capturar los Datos
	ll_fab	= dw_ex_param.GetItemNumber(1,'co_fabrica')
	ll_linea	= dw_ex_param.GetItemNumber(1,'co_linea')
	ll_prog	= dw_ex_param.GetItemNumber(1,'co_programa')
	ls_user	= dw_ex_param.GetItemString(1,'usuario')
	
	//Validar que se ingrese informacion al filtro 
	invo_c_param_perespxapli.of_validarCamposFiltro(ll_fab,ll_linea,ll_prog,ls_user)
	
	//Obtener los vectores de fabricas - lineas - opciones - usuarios
	lstr_param = invo_c_param_perespxapli.of_getIstr_param()
	
	//reset varibles para observar * en el Maestro
	wf_resetVariablesIndicadorDeTodos()
	
	//Recuperar Informacion del maestro
	wf_recuperarInformacionMaestro(lstr_param)
	
CATCH(Exception le_error)
	Messagebox("Error al Buscar la informaci$$HEX1$$f300$$ENDHEX$$n requerida", le_error.getmessage())
End Try

end event

type dw_perespxapli from datawindow within w_cfg_param_perespxapli
integer x = 101
integer y = 304
integer width = 3099
integer height = 1028
integer taborder = 20
string title = "Permisos Especiales por Usuario"
string dataobject = "d_sq_gr_m_param_perespxapli"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event sqlpreview;String ls_SQLSyntax 
ls_SQLSyntax = SQLSyntax
end event

event itemchanged;/********************************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016 FunctionName: itemchanged 
<DESC> Description cada que se cambie un item se verificara el valor que debe quedar </DESC> 
<RETURN> NONE </RETURN> 
<ACCESS> Public/Protected/Private : NO aplica <ACCESS>
<USAGE> itemchanged para ventana de permisos especiales  </USAGE>
********************************************************************/
//Si se ejecuta itemchanged desea ingresar un solo codigo
Long			ll_nulo
String		ls_nulo
str_param	lstr_param

Try
	SetNull(ll_nulo)
	SetNull(ls_nulo)
	THIS.accepttext( )
	//Controlar que no se abra la ventana dobleclick se cancele y se dijite un #
	IF Not(IsValid(invo_c_param_perespxapli_maestro.of_getistr_param())) THEN 
		invo_c_param_perespxapli_maestro.of_setistr_param(lstr_param)
	END IF 
	CHOOSE CASE Dwo.Name
		CASE 'co_programa'			
			wf_MostrarSeleccionTodosProg(False,MAESTRO) 		//Resetar indicador son varios Programas
		CASE 'co_fabrica'
			THIS.setItem(1,'co_linea',ll_nulo)
			wf_MostrarSeleccionTodasFab(False, MAESTRO) 		//Resetar indicaron que son varias Fabricas			
			wf_MostrarSeleccionTodasLineas(False,MAESTRO)	//Resetar indicaron que son varias Lineas
		CASE 'co_linea'
			wf_MostrarSeleccionTodasLineas(False,MAESTRO)	//Resetar indicaron que son varias Lineas
		CASE 'usuario'
			THIS.setItem(1,'usuario',ls_nulo)
			wf_MostrarSeleccionTodosUsers(False,MAESTRO)		//Resetar indicaron que son varios Usuarios
		CASE 'co_opcion'			
			wf_MostrarSeleccionTodasOpc(False,MAESTRO) 		//Resetar indicador son varias Opciones	
	END CHOOSE 
	invo_c_param_perespxapli_maestro.of_itemchanged(row,dwo,data)
	
CATCH(Exception le_error)
	Messagebox("Error al modificar el valor de "+String(Dwo.Name)+".", le_error.getmessage())
//	IF Dwo.Name = 'usuario' THEN THIS.setitem(THIS.GetRow(),'usuario',' ')
	Return 2
End Try

end event

event doubleclicked;/***********************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016
Comentario: Opcion en MUESTRAS para recodificar MP
Se implementa logica tomada de doubleclicked de dw_ex_param 
***********************************************************/
dwItemStatus l_status

l_status = THIS.getItemstatus(row,0,primary!)
Try	
	IF (l_status = New! OR l_status = NewModified! ) THEN 
		wf_doubleClicked(row,dwo,invo_c_param_perespxapli_maestro,MAESTRO)
	END IF 
CATCH(Throwable le_error)
	Messagebox("Doble Click"+String(Dwo.Name)+".", le_error.getmessage())
End Try
end event

type dw_ex_param from datawindow within w_cfg_param_perespxapli
integer x = 101
integer y = 64
integer width = 1454
integer height = 176
integer taborder = 10
string title = "Parametros Busqueda"
string dataobject = "d_ex_gr_param_m_perespxapli"
boolean border = false
boolean livescroll = true
end type

event doubleclicked;/***********************************************************
SA50536 - Ceiba/jjmonsal - 20-04-2016
Comentario: Opcion en MUESTRAS para recodificar MP
Se implementa logica para control de logica double click entre columnas
Fabricas		En el n_cst_c_cfg_param_perespxapli.istr_param.a_long1
Lineas		En el n_cst_c_cfg_param_perespxapli.istr_param.a_long2
Programas	En el n_cst_c_cfg_param_perespxapli.istr_param.a_long3
Usuarios		En el n_cst_c_cfg_param_perespxapli.istr_param.a_string1
Opciones		En el n_cst_c_cfg_param_perespxapli.istr_param.a_long4
***********************************************************/
Try	
	wf_doubleClicked(row,dwo,invo_c_param_perespxapli,FILTRO)
CATCH(Throwable le_error)
	Messagebox("Doble Click"+String(Dwo.Name)+".", le_error.getmessage())
End Try
end event

event itemchanged;/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: itemchanged 
<DESC> Description cada que se cambie un item se verificara el valor que debe quedar </DESC> 
<RETURN> NONE </RETURN> 
<ACCESS> Public/Protected/Private : NO aplica <ACCESS>
<USAGE> itemchanged para ventana de permisos especiales  </USAGE>
********************************************************************/
//Si se ejecuta itemchanged desea ingresar un solo codigo
Long			ll_nulo
str_param	lstr_param

Try
	SetNull(ll_nulo)
	//Controlar que no se abra la ventana dobleclick se cancele y se dijite un #
	IF Not(IsValid(invo_c_param_perespxapli.of_getistr_param())) THEN 
		invo_c_param_perespxapli.of_setistr_param(lstr_param)
	END IF 
	CHOOSE CASE Dwo.Name
		CASE 'co_programa'			
			wf_MostrarSeleccionTodosProg(False,FILTRO) 	//Resetar indicador son varios Programas
		CASE 'co_fabrica'
			THIS.setItem(1,'co_linea',ll_nulo)
			wf_MostrarSeleccionTodasFab(False, FILTRO) 	//Resetar indicaron que son varias Fabricas			
			wf_MostrarSeleccionTodasLineas(False,FILTRO)	//Resetar indicaron que son varias Lineas
		CASE 'co_linea'
			wf_MostrarSeleccionTodasLineas(False,FILTRO)	//Resetar indicaron que son varias Lineas
		CASE 'usuario'			
			wf_MostrarSeleccionTodosUsers(False,FILTRO)	//Resetar indicaron que son varios Usuarios
	END CHOOSE 
	invo_c_param_perespxapli.of_itemchanged(row,dwo,data)
CATCH(Exception le_error)
	Messagebox("Error al modificar el valor de "+String(Dwo.Name)+".", le_error.getmessage())
End Try

end event

