HA$PBExportHeader$w_opc_mat_prima_muestra_ref.srw
$PBExportComments$Para la busqueda de la materia prima de las muestras
forward
global type w_opc_mat_prima_muestra_ref from w_response
end type
type dw_recursos_agrupa from datawindow within w_opc_mat_prima_muestra_ref
end type
type st_1 from statictext within w_opc_mat_prima_muestra_ref
end type
type mle_nota from multilineedit within w_opc_mat_prima_muestra_ref
end type
type cb_buscar from commandbutton within w_opc_mat_prima_muestra_ref
end type
type dw_consulta from u_dw_application within w_opc_mat_prima_muestra_ref
end type
type cb_1 from commandbutton within w_opc_mat_prima_muestra_ref
end type
type cb_aceptar from commandbutton within w_opc_mat_prima_muestra_ref
end type
type dw_1 from u_dw_application within w_opc_mat_prima_muestra_ref
end type
type gb_1 from groupbox within w_opc_mat_prima_muestra_ref
end type
type gb_2 from u_gb_base within w_opc_mat_prima_muestra_ref
end type
end forward

global type w_opc_mat_prima_muestra_ref from w_response
integer x = 0
integer y = 0
integer width = 5349
integer height = 1784
string title = "Busqueda materia prima para muestras"
dw_recursos_agrupa dw_recursos_agrupa
st_1 st_1
mle_nota mle_nota
cb_buscar cb_buscar
dw_consulta dw_consulta
cb_1 cb_1
cb_aceptar cb_aceptar
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_opc_mat_prima_muestra_ref w_opc_mat_prima_muestra_ref

type variables
String is_where, is_select

DataWindowChild idc_talla

long il_fila, il_fabrica_ref, il_linea_ref

n_cst_param iou_param
end variables

forward prototypes
public function integer of_filasel (long a_fila)
public function integer of_retorno ()
public function integer of_recuperar (string a_where)
public function integer of_datos_referencia (long an_muestra, long an_fabrica, long an_linea, long an_talla)
end prototypes

public function integer of_filasel (long a_fila);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 08 de Enero de 2003 HORA 12:27:18:359
// 
// 
//////////////////////////////////////////////////////////////////////////


il_fila=a_fila

dw_consulta.SelectRow(0,False)
dw_consulta.SelectRow(il_fila,True)

String ls_color=""
long ll_fabrica,ll_linea,ll_muestra,ll_talla,&
     ll_res

n_cst_comun lo_c


ll_fabrica=dw_consulta.GetItemNumber(il_fila,"co_fabrica")
ll_linea=dw_consulta.GetItemNumber(il_fila,"co_linea")
ll_muestra=dw_consulta.GetItemNumber(il_fila,"co_muestra")
ll_talla=dw_consulta.GetItemNumber(il_fila,"co_talla")
//ll_color=dw_consulta.GetItemNumber(il_fila,"co_color")



//ll_res=lo_c.of_nombrecolor(ll_fabrica /*long a_fabrica*/,&
//                           ll_linea/*long a_linea*/,&
//									ll_color/*long a_color*/, &
//									n_cst_application.itr_appl/*transaction a_transaction */)
//									
//If ll_res=1 then
//	ls_color=lo_c.of_getString(1)
//End If
//
//mle_nota.text="Color: "+ls_color+" ("+String(ll_color)+")"+"~r~n"

//mle_nota.Show()

Return 1










end function

public function integer of_retorno ();long ll_referencia

If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If il_fila<=0 then
	MessageBox("Advertencia!","Debe seleccionar una muestra.",StopSign!)
	Return -1
End If

ll_referencia = Long(dw_consulta.GetItemString(il_fila,"co_referencia") )
setnull(il_fabrica_ref) 
setnull(il_linea_ref)

iou_param.il_vector[1] = dw_consulta.GetItemNumber(il_fila,"co_fabrica")
iou_param.il_vector[2] = dw_consulta.GetItemNumber(il_fila,"co_linea")
iou_param.il_vector[3] = dw_consulta.GetItemNumber(il_fila,"co_muestra")
iou_param.il_vector[4] = dw_consulta.GetItemNumber(il_fila,"co_talla")
//iou_param.il_vector[5] = dw_consulta.GetItemNumber(il_fila,"co_color")
iou_param.il_vector[5] = dw_consulta.GetItemNumber(il_fila,"co_tipoprod")

iou_param.il_vector[6] = ll_referencia
iou_param.il_vector[7] = dw_consulta.GetItemNumber(il_fila,"co_diseno")
iou_param.il_vector[8] = dw_consulta.GetItemNumber(il_fila,"co_muestrario")



