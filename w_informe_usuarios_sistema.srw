HA$PBExportHeader$w_informe_usuarios_sistema.srw
$PBExportComments$Muestra los usuarios que estan en el sistema
forward
global type w_informe_usuarios_sistema from w_sheet
end type
type dw_table_lock from u_dw_application within w_informe_usuarios_sistema
end type
type cb_1 from commandbutton within w_informe_usuarios_sistema
end type
type gb_1 from groupbox within w_informe_usuarios_sistema
end type
end forward

global type w_informe_usuarios_sistema from w_sheet
integer width = 2542
integer height = 928
string title = "usuarios en el sistema"
dw_table_lock dw_table_lock
cb_1 cb_1
gb_1 gb_1
end type
global w_informe_usuarios_sistema w_informe_usuarios_sistema

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

ls_fileName=ls_directorio+"usuarios_en_programacion.html"

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


of_add("<TABLE class=mtable cellSpacing=0 cellPadding=0 width=~"100%~" border=0>")

of_add("<TBODY>")

of_add("<TR class=cellblue>")

of_add("<TD>USUARIO</TD>")

of_add("<TD>MAQUINA</TD>")

of_add("<TD>TIPO</TD>")

of_add("</tr>")

long i,ll_can,ll_grupo,ll_dato,j,ll_tot
String ls_dato

ll_tot=dw_table_lock.Retrieve("mu_gantt")

For i=1 To ll_tot
	//valign=top
	If mod(i,2)=0 Then
		of_add("<TR class=tdetest valign=top>")
	Else
		of_add("<TR class=tdetestb valign=top>")
	End If	

	of_add("<TD>")
	ls_dato=dw_table_lock.GetItemString(i,"usuario")
	of_add(Trim(ls_dato))
	of_add("</TD>")

	of_add("<TD>")
	ls_dato=dw_table_lock.GetItemString(i,"tty")
	of_add(Trim(ls_dato))
	of_add("</TD>")

	of_add("<TD>")
	ls_dato=dw_table_lock.GetItemString(i,"tipo")
	of_add(Trim(ls_dato))
	of_add("</TD>")

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

on w_informe_usuarios_sistema.create
int iCurrent
call super::create
this.dw_table_lock=create dw_table_lock
this.cb_1=create cb_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_table_lock
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.gb_1
end on

on w_informe_usuarios_sistema.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_table_lock)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Jueves 03 de Marzo de 2005 HORA 17:41:33:953
// 
// 
//////////////////////////////////////////////////////////////////////////



dw_table_lock.SetTransObject(n_cst_application.itr_appl)
end event

type dw_table_lock from u_dw_application within w_informe_usuarios_sistema
boolean visible = false
integer x = 82
integer y = 404
integer width = 608
integer height = 160
integer taborder = 20
string dataobject = "d_sp_mu_table_lock"
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

type cb_1 from commandbutton within w_informe_usuarios_sistema
integer x = 192
integer y = 140
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

event clicked;

of_generarhtml( )
end event

type gb_1 from groupbox within w_informe_usuarios_sistema
integer x = 46
integer y = 12
integer width = 2203
integer height = 336
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Listado de usuarios utilizando la programaci$$HEX1$$f300$$ENDHEX$$n"
end type

