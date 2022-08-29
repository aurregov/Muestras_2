HA$PBExportHeader$w_cambio_maq_tin.srw
forward
global type w_cambio_maq_tin from w_sheet
end type
type dw_tareas_maq_tin from u_dw_application within w_cambio_maq_tin
end type
type dw_maquina from u_dw_application within w_cambio_maq_tin
end type
type gb_1 from groupbox within w_cambio_maq_tin
end type
type gb_2 from groupbox within w_cambio_maq_tin
end type
end forward

global type w_cambio_maq_tin from w_sheet
integer width = 3630
integer height = 1500
string title = "Cambiar tareas de m$$HEX1$$e100$$ENDHEX$$quina de tintorer$$HEX1$$ed00$$ENDHEX$$a"
dw_tareas_maq_tin dw_tareas_maq_tin
dw_maquina dw_maquina
gb_1 gb_1
gb_2 gb_2
end type
global w_cambio_maq_tin w_cambio_maq_tin

type variables
Long il_co_maquina
n_ds_application ids_tarea_indiv,ids_actualizar_estado
end variables

forward prototypes
public function integer of_verificarmaquinatintoreria (integer a_fabrica, integer a_maquina, decimal a_peso, datetime a_fechahora1, datetime a_fechahora2)
public function integer of_actualizar_individual (long al_orden, long al_consec, long al_fabrica, long al_maquina)
public function integer of_actualizar_estado (long al_orden, long al_estado, long al_fabrica, long al_maquina, long al_fabrica_nueva, long al_maquina_nueva)
public function integer of_cambiar_estado_registro (long ll_row)
end prototypes

public function integer of_verificarmaquinatintoreria (integer a_fabrica, integer a_maquina, decimal a_peso, datetime a_fechahora1, datetime a_fechahora2);Long ll_cant_colas,ll_num_horas,ll_n
Time lt_hora_ini,lt_hora_fin
Boolean lb_hay_campo
Dec{3} ldec_peso_min,ldec_peso_max
n_ds_application lds_verificar_peso,lds_colas_x_maquina,lds_tareas_x_hora

//DataStore usado para verificar que el peso de la tarea o actividad
//pueda ser realizado por la m$$HEX1$$e100$$ENDHEX$$quina; debe estar en el rango de pesos de la m$$HEX1$$e100$$ENDHEX$$quina
lds_verificar_peso = CREATE n_ds_application
lds_verificar_peso.of_load('d_verificar_peso_tarea_maquina')
lds_verificar_peso.of_conexion(n_cst_application.itr_appl,True)

//DataStore usado para recuperar la cantidad de colas que tiene la m$$HEX1$$e100$$ENDHEX$$quina y el
//horario que tiene el dia que se consulta
lds_colas_x_maquina = CREATE n_ds_application
lds_colas_x_maquina.of_load('d_cant_colas_x_maquina')
lds_colas_x_maquina.of_conexion(n_cst_application.itr_appl,True)

//Recupera las tareas de la nueva m$$HEX1$$e100$$ENDHEX$$quina en el horario de la tarea a asignar 
//de la m$$HEX1$$e100$$ENDHEX$$quina actual
lds_tareas_x_hora = CREATE n_ds_application
lds_tareas_x_hora.of_load('d_tareas_maquina_x_hora')
lds_tareas_x_hora.of_conexion(n_cst_application.itr_appl,True)

If lds_verificar_peso.Retrieve(a_fabrica,a_maquina) <= 0 Then
	MessageBox('Advertencia','Error verificando rango de pesos de la m$$HEX1$$e100$$ENDHEX$$quina ' + &
	           String(a_fabrica) + " " + String(a_maquina),StopSign!)
   Return -1				  
End If

ldec_peso_min = lds_verificar_peso.GetItemNumber(1,'peso_min')
ldec_peso_max = lds_verificar_peso.GetItemNumber(1,'peso_max')

