HA$PBExportHeader$w_opc_inf_dias_dllo.srw
$PBExportComments$Window Class para especificar los criterios de b$$HEX1$$fa00$$ENDHEX$$squeda de las $$HEX1$$f300$$ENDHEX$$rdenes en d$$HEX1$$ed00$$ENDHEX$$as en desarrollo
forward
global type w_opc_inf_dias_dllo from w_response
end type
type cb_cancelar from u_cb_application within w_opc_inf_dias_dllo
end type
type cb_aceptar from u_cb_application within w_opc_inf_dias_dllo
end type
type dw_consulta from u_dw_application within w_opc_inf_dias_dllo
end type
type gb_2 from groupbox within w_opc_inf_dias_dllo
end type
type dw_datos from u_dw_application within w_opc_inf_dias_dllo
end type
type gb_1 from groupbox within w_opc_inf_dias_dllo
end type
end forward

global type w_opc_inf_dias_dllo from w_response
string tag = "B$$HEX1$$fa00$$ENDHEX$$squeda de $$HEX1$$f300$$ENDHEX$$rdenes - D$$HEX1$$ed00$$ENDHEX$$as desarrollo"
integer width = 1477
integer height = 1160
string title = "B$$HEX1$$fa00$$ENDHEX$$squeda de $$HEX1$$f300$$ENDHEX$$rdenes - D$$HEX1$$ed00$$ENDHEX$$as desarrollo"
boolean controlmenu = false
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
dw_consulta dw_consulta
gb_2 gb_2
dw_datos dw_datos
gb_1 gb_1
end type
global w_opc_inf_dias_dllo w_opc_inf_dias_dllo

type variables
String is_where,is_filtro
DatawindowChild idwc_condicion
n_cst_comun_orden iuo_comun
end variables

forward prototypes
public function integer of_recuperar (string as_where)
public function integer of_verificar ()
end prototypes

public function integer of_recuperar (string as_where);String ls_sel_ini,ls_modString,ls_original
Long ll_pos
n_ds_application lds_consulta
n_cst_param_orden luo_param
//---------------------------------------------------------------------
// Modificacion de la clausula where para la consulta del dw_consulta
ls_sel_ini = Trim(dw_consulta.Describe("DataWindow.Table.Select"))
ls_original = ls_sel_ini
ls_sel_ini += as_where
dw_consulta.Modify("DataWindow.Table.Select = '" + ls_sel_ini + "'")
//MessageBox('WHERE',ls_sel_ini)
Choose Case dw_consulta.Retrieve()
	case -1 // Error
		MessageBox('Problema con DB','Error en Solicitud!.',StopSign!)
		dw_consulta.Modify("DataWindow.Table.Select='"+ls_original+"'")
		Return -1
	case 0 // No hubieron datos devueltos
		MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','No hay datos para estos criterios de b$$HEX1$$fa00$$ENDHEX$$squeda!',Information!)	
		dw_consulta.Modify("DataWindow.Table.Select='"+ls_original+"'")
		Return -1
End Choose
dw_consulta.Modify("DataWindow.Table.Select='"+ls_original+"'")
//dw_consulta.SetFocus()
//------------------------------------------------------------------
//If MessageBox('Info','Seguir?',Question!,YesNo!,2)=2 Then Return 1
//*****************************************************************
lds_consulta = CREATE n_ds_application
lds_consulta.of_load('d_inf_dias_desarrollo')
If dw_consulta.RowCount() > 0 then 
	dw_consulta.RowsCopy(1,dw_consulta.RowCount(),Primary!,lds_consulta,1,Primary!)	
End If

luo_param.ids_vector[1]=lds_consulta
luo_param.is_vector[1]=is_filtro

CloseWithReturn(This,luo_param)

Return 1


end function

public function integer of_verificar ();/*******************************************************************************************************
* PROC./FUNC.: of_verificar
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	Verifica la consistencia de los datos
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Martes 25 de Enero de 2005. Hora: 08:12:32
********************************************************************************************************/
//VARIABLE DECLARATION
DateTime ldtm_ini,ldtm_fin
String ls_ini,ls_fin
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
ls_ini=String(dw_datos.GetItemDateTime(1,"fe_inicial"))
If Not IsNull(ls_ini) AND ls_ini<>'' Then		
		ls_fin=String(dw_datos.GetItemDateTime(1,"fe_final"))
		If Not IsNull(ls_fin) AND ls_fin<>'' Then
					ldtm_ini=dw_datos.GetItemDateTime(1,"fe_inicial")
					ldtm_fin=dw_datos.GetItemDateTime(1,"fe_final")
					If ldtm_fin<ldtm_ini Then
							MessageBox('Advertencia','La fecha inicial y final no son v$$HEX1$$e100$$ENDHEX$$lidas',StopSign!)
							Return -1
					End If
		End If	
