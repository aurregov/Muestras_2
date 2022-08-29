HA$PBExportHeader$w_sort.srw
$PBExportComments$Ordena los datos de un datawindow
forward
global type w_sort from w_response
end type
type uo_sort from u_cst_sort within w_sort
end type
end forward

global type w_sort from w_response
int Y=700
int Width=2267
int Height=988
boolean TitleBar=true
string Title="Especificar Orden"
boolean ControlMenu=false
uo_sort uo_sort
end type
global w_sort w_sort

type variables

end variables

on w_sort.create
int iCurrent
call super::create
this.uo_sort=create uo_sort
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_sort
end on

on w_sort.destroy
call super::destroy
destroy(this.uo_sort)
end on

event open;PowerObject lpo_param

lpo_param = Message.PowerObjectParm
If Not IsNull(lpo_param) And  IsValid(lpo_param) Then
	If lpo_param.TypeOf() = DataWindow! Then
		uo_sort.of_Load(lpo_param)
	Else 
		Close(This)
	End If	
Else
	Close(This)
End If	
end event

type uo_sort from u_cst_sort within w_sort
event destroy ( )
int X=0
int Y=0
int TabOrder=10
boolean BringToTop=true
long BackColor=80269524
end type

on uo_sort.destroy
call u_cst_sort::destroy
end on

