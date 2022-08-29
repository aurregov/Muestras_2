HA$PBExportHeader$w_opc_producto.srw
$PBExportComments$Para buscar los productos de materia prima
forward
global type w_opc_producto from w_response
end type
type cb_buscar from commandbutton within w_opc_producto
end type
type dw_consulta from u_dw_application within w_opc_producto
end type
type cb_1 from commandbutton within w_opc_producto
end type
type cb_aceptar from commandbutton within w_opc_producto
end type
type dw_1 from u_dw_application within w_opc_producto
end type
type gb_1 from groupbox within w_opc_producto
end type
type gb_2 from u_gb_base within w_opc_producto
end type
end forward

global type w_opc_producto from w_response
integer x = 0
integer y = 0
integer width = 3840
integer height = 1520
string title = "Productos de materia prima"
cb_buscar cb_buscar
dw_consulta dw_consulta
cb_1 cb_1
cb_aceptar cb_aceptar
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_opc_producto w_opc_producto

type variables
String is_where

DataWindowChild idc_talla

long il_fila

n_cst_param iou_param
end variables

forward prototypes
public function integer of_filasel (long a_fila)
public function integer of_retorno ()
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

public function integer of_retorno ();
If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If il_fila<=0 then
	MessageBox("Advertencia!","Debe seleccionar una referencia.",StopSign!)
	Return -1
End If


iou_param.il_vector[1] = dw_consulta.GetItemNumber(il_fila,"co_producto")
iou_param.il_vector[2] = dw_consulta.GetItemNumber(il_fila,"calidad")
iou_param.il_vector[3] = dw_consulta.GetItemNumber(il_fila,"co_matiz")
iou_param.il_vector[4] = dw_consulta.GetItemNumber(il_fila,"co_caracteristica")
iou_param.il_vector[5] = dw_consulta.GetItemNumber(il_fila,"co_color")

iou_param.is_vector[1] = dw_consulta.GetItemString(il_fila,"de_producto")

Return 1
end function

public function integer of_recuperar (string a_where);String ls_sel1,ls_modString
long ll_pos
//dt_preref.co_calidad = h_fmp.co_calidad )    
If Right(a_where,1)=")" Then
	
	ls_sel1=dw_consulta.Describe("DataWindow.Table.Select")

	ll_pos=pos(ls_sel1,"m_prod_proveedor.co_fabrica = 2 )")
	
	If ll_pos>0 Then
		ls_Sel1=Left(ls_sel1, ll_pos -1)
	End If
	
	ls_modString="DataWindow.Table.Select='" &
		+ ls_sel1 + a_where + "'"
	
	//clipboard(ls_modString)
	//Messagebox('Var','ls_modString='+ls_modString+'~n')
	
	dw_consulta.Modify(ls_modString)
	
End If
il_fila=0
dw_consulta.Retrieve()
If dw_consulta.RowCount()=1 then
	of_filaSel(1)
End If

dw_consulta.SetFocus()

Return 1
end function

on w_opc_producto.create
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

on w_opc_producto.destroy
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

dw_1.GetChild("talla",idc_talla)
idc_talla.SetTransObject(n_cst_application.itr_appl)

idc_talla.InsertRow(0)

dw_1.InsertRow(0)


is_where=Message.StringParm

If IsNull(is_where) then is_where=""

If len(is_where)>0 Then
	of_recuperar(is_where)
End If
end event

type cb_buscar from commandbutton within w_opc_producto
integer x = 439
integer y = 1012
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


// dt_preref.co_calidad = h_fmp.co_calidad )    calidad_mp
is_where="m_prod_proveedor.co_fabrica = 2 ) and ("
String ls_cad

ls_cad=String(dw_1.GetItemNumber(1,"co_producto_mp"))

If Not IsNull(ls_cad) Then
	is_where+="m_prod_proveedor.co_producto="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"calidad_mp"))

If Not IsNull(ls_cad) Then
	is_where+="m_prod_proveedor.calidad="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"co_matiz_mp"))

If Not IsNull(ls_cad) Then
	is_where+="m_prod_proveedor.co_matiz="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"co_caracteristi_mp"))

If Not IsNull(ls_cad) Then
	is_where+="m_prod_proveedor.co_caracteristica="+ls_cad+" and "
End If

ls_cad=dw_1.GetItemString(1,"de_producto")

If Not IsNull(ls_cad) Then
	is_where+="m_matprimas.de_producto like ~~'%"+ls_cad+"%~~' and "
End If        

ls_cad=String(dw_1.GetItemNumber(1,"co_color_mp"))

If Not IsNull(ls_cad) Then
	is_where+="m_prod_proveedor.co_color="+ls_cad+" and "
End If   

If Right(is_where,4)="and " Then
	is_where=left(is_where, len(is_where) - 4)+")"
	
End If

of_recuperar(is_where)







end event

type dw_consulta from u_dw_application within w_opc_producto
integer x = 1038
integer y = 96
integer width = 2693
integer height = 964
integer taborder = 30
string dataobject = "d_busca_producto"
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

event itemfocuschanged;call super::itemfocuschanged;If Row=0 Then Return

of_filaSel(Row)


end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 07 de Enero de 2003 HORA 09:30:41:906
// 
// No se permiten modificar los datos
//////////////////////////////////////////////////////////////////////////

Return 2
end event

event doubleclicked;call super::doubleclicked;If Row=0 Then Return

of_filaSel(Row)

cb_aceptar.Trigger Event Clicked()
end event

type cb_1 from commandbutton within w_opc_producto
integer x = 1632
integer y = 1216
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

type cb_aceptar from commandbutton within w_opc_producto
integer x = 1280
integer y = 1216
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

event clicked;If of_retorno()<>1 Then
	Return 
End If

CloseWithReturn(Parent,iou_param)
end event

type dw_1 from u_dw_application within w_opc_producto
integer x = 64
integer y = 92
integer width = 869
integer height = 916
string dataobject = "d_ext_producto"
boolean vscrollbar = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 21 de Octubre de 2002 HORA 17:07:49:062
// 
// OverWrite!!
//////////////////////////////////////////////////////////////////////////

end event

event itemchanged;call super::itemchanged;//n_cst_comun lo_comun
//long ll_fabrica,ll_linea,ll_res
//
//ll_fabrica=GetItemNumber(1,"fabrica")
//ll_linea  =GetItemNumber(1,"linea")
//
//If dwo.name="fabrica" Then
//	ll_fabrica=Long(Data)
//End If
//
//If dwo.name="linea" Then
//	ll_linea=Long(Data)
//End If
//
//ll_res=lo_comun.of_muestrarioactual( ll_Fabrica,ll_linea,n_cst_application.itr_appl)
//
//If ll_res=1 Then
//	SetItem(1,"muestrario",lo_comun.of_GetLong(1))
//End If
end event

type gb_1 from groupbox within w_opc_producto
integer x = 41
integer y = 20
integer width = 919
integer height = 1132
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Criterio de b$$HEX1$$fa00$$ENDHEX$$squeda"
end type

type gb_2 from u_gb_base within w_opc_producto
integer x = 997
integer y = 20
integer width = 2807
integer height = 1132
integer taborder = 0
string text = "Busqueda"
end type

