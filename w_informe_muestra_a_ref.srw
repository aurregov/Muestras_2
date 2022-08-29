HA$PBExportHeader$w_informe_muestra_a_ref.srw
$PBExportComments$Informe de muestras pasadas a referencias
forward
global type w_informe_muestra_a_ref from w_sheet
end type
type dw_datos from u_dw_application within w_informe_muestra_a_ref
end type
type cb_1 from commandbutton within w_informe_muestra_a_ref
end type
type dw_param from u_dw_application within w_informe_muestra_a_ref
end type
type gb_1 from groupbox within w_informe_muestra_a_ref
end type
end forward

global type w_informe_muestra_a_ref from w_sheet
integer width = 1842
integer height = 1128
string title = "Informe de muestras pasadas a referencia"
dw_datos dw_datos
cb_1 cb_1
dw_param dw_param
gb_1 gb_1
end type
global w_informe_muestra_a_ref w_informe_muestra_a_ref

type prototypes
Public Function Long ShellExecute (Long hWnd, String lpOperation, String lpFile, String lpParameters, String lpDirectory, Long nShowCmd) Library "shell32.dll" Alias For "ShellExecuteA;Ansi"



end prototypes

type variables
integer ii_FileNum
Constant Long SW_SHOWNORMAL = 1
DataWindowChild idwc_fabrica, idwc_linea, idwc_tipo_muestra
end variables

forward prototypes
public function integer of_generarhtml ()
public function integer of_add (string a_texto)
public subroutine wf_asignardataobject (readonly long al_data)
public subroutine wf_limpiarcampos ()
end prototypes

public function integer of_generarhtml ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Jueves 03 de Marzo de 2005 HORA 17:16:09:406
// 
// Genera el informe de los grupos
//////////////////////////////////////////////////////////////////////////
/***********************************************************
SA50470 - Ceiba/JJ - 22-10-2015
Comentario:Se modifica el dw d_muestra_a_ref eliminando las columnas: 
Talla M (Talla de la muestra) - F R (F$$HEX1$$e100$$ENDHEX$$brica de la Referencia) - L R (L$$HEX1$$ed00$$ENDHEX$$nea de la Referencia) - Agujas - Usuario
y adicionando las columnas:
Recurso - Cantidad $$HEX1$$f300$$ENDHEX$$rdenes - Descripci$$HEX1$$f300$$ENDHEX$$n Referencia - Cliente - Ejecutiva - Desarrollador
Se crea una nueva ventana de filtro para recuperar convertidas a referencia o NO 
***********************************************************/
DateTime ldt_fecha
String ls_fileName, ls_directorio, ls_dato
long i,ll_can,ll_grupo,ll_dato,j,ll_tot
decimal lde_dato
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
ls_fileName=ls_directorio+"muestra_a_referencia.html"

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

of_add("<TD>F&nbsp&nbsp&nbsp</TD>")

of_add("<TD>L&nbsp&nbsp&nbsp</TD>")

of_add("<TD>MUESTRA</TD>")

of_add("<TD>RECURSO</TD>")

of_add("<TD>DESCRIPCI$$HEX1$$d300$$ENDHEX$$N RECURSO</TD>")

of_add("<TD>CANT. ORDENES</TD>")

of_add("<TD>REFERENCIA</TD>")

of_add("<TD>TALLA&nbsp</TD>")

of_add("<TD>DESCRIPCI$$HEX1$$d300$$ENDHEX$$N REFERENCIA</TD>")

of_add("<TD>FECHA</TD>")

of_add("<TD>CLIENTE</TD>")

of_add("<TD>EJECUTIVA</TD>")

of_add("<TD>DESARROLLADOR</TD>")

of_add("</tr>")

ll_tot=dw_datos.RowCount()

