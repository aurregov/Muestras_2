HA$PBExportHeader$w_lista_colore_x_cliente.srw
forward
global type w_lista_colore_x_cliente from w_response
end type
type dw_busca from u_dw_application within w_lista_colore_x_cliente
end type
type st_1 from statictext within w_lista_colore_x_cliente
end type
type cb_2 from commandbutton within w_lista_colore_x_cliente
end type
type cb_1 from commandbutton within w_lista_colore_x_cliente
end type
type cb_cancelar from commandbutton within w_lista_colore_x_cliente
end type
type cb_aceptar from commandbutton within w_lista_colore_x_cliente
end type
type dw_colores from u_dw_base within w_lista_colore_x_cliente
end type
type gb_1 from groupbox within w_lista_colore_x_cliente
end type
type gb_2 from u_gb_base within w_lista_colore_x_cliente
end type
end forward

global type w_lista_colore_x_cliente from w_response
integer width = 1618
integer height = 1468
string title = "Colores por Cliente"
dw_busca dw_busca
st_1 st_1
cb_2 cb_2
cb_1 cb_1
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
dw_colores dw_colores
gb_1 gb_1
gb_2 gb_2
end type
global w_lista_colore_x_cliente w_lista_colore_x_cliente

type variables
s_cambio_color ist_color
end variables

on w_lista_colore_x_cliente.create
int iCurrent
call super::create
this.dw_busca=create dw_busca
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.dw_colores=create dw_colores
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_busca
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.cb_cancelar
this.Control[iCurrent+6]=this.cb_aceptar
this.Control[iCurrent+7]=this.dw_colores
this.Control[iCurrent+8]=this.gb_1
this.Control[iCurrent+9]=this.gb_2
end on

on w_lista_colore_x_cliente.destroy
call super::destroy
destroy(this.dw_busca)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.dw_colores)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;
ist_color=Message.PowerObjectParm

dw_colores.DataObject=ist_color.ds1.DataObject

dw_colores.SetTransObject(n_cst_application.itr_appl)

ist_color.ds1.ShareData(dw_colores)

dw_busca.InsertRow(0)

//n_ds_base ldw_colores
//
//
//
//ldw_colores = Message.PowerObjectParm
//ldw_colores.ShareData(dw_colores)
//
//dw_colores.SetFocus()
end event

type dw_busca from u_dw_application within w_lista_colore_x_cliente
integer x = 558
integer y = 80
integer width = 864
integer height = 88
string dataobject = "d_ext_de_color"
boolean vscrollbar = false
boolean livescroll = false
end type

event editchanged;call super::editchanged;//////////////////////////////////////////////////////////////////////////
// Cuando se digita algun valor
// 
//////////////////////////////////////////////////////////////////////////
String ls_filtro
If len(Data)=0 Then 
	ls_filtro=""
Else
	ls_filtro="#4 like '%"+data+"%'"
End If

dw_colores.SetFilter(ls_filtro)
dw_colores.Filter()


end event

event getfocus;//////////////////////////////////////////////////////////////////////////
// OverWrite 
// 
//////////////////////////////////////////////////////////////////////////

end event

type st_1 from statictext within w_lista_colore_x_cliente
integer x = 46
integer y = 84
integer width = 521
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "digite el color a buscar"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_lista_colore_x_cliente
integer x = 1029
integer y = 1084
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;dw_colores.Trigger event ue_deleteRow()
end event

type cb_1 from commandbutton within w_lista_colore_x_cliente
integer x = 681
integer y = 1084
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&dicionar"
end type

event clicked;dw_colores.trigger Event ue_insertRow()
end event

type cb_cancelar from commandbutton within w_lista_colore_x_cliente
integer x = 763
integer y = 1248
integer width = 343
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type cb_aceptar from commandbutton within w_lista_colore_x_cliente
integer x = 416
integer y = 1248
integer width = 343
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;n_cst_param lou_param
Long li_fila

li_fila = dw_colores.GetRow()

If li_fila <= 0 Then
	MessageBox("Advertencia!","Debe selaccionar un color")
	Return
End If
If dw_colores.dataobject="d_dddw_m_colores_exp" Then
	lou_param.is_vector[1] = dw_colores.GetItemString(li_fila,3)
Else
	lou_param.is_vector[1] = String(dw_colores.GetItemNumber(li_fila,3))
End If
lou_param.is_vector[2] = Trim(dw_colores.GetItemString(li_fila,4))


dw_colores.SetFilter("")
dw_colores.Filter()
//////////////////////////////////////////////////////////////////////////
// Aca se actualizan los datos
// 
//////////////////////////////////////////////////////////////////////////
If dw_colores.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos, por favor verifique.",StopSign!)
	Return
End If

If dw_colores.Update()<>1 Then
	RollBack Using n_cst_application.itr_appl ;
	Return
End IF

Commit Using n_cst_application.itr_appl ;



CloseWithReturn(Parent,lou_param)
end event

type dw_colores from u_dw_base within w_lista_colore_x_cliente
integer x = 55
integer y = 248
integer width = 1330
integer height = 820
integer taborder = 20
string dataobject = "d_dddw_m_colores"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;//
end event

event rowfocuschanged;call super::rowfocuschanged;

This.SelectRow(0,False)
This.SelectRow(CurrentRow,True)
end event

event doubleclicked;call super::doubleclicked;

If Row <= 0 Then Return

cb_aceptar.TriggerEvent(Clicked!)
end event

event ue_insertrow;call super::ue_insertrow;LONG LL_f

ll_f=getRow()
SetItem(ll_f,1,ist_color.num1 )
SetItem(ll_f,2,ist_color.num2 )
end event

type gb_1 from groupbox within w_lista_colore_x_cliente
integer x = 27
integer y = 184
integer width = 1435
integer height = 1040
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Colores"
end type

type gb_2 from u_gb_base within w_lista_colore_x_cliente
integer x = 27
integer y = 16
integer width = 1435
integer height = 168
integer taborder = 0
string text = "Busqueda r$$HEX1$$e100$$ENDHEX$$pida"
end type

