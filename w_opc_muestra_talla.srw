HA$PBExportHeader$w_opc_muestra_talla.srw
$PBExportComments$Para buscar las muestras, hasta la talla
forward
global type w_opc_muestra_talla from w_response
end type
type cb_buscar from u_cb_base within w_opc_muestra_talla
end type
type dw_1 from u_dw_application within w_opc_muestra_talla
end type
type cb_aceptar from commandbutton within w_opc_muestra_talla
end type
type cb_1 from commandbutton within w_opc_muestra_talla
end type
type gb_1 from groupbox within w_opc_muestra_talla
end type
type dw_consulta from u_dw_application within w_opc_muestra_talla
end type
type gb_2 from u_gb_base within w_opc_muestra_talla
end type
end forward

global type w_opc_muestra_talla from w_response
integer x = 101
integer y = 52
integer width = 3547
integer height = 1676
string title = "Consulta de muestras "
cb_buscar cb_buscar
dw_1 dw_1
cb_aceptar cb_aceptar
cb_1 cb_1
gb_1 gb_1
dw_consulta dw_consulta
gb_2 gb_2
end type
global w_opc_muestra_talla w_opc_muestra_talla

type variables
long il_fila=0
String is_where

long il_fabrica,il_tipoProd
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

public function integer of_recuperar (string a_where);String ls_sel1,ls_modString
long ll_pos

//dt_muestras.co_muestra = m_muestras.co_muestra )	
If Right(a_where,1)=")" Then	
	ls_sel1=dw_consulta.Describe("DataWindow.Table.Select")
	
	ll_pos=pos(ls_sel1,"dt_muestras.co_muestra = m_muestras.co_muestra )")
	
	If ll_pos>0 Then
		ls_Sel1=Left(ls_sel1, ll_pos -1)
	End If
	
	ls_modString="DataWindow.Table.Select='" &
		+ ls_sel1 + a_where + "'"
	//Messagebox('Var','ls_modString='+ls_modString+'~n')
	dw_consulta.Modify(ls_modString)
End If
il_fila=0

If dw_consulta.Retrieve(n_cst_application.is_user)=1 Then
	of_filaSel(1)
End If

dw_consulta.SetFocus()

Return 1
end function

on w_opc_muestra_talla.create
int iCurrent
call super::create
this.cb_buscar=create cb_buscar
this.dw_1=create dw_1
this.cb_aceptar=create cb_aceptar
this.cb_1=create cb_1
this.gb_1=create gb_1
this.dw_consulta=create dw_consulta
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_buscar
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.cb_aceptar
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.gb_1
this.Control[iCurrent+6]=this.dw_consulta
this.Control[iCurrent+7]=this.gb_2
end on

on w_opc_muestra_talla.destroy
call super::destroy
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


is_where=Message.StringParm

If IsNull(is_where) then is_where=""

If len(is_where)>0 Then
	of_recuperar(is_where)
Else
	dw_1.SetItem(1,"fabrica",il_fabrica)
End If

If n_cst_application.il_fabMue<>0 then
	dw_1.SetItem(1,"fabrica",n_cst_application.il_fabMue)
	dw_1.SetItem(1,"linea",n_cst_application.il_lineaMue)
	dw_1.SetItem(1,"muestra",n_cst_application.il_muestra)
End If

end event

type cb_buscar from u_cb_base within w_opc_muestra_talla
integer x = 494
integer y = 1232
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
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If


//dt_muestras.co_muestra = m_muestras.co_muestra )
is_where="dt_muestras.co_muestra = m_muestras.co_muestra ) and ("
String ls_cad

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
	is_where+="m_muestras.de_muestra like ~~'%"+ls_cad+"%~~' and "
End If        


ls_cad=String(dw_1.GetItemNumber(1,"co_cliente"))

If Not IsNull(ls_cad) Then
	is_where+="m_muestras.co_cliente="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"co_sucursal"))

