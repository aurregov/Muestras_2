HA$PBExportHeader$w_especificar_actividad.srw
$PBExportComments$Objeto ventana para la captura de los datos detalle de una actividad en el registro de ordenes de producci$$HEX1$$f300$$ENDHEX$$n para las muestras cuando la actividad tiene asignado el criterio de generar una solicitud de servicio.
forward
global type w_especificar_actividad from w_response
end type
type cb_delete_mp from u_cb_application within w_especificar_actividad
end type
type cb_nuevo_mp from u_cb_application within w_especificar_actividad
end type
type cb_cancelar from u_cb_application within w_especificar_actividad
end type
type cb_aceptar from u_cb_application within w_especificar_actividad
end type
type dw_mu_sol_serv_mp from u_dw_application within w_especificar_actividad
end type
type dw_mu_sol_serv from u_dw_application within w_especificar_actividad
end type
type gb_ss_mp from u_gb_base within w_especificar_actividad
end type
type gb_ss from u_gb_base within w_especificar_actividad
end type
end forward

global type w_especificar_actividad from w_response
string tag = "Detalle de la Actividad"
integer width = 2683
integer height = 1920
string title = "Detalle de la Actividad"
cb_delete_mp cb_delete_mp
cb_nuevo_mp cb_nuevo_mp
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
dw_mu_sol_serv_mp dw_mu_sol_serv_mp
dw_mu_sol_serv dw_mu_sol_serv
gb_ss_mp gb_ss_mp
gb_ss gb_ss
end type
global w_especificar_actividad w_especificar_actividad

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 25 de Noviembre de 2004.H:18:16
---------------------------------------------------
Variable de instancia para la captura de datos de la
solicitud de servicio en el registro de actividades
las ordenes de producci$$HEX1$$f300$$ENDHEX$$n
---------------------------------------------------*/
//Scope from variables
//---------------------------------------------------
PRIVATE:
	Boolean ib_cambio_des,ib_cam_promp,ib_nuevomod
	Long il_actividad,il_fabrica,il_linea,il_estado_act
	String is_por_color, is_col_mp
	n_cst_param_orden	iou_param
	n_ds_application 	ids_mu_sol_serv, ids_mu_sol_serv_mp
	n_cst_estima_tiempo iou_estimator
end variables

forward prototypes
public function integer of_habilitar_opcion ()
public function integer of_estimacion_tiempo ()
public function integer of_verificar ()
public function integer of_load_ids (integer ai_opc)
end prototypes

public function integer of_habilitar_opcion ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 29 de Noviembre de 2004.H:11:21
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n para la habilitacion de los items del detalle
de la solicitud de servicio seg$$HEX1$$fa00$$ENDHEX$$n los criterios recibidos
de la actividad seleccionada.
---------------------------------------------------*/
Long ll_res
//---------------------------------------------------
//Si la actividad requiere materia prima sw_mp
If iou_param.is_vector[1]='N' Then //sw_mp	
	dw_mu_sol_serv_mp.Enabled=False
	cb_nuevo_mp.Enabled=False
	cb_delete_mp.Enabled=False
	gb_ss_mp.Enabled=False
	gb_ss_mp.Text='Materia Prima de la solicitud de servicio (NO REQUERIDA PARA ESTA ACTIVIDAD)'
	
End If
//---------------------------------------------------------
//Si la actividad requiere color de materia prima y tono sw_col_mp
If iou_param.is_vector[2]='N' Then //sw_col_mp
	dw_mu_sol_serv.Modify("gb_color_mp.Enabled=False")
	dw_mu_sol_serv.Modify("gb_color_mp.Text='Color de MP(NO REQUERIDA PARA ESTA ACTIVIDAD)'")
	dw_mu_sol_serv.Modify("gb_color_mp.Color='134217745'")
	dw_mu_sol_serv.Modify("co_color_mp.Background.Mode=0")
	dw_mu_sol_serv.Modify("co_color_mp.Background.Color='67108864'")
	dw_mu_sol_serv.Modify("co_color_mp.TabSequence=0")
	dw_mu_sol_serv.Modify("co_color_mp.Tag=''")
	dw_mu_sol_serv.Modify("de_color_mp.Background.Mode=0")
	dw_mu_sol_serv.Modify("de_color_mp.Background.Color='67108864'")
	dw_mu_sol_serv.Modify("de_color_mp.TabSequence=0")
	dw_mu_sol_serv.Modify("de_color_mp.Tag=''")
	dw_mu_sol_serv.Modify("co_tono.Background.Mode=0")
	dw_mu_sol_serv.Modify("co_tono.Background.Color='67108864'")
	dw_mu_sol_serv.Modify("co_tono.TabSequence=0")
	dw_mu_sol_serv.Modify("co_tono.Tag=''")
	
