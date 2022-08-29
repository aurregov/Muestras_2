HA$PBExportHeader$w_cambio_grupos.srw
forward
global type w_cambio_grupos from w_sheet
end type
type dw_grupo from u_dw_application within w_cambio_grupos
end type
type dw_tareas_grupo from u_dw_application within w_cambio_grupos
end type
type gb_1 from groupbox within w_cambio_grupos
end type
type gb_2 from groupbox within w_cambio_grupos
end type
end forward

global type w_cambio_grupos from w_sheet
integer width = 3630
integer height = 1508
string title = "Cambiar tareas de grupo"
dw_grupo dw_grupo
dw_tareas_grupo dw_tareas_grupo
gb_1 gb_1
gb_2 gb_2
end type
global w_cambio_grupos w_cambio_grupos

type variables
n_ds_application ids_turno_indiv,ids_actualizar_estado

end variables

forward prototypes
public function integer of_verificar_grupo (integer a_grupo, datetime a_fechahora1, datetime a_fechahora2)
public function integer of_actualizar_individual (long al_orden, long al_consec, long al_grupo)
public function integer of_actualizar_estado (long al_orden, long al_estado, long al_grupo, long al_grupo_nuevo)
public function integer of_cambiar_estado_registro (long ll_row)
end prototypes

public function integer of_verificar_grupo (integer a_grupo, datetime a_fechahora1, datetime a_fechahora2);Long ll_dia,ll_cant_colas,ll_n
Decimal{2} ld_horas
DateTime ldt_fecha_servidor
Time lt_hora_fin,lt_hora_inicio
String ls_usuario,ls_instancia
Boolean lb_hay_campo
n_ds_application lds_turno,lds_tareas_x_hora
n_cst_application_base luo_app_base

luo_app_base = Create n_cst_application_base

//DataStore usado para recuperar la hora de inicio y las horas del turno 
//asignado al grupo seleccionado en el dia actual
lds_turno = CREATE n_ds_application
lds_turno.of_load('d_detalle_turno')
lds_turno.of_conexion(n_cst_application.itr_appl,True)

//Recupera las tareas del grupo destino en el horario de la tarea a asignar 
//del grupo origen
lds_tareas_x_hora = CREATE n_ds_application
lds_tareas_x_hora.of_load('d_tareas_grupo_x_hora')
lds_tareas_x_hora.of_conexion(n_cst_application.itr_appl,True)

luo_app_base.of_selectserver(n_cst_application.itr_appl,ldt_fecha_servidor, &
                             ls_usuario,ls_instancia)

ll_dia = DayNumber(Date(ldt_fecha_servidor))

If lds_turno.Retrieve(a_grupo,ll_dia) <= 0 Then
	MessageBox('Advertencia','No se pudo recuperar la hora de inicio y  la duraci$$HEX1$$f300$$ENDHEX$$n' + &
	           ' del turno para el grupo')
   Return -1				  
End If

ll_cant_colas = lds_turno.GetItemNumber(1,'cantidad_colas')
If IsNull(ll_cant_colas) Then ll_cant_colas = 0
lt_hora_inicio = lds_turno.GetItemTime(1,'hora_inicio')
ld_horas = lds_turno.GetItemNumber(1,'horas')
lt_hora_fin = RelativeTime(lt_hora_inicio,Round(ld_horas * 3600,0))

//Verifica si el grupo puede realizar la tarea en el tiempo en que est$$HEX2$$e1002000$$ENDHEX$$disponible
If lt_hora_inicio > Time(a_fechahora1) Or lt_hora_fin < Time(a_fechahora2) Then
	MessageBox('Advertencia','Este grupo no puede realizar la tarea o actividad' + &
	           '~rporque la tarea esta programada en un horario en el cual' + &
				  '~rel grupo no est$$HEX2$$e1002000$$ENDHEX$$disponible',StopSign!)
	Return -2
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
If lds_tareas_x_hora.Retrieve(a_grupo,a_fechahora1,a_fechahora2) > 0 And ll_cant_colas > 0 Then
	For ll_n = 1 To ll_cant_colas
		lds_tareas_x_hora.SetFilter("cola_grupo = " + String(ll_n))
		lds_tareas_x_hora.Filter()
		If lds_tareas_x_hora.RowCount() = 0 Then 
			lb_hay_campo = True
			Exit
		End If
	Next
	
	If lb_hay_campo = False Then
		MessageBox('Advertencia','Este grupo no puede realizar la tarea porque no tiene' + &
		            '~rdisponibilidad en la cola de actividades',StopSign!)
		Return -3
	End If
	
