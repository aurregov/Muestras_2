HA$PBExportHeader$n_cst_tr_modmanoobra.sru
$PBExportComments$/***********************************************************~r~nSA53977 - Ceiba/jjmonsal - 20-12-2016~r~nComentario: GENERAR ALERTA POR MODIFICACIONES EN FICHAS DE MANO OBRA~r~n***********************************************************/
forward
global type n_cst_tr_modmanoobra from uo_dsbase
end type
end forward

global type n_cst_tr_modmanoobra from uo_dsbase
end type
global n_cst_tr_modmanoobra n_cst_tr_modmanoobra

type variables
PRIVATE:
String	is_NombreDataObject										//Nombre Dataobject Actual
Integer	ii_filaAct													//Fila actual 
end variables

forward prototypes
public subroutine of_setnumregistro (readonly long al_arg)
public subroutine of_setreferencia (readonly long al_arg)
public subroutine of_setoperacioninicial (readonly long al_arg)
public subroutine of_setrecursoinicial (readonly long al_arg)
public subroutine of_setoperacionmod (readonly long al_arg)
public subroutine of_setrecursomod (readonly long al_arg)
public subroutine of_settalla (readonly string as_arg)
public subroutine of_setcentroini (readonly string as_arg)
public subroutine of_setdeoperacionini (readonly string as_arg)
public subroutine of_setderecursoini (readonly string as_arg)
public subroutine of_decentromod (readonly string as_arg)
public subroutine of_setdeoperacionmod (readonly string as_arg)
public subroutine of_setderecursomod (readonly string as_arg)
public subroutine of_insertarreg ()
public subroutine of_setfilaactual (readonly integer ai_filaact)
public subroutine of_setnombredataobject (readonly string as_nombredataobject)
public function integer of_getfilaactual ()
public subroutine of_setobservacion (readonly string as_arg)
end prototypes