IF NOT isnull(ll_referencia) THEN
	of_datos_referencia( iou_param.il_vector[3], iou_param.il_vector[1], iou_param.il_vector[2],iou_param.il_vector[4])
END IF	

iou_param.il_vector[9] = il_fabrica_ref
iou_param.il_vector[10] = il_linea_ref
iou_param.il_vector[11] = dw_consulta.GetItemNumber(il_fila,"cnt_opcion")

iou_param.is_vector[1]=is_where

n_cst_application.il_fabMue = dw_consulta.GetItemNumber(il_fila,"co_fabrica")
n_cst_application.il_lineaMue = dw_consulta.GetItemNumber(il_fila,"co_linea")
n_cst_application.il_muestra = dw_consulta.GetItemNumber(il_fila,"co_muestra")

Return 1
end function

public function integer of_recuperar (string a_where);String 	ls_sel1,ls_modString
long 		ll_pos, ll_posfin, ll_filas, ll_fila, ll_filas_colores, ll_fila_color
String 	ls_fert 
Decimal lc_peso1, lc_peso2
DataStore	lds_datos
lds_datos	= CREATE DataStore


//dt_muestras_col.co_color = h_fmp_muestras.co_color )
//( dt_muestras.co_talla = h_fmp_muestras.co_talla )
If Right(a_where,1)=")" Then
   // ------------------------------------------------------------------------
	ls_sel1= is_select // dw_consulta.Describe("DataWindow.Table.Select")

	ll_pos = pos(a_where,"dt_muestras_fert")

	IF Not IsNull(ll_pos) AND ll_pos > 0 THEN
		ll_pos = pos(a_where,"co_fert like") 
		If ll_pos>0 Then
			ll_pos    = ll_pos + 16 
			ll_posfin = pos(a_where, "'", ll_pos ) 
			ls_fert    = Mid(a_where, ll_pos, ll_posfin - ll_pos - 2)
			dw_1.SetItem(1,"fert", ls_fert)
		End If
		ll_pos=pos(ls_sel1,"WHERE") 
	ELSE
		ll_pos=pos(ls_sel1,"dt_muestras.co_talla = h_fmp_muestras.co_talla )")
	END IF
   // ------------------------------------------------------------------------
	
	If ll_pos>0 Then
		ls_Sel1=Left(ls_sel1, ll_pos -1)
	End If
	
	ls_modString="DataWindow.Table.Select='" &
		+ ls_sel1 + a_where + "'"
	
	dw_consulta.Modify(ls_modString)
	
End If
il_fila=0
dw_consulta.Retrieve(n_cst_application.is_user )
If dw_consulta.RowCount()=1 then
	of_filaSel(1)
End If

ll_filas = dw_consulta.Rowcount( )
lds_datos.dataobject = 'd_comparar_pesos'
lds_datos.SetTransobject(n_cst_application.itr_appl)

FOR ll_fila = 1 TO ll_filas
	lds_datos.Retrieve(dw_consulta.Object.co_fabrica[ll_fila], dw_consulta.Object.co_linea[ll_fila],dw_consulta.Object.co_muestra[ll_fila], &
							 dw_consulta.Object.co_talla[ll_fila], dw_consulta.Object.co_diseno[ll_fila])
	ll_filas_colores = lds_datos.Rowcount( )
	
	FOR ll_fila_color = 1 TO ll_filas_colores - 1
		lc_peso1 = 	lds_datos.Object.peso[ll_fila_color]
		lc_peso2 = 	lds_datos.Object.peso[ll_fila_color+1]
		
		IF lc_peso1 <> lc_peso2 THEN
			dw_consulta.object.colorletras[ll_fila] = '1'
			EXIT
		ELSE
			dw_consulta.object.colorletras[ll_fila] = '0'
		END IF
	NEXT	
NEXT

dw_consulta.SetFocus()

// FACL - 2018/06/01 - SA58743 - Si se cargan datos se selecciona automaticamente el primer registro
dw_recursos_agrupa.Reset()
dw_recursos_agrupa.Visible = False
If dw_consulta.Rowcount( ) > 0 Then
	dw_consulta.Event Clicked( 0, 0, 1, dw_consulta.Object.co_muestra )
End If

Return 1
end function

public function integer of_datos_referencia (long an_muestra, long an_fabrica, long an_linea, long an_talla);SELECT co_fabrica_ref, co_linea_ref
INTO :il_fabrica_ref, :il_linea_ref
FROM dt_muestras_ref
WHERE co_muestra = :an_muestra
AND co_fabrica = :an_fabrica
AND co_linea = :an_linea
AND co_talla = :an_talla
USING n_cst_application.itr_appl;

