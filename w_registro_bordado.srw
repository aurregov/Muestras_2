HA$PBExportHeader$w_registro_bordado.srw
$PBExportComments$Ventana de Registro de bordado para la programaci$$HEX1$$f300$$ENDHEX$$n.Los bordados se crean inactivos cuando son nuevos. En la descripci$$HEX1$$f300$$ENDHEX$$n dse coloca una descripcion y una cantidad de hilos que se utilizan.
forward
global type w_registro_bordado from w_sheet
end type
type uo_bordado from u_cst_reg_bordado within w_registro_bordado
end type
end forward

global type w_registro_bordado from w_sheet
string tag = "Registro de Bordados"
integer width = 2386
integer height = 2016
string title = "Registro de Bordados"
string menuname = "m_registro_bordado"
boolean maxbox = true
windowstate windowstate = maximized!
uo_bordado uo_bordado
end type
global w_registro_bordado w_registro_bordado

on w_registro_bordado.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_registro_bordado" then this.MenuID = create m_registro_bordado
this.uo_bordado=create uo_bordado
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_bordado
end on

on w_registro_bordado.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.uo_bordado)
end on

event key;call super::key;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:11:18
---------------------------------------------------
Uso del ctrl, keyflags=2
---------------------------------------------------*/
IF keyflags = 2 THEN // Keyflags para el 'Ctrl'
	Choose Case Key
		Case Key1!			
			uo_bordado.dw_busqueda.SetFocus()
		Case Key2!
			uo_bordado.dw_bordado.SetFocus()
	End Choose
End If
end event

event closequery;call super::closequery;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 28 de Septiembre de 2004.H:15:12
---------------------------------------------------
---------------------------------------------------*/
If uo_bordado.of_get_cambios() Then
	If MessageBox('Validaci$$HEX1$$f300$$ENDHEX$$n','Se perder$$HEX1$$e100$$ENDHEX$$n los cambios realizados. Desea continuar?',Question!,YesNo!,2)=2 Then
		Return 1
	Else
		Return 0
	End If
End If
end event

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:14:35
---------------------------------------------------
---------------------------------------------------*/
uo_bordado.of_carga_objtr()
//--------------------------------------------------
end event

event ue_save;call super::ue_save;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:10:57
---------------------------------------------------
Guarda datos del bordado
---------------------------------------------------*/
uo_bordado.TriggerEvent('ue_save')
//--------------------------------------------------
end event

type uo_bordado from u_cst_reg_bordado within w_registro_bordado
event destroy ( )
integer x = 37
integer width = 2231
integer height = 1824
integer taborder = 1
end type

on uo_bordado.destroy
call u_cst_reg_bordado::destroy
end on

