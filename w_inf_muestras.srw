HA$PBExportHeader$w_inf_muestras.srw
$PBExportComments$Informe de muestras registradas
forward
global type w_inf_muestras from w_report
end type
type cb_1 from commandbutton within w_inf_muestras
end type
type sle_1 from singlelineedit within w_inf_muestras
end type
end forward

global type w_inf_muestras from w_report
string title = "Informe de muestras"
windowstate windowstate = maximized!
cb_1 cb_1
sle_1 sle_1
end type
global w_inf_muestras w_inf_muestras

forward prototypes
public function integer of_descripcion ()
public function integer of_recuperar (string a_where)
end prototypes

public function integer of_descripcion ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 19 de Septiembre de 2003 HORA 09:57:43:507
// 
// Para colocar la descripcion de cliente y ejecutiva
// se utilizan datastore para minimizar la cantidad de select a db
//////////////////////////////////////////////////////////////////////////

n_cst_comun lo_comun

n_ds_application lds_1,lds_2,lds_3,lds_4,lds_5,lds_6

lds_1=create n_ds_application

lds_2=create n_ds_application

lds_3=create n_ds_application

lds_4=create n_ds_application

lds_5=create n_ds_application

lds_6=create n_ds_application

lds_1.DataObject="d_ext_cliente_suc"

lds_2.DataObject=lds_1.DataObject

long i,ll_tot,ll_dias

String ls_tipo,ls_descripcion,ls_busca

long ll_cliente,ll_sucursal,ll_pos,ll_ejecutiva,ll_res,ll_estado

ll_tot=dw_report.RowCount()


lds_3.DataObject="d_ext_fechas_dias"

lds_4.DataObject="d_dddw_mctecnico"

lds_5.DataObject="d_dddw_m_estado_muestra"

lds_6.DataObject="d_dddw_m_ttejidos"

lds_4.SetTransObject(n_cst_application.itr_appl)
lds_5.SetTransObject(n_cst_application.itr_appl)
lds_6.SetTransObject(n_cst_application.itr_appl)

lds_4.Retrieve()
lds_5.Retrieve()
lds_6.Retrieve()  //lo recupero para calcetines

DateTime ldt_fecha
String   ls_usuario,ls_instancia,ls_ref_ant
Date     ld_fecha1,ld_fecha2 

If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If


For i=1 To ll_tot
	
	ls_tipo=dw_report.GetItemString(i,"tipo_muestra")
	ll_cliente=dw_report.GetItemNumber(i,"co_cliente")
	ll_sucursal=dw_report.GetItemNumber(i,"co_sucursal")
	ll_ejecutiva=dw_report.GetItemNumber(i,"co_ejecutiva")
	
	ll_pos=lds_1.find("tipo='"+ls_tipo+"' and cliente="+String(ll_cliente)+&
	" and sucursal="+String(ll_sucursal),1,lds_1.RowCount())
	
	If ll_pos>0 Then
		ls_descripcion=lds_1.GetItemString(ll_pos,"descripcion")
	Else
		ll_res=lo_comun.of_nombrecliente(ll_cliente /*long a_cliente*/,&
		                                 ll_sucursal/*long a_sucursal*/,&
													ls_tipo/*string a_tipocliente*/,&
													n_cst_application.itr_appl/*transaction a_transaction */)		
													
	
		If ll_res=1 Then
			
			ll_pos=lds_1.InsertRow(0)
			lds_1.SetItem(ll_pos,"tipo",ls_tipo)
			lds_1.SetItem(ll_pos,"cliente",ll_cliente)
			lds_1.SetItem(ll_pos,"sucursal",ll_sucursal)
			
			ls_descripcion=lo_comun.of_getString(1)
			
			lds_1.SetItem(ll_pos,"descripcion",ls_descripcion)
		End If
	End If												
	
	dw_report.SetItem(i,"de_cliente",ls_descripcion)
	
	ls_descripcion=""
	
	If IsNull(ll_ejecutiva) Then ll_ejecutiva=0
	
	ll_pos=lds_2.find("tipo='"+ls_tipo+"' and cliente="+String(ll_ejecutiva),&
	       1,lds_2.RowCount())
			 
	If ll_pos>0 Then
		ls_descripcion=lds_2.GetItemString(ll_pos,"descripcion")
