HA$PBExportHeader$w_opc_gantt.srw
$PBExportComments$Window Class para la b$$HEX1$$fa00$$ENDHEX$$squeda de las $$HEX1$$f300$$ENDHEX$$rdenes que se tendr$$HEX1$$e100$$ENDHEX$$n en cuenta al momento de construir el gantt.
forward
global type w_opc_gantt from w_response
end type
type cb_cancelar from u_cb_application within w_opc_gantt
end type
type cb_aceptar from u_cb_application within w_opc_gantt
end type
type dw_consulta from u_dw_application within w_opc_gantt
end type
type gb_1 from groupbox within w_opc_gantt
end type
type gb_2 from groupbox within w_opc_gantt
end type
type dw_datos from u_dw_application within w_opc_gantt
end type
end forward

global type w_opc_gantt from w_response
string tag = "Selecci$$HEX1$$f300$$ENDHEX$$n de $$HEX1$$f300$$ENDHEX$$rdenes/tareas - Gantt"
integer width = 1536
integer height = 1320
string title = "Selecci$$HEX1$$f300$$ENDHEX$$n de $$HEX1$$f300$$ENDHEX$$rdenes/tareas - Gantt"
boolean controlmenu = false
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
dw_consulta dw_consulta
gb_1 gb_1
gb_2 gb_2
dw_datos dw_datos
end type
global w_opc_gantt w_opc_gantt

type variables
/*******************************************************************************************************
* PROC./FUNC.: 
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Mi$$HEX1$$e900$$ENDHEX$$rcoles 27 de Enero de 2005. Hora: 11:46:40
********************************************************************************************************/
//VARIABLE DECLARATION
PRIVATE:
	String is_where,is_filtro//,is_vec_cons[]
end variables

forward prototypes
public function integer of_recuperar ()
end prototypes

public function integer of_recuperar ();/*******************************************************************************************************
* PROC./FUNC.: of_recuperar
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Mi$$HEX1$$e900$$ENDHEX$$rcoles 27 de Enero de 2005. Hora: 11:46:40
********************************************************************************************************/
//VARIABLE DECLARATION
String ls_sel_ini,ls_modString,ls_original,ls_cad_campo
Long ll_pos
n_ds_application lds_consulta
n_cst_param_orden luo_param
//---------------------------------------------------------------------
If dw_datos.AcceptText()<>1 Then	
	cb_aceptar.Event Losefocus()
	dw_datos.SetFocus()
	Return -1
End If
//----------------------------------------------------------------------
is_where=''
is_filtro=''
//********************************************************************************
//Field:co_grupo
ls_cad_campo=String(dw_datos.GetItemNumber(1,"co_grupo"))
If Not IsNull(ls_cad_campo) Then
			//is_vec_cons[UpperBound(is_vec_cons)+1]="co_grupo="+ls_cad_campo
			is_where+=" AND (mu_gantt.co_grupo="+ls_cad_campo+")"
			luo_param.is_vector[1]='GRUPO'
			luo_param.is_vector[2]=Upper(dw_datos.GetItemString(1,"de_grupo"))
			luo_param.il_vector[1]=Long(Trim(ls_cad_campo))			
