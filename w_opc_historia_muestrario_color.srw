HA$PBExportHeader$w_opc_historia_muestrario_color.srw
$PBExportComments$Para la busqueda de la materia prima de las muestras
forward
global type w_opc_historia_muestrario_color from w_response
end type
type mle_nota from multilineedit within w_opc_historia_muestrario_color
end type
type cb_buscar from commandbutton within w_opc_historia_muestrario_color
end type
type dw_consulta from u_dw_application within w_opc_historia_muestrario_color
end type
type cb_1 from commandbutton within w_opc_historia_muestrario_color
end type
type cb_aceptar from commandbutton within w_opc_historia_muestrario_color
end type
type dw_1 from u_dw_application within w_opc_historia_muestrario_color
end type
type gb_1 from groupbox within w_opc_historia_muestrario_color
end type
type gb_2 from u_gb_base within w_opc_historia_muestrario_color
end type
end forward

global type w_opc_historia_muestrario_color from w_response
integer x = 0
integer y = 0
integer width = 3648
integer height = 1608
string title = "Busqueda materia prima para muestras"
mle_nota mle_nota
cb_buscar cb_buscar
dw_consulta dw_consulta
cb_1 cb_1
cb_aceptar cb_aceptar
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_opc_historia_muestrario_color w_opc_historia_muestrario_color

type variables
String is_where

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


iou_param.is_vector[1]=is_where

n_cst_application.il_fabMue = dw_consulta.GetItemNumber(il_fila,"co_fabrica")
n_cst_application.il_lineaMue = dw_consulta.GetItemNumber(il_fila,"co_linea")
n_cst_application.il_muestra = dw_consulta.GetItemNumber(il_fila,"co_muestra")

Return 1
end function

public function integer of_recuperar (string a_where);String ls_sel1,ls_modString
long ll_pos
//dt_muestras_col.co_color = h_fmp_muestras.co_color )
//( dt_muestras.co_talla = h_fmp_muestras.co_talla )
If Right(a_where,1)=")" Then
	
	ls_sel1=dw_consulta.Describe("DataWindow.Table.Select")

	ll_pos=pos(ls_sel1,"dt_muestras.co_talla = h_fmp_muestras.co_talla )")
	
	If ll_pos>0 Then
		ls_Sel1=Left(ls_sel1, ll_pos -1)
	End If
	
	ls_modString="DataWindow.Table.Select='" &
		+ ls_sel1 + a_where + "'"
	
	dw_consulta.Modify(ls_modString)
	
End If
il_fila=0
dw_consulta.Retrieve()
If dw_consulta.RowCount()=1 then
	of_filaSel(1)
End If

dw_consulta.SetFocus()

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

on w_opc_historia_muestrario_color.create
int iCurrent
call super::create
this.mle_nota=create mle_nota
this.cb_buscar=create cb_buscar
this.dw_consulta=create dw_consulta
this.cb_1=create cb_1
this.cb_aceptar=create cb_aceptar
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_nota
this.Control[iCurrent+2]=this.cb_buscar
this.Control[iCurrent+3]=this.dw_consulta
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.cb_aceptar
this.Control[iCurrent+6]=this.dw_1
this.Control[iCurrent+7]=this.gb_1
this.Control[iCurrent+8]=this.gb_2
end on

on w_opc_historia_muestrario_color.destroy
call super::destroy
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

dw_1.SetTransObject(n_cst_application.itr_appl)
dw_consulta.SetTransObject(n_cst_application.itr_appl)

dw_1.GetChild("talla",idc_talla)
idc_talla.SetTransObject(n_cst_application.itr_appl)

idc_talla.InsertRow(0)

dw_1.InsertRow(0)


is_where=Message.StringParm

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

type mle_nota from multilineedit within w_opc_historia_muestrario_color
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

type cb_buscar from commandbutton within w_opc_historia_muestrario_color
integer x = 347
integer y = 1320
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar"
end type

