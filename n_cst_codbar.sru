HA$PBExportHeader$n_cst_codbar.sru
$PBExportComments$Objeto para imprimir a las impresoras de los c$$HEX1$$f300$$ENDHEX$$digos de barras
forward
global type n_cst_codbar from nonvisualobject
end type
end forward

global type n_cst_codbar from nonvisualobject
end type
global n_cst_codbar n_cst_codbar

type variables
Private:
            Long     il_filas,il_job
            Char     ich_stx,ich_etx,ich_esc
            String   is_final

end variables

forward prototypes
private function boolean of_inicializar ()
private function boolean of_enviar (readonly string as_cadena)
private function boolean of_finalizar ()
end prototypes

private function boolean of_inicializar ();//Definir el job

il_job = PrintOpen('Impresi$$HEX1$$f300$$ENDHEX$$n')
If il_job = -1 Then
	Messagebox("Error","Se ha producido un error creando el job !.")
	Return False	
End If	

ich_stx = "~h02"
ich_etx = "~h03"
ich_esc = "~h1B"
is_final = ich_esc+"Q1"+ich_esc+"Z"+ich_etx

Return True
end function

private function boolean of_enviar (readonly string as_cadena);
If PrintSend(il_job,as_cadena) <> 1 Then
	Messagebox("Error","Se ha producido un error enviando la impresi$$HEX1$$f300$$ENDHEX$$n !.")
	Return False	
End If

Return True

end function

private function boolean of_finalizar ();
If PrintClose(il_job) <> 1 Then
	Messagebox("Error","Se ha producido un error cerrando el job !.")
	Return False	
End If

Return True

end function

on n_cst_codbar.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_codbar.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

