HA$PBExportHeader$w_informe_grupos.srw
forward
global type w_informe_grupos from w_sheet
end type
type dw_maquina_tintoreria from u_dw_application within w_informe_grupos
end type
type dw_recurso_grupo from u_dw_application within w_informe_grupos
end type
type dw_actividad_grupo from u_dw_application within w_informe_grupos
end type
type dw_operacion_grupo from u_dw_application within w_informe_grupos
end type
type dw_integrante_grupo from u_dw_application within w_informe_grupos
end type
type dw_grupo from u_dw_application within w_informe_grupos
end type
type cb_1 from commandbutton within w_informe_grupos
end type
type dw_1 from u_dw_application within w_informe_grupos
end type
type gb_1 from groupbox within w_informe_grupos
end type
end forward

global type w_informe_grupos from w_sheet
integer width = 2523
integer height = 716
string title = "Informe de grupos"
dw_maquina_tintoreria dw_maquina_tintoreria
dw_recurso_grupo dw_recurso_grupo
dw_actividad_grupo dw_actividad_grupo
dw_operacion_grupo dw_operacion_grupo
dw_integrante_grupo dw_integrante_grupo
dw_grupo dw_grupo
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_informe_grupos w_informe_grupos

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

ls_fileName=ls_directorio+"grupos.html"

FileDelete (ls_fileName)

//If Not FileDelete (ls_fileName) Then
//	Return -1
//End If


ii_FileNum = FileOpen(ls_fileName, &
        LineMode!, Write!, LockWrite!, Append!)


of_add("<HTML><HEAD>")

of_add("<STYLE type=text/css>table.mtable td {border-bottom:1px solid #C1CDD8 ; border-right:1px solid #C1CDD8}.tdetest {background-color: #cff8fc; color: #000000; font-family: Verdana, Arial, sans-serif; font-size: 10px; font-weight: normal; }.tdetestb {background-color: #ffffff; color: #000000; font-family: Verdana, Arial, sans-serif; font-size: 10px; font-weight: normal; } .cellblue { background-color: #6651b0; color: #ffffff; font-family: Verdana, Arial, sans-serif; font-size: 11px; font-weight: bold; } .tdetestb1 {background-color: #f8e0fe; color: #000000; font-family: Verdana, Arial, sans-serif; font-size: 10px; font-weight: normal; }  </STYLE>")

of_add("</HEAD>")

of_add("<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginheight=~"0~" ")

of_add("marginwidth=~"0~">")


of_add("<TABLE class=mtable cellSpacing=5 cellPadding=0 width=~"220%~" border=0>")

of_add("<TBODY>")

of_add("<TR class=cellblue>")

of_add("<TD>Grupo</TD>")

of_add("<TD>Integrantes</TD>")

of_add("<TD>Actividades</TD>")

of_add("<TD>Operaciones</TD>")

of_add("<TD>Recursos</TD>")

of_add("<TD>Maquinas Tin</TD>")

of_add("</tr>")

long i,ll_can,ll_grupo,ll_dato,j,ll_tot
String ls_dato

ll_tot=dw_grupo.RowCount()

