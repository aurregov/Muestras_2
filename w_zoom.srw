HA$PBExportHeader$w_zoom.srw
forward
global type w_zoom from w_response
end type
type uo_zoom from u_cst_zoom within w_zoom
end type
end forward

global type w_zoom from w_response
int Width=1847
int Height=1016
boolean TitleBar=true
string Title="Zoom personalizado"
uo_zoom uo_zoom
end type
global w_zoom w_zoom

on w_zoom.create
int iCurrent
call super::create
this.uo_zoom=create uo_zoom
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_zoom
end on

on w_zoom.destroy
call super::destroy
destroy(this.uo_zoom)
end on

event open;call super::open;u_dw_base ldw_preview



ldw_preview = Message.PowerObjectParm
uo_zoom.of_SetParameters(ldw_preview)
end event

type uo_zoom from u_cst_zoom within w_zoom
int X=5
int Y=0
int Height=896
int TabOrder=10
boolean BringToTop=true
boolean Border=false
BorderStyle BorderStyle=StyleBox!
long BackColor=80269524
end type

on uo_zoom.destroy
call u_cst_zoom::destroy
end on

