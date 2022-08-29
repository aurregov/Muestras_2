HA$PBExportHeader$w_reporte_ejecutiva.srw
$PBExportComments$Reporte solicitado por las ejecutivas
forward
global type w_reporte_ejecutiva from w_sheet
end type
type cb_2 from commandbutton within w_reporte_ejecutiva
end type
type cb_1 from commandbutton within w_reporte_ejecutiva
end type
type dw_criterio from u_dw_application within w_reporte_ejecutiva
end type
type gb_2 from groupbox within w_reporte_ejecutiva
end type
type dw_dinamica from u_dw_application within w_reporte_ejecutiva
end type
type st_1 from statictext within w_reporte_ejecutiva
end type
type dw_reporte from u_dw_application within w_reporte_ejecutiva
end type
type gb_4 from groupbox within w_reporte_ejecutiva
end type
end forward

global type w_reporte_ejecutiva from w_sheet
integer width = 3538
integer height = 2032
string title = "Reporte para ejecutivas"
windowstate windowstate = maximized!
cb_2 cb_2
cb_1 cb_1
dw_criterio dw_criterio
gb_2 gb_2
dw_dinamica dw_dinamica
st_1 st_1
dw_reporte dw_reporte
gb_4 gb_4
end type
global w_reporte_ejecutiva w_reporte_ejecutiva

type variables
//columnas que se seleccionan
String is_cols[]
end variables

forward prototypes
public function integer of_inicio ()
public function string of_where (integer a_comillas)
public function integer of_deshabilitarestados ()
public function integer of_detalle (long a_fila, dwobject a_dwo)
end prototypes

public function integer of_inicio ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 29 de Enero de 2004 HORA 18:37:45:422
// 
// Inicio
//////////////////////////////////////////////////////////////////////////

long ll_f
//dw_columnas.Reset()


//ll_f=dw_columnas.InsertRow(0)
//dw_columnas.SetItem(ll_f,"seleccionado",1)
//dw_columnas.SetItem(ll_f,"orden",10)
//dw_columnas.SetItem(ll_f,"columna","Estado")
//dw_columnas.SetItem(ll_f,"db_col","dt_muestras_col.co_estado")
//
//ll_f=dw_columnas.InsertRow(0)
//dw_columnas.SetItem(ll_f,"seleccionado",1)
//dw_columnas.SetItem(ll_f,"orden",20)
//dw_columnas.SetItem(ll_f,"columna","Cliente")
//dw_columnas.SetItem(ll_f,"db_col","m_muestras.co_cliente, m_muestras.co_sucursal")
//
//ll_f=dw_columnas.InsertRow(0)
//dw_columnas.SetItem(ll_f,"seleccionado",1)
//dw_columnas.SetItem(ll_f,"orden",30)
//dw_columnas.SetItem(ll_f,"columna","Ejecutiva")
//dw_columnas.SetItem(ll_f,"db_col","m_muestras.co_ejecutiva")
//
//ll_f=dw_columnas.InsertRow(0)
//dw_columnas.SetItem(ll_f,"seleccionado",1)
//dw_columnas.SetItem(ll_f,"orden",40)
//dw_columnas.SetItem(ll_f,"columna","Desarrollador")
//dw_columnas.SetItem(ll_f,"db_col","m_muestras.desarrollador")
//
//
//

Return 0
end function

public function string of_where (integer a_comillas);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 09 de Febrero de 2004 HORA 09:35:56:538
// 
// Se arma dinamicamente la clausula where acorde con los criterios del usuario
//////////////////////////////////////////////////////////////////////////
Long 		ll_tot,i
String 	ls_dato

String ls_estado="( "

//ll_tot=dw_estados.RowCount()

//For i=1 To ll_tot
//	If dw_estados.GetItemNumber(i,"chk")=1 Then
//		ls_estado+=String(dw_estados.GetItemNumber(i,"co_estado"))+", "
//	End If
//	
//Next

//ls_estado=mid(ls_estado,1,len(ls_estado) -2)

ls_estado+=") "

