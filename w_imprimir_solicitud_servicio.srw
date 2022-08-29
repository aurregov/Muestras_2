HA$PBExportHeader$w_imprimir_solicitud_servicio.srw
$PBExportComments$Clase Ventana para la impresion de solicitudes de servicio de las $$HEX1$$f300$$ENDHEX$$rdenes.
forward
global type w_imprimir_solicitud_servicio from w_sheet
end type
type dw_lista_ss from u_dw_application within w_imprimir_solicitud_servicio
end type
type gb_1 from u_gb_base within w_imprimir_solicitud_servicio
end type
end forward

global type w_imprimir_solicitud_servicio from w_sheet
string tag = "Informe de solicitudes de servicio"
integer width = 2071
integer height = 1276
string title = "Informe de solicitudes de servicio"
dw_lista_ss dw_lista_ss
gb_1 gb_1
end type
global w_imprimir_solicitud_servicio w_imprimir_solicitud_servicio

type variables
/*******************************************************************************************************
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Martes 18 de Enero de 2005. Hora: 08:12:32
********************************************************************************************************/
//INSTANCE VARIABLE DECLARATION
PRIVATE:
		Long		il_orden
		n_cst_param_orden iuo_param
end variables

forward prototypes
public function integer of_load (long al_orden)
public function integer of_imprimir_ss ()
public function integer of_open_report ()
end prototypes

public function integer of_load (long al_orden);/*******************************************************************************************************
* PROC./FUNC.: of_load
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	Carga los datos para la consulta de las actividades..
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Martes 25 de Enero de 2005. Hora: 08:12:32
********************************************************************************************************/
//VARIABLE DECLARATION
Long ll_res
//BEGIN SCRIPT-------------------------------------------------------------------------------
m_sheet.m_edicion.m_insertar.Enabled = False
m_sheet.m_edicion.m_clear.Enabled = False
m_sheet.m_ayuda.m_contenido.Enabled = False
m_sheet.m_archivo.m_guardar.Enabled = False
m_sheet.m_archivo.m_buscar.Enabled = False
m_sheet.m_ventana.m_completa.Enabled = False
//m_sheet.m_archivo.m_imprimir.Enabled = False
//-------------------------------------------------------------------------------------------
dw_lista_ss.of_conexion(n_cst_application.itr_appl,True)
ll_res=dw_lista_ss.Retrieve(al_orden)
Choose Case ll_res
	Case Is < 0
		MessageBox('Advertencia','Error en la solicitud de las actividades con solicitudes de servicio.',StopSign!)
		Return -1
	Case 0
		MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','No se recuperaron actividades con solicitudes de servicio para imprimir.',Information!)
		Return -1
End Choose
//-------------------------------------------------------------------------------------------------------
Return 1
//END SCRIPT---------------------------------------------------------------------------------------------

end function

public function integer of_imprimir_ss ();/*******************************************************************************************************
* PROC./FUNC.: ue_print
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	Imprime las ss
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Martes 25 de Enero de 2005. Hora: 08:12:32
********************************************************************************************************/
//VARIABLE DECLARATION
Long 						ll_res,ll_lim,ll_nu_sol_serv,ll_actividad
Integer					li_pre
String					ls_actividad,ls_msj
n_cst_param_orden		luo_param

//BEGIN SCRIPT------------------------------------------------------------------------------------------
ll_res = dw_lista_ss.Find('chequeo=1',1,dw_lista_ss.RowCount())
If ll_res<=0 Then
		MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','No ha seleccionado ninguna solicitud de servicio para imprimir',Information!)
		Return 1
End If
//------------------------------------------------------------------------------------------
dw_lista_ss.SetRedraw(False)
dw_lista_ss.SetFilter('chequeo=1')
dw_lista_ss.Filter()
ls_msj=''
ll_lim=dw_lista_ss.Rowcount()
For ll_res=1 To ll_lim
		li_pre=dw_lista_ss.GetItemNumber(ll_res,'preview')
		//If li_pre = 1 OR li_pre = 0 Then
				ll_nu_sol_serv=dw_lista_ss.GetItemNumber(ll_res,'nu_sol_serv')
				ll_actividad=dw_lista_ss.GetItemNumber(ll_res,'id_actividad')
				ls_actividad=dw_lista_ss.GetItemString(ll_res,'de_actividad')				
				Choose Case ll_actividad
					Case 	4,5/*Des.colorcalcetin*/,&
							6,7/*Des.colorHilaza*/,&
							8,9/*Te$$HEX1$$f100$$ENDHEX$$irhilaza*/,&
							3/*Graficarbordado*/,&
							2/*GraficarAntideslizante*/,&
							19/*Des.Chablon*/,&
							25/*PrepararTintaAntides.*/,&
							18/*Des.TintaAntides.*/,&
							28/*dllo color tactel*/
										//iuo_param.il_vector[1]=il_fabrica
										//iuo_param.il_vector[2]=il_linea
										//iuo_param.il_vector[3]=il_muestra
										//iuo_param.il_vector[4]=il_nu_orden
										  iuo_param.il_vector[5]=ll_actividad
										  iuo_param.il_vector[6]=ll_nu_sol_serv					
										/*--------------------------------------------*/			
										  iuo_param.is_vector[1]=ls_actividad
										//iuo_param.ids_vector[1]=ids_mu_sol_serv
										//iuo_param.ids_vector[2]=ids_mu_sol_serv_mp
										iuo_param.il_vector[7]=li_pre
										of_open_report()
					Case Else
						ls_msj += "# "+String(ll_actividad)+" - "+ls_actividad+"~n"
				End Choose
		//Else
		//End If
		//OpenWithParm(lw_sol_serv,iuo_param)