Return 1
end function

on w_opc_mat_prima_muestra_ref.create
int iCurrent
call super::create
this.dw_recursos_agrupa=create dw_recursos_agrupa
this.st_1=create st_1
this.mle_nota=create mle_nota
this.cb_buscar=create cb_buscar
this.dw_consulta=create dw_consulta
this.cb_1=create cb_1
this.cb_aceptar=create cb_aceptar
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_recursos_agrupa
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.mle_nota
this.Control[iCurrent+4]=this.cb_buscar
this.Control[iCurrent+5]=this.dw_consulta
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.cb_aceptar
this.Control[iCurrent+8]=this.dw_1
this.Control[iCurrent+9]=this.gb_1
this.Control[iCurrent+10]=this.gb_2
end on

on w_opc_mat_prima_muestra_ref.destroy
call super::destroy
destroy(this.dw_recursos_agrupa)
destroy(this.st_1)
destroy(this.mle_nota)
destroy(this.cb_buscar)
destroy(this.dw_consulta)
destroy(this.cb_1)
destroy(this.cb_aceptar)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;
dw_consulta.DataObject = 'd_m_mues_ref_x_tipoprod'
dw_consulta.SetTransObject(n_cst_application.itr_appl)

dw_1.SetTransObject(n_cst_application.itr_appl)
dw_1.GetChild("talla",idc_talla)
idc_talla.SetTransObject(n_cst_application.itr_appl)

dw_recursos_agrupa.SetTransObject(n_cst_application.itr_appl)
dw_recursos_agrupa.Visible = false

idc_talla.InsertRow(0)

dw_1.InsertRow(0)

is_select = dw_consulta.Describe("DataWindow.Table.Select")
is_where  = Message.StringParm

If IsNull(is_where) then is_where=""

If len(is_where)>0 Then
	of_recuperar(is_where)
End If

mle_nota.backcolor=Rgb(255,255,231)

If n_cst_application.il_fabMue<>0 then
	dw_1.SetItem(1,"fabrica",n_cst_application.il_fabMue)
	dw_1.SetItem(1,"linea",n_cst_application.il_lineaMue)
	dw_1.SetItem(1,"muestra",n_cst_application.il_muestra)
End If
end event

type dw_recursos_agrupa from datawindow within w_opc_mat_prima_muestra_ref
boolean visible = false
integer x = 4311
integer y = 76
integer width = 983
integer height = 1316
integer taborder = 20
string title = "none"
string dataobject = "d_recursos_agrupa"
boolean vscrollbar = true
boolean livescroll = true
end type

type st_1 from statictext within w_opc_mat_prima_muestra_ref
integer x = 2057
integer y = 1476
integer width = 2167
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 79741120
string text = "Texto Rojo: Significa que existen partes sin materia prima y o diferencia en los pesos."
boolean focusrectangle = false
end type

type mle_nota from multilineedit within w_opc_mat_prima_muestra_ref
boolean visible = false
integer x = 2158
integer y = 1180
integer width = 928
integer height = 200
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "Nota"
end type

event getfocus;Hide()
end event

type cb_buscar from commandbutton within w_opc_mat_prima_muestra_ref
integer x = 347
integer y = 1392
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar"
end type

event clicked;Boolean lb_muestrario= FALSE
If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If
String ls_select
String ls_cad 
Long ll_pos, ll_ini	
ls_cad=dw_1.GetItemString(1,"fert")

If Not IsNull(ls_cad) Then	
	ls_select=is_select

	ll_ini = Pos(ls_select, "WHERE")
		
	If ll_ini > 0 Then
		ls_select = Mid(ls_select, ll_ini, len(ls_select))
		If ll_ini > 0 Then
			ll_pos    = Pos(ls_select, "dt_muestras.co_talla = h_fmp_muestras.co_talla )")
			ls_select = Mid(ls_select, 1, ll_pos - 1)
		END IF
		
		is_where  = ", dt_muestras_fert ~r~n"  + ls_select + "~r~n"
		is_where += "dt_muestras.co_talla = h_fmp_muestras.co_talla ) and  ~r~n"+&
						" ( m_muestras.co_fabrica          = dt_muestras_fert.co_fabrica ) and  ~r~n"+&
						" ( m_muestras.co_linea            = dt_muestras_fert.co_linea ) and ~r~n"  +&
						" ( m_muestras.co_muestra          = dt_muestras_fert.co_muestra ) and ~r~n" +&  
						" ( h_fmp_muestras.co_talla        = dt_muestras_fert.co_talla )  AND ( ~r~n"
		is_where += "dt_muestras_fert.co_fert like ~~'%"+Trim(ls_cad)+"%~~' and "
	End If