End If
//---------------------------------------------------------
//Si la actividad requiere kilos sw_kilos
If iou_param.is_vector[3]='N' Then //sw_kilos
	dw_mu_sol_serv.Modify("ca_kilos.Background.Mode=0")
	dw_mu_sol_serv.Modify("ca_kilos.Background.Color=67108864")
	dw_mu_sol_serv.Modify("ca_kilos.TabSequence=0")	
	dw_mu_sol_serv.Modify("ca_kilos.Tag=''")	
End If
//---------------------------------------------------------
//Si la actividad requiere bordado sw_bordado
If iou_param.is_vector[4]='N' Then //sw_bordado
	dw_mu_sol_serv.Modify("id_bordado.Background.Mode=0")
	dw_mu_sol_serv.Modify("id_bordado.Background.Color=67108864")
	dw_mu_sol_serv.Modify("id_bordado.TabSequence=0")
	dw_mu_sol_serv.Modify("id_bordado.Tag=''")
End If
//---------------------------------------------------------
//Si la actividad requiere chablon sw_chablon
If iou_param.is_vector[5]='N' Then //sw_chablon
	dw_mu_sol_serv.Modify("id_chablon.Background.Mode=0")
	dw_mu_sol_serv.Modify("id_chablon.Background.Color=67108864")
	dw_mu_sol_serv.Modify("id_chablon.TabSequence=0")	
	dw_mu_sol_serv.Modify("id_chablon.Tag=''")
End If
//---------------------------------------------------------
//Si la actividad requiere tinta sw_tinta
If iou_param.is_vector[6]='N' Then //sw_tinta
	dw_mu_sol_serv.Modify("id_tinta.Background.Mode=0")
	dw_mu_sol_serv.Modify("id_tinta.Background.Color=67108864")
	dw_mu_sol_serv.Modify("id_tinta.TabSequence=0")	
	dw_mu_sol_serv.Modify("id_tinta.Tag=''")
End If
is_col_mp=iou_param.is_vector[2]
is_por_color=iou_param.is_vector[7]
If is_por_color='S' AND ib_nuevomod Then
	dw_mu_sol_serv.Modify("tiempo_estimado.Visible=False")
	dw_mu_sol_serv.Modify("tiempo_estimado_t.Visible=False")
End If
//---------------------------------------------------------
Return 1
end function

public function integer of_estimacion_tiempo ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 29 de Noviembre de 2004.H:11:21
---------------------------------------------------
---------------------------------------------------*/
Decimal{2} lde_tiempo
//---------------------------------------------------
//C$$HEX1$$c100$$ENDHEX$$LCULO DE ESTIMACI$$HEX1$$d300$$ENDHEX$$N DE TIEMPO
If is_por_color='N' Then// Si la actividad no es por color
	Title+='-->POR ORDEN'
	lde_tiempo=iou_estimator.of_gettiempo_activ(il_actividad)
	//If MessageBox('Validaci$$HEX1$$f300$$ENDHEX$$n','Tiempo estimado para la '+ls_objeto+' con c$$HEX1$$f300$$ENDHEX$$digo:'+String(ll_codigo)+'-->'+String(lde_tiempo)+'~nSeguir?',Question!,YesNo!,2) &
	//	= 2 Then Return 1
	If lde_tiempo=-1 Then //tiempo estimacion OK2						
			MessageBox('Advertencia','Error calculando el valor de tiempo de estimaci$$HEX1$$f300$$ENDHEX$$n para la Actividad: '+String(il_actividad),StopSign!)
			Return -1
	End If //tiempo estimacion OK2
	dw_mu_sol_serv.SetItem(1,'tiempo_estimado',lde_tiempo)	
Else
	Title+='-->POR COLOR'
End If

Return 1
end function

