HA$PBExportHeader$w_opc_mat_prima_c.srw
$PBExportComments$Para buscar los datos de la referencia e incluir todos los colores
forward
global type w_opc_mat_prima_c from w_response
end type
type mle_nota from multilineedit within w_opc_mat_prima_c
end type
type cb_buscar from commandbutton within w_opc_mat_prima_c
end type
type dw_consulta from u_dw_application within w_opc_mat_prima_c
end type
type cb_1 from commandbutton within w_opc_mat_prima_c
end type
type cb_aceptar from commandbutton within w_opc_mat_prima_c
end type
type dw_1 from u_dw_application within w_opc_mat_prima_c
end type
type gb_1 from groupbox within w_opc_mat_prima_c
end type
type gb_2 from u_gb_base within w_opc_mat_prima_c
end type
end forward

global type w_opc_mat_prima_c from w_response
integer x = 0
integer y = 0
integer width = 3648
integer height = 1520
string title = "Busqueda materia prima para referencias"
mle_nota mle_nota
cb_buscar cb_buscar
dw_consulta dw_consulta
cb_1 cb_1
cb_aceptar cb_aceptar
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_opc_mat_prima_c w_opc_mat_prima_c

type variables
DataWindowChild idc_talla

long il_fila

n_cst_param iou_param,iin_param
end variables

forward prototypes
public function integer of_filasel (long a_fila)
public function integer of_muestrario (long a_fabrica, long a_linea, long a_referencia)
public function integer of_retorno ()
public function integer of_recuperar (string a_where)
end prototypes

public function integer of_filasel (long a_fila);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 17 de Diciembre de 2002 HORA 10:23:20:187
// 
// 
//////////////////////////////////////////////////////////////////////////


il_fila=a_fila

dw_consulta.SelectRow(0,False)
dw_consulta.SelectRow(il_fila,True)

String ls_diseno="",ls_muestrario=""
long ll_fabrica,ll_linea,ll_referencia,ll_talla,ll_calidad,ll_diseno,&
     ll_muestrario, ll_res

n_cst_comun lo_c


ll_fabrica=dw_consulta.GetItemNumber(il_fila,"co_fabrica")
ll_linea=dw_consulta.GetItemNumber(il_fila,"co_linea")
ll_referencia=dw_consulta.GetItemNumber(il_fila,"co_referencia")
ll_talla=dw_consulta.GetItemNumber(il_fila,"co_talla")
ll_calidad=1
ll_diseno=dw_consulta.GetItemNumber(il_fila,"co_diseno")
ll_muestrario=dw_consulta.GetItemNumber(il_fila,"co_muestrario")

ll_res=lo_c.of_nombrediseno(ll_fabrica /*long a_fabrica*/,&
                            ll_linea/*long a_linea*/,&
									 ll_referencia/*long a_referencia*/,&
									 ll_talla/*long a_talla*/,&
									 ll_calidad/*long a_calidad*/,&
									 ll_diseno/*long a_diseno*/,& 
									 n_cst_application.itr_appl/*transaction a_transaction */)
If ll_res=1 then
	ls_diseno=lo_c.of_getString(1)
End If



ll_res=lo_c.of_nombremuestrario(ll_fabrica /*long a_fabrica*/,&
                                ll_linea/*long a_linea*/, &
										  ll_muestrario/*long a_muestrario*/,&
										  n_cst_application.itr_appl/*transaction a_transaction */)
										  
									
If ll_res=1 then
	ls_muestrario=lo_c.of_getString(1)
End If										  
mle_nota.text="Dise$$HEX1$$f100$$ENDHEX$$o: "+ls_diseno+" ("+String(ll_diseno)+")"+"~r~n"+&
				  "Muestrario: "+ls_muestrario+" ("+String(ll_muestrario)+")"

mle_nota.Show()

Return 1










end function

public function integer of_muestrario (long a_fabrica, long a_linea, long a_referencia);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 25 de Junio de 2003 HORA 10:18:53:699
// 
// Carga el $$HEX1$$fa00$$ENDHEX$$ltimo muestrario de una referencia,
// esto para facilitar la digitacion
//////////////////////////////////////////////////////////////////////////
long ll_muestrario

If IsNull(a_fabrica) or IsNull(a_linea) or &
   IsNull(a_referencia) Then
	
	Return -1
End If

  SELECT max(co_muestrario)  
    INTO :ll_muestrario  
    FROM h_fmp  
   WHERE ( h_fmp.co_fabrica = :a_fabrica ) AND  
         ( h_fmp.co_linea = :a_linea ) AND  
         ( h_fmp.co_referencia = :a_referencia )   
          using n_cst_application.itr_appl ;
			 
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If
			 
