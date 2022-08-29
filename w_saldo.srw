HA$PBExportHeader$w_saldo.srw
forward
global type w_saldo from w_sheet
end type
type mle_salidas from multilineedit within w_saldo
end type
type st_4 from statictext within w_saldo
end type
type st_3 from statictext within w_saldo
end type
type sle_estado from singlelineedit within w_saldo
end type
type st_2 from statictext within w_saldo
end type
type st_1 from statictext within w_saldo
end type
type hpb_1 from hprogressbar within w_saldo
end type
type cb_2 from commandbutton within w_saldo
end type
type dw_3 from u_dw_application within w_saldo
end type
type cb_1 from commandbutton within w_saldo
end type
type dw_fechas from u_dw_application within w_saldo
end type
type dw_2 from u_dw_application within w_saldo
end type
type dw_1 from u_dw_application within w_saldo
end type
type gb_1 from groupbox within w_saldo
end type
type mle_entradas from multilineedit within w_saldo
end type
type gb_2 from groupbox within w_saldo
end type
end forward

global type w_saldo from w_sheet
integer width = 3529
integer height = 1952
string title = "Saldos de muestras por estado"
mle_salidas mle_salidas
st_4 st_4
st_3 st_3
sle_estado sle_estado
st_2 st_2
st_1 st_1
hpb_1 hpb_1
cb_2 cb_2
dw_3 dw_3
cb_1 cb_1
dw_fechas dw_fechas
dw_2 dw_2
dw_1 dw_1
gb_1 gb_1
mle_entradas mle_entradas
gb_2 gb_2
end type
global w_saldo w_saldo

forward prototypes
public function integer of_adicionar (integer a_dato, integer a_pos)
end prototypes

public function integer of_adicionar (integer a_dato, integer a_pos);long ll_pos,ll_dato,ll_res

n_cst_comun lo_comun
// 15 transicion
// 20 arpobada
// 21 rechazada

If a_dato=15 or a_dato=20 or a_dato=21 Then
	Return 0
End If

//Messagebox('Var','a_dato='+String(a_dato)+'~n'+&
//'a_pos='+String(a_pos)+'~n')

ll_pos=dw_2.find("estado="+String(a_dato),1,dw_2.RowCount())

If ll_pos=0 Then
	ll_pos=dw_2.InsertRow(0)
	dw_2.SetItem(ll_pos,"estado",a_dato)
	ll_res=lo_comun.of_nombreestadomuestra(a_dato /*long a_estado*/,&
	                                       n_cst_application.itr_appl/*transaction a_transaction */)
	If ll_res=1 Then
		dw_2.SetItem(ll_pos,"de_estado",lo_comun.of_getString(1))
		dw_2.SetItem(ll_pos,"orden",lo_comun.of_getLong(1))
	End If
End If

ll_dato=dw_2.GetItemNumber(ll_pos,a_pos)
ll_dato++
dw_2.SetItem(ll_pos,a_pos,ll_dato)

Return 1
end function

on w_saldo.create
int iCurrent
call super::create
this.mle_salidas=create mle_salidas
this.st_4=create st_4
this.st_3=create st_3
this.sle_estado=create sle_estado
this.st_2=create st_2
this.st_1=create st_1
this.hpb_1=create hpb_1
this.cb_2=create cb_2
this.dw_3=create dw_3
this.cb_1=create cb_1
this.dw_fechas=create dw_fechas
this.dw_2=create dw_2
this.dw_1=create dw_1
this.gb_1=create gb_1
this.mle_entradas=create mle_entradas
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_salidas
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.sle_estado
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.hpb_1
this.Control[iCurrent+8]=this.cb_2
this.Control[iCurrent+9]=this.dw_3
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.dw_fechas
this.Control[iCurrent+12]=this.dw_2
this.Control[iCurrent+13]=this.dw_1
this.Control[iCurrent+14]=this.gb_1
this.Control[iCurrent+15]=this.mle_entradas
this.Control[iCurrent+16]=this.gb_2
end on

on w_saldo.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mle_salidas)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.sle_estado)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.hpb_1)
destroy(this.cb_2)
destroy(this.dw_3)
destroy(this.cb_1)
destroy(this.dw_fechas)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.mle_entradas)
destroy(this.gb_2)
end on

event open;call super::open;dw_fechas.insertrow(0)

