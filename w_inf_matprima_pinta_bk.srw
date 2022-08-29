HA$PBExportHeader$w_inf_matprima_pinta_bk.srw
$PBExportComments$Informe de muestras de ejecutivas, se muestran tambien los dias
forward
global type w_inf_matprima_pinta_bk from w_report
end type
type dw_1 from u_dw_application within w_inf_matprima_pinta_bk
end type
type pb_1 from picturebutton within w_inf_matprima_pinta_bk
end type
type gb_1 from groupbox within w_inf_matprima_pinta_bk
end type
type gb_2 from groupbox within w_inf_matprima_pinta_bk
end type
end forward

global type w_inf_matprima_pinta_bk from w_report
integer width = 3479
integer height = 2004
string title = "Materia Prima Consolidado"
event ue_guardar_img_excel ( )
dw_1 dw_1
pb_1 pb_1
gb_1 gb_1
gb_2 gb_2
end type
global w_inf_matprima_pinta_bk w_inf_matprima_pinta_bk

type variables
long il_fabrica,il_linea,il_referencia,il_talla,il_calidad,&
     il_diseno,il_color,il_muestrario,il_centro
end variables

forward prototypes
public function integer of_reset1 (string a_columna)
public function integer of_recuperar ()
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

public function integer of_recuperar ();long ll_tot,i,ll_parte,ll_grupo,ll_parte1,ll_grupo1,ll_comb,ll_comb1,ll_muestrario
String ls_mensaje

If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

SELECT max(co_muestrario) 
INTO :ll_muestrario
FROM r_fmp
where ( r_fmp.co_fabrica = :il_fabrica ) AND  
      ( r_fmp.co_linea = :il_linea ) AND  
      ( r_fmp.co_referencia = :il_referencia ) AND  
      ( r_fmp.co_talla = :il_talla ) AND  
      ( r_fmp.co_calidad = :il_calidad ) 
USING n_cst_application.itr_appl		;

IF n_cst_application.itr_appl.sqlcode < 0  then
	ls_mensaje = n_cst_application.itr_appl.sqlerrtext
	RollBack using n_cst_application.itr_appl;
	MessageBox("Advertencia!","Error al consultar muestrario" + ls_mensaje ,StopSign!)
	Return -1
End if	

IF isnull(il_diseno) Then
	il_diseno = -1
End if	
IF isnull(il_color) Then
	il_color = -9999
End if	

ll_tot = dw_report.Retrieve(il_fabrica,&
              il_linea,&
				  il_referencia,&
				  il_talla,&
				  il_calidad,&
				  il_diseno,ll_muestrario,il_color)
//
//////////////////////////////////////////////////////////////////////////
// Libero la transaccion
// 
//////////////////////////////////////////////////////////////////////////
RollBack using n_cst_application.itr_appl;

If ll_tot = 0 Then
	Messagebox("Advertencia","Sin datos para la referencia")
End If

If ll_tot<0 Then
	Return -1
