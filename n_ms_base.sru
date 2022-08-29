HA$PBExportHeader$n_ms_base.sru
$PBExportComments$MailSession base
forward
global type n_ms_base from mailsession
end type
end forward

global type n_ms_base from mailsession
end type
global n_ms_base n_ms_base

forward prototypes
public function integer of_sendmailoutlook (readonly string as_for, readonly string as_subject, readonly string as_body, readonly string as_pathfile)
public function integer of_sendmailoutlook (readonly string as_for, readonly string as_subject, readonly string as_body)
end prototypes

public function integer of_sendmailoutlook (readonly string as_for, readonly string as_subject, readonly string as_body, readonly string as_pathfile);/*
OLEObject lole_outlook,lole_item,lole_attach
Int       li_return


lole_outlook = Create OLEObject

li_return = lole_outlook.ConnectToNewObject("outlook.application")

If li_return <> 0 Then
	Messagebox("Advertencia!","No se pudo establecer conexi$$HEX1$$f300$$ENDHEX$$n con Outlook.~n~nError : " &
	          + String(li_return) )
	Destroy lole_outlook
	Return li_return
End If

// EL par$$HEX1$$e100$$ENDHEX$$metro en el Create se utiliza adem$$HEX1$$e100$$ENDHEX$$s para crear contactos, tareas, etc.
// Par$$HEX1$$e100$$ENDHEX$$metro 0 para crear mail
lole_item = lole_outlook.CreateItem(0)

lole_item.To      = as_for
lole_item.Subject = as_subject
lole_item.Body    = as_body

// Para enviar archivos utilizamos las siguientes l$$HEX1$$ed00$$ENDHEX$$neas.
lole_attach = lole_item.Attachments
lole_attach.add(as_pathfile)

// Env$$HEX1$$ed00$$ENDHEX$$o del mail
//Return 

lole_item.Send()

lole_item.DisconnectObject()
*/

/*
Dbedocal 2018-05-09: SA 58356-Mejora envio de Correos automaticos aplicativos.
NO usar este objeto para el envio de correos electronicos, en cambio queda el objeto uo_correo de
la libbreria modifiable.pbl  Se organiza de igual forma para evitar futuros usos con errores.
*/

/*NO USAR ESTE OBJETO PARA ENVIO DE CORREOS, EN CAMBIO USAR UO_CORREO*/
uo_correo	lnv_correo
lnv_correo = CREATE uo_correo

TRY
	lnv_correo.of_enviar_correo(as_subject, as_body, "", as_for)
CATCH(Exception ex)
	Messagebox("Error", ex.getmessage())
END TRY

DESTROY lnv_correo

Return 0
end function

public function integer of_sendmailoutlook (readonly string as_for, readonly string as_subject, readonly string as_body);/*
mailsession lms_MAPISession
mailmessage lmm_Message



lms_MAPISession = CREATE mailsession
IF lms_MAPISession.MailLogon() = MailReturnSuccess! THEN
    // Mail Sesion is ok so Populate the Message
    lmm_Message.Subject = as_subject
    lmm_Message.NoteText = as_body
    lmm_Message.Recipient[ 1 ].Name = as_for
    //lmm_Message.Recipient[ 2 ].Name = 'jfvasduq@crystal.com.co'

    IF lms_MAPISession.MailSend( lmm_Message ) = MailReturnSuccess! THEN
        //Messagebox( 'Mail', 'Message was sent.' )
		  lms_MAPISession.MailLogoff()
		  DESTROY lms_MAPISession
		  Return 1
    END IF
    
    lms_MAPISession.MailLogoff()
END IF

DESTROY lms_MAPISession
*/

/*
Dbedocal 2018-05-09: SA 58356-Mejora envio de Correos automaticos aplicativos.
NO usar este objeto para el envio de correos electronicos, en cambio queda el objeto uo_correo de
la libbreria modifiable.pbl  Se organiza de igual forma para evitar futuros usos con errores.
*/

uo_correo	lnv_correo
lnv_correo = CREATE uo_correo

TRY
	lnv_correo.of_enviar_correo(as_subject, as_body, "", as_for)
CATCH(Exception ex)
	Messagebox("Error", ex.getmessage())
END TRY

DESTROY lnv_correo

Return -1

end function

on n_ms_base.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_ms_base.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