For i=1 To ll_tot
	//valign=top
	If mod(i,2)=0 Then
		of_add("<TR class=tdetestb valign=top>")
	Else
		of_add("<TR class=tdetestb1 valign=top>")
	End If	
	of_add("<td>")//GRUPO(1)

   ll_grupo=dw_grupo.GetItemNumber(i,"id_grupo")

	//tabla del grupo

	of_add("<TABLE class=mtable cellSpacing=0 cellPadding=0 width=~"100%~" border=0>")
	of_add("<TBODY>")
	of_add("<TR class=cellblue>")
	of_add("<TD>Grupo</TD>")
	of_add("<TD>Nomber</TD>")
	of_add("<TD>Id Turno</TD>")
	of_add("<TD>Nom Turno</TD>")		
	of_add("<TD>Colas</TD>")
	of_add("</TR>")
	of_add("<TR class=tdetest>")
	of_add("<TD>")
	of_add(String(ll_grupo))
	of_add("</TD>")
	
	of_add("<TD>")
	ls_dato=dw_grupo.GetItemString(i,"de_grupo")
	of_add(Trim(ls_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ll_dato=dw_grupo.GetItemNumber(i,"id_turno")
	of_add(String(ll_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ls_dato=dw_grupo.GetItemString(i,"de_turno")
	of_add(Trim(ls_dato))
	of_add("</TD>")
	
	of_add("<TD>")
	ll_dato=dw_grupo.GetItemNumber(i,"cantidad_colas")
	of_add(String(ll_dato))
	of_add("</TD>")
	of_add("</TR>")
	of_add("</TABLE>")
		

	of_add("</TD>")
	of_add("<TD>") //INTEGRANTE(2)
	
	ll_can=dw_integrante_grupo.Retrieve(ll_grupo)
	If ll_can>0 Then
		//tabla del grupo
		of_add("<TABLE class=mtable cellSpacing=0 cellPadding=0 width=~"100%~" border=0>")
		of_add("<TBODY>")
		of_add("<TR class=cellblue>")
		of_add("<TD>C$$HEX1$$f300$$ENDHEX$$digo</TD>")
		of_add("<TD>Nombre</TD>")
		
		For j=1 To ll_can

			of_add("</TR>")
			
			If mod(j,2)=0 Then
				of_add("<TR class=tdetest>")
			Else
				of_add("<TR class=tdetestb>")
			End If	
			
			of_add("<TD>")
			ls_dato=dw_integrante_grupo.GetItemString(j,"co_ctecnico")
			of_add(Trim(ls_dato))
			of_add("</TD>")
			
			of_add("<TD>")
			ls_dato=dw_integrante_grupo.GetItemString(j,"de_ctecnico")
			of_add(Trim(ls_dato))
			of_add("</TD>")
			of_add("</TR>")
	
		
		Next
		of_add("</TABLE>")	
	End If	
	of_add("</TD>")

	of_add("<TD>") //actividades(3)
	
	ll_can=dw_actividad_grupo.Retrieve(ll_grupo)
	If ll_can>0 Then
		//tabla del grupo
		of_add("<TABLE class=mtable cellSpacing=0 cellPadding=0 width=~"100%~" border=0>")
		of_add("<TBODY>")
		of_add("<TR class=cellblue>")
		of_add("<TD>C$$HEX1$$f300$$ENDHEX$$digo</TD>")
		of_add("<TD>Actividad</TD>")
		
		For j=1 To ll_can

			of_add("</TR>")
			
			If mod(j,2)=0 Then
				of_add("<TR class=tdetest>")
			Else
				of_add("<TR class=tdetestb>")
			End If	
			
			of_add("<TD>")
			ll_dato=dw_actividad_grupo.GetItemNumber(j,"id_actividad")
			of_add(String(ll_dato))
			of_add("</TD>")
			
			of_add("<TD>")
			ls_dato=dw_actividad_grupo.GetItemString(j,"de_actividad")
			of_add(Trim(ls_dato))
			of_add("</TD>")
			of_add("</TR>")
	
		
		Next
		of_add("</TABLE>")	
	End If	
	
	of_add("</TD>")
	of_add("<TD>") //(operac)4	

	ll_can=dw_operacion_grupo.Retrieve(ll_grupo)
	If ll_can>0 Then
		//tabla del grupo
		of_add("<TABLE class=mtable cellSpacing=0 cellPadding=0 width=~"100%~" border=0>")
		of_add("<TBODY>")
		of_add("<TR class=cellblue>")
		of_add("<TD>C$$HEX1$$f300$$ENDHEX$$digo</TD>")
		of_add("<TD>Operaci$$HEX1$$f300$$ENDHEX$$n</TD>")
		
		For j=1 To ll_can

			of_add("</TR>")
			
			If mod(j,2)=0 Then
				of_add("<TR class=tdetest>")
			Else
				of_add("<TR class=tdetestb>")
			End If	
			
			of_add("<TD>")
			ll_dato=dw_operacion_grupo.GetItemNumber(j,"co_operacion")
			of_add(String(ll_dato))
			of_add("</TD>")
			
			of_add("<TD>")
			ls_dato=dw_operacion_grupo.GetItemString(j,"de_operacion")
			of_add(Trim(ls_dato))
			of_add("</TD>")
			of_add("</TR>")
			
		Next
		of_add("</TABLE>")	
	End If	
	
	of_add("</TD>")
	of_add("<TD>") //(recurso)5
	
	ll_can=dw_recurso_grupo.Retrieve(ll_grupo)
	If ll_can>0 Then
		//tabla del grupo
		of_add("<TABLE class=mtable cellSpacing=0 cellPadding=0 width=~"100%~" border=0>")
		of_add("<TBODY>")
		of_add("<TR class=cellblue>")
		of_add("<TD>C$$HEX1$$f300$$ENDHEX$$digo</TD>")
		of_add("<TD>Recurso</TD>")
		
		For j=1 To ll_can

			of_add("</TR>")
			
			If mod(j,2)=0 Then
				of_add("<TR class=tdetest>")
			Else
				of_add("<TR class=tdetestb>")
			End If	
			
			of_add("<TD>")
			ll_dato=dw_recurso_grupo.GetItemNumber(j,"co_recurso")
			of_add(String(ll_dato))
			of_add("</TD>")
			
			of_add("<TD>")
			ls_dato=dw_recurso_grupo.GetItemString(j,"de_recurso")
			of_add(Trim(ls_dato))
			of_add("</TD>")
			of_add("</TR>")
			
		Next
		of_add("</TABLE>")	
	End If	
	
	
	
	of_add("</TD>")
	of_add("<TD>") //maq tin(2)6
	
	ll_can=dw_maquina_tintoreria.Retrieve(ll_grupo)
	If ll_can>0 Then
		//tabla del grupo
		of_add("<TABLE class=mtable cellSpacing=0 cellPadding=0 width=~"100%~" border=0>")
		of_add("<TBODY>")
		of_add("<TR class=cellblue>")
		of_add("<TD>C$$HEX1$$f300$$ENDHEX$$digo</TD>")
		of_add("<TD>M$$HEX1$$e100$$ENDHEX$$quina de Tintorer$$HEX1$$ed00$$ENDHEX$$a</TD>")
		
		For j=1 To ll_can

			of_add("</TR>")
			
			If mod(j,2)=0 Then
				of_add("<TR class=tdetest>")
			Else
				of_add("<TR class=tdetestb>")
			End If	
			
			of_add("<TD>")
			ll_dato=dw_maquina_tintoreria.GetItemNumber(j,"cs_maquina")
			of_add(String(ll_dato))
			of_add("</TD>")
			
			of_add("<TD>")
			ls_dato=dw_maquina_tintoreria.GetItemString(j,"de_maquina")
			of_add(Trim(ls_dato))
			of_add("</TD>")
			of_add("</TR>")
			
		Next
		of_add("</TABLE>")	
	End If	
	

	
	of_add("</TD>")//mq tin	
	of_add("</TR>")	
Next


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

on w_informe_grupos.create
int iCurrent
call super::create
this.dw_maquina_tintoreria=create dw_maquina_tintoreria
this.dw_recurso_grupo=create dw_recurso_grupo
this.dw_actividad_grupo=create dw_actividad_grupo
this.dw_operacion_grupo=create dw_operacion_grupo
this.dw_integrante_grupo=create dw_integrante_grupo
this.dw_grupo=create dw_grupo
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_maquina_tintoreria
this.Control[iCurrent+2]=this.dw_recurso_grupo
this.Control[iCurrent+3]=this.dw_actividad_grupo
this.Control[iCurrent+4]=this.dw_operacion_grupo
this.Control[iCurrent+5]=this.dw_integrante_grupo
this.Control[iCurrent+6]=this.dw_grupo
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.dw_1
this.Control[iCurrent+9]=this.gb_1
end on

on w_informe_grupos.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_maquina_tintoreria)
destroy(this.dw_recurso_grupo)
destroy(this.dw_actividad_grupo)
destroy(this.dw_operacion_grupo)
destroy(this.dw_integrante_grupo)
destroy(this.dw_grupo)
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



dw_grupo.SetTransObject(n_cst_application.itr_appl)
dw_integrante_grupo.SetTransObject(n_cst_application.itr_appl)
dw_operacion_grupo.SetTransObject(n_cst_application.itr_appl)
dw_actividad_grupo.SetTransObject(n_cst_application.itr_appl)
dw_recurso_grupo.SetTransObject(n_cst_application.itr_appl)
dw_maquina_tintoreria.SetTransObject(n_cst_application.itr_appl)


dw_1.InsertRow(0)

end event

type dw_maquina_tintoreria from u_dw_application within w_informe_grupos
integer x = 1559
integer y = 1020
integer width = 448
integer height = 328
integer taborder = 20
string dataobject = "d_mu_gru_mtin"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type dw_recurso_grupo from u_dw_application within w_informe_grupos
integer x = 882
integer y = 1016
integer width = 581
integer height = 424
integer taborder = 20
string dataobject = "d_dt_mu_rec_gru"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type dw_actividad_grupo from u_dw_application within w_informe_grupos
integer x = 1527
integer y = 692
integer width = 567
integer height = 400
integer taborder = 20
string dataobject = "d_grupo_activ1"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type dw_operacion_grupo from u_dw_application within w_informe_grupos
integer x = 887
integer y = 692
integer width = 567
integer height = 396
integer taborder = 20
string dataobject = "d_grupo_operacion1"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type dw_integrante_grupo from u_dw_application within w_informe_grupos
integer x = 55
integer y = 812
integer width = 242
integer height = 212
integer taborder = 30
string dataobject = "d_dt_mu_grupo"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type dw_grupo from u_dw_application within w_informe_grupos
integer x = 27
integer y = 636
integer width = 608
integer height = 160
integer taborder = 20
string dataobject = "d_grupos_informe"
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

type cb_1 from commandbutton within w_informe_grupos
integer x = 1719
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
	MessageBox("Advertencia!","Criterios no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
	
End If

long ll_grupo

ll_grupo=dw_1.GetItemNumber(1,"co_grupo")

If IsNull(ll_grupo) Then
	ll_grupo=-1
end If

dw_grupo.Retrieve(ll_grupo)

of_generarhtml( )
end event

type dw_1 from u_dw_application within w_informe_grupos
integer x = 78
integer y = 84
integer width = 1632
integer height = 292
string dataobject = "d_ext_grupo_inf"
boolean vscrollbar = false
boolean livescroll = false
end type

event doubleclicked;call super::doubleclicked;n_cst_param luo_parametros

Choose Case dwo.Name
	Case 'co_grupo'
		Open(w_bus_grupo_act)
		
		luo_parametros = Message.PowerObjectParm
		
		If not IsValid(luo_parametros) Then Return -1
			
		This.SetItem(1,'co_grupo',luo_parametros.il_vector[1])
		This.SetItem(1,'de_grupo',luo_parametros.is_vector[1])
		
End Choose
end event

event itemchanged;call super::itemchanged;n_cst_comun_orden luo_comun

If dwo.name='co_grupo' Then
	If IsNull(data) Then
		SetItem(1,"de_grupo","")
		Return 0
	End If
	
	If luo_comun.of_nombregrupoact(Long(Data),n_cst_application.itr_appl) > 0 Then
		This.SetItem(1,'de_grupo',luo_comun.of_getstring(1))
	Else
		MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','El c$$HEX1$$f300$$ENDHEX$$digo del grupo no es v$$HEX1$$e100$$ENDHEX$$lido')
		Return 2
	End If
End If
end event

type gb_1 from groupbox within w_informe_grupos
integer x = 46
integer y = 12
integer width = 2203
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

