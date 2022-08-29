HA$PBExportHeader$w_opc_muestra.srw
forward
global type w_opc_muestra from w_response
end type
type cbx_buscar_ref from checkbox within w_opc_muestra
end type
type cb_buscar from u_cb_base within w_opc_muestra
end type
type dw_1 from u_dw_application within w_opc_muestra
end type
type cb_aceptar from commandbutton within w_opc_muestra
end type
type cb_1 from commandbutton within w_opc_muestra
end type
type gb_1 from groupbox within w_opc_muestra
end type
type dw_consulta from u_dw_application within w_opc_muestra
end type
type gb_2 from u_gb_base within w_opc_muestra
end type
end forward

global type w_opc_muestra from w_response
integer x = 101
integer y = 52
integer width = 3543
integer height = 1856
string title = "Consulta"
cbx_buscar_ref cbx_buscar_ref
cb_buscar cb_buscar
dw_1 dw_1
cb_aceptar cb_aceptar
cb_1 cb_1
gb_1 gb_1
dw_consulta dw_consulta
gb_2 gb_2
end type
global w_opc_muestra w_opc_muestra

type variables
long il_fila=0
String is_where, is_select

long il_fabrica,il_tipoProd
Boolean ib_errordw,ib_dw_has_focus
end variables

forward prototypes
public function integer of_filasel (long a_fila)
public function integer of_recuperar (string a_where)
end prototypes

public function integer of_filasel (long a_fila);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 17 de Diciembre de 2002 HORA 10:23:20:187
// 
// 
//////////////////////////////////////////////////////////////////////////


il_fila=a_fila

dw_consulta.SelectRow(0,False)
dw_consulta.SelectRow(il_fila,True)

Return 1










end function

public function integer of_recuperar (string a_where);String ls_original,ls_sin_where,ls_modString,ls_inicial, ls_fert, ls_where
long ll_pos, ll_posfin

ls_inicial=dw_consulta.Describe("DataWindow.Table.Select")	
If Right(a_where,1)=")" Then	
//////////////////////////////////////////////////////////////////////////
// en la sentencia se adiciona un where para colocar luego las condiciones
// 
//////////////////////////////////////////////////////////////////////////
	
	If Not cbx_buscar_ref.Checked Then
		// ------------------------------------------------------------------------
		ls_original= is_select // dw_consulta.Describe("DataWindow.Table.Select")
	
		ll_pos = pos(a_where,"dt_muestras_fert")
	
		IF Not IsNull(ll_pos) AND ll_pos > 0 THEN
			ls_original = ls_original +",  dt_muestras_fert"
			ll_pos = pos(a_where,"co_fert like") 
			If ll_pos>0 Then
				ll_pos    = ll_pos + 16 
				ll_posfin = pos(a_where, "'", ll_pos ) 
				ls_fert    = Mid(a_where, ll_pos, ll_posfin - ll_pos - 2)
				dw_1.SetItem(1,"fert", ls_fert)
			End If			 
	 	END IF
		// ------------------------------------------------------------------------
		ll_pos=pos(ls_original,"where")
		
		If ll_pos>0 Then
			ls_sin_where=Left(ls_original, ll_pos -1)
		Else
			ls_sin_where=ls_original
		End If
		
		ls_modString="DataWindow.Table.Select='" &
			+ ls_sin_where +" where "+ a_where + "'"
	Else
//////////////////////////////////////////////////////////////////////////
// En este caso se coloca nuevamente el objeto para evitar problemas si 
// buscan varias veces, el where se relaciona con un and
//////////////////////////////////////////////////////////////////////////
		