Else 
//********************************************************************************
		//Field:co_fabrica
		ls_cad_campo=String(dw_datos.GetItemNumber(1,"co_fabrica"))
		If Not IsNull(ls_cad_campo) Then
			//is_vec_cons[UpperBound(is_vec_cons)+1]="co_fabrica="+ls_cad_campo
			is_where+=" AND (dt_mu_ord.co_fabrica="+ls_cad_campo+")"	
		End If
		
		//Field:co_linea
		ls_cad_campo=String(dw_datos.GetItemNumber(1,"co_linea"))
		If Not IsNull(ls_cad_campo) Then
			//is_vec_cons[UpperBound(is_vec_cons)+1]="co_linea="+ls_cad_campo
			is_where+=" AND (dt_mu_ord.co_linea="+ls_cad_campo+")"	
		End If
		
		//Field:co_muestra
		ls_cad_campo=String(dw_datos.GetItemNumber(1,"co_muestra"))
		If Not IsNull(ls_cad_campo) Then
			//is_vec_cons[UpperBound(is_vec_cons)+1]="co_muestra="+ls_cad_campo
			is_where+=" AND (dt_mu_ord.co_muestra="+ls_cad_campo+")"	
		End If
		
		//Field:tipo_muestra
		ls_cad_campo=dw_datos.GetItemString(1,"tipo_muestra")
		If Not IsNull(ls_cad_campo) Then
				//is_vec_cons[UpperBound(is_vec_cons)+1]="tipo_muestra LIKE ~~'%"+Upper(ls_cad_campo)+"%~~'"
				is_where+=" AND (Upper(m_muestras.tipo_muestra) LIKE ~~'%"+Upper(ls_cad_campo)+"%~~')"		
		End If
		
		//Field:co_cliente
		ls_cad_campo=String(dw_datos.GetItemNumber(1,"co_cliente"))
		If Not IsNull(ls_cad_campo) Then
			//is_vec_cons[UpperBound(is_vec_cons)+1]="co_cliente="+ls_cad_campo
			is_where+=" AND (m_muestras.co_cliente="+ls_cad_campo+")"	
		End If
		
		//Field:co_sucursal
		ls_cad_campo=String(dw_datos.GetItemNumber(1,"co_sucursal"))
		If Not IsNull(ls_cad_campo) Then
			//is_vec_cons[UpperBound(is_vec_cons)+1]="co_sucursal="+ls_cad_campo
			is_where+=" AND (m_muestras.co_sucursal="+ls_cad_campo+")"
		End If
		
		//Field:desarrollador
		ls_cad_campo=dw_datos.GetItemString(1,"desarrollador")
		If Not IsNull(ls_cad_campo) Then
			//is_vec_cons[UpperBound(is_vec_cons)+1]="co_ctecnico LIKE ~~'%"+Upper(ls_cad_campo)+"%~~'"
			is_where+=" AND (Upper(dt_mu_ord.co_ctecnico) LIKE ~~'%"+Upper(ls_cad_campo)+"%~~')"
		End If
		
		//Field:co_ejecutiva
		ls_cad_campo=String(dw_datos.GetItemNumber(1,"co_ejecutiva"))
		If Not IsNull(ls_cad_campo) Then
			//is_vec_cons[UpperBound(is_vec_cons)+1]="co_ejecutiva="+ls_cad_campo
			is_where+=" AND (dt_mu_ord.co_ejecutiva="+ls_cad_campo+")"
		End If
		
		//Field:co_recurso
		ls_cad_campo=String(dw_datos.GetItemNumber(1,"co_recurso"))
		If Not IsNull(ls_cad_campo) Then
			//is_vec_cons[UpperBound(is_vec_cons)+1]="co_recurso="+ls_cad_campo
			is_where+=" AND (dt_muestras.co_recurso="+ls_cad_campo+")"
		End If
		
		luo_param.is_vector[1]='CRITERIO'
		luo_param.is_vector[2]=is_where
End If
//-------------------------------------------------
//ls_cad_campo=dw_consulta.Describe("DataWindow.Table.Select")
//MessageBox('SELECT * FROM ~'dt_mu_ord~'','< '+is_where+'>~n Table.Select:'+ls_cad_campo,Exclamation!,OK!)
//*****************************************************************
//MessageBox('S.Q.L.',is_where)
//*****************************************************************
luo_param.ib_vector[1]=True
CloseWithReturn(This,luo_param)
//*****************************************************************
Return 1


end function

on w_opc_gantt.create
int iCurrent
call super::create
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.dw_consulta=create dw_consulta
this.gb_1=create gb_1
this.gb_2=create gb_2
this.dw_datos=create dw_datos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancelar
this.Control[iCurrent+2]=this.cb_aceptar
this.Control[iCurrent+3]=this.dw_consulta
this.Control[iCurrent+4]=this.gb_1
this.Control[iCurrent+5]=this.gb_2
this.Control[iCurrent+6]=this.dw_datos
end on

on w_opc_gantt.destroy
call super::destroy
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.dw_consulta)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.dw_datos)
end on

event open;call super::open;/*******************************************************************************************************
* PROC./FUNC.: open
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	Event for open window
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Mi$$HEX1$$e900$$ENDHEX$$rcoles 27 de Enero de 2005. Hora: 11:46:40
********************************************************************************************************/
//VARIABLE DECLARATION
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
//dw_consulta.of_conexion(n_cst_application.itr_appl,True)
dw_datos.InsertRow(0)
dw_datos.SetColumn('tipo_muestra')
//END SCRIPT------------------------------------------------------------------------------------------------------


end event

type cb_cancelar from u_cb_application within w_opc_gantt
integer x = 763
integer y = 1108
integer taborder = 30
string text = "&Cancelar"
end type

event clicked;call super::clicked;Close(Parent)
end event

type cb_aceptar from u_cb_application within w_opc_gantt
integer x = 393
integer y = 1108
integer taborder = 20
string text = "&Aceptar"
end type

event clicked;call super::clicked;/*******************************************************************************************************
* PROC./FUNC.: cb_aceptar.clicled
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	Event for clicked button
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Mi$$HEX1$$e900$$ENDHEX$$rcoles 27 de Enero de 2005. Hora: 11:46:40
********************************************************************************************************/
//VARIABLE DECLARATION
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
of_recuperar ()
//END SCRIPT------------------------------------------------------------------------------------------------------

end event

type dw_consulta from u_dw_application within w_opc_gantt
integer x = 1655
integer y = 60
integer width = 1979
integer height = 904
integer taborder = 0
string dataobject = "d_inf_ordenes_proceso"
boolean hscrollbar = true
end type

event getfocus;//
end event