End If
////////////////////////////////////////////////////////////////////////////
//// Coloco si es o no visible el campo inicialmente todos son visibles
//// y si es parte no respite, si es combinacion si
////////////////////////////////////////////////////////////////////////////
//for i=1 To ll_tot
//	ll_parte=dw_report.GetItemNUmber(i,"co_partemp")
//	If ll_parte=999 Then
//		If i>1 Then
//			ll_comb=dw_report.GetItemNUmber(i ,"co_combinacion")
//			ll_comb1=dw_report.GetItemNUmber(i -1,"co_combinacion")
//			ll_grupo=dw_report.GetItemNUmber(i,"grupo")
//			ll_grupo1=dw_report.GetItemNUmber(i -1,"grupo")
//			
//			If ll_grupo=ll_grupo1 and ll_comb=ll_comb1 Then
//				dw_report.SetItem(i,"vis",0)
//			Else
//				dw_report.SetItem(i,"vis",1)
//			End If
//		Else
//			dw_report.SetItem(i,"vis",1)
//	   End If
//		
//	Else
//		If i>1 Then
//			ll_parte1=dw_report.GetItemNUmber(i -1,"co_partemp")
//			ll_grupo=dw_report.GetItemNUmber(i,"grupo")
//			ll_grupo1=dw_report.GetItemNUmber(i -1,"grupo")
//			
//			If ll_grupo=ll_grupo1 and ll_parte=ll_parte1 Then
//				dw_report.SetItem(i,"vis",0)
//			Else
//				dw_report.SetItem(i,"vis",1)
//			End If
//		Else
//			dw_report.SetItem(i,"vis",1)
//	   End If
//		
//	End If
//Next
//
//
////////////////////////////////////////////////////////////////////////////
//// Coloco la descripci$$HEX1$$f300$$ENDHEX$$n de la referencia y la fecha del sistema
//// 
////////////////////////////////////////////////////////////////////////////
//datetime ldt_fecha
//string ls_usuario,ls_instancia
////Tambien actualizar fecha,usuario,instancia
//If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
//												 ldt_fecha,ls_usuario,ls_instancia) Then
//	Return -1
//End If
//
//dw_report.Modify("fecha.text='"+String(ldt_fecha,"YYYY/MM/DD hh:mm")+"'")
//dw_report.Modify("usuario.text='"+ls_usuario+"'")
//dw_report.Modify("muestrario.text='("+String(il_muestrario)+") "+&
//                 dw_1.GetItemString(1,"de_muestrario")+"'")
//dw_report.Modify("diseno.text='("+String(il_diseno)+") "+&
//                 dw_1.GetItemString(1,"de_diseno")+"'")
//
//dw_report.Modify("talla.text='("+String(il_talla)+") "+&
//                 dw_1.GetItemString(1,"de_talla")+"'")
//
//dw_report.Modify("de_referencia.text='"+&
//                 dw_1.GetItemString(1,"de_referencia")+"'")
//					  
//
////////////////////////////////////////////////////////////////////////////
//// Selecciono datos adicionales para el informe
//// peso, recurso, fecha creacion y modificacion
////////////////////////////////////////////////////////////////////////////
//String ls_peso,ls_recurso,ls_modificacion,ls_creacion
//
//If of_datosAdicionales(ls_peso,ls_recurso,ls_creacion,ls_modificacion)=1 Then
//	dw_report.Modify("peso.text='"+ls_peso+"'")
//	dw_report.Modify("recurso.text='"+ls_recurso+"'")
//	dw_report.Modify("creacion.text='"+ls_creacion+"'")
//	dw_report.Modify("modificacion.text='"+ls_modificacion+"'")
//Else
//	dw_report.Modify("peso.text=''")
//	dw_report.Modify("recurso.text=''")
//	dw_report.Modify("creacion.text=''")
//	dw_report.Modify("modificacion.text=''")
//	
//End If
////////////////////////////////////////////////////////////////////////////
//// Se colocan las observaciones
//// 
////////////////////////////////////////////////////////////////////////////
//
//dw_report.Modify("observaciones.text='"+of_observacion()+"'")
//
Return 1
end function

on w_inf_matprima_pinta_bk.create
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

on w_inf_matprima_pinta_bk.destroy
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

