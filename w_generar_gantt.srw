HA$PBExportHeader$w_generar_gantt.srw
$PBExportComments$Window Class para la generaci$$HEX1$$f300$$ENDHEX$$n del gantt para las $$HEX1$$f300$$ENDHEX$$rdenes de producci$$HEX1$$f300$$ENDHEX$$n
forward
global type w_generar_gantt from w_sheet
end type
type hpb_conteo from u_hpb_base_prog within w_generar_gantt
end type
type cb_seleccion from u_cb_application within w_generar_gantt
end type
type cb_generar from u_cb_application within w_generar_gantt
end type
type dw_tareas from u_dw_application within w_generar_gantt
end type
type dw_ordenes from u_dw_application within w_generar_gantt
end type
type gb_ordenes from u_gb_base within w_generar_gantt
end type
type gb_generar from u_gb_base within w_generar_gantt
end type
end forward

global type w_generar_gantt from w_sheet
string tag = "Generaci$$HEX1$$f300$$ENDHEX$$n de Gantt"
integer width = 3511
integer height = 2160
string title = "Generaci$$HEX1$$f300$$ENDHEX$$n de Gantt"
boolean maxbox = true
hpb_conteo hpb_conteo
cb_seleccion cb_seleccion
cb_generar cb_generar
dw_tareas dw_tareas
dw_ordenes dw_ordenes
gb_ordenes gb_ordenes
gb_generar gb_generar
end type
global w_generar_gantt w_generar_gantt

type variables
/*******************************************************************************************************
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Mi$$HEX1$$e900$$ENDHEX$$rcoles 27 de Enero de 2005. Hora: 11:46:40
********************************************************************************************************/
//VARIABLE DECLARATION
PRIVATE:
	String 					is_where,is_vec[],is_directory,is_name_file
	n_ds_application		ids_tareas,ids_recursos_tarea,ids_recursos_lista,ids_rec_tar_rep
	Long 						il_grupo,il_cont
	n_cst_gantt				iuo_gantt
end variables

forward prototypes
public function integer of_recuperar ()
public function integer of_generargantt ()
public function integer of_addrecursotarea (long al_orden)
public function integer of_addrecurso (string as_co_recurso, string as_de_recurso)
public function integer of_win_yield ()
end prototypes

public function integer of_recuperar ();/*******************************************************************************************************
* PROC./FUNC.: of_recuperar
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	Esta es la funci$$HEX1$$f300$$ENDHEX$$n que recupera los datos con los que se va a generar el Gantt, 
					Se van a tener dos tipos destacados en esta consulta
					1. Se muestran las $$HEX1$$f300$$ENDHEX$$rdenes especificadas con todas sus tareas
					2. Se van a mostrar solo las tareas de un grupo, es decir se filtran las ordenes del grupo
					y luego en las tareas de estas ordenes solo las relacionadas con el grupo
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Mi$$HEX1$$e900$$ENDHEX$$rcoles 27 de Enero de 2005. Hora: 11:46:40
********************************************************************************************************/
//VARIABLE DECLARATION
String ls_condicion,ls_select_ini
Long ll_res
Boolean ib_out
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
If IsNull(il_grupo) AND IsNull(is_where) Then
	MessageBox('Advertencia','No hay criterios en el parametro del filtro',StopSign!)
	Return -1
End If
//------------------------------------------------------------------------------------------------------
If Not IsNull(il_grupo) Then
			This.Title='Generaci$$HEX1$$f300$$ENDHEX$$n de Gantt - Grupo '+is_vec[1]
			dw_ordenes.of_load('d_ordenes_grupo')
			//dw_tareas.of_load('d_tareas_orden_grupo')
			ids_tareas.of_load('d_tareas_orden_grupo')
			dw_ordenes.of_conexion(n_cst_application.itr_appl,True)
			//dw_tareas.of_conexion(n_cst_application.itr_appl,True)			
			ids_tareas.of_conexion(n_cst_application.itr_appl,True)			
			ll_res=dw_ordenes.Retrieve(il_grupo)
			Choose Case ll_res
				Case Is < 0
						MessageBox('Advertencia','Error en la solicitud de las $$HEX1$$f300$$ENDHEX$$rdenes para el grupo # '+String(il_grupo),StopSign!)
						ib_out=True
				Case 0
						MessageBox('Advertencia','No se encontraron $$HEX1$$f300$$ENDHEX$$rdenes asignadas para el grupo # '+String(il_grupo),StopSign!)
						ib_out=True
			End Choose			
Else
			This.Title='Generaci$$HEX1$$f300$$ENDHEX$$n de Gantt'
			dw_ordenes.of_load('d_ordenes_criterio')
			//dw_tareas.of_load('d_tareas_orden')
			ids_tareas.of_load('d_tareas_orden')
			dw_ordenes.of_conexion(n_cst_application.itr_appl,True)			
			//dw_tareas.of_conexion(n_cst_application.itr_appl,True)
			ids_tareas.of_conexion(n_cst_application.itr_appl,True)
			ls_select_ini=Trim(dw_ordenes.Describe('DataWindow.Table.Select'))
			ls_select_ini += is_where
			dw_ordenes.Modify("DataWindow.Table.Select='"+ls_select_ini+"'")			
			ll_res=dw_ordenes.Retrieve()
			Choose Case ll_res
				Case Is < 0
						MessageBox('Advertencia','Error en la solicitud de las $$HEX1$$f300$$ENDHEX$$rdenes para el criterio establecido',StopSign!)
						ib_out=True
				Case 0
						MessageBox('Advertencia','No se encontraron $$HEX1$$f300$$ENDHEX$$rdenes asignadas para el criterio establecido',StopSign!)
						ib_out=True
			End Choose