//Si el peso de la tarea puede ser atendido por la m$$HEX1$$e100$$ENDHEX$$quina
If ldec_peso_max >= a_peso And ldec_peso_min <= a_peso  Then
	//Determina la cantidad de colas de la m$$HEX1$$e100$$ENDHEX$$quina
	If lds_colas_x_maquina.Retrieve(a_fabrica,a_maquina) > 0 Then
		ll_cant_colas = lds_colas_x_maquina.GetItemNumber(1,'cantidad_colas')
		lt_hora_ini = lds_colas_x_maquina.GetItemTime(1,'hora_inicio')
		ll_num_horas = lds_colas_x_maquina.GetItemNumber(1,'nu_horas')
		lt_hora_fin = RelativeTime(lt_hora_ini,ll_num_horas * 3600)
		
		//Verifica si la m$$HEX1$$e100$$ENDHEX$$quina puede realizar la tarea en el tiempo en que est$$HEX2$$e1002000$$ENDHEX$$disponible
		If lt_hora_ini > Time(a_fechahora1) Or lt_hora_fin < Time(a_fechahora2) Then
			MessageBox('Advertencia','Esta m$$HEX1$$e100$$ENDHEX$$quina no puede realizar la tarea o actividad' + &
						  '~rporque la tarea esta programada en un horario en el cual' + &
						  '~rla m$$HEX1$$e100$$ENDHEX$$quina no est$$HEX2$$e1002000$$ENDHEX$$disponible' + &
						  '~rHorario tarea: ' + String(Time(a_fechahora1)) + ' ' +  &
						                        String(Time(a_fechahora2)) + &
						  '~rHorario m$$HEX1$$e100$$ENDHEX$$quina: ' + String(lt_hora_ini) + ' ' + String(lt_hora_fin),StopSign!)
			Return -3
		End If
		
		//Recupera los registros de mu_gantt con las siguientes condiciones
		//h1: hora inicio tarea
		//h2: hora fin tarea
		//p1: hora inicio tarea programada
		//p2: hora fin tarea programada
		//p1 <= h1 y p2 >= h2      p1-h1-h2-p2
		//p1 <= h1 y p2 >= h1      p1-h1-p2-h2
		//p1 >= h1 y p2 <= h2      h1-p1-p2-h2
		//p1 <= h2 y p2 >= h2      h1-p1-h2-p2
		If lds_tareas_x_hora.Retrieve(a_fabrica,a_maquina,a_fechahora1,a_fechahora2) > 0 Then
			For ll_n = 1 To ll_cant_colas
				lds_tareas_x_hora.SetFilter("cola_tin = " + String(ll_n))
				lds_tareas_x_hora.Filter()
				If lds_tareas_x_hora.RowCount() = 0 Then 
					lb_hay_campo = True
					Exit
				End If
			Next
			
			If lb_hay_campo = False Then
				MessageBox('Advertencia','Esta m$$HEX1$$e100$$ENDHEX$$quina no puede realizar la tarea porque no tiene' + &
								'~rdisponibilidad en la cola de actividades',StopSign!)
				Return -4
			End If
			
		End If
		
	Else
		MessageBox('Advertencia','No se pudo recuperar la cantidad de colas para la m$$HEX1$$e100$$ENDHEX$$quina',StopSign!)
		Return -2
	End If
Else
	MessageBox('Advertencia','La tarea no puede ser actualizada porque' + &
	           '~rsu peso no est$$HEX2$$e1002000$$ENDHEX$$en el rango de pesos de la m$$HEX1$$e100$$ENDHEX$$quina' + &
				  '~rpeso min:' + String(ldec_peso_min) + ' peso max: ' + String(ldec_peso_max), &
				  StopSign!)
	Return -1				  
End If

Return 1
end function

public function integer of_actualizar_individual (long al_orden, long al_consec, long al_fabrica, long al_maquina);n_ds_application lds_tarea_x_maq
dwItemStatus l_status

If Not IsValid(ids_tarea_indiv) Then
	ids_tarea_indiv = CREATE n_ds_application
	ids_tarea_indiv.of_load('d_actualizar_maquina_individual')
	ids_tarea_indiv.of_conexion(n_cst_application.itr_appl,True)
End If

lds_tarea_x_maq = CREATE n_ds_application
lds_tarea_x_maq.of_load('d_actualizar_maquina_individual')
lds_tarea_x_maq.of_conexion(n_cst_application.itr_appl,True)