public function integer of_verificar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 29 de Noviembre de 2004.H:11:21
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------

If dw_mu_sol_serv.AcceptText()<>1 Then
	//MessageBox("Advertencia!","Datos de la solicitud de servicio no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	cb_aceptar.Event LoseFocus()
	dw_mu_sol_serv.SetFocus()
	Return -1
End If
If dw_mu_sol_serv_mp.Enabled Then
	If dw_mu_sol_serv_mp.AcceptText()<>1 Then
		//MessageBox("Advertencia!","Datos de la materia prima no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
		cb_aceptar.Event LoseFocus()
		dw_mu_sol_serv_mp.SetFocus()
		Return -1
	End If
End If

If Not dw_mu_sol_serv.of_completedata() Then
		cb_aceptar.Event LoseFocus()
		dw_mu_sol_serv.SetFocus()
	Return -1
End If

If dw_mu_sol_serv_mp.Enabled Then
	If Not dw_mu_sol_serv_mp.of_completedata() Then
		cb_aceptar.Event LoseFocus()
		dw_mu_sol_serv_mp.SetFocus()
		Return -1
	End If
End If

Return 1
end function

public function integer of_load_ids (integer ai_opc);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 29 de Noviembre de 2004.H:11:21
---------------------------------------------------
---------------------------------------------------*/
Choose Case ai_opc
	Case 1
			If Not IsValid(ids_mu_sol_serv) Then
					ids_mu_sol_serv = CREATE n_ds_application
					ids_mu_sol_serv.of_load('d_mu_sol_serv')					
			Else 				
					ids_mu_sol_serv.Reset()					
			End If
	Case 2
			If Not IsValid(ids_mu_sol_serv_mp) Then
					ids_mu_sol_serv_mp = CREATE n_ds_application
					ids_mu_sol_serv_mp.of_load('d_mu_sol_serv_mp')
			Else
					ids_mu_sol_serv_mp.Reset() 
			End If
End Choose

Return 1
end function

on w_especificar_actividad.create
int iCurrent
call super::create
this.cb_delete_mp=create cb_delete_mp
this.cb_nuevo_mp=create cb_nuevo_mp
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.dw_mu_sol_serv_mp=create dw_mu_sol_serv_mp
this.dw_mu_sol_serv=create dw_mu_sol_serv
this.gb_ss_mp=create gb_ss_mp
this.gb_ss=create gb_ss
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_delete_mp
this.Control[iCurrent+2]=this.cb_nuevo_mp
this.Control[iCurrent+3]=this.cb_cancelar
this.Control[iCurrent+4]=this.cb_aceptar
this.Control[iCurrent+5]=this.dw_mu_sol_serv_mp
this.Control[iCurrent+6]=this.dw_mu_sol_serv
this.Control[iCurrent+7]=this.gb_ss_mp
this.Control[iCurrent+8]=this.gb_ss
end on

