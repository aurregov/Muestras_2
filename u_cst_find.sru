HA$PBExportHeader$u_cst_find.sru
$PBExportComments$Objeto find
forward
global type u_cst_find from userobject
end type
type st_4 from u_st_base within u_cst_find
end type
type st_3 from u_st_base within u_cst_find
end type
type st_2 from u_st_base within u_cst_find
end type
type st_1 from u_st_base within u_cst_find
end type
type cb_cancelar from u_cb_base within u_cst_find
end type
type cb_aceptar from u_cb_base within u_cst_find
end type
type dw_destino from u_dw_base within u_cst_find
end type
type dw_origen from u_dw_base within u_cst_find
end type
end forward

global type u_cst_find from userobject
integer width = 2697
integer height = 904
boolean border = true
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
dw_destino dw_destino
dw_origen dw_origen
end type
global u_cst_find u_cst_find

type variables
Private:
            Boolean          ib_down
            Long               il_fila_clicked
            DataWindow  idw_data
end variables

forward prototypes
private subroutine of_expression ()
private subroutine of_close (readonly string as_expression)
private function boolean of_completedata ()
public function string of_modtag (string a_tag)
public subroutine of_load (datawindow adw_datawindow)
end prototypes

private subroutine of_expression ();String ls_expresion = '',ls_coltype,ls_columna,ls_dato,ls_operador
Long   ll_i,ll_n

If This.of_CompleteData() Then
	ll_n = dw_destino.RowCount()
	For ll_i = 1 To ll_n 

		If ls_expresion = '' Then
			ls_expresion = ' WHERE '
		Else
			ls_expresion += ' AND '
		End If	
		
		ls_coltype = dw_destino.GetItemString(ll_i,'ColType')
		If Match(ls_coltype,'char+') Then
			ls_coltype = 'char'
		ElseIf Match(ls_coltype,'decimal+') Then
			ls_coltype = 'decimal'
		End If	
		ls_columna = dw_destino.GetItemString(ll_i,'dbname')
		ls_dato = dw_destino.GetItemString(ll_i,'dato')
		ls_operador = dw_destino.GetItemString(ll_i,'operador')
		
		Choose Case ls_coltype
			
			Case 'long','decimal','number'
				IF ls_operador = 'LIKE' THEN ls_operador = "="
				
				ls_expresion += ls_columna+ls_operador+ls_dato
				
			Case 'char'
				IF ls_operador = 'LIKE' THEN 
					ls_expresion += ls_columna+" "+ls_operador+'"%'+ls_dato+'%"'
				ELSE
					ls_expresion += ls_columna+ls_operador+'"'+ls_dato+'"'
				END IF
				
			Case 'datetime'
				IF ls_operador = 'LIKE' THEN ls_operador = "="

				ls_expresion += 'DATE('+ls_columna+')'+ls_operador+'DATE("'+ls_dato+'")'	

		End Choose 	
	
	Next
	This.of_Close(ls_expresion)
End If	
end subroutine

private subroutine of_close (readonly string as_expression);w_base        lw_parent
GraphicObject lgo_graphicobject

lgo_graphicobject = This
Do
	lgo_graphicobject = lgo_graphicobject.GetParent()
Loop Until lgo_graphicobject.TypeOf() = Window! 
lw_parent = lgo_graphicobject
CloseWithReturn(lw_parent,as_expression)
end subroutine

private function boolean of_completedata ();Integer li_i,li_n

dw_destino.AcceptText()
li_n = dw_destino.RowCount()
For li_i = 1 To li_n 
	If IsNull(dw_destino.GetItemString(li_i,'dato')) Then
		MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Debe especificar el dato !.",Exclamation!)
		dw_destino.SetRow(li_i)
		dw_destino.SetColumn('dato')
		dw_destino.SetFocus()
		Return False
	End If	
Next	
Return True


end function

public function string of_modtag (string a_tag);long   ll_pos
String ls_tag

ls_tag=a_tag

ll_pos=pos(a_tag,"=")

If ll_pos>0 Then
	ls_tag=mid(ls_tag,ll_pos+1)
End If


Return ls_tag
end function

public subroutine of_load (datawindow adw_datawindow);String  ls_name,ls_tag,ls_dbname,ls_coltype
Integer li_i,li_n
Long    ll_fila

idw_data = adw_datawindow

li_n = Integer(idw_data.Describe("DataWindow.Column.Count"))
For li_i = 1 To li_n 
	If idw_data.Describe("#"+String(li_i)+".Visible") = '1' Then
		ls_tag = idw_data.Describe("#"+String(li_i)+".Tag")
		ls_tag=of_modTag(ls_tag)
		If ls_tag <> '?' And ls_tag <> '!' And Trim(ls_tag) <> "" Then
			ls_name    = idw_data.Describe("#"+String(li_i)+".Name")
			ls_dbname  = idw_data.Describe("#"+String(li_i)+".dbName")
			ls_coltype = idw_data.Describe("#"+String(li_i)+".ColType")
			ll_fila    = dw_origen.InsertRow(0)
			dw_origen.SetItem(ll_fila,'tag',ls_tag)
			dw_origen.SetItem(ll_fila,'name',ls_name)
			dw_origen.SetItem(ll_fila,'dbname',ls_dbname)
			dw_origen.SetItem(ll_fila,'coltype',ls_coltype)
		End If	
	End If	