End If
//------------------------------------------------------------------------------------------------------
Return 1
//END SCRIPT------------------------------------------------------------------------------------------------------
end function

on w_opc_inf_dias_dllo.create
int iCurrent
call super::create
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.dw_consulta=create dw_consulta
this.gb_2=create gb_2
this.dw_datos=create dw_datos
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancelar
this.Control[iCurrent+2]=this.cb_aceptar
this.Control[iCurrent+3]=this.dw_consulta
this.Control[iCurrent+4]=this.gb_2
this.Control[iCurrent+5]=this.dw_datos
this.Control[iCurrent+6]=this.gb_1
end on

on w_opc_inf_dias_dllo.destroy
call super::destroy
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.dw_consulta)
destroy(this.gb_2)
destroy(this.dw_datos)
destroy(this.gb_1)
end on

event open;call super::open;/*******************************************************************************************************
* PROC./FUNC.: 
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Martes 18 de Enero de 2005. Hora: 08:12:32
********************************************************************************************************/
//VARIABLE DECLARATION
	String ls_filter
//BEGIN SCRIPT----------------------------------------------------------------------------------------------------
dw_consulta.of_conexion(n_cst_application.itr_appl,True)
dw_datos.InsertRow(0)
//**************************************************************
dw_datos.getChild("condicion",idwc_condicion)
iuo_comun.of_loaddddw(idwc_condicion,n_cst_application.itr_appl)
ls_filter='condicion IN (4,5,6,7,8)'
idwc_condicion.SetFilter(ls_filter)
idwc_condicion.Filter()
idwc_condicion.InsertRow(1)
//**************************************************************
dw_datos.SetColumn('fe_inicial')
//END SCRIPT------------------------------------------------------------------------------------------------------
end event

type cb_cancelar from u_cb_application within w_opc_inf_dias_dllo
integer x = 718
integer y = 892
integer taborder = 50
string text = "&Cancelar"
end type

event clicked;call super::clicked;Close(Parent)
end event

type cb_aceptar from u_cb_application within w_opc_inf_dias_dllo
integer x = 357
integer y = 892
integer taborder = 40
string text = "&Aceptar"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 23 de Septiembre de 2004.H:16:51
---------------------------------------------------
Construcci$$HEX1$$f300$$ENDHEX$$n de la sentencia para la busqueda...
---------------------------------------------------*/
String ls_cad_campo
Long ll_pos
n_cst_param_orden	luo_parametros
//---------------------------------------------------
If dw_datos.AcceptText()<>1 Then	
	This.Event Losefocus()
	dw_datos.SetFocus()
	Return
End If
//----------------------------------------------------------------------
If of_verificar()<>1 Then Return
//----------------------------------------------------------------------
is_where=''
is_filtro=''
//Field:fe_inicial
ls_cad_campo=String(dw_datos.GetItemDateTime(1,"fe_inicial"),"yyyy-mm-dd 00:00:00.00000")
If Not IsNull(ls_cad_campo) AND ls_cad_campo<>'' Then
	is_where+=" AND (mu_gantt.fe_ini >= DATETIME ("+ls_cad_campo+") YEAR TO FRACTION(5))"
	is_filtro+="Fec.Inicial="+String(dw_datos.GetItemDateTime(1,"fe_inicial"),"yyyy/mm/dd , ")
End If

//Field:fe_final
ls_cad_campo=String(dw_datos.GetItemDateTime(1,"fe_final"),"yyyy-mm-dd 23:59:59.00000")
If Not IsNull(ls_cad_campo) AND ls_cad_campo<>'' Then
	is_where+=" AND (mu_gantt.fe_fin <= DATETIME ("+ls_cad_campo+") YEAR TO FRACTION(5))"	
	is_filtro+="Fec.Final<="+String(dw_datos.GetItemDateTime(1,"fe_final"),"yyyy/mm/dd , ")
End If

