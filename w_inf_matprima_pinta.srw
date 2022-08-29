HA$PBExportHeader$w_inf_matprima_pinta.srw
$PBExportComments$Informe de muestras de ejecutivas, se muestran tambien los dias
forward
global type w_inf_matprima_pinta from w_report
end type
type dw_1 from u_dw_application within w_inf_matprima_pinta
end type
type pb_1 from picturebutton within w_inf_matprima_pinta
end type
type gb_1 from groupbox within w_inf_matprima_pinta
end type
type gb_2 from groupbox within w_inf_matprima_pinta
end type
end forward

global type w_inf_matprima_pinta from w_report
integer width = 3712
integer height = 2004
string title = "Materia Prima Consolidado"
event ue_guardar_img_excel ( )
dw_1 dw_1
pb_1 pb_1
gb_1 gb_1
gb_2 gb_2
end type
global w_inf_matprima_pinta w_inf_matprima_pinta

type variables
long il_fabrica,il_linea,il_referencia,il_talla,il_calidad,&
     il_diseno,il_color,il_muestrario,il_centro, il_muestra
String is_fert
n_ds_application	ids_muestra_ref, ids_dt_muestras, ids_dt_fert
end variables

forward prototypes
public function integer of_reset1 (string a_columna)
public function integer of_recuperar ()
public subroutine of_datos_muestra_ref (ref long an_muestra, ref long an_referencia, ref long an_talla, ref long an_muestrario, ref long an_fabrica, ref long an_linea, ref long sw_existe)
public subroutine of_datos_fert (ref long an_muestra, ref long an_fabrica, ref long an_linea, ref long an_talla, ref long sw_existe)
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
		dw_1.SetItem(1,"co_fabrica",ll_null)
		dw_1.SetItem(1,"co_linea",ll_null)
		dw_1.SetItem(1,"co_referencia",ll_null)
		dw_1.SetItem(1,"de_referencia",ls_null)
		dw_1.SetItem(1,"co_talla",ll_null)
		dw_1.SetItem(1,"de_talla",ls_null)
		dw_1.SetItem(1,"co_calidad",1)
		dw_1.SetItem(1,"co_muestrario",ll_null)
		dw_1.SetItem(1,"co_muestra",ll_null)		
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
		setnull(il_muestra)
	CASE "co_linea"
		dw_1.SetItem(1,"co_referencia",ll_null)
		dw_1.SetItem(1,"de_referencia",ls_null)
		dw_1.SetItem(1,"co_talla",ll_null)
		dw_1.SetItem(1,"de_talla",ls_null)
		dw_1.SetItem(1,"co_calidad",1)
		dw_1.SetItem(1,"co_muestrario",ll_null)
		dw_1.SetItem(1,"co_muestra",ll_null)				
		setnull(il_muestra)		
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
		dw_1.SetItem(1,"co_fabrica",ll_null)
		dw_1.SetItem(1,"co_linea",ll_null)
		dw_1.SetItem(1,"de_referencia",ls_null)		
		dw_1.SetItem(1,"co_talla",ll_null)
		dw_1.SetItem(1,"de_talla",ls_null)
		dw_1.SetItem(1,"co_calidad",1)
		dw_1.SetItem(1,"co_muestrario",ll_null)
		dw_1.SetItem(1,"de_muestrario",ls_null)
		dw_1.SetItem(1,"co_muestra",ll_null)				
		dw_1.SetItem(1,"co_diseno",ll_null)
		dw_1.SetItem(1,"de_diseno",ls_null)
		dw_1.SetItem(1,"co_color",ll_null)
		il_color = -9999				
		il_talla=-1
		il_diseno=-1
		il_muestrario=-1
		setnull(il_muestra)
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
String ls_mensaje, ls_fert
long ll_muestra, ll_referencia, ll_talla, ll_fabrica, ll_linea

If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

IF isnull(il_diseno) Then
	il_diseno = -1
End if	
IF isnull(il_color) Then
	il_color = -9999
End if	

ll_muestra = 0
ll_referencia = 0 
ll_talla = 0
ls_fert = dw_1.GetItemString(1, 'fert') 

dw_report.SetRedraw(FALSE)

IF IsNull(ls_fert) THEN
	dw_report.DataObject = 'd_crost_materia_prima_col_pinta_mod'
ELSE
	dw_report.DataObject = 'd_crost_mat_prima_col_pinta_mod_fert'
END IF

dw_report.SetTransObject(n_cst_application.itr_appl)
dw_report.Modify("DataWindow.Print.Preview=Yes")

dw_report.SetRedraw(TRUE)