End If
If ib_out Then
		dw_ordenes.of_load('')
		dw_tareas.of_load('')
		cb_generar.Enabled=False
		cb_seleccion.Enabled=False
		Return -1
Else
		cb_generar.Enabled=True
		cb_seleccion.Enabled=True
End If
//------------------------------------------------------------------------------------------------------
Return 1
//END SCRIPT------------------------------------------------------------------------------------------------------

end function

public function integer of_generargantt ();/*******************************************************************************************************
* PROC./FUNC.: of_generarGantt
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	Esta es la funci$$HEX1$$f300$$ENDHEX$$n que genera el archivo XML
					Para cada una de las $$HEX1$$f300$$ENDHEX$$rdenes se recuperan todas las tareas en un caso, 
					y las tareas de un grupo en caso de que el criterio especificado sea por grupo.
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Mi$$HEX1$$e900$$ENDHEX$$rcoles 27 de Enero de 2005. Hora: 11:46:40
*******************************************************************************************************/
//VARIABLE DECLARATION
Integer 	li_FileNum,li_duracion,li_save,li_ret
Long 		ll_rows,ll_i,ll_orden,ll_res,ll_linea,ll_muestra,ll_fabrica,&
			ll_pos_max_fefin,ll_pos_min_feini,ll_j,ll_k,ll_pos,ll_minutos
String 	ls_directorio,ls_encabezado,ls_name_orden,ls_encabezado_orden,ls_detalle_orden,&
			ls_cliente,ls_ejecutiva,ls_desarrollador,ls_color,ls_id,ls_desc_tarea,ls_name_tarea,&
			ls_recurso,ls_recursos_total,ls_allocations_total,ls_allocation
DateTime	ldtm_max_fefin,ldtm_min_feini,ldtm_feini_tarea,ldtm_fefin_tarea

String   ls_condicion,ls_colortask, ls_ssTask,ls_cualColor
long		ll_condicion,ll_cons_color,ll_color,ll_ss
String   ls_deMuestra, ls_nota_fecha
//Decimal{2} lde_load
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
is_directory=''
is_name_file=''
//------------------------------------------------------------------------------------------------------
ll_rows=dw_ordenes.RowCount()
If dw_ordenes.RowCount()<=0 Then
	Return -1
End If
il_cont++
//------------------------------------------------------------------------------------------------------
//ls_directorio=GetCurrentDirectory()
//ls_directorio=n_cst_application.Of_GetProFile(n_cst_application.is_pathfileconf,&
//					n_cst_application.is_sessionapp,"GANTT_FILE")
//If ls_directorio="" Then
//	ls_directorio=GetCurrentDirectory()		
//End If
//If Right(ls_directorio,1)<>'\' Then
//		ls_directorio+='\'
//End If
//If Not DirectoryExists(ls_directorio) Then
//		MessageBox('Advertencia','El directorio '+ls_directorio+' no existe para almacernar el archivo del Gantt, Deber$$HEX1$$ed00$$ENDHEX$$a configurar correctamente un directorio v$$HEX1$$e100$$ENDHEX$$lido en el archivo de iniciaci$$HEX1$$f300$$ENDHEX$$n '+&
//						GetCurrentDirectory()+'\'+n_cst_application.is_pathfileconf+' en la secci$$HEX1$$f300$$ENDHEX$$n [proceso], variable PATHFILE',StopSign!)
//		Return -1	
//End If
//
n_cst_file_application lo_1

ls_directorio=lo_1.of_gettempdirectory()

//n_cst_application.Of_GetProFile(n_cst_application.is_pathfileconf,&
//					n_cst_application.is_sessionapp,"HTMLFOLDER")

If ls_directorio="" Or IsNull(ls_directorio) Then
	MessageBox("Advertencia!","No se puede generar el archivo.",StopSign!)
	Return -1

	//ls_directorio=GetCurrentDirectory()		
End If


//is_name_file="Gantt."+String(Today(), "(dd-mm-yyyy)(hh-mm)")+"."+String(il_cont)+".xml"
is_name_file="Gantt.xml"
is_directory=ls_directorio
ls_directorio+=is_name_file
li_FileNum = FileOpen(ls_directorio,LineMode!, Write!, LockWrite!,Replace!)
If IsNull(li_FileNum) OR li_FileNum<=0 Then
	MessageBox('Advertencia','Error en la apertura del archivo del Gantt en '+ls_directorio,StopSign!)
	Return -1
End If
//------------------------------------------------------------------------------------------------------
//******************************************************************************************************
//Se genera la parte del encabezado del archivo
ls_encabezado=	'<?xml version="1.0" encoding="windows-1252"?>~n'+&
					'<project name="nuevo" company="nuevo" webLink="no" view-date="'+String(Today(),'dd/mm/yyyy')+'" view-zoom="1" version="1.11 Preview 1">~n'+&
					'<!-- -->    <description> no </description>~n'+&
					'<tasks color="#8cb6ce">~n'//+n&
//******************************************************************************************************
li_save = FileWrite(li_FileNum,ls_encabezado)
If li_save<0 Then
	MessageBox('Advertencia','Error en la inserci$$HEX1$$f300$$ENDHEX$$n de la informaci$$HEX1$$f300$$ENDHEX$$n del encabezado principal, en el archivo localizado en '+ls_directorio,StopSign!)
	Return -1
