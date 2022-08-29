HA$PBExportHeader$n_cst_c_actualizarmp_en_ficha.sru
$PBExportComments$/***********************************************************~r~nSA50536 - Ceiba/jjmonsal - 20-04-2016~r~nComentario: Opcion en MUESTRAS para recodificar MP~r~n***********************************************************/
forward
global type n_cst_c_actualizarmp_en_ficha from nonvisualobject
end type
end forward

global type n_cst_c_actualizarmp_en_ficha from nonvisualobject
end type
global n_cst_c_actualizarmp_en_ficha n_cst_c_actualizarmp_en_ficha

type variables
Private: 
str_param			istr_param
Boolean				ib_VariasFab, ib_VariasLineas
Public: 
CONSTANT STRING	SI = 'S'
end variables

forward prototypes
public function str_param of_getistr_param ()
public subroutine of_setistr_param (readonly str_param astr_param)
public subroutine of_setvariasfab (readonly boolean ab_variasfab)
public function boolean of_getvariasfab ()
public function boolean of_getvariaslineas ()
public subroutine of_setvariaslineas (readonly boolean ab_variaslineas)
public subroutine of_setfab (readonly long al_arg)
public subroutine of_setlinea (readonly long al_arg)
public subroutine of_validarinformacionori (readonly long al_fab, readonly long al_linea, readonly long al_producto, readonly long al_color, ref long al_calidad, ref long al_matiz, ref long al_caract, ref string as_mensaje) throws exception
public subroutine of_poblarregfmpseleccionados (readonly uo_dsbase ads_ds)
public subroutine of_ejecutaractualizaciondedatos (readonly uo_dsbase ads_ds)
public subroutine of_deleteinfofmpseleccionadas ()
public subroutine of_rep_fmp_recursocotmodificado ()
public subroutine of_actrecursocotmodificado (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra, readonly long al_recurso)
public subroutine of_validarinformaciondest (readonly long al_producto_destino, readonly long al_color_destino) throws exception
public subroutine of_validarpdtocolordestexiste (readonly long al_producto_destino, readonly long al_color_destino) throws exception
public subroutine of_gettransaccionaldirty (ref transaction atr_sucia) throws exception
public subroutine of_itemchanged (readonly long row, readonly dwobject dwo, readonly string data)
end prototypes

public function str_param of_getistr_param ();/********************************************************************
SA50536 - Ceiba/jjmonsal - 20-04-2016 FunctionName: Of_getistr_param
<DESC> Description Obtener Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Retorno el dato requerido </USAGE>
********************************************************************/
RETURN istr_param
end function

public subroutine of_setistr_param (readonly str_param astr_param);/********************************************************************
SA50536 - Ceiba/jjmonsal - 20-04-2016 FunctionName: Of_setistr_param
<DESC> Description setear Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> setear el dato requerido </USAGE>
Fabricas en el istr_param.a_long1
Lineas	en el istr_param.a_long2
********************************************************************/
istr_param = astr_param
end subroutine

public subroutine of_setvariasfab (readonly boolean ab_variasfab);/********************************************************************
SA50536 - Ceiba/jjmonsal - 20-04-2016 FunctionName: Of_setVariasFab
<DESC> Description setear Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> setear el dato requerido </USAGE>
********************************************************************/
ib_VariasFab = ab_VariasFab
end subroutine

public function boolean of_getvariasfab ();/********************************************************************
SA50536 - Ceiba/jjmonsal - 20-04-2016 FunctionName: Of_getVariasFab
<DESC> Description Obtener Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Retorno el dato requerido </USAGE>
********************************************************************/
RETURN ib_VariasFab
end function

public function boolean of_getvariaslineas ();/********************************************************************
SA50536 - Ceiba/jjmonsal - 20-04-2016 FunctionName: Of_getVariasLineas
<DESC> Description Obtener Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Retorno el dato requerido </USAGE>
********************************************************************/
RETURN ib_VariasLineas
end function

public subroutine of_setvariaslineas (readonly boolean ab_variaslineas);/********************************************************************
SA50536 - Ceiba/jjmonsal - 20-04-2016 FunctionName: Of_setVariasLineas
<DESC> Description setear Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> setear el dato requerido </USAGE>
********************************************************************/
ib_VariasLineas = ab_VariasLineas
end subroutine