IF isnull(il_muestra) OR il_muestra=0 THEN
	IF isnull(il_referencia) OR il_referencia = 0 OR isnull(il_talla) OR il_talla=0 THEN
		IF IsNull(ls_fert) THEN
			MessageBox("Advertencia!","Se debe digitar la referencia y talla o el c$$HEX1$$f300$$ENDHEX$$digo de la muestra o el Fert" ,StopSign!)
			Return -1
		END IF
	ELSE
		
		ll_referencia = il_referencia
		ll_talla = il_talla			
	END IF	
ELSE
	ll_muestra = il_muestra	
END IF

IF not isnull(ll_muestra)  and ll_muestra > 0 THEN
	IF ids_dt_muestras.retrieve(ll_muestra) > 0 THEN
		ll_muestra = ids_dt_muestras.getitemNumber(1,"co_muestra")
		ll_talla = ids_dt_muestras.getitemNumber(1,"co_talla")
		ll_fabrica = ids_dt_muestras.getitemNumber(1,"co_fabrica")
		ll_linea = ids_dt_muestras.getitemNumber(1,"co_linea")	
		IF ids_muestra_ref.retrieve(ll_muestra,ll_referencia, ll_talla) > 0 THEN
			ll_referencia = ids_muestra_ref.getitemNumber(1,"co_referencia_ref")				
		END IF	
	END IF	
ELSEIF not isnull(ll_referencia) and not isnull(ll_talla) THEN
	IF ids_muestra_ref.retrieve(ll_muestra,ll_referencia, ll_talla) > 0 THEN
		ll_muestra = ids_muestra_ref.getitemNumber(1,"co_muestra")
		ll_referencia = ids_muestra_ref.getitemNumber(1,"co_referencia_ref")
		ll_talla = ids_muestra_ref.getitemNumber(1,"co_talla_ref")
		ll_fabrica = ids_muestra_ref.getitemNumber(1,"co_fabrica")
		ll_linea = ids_muestra_ref.getitemNumber(1,"co_linea")
	END IF
ELSE
	
END IF	
	

IF IsNull(ls_fert) THEN	
	ll_tot = dw_report.Retrieve(ll_fabrica, ll_linea, ll_talla,&
							          il_diseno, il_color, ll_muestra,&
										 ll_referencia,il_muestrario)
ELSE
	ll_tot = dw_report.Retrieve(ll_fabrica, ll_linea, ll_talla,&
							          il_diseno, il_color, ll_muestra,&
										 ll_referencia,il_muestrario, ls_fert)
END IF

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

Return 1
end function

public subroutine of_datos_muestra_ref (ref long an_muestra, ref long an_referencia, ref long an_talla, ref long an_muestrario, ref long an_fabrica, ref long an_linea, ref long sw_existe);String ls_mensaje

sw_existe = 0

IF ids_muestra_ref.retrieve(an_muestra,an_referencia, an_talla) > 0 THEN
	an_referencia = ids_muestra_ref.getitemNumber(1,"co_referencia_ref")		
	an_muestra = ids_muestra_ref.getitemNumber(1,"co_muestra")
	sw_existe = 1
END IF	

IF not isnull(an_muestra) AND an_muestra > 0 THEN
	IF ids_dt_muestras.retrieve(an_muestra) > 0 THEN
		an_muestra = ids_dt_muestras.getitemNumber(1,"co_muestra")
		an_talla = ids_dt_muestras.getitemNumber(1,"co_talla")
		an_fabrica = ids_dt_muestras.getitemNumber(1,"co_fabrica")
		an_linea = ids_dt_muestras.getitemNumber(1,"co_linea")
		sw_existe = 1
	END IF		
END IF	

IF sw_existe = 1 THEN
	SELECT max(co_muestrario) 
	INTO :il_muestrario
	FROM h_fmp_muestras
	where ( co_fabrica = :an_fabrica ) AND  
			( co_linea = :an_linea ) AND
			( co_muestra = :an_muestra ) AND
			( co_talla = :an_talla ) 
	USING n_cst_application.itr_appl		;
	
	IF n_cst_application.itr_appl.sqlcode < 0  then
		ls_mensaje = n_cst_application.itr_appl.sqlerrtext
		RollBack using n_cst_application.itr_appl;
		MessageBox("Advertencia!","Error al consultar muestrario" + ls_mensaje ,StopSign!)
	End if	
	
	an_muestrario = il_muestrario
	
ELSE
	
END IF
end subroutine

public subroutine of_datos_fert (ref long an_muestra, ref long an_fabrica, ref long an_linea, ref long an_talla, ref long sw_existe);String ls_mensaje

sw_existe = 0

