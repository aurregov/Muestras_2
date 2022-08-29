HA$PBExportHeader$u_cst_zoom.sru
$PBExportComments$Objeto para el log$$HEX1$$ed00$$ENDHEX$$n de las aplicaciones
forward
global type u_cst_zoom from UserObject
end type
type cb_3 from u_cb_base within u_cst_zoom
end type
type dw_preview from u_dw_base within u_cst_zoom
end type
type em_zoom from u_em_base within u_cst_zoom
end type
type cb_2 from u_cb_base within u_cst_zoom
end type
type cb_apply from u_cb_base within u_cst_zoom
end type
type rb_6 from u_rb_base within u_cst_zoom
end type
type rb_5 from u_rb_base within u_cst_zoom
end type
type rb_4 from u_rb_base within u_cst_zoom
end type
type rb_3 from u_rb_base within u_cst_zoom
end type
type rb_2 from u_rb_base within u_cst_zoom
end type
type rb_1 from u_rb_base within u_cst_zoom
end type
type gb_2 from u_gb_base within u_cst_zoom
end type
type gb_1 from u_gb_base within u_cst_zoom
end type
end forward

global type u_cst_zoom from UserObject
int Width=1829
int Height=920
boolean Border=true
long BackColor=67108864
long PictureMaskColor=536870912
long TabTextColor=33554432
long TabBackColor=67108864
cb_3 cb_3
dw_preview dw_preview
em_zoom em_zoom
cb_2 cb_2
cb_apply cb_apply
rb_6 rb_6
rb_5 rb_5
rb_4 rb_4
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
gb_2 gb_2
gb_1 gb_1
end type
global u_cst_zoom u_cst_zoom

type variables
Private:
            u_dw_base idw_preview
end variables

forward prototypes
private subroutine of_close (readonly integer ai_valor)
public subroutine of_setparameters (ref u_dw_base adw_preview)
end prototypes

private subroutine of_close (readonly integer ai_valor);w_base        lw_parent
GraphicObject lgo_graphicobject

lgo_graphicobject = This
Do
	lgo_graphicobject = lgo_graphicobject.GetParent()
Loop Until lgo_graphicobject.TypeOf() = Window! 
lw_parent = lgo_graphicobject

CloseWithReturn(lw_parent,ai_valor)
end subroutine

public subroutine of_setparameters (ref u_dw_base adw_preview);Blob lbl_dw


idw_preview = adw_preview

idw_preview.GetFullState ( lbl_dw )
dw_preview.SetFullState ( lbl_dw )

dw_preview.Object.DataWindow.Print.Preview = True


end subroutine

on u_cst_zoom.create
this.cb_3=create cb_3
this.dw_preview=create dw_preview
this.em_zoom=create em_zoom
this.cb_2=create cb_2
this.cb_apply=create cb_apply
this.rb_6=create rb_6
this.rb_5=create rb_5
this.rb_4=create rb_4
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.cb_3,&
this.dw_preview,&
this.em_zoom,&
this.cb_2,&
this.cb_apply,&
this.rb_6,&
this.rb_5,&
this.rb_4,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.gb_2,&
this.gb_1}
end on

on u_cst_zoom.destroy
destroy(this.cb_3)
destroy(this.dw_preview)
destroy(this.em_zoom)
destroy(this.cb_2)
destroy(this.cb_apply)
destroy(this.rb_6)
destroy(this.rb_5)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.gb_2)
destroy(this.gb_1)
end on

type cb_3 from u_cb_base within u_cst_zoom
int X=686
int Y=784
int TabOrder=60
boolean BringToTop=true
string Text="&Aceptar"
boolean Default=true
end type

event clicked;
idw_preview.Object.DataWindow.Print.Preview.zoom = Integer(em_zoom.Text)
Parent.Of_Close(0)
end event

type dw_preview from u_dw_base within u_cst_zoom
int X=608
int Y=156
int Width=1166
int Height=660
int TabOrder=30
boolean HScrollBar=true
end type

event getfocus;Return
end event

type em_zoom from u_em_base within u_cst_zoom
int X=151
int Y=632
int Width=247
int TabOrder=20
Alignment Alignment=Center!
string Mask="###"
boolean Spin=true
double Increment=10
string MinMax="10~~200"
string Text="100"
long BackColor=1090519039
end type

type cb_2 from u_cb_base within u_cst_zoom
int X=1344
int Y=784
int TabOrder=70
boolean BringToTop=true
string Text="&Calcelar"
end type

event clicked;
Parent.Of_Close(0)
end event

type cb_apply from u_cb_base within u_cst_zoom
int X=1015
int Y=784
int TabOrder=50
boolean BringToTop=true
string Text="A&plicar"
end type

event clicked;
dw_preview.Object.DataWindow.Print.Preview.zoom  = Integer(em_zoom.Text)
idw_preview.Object.DataWindow.Print.Preview.zoom = Integer(em_zoom.Text)
end event

type rb_6 from u_rb_base within u_cst_zoom
int X=128
int Y=532
int Width=297
boolean BringToTop=true
string Text="140 %"
boolean RightToLeft=true
end type

event clicked;dw_preview.Object.DataWindow.Print.Preview.zoom = 140

em_zoom.text = "140"
end event

type rb_5 from u_rb_base within u_cst_zoom
int X=128
int Y=448
int Width=297
boolean BringToTop=true
string Text="120 %"
boolean RightToLeft=true
end type

event clicked;dw_preview.Object.DataWindow.Print.Preview.zoom = 120

em_zoom.text = "120"
end event

type rb_4 from u_rb_base within u_cst_zoom
int X=128
int Y=364
int Width=297
boolean BringToTop=true
string Text="100 %"
boolean Checked=true
boolean RightToLeft=true
end type

event clicked;dw_preview.Object.DataWindow.Print.Preview.zoom = 100

em_zoom.text = "100"
end event

type rb_3 from u_rb_base within u_cst_zoom
int X=128
int Y=280
int Width=297
boolean BringToTop=true
string Text="75 %"
boolean RightToLeft=true
end type

event clicked;dw_preview.Object.DataWindow.Print.Preview.zoom = 75

em_zoom.text = "75"
end event

type rb_2 from u_rb_base within u_cst_zoom
int X=128
int Y=196
int Width=297
boolean BringToTop=true
string Text="50 %"
boolean RightToLeft=true
end type

event clicked;dw_preview.Object.DataWindow.Print.Preview.zoom = 50

em_zoom.text = "50"
end event

type rb_1 from u_rb_base within u_cst_zoom
int X=128
int Y=112
int Width=297
string Tag="60"
boolean BringToTop=true
string Text="25 %"
boolean RightToLeft=true
end type

event clicked;//if this.checked then
//	cb_apply.enabled = true
//end if
//
dw_preview.Object.DataWindow.Print.Preview.zoom = 25

em_zoom.text = "25"
end event

type gb_2 from u_gb_base within u_cst_zoom
int X=553
int Y=12
int Width=1230
int Height=744
int TabOrder=40
string Text="Presentaci$$HEX1$$f300$$ENDHEX$$n Preliminar"
int Weight=400
end type

type gb_1 from u_gb_base within u_cst_zoom
int X=27
int Y=12
int Width=512
int Height=744
string Text="Zoom"
int Weight=400
end type

