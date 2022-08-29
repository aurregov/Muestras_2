HA$PBExportHeader$w_rep_historia_muestrario_color.srw
$PBExportComments$Informe de muestras de ejecutivas, se muestran tambien los dias
forward
global type w_rep_historia_muestrario_color from w_report
end type
type dw_1 from u_dw_application within w_rep_historia_muestrario_color
end type
type pb_1 from picturebutton within w_rep_historia_muestrario_color
end type
type gb_1 from groupbox within w_rep_historia_muestrario_color
end type
type gb_2 from groupbox within w_rep_historia_muestrario_color
end type
end forward

global type w_rep_historia_muestrario_color from w_report
integer width = 3479
integer height = 2004
string title = "Historia Muestrario color"
event ue_guardar_img_excel ( )
dw_1 dw_1
pb_1 pb_1
gb_1 gb_1
gb_2 gb_2
end type
global w_rep_historia_muestrario_color w_rep_historia_muestrario_color

type variables
long il_fabrica,il_linea,il_referencia,il_talla,il_calidad,&
     il_diseno,il_color,il_muestrario,il_centro, il_fila
String is_where
end variables

forward prototypes
public function integer of_reset1 (string a_columna)
public function integer of_recuperar ()
public function long of_completar_consulta ()
end prototypes

event ue_guardar_img_excel();String  ls_file,ls_path
Integer li_value
datawindow ls_dw

IF dw_report.rowcount( ) = 0 Then Return

li_value = GetFileSaveName("Guardar como...", &
                           ls_path,ls_file,"XLS",&
									"Excel (*.XLS), *.XLS,"+&
									"Excel (*.PDF), *.PDF,"+&									
									"Excel (*.XML), *.XML,"+&																		
									"Excel (*.XML), *.XML,"+&																											
									"Texto (*.HTML), *.HTML")
If li_value = 1 Then
	if Upper(Right(Trim(ls_path),3)) = "XLS"	Then	
		dw_report.SaveAs(ls_path,Excel!,True)
		/* FACL - 2018/08/21 - Libreria dw_xls no compatible con 2017
		ls_dw = dw_report				
		uf_save_dw_as_excel(ls_dw, ls_path)	*/
	End If	
End If	
end event

public function integer of_reset1 (string a_columna);string 	ls_null
long  	ll_null

SetNull(ls_null)
SetNull(ll_null)

dw_report.Reset()

CHOOSE CASE a_columna
	CASE "co_fabrica"
		dw_1.SetItem(1,"co_linea",ll_null)
		dw_1.SetItem(1,"co_referencia",ll_null)
		dw_1.SetItem(1,"de_referencia",ls_null)
		dw_1.SetItem(1,"co_talla",ll_null)
		dw_1.SetItem(1,"de_talla",ls_null)
		dw_1.SetItem(1,"co_calidad",1)
		dw_1.SetItem(1,"co_muestrario",ll_null)
		dw_1.SetItem(1,"de_muestrario",ls_null)
		dw_1.SetItem(1,"co_diseno",ll_null)
		dw_1.SetItem(1,"de_diseno",ls_null)
		dw_1.SetItem(1,"co_color",ll_null)
		il_color = -9999		
		il_linea=-1
		il_referencia=-1
		il_talla=-1
		il_diseno=-1
		il_muestrario=-1		
	CASE "co_linea"
		dw_1.SetItem(1,"co_referencia",ll_null)
		dw_1.SetItem(1,"de_referencia",ls_null)
		dw_1.SetItem(1,"co_talla",ll_null)
		dw_1.SetItem(1,"de_talla",ls_null)
		dw_1.SetItem(1,"co_calidad",1)
		dw_1.SetItem(1,"co_muestrario",ll_null)
		dw_1.SetItem(1,"de_muestrario",ls_null)
		dw_1.SetItem(1,"co_diseno",ll_null)
		dw_1.SetItem(1,"de_diseno",ls_null)		
		dw_1.SetItem(1,"co_color",ll_null)
		il_color = -9999				
		il_referencia=-1
		il_talla=-1
		il_diseno=-1
		il_muestrario=-1		
		
	CASE "co_referencia"
		dw_1.SetItem(1,"co_talla",ll_null)
		dw_1.SetItem(1,"de_talla",ls_null)
		dw_1.SetItem(1,"co_calidad",1)
		dw_1.SetItem(1,"co_muestrario",ll_null)
		dw_1.SetItem(1,"de_muestrario",ls_null)
		dw_1.SetItem(1,"co_diseno",ll_null)
		dw_1.SetItem(1,"de_diseno",ls_null)
		dw_1.SetItem(1,"co_color",ll_null)
		il_color = -9999				
		il_talla=-1
		il_diseno=-1
		il_muestrario=-1		
	CASE "co_talla"
		dw_1.SetItem(1,"co_calidad",1)
		dw_1.SetItem(1,"co_diseno",ll_null)
		dw_1.SetItem(1,"de_diseno",ls_null)		
		dw_1.SetItem(1,"co_color",ll_null)
		il_color = -9999				
		il_diseno=-1
	CASE "co_calidad"
		dw_1.SetItem(1,"co_diseno",ll_null)
		dw_1.SetItem(1,"de_diseno",ls_null)		
		
		
