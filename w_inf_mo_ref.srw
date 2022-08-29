HA$PBExportHeader$w_inf_mo_ref.srw
$PBExportComments$Informe de mano de obra por referencia
forward
global type w_inf_mo_ref from w_report
end type
type dw_1 from u_dw_application within w_inf_mo_ref
end type
type gb_1 from groupbox within w_inf_mo_ref
end type
end forward

global type w_inf_mo_ref from w_report
integer width = 3648
integer height = 2108
string title = "Mano de obra de referencia"
windowstate windowstate = maximized!
dw_1 dw_1
gb_1 gb_1
end type
global w_inf_mo_ref w_inf_mo_ref

on w_inf_mo_ref.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.gb_1
end on

on w_inf_mo_ref.destroy
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
	dw_1.SetItem(1,"co_fabrica",lo_param.il_vector[1])
	dw_1.SetItem(1,"co_linea",lo_param.il_vector[2])
	dw_1.SetItem(1,"co_referencia",lo_param.il_vector[3])
	
	ll_res=lo_comun.of_nombreReferencia(lo_param.il_vector[1],&
	                                    lo_param.il_vector[2],&
													lo_param.il_vector[3],&
													n_cst_application.itr_appl)

	If ll_Res=1 Then
		dw_1.SetItem(1,"de_referencia",lo_comun.of_getString(1))
	End If
	
	Trigger Event ue_find()
End If




end event

event resize;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 22 de Septiembre de 2003 HORA 14:56:56:907
// 
// OverWrite!
//////////////////////////////////////////////////////////////////////////

end event

event ue_find;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 22 de Septiembre de 2003 HORA 15:18:19:602
// 
// Se recuperan los datos directamente
//////////////////////////////////////////////////////////////////////////

If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If

long ll_fabrica,ll_linea,ll_referencia

ll_fabrica=dw_1.GetItemNumber(1,"co_fabrica")
ll_linea=dw_1.GetItemNumber(1,"co_linea")
ll_referencia=dw_1.GetItemNumber(1,"co_referencia")



dw_report.Retrieve(ll_fabrica,/**fab*/& 
                   ll_linea,/**lin*/& 
						 ll_referencia) //referencia
						 
If dw_report.RowCount()<=0 Then
//////////////////////////////////////////////////////////////////////////
// El rolback es para liberar la transaccion
// 
//////////////////////////////////////////////////////////////////////////
	
	RollBack using n_cst_application.itr_appl;
	MessageBox("Advertencia!","No se encontraron datos.",StopSign!)
	Close(This)
	Return	
End If
//////////////////////////////////////////////////////////////////////////
// Libero la transaccion
// 
//////////////////////////////////////////////////////////////////////////

RollBack using n_cst_application.itr_appl;
//////////////////////////////////////////////////////////////////////////
// Asigno los datos del usuario y el nombre de la referencia
// 
//////////////////////////////////////////////////////////////////////////

dw_report.modify("usuario.text='"+String(n_cst_application.is_user)+"'")

dw_report.modify("referencia_de.text='"+dw_report.GetItemString(1,"de_ref_obs")+"'")


end event

type dw_report from w_report`dw_report within w_inf_mo_ref
integer x = 32
integer y = 256
integer width = 3520
integer height = 1572
string dataobject = "d_inf_mo_ref"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from u_dw_application within w_inf_mo_ref
integer x = 69
integer y = 64
integer width = 2395
integer height = 152
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_ext_fab_lin_ref"
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

type gb_1 from groupbox within w_inf_mo_ref
integer x = 46
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
borderstyle borderstyle = stylelowered!
end type

