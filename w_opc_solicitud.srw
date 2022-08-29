HA$PBExportHeader$w_opc_solicitud.srw
forward
global type w_opc_solicitud from w_response
end type
type cb_cancelar from commandbutton within w_opc_solicitud
end type
type cb_aceptar from commandbutton within w_opc_solicitud
end type
type cb_buscar from commandbutton within w_opc_solicitud
end type
type dw_1 from u_dw_application within w_opc_solicitud
end type
type gb_2 from groupbox within w_opc_solicitud
end type
type dw_consulta from u_dw_application within w_opc_solicitud
end type
type gb_22 from u_gb_base within w_opc_solicitud
end type
end forward

global type w_opc_solicitud from w_response
integer width = 3735
integer height = 1440
string title = "Consulta de solicitudes"
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
cb_buscar cb_buscar
dw_1 dw_1
gb_2 gb_2
dw_consulta dw_consulta
gb_22 gb_22
end type
global w_opc_solicitud w_opc_solicitud

type variables
long il_fila
String is_where
end variables

forward prototypes
public function integer of_filasel (long a_fila)
public function integer of_nombreasesor (long a_asesor, string a_tipoPedido)
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

public function integer of_nombreasesor (long a_asesor, string a_tipoPedido);String ls_desEjecutiva

If a_tipoPedido = "EX" Or a_tipoPedido = "XD" Then
	
	select de_ejecutiva  
     into :ls_desejecutiva  
     from m_ejecutivas_exp  
    where co_ejecutiva = :a_asesor  using n_cst_application.itr_appl ;
	 
Else
	select  m_vendedor.de_vendedor  
     into  :ls_desejecutiva  
     FROM  m_vendedor  
    WHERE  ( co_vendedor =:a_asesor  )   ;

End If

If n_cst_application.itr_appl.SqlCode = -1 Then
	MessageBox("Advertencia!","Hubo un error al consultar la descripci$$HEX1$$f300$$ENDHEX$$n del asesor.~n~nNota: " + n_cst_application.itr_appl.SqlErrText )
	Return 2
//ElseIf n_cst_application.itr_appl.SqlCode = 100 Then
//	MessageBox("Advertencia!","El asesor no existe. Por favor revisar.")
//	Return 1
End If

dw_1.SetItem(1,"de_asesor",ls_desEjecutiva)
Return 1
end function

public function integer of_recuperar (string a_where);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 29 de Enero de 2003 HORA 14:00:25:046
// 
// 
//////////////////////////////////////////////////////////////////////////


String ls_sel1,ls_modString
long ll_pos
	
If Right(a_where,1)=")" Then	
	ls_sel1=dw_consulta.Describe("DataWindow.Table.Select")
	
	ll_pos=pos(ls_sel1,"dt_solicitudes.tipo_solicitud = h_solicitudes.tipo_solicitud )")
	
	If ll_pos>0 Then
		ls_Sel1=Left(ls_sel1, ll_pos -1)
	End If
	
	ls_modString="DataWindow.Table.Select='" &
		+ ls_sel1 + a_where + "'"
	//Messagebox('Var','ls_modString='+ls_modString+'~n')
	dw_consulta.Modify(ls_modString)
End If
il_fila=0

If dw_consulta.Retrieve()=1 Then
	of_filaSel(1)
End If

dw_consulta.SetFocus()

Return 1
end function

on w_opc_solicitud.create
int iCurrent
call super::create
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.cb_buscar=create cb_buscar
this.dw_1=create dw_1
this.gb_2=create gb_2
this.dw_consulta=create dw_consulta
this.gb_22=create gb_22
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancelar
this.Control[iCurrent+2]=this.cb_aceptar
this.Control[iCurrent+3]=this.cb_buscar
this.Control[iCurrent+4]=this.dw_1
this.Control[iCurrent+5]=this.gb_2
this.Control[iCurrent+6]=this.dw_consulta
this.Control[iCurrent+7]=this.gb_22
end on

on w_opc_solicitud.destroy
call super::destroy
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.cb_buscar)
destroy(this.dw_1)
destroy(this.gb_2)
destroy(this.dw_consulta)
destroy(this.gb_22)
end on

event open;call super::open;dw_1.InsertRow(0)

dw_consulta.SetTransObject(n_cst_application.itr_appl)


is_where=Message.StringParm

If IsNull(is_where) then is_where=""

If len(is_where)>0 Then
	of_recuperar(is_where)
End If
end event

type cb_cancelar from commandbutton within w_opc_solicitud
integer x = 2107
integer y = 1196
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

