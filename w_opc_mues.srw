HA$PBExportHeader$w_opc_mues.srw
$PBExportComments$Para la busqueda de la referencia
forward
global type w_opc_mues from w_response
end type
type cb_buscar from commandbutton within w_opc_mues
end type
type dw_consulta from u_dw_application within w_opc_mues
end type
type cb_1 from commandbutton within w_opc_mues
end type
type cb_aceptar from commandbutton within w_opc_mues
end type
type dw_1 from u_dw_application within w_opc_mues
end type
type gb_1 from groupbox within w_opc_mues
end type
type gb_2 from u_gb_base within w_opc_mues
end type
end forward

global type w_opc_mues from w_response
integer width = 3360
integer height = 1364
string title = "Selecci$$HEX1$$f300$$ENDHEX$$n de muestra"
cb_buscar cb_buscar
dw_consulta dw_consulta
cb_1 cb_1
cb_aceptar cb_aceptar
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_opc_mues w_opc_mues

type variables
String is_where

long il_fila

n_cst_param iou_param
end variables

forward prototypes
public function integer of_filasel (long a_fila)
public function integer of_recuperar (string a_where)
public function integer of_retorno ()
end prototypes

public function integer of_filasel (long a_fila);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 22 de Enero de 2003 HORA 08:45:17:687
// 
// 
//////////////////////////////////////////////////////////////////////////

il_fila=a_fila

dw_consulta.SelectRow(0,False)
dw_consulta.SelectRow(il_fila,True)



Return 1










end function

public function integer of_recuperar (string a_where);String ls_sel1,ls_modString,ls_talla
long ll_pos,ll_grp_tlla,ll_tlla,i

	
If Right(a_where,1)=")" Then
	
	ls_sel1=dw_consulta.Describe("DataWindow.Table.Select")

	ll_pos=pos(ls_sel1,"m_muestras.co_muestra = dt_muestras.co_muestra )")
	
	If ll_pos>0 Then
		ls_Sel1=Left(ls_sel1, ll_pos -1)
	End If
	
	ls_modString="DataWindow.Table.Select='" &
		+ ls_sel1 + a_where + "'"
	

	dw_consulta.Modify(ls_modString)
	
End If	
//////////////////////////////////////////////////////////////////////////
// Asigno los nombres de las tallas
// 
//////////////////////////////////////////////////////////////////////////
n_cst_comun lo_comun

Long ll_cant

il_fila=0	

ll_cant=dw_consulta.Retrieve()

If ll_cant>0 Then
	For i=1 To ll_cant
		ll_tlla=dw_consulta.GetItemNumber(i,"co_talla")
		ll_grp_tlla=dw_consulta.GetItemNumber(i,"co_grupo_tlla")
		lo_comun.of_nombreTalla(ll_grp_tlla,ll_tlla,n_cst_application.itr_appl)
		ls_talla=lo_comun.of_getString(1)
		dw_consulta.setItem(i,"cde_talla",ls_talla)
	Next
	If ll_cant=1 Then
		of_filaSel(1)
	End If
End If

dw_consulta.SetFocus()

Return 1
end function

public function integer of_retorno ();If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If il_fila<=0 then
	MessageBox("Advertencia!","Debe seleccionar una muestra.",StopSign!)
	Return -1
End If


iou_param.il_vector[1] = dw_consulta.GetItemNumber(il_fila,"co_fabrica")
iou_param.il_vector[2] = dw_consulta.GetItemNumber(il_fila,"co_linea")
iou_param.il_vector[3] = dw_consulta.GetItemNumber(il_fila,"co_muestra")
iou_param.il_vector[4] = dw_consulta.GetItemNumber(il_fila,"co_talla")
iou_param.il_vector[5] = dw_consulta.GetItemNumber(il_fila,"co_grupo_tlla")



iou_param.is_vector[1]=is_where

n_cst_application.il_fabMue=dw_consulta.GetItemNumber(il_fila,"co_fabrica")
n_cst_application.il_lineaMue=dw_consulta.GetItemNumber(il_fila,"co_linea")
n_cst_application.il_muestra=dw_consulta.GetItemNumber(il_fila,"co_muestra")

Return 1
end function

