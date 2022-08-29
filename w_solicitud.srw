HA$PBExportHeader$w_solicitud.srw
forward
global type w_solicitud from w_sheet
end type
type dw_detalle from u_dw_application within w_solicitud
end type
type dw_solicitud from u_dw_application within w_solicitud
end type
type gb_head from u_gb_base within w_solicitud
end type
type dw_panel from u_dw_application within w_solicitud
end type
type gb_detalle from u_gb_base within w_solicitud
end type
end forward

global type w_solicitud from w_sheet
integer width = 3657
integer height = 2012
string title = "Solicitud de muestras"
string menuname = "m_sheet_solicitud"
boolean maxbox = true
windowstate windowstate = maximized!
event ue_cambio_estado ( )
event ue_informe ( )
dw_detalle dw_detalle
dw_solicitud dw_solicitud
gb_head gb_head
dw_panel dw_panel
gb_detalle gb_detalle
end type
global w_solicitud w_solicitud

type variables
n_ds_base lds_colores

DataWindowChild idc_fabrica,idc_linea,idc_talla_exp

String is_where_cliente //para la busqueda de clientes
String is_where

long il_fila

DateTime idt_fecha_hoy
end variables

forward prototypes
public function integer of_haydatos (datawindow a_dw)
public function integer of_grabar ()
public function string of_usuarioJefe (string a_usuario)
public function integer of_panel ()
public function integer of_verificar ()
public function integer of_borrablancos (datawindow a_dw)
public function integer of_descliente (integer an_cliente, integer an_sucursal, string as_tpped)
end prototypes

event ue_cambio_estado();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 23 de Noviembre de 2002 HORA 11:32:17:906
// 
// Llama la ventana para hacer el cambio de estado
//////////////////////////////////////////////////////////////////////////

If il_fila=0 Then
	MessageBox("Advertencia!","Debe seleccionar un registro del detalle para hacer el cambio de estado",StopSign!)
	Return
End If

long ll_sol

ll_sol=dw_solicitud.GetItemNumber(1,"nu_solicitud")

If IsNull(ll_sol) Then ll_sol=0

If ll_sol=0 Then
	MessageBox("Advertencia!","Guarde los datos para asignarle un n$$HEX1$$fa00$$ENDHEX$$mero a la solicitud, antes de modificar el estado del detalle.",StopSign!)
	Return
End If
n_cst_param lo_param

lo_param.il_vector[1]=2  //fabrica
lo_param.il_vector[2]=ll_sol  //fabrica

lo_param.il_vector[3]=dw_detalle.GetItemNumber(il_fila,"cs_digitacion")

lo_param.is_vector[1]=dw_solicitud.GetItemString(1,"tipo_solicitud")

OpenWithParm(w_cambio_estado_solicitud,lo_param)

//////////////////////////////////////////////////////////////////////////
// Refresco el dw de detalle
// 
//////////////////////////////////////////////////////////////////////////

dw_detalle.Retrieve(2,ll_sol)
end event

event ue_informe();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 05 de Marzo de 2003 HORA 08:36:27:781
// 
// 
//////////////////////////////////////////////////////////////////////////
If dw_solicitud.RowCount()=0 Then
	Return 
End If

n_cst_param lo_param

lo_param.il_vector[1]=dw_solicitud.GetItemNumber(1,"co_fabrica")
lo_param.il_vector[2]=dw_solicitud.GetItemNumber(1,"nu_solicitud")

lo_param.is_vector[1]=dw_solicitud.GetItemString(1,"de_cliente")
lo_param.is_vector[2]=dw_solicitud.GetItemString(1,"de_pais")
lo_param.is_vector[3]=dw_solicitud.GetItemString(1,"de_por")

OpenSheetWithParm(w_inf_solicitud,lo_param,ParentWindow(),2,Original! )
end event

public function integer of_haydatos (datawindow a_dw);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 26 de Septiembre de 2002 HORA 11:56:53:906
// 
// Verifica si existen o no tallas
//////////////////////////////////////////////////////////////////////////


of_borraBlancos(a_dw)

If a_dw.RowCount()>0 Then
	Return 1
Else
	Return -1
End If
end function

public function integer of_grabar ();dwItemStatus ldws_status
Long   ll_solicitud,ll_cons
Int    li_i
String ls_tpslct

ldws_status = dw_solicitud.GetItemStatus(1,0,Primary! )

If ldws_status = New! Or ldws_status = NewModified! Then
	ll_solicitud = n_cst_application.of_Consecutive(n_cst_application.ii_fabrica,40,n_cst_application.itr_appl)
	
	If ll_solicitud = -1 Then
		Return -1
	ElseIf ll_solicitud = -2 Then
		MessageBox("Advertencia!","El tipo de consecutivo no existe.")
		Return -1
	End If
	dw_solicitud.SetItem(1,"nu_solicitud",ll_solicitud)
Else
	ll_solicitud = dw_solicitud.GetItemNumber(1,"nu_solicitud")
End If

ls_tpslct = dw_solicitud.GetItemString(1,"tipo_solicitud")

dw_solicitud.SetItem(1,"co_fabrica",n_cst_application.ii_fabrica)
dw_solicitud.SetItem(1,"usuario",n_cst_application.is_user)
dw_solicitud.SetItem(1,"instancia",n_cst_application.is_InstanciaDbApp)