//		dw_consulta.dataobject="d_cons_muestra_ref"
//		dw_consulta.SetTransObject(n_cst_application.itr_appl)
		
		ls_original = is_select 
		ls_inicial  = ls_original
	
		// ------------------------------------------------------------------------
		ll_pos = Pos(ls_original, "WHERE")
			
		If ll_pos > 0 Then
			ls_where    = Mid(ls_original, ll_pos, len(ls_original) )
			ls_original = Mid(ls_original, 1, ll_pos - 1 )
			
			ll_pos = pos(a_where,"dt_muestras_fert")
			
			IF Not IsNull(ll_pos) AND ll_pos > 0 THEN
				ls_original = ls_original + ",  dt_muestras_fert ~r~n"
				ls_original = ls_original + ls_where
				ll_pos = pos(a_where,"co_fert like") 
				If ll_pos>0 Then
					ll_pos    = ll_pos + 16 
					ll_posfin = pos(a_where, "'", ll_pos ) 
					ls_fert    = Mid(a_where, ll_pos, ll_posfin - ll_pos - 2)
					dw_1.SetItem(1,"fert", ls_fert)
				END IF	
			ELSE
				ls_original = ls_original + "~r~n"+ ls_where
			END IF
		ELSE
			ls_original = ls_original + "~r~n"+ ls_where
		END IF
		// ------------------------------------------------------------------------

		ls_modString="DataWindow.Table.Select='" &
			+ ls_original +" and "+ a_where + "'"		
	End If
	//Messagebox('Var','ls_modString='+ls_modString+'~n')
	dw_consulta.Modify(ls_modString)
End If


il_fila=0
//messagebox('info',dw_consulta.Describe("DataWindow.Table.Select"))
If dw_consulta.Retrieve()>=1 Then
	of_filaSel(1)
Else
	MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','No se encontraron registros de muestras para el criterio buscado',Information!)
End If

dw_consulta.Modify("DataWindow.Table.Select='"+ls_inicial+"'")
dw_consulta.SetFocus()

Return 1
end function

on w_opc_muestra.create
int iCurrent
call super::create
this.cbx_buscar_ref=create cbx_buscar_ref
this.cb_buscar=create cb_buscar
this.dw_1=create dw_1
this.cb_aceptar=create cb_aceptar
this.cb_1=create cb_1
this.gb_1=create gb_1
this.dw_consulta=create dw_consulta
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_buscar_ref
this.Control[iCurrent+2]=this.cb_buscar
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.cb_aceptar
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.gb_1
this.Control[iCurrent+7]=this.dw_consulta
this.Control[iCurrent+8]=this.gb_2
end on

on w_opc_muestra.destroy
call super::destroy
destroy(this.cbx_buscar_ref)
destroy(this.cb_buscar)
destroy(this.dw_1)
destroy(this.cb_aceptar)
destroy(this.cb_1)
destroy(this.gb_1)
destroy(this.dw_consulta)
destroy(this.gb_2)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 30 de Enero de 2003 HORA 09:31:28:843
// 
// Asigno por defecto la fabrica de la aplicaci$$HEX1$$f300$$ENDHEX$$n
//////////////////////////////////////////////////////////////////////////


il_fabrica=n_cst_application.ii_fabrica

dw_1.InsertRow(0)

dw_consulta.SetTransObject(n_cst_application.itr_appl)

is_select = dw_consulta.Describe("DataWindow.Table.Select")
is_where  = Message.StringParm

If IsNull(is_where) then is_where=""

If len(is_where)>0 Then
	//of_recuperar(is_where)
Else
	//dw_1.SetItem(1,"fabrica",il_fabrica)
End If

If n_cst_application.il_fabMue<>0 then
//	dw_1.SetItem(1,"fabrica",n_cst_application.il_fabMue)
//	dw_1.SetItem(1,"linea",n_cst_application.il_lineaMue)
//	dw_1.SetItem(1,"muestra",n_cst_application.il_muestra)
End If

/*
* =============================================================================
* MODIFICADO: Julio 29 de 2009 - ohlondon
* -----------------------------------------------------------------------------
* Se filtra el grupo de tipo de producto con el tipo de producto seleccionado. 
* =============================================================================
*/
datawindowchild ldwc_grupoprod
 
dw_1.GetChild("co_grupoprod_1", ldwc_grupoprod)

ldwc_grupoprod.SetTransObject(n_cst_application.itr_appl)
ldwc_grupoprod.Retrieve(-1)
end event

type cbx_buscar_ref from checkbox within w_opc_muestra
integer x = 82
integer y = 1528
integer width = 658
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar por referencia"
end type

event clicked;If This.Checked Then
	dw_1.dataobject="d_ext_muestra_ref"
	dw_consulta.dataobject="d_cons_muestra_ref"
