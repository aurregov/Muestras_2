HA$PBExportHeader$w_informe_detenidas.srw
forward
global type w_informe_detenidas from w_sheet
end type
type cb_2 from commandbutton within w_informe_detenidas
end type
type dw_2 from u_dw_application within w_informe_detenidas
end type
type dw_tareas_paradas from u_dw_application within w_informe_detenidas
end type
type cb_1 from commandbutton within w_informe_detenidas
end type
type dw_1 from u_dw_application within w_informe_detenidas
end type
type gb_1 from groupbox within w_informe_detenidas
end type
end forward

global type w_informe_detenidas from w_sheet
integer width = 2533
integer height = 1272
string title = "Informe de grupos"
cb_2 cb_2
dw_2 dw_2
dw_tareas_paradas dw_tareas_paradas
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_informe_detenidas w_informe_detenidas

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

String ls_directorio

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

ls_fileName=ls_directorio+"tareas_paradas.html"

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

of_add("<TD>F</TD>")

of_add("<TD>L</TD>")

of_add("<TD>M</TD>")

of_add("<TD>Orden</TD>")

of_add("<TD>S.S.</TD>")

of_add("<TD>Tarea</TD>")

of_add("<TD>Cliente</TD>")

of_add("<TD>Desarrollador</TD>")

of_add("<TD>Ejecutiva</TD>")

of_add("<TD>Ultima Fecha paro</TD>")

of_add("<TD>Tiempo paro</TD>")

of_add("<TD>Usuario paro</TD>")

of_add("<TD>Tipo de paro</TD>")

of_add("</tr>")

long i,ll_can,ll_grupo,ll_dato,j,ll_tot
String ls_dato

ll_tot=dw_tareas_paradas.RowCount()

