HA$PBExportHeader$w_reporte_mejorado.srw
forward
global type w_reporte_mejorado from w_sheet
end type
type cb_2 from commandbutton within w_reporte_mejorado
end type
type cb_1 from commandbutton within w_reporte_mejorado
end type
type dw_criterio from u_dw_application within w_reporte_mejorado
end type
type dw_estados from u_dw_application within w_reporte_mejorado
end type
type dw_columnas from u_dw_application within w_reporte_mejorado
end type
type gb_1 from groupbox within w_reporte_mejorado
end type
type gb_2 from groupbox within w_reporte_mejorado
end type
type gb_3 from groupbox within w_reporte_mejorado
end type
type dw_dinamica from u_dw_application within w_reporte_mejorado
end type
type st_1 from statictext within w_reporte_mejorado
end type
type dw_reporte from u_dw_application within w_reporte_mejorado
end type
type gb_4 from groupbox within w_reporte_mejorado
end type
end forward

global type w_reporte_mejorado from w_sheet
integer width = 3538
integer height = 2032
string title = "Reporte de muestras consolidado"
windowstate windowstate = maximized!
cb_2 cb_2
cb_1 cb_1
dw_criterio dw_criterio
dw_estados dw_estados
dw_columnas dw_columnas
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
dw_dinamica dw_dinamica
st_1 st_1
dw_reporte dw_reporte
gb_4 gb_4
end type
global w_reporte_mejorado w_reporte_mejorado

type variables
//columnas que se seleccionan
String is_cols[]
end variables

forward prototypes
public function integer of_inicio ()
public function integer of_detalle (long a_fila)
public function string of_where (integer a_comillas)
public function integer of_deshabilitarestados ()
end prototypes

public function integer of_inicio ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 29 de Enero de 2004 HORA 18:37:45:422
// 
// Inicio
//////////////////////////////////////////////////////////////////////////

long ll_f
dw_columnas.Reset()


ll_f=dw_columnas.InsertRow(0)
dw_columnas.SetItem(ll_f,"seleccionado",1)
dw_columnas.SetItem(ll_f,"orden",10)
dw_columnas.SetItem(ll_f,"columna","Estado")
dw_columnas.SetItem(ll_f,"db_col","dt_muestras_col.co_estado")

ll_f=dw_columnas.InsertRow(0)
dw_columnas.SetItem(ll_f,"seleccionado",1)
dw_columnas.SetItem(ll_f,"orden",20)
dw_columnas.SetItem(ll_f,"columna","Cliente")
dw_columnas.SetItem(ll_f,"db_col","m_muestras.co_cliente, m_muestras.co_sucursal")

ll_f=dw_columnas.InsertRow(0)
dw_columnas.SetItem(ll_f,"seleccionado",1)
dw_columnas.SetItem(ll_f,"orden",30)
dw_columnas.SetItem(ll_f,"columna","Ejecutiva")
dw_columnas.SetItem(ll_f,"db_col","m_muestras.co_ejecutiva")

ll_f=dw_columnas.InsertRow(0)
dw_columnas.SetItem(ll_f,"seleccionado",1)
dw_columnas.SetItem(ll_f,"orden",40)
dw_columnas.SetItem(ll_f,"columna","Desarrollador")
dw_columnas.SetItem(ll_f,"db_col","m_muestras.desarrollador")




Return 0
end function

public function integer of_detalle (long a_fila);
String ls_where="", ls_cad


ls_where+=of_where(2)

//////////////////////////////////////////////////////////////////////////
// Se adicionan los datos de la columna de doble click
// 
//////////////////////////////////////////////////////////////////////////
long j,ll_tot_col
String ls_where1=""

ll_tot_col=UpperBound(is_cols)

