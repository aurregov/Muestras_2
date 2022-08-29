HA$PBExportHeader$w_inf_dias_dllo.srw
$PBExportComments$Window Class para el reporte de los dias en desarrollo
forward
global type w_inf_dias_dllo from w_report
end type
type gb_ordenes from u_gb_base within w_inf_dias_dllo
end type
end forward

global type w_inf_dias_dllo from w_report
integer width = 3557
integer height = 2036
string title = "Informe de d$$HEX1$$ed00$$ENDHEX$$as en desarrollo"
string menuname = "m_inf_ordenes_proceso"
boolean resizable = false
gb_ordenes gb_ordenes
end type
global w_inf_dias_dllo w_inf_dias_dllo

type variables
/*******************************************************************************************************
* VARIABLE DECLARATION
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	14 de Enero de 2005
********************************************************************************************************/
//SCOPE : PUBLIC 
//------------------------------------------------------------------------------------------------------
//SCOPE : PROTECTED
PROTECTED:
	n_cst_comun_orden		iuo_comun
//------------------------------------------------------------------------------------------------------
//SCOPE : PRIVATE 
//------------------------------------------------------------------------------------------------------

end variables

forward prototypes
public function integer of_recuperar ()
public function integer of_dias_teoricos ()
end prototypes

public function integer of_recuperar ();/*******************************************************************************************************
* PROC./FUNC.: of_recuperar
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	Recupera los datos de las $$HEX1$$f300$$ENDHEX$$rdenes relacionadas con el filtro de busqueda,
					para el reporte de d$$HEX1$$ed00$$ENDHEX$$as en desarrollo.
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	14 de Enero de 2005
********************************************************************************************************/
//VARIABLE DECLARATION
Long					ll_res	
DateTime 			ldt_fecha
String 				ls_usuario,ls_instancia
n_cst_comun_orden luo_comun
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	MessageBox('Advertencia','Error en el proceso de determinaci$$HEX1$$f300$$ENDHEX$$n de la fecha del servidor de aplicaci$$HEX1$$f300$$ENDHEX$$n.',StopSign!)								
	Return -1
End If
//dw_report.Modify("fecha_proceso_t.text='Fecha proceso: "+String(Date(ldt_fecha),"yyyy/mm/dd")+"'")
//dw_report.Modify("hora_proceso_t.text='Hora proceso: "+String(Time(ldt_fecha),"hh:mm:ss")+"'")
dw_report.Modify("p_crystal.FileName='"+n_cst_application.is_pathpicture+"crystallogo.jpg'")
dw_report.Modify("usuario_t.text='Usuario: "+Trim(ls_usuario)+" en ["+Trim(ls_instancia)+"]'")
dw_report.Modify("filtro_t.text='Orden = TODOS'")
ll_res=luo_comun.of_nombrefabrica(n_cst_application.ii_fabrica /*long a_fabrica*/,&
                                 n_cst_application.itr_appl/*transaction a_transaction */)
											
If ll_res=1 Then
	dw_report.Modify("nombre_fabrica_t.text='"+luo_comun.of_getString(1)+"'")	
End If
dw_report.Modify("objetodw_t.text='dwo: "+dw_report.Dataobject+"'")
dw_report.Modify("aplicacion_t.text='Aplicaci$$HEX1$$f300$$ENDHEX$$n: "+n_cst_application.is_application+"'")
//------------------------------------------------------------------------------------------------------
dw_report.of_conexion(n_cst_application.itr_appl,True)
//dw_report.Retrieve()
//iuo_comun.of_commit(n_cst_application.itr_appl)
of_dias_teoricos ()
//------------------------------------------------------------------------------------------------------
Return 1
//END SCRIPT------------------------------------------------------------------------------------------------------
end function

public function integer of_dias_teoricos ();/*******************************************************************************************************
* PROC./FUNC.: of_dias_teoricos
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	Calcula los dias teoricos del informe
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	17 de Enero de 2005
********************************************************************************************************/
//VARIABLE DECLARATION
Long ll_i,ll_col,ll_rtncode,ll_dias_teo,ll_dias_real, ll_horas
DatawindowChild ldwc_data
DateTime ldtm_feiniact, ldtm_fefinact,ldtm_fefinreal,ldtm_feinireal
//BEGIN SCRIPT-----------------------------------------------------------------------------------------------------
ll_rtncode = dw_report.GetChild('dw_inf_dias_desarrollo',ldwc_data)
If ll_rtncode = -1 Then
	MessageBox("Advertencia","Error en la asignacion del objeto de datos interno",StopSign!)
	Return -1