Else
	dw_1.dataobject="d_ext_muestra"
	dw_consulta.dataobject="d_cons_muestra"
End If

dw_1.InsertRow(0)
dw_1.SetFocus()
dw_consulta.SetTransObject(n_cst_application.itr_appl)

is_select = dw_consulta.Describe("DataWindow.Table.Select")

end event

type cb_buscar from u_cb_base within w_opc_muestra
integer x = 960
integer y = 1516
integer taborder = 20
string text = "&Buscar"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 17 de Octubre de 2002 HORA 08:31:51:140
// 
// Arma la sentencia where
//////////////////////////////////////////////////////////////////////////
If dw_1.AcceptText()<>1 Then
	//MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	This.Event Losefocus()
	dw_1.SetFocus()
	Return
End If
//ojo el where sera opcional puede ser and

String ls_cad
String ls_select
String ls_fert
Long ll_pos, ll_ini	

is_where="("

If cbx_buscar_ref.Checked Then
	
	ls_cad=String(dw_1.GetItemNumber(1,"fabrica"))
	
	If Not IsNull(ls_cad) Then
		is_where+="dt_muestras_ref.co_fabrica_ref="+ls_cad+" and "
	End If
	
	ls_cad=String(dw_1.GetItemNumber(1,"linea"))
	
	If Not IsNull(ls_cad) Then
		is_where+="dt_muestras_ref.co_linea_ref="+ls_cad+" and "
	End If
	
	ls_cad=String(dw_1.GetItemNumber(1,"referencia"))
	
	If Not IsNull(ls_cad) Then
		is_where+="dt_muestras_ref.co_referencia_ref="+ls_cad+" and "
	End If

	ls_cad=String(dw_1.GetItemNumber(1,"muestra"))
	
	If Not IsNull(ls_cad) Then
		is_where+="m_muestras.co_muestra="+ls_cad+" and "
	End If	

	/*
	* =============================================================================
	* MODIFICADO: Diciembre 05 de 2011 - ohlondon
	* -----------------------------------------------------------------------------
	* Si selecciona Fert se hace el filtro
	* =============================================================================
	*/
	
	ls_fert=dw_1.GetItemString(1,"fert")
	If Not IsNull(ls_fert) Then	
		is_where += " ( m_muestras.co_fabrica      = dt_muestras_fert.co_fabrica ) and  ~r~n"+&
						" ( m_muestras.co_linea        = dt_muestras_fert.co_linea ) and ~r~n"  +&
						" ( m_muestras.co_muestra      = dt_muestras_fert.co_muestra ) and ~r~n"  
		is_where += "dt_muestras_fert.co_fert like ~~'%"+Trim(ls_fert)+"%~~' and "
	End If