For j=1 to ll_tot_col
	If mid(is_cols[j],1,10)="co_cliente" Then
		ls_where1+="( m_muestras.co_cliente = "+dw_reporte.GetItemString&
		(a_fila,"d"+String(j))+" ) and ( m_muestras.co_sucursal = "+String(dw_reporte.&
		GetItemNumber(a_fila,"sucursal"))+" ) and "

	ElseIf is_cols[j]="co_estado" Then
		ls_where1+="( dt_muestras_col.co_estado = "+dw_reporte.GetItemString&
		(a_fila,"d"+String(j))+" ) and "
	ElseIf is_cols[j]="co_ejecutiva" Then
		ls_where1+="( m_muestras.co_ejecutiva = "+dw_reporte.GetItemString&
		(a_fila,"d"+String(j))+" ) and "
	ElseIf is_cols[j]="desarrollador" Then
		ls_where1+="( m_muestras.desarrollador = ~~'"+dw_reporte.GetItemString&
		(a_fila,"d"+String(j))+"~~' ) and "
	End If
Next

ls_where1=mid(ls_where1,1,len(ls_where1) -4)

ls_where=ls_where+" and "+ls_where1

ls_where+=")"

//Messagebox('Var','ls_where='+ls_where+'~n')

w_inf_muestras  w_1


n_cst_param lo_param


lo_param.is_vector[1]=ls_where


OpenSheetWithParm(w_1,lo_param,ParentWindow(),2,Original!)

	
Return 1

end function

public function string of_where (integer a_comillas);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 09 de Febrero de 2004 HORA 09:35:56:538
// 
// Se arma dinamicamente la clausula where acorde con los criterios del usuario
//////////////////////////////////////////////////////////////////////////
Long 		ll_tot,i
String 	ls_dato

String ls_estado="( "

ll_tot=dw_estados.RowCount()

For i=1 To ll_tot
	If dw_estados.GetItemNumber(i,"chk")=1 Then
		ls_estado+=String(dw_estados.GetItemNumber(i,"co_estado"))+", "
	End If
	
Next

ls_estado=mid(ls_estado,1,len(ls_estado) -2)

ls_estado+=") "

If dw_criterio.AcceptText()<>1 Then
	MessageBox("Advertencia!","Verifique los par$$HEX1$$e100$$ENDHEX$$metros.",StopSign!)
	Return  ""
End If

String ls_where

ls_dato=dw_criterio.GetItemString(1,"tipo")

If Trim(ls_dato)<>"" Then
	If a_comillas=1 Then
		ls_where+="( m_muestras.tipo_muestra=~'"+ls_dato+"~') and "
	Else
		ls_where+="( m_muestras.tipo_muestra=~~'"+ls_dato+"~~') and "
	End If
End If

If len(ls_Estado)>4 Then
	ls_where+="( dt_muestras_col.co_estado in "+ls_Estado+") and "
End If

ls_dato=""

ls_dato=String(dw_criterio.GetItemNumber(1,"co_ejecutiva"))

If Not IsNull(ls_dato) Then
	ls_where+="( m_muestras.co_ejecutiva = "+ls_dato+") and "
End If

ls_dato=String(dw_criterio.GetItemNumber(1,"co_cliente"))

If Not IsNull(ls_dato) Then
	ls_where+="( m_muestras.co_cliente = "+ls_dato+") and "
End If

ls_dato=String(dw_criterio.GetItemNumber(1,"co_sucursal"))

If Not IsNull(ls_dato) Then
	ls_where+="( m_muestras.co_sucursal = "+ls_dato+") and "
End If

ls_dato=dw_criterio.GetItemString(1,"co_desarrollador")

If Not IsNull(ls_dato) Then
	If a_comillas=1 Then
		ls_where+="( m_muestras.desarrollador=~'"+ls_dato+"~') and "
	Else
		ls_where+="( m_muestras.desarrollador=~~'"+ls_dato+"~~') and "
	End If
End If

Date ld_1

ld_1=dw_criterio.GetItemDate(1,"fecha_dllo1")

If Not IsNull(ld_1) Then
	ls_where+="(m_muestras.fe_desarrollo >= DATETIME("+&
	String(year(ld_1),"0000")+"-"+String(month(ld_1),"00")+"-"+&
	String(day(ld_1),"00")+") year to day) and "
End If

//If Not IsNull(ld_1) Then
//	ls_where+="(dt_muestras_col.fe_estado >= DATETIME("+&
//	String(year(ld_1),"0000")+"-"+String(month(ld_1),"00")+"-"+&
//	String(day(ld_1),"00")+") year to day) and "
//End If