End If
//******************************************************************************************************
//************************************
If of_win_yield () <> 1 Then 
		If FileClose(li_FileNum)<>1 Then
				MessageBox(	'Advertencia','Error en la clausura del archivo en '+ls_directorio,StopSign!)									
		End If
		Return -3
End If
//************************************
//Se resetean los valores de los recursos para las $$HEX1$$f300$$ENDHEX$$rdenes
ids_recursos_lista.Reset()
ids_recursos_tarea.Reset()
//Ciclo que recorre las $$HEX1$$f300$$ENDHEX$$rdenes
For ll_i=1 To ll_rows			
	ll_orden=dw_ordenes.GetItemNumber(ll_i,'nu_orden')
	If Not IsNull(il_grupo) Then
			ll_res=ids_tareas.Retrieve(ll_orden,il_grupo)
	Else
			ll_res=ids_tareas.Retrieve(ll_orden)
	End If
	Choose Case ll_res
		Case Is < 0
				MessageBox('Advertencia','Error en la consulta de las tareas para la orden # '+String(ll_orden),StopSign!)
				Return -1			
	End Choose	
	
	If ll_res=0 Then
		continue
	End If
	
	//************************************
	If of_win_yield () <> 1 Then 
			If FileClose(li_FileNum)<>1 Then
					MessageBox(	'Advertencia','Error en la clausura del archivo en '+ls_directorio,StopSign!)									
			End If
			Return -3
	End If
	//************************************
	//------------------------------------------------------------------------------------------------------			
	//*****DATOS DE LA ORDEN + TAREA**********************************
	ll_fabrica=dw_ordenes.GetItemNumber(ll_i,'co_fabrica')
	ll_linea=dw_ordenes.GetItemNumber(ll_i,'co_linea')
	ll_muestra=dw_ordenes.GetItemNumber(ll_i,'co_muestra')
	ls_cliente=dw_ordenes.GetItemString(ll_i,'de_cliente')
	ls_cliente=iuo_gantt.of_caracter_especial(ls_cliente)
	ls_ejecutiva=dw_ordenes.GetItemString(ll_i,'de_ejecutiva')
	ls_ejecutiva=iuo_gantt.of_caracter_especial(ls_ejecutiva)
	ls_desarrollador=dw_ordenes.GetItemString(ll_i,'de_ctecnico')
	ls_deMuestra=dw_ordenes.GetItemString(ll_i,'de_muestra')
	ls_desarrollador=iuo_gantt.of_caracter_especial(ls_desarrollador)
	ls_deMuestra=iuo_gantt.of_caracter_especial(ls_deMuestra)
	//ll_pos_max_fefin=ids_tareas.Find('f_mov_fin=MAX( f_mov_fin for all )',1,ids_tareas.RowCount())
	//ll_pos_min_feini=ids_tareas.Find('f_mov_ini=MIN( f_mov_ini for all )',1,ids_tareas.RowCount())

	ids_tareas.SetSort('f_mov_fin D')
	ids_tareas.Sort()
	ldtm_max_fefin=ids_tareas.GetItemDateTime(1/*ll_pos_max_fefin*/,'f_mov_fin')
	ids_tareas.SetSort('f_mov_ini A')
	ids_tareas.Sort()
	ldtm_min_feini=ids_tareas.GetItemDateTime(1/*ll_pos_min_feini*/,'f_mov_ini')
	li_duracion=DaysAfter(Date(ldtm_min_feini),Date(ldtm_max_fefin))
	//If li_duracion=0 Then 
	li_duracion++
	ids_tareas.SetSort('posicion A')
	ids_tareas.Sort()
	//ldtm_min_feini=DateTime(Today(),Now())
	//li_duracion=0
	
	//****************************************************************************************************************************
	//ENCABEZADO DE LA ORDEN
	
//	If ll_i=48 Then
//		MessageBox("Advertencia!","Error",StopSign!)
//	End If
//
	ls_name_orden="["+String(ll_i)+"] "+String(ll_orden)+" M "+String(ll_fabrica)+"-"+String(ll_linea)+"-"+String(ll_muestra)
	ls_color='#8cb6ce'
	ls_encabezado_orden='<task id="'+String(ll_orden)+'" name="'+ls_name_orden+'" '+&
			'color="'+ls_color+'" meeting="false" start="'+String(Date(ldtm_min_feini),"dd/mm/yyyy")+'" '+&
			'duration="'+String(li_duracion)+'" complete="0" fixed-start="false" priority="1" expand="false">'+&
			'<notes>'+&
			'CLIENTE: '+ls_cliente+"~n"+&
			'EJECUTIVA: '+ls_ejecutiva+"~n"+&
			'DESARROLLADOR: '+ls_desarrollador+"~n"+&
			'MUESTRA: '+ls_deMuestra+"~n"+&
			'</notes>'
			//****************************************************************************************************************************
	li_save = FileWrite(li_FileNum,ls_encabezado_orden)
	If li_save<0 Then
		MessageBox(	'Advertencia','Error en la inserci$$HEX1$$f300$$ENDHEX$$n de la informaci$$HEX1$$f300$$ENDHEX$$n del encabezado de la orden # '+String(ll_orden)+&
						', en el archivo localizado en '+ls_directorio,StopSign!)
		Return -1
	End If
	ll_j=ids_recursos_tarea.RowCount() + 1
	ids_rec_tar_rep.Reset()
	//************************************
	If of_win_yield () <> 1 Then 
		If FileClose(li_FileNum)<>1 Then
			MessageBox(	'Advertencia','Error en la clausura del archivo en '+ls_directorio,StopSign!)									
		End If
		Return -3
	End If
	//************************************
	//****************************************************************************************************************************		
	li_ret=This.of_addrecursotarea(ll_orden)
	
	If li_ret<>1 then
		Return -1
	End If

	//DETALLE DE LA ORDEN
	ll_k=ids_tareas.RowCount()					
