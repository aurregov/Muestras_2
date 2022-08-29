HA$PBExportHeader$w_copm_dest_muestras.srw
$PBExportComments$Composicion por destruccion para muestras
forward
global type w_copm_dest_muestras from w_response
end type
type cb_2 from commandbutton within w_copm_dest_muestras
end type
type cb_1 from commandbutton within w_copm_dest_muestras
end type
type dw_1 from u_dw_application within w_copm_dest_muestras
end type
type gb_1 from groupbox within w_copm_dest_muestras
end type
end forward

global type w_copm_dest_muestras from w_response
integer width = 2702
integer height = 1204
string title = "Composici$$HEX1$$f300$$ENDHEX$$n por destrucci$$HEX1$$f300$$ENDHEX$$n"
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_copm_dest_muestras w_copm_dest_muestras

type variables
n_cst_param io_param
end variables

forward prototypes
public function integer of_nombregrupo ()
end prototypes

public function integer of_nombregrupo ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 12 de Agosto de 2003 HORA 09:14:03:685
// 
// Para colocar los nombres de los grupos
//////////////////////////////////////////////////////////////////////////
n_cst_comun lo_comun
long i,ll_tot,ll_grupo,ll_res

ll_tot=dw_1.RowCount()

For i=1 To ll_tot
	ll_grupo=dw_1.GetItemNumber(i,"co_grupo")
	ll_res=lo_comun.of_nombreGrupo(ll_grupo,n_cst_application.itr_appl)
	If ll_res=1 Then
		dw_1.SetItem(i,"de_grupo",lo_comun.of_getString(1))
		dw_1.SetItemStatus(i,0,Primary!,NotModified!	)
	End If
Next

Return 1
end function

on w_copm_dest_muestras.create
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

on w_copm_dest_muestras.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 11 de Agosto de 2003 HORA 12:29:46:270
// 
// 
//////////////////////////////////////////////////////////////////////////
io_param=message.PowerObjectParm


long ll_tot


dw_1.SetTransObject(n_cst_application.itr_appl)


ll_tot=dw_1.Retrieve(io_param.il_vector[1],&
                     io_param.il_vector[2],&
							io_param.il_vector[3],&
							io_param.il_vector[4],&
							io_param.il_vector[5],&
							io_param.il_vector[6])
							
If ll_tot=-1 Then
	Close(This)
	Return
End If

If ll_tot=0 Then
	dw_1.event ue_insertRow()
Else
	of_nombreGrupo()
End If
end event

type cb_2 from commandbutton within w_copm_dest_muestras
integer x = 1234
integer y = 916
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

event clicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 11 de Agosto de 2003 HORA 13:46:45:322
// 
// 
//////////////////////////////////////////////////////////////////////////

Close(Parent)
end event

type cb_1 from commandbutton within w_copm_dest_muestras
integer x = 878
integer y = 916
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

event clicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 12 de Agosto de 2003 HORA 09:42:38:191
// 
// 
//////////////////////////////////////////////////////////////////////////
DateTime ldt_fecha
String ls_usuario,ls_instancia

If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If



If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos de tiempo no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

long i,ll_grupo

//////////////////////////////////////////////////////////////////////////
// Borro las finas sin grupo
// 
//////////////////////////////////////////////////////////////////////////
For i=1 To dw_1.RowCount()
	ll_grupo=dw_1.GetItemNumber(i,"co_grupo")
	If IsNull(ll_grupo) Then
		dw_1.deleteRow(i)
		i --
	End If
Next

If dw_1.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
	RollBack Using n_cst_application.itr_appl;
	Return -1
End If			

If dw_1.Update()<>1 Then
	RollBack Using n_cst_application.itr_appl ;
	Return -1
End If

Commit Using n_cst_application.itr_appl ;

close(parent)

end event

type dw_1 from u_dw_application within w_copm_dest_muestras
integer x = 50
integer y = 84
integer width = 2505
integer height = 744
string dataobject = "d_comp_dest_muestra"
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 11 de Agosto de 2003 HORA 12:09:39:567
// 
// overwrite!!
//////////////////////////////////////////////////////////////////////////

end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 11 de Agosto de 2003 HORA 12:11:28:352
// 
// En los grupos se debe verificar que no existan
//////////////////////////////////////////////////////////////////////////
long ll_dato,ll_pos,ll_res

n_cst_comun lo_comun

If dwo.name="co_grupo" Then
	ll_dato=long(Data)
	ll_pos=Find("co_grupo="+String(Data),1,RowCount())
	
	If ll_pos>0 Then
		MessageBox("Advertencia!","El grupo ya est$$HEX2$$e1002000$$ENDHEX$$digitado, por favor verifique.",StopSign!)
		Return 2
	End If

	ll_res=lo_comun.of_nombregrupo( ll_dato,n_cst_application.itr_appl)
	
	If ll_res=1 then
		SetItem(row,"de_grupo",lo_comun.of_getString(1))
	End If
End If
end event

event ue_insertrow;call super::ue_insertrow;long ll_f

ll_f=GetRow()

SetItem(ll_f,"co_fabrica",io_param.il_vector[1])
SetItem(ll_f,"co_linea",io_param.il_vector[2])
SetItem(ll_f,"co_muestra",io_param.il_vector[3])
SetItem(ll_f,"co_talla",io_param.il_vector[4])
SetItem(ll_f,"co_color",io_param.il_vector[5])
SetItem(ll_f,"cnt_opcion",io_param.il_vector[6])



end event

event ue_dwnprocessenter;if this.AcceptText() < 0 then
  Return 1
end if

if this.GetColumn() = 8 then
 if this.GetRow() = this.RowCount() then
	postEvent("ue_insertRow")
   Return 1
 end if
end if

Send(Handle(this),256,9,Long(0,0))
return 1

end event

event doubleclicked;call super::doubleclicked;n_cst_param lo_param

If dwo.name="co_grupo" Then

	Open(w_bus_m_grupos)

	lo_param=Message.PowerObjectParm

	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If
End If
end event

type gb_1 from groupbox within w_copm_dest_muestras
integer x = 9
integer y = 16
integer width = 2587
integer height = 860
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Composici$$HEX1$$f300$$ENDHEX$$n por destrucci$$HEX1$$f300$$ENDHEX$$n"
borderstyle borderstyle = stylelowered!
end type

