HA$PBExportHeader$w_lista_referencias_con_medida.srw
forward
global type w_lista_referencias_con_medida from w_sheet
end type
type st_1 from statictext within w_lista_referencias_con_medida
end type
type hpb_1 from hprogressbar within w_lista_referencias_con_medida
end type
type cb_2 from commandbutton within w_lista_referencias_con_medida
end type
type dw_2 from u_dw_application within w_lista_referencias_con_medida
end type
type cb_1 from commandbutton within w_lista_referencias_con_medida
end type
type dw_1 from u_dw_application within w_lista_referencias_con_medida
end type
type gb_1 from groupbox within w_lista_referencias_con_medida
end type
type gb_2 from groupbox within w_lista_referencias_con_medida
end type
type gb_3 from groupbox within w_lista_referencias_con_medida
end type
end forward

global type w_lista_referencias_con_medida from w_sheet
integer width = 3319
integer height = 1788
string title = "Generar archivos de referencias con medidas"
st_1 st_1
hpb_1 hpb_1
cb_2 cb_2
dw_2 dw_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_lista_referencias_con_medida w_lista_referencias_con_medida

forward prototypes
public function integer of_generarexcel (long aco_muestrario, long aco_fabrica, long aco_linea, long aco_referencia, long aco_recurso, long aco_talla, long aco_diseno, string ade_talla, string ade_diseno)
end prototypes

public function integer of_generarexcel (long aco_muestrario, long aco_fabrica, long aco_linea, long aco_referencia, long aco_recurso, long aco_talla, long aco_diseno, string ade_talla, string ade_diseno);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Martes 24 de Julio de 2007 HORA 10:48:08
// 
// 
//////////////////////////////////////////////////////////////////////////

long i,ll_tot,j,ll_ca_aguja,ll_nu_galga
OLEObject xlapp , xlsub
int ret
String ls_archivo, ls_referencia,ls_de_equipo,ls_co_tipprod,ls_forma_tejer  
decimal{2} lde_diam_cilindro,lde_produc,lde_seg
long ll_min,ll_seg,ll_t
// Create the oleobject variable xlapp
xlApp = Create OLEObject

// Connect to Excel and check the return code
ret = xlApp.ConnectToNewObject( "Excel.Sheet" )
if ret < 0 then
	MessageBox("Error Excel !",string(ret))
	return -1
end if

// Open a particular Excel file
xlApp.Application.Workbooks.Open("c:\export_muestras\plantilla.xls") //,false,true
// Make Excel visible
xlApp.Application.Visible = true

// Resolve the Excel reference once
// This technique shortens the script and improves performance
xlsub = xlapp.Application.ActiveWorkbook.Worksheets[1]

// Loop thru the Datawindow and Excel sheet
// The for/next loop copies all rows for each column
//For c = 1 to numcols
//For r = 1 to numrows
//xlsub.cells[r,c] = dw_1.object.data[r,c]
//
//Next
//Next
//
//xlsub.range("B2:D3").Interior.ColorIndex = 6
//xlsub.range("B2:D3").Interior.Pattern = xlSolid

ls_referencia=String(aco_fabrica)+"-"+String(aco_linea)+"-"+&
              String(aco_referencia)

xlsub.range("I5").VALUE=ls_referencia
xlsub.range("I7").VALUE=Trim(ade_talla)
xlsub.range("I9").VALUE=Trim(ade_diseno)
xlsub.range("I11").VALUE=aco_recurso

//////////////////////////////////////////////////////////////////////////
// Martes 24 de Julio de 2007 HORA 15:57:08
// 
// Se asignan los datos de la galga
//////////////////////////////////////////////////////////////////////////

//
//  SELECT m_recursos_tj.diam_cilindro,   
//         m_recursos_tj.ca_aguja,   
//         m_recursos_tj.nu_galga,   
//         m_recursos_tj.de_modelo  
//    INTO :lde_diam_cilindro,   
//         :ll_ca_aguja,   
//         :ll_nu_galga,   
//         :ls_de_equipo  
//    FROM m_recursos_tj  
//  WHERE ( m_recursos_tj.co_recurso = :aco_recurso )   
//           using n_cst_application.itr_appl  ;
//
//If n_cst_application.itr_appl.SQLcode=-1 Then
//	PopulateError(20,"SQL Error")
//	n_cst_application.of_sql_error(n_cst_application.itr_appl)
//	Return -1
//End If



//xlsub.range("B9").VALUE=String(lde_diam_cilindro)+"X"+String(ll_ca_aguja)+&
//"-"+String(ll_nu_galga)
//
//xlsub.range("B8").VALUE=ls_de_equipo
//

  SELECT h_preref.bpl_co_tipprod  
    INTO :ls_co_tipprod  
    FROM h_preref  
   WHERE ( h_preref.co_fabrica = :aco_fabrica ) AND  
         ( h_preref.co_linea = :aco_linea ) AND  
         ( h_preref.co_referencia = :aco_referencia )    
           using n_cst_application.itr_appl  ;