//	Messagebox('Var','ll_orden='+String(ll_orden)+'~n'+&
//'ll_k='+String(ll_k)+'~n')
	For ll_j=1 To ll_k// INICIO Bucle Tareas de la orden
		//************************************
		If of_win_yield () <> 1 Then 
			If FileClose(li_FileNum)<>1 Then
				MessageBox(	'Advertencia','Error en la clausura del archivo en '+ls_directorio,StopSign!)									
			End If
			Return -3
		End If
		
//		//---------------------------------------------------------------------------------
//		//Si la tarea tiene varios recursos, se deben mostrar todos estos en la secci$$HEX1$$f300$$ENDHEX$$n de allocation								
//		//pero la tarea debe aparecer una sola vez en la seccion del detalle de la orden
//		//---------------------------------------------------------------------------------
//		If ids_rec_tar_rep.Find('nu_orden="'+ls_id+'"',1,ids_rec_tar_rep.RowCount())>0 Then
//			CONTINUE
//		End If
//		ll_pos=ids_rec_tar_rep.InsertRow(0)
//		ids_rec_tar_rep.SetItem(ll_pos,'nu_orden',ls_id)
//		//---------------------------------------------------------------------------------
//		ll_pos=ids_tareas.Find('consec='+String(ids_recursos_tarea.GetItemNumber(ll_j,'consec')),1,ids_tareas.RowCount())
//		ls_desc_tarea=ids_tareas.GetItemString(ll_pos,'descripcion')
//		If ls_desc_tarea='' Then 
//			ls_desc_tarea=ids_tareas.GetItemString(ll_pos,'de_estado')
//		End If
		ls_desc_tarea=ids_tareas.GetItemString(ll_j,'descripcion')
		ldtm_feini_tarea=ids_tareas.GetItemDateTime(ll_j,'f_mov_ini')
		ldtm_fefin_tarea=ids_tareas.GetItemDateTime(ll_j,'f_mov_fin')
		ll_minutos=ids_tareas.GetItemNumber(ll_j,'minutos')
		ll_condicion=ids_tareas.GetItemNumber(ll_j,'condicion')
		ll_cons_color=ids_tareas.GetItemNumber(ll_j,'cons_color')
		ll_ss=ids_tareas.GetItemNumber(ll_j,'nu_sol_serv')
		ll_color=ids_tareas.GetItemNumber(ll_j,'co_color')
		
		If ll_ss>0 Then
			ls_ssTask=" (S.S. "+String(ll_ss)+") "
		Else
			ls_ssTask=""
		End If
		
		If ll_cons_color>0 Then
			ls_cualColor=" (Color "+String(ll_color)+") "
		Else
			ls_cualColor=""
		End If
		
		ls_nota_fecha='expand="false"/>'
		
		choose case ll_condicion
			case 2
				ls_condicion="{PROGRAMADA}"
				ls_colorTask="#33cc00"
			case 3
				ls_condicion="{LISTA PARA INICIAR}"
				ls_colorTask="#33ccfd"
			case 4
				ls_condicion="{PROCESO}"
				ls_colorTask="#3366ff"
			case 5
				ls_condicion="{PARO GENERAL}"
				ls_colorTask="#ff3333"
			case 6
				ls_condicion="{PARO INDIVIDUAL}"
				ls_colorTask="#ff00ff"
			case 7
				ls_condicion="{APROBADA}"
				ls_colorTask="#ffff00"
				
				ls_nota_fecha='expand="false">'+"<notes> FECHA FIN: "+&
				String(ids_tareas.GetItemDateTime(ll_j,'fe_fin'),"yyyy-mm-dd hh:mm")+&
				"</notes> </task>"
				
				If IsNull(ls_nota_fecha) Then ls_nota_fecha='expand="false"/>'

			case 8
				ls_condicion="{CANCELADA}"
				ls_colorTask="#000000"
			case else
				ls_condicion="{"+String(ll_condicion)+"}"
				ls_colorTask="#000000"
				
		end choose
	
		ls_id=String(ll_orden)+"00"+String(ll_j)
		//-------------------------------------------------------------------------------------------------------------------------								
		ls_name_tarea=String(Time(ldtm_feini_tarea),'hh:mm')+"-("+String(ll_minutos)+") "+&
							iuo_gantt.of_caracter_especial(Upper(ls_desc_tarea))+&
							ls_cualColor+ls_ssTask+"  "+ls_condicion
		
		li_duracion=DaysAfter(Date(ldtm_feini_tarea),Date(ldtm_fefin_tarea))
		If li_duracion=0 Then li_duracion++
		
		//****************************************************************************************************************************
		ls_detalle_orden=	'<task id="'+ls_id+'" name="'+ls_name_tarea+&
		'" color="'+ls_colorTask+'" '+'meeting="false" start="'+&
		String(Date(ldtm_feini_tarea),'dd/mm/yyyy')+'" '+&
		'duration="'+String(li_duracion)+'" complete="0" fixed-start="false"'+&
		' priority="1" '+ ls_nota_fecha
		//****************************************************************************************************************************
		//************************************
		If of_win_yield () <> 1 Then 
				If FileClose(li_FileNum)<>1 Then
						MessageBox(	'Advertencia','Error en la clausura del archivo en '+ls_directorio,StopSign!)									
				End If
				Return -3
		End If
		//************************************
		li_save = FileWrite(li_FileNum,ls_detalle_orden)
		If  li_save<0 Then
				MessageBox(	'Advertencia','Error en la inserci$$HEX1$$f300$$ENDHEX$$n de la informaci$$HEX1$$f300$$ENDHEX$$n del detalle de la orden # '+String(ll_orden)+&
								' para el id de la tarea '+ls_id+', en el archivo localizado en '+ls_directorio,StopSign!)
				Return -1
		End If
								//****************************************************************************************************************************
	Next// FIN Bucle Tareas de la orden			
	
	li_save = FileWrite(li_FileNum,'</task>')
	If  li_save<0 Then
			MessageBox(	'Advertencia','Error en la inserci$$HEX1$$f300$$ENDHEX$$n de la informaci$$HEX1$$f300$$ENDHEX$$n del detalle de la orden # '+String(ll_orden)+&
							' en la finalizaci$$HEX1$$f300$$ENDHEX$$n de la etiqueta </task>, en el archivo localizado en '+ls_directorio,StopSign!)
			Return -1
	End If
