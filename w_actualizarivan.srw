HA$PBExportHeader$w_actualizarivan.srw
forward
global type w_actualizarivan from window
end type
type sle_6 from singlelineedit within w_actualizarivan
end type
type st_4 from statictext within w_actualizarivan
end type
type sle_5 from singlelineedit within w_actualizarivan
end type
type sle_4 from singlelineedit within w_actualizarivan
end type
type cbx_3 from checkbox within w_actualizarivan
end type
type cbx_2 from checkbox within w_actualizarivan
end type
type cbx_1 from checkbox within w_actualizarivan
end type
type st_3 from statictext within w_actualizarivan
end type
type st_2 from statictext within w_actualizarivan
end type
type st_1 from statictext within w_actualizarivan
end type
type sle_3 from singlelineedit within w_actualizarivan
end type
type sle_2 from singlelineedit within w_actualizarivan
end type
type sle_1 from singlelineedit within w_actualizarivan
end type
type cb_1 from commandbutton within w_actualizarivan
end type
end forward

global type w_actualizarivan from window
integer width = 2030
integer height = 1420
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_6 sle_6
st_4 st_4
sle_5 sle_5
sle_4 sle_4
cbx_3 cbx_3
cbx_2 cbx_2
cbx_1 cbx_1
st_3 st_3
st_2 st_2
st_1 st_1
sle_3 sle_3
sle_2 sle_2
sle_1 sle_1
cb_1 cb_1
end type
global w_actualizarivan w_actualizarivan

on w_actualizarivan.create
this.sle_6=create sle_6
this.st_4=create st_4
this.sle_5=create sle_5
this.sle_4=create sle_4
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.sle_3=create sle_3
this.sle_2=create sle_2
this.sle_1=create sle_1
this.cb_1=create cb_1
this.Control[]={this.sle_6,&
this.st_4,&
this.sle_5,&
this.sle_4,&
this.cbx_3,&
this.cbx_2,&
this.cbx_1,&
this.st_3,&
this.st_2,&
this.st_1,&
this.sle_3,&
this.sle_2,&
this.sle_1,&
this.cb_1}
end on

on w_actualizarivan.destroy
destroy(this.sle_6)
destroy(this.st_4)
destroy(this.sle_5)
destroy(this.sle_4)
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.cb_1)
end on

type sle_6 from singlelineedit within w_actualizarivan
integer x = 1335
integer y = 36
integer width = 645
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_actualizarivan
integer x = 293
integer y = 1044
integer width = 1138
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "comence                                                        termine"
boolean focusrectangle = false
end type

type sle_5 from singlelineedit within w_actualizarivan
integer x = 1161
integer y = 1112
integer width = 658
integer height = 100
integer taborder = 14
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_4 from singlelineedit within w_actualizarivan
integer x = 256
integer y = 1116
integer width = 658
integer height = 100
integer taborder = 14
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cbx_3 from checkbox within w_actualizarivan
integer x = 137
integer y = 580
integer width = 786
integer height = 92
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "DT_FMP_MUE1"
end type

type cbx_2 from checkbox within w_actualizarivan
integer x = 137
integer y = 480
integer width = 832
integer height = 92
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "DT_FMP_MUESTRAS"
end type

type cbx_1 from checkbox within w_actualizarivan
integer x = 137
integer y = 368
integer width = 786
integer height = 92
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "H_FMP_MUESTRAS"
end type

type st_3 from statictext within w_actualizarivan
integer x = 123
integer y = 688
integer width = 530
integer height = 116
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Progreso"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_2 from statictext within w_actualizarivan
integer x = 727
integer y = 100
integer width = 530
integer height = 116
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Linea"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_1 from statictext within w_actualizarivan
integer x = 114
integer y = 100
integer width = 530
integer height = 116
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fabrica"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type sle_3 from singlelineedit within w_actualizarivan
integer x = 119
integer y = 860
integer width = 654
integer height = 100
integer taborder = 3
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_actualizarivan
integer x = 727
integer y = 228
integer width = 530
integer height = 100
integer taborder = 2
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_actualizarivan
integer x = 114
integer y = 228
integer width = 530
integer height = 100
integer taborder = 1
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_actualizarivan
integer x = 1074
integer y = 868
integer width = 343
integer height = 100
integer taborder = 4
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "procesar"
end type

event clicked;long ll_filas, ll_fila, ll_update, ll_fabricas, ll_fabrica, ll_maximo,ll_repaso
String ls_fecha
dataStore		lds_H_FMP_MUESTRAS, lds_fabricaslineas

lds_fabricaslineas = create dataStore
lds_H_FMP_MUESTRAS = create dataStore



lds_fabricaslineas.dataobject = 'fabricaslineas'
lds_fabricaslineas.settransobject( n_cst_application.itr_appl)
lds_fabricaslineas.retrieve()

ll_fabricas = lds_fabricaslineas.rowcount( )

ls_fecha = String(DateTime(Date(today()),Time(now())))

sle_4.text = String(DateTime(Date(today()),Time(now())))
sle_6.text = 'Paso 1 Actualizando'
for ll_repaso = 1 TO 2
	Yield ( )
	
	IF ll_repaso = 2 THEN
		sle_6.text = 'Paso 2 Verificando'