public subroutine of_setfab (readonly long al_arg);/********************************************************************
SA50536 - Ceiba/jjmonsal - 20-04-2016 FunctionName: Of_setFab
<DESC> Description setear Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> setear el dato requerido </USAGE>
********************************************************************/
istr_param.a_long1[1] = al_arg
end subroutine

public subroutine of_setlinea (readonly long al_arg);/********************************************************************
SA50536 - Ceiba/jjmonsal - 20-04-2016 FunctionName: Of_setLinea
<DESC> Description setear Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> setear el dato requerido </USAGE>
********************************************************************/
istr_param.a_long2[1] = al_arg
end subroutine

public subroutine of_validarinformacionori (readonly long al_fab, readonly long al_linea, readonly long al_producto, readonly long al_color, ref long al_calidad, ref long al_matiz, ref long al_caract, ref string as_mensaje) throws exception;/********************************************************************
SA50536 - Ceiba/jjmonsal - 20-04-2016 FunctionName: of_validarInformacionOri
<DESC> Description Validar Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Retorno exito o falla en validaciones </USAGE>
********************************************************************/
Exception ex
ex = create Exception 
Try

	//valida que se digite la Fabrica
	If (Isnull(al_fab) or al_fab <= 0) and (Not(ib_VariasFab)) Then
		ex.setmessage("No se ha digitado la Fabrica.")
		Throw ex
	End if
	
	//valida que se digite la linea
	If (Isnull(al_linea) or al_linea <= 0) and (Not(ib_VariasLineas)) Then
		ex.setmessage("No se ha digitado la Linea.")
		Throw ex
	End if
	//valida que se digite el producto origen
	If Isnull(al_producto) or al_producto <= 0 Then
		ex.setmessage("No se ha digitado el producto origen.")
		Throw ex
	End if
	//valida que se digite el color origen
	If Isnull(al_color) or al_color <= 0 Then
		ex.setmessage("No se ha digitado el color origen.")
		Throw ex
	End if
	//mira si digitaron la calidad origen sino se coloca en -1 para la consulta
	If Isnull(al_calidad) or al_calidad < 0 Then
		al_calidad = -1
	Else
		as_mensaje += ' Calidad ' + String(al_calidad)
	End if
	//mira si digitaron la matiz origen sino se coloca en -1 para la consulta
	If Isnull(al_matiz) or al_matiz < 0 Then
		al_matiz = -1
	Else
		as_mensaje += ' Matiz ' + String(al_matiz)
	End if
	//Valida si digitaron la caracteristica origen sino se coloca en -1 para la consulta
	If Isnull(al_caract) or al_caract < 0 Then
		al_caract = -1
	Else
		as_mensaje += ' Caracteristica ' + String(al_caract)
	End if
CATCH( Exception ex1)
	Throw ex1
END TRY

end subroutine

public subroutine of_poblarregfmpseleccionados (readonly uo_dsbase ads_ds);/********************************************************************
SA50536 - Ceiba/jjmonsal - 20-04-2016 FunctionName: Of_setistr_param
<DESC> Description setear Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> setear el dato requerido </USAGE>
Fabricas en el istr_param.a_long1
Lineas	en el istr_param.a_long2
********************************************************************/
//Filtrar las fmp seleccionadas
Exception ex
ex = create Exception
TRY
	ads_ds.setFilter(" Seleccionar = '"+n_cst_c_actualizarmp_en_ficha.SI+"' ")
	ads_ds.Filter() 
	IF ads_ds.rowcount() > 0 THEN
		THIS.of_ejecutarActualizaciondeDatos(ads_ds)
	ELSE 
		ex.setmessage("Debe seleccionar Todos o al menos un registro a Procesar")
		Throw ex
	END IF 
CATCH(Exception ex1)
	Throw ex1
End Try


end subroutine