dw_1.SetTransObject(n_cst_application.itr_appl)
dw_2.SetTransObject(n_cst_application.itr_appl)
dw_3.SetTransObject(n_cst_application.itr_appl)

//clipboard(String(rgb(255,128,64)))
end event

type mle_salidas from multilineedit within w_saldo
integer x = 2222
integer y = 696
integer width = 1189
integer height = 244
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79017397
boolean vscrollbar = true
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type st_4 from statictext within w_saldo
integer x = 2231
integer y = 620
integer width = 242
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Salida"
boolean focusrectangle = false
end type

type st_3 from statictext within w_saldo
integer x = 2226
integer y = 288
integer width = 242
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Entrada"
boolean focusrectangle = false
end type

type sle_estado from singlelineedit within w_saldo
integer x = 2857
integer y = 20
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "1"
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_saldo
integer x = 2167
integer y = 36
integer width = 658
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Entradas y salidas del estado"
boolean focusrectangle = false
end type

type st_1 from statictext within w_saldo
integer x = 128
integer y = 1588
integer width = 1234
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type hpb_1 from hprogressbar within w_saldo
integer x = 87
integer y = 1668
integer width = 2318
integer height = 64
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type cb_2 from commandbutton within w_saldo
integer x = 1691
integer y = 68
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Guardar"
end type

event clicked;dw_2.saveas()
end event

type dw_3 from u_dw_application within w_saldo
integer x = 2245
integer y = 1028
integer width = 1179
integer height = 516
integer taborder = 30
string dataobject = "d_entradas_salidas"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_saldo
integer x = 1317
integer y = 68
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Procesar"
end type