ELSE
	is_where="dt_muestras.co_talla = h_fmp_muestras.co_talla ) and ("
End If

ls_cad=String(dw_1.GetItemNumber(1,"fabrica"))

If Not IsNull(ls_cad) Then
	is_where+="m_muestras.co_fabrica="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"linea"))

If Not IsNull(ls_cad) Then
	is_where+="m_muestras.co_linea="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"muestra"))

If Not IsNull(ls_cad) Then
	is_where+="m_muestras.co_muestra="+ls_cad+" and "
End If

ls_cad=dw_1.GetItemString(1,"descripcion_mue")

If Not IsNull(ls_cad) Then
	is_where+="m_muestras.de_muestra like ~~'%"+ls_cad+"%~~' and "
End If        

ls_cad = String(dw_1.GetItemNumber(1,"talla"))

If Not IsNull(ls_cad) Then
	is_where+="dt_muestras.co_talla="+ls_cad+" and "
End If   

ls_cad=String(dw_1.GetItemNumber(1,"muestrario"))

If Not IsNull(ls_cad) Then
	is_where+="h_fmp_muestras.co_muestrario="+ls_cad+" and "
ELSE
	lb_muestrario = TRUE	
End If

ls_cad= dw_1.GetItemString(1,"diseno")

If Not IsNull(ls_cad) Then
	is_where+="h_fmp_muestras.cnt_opcion="+ls_cad+" and "
End If

ls_cad= dw_1.GetItemString(1,"de_diseno")

If Not IsNull(ls_cad) Then
	is_where+="m_disenos_muestras.de_diseno like ~~'%"+ls_cad+"%~~' and "
End If

ls_cad= dw_1.GetItemString(1,"color")

If Not IsNull(ls_cad) Then
	is_where+="h_fmp_muestras.co_color="+ls_cad+" and "
End If

//////////////////////////////////
ls_cad = String(dw_1.GetItemNumber(1,"referencia"))
//If Not IsNull(ls_cad) Then
//	is_where+= "m_muestras.co_muestra in (select distinct dmr.co_muestra	from dt_muestras_ref dmr, h_preref p" + &
//		" where  dmr.co_referencia_ref =" + ls_cad + &
//			" and p.co_fabrica =  dmr.co_fabrica_ref and p.co_linea = dmr.co_linea_ref" + &
//			" and p.co_referencia = dmr.co_referencia_ref ) " + " and "

	If Not IsNull(ls_cad) Then
	is_where+= "m_muestras.co_muestra in (select distinct dmr.co_muestra	from dt_muestras_ref dmr " + &
		" where  dmr.co_referencia_ref =" + ls_cad + &
			" " + &
			"  ) " + " and "
	
else
	ls_cad = dw_1.GetItemString(1,"descripcion")
	If Not IsNull(ls_cad) Then
//			is_where+= "m_muestras.co_muestra in (select distinct dmr.co_muestra	from dt_muestras_ref dmr, h_preref p" + &
//			" where  de_referencia LIKE  ~~'%"+ls_cad+"%~~'" + &
//			" and p.co_fabrica =  dmr.co_fabrica_ref and p.co_linea = dmr.co_linea_ref" + &
//			" and p.co_referencia = dmr.co_referencia_ref ) " + " and "
         is_where+= "m_muestras.co_muestra in (select distinct dmr.co_muestra	from dt_muestras_ref dmr, m_muestras p" + &
			" where  de_muestra LIKE  ~~'%"+ls_cad+"%~~'" + &
			" and p.co_fabrica =  dmr.co_fabrica and p.co_linea = dmr.co_linea" + &
			" and p.co_muestra = dmr.co_muestra ) " + " and "
	END IF	
End If   

/////////////////////////////////

IF String(dw_1.object.color[1],'') = '' AND String(dw_1.object.muestrario[1],'') = '' THEN
	If Right(is_where,4)="and " Then	
		IF lb_muestrario THEN
			is_where += " h_fmp_muestras.co_muestrario||h_fmp_muestras.co_recurso in (SELECT max(co_muestrario)||co_recurso FROM (SELECT sc.co_muestrario, sc.co_recurso FROM h_fmp_muestras sc WHERE sc.co_muestra = h_fmp_muestras.co_muestra) si group by co_recurso ) and "
	// SA56239 - Fichas de Materia Prima por Grupos de Recursos
		is_where += " ( h_fmp_muestras.co_recurso = m_recursos_tj.co_recursoagrupa ) and "
	//Fin SA56239
	//		is_where += " h_fmp_muestras.co_muestrario IN ( SELECT maxmuestrario.maxmues FROM( SELECT max(co_muestrario) maxmues , co_recurso FROM (SELECT sc.* FROM h_fmp_muestras sc WHERE sc.co_muestra = m_muestras.co_muestra ) si group by co_recurso order by co_recurso) maxmuestrario) and "
		END IF
		is_where=left(is_where, len(is_where) - 4)+")"
	//	is_where+="Group By 1,2,3,5,6,7,8,10,11,12,14,17,19"
	ELse
		Messagebox("Advertencia","Debe digitar como m$$HEX1$$ed00$$ENDHEX$$nimo un criterio de busqueda")
		Return
	End If