//		MEssagebox('','iniciamos verificacion de cambios')
	END IF
	for ll_fabrica = 1 to ll_fabricas
		Yield ( )
		cbx_1.checked = false
		cbx_2.checked = false
		cbx_3.checked = false
		
		sle_1.text = String(lds_fabricaslineas.Object.co_fabrica[ll_fabrica])
		sle_2.text = String(lds_fabricaslineas.Object.co_linea[ll_fabrica])
		
		lds_H_FMP_MUESTRAS.dataobject = 'h_fmp_muetras'
		lds_H_FMP_MUESTRAS.settransobject( n_cst_application.itr_appl)
		lds_H_FMP_MUESTRAS.retrieve(long(lds_fabricaslineas.Object.co_fabrica[ll_fabrica]),long(lds_fabricaslineas.Object.co_linea[ll_fabrica]))
	
		ll_filas = lds_H_FMP_MUESTRAS.rowcount( )	
	//	ll_maximo = 500
		for ll_fila = 1 to ll_filas
			Yield ( )
			IF lds_H_FMP_MUESTRAS.Object.co_muestra[ll_fila] =  72231 then 
//				messageBox('','')
				continue
			end if
			
			lds_H_FMP_MUESTRAS.object.co_diseno[ll_fila] = lds_H_FMP_MUESTRAS.object.cnt_opcion[ll_fila] 
			
			IF ll_fila = ll_maximo THEN
				ll_update = lds_H_FMP_MUESTRAS.update( )
				ll_maximo = ll_maximo + 500
		
				IF ll_update = 1 THEN
					cbx_1.checked = true
					Commit using n_cst_application.itr_appl;	
				ELSE
					rollback using n_cst_application.itr_appl;
//					messagebox('','falle')
					
				end if
			END IF
			
			sle_3.text = String(ll_fila)+' de '+String(ll_filas)
		next
		
		ll_update = lds_H_FMP_MUESTRAS.update( )
		
		
		IF ll_update = 1 THEN
			cbx_1.checked = true
			Commit using n_cst_application.itr_appl;	
		ELSE
			rollback using n_cst_application.itr_appl;
//			messagebox('','falle')
			rollback using n_cst_application.itr_appl;
		end if
		///////////////////////////////////////////////////////////////////////////////////////////
		
		lds_H_FMP_MUESTRAS.dataobject = 'dt_fmp_muestras'
		lds_H_FMP_MUESTRAS.settransobject( n_cst_application.itr_appl)
		lds_H_FMP_MUESTRAS.retrieve(long(lds_fabricaslineas.Object.co_fabrica[ll_fabrica]),long(lds_fabricaslineas.Object.co_linea[ll_fabrica]))
	
		ll_filas = lds_H_FMP_MUESTRAS.rowcount( )	
		ll_maximo = 500
		for ll_fila = 1 to ll_filas
			Yield ( )
			lds_H_FMP_MUESTRAS.object.co_diseno[ll_fila] = lds_H_FMP_MUESTRAS.object.cnt_opcion[ll_fila] 	
			
			IF ll_fila = ll_maximo THEN
				
				sle_3.text = String(ll_fila) + ' de '+string(ll_filas)
				ll_update = lds_H_FMP_MUESTRAS.update( )
				ll_maximo = ll_maximo + 500
		
				IF ll_update = 1 THEN
					cbx_1.checked = true
					Commit using n_cst_application.itr_appl;	
				ELSE
					rollback using n_cst_application.itr_appl;
//					messagebox('','falle')
					rollback using n_cst_application.itr_appl;
				end if
			END IF
			
			
			sle_3.text = String(ll_fila)+' de '+String(ll_filas)
		next
		
		ll_update = lds_H_FMP_MUESTRAS.update( )
		
		
		IF ll_update = 1 THEN
			cbx_2.checked = true
			Commit using n_cst_application.itr_appl;	
		ELSE
			rollback using n_cst_application.itr_appl;
//			messagebox('','falle')
			rollback using n_cst_application.itr_appl;
		end if
		//////////////////////////////////////////////////////////////////////////////////////////////
		lds_H_FMP_MUESTRAS.dataobject = 'dt_fmp_mue1'
		lds_H_FMP_MUESTRAS.settransobject( n_cst_application.itr_appl)
		lds_H_FMP_MUESTRAS.retrieve(long(lds_fabricaslineas.Object.co_fabrica[ll_fabrica]),long(lds_fabricaslineas.Object.co_linea[ll_fabrica]))
	
		ll_filas = lds_H_FMP_MUESTRAS.rowcount( )	
		ll_maximo = 500
		for ll_fila = 1 to ll_filas
			Yield ( )
			lds_H_FMP_MUESTRAS.object.co_diseno[ll_fila] = lds_H_FMP_MUESTRAS.object.cnt_opcion[ll_fila] 	
			IF ll_fila = ll_maximo THEN
				sle_3.text = String(ll_fila) + ' de '+string(ll_filas)
				ll_update = lds_H_FMP_MUESTRAS.update( )
				ll_maximo = ll_maximo + 500
		
				IF ll_update = 1 THEN
					cbx_1.checked = true
					Commit using n_cst_application.itr_appl;	
				ELSE
					rollback using n_cst_application.itr_appl;
//					messagebox('','falle')
					rollback using n_cst_application.itr_appl;
				end if
			END IF
			
			sle_3.text = String(ll_fila)+' de '+String(ll_filas)
		next
		
		ll_update = lds_H_FMP_MUESTRAS.update( )
		
		
		IF ll_update = 1 THEN
			cbx_3.checked = true
			Commit using n_cst_application.itr_appl;	
		ELSE
			rollback using n_cst_application.itr_appl;
//			messagebox('','falle')
			rollback using n_cst_application.itr_appl;
		end if	
	next
NEXT

sle_5.text = String(DateTime(Date(today()),Time(now())))
end event

