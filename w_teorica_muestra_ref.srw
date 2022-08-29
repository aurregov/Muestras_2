HA$PBExportHeader$w_teorica_muestra_ref.srw
$PBExportComments$Para el manejo de la producci$$HEX1$$f300$$ENDHEX$$n te$$HEX1$$f300$$ENDHEX$$rica por muestras ref
forward
global type w_teorica_muestra_ref from w_response
end type
type dw_tiempo2 from datawindow within w_teorica_muestra_ref
end type
type cb_2 from commandbutton within w_teorica_muestra_ref
end type
type cb_1 from commandbutton within w_teorica_muestra_ref
end type
type dw_tiempo from u_dw_application within w_teorica_muestra_ref
end type
type gb_2 from groupbox within w_teorica_muestra_ref
end type
end forward

global type w_teorica_muestra_ref from w_response
integer width = 2071
integer height = 544
string title = "Producci$$HEX1$$f300$$ENDHEX$$n te$$HEX1$$f300$$ENDHEX$$rica"
dw_tiempo2 dw_tiempo2
cb_2 cb_2
cb_1 cb_1
dw_tiempo dw_tiempo
gb_2 gb_2
end type
global w_teorica_muestra_ref w_teorica_muestra_ref

type variables
String is_forma_tejer
Long sw_divede_x_dos, il_tipoprod
end variables

forward prototypes
public function integer of_actualizatiempo ()
public subroutine of_formato_tejer ()
end prototypes

public function integer of_actualizatiempo ();//////////////////////////////////////////////////////////////////////////
// RENE ARIAS ESPARZA 
// Lunes 06 de Febrero de 2016 HORA 14:41:07:039
// SA52991 - E00526 Independizar Dato Te$$HEX1$$f300$$ENDHEX$$rico de Muestras
// 
//////////////////////////////////////////////////////////////////////////
DateTime ldt_fecha
String ls_usuario,ls_instancia,ls_estado
Double ld_producc_teo,ld_minutos,ld_segundos,ld_solo_seg
Double ld_recurso,ld_muestra,ld_talla
Integer li_fila,li_contador,li_fabrica,li_linea

If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If

If dw_tiempo.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos de tiempo no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If dw_tiempo.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
	RollBack Using n_cst_application.itr_appl;
	Return -1
End If			

If dw_tiempo.Update()<>1 Then
	RollBack Using n_cst_application.itr_appl ;
	Return -1
End If

li_fila        = dw_tiempo.GetRow()
ld_recurso	 	= dw_tiempo.GetItemNumber(li_fila,"co_recurso")
li_fabrica	 	= dw_tiempo.GetItemNumber(li_fila,"co_fabrica")
li_linea 		= dw_tiempo.GetItemNumber(li_fila,"co_linea")
ld_muestra 		= dw_tiempo.GetItemNumber(li_fila,"co_muestra")
ld_talla 		= dw_tiempo.GetItemNumber(li_fila,"co_talla")
ld_producc_teo = dw_tiempo.GetItemNumber(li_fila,"produccion_teo")
ld_minutos 		= dw_tiempo.GetItemNumber(li_fila,"minutos")
ld_segundos 	= dw_tiempo.GetItemNumber(li_fila,"segundos")
ld_solo_seg		= dw_tiempo.GetItemNumber(li_fila,"solo_seg")
ls_estado      = dw_tiempo.GetItemString(li_fila,"estado")

Select Count(*)
Into	 :li_contador
From   m_producc_teo_mues m
Where  m.co_recurso = :ld_recurso
And	 m.co_fabrica = :li_fabrica
And	 m.co_linea   = :li_linea
And 	 m.co_muestra = :ld_muestra
And 	 m.co_talla   = :ld_talla
using  n_cst_application.itr_appl;

