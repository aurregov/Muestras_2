HA$PBExportHeader$w_mu_soli_tinta.srw
$PBExportComments$Para el manejo de la materia prima
forward
global type w_mu_soli_tinta from w_response
end type
type cb_2 from commandbutton within w_mu_soli_tinta
end type
type cb_1 from commandbutton within w_mu_soli_tinta
end type
type dw_1 from u_dw_application within w_mu_soli_tinta
end type
type gb_1 from groupbox within w_mu_soli_tinta
end type
end forward

global type w_mu_soli_tinta from w_response
integer width = 3506
integer height = 936
string title = "Solicitud de tinta"
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_mu_soli_tinta w_mu_soli_tinta

forward prototypes
public function integer of_validar ()
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

on w_mu_soli_tinta.create
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

on w_mu_soli_tinta.destroy
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


n_cst_param_orden lo_param

lo_param=message.powerobjectParm

u_dw_application ldw

ldw=lo_param.idw_vector[1]

ldw.ShareData(dw_1)

dw_1.SetTransObject(n_cst_application.itr_appl)
end event

type cb_2 from commandbutton within w_mu_soli_tinta
integer x = 1705
integer y = 728
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

type cb_1 from commandbutton within w_mu_soli_tinta
integer x = 1262
integer y = 728
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


If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos, por favor verifique la informaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
	Return
End If

If Not dw_1.of_completedata() Then
	Return
End If

lo_param.idw_vector[1]=dw_1

CloseWithReturn(parent,lo_param)
end event

type dw_1 from u_dw_application within w_mu_soli_tinta
integer x = 114
integer y = 104
integer width = 3287
integer height = 580
string dataobject = "d_mu_soli_tinta"
boolean vscrollbar = false
boolean livescroll = false
end type

event doubleclicked;call super::doubleclicked;n_cst_param lo_param

If dwo.name="id_tinta" Then
	Open(w_tintas)
	lo_param=Message.PowerObjectParm
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
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
DataWindowChild ldwc_base

n_cst_comun lo_comun
Long ll_res,ll_dato,ll_codigo
//--------------------------------------------------

String ls_coltype
ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	If This.of_validarcadena(Data)<>1 Then 
		Return 2
	End If
End If

If dwo.name="id_base" Then
	This.GetChild('id_base',ldwc_base)
	SetItem(row,'de_base', ldwc_base.GetItemString(ldwc_base.GetRow(),'de_base'))
END IF

If dwo.name="id_tinta" Then
	ll_dato=Long(Data)
	ll_res=lo_comun.of_nombretinta(ll_dato,n_cst_application.itr_appl)
	If ll_res=1 then
		SetItem(row,"de_tinta",lo_comun.of_getString(1))
	Else
		MessageBox("Advertencia!","Dato no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2

	End If	
End If

If dwo.name="de_tinta" Then
	ll_codigo=GetItemNumber(row,"id_tinta")
	If Not IsNull(ll_codigo) Then
		MessageBox("Advertencia!","No se puede modificar la descripci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
		Return 2	
	End If
End If



end event

event getfocus;//
end event

type gb_1 from groupbox within w_mu_soli_tinta
integer x = 59
integer y = 56
integer width = 3406
integer height = 648
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Solicitud de tinta para Antideslizante"
end type