Next	
dw_origen.Sort()
end subroutine

on u_cst_find.create
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.dw_destino=create dw_destino
this.dw_origen=create dw_origen
this.Control[]={this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.cb_cancelar,&
this.cb_aceptar,&
this.dw_destino,&
this.dw_origen}
end on

on u_cst_find.destroy
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.dw_destino)
destroy(this.dw_origen)
end on

type st_4 from u_st_base within u_cst_find
integer x = 2135
integer y = 24
integer width = 137
boolean bringtotop = true
string text = "Dato"
alignment alignment = right!
end type

type st_3 from u_st_base within u_cst_find
integer x = 1518
integer y = 24
integer width = 219
boolean bringtotop = true
string text = "Operador"
alignment alignment = right!
end type

type st_2 from u_st_base within u_cst_find
integer x = 690
integer y = 24
integer width = 279
boolean bringtotop = true
string text = "Buscar por"
end type

type st_1 from u_st_base within u_cst_find
integer x = 9
integer y = 24
boolean bringtotop = true
string text = "Columnas"
end type

type cb_cancelar from u_cb_base within u_cst_find
integer x = 2377
integer y = 212
integer taborder = 40
boolean bringtotop = true
string text = "Cancelar"
end type

event clicked;
Parent.of_Close('?')

end event

type cb_aceptar from u_cb_base within u_cst_find
integer x = 2377
integer y = 108
integer taborder = 30
boolean bringtotop = true
string text = "Aceptar"
end type

event clicked;
If dw_destino.AcceptText() = 1 Then
	Parent.of_Expression()
End If
end event

type dw_destino from u_dw_base within u_cst_find
event ue_mousemove pbm_mousemove
event ue_lbuttondown pbm_lbuttondown
event ue_lbuttonup pbm_lbuttonup
integer x = 690
integer y = 108
integer width = 1664
integer height = 776
integer taborder = 20
string dragicon = "row.ico"
boolean bringtotop = true
string dataobject = "d_external_find_destino"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;String ls_object,ls_columna
Integer li_pos

ls_object = GetObjectAtPointer()
If Len(ls_object) > 0 Then 
	 	li_pos = Pos (ls_object,'~t')
		ls_columna = Mid(ls_object,1,li_pos -1)
		If ls_columna = 'tag' Then
			If ib_down Then
				This.Drag(Begin!)
			End If	
		End If	
End If	
end event

event ue_lbuttondown;String ls_object,ls_columna
Integer li_pos

ls_object = GetObjectAtPointer() //Mejor funcionamiento en esta forma que con el GetColumName()
If Len(ls_object) > 0 Then 
	li_pos = Pos (ls_object,'~t')
	ls_columna = Mid(ls_object,1,li_pos -1)
	If ls_columna = 'tag' Then
		ib_down = True
	Else
		//El lbuttonup no se ejecuta adecuadamente con dato
		ib_down = False
	End If	
End If	


end event

event ue_lbuttonup;
This.SelectRow(0,False)
ib_down = False


end event

event clicked;
If dwo.Name <> 'operador' And dwo.Name <> 'dato' Then
	If row > 0 Then
		This.SelectRow(row,True)
		il_fila_clicked = row
	End If	
End If
If dwo.Name = 'dato' Then
	//El lbuttonup no se ejecuta adecuadamente con dato
	ib_down = False
End If	

end event

event dragdrop;DataWindow	ldw_control
String ls_null

If source.TypeOf() = DataWindow! Then
	ldw_control = source
	SetNull(ls_null)
	If Row > 0 Then
		ldw_control.RowsMove(il_fila_clicked,il_fila_clicked,Primary!,This,row,Primary!)
		//Colocar al hacer DragDrop los valores por defecto 
		This.SetItem(row,'operador','=')
		This.SetItem(row,'dato',ls_null)
	Else
		ldw_control.RowsMove(il_fila_clicked,il_fila_clicked,Primary!,This,This.RowCount()+1,Primary!)
		//Colocar al hacer DragDrop los valores por defecto 
		This.SetItem(This.RowCount(),'operador','=')
		This.SetItem(This.RowCount(),'dato',ls_null)
	End If
End If

end event

event dragleave;
This.SelectRow(0,False)

end event

event getfocus;////////////////////////////////////////////////////////////////////////////////////
end event

event itemchanged;String ls_coltype

If dwo.Name = 'dato' Then
	ls_coltype = This.GetItemString(row,'ColType')

	Choose Case ls_coltype
	
		Case 'long','decimal','number'
			If Not IsNumber(Data) Then	
				MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","El tipo de dato debe ser num$$HEX1$$e900$$ENDHEX$$rico !.",Exclamation!)
				Return 2
			End If
	
	End  Choose
End If	
end event

event ue_dwnprocessenter;
If This.AcceptText() = 1 Then
	Send(Handle(This),256,9,Long(0,0))
	Return 1
End If	
end event

type dw_origen from u_dw_base within u_cst_find
event ue_mousemove pbm_mousemove
event ue_lbuttondown pbm_lbuttondown
event ue_lbuttonup pbm_lbuttonup
integer x = 9
integer y = 108
integer width = 667
integer height = 776
string dragicon = "row.ico"
boolean bringtotop = true
string dataobject = "d_external_find_origen"
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

event clicked;String ls_null

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

