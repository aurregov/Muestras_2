HA$PBExportHeader$n_cst_dt_mu_rec_gru.sru
$PBExportComments$/***********************************************************~r~nSA51505 - Ceiba/JJ - 18-08-2015~r~nComentario: se crea el objeto para trabajar con la entidad~r~n***********************************************************/
forward
global type n_cst_dt_mu_rec_gru from uo_dsbase
end type
end forward

global type n_cst_dt_mu_rec_gru from uo_dsbase
end type
global n_cst_dt_mu_rec_gru n_cst_dt_mu_rec_gru

type variables
PRIVATE:
String	is_NombreDataObject
end variables

forward prototypes
public function string of_getnombredataobject () throws exception
public subroutine of_setnombredataobject (readonly string al_nombredataobject) throws exception
public subroutine of_recuperarinformacion () throws exception
public function boolean of_validarrecursohabdllo (readonly long al_recurso) throws exception
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

public subroutine of_recuperarinformacion () throws exception;/********************************************************************
SA51505 - of_RecuperarInformacion Ceiba/JJ - 18-08-2015
<DESC> Description: Retornar true si se recupera informacion sino existe informacion retorna false </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> recuperar informacion </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	IF THIS.of_retrieve( ) < 0 THEN 
		ex.setmessage('Error Recuperando informacion de recursos disponibles para desarrollo')
		THROW ex
	END IF
catch( Throwable ex1 )
	Throw ex1
End try
end subroutine

public function boolean of_validarrecursohabdllo (readonly long al_recurso) throws exception;/********************************************************************
SA51505 - of_ValidarRecursoHabDllo Ceiba/JJ - 18-08-2015
<DESC> Description: Validar si el Recurso esta Habilitado para Dllo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Retorna true habiltado para desarrollo - false no esta habilitado</USAGE>
********************************************************************/	
long			ll_found
String		ls_find
Exception	ex
ex = create Exception
Try
	ls_find = "co_recurso = "+String(al_recurso)+""
	IF THIS.Find(ls_find,1, THIS.RowCount()) >= 1 THEN 
		RETURN TRUE
	END IF
	RETURN FALSE 
catch( Throwable ex1 )
	Throw ex1
End try
end function

on n_cst_dt_mu_rec_gru.create
call super::create
end on

on n_cst_dt_mu_rec_gru.destroy
call super::destroy
end on