public subroutine of_ejecutaractualizaciondedatos (readonly uo_dsbase ads_ds);/********************************************************************
SA50536 - Ceiba/jjmonsal - 20-04-2016 FunctionName: of_ejecutarActualizaciondeDatos
<DESC> Description actualizacion de Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> actualziar el dato requerido </USAGE>
********************************************************************/
//Filtrar las fmp seleccionadas
Long		ll_fila, ll_filas, ll_fila_insert
uo_dsbase lds
Exception ex
ex = create Exception
TRY
	lds = create uo_dsbase
	lds.dataobject=ads_ds.dataobject
	lds.settransobject(n_cst_application.itr_appl)

	ll_filas = ads_ds.RowCount()
	
	FOR ll_fila = 1 to ll_filas
		ll_fila_insert = lds.InsertRow(0)
		IF ll_fila <> ll_fila_insert THEN 
			ex.setmessage("Error realizando el copiado .")
			Throw ex
		END IF 
		lds.setItem(ll_fila_insert,'co_muestra',ads_ds.getItemNumber(ll_fila,'co_muestra'))		
		lds.setItem(ll_fila_insert,'co_referencia_ref',ads_ds.getItemNumber(ll_fila,'co_referencia_ref'))			
		lds.setItem(ll_fila_insert,'co_talla',ads_ds.getItemNumber(ll_fila,'co_talla'))	
		lds.setItem(ll_fila_insert,'co_color',ads_ds.getItemNumber(ll_fila,'co_color'))	
		lds.setItem(ll_fila_insert,'co_partemp',ads_ds.getItemNumber(ll_fila,'co_partemp'))	
		lds.setItem(ll_fila_insert,'co_combinacion',ads_ds.getItemNumber(ll_fila,'co_combinacion'))	
		lds.setItem(ll_fila_insert,'co_producto_mp',ads_ds.getItemNumber(ll_fila,'co_producto_mp'))	
		lds.setItem(ll_fila_insert,'co_color_mp',ads_ds.getItemNumber(ll_fila,'co_color_mp'))	
		lds.setItem(ll_fila_insert,'calidad_mp',ads_ds.getItemNumber(ll_fila,'calidad_mp'))	
		lds.setItem(ll_fila_insert,'co_matiz_mp',ads_ds.getItemNumber(ll_fila,'co_matiz_mp'))	
		lds.setItem(ll_fila_insert,'co_caracteristi_mp',ads_ds.getItemNumber(ll_fila,'co_caracteristi_mp'))	
		lds.setItem(ll_fila_insert,'co_fabrica',ads_ds.getItemNumber(ll_fila,'co_fabrica'))	
		lds.setItem(ll_fila_insert,'co_linea',ads_ds.getItemNumber(ll_fila,'co_linea'))	
		lds.setItem(ll_fila_insert,'cnt_opcion',ads_ds.getItemNumber(ll_fila,'cnt_opcion'))	
		
	NEXT
	IF lds.of_update() < 0 THEN 
		ex.setmessage("Error Poblando datos FMP Seleccionadas.")
		Throw ex
	END IF

CATCH(Exception ex1)
	Throw ex1
End Try


end subroutine

