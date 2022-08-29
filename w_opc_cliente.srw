HA$PBExportHeader$w_opc_cliente.srw
$PBExportComments$Para buscar clientes haciendo doble click
forward
global type w_opc_cliente from w_response
end type
type cb_buscar from u_cb_base within w_opc_cliente
end type
type dw_1 from u_dw_application within w_opc_cliente
end type
type cb_aceptar from commandbutton within w_opc_cliente
end type
type cb_1 from commandbutton within w_opc_cliente
end type
type gb_1 from groupbox within w_opc_cliente
end type
type dw_consulta from u_dw_application within w_opc_cliente
end type
type gb_2 from u_gb_base within w_opc_cliente
end type
end forward

global type w_opc_cliente from w_response
integer x = 101
integer y = 52
integer width = 3337
integer height = 1432
string title = "Consulta de clientes"
cb_buscar cb_buscar
dw_1 dw_1
cb_aceptar cb_aceptar
cb_1 cb_1
gb_1 gb_1
dw_consulta dw_consulta
gb_2 gb_2
end type
global w_opc_cliente w_opc_cliente

type variables
long il_fila=0
String is_where

n_cst_param io_param
end variables

forward prototypes
public function integer of_recuperar (string a_where)
end prototypes

public function integer of_recuperar (string a_where);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 29 de Enero de 2003 HORA 15:06:45:250
// 
// 
//////////////////////////////////////////////////////////////////////////


String ls_sel1,ls_modString
long ll_pos
	
If Right(a_where,1)=")" Then	
	ls_sel1=dw_consulta.Describe("DataWindow.Table.Select")

	ll_pos=pos(ls_sel1,"where")
	
	If ll_pos>0 Then
		ls_Sel1=Left(ls_sel1, ll_pos -1)
	End If
	
	ls_modString="DataWindow.Table.Select='" &
		+ ls_sel1 + a_where + "'"
	
	dw_consulta.Modify(ls_modString)
End If	
il_fila=0
dw_consulta.Retrieve()

dw_consulta.SetFocus()

Return 1
end function

on w_opc_cliente.create
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

on w_opc_cliente.destroy
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
// En el parametro se envia el where por defecto y el tipo de cliente a
// buscar si es nacional o de exportaciones
//////////////////////////////////////////////////////////////////////////

io_param=Message.PowerObjectParm

If io_param.is_vector[2]="NA" Then
	dw_consulta.DataObject="d_bus_m_clientes"
Else
	dw_consulta.DataObject="d_bus_m_clientes_exp"
End If
dw_1.InsertRow(0)

dw_consulta.SetTransObject(n_cst_application.itr_appl)


is_where=io_param.is_vector[1]

If IsNull(is_where) then is_where=""

If len(is_where)>0 Then
	of_recuperar(is_where)
End If
end event

type cb_buscar from u_cb_base within w_opc_cliente
integer x = 416
integer y = 672
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



is_where="where ("
String ls_cad

ls_cad=String(dw_1.GetItemNumber(1,"co_cliente"))

If Not IsNull(ls_cad) Then
	is_where+="co_cliente="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"co_sucursal"))

If Not IsNull(ls_cad) Then
	is_where+="co_sucursal="+ls_cad+" and "
End If

ls_cad=dw_1.GetItemString(1,"tel_cliente")

If Not IsNull(ls_cad) Then
	If io_param.is_vector[2]="NA" Then
		is_where+="tel_cliente="+ls_cad+" and "
	Else
		is_where+="telefono like ~~'%"+ls_cad+"%~~' and "
	End If
End If

ls_cad=dw_1.GetItemString(1,"de_cliente")

If Not IsNull(ls_cad) Then
	is_where+="de_cliente like ~~'%"+ls_cad+"%~~' and "
End If        

ls_cad=dw_1.GetItemString(1,"dir_cliente")

If Not IsNull(ls_cad) Then
	is_where+="dir_cliente like ~~'%"+ls_cad+"%~~' and "
End If   

If Right(is_where,4)="and " Then
	is_where=left(is_where, len(is_where) - 4)+")"
	
End If

of_recuperar(is_where)


















end event

type dw_1 from u_dw_application within w_opc_cliente
integer x = 69
integer y = 84
integer width = 1038
integer height = 544
string dataobject = "d_ext_bus_cliente"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// OverWrite
// 
//////////////////////////////////////////////////////////////////////////

end event

type cb_aceptar from commandbutton within w_opc_cliente
integer x = 1125
integer y = 1172
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


lou_param.il_vector[1] = dw_consulta.GetItemNumber(il_fila,"co_cliente")
lou_param.il_vector[2] = dw_consulta.GetItemNumber(il_fila,"co_sucursal")


lou_param.is_vector[1]=is_where

CloseWithReturn(Parent,lou_param)
end event

type cb_1 from commandbutton within w_opc_cliente
integer x = 1477
integer y = 1172
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

type gb_1 from groupbox within w_opc_cliente
integer x = 37
integer y = 4
integer width = 1088
integer height = 1124
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Datos de clientes"
borderstyle borderstyle = stylelowered!
end type

type dw_consulta from u_dw_application within w_opc_cliente
integer x = 1166
integer y = 76
integer width = 2094
integer height = 992
integer taborder = 40
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

il_fila=Row

SelectRow(0,False)
SelectRow(il_fila,True)
end event

event doubleclicked;call super::doubleclicked;If Row=0 Then Return

il_fila=Row

SelectRow(0,False)
SelectRow(il_fila,True)

cb_aceptar.PostEvent(Clicked!)
end event

event itemfocuschanged;call super::itemfocuschanged;

If Row=0 Then Return

If il_fila=row Then Return

il_fila=Row

SelectRow(0,False)
SelectRow(il_fila,True)
end event

type gb_2 from u_gb_base within w_opc_cliente
integer x = 1134
integer y = 8
integer width = 2167
integer height = 1120
integer taborder = 0
string text = "Clientes encontrados"
end type

