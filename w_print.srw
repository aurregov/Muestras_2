HA$PBExportHeader$w_print.srw
$PBExportComments$Imprime los datos de un DataWindow
forward
global type w_print from w_response
end type
type uo_print from u_cst_print within w_print
end type
end forward

global type w_print from w_response
integer width = 2359
integer height = 1348
string title = "Imprimir..."
boolean controlmenu = false
uo_print uo_print
end type
global w_print w_print

on w_print.create
int iCurrent
call super::create
this.uo_print=create uo_print
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_print
end on

on w_print.destroy
call super::destroy
destroy(this.uo_print)
end on

event open;call super::open;PowerObject lpo_param

lpo_param = Message.PowerObjectParm
If Not IsNull(lpo_param) And IsValid(lpo_param) Then
	If lpo_param.TypeOf() = DataWindow! Then
		uo_print.of_Load(lpo_param)
	Else 
		Close(This)
	End If	
Else
	Close(This)
End If	
end event

type uo_print from u_cst_print within w_print
integer x = 9
integer y = 24
integer width = 2322
integer height = 1252
integer taborder = 10
boolean bringtotop = true
boolean border = false
end type

on uo_print.destroy
call u_cst_print::destroy
end on

