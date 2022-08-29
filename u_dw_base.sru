HA$PBExportHeader$u_dw_base.sru
$PBExportComments$DataWindow Base
forward
global type u_dw_base from datawindow
end type
end forward

global type u_dw_base from datawindow
integer width = 494
integer height = 360
integer taborder = 10
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
event ue_reset ( readonly boolean ab_valor )
event ue_print ( )
event ue_update ( )
event ue_retrieve ( )
event ue_insertrow ( )
event ue_deleterow ( )
event ue_dwnprocessenter pbm_dwnprocessenter
event ue_find ( )
event ue_sort ( )
event ue_filter ( )
event ue_preview ( readonly boolean ib_preview )
event ue_saveas ( )
end type
global u_dw_base u_dw_base

type variables
 
end variables

forward prototypes
public function long of_returnvalorchild (readonly string as_columna_dw, readonly string as_columna_child, readonly integer ai_valor, readonly string as_columna_valor)
public function integer of_validarlistbox (readonly string as_columna, readonly long al_valor)
public function boolean of_existcolumn (readonly string as_columna)
public subroutine of_load (readonly string as_datawindow)
public function integer of_conexion (n_tr_base atr_transaction, readonly boolean ab_live)
public subroutine of_retrievechild (n_tr_base atr_transaction, readonly string as_columna, readonly long al_dato)
public function integer of_validarchild (readonly string as_columna, readonly long al_valor)
public function string of_getColumnDescripcion (string a_tag)
public function boolean of_completedata ()
end prototypes

event ue_reset;//Este evento resetea los datosw del DataWindow, conla posibilidad de verificar
//Si el datawindow ha tenido cambios.

If ab_valor Then
	If This.AcceptText() < 0 Then
		Return
	End If
	
	If This.ModifiedCount() > 0 Or &
		This.DeletedCount() >0 Then
		Return
	End If	
End If	
This.Reset()
end event

event ue_print;
OpenWithParm(w_print,This)
This.SetFocus()
end event

event ue_insertrow;Long ll_fila

ll_fila = This.InsertRow(0)
This.ScrollToRow(ll_fila)
This.SetColumn(1)
This.SetFocus()
end event

event ue_deleterow;
	 
If MessageBox("Eliminar Fila","Esta seguro(a) de eliminar la fila ?.",Question!,YesNo!,2) = 1 Then
	This.DeleteRow(0)
End If
This.SetFocus()
end event

event ue_dwnprocessenter;
if this.AcceptText() < 0 then
  Return 1
end if

Send(Handle(this),256,9,Long(0,0))
return 1

end event

event ue_sort;
OpenWithParm(w_sort,This)
This.SetFocus()
end event

event ue_saveas();String  ls_file,ls_path
Integer li_value

li_value = GetFileSaveName("Guardar como...", &
                           ls_path,ls_file,"XLS",&
									"Excel (*.XLS), *.XLS,"+&
									"Texto (*.TXT), *.TXT,"+&
									"PDF   (*.pdf), *.PDF")
If li_value = 1 Then
	If Upper(Right(Trim(ls_path),3)) = "TXT" Then
		This.SaveAs(ls_path,Text!,True)
	ElseIf Upper(Right(Trim(ls_path),3)) = "XLS" Then	
		This.SaveAs(ls_path,Excel!,True)
	Else
		//this.Object.DataWindow.Print.Paper.Size = '1'
      //this.Object.DataWindow.Export.PDF.Method = Distill!
      //this.Object.DataWindow.Printer = "\\prntsrvr\pr-6"
      //this.Object.DataWindow.Export.PDF.Distill.CustomPostScript='No'

      Object.DataWindow.Export.PDF.Method = XSLFOP!
		Object.DataWindow.Export.PDF.Distill.CustomPostScript="Yes"

      //object.DataWindow.Export.PDF.xslfop.print='Yes'
      //li_ret = dw_1.SaveAs("printed.pdf", PDF!, true)
      This.SaveAs(ls_path,PDF!,True)      
	End If	
