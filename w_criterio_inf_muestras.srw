HA$PBExportHeader$w_criterio_inf_muestras.srw
$PBExportComments$Criterio para el informe de muestras
forward
global type w_criterio_inf_muestras from w_response
end type
type cb_2 from commandbutton within w_criterio_inf_muestras
end type
type cb_1 from commandbutton within w_criterio_inf_muestras
end type
type dw_1 from u_dw_application within w_criterio_inf_muestras
end type
type gb_1 from groupbox within w_criterio_inf_muestras
end type
end forward

global type w_criterio_inf_muestras from w_response
integer x = 0
integer y = 0
integer width = 2679
integer height = 852
string title = "Lista de solicitudes"
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_criterio_inf_muestras w_criterio_inf_muestras

on w_criterio_inf_muestras.create
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

on w_criterio_inf_muestras.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;call super::open;DatawindowChild ldc_1

dw_1.GetChild("tipo_tejido",ldc_1)
ldc_1.SetTransObject(n_cst_application.itr_appl)

//////////////////////////////////////////////////////////////////////////
// Se muestran solo los tipos de tejido para calcetines
// 
//////////////////////////////////////////////////////////////////////////

ldc_1.Retrieve(10)


dw_1.SetTransObject(n_cst_application.itr_appl)
dw_1.InsertRow(0)

end event

type cb_2 from commandbutton within w_criterio_inf_muestras
integer x = 1321
integer y = 600
integer width = 485
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

event clicked;close(Parent)
end event

type cb_1 from commandbutton within w_criterio_inf_muestras
integer x = 827
integer y = 600
integer width = 485
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

event clicked;String ls_cad,ls_where

If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If


ls_cad=String(dw_1.GetItemNumber(1,"co_fabrica"))

If Not IsNull(ls_cad) Then
	ls_where+="m_muestras.co_fabrica="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"co_linea"))

If Not IsNull(ls_cad) Then
	ls_where+="m_muestras.co_linea="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"co_muestra"))

If Not IsNull(ls_cad) Then
	ls_where+="m_muestras.co_muestra="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"nu_solicitud"))

If Not IsNull(ls_cad) Then
	ls_where+="m_muestras.nu_solicitud="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"co_cliente"))

If Not IsNull(ls_cad) Then
	ls_where+="m_muestras.co_cliente="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"co_sucursal"))

If Not IsNull(ls_cad) Then
	ls_where+="m_muestras.co_sucursal="+ls_cad+" and "
End If

//dt_muestras_col.co_estado
ls_cad=String(dw_1.GetItemNumber(1,"co_estado"))

If Not IsNull(ls_cad) Then
	ls_where+="dt_muestras_col.co_estado="+ls_cad+" and "
End If



ls_cad=dw_1.GetItemString(1,"desarrollador")

If Not IsNull(ls_cad) Then
	ls_where+="m_muestras.desarrollador like ~~'%"+ls_cad+"%~~' and "
End If        

//h_solicitudes.co_ejecutiva
ls_cad=String(dw_1.GetItemNumber(1,"ejecutiva"))

If Not IsNull(ls_cad) Then
	ls_where+="h_solicitudes.co_ejecutiva="+ls_cad+" and "
End If

//co_diseno_muestra
ls_cad=dw_1.GetItemString(1,"diseno")

If Not IsNull(ls_cad) Then
	ls_where+="m_muestras.co_diseno_muestra like ~~'%"+ls_cad+"%~~' and "
End If    

//h_solicitudes.fe_solicitud
//f_ini_solicitud
Date ld_fecha
Datetime ldt_1

ldt_1=dw_1.GetItemDateTime(1,"f_ini_solicitud")

If Not IsNull(ldt_1) Then
	ld_fecha=Date(ldt_1)
	ls_where+="m_muestras.fe_desarrollo >= DATETIME("+&
	String(year(ld_fecha),"0000")+"-"+String(month(ld_fecha),"00")+"-"+&
	String(day(ld_fecha),"00")+") year to day and "
End If

//f_fin_solicitud
ldt_1=dw_1.GetItemDateTime(1,"f_fin_solicitud")

If Not IsNull(ldt_1) Then
	ld_fecha=Date(ldt_1)
	ls_where+="m_muestras.fe_desarrollo <= DATETIME("+&
	String(year(ld_fecha))+"-"+String(month(ld_fecha))+"-"+&
	String(day(ld_fecha))+") year to day and "
End If
//m_muestras.co_tipo_tejido
ls_cad=String(dw_1.GetItemNumber(1,"tipo_tejido"))

If Not IsNull(ls_cad) Then
	ls_where+="m_muestras.co_tipo_tejido="+ls_cad+" and "
End If


If Right(ls_where,4)="and " Then
	ls_where=left(ls_where, len(ls_where) - 4)+")"
	
End If

//Messagebox('Var','ls_where='+ls_where+'~n')
n_cst_param lo_param

lo_param.is_vector[1]=ls_where

CloseWithReturn(Parent,lo_param)
end event

type dw_1 from u_dw_application within w_criterio_inf_muestras
integer x = 41
integer y = 76
integer width = 2546
integer height = 404
string dataobject = "d_ext_criterio_inf_muestras"
boolean vscrollbar = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 18 de Septiembre de 2003 HORA 17:10:10:593
// 
// overwrite!!
//////////////////////////////////////////////////////////////////////////

end event

type gb_1 from groupbox within w_criterio_inf_muestras
integer x = 18
integer y = 16
integer width = 2597
integer height = 524
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Criterio de busqueda"
borderstyle borderstyle = stylelowered!
end type