//////////////////////////////////////////////////////////////////////////
// La descripcion de la ejecutiva de obtiene de fuentes diferentes para
// nacional y exportacion
//////////////////////////////////////////////////////////////////////////
		
	Else
		
		ll_res=lo_comun.of_nombreejecutiva(ls_tipo /*string a_tipo*/,&
		                                   ll_ejecutiva/*long a_codigo*/,&
				  									  n_cst_application.itr_appl/*transaction a_transaction */)
     	If ll_res=1 Then
			ls_descripcion=lo_comun.of_getString(1)
		Else
			ls_descripcion=""
		End If

		ll_pos=lds_2.InsertRow(0)
		lds_2.SetItem(ll_pos,"tipo",ls_tipo)
		lds_2.SetItem(ll_pos,"cliente",ll_ejecutiva)

		lds_2.SetItem(ll_pos,"descripcion",ls_descripcion)
	
	End If
	
	dw_report.SetItem(i,"de_ejecutiva",ls_descripcion)
	
//////////////////////////////////////////////////////////////////////////
// Calculo los dias en proceso y totales
// 9 y 10 son estados finales entonces se calculan los dias totales
//////////////////////////////////////////////////////////////////////////
	ll_estado=dw_report.GetItemNumber(i,"co_estado")
	                                  
	ld_fecha1=dw_report.GetItemDate(i,"fecha_inicial")
	
	If ll_estado=9 or ll_estado=10 Then
		ld_fecha2=Date(dw_report.GetItemDateTime(i,"fecha_cierre"))
	Else
		ld_fecha2=Date(ldt_fecha)
	End If
		
	ls_busca="fecha1=Date('"+String(ld_fecha1,"YYYY/MM/DD")+"') and "+&
				"fecha2=Date('"+String(ld_fecha2,"YYYY/MM/DD")+"')"
				
	ll_pos=lds_3.find(ls_busca,1,lds_3.RowCount())
	
	If ll_pos>0 Then
		ll_dias=lds_3.GetItemNumber(ll_pos,"dias")
	Else
		ll_res=lo_comun.of_getdiashabiles(ld_fecha1 /*date a_fecha1*/,&
													  ld_fecha2/*date a_fecha2*/,&
													  1/*integer a_sabado*/,&
													  0/*integer a_domingo */)
		
		If ll_res=1 Then
			ll_dias=lo_comun.of_getLong(1)
			
			If ll_dias>1 Then
				ll_dias = ll_dias - 1
			End If
			ll_pos=lds_3.InsertRow(0)
			lds_3.SetItem(ll_pos,"fecha1",ld_fecha1)
			lds_3.SetItem(ll_pos,"fecha2",ld_fecha2)
			lds_3.SetItem(ll_pos,"dias",ll_dias)
		Else
			ll_dias=0
		End If
	End If
	

	If ll_estado=9 or ll_estado=13 Then
		dw_report.SetItem(i,"dias_total",String(ll_dias))
	Else
		dw_report.SetItem(i,"dias_desarrollo",String(ll_dias))
	End If	
	
