HA$PBExportHeader$n_cst_seg_muestras.sru
$PBExportComments$/***********************************************************~r~nSA53453 - Ceiba/jjmonsal - 29-03-2016~r~nComentario: RESTRICCION DE USUARIOS PARA FICHAS DE MATERIA PRIMA~r~n***********************************************************/
forward
global type n_cst_seg_muestras from uo_dsbase
end type
end forward

global type n_cst_seg_muestras from uo_dsbase
end type
global n_cst_seg_muestras n_cst_seg_muestras

type variables
LONG					IL_COD_PROGRAMA					//Codigo del programa
LONG					IL_OPCIONGUARDAR					//Codigo de Opcion Guardar
LONG					IL_OPCIONGUARDARCOMO				//Codigo de Opcion Guardar Como
LONG					IL_OPCIONGENERICA					//Codigo para cualquier programa u opcion 

n_tr_application	itr_seguridad						//Instancia de la transacci$$HEX1$$f300$$ENDHEX$$n seguridad
Str_param			istr_param							//Estrutura de Parametros para array de programas(a_long3[]) fabricas (a_long1[]) lineas (a_long2[]) usuarios (a_String1[])
end variables

forward prototypes
public subroutine of_setnombredataobject (readonly string as_dataobject)
public function integer of_getcodaplicacion ()
public function integer of_getcodprograma ()
public function uo_dsbase of_getds ()
public subroutine of_recinfpermisosxopcion ()
public function boolean of_configopcionguardar ()
public subroutine of_cargarconstantes ()
public subroutine of_setfabrica (readonly long al_fab)
public subroutine of_setlinea (readonly long al_linea)
public function boolean of_configopcionguardarcomo ()
public subroutine of_setnombredataobject (readonly string as_dataobject, readonly transaction atr_trans)
public function n_tr_application of_gettransaccionseg ()
public subroutine of_cargartransaccionalseg ()
public subroutine of_destruirtransaccionalseg ()
public subroutine of_setprogramamatprima ()
public subroutine of_setarrayusers ()
public subroutine of_setopciongenerica (readonly long al_dato)
public function long of_getopciongenerica ()
public subroutine of_recinfpermisosparavalidaringreso ()
public subroutine of_setprogramagenerico (readonly long al_dato)
public function boolean of_tieneparameaccesoalprograma ()
end prototypes

public subroutine of_setnombredataobject (readonly string as_dataobject);/********************************************************************
SA54453 - Ceiba/jjmonsal - 29-03-2016 FunctionName: of_setnombredataobject
<DESC> Description setear Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> setear el dato requerido </USAGE>
********************************************************************/
try
	THIS.DataObject = as_DataObject
	THIS.Settransobject( n_cst_application.itr_appl )//Transaccional DW objeto 
Catch ( Throwable ex)
	Throw (ex)
End try
end subroutine

public function integer of_getcodaplicacion ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 29-03-2016 FunctionName: of_cargarCodAplicacion
<DESC> Description RETORNAR Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> return  el dato requerido </USAGE>
********************************************************************/
try
	return n_cst_application.ii_application
Catch ( Throwable ex)
	Throw (ex)
End try
end function

public function integer of_getcodprograma ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 29-03-2016 FunctionName: of_getCodPrograma
<DESC> Description RETORNAR Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> return  el dato requerido </USAGE>
********************************************************************/
try
	return IL_COD_PROGRAMA
Catch ( Throwable ex)
	Throw (ex)
End try
end function

public function uo_dsbase of_getds ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 29-03-2016 FunctionName: of_getDS
<DESC> Description setear Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> setear el dato requerido </USAGE>
********************************************************************/
try
	return THIS
Catch ( Throwable ex)
	Throw (ex)
End try
end function

public subroutine of_recinfpermisosxopcion ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 31-03-2016 - FunctionName: of_recInfPermisosxopcion
<DESC> Description: Cargar la parametrizacion de los permisos segun el maestro m_param_perEspxApli</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Carga permisos segun opcion </USAGE>
********************************************************************/
TRY
	THIS.of_retrieve(n_cst_application.ii_application,istr_param.a_long3[],istr_param.a_long1[],istr_param.a_long2[],0,istr_param.a_string1[])