event clicked;If dw_fechas.AcceptText()<>1 Then
	MessageBox("Advertencia!","Fecha no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
	Return
End If

DateTime ldt_f1,ldt_f2

ldt_f1=DateTime(dw_fechas.GetItemDate(1,1))
ldt_f2=DateTime(dw_fechas.GetItemDate(1,2))

long ll_tot,ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_color,&
     ll_est1,ll_est2,i,ll_ini,ll_fin,ll_tot1,j,ll_pos,ll_e1,ll_e2,ll_ok,k
long l1,l2,l3,l4, ll_estado

ll_estado=long(sle_estado.text)

mle_entradas.text=""
mle_salidas.text=""

String ls_actual

dw_1.SetRedraw(false)

Execute immediate "SET OPTIMIZATION LOW" using n_cst_application.itr_appl;
	  
ll_tot=dw_1.Retrieve(ldt_f1,ldt_f2)	 

Execute immediate "SET OPTIMIZATION HIGH" using n_cst_application.itr_appl;

dw_2.Reset()

//dw_3.SetRedraw(False)

//dw_3.Retrieve(ldt_f1,ldt_f2)	 

long ll_t1,ll_t

ll_t1=cpu()

String ls_muestras1

For i=1 to ll_tot
	yield()
	hpb_1.position=i/ll_tot*100

   ll_t=(cpu() - ll_t1 )/ i //t un proceso
	ll_t=ll_t * (ll_tot - i) //estimado
	
	st_1.text=String(i/ll_tot*100,"#,###.00")+" %  tiempo estimado: "+String(ll_t/1000)+" seg."

	ll_fabrica=dw_1.getItemNumber(i,"co_fabrica")
	ll_linea=dw_1.getItemNumber(i,"co_linea")
	ll_muestra=dw_1.getItemNumber(i,"co_muestra")
	ll_talla=dw_1.getItemNumber(i,"co_talla")
	ll_color=dw_1.getItemNumber(i,"co_color")
	
	ls_actual=String(ll_fabrica)+"/"+String(ll_linea)+"/"+&
	String(ll_muestra)+"/"+String(ll_talla)+"/"+String(ll_color)
	
	ll_ini=dw_1.GetItemNumber(i,"co_ini")
	if isnull(ll_ini) Then ll_ini=0
	
	ll_fin=dw_1.GetItemNumber(i,"co_fin")
	if isnull(ll_fin) Then ll_fin=0

	if ll_ini>0 then
		of_adicionar(ll_ini,2)
	end if

	if ll_fin>0 then
		of_adicionar(ll_fin,3)
	end if

   ll_tot1=dw_3.retrieve(ll_fabrica,ll_linea,ll_muestra,ll_talla,ll_color,ldt_f1,ldt_f2)
	
	for j=1 to dw_3.rowCount()
		ll_e1=dw_3.GetItemNumber(j,"co_estado")
		for k=j+1 to dw_3.rowCount() -1
			ll_e2=dw_3.GetItemNumber(k,"co_estado")
			if ll_e1=ll_e2 then
				dw_3.deleteRow(k)
				k -- 
			end if
		next
//////////////////////////////////////////////////////////////////////////
// Si el ultimo estado es igual al de la j, borro el de la j
// 
//////////////////////////////////////////////////////////////////////////
		
		If j<dw_3.RowCount() Then
			ll_e2=dw_3.GetItemNumber(dw_3.RowCount(),2)
			If ll_e1=ll_e2 Then
				dw_3.DeleteRow(j)
				j --
			End If
		End If
	next

//	dw_3.SetFilter("co_fabrica="+String(ll_fabrica)+&
//	                       " and co_linea="+String(ll_linea)+&
//								  " and co_muestra="+String(ll_muestra)+&
//								  " and co_talla="+String(ll_talla)+&
//								  " and co_color="+String(ll_color))
//								  
//	dw_3.Filter()
//	
//	dw_3.Sort()
//	
	ll_tot1=dw_3.RowCount()
	
	for j=1 to ll_tot1
		ll_e1=dw_3.GetItemNumber(j,"co_estado")
		ll_ok=0
		if j=1 then
			if ll_ini<>ll_e1 then
				ll_ok=1
				if ll_ini<>0 then
					of_adicionar(ll_ini,5)
					If ll_ini=ll_estado Then
						mle_salidas.text=mle_salidas.text+ls_actual+" va para ("+String(ll_e1)+").~r~n"
					End If					
				end if
				ll_e2=ll_ini
			End if
		else
			ll_ok=1
			ll_e2=dw_3.GetItemNumber(j - 1,"co_estado")
			of_adicionar(ll_e2,5)
			If ll_e2=ll_estado Then
				mle_salidas.text=mle_salidas.text+ls_actual+" va para ("+String(ll_e1)+")~r~n"
			End If

		end if
			
		if ll_ok=1 Then
			of_adicionar(ll_e1,4)
			If ll_e1=ll_estado Then
				mle_entradas.text=mle_entradas.text+ls_actual+" viene de ("+String(ll_e2)+")~r~n"
			End If
		End If
	next

//	ll_tot1=dw_2.rowcount()
//	for j=1 to ll_tot1
//		l1=dw_2.GetItemNumber(j,2)
//		l2=dw_2.GetItemNumber(j,3)
//		l3=dw_2.GetItemNumber(j,4)
//		l4=dw_2.GetItemNumber(j,5)
//		
//		if l1+l3 - l4 <> l2 then
//			Messagebox('Error en esta muestra',&
//			"Por favor verifique los movimientos de esta muestra en el periodo~n"+&
//			'fabrica='+String(ll_fabrica)+'~n'+&
//			'linea='+String(ll_linea)+'~n'+&
//			'muestra='+String(ll_muestra)+'~n'+&
//			'talla='+String( ll_talla)+'~n'+&
//			'color='+String(ll_color)+'~n'+&
//			'Estado inicial='+String(ll_ini)+'~n'+&
//			'Estado final='+String(ll_fin)+'~n')
//        
//		  	Return
//		end If
//	next
//	
next


dw_2.sort()
end event

type dw_fechas from u_dw_application within w_saldo
integer x = 50
integer y = 16
integer width = 896
integer height = 196
integer taborder = 20
string dataobject = "d_ext_fechas_rango"
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_2 from u_dw_application within w_saldo
integer x = 37
integer y = 296
integer width = 2112
integer height = 1220
integer taborder = 20
string dataobject = "d_ext_saldos"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from u_dw_application within w_saldo
boolean visible = false
integer x = 914
integer y = 16
integer width = 425
integer height = 228
string dataobject = "d_saldos"
end type

type gb_1 from groupbox within w_saldo
integer x = 9
integer y = 212
integer width = 2162
integer height = 1372
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estados y sus movimientos"
borderstyle borderstyle = stylelowered!
end type

type mle_entradas from multilineedit within w_saldo
integer x = 2222
integer y = 348
integer width = 1189
integer height = 244
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79017397
boolean vscrollbar = true
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type gb_2 from groupbox within w_saldo
integer x = 2194
integer y = 212
integer width = 1280
integer height = 1372
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Movimientos en el periodo"
borderstyle borderstyle = stylelowered!
end type