on w_opc_mues.create
int iCurrent
call super::create
this.cb_buscar=create cb_buscar
this.dw_consulta=create dw_consulta
this.cb_1=create cb_1
this.cb_aceptar=create cb_aceptar
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_buscar
this.Control[iCurrent+2]=this.dw_consulta
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.cb_aceptar
this.Control[iCurrent+5]=this.dw_1
this.Control[iCurrent+6]=this.gb_1
this.Control[iCurrent+7]=this.gb_2
end on

on w_opc_mues.destroy
call super::destroy
destroy(this.cb_buscar)
destroy(this.dw_consulta)
destroy(this.cb_1)
destroy(this.cb_aceptar)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;

dw_1.SetTransObject(n_cst_application.itr_appl)
dw_consulta.SetTransObject(n_cst_application.itr_appl)

dw_1.InsertRow(0)


is_where=Message.StringParm

If IsNull(is_where) then is_where=""

If len(is_where)>0 Then
	of_recuperar(is_where)
End If

If n_cst_application.il_fabMue<>0 then
	dw_1.SetItem(1,"fabrica",n_cst_application.il_fabMue)
	dw_1.SetItem(1,"linea",n_cst_application.il_lineaMue)
	dw_1.SetItem(1,"muestra",n_cst_application.il_muestra)
End If
end event

type cb_buscar from commandbutton within w_opc_mues
integer x = 430
integer y = 868
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar"
end type

event clicked;If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If


//m_muestras.co_muestra = dt_muestras.co_muestra ) 
is_where="m_muestras.co_muestra = dt_muestras.co_muestra ) and ("
String ls_cad

ls_cad=String(dw_1.GetItemNumber(1,"fabrica"))

If Not IsNull(ls_cad) Then
	is_where+="dt_muestras.co_fabrica="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"linea"))

If Not IsNull(ls_cad) Then
	is_where+="dt_muestras.co_linea="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"muestra"))

If Not IsNull(ls_cad) Then
	is_where+="dt_muestras.co_muestra="+ls_cad+" and "
End If

ls_cad=dw_1.GetItemString(1,"descripcion")

If Not IsNull(ls_cad) Then
	is_where+="m_muestras.de_muestra like ~~'%"+ls_cad+"%~~' and "
End If        


If Right(is_where,4)="and " Then
	is_where=left(is_where, len(is_where) - 4)+")"
	
End If

of_recuperar(is_where)



















end event

type dw_consulta from u_dw_application within w_opc_mues
integer x = 1202
integer y = 96
integer width = 2107
integer height = 844
integer taborder = 30
string dataobject = "d_busca_muestra_mo"
boolean hscrollbar = true
end type

event clicked;call super::clicked;If Row=0 Then Return

of_filaSel(Row)

end event

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 24 de Octubre de 2002 HORA 08:50:59:781
// 
// OverWrite
//////////////////////////////////////////////////////////////////////////

end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 22 de Enero de 2003 HORA 08:39:55:796
// 
// Los datos no son modificables
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

type cb_1 from commandbutton within w_opc_mues
integer x = 1632
integer y = 1096
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

type cb_aceptar from commandbutton within w_opc_mues
integer x = 1280
integer y = 1096
integer width = 343
integer height = 100
integer taborder = 40
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
// Miercoles 22 de Enero de 2003 HORA 10:05:27:156
// 
// 
//////////////////////////////////////////////////////////////////////////

If of_retorno()<>1 then
	Return
End If

CloseWithReturn(Parent,iou_param)
end event

type dw_1 from u_dw_application within w_opc_mues
integer x = 64
integer y = 116
integer width = 1047
integer height = 732
string dataobject = "d_ext_muestra1"
boolean vscrollbar = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 21 de Octubre de 2002 HORA 17:07:49:062
// 
// OverWrite!!
//////////////////////////////////////////////////////////////////////////

end event

type gb_1 from groupbox within w_opc_mues
integer x = 41
integer y = 24
integer width = 1097
integer height = 968
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Criterio de b$$HEX1$$fa00$$ENDHEX$$squeda"
borderstyle borderstyle = stylelowered!
end type

type gb_2 from u_gb_base within w_opc_mues
integer x = 1161
integer y = 20
integer width = 2162
integer height = 972
integer taborder = 0
string text = "Busqueda"
end type