public subroutine of_deleteinfofmpseleccionadas ();/********************************************************************
SA50536 - Ceiba/jjmonsal - 19-04-2016 FunctionName of_DeleteInfoFMPSeleccionadas
<DESC> Description: Borrar informacion de fmp seleccionadas</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> None </ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Long					ll_filas
String				ls_LimpiarReg

uo_dsbase			lds_fmpSeleccionadas
Exception ex
ex = create Exception
TRY
	lds_fmpSeleccionadas = create uo_dsbase
	lds_fmpSeleccionadas.dataobject='d_sq_gr_cambio_pdto_color_mp_dt'
	lds_fmpSeleccionadas.settransobject(n_cst_application.itr_appl)
	ll_filas = lds_fmpSeleccionadas.of_retrieve()
	IF ll_filas <= 0 THEN RETURN
	
	//SA54991 - Ceiba/jjmonsal - 26-07-2016
	DECLARE LimpiarReg PROCEDURE FOR pr_del_cambio_pdto_color_mp_dt 
		USING n_cst_application.itr_appl;
	EXECUTE LimpiarReg; 

	IF n_cst_application.itr_appl.SqlCode < 0 Then
		ex.setmessage("Error Limpiando la informacion de los datos seleccionados, "+String(n_cst_application.itr_appl.SqlErrText)+".")
		Throw ex
	END IF
			
	//Refrescamos
	ll_filas = lds_fmpSeleccionadas.Retrieve()

	//FOR ll_fila = 1 TO ll_filas
	//	lds_fmpSeleccionadas.DeleteRow(0)
	//NEXT
	//IF lds_fmpSeleccionadas.of_update() < 0 THEN 
	//	ex.setmessage("Error Poblando datos FMP Seleccionadas.")
	//	Throw ex
	//END IF
	
	Destroy(lds_fmpSeleccionadas)
CATCH(Exception ex1)
	Destroy lds_fmpSeleccionadas
	Throw ex1
End Try

end subroutine

public subroutine of_rep_fmp_recursocotmodificado ();/********************************************************************
SA50536 - Ceiba/jjmonsal - 20-04-2016 FunctionName: of_Rep_Fmp_RecursoCotModificado
<DESC> Description actualizacion de Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> actualziar el dato requerido </USAGE>
********************************************************************/
//Filtrar las fmp seleccionadas
Long		ll_fila, ll_filas, ll_fila_insert
uo_dsbase lds
Exception ex
ex = create Exception
TRY
	lds = create uo_dsbase
	lds.dataobject='d_sq_gr_generarLogFmpAct'
	lds.settransobject(n_cst_application.itr_appl)
	lds.of_retrieve(istr_param.a_long1[],istr_param.a_long2[] )
	ll_filas = lds.RowCount()
	
	FOR ll_fila = 1 to ll_filas
		THIS.of_ActRecursoCotModificado(lds.getItemNumber(ll_fila,'co_fabrica'),&
													lds.getItemNumber(ll_fila,'co_linea'),&
													lds.getItemNumber(ll_fila,'co_muestra'),&
													lds.getItemNumber(ll_fila,'co_recurso'))
	NEXT

CATCH(Exception ex1)
	Throw ex1
End Try


end subroutine

public subroutine of_actrecursocotmodificado (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra, readonly long al_recurso);/********************************************************************
SA50536 - Ceiba/jjmonsal - 27-04-2016 FunctionName: of_ActRecursoCotModificado
<DESC> Description Esta funcion permite almacenar la informacion sobre las modificaciones realizada a los recursos cotizados
a los recursos cotizados cierra o no cierra </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Cuando se modifica un recurso cotizado cierra o no cierra se debe invocar esta funcion, ya esta validara si se debe almacenar o no </USAGE>
********************************************************************/
String	 ls_rec_mod

n_cst_c_log_reccotizado	lnv_c_log_reccotizado
lnv_c_log_reccotizado = CREATE n_cst_c_log_reccotizado	

Exception ex
ex = create Exception
Try
	lnv_c_log_reccotizado.of_setFabrica(al_fabrica)
	lnv_c_log_reccotizado.of_setLinea(al_linea)
	lnv_c_log_reccotizado.of_setMuestra(al_muestra)
	lnv_c_log_reccotizado.of_setRecurso(al_recurso)
	ls_rec_mod = lnv_c_log_reccotizado.of_recurso_mod(al_muestra, al_linea, al_fabrica, al_recurso) //Indica si cierra o no cierra 
	
	IF lnv_c_log_reccotizado.of_cargarInfoReporteRecCotizado(ls_rec_mod,0) = -1 THEN //Se coloca el muestrario en cero por defecto
		ex.setmessage("Error Actualizando el log de modificaciones sobre la FMP.")
		Throw ex
	END IF 
	
	IF IsValid(lnv_c_log_reccotizado) THEN 
		Destroy lnv_c_log_reccotizado
	END IF 

CATCH(Exception ex1)
	Throw ex1
End Try


end subroutine

