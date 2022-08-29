HA$PBExportHeader$w_mtto_medidas_reposadas.srw
$PBExportComments$Mantenimiento de las Medidas Reposadas
forward
global type w_mtto_medidas_reposadas from w_simple
end type
type dw_header from u_dw_base within w_mtto_medidas_reposadas
end type
type dw_grupmed from datawindow within w_mtto_medidas_reposadas
end type
end forward

global type w_mtto_medidas_reposadas from w_simple
integer width = 2661
integer height = 1312
string title = "Medidas Reposadas"
boolean minbox = false
dw_header dw_header
dw_grupmed dw_grupmed
end type
global w_mtto_medidas_reposadas w_mtto_medidas_reposadas

type variables
datawindowchild d_dddw_operaciones_calcetin

end variables

on w_mtto_medidas_reposadas.create
int iCurrent
call super::create
this.dw_header=create dw_header
this.dw_grupmed=create dw_grupmed
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_header
this.Control[iCurrent+2]=this.dw_grupmed
end on

on w_mtto_medidas_reposadas.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_header)
destroy(this.dw_grupmed)
end on

event open;call super::open;//datawindowchild ldwc_tipoprod
//
//dw_header.GetChild("co_tipoprod", ldwc_tipoprod)
//
//ldwc_tipoprod.settransobject(n_cst_application.itr_appl)
//ldwc_tipoprod.Retrieve(n_cst_application.is_user)
//
//dw_general.GetChild("co_operacion",d_dddw_operaciones_calcetin)
//d_dddw_operaciones_calcetin.settransobject(n_cst_application.itr_appl)
//
//// Se inserta en el encabezado un solo registro la primer vez 
//// al abrir la ventana
//dw_header.triggerevent('ue_insertrow')
//dw_header.SetColumn('co_tipoprod')
//dw_header.SetFocus()
//
m_base lm_menu

lm_menu = This.MenuId

//Deshabilitar opciones deacuerdo al perfil del usuario  
n_cst_application.inv_seguridad.of_seguridad(lm_menu,"w_application")

If dw_header.of_Conexion(n_cst_application.itr_appl,True) <> 1 Then
	MessageBox("Error","No se ha podido establecer conexi$$HEX1$$f300$$ENDHEX$$n con la base de datos !. ",StopSign!)
	Close(This)
END IF

end event

event ue_find;long ll_filas
dw_header.accepttext()
dw_header.SetRedraw(FALSE)
dw_header.SetTransObject(n_cst_application.itr_appl)
ll_filas = dw_header.retrieve()

dw_header.SetRedraw(TRUE)
IF ll_filas > 0 THEN
	dw_header.event clicked( 1, 1, 1, dw_header.Object) 
END IF

dw_header.SetFocus()
end event

event ue_insertrow;//long ll_co_tipoprod
//
//dw_header.accepttext()
//
//ll_co_tipoprod = dw_header.getitemnumber(1, "co_tipoprod")
//IF NOT IsNull(ll_co_tipoprod) THEN 
//	dw_general.SetItem( dw_general.GetRow(), 'co_tipoprod', ll_co_tipoprod )
//END IF

Long ll_fila

ll_fila = dw_header.InsertRow(0)
dw_header.ScrollToRow(ll_fila)
dw_header.SetColumn(1)
dw_header.SetFocus()
end event

event ue_print;// Override 
end event

event ue_deleterow;// Override
IF MessageBox("Borrado", "$$HEX1$$bf00$$ENDHEX$$Est$$HEX2$$e1002000$$ENDHEX$$seguro que desea borrar el registro?", Question!, YesNoCancel!, 3) = 1 THEN
	dw_header.DeleteRow(dw_header.GetRow())
END IF

end event

event closequery;If dw_header.ModifiedCount() > 0 Or dw_header.DeletedCount() > 0 Then
	If MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","$$HEX1$$bf00$$ENDHEX$$Desea salir sin guardar los cambios de Medidas?.",Question!,YesNo!) = 2 Then
		Return 1
	End If	
End If	

If dw_general.ModifiedCount() > 0 Or dw_general.DeletedCount() > 0 Then
	If MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","$$HEX1$$bf00$$ENDHEX$$Desea salir sin guardar los cambios de Grupos?.",Question!,YesNo!) = 2 Then
		Return 1
	End If	
End If	
end event

event ue_save;//

IF dw_header.Update() <> 1 THEN
	ROLLBACk USING n_cst_application.itr_appl;
	RETURN