event clicked;If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If
// ( dt_muestras_b.co_talla = h_fmp_muestras.co_talla )    
//  ( m_muestras.co_muestra = dt_muestras.co_muestra )    
//  ( dt_muestras_col.co_color = h_fmp_muestras.co_color )    
//( dt_muestras.co_talla = h_fmp_muestras.co_talla )    
is_where="dt_muestras.co_talla = h_fmp_muestras.co_talla ) and ("
String ls_cad

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
End If

ls_cad= dw_1.GetItemString(1,"diseno")

If Not IsNull(ls_cad) Then
	is_where+="h_fmp_muestras.cnt_opcion="+ls_cad+" and "
End If

ls_cad= dw_1.GetItemString(1,"de_diseno")

If Not IsNull(ls_cad) Then
	is_where+="m_disenos_muestras.de_diseno="+ls_cad+" and "
End If

ls_cad= dw_1.GetItemString(1,"color")

If Not IsNull(ls_cad) Then
	is_where+="h_fmp_muestras.co_color="+ls_cad+" and "
End If

//////////////////////////////////
ls_cad = String(dw_1.GetItemNumber(1,"referencia"))
If Not IsNull(ls_cad) Then
	is_where+= "m_muestras.co_muestra in (select distinct dmr.co_muestra	from dt_muestras_ref dmr, h_preref p" + &
		" where  dmr.co_referencia_ref =" + ls_cad + &
			" and p.co_fabrica =  dmr.co_fabrica_ref and p.co_linea = dmr.co_linea_ref" + &
			" and p.co_referencia = dmr.co_referencia_ref ) " + " and "
			
else
	ls_cad = dw_1.GetItemString(1,"descripcion")
	If Not IsNull(ls_cad) Then
			is_where+= "m_muestras.co_muestra in (select distinct dmr.co_muestra	from dt_muestras_ref dmr, h_preref p" + &
			" where  de_referencia LIKE  ~~'%"+ls_cad+"%~~'" + &
			" and p.co_fabrica =  dmr.co_fabrica_ref and p.co_linea = dmr.co_linea_ref" + &
			" and p.co_referencia = dmr.co_referencia_ref ) " + " and "
	END IF	
End If   

/////////////////////////////////

If Right(is_where,4)="and " Then
	is_where=left(is_where, len(is_where) - 4)+")"
ELse
	Messagebox("Advertencia","Debe digitar como m$$HEX1$$ed00$$ENDHEX$$nimo un criterio de busqueda")
	Return
End If

of_recuperar(is_where)


















end event

type dw_consulta from u_dw_application within w_opc_historia_muestrario_color
integer x = 974
integer y = 76
integer width = 2587
integer height = 1284
integer taborder = 30
string dataobject = "d_m_mues_ref"
boolean hscrollbar = true
end type

event clicked;call super::clicked;If Row=0 Then Return

of_filaSel(Row)


end event

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 24 de Octubre de 2002 HORA 08:50:59:781
// 
// OverWrite
//////////////////////////////////////////////////////////////////////////

end event

event itemfocuschanged;call super::itemfocuschanged;If Row=0 Then Return

of_filaSel(Row)


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

type cb_1 from commandbutton within w_opc_historia_muestrario_color
integer x = 1627
integer y = 1372
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

type cb_aceptar from commandbutton within w_opc_historia_muestrario_color
integer x = 1275
integer y = 1372
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

type dw_1 from u_dw_application within w_opc_historia_muestrario_color
integer x = 64
integer y = 96
integer width = 850
integer height = 1132
string dataobject = "d_ext_param_historia_muestrario_col"
boolean vscrollbar = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 21 de Octubre de 2002 HORA 17:07:49:062
// 
// OverWrite!!
//////////////////////////////////////////////////////////////////////////

end event

type gb_1 from groupbox within w_opc_historia_muestrario_color
integer x = 41
integer y = 20
integer width = 887
integer height = 1468
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

type gb_2 from u_gb_base within w_opc_historia_muestrario_color
integer x = 951
integer y = 20
integer width = 2651
integer height = 1468
integer taborder = 0
string text = "Datos encontrados"
end type