End If	
			
			
			
									
	


end event

public function long of_returnvalorchild (readonly string as_columna_dw, readonly string as_columna_child, readonly integer ai_valor, readonly string as_columna_valor);//para retornar un valor num$$HEX1$$e900$$ENDHEX$$rico de una columna de la fila actual en un DataWindowChild

Long            ll_fila
DataWindowChild ldwc_child

This.GetChild(as_columna_dw,ldwc_child)
ll_fila = ldwc_child.Find(as_columna_child+"="+String(ai_valor),1,ldwc_child.RowCount())
If ll_fila < 1 Then
	MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Se ha producido un error determinando el valor !.",Exclamation!)
	Return -1
Else
	Return ldwc_child.GetItemNumber(ll_fila,as_columna_valor)
End IF	
end function

public function integer of_validarlistbox (readonly string as_columna, readonly long al_valor);//Para validar que el dato ingresado en una columna con DropDownListBox sea correcto

String ls_tag

If This.GetValue(as_columna,al_valor) = "" Then
	ls_tag = This.Describe(as_columna+".Tag")
	MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","El valor "+String(al_valor)+" no es v$$HEX1$$e100$$ENDHEX$$lido para la columna "+ls_tag+" !.",Exclamation!)
	Return 2
Else
	Return 0
End IF	
end function

public function boolean of_existcolumn (readonly string as_columna);//Este m$$HEX1$$e900$$ENDHEX$$todo determina si el DataWindow Object tiene o no 
//una determinada columna

String  ls_name
Integer li_i,li_n

li_n = Integer(This.Describe("DataWindow.Column.Count"))
For li_i = 1 To li_n 
	ls_name = This.Describe("#"+String(li_i)+".Name")
	If ls_name = as_columna Then
		Return True
	End If	
Next	

Return False
end function

public subroutine of_load (readonly string as_datawindow);
This.DataObject = as_datawindow
end subroutine

public function integer of_conexion (n_tr_base atr_transaction, readonly boolean ab_live);
If ab_live Then
	Return This.SetTransObject(atr_transaction)
Else
	Return This.SetTrans(atr_transaction)
End If
end function

public subroutine of_retrievechild (n_tr_base atr_transaction, readonly string as_columna, readonly long al_dato);//Para recuperar datos de un datawindow child
//Si se desean condiferentes argumentos, entonces debe sobrecargarse este m$$HEX1$$e900$$ENDHEX$$todo

DataWindowChild ldw_child

This.GetChild(as_columna,ldw_child)
ldw_child.SetTransObject(atr_transaction)
ldw_child.Retrieve(al_dato)
ldw_child.InsertRow(0)

end subroutine

public function integer of_validarchild (readonly string as_columna, readonly long al_valor);//Para validar que el dato ingresado en una columna con DropDownDataWindow sea correcto

Long   ll_fila
String ls_tag,ls_col1

ls_col1=This.Describe(as_columna+".DDDW.DataColumn")

DataWindowChild ldwc_child
This.GetChild(as_columna,ldwc_child)
ll_fila = ldwc_child.Find(ls_col1+"="+String(al_valor),1,ldwc_child.RowCount())
If ll_fila < 1 Then
	ls_tag = This.Describe(as_columna+".Tag")
	MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","El valor "+String(al_valor)+" no es v$$HEX1$$e100$$ENDHEX$$lido para la columna "+ls_tag+" !.",Exclamation!)
	Return 2
Else
	Return 0
End IF	
end function

public function string of_getColumnDescripcion (string a_tag);long   ll_pos
String ls_tag

ls_tag=a_tag

ll_pos=pos(a_tag,"=")

If ll_pos>0 Then
	ls_tag=mid(ls_tag,ll_pos+1)
End If


Return ls_tag
end function

public function boolean of_completedata ();Long ll_fila,ll_m
Integer li_i,li_n
String ls_coltype,ls_tag,ls_mensaje

