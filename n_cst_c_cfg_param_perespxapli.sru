HA$PBExportHeader$n_cst_c_cfg_param_perespxapli.sru
$PBExportComments$/***********************************************************~r~nSA53453 - Ceiba/jjmonsal - 05-05-2016~r~nComentario: Mantenimiento Restriccion de Usuarios para Fichas de Materia Prima~r~n***********************************************************/
forward
global type n_cst_c_cfg_param_perespxapli from nonvisualobject
end type
end forward

global type n_cst_c_cfg_param_perespxapli from nonvisualobject
end type
global n_cst_c_cfg_param_perespxapli n_cst_c_cfg_param_perespxapli

type variables
Private: 
str_param			istr_param
Boolean				ib_VariosProg, ib_VariosUser, ib_VariasFab, ib_VariasLineas, ib_VariasOpc
Public: 
CONSTANT STRING	SI = 'S'
CONSTANT STRING	FAB = 'Fab'
CONSTANT STRING	LINEA = 'Linea'
CONSTANT STRING	PROGRAMA = 'Prog'
CONSTANT STRING	OPCION = 'Opcion'
CONSTANT STRING	USUARIO = 'Usuario'
end variables

forward prototypes
public function str_param of_getistr_param ()
public function boolean of_getvariasfab ()
public function boolean of_getvariaslineas ()
public subroutine of_setfab (readonly long al_arg)
public subroutine of_setistr_param (readonly str_param astr_param)
public subroutine of_setlinea (readonly long al_arg)
public subroutine of_setvariasfab (readonly boolean ab_variasfab)
public subroutine of_setvariaslineas (readonly boolean ab_variaslineas)
public subroutine of_validarcamposfiltro (readonly long al_fab, readonly long al_linea, readonly long al_programa, readonly string as_user)
public function boolean of_getvariosprog ()
public function boolean of_getvariosusers ()
public subroutine of_setvariosprog (readonly boolean ab_variosprog)
public subroutine of_setvariosusers (readonly boolean ab_variosusers)
public subroutine of_setprog (readonly long al_arg)
public subroutine of_setuser (readonly string as_arg)
public subroutine of_itemchanged (readonly long row, readonly dwobject dwo, readonly string data)
public subroutine of_guardarmaestro ()
public function any of_getupperboundstruct (readonly string as_indicador)
public subroutine of_setds_struct (readonly string as_indicador, ref uo_dsbase ads, readonly long al_fila, readonly long al_filaant)
public subroutine of_setds_struct (readonly string as_indicador, ref uo_dsbase ads, readonly long al_fila, readonly long al_filaant, readonly long al_filadato)
public function boolean of_getvariasopc ()
public subroutine of_setopc (readonly long al_arg)
public function any of_getvalordelaestructura (readonly long al_posicion, readonly string as_indicador)
public subroutine of_setvariasopc (readonly boolean ab_variasopc)
public subroutine of_generarplano (ref uo_dsbase ads)
public subroutine of_generarplano (readonly string as_indicador, ref uo_dsbase lds)
public subroutine of_guardarcambios (uo_dsbase ads)
public subroutine of_commit ()
public subroutine of_resetvariablesindicadordetodos ()
public subroutine of_rollback ()
public subroutine of_validarusuarioexiste (readonly string as_user)
public subroutine of_validarusuario (readonly string as_user, ref str_param astr_param)
public function string of_getusuario ()
public subroutine of_validarusuariofablinea ()
public subroutine of_eliminarmaestro (ref uo_dsbase ads)
public subroutine of_cargards (ref uo_dsbase ads, readonly string as_dataobject)
public subroutine of_copiaruserref (readonly string as_user)
public subroutine of_generarcopiaausuariossel (readonly uo_dsbase ads, ref uo_dsbase ads_permisosref)
public subroutine of_validarusuario (readonly string as_user)
public subroutine of_validarusuarioexiste (readonly string as_user, readonly boolean ab_boolvariosuser, readonly string as_param)
public subroutine of_supressrepeatingvalues (ref uo_dsbase ads_ds)
public subroutine of_validarcamposmaestro (readonly long al_programa, readonly long al_fab, readonly long al_linea, readonly long al_opcion, readonly string as_user)
public subroutine of_saveas (uo_dsbase ads_ds)
public subroutine of_filtrarsoloseleccionados (ref uo_dsbase ads_ds)
end prototypes

public function str_param of_getistr_param ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: Of_getistr_param
<DESC> Description Obtener Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Retorno el dato requerido </USAGE>
********************************************************************/
Try
	RETURN istr_param
CATCH( Exception ex)
	ex.setmessage("Error obteniendo los parametros para la recuperacion del maestro.")
	Throw ex
END TRY
end function

public function boolean of_getvariasfab ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: of_getVariasFab
<DESC> Description Obtener Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Retorno el dato requerido </USAGE>
********************************************************************/
Try
	RETURN ib_VariasFab
CATCH( Exception ex)
	ex.setmessage("Error obteniendo varias Fabricas.")
	Throw ex
END TRY

end function

public function boolean of_getvariaslineas ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: Of_getVariasLineas
<DESC> Description Obtener Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Retorno el dato requerido </USAGE>
********************************************************************/
Try
	RETURN ib_VariasLineas
