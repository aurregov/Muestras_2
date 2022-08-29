HA$PBExportHeader$w_inf_sol_serv.srw
forward
global type w_inf_sol_serv from w_report
end type
type cb_cancelar from u_cb_application within w_inf_sol_serv
end type
type cb_print from u_cb_application within w_inf_sol_serv
end type
type gb_ss from u_gb_base within w_inf_sol_serv
end type
end forward

global type w_inf_sol_serv from w_report
integer width = 3525
integer height = 1708
string title = "Informe individual solicitud servicio"
string menuname = ""
boolean maxbox = false
boolean resizable = false
cb_cancelar cb_cancelar
cb_print cb_print
gb_ss gb_ss
end type
global w_inf_sol_serv w_inf_sol_serv

type variables
n_cst_param_orden		iuo_param
Long 						il_actividad

end variables

on w_inf_sol_serv.create
int iCurrent
call super::create
this.cb_cancelar=create cb_cancelar
this.cb_print=create cb_print
this.gb_ss=create gb_ss
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancelar
this.Control[iCurrent+2]=this.cb_print
this.Control[iCurrent+3]=this.gb_ss
end on

on w_inf_sol_serv.destroy
call super::destroy
destroy(this.cb_cancelar)
destroy(this.cb_print)
destroy(this.gb_ss)
end on

event open;//------------------------------------
This.Event ue_open()
//------------------------------------
end event