type dw_report from w_report`dw_report within w_inf_matprima_pinta_bk
integer x = 9
integer y = 300
integer width = 3287
integer height = 1380
string dataobject = "d_crost_materia_prima_col_pinta"
boolean border = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from u_dw_application within w_inf_matprima_pinta_bk
integer x = 55
integer y = 64
integer width = 2747
integer height = 212
boolean bringtotop = true
string dataobject = "d_ext_mp_rep_color_pinta"
boolean vscrollbar = false
boolean livescroll = false
end type

event doubleclicked;call super::doubleclicked;//
//n_cst_param lo_param
//
//If dwo.name="co_talla" Then
//	lo_param.il_vector[1]=il_fabrica
//	lo_param.il_vector[2]=il_linea
//	lo_param.il_vector[3]=il_referencia
//	lo_param.il_vector[4]=il_calidad
//
//	OpenWithParm(w_bus_tallas_referencia,lo_param)
//	
//	lo_param=Message.PowerObjectParm
//	
//	If IsValid(lo_param) Then
//		SetText(String(lo_param.il_vector[1]))
//	End If
//End If
//
//
//If dwo.name="co_diseno" Then
//	
//	lo_param.il_vector[1]=il_fabrica
//	lo_param.il_vector[2]=il_linea
//	lo_param.il_vector[3]=il_referencia
//	lo_param.il_vector[4]=il_talla
//	lo_param.il_vector[5]=il_calidad
//	
//	OpenWithParm(w_diseno,lo_param)
//	
//	lo_param=Message.PowerObjectParm
//	
//	If IsValid(lo_param) Then
//		SetText(String(lo_param.il_vector[1]))
//	End If
//End If
//
//If dwo.name="co_muestrario" Then
//	
//	lo_param.il_vector[1]=il_fabrica
//	lo_param.il_vector[2]=il_linea
//	lo_param.il_vector[3]=0
//	
//	OpenWithParm(w_bus_m_muestrarios,lo_param)
//	
//	lo_param=Message.PowerObjectParm
//	
//	If IsValid(lo_param) Then
//		SetText(String(lo_param.il_vector[1]))
//	End If
//End If


end event

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

If dwo.name="co_referencia" Then
	il_referencia=Long(Data)
	ll_res=lo_comun.of_nombrereferencia( il_fabrica,il_linea,il_referencia,&
	                n_cst_application.itr_appl)
	If ll_res<>1 Then
		il_referencia=-1
		MessageBox("Advertencia!","La referencia no existe.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_referencia",lo_comun.of_getString(1))

	of_reset1(dwo.name)
End If

If dwo.name="co_talla" Then
	il_talla=long(data)
	ll_res=lo_comun.of_nombrereferenciatalla(il_fabrica,il_linea,il_referencia,il_talla,&
	       il_calidad,n_cst_application.itr_appl)
			 
	If ll_res<>1 Then
		il_talla=-1
		MessageBox("Advertencia!","Talla no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_talla",lo_comun.of_getString(1))
End if

If dwo.name="co_color" Then
	ls_color = data
	if isnull(data) Then
		il_color= -9999
	Else
		il_color=Long(Data)
	End if	
	of_reset1(dwo.name)
End If

//
//	of_reset1(dwo.name)
//
////////////////////////////////////////////////////////////////////////////
//// Verifico si la ref tiene un solo dise$$HEX1$$f100$$ENDHEX$$o y lo coloco, que es lo usual
//// 
////////////////////////////////////////////////////////////////////////////
//	ll_res=of_diseno()
//	If ll_res<>-1 Then
//		il_diseno=ll_res
//		ll_res=lo_comun.of_nombrediseno( il_fabrica,il_linea,il_referencia,il_talla,&
//			il_calidad,il_diseno,n_cst_application.itr_appl)
//				 
//		If ll_res=1 Then
//			SetItem(row,"co_diseno",il_diseno)
//			SetItem(row,"de_diseno",lo_comun.of_getString(1))
//		End If
//	End If
////////////////////////////////////////////////////////////////////////////
//// Cuando se digita esto, se determina el muestrario como el maximo
//// en dt_ref_x_col, claro que se puede cambiar
////////////////////////////////////////////////////////////////////////////
//	ll_res=of_muestrario()
//	If ll_res<>-1 Then
//		il_muestrario=ll_res
//	End If
//
//
//End If
//
//If dwo.name="co_calidad" Then
//	il_calidad=Long(Data)
////////////////////////////////////////////////////////////////////////////
//// Verifico si la ref tiene un solo dise$$HEX1$$f100$$ENDHEX$$o y lo coloco, que es lo usual
//// 
////////////////////////////////////////////////////////////////////////////
//	ll_res=of_diseno()
//	If ll_res<>-1 Then
//		il_diseno=ll_res
//		ll_res=lo_comun.of_nombrediseno( il_fabrica,il_linea,il_referencia,il_talla,&
//			il_calidad,il_diseno,n_cst_application.itr_appl)
//				 
//		If ll_res=1 Then
//			SetItem(row,"co_diseno",il_diseno)
//			SetItem(row,"de_diseno",lo_comun.of_getString(1))
//		End If
//	End If
//	
////////////////////////////////////////////////////////////////////////////
//// Cuando se digita esto, se determina el muestrario como el maximo
//// en dt_ref_x_col, claro que se puede cambiar
////////////////////////////////////////////////////////////////////////////
//	ll_res=of_muestrario()
//	If ll_res<>-1 Then
//		il_muestrario=ll_res
//	End If
//	
//	
//End If
//
If dwo.name="co_diseno" Then
	il_diseno=long(data)
	ll_res=lo_comun.of_nombrediseno( il_fabrica,il_linea,il_referencia,il_talla,&
	il_calidad,il_diseno,n_cst_application.itr_appl)
			 
	If ll_res<>1 Then
		il_diseno=-1
		MessageBox("Advertencia!","Disen$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_diseno",lo_comun.of_getString(1))

	of_reset1(dwo.name)
	
//	ll_res=of_muestrario()
//	If ll_res<>-1 Then
//		il_muestrario=ll_res
//	End If
		
		
End If
//
//If dwo.name="co_muestrario" Then
//	il_muestrario=Long(Data)
//	ll_res=lo_comun.of_nombremuestrario( il_fabrica,il_linea,&
//	       il_muestrario,n_cst_application.itr_appl)
//	If ll_res<>1 Then
//		il_diseno=-1
//		MessageBox("Advertencia!","Muestrario no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
//		Return 2
//	End If
//	SetItem(row,"de_muestrario",lo_comun.of_getString(1))
//
//	of_reset1(dwo.name)
//End If
//		
//			 
//
//
end event

event ue_print;//
end event

event getfocus;//
end event

event itemerror;//
end event

type pb_1 from picturebutton within w_inf_matprima_pinta_bk
integer x = 2866
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

type gb_1 from groupbox within w_inf_matprima_pinta_bk
integer x = 37
integer width = 2779
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

type gb_2 from groupbox within w_inf_matprima_pinta_bk
integer x = 2834
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

