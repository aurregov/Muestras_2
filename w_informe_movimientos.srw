HA$PBExportHeader$w_informe_movimientos.srw
forward
global type w_informe_movimientos from w_sheet
end type
type dw_datos from u_dw_application within w_informe_movimientos
end type
type cb_1 from commandbutton within w_informe_movimientos
end type
type dw_1 from u_dw_application within w_informe_movimientos
end type
type gb_1 from groupbox within w_informe_movimientos
end type
end forward

global type w_informe_movimientos from w_sheet
integer width = 1792
integer height = 784
string title = "Informe de movimientos"
dw_datos dw_datos
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_informe_movimientos w_informe_movimientos

type prototypes
Public Function Long ShellExecute (Long hWnd, String lpOperation, String lpFile, String lpParameters, String lpDirectory, Long nShowCmd) Library "shell32.dll" Alias For "ShellExecuteA;Ansi"



end prototypes

type variables
integer ii_FileNum
Constant Long SW_SHOWNORMAL = 1
end variables

forward prototypes
public function integer of_generarhtml ()
public function integer of_add (string a_texto)
end prototypes

public function integer of_generarhtml ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Jueves 03 de Marzo de 2005 HORA 17:16:09:406
// 
// Genera el informe de los grupos
//////////////////////////////////////////////////////////////////////////
DateTime ldt_fecha
String ls_fileName

String ls_directorio,ls_dato

n_cst_file_application lo_1

//ls_directorio=GetCurrentDirectory()
ls_directorio=lo_1.of_gettempdirectory()

//n_cst_application.Of_GetProFile(n_cst_application.is_pathfileconf,&
//					n_cst_application.is_sessionapp,"HTMLFOLDER")
If ls_directorio="" or IsNull(ls_directorio) Then
	MessageBox("Advertencia!","No se pudo crear el archivo.",StopSign!)
	Return -1
	//ls_directorio=GetCurrentDirectory()		
End If


ls_fileName=ls_directorio+"movimientos_realizados.html"

//Messagebox('Var','ls_fileName='+ls_fileName+'~n')

FileDelete (ls_fileName)

//If Not FileDelete (ls_fileName) Then
//	Return -1
//End If

//
ii_FileNum = FileOpen(ls_fileName, &
        LineMode!, Write!, LockWrite!, Append!)


of_add("<HTML><HEAD>")

of_add("<STYLE type=text/css>table.mtable td {border-bottom:2px solid #C1CDD8 ; border-right:1px solid #C1CDD8}.tdetest {background-color: #cff8fc; color: #000000; font-family: Verdana, Arial, sans-serif; font-size: 10px; font-weight: normal; } .tdetestb {background-color: #ffffff; color: #000000; font-family: Verdana, Arial, sans-serif; font-size: 10px; font-weight: normal; } .cellblue { background-color: #6651b0; color: #ffffff; font-family: Verdana, Arial, sans-serif; font-size: 11px; font-weight: bold; } </STYLE>")

of_add("</HEAD>")

of_add("<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginheight=~"0~" ")

of_add("marginwidth=~"0~">")


of_add("<TABLE class=mtable cellSpacing=0 cellPadding=0 width=~"100%~" border=0>")

of_add("<TBODY>")

of_add("<TR class=cellblue>")

of_add("<TD>ORDEN</TD>")

of_add("<TD>TAREA</TD>")

of_add("<TD>AGUJAS</TD>")

of_add("<TD>DIAMETRO</TD>")

of_add("<TD>FECHA INICIAL</TD>")

of_add("<TD>FECHA FINAL</TD>")

of_add("<TD>MINUTOS PARO</TD>")

of_add("<TD>USUARIO INICIA</TD>")

of_add("<TD>USUARIO FINALIZA</TD>")

of_add("<TD>DESCRIPCION USUARIO FINALIZA</TD>")

of_add("<TD>TIMPO TAREA</TD>")

of_add("</tr>")

long i,ll_can,ll_grupo,ll_dato,j,ll_tot

decimal lde_dato

ll_tot=dw_datos.RowCount()