End If
//------------------------------------------------------------------------------------------------------
ll_col=ldwc_data.RowCount()
If ll_col > 0 Then		
		For ll_i=1 To ll_col
				ldtm_feiniact=ldwc_data.GetItemDateTime(ll_i,'fecha_inicio_actual')
				ldtm_fefinact=ldwc_data.GetItemDateTime(ll_i,'fecha_fin_actual')
				SetNull(ll_dias_teo)
				If Not IsNull(ldtm_feiniact) AND Not IsNull(ldtm_feiniact) Then
						ll_dias_teo=DaysAfter(Date(ldtm_feiniact),Date(ldtm_fefinact))+1
						ll_horas=SecondsAfter(Time(ldtm_fefinact),Time(ldtm_feiniact))
						ll_horas/=3600
						If ll_dias_teo > 1 Then
								If ll_horas <= -12 Then
									ll_dias_teo -= 1
								//ElseIf 	ll_horas >= 12 Then
								//		ll_dias += 1
								End If
						End If
						ldwc_data.SetItem(ll_i,'dias_teoricos',ll_dias_teo)
				End If
				ldtm_feinireal=ldwc_data.GetItemDateTime(ll_i,'fe_ini_real')
				ldtm_fefinreal=ldwc_data.GetItemDateTime(ll_i,'fe_fin_real')
				SetNull(ll_dias_real)
				If Not IsNull(ldtm_feinireal) AND Not IsNull(ldtm_fefinreal) Then
						ll_dias_real=DaysAfter(Date(ldtm_feinireal),Date(ldtm_fefinreal))+1
						ll_horas=SecondsAfter(Time(ldtm_fefinreal),Time(ldtm_feinireal))
						ll_horas/=3600
						If ll_dias_real > 1 Then
								If ll_horas <= -12 Then
									ll_dias_real -= 1
								//ElseIf 	ll_horas >= 12 Then
								//		ll_dias += 1
								End If
						End If
						ldwc_data.SetItem(ll_i,'dias_reales',ll_dias_real)
				End If
				//-----------------------------------------------------------
				If Not IsNull(ll_dias_teo) AND Not IsNull(ll_dias_real) Then
					ldwc_data.SetItem(ll_i,'retraso',(ll_dias_real - ll_dias_teo))
				End If
		Next
End If
////------------------------------------------------------------------------------------------------------
Return 1
//END SCRIPT------------------------------------------------------------------------------------------------------

end function

on w_inf_dias_dllo.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_inf_ordenes_proceso" then this.MenuID = create m_inf_ordenes_proceso
this.gb_ordenes=create gb_ordenes
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_ordenes
end on

on w_inf_dias_dllo.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.gb_ordenes)
end on

event open;call super::open;/*******************************************************************************************************
* PROC./FUNC.: open
* ARG.		 : None
* RETURN		 : Long
* SCOPE		 : Public
* PURPOSE	 :	open window
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	14 de Enero de 2005
********************************************************************************************************/
//VARIABLE DECLARATION
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
of_recuperar()
//END SCRIPT------------------------------------------------------------------------------------------------------

end event

event resize;/*******************************************************************************************************
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	14 de Enero de 2005
********************************************************************************************************/
//Overwrite!
//------------------------------------------------------------------------------------------------------

end event

event ue_find;/*******************************************************************************************************
* PROC./FUNC.: ue_find
* ARG.		 : None
* RETURN		 : None
* SCOPE		 : Public
* PURPOSE	 :	Funci$$HEX1$$f300$$ENDHEX$$n que invoca la ventana de b$$HEX1$$fa00$$ENDHEX$$squeda para las $$HEX1$$f300$$ENDHEX$$rdenes
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	14 de Enero de 2005
********************************************************************************************************/
//VARIABLE DECLARATION
String ls_filtro
Int li_res
n_cst_param_orden luo_param
n_ds_application lds_consulta
DataWindowChild ldwc_report
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
Open(w_opc_inf_dias_dllo)
If IsValid(Message.PowerObjectParm) Then
		luo_param=Message.PowerObjectParm
		If IsValid(luo_param.ids_vector[1]) Then
				lds_consulta=luo_param.ids_vector[1]
				li_res = dw_report.GetChild('dw_inf_dias_desarrollo',ldwc_report)
				If  li_res = 1 Then
					 ldwc_report.Reset()
					 lds_consulta.RowsCopy(1,lds_consulta.RowCount(),Primary!,ldwc_report,1,Primary!)
					 ls_filtro=luo_param.is_vector[1]
						If ls_filtro <> '' Then
								dw_report.Modify("filtro_t.text='"+ls_filtro+"'")
						Else
								dw_report.Modify("filtro_t.text='Orden = TODOS'")
						End If
					 of_dias_teoricos()					 
				Else
						MessageBox('Advertencia','Error en la asignaci$$HEX1$$f300$$ENDHEX$$n del reporte',StopSign!)
						Return
				End If				
		End If
//		MessageBox('Advertencia','Error en el par$$HEX1$$e100$$ENDHEX$$metro de selecci$$HEX1$$f300$$ENDHEX$$n de B$$HEX1$$fa00$$ENDHEX$$squeda.',StopSign!)
//	End If
End If
//------------------------------------------------------------------------------------------------------------------
//END SCRIPT--------------------------------------------------------------------------------------------------------


end event

type dw_report from w_report`dw_report within w_inf_dias_dllo
integer x = 69
integer y = 92
integer width = 3378
integer height = 1608
string dataobject = "d_inf_dias_desarrollo_cmp"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type gb_ordenes from u_gb_base within w_inf_dias_dllo
integer x = 32
integer y = 24
integer width = 3451
integer height = 1716
string text = "Informe de d$$HEX1$$ed00$$ENDHEX$$as en desarrollo"
end type