//////////////////////////////////////////////////////////////////////////
// se coloca la descripcion del desarrollador
// 
//////////////////////////////////////////////////////////////////////////
	String ls_desarrollador,ls_de_desarrollador
	
	ls_desarrollador=dw_report.GetItemString(i,"desarrollador")
	
	ll_pos=lds_4.find("co_ctecnico='"+ls_desarrollador+"'",1,lds_4.RowCount())
	
	If ll_pos>0 then
		ls_de_desarrollador=lds_4.GetItemString(ll_pos,"de_ctecnico")
		dw_report.SetItem(i,"de_desarrollador",ls_de_desarrollador)
	End If

	String ls_de_estado
	
	ll_estado=dw_report.GetItemNumber(i,"co_estado")
	
	ll_pos=lds_5.find("co_estado="+String(ll_estado),1,lds_5.RowCount())
	If ll_pos>0 then
		ls_de_estado=lds_5.GetItemString(ll_pos,"de_estado")
		dw_report.SetItem(i,"de_estado",ls_de_estado)
	End If
	
	long ll_tipo_tejido
	String ls_tipo_tejido
	
	ll_tipo_tejido=dw_report.getItemNumber(i,"co_tipo_tejido")
	
	ll_pos=lds_6.find("co_ttejido="+String(ll_tipo_tejido),1,lds_6.rowCount())

	If ll_pos>0 then
		ls_tipo_tejido=lds_6.GetItemString(ll_pos,"de_tipo_tejido")
		dw_report.SetItem(i,"de_ttejido",ls_tipo_tejido)
	End If

	
	
Next

Return 1

end function

public function integer of_recuperar (string a_where);DataWindowChild 	ldc_1
String      		ls_final,ls_sel1,ls_modString
Long 					ll_pos


ll_pos=pos(a_where,"h_solicitudes")

If ll_pos>0 Then
	dw_report.DataObject="d_inf_muestras"
Else
	dw_report.DataObject="d_inf_muestras_outer"
End If

dw_report.getChild("co_tipo_tejido",ldc_1)

//////////////////////////////////////////////////////////////////////////
// Recupero los datos del tipo de tejido 10, solo para calcetines
// 
//////////////////////////////////////////////////////////////////////////

ldc_1.SetTransObject(n_cst_application.itr_appl)
ldc_1.Retrieve(10)

dw_report.SetTransObject(n_cst_application.itr_appl)

dw_report. Trigger Event ue_preview(True)


//Messagebox('Var','a_where='+a_where+'~n')

If trim(a_where)<>"" Then
	ls_final="m_muestras.co_ref_exp = dt_solicitudes.co_ref_exp )"

	ls_sel1=dw_report.Describe("DataWindow.Table.Select")
		
	ll_pos=pos(ls_sel1,ls_final)
		
	If ll_pos>0 Then
		ls_Sel1=Left(ls_sel1, ll_pos -1)
	End If
	
	
	ls_final+=" and ("
	
	ls_modString="DataWindow.Table.Select='" &
			+ ls_sel1 +ls_final+ a_where + "'"
	
	//Messagebox('Var','ls_modString='+ls_modString+'~n')
	clipboard(ls_modString)
	dw_report.Modify(ls_modString)
End If

dw_report.setRedraw(False)

dw_report.Retrieve()

of_descripcion()

dw_report.setRedraw(True)
//////////////////////////////////////////////////////////////////////////
// Coloco las descripciones adicionales
// 
//////////////////////////////////////////////////////////////////////////
n_cst_comun lo_comun

long ll_res
DateTime ldt_fecha
String ls_usuario,ls_instancia,ls_ref_ant

If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return  -1
End If

dw_report.Modify("fecha_hora.text='"+String(ldt_fecha,"YYYY/MM/DD hh:mm")+"'")
dw_report.Modify("usuario.text='"+ls_usuario+"'")

ll_Res=lo_comun.of_nombrefabrica(n_cst_application.ii_fabrica /*long a_fabrica*/,&
                                 n_cst_application.itr_appl/*transaction a_transaction */)
											
If ll_res=1 Then
	dw_report.Modify("nombre_fabrica.text='"+lo_comun.of_getString(1)+"'")
End If

Return 1
end function

on w_inf_muestras.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.sle_1=create sle_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.sle_1
end on