ll_cons = Long(dw_detalle.Describe("Evaluate('max(cs_digitacion for all)', 0)"))


For li_i = 1 To dw_detalle.RowCount()
	
	ldws_status = dw_detalle.GetItemStatus(li_i,0,Primary! )

	If ldws_status = New! Or ldws_status = NewModified! Then
		ll_cons ++

		dw_detalle.SetItem(li_i,"cs_digitacion",ll_cons)
		dw_detalle.SetItem(li_i,"nu_solicitud",ll_solicitud)
		dw_detalle.SetItem(li_i,"tipo_solicitud",ls_tpslct)
	End If
	
	dw_detalle.SetItem(li_i,"co_fabrica",n_cst_application.ii_fabrica)
	dw_detalle.SetItem(li_i,"usuario",n_cst_application.is_user)
	dw_detalle.SetItem(li_i,"instancia",n_cst_application.is_InstanciaDbApp)
	
	
//////////////////////////////////////////////////////////////////////////
// Cuando el pedido es nacional se coloca un espacio en blanco en co_color_exp
// Martha oct 3 de 2002
//////////////////////////////////////////////////////////////////////////
	If ls_tpslct="NA" Then
		dw_detalle.SetItem(li_i,"co_color_exp"," ")
	End If
Next 

Return 0
end function

public function string of_usuarioJefe (string a_usuario);String ls_res

  SELECT m_ctecnico.co_usuario_jefe  
    INTO :ls_res  
    FROM m_ctecnico  
   WHERE m_ctecnico.co_ctecnico = :a_usuario using n_cst_application.itr_appl  ;

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return ""
End If

If n_cst_application.itr_appl.SQLcode=100 Then
	Return ""
End If

Return ls_res

end function

public function integer of_panel ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 02 de Agosto de 2003 HORA 15:50:18:692
// 
// funcion para colocar un panel inm$$HEX1$$f300$$ENDHEX$$vil a la izquierda
//////////////////////////////////////////////////////////////////////////

dw_panel.dataobject=dw_detalle.dataobject
dw_detalle.shareData(dw_panel)

dw_panel.of_color("co_ref_exp",0)
dw_panel.of_color("co_talla_exp",0)
dw_panel.of_color("co_color_exp",0)


Return 1
end function

public function integer of_verificar ();String  ls_tpped,ls_ref,ls_talla,ls_color
Integer li_cliente,li_sucursal,li_tpslct,li_i
long 		ll_color
Decimal ldec_cnt



ls_tpped = Trim(dw_solicitud.GetItemString(1,"tipo_solicitud"))

If IsNull(ls_tpped) Or ls_tpped = '' Then
	MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe seleccionar el tipo de solicitud")
	dw_solicitud.SetFocus()
	dw_solicitud.SetColumn("tipo_solicitud")
	Return -1
End If


Date ld_fe_entrega

ld_fe_entrega=dw_solicitud.GetItemDate(1,"fe_entrega")

