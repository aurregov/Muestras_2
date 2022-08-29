HA$PBExportHeader$w_opc_copiarusuarioref.srw
$PBExportComments$/***********************************************************~r~nSA54453 - Ceiba/jjmonsal - 23-05-2016~r~nComentario: Mantenimiento Restriccion de Usuarios para Fichas de Materia Prima~r~n***********************************************************/
forward
global type w_opc_copiarusuarioref from w_response
end type
type cb_1 from commandbutton within w_opc_copiarusuarioref
end type
type cb_cancelar from commandbutton within w_opc_copiarusuarioref
end type
type cb_aceptar from commandbutton within w_opc_copiarusuarioref
end type
type dw_copiarusers from datawindow within w_opc_copiarusuarioref
end type
type sle_usuariotodos from singlelineedit within w_opc_copiarusuarioref
end type
end forward

global type w_opc_copiarusuarioref from w_response
integer width = 978
integer height = 940
string title = "Copiar Usuario de Referencia"
cb_1 cb_1
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
dw_copiarusers dw_copiarusers
sle_usuariotodos sle_usuariotodos
end type
global w_opc_copiarusuarioref w_opc_copiarusuarioref

type variables
str_param	istr_param

n_cst_c_cfg_param_perespxapli	invo_c_param_perespxapli	//Instancia para almacenar datos de copia de users
end variables

forward prototypes
public subroutine wf_mostrarselecciontodosusers (readonly boolean ab_bool)
public subroutine wf_cancelar ()
public subroutine wf_realizarlacopiadepermisos ()
public subroutine wf_validarusuarioparapermisos (readonly string as_user, readonly string as_param)
end prototypes

public subroutine wf_mostrarselecciontodosusers (readonly boolean ab_bool);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName wf_MostrarSeleccionTodosUsers
<DESC> Description: mostrar * </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Try
	sle_usuarioTodos.Visible = ab_bool 	
CATCH( Exception ex)
	ex.setmessage("Error al modificar indicador de todos usuarios")
	Throw ex
End Try
end subroutine

public subroutine wf_cancelar ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 23-05-2016 FunctionName wf_cancelar
<DESC> Description: Cancelar </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
str_param	lstr_paramNulo
Try	
	istr_param.a_String1 = lstr_paramNulo.a_String1
	
	//Setear structura con lo comun
	invo_c_param_perespxapli.of_Setistr_param(istr_param)
	
	
CATCH(Exception ex)
	ex.setmessage("Error al cancelar la seleccion para copiar usuarios")
	Throw ex
End Try
end subroutine

public subroutine wf_realizarlacopiadepermisos ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName wf_RealizarLaCopiaDePermisos
<DESC> Description: RealizarLaCopiaDePermisos </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Try
	invo_c_param_perespxapli.of_CopiarUserRef(dw_copiarusers.getItemString(1,'usuarioref'))
	invo_c_param_perespxapli.of_commit( )
CATCH( Exception ex)
	invo_c_param_perespxapli.of_Rollback( )
	Throw ex
End Try
end subroutine

public subroutine wf_validarusuarioparapermisos (readonly string as_user, readonly string as_param);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName wf_ValidarUsuarioParaPermisos
<DESC> Description: wf_ValidarUsuarioParaPermisos </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Try
	invo_c_param_perespxapli.of_validarUsuario(as_user)
	invo_c_param_perespxapli.of_validarusuarioexiste(as_user,invo_c_param_perespxapli.of_getVariosUsers(),as_param)
CATCH( Exception ex)
	Throw ex
End Try
end subroutine

on w_opc_copiarusuarioref.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.dw_copiarusers=create dw_copiarusers
this.sle_usuariotodos=create sle_usuariotodos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_cancelar
this.Control[iCurrent+3]=this.cb_aceptar
this.Control[iCurrent+4]=this.dw_copiarusers
this.Control[iCurrent+5]=this.sle_usuariotodos
end on

on w_opc_copiarusuarioref.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.dw_copiarusers)
destroy(this.sle_usuariotodos)
end on

event open;call super::open;/***********************************************************
SA54453 - Ceiba/jjmonsal - 10-05-2016
Comentario: Permitir Abrir la seleccion multiple de Usuarios 
***********************************************************/
TRY	
	invo_c_param_perespxapli = CREATE n_cst_c_cfg_param_perespxapli
	//Recuperar los usuarios que tiene asociadas el Usuario
	dw_CopiarUsers.SetTransObject(n_cst_application.itr_appl)
	dw_CopiarUsers.InsertRow(0)
	
CATCH(Exception le_error)
	Messagebox("Error al Seleccionar los Usuarios", le_error.getmessage(), StopSign!)
End Try
end event

event close;call super::close;IF Isvalid(invo_c_param_perespxapli) THEN 
	Destroy(invo_c_param_perespxapli)
END IF



end event

type cb_1 from commandbutton within w_opc_copiarusuarioref
boolean visible = false
integer x = 37
integer y = 436
integer width = 201
integer height = 60
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Prueba"
end type

