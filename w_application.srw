HA$PBExportHeader$w_application.srw
$PBExportComments$Ventana de la aplicac$$HEX1$$ed00$$ENDHEX$$on modificable
forward
global type w_application from w_frame
end type
end forward

global type w_application from w_frame
string title = ""
string menuname = "m_principal"
end type
global w_application w_application

on w_application.create
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_principal" then this.MenuID = create m_principal
end on

on w_application.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;//MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","")

end event