If IsNull(ld_fe_entrega) Then
	MessageBox("Advertencia!","Fecha de entrega no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	Return -1
End If
date lda_fe_solicitud_cl,lda_fe_entrega

lda_fe_solicitud_cl=dw_solicitud.GetItemDate(1,"fe_solicitud_cl")
lda_fe_entrega=dw_solicitud.GetItemDate(1,"fe_entrega")

If lda_fe_solicitud_cl>=lda_fe_entrega Then
	MessageBox("Advertencia!","La fecha se solicitud no puede ser superior a la fecha de entrega.",StopSign!)
	Return -1
End If

li_cliente  = dw_solicitud.GetItemNumber(1,"co_cliente")
li_sucursal = dw_solicitud.GetItemNumber(1,"co_sucursal")

If IsNull(li_cliente) Or isNull(li_sucursal) Then
	MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe indicar el codigo del cliente.")
	dw_solicitud.SetFocus()
	dw_solicitud.SetColumn("co_cliente")
	Return -1
End If


li_tpslct = dw_solicitud.GetItemNumber(1,"co_tipo_solicitud")

If IsNull(li_tpslct) Or li_tpslct = 0 Then
	MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe indicar el tipo de solicitud.")
	dw_solicitud.SetFocus()
	dw_solicitud.SetColumn("co_tipo_solicitud")
	Return -1
End If


For li_i = 1 To dw_detalle.RowCount()
	ls_ref   = Trim(dw_detalle.GetItemString(li_i,"co_ref_exp"))
	ls_talla = Trim(dw_detalle.GetItemString(li_i,"co_talla_exp"))
	ls_color = Trim(dw_detalle.GetItemString(li_i,"co_color_exp"))
	ldec_cnt = dw_detalle.GetItemDecimal(li_i,"ca_solicitada")
	ll_color= dw_detalle.GetItemNumber(li_i,"co_color")
	
	If IsNull(ls_ref) Or ls_ref = '' Then
		MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe indicar la referencia en la l$$HEX1$$ed00$$ENDHEX$$nea " + String(li_i) + ".")
		dw_detalle.SetFocus()
		dw_detalle.SetRow(li_i)
		dw_detalle.SetColumn("co_ref_exp")
		Return -1
	End If
	
//	If IsNull(ls_talla) Or ls_talla = '' Then
//		MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe indicar la talla en la l$$HEX1$$ed00$$ENDHEX$$nea " + String(li_i) + ".")
//		dw_detalle.SetFocus()
//		dw_detalle.SetRow(li_i)
//		dw_detalle.SetColumn("co_talla_exp")
//		Return -1
//	End If
//	If ls_tpped="EX" Then
//		If IsNull(ls_color) Or ls_color = '' Then
//			MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe indicar el color en la l$$HEX1$$ed00$$ENDHEX$$nea " + String(li_i) + ".")
//			dw_detalle.SetFocus()
//			dw_detalle.SetRow(li_i)
//			dw_detalle.SetColumn("co_color_exp")
//			Return -1
//		End If
//	Else
//		If IsNull(ll_color)  Then
//			MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe indicar el color en la l$$HEX1$$ed00$$ENDHEX$$nea " + String(li_i) + ".")
//			dw_detalle.SetFocus()
//			dw_detalle.SetRow(li_i)
//			dw_detalle.SetColumn("co_color")
//			Return -1
//		End If		
//	End If
//	
	If IsNull(ldec_cnt) Or ldec_cnt = 0 Then
		MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe indicar la cantidad en la l$$HEX1$$ed00$$ENDHEX$$nea " + String(li_i) + ".")
		dw_detalle.SetFocus()
		dw_detalle.SetRow(li_i)
		dw_detalle.SetColumn("ca_solicitada")
		Return -1
	End If
Next

Return 0
end function

public function integer of_borrablancos (datawindow a_dw);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 26 de Septiembre de 2002 HORA 11:53:43:031
// 
// Borra las filas en blanco
//////////////////////////////////////////////////////////////////////////

long i

For i=1 to a_dw.RowCount()
	If  a_dw.GetItemStatus(i,0,Primary!)=New! Then
		a_dw.DeleteRow(i)
		i --
	End If
Next

Return 1
end function

public function integer of_descliente (integer an_cliente, integer an_sucursal, string as_tpped);String ls_descliente,ls_desejecutiva,ls_depais
Int    li_pais,li_ejecutiva



//Buscamos la descripci$$HEX1$$f300$$ENDHEX$$n del cliente como el pa$$HEX1$$ed00$$ENDHEX$$s y la ejecutiva de cuenta.
If as_tpped = "EX" Or as_tpped = "XD" Then
	select de_cliente,
			 co_pais,
			 co_ejecutiva
	  into :ls_descliente,
			 :li_pais,
			 :li_ejecutiva  
	  from m_clientes_exp  
	 where co_cliente = :an_cliente and
			 co_sucursal = :an_sucursal using n_cst_application.itr_appl ;
Else
	select de_cliente
     into :ls_descliente
     from m_clientes  
    where co_cliente = :an_cliente and
			 co_sucursal = :an_sucursal using n_cst_application.itr_appl ;
	
	ls_depais = 'COLOMBIA'
End If


If n_cst_application.itr_appl.SqlCode = -1 Then
	MessageBox("Advertencia!","Hubo un error al consultar el cliente.~n~nNota: " + n_cst_application.itr_appl.SqlErrText )
	Return 2
ElseIf n_cst_application.itr_appl.SqlCode = 100 Then
	MessageBox("Advertencia!","El cliente no existe. Por favor revisar.")
	Return 2
End If

dw_solicitud.SetItem(1,"de_cliente",ls_descliente)

//Buscamos la descripci$$HEX1$$f300$$ENDHEX$$n del pa$$HEX1$$ed00$$ENDHEX$$s.
select de_pais  
  into :ls_depais  
  from m_paises  
 where co_pais = :li_pais using n_cst_application.itr_appl ;

If n_cst_application.itr_appl.SqlCode = -1 Then
	MessageBox("Advertencia!","Hubo un error al consultar la descripci$$HEX1$$f300$$ENDHEX$$n del cliente.~n~nNota: " + n_cst_application.itr_appl.SqlErrText )
	Return 1
//ElseIf n_cst_application.itr_appl.SqlCode = 100 Then
//	MessageBox("Advertencia!","El pa$$HEX1$$ed00$$ENDHEX$$s relacionado con el cliente no existe. Por favor revisar.")
//	Return 1
End If

dw_solicitud.SetItem(1,"de_pais",ls_depais)


//Buscamos la descripci$$HEX1$$f300$$ENDHEX$$n del asesor de la siguiente manera: si el tipo de 
//pedido es EX se busca en m_ejecutivas_exp de lo contrario en m_vendedor.
If as_tpped = "EX" Or as_tpped = "XD" Then
	
	select de_ejecutiva  
     into :ls_desejecutiva  
     from m_ejecutivas_exp  
    where co_ejecutiva = :li_ejecutiva  using n_cst_application.itr_appl ;
	 
Else
	select m_vend_linea.co_vendedor,   
          m_vendedor.de_vendedor  
     into :li_ejecutiva,   
          :ls_desejecutiva  
    FROM m_vend_linea,   
         m_vendedor  
   WHERE ( m_vend_linea.co_vendedor = m_vendedor.co_vendedor ) and  
         ( m_vend_linea.co_fabrica = 2 ) AND  
         ( m_vend_linea.co_linea = 99 ) AND  
         ( m_vend_linea.co_cliente = :an_cliente ) AND  
         ( m_vend_linea.co_sucursal = :an_sucursal  )   ;

End If

If n_cst_application.itr_appl.SqlCode = -1 Then
	MessageBox("Advertencia!","Hubo un error al consultar la descripci$$HEX1$$f300$$ENDHEX$$n del asesor.~n~nNota: " + n_cst_application.itr_appl.SqlErrText )
	Return 2
//ElseIf n_cst_application.itr_appl.SqlCode = 100 Then
//	MessageBox("Advertencia!","El asesor no existe. Por favor revisar.")
//	Return 1
End If

dw_solicitud.SetItem(1,"co_ejecutiva",li_ejecutiva)
dw_solicitud.SetItem(1,"de_por",ls_desejecutiva)


//////////////////////////////////////////////////////////////////////////
// Se asigna el personaje de control t$$HEX1$$e900$$ENDHEX$$cnico
// an_cliente,an_sucursal
//////////////////////////////////////////////////////////////////////////
String ls_usuario

  SELECT cliente_ctecnico.co_ctecnico  
    INTO :ls_usuario  
    FROM cliente_ctecnico  
   WHERE ( cliente_ctecnico.tipo_cliente = :as_tpped ) AND  
         ( cliente_ctecnico.co_cliente = :an_cliente ) AND  
         ( cliente_ctecnico.co_sucursal = :an_sucursal )  
			using n_cst_application.itr_appl;
			
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If
			
If n_cst_application.itr_appl.SQLcode=100 Then 
	MessageBox("Advertencia!","No se determino el funcionario de control t$$HEX1$$e900$$ENDHEX$$cnico, por favor verifique.",StopSign!)
	Return -1
End If

dw_solicitud.SetItem(1,"co_ctecnico",ls_usuario)


Return 0
end function

on w_solicitud.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_sheet_solicitud" then this.MenuID = create m_sheet_solicitud
this.dw_detalle=create dw_detalle
this.dw_solicitud=create dw_solicitud
this.gb_head=create gb_head
this.dw_panel=create dw_panel
this.gb_detalle=create gb_detalle
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_detalle
this.Control[iCurrent+2]=this.dw_solicitud
this.Control[iCurrent+3]=this.gb_head
this.Control[iCurrent+4]=this.dw_panel
this.Control[iCurrent+5]=this.gb_detalle
end on

on w_solicitud.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_detalle)
destroy(this.dw_solicitud)
destroy(this.gb_head)
destroy(this.dw_panel)
destroy(this.gb_detalle)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 29 de Enero de 2003 HORA 14:55:17:109
// 
// 
//////////////////////////////////////////////////////////////////////////