Else  //del If cbx_buscar_ref.Checked Then
	
	ls_cad=String(dw_1.GetItemNumber(1,"fabrica"))
	
	If Not IsNull(ls_cad) Then
		is_where+="m_muestras.co_fabrica="+ls_cad+" and "
	End If
	
	ls_cad=String(dw_1.GetItemNumber(1,"linea"))
	
	If Not IsNull(ls_cad) Then
		is_where+="m_muestras.co_linea="+ls_cad+" and "
	End If
	
	ls_cad=String(dw_1.GetItemNumber(1,"muestra"))
	
	If Not IsNull(ls_cad) Then
		is_where+="m_muestras.co_muestra="+ls_cad+" and "
	End If	
	
	ls_cad=dw_1.GetItemString(1,"descripcion")
	
	If Not IsNull(ls_cad) Then
		is_where+="Upper(de_muestra) like ~~'%"+Upper(ls_cad)+"%~~' and "
	End If        
	
	
	ls_cad=String(dw_1.GetItemNumber(1,"co_cliente"))
	
	If Not IsNull(ls_cad) Then
		is_where+="co_cliente="+ls_cad+" and "
	End If
	
	ls_cad=String(dw_1.GetItemNumber(1,"co_sucursal"))
	
	If Not IsNull(ls_cad) Then
		is_where+="co_sucursal="+ls_cad+" and "
	End If
	
	
	ls_cad=dw_1.GetItemString(1,"orden_coleccion")
	
	If Not IsNull(ls_cad) Then
		is_where+="Upper(de_coleccion) like ~~'%"+Upper(ls_cad)+"%~~' and "
	End If
	
	ls_cad=dw_1.GetItemString(1,"co_diseno")
	
	If Not IsNull(ls_cad) Then
		is_where+="Upper(co_diseno_muestra) like ~~'%"+Upper(ls_cad)+"%~~' and "
	End If
	
	ls_cad=String(dw_1.GetItemNumber(1,"co_grupo_vta"))
	
	If Not IsNull(ls_cad) Then
		is_where+="co_grupo_vta="+ls_cad+" and "
	End If
	
	ls_cad=String(dw_1.GetItemNumber(1,"co_tipoprod"))
	
	If Not IsNull(ls_cad) Then
		is_where+="m_muestras.co_tipoprod="+ls_cad+" and "
	End If
	
	/*  GAC  */
	ls_cad=String(dw_1.GetItemNumber(1,"co_talla"))
	
	If Not IsNull(ls_cad) Then
		is_where+="dt_muestras.co_talla="+ls_cad+" and "
	End If
	
	ls_cad=String(dw_1.GetItemNumber(1,"co_tipo_tejido"))
	
	If Not IsNull(ls_cad) Then
		is_where+="co_tipo_tejido="+ls_cad+" and "
	End If
	
	
	ls_cad=String(dw_1.GetItemNumber(1,"co_grupo_tlla"))
	
	If Not IsNull(ls_cad) Then
		is_where+="co_grupo_tlla="+ls_cad+" and "
	End If
	
	ls_cad=String(dw_1.GetItemNumber(1,"nu_solicitud"))
	
	If Not IsNull(ls_cad) Then
		is_where+="nu_solicitud="+ls_cad+" and "
	End If
	
	ls_cad=dw_1.GetItemString(1,"co_ref_exp")
	
	If Not IsNull(ls_cad) Then
		is_where+="Upper(co_ref_exp) like ~~'%"+Upper(ls_cad)+"%~~' and "
	End If
	
	/*
	* =============================================================================
	* MODIFICADO: Julio 29 de 2009 - ohlondon
	* -----------------------------------------------------------------------------
	* Si selecciona el Grupo tipo de producto se agrega el filtro
	* =============================================================================
	*/
	ls_cad=String(dw_1.GetItemNumber(1,"co_grupoprod"))
	
	If Not IsNull(ls_cad) Then
		is_where+="co_grupoprod = "+ls_cad+" and "
	End If
	
	is_where += "m_muestras.co_fabrica = dt_muestras.co_fabrica and "
	is_where += "m_muestras.co_linea   = dt_muestras.co_linea and "
	is_where += "m_muestras.co_muestra = dt_muestras.co_muestra and "
	
	ls_fert=dw_1.GetItemString(1,"fert")	
	If Not IsNull(ls_fert) Then	
		is_where += " ( dt_muestras.co_fabrica      = dt_muestras_fert.co_fabrica ) and  ~r~n"+&
						" ( dt_muestras.co_linea        = dt_muestras_fert.co_linea ) and ~r~n"  +&
						" ( dt_muestras.co_muestra      = dt_muestras_fert.co_muestra ) and ~r~n" +&  
						" ( dt_muestras.co_talla        = dt_muestras_fert.co_talla )  AND  ~r~n"
		is_where += "dt_muestras_fert.co_fert like ~~'%"+Trim(ls_fert)+"%~~' and "
	
	End If

End If //del if checked...



is_where += "m_muestras.co_tipoprod = m_usuario_tipoprod.co_tipoprod and "
is_where += "m_usuario_tipoprod.co_usuario = ~~'"+n_cst_application.is_user+"~~' and "
 

If Right(is_where,4)="and " Then
	is_where=left(is_where, len(is_where) - 4)+")"
	
End If

of_recuperar(is_where)



















end event

type dw_1 from u_dw_application within w_opc_muestra
event ue_accepttext ( )
integer x = 55
integer y = 72
integer width = 1198
integer height = 1436
string dataobject = "d_ext_muestra"
boolean vscrollbar = false
end type