If lds_tarea_x_maq.Retrieve(al_orden,al_consec) > 0 Then
   lds_tarea_x_maq.RowsCopy(1,1,Primary!,ids_tarea_indiv, &
	                   ids_tarea_indiv.RowCount() + 1,Primary!)
   ids_tarea_indiv.SetItemStatus(ids_tarea_indiv.RowCount(),0,Primary!,DataModified!)							 
	l_status = ids_tarea_indiv.GetItemStatus(ids_tarea_indiv.RowCount(),0,Primary!)
	ids_tarea_indiv.SetItem(ids_tarea_indiv.RowCount(),'co_fabrica',al_fabrica)
	ids_tarea_indiv.SetItem(ids_tarea_indiv.RowCount(),'cs_maquina',al_maquina)
Else
	Return -1
End If

Destroy lds_tarea_x_maq

Return 1
end function

public function integer of_actualizar_estado (long al_orden, long al_estado, long al_fabrica, long al_maquina, long al_fabrica_nueva, long al_maquina_nueva);Long ll_n
n_ds_application lds_mu_gantt

If Not IsValid(ids_actualizar_estado) Then
	ids_actualizar_estado = CREATE n_ds_application
	ids_actualizar_estado.of_load('d_actualizar_maquina_x_estado')
	ids_actualizar_estado.of_conexion(n_cst_application.itr_appl,True)
End If

lds_mu_gantt = CREATE n_ds_application
lds_mu_gantt.of_load('d_actualizar_maquina_x_estado')
lds_mu_gantt.of_conexion(n_cst_application.itr_appl,True)

If lds_mu_gantt.Retrieve(al_orden,al_estado,al_fabrica,al_maquina) > 0 Then
	For ll_n = 1 To lds_mu_gantt.RowCount()
		lds_mu_gantt.RowsCopy(ll_n,ll_n,Primary!,ids_actualizar_estado, &
	                      ids_actualizar_estado.RowCount() + 1,Primary!)
      ids_actualizar_estado.SetItemStatus(ids_actualizar_estado.RowCount(),0, &
		                                    Primary!,DataModified!)
      ids_actualizar_estado.SetItem(ids_actualizar_estado.RowCount(), &
		                              'co_fabrica',al_fabrica_nueva)														
      ids_actualizar_estado.SetItem(ids_actualizar_estado.RowCount(), &
		                              'cs_maquina',al_maquina_nueva)								 
	Next   
Else
	Return -1
End If

Destroy lds_mu_gantt

Return 1
end function

public function integer of_cambiar_estado_registro (long ll_row);
dw_tareas_maq_tin.SetItemStatus(ll_row,0,Primary!,NotModified!)

Return 1
end function

on w_cambio_maq_tin.create
int iCurrent
call super::create
this.dw_tareas_maq_tin=create dw_tareas_maq_tin
this.dw_maquina=create dw_maquina
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_tareas_maq_tin
this.Control[iCurrent+2]=this.dw_maquina
this.Control[iCurrent+3]=this.gb_1
this.Control[iCurrent+4]=this.gb_2
end on

on w_cambio_maq_tin.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_tareas_maq_tin)
destroy(this.dw_maquina)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event ue_save;call super::ue_save;long ll_row,ll_ret,ll_n
Boolean lb_actualizar

