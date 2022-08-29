HA$PBExportHeader$w_inf_ejecutiva.srw
$PBExportComments$Informe de muestras de ejecutivas, se muestran tambien los dias
forward
global type w_inf_ejecutiva from w_report
end type
type cb_1 from commandbutton within w_inf_ejecutiva
end type
type sle_1 from singlelineedit within w_inf_ejecutiva
end type
type dw_movimiento from u_dw_base within w_inf_ejecutiva
end type
end forward

global type w_inf_ejecutiva from w_report
string title = "Informe de muestras para ejecutivas"
windowstate windowstate = maximized!
event ue_post_open ( )
cb_1 cb_1
sle_1 sle_1
dw_movimiento dw_movimiento
end type
global w_inf_ejecutiva w_inf_ejecutiva

type variables
n_cst_param io_param
end variables

forward prototypes
public function integer of_descripcion ()
public function integer of_recuperar (string a_where)
end prototypes

event ue_post_open();
If IsValid(io_param) Then
	If UpperBound(io_param.is_vector)>0 Then
		of_recuperar(io_param.is_vector[1])
	End If
	
End If
end event

public function integer of_descripcion ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 19 de Septiembre de 2003 HORA 09:57:43:507
// 
// Para colocar la descripcion de cliente y ejecutiva
// se utilizan datastore para minimizar la cantidad de select a db
//////////////////////////////////////////////////////////////////////////

n_cst_comun lo_comun

n_ds_application lds_2,lds_3,lds_4,lds_5,lds_6

long j,ll_tot1,k



long i,ll_tot,ll_dias

String ls_tipo,ls_descripcion,ls_busca

long ll_cliente,ll_sucursal,ll_pos,ll_ejecutiva,ll_res,ll_estado

ll_tot=dw_report.RowCount()



DateTime ldt_fecha
String   ls_usuario,ls_instancia,ls_ref_ant
Date     ld_fecha1,ld_fecha2,ld_fecha3

If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If

long ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_color

For i=1 To ll_tot
	yield()
	title="Informe de muestras para ejecutivas "+String(i/ll_tot*100,"###.00")+"%"
	//ls_tipo=dw_report.GetItemString(i,"tipo_muestra")
	ll_cliente=dw_report.GetItemNumber(i,"co_cliente")
	ll_sucursal=dw_report.GetItemNumber(i,"co_sucursal")
	ll_ejecutiva=dw_report.GetItemNumber(i,"co_ejecutiva")
	
	ll_fabrica=dw_report.GetItemNumber(i,"co_fabrica")
	ll_linea=dw_report.GetItemNumber(i,"co_linea")
	ll_muestra=dw_report.GetItemNumber(i,"co_muestra")
	ll_talla=dw_report.GetItemNumber(i,"co_talla")
	ll_color=dw_report.GetItemNumber(i,"co_color")
	
	ll_tot1=dw_movimiento.Retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_color)
	
	If ll_tot1>0 Then
		ld_fecha1=Date(dw_movimiento.GetItemDateTime(1,"fe_creacion"))
		//////////////////////////////////////////////////////////////////////////
		// Busco si hay un estado 19, proceso de aprobacion
		// 
		//////////////////////////////////////////////////////////////////////////
		ll_pos=0
		For k=1 to 4
			If ll_pos+1<=ll_tot1 Then
				ld_fecha3=Date(dw_movimiento.GetItemDateTime(ll_pos+1,"fe_creacion"))
			End If
			
			ll_pos=dw_movimiento.find("co_estado=19",ll_pos+1,ll_tot1)
			
			If ll_pos>0 Then
				ld_fecha2=Date(dw_movimiento.GetItemDateTime(ll_pos,"fe_creacion"))	
				ll_res=lo_comun.of_getdiashabiles(ld_fecha3 /*date a_fecha1*/,&
													  ld_fecha2/*date a_fecha2*/,&
													  1/*integer a_sabado*/,&
													  0/*integer a_domingo */)
			
			   //ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_color,ll_pos,ld_fecha3,ld_fecha2,ll_dias

				If ll_res=1 Then
					ll_dias=lo_comun.of_getLong(1)
					
					If ll_dias>1 Then
						ll_dias = ll_dias - 1
					End If
					
				Else
					ll_dias=0
				End If
				dw_report.SetItem(i,"despacho_"+String(k),ll_dias)
			End If
				
			If ll_pos=ll_tot1  or ll_pos=0 Then
				k=7 //sale
			End If
			
			
		Next
		ld_fecha2=Date(ldt_fecha)
		ll_res=lo_comun.of_getdiashabiles(ld_fecha1 /*date a_fecha1*/,&
													  ld_fecha2/*date a_fecha2*/,&
													  1/*integer a_sabado*/,&
													  0/*integer a_domingo */)
				
		If ll_res=1 Then
			ll_dias=lo_comun.of_getLong(1)
			
			If ll_dias>1 Then
				ll_dias = ll_dias - 1
			End If
		Else
			ll_dias=0
		End If
		dw_report.SetItem(i,"total_dias",ll_dias)
	End If
