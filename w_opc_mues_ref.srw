HA$PBExportHeader$w_opc_mues_ref.srw
$PBExportComments$Para la busqueda de la referencia
forward
global type w_opc_mues_ref from w_response
end type
type cb_buscar from commandbutton within w_opc_mues_ref
end type
type dw_consulta from u_dw_application within w_opc_mues_ref
end type
type cb_1 from commandbutton within w_opc_mues_ref
end type
type cb_aceptar from commandbutton within w_opc_mues_ref
end type
type dw_1 from u_dw_application within w_opc_mues_ref
end type
type gb_1 from groupbox within w_opc_mues_ref
end type
type gb_2 from u_gb_base within w_opc_mues_ref
end type
end forward

global type w_opc_mues_ref from w_response
integer width = 3826
integer height = 1320
string title = "Selecci$$HEX1$$f300$$ENDHEX$$n de muestra"
cb_buscar cb_buscar
dw_consulta dw_consulta
cb_1 cb_1
cb_aceptar cb_aceptar
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_opc_mues_ref w_opc_mues_ref

type variables
String is_where, is_select

long il_fila, il_fabrica_ref, il_linea_ref

n_cst_param iou_param
end variables

forward prototypes
public function integer of_filasel (long a_fila)
public function integer of_recuperar (string a_where)
public function integer of_retorno ()
public function integer of_datos_referencia (long an_muestra, long an_fabrica, long an_linea, long an_talla)
end prototypes

public function integer of_filasel (long a_fila);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 22 de Enero de 2003 HORA 08:45:17:687
// 
// 
//////////////////////////////////////////////////////////////////////////

il_fila=a_fila

dw_consulta.SelectRow(0,False)
dw_consulta.SelectRow(il_fila,True)



Return 1










end function

public function integer of_recuperar (string a_where);String ls_sel1,ls_modString,ls_talla, ls_fert
long ll_pos,ll_grp_tlla,ll_tlla,i, ll_posfin

	
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
		ll_pos=pos(ls_sel1,"m_muestras.co_muestra         = dt_muestras.co_muestra )")
	END IF
   // ------------------------------------------------------------------------
	
	If ll_pos>0 Then
		ls_Sel1=Left(ls_sel1, ll_pos -1)
	End If
	
	ls_modString="DataWindow.Table.Select='" &
		+ ls_sel1 + a_where + "'"
	

	dw_consulta.Modify(ls_modString)
	
End If	
//////////////////////////////////////////////////////////////////////////
// Asigno los nombres de las tallas
// 
//////////////////////////////////////////////////////////////////////////
n_cst_comun lo_comun

Long ll_cant

il_fila=0	

ll_cant=dw_consulta.Retrieve(n_cst_application.is_user)

If ll_cant>0 Then
//	For i=1 To ll_cant
//		ll_tlla=dw_consulta.GetItemNumber(i,"co_talla")
//		ll_grp_tlla=dw_consulta.GetItemNumber(i,"co_grupo_tlla")
//		lo_comun.of_nombreTalla(ll_grp_tlla,ll_tlla,n_cst_application.itr_appl)
//		ls_talla=lo_comun.of_getString(1)
//		dw_consulta.setItem(i,"cde_talla",ls_talla)
//	Next
	If ll_cant=1 Then
		of_filaSel(1)
	End If
End If

dw_consulta.SetFocus()

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

ll_referencia = Long(dw_consulta.GetItemString(il_fila,"co_referencia"))

iou_param.il_vector[1] = dw_consulta.GetItemNumber(il_fila,"co_fabrica")
iou_param.il_vector[2] = dw_consulta.GetItemNumber(il_fila,"co_linea")
iou_param.il_vector[3] = dw_consulta.GetItemNumber(il_fila,"co_muestra")
iou_param.il_vector[4] = dw_consulta.GetItemNumber(il_fila,"co_talla")
iou_param.il_vector[5] = dw_consulta.GetItemNumber(il_fila,"co_grupo_tlla")
iou_param.il_vector[6] = ll_referencia

IF NOT isnull(ll_referencia) THEN
	of_datos_referencia(iou_param.il_vector[3], iou_param.il_vector[1], iou_param.il_vector[2], iou_param.il_vector[4])
END IF	

iou_param.il_vector[7] = il_fabrica_ref
iou_param.il_vector[8] = il_linea_ref
iou_param.il_vector[9] = dw_consulta.GetItemNumber(il_fila,"m_muestras_co_tipoprod")


iou_param.is_vector[1]=is_where

n_cst_application.il_fabMue   = dw_consulta.GetItemNumber(il_fila,"co_fabrica")
n_cst_application.il_lineaMue = dw_consulta.GetItemNumber(il_fila,"co_linea")
n_cst_application.il_muestra  = dw_consulta.GetItemNumber(il_fila,"co_muestra")

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

on w_opc_mues_ref.create
int iCurrent
call super::create
this.cb_buscar=create cb_buscar
this.dw_consulta=create dw_consulta
this.cb_1=create cb_1
this.cb_aceptar=create cb_aceptar
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_buscar
this.Control[iCurrent+2]=this.dw_consulta
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.cb_aceptar
this.Control[iCurrent+5]=this.dw_1
this.Control[iCurrent+6]=this.gb_1
this.Control[iCurrent+7]=this.gb_2
end on

on w_opc_mues_ref.destroy
call super::destroy
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

dw_1.InsertRow(0)

is_select = dw_consulta.Describe("DataWindow.Table.Select")
is_where=Message.StringParm

If IsNull(is_where) then is_where=""

If len(is_where)>0 Then
	of_recuperar(is_where)
