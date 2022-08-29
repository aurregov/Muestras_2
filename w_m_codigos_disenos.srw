HA$PBExportHeader$w_m_codigos_disenos.srw
$PBExportComments$Permite buscar e insertar partes de materia prima
forward
global type w_m_codigos_disenos from w_base_busqueda_mod
end type
type cb_buscar from commandbutton within w_m_codigos_disenos
end type
end forward

global type w_m_codigos_disenos from w_base_busqueda_mod
integer width = 2249
integer height = 1636
string title = "Dise$$HEX1$$f100$$ENDHEX$$os de muestras"
boolean center = true
cb_buscar cb_buscar
end type
global w_m_codigos_disenos w_m_codigos_disenos

type variables
String is_select_original 
end variables

forward prototypes
public function integer of_retorno ()
public function integer of_verifica ()
public function integer of_asignar_consecutivo ()
end prototypes

public function integer of_retorno ();io_retorno.is_vector[1]=dw_1.GetItemString(il_fila,"de_diseno")
Return 1
end function

public function integer of_verifica ();long ll_tot,i, ll_c,ll_c1
String ls_de_combi, ls_c


//of_filtro("")
//dw_1.SetSort("co_diseno a")
//dw_1.Sort()

ll_tot=dw_1.RowCount()

For i=1 to ll_tot
	
//	ls_c=dw_1.GetItemString(i,"de_diseno")
//
//
//	If IsNull(ls_c)  OR trim(ls_c) = ' ' Then
//		MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo de dise$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido, fila "+&
//		String(i)+".",StopSign!)
//		Return -1
//	End If
//
//	If i<ll_tot Then
//		ll_c1=dw_1.GetItemNUmber(i+1,"co_diseno")
//		If ll_c=ll_c1 Then
//			MessageBox("Advertencia!","Codigo de dise$$HEX1$$f100$$ENDHEX$$o repetido, fila "+&
//			String(i)+".",StopSign!)
//			Return -1
//		End If
//	End If
//
	ls_de_combi=dw_1.GetItemString(i,"descripcion")

	If IsNull(ls_de_combi) OR Trim(ls_de_combi) = '' Then
		MessageBox("Advertencia!","Descripci$$HEX1$$f300$$ENDHEX$$n de dise$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lida, fila "+&
		String(i)+".",StopSign!)
		Return -1
	End If
/*
	SELECT COUNT(*)
	  INTO :ll_existe
	  FROM m_codigos_disenos
	 WHERE de_diseno = :ls_diseno 
	 USING n_cst_application.itr_appl;
	 
	IF n_cst_application.itr_appl.SqlCode < 0 THEN
		MessageBox("Advertencia!","Error al buscar consecutivos repetidos.~r~n"+&
					 n_cst_application.itr_appl.SqlErrText,StopSign!)
		Return -1
	END IF
	
	IF ll_existe > 0 THEN
		lb_consec = TRUE
	ELSEIF ll_existe = 0 THEN
		lb_consec = FALSE
	END IF 
 
	SELECT count(*)   
	  INTO :ll_existe
	  FROM m_disenos_muestras  
	 WHERE m_disenos_muestras.de_diseno = :ls_diseno  
		AND m_disenos_muestras.co_muestra <> :a_muestra
	 using a_transaction;

	If a_transaction.SQLcode=-1 Then 
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(a_transaction)
		Return -1
	End If
	IF ll_contador <> 0 THEN  RETURN 1	
	
*/
Next

Return 1

end function

public function integer of_asignar_consecutivo ();Long ll_diseno, ll_totfilas, ll_fila, ll_existe
String ls_diseno
Boolean lb_consec

ll_totfilas = dw_1.RowCount()

// Se recorren todas las filas 
FOR ll_fila = 1 TO ll_totfilas
	ls_diseno = Trim(dw_1.GetItemString(ll_fila, "de_diseno"))
	IF IsNull(ls_diseno) OR ls_diseno = '' THEN
		lb_consec = TRUE
		DO WHILE lb_consec
			ll_diseno = n_cst_application.of_consecutive(2,100,n_cst_application.itr_appl)
			If ll_diseno <=0 Then
				ll_diseno = 0
				MessageBox("Advertencia!","No se pudo determinar el consecutivo del dise$$HEX1$$f100$$ENDHEX$$o.",StopSign!)
				Return -1
			End If
			
			ls_diseno = String(ll_diseno)
			
			SELECT COUNT(*)
			  INTO :ll_existe
			  FROM m_codigos_disenos
			 WHERE de_diseno = :ls_diseno 
			 USING n_cst_application.itr_appl;
			 
			IF n_cst_application.itr_appl.SqlCode < 0 THEN
				MessageBox("Advertencia!","Error al buscar consecutivos repetidos.~r~n"+&
				          n_cst_application.itr_appl.SqlErrText,StopSign!)
				Return -1
			END IF
			
			IF ll_existe > 0 THEN
				lb_consec = TRUE
			ELSEIF ll_existe = 0 THEN
				lb_consec = FALSE
			END IF
			 
		LOOP
		dw_1.SetItem(ll_fila, "de_diseno", ls_diseno)
	END IF	