If n_cst_application.itr_appl.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

If ls_co_tipprod="M" Then
	ls_forma_tejer="NORMAL"
ElseIf ls_co_tipprod="L" Then
	ls_forma_tejer="IZQ-DER"
End IF

xlsub.range("I8").VALUE=ls_forma_tejer
//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Martes 24 de Julio de 2007 HORA 11:29:06
// 
// Se ingresan las medidas de la referencia
//////////////////////////////////////////////////////////////////////////

n_ds_application lds_1

lds_1=create n_ds_application

lds_1.DataObject="d_inf_det_ref_bas"

lds_1.SetTransObject(n_cst_application.itr_appl)

ll_tot=lds_1.Retrieve(12 /*centro*/,12 /*subcentro*/,aco_recurso,&
                      aco_fabrica,aco_linea,aco_referencia,aco_talla,1/*calid*/, &
							 aco_diseno)
String ls_de_partebas,ls_ca_cm,ls_cadena,ls_pasadas,ls_de_observacion,ls_med_rep
j=0
For i=1 to ll_tot
	ls_de_partebas=lds_1.GetItemString(i,"de_partebas")
	ls_ca_cm=lds_1.GetItemString(i,"ca_cm")
	ls_cadena=lds_1.GetItemString(i,"cadena")
	ls_pasadas=lds_1.GetItemString(i,"pasadas")
	ls_de_observacion=lds_1.GetItemString(i,"de_observacion")
	
	xlsub.range("A"+String(14+i)).VALUE=Trim(ls_de_partebas)
	xlsub.range("G"+String(14+i)).VALUE=Trim(ls_ca_cm)
	xlsub.range("H"+String(14+i)).VALUE=Trim(ls_cadena)
	xlsub.range("I"+String(14+i)).VALUE=Trim(ls_pasadas)
	
	If Len(Trim(ls_de_observacion))>0 then
		j=j+2
		xlsub.range("M"+String(14+j)).VALUE=Trim(ls_de_partebas)
		xlsub.range("P"+String(14+j)).VALUE=Trim(ls_de_observacion)
	End If
Next

//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Martes 24 de Julio de 2007 HORA 15:04:20
// 
// Se genera el listado de medidas reposadas
//////////////////////////////////////////////////////////////////////////
lds_1.DataObject="d_inf_det_ref1_bas"

lds_1.SetTransObject(n_cst_application.itr_appl)

ll_tot=lds_1.Retrieve(12 /*centro*/,12 /*subcentro*/,aco_recurso,&
                      aco_fabrica,aco_linea,aco_referencia,aco_talla,1/*calid*/, &
							 aco_diseno)

j=0
For i=1 to ll_tot
	ls_med_rep=String(lds_1.GetItemDecimal(i,"ca_cm"))
	
	xlsub.range("Q"+String(8+i)).VALUE=ls_med_rep
Next
//////////////////////////////////////////////////////////////////////////
// Martes 24 de Julio de 2007 HORA 16:40:00
// 
// Se ingresa la teorica de las referencias
//////////////////////////////////////////////////////////////////////////

lds_1.DataObject="d_m_producc_teo"

lds_1.SetTransObject(n_cst_application.itr_appl)

ll_tot=lds_1.Retrieve(aco_recurso,&
                      aco_fabrica,aco_linea,aco_referencia,aco_talla,1/*calid*/)

If ll_tot>0 Then

	
	lde_produc=lds_1.GetItemNumber(1,"produccion_teo")
	lde_seg=1200/lde_produc
	
	ll_min=Truncate(lde_seg/60,0)
	ll_seg=lde_seg - ll_min * 60
	
	If IsNull(ll_min) Then ll_min=0
	
	If IsNull(ll_seg) Then ll_seg=0
	
	xlsub.range("B13").VALUE=ll_min
	xlsub.range("C13").VALUE=ll_seg
End If

Destroy lds_1
//

//xlsub.range("B16").VALUE=6

// clean up
ls_archivo="c:\export_muestras\FT-"+&
           String(aco_fabrica)+"-"+String(aco_linea)+"-"+String(aco_referencia)+"-"+&
           String(aco_talla)+"-"+String(aco_diseno)+"-"+String(aco_recurso)+".xls"
			  
xlApp.Application.ActiveWorkbook.SaveAs(ls_archivo)			  
xlApp.Application.ActiveWorkbook.Close()
xlApp.DisConnectObject()
Destroy xlapp

Return 1
end function

on w_lista_referencias_con_medida.create
int iCurrent
call super::create
this.st_1=create st_1
this.hpb_1=create hpb_1
this.cb_2=create cb_2
this.dw_2=create dw_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.hpb_1
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.dw_2
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.dw_1
this.Control[iCurrent+7]=this.gb_1
this.Control[iCurrent+8]=this.gb_2
this.Control[iCurrent+9]=this.gb_3
end on