CATCH( Throwable ex )
	Rollback;
	ex.setmessage("Error Recuperando permisos x opci$$HEX1$$f300$$ENDHEX$$n.")
	Throw ex
END TRY
end subroutine

public function boolean of_configopcionguardar ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 29-03-2016 FunctionName: of_configOpcionGuardar
<DESC> Description Indicar si se permite utilizar o No la opcion</DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> habilitar deshabilitar opciones </USAGE>
********************************************************************/
Long		ll_found
String	ls_found
try
	ls_found = "co_opcion = "+String(IL_OPCIONGUARDAR)+""
	ll_found = THIS.Find(ls_found,1, THIS.RowCount())
	IF ll_found >=1 THEN 
		Return TRUE
	ELSE 
		RETURN FALSE
	END IF 
Catch ( Throwable ex)
	Throw (ex)
End try
end function

public subroutine of_cargarconstantes ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 29-03-2016 FunctionName: of_CargarConstantes
<DESC> Description cargar constantes </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE>  cargar constantes  </USAGE>
********************************************************************/
Long			ll_res
n_cst_comun lo_comun
try	
	lo_comun.of_valorconstante( "OPCION_GUARDAR", n_cst_application.itr_appl)
	IL_OPCIONGUARDAR=Integer(lo_comun.of_getDecimal(1))
	
	lo_comun.of_valorconstante( "OPCION_GUARDARCOMO", n_cst_application.itr_appl)
	IL_OPCIONGUARDARCOMO=Integer(lo_comun.of_getDecimal(1))

Catch ( Throwable ex)
	Throw (ex)
End try
end subroutine

public subroutine of_setfabrica (readonly long al_fab);/********************************************************************
SA54453 - Ceiba/jjmonsal - 29-03-2016 FunctionName: of_setFabrica
<DESC> Description setear Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> setear el dato requerido </USAGE>
********************************************************************/
try
	istr_param.a_long1[1] = al_fab
Catch ( Throwable ex)
	Throw (ex)
End try
end subroutine

public subroutine of_setlinea (readonly long al_linea);/********************************************************************
SA54453 - Ceiba/jjmonsal - 29-03-2016 FunctionName: of_setLinea
<DESC> Description setear Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> setear el dato requerido </USAGE>
********************************************************************/
try
	istr_param.a_long2[1] = al_linea
Catch ( Throwable ex)
	Throw (ex)
End try
end subroutine

public function boolean of_configopcionguardarcomo ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 29-03-2016 FunctionName: of_configOpcionGuardarComo
<DESC> Description Indicar si se permite utilizar o No la opcion</DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> habilitar deshabilitar opciones </USAGE>
********************************************************************/
Long		ll_found
String	ls_found
try
	ls_found = "co_opcion = "+String(IL_OPCIONGUARDARCOMO)+""
	ll_found = THIS.Find(ls_found,1, THIS.RowCount())
	IF ll_found >=1 THEN 
		Return TRUE
	ELSE 
		RETURN FALSE
	END IF 
Catch ( Throwable ex)
	Throw (ex)
End try
end function

public subroutine of_setnombredataobject (readonly string as_dataobject, readonly transaction atr_trans);/********************************************************************
SA54453 - Ceiba/jjmonsal - 29-03-2016 FunctionName: of_setnombredataobject
<DESC> Description setear Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> setear el dato requerido </USAGE>
********************************************************************/
try
	THIS.DataObject = as_DataObject
	THIS.Settransobject(atr_trans)//Transaccional DW objeto 
Catch ( Throwable ex)
	Throw (ex)
End try
end subroutine

public function n_tr_application of_gettransaccionseg ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 29-03-2016 FunctionName: of_getTransaccionSeg
<DESC> Description getter Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> getter el dato requerido </USAGE>
********************************************************************/
try
	Return Itr_seguridad
Catch ( Throwable ex)
	Throw (ex)
End try
end function

public subroutine of_cargartransaccionalseg ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 29-03-2016 FunctionName: of_CargarTransaccionalSeg
<DESC> Description: Cargar transaccional de la BD Seguridad  </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Obtener conexion a la seguridad  </USAGE>
********************************************************************/
try
	//Crear una instancia de la transacci$$HEX1$$f300$$ENDHEX$$n seguridad
	itr_seguridad = Create n_tr_application 
	itr_seguridad.of_ConnectDB( n_cst_application.itr_appl.dbms , &
											"seguridad", &
											n_cst_application.itr_appl.UserId , &
											n_cst_application.itr_appl.dbpass, &
											n_cst_application.itr_appl.ServerName, &
											n_cst_application.itr_appl.lock)