If Not IsNull(ls_cad) Then
	is_where+="m_muestras.co_sucursal="+ls_cad+" and "
End If


ls_cad=dw_1.GetItemString(1,"orden_coleccion")

If Not IsNull(ls_cad) Then
	is_where+="m_muestras.de_coleccion like ~~'%"+ls_cad+"%~~' and "
End If

ls_cad=dw_1.GetItemString(1,"co_diseno")

If Not IsNull(ls_cad) Then
	is_where+="m_muestras.co_diseno_muestra like ~~'%"+ls_cad+"%~~' and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"co_grupo_vta"))

If Not IsNull(ls_cad) Then
	is_where+="m_muestras.co_grupo_vta="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"co_tipoprod"))

If Not IsNull(ls_cad) Then
	is_where+="m_muestras.co_tipoprod="+ls_cad+" and "
End If


ls_cad=String(dw_1.GetItemNumber(1,"co_tipo_tejido"))

If Not IsNull(ls_cad) Then
	is_where+="m_muestras.co_tipo_tejido="+ls_cad+" and "
End If


ls_cad=String(dw_1.GetItemNumber(1,"co_grupo_tlla"))

If Not IsNull(ls_cad) Then
	is_where+="m_muestras.co_grupo_tlla="+ls_cad+" and "
End If

If Right(is_where,4)="and " Then
	is_where=left(is_where, len(is_where) - 4)+")"
	
End If

of_recuperar(is_where)



















end event

type dw_1 from u_dw_application within w_opc_muestra_talla
integer x = 55
integer y = 88
integer width = 1230
integer height = 1128
string dataobject = "d_ext_muestra_talla"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// OverWrite
// 
//////////////////////////////////////////////////////////////////////////

end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 30 de Enero de 2003 HORA 09:22:54:906
// 
// 
//////////////////////////////////////////////////////////////////////////
n_cst_comun lo_comun
long ll_dato,ll_res

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
		MessageBox("Advertencia!","Tipo de producto no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_tipoprod",lo_comun.of_getString(1))	
	il_tipoProd=ll_dato

End If


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

end event

type cb_aceptar from commandbutton within w_opc_muestra_talla
integer x = 1499
integer y = 1392
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

If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If

If il_fila<=0 then
	MessageBox("Advertencia!","Debe seleccionar una muestra.",StopSign!)
	Return
End If


lou_param.il_vector[1] = dw_consulta.GetItemNumber(il_fila,"co_fabrica")
lou_param.il_vector[2] = dw_consulta.GetItemNumber(il_fila,"co_linea")
lou_param.il_vector[3] = dw_consulta.GetItemNumber(il_fila,"co_muestra")
lou_param.il_vector[4] = dw_consulta.GetItemNumber(il_fila,"co_talla")

lou_param.is_vector[1]=is_where

n_cst_application.il_fabMue=dw_consulta.GetItemNumber(il_fila,"co_fabrica")
n_cst_application.il_lineaMue=dw_consulta.GetItemNumber(il_fila,"co_linea")
n_cst_application.il_muestra=dw_consulta.GetItemNumber(il_fila,"co_muestra")


CloseWithReturn(Parent,lou_param)
end event

type cb_1 from commandbutton within w_opc_muestra_talla
integer x = 1851
integer y = 1392
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

type gb_1 from groupbox within w_opc_muestra_talla
integer x = 37
integer y = 4
integer width = 1262
integer height = 1344
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

type dw_consulta from u_dw_application within w_opc_muestra_talla
integer x = 1358
integer y = 76
integer width = 2094
integer height = 1212
integer taborder = 40
string dataobject = "d_cons_muestra_talla"
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

type gb_2 from u_gb_base within w_opc_muestra_talla
integer x = 1326
integer y = 8
integer width = 2167
integer height = 1340
integer taborder = 0
string text = "Muestras "
end type

