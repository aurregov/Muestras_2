HA$PBExportHeader$w_informe_ordenes_proceso_laboratorio.srw
$PBExportComments$/***********************************************************~r~nSA54492 - Ceiba/jjmonsal - 17-03-2016~r~nComentario: Reporte de solicitudes de dllo calcetines~r~n***********************************************************/
forward
global type w_informe_ordenes_proceso_laboratorio from w_sheet
end type
type cb_exportar from commandbutton within w_informe_ordenes_proceso_laboratorio
end type
type dw_datos from u_dw_application within w_informe_ordenes_proceso_laboratorio
end type
type cb_1 from commandbutton within w_informe_ordenes_proceso_laboratorio
end type
type dw_1 from u_dw_application within w_informe_ordenes_proceso_laboratorio
end type
type gb_1 from groupbox within w_informe_ordenes_proceso_laboratorio
end type
end forward

global type w_informe_ordenes_proceso_laboratorio from w_sheet
integer width = 4645
integer height = 2240
string title = "Informe de ordenes en proceso"
windowstate windowstate = maximized!
cb_exportar cb_exportar
dw_datos dw_datos
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_informe_ordenes_proceso_laboratorio w_informe_ordenes_proceso_laboratorio

type prototypes
Public Function Long ShellExecute (Long hWnd, String lpOperation, String lpFile, String lpParameters, String lpDirectory, Long nShowCmd) Library "shell32.dll" Alias For "ShellExecuteA;Ansi"



end prototypes

type variables
integer ii_FileNum
Constant Long SW_SHOWNORMAL = 1

String is_where, is_filtro
DataWindowChild idc_estado, idwc_tipoprod
end variables

forward prototypes
public function integer of_generarhtml ()
public function integer of_add (string a_texto)
public function integer of_cargar_dddw (integer al_opc)
end prototypes

public function integer of_generarhtml ();DateTime ldt_fecha
String ls_fileName, ls_directorio, ls_usuario,ls_instancia

n_cst_file_application lo_1
ls_directorio=lo_1.of_gettempdirectory()

If ls_directorio="" or IsNull(ls_directorio) Then
	MessageBox("Advertencia!","No se pudo crear el archivo.",StopSign!)
	Return -1
End If

ls_fileName=ls_directorio+"ordenes_en_proceso_lab.html"

FileDelete (ls_fileName)

ii_FileNum = FileOpen(ls_fileName,LineMode!, Write!, LockWrite!, Append!)

of_add("<HTML><HEAD>")

of_add("<STYLE type=text/css>table.mtable td {border-bottom:2px solid #C1CDD8 ; border-right:1px solid #C1CDD8}.tdetest {background-color: #cff8fc; color: #000000; font-family: Verdana, Arial, sans-serif; font-size: 10px; font-weight: normal; } .tdetestb {background-color: #ffffff; color: #000000; font-family: Verdana, Arial, sans-serif; font-size: 10px; font-weight: normal; } .cellblue { background-color: #6651b0; color: #ffffff; font-family: Verdana, Arial, sans-serif; font-size: 11px; font-weight: bold; } </STYLE>")

of_add("</HEAD>")

of_add("<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginheight=~"0~" ")

of_add("marginwidth=~"0~">")
//////////////////////////////////////////////////////////////////////////
// Tabla de encabezado, muestra la cantidad de ordenes, la fecha
// y el filtro utilizado
//////////////////////////////////////////////////////////////////////////
If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If

of_add("<TABLE class=mtable cellSpacing=0 cellPadding=0 width=~"50%~" border=0>")

of_add("<TBODY>")

of_add("<TR class=cellblue>")

of_add("<TD>CRITERIO</TD>")

of_add("<TD>USUARIO</TD>")

of_add("<TD>FECHA</TD>")

of_add("<TD>CANTIDAD DE ORDENES</TD>")

of_add("</tr>")

of_add("<TR class=tdetest>")

of_add("<TD>")
of_add(is_filtro)
of_add("</TD>")

of_add("<TD>")
of_add(ls_usuario)
of_add("</TD>")

of_add("<TD>")
of_add(String(ldt_fecha))
of_add("</TD>")