If dw_criterio.AcceptText()<>1 then
	MessageBox("Advertencia!","Criterio no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
	Return ""
End If

String ls_where

ls_dato=dw_criterio.GetItemString(1,"tipo")

If Trim(ls_dato)<>"" Then
	If a_comillas=1 Then
		ls_where+="( m_muestras.tipo_muestra=~'"+ls_dato+"~') and "
	Else
		ls_where+="( m_muestras.tipo_muestra=~~'"+ls_dato+"~~') and "
	End If
End If

If len(ls_Estado)>4 Then
	ls_where+="( dt_muestras_col.co_estado in "+ls_Estado+") and "
End If

ls_dato=""

ls_dato=String(dw_criterio.GetItemNumber(1,"co_ejecutiva"))

If Not IsNull(ls_dato) Then
	ls_where+="( m_muestras.co_ejecutiva = "+ls_dato+") and "
End If

ls_dato=String(dw_criterio.GetItemNumber(1,"co_cliente"))

If Not IsNull(ls_dato) Then
	ls_where+="( m_muestras.co_cliente = "+ls_dato+") and "
End If

ls_dato=String(dw_criterio.GetItemNumber(1,"co_sucursal"))

If Not IsNull(ls_dato) Then
	ls_where+="( m_muestras.co_sucursal = "+ls_dato+") and "
End If

ls_dato=dw_criterio.GetItemString(1,"co_desarrollador")

If Not IsNull(ls_dato) Then
	If a_comillas=1 Then
		ls_where+="( m_muestras.desarrollador=~'"+ls_dato+"~') and "
	Else
		ls_where+="( m_muestras.desarrollador=~~'"+ls_dato+"~~') and "
	End If
End If

Date ld_1

ld_1=dw_criterio.GetItemDate(1,"fecha_dllo1")

If Not IsNull(ld_1) Then
	ls_where+="(m_muestras.fe_desarrollo >= DATETIME("+&
	String(year(ld_1),"0000")+"-"+String(month(ld_1),"00")+"-"+&
	String(day(ld_1),"00")+") year to day) and "
End If

//If Not IsNull(ld_1) Then
//	ls_where+="(dt_muestras_col.fe_estado >= DATETIME("+&
//	String(year(ld_1),"0000")+"-"+String(month(ld_1),"00")+"-"+&
//	String(day(ld_1),"00")+") year to day) and "
//End If


ld_1=dw_criterio.GetItemDate(1,"fecha_dllo2")

If Not IsNull(ld_1) Then
	ls_where+="(m_muestras.fe_desarrollo <= DATETIME("+&
	String(year(ld_1),"0000")+"-"+String(month(ld_1),"00")+"-"+&
	String(day(ld_1),"00")+") year to day) and "
End If

ld_1=dw_criterio.GetItemDate(1,"fecha_ent1")

If Not IsNull(ld_1) Then
	ls_where+="(m_muestras.fe_entrega >= DATETIME("+&
	String(year(ld_1),"0000")+"-"+String(month(ld_1),"00")+"-"+&
	String(day(ld_1),"00")+") year to day) and "
End If

ld_1=dw_criterio.GetItemDate(1,"fecha_ent2")

If Not IsNull(ld_1) Then
	ls_where+="(m_muestras.fe_entrega <= DATETIME("+&
	String(year(ld_1),"0000")+"-"+String(month(ld_1),"00")+"-"+&
	String(day(ld_1),"00")+") year to day) and "
End If
//////////////////////////////////////////////////////////////////////////
// Quitar la ultima palabra and de la sentencia where
// 
//////////////////////////////////////////////////////////////////////////


ls_where=mid(ls_where,1,len(ls_where) - 4)

Return ls_where
end function

public function integer of_deshabilitarestados ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 09 de Febrero de 2004 HORA 11:38:12:131
// 
// Se dehabilitan los estados que se mencionan por Claudia Chapman
// a saber:
// 15 transicion
// 20 arpobada
// 21 rechazada
//////////////////////////////////////////////////////////////////////////
//long ll_tot,ll_pos
//
//ll_tot=dw_estados.RowCount()
//
//ll_pos=dw_estados.Find("co_estado=15",1,ll_tot)
//
//If ll_pos>0 Then
//	dw_estados.SetItem(ll_pos,"chk",0)
//End If
//
//ll_pos=dw_estados.Find("co_estado=20",1,ll_tot)
//
//If ll_pos>0 Then
//	dw_estados.SetItem(ll_pos,"chk",0)
//End If
//
//ll_pos=dw_estados.Find("co_estado=21",1,ll_tot)
//
//If ll_pos>0 Then
//	dw_estados.SetItem(ll_pos,"chk",0)
//End If
//
//ll_pos=dw_estados.Find("co_estado=22",1,ll_tot)
//
//If ll_pos>0 Then
//	dw_estados.SetItem(ll_pos,"chk",0)
//End If
//
Return 1
end function

public function integer of_detalle (long a_fila, dwobject a_dwo);
String ls_where="", ls_cad

String ls_cliente,ls_sucursal,ls_ejecutiva,ls_estilo
ls_where+=of_where(2)

long j,ll_tot_col
String ls_where1=""


ls_cliente=String(dw_reporte.GetItemNumber(a_fila,"co_cliente"))
ls_sucursal=String(dw_reporte.GetItemNumber(a_fila,"co_sucursal"))
ls_ejecutiva=String(dw_reporte.GetItemNumber(a_fila,"co_ejecutiva"))
ls_estilo=dw_reporte.GetItemString(a_fila,"co_ref_exp")

If a_dwo.name="co_cliente1" or a_dwo.name="co_sucursal" or a_dwo.name="de_cliente" or &
   a_dwo.name="tipo_muestra" Then
	ls_where1="(m_muestras.co_cliente="+ls_cliente+&
	") and (m_muestras.co_sucursal="+ls_sucursal+")"
	
ElseIf a_dwo.name="co_ejecutiva" or a_dwo.name="de_ejecutiva" then
	ls_where1="(m_muestras.co_cliente="+ls_cliente+&
	") and (m_muestras.co_sucursal="+ls_sucursal+&
	") and (m_muestras.co_ejecutiva="+ls_ejecutiva+")"	
ElseIf a_dwo.name="co_ref_exp" Then
	ls_where1="(m_muestras.co_cliente="+ls_cliente+&
	") and (m_muestras.co_sucursal="+ls_sucursal+&
	") and (m_muestras.co_ejecutiva="+ls_ejecutiva+&
	") and (m_muestras.co_ref_exp=~~'"+ls_estilo+"~~')"	
	
End If

If len(ls_where1)>0 Then
	ls_where=ls_where+" and "+ls_where1
End If

//Messagebox('Var','ls_where='+ls_where+'~n')

w_inf_ejecutiva  w_1


n_cst_param lo_param


lo_param.is_vector[1]=ls_where


OpenSheetWithParm(w_1,lo_param,ParentWindow(),2,Original!)

	
Return 1

end function

on w_reporte_ejecutiva.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_criterio=create dw_criterio
this.gb_2=create gb_2
this.dw_dinamica=create dw_dinamica
this.st_1=create st_1
this.dw_reporte=create dw_reporte
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.dw_criterio
this.Control[iCurrent+4]=this.gb_2
this.Control[iCurrent+5]=this.dw_dinamica
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.dw_reporte
this.Control[iCurrent+8]=this.gb_4
end on

on w_reporte_ejecutiva.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_criterio)
destroy(this.gb_2)
destroy(this.dw_dinamica)
destroy(this.st_1)
destroy(this.dw_reporte)
destroy(this.gb_4)
end on