END CHOOSE


Return 1
end function

public function integer of_recuperar ();String ls_sel1,ls_modString
long ll_pos

if of_completar_consulta() <> 1 Then
	Return -1
End if	

If Right(is_where,1)=")" Then
	
	ls_sel1=dw_report.Describe("DataWindow.Table.Select")

	ll_pos=pos(ls_sel1,"s_muestrario_color.co_diseno = m_disenos_muestras.co_diseno )")
	
	If ll_pos>0 Then
		ls_Sel1=Left(ls_sel1, ll_pos -1)
	End If
	
	ls_modString="DataWindow.Table.Select='" &
		+ ls_sel1 + is_where + "'"
	
	dw_report.Modify(ls_modString)
	
End If
il_fila=0
dw_report.Retrieve()
If dw_report.RowCount()=0 then
	Messagebox("Advertencia","No se encontraron datos con los parametros especificados")
End If

dw_report.SetFocus()

Return 1
end function

public function long of_completar_consulta ();If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

is_where="s_muestrario_color.co_diseno = m_disenos_muestras.co_diseno ) and ("
String ls_cad

ls_cad=String(dw_1.GetItemNumber(1,"co_fabrica"))

If Not IsNull(ls_cad) Then
	is_where+="m_muestras.co_fabrica="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"co_linea"))

If Not IsNull(ls_cad) Then
	is_where+="m_muestras.co_linea="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"co_muestra"))

If Not IsNull(ls_cad) Then
	is_where+="m_muestras.co_muestra="+ls_cad+" and "
End If

//ls_cad=dw_1.GetItemString(1,"descripcion_mue")
//
//If Not IsNull(ls_cad) Then
//	is_where+="m_muestras.de_muestra like ~~'%"+ls_cad+"%~~' and "
//End If        

ls_cad = String(dw_1.GetItemNumber(1,"co_talla"))

If Not IsNull(ls_cad) Then
	is_where+="s_muestrario_color.co_talla="+ls_cad+" and "
End If   

ls_cad=String(dw_1.GetItemNumber(1,"co_muestrario"))

If Not IsNull(ls_cad) Then
	is_where+="s_muestrario_color.co_muestrario="+ls_cad+" and "
End If

ls_cad= String(dw_1.GetItemNumber(1,"co_diseno"))

If Not IsNull(ls_cad) Then
	is_where+=" s_muestrario_color.co_diseno="+ls_cad+" and "
End If

ls_cad= String(dw_1.GetItemNumber(1,"co_color"))

If Not IsNull(ls_cad) Then
	is_where+="s_muestrario_color.co_color="+ls_cad+" and "
End If

////////////////////////////////////
//ls_cad = String(dw_1.GetItemNumber(1,"referencia"))
//If Not IsNull(ls_cad) Then
//	is_where+= "m_muestras.co_muestra in (select distinct dmr.co_muestra	from dt_muestras_ref dmr, h_preref p" + &
//		" where  dmr.co_referencia_ref =" + ls_cad + &
//			" and p.co_fabrica =  dmr.co_fabrica and p.co_linea = dmr.co_linea" + &
//			" and p.co_referencia = dmr.co_referencia_ref ) " + " and "
//			
//else
//	ls_cad = dw_1.GetItemString(1,"descripcion")
//	If Not IsNull(ls_cad) Then
//			is_where+= "m_muestras.co_muestra in (select distinct dmr.co_muestra	from dt_muestras_ref dmr, h_preref p" + &
//			" where  de_referencia LIKE  ~~'%"+ls_cad+"%~~'" + &
//			" and p.co_fabrica =  dmr.co_fabrica and p.co_linea = dmr.co_linea" + &
//			" and p.co_referencia = dmr.co_referencia_ref ) " + " and "
//	END IF	
//End If   
//
///////////////////////////////////

If Right(is_where,4)="and " Then
	is_where=left(is_where, len(is_where) - 4)+")"