End If



Return 1
end function

public function integer of_actualizar_individual (long al_orden, long al_consec, long al_grupo);n_ds_application lds_turno
dwItemStatus l_status

If Not IsValid(ids_turno_indiv) Then
	ids_turno_indiv = CREATE n_ds_application
	ids_turno_indiv.of_load('d_actualizar_grupo_individual')
	ids_turno_indiv.of_conexion(n_cst_application.itr_appl,True)
End If

lds_turno = CREATE n_ds_application
lds_turno.of_load('d_actualizar_grupo_individual')
lds_turno.of_conexion(n_cst_application.itr_appl,True)

If lds_turno.Retrieve(al_orden,al_consec) > 0 Then
   lds_turno.RowsCopy(1,1,Primary!,ids_turno_indiv, &
	                   ids_turno_indiv.RowCount() + 1,Primary!)
   ids_turno_indiv.SetItemStatus(ids_turno_indiv.RowCount(),0,Primary!,DataModified!)							 
	l_status = ids_turno_indiv.GetItemStatus(ids_turno_indiv.RowCount(),0,Primary!)
	ids_turno_indiv.SetItem(ids_turno_indiv.RowCount(),'co_grupo',al_grupo)
Else
	Return -1
End If

Destroy lds_turno

Return 1
end function

public function integer of_actualizar_estado (long al_orden, long al_estado, long al_grupo, long al_grupo_nuevo);Long ll_n
n_ds_application lds_mu_gantt

If Not IsValid(ids_actualizar_estado) Then
	ids_actualizar_estado = CREATE n_ds_application
	ids_actualizar_estado.of_load('d_actualizar_grupo_x_estado')
	ids_actualizar_estado.of_conexion(n_cst_application.itr_appl,True)
End If

lds_mu_gantt = CREATE n_ds_application
lds_mu_gantt.of_load('d_actualizar_grupo_x_estado')
lds_mu_gantt.of_conexion(n_cst_application.itr_appl,True)

If lds_mu_gantt.Retrieve(al_orden,al_estado,al_grupo) > 0 Then
	For ll_n = 1 To lds_mu_gantt.RowCount()
		lds_mu_gantt.RowsCopy(ll_n,ll_n,Primary!,ids_actualizar_estado, &
	                      ids_actualizar_estado.RowCount() + 1,Primary!)
      ids_actualizar_estado.SetItemStatus(ids_actualizar_estado.RowCount(),0, &
		                                    Primary!,DataModified!)								 
      ids_actualizar_estado.SetItem(ids_actualizar_estado.RowCount(), &
		                              'co_grupo',al_grupo_nuevo)								 
	Next   
Else
	Return -1
End If

Destroy lds_mu_gantt

Return 1
end function

public function integer of_cambiar_estado_registro (long ll_row);
dw_tareas_grupo.SetItemStatus(ll_row,0,Primary!,NotModified!)

Return 1
end function

on w_cambio_grupos.create
int iCurrent
call super::create
this.dw_grupo=create dw_grupo
this.dw_tareas_grupo=create dw_tareas_grupo
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_grupo
this.Control[iCurrent+2]=this.dw_tareas_grupo
this.Control[iCurrent+3]=this.gb_1
this.Control[iCurrent+4]=this.gb_2
end on

on w_cambio_grupos.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_grupo)
destroy(this.dw_tareas_grupo)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;
m_sheet.m_edicion.m_insertar.Enabled = False
m_sheet.m_edicion.m_clear.Enabled = False
m_sheet.m_ayuda.m_contenido.Enabled = False
m_sheet.m_archivo.m_imprimir.Enabled = False