Next 
//------------------------------------------------------------------------------------------------------------------------------
li_save = FileWrite(li_FileNum,'</tasks>')
If  li_save<0 Then
		MessageBox(	'Advertencia','Error en la inserci$$HEX1$$f300$$ENDHEX$$n de la informaci$$HEX1$$f300$$ENDHEX$$n del detalle de la orden # '+String(ll_orden)+&
						' en la finalizaci$$HEX1$$f300$$ENDHEX$$n de la etiqueta </tasks>, en el archivo localizado en '+ls_directorio,StopSign!)
		Return -1
End If
//------------------------------------------------------------------------------------------------------------------------------
//ASIGNACION RECURSOS
ll_k=ids_recursos_lista.RowCount()
ls_recursos_total=''
ids_recursos_lista.Sort()

li_save = FileWrite(li_FileNum,'<resources> ')
If  li_save<0 Then
		MessageBox(	'Advertencia','Error en la inserci$$HEX1$$f300$$ENDHEX$$n de la informaci$$HEX1$$f300$$ENDHEX$$n de los detalles de los recursos'+&
						' , en el archivo localizado en '+ls_directorio,StopSign!)
		Return -1
End If


For ll_j=1 To ll_k
	//************************************
	If of_win_yield () <> 1 Then 
		If FileClose(li_FileNum)<>1 Then
				MessageBox(	'Advertencia','Error en la clausura del archivo en '+ls_directorio,StopSign!)									
		End If
		Return -3
	End If
	//************************************
	ls_recurso = '<resource id="'+ids_recursos_lista.GetItemString(ll_j,'co_recurso')+&
					'" name="'+iuo_gantt.of_caracter_especial(ids_recursos_lista.GetItemString(ll_j,'de_recurso'))+&
					'" function="Default:0" contacts="" phone="" />~n'
	
	
	li_save = FileWrite(li_FileNum,ls_recurso)
	If  li_save<0 Then
			MessageBox(	'Advertencia','Error en la inserci$$HEX1$$f300$$ENDHEX$$n de la informaci$$HEX1$$f300$$ENDHEX$$n del detalle de la orden # '+String(ll_orden)+&
							' para el id de la tarea '+ls_id+', en el archivo localizado en '+ls_directorio,StopSign!)
			Return -1
	End If
	
	
Next
li_save = FileWrite(li_FileNum,'</resources>')
If  li_save<0 Then
		MessageBox(	'Advertencia','Error en la inserci$$HEX1$$f300$$ENDHEX$$n de la informaci$$HEX1$$f300$$ENDHEX$$n de los detalles de los recursos'+&
						' , en el archivo localizado en '+ls_directorio,StopSign!)
		Return -1
End If
//------------------------------------------------------------------------------------------------------------------------------
//ASIGNACION DE RECURSOS Y TAREAS
//lde_load=100.00
ll_k=ids_recursos_tarea.RowCount()
ls_allocations_total=''

li_save = FileWrite(li_FileNum,'<allocations>')
If  li_save<0 Then
		MessageBox(	'Advertencia','Error en la inserci$$HEX1$$f300$$ENDHEX$$n de la informaci$$HEX1$$f300$$ENDHEX$$n de los detalles de los recursos'+&
						' , en el archivo localizado en '+ls_directorio,StopSign!)
		Return -1
End If


For ll_j=1 To ll_k
		//************************************
		If of_win_yield () <> 1 Then 
			If FileClose(li_FileNum)<>1 Then
					MessageBox(	'Advertencia','Error en la clausura del archivo en '+ls_directorio,StopSign!)									
			End If
			Return -3
		End If
		//************************************
		ls_allocation  = 	'<allocation task-id="'+ids_recursos_tarea.GetItemString(ll_j,'nu_orden')+'" '+&
								'resource-id="'+ids_recursos_tarea.GetItemString(ll_j,'co_recurso')+'" load="100.00"/>~n'
		
	li_save = FileWrite(li_FileNum,ls_allocation)
	If  li_save<0 Then
			MessageBox(	'Advertencia','Error en la inserci$$HEX1$$f300$$ENDHEX$$n de la informaci$$HEX1$$f300$$ENDHEX$$n del detalle de la orden # '+String(ll_orden)+&
							' para el id de la tarea '+ls_id+', en el archivo localizado en '+ls_directorio,StopSign!)
			Return -1
	End If
		