type gb_1 from groupbox within w_opc_gantt
integer x = 46
integer y = 24
integer width = 1426
integer height = 1064
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Selecci$$HEX1$$f300$$ENDHEX$$n"
end type

type gb_2 from groupbox within w_opc_gantt
boolean visible = false
integer x = 1609
integer y = 16
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

type dw_datos from u_dw_application within w_opc_gantt
integer x = 82
integer y = 72
integer width = 1371
integer height = 984
boolean bringtotop = true
string dataobject = "d_ext_ordenes_criterio"
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
Long ll_cliente,ll_sucursal,ll_null,ll_res,ll_grupo,ll_recurso
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
				MessageBox('Advertencia','No se pudo hallar la descripci$$HEX1$$f300$$ENDHEX$$n del cliente para ' + &
				           'el criterio definido',StopSign!)
 			   This.SetItem(1,'de_cliente','')
			End If
		Else
//			If IsNull(ls_tipo_muestra) Then
//				SetNull(ll_null)
//				This.SetItem(1,'de_cliente','')
//				This.SetItem(1,'co_sucursal',ll_null)
//				This.SetItem(1,'co_cliente',ll_null)
//			End If
		End If
//********************************************************************************************************/			
	Case 'co_ejecutiva'
		ls_tipo_muestra = This.GetItemString(1,'tipo_muestra')
		If Not IsNull(ls_tipo_muestra) Then
				If luo_comun.of_nombreejecutiva(ls_tipo_muestra,Long(Data), &
														  n_cst_application.itr_appl) > 0 Then
					This.SetItem(1,'de_ejecutiva',luo_comun.of_getstring(1))														  
				Else
					MessageBox('Advertencia','No se pudo hallar la descripci$$HEX1$$f300$$ENDHEX$$n de la ' + &
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
				This.SetItem(1,'de_ejecutiva',Trim(ls_ejecutiva))
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
				MessageBox("Advertencia!","El C$$HEX1$$f300$$ENDHEX$$digo del Desarrollador no es v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
				Return 2
			End If
			SetItem(1,"de_desarrollador",Trim(luo_comun.of_getString(1)))		
//********************************************************************************************************/		
	Case 'co_grupo'						
			ll_grupo=Long(Data)
			ll_res=luo_comun.of_nombregrupoact(ll_grupo,n_cst_application.itr_appl)
			If ll_res<>1 Then
				MessageBox("Advertencia!","El c$$HEX1$$f300$$ENDHEX$$digo del Grupo no es v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
				Return 2
			End If
			SetItem(row,"de_grupo",Trim(luo_comun.of_getString(1)))
			This.Modify("gb_grupo.Border='2'")
			
//********************************************************************************************************/		
	Case 'co_recurso'			
			ll_recurso=Long(Data)
			ll_res=luo_comun.of_nombrerecursotj(ll_recurso,n_cst_application.itr_appl)
			If ll_res<>1 Then
				MessageBox("Advertencia!","El c$$HEX1$$f300$$ENDHEX$$digo del Recurso no es v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
				Return 2
			End If
			SetItem(Row,"de_recurso",Trim(luo_comun.of_getString(1)))
//********************************************************************************************************/		
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
	Case  'co_fabrica','co_linea','co_muestra','co_cliente',&
			'co_sucursal','co_ejecutiva','co_grupo','co_recurso'
		If Long(Data) = 0 Then
			This.SetItem(row,ls_campo,ll_null)
			
			//If ls_campo = 'co_fabrica' OR ls_campo = 'co_linea' OR ls_campo = 'co_muestra' Then 
			//	This.SetItem(1,'de_muestra','')
			//End If
			
			If ls_campo = 'co_ejecutiva' Then 
				This.SetItem(1,'de_ejecutiva','')
			End If
			
			If ls_campo = 'co_cliente' Or ls_campo = 'co_sucursal' Then
				This.SetItem(1,'de_cliente','')				
			End If
			
			If ls_campo = 'co_recurso' Then 
				This.SetItem(1,'de_recurso','')				
			End If

			If ls_campo = 'co_grupo' Then 
				This.SetItem(1,'de_grupo','')
				This.Modify("gb_grupo.Border='5'")
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
If dwo.name='co_grupo' Then				
		Open(w_bus_grupo_act)
		lo_param=Message.PowerObjectParm
		If IsValid(lo_param) Then
			SetText(String(lo_param.il_vector[1]))
			This.SetItem(row,'de_grupo',lo_param.is_vector[1])
			SetColumn('de_grupo')
			This.Modify("gb_grupo.Border='2'")
		End If	
End If
//------------------------------------------------------------------------------------------------------
If dwo.name='co_recurso' Then				
		Open(w_bus_m_recurso_tj)
		lo_param=Message.PowerObjectParm
		If IsValid(lo_param) Then
			SetText(String(lo_param.il_vector[1]))
			AcceptText()
			SetColumn('de_recurso')
		End If	
End If
//END SCRIPT------------------------------------------------------------------------------------------------------

end event