If n_cst_application.itr_appl.SQLcode=100 Then 
	Return -1
End If

Return ll_muestrario




Return 1
end function

public function integer of_retorno ();

If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If il_fila<=0 then
	MessageBox("Advertencia!","Debe seleccionar una referencia.",StopSign!)
	Return -1
End If


iou_param.il_vector[1] = dw_consulta.GetItemNumber(il_fila,"co_fabrica")
iou_param.il_vector[2] = dw_consulta.GetItemNumber(il_fila,"co_linea")
iou_param.il_vector[3] = dw_consulta.GetItemNumber(il_fila,"co_referencia")
iou_param.il_vector[4] = dw_consulta.GetItemNumber(il_fila,"co_talla")
iou_param.il_vector[5] = dw_consulta.GetItemNumber(il_fila,"co_calidad")
iou_param.il_vector[6] = dw_consulta.GetItemNumber(il_fila,"co_diseno")
iou_param.il_vector[7] = dw_consulta.GetItemNumber(il_fila,"co_muestrario")
iou_param.il_vector[8] = dw_consulta.GetItemNumber(il_fila,"co_tipoprod")



iou_param.is_vector[1]=iin_param.is_vector[1]

n_cst_application.il_fabRef=dw_consulta.GetItemNumber(il_fila,"co_fabrica")
n_cst_application.il_lineaRef=dw_consulta.GetItemNumber(il_fila,"co_linea")
n_cst_application.il_referencia=dw_consulta.GetItemNumber(il_fila,"co_referencia")


Return 1
end function

public function integer of_recuperar (string a_where);String 			ls_sel1,ls_modString,ls_err
long 				ll_pos,ll_tot
n_cst_string	lo_string
//dt_preref.co_calidad = h_fmp.co_calidad )  

dw_consulta.dataObject="d_h_preref1_mp_c"
dw_consulta.SetTransObject(n_cst_application.itr_appl)

If Right(a_where,1)=")" Then
	
	ls_sel1=dw_consulta.Describe("DataWindow.Table.Select")

	ll_pos=pos(ls_sel1,"m_disenos.co_diseno = h_fmp.co_diseno )")
	
	If ll_pos>0 Then
		ls_Sel1=Left(ls_sel1, ll_pos -1)
	End If
	
	ls_modString="DataWindow.Table.Select='" &
		+ ls_sel1 + a_where + "'"
	
	dw_consulta.Modify(ls_modString)
	
End If
il_fila=0
ll_tot=dw_consulta.Retrieve()
//////////////////////////////////////////////////////////////////////////
// Si no se encuentran datos, se hace una b$$HEX1$$fa00$$ENDHEX$$squeda con h_fmp_sin, en la otra
// db, permitiendo copiar entre diferentes dbs
//////////////////////////////////////////////////////////////////////////

If ll_tot=0 and iin_param.is_vector[2]="COPIAR"  Then
	ls_sel1=dw_consulta.Describe("DataWindow.Table.Select")
	dw_consulta.dataObject="d_h_preref1_mp_c_sin"
	dw_consulta.SetTransObject(n_cst_application.itr_appl)
	
	ls_sel1=lo_string.of_globalreplace(ls_sel1 /*string as_source*/,&
                                        "h_fmp"/*string as_old*/,&
													 "h_fmp_sin"/*string as_new */)
													 
	ls_modString="DataWindow.Table.Select='" &
		+ ls_sel1 + "'"	
		
	ls_err=dw_consulta.Modify(ls_modString)
	//Messagebox('Var','ls_err='+ls_err+'~n')
	ll_tot=dw_consulta.Retrieve()
	If ll_tot>0 Then
		iou_param.is_vector[2]="SINONIMO"
	End If
	
End If



If dw_consulta.RowCount()=1 then
	of_filaSel(1)
End If

dw_consulta.SetFocus()

Return 1
end function

on w_opc_mat_prima_c.create
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

on w_opc_mat_prima_c.destroy
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

iou_param.is_vector[2]=""

iin_param=Message.PowerObjectParm

If IsNull(iin_param.is_vector[1]) then iin_param.is_vector[1]=""

If len(iin_param.is_vector[1])>0 Then
	of_recuperar(iin_param.is_vector[1])
End If

mle_nota.backcolor=Rgb(255,255,231)

If n_cst_application.il_fabRef<>0 then
	dw_1.SetItem(1,"fabrica",n_cst_application.il_fabRef)
	dw_1.SetItem(1,"linea",n_cst_application.il_lineaRef)
	dw_1.SetItem(1,"referencia",n_cst_application.il_referencia)
End If
end event

type mle_nota from multilineedit within w_opc_mat_prima_c
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