ELSE
	If Right(is_where,4)="and " Then	
		is_where=left(is_where, len(is_where) - 4)+")"
	END IF
END IF

of_recuperar(is_where)
end event

type dw_consulta from u_dw_application within w_opc_mat_prima_muestra_ref
integer x = 974
integer y = 76
integer width = 3232
integer height = 1316
integer taborder = 30
string dataobject = "d_m_mues_ref_x_tipoprod"
boolean hscrollbar = true
end type

event clicked;call super::clicked;Integer li_rec_agrupa
Double  ld_recurso, ld_muestra, ld_diseno

If Row=0 Then Return
dw_recursos_agrupa.visible = False
of_filaSel(Row)

//SA56239 - Ceiba/reariase - 23-05-2017 - Recursos que agrupa
ld_recurso = dw_consulta.GetItemNumber( Row, "co_recursoagrupa")
If IsNull(ld_recurso) Then ld_recurso = 0
ld_muestra = dw_consulta.GetItemNumber( Row, "co_muestra")
ld_diseno  = dw_consulta.GetItemNumber( Row, "co_diseno")	
li_rec_agrupa = dw_recursos_agrupa.Retrieve(ld_recurso, ld_muestra, ld_diseno)
if li_rec_agrupa > 0 Then dw_recursos_agrupa.visible = True
//Fin SA56239



end event

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 24 de Octubre de 2002 HORA 08:50:59:781
// 
// OverWrite
//////////////////////////////////////////////////////////////////////////

end event

event itemfocuschanged;call super::itemfocuschanged;Integer li_rec_agrupa
Double  ld_recurso, ld_muestra, ld_diseno

If Row=0 Then Return
dw_recursos_agrupa.visible = False

of_filaSel(Row)

//SA56239 - Ceiba/reariase - 23-05-2017 - Recursos que agrupa
ld_recurso = dw_consulta.GetItemNumber( Row, "co_recursoagrupa")
If IsNull(ld_recurso) Then ld_recurso = 0
ld_muestra = dw_consulta.GetItemNumber( Row, "co_muestra")
ld_diseno  = dw_consulta.GetItemNumber( Row, "co_diseno")	
li_rec_agrupa = dw_recursos_agrupa.Retrieve(ld_recurso, ld_muestra, ld_diseno)
if li_rec_agrupa > 0 Then dw_recursos_agrupa.visible = True
//Fin SA56239


end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 07 de Enero de 2003 HORA 09:30:41:906
// 
// No se permiten modificar los datos
//////////////////////////////////////////////////////////////////////////

Return 2
end event

event doubleclicked;call super::doubleclicked;If Row=0 Then Return

of_filaSel(Row)

cb_aceptar. Trigger Event Clicked()
end event

type cb_1 from commandbutton within w_opc_mat_prima_muestra_ref
integer x = 1627
integer y = 1444
integer width = 343
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type cb_aceptar from commandbutton within w_opc_mat_prima_muestra_ref
integer x = 1275
integer y = 1444
integer width = 343
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;If of_retorno()<>1 Then
	Return 
End If

CloseWithReturn(Parent,iou_param)
end event

type dw_1 from u_dw_application within w_opc_mat_prima_muestra_ref
integer x = 64
integer y = 96
integer width = 850
integer height = 1208
string dataobject = "d_ext_referencia_dis_col_mue_ref"
boolean vscrollbar = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 21 de Octubre de 2002 HORA 17:07:49:062
// 
// OverWrite!!
//////////////////////////////////////////////////////////////////////////

end event

type gb_1 from groupbox within w_opc_mat_prima_muestra_ref
integer x = 41
integer y = 20
integer width = 887
integer height = 1544
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Criterio de b$$HEX1$$fa00$$ENDHEX$$squeda"
end type

type gb_2 from u_gb_base within w_opc_mat_prima_muestra_ref
integer x = 951
integer y = 20
integer width = 3305
integer height = 1576
integer taborder = 0
string text = "Datos encontrados"
end type