on w_especificar_actividad.destroy
call super::destroy
destroy(this.cb_delete_mp)
destroy(this.cb_nuevo_mp)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.dw_mu_sol_serv_mp)
destroy(this.dw_mu_sol_serv)
destroy(this.gb_ss_mp)
destroy(this.gb_ss)
end on

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 26 de Noviembre de 2004.H:18:06
---------------------------------------------------
---------------------------------------------------*/
n_ds_application lds_activ
n_cst_comun_orden lo_comun
Long ll_res
//---------------------------------------------------
//of_carga_objtr()
If IsValid(Message.PowerObjectParm) Then
	iou_param = Message.PowerObjectParm
	ids_mu_sol_serv=iou_param.ids_vector[1]
	ids_mu_sol_serv_mp=iou_param.ids_vector[2]
	il_fabrica=iou_param.il_vector[1]
	il_linea=iou_param.il_vector[2]
	il_estado_act=iou_param.il_vector[3]
	Title='Detalle de la Actividad: '+Upper(Trim(ids_mu_sol_serv.GetItemString(1,'de_actividad')))+' |Estado: '+String(il_estado_act)
	il_actividad=ids_mu_sol_serv.GetItemNumber(1,'id_actividad')
	ib_nuevomod=iou_param.ib_vector[1]
	If ib_nuevomod Then //Nuevo/Modificado
				//**********************
				of_habilitar_opcion()
				//**********************								
				//----------------------------------------------
				//ids_mu_sol_serv.RowsCopy(1,ids_mu_sol_serv.RowCount(),Primary!,dw_mu_sol_serv,1, Primary!)
				ids_mu_sol_serv.ShareData(dw_mu_sol_serv)				
				il_actividad = ids_mu_sol_serv.GetItemNumber(1,'id_actividad')				
				//----------------------------------------------
				If IsValid(ids_mu_sol_serv_mp) Then
					//ids_mu_sol_serv_mp.RowsCopy(1,ids_mu_sol_serv_mp.RowCount(),Primary!,dw_mu_sol_serv_mp,1, Primary!)
					ids_mu_sol_serv_mp.ShareData(dw_mu_sol_serv_mp)
				Else
					If dw_mu_sol_serv_mp.Enabled Then 
						dw_mu_sol_serv_mp.InsertRow(0)						
					End If
				End If			
				//----------------------------------------------
				iou_estimator=iou_param.iou_estima_vector[1]
				If IsValid(iou_param.iou_estima_vector[1]) Then
					If of_estimacion_tiempo()<>1 Then
						Close(This)
					End If
				End If
	Else //Nuevo/Modificado		
		ids_mu_sol_serv.ShareData(dw_mu_sol_serv)
		ids_mu_sol_serv_mp.ShareData(dw_mu_sol_serv_mp)
		lds_activ=CREATE n_ds_application		
		lds_activ.of_load('d_mu_m_actividad')
		lds_activ.of_conexion(n_cst_application.itr_appl,True)
		ll_res=lds_activ.Retrieve(il_actividad)
		Choose Case ll_res
			Case Is < 0 
				MessageBox("Advertencia!","Error recuperando dato de la actividad para la modificaci$$HEX1$$f300$$ENDHEX$$n de la solicitud.",StopSign!)		
				Return
			Case 0
				MessageBox("Advertencia!","Los datos de la actividad no fueron encontrados para la modificaci$$HEX1$$f300$$ENDHEX$$n de la solicitud.",StopSign!)
				Return
		End Choose
		iou_param.is_vector[1]=lds_activ.GetItemString(1,'sw_mp')//Si requiere MP
		iou_param.is_vector[2]=lds_activ.GetItemString(1,'sw_col_mp')//Si requiere color M.P. y Tono
		iou_param.is_vector[3]=lds_activ.GetItemString(1,'sw_kilos')//Si requiere kilos
		iou_param.is_vector[4]=lds_activ.GetItemString(1,'sw_bordado')//Si requiere bordado					
		iou_param.is_vector[5]=lds_activ.GetItemString(1,'sw_chablon')//Si requiere chablon
		iou_param.is_vector[6]=lds_activ.GetItemString(1,'sw_tinta')//Si requiere tinta
		il_estado_act=lds_activ.GetItemNumber(1,'co_estado')
		If lo_comun.of_x_color_estado(il_estado_act,n_cst_application.itr_appl) = -1 Then
			MessageBox("Advertencia!","Error en la recuperaci$$HEX1$$f300$$ENDHEX$$n del criterio de color para el estado de la actividad en la solicitud",StopSign!)
			Return -1	
		End If		
		iou_param.is_vector[7]= lo_comun.of_getString(1)
		of_habilitar_opcion()				
	End If //Nuevo/Modificado	
End If
//--------------------------------------------------------------------
end event

type cb_delete_mp from u_cb_application within w_especificar_actividad
boolean visible = false
integer x = 2011
integer y = 800
integer width = 315
integer taborder = 30
boolean enabled = false
string text = "Eliminar MP"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:11:21
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
dw_mu_sol_serv_mp.TriggerEvent('ue_deleterow')
end event

type cb_nuevo_mp from u_cb_application within w_especificar_actividad
integer x = 2341
integer y = 800
integer taborder = 30
string text = "&Nuevo MP"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:11:21
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
dw_mu_sol_serv_mp.TriggerEvent('ue_insertrow')
end event

type cb_cancelar from u_cb_application within w_especificar_actividad
integer x = 1353
integer y = 1696
integer taborder = 30
string text = "&Cancelar"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:12:11
---------------------------------------------------
---------------------------------------------------*/
Close(Parent)
//---------------------------------------------------