event clicked;str_param lstr_param
String ls_mensaje
lstr_param = invo_c_param_perespxapli.of_getistr_param( )
 ls_mensaje += "Estructura:" 
ls_mensaje += "~r~n"

ls_mensaje += "Users:" 
ls_mensaje += "~r~n"
long ll_fila
FOR ll_fila=1 TO UPPERBOUND(lstr_param.a_string1)
	ls_mensaje += ""+String(lstr_param.a_string1[ll_fila])+ " " 
	ls_mensaje += "~r~n"
NEXT

messageBox('Datos',ls_mensaje)

end event

type cb_cancelar from commandbutton within w_opc_copiarusuarioref
integer x = 512
integer y = 504
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

event clicked;CLOSE(PARENT)
end event

type cb_aceptar from commandbutton within w_opc_copiarusuarioref
integer x = 110
integer y = 504
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

event clicked;Try
	dw_copiarusers.Accepttext( )
	wf_ValidarUsuarioParaPermisos(dw_copiarusers.getItemString(1,'usuario'),'usuario' ) //Validar ususario ingresado y exista en muestras 			
	wf_ValidarUsuarioParaPermisos(dw_copiarusers.getItemString(1,'usuarioRef'),'usuarioRef' ) //Validar ususario ingresado y exista en muestras 			
	wf_RealizarLacopiaDePermisos()
	Close(Parent)
CATCH(Exception le_error)
	Messagebox("Error copiando Usuarios", le_error.getmessage(), StopSign!)
End Try
end event

type dw_copiarusers from datawindow within w_opc_copiarusuarioref
integer x = 142
integer y = 48
integer width = 686
integer height = 400
integer taborder = 10
string title = "Copiar Usuario de Referencia"
string dataobject = "d_ex_fr_param_copiarusuarioref"
boolean border = false
boolean livescroll = true
end type

event doubleclicked;String		ls_nulo
str_param	lstr_param
SetNull(ls_nulo)
CHOOSE CASE Dwo.Name
	CASE 'usuario'
		wf_MostrarSeleccionTodosUsers(False)
		dw_copiarusers.setItem(row,'usuario',ls_nulo)
		OpenWithParm(w_opc_seleccionar_users,lstr_param)
		lstr_param=Message.PowerObjectParm
		IF IsValid(lstr_param) Then
			IF UPPERBOUND(lstr_param.a_string1[]) > 1 THEN 
				invo_c_param_perespxapli.of_setVariosUsers(True)
				wf_MostrarSeleccionTodosUsers(invo_c_param_perespxapli.of_getVariosUsers( ))
			ELSEIF UPPERBOUND(lstr_param.a_string1[]) = 0 THEN 
				RETURN 1
			ELSE
				dw_copiarusers.setItem(row,'usuario',lstr_param.a_string1[1])
			END IF 
			istr_param.a_string1 = lstr_param.a_string1
			invo_c_param_perespxapli.of_setIstr_param(istr_param)
		ELSE
			wf_cancelar()				
		End IF
			
	CASE 'usuarioRef'
END CHOOSE 
end event

event itemchanged;/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: itemchanged 
<DESC> Description cada que se cambie un item se verificara el valor que debe quedar </DESC> 
<RETURN> NONE </RETURN> 
<ACCESS> Public/Protected/Private : NO aplica <ACCESS>
<USAGE> itemchanged para ventana de permisos especiales  </USAGE>
********************************************************************/
//Si se ejecuta itemchanged desea ingresar un solo codigo
str_param	lstr_param,lstr_paramNula
String		ls_nulo
Try
	SetNull(ls_nulo)
	//Controlar que no se abra la ventana dobleclick se cancele y se dijite un #
	IF Not(IsValid(invo_c_param_perespxapli.of_getistr_param())) THEN 
		invo_c_param_perespxapli.of_setistr_param(lstr_param)
	END IF 
	CHOOSE CASE Dwo.Name
		CASE 'usuario'				
			wf_MostrarSeleccionTodosUsers(False)	//Resetar indicaron que son varios Usuarios
			invo_c_param_perespxapli.of_setvariosUsers(False)//Resetar indicaron que son varios Usuarios
			invo_c_param_perespxapli.of_setistr_param(lstr_param) //Reset vector de Usuarios
			lstr_param.a_string1[1] = String(Data)
			wf_ValidarUsuarioParaPermisos(String(Data),'usuario') //Validar ususario ingresado y exista en muestras 			
			invo_c_param_perespxapli.of_setuser(String(Data))
		CASE 'usuarioRef'			
			
	END CHOOSE 
CATCH(Exception le_error)
	dw_copiarusers.setItem(1,'usuario',ls_nulo)
	invo_c_param_perespxapli.of_setistr_param(lstr_paramNula)
	Messagebox("Error al modificar el valor de "+String(Dwo.Name)+".", le_error.getmessage())
	RETURN 2
End Try

end event

type sle_usuariotodos from singlelineedit within w_opc_copiarusuarioref
boolean visible = false
integer x = 178
integer y = 148
integer width = 46
integer height = 40
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "*"
boolean border = false
end type