CATCH( Exception ex)
	ex.setmessage("Error obteniendo varias Lineas.")
	Throw ex
END TRY
end function

public subroutine of_setfab (readonly long al_arg);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: Of_setFab
<DESC> Description setear Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> setear el dato requerido </USAGE>
********************************************************************/
Try
	istr_param.a_long1[1] = al_arg
CATCH( Exception ex)
	ex.setmessage("Error modificando el valor de la Fabrica.")
	Throw ex
END TRY


end subroutine

public subroutine of_setistr_param (readonly str_param astr_param);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: Of_setistr_param
<DESC> Description setear Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> setear el dato requerido </USAGE>
Fabricas en el istr_param.a_long1
Lineas	en el istr_param.a_long2
********************************************************************/
Try
	istr_param = astr_param
CATCH( Exception ex)
	ex.setmessage("Error modificando valor de la estructura de datos.")
	Throw ex
END TRY

end subroutine

public subroutine of_setlinea (readonly long al_arg);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: Of_setLinea
<DESC> Description setear Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> setear el dato requerido </USAGE>
********************************************************************/
Try
	istr_param.a_long2[1] = al_arg
CATCH( Exception ex)
	ex.setmessage("Error modificando valor Linea.")
	Throw ex
END TRY

end subroutine

public subroutine of_setvariasfab (readonly boolean ab_variasfab);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: Of_setVariasFab
<DESC> Description setear Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> setear el dato requerido </USAGE>
********************************************************************/
Try
	ib_VariasFab = ab_VariasFab
CATCH( Exception ex)
	ex.setmessage("Error modificando valor Fabricas.")
	Throw ex
END TRY

end subroutine

public subroutine of_setvariaslineas (readonly boolean ab_variaslineas);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: Of_setVariasLineas
<DESC> Description setear Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> setear el dato requerido </USAGE>
********************************************************************/
Try
	ib_VariasLineas = ab_VariasLineas
CATCH( Exception ex)
	ex.setmessage("Error modificando valor Lineas.")
	Throw ex
END TRY

end subroutine

public subroutine of_validarcamposfiltro (readonly long al_fab, readonly long al_linea, readonly long al_programa, readonly string as_user);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: of_validarCamposFiltro
<DESC> Description Validar Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Retorno exito o falla en validaciones </USAGE>
********************************************************************/
Exception ex
ex = create Exception 
Try
	//valida que se digite el(los) programa(s)
	If (Isnull(al_programa) or al_programa <= 0) and (Not(ib_VariosProg)) Then
		ex.setmessage("Debe seleccionar Programa(s).")
		Throw ex
	End if

	//valida que se digite la Fabrica
	If (Isnull(al_fab) or al_fab <= 0) and (Not(ib_VariasFab)) Then
		ex.setmessage("Debe seleccionar F$$HEX1$$e100$$ENDHEX$$brica(s).")
		Throw ex
	End if
	
	//valida que se digite la linea
	If (Isnull(al_linea) or al_linea <= 0) and (Not(ib_VariasLineas)) Then
		ex.setmessage("Debe seleccionar Lineas(s).")
		Throw ex
	End if
	
	//valida que se digite el(los) usuario(s)
	If (Isnull(as_user) or as_user = '') and (Not(ib_VariosUser)) Then
		ex.setmessage("Debe seleccionar Usuario(s).")
		Throw ex
	End if
	
CATCH( Exception ex1)
	Throw ex
END TRY

end subroutine

public function boolean of_getvariosprog ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: of_getVariosProg
<DESC> Description Obtener Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Retorno el dato requerido </USAGE>
********************************************************************/
Try
	RETURN ib_VariosProg
CATCH( Exception ex)
	ex.setmessage("Error obteniendo varios Programas.")
	Throw ex
END TRY

end function

public function boolean of_getvariosusers ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: of_getVariosUsers
<DESC> Description Obtener Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Retorno el dato requerido </USAGE>
********************************************************************/
Try
	RETURN ib_VariosUser
CATCH( Exception ex)
	ex.setmessage("Error obteniendo varios Usuarios.")
	Throw ex
END TRY

end function

public subroutine of_setvariosprog (readonly boolean ab_variosprog);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: of_setVariosProg
<DESC> Description setear Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> setear el dato requerido </USAGE>
********************************************************************/
Try
	ib_VariosProg = ab_variosProg
CATCH( Exception ex)
	ex.setmessage("Error modificando valor Programas.")
	Throw ex
END TRY

end subroutine

public subroutine of_setvariosusers (readonly boolean ab_variosusers);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: of_setVariosUsers
<DESC> Description setear Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> setear el dato requerido </USAGE>
********************************************************************/
Try
	ib_VariosUser = ab_variosUsers
CATCH( Exception ex)
	ex.setmessage("Error modificando valor Usuarios.")
	Throw ex
END TRY
end subroutine

public subroutine of_setprog (readonly long al_arg);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: Of_setProg
<DESC> Description setear Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> setear el dato requerido </USAGE>
********************************************************************/
Try
	istr_param.a_long3[1] = al_arg
CATCH( Exception ex)
	ex.setmessage("Error modificando el valor de la Fabrica.")
	Throw ex
END TRY


end subroutine