If dw_tareas_maq_tin.RowCount() > 0 Then
	If dw_tareas_maq_tin.AcceptText() < 0 Then
		dw_tareas_maq_tin.SetFocus()
	End If
	ll_row = dw_tareas_maq_tin.GetNextModified(0,Primary!)
	If ll_row > 0 Then
		If dw_tareas_maq_tin.GetItemNumber(ll_row,'co_fabrica') = dw_maquina.GetItemNumber(1,'an_co_fabrica') And &
		   dw_tareas_maq_tin.GetItemNumber(ll_row,'cs_maquina') = dw_maquina.GetItemNumber(1,'an_co_maquina') Then
			ll_row = dw_tareas_maq_tin.GetNextModified(ll_row,Primary!)
		End If
	End If
	Do While ll_row > 0 
		If of_verificarmaquinatintoreria(dw_tareas_maq_tin.GetItemNumber(ll_row,'co_fabrica'), &
									 dw_tareas_maq_tin.GetItemNumber(ll_row,'cs_maquina'), &
		                      dw_tareas_maq_tin.GetItemNumber(ll_row,'ca_kilos'), &
									 dw_tareas_maq_tin.GetItemDateTime(ll_row,'f_mov_ini'),&
									 dw_tareas_maq_tin.GetItemDateTime(ll_row,'f_mov_fin')) < 0 Then
			Return 
		End If
				
		If dw_tareas_maq_tin.GetItemNumber(ll_row,'nu_sol_serv') = 0 And &
			dw_tareas_maq_tin.GetItemNumber(ll_row,'cons_color') = 0 Then
			ll_ret = of_actualizar_estado(dw_tareas_maq_tin.GetItemNumber(ll_row,'nu_orden'), &
													dw_tareas_maq_tin.GetItemNumber(ll_row,'co_estado'), &
													dw_maquina.GetItemNumber(1,'an_co_fabrica'), &
													dw_maquina.GetItemNumber(1,'an_co_maquina'), &
													dw_tareas_maq_tin.GetItemNumber(ll_row,'co_fabrica'), &
													dw_tareas_maq_tin.GetItemNumber(ll_row,'cs_maquina') )
		Else												
			ll_ret = of_actualizar_individual(dw_tareas_maq_tin.GetItemNumber(ll_row,'nu_orden'), &
														 dw_tareas_maq_tin.GetItemNumber(ll_row,'consec'), &
														 dw_tareas_maq_tin.GetItemNumber(ll_row,'co_fabrica'), &
														 dw_tareas_maq_tin.GetItemNumber(ll_row,'cs_maquina') )
		End If
		
		If ll_ret < 0 Then
			MessageBox('Advertencia','Ocurri$$HEX2$$f3002000$$ENDHEX$$un error actualizando la m$$HEX1$$e100$$ENDHEX$$quina para la actividad', &
							StopSign!)
			Return 						
		End If
		
		ll_row = dw_tareas_maq_tin.GetNextModified(ll_row,Primary!)
		If ll_row > 0 Then
		If dw_tareas_maq_tin.GetItemNumber(ll_row,'co_fabrica') = dw_maquina.GetItemNumber(1,'an_co_fabrica') And &
		   dw_tareas_maq_tin.GetItemNumber(ll_row,'cs_maquina') = dw_maquina.GetItemNumber(1,'an_co_maquina') Then
			ll_row = dw_tareas_maq_tin.GetNextModified(ll_row,Primary!)
		End If
	End If
		
	Loop
	
	If IsValid(ids_tarea_indiv) Then
		If ids_tarea_indiv.Update() > 0 Then
			lb_actualizar = True
		Else
			RollBack Using n_cst_application.itr_appl;
			MessageBox('Advertencia','Ocurri$$HEX2$$f3002000$$ENDHEX$$un error actualizando las actividades',StopSign!)
			Return
		End If
	End If
	
	If IsValid(ids_actualizar_estado) Then
		
		If ids_actualizar_estado.Update() > 0 Then
			lb_actualizar = True
		Else
			RollBack Using n_cst_application.itr_appl;
			MessageBox('Advertencia','Ocurri$$HEX2$$f3002000$$ENDHEX$$un error actualizando las actividades',StopSign!)
			Return
		End If
	End If
	
	If lb_actualizar Then
		Commit Using n_cst_application.itr_appl;
		MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','Se han actualizado con $$HEX1$$e900$$ENDHEX$$xito las actividades')
	End If
	
	dw_tareas_maq_tin.Retrieve(dw_maquina.GetItemNumber(1,'an_co_fabrica'), &
	                           dw_maquina.GetItemNumber(1,'an_co_maquina'))
		
	Destroy ids_tarea_indiv
	Destroy ids_actualizar_estado
	
End If
end event

event open;call super::open;
m_sheet.m_edicion.m_insertar.Enabled = False
m_sheet.m_edicion.m_clear.Enabled = False
m_sheet.m_ayuda.m_contenido.Enabled = False
m_sheet.m_archivo.m_imprimir.Enabled = False
dw_tareas_maq_tin.of_conexion(n_cst_application.itr_appl,True)
dw_maquina.InsertRow(0)
end event

event ue_find;call super::ue_find;n_cst_param luo_parametros

Open(w_opc_maq_tin)

luo_parametros = Message.PowerObjectParm

If not IsValid(luo_parametros) Then Return
	
dw_maquina.SetItem(1,'an_co_maquina',luo_parametros.il_vector[1])
dw_maquina.SetItem(1,'as_de_maquina',luo_parametros.is_vector[1])
dw_tareas_maq_tin.Retrieve(luo_parametros.il_vector[1])
end event