type cb_aceptar from commandbutton within w_opc_solicitud
integer x = 1755
integer y = 1196
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
// Miercoles 29 de Enero de 2003 HORA 14:08:12:734
// 
// 
//////////////////////////////////////////////////////////////////////////
n_cst_param lou_param

If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If

If il_fila<=0 then
	MessageBox("Advertencia!","Debe seleccionar una muestra.",StopSign!)
	Return
End If


lou_param.il_vector[1] = dw_consulta.GetItemNumber(il_fila,"nu_solicitud")
lou_param.is_vector[1] = is_where

CloseWithReturn(Parent,lou_param)
end event

type cb_buscar from commandbutton within w_opc_solicitud
integer x = 791
integer y = 1036
integer width = 343
integer height = 92
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


// dt_solicitudes.tipo_solicitud = h_solicitudes.tipo_solicitud )    
is_where="dt_solicitudes.tipo_solicitud = h_solicitudes.tipo_solicitud ) and ("
String ls_cad

ls_cad=String(dw_1.GetItemNumber(1,"co_fabrica"))

If Not IsNull(ls_cad) Then
	is_where+="h_solicitudes.co_fabrica="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"co_solicitud"))

If Not IsNull(ls_cad) Then
	is_where+="h_solicitudes.nu_solicitud="+ls_cad+" and "
End If

ls_cad=dw_1.GetItemString(1,"tipo_solicitud")

If Not IsNull(ls_cad) Then
	is_where+="h_solicitudes.tipo_solicitud=~~'"+ls_cad+"~~' and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"co_cliente"))

If Not IsNull(ls_cad) Then
	is_where+="h_solicitudes.co_cliente="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"co_sucursal"))

If Not IsNull(ls_cad) Then
	is_where+="h_solicitudes.co_sucursal="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"tipo_solicitud1"))

If Not IsNull(ls_cad) Then
	is_where+="h_solicitudes.co_tipo_solicitud="+ls_cad+" and "
End If

ls_cad=dw_1.GetItemString(1,"orden_coleccion")

If Not IsNull(ls_cad) Then
	is_where+="dt_solicitudes.nu_orden like ~~'%"+ls_cad+"%~~' and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"co_asesor"))

If Not IsNull(ls_cad) Then
	is_where+="h_solicitudes.co_ejecutiva  ="+ls_cad+" and "
End If


ls_cad=dw_1.GetItemString(1,"co_ref_exp")

If Not IsNull(ls_cad) Then
	is_where+="dt_solicitudes.co_ref_exp like ~~'%"+ls_cad+"%~~' and "
End If

ls_cad=dw_1.GetItemString(1,"de_referencia")

If Not IsNull(ls_cad) Then
	is_where+="dt_solicitudes.de_referencia like ~~'%"+ls_cad+"%~~' and "
End If

If Right(is_where,4)="and " Then
	is_where=left(is_where, len(is_where) - 4)+")"
	
End If

of_recuperar(is_where)





end event

type dw_1 from u_dw_application within w_opc_solicitud
integer x = 64
integer y = 92
integer width = 1006
integer height = 956
string dataobject = "d_ext_busca_solicitud"
boolean vscrollbar = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 21 de Octubre de 2002 HORA 17:07:49:062
// 
// OverWrite!!
//////////////////////////////////////////////////////////////////////////

end event

event itemchanged;call super::itemchanged;

If dwo.name="co_asesor" Then
	of_nombreAsesor(Long(Data),GetItemString(1,"tipo_solicitud"))
End If
end event

type gb_2 from groupbox within w_opc_solicitud
integer x = 41
integer y = 20
integer width = 1115
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
borderstyle borderstyle = stylelowered!
end type

type dw_consulta from u_dw_application within w_opc_solicitud
integer x = 1207
integer y = 96
integer width = 2450
integer height = 964
integer taborder = 30
string dataobject = "d_consulta_sol"
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

event itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 07 de Enero de 2003 HORA 09:30:41:906
// 
// No se permiten modificar los datos
//////////////////////////////////////////////////////////////////////////

Return 2
end event

event itemfocuschanged;call super::itemfocuschanged;If Row=0 Then Return

of_filaSel(Row)


end event

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 29 de Enero de 2003 HORA 14:07:07:093
// 
// Para llamar el aceptar directamente 
//////////////////////////////////////////////////////////////////////////

If Row=0 Then
	Return 
End If

il_fila=Row

SelectRow(0,false)
SelectRow(il_fila,True)

cb_aceptar.post event clicked()
end event

type gb_22 from u_gb_base within w_opc_solicitud
integer x = 1175
integer y = 20
integer width = 2496
integer height = 1132
integer taborder = 0
string text = "Busqueda"
end type