on w_inf_muestras.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
destroy(this.sle_1)
end on

event ue_find;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 18 de Septiembre de 2003 HORA 17:03:48:684
// 
// OverWrite!!
//////////////////////////////////////////////////////////////////////////
n_cst_param lo_param
DatawindowChild ldc_1


open(w_criterio_inf_muestras)

lo_param=Message.PowerObjectParm

If Not IsValid(lo_param) Then
	Return
End If
long ll_pos
String ls_Sel1,ls_modString,ls_where,ls_final

ls_where=lo_param.is_vector[1]

of_recuperar(ls_where)
end event

event open;call super::open;n_cst_param lo_param

lo_param=Message.PowerObjectParm


If IsValid(lo_param) Then
	If UpperBound(lo_param.is_vector)>0 Then
		of_recuperar(lo_param.is_vector[1])
	End If
	
End If
end event

type dw_report from w_report`dw_report within w_inf_muestras
string dataobject = "d_inf_muestras"
end type

type cb_1 from commandbutton within w_inf_muestras
boolean visible = false
integer x = 933
integer y = 120
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
string text = "Proceso"
end type

event clicked;String   ls_null, ls_desarrollador
long     ll_tot,i,ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_color,ll_estado


dw_report.reset()

SetNull(ls_null)

ll_tot=dw_report.importFile(ls_null)

Messagebox('Var','ll_tot='+String(ll_tot)+'~n')

For i=1 To ll_tot
	sle_1.text=string((i/ll_tot)*100,"#,###.00")
	yield()
	ll_fabrica=dw_report.GetItemNumber(i,"co_fabrica")
	ll_linea=dw_report.GetItemNumber(i,"co_linea")
	ll_muestra=dw_report.GetItemNumber(i,"co_muestra")
	ll_talla=dw_report.GetItemNumber(i,"co_talla")
	ll_color=dw_report.GetItemNumber(i,"co_color")
	
	ll_estado=dw_report.GetItemNumber(i,"co_estado")
	
	ls_desarrollador=dw_report.GetItemString(i,"desarrollador")	
	
	
	  UPDATE m_muestras  
     SET desarrollador = :ls_desarrollador  
   WHERE ( m_muestras.co_fabrica = :ll_fabrica ) AND  
         ( m_muestras.co_linea = :ll_linea ) AND  
         ( m_muestras.co_muestra = :ll_muestra ) 
           using n_cst_application.itr_appl ;
			  
	If n_cst_application.itr_appl.SQLcode=-1 Then 
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(n_cst_application.itr_appl)
		Return
	End If

  UPDATE dt_muestras_col  
     SET co_estado = :ll_estado  
   WHERE ( dt_muestras_col.co_fabrica = :ll_fabrica ) AND  
         ( dt_muestras_col.co_linea = :ll_linea ) AND  
         ( dt_muestras_col.co_muestra = :ll_muestra ) AND  
         ( dt_muestras_col.co_talla = :ll_talla ) AND  
         ( dt_muestras_col.co_color = :ll_color )   
           using n_cst_application.itr_appl ;
			  
	If n_cst_application.itr_appl.SQLcode=-1 Then 
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(n_cst_application.itr_appl)
		Return
	End If

  commit using n_cst_application.itr_appl ;	
  
//if i>1000  then
//Messagebox('Var','ll_fabrica='+String(ll_fabrica)+'~n'+&
//'ll_linea='+String(ll_linea)+'~n'+&
//'ll_muestra='+String(ll_muestra)+'~n'+&
//'ll_talla='+String(ll_talla)+'~n'+&
//'ll_color='+String(ll_color)+'~n'+&
//'ll_estado='+String(ll_estado)+'~n'+&
//'ls_desarrollador='+ls_desarrollador+'~n')  
//end if
	
Next






end event

type sle_1 from singlelineedit within w_inf_muestras
boolean visible = false
integer x = 1312
integer y = 124
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
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
end type