end event

type cb_aceptar from u_cb_application within w_especificar_actividad
integer x = 987
integer y = 1696
integer taborder = 30
string text = "&Aceptar"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:12:11
---------------------------------------------------
---------------------------------------------------*/
n_cst_param_orden lou_param
//---------------------------------------------------
If of_verificar() <> 1 Then
	Return
End If
//---------------------------------------------------
//If IsValid(ids_mu_sol_serv) Then
//	ids_mu_sol_serv.Reset()
//End If
//If IsValid(ids_mu_sol_serv_mp) Then
//	ids_mu_sol_serv_mp.Reset()
//End If
//of_load_ids(1)
//of_load_ids(2)
//dw_mu_sol_serv.RowsCopy(1,1,Primary!,ids_mu_sol_serv,1, Primary!)
//dw_mu_sol_serv_mp.RowsCopy(1,dw_mu_sol_serv_mp.RowCount(),Primary!,ids_mu_sol_serv_mp,1, Primary!)
If Not ib_nuevomod Then
	If iou_param.is_vector[3]='S' Then //sw_kilos
		lou_param.is_vector[1]='sw_kilos'
		lou_param.is_vector[2]='por_color='+is_por_color
	End If
End If
lou_param.ids_vector[1]=ids_mu_sol_serv
lou_param.ids_vector[2]=ids_mu_sol_serv_mp
//----------------------------------------------------
CloseWithReturn(Parent,lou_param)
end event

type dw_mu_sol_serv_mp from u_dw_application within w_especificar_actividad
integer x = 110
integer y = 960
integer width = 2450
integer height = 640
integer taborder = 20
string dataobject = "d_mu_sol_serv_mp"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 25 de Noviembre de 2004.H:10:06	
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
gb_ss_mp.of_color(True)
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 25 de Noviembre de 2004.H:10:06	
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
gb_ss_mp.of_color(False)
end event

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:11:21
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lo_param
//---------------------------------------------------
//--------------------------------------------------------------------
If Row<=0 Then Return
//--------------------------------------------------------------------
If dwo.name="co_producto_mp" Then
	Open(w_bus_materiaprima_ord)
	lo_param=Message.PowerObjectParm
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
		AcceptText()
		SetColumn('mp_lote')
	End If
End If
//---------------------------------------------------
If dwo.name="co_proveedor" Then
	Open(w_bus_m_proveedores_mp_ord)
	lo_param=Message.PowerObjectParm
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
		AcceptText()
		SetColumn('de_proveedor')
	End If
End If
end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:10:08
---------------------------------------------------
---------------------------------------------------*/
Long ll_res,ll_dato
n_cst_comun_orden lo_comun
//---------------------------------------------------
If dwo.name='co_producto_mp' Then
	ll_res=Find("co_producto_mp="+data,1,RowCount())
	If ll_res>0 then
		MessageBox("Advertencia!","Este producto ya est$$HEX2$$e1002000$$ENDHEX$$seleccionado.",StopSign!)		
		Return 2
	End If
	ll_dato=Long(Data)
	ll_res=lo_comun.of_nombreMatPrima(ll_dato,n_cst_application.itr_appl)
	If ll_res<>1 Then
		MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo de Producto no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)		
		Return 2
	End If
	SetItem(row,"de_producto_mp",Trim(lo_comun.of_getString(1)))
End If
//---------------------------------------------------
If dwo.name='co_proveedor' Then
	ll_dato=Long(Data)
	ll_res=lo_comun.of_nombreProveedor(ll_dato,n_cst_application.itr_appl)
	If ll_res<>1 Then
		//MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo de Producto no existe.",StopSign!)		
		If Not ib_cam_promp Or IsNull(GetItemString(row,"de_proveedor")) Then
			SetItem(row,"de_proveedor",'/*NUEVO*/')				
		End If
		ib_cam_promp=True
		Return 0
	End If
	SetItem(row,"de_proveedor",Trim(lo_comun.of_getString(1)))
	ib_cam_promp=False
	Return 0	
End If
//---------------------------------------------------
String ls_coltype
ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	If Trim(Data)='' AND NOt IsNull(Data) Then
		MessageBox('Advertencia','Texto del campo no v$$HEX1$$e100$$ENDHEX$$lido.S$$HEX1$$f300$$ENDHEX$$lo hay espacios en blanco',StopSign!)
		Return 1
	End If
	If This.of_validarcadena(Data)<>1 Then 
		Return 1
	End If
