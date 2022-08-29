HA$PBExportHeader$n_cst_recurso_cotizado.sru
$PBExportComments$/***********************************************************~r~nSA52045 - Ceiba/jjmonsal - 30-11-2015~r~nComentario:Modificacion Correo automatico desde Muestras~r~n***********************************************************/
forward
global type n_cst_recurso_cotizado from nonvisualobject
end type
end forward

global type n_cst_recurso_cotizado from nonvisualobject
end type
global n_cst_recurso_cotizado n_cst_recurso_cotizado

type variables
Long	il_recCotizaOldNoCierra								//Alamcena el recurso Cotizado No cierra antes de realizar la modificacion 
Long	il_recCotizaOldCierra								//Alamcena el recurso Cotizado Cierra antes de realizar la modificacion 
end variables

forward prototypes
public function long of_getreccotizaoldnocierra ()
public subroutine of_setreccotizaoldnocierra (readonly long al_arg)
public function long of_getreccotizaoldcierra ()
public subroutine of_setreccotizaoldcierra (readonly long al_arg)
end prototypes

public function long of_getreccotizaoldnocierra ();/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_getRecCotizaOldNoCierra
<DESC> Description:Retorna el recurso cotizado antes del cambio</DESC> 
<RETURN> Long: recurso </RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> NONE</ARGS> 
<USAGE> Invocar para retornar el recurso cotizado antes del cambio </USAGE>
********************************************************************/
RETURN il_recCotizaOldNoCierra
end function

public subroutine of_setreccotizaoldnocierra (readonly long al_arg);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_setRecCotizaOldNoCierra
<DESC> Description:Modifica el recurso cotizado No cierra antes del cambio</DESC> 
<RETURN> Long: recurso </RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> NONE</ARGS> 
<USAGE> Invocar para setear el recurso cotizado No cierra antes posible cambio que se realice </USAGE>
********************************************************************/
il_recCotizaOldNoCierra = al_arg
end subroutine

public function long of_getreccotizaoldcierra ();/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_getRecCotizaOldCierra
<DESC> Description:Retorna el recurso cotizado cierra antes del cambio</DESC> 
<RETURN> Long: recurso </RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> NONE</ARGS> 
<USAGE> Invocar para retornar el recurso cotizado Cierra antes del cambio </USAGE>
********************************************************************/
RETURN il_recCotizaOldCierra
end function

public subroutine of_setreccotizaoldcierra (readonly long al_arg);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_setof_setRecCotizaOldCierra
<DESC> Description:Modifica el recurso cotizado No cierra antes del cambio</DESC> 
<RETURN> Long: recurso </RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> NONE</ARGS> 
<USAGE> Invocar para setear el recurso cotizado No cierra antes posible cambio que se realice </USAGE>
********************************************************************/
il_recCotizaOldCierra = al_arg
end subroutine

on n_cst_recurso_cotizado.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_recurso_cotizado.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;SetNull(il_recCotizaOldNoCierra)
SetNull(il_recCotizaOldCierra)
end event