IF ids_dt_fert.Retrieve(is_fert) > 0 THEN
		an_muestra = ids_dt_fert.GetItemNumber(1,"co_muestra")
		an_talla   = ids_dt_fert.GetItemNumber(1,"co_talla")
		an_fabrica = ids_dt_fert.GetItemNumber(1,"co_fabrica")
		an_linea   = ids_dt_fert.GetItemNumber(1,"co_linea")
		sw_existe  = 1
END IF	

end subroutine

on w_inf_matprima_pinta.create
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

on w_inf_matprima_pinta.destroy
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

ids_dt_fert = CREATE n_ds_application
ids_dt_fert.of_load('dgr_consulta_dt_muestras_fert')
ids_dt_fert.SetTransObject(n_cst_application.itr_appl)


ids_muestra_ref = CREATE n_ds_application
ids_muestra_ref.of_load('dgr_consulta_dt_muestras_ref')
ids_muestra_ref.SetTransObject(n_cst_application.itr_appl)

ids_dt_muestras = CREATE n_ds_application
ids_dt_muestras.of_load('dgr_dt_muestras')
ids_dt_muestras.SetTransObject(n_cst_application.itr_appl)


end event

event resize;dw_report.SetRedraw(False)
dw_report.width  = newwidth - dw_report.x
dw_report.height = newheight - dw_report.y
dw_report.SetRedraw(True)

end event

event ue_find;of_recuperar()
end event