on w_lista_referencias_con_medida.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_1)
destroy(this.hpb_1)
destroy(this.cb_2)
destroy(this.dw_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;call super::open;dw_1.InsertRow(0)
dw_2.SetTransObject(n_cst_application.itr_appl)

dw_2.SetTabOrder(1, 0)
dw_2.SetTabOrder(2, 0)
dw_2.SetTabOrder(3, 0)
dw_2.SetTabOrder(4, 0)
dw_2.SetTabOrder(5, 0)
end event

type st_1 from statictext within w_lista_referencias_con_medida
integer x = 2350
integer y = 1372
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type hpb_1 from hprogressbar within w_lista_referencias_con_medida
integer x = 50
integer y = 1452
integer width = 2642
integer height = 68
unsignedinteger maxposition = 100
integer setstep = 5
end type

type cb_2 from commandbutton within w_lista_referencias_con_medida
integer x = 2331
integer y = 812
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Generar"
end type

event clicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Martes 24 de Julio de 2007 HORA 10:44:00
// 
// Se genera un listado de archivos para las referencias especificadas
//////////////////////////////////////////////////////////////////////////

long i, ll_tot

long ll_co_muestrario,ll_co_fabrica,ll_co_linea,ll_co_referencia,ll_co_talla,ll_diseno,ll_recurso
String ls_de_talla,ls_de_diseno

ll_tot=dw_2.RowCount()


For i=1 to ll_tot
	ll_co_muestrario=dw_2.GetItemNumber(i,"co_muestrario")
	ll_co_fabrica=dw_2.GetItemNumber(i,"co_fabrica")
	ll_co_linea=dw_2.GetItemNumber(i,"co_linea")
	ll_co_referencia=dw_2.GetItemNumber(i,"co_referencia")
	ll_co_talla=dw_2.GetItemNumber(i,"co_talla")
	ll_diseno=dw_2.GetItemNumber(i,"co_diseno")
	ll_recurso=dw_2.GetItemNumber(i,"co_recurso")
	ls_de_talla=dw_2.GetItemString(i,"de_talla")
	ls_de_diseno=dw_2.GetItemString(i,"de_diseno")
	
	of_generarExcel(ll_co_muestrario,ll_co_fabrica,ll_co_linea,&
	ll_co_referencia,ll_recurso,ll_co_talla,ll_diseno,ls_de_talla,&
	ls_de_diseno)	
	
   hpb_1.position=i/ll_tot*100
	st_1.text=String(i/ll_tot*100,"###.00")
	yield()
Next
end event

type dw_2 from u_dw_application within w_lista_referencias_con_medida
integer x = 69
integer y = 384
integer width = 2208
integer height = 816
integer taborder = 30
string dataobject = "d_lista_ref_con_med"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_lista_referencias_con_medida
integer x = 2331
integer y = 132
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Recuperar"
end type

event clicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Martes 24 de Julio de 2007 HORA 10:18:31
// 
// Se toman los datos de los parametros para recuperar el informe
//////////////////////////////////////////////////////////////////////////



long ll_co_muestrario,ll_co_fabrica,ll_co_linea,ll_co_referencia,ll_co_talla,ll_diseno,&
     ll_tot,ll_co_recurso


If dw_1.AcceptText()<>1 Then
	Return
End If

ll_co_muestrario=dw_1.GetItemNumber(1,"co_muestrario")
ll_co_fabrica=dw_1.GetItemNumber(1,"co_fabrica")
ll_co_linea=dw_1.GetItemNumber(1,"co_linea")
ll_co_referencia=dw_1.GetItemNumber(1,"co_referencia")
ll_co_talla=dw_1.GetItemNumber(1,"co_talla")
ll_diseno=dw_1.GetItemNumber(1,"co_diseno")
ll_co_recurso=dw_1.GetItemNumber(1,"co_recurso")

ll_tot=dw_2.Retrieve(ll_co_muestrario,ll_co_fabrica,ll_co_linea,&
              ll_co_referencia,ll_co_recurso)
				  
If ll_tot<=0 Then
	MessageBox("Advertencia!","No se encontraron referencias.",StopSign!)
End If
end event

type dw_1 from u_dw_application within w_lista_referencias_con_medida
integer x = 69
integer y = 88
integer width = 2208
integer height = 196
string dataobject = "d_lista_ref_con_med"
boolean vscrollbar = false
boolean livescroll = false
end type

type gb_1 from groupbox within w_lista_referencias_con_medida
integer x = 18
integer y = 24
integer width = 2738
integer height = 272
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Criterios para seleccionar las referencias"
end type

type gb_2 from groupbox within w_lista_referencias_con_medida
integer x = 18
integer y = 320
integer width = 2738
integer height = 956
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lista de referencias con medidas"
end type

type gb_3 from groupbox within w_lista_referencias_con_medida
integer x = 18
integer y = 1320
integer width = 2738
integer height = 236
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Avance"
end type