public subroutine of_setuser (readonly string as_arg);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: Of_setUser
<DESC> Description setear Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> setear el dato requerido </USAGE>
********************************************************************/
Try
	istr_param.a_string1[1] = as_arg
CATCH( Exception ex)
	ex.setmessage("Error modificando el valor de la Fabrica.")
	Throw ex
END TRY


end subroutine

public subroutine of_itemchanged (readonly long row, readonly dwobject dwo, readonly string data);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: of_itemchanged
<DESC> Description itemchanged del set de datos </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> itemchanged del set de datos </USAGE>
********************************************************************/
str_param	lstr_param

Try
	CHOOSE CASE Dwo.Name
		CASE 'co_programa'
			THIS.of_setvariosProg(False)//Resetar indicaron que son varios Programas
			istr_param.a_long3 = lstr_param.a_long3
			THIS.of_setProg(Long(Data)) //Setear en la estructura en el arregle a_long3 el Programa
		CASE 'co_fabrica'
			THIS.of_setvariasfab(False)//Resetar indicaron que son varias Fabricas
			THIS.of_setvariaslineas(False)//Resetar indicaron que son varias Lineas, ya que dependen de la(s) Fab Seleccionada(s)
			istr_param.a_long1 = lstr_param.a_long1 //Reset vector de Fabricas
			istr_param.a_long2 = lstr_param.a_long2 //Reset vector de Lineas
			THIS.of_setFab(Long(Data)) //Setear en la estructura en el arregle a_long1 la fabrica
		CASE 'co_linea'
			THIS.of_setvariaslineas(False)//Resetar indicaron que son varias Lineas
			istr_param.a_long2 = lstr_param.a_long2
			THIS.of_setLinea(Long(Data))  //Setear en la estructura en el arregle a_long2 la linea	
		CASE 'usuario'
			THIS.of_setvariosUsers(False)//Resetar indicaron que son varios Usuarios
			istr_param.a_string1 = lstr_param.a_string1 //Reset vector de Usuarios
			THIS.of_ValidarUsuario(String(Data),lstr_param)
		CASE 'co_opcion'
			THIS.of_setvariasOpc(False)//Resetar indicaron que son varios Programas
			istr_param.a_long4 = lstr_param.a_long4
			THIS.of_setOpc(Long(Data)) 
	END CHOOSE 
CATCH( Exception ex)
	Throw ex
END TRY


end subroutine

public subroutine of_guardarmaestro ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016 FunctionName: of_guardarMaestro
<DESC> Description Guardar </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Guardar</USAGE>
********************************************************************/
Exception ex
ex = create Exception 
Try
	uo_dsbase lds
	lds = create uo_dsbase
	lds.dataobject='d_sq_gr_m_param_perespxapli'
	lds.settransobject(n_cst_application.itr_appl)
	
	THIS.of_generarplano(lds) //Se genera el Archivo plano con las combinaciones para almacenar los datos	
	THIS.of_guardarCambios(lds)//Se genera la actualizacion de Datos(Update Properties)

	//Se confirma la actualizacion de datos
	IF lds.RowCOunt() >0 THEN 
		MessageBox('Exito','Los datos han sido almacenados correctamente.')
	END IF
CATCH( Exception ex1)
	Throw ex1
END TRY
end subroutine

public function any of_getupperboundstruct (readonly string as_indicador);/********************************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016 FunctionName: of_getUpperBoundStruct
<DESC> Description: Obtener el upperbound para Valor De la Estructura </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
********************************************************************/
Exception ex
ex = create Exception 
Try
	CHOOSE CASE as_indicador
		CASE FAB
			RETURN UPPERBOUND(istr_param.a_long1[])
		CASE LINEA
			RETURN UPPERBOUND(istr_param.a_long2[])		
		CASE PROGRAMA
			RETURN UPPERBOUND(istr_param.a_long3[])
		CASE OPCION
			RETURN UPPERBOUND(istr_param.a_long4[])
		CASE USUARIO
			RETURN UPPERBOUND(istr_param.a_string1[])
	END CHOOSE
CATCH( Exception ex1)
	ex1.setmessage('Ocurrio un error al tratar de Obtener el Numero de datos de la Estructura')
	Throw ex1
END TRY

end function

public subroutine of_setds_struct (readonly string as_indicador, ref uo_dsbase ads, readonly long al_fila, readonly long al_filaant);/********************************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016 FunctionName: of_setDS_struct
<DESC> Description setear datos segun indicador </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Guardar</USAGE>
********************************************************************/
Try
	
	CHOOSE CASE as_indicador
		CASE FAB
			ads.setitem(al_fila,'co_fabrica',of_getValorDelaEstructura(al_filaAnt,as_indicador))
		CASE LINEA
			ads.setitem(al_fila,'co_linea',of_getValorDelaEstructura(al_filaAnt,as_indicador))
		CASE PROGRAMA
			//NO se requiere se hace en el of_guardarMaestro(), es el primero solo requiere el ciclo inicial de llenado de datos
		CASE OPCION
			ads.setitem(al_fila,'co_opcion',of_getValorDelaEstructura(al_filaAnt,as_indicador))
		CASE USUARIO
			ads.setitem(al_fila,'Usuario',of_getValorDelaEstructura(al_filaAnt,as_indicador))
	END CHOOSE
	