For i=1 To ll_tot
	
	If mod(i,2)=0 Then
		of_add("<TR class=tdetest>")
	Else
		of_add("<TR class=tdetestb>")
	End If	

	of_add("<TD>")
	ll_dato=dw_tareas_paradas.GetItemNumber(i,"co_fabrica")
	of_add(String(ll_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ll_dato=dw_tareas_paradas.GetItemNumber(i,"co_linea")
	of_add(String(ll_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ll_dato=dw_tareas_paradas.GetItemNumber(i,"co_muestra")
	of_add(String(ll_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ll_dato=dw_tareas_paradas.GetItemNumber(i,"nu_orden")
	of_add(String(ll_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ll_dato=dw_tareas_paradas.GetItemNumber(i,"sol_serv")
	of_add(String(ll_dato))
	of_add("</TD>")

	of_add("<TD>")
	ls_dato=dw_tareas_paradas.GetItemString(i,"de_tarea")
	of_add(Trim(ls_dato))
	of_add("</TD>")

	of_add("<TD>")
	ls_dato=dw_tareas_paradas.GetItemString(i,"de_cliente")
	of_add(Trim(ls_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ls_dato=dw_tareas_paradas.GetItemString(i,"de_ctecnico")
	of_add(Trim(ls_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ls_dato=dw_tareas_paradas.GetItemString(i,"de_ejecutiva")
	of_add(Trim(ls_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ldt_fecha=dw_tareas_paradas.GetItemDatetime(i,"fe_actualizacion")
	of_add(String(ldt_fecha))
	of_add("</TD>")

	of_add("<TD>")
	ls_dato=dw_tareas_paradas.GetItemString(i,"tiempo_paro")
	of_add(Trim(ls_dato))
	of_add("</TD>")
	
	
	of_add("<TD>")
	ls_dato=dw_tareas_paradas.GetItemString(i,"usuario")
	of_add(Trim(ls_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ll_dato=dw_tareas_paradas.GetItemNumber(i,"condicion")
	If ll_dato=5 Then
		ls_dato="GENERAL"
	Else
		ls_dato="INDIVIDUAL"
	End If
	of_add(ls_dato)
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

on w_informe_detenidas.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.dw_2=create dw_2
this.dw_tareas_paradas=create dw_tareas_paradas
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.dw_2
this.Control[iCurrent+3]=this.dw_tareas_paradas
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.dw_1
this.Control[iCurrent+6]=this.gb_1
end on

on w_informe_detenidas.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_2)
destroy(this.dw_2)
destroy(this.dw_tareas_paradas)
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

type cb_2 from commandbutton within w_informe_detenidas
integer x = 1257
integer y = 536
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;long ll_tot,i
long ll_fabrica,ll_marca_new,ll_linea,ll_referencia,ll_talla,&
     ll_calidad,ll_color,ll_muestrario,ll_cliente,&
	  ll_sucursal,ll_marca_old,ll_pais

dw_2.SetTransObject(n_cst_application.itr_appl)

ll_tot=dw_2.Retrieve()

messagebox("tot",ll_tot)

For i=1 to ll_tot
	ll_fabrica=dw_2.GetItemNumber(i,"co_fabrica")
	ll_linea=dw_2.GetItemNumber(i,"co_linea")
	ll_referencia=dw_2.GetItemNumber(i,"co_referencia")
	ll_talla=dw_2.GetItemNumber(i,"co_talla")
	ll_calidad=dw_2.GetItemNumber(i,"co_calidad")
	ll_color=dw_2.GetItemNumber(i,"co_color")
	ll_muestrario=dw_2.GetItemNumber(i,"co_muestrario")
	ll_cliente=dw_2.GetItemNumber(i,"co_cliente")
	ll_sucursal=dw_2.GetItemNumber(i,"co_sucursal")
	ll_pais=dw_2.GetItemNumber(i,"co_pais")
	ll_marca_new=dw_2.GetItemNumber(i,"co_marca")
	ll_marca_old=dw_2.GetItemNumber(i,"co_marca1")




	EXECUTE IMMEDIATE "SET CONSTRAINTS ALL DEFERRED"
	USING n_cst_application.itr_appl;
	 
	If n_cst_application.itr_appl.SQLcode=-1 Then 
	 PopulateError(20,"SQL Error")
	 n_cst_application.of_sql_error(n_cst_application.itr_appl)
	 Return -1
	End If
	
  UPDATE dt_fme  
     SET co_marca = :ll_marca_new  
   WHERE ( dt_fme.co_fabrica = :ll_fabrica ) AND  
         ( dt_fme.co_linea = :ll_linea ) AND  
         ( dt_fme.co_referencia = :ll_referencia ) AND  
         ( dt_fme.co_talla = :ll_talla ) AND  
         ( dt_fme.co_calidad = :ll_calidad ) AND  
         ( dt_fme.co_color = :ll_color ) AND  
         ( dt_fme.co_muestrario = :ll_muestrario ) AND  
         ( dt_fme.co_cliente = :ll_cliente ) AND  
         ( dt_fme.co_sucursal = :ll_sucursal ) AND  
         ( dt_fme.co_marca = :ll_marca_old ) AND  
         ( dt_fme.co_pais = :ll_pais )   
      	USING n_cst_application.itr_appl;
	 
	If n_cst_application.itr_appl.SQLcode=-1 Then 
	 PopulateError(20,"SQL Error")
	 n_cst_application.of_sql_error(n_cst_application.itr_appl)
	 Return -1
	End If
	
	dw_2.setitem(i,"co_marca1",ll_marca_new)
	
	If dw_2.update(true,false)<>1 then
		rollback using n_cst_application.itr_appl;
		Return -1
	End If
	commit using n_cst_application.itr_appl;
//	If n_cst_application.itr_appl.SQLcode=-1 Then 
//	 PopulateError(20,"SQL Error")
//	 n_cst_application.of_sql_error(n_cst_application.itr_appl)
//	 Return -1
//	End If
	
	dw_2.resetupdate()
Next
MessageBox("b",i)
end event

type dw_2 from u_dw_application within w_informe_detenidas
integer x = 718
integer y = 472
integer width = 553
integer height = 548
integer taborder = 30
boolean titlebar = true
string dataobject = "d_29042006"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_tareas_paradas from u_dw_application within w_informe_detenidas
boolean visible = false
integer x = 41
integer y = 496
integer width = 608
integer taborder = 20
string dataobject = "d_tareas_paradas"
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

type cb_1 from commandbutton within w_informe_detenidas
integer x = 1970
integer y = 160
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
String ls_tipo,ls_co_ctecnico
long ll_ejecutiva
ls_tipo=dw_1.GetItemString(1,"tipo_muestra")

ls_co_ctecnico=dw_1.GetItemString(1,"co_ctecnico")

ll_ejecutiva=dw_1.GetItemNumber(1,"co_ejecutiva")

String ls_where

If Not IsNull(ls_tipo) Then
	ls_where+=" AND (m_muestras.tipo_muestra  =~~'"+ls_tipo+"~~')"

End If

If Not IsNull(ls_co_ctecnico) Then
	ls_where+=" AND (dt_mu_ord.co_ctecnico =~~'"+ls_co_ctecnico+"~~')"
End If

If Not IsNull(ll_ejecutiva) Then
	ls_where+=" AND (dt_mu_ord.co_ejecutiva="+String(ll_ejecutiva)+")"
End If

String ls_sel_ini,ls_sel_mod
If ls_where<>"" Then                      
//////////////////////////////////////////////////////////////////////////
// Se reasigna el dataobject por si hacen el proceso varias veces
// 
//////////////////////////////////////////////////////////////////////////
	
	dw_tareas_paradas.DataObject=dw_tareas_paradas.DataObject
	dw_tareas_paradas.SetTransObject(n_cst_application.itr_appl)
	ls_sel_ini = dw_tareas_paradas.Describe("DataWindow.Table.Select")
	ls_sel_mod=ls_sel_ini+ls_where
	//clipboard(ls_sel_mod)
	//Messagebox('Var','ls_sel_mod='+ls_sel_mod+'~n')
	dw_tareas_paradas.Modify("DataWindow.Table.Select = '" + ls_sel_mod + "'")
End If

dw_tareas_paradas.SetTransObject(n_cst_application.itr_appl)

dw_tareas_paradas.Retrieve()

of_generarhtml( )
end event

type dw_1 from u_dw_application within w_informe_detenidas
integer x = 78
integer y = 84
integer width = 1874
integer height = 292
string dataobject = "d_ext_criterio_orden_paro"
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

type gb_1 from groupbox within w_informe_detenidas
integer x = 46
integer y = 12
integer width = 2336
integer height = 412
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

