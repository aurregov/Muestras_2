HA$PBExportHeader$w_recursos_ficha_mt_prima.srw
forward
global type w_recursos_ficha_mt_prima from window
end type
type dw_recursos_agrupa from datawindow within w_recursos_ficha_mt_prima
end type
type cb_cancelar from commandbutton within w_recursos_ficha_mt_prima
end type
type cb_aceptar from commandbutton within w_recursos_ficha_mt_prima
end type
type cbx_1 from checkbox within w_recursos_ficha_mt_prima
end type
type dw_muestrario from datawindow within w_recursos_ficha_mt_prima
end type
type st_2 from statictext within w_recursos_ficha_mt_prima
end type
type st_1 from statictext within w_recursos_ficha_mt_prima
end type
type dw_rec_ft from datawindow within w_recursos_ficha_mt_prima
end type
type dw_recurso from datawindow within w_recursos_ficha_mt_prima
end type
type gb_1 from groupbox within w_recursos_ficha_mt_prima
end type
type gb_2 from groupbox within w_recursos_ficha_mt_prima
end type
type gb_3 from groupbox within w_recursos_ficha_mt_prima
end type
end forward

global type w_recursos_ficha_mt_prima from window
integer width = 2985
integer height = 2172
boolean titlebar = true
string title = "Seleccionar recursos a copiar"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 134217739
string icon = "AppIcon!"
boolean center = true
dw_recursos_agrupa dw_recursos_agrupa
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
cbx_1 cbx_1
dw_muestrario dw_muestrario
st_2 st_2
st_1 st_1
dw_rec_ft dw_rec_ft
dw_recurso dw_recurso
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_recursos_ficha_mt_prima w_recursos_ficha_mt_prima

type variables
Long il_linea, il_fabrica, il_muestra, il_talla
Long il_fila_recurso, il_fila_muestrario 
String is_recurso
end variables

on w_recursos_ficha_mt_prima.create
this.dw_recursos_agrupa=create dw_recursos_agrupa
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.cbx_1=create cbx_1
this.dw_muestrario=create dw_muestrario
this.st_2=create st_2
this.st_1=create st_1
this.dw_rec_ft=create dw_rec_ft
this.dw_recurso=create dw_recurso
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.dw_recursos_agrupa,&
this.cb_cancelar,&
this.cb_aceptar,&
this.cbx_1,&
this.dw_muestrario,&
this.st_2,&
this.st_1,&
this.dw_rec_ft,&
this.dw_recurso,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_recursos_ficha_mt_prima.destroy
destroy(this.dw_recursos_agrupa)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.cbx_1)
destroy(this.dw_muestrario)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_rec_ft)
destroy(this.dw_recurso)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;str_param		lstr_param

lstr_param = Message.powerobjectparm

il_fabrica = lstr_param.a_long1[1]
il_linea = lstr_param.a_long1[2]
il_muestra = lstr_param.a_long1[3]
il_talla = lstr_param.a_long1[4]

dw_recurso.Settransobject( n_cst_application.itr_appl)
dw_rec_ft.Settransobject( n_cst_application.itr_appl)
dw_muestrario.Settransobject( n_cst_application.itr_appl)

dw_recurso.retrieve( il_fabrica, il_linea, il_muestra, il_talla)
dw_rec_ft.retrieve(il_fabrica,il_linea, il_muestra)
dw_muestrario.retrieve(il_fabrica, il_linea)

dw_recursos_agrupa.SetTransObject(n_cst_application.itr_appl)
dw_recursos_agrupa.Visible = false

/*

n_cst_comun lo_comun
ll_res=lo_comun.of_nombremuestrario( il_fabrica,il_linea,Long(ls_muestrario),n_cst_application.itr_appl)
If ll_res<>1 Then	
	MessageBox("Advertencia!","Muestrario no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
	Return 1
End If	

*/
end event

type dw_recursos_agrupa from datawindow within w_recursos_ficha_mt_prima
boolean visible = false
integer x = 1920
integer y = 64
integer width = 974
integer height = 812
integer taborder = 20
string title = "none"
string dataobject = "d_recursos_agrupa"
boolean vscrollbar = true
boolean livescroll = true
end type

type cb_cancelar from commandbutton within w_recursos_ficha_mt_prima
integer x = 1477
integer y = 1952
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancelar"
end type

event clicked;Close(Parent)
end event

type cb_aceptar from commandbutton within w_recursos_ficha_mt_prima
integer x = 1024
integer y = 1952
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;str_param	str_param
Long ll_fila, ll_filas, ll_recurso