event ue_find;call super::ue_find;String ls_sel1,ls_where,ls_modString,ls_err, ls_group

long i,ll_tot,ll_tot_col=1,j,ll_pos

dw_reporte.DataObject="d_inf_ejecutiva1"
dw_reporte.SetTransObject(n_cst_application.itr_appl)

//////////////////////////////////////////////////////////////////////////
// Se cambia la sentencia where
// 
//////////////////////////////////////////////////////////////////////////
ls_sel1=dw_reporte.Describe("DataWindow.Table.Select")

ls_where=of_where(2/*integer a_comillas */)

ll_pos=pos(ls_sel1,"GROUP BY")
	
If ll_pos>0 Then
		ls_Sel1=Left(ls_sel1, ll_pos -1)
End If
	
ls_group=" GROUP BY m_muestras.co_cliente, "+&  
         "m_muestras.co_sucursal, "+&  
         "m_muestras.tipo_muestra, "+&
         "m_muestras.co_ejecutiva, "+&
         "m_muestras.co_ref_exp "   


ls_modString="DataWindow.Table.Select='" &
		+ ls_sel1 +"  and "+ls_where+ls_group+ "'"	
		
ls_err=dw_reporte.Modify(ls_modString)
//Messagebox('Var','ls_modString='+ls_modString+'~n')


ll_tot=dw_reporte.Retrieve()


end event

event open;call super::open;//dw_estados.SetTransObject(n_cst_application.itr_appl)
dw_criterio.SetTransObject(n_cst_application.itr_appl)

of_inicio()

//dw_estados.Retrieve()

dw_criterio.InsertRow(0)

of_SetDataWindow(dw_reporte)

of_deshabilitarEstados()


end event

type cb_2 from commandbutton within w_reporte_ejecutiva
integer x = 2551
integer y = 96
integer width = 343
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Recuperar"
end type

event clicked;n_cst_config lo_config
//
//
//If lo_config.of_recuperar(dw_columnas)<>1 Then
//	Return
//End If
//
If lo_config.of_recuperar(dw_criterio)<>1 Then
	Return
End If

//If lo_config.of_recuperar(dw_estados)<>1 Then
//	Return
//End If
//
end event

type cb_1 from commandbutton within w_reporte_ejecutiva
integer x = 2194
integer y = 96
integer width = 343
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Guardar"
end type

event clicked;n_cst_config lo_config
//
//
//If lo_config.of_guardar(dw_columnas)<>1 Then
//	Return
//End If
//
If lo_config.of_guardar(dw_criterio)<>1 Then
	Return
End If
//
//If lo_config.of_guardar(dw_estados)<>1 Then
//	Return
//End If
end event