//Field:tipo_muestra
ls_cad_campo=String(dw_datos.GetItemString(1,"tipo_muestra"))
If Not IsNull(ls_cad_campo) Then
		is_where+=" AND (Upper(m_muestras.tipo_muestra) LIKE ~~'%"+Upper(ls_cad_campo)+"%~~')"
		is_filtro+="Tipo muestra= "+ls_cad_campo+", "
End If

//Field:co_cliente
ls_cad_campo=String(dw_datos.GetItemNumber(1,"co_cliente"))
If Not IsNull(ls_cad_campo) Then
	is_where+=" AND (m_muestras.co_cliente="+ls_cad_campo+")"
	is_filtro+="Cliente = "+ls_cad_campo+", "
End If

//Field:co_sucursal
ls_cad_campo=String(dw_datos.GetItemNumber(1,"co_sucursal"))
If Not IsNull(ls_cad_campo) Then
	is_where+=" AND (m_muestras.co_sucursal="+ls_cad_campo+")"
	is_filtro+="Sucursal = "+ls_cad_campo+", "
End If

//Field:desarrollador
ls_cad_campo=String(dw_datos.GetItemString(1,"desarrollador"))
If Not IsNull(ls_cad_campo) Then
		is_where+=" AND (Upper(dt_mu_ord.co_ctecnico) LIKE ~~'%"+Upper(ls_cad_campo)+"%~~')"
		is_filtro+="Desarrollador = "+ls_cad_campo+", "
End If

//Field:co_ejecutiva
ls_cad_campo=String(dw_datos.GetItemNumber(1,"co_ejecutiva"))
If Not IsNull(ls_cad_campo) Then
	is_where+=" AND (dt_mu_ord.co_ejecutiva="+ls_cad_campo+")"
	is_filtro+="Ejecutiva = "+ls_cad_campo+", "
End If

//Field:condicion
ls_cad_campo=String(dw_datos.GetItemNumber(1,"condicion"))
If Not IsNull(ls_cad_campo) Then
	is_where+=" AND (dt_mu_ord.condicion="+ls_cad_campo+")"
	ll_pos=idwc_condicion.Find('Condicion='+ls_cad_campo,1,idwc_condicion.RowCount())
	is_filtro+="Condici$$HEX1$$f300$$ENDHEX$$n = "+idwc_condicion.GetItemString(ll_pos,'de_condicion')+", "	
Else
	is_where+=" AND (dt_mu_ord.condicion IN (4,5,6,7,8))"
	is_filtro+="Condici$$HEX1$$f300$$ENDHEX$$n = TODAS, "
End If

//Field:cilindros
ls_cad_campo=String(dw_datos.GetItemNumber(1,"cilindros"))
If Not IsNull(ls_cad_campo) Then
is_where+=" AND (m_recursos_tj.ca_cilindro="+ls_cad_campo+")"
	is_filtro+="Cilindros = "+ls_cad_campo+", "
Else
	is_where+=" AND (m_recursos_tj.ca_cilindro IN (1,2))"
	is_filtro+="Cilindros = 1 y 2, "
End If
//-------------------------------------------------
If Right(is_filtro,2)=", " Then
	is_filtro=left(is_filtro,len(is_filtro) - 2)
End If
//-------------------------------------------------
//ls_cad_campo=dw_consulta.Describe("DataWindow.Table.Select")
//MessageBox('SELECT * FROM ~'dt_mu_ord~'','< '+is_where+'>~n Table.Select:'+ls_cad_campo,Exclamation!,OK!)
//*****************************************************************
of_recuperar(is_where)
//*****************************************************************

end event

type dw_consulta from u_dw_application within w_opc_inf_dias_dllo
integer x = 1536
integer y = 92
integer width = 1979
integer height = 904
integer taborder = 30
string dataobject = "d_inf_dias_desarrollo"
boolean hscrollbar = true
end type

event getfocus;//
end event

type gb_2 from groupbox within w_opc_inf_dias_dllo
boolean visible = false
integer x = 1490
integer y = 48
integer width = 2062
integer height = 1008
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "$$HEX1$$d300$$ENDHEX$$rdenes"
end type

type dw_datos from u_dw_application within w_opc_inf_dias_dllo
integer x = 55
integer y = 88
integer width = 1326
integer height = 788
string dataobject = "d_ext_inf_dias_desarrollo"
boolean controlmenu = true
boolean vscrollbar = false
end type