For i=1 To ll_tot
	
	If mod(i,2)=0 Then
		of_add("<TR class=tdetest>")
	Else
		of_add("<TR class=tdetestb>")
	End If	

	of_add("<TD>")
	ll_dato=dw_datos.GetItemNumber(i,"nu_orden")
	of_add(String(ll_dato))
	of_add("</TD>")

	of_add("<TD>")
	ls_dato=dw_datos.GetItemString(i,"tarea")
	of_add(Trim(ls_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ll_dato=dw_datos.GetItemNumber(i,"agujas")
	of_add(String(ll_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	lde_dato=dw_datos.GetItemDecimal(i,"diametro")
	of_add(String(lde_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ldt_fecha=dw_datos.GetItemDatetime(i,"fe_ini")
	of_add(String(ldt_fecha))
	of_add("</TD>")
	
	of_add("<TD>")
	ldt_fecha=dw_datos.GetItemDatetime(i,"fe_fin")
	of_add(String(ldt_fecha))
	of_add("</TD>")

	of_add("<TD>")
	ll_dato=dw_datos.GetItemNumber(i,"min_paro")
	of_add(String(ll_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ls_dato=dw_datos.GetItemString(i,"co_ctecnicoi")
	of_add(Trim(ls_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ls_dato=dw_datos.GetItemString(i,"co_ctecnicof")
	of_add(Trim(ls_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ls_dato=dw_datos.GetItemString(i,"finaliza")
	of_add(Trim(ls_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ls_dato=dw_datos.GetItemString(i,"tiempo")
	of_add(Trim(ls_dato))
	of_add("</TD>")

	of_add("</TR>")
Next

of_add("</TABLE>")	
of_add("</BODY></HTML>")
FileClose(ii_FileNum)

ShellExecute (0, "", ls_fileName, "", "", SW_SHOWNORMAL)

Return 1
end function

public function integer of_add (string a_texto);If IsNull(a_texto) Then
	a_texto=""
End If
 
FileWrite(ii_FileNum, a_texto)

Return 1


end function

on w_informe_movimientos.create
int iCurrent
call super::create
this.dw_datos=create dw_datos
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_datos
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.gb_1
end on

on w_informe_movimientos.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_datos)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Jueves 03 de Marzo de 2005 HORA 17:41:33:953
// 
// 
//////////////////////////////////////////////////////////////////////////

dw_1.InsertRow(0)
end event

type dw_datos from u_dw_application within w_informe_movimientos
boolean visible = false
integer x = 41
integer y = 496
integer width = 608
integer taborder = 20
string dataobject = "d_movimientos_realizados"
boolean vscrollbar = false
boolean livescroll = false
end type

event itemerror;call super::itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 13 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Long ll_null
//-------------------------------------------------
If dwo.name = 'cantidad_colas' Then
	If Long(Data)=0 Then		
		SetNull(ll_null)
		This.SetItem(row,String(dwo.name),ll_null)
		Return 3
	End If
End If

If dwo.name='de_grupo' Then
		Return 1	
End If

end event

type cb_1 from commandbutton within w_informe_movimientos
integer x = 1120
integer y = 128
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Generar"
end type

event clicked;If dw_1.AcceptText()<>1 Then
	Return
End If
Datetime ldt_ini,ldt_fin

ldt_ini=dw_1.GetItemDateTime(1,"fe_ini")
ldt_fin=dw_1.GetItemDateTime(1,"fe_fin")

ldt_ini=Datetime(Date(ldt_ini),Time(00:00:00))
ldt_fin=Datetime(Date(ldt_fin),Time(23:59:59))

dw_datos.SetTransObject(n_cst_application.itr_appl)

dw_datos.Retrieve(ldt_ini,ldt_fin)

of_generarhtml( )
end event

type dw_1 from u_dw_application within w_informe_movimientos
integer x = 78
integer y = 84
integer width = 1038
integer height = 200
string dataobject = "d_ext_rango_datetime"
boolean vscrollbar = false
boolean livescroll = false
end type

event doubleclicked;call super::doubleclicked;	String ls_tipo 
	n_cst_param lo_param
	n_cst_comun luo_comun



If dwo.name='co_ctecnico' Then
		OpenWithParm(w_bus_m_ctecnico,lo_param)
		lo_param=Message.PowerObjectParm
		If IsValid(lo_param) Then
			SetText(String(lo_param.is_vector[1]))
			AcceptText()
			SetColumn('de_ejecutiva')			
		End If
End If

If dwo.name='co_ejecutiva' Then
		ls_tipo=GetItemString(1,"tipo_muestra")
		If IsNull(ls_tipo) Then
			MessageBox("Advertencia!","Debe especificar el tipo de muestra.",StopSign!)
			Return
		End If
		lo_param.is_vector[1] = ls_tipo
		OpenWithParm(w_bus_ejecutivo_vendedor,lo_param)
		lo_param=Message.PowerObjectParm
		If IsValid(lo_param) Then
			SetText(String(lo_param.il_vector[1]))
			AcceptText()
			SetColumn('de_ejecutiva')			
		End If
End If
end event

event itemchanged;call super::itemchanged;String ls_tipo_muestra
long ll_res
n_cst_comun_orden luo_comun

If dwo.name='co_ejecutiva' Then
	ls_tipo_muestra = This.GetItemString(1,'tipo_muestra')
	If IsNull(ls_tipo_muestra) Then
		MessageBox("Advertencia!","Especifique tipo de muestra.",StopSign!)
		Return 2
	End If

	If IsNull(Data) Then
		SetItem(1,"de_ejecutiva","")
		Return 0
	End If
	ll_res= luo_comun.of_nombreejecutiva(ls_tipo_muestra,Long(Data), &
													  n_cst_application.itr_appl)
													  
	If ll_res<>1 Then
		MessageBox('Advertencia',&
		'Ejecutiva no v$$HEX1$$e100$$ENDHEX$$lida.',StopSign!)
		Return 2
	End If
	
	This.SetItem(1,'de_ejecutiva',luo_comun.of_getstring(1))														  

End If	

If dwo.name='co_ctecnico' Then
	If IsNull(Data)Then 
		SetItem(1,"de_desarrollador",'')
		Return 0
	End If

	ll_res=luo_comun.of_nombredesarrollador(Lower(Data),n_cst_application.itr_appl)
	If ll_res<>1 then
		MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo del Desarrollador no es v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_desarrollador",Trim(luo_comun.of_getString(1)))		
End If
end event

type gb_1 from groupbox within w_informe_movimientos
integer x = 46
integer y = 12
integer width = 1600
integer height = 324
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Especificar criterio"
end type

