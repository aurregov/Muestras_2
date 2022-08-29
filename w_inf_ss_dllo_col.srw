HA$PBExportHeader$w_inf_ss_dllo_col.srw
$PBExportComments$solicitud de servicio de desarrollo de color
forward
global type w_inf_ss_dllo_col from w_report
end type
type cb_cancelar from u_cb_application within w_inf_ss_dllo_col
end type
type cb_print from u_cb_application within w_inf_ss_dllo_col
end type
type dw_dt_mu_ord from u_dw_application within w_inf_ss_dllo_col
end type
type gb_ss from u_gb_base within w_inf_ss_dllo_col
end type
end forward

global type w_inf_ss_dllo_col from w_report
integer width = 3579
integer height = 2188
string title = "Desarrollo de color"
string menuname = ""
boolean maxbox = false
boolean resizable = false
windowstate windowstate = maximized!
cb_cancelar cb_cancelar
cb_print cb_print
dw_dt_mu_ord dw_dt_mu_ord
gb_ss gb_ss
end type
global w_inf_ss_dllo_col w_inf_ss_dllo_col

type variables
n_cst_param_orden		iuo_param
Long 						il_actividad

end variables

on w_inf_ss_dllo_col.create
int iCurrent
call super::create
this.cb_cancelar=create cb_cancelar
this.cb_print=create cb_print
this.dw_dt_mu_ord=create dw_dt_mu_ord
this.gb_ss=create gb_ss
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancelar
this.Control[iCurrent+2]=this.cb_print
this.Control[iCurrent+3]=this.dw_dt_mu_ord
this.Control[iCurrent+4]=this.gb_ss
end on

on w_inf_ss_dllo_col.destroy
call super::destroy
destroy(this.cb_cancelar)
destroy(this.cb_print)
destroy(this.dw_dt_mu_ord)
destroy(this.gb_ss)
end on

event open;//------------------------------------
This.Event ue_open()
//------------------------------------
end event

event ue_open;call super::ue_open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Lunes 15 de Agosto de 2005 HORA 15:42:31:640
// 
// Recuepra la informaci$$HEX1$$f300$$ENDHEX$$n de los desarrollos de color
//
// hay tres parametros entrantes
// 1 nro de orden
// 2 clase de solicitud de servicio, debe ser 1 que es dllo de col
// 3 si manda a imprimir y cierra de una vez
//////////////////////////////////////////////////////////////////////////

//---------------------------------------------------------------------------------------------------------------------------
Long					ll_res,ll_tot

DateTime 			ldt_fecha
String 				ls_usuario,ls_instancia,ls_dwo,ls_titulo
n_cst_comun_orden luo_comun

//---------------------------------------------------------------------------------------------------------------------------
iuo_param=Message.Powerobjectparm

If Not IsValid(iuo_param) Then		
	MessageBox("Advertencia!","No hay parametros para recuperar informaci$$HEX1$$f300$$ENDHEX$$n",StopSign!)
	Close(This)
	Return
End IF
//////////////////////////////////////////////////////////////////////////
// Se recupera toda la informaci$$HEX1$$f300$$ENDHEX$$n de la orden
// 
//////////////////////////////////////////////////////////////////////////
	
dw_dt_mu_ord.SetTransObject(n_cst_application.itr_appl)
dw_report.SetTransObject(n_cst_application.itr_appl)
	
ll_tot=dw_report.Retrieve(iuo_param.il_vector[4],/*orden*/& 
                          iuo_param.il_vector[5])/*clase ss*/

								  
If ll_tot<=0 Then
	Return
End If
dw_report.Modify("DataWindow.Print.Preview=Yes")
//////////////////////////////////////////////////////////////////////////
// Ahora se actualizan los datos del encabezado 
// 
//////////////////////////////////////////////////////////////////////////

ll_tot=dw_dt_mu_ord.Retrieve(iuo_param.il_vector[1],&
                             iuo_param.il_vector[2],&
									  iuo_param.il_vector[3],&
									  iuo_param.il_vector[4])

If ll_tot<=0 Then
	Return
End If

dw_report.modify("de_clase_ss.text='"+iuo_param.is_vector[1]+"'")		

String ls_dato, ls_de_cliente

long ll_co_fabrica,ll_co_linea,ll_co_muestra,ll_cliente,ll_sucursal

ll_co_fabrica=dw_dt_mu_ord.GetItemNumber(1,"co_fabrica")
ll_co_linea=dw_dt_mu_ord.GetItemNumber(1,"co_linea")
ll_co_muestra=dw_dt_mu_ord.GetItemNumber(1,"co_muestra")