n_cst_comun lo_comun

long ll_res
lds_colores = Create n_ds_base 
lds_colores.Of_Load("d_lista_colores_x_cliente")
lds_colores.Of_Conexion(n_cst_application.itr_appl,False)
//////////////////////////////////////////////////////////////////////////
// Carga la lista de empresas del usuario logueado...
// 
//////////////////////////////////////////////////////////////////////////
dw_solicitud.getChild("co_fabrica",idc_fabrica)
idc_fabrica.SetTransObject(n_cst_application.itr_appl)
If idc_fabrica.Retrieve(n_cst_application.is_user)<=0 Then
	MessageBox("Advertencia!","El usuario no tiene fabricas asignadas.",StopSign!)
	Return
End If


dw_detalle.getChild("co_linea",idc_linea)
lo_comun.of_loadDddw(idc_linea,-1,n_cst_application.itr_appl)

dw_solicitud.SetTransObject(n_cst_application.itr_appl)
dw_detalle.SetTransObject(n_cst_application.itr_appl)

ll_res=dw_detalle.getChild("co_talla_exp",idc_talla_exp)

lo_comun.of_loadDddw(idc_talla_exp,-1,-1,n_cst_application.itr_appl)

//dw_solicitud.InsertRow(0)

//////////////////////////////////////////////////////////////////////////
// Se asigna como fecha de solicitud, la del servdidor
// 
//////////////////////////////////////////////////////////////////////////



String ls_usuario,ls_instancia

long i,ll_tot

DwItemStatus l_status

	//Tambien actualizar fecha,usuario,instancia
	If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
													 idt_fecha_hoy,ls_usuario,ls_instancia) Then
		Return -1
	End If
	
of_panel()
end event

event ue_save;call super::ue_save;String ls_sqlerr, ls_msg, ls_cliente



