HA$PBExportHeader$n_cst_tr_modfmp.sru
$PBExportComments$/***********************************************************~r~nSA55169 - Ceiba/jjmonsal - 03-10-2016~r~nComentario: REPORTE POR MODIFICACI$$HEX1$$d300$$ENDHEX$$N EN FICHAS DE MATERIA PRIM~r~n***********************************************************/
forward
global type n_cst_tr_modfmp from uo_dsbase
end type
end forward

global type n_cst_tr_modfmp from uo_dsbase
end type
global n_cst_tr_modfmp n_cst_tr_modfmp

type variables
PRIVATE:
String	is_NombreDataObject										//Nombre Dataobject Actual
Integer	ii_filaAct													//Fila actual 
String	is_Operacion												//Bandera que indica si el regsitro es Nuevo o existente


end variables

forward prototypes
public subroutine of_setnombredataobject (readonly string as_nombredataobject)
public function string of_getnombredataobject ()
public subroutine of_insertarregistro ()
public function integer of_getfilaactual ()
public subroutine of_setfilaactual (readonly integer ai_filaact)
public subroutine of_setreferencia (readonly long al_arg)
public subroutine of_setusuario (readonly string as_arg)
public subroutine of_setinstancia (readonly string as_arg)
public function string of_getinstancia ()
public function string of_getusuario ()
public subroutine of_setoperacion (readonly string as_arg)
public function string of_getoperacion ()
public function long of_getrecursocotcierra ()
public function long of_getreferencia ()
public function long of_gettalla ()
public function long of_getcolor ()
public function long of_getrecursocotnocierra ()
public function long of_getcolor_mpinicial ()
public function long of_getcolor_mpmod ()
public function string of_getorden_prev_fab ()
public function string of_getsol_pedido ()
public function string of_getmpinicial ()
public function string of_getmpmod ()
public function string of_getdempinicial ()
public function string of_getdempmod ()
public function string of_getpeso_inicial ()
public function string of_getpeso_mod ()
public subroutine of_settalla (readonly long al_arg)
public subroutine of_setcolor (readonly long al_arg)
public subroutine of_setreccotcierra (readonly long al_arg)
public subroutine of_setreccotnocierra (readonly long al_arg)
public subroutine of_setcolor_mpinicial (readonly long al_arg)
public subroutine of_setcolor_mpmod (readonly long al_arg)
public subroutine of_setorden_prev_fab (readonly string as_arg)
public subroutine of_setsol_pedido (readonly string as_arg)
public subroutine of_setmpinicial (readonly string as_arg)
public subroutine of_setmpmod (readonly string as_arg)
public subroutine of_setdempinicial (readonly string as_arg)
public subroutine of_setdempmod (readonly string as_arg)
public subroutine of_setpeso_inicial (readonly string as_arg)
public subroutine of_setpeso_mod (readonly string as_arg)
public subroutine of_setfechacreacion (readonly datetime adt_arg)
public subroutine of_setdatosupdate ()
public subroutine of_validarregexiste (readonly long al_referencia, readonly long al_talla, readonly long al_color, readonly long al_cs_orden)
public function long of_getconsecutivoordenessis ()
public subroutine of_setconsecutivoordenessis (readonly long al_arg)
public subroutine of_setdatosinserccion (readonly long al_ref, readonly long al_talla, readonly long al_color, readonly string as_orden_prev_fab, readonly string as_sol_pedido, readonly long al_reccotcierra, readonly long al_reccotnocierra, readonly string as_mpinicial, readonly string as_mpmod, readonly string as_de_mpinicial, readonly string as_de_mpmod, readonly long al_color_mpinicial, readonly long al_color_mpmod, readonly string as_peso_inicial, readonly string as_peso_mod, readonly long al_consecutivoordensis)
public subroutine of_setdatosmodificacion (readonly long al_ref, readonly long al_talla, readonly long al_color, readonly string as_orden_prev_fab, readonly string as_sol_pedido, readonly long al_reccotcierra, readonly long al_reccotnocierra, readonly string as_mpinicial, readonly string as_mpmod, readonly string as_de_mpinicial, readonly string as_de_mpmod, readonly long al_color_mpinicial, readonly long al_color_mpmod, readonly string as_peso_inicial, readonly string as_peso_mod, readonly long al_consecutivoordensis)
public subroutine of_validarnulos (ref long al_referencia, ref long al_talla, ref long al_color, ref long al_cs_orden, ref string as_orden_prev_fab, ref string as_sol_pedido, ref long al_reccotcierra, ref long al_reccotnocierra, ref string as_mpinicial, ref string as_mpmod, ref long al_color_mpinicial, ref long al_color_mpmod)
public subroutine of_validarregexiste (long al_referencia, long al_talla, long al_color, long al_cs_orden, string as_orden_prev_fab, string as_sol_pedido, long al_reccotcierra, long al_reccotnocierra, string as_mpinicial, string as_mpmod, long al_color_mpinicial, long al_color_mpmod)
end prototypes

