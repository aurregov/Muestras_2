HA$PBExportHeader$u_dw_application.sru
$PBExportComments$DataWindow que se puede personalizar para la aplicaci$$HEX1$$f300$$ENDHEX$$n
forward
global type u_dw_application from u_dw_base
end type
end forward

global type u_dw_application from u_dw_base
end type
global u_dw_application u_dw_application

type variables
long il_err_item_change

String is_usuario,is_instancia

end variables

forward prototypes
public function integer of_color (string a_columna, long a_color)
public function boolean of_completedata (long a_fila)
public function integer of_datosactualizacion (datetime a_fecha, string a_usuario, string a_instancia)
public function integer of_color (long a_columna, long a_color)
public function integer of_size_dddw ()
public function integer of_validarcadena (string a_cad)
end prototypes

public function integer of_color (string a_columna, long a_color);If a_color=0 Then
	Modify(a_columna+".Background.Color='76788149'")
ElseIf a_color=1 Then
	Modify(a_columna+".Background.Color='1073741824'")
End If

Return 1
	
end function

public function boolean of_completedata (long a_fila);Long 		ll_m
Integer 	li_i,li_n
String 	ls_coltype,ls_tag


li_n = Integer(This.Describe("DataWindow.Column.Count"))
For li_i = 1 To li_n 
		If This.Describe("#"+String(li_i)+".Visible") = '1' Then
			ls_tag = This.Describe("#"+String(li_i)+".Tag") 
//////////////////////////////////////////////////////////////////////////
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
				
				Choose Case ls_coltype
					
					Case 'long','decimal','number','int','real','ulong'
						If IsNull(This.GetItemNumber(a_fila,li_i)) Then
							MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Debe especificar "+ls_tag+" !.",StopSign!)
							This.SetFocus()
							This.SetColumn(li_i)
							This.SetRow(a_fila)
							This.ScrollToRow(a_fila)
							Return False
						End If	
						
					Case 'char'
						If IsNull(This.GetItemString(a_fila,li_i)) Then
							MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Debe especificar "+ls_tag+" !.",StopSign!)
							This.SetFocus()
							This.SetColumn(li_i)
							This.SetRow(a_fila)
							This.ScrollToRow(a_fila)
							Return False
						End If	
						
					Case 'date'
						If IsNull(This.GetItemDate(a_fila,li_i)) Then
							MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Debe especificar "+ls_tag+" !.",StopSign!)
							This.SetFocus()
							This.SetColumn(li_i)
							This.SetRow(a_fila)
							This.ScrollToRow(a_fila)
							Return False
						End If	
		
					Case 'time'
						If IsNull(This.GetItemTime(a_fila,li_i)) Then
							MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Debe especificar "+ls_tag+" !.",StopSign!)
							This.SetFocus()
							This.SetColumn(li_i)
							This.SetRow(a_fila)
							This.ScrollToRow(a_fila)
							Return False
						End If	
		
					Case 'datetime'
						If IsNull(This.GetItemDateTime(a_fila,li_i)) Then
							MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Debe especificar "+ls_tag+" !.",StopSign!)
							This.SetFocus()
							This.SetColumn(li_i)
							This.SetRow(a_fila)
							This.ScrollToRow(a_fila)
							Return False
						End If	
		
				End Choose 	
			End If
		End If	
Next	

Return True



end function

public function integer of_datosactualizacion (datetime a_fecha, string a_usuario, string a_instancia);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 18 de Diciembre de 2002 HORA 09:53:24:421
// 
// 
//////////////////////////////////////////////////////////////////////////


DateTime ldt_crea

long i,ll_tot

DwItemStatus l_status


ll_tot = This.RowCount()
For i = 1 To ll_tot
	l_status = This.GetItemStatus(i,0,Primary!)
	If l_status <> NotModified! Then
		//si el DataWindow tiene fe_actualizacion,usuario,instancia
		//entonces actualizarlas
		If of_existColumn("fe_actualizacion") Then
			This.SetItem(i,'fe_actualizacion',a_fecha)
		End If
		
		If of_existColumn("usuario") Then
			This.SetItem(i,'usuario',a_usuario)
		End If
		
		If of_existColumn("instancia") Then
			This.SetItem(i,'instancia',a_instancia)
		End If
