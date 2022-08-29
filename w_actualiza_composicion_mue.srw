HA$PBExportHeader$w_actualiza_composicion_mue.srw
$PBExportComments$Para actualizar la composicion de las referencias de venta
forward
global type w_actualiza_composicion_mue from w_response
end type
type cb_2 from commandbutton within w_actualiza_composicion_mue
end type
type cb_1 from commandbutton within w_actualiza_composicion_mue
end type
type dw_1 from u_dw_application within w_actualiza_composicion_mue
end type
type gb_1 from groupbox within w_actualiza_composicion_mue
end type
end forward

global type w_actualiza_composicion_mue from w_response
integer width = 2697
integer height = 820
string title = "Composici$$HEX1$$f300$$ENDHEX$$n de la muestra"
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_actualiza_composicion_mue w_actualiza_composicion_mue

type variables
long il_fabrica,il_linea,il_referencia,il_talla,il_calidad,il_diseno,il_color,il_opcion,&
     il_muestrario,il_recurso_tejido, il_muestra

long il_fabricaVta,il_lineaVta,il_referenciaVta,il_tallaVta,il_calidadVta
end variables

forward prototypes
public function integer of_referenciaventa ()
end prototypes

public function integer of_referenciaventa ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 02 de Agosto de 2003 HORA 11:54:09:117
// 
// Se recupera la referencia de venta
//////////////////////////////////////////////////////////////////////////

  SELECT dt_vta_pdn.co_fabricav,   
         dt_vta_pdn.co_lineav,   
         dt_vta_pdn.co_referenciav,   
         dt_vta_pdn.co_tallav,   
         dt_vta_pdn.co_calidadv  
    INTO :il_fabricaVta,   
         :il_lineaVta,
         :il_referenciaVta,   
         :il_tallaVta,   
         :il_calidadVta  
    FROM dt_vta_pdn  
   WHERE ( dt_vta_pdn.co_fabrica = :il_fabrica ) AND  
         ( dt_vta_pdn.co_linea = :il_linea ) AND  
         ( dt_vta_pdn.co_referencia = :il_referencia ) AND  
         ( dt_vta_pdn.co_talla = :il_talla ) AND  
         ( dt_vta_pdn.co_calidad = :il_calidad )  
			using	n_cst_application.itr_appl	;

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

If n_cst_application.itr_appl.SQLcode=100 Then 
	Return -1
End If


Return 1


end function

on w_actualiza_composicion_mue.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.gb_1
end on

on w_actualiza_composicion_mue.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 02 de Agosto de 2003 HORA 11:41:42:956
// 
// se toma la referencia de produccion y se obtiene la de venta, con la que
// se recuperan los datos
//////////////////////////////////////////////////////////////////////////



n_cst_param lo_param

lo_param=message.PowerObjectParm

il_fabrica=lo_param.il_vector[1]
il_linea=lo_param.il_vector[2]
il_muestra=lo_param.il_vector[3]
il_talla=lo_param.il_vector[4]

long ll_res

dw_1.SetTransObject(n_cst_application.itr_appl)

ll_res=dw_1.Retrieve(il_fabrica,il_linea,il_muestra,il_talla)

n_cst_comun lo_comun

ll_res=lo_comun.of_nombreComposicion(dw_1.GetItemNumber(1,"co_composicion"),n_cst_application.itr_appl)
												
If ll_res<>1 Then
	MessageBox("Advertencia!","composici$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	Return 2
End If
dw_1.SetItem(1,"de_composicion",lo_comun.of_getstring(1))
end event

type cb_2 from commandbutton within w_actualiza_composicion_mue
integer x = 1307
integer y = 492
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_actualiza_composicion_mue
integer x = 955
integer y = 492
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Actualizar"
end type

event clicked;

//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 02 de Agosto de 2003 HORA 13:27:45:793
// 
// 
//////////////////////////////////////////////////////////////////////////
DateTime ldt_fecha
String ls_usuario,ls_instancia

If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If


If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If

If dw_1.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
	Return -1
End If

If dw_1.update()<>1 Then
	RollBack using n_cst_application.itr_appl;
	Return
End If

Commit using n_cst_application.itr_appl;

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Se guardaron los datos exitosamente.")

//dw_composicion.retrieve(il_fabrica,il_linea, il_muestra, il_talla)
w_materia_prima_muestra_ref.tab_1.tabpage_4.dw_composicion.retrieve(il_fabrica,il_linea, il_muestra, il_talla)

Close(parent)

end event

type dw_1 from u_dw_application within w_actualiza_composicion_mue
integer x = 59
integer y = 120
integer width = 2514
integer height = 224
string dataobject = "d_composicion_mue"
end type

event itemchanged;call super::itemchanged;long ll_dato,ll_res
n_cst_comun lo_comun

If dwo.name="co_composicion" Then
   ll_dato=long(data)
	ll_res=lo_comun.of_nombreComposicion(ll_dato,n_cst_application.itr_appl)
												
	If ll_res<>1 Then
		MessageBox("Advertencia!","composici$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_composicion",lo_comun.of_getstring(1))
End If	
end event

event getfocus;//////////////////////////////////////////////////////////////////////////
// overwrite!
// 
//////////////////////////////////////////////////////////////////////////

end event

event doubleclicked;call super::doubleclicked;n_cst_param lo_param

If dwo.name="co_composicion" Then
	//lo_param.il_vector[1]=GetItemNumber(1,"co_fabricav")
	Open(w_bus_h_composiciones)

	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If	
end If
end event

event sqlpreview;call super::sqlpreview;//MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!",sqlsyntax)

end event

type gb_1 from groupbox within w_actualiza_composicion_mue
integer x = 32
integer width = 2587
integer height = 444
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Composici$$HEX1$$f300$$ENDHEX$$n"
end type