n_cst_copiar_recurso		lnv_recurso
lnv_recurso	= CREATE n_cst_copiar_recurso

//dw_rec_ft.Object.seleccion[ll_fila]

dw_rec_ft.setfilter( " seleccion = '1'")
dw_rec_ft.filter( )

ll_recurso = dw_rec_ft.rowcount( )

dw_rec_ft.setfilter( "")
dw_rec_ft.filter( )


IF il_fila_recurso < 1 THEN
	MessageBox('','Se debe seleccionar el recurso del que se desea copiar.')
	RETURN 1
END IF

IF ll_recurso < 1 THEN
	MessageBox('','Se debe seleccionar el recurso al que se desea copiar.')
	RETURN 1
END IF

IF il_fila_muestrario < 1 THEN
	MessageBox('','Se debe seleccionar el muestrario al que se desea copiar.')
	RETURN 1
END IF


ll_filas = dw_rec_ft.rowcount( )
FOR ll_fila = 1 To ll_filas
	IF dw_rec_ft.Object.seleccion[ll_fila] = '1' THEN
		str_param.a_long1[1] = il_fabrica
		str_param.a_long1[2] = il_linea
		str_param.a_long1[3] = il_muestra
		str_param.a_long1[4] = il_talla
		str_param.a_long1[5] = dw_recurso.Object.muestrario[il_fila_recurso]
		str_param.a_long1[6] = dw_muestrario.Object.co_muestrario[il_fila_muestrario]
		str_param.a_long1[7] = dw_rec_ft.Object.co_diseno[ll_fila]
		str_param.a_long1[8] = dw_recurso.Object.co_recurso[il_fila_recurso]	//recurso Origen
		str_param.a_long1[9] = dw_rec_ft.Object.co_recurso[ll_fila] 			//recurso destino
				
		lnv_recurso.of_set_parametros_dobleclick(str_param)
		
		IF lnv_recurso.of_grabar_dobleclick( ) < 1 THEN RETURN -1
	END IF	
NEXT

MessageBox('','La ficha del recurso '+String(dw_recurso.Object.co_recurso[il_fila_recurso])+" se copi$$HEX2$$f3002000$$ENDHEX$$al recurso o los recursos "+is_recurso)

Close(Parent)
RETURN 1
end event

type cbx_1 from checkbox within w_recursos_ficha_mt_prima
integer x = 695
integer y = 912
integer width = 302
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Todos"
end type

event clicked;//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	Clicked (Event)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Enero 24 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	llenar los colores seleccionados todos/ninguno
//=========================================================================
Long ll_filas, ll_fila

is_recurso = '' 

ll_filas = dw_rec_ft.Rowcount( )
IF ll_filas > 0 THEN
	FOR ll_fila = 1 TO ll_filas
		IF THIS.Checked THEN
			dw_rec_ft.Object.seleccion[ll_fila] = '1'
			IF ll_fila <= 10 THEN
				IF Len(TRIM(STRING(is_recurso))) = 0 THEN
					is_recurso = String(dw_rec_ft.Object.co_recurso[ll_fila])
				ELSE
					is_recurso += ', '+String(dw_rec_ft.Object.co_recurso[ll_fila],'')
				END IF			
			END IF
		ELSE
			dw_rec_ft.Object.seleccion[ll_fila] = '0'
			is_recurso = '' 
		END IF		
	NEXT
END IF 

st_2.text = 'La ficha del recurso '+String(dw_recurso.Object.co_recurso[il_fila_recurso])+" se copiar$$HEX2$$e1002000$$ENDHEX$$al recurso o los recursos "+is_recurso+"..."
		

end event

type dw_muestrario from datawindow within w_recursos_ficha_mt_prima
string tag = "Muestrario al que se llevara la Informacion "
integer x = 1056
integer y = 1040
integer width = 855
integer height = 560
integer taborder = 30
boolean enabled = false
string dataobject = "ddw_muestrario"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;
IF Row = 0 THEN RETURN

SelectRow(0,False)
SelectRow(row,True)

il_fila_muestrario = Row
end event

type st_2 from statictext within w_recursos_ficha_mt_prima
integer x = 46
integer y = 1788
integer width = 1938
integer height = 124
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_1 from statictext within w_recursos_ficha_mt_prima
integer x = 50
integer y = 1660
integer width = 914
integer height = 184
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Recurso que no aparece, debe crearse primero en la Ficha T$$HEX1$$e900$$ENDHEX$$cnica"
boolean focusrectangle = false
end type