ls_dato=String(ll_co_fabrica)+" - "+&
        String(ll_co_linea)+" - "+&
		  String(ll_co_muestra)
		  
dw_report.modify("f_l_dllo.text='"+ls_dato+"'")		  

ls_dato=dw_dt_mu_ord.GetItemString(1,"de_talla")
dw_report.modify("talla.text='"+ls_dato+"'")		  

ls_dato=dw_dt_mu_ord.GetItemString(1,"co_diseno_muestra")
dw_report.modify("codigo_diseno.text='"+ls_dato+"'")	

ls_dato=dw_dt_mu_ord.GetItemString(1,"de_ctecnico")
dw_report.modify("desarrollador.text='"+ls_dato+"'")	

ls_dato=dw_dt_mu_ord.GetItemString(1,"co_ref_exp")
dw_report.modify("estilo_cliente.text='"+ls_dato+"'")	

ls_dato=dw_dt_mu_ord.GetItemString(1,"co_ref_exp")
dw_report.modify("estilo_cliente.text='"+ls_dato+"'")	

ls_dato=dw_dt_mu_ord.GetItemString(1,"de_muestra")
dw_report.modify("nombre_dllo.text='"+ls_dato+"'")	

ll_cliente=dw_dt_mu_ord.GetItemNumber(1,"co_cliente")
ll_sucursal=dw_dt_mu_ord.GetItemNumber(1,"co_sucursal")

ls_de_cliente=dw_dt_mu_ord.GetItemString(1,"nom_cliente")

ls_dato="("+String(ll_cliente)+"-"+&
            String(ll_sucursal)+") "+&
				ls_de_cliente
				
dw_report.modify("cliente.text='"+ls_dato+"'")					

If iuo_param.il_vector[6]=0 Then //preview
	cb_print.Triggerevent('Clicked')
	Close(This)
End If

end event

event resize;/*******************************************************************************************************
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Jueves 3 de Febrero de 2005. Hora: 14:06:19
********************************************************************************************************/
// Overwrite!
//------------------------------------------------------------------------------------------------------

end event

type dw_report from w_report`dw_report within w_inf_ss_dllo_col
integer x = 82
integer y = 108
integer width = 3337
integer height = 1312
string dataobject = "d_inf_ss_dllo_color"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type cb_cancelar from u_cb_application within w_inf_ss_dllo_col
integer x = 1390
integer y = 1484
integer taborder = 20
boolean bringtotop = true
string text = "&Cancelar"
end type

event clicked;call super::clicked;Close(Parent)
end event

type cb_print from u_cb_application within w_inf_ss_dllo_col
integer x = 1769
integer y = 1484
integer taborder = 30
boolean bringtotop = true
string text = "&Imprimir"
end type

event clicked;call super::clicked;OpenWithParm(w_print,dw_report)
Close(Parent)
end event

type dw_dt_mu_ord from u_dw_application within w_inf_ss_dllo_col
boolean visible = false
integer x = 96
integer y = 1480
integer width = 302
integer height = 300
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_dt_mu_ord1"
boolean vscrollbar = false
end type

event itemerror;call super::itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 10 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Integer li_null
String ls_col
//-------------------------------------------------
If dwo.name='co_ejecutiva' Then
	If Long(Data)=0 Then
		SetNull(li_null)
		ls_col=dwo.name
		This.SetItem(row,ls_col,li_null)
		This.SetItem(row,'de_ejecutiva','')		
		Return 3
	End If		
End If
end event

event sqlpreview;//MessageBox('SQLPreview.Maestro','SQLSYNTAX: ~n'+sqlsyntax+'~n#Fila: '+&
//				String(row))
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 29 de Septiembre de 2004.H:11:21
---------------------------------------------------
Permitir un nuevo registro de la orden cuando se proviene 
de la busqueda de los datos de alguna orden
---------------------------------------------------*/
//Long ll_res
//If ib_cambios Then
//	ll_res=MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n!","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
//	
//	If ll_res=2 Then
//	 Return
//	End If
//End If
//of_reset()
//il_nu_orden=0
//Call Super::ue_insertrow	
MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe realizar una b$$HEX1$$fa00$$ENDHEX$$squeda de muestra para recuperar datos de una nueva orden.",Information!)

end event

type gb_ss from u_gb_base within w_inf_ss_dllo_col
integer x = 32
integer y = 32
integer width = 3438
integer height = 1424
integer taborder = 20
string text = "Desarrollo de Color"
end type

