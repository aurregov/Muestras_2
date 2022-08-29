HA$PBExportHeader$w_teorica_referencia.srw
$PBExportComments$Para establecer la produccion teorica por referencia en un recurso
forward
global type w_teorica_referencia from w_response
end type
type cb_2 from commandbutton within w_teorica_referencia
end type
type cb_1 from commandbutton within w_teorica_referencia
end type
type dw_tiempo from u_dw_application within w_teorica_referencia
end type
type gb_2 from groupbox within w_teorica_referencia
end type
end forward

global type w_teorica_referencia from w_response
integer width = 2267
integer height = 576
string title = "Producci$$HEX1$$f300$$ENDHEX$$n te$$HEX1$$f300$$ENDHEX$$rica"
cb_2 cb_2
cb_1 cb_1
dw_tiempo dw_tiempo
gb_2 gb_2
end type
global w_teorica_referencia w_teorica_referencia

type variables
n_cst_param io_param
end variables

forward prototypes
public function integer of_actualizatiempo ()
public function integer of_verificarrecurso ()
public function integer of_actualizateorica ()
end prototypes

public function integer of_actualizatiempo ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 09 de Enero de 2003 HORA 16:57:14:906
// 
// Funcion para actualizar el tiempo
//////////////////////////////////////////////////////////////////////////
DateTime ldt_fecha
String ls_usuario,ls_instancia
long   ll_cant


If dw_tiempo.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos de tiempo no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If


If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If

If of_ActualizaTeorica()<>1 Then
	Return -1
End If

If dw_tiempo.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
	RollBack Using n_cst_application.itr_appl;
	Return -1
End If			

If dw_tiempo.Update()<>1 Then
	RollBack Using n_cst_application.itr_appl ;
	Return -1
End If

Commit Using n_cst_application.itr_appl ;

Return 1

end function

public function integer of_verificarrecurso ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Martes 22 de Marzo de 2005 HORA 13:55:38:265
// 
// Verifica que el recurso que se esta utilizando si este en los
// recuros de produccion
//////////////////////////////////////////////////////////////////////////

long ll_recurso,ll_verifica,ll_cant

ll_recurso=io_param.il_vector[1]

  SELECT m_recursos_pdn.co_recurso  
    INTO :ll_verifica  
    FROM m_recursos_pdn  
   WHERE ( m_recursos_pdn.co_recurso = :ll_recurso ) AND  
         ( m_recursos_pdn.co_tipoprod = 10 ) AND  
         ( m_recursos_pdn.co_centro = 12 ) AND  
         ( m_recursos_pdn.co_subcentro = 12 )   
			
			using n_cst_application.itr_appl;

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

If IsNull(ll_verifica) Then
	ll_verifica=-1
End If

If ll_verifica<>ll_recurso Then
	MessageBox("Advertencia!","El recurso "+String(ll_recurso)+&
	" NO se puede colocar en la operaci$$HEX1$$f300$$ENDHEX$$n de tejido de la referencia, por favor verifique.",StopSign!)
	Return -1
End If
//////////////////////////////////////////////////////////////////////////
// Verifica que la referencia si tenga la operaci$$HEX1$$f300$$ENDHEX$$n tejido.
// 
//////////////////////////////////////////////////////////////////////////



  SELECT count(*)  
    INTO :ll_cant  
    FROM m_proref  
   WHERE ( m_proref.co_fabrica = :io_param.il_vector[2] ) AND  
         ( m_proref.co_linea = :io_param.il_vector[3] ) AND  
         ( m_proref.co_referencia = :io_param.il_vector[4] ) AND  
         ( m_proref.co_talla = :io_param.il_vector[5] ) AND  
         ( m_proref.co_calidad = :io_param.il_vector[6] ) AND  
         ( m_proref.co_operacion = 1 )   
			
			using n_cst_application.itr_appl;

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

If IsNull(ll_cant) Then
	ll_cant=0
End If

If ll_cant=0 Then
	MessageBox("Advertencia!","La referencia no tiene la operaci$$HEX1$$f300$$ENDHEX$$n tejido, por favor verifique.",StopSign!)
	Return -1
End If




Return 1
end function