CATCH( Exception ex1)
	ex1.setmessage('Ocurrio un error al tratar de cargar datos del maestro')
	Throw ex1
END TRY

end subroutine

public subroutine of_setds_struct (readonly string as_indicador, ref uo_dsbase ads, readonly long al_fila, readonly long al_filaant, readonly long al_filadato);/********************************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016 FunctionName: of_setDS_struct
<DESC> Description setear datos segun indicador </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Guardar</USAGE>
Nota: si se adiciona una nueva fila se debe adicionar la logica en la siguiente iteracion consecutiva, 
la logica se aprecia pasando de una iteracion a otra 
********************************************************************/
Try
	CHOOSE CASE as_indicador
		CASE FAB //Iteracion 1
			ads.setitem(al_fila,'co_aplicacion',ads.getItemNumber(al_FilaAnt, 'co_aplicacion'))
			ads.setitem(al_fila,'co_programa',ads.getItemNumber(al_FilaAnt, 'co_programa'))
			ads.setitem(al_fila,'co_fabrica',of_getValorDelaEstructura(al_filadato,as_indicador))	
		CASE LINEA //Iteracion 2
			ads.setitem(al_fila,'co_aplicacion',ads.getItemNumber(al_FilaAnt, 'co_aplicacion'))
			ads.setitem(al_fila,'co_programa',ads.getItemNumber(al_FilaAnt, 'co_programa'))
			ads.setitem(al_fila,'co_fabrica',ads.getItemNumber(al_FilaAnt, 'co_fabrica'))
			ads.setitem(al_fila,'co_linea',of_getValorDelaEstructura(al_filadato,as_indicador))
		CASE PROGRAMA
			//NO se requiere se hace en el of_guardarMaestro()
		CASE OPCION  //Iteracion 3
			ads.setitem(al_fila,'co_aplicacion',ads.getItemNumber(al_FilaAnt, 'co_aplicacion'))
			ads.setitem(al_fila,'co_programa',ads.getItemNumber(al_FilaAnt, 'co_programa'))
			ads.setitem(al_fila,'co_fabrica',ads.getItemNumber(al_FilaAnt, 'co_fabrica'))
			ads.setitem(al_fila,'co_linea',ads.getItemNumber(al_FilaAnt, 'co_linea'))			
			ads.setitem(al_fila,'co_opcion',of_getValorDelaEstructura(al_filadato,as_indicador))
			
		CASE USUARIO  //Iteracion 4
			ads.setitem(al_fila,'co_aplicacion',ads.getItemNumber(al_FilaAnt, 'co_aplicacion'))
			ads.setitem(al_fila,'co_programa',ads.getItemNumber(al_FilaAnt, 'co_programa'))
			ads.setitem(al_fila,'co_fabrica',ads.getItemNumber(al_FilaAnt, 'co_fabrica'))
			ads.setitem(al_fila,'co_linea',ads.getItemNumber(al_FilaAnt, 'co_linea'))			
			ads.setitem(al_fila,'co_opcion',ads.getItemNumber(al_FilaAnt, 'co_opcion'))	
			ads.setitem(al_fila,'Usuario',of_getValorDelaEstructura(al_filadato,as_indicador))
	END CHOOSE
	
CATCH( Exception ex1)
	ex1.setmessage('Ocurrio un error al tratar de cargar datos del maestro')
	Throw ex1
END TRY

end subroutine

public function boolean of_getvariasopc ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: of_getVariasOpc
<DESC> Description Obtener Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Retorno el dato requerido </USAGE>
********************************************************************/
Try
	RETURN ib_VariasOpc
CATCH( Exception ex)
	ex.setmessage("Error obteniendo varias Opciones.")
	Throw ex
END TRY

end function

public subroutine of_setopc (readonly long al_arg);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: Of_setOpc
<DESC> Description setear Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> setear el dato requerido </USAGE>
********************************************************************/
Try
	istr_param.a_long4[1] = al_arg
CATCH( Exception ex)
	ex.setmessage("Error modificando el valor de la Fabrica.")
	Throw ex
END TRY


end subroutine

public function any of_getvalordelaestructura (readonly long al_posicion, readonly string as_indicador);/********************************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016 FunctionName: of_getValorDelaEstructura
<DESC> Description: Obtener Valor De la Estructura </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
********************************************************************/
Exception ex
ex = create Exception 
Try
	CHOOSE CASE as_indicador
		CASE FAB
			RETURN istr_param.a_long1[al_posicion]
		CASE LINEA
			RETURN istr_param.a_long2[al_posicion]			
		CASE PROGRAMA
			RETURN istr_param.a_long3[al_posicion]		
		CASE OPCION
			RETURN istr_param.a_long4[al_posicion]	
		CASE USUARIO
			RETURN istr_param.a_string1[al_posicion]		
	END CHOOSE
CATCH( Exception ex1)
	ex1.setmessage('Ocurrio un error al tratar de guardar el Maestro')
	Throw ex1
END TRY

end function

public subroutine of_setvariasopc (readonly boolean ab_variasopc);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: Of_setVariasOpc
<DESC> Description setear Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> setear el dato requerido </USAGE>
********************************************************************/
Try
	ib_VariasOpc = ab_variasOpc
