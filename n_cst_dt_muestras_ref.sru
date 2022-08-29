HA$PBExportHeader$n_cst_dt_muestras_ref.sru
$PBExportComments$/***********************************************************~r~nSA51505 - Ceiba/JJ - 18-08-2015~r~nComentario: se crea el objeto para trabajar con la entidad~r~n***********************************************************/
forward
global type n_cst_dt_muestras_ref from uo_dsbase
end type
end forward

global type n_cst_dt_muestras_ref from uo_dsbase
end type
global n_cst_dt_muestras_ref n_cst_dt_muestras_ref

type variables
PRIVATE:
String	is_NombreDataObject
end variables

forward prototypes
public function string of_getnombredataobject () throws exception
public subroutine of_setnombredataobject (readonly string al_nombredataobject) throws exception
public function boolean of_recuperarinformacion (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra) throws exception
public function boolean of_validarmuestraconvertidaareferencia (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra)
public subroutine of_filtrar (readonly string as_filtro)
public function long of_getrowcount ()
public function uo_dsbase of_getds () throws exception
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

public subroutine of_setnombredataobject (readonly string al_nombredataobject) throws exception;/********************************************************************
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
	THIS.DataObject 				= al_NombreDataObject
	THIS.is_NombreDataObject	= al_NombreDataObject
	
	THIS.SetTransObject(n_cst_application.itr_appl)
	
catch( Throwable ex1 )

	Throw ex1
End try


end subroutine

public function boolean of_recuperarinformacion (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra) throws exception;/********************************************************************
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

public function boolean of_validarmuestraconvertidaareferencia (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_validarMuestraConvertidaAReferencia
<DESC> Description: Servicio para validar si una muestra fue convertida a referencia o NO </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para saber si una muestra ya se convertio a referencia Si ya se convirtio retorna TRUE sino False</USAGE>
********************************************************************/	
Exception ex
ex = create Exception 
Try
	IF ISNull(THIS.of_getNombreDataObject()) OR Len(Trim(of_getNombreDataObject())) = 0 THEN 
		THIS.of_setNombreDataObject('d_muestras_ref')
	END IF
	//Si se recupera informacion, esta muestra ya fue convertida a referencia
	IF THIS.of_RecuperarInformacion(al_fabrica,al_linea,al_muestra) THEN 
		RETURN TRUE
	END IF
	
	RETURN FALSE
catch( Throwable ex1 )
	Throw ex1
End try 
end function

public subroutine of_filtrar (readonly string as_filtro);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_Filtrar
<DESC> Description: Servicio para FILTRAR DATOS</DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para saber si una muestra ya se convertio a referencia Si ya se convirtio retorna TRUE sino False</USAGE>
********************************************************************/	
Exception ex
ex = create Exception 
Try
	THIS.SetFilter(as_filtro)
	THIS.Filter()
catch( Throwable ex1 )
	Throw ex1
End try 
end subroutine

public function long of_getrowcount ();/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_getRowCount
<DESC> Description: Servicio para Recuperar Numero de Filas </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Recuperar Numero de Filas </USAGE>
********************************************************************/	
Exception ex
ex = create Exception 
Try
	RETURN THIS.RowCount()
catch( Throwable ex1 )
	Throw ex1
End try 
end function

public function uo_dsbase of_getds () throws exception;/********************************************************************
SA51505 - of_GetDS Ceiba/JJ - 18-08-2015
<DESC> Description: Retornar Datastore</DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> al_fabrica al_linea al_muestra </ARGS> 
<USAGE>Retornar Datastore</USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	RETURN THIS
catch( Throwable ex1 )
	Throw ex1
End try


end function

on n_cst_dt_muestras_ref.create
call super::create
end on

on n_cst_dt_muestras_ref.destroy
call super::destroy
end on