//////////////////////////////////////////////////////////////////////////
// Actualizo tambien la fecha de creacion si es null
// 
//////////////////////////////////////////////////////////////////////////
		
		If of_existColumn("fe_creacion") Then
			ldt_crea=GetItemDateTime(i,"fe_creacion")
			If IsNull(ldt_crea) Then
				This.SetItem(i,'fe_creacion',a_fecha)
			End If
		End If
		
	End If
Next

Return 1
end function

public function integer of_color (long a_columna, long a_color);If a_color=0 Then
	Modify("#"+String(a_columna)+".Background.Color='76788149'")
ElseIf a_color=1 Then
	Modify("#"+String(a_columna)+".Background.Color='1073741824'")
End If

Return 1
	
end function

public function integer of_size_dddw ();long ll_cant,i,ll_res

ll_cant=Long(this.Describe("DataWindow.Column.Count"))

datawindowchild ldc_1
string ls_col
long ll_tam,j,ll_cant1,ll_x,ll_w,ll_dis
for i=1 to ll_cant
	ls_col=Describe("#"+string(i)+".Name")
	ll_res = this.GetChild(ls_col, ldc_1)
	if ll_res=-1 then
		continue
	end if
   
	ll_cant1=long(ldc_1.Describe("DataWindow.Column.Count"))
	ll_tam=0
	for j=1 to ll_cant1
		ll_x=long(ldc_1.Describe("#"+string(j)+".X"))
		ll_w=long(ldc_1.Describe("#"+string(j)+".Width"))
		if ll_x+ll_w>ll_tam then
			ll_tam=ll_x+ll_w
		end if
	next
	
	ll_x=long(ldc_1.Describe("compute_descripcion.X"))
	ll_w=long(ldc_1.Describe("compute_descripcion.Width"))
	if ll_x+ll_w>ll_tam then
		ll_tam=ll_x+ll_w
	end if
	
	
	
	if ll_tam>0 then
		ll_dis=long(Describe("#"+string(i)+".Width"))
		if ll_dis>0 then
			String ls_mod
			ls_mod=ls_col+".DDDW.PercentWidth="+string(Round(15+(ll_tam/ll_dis*100),0))
			

			Modify(ls_mod)
			Modify(ls_col+".DDDW.VScrollbar=Yes")
			
			
		end if
	end if
	
next

Return 1
end function

public function integer of_validarcadena (string a_cad);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 04 de Octubre de 2002 HORA 13:24:56:093
// 
// Verifca si una cadena tiene caracteres especiales
// No se deben admitir comillas dobles o sencillas
// 1    ok
// -1   error
//////////////////////////////////////////////////////////////////////////


If pos(a_cad,'"')>0 Then
	MessageBox("Advertencia!",'Car$$HEX1$$e100$$ENDHEX$$cter no v$$HEX1$$e100$$ENDHEX$$lido ("), por favor verifique.',StopSign!)
	Return -1
End If

If pos(a_cad,"'")>0 Then
	MessageBox("Advertencia!","Car$$HEX1$$e100$$ENDHEX$$cter no v$$HEX1$$e100$$ENDHEX$$lido ('), por favor verifique.",StopSign!)
	Return -1
End If

Return 1






















end function

on u_dw_application.create
call super::create
end on

on u_dw_application.destroy
call super::destroy
end on

event constructor;call super::constructor;of_size_dddw()
end event

event itemchanged;call super::itemchanged;datawindowchild ldc_1
long ll_res

il_err_item_change=0

ll_res = this.GetChild(dwo.name, ldc_1)


if ll_res=-1 then
	return
end if

//////////////////////////////////////////////////////////////////////////
// Sie le dato es numerico lo valida con la lista
// 
//////////////////////////////////////////////////////////////////////////
String ls_coltype
ls_coltype = This.Describe(dwo.name+".ColType")

Choose Case ls_coltype
	Case 'long','decimal','number','int','real','ulong'
		If of_validarChild(dwo.name,long(Data))<>0 Then
			il_err_item_change=2
			Return 2
		End If
