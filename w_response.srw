HA$PBExportHeader$w_response.srw
$PBExportComments$Ventana tipo response base (normalmente para captura de argumentos)
forward
global type w_response from w_base
end type
end forward

global type w_response from w_base
WindowType WindowType=response!
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
end type
global w_response w_response

forward prototypes
protected function boolean of_centerwindow ()
end prototypes

protected function boolean of_centerwindow ();Environment le_even

If GetEnvironment ( le_even ) <> 1 Then Return False

This.X = (PixelsToUnits(le_even.ScreenWidth,XPixelsToUnits!) - This.Width) / 2
This.Y = (PixelsToUnits(le_even.ScreenHeight,YPixelsToUnits!) - This.Height) / 2

Return True
end function

on w_response.create
call super::create
end on

on w_response.destroy
call super::destroy
end on

event open;
This.of_CenterWindow()
end event