dw_tareas_grupo.of_conexion(n_cst_application.itr_appl,True)
dw_grupo.InsertRow(0)
end event

event ue_save;call super::ue_save;long ll_row,ll_ret,ll_n,ll_nu_orden
Boolean lb_actualizar

If dw_tareas_grupo.RowCount() > 0 Then
	If dw_tareas_grupo.AcceptText() < 0 Then
		dw_tareas_grupo.SetFocus()
		Return
	End If
	ll_row = dw_tareas_grupo.GetNextModified(0,Primary!)
	If ll_row > 0 Then
		If dw_tareas_grupo.GetItemNumber(ll_row,'co_grupo') =  &
			dw_grupo.GetItemNumber(1,'an_co_grupo') Then
			ll_row = dw_tareas_grupo.GetNextModified(ll_row,Primary!)
		End If
	End If
	Do While ll_row > 0 
		If of_verificar_grupo(dw_tareas_grupo.GetItemNumber(ll_row,'co_grupo'), &
		                      dw_tareas_grupo.GetItemDateTime(ll_row,'f_mov_ini'),&
		                      dw_tareas_grupo.GetItemDateTime(ll_row,'f_mov_fin')) < 0 Then
			Return 
		End If
		
		ll_nu_orden = dw_tareas_grupo.Object.nu_orden[ll_row]
				
		If dw_tareas_grupo.GetItemNumber(ll_row,'nu_sol_serv') = 0 And &
			dw_tareas_grupo.GetItemNumber(ll_row,'cons_color') = 0 Then
			ll_ret = of_actualizar_estado(ll_nu_orden, &
													dw_tareas_grupo.GetItemNumber(ll_row,'co_estado'), &
													dw_grupo.GetItemNumber(1,'an_co_grupo'), &
													dw_tareas_grupo.GetItemNumber(ll_row,'co_grupo') )
		Else												
			ll_ret = of_actualizar_individual(ll_nu_orden, &
														 dw_tareas_grupo.GetItemNumber(ll_row,'consec'), &
														 dw_tareas_grupo.GetItemNumber(ll_row,'co_grupo') )
		End If
		
		If ll_ret < 0 Then
			MessageBox('Advertencia','Ocurri$$HEX2$$f3002000$$ENDHEX$$un error actualizando el grupo para la actividad', &
							StopSign!)
			Return 						
		End If
		
		ll_row = dw_tareas_grupo.GetNextModified(ll_row,Primary!)
		If ll_row > 0 Then
			If dw_tareas_grupo.GetItemNumber(ll_row,'co_grupo') =  &
				dw_grupo.GetItemNumber(1,'an_co_grupo') Then
				ll_row = dw_tareas_grupo.GetNextModified(ll_row,Primary!)
			End If
		End If
		
	Loop
	
	If IsValid(ids_turno_indiv) Then
		If ids_turno_indiv.Update() > 0 Then
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
	
	dw_tareas_grupo.Retrieve(dw_grupo.GetItemNumber(1,'an_co_grupo'))
		
	Destroy ids_turno_indiv
	Destroy ids_actualizar_estado
	
End If
end event

event ue_find;call super::ue_find;n_cst_param luo_parametros

Open(w_bus_grupo_act)
		
luo_parametros = Message.PowerObjectParm

If not IsValid(luo_parametros) Then Return 
	
dw_grupo.SetItem(1,'an_co_grupo',luo_parametros.il_vector[1])
dw_grupo.SetItem(1,'as_de_grupo',luo_parametros.is_vector[1])
dw_tareas_grupo.Retrieve(luo_parametros.il_vector[1])


end event

event closequery;call super::closequery;If dw_tareas_grupo.GetNextModified(0,Primary!) > 0 Then
	If MessageBox('Validaci$$HEX1$$f300$$ENDHEX$$n','Desea salir sin guardar los cambios ?.', &
	               Question!,YesNo!,1) = 2 Then
		Return 1
	Else
		Return 0
	End If			
End If
end event

type dw_grupo from u_dw_application within w_cambio_grupos
integer x = 55
integer y = 76
integer width = 3488
integer height = 180
string dataobject = "d_cod_descrip_grupo"
boolean vscrollbar = false
end type