event ue_open;call super::ue_open;//---------------------------------------------------------------------------------------------------------------------------
Long					ll_res,ll_nu_sol_serv,ll_chablon,ll_i,ll_color,ll_talla,ll_pos
Integer				li_pre
DateTime 			ldt_fecha
String 				ls_usuario,ls_instancia,ls_dwo,ls_titulo
n_cst_comun_orden luo_comun
n_ds_application 	lds_mu_sol_serv,lds_mu_sol_serv_mp,lds_muestra,lds_act_color
//---------------------------------------------------------------------------------------------------------------------------
If IsValid(Message.Powerobjectparm) Then		
		iuo_param=Message.Powerobjectparm
		lds_mu_sol_serv=CREATE n_ds_application
		lds_mu_sol_serv_mp=CREATE n_ds_application
		lds_mu_sol_serv.of_load('d_mu_sol_serv')
		lds_mu_sol_serv_mp.of_load('d_mu_sol_serv_mp')
		iuo_param.ids_vector[1].RowsCopy(1,iuo_param.ids_vector[1].RowCount(),Primary!,lds_mu_sol_serv,1,Primary!)
		iuo_param.ids_vector[2].RowsCopy(1,iuo_param.ids_vector[2].RowCount(),Primary!,lds_mu_sol_serv_mp,1,Primary!)
		//lds_mu_sol_serv=iuo_param.ids_vector[1]
		//lds_mu_sol_serv_mp=iuo_param.ids_vector[2]
		ll_nu_sol_serv=iuo_param.il_vector[6]
		lds_mu_sol_serv.SetFilter('nu_sol_serv='+String(ll_nu_sol_serv))
		lds_mu_sol_serv.Filter()
		lds_mu_sol_serv.RowsDiscard(1,lds_mu_sol_serv.FilteredCount(),Filter!)
		lds_mu_sol_serv_mp.SetFilter('nu_sol_serv='+String(ll_nu_sol_serv))
		lds_mu_sol_serv_mp.Filter()
		lds_mu_sol_serv_mp.RowsDiscard(1,lds_mu_sol_serv_mp.FilteredCount(),Filter!)
		li_pre=iuo_param.il_vector[7]//visual
		lds_act_color=iuo_param.ids_vector[3]//ids_actividades y colores
		//dw_report.of_load('d_inf_ss_desarrollo_color')			
		If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
														 ldt_fecha,ls_usuario,ls_instancia) Then
			MessageBox('Advertencia','Error en el proceso de determinaci$$HEX1$$f300$$ENDHEX$$n de la fecha del servidor de aplicaci$$HEX1$$f300$$ENDHEX$$n.',StopSign!)								
			Return
		End If
		il_actividad=iuo_param.il_vector[5]		
		Choose Case il_actividad
			Case 4,5,28/*SOLICITUD DE SERVICIO: Desarrollar color calcet$$HEX1$$ed00$$ENDHEX$$n */	
				ls_dwo='d_inf_ss_desarrollo_color_calcetin'							
				of_settitle('SOLICITUD DE SERVICIO: Desarrollar color calcet$$HEX1$$ed00$$ENDHEX$$n')
			Case 6,7 /*SOLICITUD DE SERVICIO: Desarrollar color Hilaza */
				ls_dwo='d_inf_ss_desarrollo_color_hilaza'
				of_settitle('SOLICITUD DE SERVICIO: Desarrollar color Hilaza')
			Case 8,9/*SOLICITUD DE SERVICIO: Te$$HEX1$$f100$$ENDHEX$$ir de Hilaza */
				ls_dwo='d_inf_ss_tenir_hilaza'
				of_settitle('SOLICITUD DE SERVICIO: Te$$HEX1$$f100$$ENDHEX$$ir Hilaza')
			Case 3/*SOLICITUD DE SERVICIO: Graficar Bordado*/				
				ls_dwo='d_inf_ss_graficar_bordado'
				of_settitle('SOLICITUD DE SERVICIO: Graficar Bordado')
			Case 2/*SOLICITUD DE SERVICIO: Graficar Antideslizante*/
				ls_dwo='d_inf_ss_graficar_antideslizante'
				of_settitle('SOLICITUD DE SERVICIO: Graficar Antideslizante')
			Case 19/*SOLICITUD DE SERVICIO:Desarrollar Chabl$$HEX1$$f300$$ENDHEX$$n*/
				ls_dwo='d_inf_ss_desarrollar_chablon'
				of_settitle('SOLICITUD DE SERVICIO: Desarrollar Chabl$$HEX1$$f300$$ENDHEX$$n')
			Case 25/*SOLICITUD DE SERVICIO:Preparar tinta antideslizante*/
				ls_dwo='d_inf_ss_preparar_tinta_antideslizante'
				of_settitle('SOLICITUD DE SERVICIO: Preparar tinta antideslizante')
			Case 18/*SOLICITUD DE SERVICIO:Desarrollar tinta antideslizante*/
				ls_dwo='d_inf_ss_desarrollar_tinta_antideslizant'
				of_settitle('SOLICITUD DE SERVICIO: Desarrollar tinta antideslizante')
			Case Else
				MessageBox('Advertencia','El c$$HEX1$$f300$$ENDHEX$$digo # '+&
								String(il_actividad)/*id_actividad*/+' de la actividad '+iuo_param.is_vector[1]/*de_actividad*/+&
								' no posee posee un formato de impresi$$HEX1$$f300$$ENDHEX$$n de solicitud de servicio adecuado.',StopSign!)								
				Return				
		End Choose
		dw_report.of_load(ls_dwo)
		dw_report.Modify("p_crystal.FileName='"+n_cst_application.is_pathpicture+"crystallogo.jpg'")
		dw_report.Modify("p_barcode.FileName='"+n_cst_application.is_pathpicture+"barcode1.jpg'")	
		dw_report.Modify("usuario_t.text='Usuario: "+Trim(ls_usuario)+" en ["+Trim(ls_instancia)+"]'")
		dw_report.Modify("dwo_t.text='dwo: "+dw_report.Dataobject+"'")
		dw_report.Modify("appl_t.text='Aplicaci$$HEX1$$f300$$ENDHEX$$n: "+n_cst_application.is_application+"'")
		//dw_report.Modify("title_t.text='SOLICITUD DE SERVICIO: "+Trim(Upper(iuo_param.is_vector[1]))+"'")
		dw_report.of_conexion(n_cst_application.itr_appl,True)
		ll_res=dw_report.Retrieve(iuo_param.il_vector[1]/*Fabrica*/,&
								 iuo_param.il_vector[2]/*L$$HEX1$$ed00$$ENDHEX$$nea*/,&
								 iuo_param.il_vector[3]/*Muestra*/,&
								 iuo_param.il_vector[4]/*Orden*/)
		Choose Case ll_res
			Case Is < 0
					MessageBox(	'Advertencia','Error en la solicitud de los datos de la actividad '+&
									String(iuo_param.il_vector[5])/*id_actividad*/+' - '+iuo_param.is_vector[1]/*de_actividad*/+&
									' para la impresi$$HEX1$$f300$$ENDHEX$$n de la solicitud de servicio # '+String(iuo_param.il_vector[6]),StopSign!)	
					Return				
		End Choose
				
		Choose Case il_actividad
			Case 4,5, 28/*SOLICITUD DE SERVICIO: Desarrollar color calcet$$HEX1$$ed00$$ENDHEX$$n */	
						SetNull(ll_color)
						ll_pos=lds_act_color.Find('id_actividad='+String(il_actividad)+"AND nu_sol_serv="+String(ll_nu_sol_serv),1,lds_act_color.RowCount())
						If ll_pos>0 Then
							ll_color=lds_act_color.GetItemNumber(ll_pos,'co_color')
						End If
						ll_talla=dw_report.GetItemNumber(1,'co_talla')
						If Not IsNull(ll_color) AND Not IsNull(ll_talla) Then
									lds_muestra = CREATE n_ds_application
									lds_muestra.of_load('d_cons_color_muestra')											
									lds_muestra.of_conexion(n_cst_application.itr_appl,True)
									ll_res = lds_muestra.Retrieve(iuo_param.il_vector[1]/*Fabrica*/,&
																			iuo_param.il_vector[2]/*L$$HEX1$$ed00$$ENDHEX$$nea*/,&
																			iuo_param.il_vector[3]/*Muestra*/,&
																			ll_talla,&
																			ll_color)
									Choose Case ll_res
										Case Is < 0
											MessageBox('Advertencia','Error en la consulta de los colores del informe',StopSign!)
											Return
										Case Is > 0
											dw_report.SetItem(1,'co_color_crystal',String(lds_muestra.GetItemNumber(1,'co_color')))
											dw_report.SetItem(1,'de_color_crystal',lds_muestra.GetItemString(1,'de_color'))
											dw_report.SetItem(1,'co_color_cliente',lds_muestra.GetItemString(1,'co_color_exp'))
											//dw_report.SetItem(1,'de_color_cliente','')
									End Choose
											
						End If
						If lds_mu_sol_serv.RowCount()>0 Then
								//dw_report.SetItem(1,'color_cliente',String(lds_mu_sol_serv.GetItemNumber(1,'co_color_mp')))
								//dw_report.SetItem(1,'de_color_cliente',lds_mu_sol_serv.GetItemString(1,'de_color_mp'))										
						End If
						lds_muestra=CREATE n_ds_application
						lds_muestra.of_load('d_mu_mp_base')/*Materia Prima Base --> TITULO*/
						lds_muestra.of_conexion(n_cst_application.itr_appl,True)
						ll_res=lds_muestra.Retrieve(iuo_param.il_vector[1]/*Fabrica*/,&
															 iuo_param.il_vector[2]/*L$$HEX1$$ed00$$ENDHEX$$nea*/,&
															 iuo_param.il_vector[3]/*Muestra*/)
						Choose Case ll_res
							Case Is < 0
									MessageBox('Advertencia','Error en la consulta de la materia prima base',StopSign!)
									Return
							Case 0
									SetNull(ls_titulo)
							Case Else
									ls_titulo=String(lds_muestra.GetItemNumber(1,'co_producto'))+" - "+lds_muestra.GetItemString(1,'de_producto')
						End Choose
						dw_report.SetItem(1,'titulo',ls_titulo)			
						If lds_mu_sol_serv_mp.RowCount()>0 Then
								//ll_res=dw_report.RowCount()
								//For ll_i=1 To ll_res
										dw_report.SetItem(1,'materia_prima',String(lds_mu_sol_serv_mp.GetItemNumber(1,'co_producto_mp'))+' '+&
														lds_mu_sol_serv_mp.GetItemString(1,'de_producto_mp'))
										dw_report.SetItem(1,'proveedor',String(lds_mu_sol_serv_mp.GetItemNumber(1,'co_proveedor'))+' '+&
														lds_mu_sol_serv_mp.GetItemString(1,'de_proveedor'))
										dw_report.SetItem(1,'no_lote',lds_mu_sol_serv_mp.GetItemString(1,'mp_lote'))
								//Next
						End If
			Case 6,7/*SOLICITUD DE SERVICIO: Desarrollar color Hilaza */
						If lds_mu_sol_serv.RowCount()>0 Then
								//dw_report.SetItem(1,'color_cliente',String(lds_mu_sol_serv.GetItemNumber(1,'co_color_mp')))
								//dw_report.SetItem(1,'de_color_cliente',lds_mu_sol_serv.GetItemString(1,'de_color_mp'))								
