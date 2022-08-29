HA$PBExportHeader$u_cst_login.sru
$PBExportComments$Objeto para el log$$HEX1$$ed00$$ENDHEX$$n de las aplicaciones
forward
global type u_cst_login from userobject
end type
type cb_cancelar from u_cb_base within u_cst_login
end type
type cb_aceptar from u_cb_base within u_cst_login
end type
type sle_password from u_sle_base within u_cst_login
end type
type em_user from u_em_base within u_cst_login
end type
type st_clave from u_st_base within u_cst_login
end type
type st_usuario from u_st_base within u_cst_login
end type
type p_logo from u_p_base within u_cst_login
end type
type st_caption from u_st_base within u_cst_login
end type
type gb_general from u_gb_base within u_cst_login
end type
end forward

global type u_cst_login from userobject
integer width = 1477
integer height = 708
boolean border = true
long backcolor = 80269524
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
sle_password sle_password
em_user em_user
st_clave st_clave
st_usuario st_usuario
p_logo p_logo
st_caption st_caption
gb_general gb_general
end type
global u_cst_login u_cst_login

type variables
Private:
            n_cst_paramlogin  inv_paramlogin     
            Integer                   ii_try  = 0
end variables

forward prototypes
private subroutine of_close ()
private subroutine of_login ()
public subroutine of_setparameter (n_cst_paramlogin anv_parameter)
private function boolean of_select_dt_userxper (readonly string as_user)
end prototypes

private subroutine of_close ();w_base        lw_parent
GraphicObject lgo_graphicobject

lgo_graphicobject = This
Do
	lgo_graphicobject = lgo_graphicobject.GetParent()
Loop Until lgo_graphicobject.TypeOf() = Window! 

lw_parent = lgo_graphicobject

CloseWithReturn(lw_parent,inv_paramlogin)
end subroutine

private subroutine of_login ();String  ls_passwd,ls_user,ls_passwdigf,ls_nuerr

//Para determinar si la conexi$$HEX1$$f300$$ENDHEX$$n estubo exitosa
inv_paramlogin.ib_sucessful = False

ls_user   = Trim(em_user.Text)
ls_passwd = Trim(sle_passwOrd.Text)

If IsNull(ls_user) Or Trim(ls_user) = "" Then
	MessageBox("Usuario!","El usuario debe ser ingresado.",Exclamation!)
	em_user.SetFocus()
	Return
End If

If IsNull(ls_passwd) Or Trim(ls_passwd) = "" Then
	MessageBox("Clave!","La clave debe ser ingresada.",Exclamation!)
	sle_password.SetFocus()
	Return
End If

ii_try ++

If inv_paramlogin.itr_conexion.of_ConnectDb(inv_paramlogin.is_dbms,&
														  inv_paramlogin.is_database,&
														  ls_user,ls_passwd,&
														  inv_paramlogin.is_servername,&
														  inv_paramlogin.is_lock) = 0 Then
	
	//Verificar si el usuario tiene perfil en  la aplicaci$$HEX1$$f300$$ENDHEX$$n
	If This.of_Select_dt_userxper(ls_user) Then	
		inv_paramlogin.ib_sucessful = True
		inv_paramlogin.is_user      = ls_user
		inv_paramlogin.is_password  = ls_passwd
		This.Of_Close()
		Return
	End If
	
Else
	sle_password.SetFocus()
End If

If ii_try = 3 then
	This.Of_Close()
End If


end subroutine

public subroutine of_setparameter (n_cst_paramlogin anv_parameter);
inv_paramlogin = anv_parameter

//Proponer tambi$$HEX1$$e900$$ENDHEX$$n el $$HEX1$$fa00$$ENDHEX$$ltimo usuario que entr$$HEX2$$f3002000$$ENDHEX$$en la aplicaci$$HEX1$$f300$$ENDHEX$$n
If Not IsNull(inv_paramlogin.is_user) And Trim(inv_paramlogin.is_user) <> "" Then
	em_user.Text = inv_paramlogin.is_user
	sle_password.SetFocus()