event itemchanged;call super::itemchanged;/*******************************************************************************************************
* PROC./FUNC.: ItemChanged
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	*
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Lunes 24  de Enero de 2005. Hora: 08:12:32
********************************************************************************************************/
//VARIABLE DECLARATION
Long ll_cliente,ll_sucursal,ll_null,ll_res
String ls_tipo_cliente,ls_tipo_muestra,ls_ejecutiva,ls_msj
n_cst_comun_orden luo_comun
//********************************************************************************************************/
Choose Case dwo.Name
	Case 'co_sucursal','co_cliente','tipo_muestra'
		If dwo.Name = 'co_sucursal' Then 
			ll_sucursal = Long(Data)
		Else
			ll_sucursal = This.GetItemNumber(1,'co_sucursal')
		End If
		If dwo.Name = 'co_cliente' Then 
			ll_cliente = Long(Data)
		Else
			ll_cliente = This.GetItemNumber(1,'co_cliente')  
		End If
		If dwo.Name = 'tipo_muestra' Then 
			ls_tipo_muestra = Data
		Else
			ls_tipo_muestra = This.GetItemString(1,'tipo_muestra')
		End If
		If ll_sucursal > 0 And ll_cliente > 0 &
		   And ( ls_tipo_muestra <> '' Or  Not IsNull(ls_tipo_muestra)) Then
			If luo_comun.of_nombrecliente(ll_cliente, &
													ll_sucursal, &
													ls_tipo_muestra, &
													n_cst_application.itr_appl) > 0 Then
         	This.SetItem(1,'de_cliente',luo_comun.of_getstring(1))
			Else
				MessageBox('Advertencia','No se pudo hallar la descripci$$HEX1$$f300$$ENDHEX$$n del cliente para' + &
				           ' el criterio definido',StopSign!)
 			   This.SetItem(1,'de_cliente','')
			End If
		Else
//				If IsNull(ls_tipo_muestra) Then
//					SetNull(ll_null)
//					This.SetItem(1,'de_cliente','')
//					This.SetItem(1,'co_sucursal',ll_null)
//					This.SetItem(1,'co_cliente',ll_null)
//				End If
		End If
//********************************************************************************************************/			
	Case 'co_ejecutiva'
		ls_tipo_muestra = This.GetItemString(1,'tipo_muestra')
		If Not IsNull(ls_tipo_muestra) Then
				If luo_comun.of_nombreejecutiva(ls_tipo_muestra,Long(Data), &
														  n_cst_application.itr_appl) > 0 Then
					This.SetItem(1,'de_ejecutiva',luo_comun.of_getstring(1))														  
				Else
					MessageBox('Advertencia','No se pudo hallar la descripci$$HEX1$$f300$$ENDHEX$$n de la' + &
					           'ejecutiva para el tipo de muestra en el criterio',StopSign!)
					Return 2
				End If
		Else
				luo_comun.of_nombreejecutiva('EX',Long(Data),n_cst_application.itr_appl)
				ls_ejecutiva = luo_comun.of_getstring(1)
				If Not IsNull(ls_ejecutiva) AND Trim(ls_ejecutiva)<>'' Then 
						ls_ejecutiva+= " (EX), "
				Else
						ls_ejecutiva=''
				End If
				luo_comun.of_nombreejecutiva('NA',Long(Data),n_cst_application.itr_appl)
				ls_msj=luo_comun.of_getstring(1)
				If Not IsNull(ls_msj) AND Trim(ls_msj)<>'' Then 
						ls_ejecutiva +=  ls_msj + " (NA)"				
				End If
				If ls_ejecutiva="" then 
					MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo de Ejecutiva no es valido para ning$$HEX1$$fa00$$ENDHEX$$n tipo de muestra.",StopSign!)
					Return 2
				End If
				This.SetItem(1,'de_ejecutiva',ls_ejecutiva)														  
		End If

//********************************************************************************************************/		
	Case 'desarrollador'
			//--**
			If Trim(Data)='' AND Len(Data)>0 Then
				MessageBox('Advertencia','Texto del campo del desarrollador no es v$$HEX1$$e100$$ENDHEX$$lido.S$$HEX1$$f300$$ENDHEX$$lo hay espacios en blanco',StopSign!)
				Return 1
			End If
			If This.of_validarcadena(Data)<>1 Then 
				Return 1
			End If
			//--**
			If IsNull(Data)Then 
				SetItem(1,"de_desarrollador",'')
				Return 0
			End If
			//--**
			ll_res=luo_comun.of_nombredesarrollador(Lower(Data),n_cst_application.itr_appl)
			If ll_res<>1 then
				MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo del Desarrollador no es v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
				Return 2
			End If
			SetItem(1,"de_desarrollador",Trim(luo_comun.of_getString(1)))		
