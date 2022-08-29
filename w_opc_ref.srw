HA$PBExportHeader$w_opc_ref.srw
$PBExportComments$Para la busqueda de la referencia
forward
global type w_opc_ref from w_response
end type
type cb_buscar from commandbutton within w_opc_ref
end type
type dw_consulta from u_dw_application within w_opc_ref
end type
type cb_1 from commandbutton within w_opc_ref
end type
type cb_aceptar from commandbutton within w_opc_ref
end type
type dw_1 from u_dw_application within w_opc_ref
end type
type gb_1 from groupbox within w_opc_ref
end type
type gb_2 from u_gb_base within w_opc_ref
end type
end forward

global type w_opc_ref from w_response
integer width = 3360
integer height = 1364
string title = "Selecci$$HEX1$$f300$$ENDHEX$$n de referencia"
cb_buscar cb_buscar
dw_consulta dw_consulta
cb_1 cb_1
cb_aceptar cb_aceptar
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_opc_ref w_opc_ref

type variables
DataWindowChild idc_talla

long il_fila

n_cst_param iou_param
n_cst_param iin_param
end variables

forward prototypes
public function integer of_filasel (long a_fila)
public function integer of_retorno ()
public function integer of_buscar (string a_parametro)
public function integer of_recuperar (string a_where)
end prototypes

public function integer of_filasel (long a_fila);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 06 de Diciembre de 2002 HORA 16:26:14:453
// 
// Cuando se selecciona una fila
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
	MessageBox("Advertencia!","Debe seleccionar una muestra.",StopSign!)
	Return -1
End If


iou_param.il_vector[1] = dw_consulta.GetItemNumber(il_fila,"co_fabrica")
iou_param.il_vector[2] = dw_consulta.GetItemNumber(il_fila,"co_linea")
iou_param.il_vector[3] = dw_consulta.GetItemNumber(il_fila,"co_referencia")
iou_param.il_vector[4] = dw_consulta.GetItemNumber(il_fila,"co_talla")
iou_param.il_vector[5] = dw_consulta.GetItemNumber(il_fila,"co_calidad")
iou_param.il_vector[6] = dw_consulta.GetItemNumber(1,"co_tipoprod")


iou_param.is_vector[1]=iin_param.is_vector[1]

n_cst_application.il_fabRef=dw_consulta.GetItemNumber(il_fila,"co_fabrica")
n_cst_application.il_lineaRef=dw_consulta.GetItemNumber(il_fila,"co_linea")
n_cst_application.il_referencia=dw_consulta.GetItemNumber(il_fila,"co_referencia")

Return 1
end function

public function integer of_buscar (string a_parametro);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 31 de Mayo de 2004 HORA 10:16:15:703
// 
// Se utiliza un parametro de busqueda para el caso de ser la db local sino se
// coloca un sinonimo en la busqueda
// m_proref_sin
//////////////////////////////////////////////////////////////////////////



// dt_preref.co_calidad = m_proref.co_calidad )    

iin_param.is_vector[1] =a_parametro//"dt_preref.co_calidad = m_proref.co_calidad ) and ("
String ls_cad

ls_cad=String(dw_1.GetItemNumber(1,"fabrica"))

If Not IsNull(ls_cad) Then
	iin_param.is_vector[1]+="h_preref.co_fabrica="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"linea"))

If Not IsNull(ls_cad) Then
	iin_param.is_vector[1]+="h_preref.co_linea="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"referencia"))

If Not IsNull(ls_cad) Then
	iin_param.is_vector[1]+="h_preref.co_referencia="+ls_cad+" and "
End If

ls_cad=dw_1.GetItemString(1,"descripcion")

If Not IsNull(ls_cad) Then
	iin_param.is_vector[1]+="h_preref.de_referencia like ~~'%"+ls_cad+"%~~' and "
End If        

ls_cad=String(dw_1.GetItemNumber(1,"calidad"))

If Not IsNull(ls_cad) Then
	iin_param.is_vector[1]+="dt_preref.co_calidad="+ls_cad+" and "
End If

ls_cad=dw_1.GetItemString(1,"talla")

If Not IsNull(ls_cad) Then
	iin_param.is_vector[1]+="m_tallas_x_grupo.co_talla ="+ls_cad+" and "
End If   

//* MODIFICADO: Noviembre 05 de 2008 - gagudelo
//* Se adiciona como filtro el co_operacion en m_proref

ls_cad=String(dw_1.GetItemNumber(1,"co_operacion"))

If Not IsNull(ls_cad) Then
	iin_param.is_vector[1]+="m_proref.co_operacion = "+ls_cad+" and "
End If  

If Right(iin_param.is_vector[1],4)="and " Then
	iin_param.is_vector[1]=left(iin_param.is_vector[1], len(iin_param.is_vector[1]) - 4)+")"
	
End If

Return 1
end function

public function integer of_recuperar (string a_where);String ls_sel1,ls_modString
long ll_pos,ll_tot

dw_consulta.dataObject="d_h_preref1"
dw_consulta.SetTransObject(n_cst_application.itr_appl)

//Messagebox('Var','ls_a_where='+a_where+'~n')

