HA$PBExportHeader$w_inf_solicitud.srw
$PBExportComments$Informe de la solicitud que se tiene seleccionada
forward
global type w_inf_solicitud from w_report
end type
type dw_1 from u_dw_application within w_inf_solicitud
end type
type gb_1 from groupbox within w_inf_solicitud
end type
end forward

global type w_inf_solicitud from w_report
integer width = 3634
integer height = 1960
string title = "Informe de solicitud"
boolean maxbox = false
windowstate windowstate = maximized!
dw_1 dw_1
gb_1 gb_1
end type
global w_inf_solicitud w_inf_solicitud

forward prototypes
public function integer of_recuperar ()
public function integer of_nombre_cliente (long a_cliente, long a_sucursal, string a_tipo_solicitud, ref string a_de_cliente, ref string a_de_pais, ref string a_ejecutiva)
end prototypes

public function integer of_recuperar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 29 de Abril de 2003 HORA 11:47:15:421
// 
// 
//////////////////////////////////////////////////////////////////////////
long ll_tot,ll_res

If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If
long ll_fabrica,ll_solicitud

ll_fabrica=dw_1.GetItemNumber(1,"fabrica")
ll_solicitud=dw_1.GetItemNumber(1,"solicitud")

ll_tot=dw_report.Retrieve(ll_fabrica,ll_solicitud)


If ll_tot<=0 Then 
	Return  -1
End If

//////////////////////////////////////////////////////////////////////////
// Se asigna el nombre del cliente
// 
//////////////////////////////////////////////////////////////////////////
Long 		ll_cliente,ll_sucursal
String 	ls_tipo_solicitud,ls_de_cliente,ls_de_pais, ls_ejecutiva

ll_cliente=dw_report.GetItemNumber(1,"co_cliente")
ll_sucursal=dw_report.GetItemNumber(1,"co_sucursal")
ls_tipo_solicitud=dw_report.GetItemString(1,"tipo_solicitud")

ll_res=of_nombre_cliente (ll_cliente,ll_sucursal, ls_tipo_solicitud,&
       ls_de_cliente, ls_de_pais, ls_ejecutiva )
		 
If ll_res=1 Then
	dw_report.SetItem(1,"de_cliente",ls_de_cliente)
   dw_report.SetItem(1,"de_pais",ls_de_pais)
   dw_report.SetItem(1,"de_por",ls_ejecutiva)

	DateTime ldt_fecha,ldt_crea
	String ls_usuario,ls_instancia



	//Tambien actualizar fecha,usuario,instancia
	If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
													 ldt_fecha,ls_usuario,ls_instancia) Then
		Return -1
	End If

	dw_report.Modify("usuario.text='"+ls_usuario+"'")
	dw_report.Modify("fecha.text='"+String(ldt_fecha,"YYYY/MM/DD hh:mm:ss")+"'")
End If

Return 1
end function

public function integer of_nombre_cliente (long a_cliente, long a_sucursal, string a_tipo_solicitud, ref string a_de_cliente, ref string a_de_pais, ref string a_ejecutiva);String ls_descliente,ls_desejecutiva,ls_depais
Int    li_pais,li_ejecutiva



//Buscamos la descripci$$HEX1$$f300$$ENDHEX$$n del cliente como el pa$$HEX1$$ed00$$ENDHEX$$s y la ejecutiva de cuenta.
If a_tipo_solicitud = "EX" Or a_tipo_solicitud= "XD" Then
	select de_cliente,
			 co_pais,
			 co_ejecutiva
	  into :ls_descliente,
			 :li_pais,
			 :li_ejecutiva  
	  from m_clientes_exp  
	 where co_cliente = :a_cliente and
			 co_sucursal = :a_sucursal using n_cst_application.itr_appl ;
Else
	select de_cliente
     into :ls_descliente
     from m_clientes  
    where co_cliente = :a_cliente and
			 co_sucursal = :a_sucursal using n_cst_application.itr_appl ;
	
	ls_depais = 'COLOMBIA'
End If


If n_cst_application.itr_appl.SqlCode = -1 Then
	MessageBox("Advertencia!","Hubo un error al consultar el cliente.~n~nNota: " + n_cst_application.itr_appl.SqlErrText )
	Return 2
ElseIf n_cst_application.itr_appl.SqlCode = 100 Then
	MessageBox("Advertencia!","El cliente no existe. Por favor revisar.")
	Return 2
End If

a_de_cliente=ls_descliente

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

a_de_pais=ls_depais


//Buscamos la descripci$$HEX1$$f300$$ENDHEX$$n del asesor de la siguiente manera: si el tipo de 
//pedido es EX se busca en m_ejecutivas_exp de lo contrario en m_vendedor.
If a_tipo_solicitud = "EX" Or a_tipo_solicitud = "XD" Then
	
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
         ( m_vend_linea.co_cliente = :a_cliente ) AND  
         ( m_vend_linea.co_sucursal = :a_sucursal  )   ;

End If

If n_cst_application.itr_appl.SqlCode = -1 Then
	MessageBox("Advertencia!","Hubo un error al consultar la descripci$$HEX1$$f300$$ENDHEX$$n del asesor.~n~nNota: " + n_cst_application.itr_appl.SqlErrText )
	Return 2
//ElseIf n_cst_application.itr_appl.SqlCode = 100 Then
//	MessageBox("Advertencia!","El asesor no existe. Por favor revisar.")
//	Return 1
End If

//dw_solicitud.SetItem(1,"co_ejecutiva",li_ejecutiva)
a_ejecutiva=ls_desejecutiva


Return 1
end function

on w_inf_solicitud.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.gb_1
end on

on w_inf_solicitud.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;call super::open;
n_cst_param lo_param
long ll_tot
lo_param=message.powerobjectParm

of_setDatawindow(dw_report)

dw_report.SetTransObject(n_cst_application.itr_appl)

dw_1.InsertRow(0)

If IsValid(lo_param) Then	
	dw_1.SetItem(1,"fabrica",lo_param.il_vector[1])
	dw_1.SetItem(1,"solicitud",lo_param.il_vector[2])
	of_recuperar()
Else
	dw_1.SetFocus()
End If

end event

event ue_find;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 29 de Abril de 2003 HORA 12:19:44:187
// 
// 
//////////////////////////////////////////////////////////////////////////
of_recuperar()
end event

event resize;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 29 de Abril de 2003 HORA 13:45:35:531
// 
// resize off
//////////////////////////////////////////////////////////////////////////

end event

type dw_report from w_report`dw_report within w_inf_solicitud
integer x = 32
integer y = 276
integer width = 3547
integer height = 1484
integer taborder = 20
string dataobject = "d_inf_h_solicitudes"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from u_dw_application within w_inf_solicitud
integer x = 160
integer y = 64
integer width = 759
integer height = 180
boolean bringtotop = true
string dataobject = "d_ext_solicitud1"
boolean vscrollbar = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 14 de Agosto de 2003 HORA 14:02:52:200
// 
// OverWrite!
//////////////////////////////////////////////////////////////////////////

end event

type gb_1 from groupbox within w_inf_solicitud
integer x = 23
integer y = 8
integer width = 1321
integer height = 252
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Datos de la solicitud"
end type

