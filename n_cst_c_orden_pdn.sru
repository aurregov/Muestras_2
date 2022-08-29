HA$PBExportHeader$n_cst_c_orden_pdn.sru
$PBExportComments$/***********************************************************~r~nSA51505 - Ceiba/JJ - 18-08-2015~r~nComentario:~r~n***********************************************************/
forward
global type n_cst_c_orden_pdn from nonvisualobject
end type
end forward

global type n_cst_c_orden_pdn from nonvisualobject
end type
global n_cst_c_orden_pdn n_cst_c_orden_pdn

type variables
PRIVATE:
n_cst_dt_muestras				ids_dt_muestras		//Muestra Basica
n_cst_dt_muestras_ref		ids_dt_muestras_ref	//Convertida a Referencia
n_cst_dt_mu_rec_gru			ids_dt_mu_rec_gru		//Maestro Recursos Grupo
end variables

forward prototypes
public subroutine of_objectdestroy () throws exception
public function boolean of_validarcamporecursohabilitado (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra) throws exception
public function boolean of_validarrecursodisponibledllo (readonly long al_recurso) throws exception
public function boolean of_validarcamporecursohabilitado (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra, readonly long al_recurso) throws exception
public function boolean of_validarcargarcamporecursomuestraorden (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra, readonly long al_recurso) throws exception
public function boolean of_cargarrecursomuestrabasica (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra) throws exception
public function long of_getrecursomuestrabasica () throws exception
public function boolean of_puedemodificar (readonly long al_parametro)
public function boolean of_validarcargarcamporecursomuestraorden (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra) throws exception
end prototypes

public subroutine of_objectdestroy () throws exception;/********************************************************************
SA51505 - of_objectDestroy Ceiba/JJ - 18-08-2015
<DESC> Description: setaer el nombre del dataobject actual </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para cambiarle el nombre del dataobject actual </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	DESTROY ids_dt_muestras
	DESTROY ids_dt_muestras_ref
	DESTROY ids_dt_mu_rec_gru
catch( Throwable ex1 )
	Throw ex1
End try 
end subroutine

public function boolean of_validarcamporecursohabilitado (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra) throws exception;/********************************************************************
SA51505 - of_ValidarCampoRecursoHabilitado Ceiba/JJ - 18-08-2015
<DESC> Description: en muestra basica hay un campo que me indica si fue o no convertido a referencia  </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para validar si fue o no convertida a referencia 
si fue convertida a referencia el campo recurso es habilitado, adicional 
tambien permite saber si se sincroniza el recurso con el de la muestra basica</USAGE>
********************************************************************/	
Exception ex
ex = create Exception 
Try
	ids_dt_muestras_ref.of_setNombreDataObject('d_muestras_ref')
	//Si se recupera informacion, esta muestra ya fue convertida a referencia
	IF ids_dt_muestras_ref.of_RecuperarInformacion(al_fabrica,al_linea,al_muestra) THEN 
		RETURN TRUE
	END IF
	
	RETURN FALSE
catch( Throwable ex1 )
	Throw ex1
End try 
end function

