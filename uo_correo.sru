HA$PBExportHeader$uo_correo.sru
forward
global type uo_correo from nonvisualobject
end type
end forward

global type uo_correo from nonvisualobject
end type
global uo_correo uo_correo

forward prototypes
public subroutine of_enviar_correo (string as_asunto, string as_contenido, string as_aplicacion) throws exception
public subroutine of_enviar_correo (string as_asunto, string as_contenido, string as_aplicacion, string as_usuario) throws exception
end prototypes

public subroutine of_enviar_correo (string as_asunto, string as_contenido, string as_aplicacion) throws exception;/*******************************************************************
of_enviar_correo
Dbedocal 2018-05-11: SA 58356-Mejora envio de Correos automaticos aplicativos.
<DESC> Funcion que envia un email a un grupo de personas configuradas en h_manejo_correo 
 y dt_manejo_correo
</DESC> 
<RETURN> void
</RETURN> 
<ACCESS> Public 
<ARGS> as_asunto: Asunto del correo a enviar
		 as_contenido: Contenido del correo a enviar
		 as_aplicacion: C$$HEX1$$f300$$ENDHEX$$digo del programa donde se parametrizaron los correos en la tabla h_manejo_correo
</ARGS> 
********************************************************************/

of_enviar_correo(as_asunto, as_contenido, as_aplicacion, "" )
end subroutine

public subroutine of_enviar_correo (string as_asunto, string as_contenido, string as_aplicacion, string as_usuario) throws exception;/*******************************************************************
of_enviar_correo
Dbedocal 2018-05-11: SA 58356-Mejora envio de Correos automaticos aplicativos.
<DESC> Funcion que envia un email a un grupo de personas configuradas en h_manejo_correo 
 y dt_manejo_correo
</DESC> 
<RETURN> void
</RETURN> 
<ACCESS> Public 
<ARGS> as_asunto: Asunto del correo a enviar
as_contenido: Contenido del correo a enviar
as_aplicacion: C$$HEX1$$f300$$ENDHEX$$digo del programa donde se parametrizaron los correos en la tabla h_manejo_correo
</ARGS> 
********************************************************************/

Exception ex
String ls_error
ex = create Exception

DECLARE pr_envia_email PROCEDURE FOR
		  PR_ENVIAR_EMAIL(:as_aplicacion, :as_contenido, :as_asunto, :as_usuario) USING n_cst_application.itr_appl; 
			
EXECUTE pr_envia_email ;
 
IF n_cst_application.itr_appl.SQLCODE = -1 THEN 
	ls_error = n_cst_application.itr_appl.sqlerrtext
	CLOSE pr_envia_email;
	ex.setmessage("Error enviando correo: "+ ls_error )
	throw(ex)
ELSE
	CLOSE pr_envia_email;
END IF
end subroutine

on uo_correo.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_correo.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