CATCH( Exception ex)
	ex.setmessage("Error modificando valor Opciones.")
	Throw ex
END TRY

end subroutine

public subroutine of_generarplano (ref uo_dsbase ads);/********************************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016 FunctionName: of_generarPlano
<DESC> Description Generar plano  </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Genrar archivo plano con las combinaciones </USAGE>
********************************************************************/
Long		ll_fila, ll_filas, ll_filasDato, ll_filasComb ,ll_filaNew, &
			ll_FilaAnt , ll_FilasIni, ll_filaExt 
Exception ex
ex = create Exception 
Try	
	//Aplicacion siempre es 33 correspondiente a muestras 
	//Estructura-Datos de Programas(s)
	FOR ll_fila = 1 TO UPPERBOUND(istr_param.a_long3[])
		ll_filaNew = ads.insertRow(0)
		ads.setitem(ll_filaNew,'co_aplicacion',n_cst_application.ii_application)
		ads.setitem(ll_filaNew,'co_programa',istr_param.a_long3[ll_filaNew])
	NEXT
	
	//Estructura-Datos de Fabrica(s)
	THIS.of_generarPlano(FAB,ads)
	
	//Estructura-Datos de Lineas(s)
	THIS.of_generarPlano(LINEA,ads)
	
	//Estructura-Datos de Opcion(es)
	THIS.of_generarPlano(OPCION,ads)

	//Estructura-Datos de Usuario(os)
	THIS.of_generarPlano(USUARIO,ads)
	
	//Suprimir Valores que por las combinaciones hayan quedadas repetidas en el ds
	THIS.of_supressrepeatingvalues(ads)

CATCH( Exception ex1)
	ex1.setmessage('Ocurrio un error al generar el archivo plano para guardar el Maestro')
	Throw ex1
END TRY

end subroutine

public subroutine of_generarplano (readonly string as_indicador, ref uo_dsbase lds);/********************************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016 FunctionName: of_generarPlano
<DESC> Description Generar Plano </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Generar Plano </USAGE>
********************************************************************/
Long		ll_fila, ll_filas, ll_filasDato, ll_filasComb ,ll_filaNew, &
			ll_FilaAnt , ll_FilasIni, ll_filaExt 
Exception ex
ex = create Exception 
Try

	//Estructura-Datos Segun el indicador
	ll_Fila		= 1
	ll_Filas		= lds.RowCount()
	ll_FilasIni	= ll_Filas
	ll_FilasComb= THIS.of_getUpperBoundStruct(as_indicador) //Segun indicador se puede conocer cuantos numero tiene la estructura segun el dato
	ll_filasDato= 1 
	ll_FilaAnt	= 1 
	
	IF ll_FilasComb = 1 THEN 
		FOR ll_Fila = 1 TO ll_Filas
			THIS.of_setDS_struct(as_indicador,lds,ll_fila,ll_filaant)
		NEXT
	ELSE 
		FOR ll_filaExt = 1 TO ll_filasComb
			DO WHILE ll_Fila <= ll_Filas
				IF ll_Fila <> ll_FilaAnt THEN lds.InsertRow(0)				
				THIS.of_setds_struct(as_indicador,lds,ll_fila,ll_filaant,ll_filasdato )
				ll_Fila++
				ll_FilaAnt++
			LOOP
			ll_FilaAnt	= 1
			ll_Fila		= ll_Filas + 1 
			ll_Filas		= ll_Filas + ll_FilasIni //Para incrementarse el # de registros anteriormente ingresados
			ll_filasDato++
		NEXT 
	END IF 
CATCH( Exception ex1)
	ex1.setmessage('Ocurrio un error al tratar de guardar el Maestro')
	Throw ex1
END TRY

end subroutine

public subroutine of_guardarcambios (uo_dsbase ads);/********************************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016 FunctionName: of_guardarCambios
<DESC> Description Guardar </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Guardar</USAGE>
********************************************************************/
Exception ex
ex = create Exception 
Try
	IF ads.of_update() < 0 THEN 
		IF ads.il_SQLDBCode = -268 THEN 
			ex.setmessage("Usuario "+ads.getItemString(ads.getRow(),'usuario')+" ya tiene permisos asignados.")
		ELSE
			ex.setmessage("Ocurrio una inconsistencia al momento de guardar cambios.")
		END IF 
		Throw ex
	END IF 
CATCH( Exception ex1)
	Throw ex1
END TRY
end subroutine

public subroutine of_commit ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: of_commit
<DESC> Description of_commit</DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Retorno el dato requerido </USAGE>
********************************************************************/
Try
	COMMIT USING n_cst_application.itr_appl;	
CATCH( Exception ex)
	ex.setmessage("Error obteniendo varias Opciones.")
	Throw ex
END TRY

end subroutine

public subroutine of_resetvariablesindicadordetodos ();/***********************************************************
SA54453 - Ceiba/jjmonsal - 19-05-2016
Comentario: Mantenimiento Restriccion de Usuarios para Fichas de Materia Prima
***********************************************************/
ib_VariasFab 	= False 
ib_VariasLineas= False
ib_VariosProg 	= False
ib_VariosUser 	= False
ib_VariasOpc 	= False
end subroutine