End If
If dwo.name='de_proveedor' Then
	If Not ib_cam_promp /*OR IsNull(GetItemNumber(row,'co_proveedor'))*/Then
		Return 2
	End If
End If
//---------------------------------------------------

end event

event ue_insertrow;call super::ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 1 de Diciembre de 2004.H:09:03
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------

end event

event itemerror;call super::itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 06 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Integer li_null
String ls_coltype
//-------------------------------------------------
ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	Return 1
End If

If Long(Data)=0 Then
	SetNull(li_null)
	This.SetItem(row,String(dwo.name),li_null)
	If dwo.name='co_producto_mp' Then
		SetItem(row,'de_producto_mp','')
//		SetItem(row,'co_proveedor',li_null)
//		SetItem(row,'de_proveedor','')
//		SetItem(row,'mp_lote','')
	End If
	If dwo.name='co_proveedor' Then
		If Not ib_cam_promp Then
				SetNull(ls_coltype)
				This.SetItem(row,'de_proveedor',"")
				This.SetItem(row,'de_proveedor',ls_coltype)		
		End If
		ib_cam_promp=True				
	End If
	Return 3
End If	

end event

event rowfocuschanged;call super::rowfocuschanged;/*---------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 15 de Diciembre de 2004.H:17:06
---------------------------------------------------
---------------------------------------------------*/
Long ll_cod
n_cst_comun_orden lo_comun
//-------------------------------------------------
If currentrow<=0 Then Return
//-------------------------------------------------
ll_cod=GetItemNumber(currentrow,'co_proveedor')
If Not IsNull(ll_cod) Then	
	ll_cod=lo_comun.of_nombreproveedor(ll_cod,n_cst_application.itr_appl)
	If ll_cod<>1 Then	
		ib_cam_promp=True	
	Else 
		ib_cam_promp=False
	End If
Else
	ib_cam_promp=True
End If
end event

event editchanged;call super::editchanged;If dwo.name='de_proveedor' Then
	If Not ib_cam_promp /*OR IsNull(GetItemNumber(row,'co_proveedor'))*/Then
		SetColumn('co_proveedor')
	End If	
End If
end event

type dw_mu_sol_serv from u_dw_application within w_especificar_actividad
integer x = 73
integer y = 128
integer width = 2523
integer height = 608
integer taborder = 20
string dataobject = "d_mu_sol_serv"
boolean vscrollbar = false
boolean border = true
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 25 de Noviembre de 2004.H:10:06	
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
gb_ss.of_color(True)
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 25 de Noviembre de 2004.H:10:06	
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
gb_ss.of_color(False)
end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:10:08
---------------------------------------------------
---------------------------------------------------*/
Long ll_res,ll_dato
n_cst_comun_orden lo_comun
//---------------------------------------------------
//*****COLOR DE LA MATERIA PRIMA
If dwo.name='co_color_mp' Then
	ll_dato=Long(Data)
	ll_res=lo_comun.of_nombrecolor(il_fabrica,il_linea,ll_dato,n_cst_application.itr_appl)
	If ll_res<>1 Then
		//MessageBox("Advertencia!","Color no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		SetItem(row,"de_color_mp",'/*NUEVO*/')
		ib_cambio_des=True
		Return 0
	End If
	SetItem(row,"de_color_mp",Trim(lo_comun.of_getString(1)))
	SetItem(row,"co_tono",lo_comun.of_getlong(1))
	ib_cambio_des=False
End If
//---------------------------------------------------
If dwo.name='id_bordado' Then
	ll_dato=Long(Data)
	ll_res=lo_comun.of_nombrebordado(ll_dato,n_cst_application.itr_appl)
	If ll_res<>1 Then
		MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo de Bordado no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)		
		Return 2
	End If
	SetItem(row,"de_bordado",Trim(lo_comun.of_getString(1)))
End If
//---------------------------------------------------
If dwo.name='id_tinta' Then
	ll_dato=Long(Data)
	ll_res=lo_comun.of_nombretinta(ll_dato,n_cst_application.itr_appl)
	If ll_res<>1 Then
		MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo de la tinta no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)		
		Return 2
	End If
	SetItem(row,"de_tinta",Trim(lo_comun.of_getString(1)))