End Choose
end event

event getfocus;/*******************************************************************************************************
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	18 de Enero de 2005. Hora: 18:06:12
********************************************************************************************************/
//OverWrite!
//------------------------------------------------------------------------------------------------------

end event

event itemerror;call super::itemerror;String ls_campo
Long   ll_null

ls_campo = dwo.Name
SetNull(ll_null)

Choose Case dwo.Name
	//**********************************************************
	Case  'co_cliente','co_sucursal','co_ejecutiva'
		If Long(Data) = 0 Then
			This.SetItem(row,ls_campo,ll_null)
			
			If ls_campo = 'co_ejecutiva' Then 
				This.SetItem(1,'de_ejecutiva','')
			End If
			
			If ls_campo = 'co_cliente' Or ls_campo = 'co_sucursal' Then
				This.SetItem(1,'de_cliente','')
//				This.SetItem(1,'co_sucursal',ll_null)
//				This.SetItem(1,'co_cliente',ll_null)
			End If
			
			Return 3
		End If
	//**********************************************************
	Case 'desarrollador'
		Return 1
	//**********************************************************
End Choose


end event

event doubleclicked;call super::doubleclicked;/*******************************************************************************************************
* PROC./FUNC.: doubleclicked
* ARG.		 : xpos,ypos,dwo,row
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	Evento que dispara las ventanas de b$$HEX1$$fa00$$ENDHEX$$squedas alternas
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	17 de Enero de 2005
********************************************************************************************************/
//VARIABLE DECLARATION
	String ls_tipo 
	n_cst_param lo_param
	n_cst_comun luo_comun
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
If row<=0 Then Return
//--------------------------------------------------------------------
If dwo.name='co_cliente' Or dwo.name='co_sucursal' Then
			ls_tipo=GetItemString(1,"tipo_muestra")
			If IsNull(ls_tipo) Then
				MessageBox("Advertencia!","Debe especificar el tipo de muestra.",StopSign!)
				Return
			End If
			lo_param.is_vector[1]=""
			lo_param.is_vector[2]=ls_tipo
			OpenWithParm(w_opc_cliente,lo_param)
			lo_param=Message.PowerObjectParm
			If IsValid(lo_param) Then
					SetItem(1,"co_cliente",lo_param.il_vector[1])
					SetItem(1,"co_sucursal",lo_param.il_vector[2])
					If luo_comun.of_nombrecliente(lo_param.il_vector[1], &
													lo_param.il_vector[2], &
													ls_tipo, &
													n_cst_application.itr_appl) > 0 Then
         						SetItem(1,'de_cliente',luo_comun.of_getstring(1))
					End If
			End If
End If
//--------------------------------------------------------------------
If dwo.name='desarrollador' Then
		OpenWithParm(w_bus_m_ctecnico,lo_param)
		lo_param=Message.PowerObjectParm
		If IsValid(lo_param) Then
			SetText(String(lo_param.is_vector[1]))
			AcceptText()
			SetColumn('de_ejecutiva')			
		End If
End If
//--------------------------------------------------------------------
If dwo.name='co_ejecutiva' Then
		ls_tipo=GetItemString(1,"tipo_muestra")
		If IsNull(ls_tipo) Then
			MessageBox("Advertencia!","Debe especificar el tipo de muestra.",StopSign!)
			Return
		End If
		lo_param.is_vector[1] = ls_tipo
		OpenWithParm(w_bus_ejecutivo_vendedor,lo_param)
		lo_param=Message.PowerObjectParm
		If IsValid(lo_param) Then
			SetText(String(lo_param.il_vector[1]))
			AcceptText()
			SetColumn('de_ejecutiva')			
		End If
End If
//------------------------------------------------------------------------------------------------------
//END SCRIPT------------------------------------------------------------------------------------------------------

end event

type gb_1 from groupbox within w_opc_inf_dias_dllo
integer x = 41
integer y = 24
integer width = 1376
integer height = 1004
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Datos de la orden"
end type