public subroutine of_rollback ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: of_rollback
<DESC> Description of_rollback</DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Retorno el dato requerido </USAGE>
********************************************************************/
Try
	ROLLBACK USING n_cst_application.itr_appl;	
CATCH( Exception ex)
	ex.setmessage("Error obteniendo varias Opciones.")
	Throw ex
END TRY

end subroutine

public subroutine of_validarusuarioexiste (readonly string as_user);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: of_validarusuarioexiste
<DESC> Description itemchanged del set de datos </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> itemchanged del set de datos </USAGE>
********************************************************************/
Exception	ex 
str_param	lstr_param
Try
	ex = create Exception 
	//DS para validar si el usuario existe o NO
	uo_dsbase lds
	lds = create uo_dsbase
	lds.dataobject='d_gr_sq_seleccion_users'
	lds.settransobject(n_cst_application.itr_appl)

	IF lds.of_Retrieve(as_user) <= 0 THEN 
		ex.setMessage('Ingrese un usuario v$$HEX1$$e100$$ENDHEX$$lido')
		Throw ex
	END IF 

CATCH( Exception ex1)
	Throw ex
END TRY


end subroutine

public subroutine of_validarusuario (readonly string as_user, ref str_param astr_param);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: of_validarUsuario
<DESC> Description itemchanged del set de datos </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> itemchanged del set de datos </USAGE>
********************************************************************/
str_param	lstr_param
Try
	THIS.of_validarUsuarioFabLinea()
	THIS.of_validarUsuarioExiste(as_user)
	THIS.of_setuser(as_user)			//Setear en la estructura en el arregle a_string1 el usuario	
CATCH( Exception ex)
	istr_param.a_string1 = lstr_param.a_string1
	Throw ex
END TRY
end subroutine

public function string of_getusuario ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 22-05-2016 FunctionName: Of_getUsuario
<DESC> Description Obtener Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Retorno el dato requerido </USAGE>
Nota solo se utiliza para las modificaciones con el Itemchanged debido a que en este solo se puede modificar uno a la vez
********************************************************************/
Try
	RETURN istr_param.a_string1[1]
CATCH( Exception ex)
	ex.setmessage("Error obteniendo los parametros para la recuperacion del maestro.")
	Throw ex
END TRY
end function

public subroutine of_validarusuariofablinea ();/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: of_validarUsuarioFabLinea
<DESC> Description itemchanged del set de datos </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> itemchanged del set de datos </USAGE>
********************************************************************/
Exception	ex 
Try
	ex = create Exception 
	IF UpperBound(istr_param.a_long1) = 0 OR UpperBound(istr_param.a_long2) = 0 THEN
		ex.setMessage('Debe seleccionar F$$HEX1$$e100$$ENDHEX$$brica y/o L$$HEX1$$ed00$$ENDHEX$$nea')
		Throw ex
	END IF 

CATCH( Exception ex1)
	Throw ex
END TRY


end subroutine

public subroutine of_eliminarmaestro (ref uo_dsbase ads);/********************************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016 FunctionName: of_EliminarMaestro
<DESC> Description Eliminar registros seleccionados </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Eliminar Seleccion </USAGE>
********************************************************************/
Long		ll_fila, ll_filas
Exception ex
Try
	ex = CREATE Exception
		
	//Filtrar Informacion
	IF ads.SetFilter(" Seleccion = '"+THIS.SI+"' ") = -1 THEN 
		ex.setmessage("Ocurrio un error al establecer el filtro para eliminar los datos seleccionados")
		Throw ex
	ELSE 
		ads.Filter()
	END IF 

	ll_filas = ads.rowcount()
	
	IF ll_filas <= 0 THEN
		ex.setmessage("No se ha Seleccionado ningun registro para eliminar")
		Throw ex
	ELSE		
		FOR ll_fila = 1 TO ll_filas
			ads.SetItemStatus(ads.GetRow(), 0, Primary!, DataModified!)
			ads.deleteRow(0)
		NEXT
	END IF 
	
	IF ads.of_update() < 0 THEN 
		ex.setmessage("Ha ocurrido una inconsistensia al tratar de Eliminar Informaci$$HEX1$$f300$$ENDHEX$$n.")
		Throw ex
	END IF 
CATCH( Exception ex1)
	Throw ex1
END TRY
end subroutine

public subroutine of_cargards (ref uo_dsbase ads, readonly string as_dataobject);/********************************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016 FunctionName: of_cargarDS
<DESC> Description cargar datastore </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Cargar datastore </USAGE>
********************************************************************/
Long		ll_fila, ll_filas
Exception ex
Try
	ex = CREATE Exception
	ads = create uo_dsbase
	ads.dataobject=as_dataobject
	IF ads.settransobject(n_cst_application.itr_appl) < 0 THEN 
		Throw ex
	END IF 
CATCH( Exception ex1)
	Throw ex1
END TRY
end subroutine