This.AcceptText()
ll_m = This.RowCount()
li_n = Integer(This.Describe("DataWindow.Column.Count"))
For ll_fila = 1 To ll_m
	For li_i = 1 To li_n 
		If This.Describe("#"+String(li_i)+".Visible") = '1' Then
			ls_tag = This.Describe("#"+String(li_i)+".Tag") 
//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 19 de Febrero de 2003 HORA 08:16:23:343
// 
// Verificar que los datos sean not null, y se muestra el nombre de la columna
// &NN --> Not Null
// &A  --> audit
// &S  --> Sort
//////////////////////////////////////////////////////////////////////////

			If Pos(ls_tag,"&NN") >0 Then 
				ls_tag=of_getColumnDescripcion(ls_tag)
				
				ls_coltype = This.Describe("#"+String(li_i)+".ColType")
				If Match(ls_coltype,'char+') Then
					ls_coltype = 'char'
				ElseIf Match(ls_coltype,'decimal+') Then
					ls_coltype = 'decimal'
				End If	
				
				ls_mensaje=""
				
				Choose Case ls_coltype
					
					Case 'long','decimal','number','int','real','ulong'
						If IsNull(This.GetItemNumber(ll_fila,li_i)) Then
							ls_mensaje=ls_tag
						End If	
						
					Case 'char'
						If IsNull(This.GetItemString(ll_fila,li_i)) Then
							ls_mensaje=ls_tag
						
						End If	
						
					Case 'date'
						If IsNull(This.GetItemDate(ll_fila,li_i)) Then
							ls_mensaje=ls_tag
							
						End If	
		
					Case 'time'
						If IsNull(This.GetItemTime(ll_fila,li_i)) Then
							ls_mensaje=ls_tag
							
						End If	
		
					Case 'datetime'
						If IsNull(This.GetItemDateTime(ll_fila,li_i)) Then
							ls_mensaje=ls_tag
							
						End If	
		
				End Choose 	
				
				If ls_mensaje<>"" Then

					MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Debe especificar el dato ("+ls_tag+")~r~nPor favor verifique.",StopSign!)
					This.SetFocus()
					This.SetColumn(li_i)
					This.SetRow(ll_fila)
					This.ScrollToRow(ll_fila)
					Return False
					
				End If
				
			End If
		End If	
	Next	
Next	
Return True


end function

event dberror;Integer li_response

Choose Case sqldbcode
	
	Case -268
		li_response = MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Se est$$HEX2$$e1002000$$ENDHEX$$tratando de ingresar un que registro que ya existe !. Desea ver los detalles ?.",Exclamation!,YesNo!) 
	
	Case -692
		li_response = MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Est$$HEX2$$e1002000$$ENDHEX$$tratando de eliminar un registro que ya es referenciado por otro archivo !. Desea ver los detalles ?.",Exclamation!,YesNo!) 

	Case Else
		li_response = MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Se ha producido un error !. Desea ver los detalles ?.",Exclamation!,YesNo!) 
	
End Choose 

If li_response = 1 Then
//	String ls_sel1,ls_name
//	ls_sel1=Describe("DataWindow.Table.Select")
//	ls_name=classname()

	Return 0
Else
	Return 1
End If	
end event

event getfocus;w_sheet       lw_win
GraphicObject lgo_graphicobject

lgo_graphicobject = This
Do
	lgo_graphicobject = lgo_graphicobject.GetParent()
Loop Until lgo_graphicobject.TypeOf() = Window! 
lw_win = lgo_graphicobject
lw_win.of_SetDataWindow(This)


end event

event itemerror;
If IsNull(data) Then
	Return 2
End If	
end event

event sqlpreview;n_cst_audit lou_audit


If n_cst_application.ib_audit Then
	If lou_audit.Of_Audit(This,buffer,row,n_cst_application.itr_appl,sqltype) = -1 Then	Return 1
End If
end event

on u_dw_base.create
end on

on u_dw_base.destroy
end on