End If
//---------------------------------------------------
If dwo.name='id_chablon' Then
	ll_dato=Long(Data)
	ll_res=lo_comun.of_nombrechablon(ll_dato,n_cst_application.itr_appl)
	If ll_res<>1 Then
		MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo del Chablon no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)		
		Return 2
	End If
	SetItem(row,"de_chablon",Trim(lo_comun.of_getString(1)))
End If
//---------------------------------------------------
String ls_coltype
ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	If Trim(Data)='' AND NOt IsNull(Data) Then
		MessageBox('Advertencia','Texto del campo no v$$HEX1$$e100$$ENDHEX$$lido.S$$HEX1$$f300$$ENDHEX$$lo hay espacios en blanco',StopSign!)
		Return 1
	End If
	If This.of_validarcadena(Data)<>1 Then 
		Return 1
	End If
End If
If dwo.name='de_color_mp' OR dwo.name='co_tono' Then
	If Not ib_cambio_des OR IsNull(GetItemNumber(1,'co_color_mp'))Then
		Return 2
	End If
End If

end event

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:11:31
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lo_param
n_cst_comun_orden lo_comun
//--------------------------------------------------------------------
If Row<=0 Then Return
//--------------------------------------------------------------------
lo_param.is_vector[1]=ids_mu_sol_serv.GetItemString(1,'de_actividad')
If dwo.name='id_bordado' Then	
	OpenWithParm(w_bus_bordado_ord,lo_param)	
	lo_param=Message.PowerObjectParm
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
		AcceptText()
		SetColumn('de_bordado')
		//SetItem(1,'de_bordado',lo_param.is_vector[1])
	End If		
End If
//---------------------------------------------------
If dwo.name='id_chablon' Then
	OpenWithParm(w_bus_chablon_ord,lo_param)	
	lo_param=Message.PowerObjectParm
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
		AcceptText()
		SetColumn('de_chablon')
	End If		
End If
//---------------------------------------------------
If dwo.name='id_tinta' Then
	OpenWithParm(w_bus_tinta_ord,lo_param)	
	lo_param=Message.PowerObjectParm
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
		AcceptText()
		SetColumn('de_tinta')
	End If		
End If
//---------------------------------------------------
If dwo.name='co_color_mp' Then
	lo_param.il_vector[1]=il_fabrica
	lo_param.il_vector[2]=il_linea
	OpenWithParm(w_bus_m_colores,lo_param)	
	lo_param=Message.PowerObjectParm
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))		
		AcceptText()
		SetColumn('de_color_mp')
	End If		
End If
//---------------------------------------------------
end event

event itemerror;call super::itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 06 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Integer li_null
String ls_coltype
//-------------------------------------------------
ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	Return 1
End If

If Long(Data)=0 Then
	SetNull(li_null)
	This.SetItem(row,String(dwo.name),li_null)
	If dwo.name='id_bordado' Then
		SetItem(row,'de_bordado','')
	End If
	If dwo.name='id_chablon' Then
		SetItem(row,'de_chablon','')		
	End If
	If dwo.name='id_tinta' Then
		SetItem(row,'de_tinta','')
	End If
	If dwo.name='co_color_mp' Then
		SetItem(row,'de_color_mp','')
		SetItem(row,'co_tono','')
	End If
	Return 3
End If	

end event

event editchanged;call super::editchanged;If dwo.name='de_color_mp' OR dwo.name='co_tono' Then
	If Not ib_cambio_des OR IsNull(GetItemNumber(1,'co_color_mp'))Then
		SetColumn('co_color_mp')
	End If
End If
end event

type gb_ss_mp from u_gb_base within w_especificar_actividad
string tag = "Materia Prima de la solicitud de servicio"
integer x = 37
integer y = 896
integer width = 2597
integer height = 768
integer taborder = 20
string text = "Materia Prima de la solicitud de servicio"
end type

type gb_ss from u_gb_base within w_especificar_actividad
string tag = "Datos de la Solicitud de Servicio"
integer x = 37
integer y = 32
integer width = 2597
integer height = 736
string text = "Datos de la Solicitud de Servicio"
end type

