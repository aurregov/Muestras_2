HA$PBExportHeader$n_cst_dt_muestras.sru
forward
global type n_cst_dt_muestras from uo_dsbase
end type
end forward

global type n_cst_dt_muestras from uo_dsbase
end type
global n_cst_dt_muestras n_cst_dt_muestras

type variables
PRIVATE:
String	is_NombreDataObject
end variables

forward prototypes
public function string of_getnombredataobject () throws exception
public function boolean of_recuperarinformacion (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra)
public subroutine of_setnombredataobject (readonly string as_nombredataobject) throws exception
end prototypes

public function string of_getnombredataobject () throws exception;/********************************************************************
SA51505 - of_getNombreDataObject Ceiba/JJ - 18-08-2015
<DESC> Description: Retornar el nombre del dataobject actual </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para obtener el nombre del dataobject actual </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	RETURN is_NombreDataObject
catch( Throwable ex1 )
	Throw ex1
End try
end function

public function boolean of_recuperarinformacion (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra);/********************************************************************
SA51505 - of_RecuperarInformacion Ceiba/JJ - 18-08-2015
<DESC> Description: Retornar true si se recupera informacion sino existe informacion retorna false </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> al_fabrica al_linea al_muestra </ARGS> 
<USAGE> recuperar informacion </USAGE>
********************************************************************/	
Exception ex 
ex = create Exception
Try
	IF THIS.of_retrieve(al_fabrica,al_linea,al_muestra) >= 1 THEN 
		RETURN TRUE
	ELSE
		RETURN FALSE
	END IF
catch( Throwable ex1 )
	Throw ex1
End try


end function

public subroutine of_setnombredataobject (readonly string as_nombredataobject) throws exception;/********************************************************************
SA51505 - of_setNombreDataObject Ceiba/JJ - 18-08-2015
<DESC> Description: setaer el nombre del dataobject actual </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para cambiarle el nombre del dataobject actual </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	THIS.DataObject 				= as_nombredataobject
	THIS.is_NombreDataObject	= as_nombredataobject
	
	THIS.SetTransObject(n_cst_application.itr_appl)
catch( Throwable ex1 )
	Throw ex1
End try
end subroutine

on n_cst_dt_muestras.create
call super::create
end on

on n_cst_dt_muestras.destroy
call super::destroy
end on