ld_1=dw_criterio.GetItemDate(1,"fecha_dllo2")

If Not IsNull(ld_1) Then
	ls_where+="(m_muestras.fe_desarrollo <= DATETIME("+&
	String(year(ld_1),"0000")+"-"+String(month(ld_1),"00")+"-"+&
	String(day(ld_1),"00")+") year to day) and "
End If

ld_1=dw_criterio.GetItemDate(1,"fecha_ent1")

If Not IsNull(ld_1) Then
	ls_where+="(m_muestras.fe_entrega >= DATETIME("+&
	String(year(ld_1),"0000")+"-"+String(month(ld_1),"00")+"-"+&
	String(day(ld_1),"00")+") year to day) and "
End If

ld_1=dw_criterio.GetItemDate(1,"fecha_ent2")

If Not IsNull(ld_1) Then
	ls_where+="(m_muestras.fe_entrega <= DATETIME("+&
	String(year(ld_1),"0000")+"-"+String(month(ld_1),"00")+"-"+&
	String(day(ld_1),"00")+") year to day) and "
End If
//////////////////////////////////////////////////////////////////////////
// Quitar la ultima palabra and de la sentencia where
// 
//////////////////////////////////////////////////////////////////////////


ls_where=mid(ls_where,1,len(ls_where) - 4)

Return ls_where
end function

public function integer of_deshabilitarestados ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 09 de Febrero de 2004 HORA 11:38:12:131
// 
// Se dehabilitan los estados que se mencionan por Claudia Chapman
// a saber:
// 15 transicion
// 20 arpobada
// 21 rechazada
//////////////////////////////////////////////////////////////////////////
long ll_tot,ll_pos

ll_tot=dw_estados.RowCount()

ll_pos=dw_estados.Find("co_estado=15",1,ll_tot)

If ll_pos>0 Then
	dw_estados.SetItem(ll_pos,"chk",0)
End If

ll_pos=dw_estados.Find("co_estado=20",1,ll_tot)

If ll_pos>0 Then
	dw_estados.SetItem(ll_pos,"chk",0)
End If

ll_pos=dw_estados.Find("co_estado=21",1,ll_tot)

If ll_pos>0 Then
	dw_estados.SetItem(ll_pos,"chk",0)
End If

ll_pos=dw_estados.Find("co_estado=22",1,ll_tot)

If ll_pos>0 Then
	dw_estados.SetItem(ll_pos,"chk",0)
End If

Return 1
end function

on w_reporte_mejorado.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_criterio=create dw_criterio
this.dw_estados=create dw_estados
this.dw_columnas=create dw_columnas
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.dw_dinamica=create dw_dinamica
this.st_1=create st_1
this.dw_reporte=create dw_reporte
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.dw_criterio
this.Control[iCurrent+4]=this.dw_estados
this.Control[iCurrent+5]=this.dw_columnas
this.Control[iCurrent+6]=this.gb_1
this.Control[iCurrent+7]=this.gb_2
this.Control[iCurrent+8]=this.gb_3
this.Control[iCurrent+9]=this.dw_dinamica
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.dw_reporte
this.Control[iCurrent+12]=this.gb_4
end on

on w_reporte_mejorado.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_criterio)
destroy(this.dw_estados)
destroy(this.dw_columnas)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.dw_dinamica)
destroy(this.st_1)
destroy(this.dw_reporte)
destroy(this.gb_4)
end on

event ue_find;call super::ue_find;String ls_select,is_cols1,ls_dato,ls_cols[]

long i,ll_tot,ll_tot_col=1,j,ll_pos_estado

ll_tot=dw_columnas.RowCount()

dw_columnas.Sort()

is_cols=ls_cols

For i=1 To ll_tot
	If dw_columnas.GetItemNumber(i,"seleccionado")=1 Then
		ls_dato=dw_columnas.GetItemString(i,"db_col")
		is_cols[ll_tot_col]=mid(ls_dato,pos(ls_dato,".")+1)
		is_cols1+=ls_dato+", "
		//Messagebox('Var','is_cols[ll_tot_col]='+is_cols[ll_tot_col]+'~n')
		ll_tot_col++
	End If
