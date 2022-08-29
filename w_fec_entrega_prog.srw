HA$PBExportHeader$w_fec_entrega_prog.srw
forward
global type w_fec_entrega_prog from window
end type
type dw_fecha from u_dw_application within w_fec_entrega_prog
end type
type cb_1 from commandbutton within w_fec_entrega_prog
end type
type st_1 from statictext within w_fec_entrega_prog
end type
type sle_fec_entrega from singlelineedit within w_fec_entrega_prog
end type
end forward

global type w_fec_entrega_prog from window
integer width = 1586
integer height = 492
boolean titlebar = true
string title = "Fecha de Entrega programaci$$HEX1$$f300$$ENDHEX$$n $$HEX1$$f300$$ENDHEX$$rdenes"
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
dw_fecha dw_fecha
cb_1 cb_1
st_1 st_1
sle_fec_entrega sle_fec_entrega
end type
global w_fec_entrega_prog w_fec_entrega_prog

type variables

end variables

on w_fec_entrega_prog.create
this.dw_fecha=create dw_fecha
this.cb_1=create cb_1
this.st_1=create st_1
this.sle_fec_entrega=create sle_fec_entrega
this.Control[]={this.dw_fecha,&
this.cb_1,&
this.st_1,&
this.sle_fec_entrega}
end on

on w_fec_entrega_prog.destroy
destroy(this.dw_fecha)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.sle_fec_entrega)
end on

event open;String ls_fecha_entrega
s_base_parametros lstr_parametro

/*
ls_fecha_entrega = Message.StringParm 

sle_fec_entrega.text = ls_fecha_entrega
*/
// SA59755 - Se permite ingresar Fecha Entrega
dw_fecha.InsertRow( 0 )

lstr_parametro = Message.PowerObjectParm

If IsValid( lstr_parametro ) Then
	If lstr_parametro.hay_parametros Then
		dw_fecha.SetItem( 1, 'fe_entrega', lstr_parametro.fecha[1] )
		dw_fecha.SetItem( 1, 'fe_ult_tarea', lstr_parametro.fecha[2] )
	End If
End If
	
end event

type dw_fecha from u_dw_application within w_fec_entrega_prog
integer x = 137
integer y = 32
integer width = 1253
integer height = 244
string dataobject = "d_ff_param_fecha_entrega"
boolean vscrollbar = false
end type

event getfocus;// Se omite el script del ancestro
end event

type cb_1 from commandbutton within w_fec_entrega_prog
integer x = 654
integer y = 300
integer width = 402
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "OK"
end type

event clicked;s_base_parametros lstr_parametro


//close(w_fec_entrega_prog)
//CloseWithReturn(Parent, sle_fec_entrega.Text)

// FACL - 2018/12/27 - SA59572 -  Se modifica tipo de parametro de retorno
If dw_fecha.AcceptText() <> 1 Then Return

lstr_parametro.hay_parametros = True
lstr_parametro.fecha[1] = dw_fecha.GetItemDate( 1, 'fe_entrega' ) 

CloseWithReturn(Parent, lstr_parametro )
end event

type st_1 from statictext within w_fec_entrega_prog
boolean visible = false
integer x = 1161
integer y = 280
integer width = 462
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Fecha de Entrega"
boolean focusrectangle = false
end type

type sle_fec_entrega from singlelineedit within w_fec_entrega_prog
boolean visible = false
integer x = 1202
integer y = 312
integer width = 206
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