of_add("<TD>")
of_add(String(dw_datos.RowCount()))
of_add("</TD>")

of_add("</TR>")
//Fin Encabezado

of_add("</TABLE>")	

of_add("<BR>")
of_add("<BR>")

of_add("<TABLE class=mtable cellSpacing=0 cellPadding=0 width=~"100%~" border=0>")

of_add("<TBODY>")

of_add("<TR class=cellblue>")

of_add("<TD>FABRICA</TD>")

of_add("<TD>LINEA</TD>")

of_add("<TD>MUESTRA</TD>")

of_add("<TD>ORDEN</TD>")

of_add("<TD>CLIENTE</TD>")

of_add("<TD>DESARROLLADOR</TD>")

of_add("<TD>EJECUTIVA</TD>")

of_add("<TD>ESTADO DE LA ORDEN</TD>")

of_add("<TD>CENTRO DE PROCESO</TD>")

of_add("<TD>GRUPO DE PROCESO</TD>")

of_add("<TD>FECHA INICIO ORIGINAL</TD>")

of_add("<TD>FECHA FIN ORIGINAL</TD>")

of_add("<TD>FECHA INICIO MODIFICADA</TD>")

of_add("<TD>FECHA FIN MODIFICADA</TD>")

of_add("<TD>DIAS RETRAZO</TD>")

of_add("<TD>PRIORIDAD</TD>")

of_add("<TD>DIAS DESDE EL REGISTRO</TD>")

of_add("</tr>")

long i,ll_can,ll_grupo,ll_dato,j,ll_tot
String ls_dato

ll_tot=dw_datos.RowCount()

