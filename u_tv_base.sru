HA$PBExportHeader$u_tv_base.sru
$PBExportComments$Commandbutton base
forward
global type u_tv_base from treeview
end type
end forward

global type u_tv_base from treeview
int Width=494
int Height=360
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
boolean LinesAtRoot=true
string PictureName[]={"Custom039!"}
long PictureMaskColor=553648127
long StatePictureMaskColor=553648127
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type
global u_tv_base u_tv_base

forward prototypes
protected subroutine of_deleteall ()
end prototypes

protected subroutine of_deleteall ();Long ll_tvi = 0

Do Until ll_tvi = -1
  ll_tvi = This.FindItem(RootTreeItem!,0) 
  This.DeleteItem(ll_tvi)
Loop

end subroutine