Else
	em_user.SetFocus()
End If	

end subroutine

private function boolean of_select_dt_userxper (readonly string as_user);//Verificar que el usuario tenga un perfil en esta aplicaci$$HEX1$$f300$$ENDHEX$$n
Integer li_rsltsql

select dt_usuxper.co_perfil  
  into :inv_paramlogin.ii_perfil
  from dt_usuxper  
 where dt_usuxper.co_usuario = :as_user and
		 dt_usuxper.co_aplicacion = :inv_paramlogin.ii_application 
Using  inv_paramlogin.itr_conexion ;
		 
li_rsltsql = inv_paramlogin.itr_conexion.SQlCode;


If li_rsltsql = 0 Then
	Return True
Else	
	If li_rsltsql = 100 Then
		MessageBox("Advertencia!","El usuario: "+as_user+", no esta registrado. Por favor revise !.",Exclamation!)
		Return False
	Else
		MessageBox("Advertencia!","Problemas en la base de datos al buscar el usuario !. "+&
					  inv_paramlogin.itr_conexion.SQLErrText,StopSign!)
		Return False			  
	End If
End If
end function

on u_cst_login.create
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.sle_password=create sle_password
this.em_user=create em_user
this.st_clave=create st_clave
this.st_usuario=create st_usuario
this.p_logo=create p_logo
this.st_caption=create st_caption
this.gb_general=create gb_general
this.Control[]={this.cb_cancelar,&
this.cb_aceptar,&
this.sle_password,&
this.em_user,&
this.st_clave,&
this.st_usuario,&
this.p_logo,&
this.st_caption,&
this.gb_general}
end on

on u_cst_login.destroy
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.sle_password)
destroy(this.em_user)
destroy(this.st_clave)
destroy(this.st_usuario)
destroy(this.p_logo)
destroy(this.st_caption)
destroy(this.gb_general)
end on

type cb_cancelar from u_cb_base within u_cst_login
integer x = 882
integer y = 548
integer taborder = 40
string text = "&Cancelar"
end type

event clicked;
Parent.of_Close()
end event

event rbuttondown;call super::rbuttondown;


em_user.text = 'nfrancog'
sle_password.text = 'norafg67'
end event

type cb_aceptar from u_cb_base within u_cst_login
integer x = 480
integer y = 548
integer taborder = 30
string text = "&Aceptar"
end type

event clicked;
Parent.of_Login()
end event

event getfocus;call super::getfocus;this.default=true
end event

type sle_password from u_sle_base within u_cst_login
integer x = 805
integer y = 360
integer width = 389
integer taborder = 20
boolean password = true
end type

event modified;call super::modified;cb_aceptar.SetFocus()
end event

type em_user from u_em_base within u_cst_login
integer x = 805
integer y = 260
integer width = 389
maskdatatype maskdatatype = stringmask!
string mask = "aaaaaaaaaaaa"
end type

event getfocus;This.SelectText(1, Len(This.Text))
end event

event modified;call super::modified;sle_password.SetFocus()
end event

type st_clave from u_st_base within u_cst_login
integer x = 430
integer y = 372
string text = "Clave:"
end type

type st_usuario from u_st_base within u_cst_login
integer x = 430
integer y = 272
string text = "Usuario:"
end type

type p_logo from u_p_base within u_cst_login
integer x = 50
integer y = 28
string picturename = "key_1.bmp"
boolean border = false
borderstyle borderstyle = stylebox!
end type

type st_caption from u_st_base within u_cst_login
integer x = 247
integer y = 44
integer width = 1157
integer height = 144
integer textsize = -10
string text = "Ingrese su usuario y clave para ser validado por el sistema."
end type

type gb_general from u_gb_base within u_cst_login
integer x = 247
integer y = 172
integer width = 1147
integer height = 332
integer taborder = 0
end type