public subroutine of_setnombredataobject (readonly string as_nombredataobject);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_setNombreDataObject 
<DESC> Description: setear el nombre del dataobject actual </DESC> 
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
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public function string of_getnombredataobject ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : of_getNombreDataObject 
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

public subroutine of_insertarregistro ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_setNombreDataObject 
<DESC> Description: insertar un nuevo regstro  </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> insertar un nuevo regstro  </USAGE>
********************************************************************/	
integer		li_filaActual
Exception 	ex
ex = create Exception
Try
	li_filaActual = THIS.InsertRow(0)
	of_setFilaActual(li_filaActual)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public function integer of_getfilaactual ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_getNombreDataObject 
<DESC> Description: Retornar la fila actual </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para obtener la fila actual </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	RETURN ii_filaAct
catch( Throwable ex1 )
	Throw ex1
End try

end function

public subroutine of_setfilaactual (readonly integer ai_filaact);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_setNombreDataObject 
<DESC> Description: setaer la fila actual</DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo cabmiar la fila actual </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	ii_filaAct = ai_filaAct
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setreferencia (readonly long al_arg);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_setReferencia - Material 
<DESC> Description: Setear la Referencia de la conversion a referencia - Material  </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualizar el Material </USAGE>
********************************************************************/	
Try
	THIS.setitem(ii_filaAct,'co_referencia',al_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setusuario (readonly string as_arg);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_setUsuario
<DESC> Description: Setear la Muestra </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualizar la Muestra </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	THIS.setitem(ii_filaAct,'usuario',as_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setinstancia (readonly string as_arg);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_setInstancia
<DESC> Description: Setear la instancia  </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualizar el Campo de Instancia </USAGE>
********************************************************************/	
Try
	THIS.setitem(ii_filaAct,'instancia',as_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public function string of_getinstancia ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_getinstancia
<DESC> Description: Obtener valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Obtener el valor del campo </USAGE>
********************************************************************/	
Try
	RETURN THIS.GetItemString(ii_filaAct,'instancia')
CATCH( Throwable ex1 )
	Throw ex1
End try
end function

public function string of_getusuario ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_getUsuario
<DESC> Description: Obtener valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Obtener el valor del campo </USAGE>
********************************************************************/	
Try
	RETURN THIS.GetItemString(ii_filaAct,'usuario')
CATCH( Throwable ex1 )
	Throw ex1
End try
end function

public subroutine of_setoperacion (readonly string as_arg);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_setOperacion
<DESC> Description: Setear la operacion </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualizar  la operacion </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	is_Operacion = as_arg
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public function string of_getoperacion ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName : of_getOperacion
<DESC> Description: Retornar el nombre de la operacion </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para obtener el nombre de la operacion </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	RETURN is_Operacion
catch( Throwable ex1 )
	Throw ex1
End try
end function

public function long of_getrecursocotcierra ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_getRecursoCotCierra
<DESC> Description: Obtener valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Obtener el valor del campo </USAGE>
********************************************************************/	
Try
	RETURN THIS.GetItemNumber(ii_filaAct,'co_reccotcierra')
CATCH( Throwable ex1 )
	Throw ex1
End try
end function

public function long of_getreferencia ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_getReferencia
<DESC> Description: Obtener valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Obtener el valor del campo </USAGE>
********************************************************************/	
Try
	RETURN THIS.GetItemNumber(ii_filaAct,'co_referencia')
CATCH( Throwable ex1 )
	Throw ex1
End try
end function

public function long of_gettalla ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_getTalla
<DESC> Description: Obtener valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Obtener el valor del campo </USAGE>
********************************************************************/	
Try
	RETURN THIS.GetItemNumber(ii_filaAct,'co_talla')
CATCH( Throwable ex1 )
	Throw ex1
End try
end function

public function long of_getcolor ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_getColor
<DESC> Description: Obtener valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Obtener el valor del campo </USAGE>
********************************************************************/	
Try
	RETURN THIS.GetItemNumber(ii_filaAct,'co_color')
CATCH( Throwable ex1 )
	Throw ex1
End try
end function

public function long of_getrecursocotnocierra ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_getRecursoCotNoCierra
<DESC> Description: Obtener valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Obtener el valor del campo </USAGE>
********************************************************************/	
Try
	RETURN THIS.GetItemNumber(ii_filaAct,'co_reccotnocierra')
CATCH( Throwable ex1 )
	Throw ex1
End try
end function

public function long of_getcolor_mpinicial ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_getColor_MpInicial
<DESC> Description: Obtener valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Obtener el valor del campo </USAGE>
********************************************************************/	
Try
	RETURN THIS.GetItemNumber(ii_filaAct,'color_MpInicial')
CATCH( Throwable ex1 )
	Throw ex1
End try
end function

public function long of_getcolor_mpmod ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_getColor_MpMod
<DESC> Description: Obtener valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Obtener el valor del campo </USAGE>
********************************************************************/	
Try
	RETURN THIS.GetItemNumber(ii_filaAct,'color_MpMod')
CATCH( Throwable ex1 )
	Throw ex1
End try
end function

public function string of_getorden_prev_fab ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_getOrden_Prev_Fab
<DESC> Description: Obtener valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Obtener el valor del campo </USAGE>
********************************************************************/	
Try
	RETURN THIS.GetItemString(ii_filaAct,'Orden_Prev_Fab')
CATCH( Throwable ex1 )
	Throw ex1
End try
end function

public function string of_getsol_pedido ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_getSol_Pedido
<DESC> Description: Obtener valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Obtener el valor del campo </USAGE>
********************************************************************/	
Try
	RETURN THIS.GetItemString(ii_filaAct,'Sol_Pedido')
CATCH( Throwable ex1 )
	Throw ex1
End try
end function

public function string of_getmpinicial ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_getMpInicial
<DESC> Description: Obtener valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Obtener el valor del campo </USAGE>
********************************************************************/	
Try
	RETURN THIS.GetItemString(ii_filaAct,'co_MpInicial')
CATCH( Throwable ex1 )
	Throw ex1
End try
end function

public function string of_getmpmod ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_getMpMod
<DESC> Description: Obtener valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Obtener el valor del campo </USAGE>
********************************************************************/	
Try
	RETURN THIS.GetItemString(ii_filaAct,'co_MpMod')
CATCH( Throwable ex1 )
	Throw ex1
End try
end function

public function string of_getdempinicial ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_getDeMpInicial
<DESC> Description: Obtener valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Obtener el valor del campo </USAGE>
********************************************************************/	
Try
	RETURN THIS.GetItemString(ii_filaAct,'de_MpInicial')
CATCH( Throwable ex1 )
	Throw ex1
End try
end function

public function string of_getdempmod ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_getDeMpMod
<DESC> Description: Obtener valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Obtener el valor del campo </USAGE>
********************************************************************/	
Try
	RETURN THIS.GetItemString(ii_filaAct,'de_MpMod')
CATCH( Throwable ex1 )
	Throw ex1
End try
end function

public function string of_getpeso_inicial ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_getPeso_Inicial
<DESC> Description: Obtener valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Obtener el valor del campo </USAGE>
********************************************************************/	
Try
	RETURN THIS.GetItemString(ii_filaAct,'peso_Inicial')
CATCH( Throwable ex1 )
	Throw ex1
End try
end function

public function string of_getpeso_mod ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_getPeso_Mod
<DESC> Description: Obtener valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Obtener el valor del campo </USAGE>
********************************************************************/	
Try
	RETURN THIS.GetItemString(ii_filaAct,'peso_Mod')
CATCH( Throwable ex1 )
	Throw ex1
End try
end function

public subroutine of_settalla (readonly long al_arg);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_setTalla
<DESC> Description: Setear valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Setear el valor del campo </USAGE>
********************************************************************/	
Try
	THIS.setitem(ii_filaAct,'co_talla',al_arg)	
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setcolor (readonly long al_arg);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_setColor
<DESC> Description: Obtener valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Obtener el valor del campo </USAGE>
********************************************************************/	
Try
	THIS.setitem(ii_filaAct,'co_color',al_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setreccotcierra (readonly long al_arg);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_setRecCotCierra
<DESC> Description: Setear el valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Setear el valor del campo </USAGE>
********************************************************************/	
Try
	THIS.setitem(ii_filaAct,'co_reccotcierra',al_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setreccotnocierra (readonly long al_arg);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_setRecCotNoCierra
<DESC> Description: Setear el valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Setear el valor del campo </USAGE>
********************************************************************/	
Try
	THIS.setitem(ii_filaAct,'co_reccotnocierra',al_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setcolor_mpinicial (readonly long al_arg);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_setColor_MpInicial
<DESC> Description: Setear la Referencia de la conversion a referencia - Material  </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualizar el Material </USAGE>
********************************************************************/	
Try
	THIS.setitem(ii_filaAct,'color_MpInicial',al_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setcolor_mpmod (readonly long al_arg);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_setColor_MpMod
<DESC> Description: Setear la Referencia de la conversion a referencia - Material  </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualizar el Material </USAGE>
********************************************************************/	
Try
	THIS.setitem(ii_filaAct,'color_MpMod',al_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setorden_prev_fab (readonly string as_arg);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_setOrden_Prev_Fab
<DESC> Description: Setear la Referencia de la conversion a referencia - Material  </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualizar el Material </USAGE>
********************************************************************/	
Try
	THIS.setitem(ii_filaAct,'Orden_Prev_Fab',as_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setsol_pedido (readonly string as_arg);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_setSol_Pedido
<DESC> Description: Setear la Referencia de la conversion a referencia - Material  </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualizar el Material </USAGE>
********************************************************************/	
Try
	THIS.setitem(ii_filaAct,'Sol_Pedido',as_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setmpinicial (readonly string as_arg);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_setMpInicial
<DESC> Description: Setear la Referencia de la conversion a referencia - Material  </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualizar el Material </USAGE>
********************************************************************/	
Try
	THIS.setitem(ii_filaAct,'co_MpInicial',as_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setmpmod (readonly string as_arg);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_setMpMod
<DESC> Description: Setear la Referencia de la conversion a referencia - Material  </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualizar el Material </USAGE>
********************************************************************/	
Try 
	THIS.setitem(ii_filaAct,'co_MpMod',as_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setdempinicial (readonly string as_arg);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_setDeMpInicial
<DESC> Description: Setear la Referencia de la conversion a referencia - Material  </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualizar el Material </USAGE>
********************************************************************/	
Try
	THIS.setitem(ii_filaAct,'de_MpInicial',as_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setdempmod (readonly string as_arg);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_setDeMpMod
<DESC> Description: Setear la Referencia de la conversion a referencia - Material  </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualizar el Material </USAGE>
********************************************************************/	
Try
	THIS.setitem(ii_filaAct,'de_MpMod',as_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setpeso_inicial (readonly string as_arg);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_setPeso_Inicial
<DESC> Description: Setear la Referencia de la conversion a referencia - Material  </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualizar el Material </USAGE>
********************************************************************/	
Try
	THIS.setitem(ii_filaAct,'peso_Inicial',as_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setpeso_mod (readonly string as_arg);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_setPeso_Mod
<DESC> Description: Setear la Referencia de la conversion a referencia - Material  </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualizar el Material </USAGE>
********************************************************************/	
Try
	THIS.setitem(ii_filaAct,'peso_Mod',as_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setfechacreacion (readonly datetime adt_arg);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_setFechaCreacion
<DESC> Description: Setear la fecha de crecacion o modificacion  </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualzar el campo  </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	THIS.setitem(ii_filaAct,'fe_creacion',adt_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setdatosupdate ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_SetDatosInserccion
<DESC> Description: Setear los datos a insertar en la entidad </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para realziar el set de datos y no uno a uno</USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	of_setFechaCreacion(DateTime(Date(Today()),Time(Now())))
	of_setUsuario(gs_usuario)
	of_setInstancia(gs_instancia)
CATCH( Throwable ex1)
	Throw ex1
End try
end subroutine

public subroutine of_validarregexiste (readonly long al_referencia, readonly long al_talla, readonly long al_color, readonly long al_cs_orden);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_ValidarRegExiste 
<DESC> Description: validar si es un nuevo registro o ya existe </DESC> 
<RETURN> None </RETURN>
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> insertar un nuevo regstro o actualizar </USAGE>
PK: ref - talla - color 
********************************************************************/	
integer		li_NumFilas, li_filas
Exception 	ex
uo_dsbase	lds
ex = create Exception
Try
	lds = create uo_dsbase
	lds.dataobject=THIS.dataobject
	lds.setTransobject(n_cst_application.itr_appl)	
	li_NumFilas = lds.of_Retrieve(al_referencia,al_talla,al_color,al_cs_orden)
	IF li_NumFilas > 0 THEN //YA EXISTE, SE DEBE ACTUALIZAR 
//		li_filas = THIS.rowCount()
//		lds.RowsCopy(1,lds.RowCount(), Primary!, THIS, li_filas +1 , Primary!)		
//		THIS.of_setFilaActual(li_filas +1 )
		THIS.of_setOperacion('UPDATE')
	ELSE 
		of_insertarRegistro()//REGISTRO NUEVO 
		THIS.of_setOperacion('INSERT')
	END IF 
	DESTROY(lds)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public function long of_getconsecutivoordenessis ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_getConsecutivoOrdenesSIS
<DESC> Description: Obtener valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Obtener el valor del campo </USAGE>
********************************************************************/	
Try
	RETURN THIS.GetItemNumber(ii_filaAct,'co_oden')
CATCH( Throwable ex1 )
	Throw ex1
End try
end function

public subroutine of_setconsecutivoordenessis (readonly long al_arg);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_setConsecutivoOrdenesSIS
<DESC> Description: Setear la Referencia de la conversion a referencia - Material  </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualizar el Material </USAGE>
********************************************************************/	
Try
	THIS.setitem(ii_filaAct,'co_oden',al_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setdatosinserccion (readonly long al_ref, readonly long al_talla, readonly long al_color, readonly string as_orden_prev_fab, readonly string as_sol_pedido, readonly long al_reccotcierra, readonly long al_reccotnocierra, readonly string as_mpinicial, readonly string as_mpmod, readonly string as_de_mpinicial, readonly string as_de_mpmod, readonly long al_color_mpinicial, readonly long al_color_mpmod, readonly string as_peso_inicial, readonly string as_peso_mod, readonly long al_consecutivoordensis);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_SetDatosInserccion
<DESC> Description: Setear los datos a insertar en la entidad </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para realziar el set de datos y no uno a uno</USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	of_SetReferencia(al_ref)
	of_SetTalla(al_talla)
	of_SetColor(al_color)
	of_SetOrden_Prev_Fab(as_orden_prev_fab)
	of_SetSol_Pedido(as_sol_pedido)
	of_SetRecCotCierra(al_reccotcierra)
	of_SetRecCotNoCierra(al_reccotnocierra)
	of_SetMpInicial(as_mpinicial)
	of_SetMpMod(as_mpmod)	
	of_SetDeMpInicial(as_de_mpinicial)
	of_SetDeMpMod(as_de_mpmod)	
	of_SetColor_MpInicial(al_color_mpinicial)
	of_SetColor_MpMod(al_color_mpmod)
	of_SetPeso_Inicial(as_peso_inicial)
	of_SetPeso_Mod(as_peso_mod)
	of_SetConsecutivoOrdenesSIS(al_consecutivoOrdenSIS)
	of_SetDatosUpdate()	//Datos auditoria 
CATCH( Throwable ex1)
	Throw ex1
End try
end subroutine

public subroutine of_setdatosmodificacion (readonly long al_ref, readonly long al_talla, readonly long al_color, readonly string as_orden_prev_fab, readonly string as_sol_pedido, readonly long al_reccotcierra, readonly long al_reccotnocierra, readonly string as_mpinicial, readonly string as_mpmod, readonly string as_de_mpinicial, readonly string as_de_mpmod, readonly long al_color_mpinicial, readonly long al_color_mpmod, readonly string as_peso_inicial, readonly string as_peso_mod, readonly long al_consecutivoordensis);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_SetDatosModificacion 
<DESC> Description: Setear los datos a Modificar en la entidad </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para realizar el set de datos y no uno a uno</USAGE>
********************************************************************/
Integer		li_NumFilas
uo_dsbase	lds
Exception	ex
ex = create Exception
Try
	lds = create uo_dsbase
	lds.dataobject=THIS.dataobject
	lds.setTransobject(n_cst_application.itr_appl)	
	li_NumFilas = lds.of_Retrieve(al_ref,al_talla,al_color,al_consecutivoOrdenSIS,'','',0,0,'','',0,0) //Solucion ERROR AL IGUALAR PESOS EN FMP 
	
	IF li_NumFilas < 0 THEN 
		ex.setmessage("Error Modificacion Rep_Fmp.") 
		Throw ex
	END IF 

	IF NOT(IsNull(al_reccotcierra)) THEN 
		lds.setitem(li_NumFilas,'co_reccotcierra',al_reccotcierra)
	END IF 
	
	IF NOT(IsNull(al_reccotnocierra)) THEN 
		lds.setitem(li_NumFilas,'co_reccotnocierra',al_reccotnocierra)	
	END IF 
	
	IF NOT(IsNull(as_mpmod)) THEN 
		lds.setitem(li_NumFilas,'co_MpMod',as_mpmod)
	END IF 
	
	IF NOT(IsNull(as_de_mpmod)) THEN 
		lds.setitem(li_NumFilas,'de_MpMod',as_de_mpmod)
	END IF 
	
	IF NOT(IsNull(al_color_mpmod)) THEN 
		lds.setitem(li_NumFilas,'color_MpMod',al_color_mpmod)
	END IF 
	
	IF NOT(IsNull(as_peso_mod)) THEN 
		lds.setitem(li_NumFilas,'peso_Mod',as_peso_mod)
	END IF
	
	//Datos auditoria
	lds.setitem(li_NumFilas,'fe_creacion',(DateTime(Date(Today()),Time(Now()))))
	lds.setitem(li_NumFilas,'instancia',gs_usuario)
	lds.setitem(li_NumFilas,'usuario',gs_instancia)		
	
	IF lds.of_Update( ) < 0 THEN 
		ex.setmessage("Error al guardar los cambios realizados en Rep_Fmp.") 
		Throw ex
	END IF 

CATCH( Throwable ex1)
	Throw ex1
End try
end subroutine

public subroutine of_validarnulos (ref long al_referencia, ref long al_talla, ref long al_color, ref long al_cs_orden, ref string as_orden_prev_fab, ref string as_sol_pedido, ref long al_reccotcierra, ref long al_reccotnocierra, ref string as_mpinicial, ref string as_mpmod, ref long al_color_mpinicial, ref long al_color_mpmod);/********************************************************************
SA55169 - Ceiba/jjmonsal - 17-11-2016 FunctionName :of_ValidarNulos 
<DESC> Description: validar si es un nuevo registro o ya existe por PK </DESC> 
<RETURN> None </RETURN>
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> insertar un nuevo regstro o actualizar </USAGE>
********************************************************************/	
Exception 	ex
ex = create Exception
Try
	IF IsNull(al_referencia) THEN 
		al_referencia = 0
	END IF
	
	IF IsNull(al_talla) THEN 
		al_talla = 0
	END IF 
	
	IF IsNull(al_color) THEN 
		al_color = 0
	END IF
	
	IF IsNull(al_cs_orden) THEN 
		al_cs_orden = 0
	END IF 
	
	IF IsNull(as_orden_prev_fab) THEN 
		as_orden_prev_fab = ""
	END IF 
	
	IF IsNull(as_sol_pedido) THEN 
		as_sol_pedido = ""
	END IF 
	
	IF IsNull(al_reccotcierra) THEN 
		al_reccotcierra = 0
	END IF
	
	IF IsNull(al_reccotnocierra) THEN 
		al_reccotnocierra = 0
	END IF 
	
	IF IsNull(as_mpinicial) THEN 
		as_mpinicial = ""
	END IF 
	
	IF IsNull(as_mpmod) THEN 
		as_mpmod = ""
	END IF 
	
	IF IsNull(al_color_mpinicial) THEN 
		al_color_mpinicial = 0
	END IF 

	IF IsNull(al_color_mpmod) THEN 
		al_color_mpmod = 0
	END IF 
	
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_validarregexiste (long al_referencia, long al_talla, long al_color, long al_cs_orden, string as_orden_prev_fab, string as_sol_pedido, long al_reccotcierra, long al_reccotnocierra, string as_mpinicial, string as_mpmod, long al_color_mpinicial, long al_color_mpmod);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_ValidarRegExiste 
<DESC> Description: validar si es un nuevo registro o ya existe por PK </DESC> 
<RETURN> None </RETURN>
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> insertar un nuevo regstro o actualizar </USAGE>
********************************************************************/	
integer		li_NumFilas, li_filas
Exception 	ex
uo_dsbase	lds
ex = create Exception
Try
	lds = create uo_dsbase
	lds.dataobject=THIS.dataobject
	lds.setTransobject(n_cst_application.itr_appl)	
	THIS.of_ValidarNulos(al_referencia,al_talla,al_color,al_cs_orden,as_orden_prev_fab,as_sol_pedido,&
											al_recCotcierra,al_recCotNocierra,as_mpinicial,as_mpmod,al_color_mpinicial,&
											al_color_mpmod)
	li_NumFilas = lds.of_Retrieve(al_referencia,al_talla,al_color,al_cs_orden,as_orden_prev_fab,as_sol_pedido,&
											al_recCotcierra,al_recCotNocierra,as_mpinicial,as_mpmod,al_color_mpinicial,&
											al_color_mpmod)
	IF li_NumFilas > 0 THEN //YA EXISTE, SE DEBE ACTUALIZAR 
		THIS.of_setOperacion('UPDATE')
	ELSE 
		of_insertarRegistro()//REGISTRO NUEVO 
		THIS.of_setOperacion('INSERT')
	END IF 
	DESTROY(lds)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

on n_cst_tr_modfmp.create
call super::create
end on

on n_cst_tr_modfmp.destroy
call super::destroy
end on

event constructor;call super::constructor;ii_filaAct = 0 
end event

event sqlpreview;call super::sqlpreview;//String ls
//ls = sqlSyntax

end event