If li_contador = 0 Then
	dw_tiempo2.setItem(1,"produccion_teo", ld_producc_teo)
	dw_tiempo2.setItem(1,"minutos", ld_minutos)
	dw_tiempo2.setItem(1,"segundos", ld_segundos)
	dw_tiempo2.setItem(1,"solo_seg", ld_solo_seg)
	dw_tiempo2.setItem(1,"estado", ls_estado)
	dw_tiempo2.setItem(1,"fe_actualizacion", ldt_fecha)
	dw_tiempo2.setItem(1,"usuario", ls_usuario)
	dw_tiempo2.setItem(1,"instancia", ls_instancia)
	
	If dw_tiempo2.Update()<>1 Then
		RollBack Using n_cst_application.itr_appl ;
		Return -1
	End If
End If

Commit Using n_cst_application.itr_appl ;

Return 1

end function

public subroutine of_formato_tejer ();Decimal ldec_prod_teo
dw_tiempo.accepttext()

IF is_forma_tejer= "L" THEN
	Messagebox("Advertencia","El formato de tejer es: CADENA LARG DER/IZQ, por tanto la producci$$HEX1$$f300$$ENDHEX$$n teorica se divide entre dos ")
END IF	

ldec_prod_teo = dw_tiempo.Getitemdecimal(1,"produccion_teo")
ldec_prod_teo = ldec_prod_teo / 2

dw_tiempo.setitem(1, "produccion_teo", ldec_prod_teo) 
dw_tiempo.accepttext()
end subroutine

on w_teorica_muestra_ref.create
int iCurrent
call super::create
this.dw_tiempo2=create dw_tiempo2
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_tiempo=create dw_tiempo
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_tiempo2
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.dw_tiempo
this.Control[iCurrent+5]=this.gb_2
end on

on w_teorica_muestra_ref.destroy
call super::destroy
destroy(this.dw_tiempo2)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_tiempo)
destroy(this.gb_2)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// RENE ARIAS ESPARZA 
// Lunes 06 de Febrero de 2016 HORA 14:41:07:039
// SA52991 - E00526 Independizar Dato Te$$HEX1$$f300$$ENDHEX$$rico de Muestras
// 
//////////////////////////////////////////////////////////////////////////


n_cst_param lo_param

lo_param=message.powerObjectParm

dw_tiempo.SetTransObject(n_cst_application.itr_appl)
dw_tiempo2.SetTransObject(n_cst_application.itr_appl)

long ll_tot,ll_tot2

is_forma_tejer = lo_param.is_vector[1]
il_tipoprod    = lo_param.il_vector[6]

ll_tot=dw_tiempo.Retrieve(lo_param.il_vector[1],&
                         lo_param.il_vector[2],&
								 lo_param.il_vector[3],&
								 lo_param.il_vector[4],&
								 lo_param.il_vector[5])
								 