If Right(a_where,1)=")" Then	
	ls_sel1=dw_consulta.Describe("DataWindow.Table.Select")

	ll_pos=pos(ls_sel1,"dt_preref.co_calidad = m_proref.co_calidad )")
	
	If ll_pos>0 Then
		ls_Sel1=Left(ls_sel1, ll_pos -1)
	End If
	
	ls_modString="DataWindow.Table.Select='" &
		+ ls_sel1 + a_where + "'"
	
	dw_consulta.Modify(ls_modString)
	
End If
il_fila=0
ll_tot=dw_consulta.Retrieve()

//////////////////////////////////////////////////////////////////////////
// Cuando no se encuentran datos, se hace una b$$HEX1$$fa00$$ENDHEX$$squeda con el sinonimo
// m_proref_sin, para eso se remplaza el texto en el query
// es necesario cambiar el dw object para el que tiene el sinonimo
//////////////////////////////////////////////////////////////////////////
n_cst_string lo_string

String ls_err

iou_param.is_vector[2]="NORMAL"

If ll_tot=0 and iin_param.is_vector[2]="COPIAR"  Then
	
	ls_sel1=dw_consulta.Describe("DataWindow.Table.Select")
	dw_consulta.dataObject="d_h_preref1_sin"
	dw_consulta.SetTransObject(n_cst_application.itr_appl)
	
	
	ls_sel1=lo_string.of_globalreplace(ls_sel1 /*string as_source*/,&
													 "m_proref"/*string as_old*/,&
													 "m_proref_sin"/*string as_new */)



													 
	ls_modString="DataWindow.Table.Select='" &
		+ ls_sel1 + "'"	
		
	ls_err=dw_consulta.Modify(ls_modString)
	//Messagebox('Var','ls_err='+ls_err+'~n')
	ll_tot=dw_consulta.Retrieve()
	If ll_tot>0 Then
		iou_param.is_vector[2]="SINONIMO"		
	End If
End If

If dw_consulta.RowCount()=1 then
	of_filaSel(1)
End If
dw_consulta.SetFocus()
Return ll_tot
end function

on w_opc_ref.create
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

on w_opc_ref.destroy
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


//////////////////////////////////////////////////////////////////////////
// en parametro tiene esta estructura
//
// 1. where
// 2. indica si esta buscando o copiando, en el segundo caso se debe permitir
//    buscar con los sinonimos
//////////////////////////////////////////////////////////////////////////


If IsValid(Message.PowerObjectParm) Then
	iin_param=Message.PowerObjectParm
	
	If IsNull(iin_param.is_vector[1]) then iin_param.is_vector[1]=""
	
//	If len(iin_param.is_vector[1])>0 Then
//		of_recuperar(iin_param.is_vector[1])
//	End If
Else
	iin_param.is_vector[1]=""
	iin_param.is_vector[2]=""
End If

If n_cst_application.il_fabRef<>0 then
	dw_1.SetItem(1,"fabrica",n_cst_application.il_fabRef)
	dw_1.SetItem(1,"linea",n_cst_application.il_lineaRef)
	dw_1.SetItem(1,"referencia",n_cst_application.il_referencia)
End If

end event

type cb_buscar from commandbutton within w_opc_ref
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

of_buscar("dt_preref.co_calidad = m_proref.co_calidad ) and (")

of_Recuperar(iin_param.is_vector[1] /*string a_where */)
















end event

type dw_consulta from u_dw_application within w_opc_ref
integer x = 1198
integer y = 96
integer width = 2112
integer height = 868
integer taborder = 30
string dataobject = "d_h_preref1"
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
// Miercoles 22 de Enero de 2003 HORA 14:51:28:968
// 
// no modify
//////////////////////////////////////////////////////////////////////////
Return 2
end event

event itemfocuschanged;call super::itemfocuschanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 22 de Enero de 2003 HORA 14:52:03:265
// 
// 
//////////////////////////////////////////////////////////////////////////


If Row=0 Then Return

of_filaSel(Row)


end event

event doubleclicked;call super::doubleclicked;If Row=0 Then Return

of_filaSel(Row)


cb_aceptar.Trigger event Clicked()
end event

type cb_1 from commandbutton within w_opc_ref
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

type cb_aceptar from commandbutton within w_opc_ref
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

event clicked;If of_retorno()<>1 Then
	Return 
End If

CloseWithReturn(Parent,iou_param)
end event

type dw_1 from u_dw_application within w_opc_ref
integer x = 82
integer y = 116
integer width = 992
integer height = 704
string dataobject = "d_ext_referencia"
boolean vscrollbar = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 21 de Octubre de 2002 HORA 17:07:49:062
// 
// OverWrite!!
//////////////////////////////////////////////////////////////////////////

end event

type gb_1 from groupbox within w_opc_ref
integer x = 37
integer y = 24
integer width = 1102
integer height = 992
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Referencia"
end type

type gb_2 from u_gb_base within w_opc_ref
integer x = 1157
integer y = 20
integer width = 2167
integer height = 996
integer taborder = 0
string text = "Busqueda"
end type