Next
ll_tot_col --
If ll_tot_col=0 Then
	Return 
End If

//Messagebox('Var','ll_tot_col='+String(ll_tot_col)+'~n')
is_cols1=mid(is_cols1,1,len(is_cols1) -2)

ls_select="select "+is_cols1

ls_select+=", count(*) as cantidad, count(distinct dt_muestras_col.co_muestra) as cant_mues  "

ls_select+="FROM        m_muestras ,"
ls_select+="            dt_muestras ,"
ls_select+="            dt_muestras_col     "
ls_select+="  WHERE ( dt_muestras.co_fabrica = m_muestras.co_fabrica ) and          "
ls_select+="        ( dt_muestras.co_linea = m_muestras.co_linea ) and          "
ls_select+="        ( dt_muestras.co_muestra = m_muestras.co_muestra ) and          "
ls_select+="        ( dt_muestras_col.co_fabrica = dt_muestras.co_fabrica ) and          "
ls_select+="        ( dt_muestras_col.co_linea = dt_muestras.co_linea ) and          "
ls_select+="        ( dt_muestras_col.co_muestra = dt_muestras.co_muestra ) and          "
ls_select+="        ( dt_muestras_col.co_talla = dt_muestras.co_talla ) "

//////////////////////////////////////////////////////////////////////////
// Aca se crea el where con los criterios
// 
//////////////////////////////////////////////////////////////////////////

ls_select+=" and "+of_where(1)

//////////////////////////////////////////////////////////////////////////
// Agragar sentencia de group
// 
//////////////////////////////////////////////////////////////////////////


ls_select+=" group by "+is_cols1


clipboard(ls_select)

String ls_dw_err = ""
String ls_dw_syntax
String ls_style="style(type=grid)"

ls_dw_syntax = SyntaxFromSQL(n_cst_application.itr_appl, ls_select, ls_style, ls_dw_err)
If ls_dw_err <> "" Then
	Return 
End If

dw_dinamica.Create(ls_dw_syntax)

dw_dinamica.SetTransObject(n_cst_application.itr_appl)

ll_tot=dw_dinamica.Retrieve()

//////////////////////////////////////////////////////////////////////////
// Asignar el dw_de grupos adecuado
// 
//////////////////////////////////////////////////////////////////////////
n_cst_comun lo_comun

dw_reporte.DataObject="d_ext_data_"+String(ll_tot_col)

Long 		ll_dato, ll_res, ll_dato1,ll_pos,ll_cantidad
String 	ls_tipo,ls_descripcion,ls_tipo_cliente

ls_tipo_cliente=dw_criterio.GetItemString(1,"tipo")

String ls_sort

For j=1 to ll_tot_col
	If mid(is_cols[j],1,10)="co_cliente" Then
		ls_sort+="col"+String(j)+","
		dw_reporte.modify("texto"+String(j)+".text='CLIENTE'")
	ElseIf is_cols[j]="co_estado" Then
		ls_sort+="pos_estado,"
		dw_reporte.modify("texto"+String(j)+".text='ESTADO'")		
	ElseIf is_cols[j]="co_ejecutiva" Then
		ls_sort+="col"+String(j)+","
		dw_reporte.modify("texto"+String(j)+".text='EJECUTIVA'")		
	ElseIf is_cols[j]="desarrollador" Then
		ls_sort+="col"+String(j)+","
		dw_reporte.modify("texto"+String(j)+".text='DESARROLLADOR'")
	End If
Next

ls_sort=mid(ls_sort,1,len(ls_sort) -1)

//Messagebox('Var','ls_sort='+ls_sort+'~n')


