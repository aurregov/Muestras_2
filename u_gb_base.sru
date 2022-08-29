HA$PBExportHeader$u_gb_base.sru
$PBExportComments$GroupBox base
forward
global type u_gb_base from groupbox
end type
end forward

global type u_gb_base from groupbox
int Width=494
int Height=360
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
long BackColor=79741120
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type
global u_gb_base u_gb_base

forward prototypes
public subroutine of_color (readonly boolean ab_valor)
end prototypes

public subroutine of_color (readonly boolean ab_valor);
If ab_valor Then
	This.TextColor = RGB(0,0,255)
Else
	This.TextColor = RGB(0,0,0)
End If	
end subroutine

event constructor;
This.TabOrder = 0
end event