Next
li_save = FileWrite(li_FileNum,'</allocations>')
If  li_save<0 Then
		MessageBox(	'Advertencia','Error en la inserci$$HEX1$$f300$$ENDHEX$$n de la informaci$$HEX1$$f300$$ENDHEX$$n de los detalles de los recursos'+&
						' , en el archivo localizado en '+ls_directorio,StopSign!)
		Return -1
End If
//------------------------------------------------------------------------------------------------------------------------------
li_save = FileWrite(li_FileNum,'<roles roleset-name="Default"/> </project>')
If  li_save<0 Then
		MessageBox(	'Advertencia','Error en la inserci$$HEX1$$f300$$ENDHEX$$n de la informaci$$HEX1$$f300$$ENDHEX$$n de la etiqueta de clausura del archivo en '+ls_directorio,StopSign!)
		Return -1
End If
//------------------------------------------------------------------------------------------------------------------------------
If FileClose(li_FileNum)<>1 Then
		MessageBox(	'Advertencia','Error en la clausura del archivo en '+ls_directorio,StopSign!)		
		Return -1
End If
//------------------------------------------------------------------------------------------------------------------------------
//************************************
If of_win_yield () <> 1 Then 
	If FileClose(li_FileNum)<>1 Then
			MessageBox(	'Advertencia','Error en la clausura del archivo en '+ls_directorio,StopSign!)									
	End If
	Return -3
End If
//************************************
Return 1
//END SCRIPT--------------------------------------------------------------------------------------------------------------------
end function

public function integer of_addrecursotarea (long al_orden);/*******************************************************************************************************
* PROC./FUNC.: of_addRecursoTarea
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	Para adicionar los recursos por tarea a la lista que se tiene en el datastore
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Mi$$HEX1$$e900$$ENDHEX$$rcoles 27 de Enero de 2005. Hora: 11:46:40
********************************************************************************************************/
//VARIABLE DECLARATION
Long ll_i,ll_pos,ll_j,ll_grupo,ll_consec,ll_maquina
String ls_grupo,ls_consec,ls_orden,ls_maq,ls_de_maq,ls_de_grupo
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
If ids_tareas.RowCount()<=0 Then
	Return -1
End If
//------------------------------------------------------------------------------------------------------
ll_j=ids_tareas.RowCount()
For ll_i=1 To ll_j
			//************************************
			If of_win_yield () <> 1 Then Return -3
			//************************************
			//***********************************************
			ll_consec=ids_tareas.GetItemNumber(ll_i,'consec')
			ls_orden=String(al_orden)+"00"+String(ll_i)
			//***********************************************
			ll_grupo=ids_tareas.GetItemNumber(ll_i,'co_grupo')
			If Not IsNull(ll_grupo) AND ll_grupo > 0 Then
					ls_grupo= "1"+String(ll_grupo)
					ll_pos=ids_recursos_tarea.InsertRow(0)
					ids_recursos_tarea.SetItem(ll_pos,'nu_orden',ls_orden)
					ids_recursos_tarea.SetItem(ll_pos,'consec',ll_consec)
					ids_recursos_tarea.SetItem(ll_pos,'co_recurso',ls_grupo)
					ls_de_grupo=ids_tareas.GetItemString(ll_i,'de_grupo')
					This.of_addrecurso(ls_grupo,ls_de_grupo)
			End If
			ll_maquina=ids_tareas.GetItemNumber(ll_i,'cs_maquina')
			If Not IsNull(ll_maquina) AND ll_maquina > 0 Then				
					ls_maq= "2"+String(ll_maquina)
					ll_pos=ids_recursos_tarea.InsertRow(0)
					ids_recursos_tarea.SetItem(ll_pos,'nu_orden',ls_orden)
					ids_recursos_tarea.SetItem(ll_pos,'consec',ll_consec)
					ids_recursos_tarea.SetItem(ll_pos,'co_recurso',ls_maq)
					ls_de_maq=ids_tareas.GetItemString(ll_i,'de_maquina')
					This.of_addrecurso(ls_maq,ls_de_maq)
			End If
Next
Return 1
//END SCRIPT------------------------------------------------------------------------------------------------------

end function

public function integer of_addrecurso (string as_co_recurso, string as_de_recurso);/*******************************************************************************************************
* PROC./FUNC.: of_addRecurso
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	Funcion para adicionar los recursos en el datastore
					Debe verificar que el recurso no exista, y luego adicionarlo en la lista
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Mi$$HEX1$$e900$$ENDHEX$$rcoles 27 de Enero de 2005. Hora: 11:46:40
********************************************************************************************************/
//VARIABLE DECLARATION
Long ll_pos,ll_res
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
ll_pos=ids_recursos_lista.Find('co_recurso="'+as_co_recurso+'"',1,ids_recursos_lista.RowCount())
If ll_pos<=0 Then
		ll_res=ids_recursos_lista.InsertRow(0)
		ids_recursos_lista.SetItem(ll_res,'co_recurso',as_co_recurso)
		ids_recursos_lista.SetItem(ll_res,'de_recurso',as_de_recurso)		
End If		
Return 1
//END SCRIPT------------------------------------------------------------------------------------------------------

end function

public function integer of_win_yield ();/*******************************************************************************************************
* PROC./FUNC.: of_win_yield
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	Obtiene el control del objeto para verificar la cancelaci$$HEX1$$f300$$ENDHEX$$n del proceso
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Martes 02 de Febrero de 2005. Hora: 11:46:40
********************************************************************************************************/
//VARIABLE DECLARATION
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
//SetPointer(Arrow!)
Yield()
If IsValid(w_procesando_programacion) Then
	If w_procesando_programacion.of_get_estado() Then
			Return -1
	End If