ELse
	Messagebox("Advertencia","Debe digitar como m$$HEX1$$ed00$$ENDHEX$$nimo un criterio de busqueda")
	Return -1
End If

//of_recuperar()

Return 1
end function

on w_rep_historia_muestrario_color.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.pb_1=create pb_1
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.pb_1
this.Control[iCurrent+3]=this.gb_1
this.Control[iCurrent+4]=this.gb_2
end on

on w_rep_historia_muestrario_color.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_1)
destroy(this.pb_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;x=1
y=1
long 					ll_res
n_cst_comun    	lo_comun

il_diseno = -1
il_color = -9999
il_calidad=1
dw_1.InsertRow(0)

//io_param=Message.PowerObjectParm
//il_centro=12

dw_report.SetTransObject(n_cst_application.itr_appl)
dw_report.Modify("DataWindow.Print.Preview=Yes")

end event

event resize;dw_report.SetRedraw(False)
dw_report.width  = newwidth - dw_report.x
dw_report.height = newheight - dw_report.y
dw_report.SetRedraw(True)

end event

event ue_find;of_recuperar()
end event

type dw_report from w_report`dw_report within w_rep_historia_muestrario_color
integer x = 9
integer y = 300
integer width = 3287
integer height = 1380
string dataobject = "dgr_historia_muestrario_color"
boolean border = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from u_dw_application within w_rep_historia_muestrario_color
integer x = 55
integer y = 64
integer width = 2953
integer height = 212
boolean bringtotop = true
string dataobject = "d_ext_rep_historia_muestrario_col"
boolean vscrollbar = false
boolean livescroll = false
end type

event itemchanged;call super::itemchanged;n_cst_comun lo_comun
long ll_res
String ls_color
If dwo.name="co_fabrica" Then
	il_fabrica=long(Data)
	of_reset1(dwo.name)
End If

If dwo.name="co_linea" Then
	il_linea=Long(Data)
	of_reset1(dwo.name)
End If

//If dwo.name="co_talla" Then
//	il_talla=long(data)
//	ll_res=lo_comun.of_nombrereferenciatalla(il_fabrica,il_linea,il_referencia,il_talla,&
//	       il_calidad,n_cst_application.itr_appl)
//			 
//	If ll_res<>1 Then
//		il_talla=-1
//		MessageBox("Advertencia!","Talla no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
//		Return 2
//	End If
//	SetItem(row,"de_talla",lo_comun.of_getString(1))
//End if

If dwo.name="co_color" Then
	ls_color = data
	if isnull(data) Then
		il_color= -9999
	Else
		il_color=Long(Data)
	End if	
	of_reset1(dwo.name)
End If


//If dwo.name="co_diseno" Then
//	il_diseno=long(data)
//	ll_res=lo_comun.of_nombrediseno( il_fabrica,il_linea,il_referencia,il_talla,&
//	il_calidad,il_diseno,n_cst_application.itr_appl)
//			 
//	If ll_res<>1 Then
//		il_diseno=-1
//		MessageBox("Advertencia!","Disen$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
//		Return 2
//	End If
//	SetItem(row,"de_diseno",lo_comun.of_getString(1))
//
//	of_reset1(dwo.name)
//	
////	ll_res=of_muestrario()
////	If ll_res<>-1 Then
////		il_muestrario=ll_res
////	End If
//	
//End If

If dwo.name="co_muestrario" Then
	il_muestrario=Long(Data)
	ll_res=lo_comun.of_nombremuestrario( il_fabrica,il_linea,&
	       il_muestrario,n_cst_application.itr_appl)
//	If ll_res<>1 Then
//		il_diseno=-1
//		MessageBox("Advertencia!","Muestrario no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
//		Return 2
//	End If
	SetItem(row,"de_muestrario",lo_comun.of_getString(1))

	of_reset1(dwo.name)
End If
end event

event ue_print;//
end event

event getfocus;//
end event

event itemerror;//
end event

type pb_1 from picturebutton within w_rep_historia_muestrario_color
integer x = 3118
integer y = 84
integer width = 142
integer height = 152
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Custom043!"
alignment htextalign = left!
string powertiptext = "Guardar Imagen Excel"
end type

event clicked;parent.triggerevent("ue_guardar_img_excel")
end event

type gb_1 from groupbox within w_rep_historia_muestrario_color
integer x = 14
integer width = 3017
integer height = 284
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Referencia"
end type

type gb_2 from groupbox within w_rep_historia_muestrario_color
integer x = 3086
integer width = 210
integer height = 284
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

