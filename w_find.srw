HA$PBExportHeader$w_find.srw
$PBExportComments$Arma la Cl$$HEX1$$e100$$ENDHEX$$usula WHERE en un DataWindow
forward
global type w_find from w_response
end type
type uo_find from u_cst_find within w_find
end type
end forward

global type w_find from w_response
int Y=700
int Width=2715
int Height=996
boolean TitleBar=true
string Title="Especificar B$$HEX1$$fa00$$ENDHEX$$squeda"
boolean ControlMenu=false
uo_find uo_find
end type
global w_find w_find

type variables

end variables

on w_find.create
int iCurrent
call super::create
this.uo_find=create uo_find
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_find
end on

on w_find.destroy
call super::destroy
destroy(this.uo_find)
end on

event open;PowerObject lpo_param

lpo_param = Message.PowerObjectParm
If Not IsNull(lpo_param) And IsValid(lpo_param) Then
	If lpo_param.TypeOf() = DataWindow! Then
		uo_find.of_Load(lpo_param)
	Else 
		Close(This)
	End If	
Else
	Close(This)
End If	
end event

type uo_find from u_cst_find within w_find
int X=0
int Y=4
int TabOrder=10
boolean BringToTop=true
boolean Border=false
BorderStyle BorderStyle=StyleBox!
long BackColor=80269524
end type

on uo_find.destroy
call u_cst_find::destroy
end on