For i=1 To ll_tot
	
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
	ll_dato=dw_datos.GetItemNumber(i,"nu_orden")
	of_add(String(ll_dato))
	of_add("</TD>")	
	
	of_add("<TD>")
	ls_dato=dw_datos.GetItemString(i,"de_cliente")
	of_add(Trim(ls_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ls_dato=dw_datos.GetItemString(i,"de_desarrollador")
	of_add(Trim(ls_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ls_dato=dw_datos.GetItemString(i,"de_ejecutiva")
	of_add(Trim(ls_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ls_dato=dw_datos.GetItemString(i,"estado_orden")
	of_add(Trim(ls_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ls_dato=dw_datos.GetItemString(i,"centro_proceso")
	of_add(Trim(ls_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ls_dato=dw_datos.GetItemString(i,"grupo_proceso")
	of_add(Trim(ls_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ldt_fecha=dw_datos.GetItemDatetime(i,"fecha_inicio_original")
	of_add(String(ldt_fecha))
	of_add("</TD>")
	
	of_add("<TD>")
	ldt_fecha=dw_datos.GetItemDatetime(i,"fecha_fin_original")
	of_add(String(ldt_fecha))
	of_add("</TD>")
	
	of_add("<TD>")
	ldt_fecha=dw_datos.GetItemDatetime(i,"fecha_inicio_actual")
	of_add(String(ldt_fecha))
	of_add("</TD>")
	
	of_add("<TD>")
	ldt_fecha=dw_datos.GetItemDatetime(i,"fecha_fin_actual")
	of_add(String(ldt_fecha))
	of_add("</TD>")
	
	of_add("<TD>")
	ls_dato=dw_datos.GetItemString(i,"dias_retrazo")
	ls_dato = Mid(Trim(ls_dato),1,2)
	of_add(Trim(ls_dato))
	of_add("</TD>")
		
	of_add("<TD>")
	ll_dato=dw_datos.GetItemNumber(i,"prioridad")
	
	//Con el maestro nuevo 
	choose case ll_dato
		case 1
			ls_dato="MUY BAJA"
		case 2
			ls_dato="BAJA"
		case 3
			ls_dato="MEDIA"
		case 4
			ls_dato="ALTA"
		case 5
			ls_dato="EXTREMA"
			
	end choose

	
	of_add(ls_dato)
	of_add("</TD>")
	
	of_add("<TD>")
	ll_dato=dw_datos.GetItemNumber(i,"dias_registro")
	of_add(String(ll_dato))
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
	a_texto="$$HEX1$$a000$$ENDHEX$$"
End If
 
FileWrite(ii_FileNum, a_texto)

Return 1


end function

public function integer of_cargar_dddw (integer al_opc);/*-------------------------------------------------
	Develr.	: YOVANNY GALCVEZ Z
	Date		: MIERCOLES 31 de Agosto de 2005.H:13:44
---------------------------------------------------
---------------------------------------------------*/
n_cst_comun lo_comun
//-------------------------------------------------
Choose Case al_opc
	Case 1
		dw_1.getChild("co_estado",idc_estado)
		lo_comun.of_loaddddw(idc_estado,n_cst_application.itr_appl)
		
		dw_1.getChild("co_tipoprod",idwc_tipoprod)
		lo_comun.of_loaddddw(idwc_tipoprod,n_cst_application.is_user,n_cst_application.itr_appl)
End Choose
Return 1
end function

on w_informe_ordenes_proceso_laboratorio.create
int iCurrent
call super::create
this.cb_exportar=create cb_exportar
this.dw_datos=create dw_datos
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_exportar
this.Control[iCurrent+2]=this.dw_datos
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.dw_1
this.Control[iCurrent+5]=this.gb_1
end on

on w_informe_ordenes_proceso_laboratorio.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_exportar)
destroy(this.dw_datos)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;call super::open;/********************************************************************
SA54492 - Ceiba/jjmonsal - 18-03-2016 FunctionName OPEN 
<DESC> Description</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/

dw_1.InsertRow(0)
dw_1.SetItem(1,'fecha_inicial',datetime(Date('1900-01-01'),time('00:00:00')))
dw_1.SetItem(1,'fecha_final',datetime(Date('1900-01-01'),time('23:59:59')))

of_cargar_dddw(1)
end event

type cb_exportar from commandbutton within w_informe_ordenes_proceso_laboratorio
integer x = 1883
integer y = 620
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar..."
end type

event clicked;/********************************************************************
SA54492 - Ceiba/jjmonsal - 18-03-2016 FunctionName SAVE AS cb_exportar 
<DESC> Description: guardar como</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
dw_datos.Saveas( )
end event

type dw_datos from u_dw_application within w_informe_ordenes_proceso_laboratorio
integer x = 50
integer y = 788
integer width = 4535
integer height = 1232
integer taborder = 20
string dataobject = "d_inf_ordenes_proceso_lab"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean resizable = true
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
ls = SQLSyntax
end event

type cb_1 from commandbutton within w_informe_ordenes_proceso_laboratorio
integer x = 1495
integer y = 620
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

event clicked;/********************************************************************
SA54492 - Ceiba/jjmonsal - 17-03-2016 FunctionName Generar reporte 
<DESC> Description: generar reporte en detalle </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
Nota: En el dw d_inf_ordenes_proceso_lab en la condicion: dt_mu_ord.condicion IN (2,3) se debe asignan dichos valores 
no tiene sentido almacenarlos 1 a 1, y en una constante string representa un conversion invalida entre caracteres y numeros
Ceiba/jjmonsal - 03-05-2016: Se verifica en Orden de produccion el dw tareas, se detecta que el campo condicion va contra 
el dddw: d_dddw_mu_cond_gantt mu_m_con_gantt, se detecta que la condicion 8 es cancelada, 
se excluye del select de reporte (( (dt_mu_ord.condicion IN (2,3) AND (mu_gantt.condicion <> 8 ) ) ) AND )
********************************************************************/
DateTime		ldt_fe_inicial, ldt_fe_final
String		ls_sel_ini,ls_sel_mod,ls_filter
n_cst_c_rep_ordprocesolab	lnv_rep_OrdenesProcesoLab
uo_dsbase						lds_arg

lnv_rep_OrdenesProcesoLab	= CREATE n_cst_c_rep_ordprocesolab
lds_arg							= CREATE uo_dsbase
lds_arg.DataObject			= dw_1.DataObject

If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Criterios no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If

is_where=''
is_filtro=''
ldt_fe_inicial	= dw_1.GetItemDatetime(1,"fecha_inicial")
ldt_fe_final	= dw_1.GetItemDatetime(1,"fecha_final")
	
dw_1.RowsCopy(dw_1.GetRow(),dw_1.RowCount(), Primary!, lds_arg, 1, Primary!)
lnv_rep_OrdenesProcesoLab.of_validarCamposVaciosNulos(lds_arg,is_where,is_filtro)

If Right(is_filtro,2)=", " Then
	is_filtro=left(is_filtro,len(is_filtro) - 2)
End If

If is_where<>"" Then
	
	dw_datos.DataObject=dw_datos.DataObject
	dw_datos.SetTransObject(n_cst_application.itr_appl)
	ls_sel_ini = dw_datos.Describe("DataWindow.Table.Select")
	ls_sel_mod=ls_sel_ini+is_where
	dw_datos.Modify("DataWindow.Table.Select = '" + ls_sel_mod + "'")
End If

dw_datos.SetTransObject(n_cst_application.itr_appl)
dw_datos.Retrieve(ldt_fe_inicial, ldt_fe_final)
//Omitir las decripciones vacias no pertenecen a procesos de laboratorio.
ls_filter = " color_hilaza <> '' "
IF TRIM(ls_filter) <> "" THEN
	dw_datos.setFilter(ls_filter)
	dw_datos.Filter()
END IF	

//of_generarhtml( )
end event

type dw_1 from u_dw_application within w_informe_ordenes_proceso_laboratorio
integer x = 78
integer y = 84
integer width = 3255
integer height = 648
string dataobject = "d_ext_criterios_ordenes_proceso_lab"
boolean vscrollbar = false
boolean livescroll = false
end type

event doubleclicked;call super::doubleclicked;String			ls_tipo 
LONG				ll_grupo, ll_nulo , ll_datoAntGru

n_cst_param lo_param
n_cst_comun luo_comun
SetNull(ll_nulo)

ll_datoAntGru = This.GetitemNumber(row,"co_grupo")
This.setItem(1,'co_grupo',ll_nulo)

If dwo.name='desarrollador' Then
		OpenWithParm(w_bus_m_ctecnico,lo_param)
		lo_param=Message.PowerObjectParm
		If IsValid(lo_param) Then
			SetText(String(lo_param.is_vector[1]))
			AcceptText()
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
	End If
End If

If dwo.name="co_grupo" then
	ll_grupo = This.GetitemNumber(row,"co_grupo")
	lo_param.il_vector[1]=ll_grupo
	OpenWithParm(w_bus_grupo_act,lo_param)
	lo_param=Message.PowerObjectParm
	If IsValid(lo_param) Then
		AcceptText()
		SetItem(row,'co_grupo',lo_param.il_vector[1])		
		SetItem(row,'de_grupo',lo_param.is_vector[1])
	else
		SetItem(row,'co_grupo',ll_datoAntGru)	
	End If		
End If


end event

event itemchanged;call super::itemchanged;/********************************************************************
SA54492 - Ceiba/jjmonsal - 17-03-2016 FunctionName Generar reporte 
<DESC> Description: Comentario: Reporte de solicitudes de dllo calcetines </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
String ls_tipo_muestra
long ll_res, ll_grupo,ll_resultado,ll_co_estado, ll_i 
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

If dwo.name='desarrollador' Then
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

If dwo.name="co_grupo" Then
	ll_grupo=Long(Data)
	ll_resultado=luo_comun.of_nombregrupoact(ll_grupo,n_cst_application.itr_appl)
	If ll_resultado<>1 Then
		MessageBox("Advertencia!","Grupo de la operaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_grupo",luo_comun.of_getString(1))
End If

If dwo.name = 'co_estado' Then	
	ll_co_estado = Long(Data)
	ll_i=idc_estado.Find('co_estado='+string(ll_co_estado),1,idc_estado.RowCount())
	This.SetItem(row,'de_estado',Trim(idc_estado.GetItemString(ll_i,'de_estado')))
End If
end event

type gb_1 from groupbox within w_informe_ordenes_proceso_laboratorio
integer x = 46
integer y = 12
integer width = 3301
integer height = 756
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