public function boolean of_validarrecursodisponibledllo (readonly long al_recurso) throws exception;/********************************************************************
SA51505 - of_validarRecursoDisponibleDllo Ceiba/JJ - 18-08-2015
<DESC> Description: validar si el recurso esta disponble o no para desarrollo de prenda </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Valida con respecto a maestro de grupo de trabajo </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	ids_dt_mu_rec_gru.of_setNombreDataObject('d_dt_mu_rec_gru_all')
	ids_dt_mu_rec_gru.of_RecuperarInformacion() //Se recuperan todos los recursos habilitados para dllo 
	IF ids_dt_mu_rec_gru.of_ValidarRecursoHabDllo(al_recurso) THEN 		
		RETURN TRUE
	END IF
	RETURN FALSE
catch( Throwable ex1 )
	Throw ex1
End try 
end function

public function boolean of_validarcamporecursohabilitado (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra, readonly long al_recurso) throws exception;/********************************************************************
SA51505 - of_ValidarCampoRecursoHabilitado Ceiba/JJ - 18-08-2015
<DESC> Description: en muestra basica hay un campo que me indica si fue o no convertido a referencia  </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para validar si fue o no convertida a referencia y si el recurso NO esta disponible para desarrollo </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	ids_dt_muestras_ref.of_setNombreDataObject('d_muestras_ref')
	//Si se recupera informacion, esta muestra ya fue convertida a referencia y
	//Si el recurso NO esta habilitado para desarrollo, solo en este caso se habilita el campo recurso 
	IF ids_dt_muestras_ref.of_RecuperarInformacion(al_fabrica,al_linea,al_muestra) AND &
		NOT(THIS.of_validarRecursodisponibleDllo(al_recurso)) THEN 
		RETURN TRUE
	END IF 
	
	RETURN FALSE
catch( Throwable ex1 )
	Throw ex1
End try 
end function

public function boolean of_validarcargarcamporecursomuestraorden (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra, readonly long al_recurso) throws exception;/********************************************************************
SA51505 - of_ValidarCargarCampoRecursoMuestraOrden Ceiba/JJ - 22-10-2015
<DESC> Description: en muestra basica hay un campo que me indica si fue o no convertido a referencia  </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> al_fabrica,al_linea,al_muestra, al_recurso</ARGS> 
<USAGE> si la muestra no se ha convertido a referencia y el recurso no esta habilitado 
para desarrollo entonces se debe cargar el recurso de la muestra con fabrica linea y muestra 
el recurso de la orden, si est$$HEX1$$e100$$ENDHEX$$n diferentes al recurso de la orden h$$HEX1$$e100$$ENDHEX$$galo igual al recurso de la 
muestra solo si aun no se ha programado la orden </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	IF NOT(of_validarcamporecursohabilitado(al_fabrica,al_linea,al_muestra)) AND & 
		NOT(of_validarrecursodisponibledllo(al_recurso)) THEN 
		RETURN TRUE
	END IF
	
	RETURN FALSE
catch( Throwable ex1 )
	Throw ex1
End try 
end function

public function boolean of_cargarrecursomuestrabasica (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra) throws exception;/********************************************************************
SA51505 - of_CargarRecursoMuestraBasica Ceiba/JJ - 22-10-2015
<DESC> Description: cargar el recurso de la muestra basica  </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE>invocar para cargar el recurso de la muestra basica </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	ids_dt_muestras.of_setNombreDataObject('d_m_muestras_orden')
	//Cargar Informacion de la Muestra Basica 
	IF ids_dt_muestras.of_recuperarInformacion(al_fabrica,al_linea,al_muestra) THEN 
		RETURN TRUE
	END IF
	RETURN FALSE
	
catch( Throwable ex1 )
	Throw ex1
End try 
end function

public function long of_getrecursomuestrabasica () throws exception;/********************************************************************
SA51505 - of_getRecursoMuestraBasica Ceiba/JJ - 22-10-2015
<DESC> Description: cargar el recurso de la muestra basica  </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE>invocar para cargar el recurso de la muestra basica </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	RETURN ids_dt_muestras.getItemNumber(1, 'co_Recurso')	
catch( Throwable ex1 )
	Throw ex1
End try 
end function

public function boolean of_puedemodificar (readonly long al_parametro);/********************************************************************
SA51505 - of_puedeModificar Ceiba/JJ - 18-08-2015
<DESC> Description: Los estados en los que se pueden modificar datos de la orden </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE>  Los estados en los que se pueden modificar datos de la orden</USAGE>
********************************************************************/	
If al_parametro=1 or al_parametro=2 or al_parametro=3 Then
	Return TRUE
Else
	Return FALSE
End If
end function

public function boolean of_validarcargarcamporecursomuestraorden (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra) throws exception;/********************************************************************
SA51505 - of_ValidarCargarCampoRecursoMuestraOrden Ceiba/JJ - 22-10-2015
<DESC> Description: en muestra basica hay un campo que me indica si fue o no convertido a referencia  </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> al_fabrica,al_linea,al_muestra, al_recurso</ARGS> 
<USAGE> si la muestra no se ha convertido a referencia y el recurso no esta habilitado 
para desarrollo entonces se debe cargar el recurso de la muestra con fabrica linea y muestra 
el recurso de la orden, si est$$HEX1$$e100$$ENDHEX$$n diferentes al recurso de la orden h$$HEX1$$e100$$ENDHEX$$galo igual al recurso de la 
muestra solo si aun no se ha programado la orden </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	IF NOT(of_validarCampoRecursoHabilitado(al_fabrica,al_linea,al_muestra)) THEN 
		RETURN TRUE
	END IF
	
	RETURN FALSE
catch( Throwable ex1 )
	Throw ex1
End try 
end function

on n_cst_c_orden_pdn.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_c_orden_pdn.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;ids_dt_muestras		= Create n_cst_dt_muestras
ids_dt_muestras_ref	= Create n_cst_dt_muestras_ref
ids_dt_mu_rec_gru		= Create n_cst_dt_mu_rec_gru
end event

event destructor;DESTROY ids_dt_muestras
DESTROY ids_dt_muestras_ref
DESTROY ids_dt_mu_rec_gru
end event