NEXT

Return 1
end function

on w_m_codigos_disenos.create
int iCurrent
call super::create
this.cb_buscar=create cb_buscar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_buscar
end on

on w_m_codigos_disenos.destroy
call super::destroy
destroy(this.cb_buscar)
end on

event open;call super::open;
long ll_tot

is_select_original = dw_1.Describe('DataWindow.Table.Select')

If is_select_original = '?' Or is_select_original = '!' Then
	MessageBox("Error","$$HEX1$$a100$$ENDHEX$$Se ha producido un error determinando el select!",StopSign!)
	Close(This)
	RETURN
End If

// Si envian parametros desde otro objeto, se recibe en io_param.
// En caso de ser llamado desde la Muestra basica, se recibir$$HEX1$$e100$$ENDHEX$$
// la descripcion de la muestra y se pondra por defecto en el 
// campo "descripcion"

IF IsValid(io_param) THEN
	// Sin la descripcion llega nula o vacia, no se tiene en cuenta
	// de lo contrario se inserta por defecto un registro con esa
	// descripcion. 
	IF NOT IsNull(io_param.is_vector[1]) AND &
	   Trim(io_param.is_vector[1]) <> '' THEN
		THIS.Visible = FALSE
		dw_1.Trigger Event ue_insertRow() 
		il_fila = dw_1.GetRow()
		dw_1.SetItem(il_fila, 'descripcion', Trim(io_param.is_vector[1]) )
		cb_aceptar.Trigger event clicked( )		
		RETURN
		/*
		cb_adicionar.Enabled = FALSE
		cb_buscar.Enabled    = FALSE
		cb_eliminar.Enabled  = FALSE
		*/
	END IF	
	// Si la ventana es llamada desde una opcion diferente a la Muestra B$$HEX1$$e100$$ENDHEX$$sica
	// o el menu del Maestro de C$$HEX1$$f300$$ENDHEX$$digos de Dise$$HEX1$$f100$$ENDHEX$$os, no se debe permitir el uso 
	// del Buscar ni el Eliminar.
	IF UpperBound(io_param.il_vector) > 0 THEN 
		IF NOT IsNull(io_param.il_vector[1]) AND &
	   	io_param.il_vector[1] =  0 THEN
			cb_buscar.Enabled   = FALSE
			cb_eliminar.Enabled = FALSE
		END IF
	END IF	
END IF
end event

type st_1 from w_base_busqueda_mod`st_1 within w_m_codigos_disenos
boolean visible = false
integer x = 110
integer y = 1896
integer width = 466
integer height = 64
string text = "Digite la descripci$$HEX1$$f300$$ENDHEX$$n:"
end type

type sle_1 from w_base_busqueda_mod`sle_1 within w_m_codigos_disenos
boolean visible = false
integer x = 599
integer y = 1888
integer taborder = 0
end type

event sle_1::modified;call super::modified;of_filtro("de_diseno like '%"+text+"%'")

end event

type cb_adicionar from w_base_busqueda_mod`cb_adicionar within w_m_codigos_disenos
integer x = 165
integer y = 1400
end type

type cb_eliminar from w_base_busqueda_mod`cb_eliminar within w_m_codigos_disenos
integer x = 869
integer y = 1400
integer taborder = 40
end type

type cb_aceptar from w_base_busqueda_mod`cb_aceptar within w_m_codigos_disenos
integer x = 1358
integer y = 1400
integer height = 92
integer taborder = 50
end type

event cb_aceptar::clicked;//////////////////////////////////////////////////////////////////////////
// MODIFICADO: Noviembre 23 de 2010 - gagudelo - ohlondon
// ----------------------------------------------------------------------
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 08 de Enero de 2003 HORA 11:17:57:265
// 
//////////////////////////////////////////////////////////////////////////
	
DateTime ldt_fecha
String ls_usuario,ls_instancia
	
If dw_1.RowCount()>0 Then
	If il_fila<=0 Then
		MessageBox("Advertencia!","Debe seleccionar un registro.",StopSign!)
		Return
	End If

	If dw_1.AcceptText()<>1 Then
		MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
		Return
	End If

	// Verifica que todos y cada uno de los registros tengan
	// tanto el codigo como la descripcion.
	If of_verifica()<>1 then
		RollBack Using n_cst_application.itr_appl ;
		Return
	End If

   /*
	* ---------------------------------------------------------------------------
	* MODIFICADO: Febrero 28 de 2012 - ohlondon 
	* ---------------------------------------------------------------------------
	* Si escriben un codigo en de_diseno, se verifica si se puede usar y de ser
	* posible, entonces no se toma consecutivo sino que se deja el que digiten
	* ---------------------------------------------------------------------------
	*/
	
	// Asigna el c$$HEX1$$f300$$ENDHEX$$digo de dise$$HEX1$$f100$$ENDHEX$$o a los registros nuevos
   If of_asignar_consecutivo() <> 1 then
		RollBack Using n_cst_application.itr_appl ;
		Return
	End If  

	If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
													 ldt_fecha,ls_usuario,ls_instancia) Then
		RollBack Using n_cst_application.itr_appl ;
		Return  
	End If

	If dw_1.of_datosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
		RollBack Using n_cst_application.itr_appl ;
		Return
	End If	

   // Obtiene el codigo de dise$$HEX1$$f100$$ENDHEX$$o de la fila seleccionada
	of_retorno()

End If

If dw_1.Update()<>1 then
	RollBack Using n_cst_application.itr_appl ;
	Return
End If

Commit Using n_cst_application.itr_appl ;

IF NOT PARENT.Visible THEN
  cb_cancelar.PostEvent("clicked")
END IF

end event

type cb_cancelar from w_base_busqueda_mod`cb_cancelar within w_m_codigos_disenos
integer x = 1710
integer y = 1400
integer height = 92
integer taborder = 60
string text = "Salir"
end type

