HA$PBExportHeader$u_cst_progressbar.sru
$PBExportComments$Objeto ProgressBar para indicar el porcentaje de un proceso
forward
global type u_cst_progressbar from UserObject
end type
type rc_2 from rectangle within u_cst_progressbar
end type
type st_1 from statictext within u_cst_progressbar
end type
end forward

global type u_cst_progressbar from UserObject
int Width=1211
int Height=76
boolean Border=true
long BackColor=16777215
long PictureMaskColor=25166016
long TabTextColor=33554432
long TabBackColor=67108864
rc_2 rc_2
st_1 st_1
end type
global u_cst_progressbar u_cst_progressbar

type variables
Private:
             Boolean    ib_invert
end variables

forward prototypes
public subroutine of_setposition (readonly decimal ac_pct_complete)
end prototypes

public subroutine of_setposition (readonly decimal ac_pct_complete);Long	ll_color

//////////////////////////////////////////////////////////////////////
// Reset instance variable and colors If progress meter has been restarted
//////////////////////////////////////////////////////////////////////
If Int (ac_pct_complete) = 0 Then
	ib_invert = False
	st_1.TextColor = RGB (0, 0, 128)
	st_1.BackColor = RGB (255, 255, 255)	
End If

//////////////////////////////////////////////////////////////////////
// expand the progess bar
//////////////////////////////////////////////////////////////////////
rc_2.width = ac_pct_complete / 100.0 * This.width
rc_2.visible = True

//////////////////////////////////////////////////////////////////////
// update the percentage text
//////////////////////////////////////////////////////////////////////
st_1.text = String (ac_pct_complete / 100.0, "##0%")

//////////////////////////////////////////////////////////////////////
// check to see If the progress bar touches the percentage text.  
// If so, invert the percentage text colors.
//////////////////////////////////////////////////////////////////////
If Not ib_invert Then
	If rc_2.width >= st_1.x Then
		ib_invert      = True
		ll_color       = st_1.textcolor
		st_1.TextColor = st_1.BackColor
		st_1.BackColor = ll_color
	End If
End If
end subroutine

on u_cst_progressbar.create
this.rc_2=create rc_2
this.st_1=create st_1
this.Control[]={this.rc_2,&
this.st_1}
end on

on u_cst_progressbar.destroy
destroy(this.rc_2)
destroy(this.st_1)
end on

type rc_2 from rectangle within u_cst_progressbar
int Width=32
int Height=144
boolean Visible=false
boolean Enabled=false
int LineThickness=4
long LineColor=8388608
long FillColor=8388608
end type

type st_1 from statictext within u_cst_progressbar
int X=517
int Y=4
int Width=137
int Height=64
boolean BringToTop=true
string Text="0%"
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=16777215
long BorderColor=16711680
int TextSize=-9
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