ELSE
	IF dw_grupmed.Update() <> 1 THEN
		ROLLBACk USING n_cst_application.itr_appl;
		RETURN
	ELSE
		COMMIT USING n_cst_application.itr_appl;
		MessageBox("$$HEX1$$c900$$ENDHEX$$xito", "Los datos se guardaron satisfactiriamente.")
	END IF
END IF
end event

type dw_general from w_simple`dw_general within w_mtto_medidas_reposadas
integer x = 969
integer y = 56
integer width = 1618
integer height = 1048
string dataobject = "d_dt_tipo_med_rep_grupo_sel"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event dw_general::itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// Se verifica que no se repica el c$$HEX1$$f300$$ENDHEX$$digo
// 
//////////////////////////////////////////////////////////////////////////
long ll_dato,ll_pos
long ll_grupoprod
String ls_id_med_rep

this.accepttext()


If dwo.name="incluir" Then
	ls_id_med_rep = Trim(dw_header.GetItemString(dw_header.GetRow(), 'id_med_rep'))
	ll_grupoprod  = This.GetItemNumber(row, 'co_grupoprod')
	// Si se ha chequeado alguno se inserta en dw_grupmed que es el que se va a guardar
	IF data = 'S' THEN
		ll_pos = dw_grupmed.InsertRow(0)
		dw_grupmed.SetItem(ll_pos, 'id_med_rep', ls_id_med_rep) 
		dw_grupmed.SetItem(ll_pos, 'co_grupoprod', ll_grupoprod) 
	ELSE
		// Si se deschequea alguno se borra de dw_grupmed
		ll_pos = dw_grupmed.Find("id_med_rep = '"+ls_id_med_rep+"' AND co_grupoprod = "+String(ll_grupoprod),1,RowCount())
		
		If ll_pos > 0 Then
			dw_grupmed.DeleteRow(ll_pos)
		End If      
	END IF	
End If


end event

type gb_general from w_simple`gb_general within w_mtto_medidas_reposadas
integer x = 18
integer y = 0
integer width = 2610
integer height = 1132
end type

type dw_header from u_dw_base within w_mtto_medidas_reposadas
integer x = 55
integer y = 56
integer width = 901
integer height = 1048
boolean bringtotop = true
string dataobject = "d_m_tipo_med_rep"
boolean vscrollbar = false
boolean border = true
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event itemchanged;call super::itemchanged;String		ls_id_med_rep
String 		ls_id_med_rep_ant
Long 			ll_find

// Se captura el valor anterior, para devolverlo en caso de error
ls_id_med_rep_ant = This.GetItemString(row, 'id_med_rep')

This.AcceptText()
//Parent.Event ue_find( )

ls_id_med_rep = This.GetItemString(row, 'id_med_rep')
IF Not IsNull(ls_id_med_rep) THEN
	// Se busca con  codigo de medida y grupo y si se encuentra se cambia
	// el indicador de Incluir a S
	ll_find = dw_general.Find("incluir = 'S'", 1, dw_general.RowCount())
	
	IF ll_find > 0 THEN
		MessageBox("$$HEX1$$a100$$ENDHEX$$Atenci$$HEX1$$f300$$ENDHEX$$n!", "No es posible modificar el C$$HEX1$$f300$$ENDHEX$$digo de Medida pues existen grupos en los que se ha incluido.")
		SetItem(row, 'id_med_rep', ls_id_med_rep_ant )
		RETURN 1
	END IF
END IF	

end event

event clicked;call super::clicked;Long 		ll_filas, ll_fila, ll_grupoprod, ll_find
String   ls_id_med_rep

IF row <= 0 THEN RETURN

dw_general.SetRedraw(FALSE)
dw_grupmed.SetTransObject(n_cst_application.itr_appl)
// Se configuran por defecto el indicador de Incluir en N para todos los grupos 
dw_general.SetTransObject(n_cst_application.itr_appl)
dw_general.Retrieve( )
ll_filas = dw_general.RowCount()
FOR ll_fila = 1 TO ll_filas
	dw_general.SetItem(ll_fila, 'incluir', 'N')
	dw_general.SetItemStatus(ll_fila, "incluir", Primary!, NotModified!)
NEXT

// Se recuperan los grupos a los que se ha asociado la medida
ls_id_med_rep = Trim(This.GetItemString (row, 'id_med_rep'))

