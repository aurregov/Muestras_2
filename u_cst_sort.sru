HA$PBExportHeader$u_cst_sort.sru
$PBExportComments$Objeto sort
forward
global type u_cst_sort from userobject
end type
type st_3 from u_st_base within u_cst_sort
end type
type st_ordenar from u_st_base within u_cst_sort
end type
type st_1 from u_st_base within u_cst_sort
end type
type cb_cancelar from u_cb_base within u_cst_sort
end type
type cb_aceptar from u_cb_base within u_cst_sort
end type
type dw_destino from u_dw_base within u_cst_sort
end type
type dw_origen from u_dw_base within u_cst_sort
end type
end forward

global type u_cst_sort from userobject
integer width = 2235
integer height = 916
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_3 st_3
st_ordenar st_ordenar
st_1 st_1
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
dw_destino dw_destino
dw_origen dw_origen
end type
global u_cst_sort u_cst_sort

type variables
Private:
            Boolean      ib_down
            Long           il_fila_clicked
           u_dw_base  idw_data
end variables

forward prototypes
private subroutine of_sort ()
public function string of_modtag (string a_tag)
private subroutine of_close ()
public subroutine of_load (u_dw_base adw_datawindow)
end prototypes

private subroutine of_sort ();String ls_name,ls_expresion = "",ls_order
Long   ll_i,ll_n

ll_n = dw_destino.RowCount()
For ll_i = 1 To ll_n 
	ls_name  = dw_destino.GetItemString(ll_i,'name')
	ls_order = dw_destino.GetItemString(ll_i,'orden')
	If ls_expresion = "" Then
		ls_expresion = ls_name+' '+ls_order
	Else 
		ls_expresion += ','+ls_name+' '+ls_order
	End If 
Next	

idw_data.SetSort(ls_expresion)
If idw_data.Sort() <> 1 Then
	MessageBox("Error","Se ha producido un error ordenando los datos !.")
End If		
end subroutine

public function string of_modtag (string a_tag);long   ll_pos
String ls_tag

ls_tag=a_tag

ll_pos=pos(a_tag,"=")

If ll_pos>0 Then
	ls_tag=mid(ls_tag,ll_pos+1)
End If


Return ls_tag
end function

private subroutine of_close ();w_base        lw_parent
GraphicObject lgo_graphicobject

lgo_graphicobject = This
Do
	lgo_graphicobject = lgo_graphicobject.GetParent()
Loop Until lgo_graphicobject.TypeOf() = Window! 
lw_parent = lgo_graphicobject

Close(lw_parent)
end subroutine

public subroutine of_load (u_dw_base adw_datawindow);String  ls_name,ls_tag,ls_sort,ls_orden,ls_aux
Integer li_i,li_n,li_pos,li_start
Long    ll_fila

idw_data = adw_datawindow

li_n = Integer(idw_data.Describe("DataWindow.Column.Count"))
For li_i = 1 To li_n 
	If idw_data.Describe("#"+String(li_i)+".Visible") = '1' Then
		ls_tag = idw_data.Describe("#"+String(li_i)+".Tag")		
		If ls_tag <> '?' And ls_tag <> '!' And pos(ls_tag,"&S")>0 Then
			ls_name = idw_data.Describe("#"+String(li_i)+".Name")
			ll_fila = dw_origen.InsertRow(0)
			ls_tag=of_modTag(ls_tag)
			dw_origen.SetItem(ll_fila,'tag',ls_tag)
			dw_origen.SetItem(ll_fila,'name',ls_name)
		End If	
	End If	
Next	

//Ahora determinar el orden que ya tiene el DataWindow
ls_sort = idw_data.Describe("DataWindow.Table.Sort")
If ls_sort <> '?' And ls_sort <> '!' Then
	li_n = Len(ls_sort)
	li_start = 1
	Do
		li_pos = Pos(ls_sort,',',li_start)
		If li_pos = 0 Then
			ls_aux = Trim(Mid(ls_sort,li_start))
		Else
			ls_aux = Trim(Mid(ls_sort,li_start,li_pos -li_start))
		End If
		ls_name  = Trim(Left(ls_aux,Len(ls_aux) -1))
		ls_orden = Right(ls_aux,1)
		//Hacer un find en el datawindow origen y mover la fila al destino
		ll_fila = dw_origen.Find("name='"+ls_name+"'",1,dw_origen.RowCount())
		If ll_fila > 0 Then
			dw_origen.Setitem(ll_fila,'orden',ls_orden)
			dw_origen.RowsMove(ll_fila,ll_fila,Primary!,dw_destino,dw_destino.RowCount()+1,Primary!)
		End If 
		li_start = li_pos + 1
	Loop Until li_pos = 0
End If	
dw_origen.Sort()	
	
end subroutine