If ll_tot<0 Then
	MessageBox("Advertencia!","Error recuperando informaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
	Close(This)
	Return
End If

If ll_tot=0 Then
	dw_tiempo.insertRow(0)
	dw_tiempo.setItem(1,"co_recurso",   lo_param.il_vector[1])
	dw_tiempo.setItem(1,"co_fabrica",   lo_param.il_vector[2])
	dw_tiempo.setItem(1,"co_linea",     lo_param.il_vector[3])
	dw_tiempo.setItem(1,"co_muestra",   lo_param.il_vector[4])
	dw_tiempo.setItem(1,"co_talla",     lo_param.il_vector[5])
End If

ll_tot2=dw_tiempo2.Retrieve(lo_param.il_vector[1],&
									lo_param.il_vector[2],&
									lo_param.il_vector[3],&
									lo_param.il_vector[4],&
									lo_param.il_vector[5])
If ll_tot2=0 Then
	dw_tiempo2.insertRow(0)
	dw_tiempo2.setItem(1,"co_recurso",   lo_param.il_vector[1])
	dw_tiempo2.setItem(1,"co_fabrica",   lo_param.il_vector[2])
	dw_tiempo2.setItem(1,"co_linea",     lo_param.il_vector[3])
	dw_tiempo2.setItem(1,"co_muestra",   lo_param.il_vector[4])
	dw_tiempo2.setItem(1,"co_talla",     lo_param.il_vector[5])	
End If

sw_divede_x_dos = 0

DWObject dwo_a

dwo_a= dw_tiempo.Object.produccion_teo

dw_tiempo.Trigger Event ItemChanged(1,dwo_a,String(dw_tiempo.GetItemDecimal(1,"produccion_teo")))


dw_tiempo.setFocus()

end event

type dw_tiempo2 from datawindow within w_teorica_muestra_ref
boolean visible = false
integer x = 46
integer y = 296
integer width = 366
integer height = 168
integer taborder = 40
boolean enabled = false
string title = "none"
string dataobject = "d_teorica_muestra"
boolean border = false
boolean livescroll = true
end type

type cb_2 from commandbutton within w_teorica_muestra_ref
integer x = 905
integer y = 328
integer width = 343
integer height = 100
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;//////////////////////////////////////////////////////////////////////////
// RENE ARIAS ESPARZA 
// Lunes 06 de Febrero de 2016 HORA 14:41:07:039
// SA52991 - E00526 Independizar Dato Te$$HEX1$$f300$$ENDHEX$$rico de Muestras
// 
//////////////////////////////////////////////////////////////////////////
Close(Parent)
end event

type cb_1 from commandbutton within w_teorica_muestra_ref
integer x = 544
integer y = 328
integer width = 343
integer height = 100
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;//////////////////////////////////////////////////////////////////////////
// RENE ARIAS ESPARZA 
// Lunes 06 de Febrero de 2016 HORA 14:41:07:039
// SA52991 - E00526 Independizar Dato Te$$HEX1$$f300$$ENDHEX$$rico de Muestras
// 
//////////////////////////////////////////////////////////////////////////
If of_ActualizaTiempo()<>1 Then
	Return 
End If


Close(Parent)


end event

type dw_tiempo from u_dw_application within w_teorica_muestra_ref
event keyenter pbm_dwnprocessenter
integer x = 78
integer y = 80
integer width = 1678
integer height = 176
boolean bringtotop = true
string dataobject = "d_teorica_muestra_ref"
boolean vscrollbar = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// RENE ARIAS ESPARZA 
// Lunes 06 de Febrero de 2016 HORA 14:41:07:039
// SA52991 - E00526 Independizar Dato Te$$HEX1$$f300$$ENDHEX$$rico de Muestras
// 
//////////////////////////////////////////////////////////////////////////

end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// RENE ARIAS ESPARZA 
// Lunes 06 de Febrero de 2016 HORA 14:41:07:039
// SA52991 - E00526 Independizar Dato Te$$HEX1$$f300$$ENDHEX$$rico de Muestras
// 
//////////////////////////////////////////////////////////////////////////
Decimal 			lde_produc,lde_seg, ldec_prod_teo
long 				ll_min,ll_seg,ll_seg_solo, ll_kte_seg, ll_return
String 			ls_forma_tej
String 			ls_bpl_co_tipoprod
n_cst_comun 	lo_comun

This.accepttext()
IF il_tipoprod = 10 THEN
	ll_kte_seg = 1200
ELSE 
	ll_kte_seg = 28800
END IF

// 
//ll_return = lo_comun.of_nombrebpltipoprod(is_forma_tejer,n_cst_application.itr_appl)
//
//If ll_return = 1 Then
//	 ls_forma_tej = lo_comun.of_getString(1)
//End If

/*
* ---------------------------------------------------------------------------
* MODIFICADO: Enero 18 de 2011 - ohlondon
* ---------------------------------------------------------------------------
* Se debe incluir la division de la teorica igual que se hacia para la forma 
* de tejer L, pero ahora en las formas de tejer 4 y 5
* ---------------------------------------------------------------------------
*/

ls_forma_tej = ''
IF NOT IsNull(is_forma_tejer) AND Trim(is_forma_tejer) <> ''  THEN
	ll_return    = lo_comun.of_nombrebpltipoprod(is_forma_tejer,n_cst_application.itr_appl)

	If ll_return = 1 Then
		 ls_forma_tej = Trim(lo_comun.of_getString(1))
	ELSE 
		RETURN 0
	End If
END IF

IF ( is_forma_tejer = "L"    OR is_forma_tejer = "4" &
  OR is_forma_tejer = "5" ) and sw_divede_x_dos = 1 THEN
ELSE
	sw_divede_x_dos = 1
END IF	

If dwo.name="produccion_teo" Then
	lde_produc=Dec(Data)
	
	If IsNull(lde_produc) Then lde_produc=0
	
	//SA56269 - E00572 - Ceiba/reariase - 02-02-2017
	//If lde_produc=0 Then Return 2
	If lde_produc=0 Then 
		ll_min=GetItemNumber(1,"minutos")
		If IsNull(ll_min) Then ll_min=0
		ll_seg=GetItemNumber(1,"segundos")
		If IsNull(ll_seg) Then ll_seg=0
		If ll_min<>0 Then ll_seg=ll_min * 60
		lde_seg+=ll_min*60
		ll_seg_solo=Truncate(lde_seg,0)
		If ll_min=0 Or ll_seg=0 Then 
			Return 2
		Else
			lde_produc=ll_kte_seg/lde_seg
			lde_seg=ll_kte_seg/lde_produc
			ll_seg_solo=Truncate(lde_seg,0)
			ll_min=Truncate(lde_seg/60,0)
			ll_seg=lde_seg - ll_min * 60
			SetItem(1,"produccion_teo",lde_produc)
			SetItem(1,"minutos",ll_min)
			SetItem(1,"segundos",ll_seg)
			SetItem(1,"solo_seg",ll_seg_solo)
		End If
	Else
		lde_seg=ll_kte_seg/lde_produc
		ll_seg_solo=Truncate(lde_seg,0)
		ll_min=Truncate(lde_seg/60,0)
		ll_seg=lde_seg - ll_min * 60
		SetItem(1,"minutos",ll_min)
		SetItem(1,"segundos",ll_seg)
		SetItem(1,"solo_seg",ll_seg_solo)
		//Return 1
	End If
	//Fin SA56269
End If

If dwo.name="segundos" Then
	lde_seg=Dec(data)
	
	If IsNull(lde_seg) Then lde_seg=0
	
	ll_min=GetItemNumber(1,"minutos")
	If IsNull(ll_min) Then ll_min=0
	lde_seg+=ll_min*60
		
	If lde_seg=0 Then Return 2
	// 20110118
	//SA56269 - E00572 - Ceiba/reariase - 02-02-2017	
//	IF ( is_forma_tejer = "L"    OR is_forma_tejer = "4" &
//     OR is_forma_tejer = "5" ) and  sw_divede_x_dos = 1 THEN
//		Messagebox("Advertencia","El formato de tejer es: "+ls_forma_tej+", por tanto la producci$$HEX1$$f300$$ENDHEX$$n te$$HEX1$$f300$$ENDHEX$$rica se divide entre dos.")
//		lde_seg = lde_seg / 2 
//	ELSE
		sw_divede_x_dos = 1
//	END IF	
	//Fin SA56269

	ll_seg_solo=Truncate(lde_seg,0)
	
	ll_min=Truncate(lde_seg/60,0)
	ll_seg=lde_seg - ll_min * 60
	
	lde_produc=ll_kte_seg/lde_seg
	
	SetItem(1,"produccion_teo",lde_produc)
	SetItem(1,"solo_seg",ll_seg_solo)
	SetItem(1,"minutos",ll_min)
	SetItem(1,"segundos",ll_seg)
	SetText(String(ll_seg))

	//Return 1
End If

If dwo.name="minutos" Then
	ll_min=long(Data)
	
	If IsNull(ll_min) Then ll_min=0
	
	ll_seg=GetItemNumber(1,"segundos")
	If IsNull(ll_seg) Then ll_seg=0
	lde_seg=ll_seg+ll_min*60
	
	If lde_seg=0 Then Return 2
	// 20110118
	//SA56269 - E00572 - Ceiba/reariase - 02-03-2017
//	IF ( is_forma_tejer = "L"    OR is_forma_tejer = "4" &
//     OR is_forma_tejer = "5" )  and  sw_divede_x_dos = 1 THEN
//		Messagebox("Advertencia","El formato de tejer es: CADENA LARG DER/IZQ, por tanto la producci$$HEX1$$f300$$ENDHEX$$n teorica se divide entre dos ")
//		lde_seg = lde_seg / 2 
//		setnull(ll_seg)
//		SetItem(1,"segundos",ll_seg)
//		SetItem(1,"produccion_teo",ll_seg)
//		Return 1
//	ELSE
		sw_divede_x_dos = 1
//	END IF	

	ll_seg_solo=Truncate(lde_seg,0)
	
	lde_produc=ll_kte_seg/lde_seg
	SetItem(1,"produccion_teo",lde_produc)

	ll_min=Truncate(lde_seg/60,0)
	ll_seg=lde_seg - ll_min * 60
	SetItem(1,"minutos",ll_min)
	SetItem(1,"segundos",ll_seg)	
	SetItem(1,"solo_seg",ll_seg_solo)
	//Return 1
End If

If dwo.name="solo_seg" Then
	lde_seg=Dec(data)
	
	If IsNull(lde_seg) Then lde_seg=0
	
	If lde_seg=0 Then Return 2
	// 20110118
	//SA56269 - E00572 - Ceiba/reariase - 02-02-2017
//	IF ( is_forma_tejer = "L"    OR is_forma_tejer = "4" &
//     OR is_forma_tejer = "5" )   and  sw_divede_x_dos = 1 THEN
//		Messagebox("Advertencia","El formato de tejer es: "+ls_forma_tej+", por tanto la producci$$HEX1$$f300$$ENDHEX$$n te$$HEX1$$f300$$ENDHEX$$rica se divide entre dos.")
//		lde_seg = lde_seg / 2 
//		SetItem(1,"solo_seg",lde_seg)
//	ELSE
		sw_divede_x_dos = 1
//	END IF	
	//Fin SA56269

	lde_produc=ll_kte_seg/lde_seg
	SetItem(1,"produccion_teo",lde_produc)

	ll_min=Truncate(lde_seg/60,0)
	ll_seg=lde_seg - ll_min * 60
	SetItem(1,"minutos",ll_min)
	SetItem(1,"segundos",ll_seg)
	//Return 1
End If

//If dwo.name="produccion_teo" OR dwo.name="solo_seg" OR  dwo.name="minutos" OR dwo.name="segundos"  Then
//		
//	IF is_forma_tejer= "L" and  sw_divede_x_dos = 1 THEN
////		Messagebox("Advertencia","El formato de tejer es: CADENA LARG DER/IZQ, por tanto la producci$$HEX1$$f300$$ENDHEX$$n teorica se divide entre dos ")
////		ldec_prod_teo = This.Getitemdecimal(1,"produccion_teo")
////		ldec_prod_teo = ldec_prod_teo / 2
////
////		This.setitem(1, "produccion_teo", ldec_prod_teo) 
////		Return 1
//	ELSE
//		sw_divede_x_dos = 1
//	END IF	
////
//
//END IF	
//	
end event

event itemerror;Return 1 
end event

type gb_2 from groupbox within w_teorica_muestra_ref
integer x = 9
integer y = 24
integer width = 1774
integer height = 264
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Producci$$HEX1$$f300$$ENDHEX$$n te$$HEX1$$f300$$ENDHEX$$rica"
end type