public subroutine of_copiaruserref (readonly string as_user);/********************************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016 FunctionName: of_CopiarUserRef
<DESC> Description COpair Usuario de Referencia </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Copair user de ref</USAGE>
********************************************************************/
uo_dsbase lds, lds_PermisosRef
Exception ex
ex = create Exception 
Try
	THIS.of_cargards(lds,'d_sq_gr_rec_perespxapli_user')
	lds.of_retrieve(n_cst_application.ii_application,as_user)
	
	THIS.of_cargards(lds_PermisosRef,'d_sq_gr_rec_perespxapli_user')	
	
	THIS.of_generarCopiaaUsuariosSel(lds,lds_PermisosRef) //Se genera el Set de datos con los permisos copiados
	THIS.of_guardarCambios(lds_PermisosRef)//Se genera la actualizacion de Datos(Update Properties)
	
	MessageBox('Exito','Los datos han sido almacenados correctamente.')
CATCH( Exception ex1)
	Throw ex1
END TRY
end subroutine

public subroutine of_generarcopiaausuariossel (readonly uo_dsbase ads, ref uo_dsbase ads_permisosref);/********************************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016 FunctionName: of_generarCopiaaUsuariosSel
<DESC> Description Generar la copia de registros a los usuarios  </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Generar la copia de registros a los usuarios </USAGE>
********************************************************************/
Long		ll_fila, ll_filas,ll_filaNew, ll_filaDS
String	ls_user
Exception ex
ex = create Exception 
Try	
	//Aplicacion siempre es 33 correspondiente a muestras 
	//Estructura-Datos de Programas(s)
	FOR ll_fila = 1 TO UPPERBOUND(istr_param.a_string1[])
		ls_user = istr_param.a_string1[ll_fila]
		FOR ll_filaDS = 1 TO ads.RowCount()
			ll_filaNew = ads_PermisosRef.insertRow(0)
			ads_PermisosRef.setitem(ll_filaNew,'co_aplicacion',n_cst_application.ii_application)
			ads_PermisosRef.setitem(ll_filaNew,'co_aplicacion',ads.getItemNumber(ll_filaDS,'co_aplicacion'))
			ads_PermisosRef.setitem(ll_filaNew,'co_programa',ads.getItemNumber(ll_filaDS,'co_programa'))
			ads_PermisosRef.setitem(ll_filaNew,'co_fabrica',ads.getItemNumber(ll_filaDS,'co_fabrica'))
			ads_PermisosRef.setitem(ll_filaNew,'co_linea',ads.getItemNumber(ll_filaDS,'co_linea'))
			ads_PermisosRef.setitem(ll_filaNew,'co_opcion',ads.getItemNumber(ll_filaDS,'co_opcion'))			
			ads_PermisosRef.setitem(ll_filaNew,'usuario',ls_user)
		NEXT
	NEXT
	
CATCH( Exception ex1)
	ex1.setmessage('Ocurrio un error al generar el archivo plano para guardar el Maestro')
	Throw ex1
END TRY

end subroutine

public subroutine of_validarusuario (readonly string as_user);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: of_validarUsuario
<DESC> Description of_validarUsuario ingresado </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> que se haya ingresado un usuario </USAGE>
********************************************************************/
Exception	ex 
Try
	ex = create Exception 
	IF (IsNull(as_user) or Len(Trim(as_user)) = 0) OR ib_VariosUser THEN
		//Es Valido 
	ElseIF Len(Trim(as_user)) = 0 THEN //La validacion de usuario existe es posterior
		ex.setMessage('Debe ingresar o seleccionar al menos un usuario')
		Throw ex
	END IF  

CATCH( Exception ex1)
	Throw ex
END TRY


end subroutine

public subroutine of_validarusuarioexiste (readonly string as_user, readonly boolean ab_boolvariosuser, readonly string as_param);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: of_validarusuarioexiste
<DESC> Description itemchanged del set de datos </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> itemchanged del set de datos </USAGE>
********************************************************************/
Exception	ex 
str_param	lstr_param
Try
	ex = create Exception 
	//DS para validar si el usuario existe o NO
	uo_dsbase lds
	lds = create uo_dsbase
	lds.dataobject='d_gr_sq_seleccion_users'
	lds.settransobject(n_cst_application.itr_appl)

	CHOOSE CASE as_param
		CASE'usuario'
			IF ab_boolVariosUser THEN 
				//Son varios Usuarios y solo fue seleccionarlos desde la ayuda doubleclick
			ELSEIF lds.of_Retrieve(as_user) <= 0 THEN 
				ex.setMessage('Ingrese un usuario v$$HEX1$$e100$$ENDHEX$$lido')
				Throw ex
			END IF		
		CASE'usuarioRef'
			IF lds.of_Retrieve(as_user) <= 0 THEN 
				ex.setMessage('Ingrese un usuario de referencia v$$HEX1$$e100$$ENDHEX$$lido')
				Throw ex
			END IF
	END CHOOSE		

CATCH( Exception ex1)
	Throw ex
END TRY


end subroutine

