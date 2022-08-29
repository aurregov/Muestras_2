HA$PBExportHeader$w_inf_mo_mue.srw
$PBExportComments$Informe de mano de obra por referencia
forward
global type w_inf_mo_mue from w_report
end type
type dw_1 from u_dw_application within w_inf_mo_mue
end type
type gb_1 from groupbox within w_inf_mo_mue
end type
end forward

global type w_inf_mo_mue from w_report
integer width = 3648
integer height = 2108
string title = "Mano de obra de referencia"
windowstate windowstate = maximized!
dw_1 dw_1
gb_1 gb_1
end type
global w_inf_mo_mue w_inf_mo_mue

type variables
Long il_fabrica, il_linea, il_muestra, il_talla,il_grupo_tlla, il_tipoprod, il_fabrica_ref,&
     il_linea_ref, il_cliente, il_sucursal, il_tipo_tejido, il_referencia

String is_desarrollador, is_tipo_muestra, is_de_muestra

end variables

on w_inf_mo_mue.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.gb_1
end on

on w_inf_mo_mue.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 22 de Septiembre de 2003 HORA 15:15:04:181
// 
// 
//////////////////////////////////////////////////////////////////////////
long ll_res

n_cst_param lo_param
n_cst_comun lo_comun


lo_param=Message.PowerObjectParm


dw_1.InsertRow(0)

dw_report.SetTransObject(n_cst_application.itr_appl)

of_setDataWindow(dw_report)

If IsValid(lo_param) Then

	il_fabrica     = lo_param.il_vector[1]
	il_linea       = lo_param.il_vector[2]
	il_muestra     = lo_param.il_vector[3]
	il_talla       = lo_param.il_vector[4]
	il_grupo_tlla  = lo_param.il_vector[5]
	il_tipoprod    = lo_param.il_vector[6]
	il_fabrica_ref = lo_param.il_vector[7]
   il_linea_ref   = lo_param.il_vector[8]
	il_cliente     = lo_param.il_vector[9]
	il_sucursal    = lo_param.il_vector[10]
	il_tipo_tejido = lo_param.il_vector[11]
	il_referencia  = lo_param.il_vector[12]
	
	is_desarrollador = lo_param.is_vector[1]
	is_tipo_muestra  = lo_param.is_vector[2]
	is_de_muestra    = lo_param.is_vector[3]
	
	dw_1.SetItem(1,"co_fabrica", il_fabrica)
	dw_1.SetItem(1,"co_linea", il_linea)
	dw_1.SetItem(1,"co_muestra", il_muestra)
	dw_1.SetItem(1,"de_muestra", is_de_muestra)
	
	Trigger Event ue_find()
End If




end event

event resize;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 22 de Septiembre de 2003 HORA 14:56:56:907
// 
// OverWrite!
//////////////////////////////////////////////////////////////////////////

dw_report.SetRedraw(False)
dw_report.width  = newwidth - 80
dw_report.height = newheight - 310 
dw_report.SetRedraw(True)

end event

event ue_find;//////////////////////////////////////////////////////////////////////////
String 	ls_cliente, ls_tipo_tejido, ls_desarrollador, ls_talla, ls_ref
Long 		ll_res
n_cst_comun lo_comun

If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If

dw_report.Retrieve(il_fabrica,& 
                   il_linea,& 
						 il_muestra)
						 
ls_ref = String(il_fabrica_ref)+" "+String(il_linea_ref)+" "+String(il_referencia)

IF il_referencia = 0 THEN
	dw_report.modify("referencia.text='No Asignada'")
ELSE
	dw_report.modify("referencia.text='"+ls_ref +"'")
END IF

dw_report.modify("de_muestra.text='"+is_de_muestra +"'")

ll_res = lo_comun.of_nombretalla( il_grupo_tlla, il_talla , n_cst_application.itr_appl)
If ll_res=1 Then
	ls_talla = "("+String(il_talla)+") "+lo_comun.of_getstring(1)
Else
	ls_talla = "("+String(il_talla)+") "
End If

dw_report.modify("de_talla.text='"+ls_talla +"'")

ll_res=lo_comun.of_nombrecliente( il_cliente, il_sucursal, is_tipo_muestra,n_cst_application.itr_appl)

If ll_res = 1 Then
	ls_cliente = "("+String(il_cliente)+"-"+String(il_sucursal)+") "+lo_comun.of_getstring(1)
Else
	ls_cliente = "("+String(il_cliente)+"-"+String(il_sucursal)+") "
End If

dw_report.modify("cliente.text='"+ls_cliente+"'")

ll_res = lo_comun.of_nombredesarrollador(is_desarrollador,n_cst_application.itr_appl)

If ll_res=1 Then
	ls_desarrollador=lo_comun.of_getstring(1)
Else
	ls_desarrollador=" "
End If

dw_report.modify("desarrollador.text='"+ls_desarrollador+"'")


ll_res = lo_comun.of_nombrettejido(il_tipo_tejido,n_cst_application.itr_appl)

If ll_res=1 Then
	ls_tipo_tejido = "("+String(il_tipo_tejido)+") "+lo_comun.of_getstring(1)
Else
	ls_tipo_tejido = "("+String(il_tipo_tejido)+") "
End If

dw_report.modify("de_tejido.text='"+ls_tipo_tejido+"'")



dw_report.modify("usuario.text='"+String(n_cst_application.is_user)+"'")

dw_report.SetRedraw(TRUE)


end event

type dw_report from w_report`dw_report within w_inf_mo_mue
integer x = 32
integer y = 256
integer width = 3520
integer height = 1572
string dataobject = "d_inf_mo_mue"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from u_dw_application within w_inf_mo_mue
integer x = 69
integer y = 64
integer width = 2395
integer height = 152
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_ext_fab_lin_mue"
boolean vscrollbar = false
end type

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 22 de Septiembre de 2003 HORA 15:25:31:990
// 
// 
//////////////////////////////////////////////////////////////////////////
long ll_fabrica,ll_linea,ll_referencia,ll_res

ll_fabrica=GetItemNumber(1,"co_fabrica")
ll_linea=GetItemNumber(1,"co_linea")
ll_referencia=GetItemNumber(1,"co_referencia")

If dwo.name="co_fabrica" Then
	ll_fabrica=Long(data)
ElseIf dwo.name="co_linea" Then
	ll_linea=Long(data)
ElseIf dwo.name="co_referencia" Then
	ll_referencia=Long(data)	
End If

n_cst_comun lo_comun

ll_res=lo_comun.of_nombreReferencia(ll_fabrica,&
                                    ll_linea,&
												ll_referencia,&
												n_cst_application.itr_appl)
If ll_res=1 Then	
	SetItem(1,"de_referencia",lo_comun.of_getString(1))
Else
	SetItem(1,"de_referencia","")
End If
end event

event getfocus;call super::getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 22 de Septiembre de 2003 HORA 15:36:33:126
// 
// OverWrite!!
//////////////////////////////////////////////////////////////////////////

end event

type gb_1 from groupbox within w_inf_mo_mue
integer x = 32
integer y = 12
integer width = 2656
integer height = 228
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Referencia a consultar"
end type