End If
Return 1
end function

on w_generar_gantt.create
int iCurrent
call super::create
this.hpb_conteo=create hpb_conteo
this.cb_seleccion=create cb_seleccion
this.cb_generar=create cb_generar
this.dw_tareas=create dw_tareas
this.dw_ordenes=create dw_ordenes
this.gb_ordenes=create gb_ordenes
this.gb_generar=create gb_generar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.hpb_conteo
this.Control[iCurrent+2]=this.cb_seleccion
this.Control[iCurrent+3]=this.cb_generar
this.Control[iCurrent+4]=this.dw_tareas
this.Control[iCurrent+5]=this.dw_ordenes
this.Control[iCurrent+6]=this.gb_ordenes
this.Control[iCurrent+7]=this.gb_generar
end on

on w_generar_gantt.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.hpb_conteo)
destroy(this.cb_seleccion)
destroy(this.cb_generar)
destroy(this.dw_tareas)
destroy(this.dw_ordenes)
destroy(this.gb_ordenes)
destroy(this.gb_generar)
end on

event ue_find;call super::ue_find;/*******************************************************************************************************
* PROC./FUNC.: ue_find
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	Find data
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Mi$$HEX1$$e900$$ENDHEX$$rcoles 27 de Enero de 2005. Hora: 11:46:40
********************************************************************************************************/
//VARIABLE DECLARATION
n_cst_param_orden luo_param
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
Open(w_opc_gantt)
If IsValid(Message.PowerObjectParm) Then
		luo_param=Message.PowerObjectParm
		If UpperBound(luo_param.is_vector)>0 And luo_param.ib_vector[1] Then
				If Match(luo_param.is_vector[1],'GRUPO') Then
						il_grupo=luo_param.il_vector[1]
						is_vec[1]=luo_param.is_vector[2]
						SetNull(is_where)
				Else
						SetNull(il_grupo)						
						is_where=luo_param.is_vector[2]
				End If
				of_recuperar()
		End If
End If
//------------------------------------------------------------------------------------------------------------------
//END SCRIPT--------------------------------------------------------------------------------------------------------


//END SCRIPT------------------------------------------------------------------------------------------------------

end event

event open;call super::open;/*******************************************************************************************************
* PROC./FUNC.: Open
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	Open window
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Mi$$HEX1$$e900$$ENDHEX$$rcoles 26 de Enero de 2005. Hora: 09:19:39
********************************************************************************************************/
//VARIABLE DECLARATION
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------}
This.Postevent('ue_open')
//END SCRIPT------------------------------------------------------------------------------------------------------

end event

event ue_open;call super::ue_open;/*******************************************************************************************************
* PROC./FUNC.: ue_open
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	User event for open window
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Mi$$HEX1$$e900$$ENDHEX$$rcoles 26 de Enero de 2005. Hora: 14:00:32
********************************************************************************************************/
//VARIABLE DECLARATION
//Long ll_res
//BEGIN SCRIPT-------------------------------------------------------------------------------
m_sheet.m_edicion.m_insertar.Enabled = False
m_sheet.m_edicion.m_clear.Enabled = False
m_sheet.m_ayuda.m_contenido.Enabled = False
m_sheet.m_archivo.m_guardar.Enabled = False
//m_sheet.m_archivo.m_buscar.Enabled = False
//m_sheet.m_ventana.m_completa.Enabled = False
m_sheet.m_archivo.m_imprimir.Enabled = False
dw_ordenes.of_conexion(n_cst_application.itr_appl,True)
//dw_tareas.of_conexion(n_cst_application.itr_appl,True)
ids_tareas=CREATE n_ds_application
//------------------------------------------------------
ids_recursos_lista = CREATE n_ds_application
ids_recursos_lista.of_load('d_ext_recursos_lista')
ids_recursos_tarea = CREATE n_ds_application
ids_recursos_tarea.of_load('d_ext_recursos_tarea')
ids_rec_tar_rep = CREATE n_ds_application
ids_rec_tar_rep.of_load('d_ext_recursos_tarea')
//-------------------------------------------------------------------------------------------------------
//END SCRIPT------------------------------------------------------------------------------------------------------

end event

type hpb_conteo from u_hpb_base_prog within w_generar_gantt
boolean visible = false
integer x = 690
integer y = 88
end type

type cb_seleccion from u_cb_application within w_generar_gantt
boolean visible = false
integer x = 567
integer y = 64
integer width = 119
integer height = 108
integer taborder = 0
boolean enabled = false
string text = "..."
end type

event clicked;call super::clicked;/*******************************************************************************************************
* PROC./FUNC.: clicked
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
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//Return 1
//END SCRIPT------------------------------------------------------------------------------------------------------

end event

type cb_generar from u_cb_application within w_generar_gantt
integer x = 64
integer y = 64
integer width = 448
integer height = 108
string text = "&Generar gantt"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Jueves 16 de Junio de 2005 HORA 16:09:10:390
// 
// 
//////////////////////////////////////////////////////////////////////////
String ls_appl,ls_msj,ls_keys[]
String ls_directorio
Integer li_fo,li_save,ll_sel,li_ret
n_cst_param_orden	luo_param
WindowState  lws_state
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
ls_msj='Generando el archivo de Gantt ...'
SetPointer(HourGlass!)
//------------------------
/*is_directory="\\sabdc02\Aplicaciones\Crystal\Muestras\gantt\gantt_ejecutar.bat"
is_name_file =" \\sabdc02\Aplicaciones\Crystal\Muestras\gantt\IFTSTA_7703284037481_2091.xml" 
ls_appl+=" ~""+is_directory+is_name_file+"~""
li_ret=Run(ls_appl)
If li_ret<>1 Then
	MessageBox('Advertencia','Error al ejecutar el archivo '+ls_appl+' para desplegar el resultado del Gantt',StopSign!)
	Return
End If

RETURN*/
//--------------------

