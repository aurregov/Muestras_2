HA$PBExportHeader$w_mu_soli_hilaza.srw
$PBExportComments$Para el manejo de la materia prima
forward
global type w_mu_soli_hilaza from w_response
end type
type cb_2 from commandbutton within w_mu_soli_hilaza
end type
type cb_1 from commandbutton within w_mu_soli_hilaza
end type
type dw_1 from u_dw_application within w_mu_soli_hilaza
end type
type gb_1 from groupbox within w_mu_soli_hilaza
end type
end forward

global type w_mu_soli_hilaza from w_response
integer width = 3209
integer height = 784
string title = "Solicitud de hilaza"
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_mu_soli_hilaza w_mu_soli_hilaza

forward prototypes
public function integer of_validar ()
public function integer of_validar_matprima (transaction a_transaction, long an_producto, long an_color, long an_fabrica)
end prototypes

public function integer of_validar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Sabado 13 de Agosto de 2005 HORA 12:52:28:843
// 
// Verifica que la informacion se ingrese en forma adecuada
//////////////////////////////////////////////////////////////////////////
If dw_1.AcceptText()<>1 Then
	Return -1
End If
end function

public function integer of_validar_matprima (transaction a_transaction, long an_producto, long an_color, long an_fabrica);Long ll_error, ll_contador

If IsNull(an_producto) OR  IsNull(an_color)  Then
	Return 1
End If

//Se verifica que por lo menos haya una convinacion de producto - color activo

SELECT count(estado) 
INTO :ll_contador
FROM m_prod_proveedor 
WHERE co_producto = :an_producto
AND co_color = :an_color
AND  estado = "A" 
//AND  estado = "O" 
AND co_fabrica = :an_fabrica
  using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If

If ll_contador > 0 Then
	Return 1
Else
	Return 0
End If

end function

on w_mu_soli_hilaza.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.gb_1
end on

on w_mu_soli_hilaza.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Sabado 13 de Agosto de 2005 HORA 12:51:31:765
// 
// Se muestra la misma informaci$$HEX1$$f300$$ENDHEX$$n del dw que esta haciendo el llamado.
//////////////////////////////////////////////////////////////////////////


DataWindowChild lddw_tono
n_cst_param_orden lo_param

lo_param=message.powerobjectParm

u_dw_application ldw

ldw=lo_param.idw_vector[1]

ldw.ShareData(dw_1)

dw_1.SetTransObject(n_cst_application.itr_appl)

dw_1.getchild('co_tono',lddw_tono)
lddw_tono.settrans(n_cst_application.itr_appl)
lddw_tono.retrieve()
end event

type cb_2 from commandbutton within w_mu_soli_hilaza
integer x = 1600
integer y = 548
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
end type

event clicked;Close(parent)
end event

type cb_1 from commandbutton within w_mu_soli_hilaza
integer x = 1248
integer y = 548
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;
n_cst_param_orden lo_param

String ls_de_color
If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos, por favor verifique la informaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
	Return
End If

If Not dw_1.of_completedata() Then
	Return
End If
 
lo_param.idw_vector[1] =  dw_1 
 
Long fila 
fila = UpperBound(lo_param.is_vector) + 1

ls_de_color = String(fila, "")

ls_de_color = String(dw_1.GetItemNumber(1, 'co_color'), "")

ls_de_color = "("+String(dw_1.GetItemNumber(1, 'co_color'), "")+ ") "+&
      			            Trim(dw_1.GetItemString(1, 'de_color'))
lo_param.is_vector[fila] = ls_de_color 

CloseWithReturn(parent,lo_param)
end event

type dw_1 from u_dw_application within w_mu_soli_hilaza
integer x = 27
integer y = 120
integer width = 3054
string dataobject = "d_mu_soli_hilaza"
boolean vscrollbar = false
boolean livescroll = false
end type

event doubleclicked;call super::doubleclicked;n_cst_param lo_param

If dwo.name="co_producto_mp" Then
	Open(w_materia_prima)
	lo_param=Message.PowerObjectParm
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
		AcceptText()
	End If
End If

If dwo.name="co_color" Then
	lo_param.il_vector[1]=2//GetItemNumber(row,"co_fabrica_mp")
	lo_param.il_vector[2]=GetItemNumber(row,"co_producto_mp")
	
	OpenWithParm(w_color_mp_prod,lo_param)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		// Verifica si el estado del color es descontinuado "D"
		IF lo_param.is_vector[1] = 'D' THEN
			// Si es "D", entonces se verifica si se quiere seleccionar con ese estado
			IF MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "$$HEX1$$bf00$$ENDHEX$$Seguro que desea seleccionar un color descontinuado?", Question!,YesNo!, 2) = 1 THEN
				SetText(String(lo_param.il_vector[1]))
			END IF
		ELSE
			// Si esta activo, no se verifica, solo se selecciona.
			SetText(String(lo_param.il_vector[1]))
		END IF			
		
		AcceptText()
	End If
End If

end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Sabado 13 de Agosto de 2005 HORA 12:59:14:062
// 
// 
//////////////////////////////////////////////////////////////////////////


n_cst_comun lo_comun
Long ll_res,ll_dato,ll_codigo,ll_fabrica
//--------------------------------------------------

String ls_coltype
ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	If This.of_validarcadena(Data)<>1 Then 
		Return 2
	End If
End If


If dwo.name="co_producto_mp" Then
	ll_dato=Long(Data)
	ll_res=lo_comun.of_nombreMatPrima(ll_dato,n_cst_application.itr_appl)
	If ll_res=1 then
		SetItem(row,"de_producto_mp",lo_comun.of_getString(1))
	Else
		MessageBox("Advertencia!","Dato no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2

	End If	
End If

If dwo.name="de_producto" Then
	ll_codigo=GetItemNumber(row,"co_producto")
	If Not IsNull(ll_codigo) Then
		MessageBox("Advertencia!","No se puede modificar la descripci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
		Return 2	
	End If
End If

If dwo.name="co_color" Then
	ll_codigo=GetItemNumber(row,"co_producto_mp")
	ll_dato=Long(Data)
	If Not IsNull(ll_dato) Then
		ll_res=lo_comun.of_nombrecolor_mp(2 /*long a_fabrica*/,&
												ll_codigo/*long a_producto*/,&
												ll_dato/*long a_color*/, &
												n_cst_application.itr_appl/*transaction a_transaction */)
		If ll_res<>1 Then
			MessageBox("Advertencia!","Color no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
			Return 2
		End If
		
		//SA56278 - Ceiba/reariase - 31-01-2017
		ll_fabrica=GetItemNumber(row,"co_fabrica")
		If IsNull(ll_fabrica) THEN 
			ll_fabrica = 2
		End If 
	
		ll_res = of_validar_matprima(n_cst_application.itr_appl,ll_codigo,ll_dato,ll_fabrica)
		If ll_res <> 1 Then
			MessageBox("Advertencia!","Existe por lo menos una combinaci$$HEX1$$f300$$ENDHEX$$n producto - matiz - caracter$$HEX1$$ed00$$ENDHEX$$stica - color - calidad en estado obsoleto ",StopSign!)
			Return 2
		End If
		//Fin SA56278	
	
		SetItem(row,"de_color",lo_comun.of_getString(1)) //de colors
		SetItem(row,"co_tono",lo_comun.of_getLong(1)) //tono
	End If
End If



end event

event getfocus;//
end event

type gb_1 from groupbox within w_mu_soli_hilaza
integer x = 14
integer y = 40
integer width = 3090
integer height = 464
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Solicitud de hilaza"
end type

