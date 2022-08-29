HA$PBExportHeader$w_login.srw
$PBExportComments$Log$$HEX1$$ed00$$ENDHEX$$n de las aplicaciones
forward
global type w_login from w_response
end type
type uo_login from u_cst_login within w_login
end type
end forward

global type w_login from w_response
integer width = 1495
integer height = 784
string title = "Informaci$$HEX1$$f300$$ENDHEX$$n login..."
boolean controlmenu = false
uo_login uo_login
end type
global w_login w_login

type variables

end variables

on w_login.create
int iCurrent
call super::create
this.uo_login=create uo_login
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_login
end on

on w_login.destroy
call super::destroy
destroy(this.uo_login)
end on

event open;call super::open;
gs_color_disable 	= string(this.BackColor)
gs_color_enable	= string(rgb(255, 255, 255))

uo_login.of_SetParameter(Message.PowerObjectParm)


end event

type uo_login from u_cst_login within w_login
integer y = 4
integer width = 1463
integer taborder = 10
boolean bringtotop = true
boolean border = false
end type

on uo_login.destroy
call u_cst_login::destroy
end on