event cb_cancelar::clicked;If dw_1.RowCount()>0 Then
	IF IsValid(io_retorno) THEN
		IF Upperbound(io_retorno.is_vector) > 0 THEN
			CloseWithReturn(Parent,io_retorno)
		ELSE
			Close(Parent)
		END IF
	ELSE
		Close(Parent)
	END IF
Else
	Close(Parent)
End If


end event

type dw_1 from w_base_busqueda_mod`dw_1 within w_m_codigos_disenos
integer x = 59
integer y = 76
integer width = 2117
integer height = 1236
string dataobject = "d_m_codigos_disenos"
end type

event dw_1::ue_dwnprocessenter;if this.AcceptText() < 0 then
  Return 1
end if
// si estoy posicionado en la Descripcion de la $$HEX1$$fa00$$ENDHEX$$ltima fila
if this.GetColumn() = 2 then
 if this.GetRow() = this.RowCount() then
	postEvent("ue_insertRow")
   Return 1
 end if
end if

Send(Handle(this),256,9,Long(0,0))
return 1

end event

event dw_1::itemchanged;call super::itemchanged;DateTime ldt_fecha
String 	ls_usuario, ls_instancia

If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
											 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If

This.SetItem(Row,'fe_actualizacion',ldt_fecha)
This.SetItem(Row,'usuario',ls_usuario)
This.SetItem(Row,'instancia',ls_instancia)
end event

event dw_1::doubleclicked;IF IsValid(io_param) THEN
	// Sin la descripcion que llega es nula o vacia, no se ejecuta el
	// dobleclicked, de lo contrario se devuelve el registro seleccionado
	IF NOT IsNull(io_param.is_vector[1]) AND &
	   Trim(io_param.is_vector[1]) <> '' THEN
		
		If Row=0 Then
			Return 
		End If
	
		il_fila=Row
		
		SelectRow(0,false)
		SelectRow(il_fila,True)
		
		cb_aceptar.post event clicked()
		 
	END IF	
END IF
end event

event dw_1::ue_deleterow;IF Trim(dw_1.GetItemString(dw_1.GetRow(), 'sw_usado')) = '0'THEN
	If MessageBox("Eliminar Fila","Esta seguro(a) de eliminar la fila ?.",Question!,YesNo!,2) = 1 Then
		This.DeleteRow(0)
	End If
	This.SetFocus()
END IF
end event

type gb_1 from w_base_busqueda_mod`gb_1 within w_m_codigos_disenos
integer x = 32
integer y = 20
integer width = 2167
integer taborder = 0
string text = "Dise$$HEX1$$f100$$ENDHEX$$os de muestra"
end type

type gb_2 from w_base_busqueda_mod`gb_2 within w_m_codigos_disenos
boolean visible = false
integer x = 32
integer y = 1796
integer taborder = 0
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda de dise$$HEX1$$f100$$ENDHEX$$o"
end type

type cb_buscar from commandbutton within w_m_codigos_disenos
integer x = 517
integer y = 1400
integer width = 343
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar"
end type

event clicked;String ls_where,ls_error

If dw_1.ModifiedCount() > 0 Or dw_1.DeletedCount() > 0 Then
	If MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","$$HEX1$$bf00$$ENDHEX$$Desea buscar sin guardar los cambios?",Question!,YesNo!) = 2 Then
		Return 
	End If	
End If

OpenWithParm(w_find,dw_1)
ls_where = Message.StringParm
If ls_where <> '?' Then
	ls_error = dw_1.Modify("DataWindow.Table.Select='"+is_select_original+ls_where+"'")
	If ls_error = "" Then
		dw_1.Retrieve()
	Else
		MessageBox("Error","$$HEX1$$a100$$ENDHEX$$Se ha producido un error determinando el select!"+ls_error,StopSign!)
	End If
End If	
dw_1.SetFocus()
end event