on u_cst_sort.create
this.st_3=create st_3
this.st_ordenar=create st_ordenar
this.st_1=create st_1
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.dw_destino=create dw_destino
this.dw_origen=create dw_origen
this.Control[]={this.st_3,&
this.st_ordenar,&
this.st_1,&
this.cb_cancelar,&
this.cb_aceptar,&
this.dw_destino,&
this.dw_origen}
end on

on u_cst_sort.destroy
destroy(this.st_3)
destroy(this.st_ordenar)
destroy(this.st_1)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.dw_destino)
destroy(this.dw_origen)
end on

type st_3 from u_st_base within u_cst_sort
integer x = 1609
integer y = 24
integer width = 279
boolean bringtotop = true
string text = "Ascendente"
end type

type st_ordenar from u_st_base within u_cst_sort
integer x = 690
integer y = 24
integer width = 279
boolean bringtotop = true
string text = "Ordenar por"
end type

type st_1 from u_st_base within u_cst_sort
integer x = 9
integer y = 24
boolean bringtotop = true
string text = "Columnas"
end type

type cb_cancelar from u_cb_base within u_cst_sort
integer x = 1925
integer y = 212
integer taborder = 40
boolean bringtotop = true
string text = "Cancelar"
end type

event clicked;
Parent.of_Close()
end event

type cb_aceptar from u_cb_base within u_cst_sort
integer x = 1925
integer y = 108
integer taborder = 30
boolean bringtotop = true
string text = "Aceptar"
end type

event clicked;
Parent.of_Sort()
Parent.of_Close()
end event

type dw_destino from u_dw_base within u_cst_sort
event ue_mousemove pbm_mousemove
event ue_lbuttondown pbm_lbuttondown
event ue_lbuttonup pbm_lbuttonup
integer x = 690
integer y = 108
integer width = 1198
integer height = 776
integer taborder = 20
string dragicon = "row.ico"
boolean bringtotop = true
string dataobject = "d_external_sort_destino"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;String ls_object

ls_object = GetObjectAtPointer()
If Len(ls_object) > 0 Then 
	If ib_down Then
		This.Drag(Begin!)
	End If	
End If	
end event

event ue_lbuttondown;
ib_down = True

end event

event ue_lbuttonup;
This.SelectRow(0,False)
ib_down = False


end event

event clicked;
If dwo.Name <> 'orden' Then
	If row > 0 Then
		This.SelectRow(row,True)
		il_fila_clicked = row
	End If	
End If

end event

event dragdrop;DataWindow	ldw_control

If source.TypeOf() = DataWindow! Then
	ldw_control = source
	If Row > 0 Then
		ldw_control.RowsMove(il_fila_clicked,il_fila_clicked,Primary!,This,row,Primary!)
		//Colocar al hacer DragDrop el valor por defecto del orden 
		This.SetItem(row,'orden','A')
	Else
		ldw_control.RowsMove(il_fila_clicked,il_fila_clicked,Primary!,This,This.RowCount()+1,Primary!)
		//Colocar al hacer DragDrop el valor por defecto del orden 
		This.SetItem(This.RowCount(),'orden','A')
	End If
End If

end event

event dragleave;
This.SelectRow(0,False)

end event

event getfocus;////////////////////////////////////////////////////////////////////////////////////
end event

type dw_origen from u_dw_base within u_cst_sort
event ue_mousemove pbm_mousemove
event ue_lbuttondown pbm_lbuttondown
event ue_lbuttonup pbm_lbuttonup
integer x = 9
integer y = 108
integer width = 667
integer height = 776
string dragicon = "row.ico"
boolean bringtotop = true
string dataobject = "d_external_sort_origen"
boolean hscrollbar = true
boolean border = true
string icon = "row.ico"
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;String ls_object

ls_object = GetObjectAtPointer()
If Len(ls_object) > 0 Then 
	If ib_down Then
		This.Drag(Begin!)
	End If	
End If	
end event

event ue_lbuttondown;
ib_down = True
end event

event ue_lbuttonup;
This.SelectRow(0,False)
ib_down = False
end event

event clicked;
If row > 0 Then
	This.SelectRow(row,True)
	il_fila_clicked = row
End If	

end event

event dragdrop;DataWindow	ldw_control

If source.TypeOf() = DataWindow! Then
	ldw_control = source
	If Row > 0 Then
		ldw_control.RowsMove(il_fila_clicked,il_fila_clicked,Primary!,This,row,Primary!)
	Else
		ldw_control.RowsMove(il_fila_clicked,il_fila_clicked,Primary!,This,This.RowCount()+1,Primary!)
	End If
End If

end event

event dragleave;
This.SelectRow(0,False)


end event

event getfocus;////////////////////////////////////////////////////////////////////////////////////
end event

