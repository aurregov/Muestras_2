HA$PBExportHeader$w_tinta_antideslizante.srw
$PBExportComments$Ventana de Registro de tintas antideslizantes para la programaci$$HEX1$$f300$$ENDHEX$$n.
forward
global type w_tinta_antideslizante from w_sheet
end type
type uo_tinta from u_cst_tinta_antideslizante within w_tinta_antideslizante
end type
end forward

global type w_tinta_antideslizante from w_sheet
string tag = "Registro de Tinta Antideslizante"
integer width = 2331
integer height = 1984
string title = "Registro de Tinta Antideslizante"
string menuname = "m_tinta_antideslizante"
boolean maxbox = true
windowstate windowstate = maximized!
uo_tinta uo_tinta
end type
global w_tinta_antideslizante w_tinta_antideslizante

on w_tinta_antideslizante.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_tinta_antideslizante" then this.MenuID = create m_tinta_antideslizante
this.uo_tinta=create uo_tinta
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_tinta
end on

on w_tinta_antideslizante.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.uo_tinta)
end on

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:11:35
---------------------------------------------------
---------------------------------------------------*/
uo_tinta.of_cargar_dw()
//--------------------------------------------------
end event

event ue_save;call super::ue_save;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:11:40
---------------------------------------------------
Guarda datos de la tinta
---------------------------------------------------*/
uo_tinta.TriggerEvent('ue_save')
//--------------------------------------------------
end event

event key;call super::key;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:11:41
---------------------------------------------------
Uso del ctrl, keyflags=2
---------------------------------------------------*/
IF keyflags = 2 THEN // Keyflags para el 'Ctrl'
	Choose Case Key
		Case Key1!
			uo_tinta.dw_busqueda.SetFocus()
		Case Key2!
			uo_tinta.dw_detalle.SetFocus()
	End Choose
End If
end event

event closequery;call super::closequery;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 28 de Septiembre de 2004.H:15:12
---------------------------------------------------
---------------------------------------------------*/
If uo_tinta.of_get_cambios() Then
	If MessageBox('Validaci$$HEX1$$f300$$ENDHEX$$n','Se perder$$HEX1$$e100$$ENDHEX$$n los cambios realizados. Desea continuar?',Question!,YesNo!,2)=2 Then
		Return 1
	Else
		Return 0
	End If
End If
end event

type uo_tinta from u_cst_tinta_antideslizante within w_tinta_antideslizante
integer x = 37
integer height = 1792
integer taborder = 20
end type

on uo_tinta.destroy
call u_cst_tinta_antideslizante::destroy
end on