type dw_rec_ft from datawindow within w_recursos_ficha_mt_prima
string tag = "Seleccione los recursos a copiar"
integer x = 69
integer y = 1052
integer width = 878
integer height = 560
integer taborder = 20
boolean enabled = false
string dataobject = "d_con_ft_sin_mt"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;Long ll_fila, ll_recurso, ll_fin

IF Row = 0 THEN RETURN

SelectRow(0,False)
SelectRow(row,True)

this.setredraw( FALSE)
this.accepttext( )

is_recurso = '' 

ll_recurso = dw_rec_ft.rowcount( )

//IF ll_recurso > 10 THEN ll_recurso = 10


CHOOSE CASE dwo.name
	CASE 'seleccion'
		FOR ll_fila = 1 To ll_recurso
			
			IF dw_rec_ft.object.seleccion[ll_fila] = '1' AND ll_fila <> Row THEN
				IF Len(TRIM(STRING(is_recurso))) = 0 THEN
					ll_fin ++
					is_recurso = String(dw_rec_ft.Object.co_recurso[ll_fila])
				ELSE
					ll_fin ++
					is_recurso += ', '+String(dw_rec_ft.Object.co_recurso[ll_fila],'')
				END IF
			ELSE
				IF ll_fila = Row THEN 
					IF Trim(String(dw_rec_ft.object.seleccion[ll_fila],'')) = '' OR Trim(String(dw_rec_ft.object.seleccion[ll_fila],'')) = '0' THEN
						IF Len(TRIM(STRING(is_recurso))) = 0 THEN
							ll_fin ++
							is_recurso = String(dw_rec_ft.Object.co_recurso[ll_fila])
						ELSE
							ll_fin ++
							is_recurso += ', '+String(dw_rec_ft.Object.co_recurso[ll_fila],'')
						END IF
					END IF
				END IF
			END IF
			IF ll_fin >= 10 THEN EXIT
		NEXT
		st_2.text = 'La ficha del recurso '+String(dw_recurso.Object.co_recurso[il_fila_recurso])+" se copiar$$HEX2$$e1002000$$ENDHEX$$al recurso o los recursos "+is_recurso+"..."
		
END CHOOSE

this.setredraw( true)




end event

type dw_recurso from datawindow within w_recursos_ficha_mt_prima
string tag = "Se debe dar click para continuar"
integer x = 87
integer y = 120
integer width = 1723
integer height = 712
integer taborder = 10
string dataobject = "d_recurso_mt_prima"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;Integer li_fila, li_rec_agrupa
Double  ld_recurso, ld_muestra, ld_diseno

IF Row = 0 THEN RETURN

SelectRow(0,False)
SelectRow(row,True)

//dw_recursos_agrupa.visible = False

il_fila_recurso = row

cbx_1.Enabled = TRUE
dw_rec_ft.ENabled = TRUE
dw_muestrario.eNAbled = TRUE

//SA56239 - Ceiba/reariase - 23-05-2017 - Recursos que agrupa
ld_recurso = dw_recurso.GetItemNumber( row, "co_recursoagrupa")
If IsNull(ld_recurso) Then ld_recurso = 0
ld_muestra = dw_recurso.GetItemNumber( row, "co_muestra")
ld_diseno  = dw_recurso.GetItemNumber( row, "co_diseno")	
li_rec_agrupa = dw_recursos_agrupa.Retrieve(ld_recurso, ld_muestra, ld_diseno)
if li_rec_agrupa > 0 Then dw_recursos_agrupa.visible = True
//Fin SA56239


// SA58743 - FACL - 2018-04-20 - Se actualiza el texto con el nuevo recurso
If is_recurso <> '' Then
	st_2.text = 'La ficha del recurso '+String(dw_recurso.Object.co_recurso[il_fila_recurso])+" se copiar$$HEX2$$e1002000$$ENDHEX$$al recurso o los recursos "+is_recurso+"..."
End If
end event

type gb_1 from groupbox within w_recursos_ficha_mt_prima
integer x = 55
integer y = 36
integer width = 1819
integer height = 844
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Recursos con Ficha de materia prima"
end type

type gb_2 from groupbox within w_recursos_ficha_mt_prima
integer x = 32
integer y = 980
integer width = 955
integer height = 656
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Recursos Ficha T$$HEX1$$e900$$ENDHEX$$cnica"
end type

type gb_3 from groupbox within w_recursos_ficha_mt_prima
integer x = 1024
integer y = 980
integer width = 928
integer height = 648
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Muestrario"
end type