event ue_accepttext();If ib_dw_has_focus = FALSE Then
	dw_1.AcceptText()
End If


end event

event getfocus;//////////////////////////////////////////////////////////////////////////
// OverWrite
// 
//////////////////////////////////////////////////////////////////////////

end event

event itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 30 de Enero de 2003 HORA 09:22:54:906
// 
// 
//////////////////////////////////////////////////////////////////////////
n_cst_comun lo_comun
datawindowchild ldwc_grupoprod

long ll_dato,ll_res
String ls_coltype

If dwo.name="fabrica" Then
	il_fabrica=Long(Data)
End If

If dwo.name="co_grupo_vta" Then
	ll_dato=Long(Data)
	ll_res=lo_comun.of_nombreGrupoVta(il_fabrica,ll_dato,n_cst_application.itr_appl)
	If ll_res<>1 then
		MessageBox("Advertencia!","Grupo de venta no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)		
		Return 2
	End If
	SetItem(1,"de_grupo_vta",lo_comun.of_getString(1))	

End If

If dwo.name="co_tipoprod" Then
	ll_dato=Long(Data)
	ll_res=lo_comun.of_nombreTipoProd(ll_dato,n_cst_application.itr_appl)
	If ll_res<>1 then
		MessageBox("Advertencia!","Tipo de producto no v$$HEX1$$e100$$ENDHEX$$lido o no permitido para el usuario "+n_cst_application.is_user+".",StopSign!)
		Return 2
	End If
	SetItem(1,"de_tipoprod",lo_comun.of_getString(1))	
	il_tipoProd=ll_dato

	/*
	* =============================================================================
	* MODIFICADO: Julio 29 de 2009 - ohlondon
	* -----------------------------------------------------------------------------
	* Se filtra el grupo de tipo de producto con el tipo de producto seleccionado. 
	* =============================================================================
	*/
	 
	This.GetChild("co_grupoprod_1", ldwc_grupoprod)
	
	ldwc_grupoprod.SetTransObject(n_cst_application.itr_appl)
	ll_res = ldwc_grupoprod.Retrieve(il_tipoProd)
	IF ll_res = 0 THEN
		SetNull(ll_dato)
		This.SetItem(1,"co_grupoprod",ll_dato)
	END IF
End If

IF dwo.name="co_grupoprod" THEN
	il_tipoProd = This.GetItemNumber(1,"co_tipoprod")
	
	IF IsNull(il_tipoProd) THEN il_tipoProd = -1
	
	ll_dato=Long(Data)
	ll_res=lo_comun.of_nombregrupotipoprod(ll_dato, il_tipoProd, n_cst_application.itr_appl)
	If ll_res<>1 then
		MessageBox("Advertencia!","El Grupo de Tipo de producto no es v$$HEX1$$e100$$ENDHEX$$lido o no permitido para el usuario "+n_cst_application.is_user+".",StopSign!)
		Return 2
	End If
	
   //	------------------------
//	
//	GetChild("co_grupoprod_1", ldwc_grupoprod)
//	
//	ldwc_grupoprod.SetTransObject(n_cst_application.itr_appl)
//	ll_res = ldwc_grupoprod.Retrieve(il_tipoProd)
//	IF ll_res = 0 THEN
//		MessageBox("Advertencia!","Para el Tipo de producto no existen Grupos por lo tanto este par$$HEX1$$e100$$ENDHEX$$metro no se incluira en el filtro.")
//		SetNull(ll_dato)
//		SetItem(1,"co_grupoprod",ll_dato)
//		Return 2
//	END IF
END IF

If dwo.name="co_tipo_tejido" Then
	ll_dato=Long(Data)
	ll_res=lo_comun.of_nombreTipoTejido(il_tipoProd,ll_dato,n_cst_application.itr_appl)
	If ll_res<>1 then
		MessageBox("Advertencia!","Tipo de tejido no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)

		Return 2
	End If
	SetItem(1,"de_tipo_tejido",lo_comun.of_getString(1))	
End If

//co_grupo_tlla

If dwo.name="co_grupo_tlla" Then
	ll_dato=Long(Data)
	ll_res=lo_comun.of_nombreGrupoTalla(ll_dato,n_cst_application.itr_appl)
	If ll_res<>1 then
		MessageBox("Advertencia!","Grupo de talla no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_grupo_talla",lo_comun.of_getString(1))	
End If
//-------------------------------------------------------------------------------
ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	If Trim(Data)='' AND NOt IsNull(Data) Then
		MessageBox('Advertencia','Texto del campo no v$$HEX1$$e100$$ENDHEX$$lido.S$$HEX1$$f300$$ENDHEX$$lo hay espacios en blanco',StopSign!)
		Return 1
	End If
	If This.of_validarcadena(Data)<>1 Then 
		Return 1
	End If
End If
//-------------------------------------------------------------------------------
end event

event itemerror;Integer li_null
String ls_coltype

ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	Return 1
End If

If Long(Data)=0 Then
		SetNull(li_null)
		This.SetItem(row,String(dwo.name),li_null)		
		If dwo.name='co_grupo_vta' Then
			SetItem(row,'de_grupo_vta','')
		ElseIf dwo.name='co_tipoprod' Then
			SetItem(row,'de_tipoprod','')
		ElseIf dwo.name='co_tipo_tejido' Then
			SetItem(row,'de_tipo_tejido','')
		ElseIf dwo.name='co_grupo_tlla' Then
			SetItem(row,'de_grupo_tlla','')
		End If
		Return 3
End If	

//ib_errordw=False



end event

event losefocus;call super::losefocus;//ib_dw_has_focus = FALSE
//dw_1.Event  Post ue_acceptText( )
end event

type cb_aceptar from commandbutton within w_opc_muestra
integer x = 1385
integer y = 1636
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;n_cst_param lou_param

//If dw_1.AcceptText()<>1 Then
//	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
//	Return
//End If

If il_fila<=0 then
	MessageBox("Advertencia!","Debe seleccionar una muestra.",StopSign!)
	Return
End If


lou_param.il_vector[1] = dw_consulta.GetItemNumber(il_fila,"co_fabrica")
lou_param.il_vector[2] = dw_consulta.GetItemNumber(il_fila,"co_linea")
lou_param.il_vector[3] = dw_consulta.GetItemNumber(il_fila,"co_muestra")

If cbx_buscar_ref.checked Then
	lou_param.is_vector[1]=""
Else
	lou_param.is_vector[1]=is_where
End If

n_cst_application.il_fabMue=dw_consulta.GetItemNumber(il_fila,"co_fabrica")
n_cst_application.il_lineaMue=dw_consulta.GetItemNumber(il_fila,"co_linea")
n_cst_application.il_muestra=dw_consulta.GetItemNumber(il_fila,"co_muestra")

CloseWithReturn(Parent,lou_param)
end event

type cb_1 from commandbutton within w_opc_muestra
integer x = 1737
integer y = 1636
integer width = 343
integer height = 100
integer taborder = 50
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

type gb_1 from groupbox within w_opc_muestra
integer x = 37
integer y = 8
integer width = 1257
integer height = 1620
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Datos de la muestra"
end type

type dw_consulta from u_dw_application within w_opc_muestra
integer x = 1358
integer y = 72
integer width = 2103
integer height = 1524
integer taborder = 40
string dataobject = "d_cons_muestra"
boolean hscrollbar = true
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 17 de Octubre de 2002 HORA 08:46:22:687
// 
// OverWrite
//////////////////////////////////////////////////////////////////////////

end event

event clicked;call super::clicked;If Row=0 Then Return

of_filaSel(Row)


end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 20 de Enero de 2003 HORA 16:24:47:484
// 
// Para no permitir editar
//////////////////////////////////////////////////////////////////////////

Return 2
end event

event itemfocuschanged;call super::itemfocuschanged;If Row=0 Then Return

of_filaSel(Row)

end event

event doubleclicked;call super::doubleclicked;If Row=0 Then Return

of_filaSel(Row)


cb_aceptar.Trigger event Clicked()
end event

type gb_2 from u_gb_base within w_opc_muestra
integer x = 1326
integer y = 8
integer width = 2171
integer height = 1616
integer taborder = 0
string text = "Muestras "
end type