event doubleclicked;call super::doubleclicked;n_cst_param luo_parametros

Choose Case dwo.Name
	Case 'an_co_grupo'
		Open(w_bus_grupo_act)
		
		luo_parametros = Message.PowerObjectParm
		
		If not IsValid(luo_parametros) Then Return -1
			
		This.SetItem(1,'an_co_grupo',luo_parametros.il_vector[1])
		This.SetItem(1,'as_de_grupo',luo_parametros.is_vector[1])
		dw_tareas_grupo.Retrieve(luo_parametros.il_vector[1])
End Choose
end event

event itemchanged;call super::itemchanged;n_cst_comun_orden luo_comun

Choose Case dwo.name
	Case 'an_co_grupo'
		If luo_comun.of_nombregrupoact(Long(Data),n_cst_application.itr_appl) > 0 Then
			This.SetItem(1,'as_de_grupo',luo_comun.of_getstring(1))
			dw_tareas_grupo.Retrieve(Long(Data))
		Else
			MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','El c$$HEX1$$f300$$ENDHEX$$digo del grupo no es v$$HEX1$$e100$$ENDHEX$$lido')
			Return 2
		End If
End Choose
end event

event itemfocuschanged;call super::itemfocuschanged;STRING columnname

columnname = dwo.Name

THIS.SetColumn( columnname )

THIS.SelectText( 1, 9999 )
end event

event itemerror;call super::itemerror;
Choose Case dwo.name
	Case 'an_co_grupo'
		This.SetText(String(This.GetItemNumber(row,'an_co_grupo')))
		Return 2
End Choose
end event

type dw_tareas_grupo from u_dw_application within w_cambio_grupos
integer x = 55
integer y = 356
integer width = 3497
integer height = 900
integer taborder = 20
string dataobject = "d_tareas_grupo_lista"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;call super::itemchanged;String ls_null
n_cst_comun_orden luo_comun

SetNull(ls_null)

Choose Case dwo.Name
	Case 'co_grupo'
		
		If Long(Data) = dw_grupo.GetItemNumber(1,'an_co_grupo')	Then
			This.SetItem(row,'de_grupo',dw_grupo.GetItemString(1,'as_de_grupo'))
			Post of_cambiar_estado_registro(row)
			Return -1
		End If
		
		If luo_comun.of_nombregrupoact(Long(Data),n_cst_application.itr_appl) > 0 Then
			If of_verificar_grupo(Long(Data),This.GetItemDateTime(Row,'f_mov_ini'),&
		                      This.GetItemDateTime(Row,'f_mov_fin')) < 0 Then
				Return 1
			End If
			This.SetItem(row,'de_grupo',luo_comun.of_getstring(1))
		Else
			MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','El c$$HEX1$$f300$$ENDHEX$$digo del grupo no es v$$HEX1$$e100$$ENDHEX$$lido')
			Return 1
		End If
		
End Choose
end event

event itemerror;call super::itemerror;
Choose Case dwo.name
	Case 'co_grupo'
		This.SetText(String(This.GetItemNumber(row,'co_grupo')))
		Return 2
End Choose


end event

event doubleclicked;call super::doubleclicked;n_cst_param luo_parametros

Choose Case dwo.Name
	Case 'co_grupo'
		Open(w_bus_grupo_act)
		luo_parametros = Message.PowerObjectParm
		If not IsValid(luo_parametros) Then
			Return -1
		End If
		This.SetText(String(luo_parametros.il_vector[1]))
		This.AcceptText()
		This.SetColumn('de_grupo')
End Choose
end event

event itemfocuschanged;call super::itemfocuschanged;STRING columnname

columnname = dwo.Name

THIS.SetColumn( columnname )

THIS.SelectText( 1, 9999 )

end event

type gb_1 from groupbox within w_cambio_grupos
integer x = 23
integer y = 8
integer width = 3570
integer height = 264
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grupo"
end type

type gb_2 from groupbox within w_cambio_grupos
integer x = 23
integer y = 288
integer width = 3570
integer height = 1000
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tareas Grupo"
end type

