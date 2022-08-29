HA$PBExportHeader$w_migrar_muestra.srw
$PBExportComments$Para el manejo de lo referente a mano de obra, con todos los colores
forward
global type w_migrar_muestra from w_sheet
end type
type cb_3 from commandbutton within w_migrar_muestra
end type
type cb_2 from commandbutton within w_migrar_muestra
end type
type st_muestra from statictext within w_migrar_muestra
end type
end forward

global type w_migrar_muestra from w_sheet
integer width = 759
integer height = 496
string title = "Lista de materiales a Sap"
string menuname = ""
boolean maxbox = true
windowstate windowstate = maximized!
boolean center = true
event ue_copiar_mp ( )
event ue_borrar_mat_prima ( )
event ue_ficha_tecnica ( )
event ue_copia_parte ( )
event ue_cambio_parte ( )
event ue_copia_todos ( )
event ue_composicion_destruccion ( )
event ue_copia_basico ( )
event ue_borra_mp_color ( )
event ue_copiar_mp_col ( )
event ue_actualiza_composicion_mue ( )
event type integer ue_borrar_color_mp ( )
cb_3 cb_3
cb_2 cb_2
st_muestra st_muestra
end type
global w_migrar_muestra w_migrar_muestra

type variables

Long il_referencia, il_Row

DataStore	ids_datos, ids_cabase
Boolean	ib_cambios, ib_find




end variables

on w_migrar_muestra.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.st_muestra=create st_muestra
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.st_muestra
end on

on w_migrar_muestra.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.st_muestra)
end on

event open;//
end event

type cb_3 from commandbutton within w_migrar_muestra
integer x = 18
integer y = 64
integer width = 489
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualizar muestras"
end type

event clicked;open(w_procesar_muestras)


end event

type cb_2 from commandbutton within w_migrar_muestra
integer x = 9
integer y = 180
integer width = 457
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualizar disenos"
end type

event clicked;open(w_actualizarivan)
end event

type st_muestra from statictext within w_migrar_muestra
integer x = 119
integer y = 1056
integer width = 910
integer height = 80
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