public subroutine of_validarinformaciondest (readonly long al_producto_destino, readonly long al_color_destino) throws exception;/********************************************************************
SA50536 - Ceiba/jjmonsal - 20-04-2016 FunctionName: of_validarInformacionDest
<DESC> Description Validar Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Retorno exito o falla en validaciones </USAGE>
********************************************************************/
Exception ex
ex = create Exception 
Try
	
	//Valida que se digite el producto destino
	If Isnull(al_producto_destino) or al_producto_destino <= 0 Then
		ex.setmessage("No se ha digitado el producto destino.")
		Throw ex
	End if
	
	//Valida que se digite el color destino
	If Isnull(al_color_destino) or al_color_destino < 0 Then
		ex.setmessage("No se ha digitado el color destino.")
		Throw ex
	End if
	
	//Ya se valido que si se ha ingresado producto y color destino, ahora se debe validar que si exista
	of_ValidarPdtoColorDestExiste(al_producto_destino,al_color_destino)

CATCH( Exception ex1)
	Throw ex1
END TRY
end subroutine

public subroutine of_validarpdtocolordestexiste (readonly long al_producto_destino, readonly long al_color_destino) throws exception;/********************************************************************
SA50536 - Ceiba/jjmonsal - 20-04-2016 FunctionName: of_validarInformacionDest
<DESC> Description Validar Informacion sobre el dato requerido </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Validar que si exista producto color destino </USAGE>
********************************************************************/
Transaction	ltr_sucia
uo_dsbase 	lds
Exception 	ex
ex = create Exception

Try
	of_getTransaccionalDirty(ltr_sucia)
	lds = create uo_dsbase
	
	lds.dataobject='d_sq_gr_validarfmp_pdto_color_existe'
	lds.settransobject(ltr_sucia)
	IF lds.of_Retrieve(al_producto_destino, al_color_destino) <= 0 THEN
		DISCONNECT USING ltr_sucia ;
		destroy(ltr_sucia)
		ex.setmessage("No existe Materia Prima - Color destino.")
		Throw ex
	END IF
	
	IF IsValid(ltr_sucia)THEN 
		DISCONNECT USING ltr_sucia ;
		destroy(ltr_sucia)
	End IF
CATCH( Exception ex1)
	Throw ex1
END TRY
end subroutine

public subroutine of_gettransaccionaldirty (ref transaction atr_sucia) throws exception;/********************************************************************
SA50536 - Ceiba/jjmonsal - 20-04-2016 FunctionName: of_getTransaccionalDirty
<DESC> Description of_getTransaccionalDirty lectura sucia </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 	
<USAGE> transaccion lectura sucia </USAGE>
********************************************************************/
Exception 	ex
ex = create Exception

Try
	atr_sucia 				= Create Transaction
	atr_sucia.Dbms 		= n_cst_application.itr_appl.DBMS
	atr_sucia.Database	= n_cst_application.itr_appl.DATABASE
	atr_sucia.Userid		= n_cst_application.itr_appl.USERID
	atr_sucia.Dbpass		= n_cst_application.itr_appl.DBPASS
	atr_sucia.Dbparm		= n_cst_application.itr_appl.DBPARM
	atr_sucia.Servername	= n_cst_application.itr_appl.ServerName
	atr_sucia.Lock			= "Dirty Read"
	
	Connect Using atr_sucia;
	If atr_sucia.SqlCode = -1 Then
		ex.setmessage("Fallo la conexi$$HEX1$$f300$$ENDHEX$$n en modo Dirty Read." &
					+ "~r~nPor favor consulte con informatica.")
		Throw ex
	End If

CATCH( Exception ex1)
	Throw ex1
END TRY
end subroutine

public subroutine of_itemchanged (readonly long row, readonly dwobject dwo, readonly string data);/********************************************************************
SA50536 - Ceiba/jjmonsal - 20-04-2016 FunctionName: of_itemchanged
<DESC> Description itemchanged del set de datos </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> itemchanged del set de datos </USAGE>
********************************************************************/
str_param	lstr_param
Try
	CHOOSE CASE Dwo.Name
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
	END CHOOSE 
CATCH( Exception ex)
	ex.setmessage("Error modificando el valor del dato: "+String(Dwo.name)+".")
	Throw ex
END TRY
end subroutine

on n_cst_c_actualizarmp_en_ficha.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_c_actualizarmp_en_ficha.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;/***********************************************************
SA50536 - Ceiba/jjmonsal - 20-04-2016
Comentario: Opcion en MUESTRAS para recodificar MP
***********************************************************/
ib_VariasFab = false 
ib_VariasLineas = false
end event