event closequery;call super::closequery;
If dw_tareas_maq_tin.GetNextModified(0,Primary!) > 0 Then
	If MessageBox('Validaci$$HEX1$$f300$$ENDHEX$$n','Desea salir sin guardar los cambios ?.', &
	               Question!,YesNo!,1) = 2 Then
		Return 1
	Else
		Return 0
	End If			
End If
end event

type dw_tareas_maq_tin from u_dw_application within w_cambio_maq_tin
integer x = 64
integer y = 360
integer width = 3474
integer height = 880
integer taborder = 20
string dataobject = "d_tareas_maq_tin_lista"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;call super::itemchanged;Long ll_null
String ls_de_maq
n_cst_comun_orden luo_comun

SetNull(ll_null)
il_co_maquina = This.GetItemNumber(row,'cs_maquina')

Choose Case dwo.Name
	Case 'cs_maquina'
		
		If This.GetItemNumber(row,'co_fabrica') = dw_maquina.GetItemNumber(1,'an_co_fabrica') And &
		   Long(Data) = dw_maquina.GetItemNumber(1,'an_co_maquina') Then
			This.SetItem(row,'de_maq_tin',dw_maquina.GetItemString(1,'as_de_maquina'))
			Post of_cambiar_estado_registro(row)
			Return -1
		End If
		
		If luo_comun.of_nombremaqtin(This.GetItemNumber(row,'co_fabrica'), &
		                             Long(Data),n_cst_application.itr_appl) > 0 Then
//			ls_de_maq = This.GetItemString(row,'de_maq_tin')								  
         			
			If Long(Data) = dw_maquina.GetItemNumber(1,'an_co_maquina')	Then Return -1
			
			If of_verificarmaquinatintoreria(This.GetItemNumber(row,'co_fabrica'), &
														Long(Data),This.GetItemNumber(Row,'ca_kilos'), &
														This.GetItemDateTime(Row,'f_mov_ini'),&
														This.GetItemDateTime(Row,'f_mov_fin')) < 0 Then
//            This.SetItem(row,'cs_maquina',ll_null)														
//            This.SetItem(row,'de_maq_tin','')
					
				Return 2
			End If
			This.SetItem(row,'de_maq_tin',luo_comun.of_getstring(1))
		Else
			MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','El consecutivo de la m$$HEX1$$e100$$ENDHEX$$quina no es v$$HEX1$$e100$$ENDHEX$$lido')
			This.Post SetColumn(String(dwo.name))
			Return 2
		End If
		
	Case 'co_fabrica'
		This.SetItem(row,'cs_maquina',ll_null)
		This.SetItem(row,'de_maq_tin','')
//		If Not IsNull(This.GetItemNumber(row,'cs_maquina')) Or &
//		   This.GetItemNumber(row,'cs_maquina') <> 0 Then
//			If luo_comun.of_nombremaqtin(Long(Data),This.GetItemNumber(row,'cs_maquina'), &
//											     n_cst_application.itr_appl) > 0 Then
//				This.SetItem(row,'de_maq_tin',luo_comun.of_getstring(1))
//			Else
//				MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','El consecutivo de la m$$HEX1$$e100$$ENDHEX$$quina no es v$$HEX1$$e100$$ENDHEX$$lido')
//				Return 2
//			End If
//		End If
		
End Choose
end event

event itemerror;call super::itemerror;
Choose Case dwo.name
	Case 'cs_maquina'
		This.SetText(String(il_co_maquina))
		Return 3
End Choose
end event

event doubleclicked;call super::doubleclicked;Long ll_null
n_cst_param luo_parametros

SetNull(ll_null)

Choose Case dwo.Name
	Case 'cs_maquina','co_fabrica'
		Open(w_opc_maq_tin)
		
		luo_parametros = Message.PowerObjectParm
		
		If not IsValid(luo_parametros) Then Return 0
		If of_verificarmaquinatintoreria(luo_parametros.il_vector[1], &
													luo_parametros.il_vector[2], &
													This.GetItemNumber(Row,'ca_kilos'), &
													This.GetItemDateTime(Row,'f_mov_ini'),&
													This.GetItemDateTime(Row,'f_mov_fin')) < 0 Then
//			This.SetItem(row,'cs_maquina',ll_null)														
//			This.SetItem(row,'de_maq_tin','')														
			Return 2
		End If
		
		This.SetItem(row,'co_fabrica',luo_parametros.il_vector[1])
		This.SetItem(row,'cs_maquina',luo_parametros.il_vector[2])
		This.SetItem(row,'de_maq_tin',luo_parametros.is_vector[1])