type dw_criterio from u_dw_application within w_reporte_ejecutiva
integer x = 96
integer y = 64
integer width = 1911
integer height = 472
integer taborder = 20
string dataobject = "d_ext_criterios"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;call super::getfocus;//
end event

event doubleclicked;call super::doubleclicked;If row=0 Then Return

String ls_tipo_sol

n_cst_param lo_param

lo_param.il_vector[1]=0

If dwo.name="co_cliente" or dwo.name="co_sucursal" Then
		
	ls_tipo_sol=GetItemString(1,"tipo")
	
	If IsNull(ls_tipo_sol) Then
		MessageBox("Advertencia!","Debe especificar el tipo de solicitud.",StopSign!)
		Return
	End If
	lo_param.is_vector[1]=""
	lo_param.is_vector[2]=ls_tipo_sol
	OpenWithParm(w_opc_cliente,lo_param)
	lo_param=Message.PowerObjectParm
//////////////////////////////////////////////////////////////////////////
// Si seleccionan algo en la ventana, entonces asigna el cliente, la sucursal y 
// llama el evento
//////////////////////////////////////////////////////////////////////////
	
	If IsValid(lo_param) Then
		SetItem(1,"co_cliente",lo_param.il_vector[1])
		SetItem(1,"co_sucursal",lo_param.il_vector[2])
		//is_where_cliente=lo_param.is_vector[1]
		
		DWObject dwo_1
		dwo_1 = This.Object.co_sucursal
		trigger event itemchanged(1,dwo_1,String(lo_param.il_vector[2]))
	End If
End If

If dwo.name="co_ejecutiva" Then
	lo_param.is_vector[1]=GetItemString(1,"tipo")
	OpenWithParm(w_bus_ejecutivo_vendedor,lo_param)
	lo_param=Message.powerObjectParm

	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If
	
End If
end event

event itemchanged;call super::itemchanged;String ls_tipo
n_cst_comun lo_comun

long ll_cliente,ll_sucursal,ll_res,ll_dato

If dwo.name="co_sucursal" Then
	ll_cliente=GetItemNumber(1,"co_cliente")
	ll_sucursal=Long(Data)
	ls_tipo=GetItemString(1,"tipo")
	ll_res=lo_comun.of_nombrecliente(ll_cliente /*long a_cliente*/,&
	                                 ll_sucursal/*long a_sucursal*/,&
												ls_tipo/*string a_tipocliente*/,&
												n_cst_application.itr_appl/*transaction a_transaction */)
												
	If ll_res=1 Then
		SetItem(1,"de_cliente",lo_comun.of_getString(1))
	Else
		SetItem(1,"de_cliente","")
	End If
	
End IF

If dwo.name="co_ejecutiva" Then
	ls_tipo=GetItemString(1,"tipo")
	ll_dato=Long(Data)
	
	ll_res=lo_comun.of_nombreejecutiva(ls_tipo /*string a_tipo*/,&
	                                   ll_dato/*long a_codigo*/,&
												  n_cst_application.itr_appl/*transaction a_transaction */)
   If ll_res<>1 Then
		MessageBox("Advertencia!","Ejecutiva no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_ejecutiva",lo_comun.of_getString(1))	
End If
end event

type gb_2 from groupbox within w_reporte_ejecutiva
integer x = 27
integer y = 12
integer width = 2030
integer height = 560
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Criterios"
end type

type dw_dinamica from u_dw_application within w_reporte_ejecutiva
boolean visible = false
integer x = 64
integer y = 1676
integer width = 2834
integer height = 232
integer taborder = 30
boolean titlebar = true
boolean controlmenu = true
boolean maxbox = true
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_reporte_ejecutiva
integer x = 1143
integer y = 1596
integer width = 1522
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Utilice el bot$$HEX1$$f300$$ENDHEX$$n derecho del mouse para ampliar o reducrir el Informe"
boolean focusrectangle = false
end type

type dw_reporte from u_dw_application within w_reporte_ejecutiva
integer x = 37
integer y = 596
integer width = 3328
integer height = 968
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_inf_ejecutiva1"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;call super::rbuttondown;//Messagebox('Var','x='+String(x)+'~n')
If x=5 Then
	x=37
	y=596
	width=3328
	height=968
	
Else
	x=5
	y=24
	width=3514
	height=1800
End If

end event

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 06 de Julio de 2004 HORA 13:51:44:468
// 
// Teniendo en cuenta la columna se hace un filtro diferente
//////////////////////////////////////////////////////////////////////////

If row<=0 Then Return

of_detalle(row,dwo)
end event

type gb_4 from groupbox within w_reporte_ejecutiva
integer x = 2089
integer y = 36
integer width = 1074
integer height = 156
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Configuraci$$HEX1$$f300$$ENDHEX$$n"
end type