For i=1 To ll_tot
	
	dw_reporte.InsertRow(0)
	ll_cantidad=dw_dinamica.GetItemNumber(i,"cantidad")
	dw_reporte.SetItem(i,"cantidad",ll_cantidad)
	
	ll_cantidad=dw_dinamica.GetItemNumber(i,"cant_mues")
	dw_reporte.SetItem(i,"cant_mues",ll_cantidad)
	
	
	For j=1 to ll_tot_col
		
		ls_descripcion=""
		ll_pos=0
		
		If mid(is_cols[j],1,10)="co_cliente" Then
			ll_dato=dw_dinamica.GetItemNumber(i,"co_cliente")
			dw_reporte.SetItem(i,"d"+String(j),String(ll_dato))
			
			ll_dato1=dw_dinamica.GetItemNumber(i,"co_sucursal")
			dw_reporte.SetItem(i,"sucursal",ll_dato1)
			
//////////////////////////////////////////////////////////////////////////
// Verificar si existe la descripcion de cliente
// 
//////////////////////////////////////////////////////////////////////////
			ll_pos=dw_reporte.find("d"+String(j)+"='"+String(ll_dato)+"' and "+&
			       "sucursal="+String(ll_dato1),1,dw_reporte.RowCount() -1)
					 
			If ll_pos>0 and i>1 Then
				ls_descripcion=dw_reporte.GetItemString(ll_pos,"col"+String(j))
			Else
				ll_res=lo_comun.of_nombrecliente(ll_dato /*long a_cliente*/,&
				                                 ll_dato1/*long a_sucursal*/,&
															ls_tipo_cliente/*string a_tipocliente*/,&
															n_cst_application.itr_appl/*transaction a_transaction */)
				
				If ll_res=1 then
					ls_descripcion=lo_comun.of_getString(1)						
				End If
			End If
			dw_Reporte.setItem(i,"col"+String(j),ls_descripcion)
			
		ElseIf is_cols[j]="co_estado" Then
			ll_dato=dw_dinamica.GetItemNumber(i,"co_estado")
			dw_reporte.SetItem(i,"d"+String(j),String(ll_dato))
			
			ll_pos=dw_reporte.find("d"+String(j)+"='"+String(ll_dato)+"'",1,&
			                       dw_reporte.RowCount() -1)

			If ll_pos>0 and i>1 Then
				ls_descripcion=dw_reporte.GetItemString(ll_pos,"col"+String(j))
				ll_pos_estado=dw_reporte.GetItemNumber(ll_pos,"pos_estado")
			Else
				ll_res=lo_comun.of_nombreEstadoMuestra(ll_dato/*long a_estado*/,&
    															   n_cst_application.itr_appl/*transaction a_transaction */)
				If ll_res=1 Then						
					ls_descripcion=lo_comun.of_getString(1)	
					ll_pos_estado=lo_comun.of_getLong(1)	
				End If
			End If
			dw_Reporte.setItem(i,"col"+String(j),ls_descripcion)
			dw_Reporte.setItem(i,"pos_estado",ll_pos_estado)
		ElseIf is_cols[j]="co_ejecutiva" Then
			ll_dato=dw_dinamica.GetItemNumber(i,"co_ejecutiva")
			dw_reporte.SetItem(i,"d"+String(j),String(ll_dato))
			
			ll_pos=dw_reporte.find("d"+String(j)+"='"+String(ll_dato)+"'",&
			                       1,dw_reporte.RowCount() -1)

			If ll_pos>0 and i>1 Then
				ls_descripcion=dw_reporte.GetItemString(ll_pos,"col"+String(j))
			Else
				ll_res=lo_comun.of_nombreejecutiva(ls_tipo_cliente /*string a_tipo*/,&
				                                   ll_dato/*long a_codigo*/,&
															  n_cst_application.itr_appl/*transaction a_transaction */)
				If ll_res=1 Then
					ls_descripcion=lo_comun.of_getString(1)						
				End If
			End If
			dw_Reporte.setItem(i,"col"+String(j),ls_descripcion)
		ElseIf is_cols[j]="desarrollador" Then
			ls_dato=Trim(dw_dinamica.GetItemString(i,"desarrollador"))
			dw_reporte.SetItem(i,"d"+String(j),ls_dato)
			
			ll_pos=dw_reporte.find("d"+String(j)+"='"+ls_dato+"'",1,&
			                       dw_reporte.RowCount() -1)

			If ll_pos>0 and i>1 Then
				ls_descripcion=dw_reporte.GetItemString(ll_pos,"col"+String(j))
			Else
				ll_res=lo_comun.of_nombredesarrollador(ls_dato,&
															  n_cst_application.itr_appl/*transaction a_transaction */)
				
				If ll_res=1 Then
					ls_descripcion=lo_comun.of_getString(1)						
				End If
			End If
			dw_Reporte.setItem(i,"col"+String(j),ls_descripcion)
			
		End If
	Next
	
