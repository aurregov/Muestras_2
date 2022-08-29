HA$PBExportHeader$w_mu_m_actividad.srw
$PBExportComments$Para colocar un orden en las actividades que se realizan en el desarrollo de muestras
forward
global type w_mu_m_actividad from w_simple
end type
type cb_1 from commandbutton within w_mu_m_actividad
end type
end forward

global type w_mu_m_actividad from w_simple
integer width = 2203
integer height = 1324
string title = "Actividades"
cb_1 cb_1
end type
global w_mu_m_actividad w_mu_m_actividad

on w_mu_m_actividad.create
int iCurrent
call super::create
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
end on

on w_mu_m_actividad.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
end on

type dw_general from w_simple`dw_general within w_mu_m_actividad
integer width = 2053
string dataobject = "d_mu_m_actividad_mtto_tipoprod"
end type

event dw_general::itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// Se verifica que no se repica el c$$HEX1$$f300$$ENDHEX$$digo
// 
//////////////////////////////////////////////////////////////////////////
long ll_dato,ll_pos
If dwo.name="co_operacion" Then
	ll_dato=Long(Data)
	
	ll_pos=Find("co_operacion="+String(ll_dato),1,RowCount())
	
	If ll_pos>0 Then
		MessageBox("Advertencia!","La operaci$$HEX1$$f300$$ENDHEX$$n ya est$$HEX2$$e1002000$$ENDHEX$$registrada.",StopSign!)
		Return 2
	End If
	
End If
end event

type gb_general from w_simple`gb_general within w_mu_m_actividad
integer width = 2112
end type

type cb_1 from commandbutton within w_mu_m_actividad
integer x = 1787
integer y = 1036
integer width = 343
integer height = 100
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ordenar"
end type

event clicked;long i,ll_tot

ll_tot=dw_general.RowCount()

dw_general.Sort()

For i=1 to ll_tot
	dw_general.SetItem(i,"posicion",10*i)
Next

end event

