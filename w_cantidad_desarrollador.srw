HA$PBExportHeader$w_cantidad_desarrollador.srw
$PBExportComments$Reporte de cantidades por desarrollador
forward
global type w_cantidad_desarrollador from w_sheet
end type
type rb_estado_otros from radiobutton within w_cantidad_desarrollador
end type
type rb_dllador from radiobutton within w_cantidad_desarrollador
end type
type st_1 from statictext within w_cantidad_desarrollador
end type
type dw_reporte from u_dw_application within w_cantidad_desarrollador
end type
type dw_fechas from u_dw_application within w_cantidad_desarrollador
end type
type gb_1 from groupbox within w_cantidad_desarrollador
end type
type gb_2 from groupbox within w_cantidad_desarrollador
end type
type gb_3 from groupbox within w_cantidad_desarrollador
end type
end forward

global type w_cantidad_desarrollador from w_sheet
integer width = 3543
integer height = 1868
string title = "Cantidades de muestras por desarrollador"
rb_estado_otros rb_estado_otros
rb_dllador rb_dllador
st_1 st_1
dw_reporte dw_reporte
dw_fechas dw_fechas
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_cantidad_desarrollador w_cantidad_desarrollador

forward prototypes
public function integer of_detalle (long a_fila)
end prototypes

public function integer of_detalle (long a_fila);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 29 de Enero de 2004 HORA 11:13:03:158
// 
// Muestra el detalle de la fila a la que se hace doble click
//////////////////////////////////////////////////////////////////////////

Date ld_1,ld_2

ld_1=dw_fechas.GetItemDate(1,"fecha1")
ld_2=dw_fechas.GetItemDate(1,"fecha2")

String ls_where="", ls_cad


ls_where+="m_muestras.fe_desarrollo >= DATETIME("+&
String(year(ld_1),"0000")+"-"+String(month(ld_1),"00")+"-"+&
String(day(ld_1),"00")+") year to day and "


ls_where+="m_muestras.fe_desarrollo <= DATETIME("+&
String(year(ld_2),"0000")+"-"+String(month(ld_2),"00")+"-"+&
String(day(ld_2),"00")+") year to day and "

String ls_desarrollador

long ll_estado

ll_estado=dw_reporte.GetItemNumber(a_fila,"co_estado")

ls_desarrollador=dw_reporte.GetItemString(a_fila,"desarrollador")

ls_where+="m_muestras.desarrollador like ~~'%"+ls_desarrollador+"%~~' and "

ls_where+="dt_muestras_col.co_estado="+String(ll_estado)

If rb_estado_otros.Checked Then
	ls_where+=" and "
	
	ls_cad=String(dw_reporte.GetItemNumber(a_fila,"co_ejecutiva"))
	
	If Not IsNull(ls_cad) Then
		ls_where+="m_muestras.co_ejecutiva="+ls_cad+" and "
	End If
	
	
	ls_cad=String(dw_reporte.GetItemNumber(a_fila,"co_cliente"))
	
	If Not IsNull(ls_cad) Then
		ls_where+="m_muestras.co_cliente="+ls_cad
	End If

End If

ls_where+=")"

w_inf_muestras  w_1


n_cst_param lo_param


lo_param.is_vector[1]=ls_where


OpenSheetWithParm(w_1,lo_param,ParentWindow(),2,Original!)

	
Return 1

end function

on w_cantidad_desarrollador.create
int iCurrent
call super::create
this.rb_estado_otros=create rb_estado_otros
this.rb_dllador=create rb_dllador
this.st_1=create st_1
this.dw_reporte=create dw_reporte
this.dw_fechas=create dw_fechas
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_estado_otros
this.Control[iCurrent+2]=this.rb_dllador
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.dw_reporte
this.Control[iCurrent+5]=this.dw_fechas
this.Control[iCurrent+6]=this.gb_1
this.Control[iCurrent+7]=this.gb_2
this.Control[iCurrent+8]=this.gb_3
end on

on w_cantidad_desarrollador.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.rb_estado_otros)
destroy(this.rb_dllador)
destroy(this.st_1)
destroy(this.dw_reporte)
destroy(this.dw_fechas)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;call super::open;dw_fechas.InsertRow(0)

dw_reporte.SetTransObject(n_cst_application.itr_appl)
end event

event ue_find;call super::ue_find;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 29 de Enero de 2004 HORA 10:18:36:637
// 
// Se recuperan los datos de acuerdo a las fechas 
//////////////////////////////////////////////////////////////////////////
Date ld_1,ld_2

If dw_fechas.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If


ld_1=dw_fechas.GetItemDate(1,"fecha1")
ld_2=dw_fechas.GetItemDate(1,"fecha2")

dw_reporte.SetTransObject(n_cst_application.itr_appl)

dw_reporte.Retrieve(ld_1,ld_2)


end event

type rb_estado_otros from radiobutton within w_cantidad_desarrollador
integer x = 1381
integer y = 184
integer width = 791
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estado/Dllador/Ejecutivo/Cliente"
boolean checked = true
borderstyle borderstyle = stylelowered!
end type

event clicked;dw_reporte.dataobject="d_cantidad_desarrollador"
end event

type rb_dllador from radiobutton within w_cantidad_desarrollador
integer x = 1381
integer y = 88
integer width = 686
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desarrollador/Estado"
borderstyle borderstyle = stylelowered!
end type

event clicked;dw_reporte.dataObject="d_cantidad_desarrollador_solo"
end event

type st_1 from statictext within w_cantidad_desarrollador
integer x = 110
integer y = 1488
integer width = 1435
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Haga doble click en el desarrollador para ver detalle de muestras"
boolean focusrectangle = false
end type

type dw_reporte from u_dw_application within w_cantidad_desarrollador
integer x = 78
integer y = 448
integer width = 3209
integer height = 1008
integer taborder = 20
string dataobject = "d_cantidad_desarrollador"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 29 de Enero de 2004 HORA 11:30:35:868
// 
// detalle
//////////////////////////////////////////////////////////////////////////
If row=0 Then Return

of_detalle(row)
end event

type dw_fechas from u_dw_application within w_cantidad_desarrollador
integer x = 169
integer y = 68
integer width = 942
integer height = 208
string dataobject = "d_ext_fechas_rango"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;call super::getfocus;//////////////////////////////////////////////////////////////////////////
// overwrite!!
// 
//////////////////////////////////////////////////////////////////////////

end event

type gb_1 from groupbox within w_cantidad_desarrollador
integer x = 41
integer y = 16
integer width = 1257
integer height = 352
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fechas"
borderstyle borderstyle = stylelowered!
end type

type gb_2 from groupbox within w_cantidad_desarrollador
integer x = 41
integer y = 384
integer width = 3342
integer height = 1188
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cantidades por desarrollador"
borderstyle borderstyle = stylelowered!
end type

type gb_3 from groupbox within w_cantidad_desarrollador
integer x = 1321
integer y = 16
integer width = 955
integer height = 352
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Datos"
borderstyle borderstyle = stylelowered!
end type