If dw_solicitud.AcceptText() = -1 Then 
	MessageBox("Advertencia!","Datos de solicitud no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If
If dw_detalle.AcceptText() = -1 Then 
	MessageBox("Advertencia!","Datos de detalle no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If

of_borraBlancos(dw_detalle)

If dw_solicitud.RowCount() > 0 Then
	If Of_Verificar() = -1 Then Return
	
	If Of_Grabar() = -1 Then 
		ls_sqlerr = n_cst_application.itr_appl.SqlErrText
		rollback using n_cst_application.itr_appl ;
		MessageBox("Advertencia!","No se pudo grabar los datos de la solicitud.~n~nNota: " + ls_sqlerr)
		Return
	End If
	
	If dw_solicitud.Update() = -1 Then
		ls_sqlerr = n_cst_application.itr_appl.SqlErrText
		rollback using n_cst_application.itr_appl ;
		MessageBox("Advertencia!","No se pudo grabar los datos de la solicitud.~n~nNota: " + ls_sqlerr)
		Return
	ElseIf dw_detalle.Update() = -1 Then 
		ls_sqlerr = n_cst_application.itr_appl.SqlErrText
		rollback using n_cst_application.itr_appl ;
		MessageBox("Advertencia!","No se pudo grabar los datos del detalle.~n~nNota: " + ls_sqlerr)
		Return
	End If
ElseIf dw_solicitud.DeletedCount() > 0 Then
	If dw_detalle.Update() = -1 Then
		ls_sqlerr = n_cst_application.itr_appl.SqlErrText
		rollback using n_cst_application.itr_appl ;
		MessageBox("Advertencia!","No se pudo grabar los datos del detalle.~n~nNota: " + ls_sqlerr)
		Return
	ElseIf dw_solicitud.Update() = -1 Then 
		ls_sqlerr = n_cst_application.itr_appl.SqlErrText
		rollback using n_cst_application.itr_appl ;
		MessageBox("Advertencia!","No se pudo grabar los datos de la solicitud.~n~nNota: " + ls_sqlerr)
		Return
	End If
	
End If

commit using n_cst_application.itr_appl ;

long ll_solicitud

ll_solicitud=dw_solicitud.GetItemNumber(1,"nu_solicitud")

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Solicitud "+String(ll_solicitud)+" guardada satisfactoriamente.")

//////////////////////////////////////////////////////////////////////////
// Se envia el correo por DB y por el exchange
// 
//////////////////////////////////////////////////////////////////////////

String ls_usuario,ls_jefe
long ll_res
long ll_fabrica
n_cst_comun lo_msg

ls_usuario=dw_solicitud.GetItemString(1,"co_ctecnico")
ls_jefe=Trim(of_usuarioJefe(ls_usuario))

//If ls_jefe<>ls_usuario Then
//	ls_usuario+=";"+ls_jefe
//End If

ll_fabrica=dw_solicitud.GetItemNumber(1,"co_fabrica")

ll_res=lo_msg.of_correodb( n_cst_application.is_user, ls_usuario, &
		 "Solicitud "+String(ll_solicitud), "Se creo la solicitud "+String(ll_solicitud))

If ll_res<>1 Then
	MessageBox("Advertencia!","No se pudo enviar el correo.",StopSign!)
	Return
End If

Commit using n_cst_application.itr_appl;

//////////////////////////////////////////////////////////////////////////
// Aca se envia el correo normal
// 
//////////////////////////////////////////////////////////////////////////

ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea notificar con un correo el cambio realizado ?",Question!,YesNo!,2)
If ll_res=1 Then
	
	/*Dbedocal 2018-05-11
	n_ms_base lo_mail

	string ls_msg,ls_cliente
	lo_mail=Create n_ms_base
	ls_cliente=Trim(dw_solicitud.GetItemString(1,"de_cliente"))
	
	If IsNull(ls_cliente) Then ls_cliente=""
	ls_msg="Se cre$$HEX2$$f3002000$$ENDHEX$$o actualiz$$HEX2$$f3002000$$ENDHEX$$la solicitud de desarrollo n$$HEX1$$fa00$$ENDHEX$$mero "+&
	String(ll_solicitud)+", en la fabrica "+String(ll_fabrica)+" para el cliente "+&
	ls_cliente+". ~n~nEsta informaci$$HEX1$$f300$$ENDHEX$$n fue cargada al sistema por "+n_cst_application.is_user+"."
	
	lo_mail.of_sendmailoutlook( ls_usuario, "Solicitud "+String(ll_solicitud),&
	ls_msg)
	
	destroy n_ms_base
	*/
	uo_correo	lnv_correo
	lnv_correo = CREATE uo_correo
	
	ls_cliente=Trim(dw_solicitud.GetItemString(1,"de_cliente"))
	
	ls_msg=	"Se cre$$HEX2$$f3002000$$ENDHEX$$o actualiz$$HEX2$$f3002000$$ENDHEX$$la solicitud de desarrollo n$$HEX1$$fa00$$ENDHEX$$mero "+&
				String(ll_solicitud)+", en la fabrica "+String(ll_fabrica)+" para el cliente "+&
				ls_cliente+". ~n~nEsta informaci$$HEX1$$f300$$ENDHEX$$n fue cargada al sistema por "+n_cst_application.is_user+"."
	//Se envia correo al Usuario
	TRY
		lnv_correo.of_enviar_correo("Solicitud "+String(ll_solicitud), ls_msg, "usu_solicitud", ls_usuario)
	CATCH(Exception ex)
		Messagebox("Error", ex.getmessage())
	END TRY
	
	//Se envia correo al Jefe si este es diferente al Usuario
	If ls_jefe <> ls_usuario Then
		TRY
			lnv_correo.of_enviar_correo("Solicitud "+String(ll_solicitud), ls_msg, "usu_solicitud", ls_jefe)
		CATCH(Exception ex_jef)
			Messagebox("Error", ex_jef.getmessage())
		END TRY
	End If

	DESTROY lnv_correo
		
End If
postEvent("ue_informe")
end event

event ue_find;n_cst_param lou_param

Int    li_cliente,li_sucursal
String ls_tpped
long ll_fabrica

OpenWithParm(w_opc_solicitud,is_where)

lou_param = Message.PowerObjectParm
String ls_tipo_sol

n_cst_comun lo_comun
If IsValid(lou_param) Then
	
	is_where=lou_param.is_vector[1]
	
	If dw_solicitud.Retrieve(2,lou_param.il_vector[1]) > 0 Then
		
		ls_tipo_sol=dw_solicitud.getItemString(1,"tipo_solicitud")

		li_cliente  = dw_solicitud.GetItemNumber(1,"co_cliente")
		li_sucursal = dw_solicitud.GetItemNumber(1,"co_sucursal")

//////////////////////////////////////////////////////////////////////////
// Cuando la solicitud es de exportacion, se cargan las tallas de
// exportacion
//////////////////////////////////////////////////////////////////////////

		If ls_tipo_sol="EX" Then
			dw_detalle.DataObject="d_dt_solicitudes_ex1"
			dw_detalle.SetTransObject(n_cst_application.itr_appl)	
			
			dw_detalle.getChild("co_talla_exp",idc_talla_exp)
	
			lo_comun.of_loadDddw(idc_talla_exp,li_cliente,li_sucursal,n_cst_application.itr_appl)	
		Else
			dw_detalle.DataObject="d_dt_solicitudes1"
			dw_detalle.SetTransObject(n_cst_application.itr_appl)	
		End If
		of_panel()
		
		Long ll_res
		
		ll_res = dw_detalle.getChild("co_linea",idc_linea)
		
		If ll_res=1 Then
			lo_comun.of_loadDddw(idc_linea,ll_fabrica,n_cst_application.itr_appl)					
		End If

		
		dw_detalle.of_size_dddw()
		ll_fabrica=dw_solicitud.GetItemNumber(1,"co_fabrica")		
		
			
		dw_detalle.Retrieve(2,lou_param.il_vector[1])
		of_descliente(li_cliente,li_sucursal,ls_tipo_sol)
	End If
End If
//////////////////////////////////////////////////////////////////////////
// Cargo las lineas dependiendo de la fabrica
// 
//////////////////////////////////////////////////////////////////////////
If dw_solicitud.RowCount()=0 Then Return

ll_fabrica=dw_solicitud.GetItemNumber(1,"co_fabrica")

lo_comun.of_loadDddw(idc_linea, ll_fabrica, n_cst_application.itr_appl)

//////////////////////////////////////////////////////////////////////////
// coloco la descripcion de los colores
// 
//////////////////////////////////////////////////////////////////////////

	ls_tipo_sol=dw_solicitud.GetItemString(1,"tipo_solicitud")
	
	ll_fabrica=dw_solicitud.GetItemNumber(1,"co_fabrica")

Long i,ll_linea
String ls_color,ls_co_color

For i=1 to dw_detalle.RowCount()
	ll_linea=dw_detalle.GetItemNumber(i,"co_linea")
	ls_co_color=dw_detalle.getItemString(i,"co_color_exp")
	If ls_tipo_sol="NA" Then
		lo_comun.of_nombreColor(ll_fabrica,ll_linea,long(ls_co_color),n_cst_application.itr_appl)
		ls_color=lo_comun.of_getString(1)
		dw_detalle.SetItem(i,"de_color",ls_color)
	Else
		//ls_color=of_descolorexp(li_cliente,li_sucursal,ls_co_color)
	End If		
	
Next

end event

type dw_detalle from u_dw_application within w_solicitud
integer x = 133
integer y = 468
integer width = 2519
integer height = 1280
integer taborder = 20
string dataobject = "d_dt_solicitudes_ex1"
boolean hscrollbar = true
end type

event getfocus;call super::getfocus;gb_detalle.of_color(True)
end event

event losefocus;call super::losefocus;gb_detalle.of_color(False)
end event

event ue_dwnprocessenter;If this.AcceptText() < 0 Then
  Return 1
End If

If GetRow()=RowCount() Then
	If GetColumn()=15 Then
		Trigger Event ue_InsertRow()
		If DataObject="d_dt_solicitudes_ex1" Then
			SetColumn(5) //estilo
		Else
			SetColumn(8) //linea aparece en nal
		End If
		This.Object.DataWindow.HorizontalScrollPosition=0
		Return 1
	End If
End If

Send(Handle(this),256,9,Long(0,0))
Return 1
end event

event ue_insertrow;
If dw_solicitud.RowCount() = 0 Then
	Return
End If

long ll_f

ll_f=InsertRow(0)


ScrollToRow(ll_f)
end event

event itemfocuschanged;call super::itemfocuschanged;n_cst_param lou_param
Integer	li_cliente,li_sucursal
String  	ls_ref,ls_talla,ls_tipo_sol
long 		ll_linea,ll_fabrica

s_cambio_color lst_parm

If /*dwo.Name = "co_color_exp" or*/ dwo.name="co_color" Then
	
	ls_tipo_sol=dw_solicitud.GetItemString(1,"tipo_solicitud")
	
	li_cliente  = dw_solicitud.GetItemNumber(1,"co_cliente")
	li_sucursal = dw_solicitud.GetItemNumber(1,"co_sucursal")
	ll_fabrica=dw_solicitud.GetItemNumber(1,"co_fabrica")
	
	ll_linea=GetItemNumber(Row,"co_linea")
	
	ls_ref      = Trim(This.GetItemString(Row,"co_ref_exp"))
	ls_talla    = Trim(This.GetItemString(Row,"co_talla_exp"))
	
	If IsNull(li_cliente) Then
		MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Antes debe indicar el cliente.")
		dw_solicitud.SetFocus()
		dw_solicitud.SetColumn("co_cliente")
		Return
	End If
	
	If IsNull(li_sucursal) Then
		MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Antes debe indicar la sucursal.")
		dw_solicitud.SetFocus()
		dw_solicitud.SetColumn("co_sucursal")
		Return
	End If
	If dataobject="d_dt_solicitudes" Then
		If IsNull(ll_linea) Then
			MessageBox("Advertencia!","Debe especificar la l$$HEX1$$ed00$$ENDHEX$$nea",StopSign!)
			SetColumn("co_linea")
			Return
		End If
	End If

	If IsNull(ls_ref) Or Trim(ls_ref) = '' Then
		MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Antes debe indicar la referencia.")
		This.SetColumn("co_ref_exp")
		Return
	End If
	
	If IsNull(ls_talla) Or Trim(ls_talla) = '' Then
		MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Antes debe indicar la talla.")
		This.SetColumn("co_talla_exp")
		Return
	End If
	
	If ls_tipo_sol="NA" Then
		lds_colores.DataObject="d_dddw_m_colores"
		lds_colores.SetTransObject(n_cst_application.itr_appl)
		lds_colores.Retrieve(ll_fabrica,ll_linea)
		lst_parm.num1=ll_fabrica
		lst_parm.num2=ll_linea
		lst_parm.ds1=lds_colores
	Else
		lds_colores.DataObject="d_dddw_m_colores_exp"
		lds_colores.SetTransObject(n_cst_application.itr_appl)
		lds_colores.Retrieve(li_cliente,li_sucursal)
		lst_parm.num1=li_cliente
		lst_parm.num2=li_sucursal
		lst_parm.ds1=lds_colores		
	End If	
		
	OpenWithParm(w_lista_colore_x_cliente,lst_parm)
	lou_param=Message.PowerObjectParm
	If IsValid(lou_param) Then
		If dataobject="d_dt_solicitudes_ex" Then
			This.SetItem(Row,"co_color_exp",lou_param.is_vector[1])
		Else
			This.SetItem(Row,"co_color",Long(lou_param.is_vector[1]))
		End If
		
		This.SetItem(Row,"de_color",lou_param.is_vector[2])
		This.SetColumn("ca_solicitada")
	End If
End If

end event

event doubleclicked;call super::doubleclicked;long ll_f

If Row=0 Then Return

If dwo.name="filaa" Then
	This.RowsCopy(Row,Row,Primary!,This,row,Primary!)
End If
end event

event clicked;call super::clicked;If row=0 Then Return

SelectRow(0,false)
SelectRow(row,true)

il_fila=row
end event

event ue_deleterow;call super::ue_deleterow;il_fila=0
end event

event scrollvertical;call super::scrollvertical;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 02 de Agosto de 2003 HORA 15:44:46:080
// 
// 
//////////////////////////////////////////////////////////////////////////


dw_panel.Object.datawindow.verticalscrollposition = scrollpos
end event

type dw_solicitud from u_dw_application within w_solicitud
integer x = 50
integer y = 60
integer width = 3483
integer height = 336
string dataobject = "d_h_solicitudes"
boolean vscrollbar = false
end type

event getfocus;call super::getfocus;gb_head.of_color(True)
end event

event losefocus;call super::losefocus;gb_head.of_color(False)
end event

event itemchanged;call super::itemchanged;long ll_res
n_cst_comun lo_comun
long    ll_null
String  ls_null

If il_err_item_change<>0 Then
	Return 2
End If

Integer li_cliente,li_sucursal
long    ll_fabrica
String  ls_tpped,ls_tipo_sol

If dwo.name="tipo_solicitud" Then
	SetNull(ll_null)
	SetNUll(ls_null)
	If of_hayDatos(dw_detalle)=1 Then
		MessageBox("Advertencia!","Existen detalles, y no se puede modificar el dato.",StopSign!)
		Return 2
	End If
	
	If data<>"NA" and data<>"EX" Then
		MessageBox("Advertencia!","Debe ser nacional o exportaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
		Return 2
	End If
	
	If data="EX" Then
		dw_detalle.DataObject="d_dt_solicitudes_ex1"
	Else
		dw_detalle.DataObject="d_dt_solicitudes1"
	End If
   of_panel()
	
	
	dw_detalle.of_size_dddw()
	ll_fabrica=GetItemNumber(1,"co_fabrica")
	
	dw_detalle.SetTransObject(n_cst_application.itr_appl)	
	
	ll_res=dw_detalle.getChild("co_linea",idc_linea)
	If ll_res=1 Then
		lo_comun.of_loadDddw(idc_linea,ll_fabrica,n_cst_application.itr_appl)
	End If
	SetItem(1,"co_cliente",ll_null)
	SetItem(1,"co_sucursal",ll_null)
	SetItem(1,"de_cliente",ls_null)
	SetItem(1,"de_pais",ls_null)
	SetItem(1,"de_por",ls_null)
End If
If dwo.name="co_fabrica" Then
	If of_hayDatos(dw_detalle)=1 Then
		MessageBox("Advertencia!","Existen detalles, y no se puede modificar el dato.",StopSign!)
		Return 2
	End If
	ll_fabrica=Long(Data)
	lo_comun.of_loadDddw(idc_linea,ll_fabrica,n_cst_application.itr_appl)
End If


If dwo.Name = "co_cliente" Then
	
	li_cliente  = Integer(Data)
	li_sucursal = This.GetItemNumber(Row,"co_sucursal")
	
	ls_tpped = Trim(This.GetItemString(Row,"tipo_solicitud"))
	
	If IsNull(ls_tpped) Or ls_tpped = '' Then
		MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Antes de indicar el cliente por favor seleccione el tipo de solicitud.")
		Return 2
	End If
	ls_tipo_sol=GetItemString(1,"tipo_solicitud")
	If ls_tipo_sol="EX" Then
		lo_comun.of_loadDddw(idc_talla_exp,li_cliente,li_sucursal,n_cst_application.itr_appl)
	End If
	If Not IsNull(li_sucursal) Then Return Parent.of_descliente(li_cliente,li_sucursal,ls_tpped)
		
End If


If dwo.Name = "co_sucursal" Then
	
	li_cliente  = This.GetItemNumber(Row,"co_cliente")
	li_sucursal = Integer(Data)
	
	ls_tpped = Trim(This.GetItemString(Row,"tipo_solicitud"))
	
	If IsNull(ls_tpped) Or ls_tpped = '' Then
		MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Antes de indicar el cliente por favor seleccione el tipo de solicitud.")
		Return 2
	End If
	ls_tipo_sol=GetItemString(1,"tipo_solicitud")
	If ls_tipo_sol="EX" Then
		lo_comun.of_loadDddw(idc_talla_exp,li_cliente,li_sucursal,n_cst_application.itr_appl)	
	End If
	If Not IsNull(li_cliente) Then Return Parent.of_descliente(li_cliente,li_sucursal,ls_tpped)
		
End If

If dwo.name="fe_entrega" Then
//////////////////////////////////////////////////////////////////////////
// Se deben calcular 5 dias habiles hacia atras de la fecha de entrega, para
// tener la fecha en que se debe terminar en planta
//////////////////////////////////////////////////////////////////////////
	long ll_r1
	n_cst_comun lo_d
	Date ld_f1,ld_f2
	ld_f1=Date(Data)
	If Date(idt_fecha_hoy)>=ld_f1 Then
		MessageBox("Advertencia!","La fecha de entrega, debe ser superior a la del sistema.",StopSign!)
		Return 2
	End If

		
	ll_r1=lo_d.of_get_fecha_habil(ld_f1,ld_f2,-1,0,0)

	If ll_r1<>1 Then
		MessageBox("Advertencia!","No se pudo determinar la fecha final.",StopSign!)
		Return 2 
	End If
	
	If Date(idt_fecha_hoy)>=ld_f2 Then
		MessageBox("Advertencia!","La fecha no es v$$HEX1$$e100$$ENDHEX$$lida, intente con una 2 d$$HEX1$$ed00$$ENDHEX$$as h$$HEX1$$e100$$ENDHEX$$biles posterior a la del sistema.",StopSign!)
		Return 2
	End If

	SetItem(1,"fe_fabricacion",ld_f2)
End If
end event

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////
// Se abre la ventana para seleccionar
// 
//////////////////////////////////////////////////////////////////////////
If Row=0 Then Return

String ls_tipo_sol

n_cst_param lo_param

lo_param.il_vector[1]=0

If dwo.name="co_cliente" or dwo.name="co_sucursal" Then
		
	ls_tipo_sol=GetItemString(1,"tipo_solicitud")
	
	If IsNull(ls_tipo_sol) Then
		MessageBox("Advertencia!","Debe especificar el tipo de solicitud.",StopSign!)
		Return
	End If
	lo_param.is_vector[1]=is_where_cliente
	lo_param.is_vector[2]=ls_tipo_sol
	OpenWithParm(w_opc_cliente,lo_param)
	lo_param=Message.PowerObjectParm
//////////////////////////////////////////////////////////////////////////
// Si seleccionan algo en la ventana, entonces asigna el cliente, la sucursal y 
// llama el evento
//////////////////////////////////////////////////////////////////////////
	
	If IsValid(lo_param) Then
		SetItem(1,"co_cliente",lo_param.il_vector[1])
		SetItem(1,"co_sucursal",lo_param.il_vector[2])
		is_where_cliente=lo_param.is_vector[1]
		
		DWObject dwo_1
		dwo_1 = This.Object.co_cliente
		trigger event itemchanged(1,dwo_1,String(lo_param.il_vector[1]))
	End If
End If
end event

event ue_insertrow;Reset()
super::event ue_insertrow()
SetItem(1,"fe_solicitud",idt_fecha_hoy)

dw_detalle.Reset()
end event

event rbuttondown;call super::rbuttondown;datawindow ldw
ldw = this
if row < 1 then return 1

If dwo.name="fe_entrega" Then
	gf_dw_pop_calendar(ldw,dwo.name,dwo.coltype,row)
End If

end event

type gb_head from u_gb_base within w_solicitud
integer x = 27
integer y = 8
integer width = 3552
integer height = 400
integer taborder = 0
string text = "Solicitud de muestra"
end type

type dw_panel from u_dw_application within w_solicitud
boolean visible = false
integer x = 133
integer y = 468
integer width = 965
integer height = 1280
integer taborder = 30
boolean enabled = false
string dataobject = "d_dt_solicitudes_ex1"
boolean hscrollbar = true
end type

type gb_detalle from u_gb_base within w_solicitud
integer x = 27
integer y = 412
integer width = 3552
integer height = 1360
integer taborder = 0
string text = "Detalle de la solicitud"
end type