Next
dw_lista_ss.SetFilter('')
dw_lista_ss.Filter()
dw_lista_ss.SetRedraw(True)
If ls_msj<>'' Then
	MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','Las siguientes actividades no tienen sus c$$HEX1$$f300$$ENDHEX$$digos asignados para los formatos de solicitudes de servicio:~n'+ls_msj,Information!)
End If
//------------------------
This.PostEvent('Close')
//END SCRIPT--------------------------------------------------------------------------------------------
Return 1
end function

public function integer of_open_report ();/*******************************************************************************************************
* PROC./FUNC.: of_open_report
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	Abre una instancia para cada reporte de las solicitudes de servicio
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Martes 08 de Febrero de 2005. Hora: 11:46:40
********************************************************************************************************/
//VARIABLE DECLARATION
w_inf_sol_serv			lw_sol_serv
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
Return OpenSheetWithParm(lw_sol_serv,iuo_param,This.ParentWindow(),0,Original!)
//END SCRIPT------------------------------------------------------------------------------------------------------



end function

on w_imprimir_solicitud_servicio.create
int iCurrent
call super::create
this.dw_lista_ss=create dw_lista_ss
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_lista_ss
this.Control[iCurrent+2]=this.gb_1
end on

on w_imprimir_solicitud_servicio.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_lista_ss)
destroy(this.gb_1)
end on

event open;call super::open;/*******************************************************************************************************
* PROC./FUNC.: Open
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	Open window
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Martes 25 de Enero de 2005. Hora: 08:12:32
********************************************************************************************************/
//VARIABLE DECLARATION
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------}
This.PostEvent('ue_open')
//------------------------------------------------------------------------------------------------------
//Return 1
//END SCRIPT------------------------------------------------------------------------------------------------------

end event

event ue_open;call super::ue_open;/*******************************************************************************************************
* PROC./FUNC.: ue_open
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	post open
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Martes 25 de Enero de 2005. Hora: 08:12:32
********************************************************************************************************/
//VARIABLE DECLARATION
String ls_title
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
If IsValid(Message.PowerObjectParm) Then
	iuo_param = Message.PowerObjectParm
	If UpperBound(iuo_param.il_vector)>0 Then
			il_orden=iuo_param.il_vector[4]
			ls_title=This.Title
			ls_title+=' - F/L/M/Ord: '+String(iuo_param.il_vector[1])+'/'+String(iuo_param.il_vector[2])+'/'+&
							String(iuo_param.il_vector[3])+'/'+String(iuo_param.il_vector[4])
			of_settitle(ls_title)				
			of_load(il_orden)
	End If
End If
//END SCRIPT------------------------------------------------------------------------------------------------------

end event

event ue_print;/*******************************************************************************************************
* PROC./FUNC.: ue_print
* ARG.		 : al_sol_serv : Long . No. solicitud de servicio
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	Imprime los datos asignados en la ventana.
					Para este caso se invoca la funci$$HEX1$$f300$$ENDHEX$$n que implementa la impresi$$HEX1$$f300$$ENDHEX$$n de ss
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Martes 18 de Enero de 2005. Hora: 08:12:32
********************************************************************************************************/
//VARIABLE DECLARATION
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
of_imprimir_ss()
//END SCRIPT------------------------------------------------------------------------------------------------------
end event

event close;call super::close;Close(This)
end event

type dw_lista_ss from u_dw_application within w_imprimir_solicitud_servicio
integer x = 82
integer y = 108
integer width = 1856
integer height = 904
string dataobject = "d_lista_solicitud_servicio"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;call super::itemchanged;Choose Case dwo.name
		Case 'chequeo' 
				If Long(Data)=0 Then
						This.SetItem(row,'preview',0)	
				Else 
						This.SetItem(row,'preview',1)
				End If
		Case 'preview'
				If This.GetItemNumber(row,'chequeo') =0 Then Return 2
End Choose

end event

type gb_1 from u_gb_base within w_imprimir_solicitud_servicio
integer x = 41
integer y = 36
integer width = 1943
integer height = 1024
string text = "Solicitudes de servicio"
end type