IF Not IsNull(ls_id_med_rep) THEN
	dw_grupmed.Retrieve(ls_id_med_rep) 
		
	// Luego se chequean los que se recuperaron en el primer paso
	ll_filas = dw_grupmed.RowCount()
	FOR ll_fila = 1 TO ll_filas
		ll_grupoprod = dw_grupmed.GetItemNumber(ll_fila, 'co_grupoprod')
		
		// Se busca con  codigo de medida y grupo y si se encuentra se cambia
		// el indicador de Incluir a S
		// ll_find = dw_general.Find("id_med_rep = '"+String(ls_id_med_rep)+"' and "+&
		//								  "co_grupoprod = "+String(ll_grupoprod), &
		ll_find = dw_general.Find("co_grupoprod = "+String(ll_grupoprod), &
										  1, dw_general.RowCount())
		
		IF ll_find > 0 THEN
			dw_general.SetItem(ll_find, 'incluir', 'S')
			dw_general.SetItemStatus(ll_find, "incluir", Primary!, NotModified!)

		END IF
	NEXT
END IF	
dw_general.SetRedraw(TRUE)

//ELSE
//	MessageBox("$$HEX1$$a100$$ENDHEX$$Atenci$$HEX1$$f300$$ENDHEX$$n!", "Debe especificar el c$$HEX1$$f300$$ENDHEX$$digo de medida.")
//

end event

event rowfocuschanging;call super::rowfocuschanging;//String ls_id_med_rep
//
//IF currentRow > 0 THEN
//	ls_id_med_rep = dw_header.GetItemString(currentRow, "id_med_rep")
//	
//	If dw_grupmed.ModifiedCount() > 0 Or dw_grupmed.DeletedCount() > 0 Then
//		If MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","Tiene cambios pendientes por guardar para la medida "+ls_id_med_rep+&
//											". $$HEX1$$bf00$$ENDHEX$$Desea continuar?",Question!,YesNo!) = 2 Then
//			Return 1
//		End If	
//	End If	
//END IF
event clicked( 0, 0, newrow, dw_header.object )
end event

event dberror;/*
* ---------------------------------------------------------------------
*	Evento utilizado para desplegar un mensaje identificando el error 
*	relacionado con la base de datos  
*	---------------------------------------------------------------------
*/
String ls_SQLSyntax, ls_SQLErrText
Long ll_SQLDBCode

ls_SQLSyntax  = SQLSyntax
ls_SQLErrText = SQLErrText
ll_SQLDBCode  = SQLDBCode
 
ls_SQLSyntax  = "~n~nError en SQL: ~n" + ls_SQLSyntax 

MessageBox( "Error de Base de Datos ("+This.DataObject+" - "+Trim(n_cst_application.itr_appl.DBMS)+")", &
            "- C$$HEX1$$f300$$ENDHEX$$digo     : "+ String(ll_SQLDBCode)+&
				"~n~n- Descripci$$HEX1$$f300$$ENDHEX$$n: "+Trim(SQLErrText)+&
				"~n~n- SQL        : "+ Trim(ls_SQLSyntax), StopSign!)
		
Return 1	//	Suprime el mensaje de error por defecto del sistema
end event

type dw_grupmed from datawindow within w_mtto_medidas_reposadas
boolean visible = false
integer x = 1865
integer y = 904
integer width = 695
integer height = 172
integer taborder = 50
boolean bringtotop = true
boolean titlebar = true
string title = "dw_grupmed (No visible)"
string dataobject = "d_dt_tipo_med_rep_grupo"
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;/*
* ---------------------------------------------------------------------
*	Evento utilizado para desplegar un mensaje identificando el error 
*	relacionado con la base de datos  
*	---------------------------------------------------------------------
*/
String ls_SQLSyntax, ls_SQLErrText
Long ll_SQLDBCode

ls_SQLSyntax  = SQLSyntax
ls_SQLErrText = SQLErrText
ll_SQLDBCode  = SQLDBCode
 
ls_SQLSyntax  = "~n~nError en SQL: ~n" + ls_SQLSyntax 

MessageBox( "Error de Base de Datos ("+This.DataObject+" - "+Trim(n_cst_application.itr_appl.DBMS)+")", &
            "- C$$HEX1$$f300$$ENDHEX$$digo     : "+ String(ll_SQLDBCode)+&
				"~n~n- Descripci$$HEX1$$f300$$ENDHEX$$n: "+Trim(SQLErrText)+&
				"~n~n- SQL        : "+ Trim(ls_SQLSyntax), StopSign!)
		
Return 1	//	Suprime el mensaje de error por defecto del sistema
end event