type dw_report from w_report`dw_report within w_inf_matprima_pinta
integer x = 9
integer y = 300
integer width = 3616
integer height = 1380
string dataobject = "d_crost_materia_prima_col_pinta_mod"
boolean border = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from u_dw_application within w_inf_matprima_pinta
integer x = 37
integer y = 44
integer width = 3333
integer height = 212
boolean bringtotop = true
string dataobject = "d_ext_mp_rep_color_pinta_mod"
boolean vscrollbar = false
boolean livescroll = false
end type

event itemchanged;call super::itemchanged;n_cst_comun lo_comun
long ll_res, ll_existe, ll_referencia
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
//	ll_res=lo_comun.of_nombrereferencia( il_fabrica,il_linea,il_referencia,&
//	                n_cst_application.itr_appl)
//	If ll_res<>1 Then
//		//il_referencia=-1
//		//MessageBox("Advertencia!","La referencia no existe.",StopSign!)
//		//Return 2
//	End If
//	SetItem(row,"de_referencia",lo_comun.of_getString(1))
//
//	of_reset1(dwo.name)
	
	il_talla = -1
	setnull(il_muestra)
	
	of_datos_muestra_ref( il_muestra , il_referencia , il_talla , il_muestrario , il_fabrica ,  il_linea , ll_existe)
	
	IF ll_existe > 0 THEN

		ll_referencia = il_referencia
		IF il_referencia = -1 THEN setnull(ll_referencia)
	
		SetItem(row,"co_fabrica",il_fabrica)
		SetItem(row,"co_linea",il_linea)
		SetItem(row,"co_talla",il_talla)
		SetItem(row,"co_referencia",ll_referencia)		
		SetItem(row,"co_muestrario",il_muestrario)
		
		ll_res=lo_comun.of_nombrereferenciatalla(il_fabrica,il_linea,il_referencia,il_talla,&
	       il_calidad,n_cst_application.itr_appl)
		IF ll_res = 1 THEN SetItem(row,"de_talla",lo_comun.of_getString(1))	
		
			ll_res=lo_comun.of_nombrereferencia( il_fabrica,il_linea,il_referencia,&
	                n_cst_application.itr_appl)
		IF ll_res = 1 THEN	SetItem(row,"de_referencia",lo_comun.of_getString(1))

	ELSE
			of_reset1("co_referencia")
	END IF	

End If

If dwo.name="co_talla" Then
	il_talla=long(data)
	setnull(il_muestra)
//	ll_res=lo_comun.of_nombrereferenciatalla(il_fabrica,il_linea,il_referencia,il_talla,&
//	       il_calidad,n_cst_application.itr_appl)
			 
//	If ll_res<>1 Then
////		il_talla=-1
////		MessageBox("Advertencia!","Talla no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
////		Return 2
//	End If
//	SetItem(row,"de_talla",lo_comun.of_getString(1))

	of_datos_muestra_ref( il_muestra , il_referencia , il_talla , il_muestrario , il_fabrica ,  il_linea , ll_existe)
	
	IF ll_existe > 0 THEN
	
		ll_referencia = il_referencia
		IF il_referencia = -1 THEN setnull(ll_referencia)
				
		SetItem(row,"co_fabrica",il_fabrica)
		SetItem(row,"co_linea",il_linea)
		SetItem(row,"co_talla",il_talla)
		SetItem(row,"co_referencia",ll_referencia)		
		SetItem(row,"co_muestrario",il_muestrario)
		SetItem(row,"co_muestra",il_muestra)
		
		ll_res=lo_comun.of_nombrereferenciatalla(il_fabrica,il_linea,il_referencia,il_talla,&
	       il_calidad,n_cst_application.itr_appl)
		IF ll_res = 1 THEN SetItem(row,"de_talla",lo_comun.of_getString(1))	
		
			ll_res=lo_comun.of_nombrereferencia( il_fabrica,il_linea,il_referencia,&
	                n_cst_application.itr_appl)
		IF ll_res = 1 THEN	SetItem(row,"de_referencia",lo_comun.of_getString(1))

	ELSE
			of_reset1("co_fabrica")
	END IF	

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

If dwo.name="co_muestrario" Then
	il_muestrario = Long(Data)
End If

If dwo.name="co_muestra" Then
	il_muestra = Long(Data)
	il_referencia = -1
	il_talla	= -1
	
	of_datos_muestra_ref( il_muestra , il_referencia , il_talla , il_muestrario , il_fabrica ,  il_linea , ll_existe)
	
	IF ll_existe > 0 THEN
	
		ll_referencia = il_referencia
		IF il_referencia = -1 THEN setnull(ll_referencia)
	
		SetItem(row,"co_fabrica",il_fabrica)
		SetItem(row,"co_linea",il_linea)
		SetItem(row,"co_talla",il_talla)
		SetItem(row,"co_referencia",ll_referencia)		
		SetItem(row,"co_muestrario",il_muestrario)
		
		ll_res=lo_comun.of_nombrereferenciatalla(il_fabrica,il_linea,il_referencia,il_talla,&
	       il_calidad,n_cst_application.itr_appl)
		IF ll_res = 1 THEN SetItem(row,"de_talla",lo_comun.of_getString(1))	
		
			ll_res=lo_comun.of_nombrereferencia( il_fabrica,il_linea,il_referencia,&
	                n_cst_application.itr_appl)
		IF ll_res = 1 THEN	SetItem(row,"de_referencia",lo_comun.of_getString(1))

	ELSE
			of_reset1("co_fabrica")
	END IF	
End If

If dwo.name="co_diseno" Then
	il_diseno=long(data)
	ll_res=lo_comun.of_nombrediseno( il_fabrica,il_linea,il_referencia,il_talla,&
	il_calidad,il_diseno,n_cst_application.itr_appl)
			 
	If ll_res<>1 Then
//		il_diseno=-1
//		MessageBox("Advertencia!","Dise$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
//		Return 2
	End If
	SetItem(row,"de_diseno",lo_comun.of_getString(1))

	of_reset1(dwo.name)
			
End If

If dwo.name="fert" Then
	is_fert = Trim(Data)
	il_muestra = -1
	il_referencia = -1
	il_talla	= -1
	of_datos_fert(il_muestra, il_fabrica,  il_linea, il_talla, ll_existe )
  	IF ll_existe > 0 THEN
		of_datos_muestra_ref( il_muestra , il_referencia , il_talla , il_muestrario , il_fabrica ,  il_linea , ll_existe)
	
		IF ll_existe > 0 THEN
		
			ll_referencia = il_referencia
			IF il_referencia = -1 THEN setnull(ll_referencia)
		
			SetItem(row,"co_fabrica",il_fabrica)
			SetItem(row,"co_linea",il_linea)
			SetItem(row,"co_talla",il_talla)
			SetItem(row,"co_muestra",il_muestra)
			SetItem(row,"co_muestrario",il_muestrario)
			
			ll_res=lo_comun.of_nombrereferenciatalla(il_fabrica,il_linea,il_referencia,il_talla,&
				 il_calidad,n_cst_application.itr_appl)
			IF ll_res = 1 THEN SetItem(row,"de_talla",lo_comun.of_getString(1))	
			
				ll_res=lo_comun.of_nombrereferencia( il_fabrica,il_linea,il_referencia,&
							 n_cst_application.itr_appl)
			IF ll_res = 1 THEN	SetItem(row,"de_referencia",lo_comun.of_getString(1))
		
		ELSE
				of_reset1("co_fabrica")
		END IF	
	END IF
End If

end event

event ue_print;//
end event

event getfocus;//
end event

event itemerror;//
end event

type pb_1 from picturebutton within w_inf_matprima_pinta
integer x = 3442
integer y = 88
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

type gb_1 from groupbox within w_inf_matprima_pinta
integer x = 18
integer width = 3378
integer height = 268
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

type gb_2 from groupbox within w_inf_matprima_pinta
integer x = 3410
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