public function integer of_actualizateorica ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Lunes 28 de Marzo de 2005 HORA 09:26:25:468
// 
// Cuando se cambia por primera vez la teorica se debe actualizar en el recurso
// de mano de obra, posteriormente si se necesitan cambios se deben hacer manualmente
//////////////////////////////////////////////////////////////////////////


long ll_cantidad,ll_recurso

  SELECT count(*)  
    INTO :ll_cantidad  
    FROM m_producc_teo  
   WHERE ( m_producc_teo.co_fabrica = :io_param.il_vector[2] ) AND  
         ( m_producc_teo.co_linea = :io_param.il_vector[3] ) AND  
         ( m_producc_teo.co_referencia = :io_param.il_vector[4] ) AND  
         ( m_producc_teo.co_talla = :io_param.il_vector[5] ) AND  
         ( m_producc_teo.co_calidad = :io_param.il_vector[6] ) 
			using n_cst_application.itr_appl;


If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

If IsNull(ll_cantidad) Then
	ll_cantidad=0
End If

//////////////////////////////////////////////////////////////////////////
// Si hay mas de un registro no se debe actualizar.
// 
//////////////////////////////////////////////////////////////////////////

If ll_cantidad>1 Then
	Return 1
End If

//////////////////////////////////////////////////////////////////////////
// Se actualiza el recurso de tejido de la mano de obra
// cabe mencionar que al abrir la ventanta se verifica que sea un recurso
// existente en los recursos de produccion.
//////////////////////////////////////////////////////////////////////////

  UPDATE m_proref  
     SET co_recurso = :io_param.il_vector[1] 
   WHERE ( m_proref.co_fabrica = :io_param.il_vector[2] ) AND  
         ( m_proref.co_linea = :io_param.il_vector[3] ) AND  
         ( m_proref.co_referencia = :io_param.il_vector[4] ) AND  
         ( m_proref.co_talla = :io_param.il_vector[5] ) AND  
         ( m_proref.co_calidad = :io_param.il_vector[6] ) AND  
         ( m_proref.co_operacion = 1 )   
			
			using n_cst_application.itr_appl;
			
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If
			

Return 1
end function

on w_teorica_referencia.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_tiempo=create dw_tiempo
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.dw_tiempo
this.Control[iCurrent+4]=this.gb_2
end on

on w_teorica_referencia.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_tiempo)
destroy(this.gb_2)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 08 de Agosto de 2003 HORA 08:21:40:672
// 
// 
//////////////////////////////////////////////////////////////////////////




io_param=message.powerObjectParm

If of_verificarRecurso()<>1 Then
	Close(This)
	Return
End If

dw_tiempo.SetTransObject(n_cst_application.itr_appl)

long ll_tot

ll_tot=dw_tiempo.Retrieve(io_param.il_vector[1],&
                         io_param.il_vector[2],&
								 io_param.il_vector[3],&
								 io_param.il_vector[4],&
								 io_param.il_vector[5],&
								 io_param.il_vector[6])
								 