Next
//////////////////////////////////////////////////////////////////////////
// Se coloca nombr de fabrica usuario y fecha
// 
//////////////////////////////////////////////////////////////////////////





DateTime ldt_fecha
String ls_usuario,ls_instancia,ls_ref_ant

If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return  
End If

dw_reporte.Modify("fecha_hora.text='"+String(ldt_fecha,"YYYY/MM/DD hh:mm")+"'")
dw_reporte.Modify("usuario.text='"+ls_usuario+"'")

ll_Res=lo_comun.of_nombrefabrica(n_cst_application.ii_fabrica /*long a_fabrica*/,&
                                 n_cst_application.itr_appl/*transaction a_transaction */)
											
If ll_res=1 Then
	dw_reporte.Modify("nombre_fabrica.text='"+lo_comun.of_getString(1)+"'")
End If

//////////////////////////////////////////////////////////////////////////
// Recalcular los grupos
// 
//////////////////////////////////////////////////////////////////////////

dw_reporte.setSort(ls_sort)
dw_reporte.Sort()
dw_reporte.groupCalc()


end event

event open;call super::open;dw_estados.SetTransObject(n_cst_application.itr_appl)
dw_criterio.SetTransObject(n_cst_application.itr_appl)

of_inicio()

dw_estados.Retrieve()

dw_criterio.InsertRow(0)

of_SetDataWindow(dw_reporte)

of_deshabilitarEstados()


end event

type cb_2 from commandbutton within w_reporte_mejorado
integer x = 462
integer y = 632
integer width = 343
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Recuperar"
end type

event clicked;n_cst_config lo_config


If lo_config.of_recuperar(dw_columnas)<>1 Then
	Return
End If

If lo_config.of_recuperar(dw_criterio)<>1 Then
	Return
End If

If lo_config.of_recuperar(dw_estados)<>1 Then
	Return
End If

end event

type cb_1 from commandbutton within w_reporte_mejorado
integer x = 105
integer y = 632
integer width = 343
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Guardar"
end type

event clicked;n_cst_config lo_config


If lo_config.of_guardar(dw_columnas)<>1 Then
	Return
End If

If lo_config.of_guardar(dw_criterio)<>1 Then
	Return
End If

If lo_config.of_guardar(dw_estados)<>1 Then
	Return
End If
end event

type dw_criterio from u_dw_application within w_reporte_mejorado
integer x = 1166
integer y = 64
integer width = 1911
integer height = 472
integer taborder = 20
string dataobject = "d_ext_criterios"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;call super::getfocus;//
end event

event doubleclicked;call super::doubleclicked;If row=0 Then Return

String ls_tipo_sol

n_cst_param lo_param

lo_param.il_vector[1]=0

If dwo.name="co_cliente" or dwo.name="co_sucursal" Then
		
	ls_tipo_sol=GetItemString(1,"tipo")
	
	If IsNull(ls_tipo_sol) Then
		MessageBox("Advertencia!","Debe especificar el tipo de solicitud.",StopSign!)
		Return
	End If
	lo_param.is_vector[1]=""
	lo_param.is_vector[2]=ls_tipo_sol
	OpenWithParm(w_opc_cliente,lo_param)
	lo_param=Message.PowerObjectParm
