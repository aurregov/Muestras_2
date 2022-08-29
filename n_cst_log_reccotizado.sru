HA$PBExportHeader$n_cst_log_reccotizado.sru
forward
global type n_cst_log_reccotizado from uo_dsbase
end type
end forward

global type n_cst_log_reccotizado from uo_dsbase
end type
global n_cst_log_reccotizado n_cst_log_reccotizado

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
public subroutine of_validarregexiste (readonly integer ai_fabrica, readonly integer ai_linea, readonly long al_muestra)
public subroutine of_setfabrica (readonly integer ai_arg)
public subroutine of_setlinea (readonly integer ai_arg)
public subroutine of_settalla (readonly integer ai_arg)
public subroutine of_setmuestrario (readonly integer ai_arg)
public subroutine of_setmuestra (readonly long al_arg)
public subroutine of_setreferencia (readonly long al_arg)
public subroutine of_setusuario (readonly string as_arg)
public subroutine of_setfecha (readonly datetime adt_arg)
public subroutine of_setinstancia (readonly string as_arg)
public subroutine of_setentradamodificada (readonly string as_arg)
public function String of_getentradamodificada ()
public function string of_getinstancia ()
public function string of_getusuario ()
public function integer of_getfabrica ()
public function integer of_getlinea ()
public subroutine of_setreccotcierraold (readonly long al_arg)
public subroutine of_setreccotnocierraold (readonly long al_arg)
public subroutine of_setreccotcierranew (readonly long al_arg)
public subroutine of_setreccotnocierranew (readonly long al_arg)
public subroutine of_setoperacion (readonly string as_arg)
public function string of_getoperacion ()
public subroutine of_setdatosupdate (readonly string as_entrada)
public subroutine of_setdatosinserccion (readonly integer ai_fab, readonly integer ai_linea, readonly long al_muestra, readonly integer ai_talla, readonly long al_ref, readonly integer ai_muestrario, readonly string as_entrada)
public subroutine of_validarregexiste (readonly integer ai_fabrica, readonly integer ai_linea, readonly long al_muestra, readonly long al_muestrario)
public function long of_cargarmuestrariofichamatprima (readonly integer ai_fabrica, readonly integer ai_linea, readonly long al_muestra, readonly long al_talla, readonly long al_recurso)
end prototypes

public subroutine of_setnombredataobject (readonly string as_nombredataobject);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_setNombreDataObject 
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
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public function string of_getnombredataobject ();/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName : of_getNombreDataObject 
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
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_setNombreDataObject 
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
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_getNombreDataObject 
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
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_setNombreDataObject 
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