End If

If n_cst_application.il_fabMue<>0 then
	dw_1.SetItem(1,"fabrica",n_cst_application.il_fabMue)
	dw_1.SetItem(1,"linea",n_cst_application.il_lineaMue)
	dw_1.SetItem(1,"muestra",n_cst_application.il_muestra)
End If
end event

type cb_buscar from commandbutton within w_opc_mues_ref
integer x = 411
integer y = 916
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
			ll_pos    = Pos(ls_select, "m_muestras.co_muestra         = dt_muestras.co_muestra )")
			ls_select = Mid(ls_select, 1, ll_pos - 1)
		END IF
		
		is_where  = ", dt_muestras_fert ~r~n"  + ls_select + "~r~n"
		is_where += "m_muestras.co_muestra         = dt_muestras.co_muestra ) and  ~r~n"+&
						" ( dt_muestras.co_fabrica     = dt_muestras_fert.co_fabrica ) and  ~r~n"+&
						" ( dt_muestras.co_linea       = dt_muestras_fert.co_linea ) and ~r~n"  +&
						" ( dt_muestras.co_muestra     = dt_muestras_fert.co_muestra ) and ~r~n" +&  
						" ( dt_muestras.co_talla       = dt_muestras_fert.co_talla )  AND ( ~r~n"
		is_where += "dt_muestras_fert.co_fert like ~~'%"+Trim(ls_cad)+"%~~' and "
	End If
ELSE
	is_where="m_muestras.co_muestra         = dt_muestras.co_muestra ) and ("
End If
	
//is_where="m_muestras.co_muestra         = dt_muestras.co_muestra ) and ("

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

ls_cad=dw_1.GetItemString(1,"descripcion")

If Not IsNull(ls_cad) Then
	is_where+="m_muestras.de_muestra like ~~'%"+ls_cad+"%~~' and "
End If        

ls_cad=String(dw_1.GetItemNumber(1,"co_operacion"))

If Not IsNull(ls_cad) Then
	is_where+="m_proref_muestras.co_operacion="+ls_cad+" and "
End If

//////////////////////////////////
ls_cad = String(dw_1.GetItemNumber(1,"referencia"))
If Not IsNull(ls_cad) Then
//	is_where+= "m_muestras.co_muestra in (select distinct dmr.co_muestra	from dt_muestras_ref dmr, h_preref p" + &
//		" where  dmr.co_referencia_ref =" + ls_cad + &
//			" and p.co_fabrica =  dmr.co_fabrica_ref and p.co_linea = dmr.co_linea_ref" + &
//			" and p.co_referencia = dmr.co_referencia_ref ) " + " and "
is_where+= "m_muestras.co_muestra in (select distinct dmr.co_muestra	from dt_muestras_ref dmr " + &
		" where  dmr.co_referencia_ref =" + ls_cad + &
			" " + &
			"  ) " + " and "
			
else
	ls_cad = dw_1.GetItemString(1,"descripcion_ref")
	If Not IsNull(ls_cad) Then
			is_where+= "m_muestras.co_muestra in (select distinct dmr.co_muestra	from dt_muestras_ref dmr, m_muestras p" + &
			" where  de_muestra LIKE  ~~'%"+ls_cad+"%~~'" + &
			" and p.co_fabrica =  dmr.co_fabrica and p.co_linea = dmr.co_linea" + &
			" and p.co_muestra = dmr.co_muestra ) " + " and "
	END IF	
End If   

/////////////////////////////////


If Right(is_where,4)="and " Then
	is_where=left(is_where, len(is_where) - 4)+")"
Else
	Messagebox("Advertencia","Debe digitar como m$$HEX1$$ed00$$ENDHEX$$nimo un criterio de busqueda")
	Return
End If

of_recuperar(is_where)
end event

type dw_consulta from u_dw_application within w_opc_mues_ref
integer x = 1175
integer y = 96
integer width = 2597
integer height = 956
integer taborder = 30
string dataobject = "d_busca_muestra_ref"
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

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 22 de Enero de 2003 HORA 08:39:55:796
// 
// Los datos no son modificables
//////////////////////////////////////////////////////////////////////////

Return 2

end event

event itemfocuschanged;call super::itemfocuschanged;If Row=0 Then Return

of_filaSel(Row)

end event

event doubleclicked;call super::doubleclicked;If Row=0 Then Return

of_filaSel(Row)


cb_aceptar.Trigger event Clicked()
end event

type cb_1 from commandbutton within w_opc_mues_ref
integer x = 1920
integer y = 1100
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

type cb_aceptar from commandbutton within w_opc_mues_ref
integer x = 1568
integer y = 1100
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

event clicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 22 de Enero de 2003 HORA 10:05:27:156
// 
// 
//////////////////////////////////////////////////////////////////////////

If of_retorno()<>1 then
	Return
End If

CloseWithReturn(Parent,iou_param)
end event

type dw_1 from u_dw_application within w_opc_mues_ref
integer x = 46
integer y = 116
integer width = 1061
integer height = 756
string dataobject = "d_ext_muestra_ref"
boolean vscrollbar = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 21 de Octubre de 2002 HORA 17:07:49:062
// 
// OverWrite!!
//////////////////////////////////////////////////////////////////////////

end event

type gb_1 from groupbox within w_opc_mues_ref
integer x = 23
integer y = 24
integer width = 1097
integer height = 1048
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

type gb_2 from u_gb_base within w_opc_mues_ref
integer x = 1143
integer y = 20
integer width = 2647
integer height = 1052
integer taborder = 0
string text = "Busqueda"
end type