//////////////////////////////////////////////////////////////////////////
// Si seleccionan algo en la ventana, entonces asigna el cliente, la sucursal y 
// llama el evento
//////////////////////////////////////////////////////////////////////////
	
	If IsValid(lo_param) Then
		SetItem(1,"co_cliente",lo_param.il_vector[1])
		SetItem(1,"co_sucursal",lo_param.il_vector[2])
		//is_where_cliente=lo_param.is_vector[1]
		
		DWObject dwo_1
		dwo_1 = This.Object.co_sucursal
		trigger event itemchanged(1,dwo_1,String(lo_param.il_vector[2]))
	End If
End If

If dwo.name="co_ejecutiva" Then
	lo_param.is_vector[1]=GetItemString(1,"tipo")
	OpenWithParm(w_bus_ejecutivo_vendedor,lo_param)
	lo_param=Message.powerObjectParm

	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If
	
End If
end event

event itemchanged;call super::itemchanged;String ls_tipo
n_cst_comun lo_comun

long ll_cliente,ll_sucursal,ll_res,ll_dato

If dwo.name="co_sucursal" Then
	ll_cliente=GetItemNumber(1,"co_cliente")
	ll_sucursal=Long(Data)
	ls_tipo=GetItemString(1,"tipo")
	ll_res=lo_comun.of_nombrecliente(ll_cliente /*long a_cliente*/,&
	                                 ll_sucursal/*long a_sucursal*/,&
												ls_tipo/*string a_tipocliente*/,&
												n_cst_application.itr_appl/*transaction a_transaction */)
												
	If ll_res=1 Then
		SetItem(1,"de_cliente",lo_comun.of_getString(1))
	Else
		SetItem(1,"de_cliente","")
	End If
	
End IF

If dwo.name="co_ejecutiva" Then
	ls_tipo=GetItemString(1,"tipo")
	ll_dato=Long(Data)
	
	ll_res=lo_comun.of_nombreejecutiva(ls_tipo /*string a_tipo*/,&
	                                   ll_dato/*long a_codigo*/,&
												  n_cst_application.itr_appl/*transaction a_transaction */)
   If ll_res<>1 Then
		MessageBox("Advertencia!","Ejecutiva no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_ejecutiva",lo_comun.of_getString(1))	
End If
end event

type dw_estados from u_dw_application within w_reporte_mejorado
integer x = 55
integer y = 792
integer width = 955
integer height = 512
integer taborder = 20
string dataobject = "d_estados_seleccion"
end type

event getfocus;//
end event

type dw_columnas from u_dw_application within w_reporte_mejorado
integer x = 55
integer y = 56
integer width = 955
integer height = 496
string dataobject = "d_ext_cols"
end type

event getfocus;//
end event

type gb_1 from groupbox within w_reporte_mejorado
integer y = 12
integer width = 1074
integer height = 564
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Columnas"
end type

type gb_2 from groupbox within w_reporte_mejorado
integer x = 1097
integer y = 12
integer width = 2030
integer height = 560
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Criterios"
end type

type gb_3 from groupbox within w_reporte_mejorado
integer y = 728
integer width = 1074
integer height = 632
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Columnas"
end type

type dw_dinamica from u_dw_application within w_reporte_mejorado
boolean visible = false
integer x = 64
integer y = 1464
integer width = 2834
integer height = 444
integer taborder = 30
boolean titlebar = true
boolean controlmenu = true
boolean maxbox = true
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_reporte_mejorado
integer x = 1143
integer y = 1380
integer width = 1522
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Utilice el bot$$HEX1$$f300$$ENDHEX$$n derecho del mouse para ampliar o reducrir el Informe"
boolean focusrectangle = false
end type

type dw_reporte from u_dw_application within w_reporte_mejorado
integer x = 1106
integer y = 596
integer width = 2011
integer height = 772
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_ext_data_1"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;call super::rbuttondown;//Messagebox('Var','x='+String(x)+'~n')
If x=5 Then
	x=1106
	y=596
	width=2011
	height=772
	
Else
	x=5
	y=24
	width=3514
	height=1800
End If

end event

event doubleclicked;call super::doubleclicked;If row=0 Then Return

of_detalle(row)
end event

type gb_4 from groupbox within w_reporte_mejorado
integer y = 572
integer width = 1074
integer height = 156
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Configuraci$$HEX1$$f300$$ENDHEX$$n"
end type

