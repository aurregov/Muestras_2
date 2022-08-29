HA$PBExportHeader$w_imprimir_clase_ss.srw
$PBExportComments$para imprimir las solicitudes de servicio por clase
forward
global type w_imprimir_clase_ss from w_sheet
end type
type dw_lista_ss from u_dw_application within w_imprimir_clase_ss
end type
type gb_1 from u_gb_base within w_imprimir_clase_ss
end type
end forward

global type w_imprimir_clase_ss from w_sheet
integer width = 2071
integer height = 1276
string title = "Clases de solicitudes de servico"
dw_lista_ss dw_lista_ss
gb_1 gb_1
end type
global w_imprimir_clase_ss w_imprimir_clase_ss

type variables
/*******************************************************************************************************
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Martes 18 de Enero de 2005. Hora: 08:12:32
********************************************************************************************************/
//INSTANCE VARIABLE DECLARATION
PRIVATE:
		Long		il_orden
		n_cst_param_orden iuo_param
		
n_cst_soli_serv  io_soli_serv		
end variables

forward prototypes
public function integer of_load (long al_orden)
public function integer of_imprimir_ss ()
public function integer of_open_window (long a_clase)
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

public function integer of_imprimir_ss ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Lunes 15 de Agosto de 2005 HORA 17:20:51:234
// 
// abre la ventana apropiada segun la clase de ss
//////////////////////////////////////////////////////////////////////////


Long 						ll_res,ll_lim,ll_nu_sol_serv,ll_actividad,i,ll_clase
Integer					li_pre
String					ls_clase


If io_soli_serv.of_cargar_constantes( )<>1 Then
	Return -1
End If
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

ll_lim=dw_lista_ss.Rowcount()
For i=1 To ll_lim
		li_pre=dw_lista_ss.GetItemNumber(i,'preview')
		ll_clase=dw_lista_ss.GetItemNumber(i,"co_clase")
		ls_clase=dw_lista_ss.GetItemString(i,"de_clase")
		
		iuo_param.is_vector[1]=ls_clase
		
		iuo_param.il_vector[5]=ll_clase
		iuo_param.il_vector[6]=li_pre
		
		of_open_window(ll_clase)								

Next
dw_lista_ss.SetFilter('')
dw_lista_ss.Filter()
dw_lista_ss.SetRedraw(True)
//------------------------
This.PostEvent('Close')
//END SCRIPT--------------------------------------------------------------------------------------------
Return 1
end function

public function integer of_open_window (long a_clase);If io_soli_serv.of_es_desarrollo_color(a_clase /*long al_clase_solicitud */)=1 Then
	w_inf_ss_dllo_col w1
	OpenSheetWithParm(w1,iuo_param,This.ParentWindow(),0,Original!)
ElseIf io_soli_serv.of_es_tenido_hilaza(a_clase/*long al_clase_solicitud */)=1 Then
	w_inf_ss_hilaza w2
	OpenSheetWithParm(w2,iuo_param,This.ParentWindow(),0,Original!)	
ElseIf io_soli_serv.of_es_tinta_antideslizante(a_clase/*long al_clase_solicitud */)=1 Then
	w_inf_ss_tinta w3
	OpenSheetWithParm(w3,iuo_param,This.ParentWindow(),0,Original!)		
	
end If


Return 1
end function

on w_imprimir_clase_ss.create
int iCurrent
call super::create
this.dw_lista_ss=create dw_lista_ss
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_lista_ss
this.Control[iCurrent+2]=this.gb_1
end on

on w_imprimir_clase_ss.destroy
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

type dw_lista_ss from u_dw_application within w_imprimir_clase_ss
integer x = 82
integer y = 108
integer width = 1856
integer height = 904
string dataobject = "d_lista_clase_ss_orden"
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

type gb_1 from u_gb_base within w_imprimir_clase_ss
integer x = 41
integer y = 36
integer width = 1943
integer height = 1024
string text = "Clases de soloictudes de servicio"
end type

