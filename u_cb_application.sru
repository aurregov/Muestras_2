HA$PBExportHeader$u_cb_application.sru
$PBExportComments$Botton que se utiliza y con opci$$HEX1$$f300$$ENDHEX$$n de personalizarlo para la aplicaci$$HEX1$$f300$$ENDHEX$$n.
forward
global type u_cb_application from u_cb_base
end type
end forward

global type u_cb_application from u_cb_base
event ue_pressenter pbm_keydown
end type
global u_cb_application u_cb_application

event ue_pressenter;/**************************************************************************************
	Event: 	ue_pressenter
	Purpose:	Disparar la opci$$HEX1$$f300$$ENDHEX$$n de click sobre el bot$$HEX1$$f300$$ENDHEX$$n
				cuando el propio boton tiene el foco y se es
				presionada la tecla 'enter'
	Scope:	Public
	Arguments: 	key 		KeyCode by value A value of the KeyCode 
								enumerated data type indicating the key 
								that was pressed (for example, KeyA! or KeyF1!)
					keyflags	UnsignedLong by value (the modifier keys that were
								pressed with the key) 
								Values are:1 shift key, 2 ctrl key,3 shift and ctrl keys
	Returns:		Long		pbm_keydown
************************************************************************************/
If key = KeyEnter! Then
        This.TriggerEvent(Clicked!)
End If

 

end event

on u_cb_application.create
end on

on u_cb_application.destroy
end on