End Choose 	

Return 
end event

event dberror;Integer li_response
String  ls_error,ls_tab,ls_msg, ls_contenido, ls_directorio
long    ll_p1,ll_p2,ll_tot,i

uo_correo	lnv_correo
lnv_correo = CREATE uo_correo

Choose Case sqldbcode
	
	Case -268
		li_response = MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Se est$$HEX2$$e1002000$$ENDHEX$$tratando de ingresar un que registro que ya existe !. Desea ver los detalles ?.",Exclamation!,YesNo!) 
	
	Case -692
		li_response = MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Est$$HEX2$$e1002000$$ENDHEX$$tratando de eliminar un registro que ya es referenciado por otro archivo !. Desea ver los detalles ?.",Exclamation!,YesNo!) 
   Case -211 //error de bloqueo de sistema
		ls_error=sqlerrtext
		ll_p1=pos(ls_error,"(")
		ll_p2=pos(ls_error,")")
		ls_tab=mid(ls_error,ll_p1+1, ll_p2 -ll_p1 -1)
		n_ds_application lds_1
		
		lds_1=create n_ds_application
		
		lds_1.dataobject="d_sp_mu_table_lock"
		lds_1.Settransobject(n_cst_application.itr_appl)
		ll_tot=lds_1.Retrieve(ls_tab)
		
		If ll_tot>0 Then
			ls_msg="Bloqueo de "+ls_tab+"~n~r"
			
			ls_msg+="Los siguientes usuarios estan causando bloqueo, trate de ponerse en contacto con ellos ~n~r ~n~r"
			for i=1 To ll_tot
				ls_msg+=lds_1.GetItemString(i,"usuario")
				ls_msg+=lds_1.GetItemString(i,"tty")
				ls_msg+=lds_1.GetItemString(i,"tipo")+" ~n~r"
			next
			ls_msg+="Por favor pongase en contacto con el Administrador de Base de Datos si el problema persiste.~n~r"
			Messagebox("Problema de bloqueo en "+ls_tab,ls_msg,StopSign!)
      End If
		Destroy lds_1
	Case Else
		li_response = MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Se ha producido un error !. Desea ver los detalles ?.",Exclamation!,YesNo!) 
	
End Choose 


If li_response = 1 Then
	String ls_sel1,ls_name
	ls_sel1=Describe("DataWindow.Table.Select")
	ls_name=classname()
	clipboard(ls_sel1)

   MessageBox("Advertencia!",ls_sel1,StopSign!)

	Return 0
Else
	Return 1
End If	

/*Dbedocal 2018-05-11
n_ms_base lob_mail
lob_mail=create n_ms_base

String ls_usuario,ls_directorio

ls_directorio=GetCurrentDirectory()		
ls_usuario=ProfileString("procesop.ini", "correo_error","usuario", "jfvasduq@local")

//Messagebox('Var','ls_usuario='+ls_usuario+'~n'+&
//'ls_directorio='+ls_directorio+'~n')

lob_mail.of_sendmailoutlook(ls_usuario,'MUESTRAS SQL (DW)',ls_directorio+"~n"+classname()+"~n"+&
dataObject+"~n"+Parent.ClassName()+"~nERROR~n"+sqlerrtext+&
"~nSENTENCIA~n"+sqlsyntax+"~nCODIGO DB~n"+String(sqldbcode)+"~nFila~n"+String(row))

Destroy lob_mail
*/


ls_directorio=GetCurrentDirectory()		

ls_contenido = ls_directorio+"~n"+classname()+"~n"+&
					dataObject+"~n"+Parent.ClassName()+"~nERROR~n"+sqlerrtext+&
					"~nSENTENCIA~n"+sqlsyntax+"~nCODIGO DB~n"+String(sqldbcode)+"~nFila~n"+String(row)

TRY
	lnv_correo.of_enviar_correo('MUESTRAS SQL (DW)', ls_contenido, "correo_error")
CATCH(Exception ex)
	Messagebox("Error", ex.getmessage())
END TRY

DESTROY lnv_correo
end event

event itemfocuschanged;call super::itemfocuschanged;SelectText(1,80)
end event