FOR i=1 To ll_tot
	
	If mod(i,2)=0 Then
		of_add("<TR class=tdetest>")
	Else
		of_add("<TR class=tdetestb>")
	End If	

	of_add("<TD>")
	ll_dato=dw_datos.GetItemNumber(i,"co_fabrica")
	of_add(String(ll_dato))
	of_add("</TD>")

	of_add("<TD>")
	ll_dato=dw_datos.GetItemNumber(i,"co_linea")
	of_add(String(ll_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ll_dato=dw_datos.GetItemNumber(i,"co_muestra")
	of_add(String(ll_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ll_dato=dw_datos.GetItemNumber(i,"co_recurso")
	of_add(String(ll_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ls_dato=dw_datos.GetItemString(i,"de_recurso")
	of_add(Trim(ls_dato))
	of_add("</TD>")		
	
	of_add("<TD>") 
	ll_dato=dw_datos.GetItemNumber(i,"cantidad_ordenes")
	of_add(String(ll_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ll_dato=dw_datos.GetItemNumber(i,"co_referencia_ref")
	of_add(String(ll_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ls_dato=dw_datos.GetItemString(i,"talla_ref")
	of_add(Trim(ls_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ls_dato=dw_datos.GetItemString(i,"desc_referencia")
	of_add(Trim(ls_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ldt_fecha=dw_datos.GetItemDatetime(i,"fe_creacion")
	of_add(String(ldt_fecha))
	of_add("</TD>")
	
	of_add("<TD>")
	ls_dato=dw_datos.GetItemString(i,"de_cliente")
	of_add(Trim(ls_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ls_dato=dw_datos.GetItemString(i,"de_ejecutiva")
	of_add(Trim(ls_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ls_dato=dw_datos.GetItemString(i,"desarrollador")
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

public subroutine wf_asignardataobject (readonly long al_data);/********************************************************************
SA50470 - Ceiba/JJ - 22-10-2015 FunctionName: Itemchanged 
<DESC> Description</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
//Convertido a Referencia 
String ls_DataObject

IF al_data = 1 THEN 
	ls_DataObject = 'd_muestra_a_ref'
ELSE //Sin convertir a Referencia 
	ls_DataObject = 'd_sq_gr_muestra_sin_conver_a_ref'
END IF 

dw_datos.dataobject = ls_DataObject
end subroutine

public subroutine wf_limpiarcampos ();/********************************************************************
SA50470 - Ceiba/JJ - 22-10-2015 FunctionName: wf_limpiarCampos() 
<DESC> Description</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
//Convertido a Referencia 
long		ll_nulo 
String	ls_nulo 

SetNull(ll_nulo)
SetNull(ls_nulo)

dw_param.setitem(1,'co_fabrica',ll_nulo)
dw_param.setitem(1,'co_linea',ll_nulo)
dw_param.setitem(1,'tipo_muestra',ls_nulo)
idwc_linea.reset()
end subroutine

on w_informe_muestra_a_ref.create
int iCurrent
call super::create
this.dw_datos=create dw_datos
this.cb_1=create cb_1
this.dw_param=create dw_param
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_datos
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.dw_param
this.Control[iCurrent+4]=this.gb_1
end on

on w_informe_muestra_a_ref.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_datos)
destroy(this.cb_1)
destroy(this.dw_param)
destroy(this.gb_1)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Jueves 03 de Marzo de 2005 HORA 17:41:33:953
// 
// 
//////////////////////////////////////////////////////////////////////////
n_cst_comun lo_comun
dw_param.InsertRow(0)

dw_param.getChild("co_fabrica",idwc_fabrica)
lo_comun.of_loaddddw( idwc_fabrica,n_cst_application.is_user,n_cst_application.itr_appl)

dw_param.getChild("co_linea",idwc_linea)
lo_comun.of_loadDddw(idwc_linea,0,n_cst_application.itr_appl)

dw_param.getChild("tipo_muestra",idwc_tipo_muestra) 
lo_comun.of_loadDddw(idwc_tipo_muestra,n_cst_application.itr_appl)
end event

type dw_datos from u_dw_application within w_informe_muestra_a_ref
boolean visible = false
integer x = 55
integer y = 832
integer width = 608
integer taborder = 20
string dataobject = "d_muestra_a_ref"
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

event sqlpreview;call super::sqlpreview;String ls
ls = sqlsyntax
end event

type cb_1 from commandbutton within w_informe_muestra_a_ref
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

event clicked;If dw_param.AcceptText()<>1 Then
	Return
End If
Datetime ldt_ini,ldt_fin
Long		ll_fabrica, ll_linea 
String	ls_TipoMuestra

ldt_ini			= dw_param.GetItemDateTime(1,"fe_ini")
ldt_fin			= dw_param.GetItemDateTime(1,"fe_fin")
ll_fabrica		= dw_param.GetItemNumber(1,"co_fabrica")
ll_linea			= dw_param.GetItemNumber(1,"co_linea")
ls_TipoMuestra	= dw_param.GetItemString(1,"tipo_muestra")

ldt_ini=Datetime(Date(ldt_ini),Time(00:00:00))
ldt_fin=Datetime(Date(ldt_fin),Time(23:59:59))
IF IsNull(ll_fabrica) THEN ll_fabrica = 0 
IF IsNull(ll_linea) THEN ll_linea = 0 
IF IsNull(ls_TipoMuestra) THEN ls_TipoMuestra = ''

dw_datos.SetTransObject(n_cst_application.itr_appl)
dw_datos.Retrieve(ldt_ini,ldt_fin,ll_fabrica,ll_linea,ls_TipoMuestra)

of_generarhtml( )
end event

type dw_param from u_dw_application within w_informe_muestra_a_ref
integer x = 78
integer y = 84
integer width = 1591
integer height = 716
string dataobject = "d_ext_rango_datetime"
boolean vscrollbar = false
boolean livescroll = false
end type

event itemchanged;call super::itemchanged;/********************************************************************
SA50470 - Ceiba/JJ - 22-10-2015 FunctionName: Itemchanged 
<DESC> Description</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
n_cst_comun lo_comun

CHOOSE CASE dwo.name
	CASE 'co_fabrica'
		idwc_linea.reset()
		lo_comun.of_loadDddw(idwc_linea,Long(DATA),n_cst_application.itr_appl)
		
	CASE 'ind_convertido_a_ref'
		wf_asignarDataObject(Long(data))
		wf_limpiarCampos()
END CHOOSE 
end event

type gb_1 from groupbox within w_informe_muestra_a_ref
integer x = 46
integer y = 12
integer width = 1659
integer height = 824
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

