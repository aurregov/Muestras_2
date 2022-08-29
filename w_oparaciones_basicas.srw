HA$PBExportHeader$w_oparaciones_basicas.srw
$PBExportComments$Son las operaciones que quieren ver en la digitacion inicial de fichas
forward
global type w_oparaciones_basicas from w_simple
end type
type cb_1 from commandbutton within w_oparaciones_basicas
end type
type dw_header from u_dw_base within w_oparaciones_basicas
end type
type gb_1 from groupbox within w_oparaciones_basicas
end type
end forward

global type w_oparaciones_basicas from w_simple
integer width = 2661
integer height = 1468
string title = "Operaciones b$$HEX1$$e100$$ENDHEX$$sicas"
cb_1 cb_1
dw_header dw_header
gb_1 gb_1
end type
global w_oparaciones_basicas w_oparaciones_basicas

type variables
datawindowchild d_dddw_operaciones_calcetin

end variables

on w_oparaciones_basicas.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.dw_header=create dw_header
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.dw_header
this.Control[iCurrent+3]=this.gb_1
end on

on w_oparaciones_basicas.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
destroy(this.dw_header)
destroy(this.gb_1)
end on

event open;call super::open;datawindowchild ldwc_tipoprod

dw_header.GetChild("co_tipoprod", ldwc_tipoprod)

ldwc_tipoprod.settransobject(n_cst_application.itr_appl)
ldwc_tipoprod.Retrieve(n_cst_application.is_user)

dw_general.GetChild("co_operacion",d_dddw_operaciones_calcetin)
d_dddw_operaciones_calcetin.settransobject(n_cst_application.itr_appl)

// Se inserta en el encabezado un solo registro la primer vez 
// al abrir la ventana
dw_header.triggerevent('ue_insertrow')
dw_header.SetColumn('co_tipoprod')
dw_header.SetFocus()


end event

event ue_find;long ll_co_tipoprod

dw_header.accepttext()
dw_general.SetRedraw(FALSE)

// Se filtra el "detalle" 
ll_co_tipoprod = dw_header.getitemnumber(1, "co_tipoprod")

IF NOT IsNull(ll_co_tipoprod) THEN
	dw_general.retrieve(ll_co_tipoprod)
	d_dddw_operaciones_calcetin.retrieve(ll_co_tipoprod)
END IF
	
dw_general.SetRedraw(TRUE)	
end event

event ue_insertrow;call super::ue_insertrow;long ll_co_tipoprod

dw_header.accepttext()

ll_co_tipoprod = dw_header.getitemnumber(1, "co_tipoprod")
IF NOT IsNull(ll_co_tipoprod) THEN 
	dw_general.SetItem( dw_general.GetRow(), 'co_tipoprod', ll_co_tipoprod )
END IF
end event

type dw_general from w_simple`dw_general within w_oparaciones_basicas
integer x = 41
integer y = 272
integer width = 2565
string dataobject = "d_m_operac_muestra"
end type

event dw_general::itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// Se verifica que no se repica el c$$HEX1$$f300$$ENDHEX$$digo
// 
//////////////////////////////////////////////////////////////////////////
long ll_dato,ll_pos
long ll_co_tipoprod, ll_co_operacion

this.accepttext()


If dwo.name="co_operacion" Then
	
	// Se verifica que NO exista otro registro para la misma clave Tipo Prod y Operacion
	
   ll_co_tipoprod  = This.GetItemNumber(row, 'co_tipoprod')
	ll_co_operacion = This.GetItemNumber(row, 'co_operacion')

	//ll_dato=Long(Data)
	
	ll_pos = Find("co_tipoprod = "+String(ll_co_tipoprod)+" AND co_operacion = "+String(ll_co_operacion),1,RowCount())
	
	If ll_pos > 0 Then
		IF ll_pos = row THEN
		ELSE
			MessageBox("Advertencia!","El Tipo de Producto y Operaci$$HEX1$$f300$$ENDHEX$$n ya est$$HEX1$$e100$$ENDHEX$$n registrados.",StopSign!)
			Return 2
		END IF
	End If      
	
End If


end event

type gb_general from w_simple`gb_general within w_oparaciones_basicas
integer x = 18
integer y = 200
integer width = 2610
end type

type cb_1 from commandbutton within w_oparaciones_basicas
integer x = 2267
integer y = 1176
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
string text = "Ordenar"
end type

event clicked;long i,ll_tot

ll_tot=dw_general.RowCount()

dw_general.Sort()

For i=1 to ll_tot
	dw_general.SetItem(i,"orden_operacion",10*i)
Next

end event

type dw_header from u_dw_base within w_oparaciones_basicas
integer x = 50
integer y = 56
integer width = 2427
integer height = 96
boolean bringtotop = true
string dataobject = "d_encabezado_m_operac"
boolean vscrollbar = false
boolean livescroll = false
end type

event itemchanged;call super::itemchanged;This.AcceptText()
Parent.Event ue_find( )

end event

type gb_1 from groupbox within w_oparaciones_basicas
integer x = 18
integer width = 2606
integer height = 184
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