OpenWithParm(w_procesando_programacion,ls_msj)
//------------------------------------------------------------------------------------------------------
li_ret=of_generargantt()
If  li_ret<>1 Then	//<---- !!! Se realiza el procedimiento de creaci$$HEX1$$f300$$ENDHEX$$n del archivo.
	Close(w_procesando_programacion)
	If li_ret=-3 Then
		MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','La generaci$$HEX1$$f300$$ENDHEX$$n del archivo del Gantt ha sido cancelada por el usuario',Information!)
		If is_directory<>'' AND is_name_file<>'' Then					
				//If  Not FileDelete(is_directory+is_name_file) Then
				//		MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','Error en la eliminaci$$HEX1$$f300$$ENDHEX$$n del archivo para el Gantt, localizado en :'+is_directory+is_name_file,Information!)
				//End If			
		End If
	End If
	Return
End If
//------------------------------------------------------------------------------------------------------
Close(w_procesando_programacion)
//------------------------------------------------------------------------------------------------------
long ll_res
ll_res=MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','$$HEX2$$bf002000$$ENDHEX$$Desea ver el Gantt ?',Question!,YesNo!,1)
If ll_res<>1 Then
	Return
End If
//
////------------------------------------------------------------------------------------------------------
//Open(w_sel_open_appl)
//If IsValid(Message.PowerObjectParm) Then
//	luo_param=Message.PowerObjectParm
//	If UpperBound(luo_param.il_vector) > 0 Then
//		ll_sel=luo_param.il_vector[1]
//	Else
//		Return
//	End If
//Else 
//	Return
//End If
////------------------------------------------------------------------------------------------------------
//If ll_sel=1 Then //Gantt Project

ls_directorio=n_cst_application.Of_GetProFile(n_cst_application.is_pathfileconf,&
					n_cst_application.is_sessionapp,"GANTT_PROGRAM")
//Messagebox('Var','ls_directorio='+ls_directorio+'~n')					
If ls_directorio="" Then
	ls_directorio=GetCurrentDirectory()		
End If
If Right(ls_directorio,1)<>'\' Then
		ls_directorio+='\'
End If
If Not DirectoryExists(ls_directorio) Then
		MessageBox('Advertencia','El directorio '+ls_directorio+' no existe para almacernar el archivo del Gantt, Deber$$HEX1$$ed00$$ENDHEX$$a configurar correctamente un directorio v$$HEX1$$e100$$ENDHEX$$lido en el archivo de iniciaci$$HEX1$$f300$$ENDHEX$$n '+&
						GetCurrentDirectory()+'\'+n_cst_application.is_pathfileconf+' en la secci$$HEX1$$f300$$ENDHEX$$n [proceso], variable PATHFILE',StopSign!)
		Return -1	
End If


ls_appl=ls_directorio+"gantt_ejecutar.bat"
If Not FileExists(ls_appl) Then
	MessageBox('Advertencia','No se encontr$$HEX2$$f3002000$$ENDHEX$$el archivo externo de procesamiento por lotes, para invocar la aplicaci$$HEX1$$f300$$ENDHEX$$n del Gantt en :'+ls_appl,StopSign!)
	Return
End If
//					li_save = FileClose(li_fo)
//					If li_save<>1 Then
//							MessageBox(	'Advertencia','Error en la clausura del archivo por lotes para la ejecuci$$HEX1$$f300$$ENDHEX$$n del programa del Gantt en '+ls_appl,StopSign!)
//							SetNull(is_directory)
//							Return -1
//					End If
//					
//	Else														
//					If RegistryGet('HKEY_CLASSES_ROOT\Applications\iexplore.exe\shell\open\command','',ls_appl)<>1 Then 
//							MessageBox(	'Advertencia','Error en la localizacion de la aplicaci$$HEX1$$f300$$ENDHEX$$n del explorador',StopSign!)
//							SetNull(is_directory)
//							Return -1
//					End If
//					ls_appl=Left(ls_appl,Pos(ls_appl,'%')-1)
//					ls_appl+=is_directory+is_name_file
//					lws_state=Maximized!
//	End If
//------------------------------------------------------------------------------------------------------
lws_state=Minimized!
ls_appl+=" ~""+is_directory+is_name_file+"~""
li_ret=Run(ls_appl,lws_state)
If li_ret<>1 Then
	MessageBox('Advertencia','Error al ejecutar el archivo '+ls_appl+' para desplegar el resultado del Gantt',StopSign!)
	Return
End If



end event

type dw_tareas from u_dw_application within w_generar_gantt
boolean visible = false
integer x = 82
integer y = 1796
integer width = 635
integer height = 508
integer taborder = 0
boolean enabled = false
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type dw_ordenes from u_dw_application within w_generar_gantt
integer x = 82
integer y = 272
integer width = 3305
integer height = 1352
integer taborder = 20
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type gb_ordenes from u_gb_base within w_generar_gantt
integer x = 37
integer y = 212
integer width = 3410
integer height = 1436
integer taborder = 0
string text = "$$HEX1$$d300$$ENDHEX$$rdenes"
end type

type gb_generar from u_gb_base within w_generar_gantt
integer x = 37
integer y = 12
integer width = 517
integer height = 184
integer taborder = 0
long backcolor = 134217728
end type