type cb_buscar from commandbutton within w_opc_mat_prima_c
integer x = 439
integer y = 1012
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


// ( m_disenos.co_diseno = h_fmp.co_diseno )    
iin_param.is_vector[1]="m_disenos.co_diseno = h_fmp.co_diseno ) and ("
String ls_cad

ls_cad=String(dw_1.GetItemNumber(1,"fabrica"))

If Not IsNull(ls_cad) Then
	iin_param.is_vector[1]+="h_preref.co_fabrica="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"linea"))

If Not IsNull(ls_cad) Then
	iin_param.is_vector[1]+="h_preref.co_linea="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"referencia"))

If Not IsNull(ls_cad) Then
	iin_param.is_vector[1]+="h_preref.co_referencia="+ls_cad+" and "
End If

ls_cad=dw_1.GetItemString(1,"descripcion")

If Not IsNull(ls_cad) Then
	iin_param.is_vector[1]+="h_preref.de_referencia like ~~'%"+ls_cad+"%~~' and "
End If        

ls_cad=String(dw_1.GetItemNumber(1,"talla"))

If Not IsNull(ls_cad) Then
	iin_param.is_vector[1]+="dt_preref.co_talla="+ls_cad+" and "
End If   

ls_cad=dw_1.GetItemString(1,"diseno")

If Not IsNull(ls_cad) Then
	iin_param.is_vector[1]+="h_fmp.co_diseno="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"color"))

If Not IsNull(ls_cad) Then
	iin_param.is_vector[1]+="h_fmp.co_color="+ls_cad+" and "
End If

ls_cad=String(dw_1.GetItemNumber(1,"muestrario"))

If Not IsNull(ls_cad) Then
	iin_param.is_vector[1]+="h_fmp.co_muestrario="+ls_cad+" and "
End If

ls_cad=dw_1.GetItemString(1,"de_diseno")

If Not IsNull(ls_cad) Then
	iin_param.is_vector[1]+="m_disenos.de_diseno like ~~'%"+ls_cad+"%~~' and "
End If   

If Right(iin_param.is_vector[1],4)="and " Then
	iin_param.is_vector[1]=left(iin_param.is_vector[1], len(iin_param.is_vector[1]) - 4)+")"
	
End If

of_recuperar(iin_param.is_vector[1])


















end event

type dw_consulta from u_dw_application within w_opc_mat_prima_c
integer x = 1042
integer y = 84
integer width = 2450
integer height = 1032
integer taborder = 30
string dataobject = "d_h_preref1_mp_c"
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

cb_aceptar.Trigger Event Clicked()
end event

type cb_1 from commandbutton within w_opc_mat_prima_c
integer x = 1632
integer y = 1216
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

type cb_aceptar from commandbutton within w_opc_mat_prima_c
integer x = 1280
integer y = 1216
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

type dw_1 from u_dw_application within w_opc_mat_prima_c
integer x = 64
integer y = 84
integer width = 869
integer height = 924
string dataobject = "d_ext_referencia_dis_col_mue_c"
boolean vscrollbar = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 21 de Octubre de 2002 HORA 17:07:49:062
// 
// OverWrite!!
//////////////////////////////////////////////////////////////////////////

end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 25 de Junio de 2003 HORA 10:24:52:362
// 
// Debe ubicar automaticamente el ultimo muestrario de la fabrica+linea+ref
//////////////////////////////////////////////////////////////////////////



n_cst_comun lo_comun
long ll_fabrica,ll_linea,ll_res,ll_referencia,ll_muestrario
boolean lb_muestrario=False

ll_fabrica=GetItemNumber(1,"fabrica")
ll_linea  =GetItemNumber(1,"linea")
ll_referencia=GetItemNumber(1,"referencia")

If dwo.name="fabrica" Then
	ll_fabrica=Long(Data)
	lb_muestrario=True
End If

If dwo.name="linea" Then
	ll_linea=Long(Data)
	lb_muestrario=True
End If

If dwo.name="referencia" Then
	ll_referencia=Long(Data)
	lb_muestrario=True
End If

If lb_muestrario Then
	ll_muestrario=of_muestrario(ll_fabrica,ll_linea,ll_referencia)
	If ll_muestrario<>-1 Then
		SetItem(1,"muestrario",ll_muestrario)
	End If
End If

end event

type gb_1 from groupbox within w_opc_mat_prima_c
integer x = 41
integer y = 20
integer width = 919
integer height = 1132
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

type gb_2 from u_gb_base within w_opc_mat_prima_c
integer x = 997
integer y = 20
integer width = 2533
integer height = 1132
integer taborder = 0
string text = "Busqueda"
end type