public subroutine of_supressrepeatingvalues (ref uo_dsbase ads_ds);/********************************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016 FunctionName: of_supressRepeatingValues
<DESC> Description Suprimir datos repetidos al DS </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Generar Plano </USAGE>
********************************************************************/
Long		ll_fila, ll_filas, ll_fab, ll_lin, ll_opc, ll_pos
String	ls_user, ls_find
Boolean	lb_bool
Exception ex
ex = create Exception 
Try
	ll_filas = ads_DS.RowCount()
	FOR ll_fila = 1 TO ll_filas
		//Obtener Valores
		ll_fab	= ads_DS.getitemNumber(ll_fila,'co_fabrica')
		ll_lin	= ads_DS.getitemNumber(ll_fila,'co_linea')
		ll_opc	= ads_DS.getitemNumber(ll_fila,'co_opcion')
		ls_user	= ads_DS.getitemString(ll_fila,'Usuario')
		
		ls_find	=  " co_fabrica = "+String(ll_fab)+&
						" AND co_linea = "+String(ll_lin)+&
						" AND co_opcion = "+String(ll_opc)+&
						" AND Usuario = '"+Trim(ls_user)+"'"
		lb_bool = TRUE 
		Do While lb_bool
			ll_pos = ads_DS.Find(ls_find,ll_fila+1,ll_filas)
			IF ll_pos > 0 THEN 
				IF ll_fila = ll_filas THEN EXIT //Ya ha finalizado
				ads_DS.deleteRow(ll_pos)
				ll_filas = ads_DS.rowcount()
			ELSE 
				lb_bool = FALSE
			END IF 
		Loop
		
	NEXT 
	
CATCH( Exception ex1)
	ex1.setmessage('Ocurrio un error Suprimiendo datos al set de informacion')
	Throw ex1
END TRY

end subroutine

public subroutine of_validarcamposmaestro (readonly long al_programa, readonly long al_fab, readonly long al_linea, readonly long al_opcion, readonly string as_user);/********************************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016 FunctionName: of_validarCamposMaestro
<DESC> Description Validar Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Retorno exito o falla en validaciones </USAGE>
********************************************************************/
Exception ex
ex = create Exception 
Try
	//valida que se digite el(los) programa(s)
	If (Isnull(al_programa) or al_programa <= 0) and (Not(ib_VariosProg)) Then
		ex.setmessage("Debe seleccionar Programa(s).")
		Throw ex
	End if

	//valida que se digite la Fabrica
	If (Isnull(al_fab) or al_fab <= 0) and (Not(ib_VariasFab)) Then
		ex.setmessage("Debe seleccionar F$$HEX1$$e100$$ENDHEX$$brica(s).")
		Throw ex
	End if
	
	//valida que se digite la linea
	If (Isnull(al_linea) or al_linea <= 0) and (Not(ib_VariasLineas)) Then
		ex.setmessage("Debe seleccionar Lineas(s).")
		Throw ex
	End if
	
	//valida que se digite el(las) Opcion(es)
	If (Isnull(al_opcion) or al_opcion <= 0) and (Not(ib_VariasOpc)) Then
		ex.setmessage("Debe seleccionar la(s) Opcion(es).")
		Throw ex
	End if
	
	//valida que se digite el(los) usuario(s)
	If (Isnull(as_user) or as_user = '') and (Not(ib_VariosUser)) Then
		ex.setmessage("Debe seleccionar Usuario(s).")
		Throw ex
	End if
	
CATCH( Exception ex1)
	Throw ex
END TRY

end subroutine

public subroutine of_saveas (uo_dsbase ads_ds);/********************************************************************
SA54453 - Ceiba/jjmonsal - 16-06-2016 FunctionName: of_saveas
<DESC> Description GUARDAR COMO - generar el excel de los datos seleccionados </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> itemchanged del set de datos </USAGE>
********************************************************************/
String  ls_file,ls_path
Integer li_value
Exception	ex 
Try
	li_value = GetFileSaveName("Guardar como...", &
                           ls_path,ls_file,"XLS",&
									"Excel (*.XLS), *.XLS,"+&
									"Texto (*.TXT), *.TXT")
	If li_value = 1 Then
		If Upper(Right(Trim(ls_path),3)) = "TXT" Then
			ads_ds.SaveAs(ls_path,Text!,True)
		ElseIf Upper(Right(Trim(ls_path),3)) = "XLS" Then	
			ads_ds.SaveAs(ls_path,Excel!,True)
		Else
			ads_ds.SaveAs(ls_path, Excel!, TRUE)
		End If	
	End If
CATCH( Exception ex1)
	Throw ex
END TRY


end subroutine

public subroutine of_filtrarsoloseleccionados (ref uo_dsbase ads_ds);/********************************************************************
SA54453 - Ceiba/jjmonsal - 17-05-2016 FunctionName: of_filtrarsoloseleccionados
<DESC> Description FITRAR SOLO registros seleccionados </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Eliminar Seleccion </USAGE>
********************************************************************/
Exception ex
ex = create Exception
TRY 
	//Filtro para el dataobject maestro : d_sq_gr_m_param_perespxapli
	ads_ds.setFilter(" seleccion = '"+THIS.SI+"' ")
	ads_ds.Filter() 
	IF ads_ds.rowcount() <= 0 THEN
		ex.setmessage("No se ha Seleccionado ningun registro ")
		Throw ex
	END IF 
CATCH(Exception ex1)
	Throw ex1
End try
end subroutine

on n_cst_c_cfg_param_perespxapli.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_c_cfg_param_perespxapli.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;/***********************************************************
SA54453 - Ceiba/jjmonsal - 05-05-2016
Comentario: Mantenimiento Restriccion de Usuarios para Fichas de Materia Prima
***********************************************************/
of_resetVariablesIndicadordeTodos()
end event