If ll_tot<0 Then
	MessageBox("Advertencia!","Error recuperando informaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
	Close(This)
	Return
End If

If ll_tot=0 Then
	dw_tiempo.insertRow(0)
	dw_tiempo.setItem(1,"co_recurso",   io_param.il_vector[1])
	dw_tiempo.setItem(1,"co_fabrica",   io_param.il_vector[2])
	dw_tiempo.setItem(1,"co_linea",     io_param.il_vector[3])
	dw_tiempo.setItem(1,"co_referencia",io_param.il_vector[4])
	dw_tiempo.setItem(1,"co_talla",     io_param.il_vector[5])
	dw_tiempo.setItem(1,"co_calidad",   io_param.il_vector[6])
End If



DWObject dwo_a

dwo_a= dw_tiempo.Object.produccion_teo

dw_tiempo.Trigger Event ItemChanged(1,dwo_a,String(dw_tiempo.GetItemDecimal(1,"produccion_teo")))


dw_tiempo.setFocus()

end event

type cb_2 from commandbutton within w_teorica_referencia
integer x = 1125
integer y = 336
integer width = 343
integer height = 100
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 08 de Agosto de 2003 HORA 08:18:58:655
// 
// 
//////////////////////////////////////////////////////////////////////////
Close(Parent)
end event

type cb_1 from commandbutton within w_teorica_referencia
integer x = 763
integer y = 336
integer width = 343
integer height = 100
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Aceptar"
end type

event clicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 04 de Agosto de 2003 HORA 09:09:45:053
// 
// Para actualizar la producci$$HEX1$$f300$$ENDHEX$$n teorica
//////////////////////////////////////////////////////////////////////////
If of_ActualizaTiempo()<>1 Then
	Return 
End If

close(Parent)
end event

type dw_tiempo from u_dw_application within w_teorica_referencia
integer x = 78
integer y = 80
integer width = 1984
integer height = 176
boolean bringtotop = true
string dataobject = "d_m_producc_teo"
boolean vscrollbar = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 08 de Agosto de 2003 HORA 08:19:40:296
// 
// 
//////////////////////////////////////////////////////////////////////////

end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 09 de Enero de 2003 HORA 15:23:25:953
// 
// 
//////////////////////////////////////////////////////////////////////////
Decimal lde_produc,lde_seg
long ll_min,ll_seg,ll_seg_solo

If dwo.name="produccion_teo" Then
	lde_produc=Dec(Data)
	
	If IsNull(lde_produc) Then lde_produc=0
	
	If lde_produc=0 Then Return 2
	
	lde_seg=1200/lde_produc
	ll_seg_solo=Truncate(lde_seg,0)
	ll_min=Truncate(lde_seg/60,0)
	ll_seg=lde_seg - ll_min * 60
	SetItem(1,"minutos",ll_min)
	SetItem(1,"segundos",ll_seg)
	SetItem(1,"solo_seg",ll_seg_solo)
End If

If dwo.name="segundos" Then
	lde_seg=Dec(data)
	
	If IsNull(lde_seg) Then lde_seg=0
	
	ll_min=GetItemNumber(1,"minutos")
	If IsNull(ll_min) Then ll_min=0
	lde_seg+=ll_min*60
	
	ll_seg_solo=Truncate(lde_seg,0)
	
	If lde_seg=0 Then Return 2
	
	lde_produc=1200/lde_seg
	SetItem(1,"produccion_teo",lde_produc)

	ll_min=Truncate(lde_seg/60,0)
	ll_seg=lde_seg - ll_min * 60
	SetItem(1,"solo_seg",ll_seg_solo)
	SetItem(1,"minutos",ll_min)
	SetItem(1,"segundos",ll_seg)
	SetText(String(ll_seg))
	Return 2
End If

If dwo.name="minutos" Then
	ll_min=long(Data)
	
	If IsNull(ll_min) Then ll_min=0
	
	ll_seg=GetItemNumber(1,"segundos")
	If IsNull(ll_seg) Then ll_seg=0
	lde_seg=ll_seg+ll_min*60
	
	ll_seg_solo=Truncate(lde_seg,0)
	
	If lde_seg=0 Then Return 2
	lde_produc=1200/lde_seg
	SetItem(1,"produccion_teo",lde_produc)

	ll_min=Truncate(lde_seg/60,0)
	ll_seg=lde_seg - ll_min * 60
	SetItem(1,"minutos",ll_min)
	SetItem(1,"segundos",ll_seg)	
	SetItem(1,"solo_seg",ll_seg_solo)
End If

If dwo.name="solo_seg" Then
	lde_seg=Dec(data)
	
	If IsNull(lde_seg) Then lde_seg=0
	
	If lde_seg=0 Then Return 2
	
	lde_produc=1200/lde_seg
	SetItem(1,"produccion_teo",lde_produc)

	ll_min=Truncate(lde_seg/60,0)
	ll_seg=lde_seg - ll_min * 60
	SetItem(1,"minutos",ll_min)
	SetItem(1,"segundos",ll_seg)
End If
	
end event

type gb_2 from groupbox within w_teorica_referencia
integer x = 9
integer y = 24
integer width = 2213
integer height = 264
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Producci$$HEX1$$f300$$ENDHEX$$n te$$HEX1$$f300$$ENDHEX$$rica"
end type