//////////////////////////////////////////////////////////////////////////
// Calculo los dias en proceso y totales
// 9 y 10 son estados finales entonces se calculan los dias totales
//////////////////////////////////////////////////////////////////////////
	ll_estado=dw_report.GetItemNumber(i,"co_estado")
	
Next

Return 1

end function

public function integer of_recuperar (string a_where);DataWindowChild 	ldc_1
String      		ls_final,ls_sel1,ls_modString
Long 					ll_pos


dw_report. Trigger Event ue_preview(True)

//( dt_muestras_col.co_talla = dt_muestras.co_talla )
//Messagebox('Var','a_where='+a_where+'~n')

If trim(a_where)<>"" Then
//	ls_final="dt_muestras_col.co_talla = dt_muestras.co_talla )"

	ls_sel1=dw_report.Describe("DataWindow.Table.Select")
		
//	ll_pos=pos(ls_sel1,ls_final)
//		
////	If ll_pos>0 Then
//		ls_Sel1=Left(ls_sel1, ll_pos -1)
//	End If
//	
	
	ls_final+=" and "
	
	ls_modString="DataWindow.Table.Select='" &
			+ ls_sel1 +ls_final+ a_where + "'"
	
	//Messagebox('Var','ls_modString='+ls_modString+'~n')
	//clipboard(ls_modString)
	dw_report.Modify(ls_modString)
End If
dw_report.SetTransObject(n_cst_application.itr_appl)
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

on w_inf_ejecutiva.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.sle_1=create sle_1
this.dw_movimiento=create dw_movimiento
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.sle_1
this.Control[iCurrent+3]=this.dw_movimiento
end on

on w_inf_ejecutiva.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
destroy(this.sle_1)
destroy(this.dw_movimiento)
end on

event ue_find;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 18 de Septiembre de 2003 HORA 17:03:48:684
// 
// OverWrite!!
//////////////////////////////////////////////////////////////////////////
//n_cst_param lo_param
//DatawindowChild ldc_1
//
//
//open(w_criterio_inf_muestras)
//
//lo_param=Message.PowerObjectParm
//
//If Not IsValid(lo_param) Then
//	Return
//End If
//long ll_pos
//String ls_Sel1,ls_modString,ls_where,ls_final
//
//ls_where=lo_param.is_vector[1]
//
//of_recuperar(ls_where)
end event

event open;call super::open;dw_movimiento.SetTransObject(n_cst_application.itr_appl)


io_param=Message.PowerObjectParm

post event ue_post_open()
end event

type dw_report from w_report`dw_report within w_inf_ejecutiva
string dataobject = "d_inf_ejecutiva"
end type

type cb_1 from commandbutton within w_inf_ejecutiva
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

type sle_1 from singlelineedit within w_inf_ejecutiva
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

type dw_movimiento from u_dw_base within w_inf_ejecutiva
boolean visible = false
integer x = 841
integer y = 444
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_dt_est_col_mues"
end type