//								SetNull(ll_color)
//								ll_pos=lds_act_color.Find('id_actividad='+String(il_actividad)+"AND nu_sol_serv="+String(ll_nu_sol_serv),1,lds_act_color.RowCount())
//								If ll_pos>0 Then
//									ll_color=lds_act_color.GetItemNumber(ll_pos,'co_color')
//								End If
//								ll_talla=dw_report.GetItemNumber(1,'co_talla')
//								If Not IsNull(ll_color) AND Not IsNull(ll_talla) Then
//											lds_muestra = CREATE n_ds_application
//											lds_muestra.of_load('d_cons_color_muestra')											
//											lds_muestra.of_conexion(n_cst_application.itr_appl,True)
//											ll_res = lds_muestra.Retrieve(iuo_param.il_vector[1]/*Fabrica*/,&
//																					iuo_param.il_vector[2]/*L$$HEX1$$ed00$$ENDHEX$$nea*/,&
//																					iuo_param.il_vector[3]/*Muestra*/,&
//																					ll_talla,&
//																					ll_color)
//											Choose Case ll_res
//												Case Is < 0
//													MessageBox('Advertencia','Error en la consulta de los colores del informe',StopSign!)
//													Return
//												Case Is > 0
//													dw_report.SetItem(1,'co_color_crystal',String(lds_muestra.GetItemNumber(1,'co_color')))
//													dw_report.SetItem(1,'de_color_crystal',lds_muestra.GetItemString(1,'de_color'))
//													dw_report.SetItem(1,'co_color_cliente',lds_muestra.GetItemString(1,'co_color_exp'))
//											End Choose
//													
//								End If
								//dw_report.SetItem(1,'de_color_cliente',lds_mu_sol_serv.GetItemString(1,'de_color_mp'))//!!!!<-- JFVD averigua
						End If
						lds_muestra=CREATE n_ds_application
						lds_muestra.of_load('d_mu_mp_base')/*Materia Prima Base --> TITULO*/
						lds_muestra.of_conexion(n_cst_application.itr_appl,True)
						ll_res=lds_muestra.Retrieve(iuo_param.il_vector[1]/*Fabrica*/,&
															 iuo_param.il_vector[2]/*L$$HEX1$$ed00$$ENDHEX$$nea*/,&
															 iuo_param.il_vector[3]/*Muestra*/)
						Choose Case ll_res
							Case Is < 0
									MessageBox('Advertencia','Error en la consulta de la materia prima base',StopSign!)
									Return
							Case 0
									SetNull(ls_titulo)
							Case Else
									ls_titulo=String(lds_muestra.GetItemNumber(1,'co_producto'))+" - "+lds_muestra.GetItemString(1,'de_producto')
						End Choose
						dw_report.SetItem(1,'titulo',ls_titulo)	
						
						If lds_mu_sol_serv_mp.RowCount()>0 Then
								//ll_res=dw_report.RowCount()
								//For ll_i=1 To ll_res
										dw_report.SetItem(1,'materia_prima',String(lds_mu_sol_serv_mp.GetItemNumber(1,'co_producto_mp'))+' '+&
														lds_mu_sol_serv_mp.GetItemString(1,'de_producto_mp'))
										dw_report.SetItem(1,'proveedor',String(lds_mu_sol_serv_mp.GetItemNumber(1,'co_proveedor'))+' '+&
														lds_mu_sol_serv_mp.GetItemString(1,'de_proveedor'))
										dw_report.SetItem(1,'no_lote',lds_mu_sol_serv_mp.GetItemString(1,'mp_lote'))
								//Next
						End If											
			Case 8,9/*SOLICITUD DE SERVICIO: Te$$HEX1$$f100$$ENDHEX$$ir de Hilaza */
						SetNull(ll_color)
						ll_pos=lds_act_color.Find('id_actividad='+String(il_actividad)+"AND nu_sol_serv="+String(ll_nu_sol_serv),1,lds_act_color.RowCount())
						If ll_pos>0 Then
							ll_color=lds_act_color.GetItemNumber(ll_pos,'co_color')
						End If
						ll_talla=dw_report.GetItemNumber(1,'co_talla')
						If Not IsNull(ll_color) AND Not IsNull(ll_talla) Then
									lds_muestra = CREATE n_ds_application
									lds_muestra.of_load('d_cons_color_muestra')											
									lds_muestra.of_conexion(n_cst_application.itr_appl,True)
									ll_res = lds_muestra.Retrieve(iuo_param.il_vector[1]/*Fabrica*/,&
																			iuo_param.il_vector[2]/*L$$HEX1$$ed00$$ENDHEX$$nea*/,&
																			iuo_param.il_vector[3]/*Muestra*/,&
																			ll_talla,&
																			ll_color)
									Choose Case ll_res
										Case Is < 0
											MessageBox('Advertencia','Error en la consulta de los colores del informe',StopSign!)
											Return
										Case Is > 0
											dw_report.SetItem(1,'co_color_exp',String(lds_muestra.GetItemString(1,'co_color_exp')))													
											//dw_report.SetItem(1,'de_color_exp','')													
									End Choose
											
						End If
						//dw_report.SetItem(1,'co_color_exp',String(lds_mu_sol_serv.GetItemNumber(1,'co_color_mp')))													
						//dw_report.SetItem(1,'de_color_exp',lds_mu_sol_serv.GetItemString(1,'de_color_mp'))
						If lds_mu_sol_serv.RowCount()>0 Then								
								dw_report.SetItem(1,'cantidad',String(lds_mu_sol_serv.GetItemDecimal(1,'ca_kilos')))
						End If
						lds_muestra=CREATE n_ds_application
						lds_muestra.of_load('d_mu_mp_base')/*Materia Prima Base --> TITULO*/
						lds_muestra.of_conexion(n_cst_application.itr_appl,True)
						ll_res=lds_muestra.Retrieve(iuo_param.il_vector[1]/*Fabrica*/,&
															 iuo_param.il_vector[2]/*L$$HEX1$$ed00$$ENDHEX$$nea*/,&
															 iuo_param.il_vector[3]/*Muestra*/)
						Choose Case ll_res
							Case Is < 0
									MessageBox('Advertencia','Error en la consulta de la materia prima base',StopSign!)
									Return
							Case 0
									SetNull(ls_titulo)
							Case Else
									ls_titulo=String(lds_muestra.GetItemNumber(1,'co_producto'))+" - "+lds_muestra.GetItemString(1,'de_producto')
						End Choose
						dw_report.SetItem(1,'titulo',ls_titulo)
						If lds_mu_sol_serv_mp.RowCount()>0 Then
								//ll_res=dw_report.RowCount()
								//For ll_i=1 To ll_res
										dw_report.SetItem(1,'materia_prima',String(lds_mu_sol_serv_mp.GetItemNumber(1,'co_producto_mp'))+' '+&
														lds_mu_sol_serv_mp.GetItemString(1,'de_producto_mp'))
										dw_report.SetItem(1,'proveedor',String(lds_mu_sol_serv_mp.GetItemNumber(1,'co_proveedor'))+' '+&
														lds_mu_sol_serv_mp.GetItemString(1,'de_proveedor'))
										dw_report.SetItem(1,'no_lote',lds_mu_sol_serv_mp.GetItemString(1,'mp_lote'))
								//Next
						End If	
			Case 3 /*SOLICITUD DE SERVICIO: Graficar Bordado*/				
						If lds_mu_sol_serv.RowCount()>0 Then
								dw_report.SetItem(1,'co_bordado',String(lds_mu_sol_serv.GetItemNumber(1,'id_bordado'))+' - '+&
								lds_mu_sol_serv.GetItemString(1,'de_bordado'))								
						End If
			Case 2/*SOLICITUD DE SERVICIO: Graficar Antideslizante*/
					If lds_mu_sol_serv.RowCount()>0 Then
								dw_report.SetItem(1,'co_antideslizante',String(lds_mu_sol_serv.GetItemNumber(1,'id_chablon'))+' - '+&
								lds_mu_sol_serv.GetItemString(1,'de_chablon'))								
					End If						
			Case 19/*SOLICITUD DE SERVICIO:Desarrollar Chabl$$HEX1$$f300$$ENDHEX$$n*/
					If lds_mu_sol_serv.RowCount()>0 Then
								ll_chablon=lds_mu_sol_serv.GetItemNumber(1,'id_chablon')
								dw_report.SetItem(1,'co_chablon',String(ll_chablon)+' - '+&
								lds_mu_sol_serv.GetItemString(1,'de_chablon'))
								If Not IsNull(ll_chablon) AND ll_chablon>0 Then
									ll_res=luo_comun.of_nombrechablon(ll_chablon,n_cst_application.itr_appl)
									If ll_res=1 Then
										dw_report.SetItem(1,'calibre',String(luo_comun.of_getlong(2)))
										dw_report.SetItem(1,'total_colores',String(luo_comun.of_getlong(1)))
									End If
								End If								
					End If
			Case 25/*SOLICITUD DE SERVICIO:Preparar tinta antideslizante*/
					If lds_mu_sol_serv.RowCount()>0 Then
							dw_report.SetItem(1,'co_color',String(lds_mu_sol_serv.GetItemNumber(1,'id_tinta'))+' - '+&
							lds_mu_sol_serv.GetItemString(1,'de_tinta'))
				 			//dw_report.SetItem(1,'co_color',String(lds_mu_sol_serv.GetItemNumber(1,'co_color_mp')))
							dw_report.SetItem(1,'cantidad',String(lds_mu_sol_serv.GetItemDecimal(1,'ca_kilos')))
					End If				
			Case 18/*SOLICITUD DE SERVICIO:Desarrollar tinta antideslizante*/
					If lds_mu_sol_serv.RowCount()>0 Then
							dw_report.SetItem(1,'de_color',String(lds_mu_sol_serv.GetItemNumber(1,'id_tinta'))+' - '+&
							lds_mu_sol_serv.GetItemString(1,'de_tinta'))
							dw_report.SetItem(1,'cantidad',String(lds_mu_sol_serv.GetItemDecimal(1,'ca_kilos')))
					End If
		End Choose
		lds_mu_sol_serv.SetFilter('')
		lds_mu_sol_serv.Filter()		
		lds_mu_sol_serv_mp.SetFilter('')
		lds_mu_sol_serv_mp.Filter()
		If li_pre=0 Then
			cb_print.Triggerevent('Clicked')
			Close(This)
		End If
Else
	MessageBox('Advertencia','Error en los parametros para la impresion de la solicitud de servicio',StopSign!)
End If

end event

event resize;/*******************************************************************************************************
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Jueves 3 de Febrero de 2005. Hora: 14:06:19
********************************************************************************************************/
// Overwrite!
//------------------------------------------------------------------------------------------------------

end event

type dw_report from w_report`dw_report within w_inf_sol_serv
integer x = 82
integer y = 108
integer width = 3337
integer height = 1312
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type cb_cancelar from u_cb_application within w_inf_sol_serv
integer x = 1390
integer y = 1484
integer taborder = 20
boolean bringtotop = true
string text = "&Cancelar"
end type

event clicked;call super::clicked;Close(Parent)
end event

type cb_print from u_cb_application within w_inf_sol_serv
integer x = 1769
integer y = 1484
integer taborder = 30
boolean bringtotop = true
string text = "&Imprimir"
end type

event clicked;call super::clicked;OpenWithParm(w_print,dw_report)
Close(Parent)
end event

type gb_ss from u_gb_base within w_inf_sol_serv
integer x = 32
integer y = 32
integer width = 3438
integer height = 1424
integer taborder = 20
string text = "Informe de solicitud de servicio"
end type

