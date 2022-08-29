HA$PBExportHeader$w_registro_chablon.srw
$PBExportComments$Ventana de Registro de chablones/gr$$HEX1$$e100$$ENDHEX$$ficos antideslizantes para la programaci$$HEX1$$f300$$ENDHEX$$n.Los Chablones son plantillas que se emplean para aplicar los antideslizantes, en este caso solo se registra la informaci$$HEX1$$f300$$ENDHEX$$n del molde y no de su aplicaci$$HEX1$$f300$$ENDHEX$$n. La persona encar$$HEX3$$4441542a0074$$ENDHEX$$
forward
global type w_registro_chablon from w_sheet
end type
type uo_chablon from u_cst_chablon within w_registro_chablon
end type
end forward

global type w_registro_chablon from w_sheet
string tag = "Registro de Chablones/Graficos Antideslizantes"
integer width = 2496
integer height = 2004
string title = "Registro de Chablones/Graficos Antideslizantes"
string menuname = "m_registro_chablon"
boolean maxbox = true
windowstate windowstate = maximized!
uo_chablon uo_chablon
end type
global w_registro_chablon w_registro_chablon

on w_registro_chablon.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_registro_chablon" then this.MenuID = create m_registro_chablon
this.uo_chablon=create uo_chablon
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_chablon
end on

on w_registro_chablon.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.uo_chablon)
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
			uo_chablon.dw_busqueda.SetFocus()
		Case Key2!			
			uo_chablon.dw_chablon.SetFocus()
	End Choose
End If
end event

event closequery;call super::closequery;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 28 de Septiembre de 2004.H:15:12
---------------------------------------------------
---------------------------------------------------*/
If uo_chablon.of_get_cambios() Then
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
n_cst_param lou_param
String ls_oper
//-------------------------------------------------
uo_chablon.of_carga_objtr()
Open(w_sel_graf_deschab)
If IsValid(Message.PowerObjectParm) Then
	lou_param = Message.PowerObjectParm
	If UpperBound(lou_param.il_vector)>=1 Then
		uo_chablon.of_avi_operario(lou_param.il_vector[1])
		uo_chablon.of_cargar_dw()
		ls_oper=uo_chablon.of_getoper()
		This.Title+=' | Vista de '+Upper(ls_oper)
		If Not (ls_oper='Graficador') Then
			m_registro_chablon.m_edicion.m_insertar.Enabled=False
			m_registro_chablon.m_edicion.m_clear.Enabled=False
		End If
	End If
Else
	//MessageBox('Advertencia','Informaci$$HEX1$$f300$$ENDHEX$$n de la selecci$$HEX1$$f300$$ENDHEX$$n del operario de chablones err$$HEX1$$f300$$ENDHEX$$nea',StopSign!)
	Close(This)
End If
//--------------------------------------------------
end event

event ue_save;call super::ue_save;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:10:57
---------------------------------------------------
Guarda datos del chablon
---------------------------------------------------*/
uo_chablon.TriggerEvent('ue_save')
//--------------------------------------------------
end event

type uo_chablon from u_cst_chablon within w_registro_chablon
integer x = 37
integer width = 2309
integer height = 1888
integer taborder = 1
end type

on uo_chablon.destroy
call u_cst_chablon::destroy
end on