public subroutine of_setnumregistro (readonly long al_arg);/********************************************************************
SA53977 - Ceiba/jjmonsal - 20-12-2016 - FunctionName: of_setNumRegistro
<DESC> Description: setter </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
THIS.setitem(ii_filaAct,'co_numRegistro',al_arg)
end subroutine

public subroutine of_setreferencia (readonly long al_arg);/********************************************************************
SA53977 - Ceiba/jjmonsal - 20-12-2016 - FunctionName: of_setReferencia 
<DESC> Description: setter </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
THIS.setitem(ii_filaAct,'co_referencia',al_arg)
end subroutine

public subroutine of_setoperacioninicial (readonly long al_arg);/********************************************************************
SA53977 - Ceiba/jjmonsal - 20-12-2016 - FunctionName: of_setOperacionInicial
<DESC> Description: setter </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
THIS.setitem(ii_filaAct,'co_operacionini',al_arg)
end subroutine

public subroutine of_setrecursoinicial (readonly long al_arg);/********************************************************************
SA53977 - Ceiba/jjmonsal - 20-12-2016 - FunctionName: of_setRecursoInicial
<DESC> Description: setter </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
THIS.setitem(ii_filaAct,'co_recursoini',al_arg)
end subroutine

public subroutine of_setoperacionmod (readonly long al_arg);/********************************************************************
SA53977 - Ceiba/jjmonsal - 20-12-2016 - FunctionName: of_setOperacionMod
<DESC> Description: setter </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
THIS.setitem(ii_filaAct,'co_operacionmod',al_arg)
end subroutine

public subroutine of_setrecursomod (readonly long al_arg);/********************************************************************
SA53977 - Ceiba/jjmonsal - 20-12-2016 - FunctionName: of_setRecursoMod
<DESC> Description: setter </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
THIS.setitem(ii_filaAct,'co_recursomod',al_arg)
end subroutine

public subroutine of_settalla (readonly string as_arg);/********************************************************************
SA53977 - Ceiba/jjmonsal - 20-12-2016 - FunctionName: of_SetTalla
<DESC> Description: setter </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
THIS.setitem(ii_filaAct,'de_talla',as_arg)
end subroutine

public subroutine of_setcentroini (readonly string as_arg);/********************************************************************
SA53977 - Ceiba/jjmonsal - 20-12-2016 - FunctionName: of_SetCentroIni
<DESC> Description: setter </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
THIS.setitem(ii_filaAct,'de_centroini',as_arg)
end subroutine

public subroutine of_setdeoperacionini (readonly string as_arg);/********************************************************************
SA53977 - Ceiba/jjmonsal - 20-12-2016 - FunctionName: of_SetDeOperacionIni
<DESC> Description: setter </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
THIS.setitem(ii_filaAct,'de_operacionini',as_arg)
end subroutine

public subroutine of_setderecursoini (readonly string as_arg);/********************************************************************
SA53977 - Ceiba/jjmonsal - 20-12-2016 - FunctionName: of_SetDeRecursoIni
<DESC> Description: setter </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
THIS.setitem(ii_filaAct,'de_recursoini',as_arg)
end subroutine

public subroutine of_decentromod (readonly string as_arg);/********************************************************************
SA53977 - Ceiba/jjmonsal - 20-12-2016 - FunctionName: of_DeCentroMod
<DESC> Description: setter </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
THIS.setitem(ii_filaAct,'de_centromod',as_arg)
end subroutine

public subroutine of_setdeoperacionmod (readonly string as_arg);/********************************************************************
SA53977 - Ceiba/jjmonsal - 20-12-2016 - FunctionName: of_SetDeOperacionMod
<DESC> Description: setter </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
THIS.setitem(ii_filaAct,'de_operacionmod',as_arg)
end subroutine

public subroutine of_setderecursomod (readonly string as_arg);/********************************************************************
SA53977 - Ceiba/jjmonsal - 20-12-2016 - FunctionName: of_setDeRecursoMod
<DESC> Description: setter </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
THIS.setitem(ii_filaAct,'de_recursomod',as_arg)
end subroutine

public subroutine of_insertarreg ();/********************************************************************
SA53977 - Ceiba/jjmonsal - 20-12-2016 - FunctionName: of_InsertarReg
<DESC> Description: setter </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
integer		li_filaActual
Exception 	ex
ex = create Exception
Try
	li_filaActual = THIS.InsertRow(0)
	THIS.of_setFilaActual(li_filaActual)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setfilaactual (readonly integer ai_filaact);/********************************************************************
SA53977 - Ceiba/jjmonsal - 20-12-2016 - FunctionName: of_setfilaactual
<DESC> Description: of_setfilaactual </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Exception ex
ex = create Exception
Try
	ii_filaAct = ai_filaAct
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setnombredataobject (readonly string as_nombredataobject);/********************************************************************
SA53977 - Ceiba/jjmonsal - 20-12-2016 - FunctionName: of_setNombreDataObject
<DESC> Description: setter </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Exception ex
ex = create Exception
Try
	THIS.DataObject 				= as_nombredataobject
	THIS.is_NombreDataObject	= as_nombredataobject
	
	THIS.SetTransObject(n_cst_application.itr_appl)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public function integer of_getfilaactual ();/********************************************************************
SA53977 - Ceiba/jjmonsal - 20-12-2016 - FunctionName: of_GetFilaActual
<DESC> Description: of_setfilaactual </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Exception ex
ex = create Exception
Try
	RETURN ii_filaAct
CATCH( Throwable ex1 )
	Throw ex1
End try
end function

public subroutine of_setobservacion (readonly string as_arg);/********************************************************************
SA53977 - Ceiba/jjmonsal - 20-12-2016 - FunctionName: of_setObservacion
<DESC> Description: setter </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
THIS.setitem(ii_filaAct,'Observacion',as_arg)
end subroutine

on n_cst_tr_modmanoobra.create
call super::create
end on

on n_cst_tr_modmanoobra.destroy
call super::destroy
end on

event constructor;call super::constructor;ii_filaAct = 0 
end event

event sqlpreview;call super::sqlpreview;String ls
ls = sqlSyntax
end event