public subroutine of_validarregexiste (readonly integer ai_fabrica, readonly integer ai_linea, readonly long al_muestra);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_ValidarRegExiste 
<DESC> Description: validar si es un nuevo registro o ya existe </DESC> 
<RETURN> None </RETURN>
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> insertar un nuevo regstro o actualizar </USAGE>
PK: fabrica - linea - muestra 
********************************************************************/	
integer		li_NumFilas
Exception 	ex
ex = create Exception
Try
	li_NumFilas = THIS.of_Retrieve(ai_fabrica,ai_linea,al_muestra)
	IF li_NumFilas > 0 THEN //YA EXISTE, SE DEBE ACTUALIZAR 
		THIS.of_setFilaActual(li_NumFilas)
		THIS.of_setOperacion('UPDATE')
	ELSE 
		of_insertarRegistro()//REGISTRO NUEVO 
		THIS.of_setOperacion('INSERT')
	END IF 
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setfabrica (readonly integer ai_arg);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_setFabrica
<DESC> Description: Setear la fabrica </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualizar el campo fabrica  </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	THIS.setitem(ii_filaAct,'co_fabrica',ai_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setlinea (readonly integer ai_arg);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_setLinea
<DESC> Description: Setear la linea </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualizar la linea </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	THIS.setitem(ii_filaAct,'co_linea',ai_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_settalla (readonly integer ai_arg);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_setTalla
<DESC> Description: Setear la fabrica </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualziar la fila </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	THIS.setitem(ii_filaAct,'co_talla',ai_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setmuestrario (readonly integer ai_arg);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_setMuestrario
<DESC> Description: Setear Muestrario </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualziar el Muestrario </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	THIS.setitem(ii_filaAct,'co_muestrario',ai_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setmuestra (readonly long al_arg);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_setMuestra
<DESC> Description: Setear la Muestra </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualizar la Muestra </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	THIS.setitem(ii_filaAct,'co_muestra',al_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setreferencia (readonly long al_arg);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_setReferencia - Material 
<DESC> Description: Setear la Referencia de la conversion a referencia - Material  </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualizar el Material </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	THIS.setitem(ii_filaAct,'co_referencia_ref',al_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setusuario (readonly string as_arg);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_setUsuario
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

public subroutine of_setfecha (readonly datetime adt_arg);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_setFecha
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

public subroutine of_setinstancia (readonly string as_arg);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_setInstancia
<DESC> Description: Setear la instancia  </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualizar el Campo de Instancia </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	THIS.setitem(ii_filaAct,'instancia',as_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setentradamodificada (readonly string as_arg);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_setEntradaModificada
<DESC> Description: Setear la fabrica </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualizar el campo fabrica  </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	THIS.setitem(ii_filaAct,'entrada_modificada',as_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public function String of_getentradamodificada ();/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_getEntradaModificada
<DESC> Description: Obtener valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Obtener el valor del campo </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	RETURN THIS.GetItemString(ii_filaAct,'entrada_modificada')
CATCH( Throwable ex1 )
	Throw ex1
End try
end function

public function string of_getinstancia ();/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_getinstancia
<DESC> Description: Obtener valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Obtener el valor del campo </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	RETURN THIS.GetItemString(ii_filaAct,'instancia')
CATCH( Throwable ex1 )
	Throw ex1
End try
end function

public function string of_getusuario ();/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_getUsuario
<DESC> Description: Obtener valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Obtener el valor del campo </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	RETURN THIS.GetItemString(ii_filaAct,'usuario')
CATCH( Throwable ex1 )
	Throw ex1
End try
end function

public function integer of_getfabrica ();/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_getFabrica
<DESC> Description: Obtener valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Obtener el valor del campo </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	RETURN THIS.GetItemNumber(ii_filaAct,'co_fabrica')
CATCH( Throwable ex1 )
	Throw ex1
End try
end function

public function integer of_getlinea ();/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_getLinea
<DESC> Description: Obtener valor del campo </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para Obtener el valor del campo </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	RETURN THIS.GetItemNumber(ii_filaAct,'co_linea')
CATCH( Throwable ex1 )
	Throw ex1
End try
end function

public subroutine of_setreccotcierraold (readonly long al_arg);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_setRecCotCierraOld
<DESC> Description: Setear la Recurso </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualizar Recurso </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	THIS.setitem(ii_filaAct,'co_reccotcierraOld',al_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setreccotnocierraold (readonly long al_arg);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_setRecCotNoCierraOld
<DESC> Description: Setear Recurso </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualizar recurso </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	THIS.setitem(ii_filaAct,'co_reccotnocierraOld',al_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setreccotcierranew (readonly long al_arg);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_setRecCotCierraNew
<DESC> Description: Setear la Recurso </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualizar Recurso </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	THIS.setitem(ii_filaAct,'co_reccotcierraNew',al_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setreccotnocierranew (readonly long al_arg);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_setRecCotNoCierraNew
<DESC> Description: Setear la Recurso </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para actualizar Recurso </USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	THIS.setitem(ii_filaAct,'co_reccotnocierraNew',al_arg)
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public subroutine of_setoperacion (readonly string as_arg);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_setOperacion
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
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName : of_getOperacion
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

public subroutine of_setdatosupdate (readonly string as_entrada);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_SetDatosInserccion
<DESC> Description: Setear los datos a insertar en la entidad </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para realziar el set de datos y no uno a uno</USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	of_setFecha(DateTime(Date(Today()),Time(Now())))
	of_setUsuario(gs_usuario)
	of_setEntradaModificada(as_entrada)
	of_setInstancia(gs_instancia)
CATCH( Throwable ex1)
	Throw ex1
End try
end subroutine

public subroutine of_setdatosinserccion (readonly integer ai_fab, readonly integer ai_linea, readonly long al_muestra, readonly integer ai_talla, readonly long al_ref, readonly integer ai_muestrario, readonly string as_entrada);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName :of_SetDatosInserccion
<DESC> Description: Setear los datos a insertar en la entidad </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para realziar el set de datos y no uno a uno</USAGE>
********************************************************************/	
Exception ex
ex = create Exception
Try
	of_setFabrica(ai_fab)
	of_setLinea(ai_linea)
	of_setMuestra(al_muestra)
	of_setTalla(ai_talla)
	of_setReferencia(al_ref)
	of_setMuestrario(ai_muestrario)
	of_SetDatosUpdate(as_entrada)
CATCH( Throwable ex1)
	Throw ex1
End try
end subroutine

public subroutine of_validarregexiste (readonly integer ai_fabrica, readonly integer ai_linea, readonly long al_muestra, readonly long al_muestrario);/********************************************************************
SA52045 - Ceiba/jjmonsal - 16-12-2015 FunctionName :of_ValidarRegExiste 
<DESC> Description: validar si es un nuevo registro o ya existe </DESC> 
<RETURN> None </RETURN>
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> insertar un nuevo regstro o actualizar </USAGE>
PK: fabrica - linea - muestra - Se adiciona el Muestrario 
La adicion del muestrario es debido a que se debe saber el muestrario que se altero.
Se comenta en el DS: d_datos_correo
La linea: AND ex.co_muestrario = 	(SELECT MAX(en.co_muestrario) 
********************************************************************/	
integer		li_NumFilas
Exception 	ex
ex = create Exception
Try
	li_NumFilas = THIS.of_Retrieve(ai_fabrica,ai_linea,al_muestra,al_muestrario)
	IF li_NumFilas > 0 THEN //YA EXISTE, SE DEBE ACTUALIZAR 
		THIS.of_setFilaActual(li_NumFilas)
		THIS.of_setOperacion('UPDATE')
	ELSE 
		of_insertarRegistro()//REGISTRO NUEVO 
		THIS.of_setOperacion('INSERT')
	END IF 
CATCH( Throwable ex1 )
	Throw ex1
End try
end subroutine

public function long of_cargarmuestrariofichamatprima (readonly integer ai_fabrica, readonly integer ai_linea, readonly long al_muestra, readonly long al_talla, readonly long al_recurso);/********************************************************************
SA52045 - Ceiba/jjmonsal - 22-12-2015 FunctionName :of_cargarMuestrarioFichaMatPrima 
<DESC> Description: Recuperar de la ficha de materia prima si existe un muestrario o NO </DESC> 
<RETURN> None </RETURN>
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Se debe invocar para cargar el muestrario correcto de la Ficha de Materia Prima.
En caso de que el recurso tenga ficha de materia prima se retorna el muestrario 
Se adiciona DW: d_gr_sq_h_fmp_muestras_muestrarios para realizar dicha validacion 
********************************************************************/	
LONG			li_NumFilas
Exception 	ex
Uo_DsBase	lds_h_fmp_muestrasMuestrario

ex 									= CREATE Exception
lds_h_fmp_muestrasMuestrario	= CREATE Uo_DsBase

TRY
	lds_h_fmp_muestrasMuestrario.dataobject = 'd_gr_sq_h_fmp_muestras_muestrarios'
	lds_h_fmp_muestrasMuestrario.Settransobject(n_cst_application.itr_appl)
	li_NumFilas = lds_h_fmp_muestrasMuestrario.of_Retrieve(ai_fabrica,ai_linea,al_muestra,al_talla,al_recurso)
	IF li_NumFilas > 0 THEN //EXISTE, Tiene Ficha
		RETURN lds_h_fmp_muestrasMuestrario.getItemNumber(1,'co_muestrario')
	ELSE 
		RETURN 0
	END IF 
CATCH( Throwable ex1 )
	Throw ex1
End try
end function

on n_cst_log_reccotizado.create
call super::create
end on

on n_cst_log_reccotizado.destroy
call super::destroy
end on

event constructor;call super::constructor;ii_filaAct = 0 
end event