End Choose
end event

event itemfocuschanged;call super::itemfocuschanged;STRING columnname

columnname = dwo.Name

THIS.SetColumn( columnname )

THIS.SelectText( 1, 9999 )
end event

type dw_maquina from u_dw_application within w_cambio_maq_tin
integer x = 64
integer y = 72
integer width = 3461
integer height = 172
boolean bringtotop = true
string dataobject = "d_cod_descrip_maquina"
boolean vscrollbar = false
end type

event doubleclicked;call super::doubleclicked;n_cst_param luo_parametros

Choose Case dwo.Name
	Case 'an_co_maquina','an_co_fabrica'
		Open(w_opc_maq_tin)
		
		luo_parametros = Message.PowerObjectParm
		
		If not IsValid(luo_parametros) Then Return -1
		
		This.SetItem(1,'an_co_fabrica',luo_parametros.il_vector[1])
		This.SetItem(1,'an_co_maquina',luo_parametros.il_vector[2])
		This.SetItem(1,'as_de_maquina',luo_parametros.is_vector[1])
		dw_tareas_maq_tin.Retrieve(luo_parametros.il_vector[1],luo_parametros.il_vector[2])
End Choose
end event

event itemchanged;call super::itemchanged;n_cst_comun_orden luo_comun

Choose Case dwo.name
	Case 'an_co_maquina'
		If luo_comun.of_nombremaqtin(This.GetItemNumber(row,'an_co_fabrica'), &
											  Long(Data),n_cst_application.itr_appl) > 0 Then
			This.SetItem(1,'as_de_maquina',luo_comun.of_getstring(1))
			dw_tareas_maq_tin.Retrieve(This.GetItemNumber(row,'an_co_fabrica'),Long(Data))
		Else
			MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','El consecutivo de la m$$HEX1$$e100$$ENDHEX$$quina no es v$$HEX1$$e100$$ENDHEX$$lido')
			This.Post SetColumn(String(dwo.name))
			Return 2
		End If
		
	Case 'an_co_fabrica'
		If data = '0' Then
			MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','Debe ingresar un C$$HEX1$$f300$$ENDHEX$$digo de F$$HEX1$$e100$$ENDHEX$$brica')
			Return 2
		End If
		If Not IsNull(This.GetItemNumber(row,'an_co_maquina')) Or &
		   This.GetItemNumber(row,'an_co_maquina') <> 0 Then
			If luo_comun.of_nombremaqtin(Long(Data),This.GetItemNumber(row,'an_co_maquina'), &
											     n_cst_application.itr_appl) > 0 Then
				This.SetItem(1,'as_de_maquina',luo_comun.of_getstring(1))
				dw_tareas_maq_tin.Retrieve(Long(Data),This.GetItemNumber(row,'an_co_maquina'))
			Else
				MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','El consecutivo de la m$$HEX1$$e100$$ENDHEX$$quina no es v$$HEX1$$e100$$ENDHEX$$lido')
				Return 2
			End If
		End If
End Choose
end event

event itemfocuschanged;call super::itemfocuschanged;STRING columnname

columnname = dwo.Name

THIS.SetColumn( columnname )

THIS.SelectText( 1, 9999 )


end event

event itemerror;Long ll_null

SetNull(ll_null)

Choose Case dwo.name
	Case 'an_co_maquina','an_co_fabrica'
		If Long(Data) = 0 Then
//			This.SetItem(row,String(dwo.Name),ll_null)
		   This.SetItem(row,'as_de_maquina','')
		   dw_tareas_maq_tin.Reset()
			If String(dwo.Name) = 'an_co_fabrica' Then
				This.SetItem(row,'an_co_maquina',ll_null)
			End If
//			This.Post SetColumn(String(dwo.Name))
//			Return 1		
		End If
End Choose
end event

type gb_1 from groupbox within w_cambio_maq_tin
integer x = 27
integer y = 8
integer width = 3561
integer height = 276
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "M$$HEX1$$e100$$ENDHEX$$quina"
end type

type gb_2 from groupbox within w_cambio_maq_tin
integer x = 27
integer y = 292
integer width = 3561
integer height = 984
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tareas M$$HEX1$$e100$$ENDHEX$$quina"
end type