CATCH(Exception ex)
	Throw ex
CATCH( Throwable th)
	Throw (th)
End try

end subroutine

public subroutine of_destruirtransaccionalseg ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 29-03-2016 FunctionName: of_DestruirTransaccionalSeg
<DESC> Description: destruir transaccional de la BD Seguridad  </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> desconectar conexion a la seguridad  </USAGE>
********************************************************************/
try
	IF IsValid(itr_seguridad) THEN 
		Disconnect using itr_seguridad;
		Destroy itr_seguridad
	END IF 
CATCH(Exception ex)
	Throw ex
CATCH( Throwable th)
	Throw (th)
End try

end subroutine

public subroutine of_setprogramamatprima ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: of_setProgramaMatPrima
<DESC> Description cargar constantes </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE>  cargar constantes  </USAGE>
********************************************************************/
n_cst_comun lo_comun
try	
	lo_comun.of_valorconstante( "OPCION_FICHA_MATPRIMA", n_cst_application.itr_appl)
	istr_param.a_long3[1] =LONG(lo_comun.of_getDecimal(1))
Catch ( Throwable ex)
	Throw (ex)
End try
end subroutine

public subroutine of_setarrayusers ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: of_setArrayUsers
<DESC> Description Cargar users al array </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE>  Cargar users al array </USAGE>
********************************************************************/
try	
	istr_param.a_string1[1] =String(gs_usuario)
Catch ( Throwable ex)
	Throw (ex)
End try
end subroutine

public subroutine of_setopciongenerica (readonly long al_dato);/********************************************************************
SA54453 - Ceiba/jjmonsal - 22-06-2016 FunctionName: of_setOpcionGenerica
<DESC> Description setear Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> setear el dato requerido </USAGE>
********************************************************************/
try
	IL_OPCIONGENERICA = al_dato
Catch ( Throwable ex)
	Throw (ex)
End try
end subroutine

public function long of_getopciongenerica ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 22-06-2016 FunctionName: of_getOpcionGenerica
<DESC> Description retornar Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> setear el dato requerido </USAGE>
********************************************************************/
try
	return	IL_OPCIONGENERICA
Catch ( Throwable ex)
	Throw (ex)
End try
end function

public subroutine of_recinfpermisosparavalidaringreso ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 31-03-2016 - FunctionName: of_recInfPermisosParaValidarIngreso
<DESC> Description: Cargar la parametrizacion de los permisos segun el maestro m_param_perEspxApli</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Carga permisos segun opcion </USAGE>
********************************************************************/
TRY
	THIS.of_retrieve(n_cst_application.ii_application,istr_param.a_long3[],istr_param.a_string1[])
CATCH( Throwable ex )
	Rollback;
	ex.setmessage("Error Recuperando permisos x opci$$HEX1$$f300$$ENDHEX$$n.")
	Throw ex
END TRY
end subroutine

public subroutine of_setprogramagenerico (readonly long al_dato);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: of_setProgramaGenerico
<DESC> Description cargar constantes </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE>  cargar constantes  </USAGE>
********************************************************************/
try	
	istr_param.a_long3[1] =al_dato
Catch ( Throwable ex)
	Throw (ex)
End try
end subroutine

public function boolean of_tieneparameaccesoalprograma ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 29-03-2016 FunctionName: of_tieneParameAccesoAlPrograma
<DESC> Description Indicar si se permite utilizar o No el programa</DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> habilitar deshabilitar opciones </USAGE>
********************************************************************/
Long		ll_found
String	ls_found
try 
	ls_found = "co_programa = "+String(IL_OPCIONGENERICA)+""
	ll_found = THIS.Find(ls_found,1, THIS.RowCount())
	IF ll_found >=1 THEN 
		Return TRUE
	ELSE 
		RETURN FALSE
	END IF 
Catch ( Throwable ex)
	Throw (ex)
End try
end function

on n_cst_seg_muestras.create
call super::create
end on

on n_cst_seg_muestras.destroy
call super::destroy
end on

event constructor;call super::constructor;
of_CargarConstantes()

end event

