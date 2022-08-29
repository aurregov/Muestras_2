HA$PBExportHeader$n_cst_tb_ordenprevfab_bk.sru
$PBExportComments$/***********************************************************~r~nSA55583 - Ceiba/jjmonsal - 21-09-2016~r~nComentario: Conexion a Ordenes DB2~r~n***********************************************************/
forward
global type n_cst_tb_ordenprevfab_bk from uo_dsbase
end type
end forward

global type n_cst_tb_ordenprevfab_bk from uo_dsbase
end type
global n_cst_tb_ordenprevfab_bk n_cst_tb_ordenprevfab_bk

type variables
n_cst_conexiondb2 itr_transOrdenesdb2
String				is_refer, is_talla, is_color

Private: 
CONSTANT STRING INDICADOR_REF_SIS = 'TP'

//Ds para la fusion con los datos de SIS
uo_dsbase	ids_DatosSAP
end variables

forward prototypes
public subroutine of_destruirtransaccional ()
public subroutine of_cargartransaccionaldb2 ()
public subroutine of_recuperarinformacionds (readonly long al_refer, readonly long al_talla, readonly long al_color)
public subroutine of_organizardatos_sis (ref string as_refer, ref string as_talla, ref string as_color, readonly long al_refer, readonly long al_talla, readonly long al_color)
public function boolean of_ordenesprevfabsinprogsis_pooltejido (readonly integer ai_estado)
public function boolean of_ordenesprevfabprogsis_gantttejido (readonly integer ai_estado)
public function boolean of_cargavalorcampoenpdn ()
public function long of_getnumfilasds ()
public subroutine of_preparaambrecuperarinformacionds ()
public subroutine of_replicarcambiosfmp (readonly long al_valor, readonly long al_fabrica, readonly long al_linea, readonly long al_muestra, readonly long al_talla, readonly long al_color)
public subroutine of_setnombredataobject ()
public subroutine of_replicarcambiosmuestrabasica (readonly long al_valor, readonly long al_fabrica, readonly long al_linea, readonly long al_muestra, readonly long al_talla, readonly long al_color)
public function uo_dsbase of_getds ()
public function boolean of_ordenesprevfabsinfijarsis ()
public subroutine of_setdsdatossap (uo_dsbase ads_datos)
public function uo_dsbase of_getdatossap ()
end prototypes

public subroutine of_destruirtransaccional ();/********************************************************************
SA55583 - Ceiba/jjmonsal - 21-09-2016 FunctionName: of_DestruirTransaccional
<DESC> Description: Cargar transaccional de la BD OrdenesDB2 </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Obtener conexion a la BD OrdenesDB2 </USAGE>
********************************************************************/
Exception 	ex

Try
	ex = Create Exception
	IF Isvalid(itr_transOrdenesdb2) THEN 
		DISCONNECT USING itr_transOrdenesdb2;
		DESTROY(itr_transOrdenesdb2)
	END IF 
Catch(Exception ex1)
	Throw ex1
End Try
end subroutine

public subroutine of_cargartransaccionaldb2 ();/********************************************************************
SA55583 - Ceiba/jjmonsal - 21-09-2016 FunctionName: of_CargarTransaccionalDB2
<DESC> Description: Cargar transaccional de la BD OrdenesDB2 </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Obtener conexion a la BD OrdenesDB2 </USAGE>
********************************************************************/
Exception 	ex

Try
	ex 						= Create Exception
	itr_transOrdenesdb2.of_CargarTransaccionalDB2( )
	
Catch(Exception ex1)
	Throw ex1
End Try
end subroutine

public subroutine of_recuperarinformacionds (readonly long al_refer, readonly long al_talla, readonly long al_color);/********************************************************************
SA55583 - Ceiba/jjmonsal - 21-09-2016 FunctionName: of_RecuperarInformacionDS
<DESC> Description: recuperacion de la infomacion del DS </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> recuperacion de la infomacion del DS  </USAGE>
********************************************************************/
Long			ll_filas
Exception 	ex

Try
	ex= Create Exception	
	of_OrganizarDatos_SIS(is_refer, is_talla, is_color,al_refer,al_talla,al_color)
	ll_filas = THIS.of_Retrieve(is_refer, is_talla, is_color) 
	
	IF ll_filas < 0 THEN 
		ex.setmessage("Fallo al Recuperar informaci$$HEX1$$f300$$ENDHEX$$n para verificar necesidades para producci$$HEX1$$f300$$ENDHEX$$n(SIS)") 
		Throw ex
	ELSEIF ll_filas = 0 THEN 	
//		ex.setmessage("No se encontro Informaci$$HEX1$$f300$$ENDHEX$$n al verificar necesidades para producci$$HEX1$$f300$$ENDHEX$$n(SIS)") //Si no existe informacion no hay nada en produccion
//		Throw ex
	END IF 
	
Catch(Exception ex1)
	Throw ex1
End Try
end subroutine

public subroutine of_organizardatos_sis (ref string as_refer, ref string as_talla, ref string as_color, readonly long al_refer, readonly long al_talla, readonly long al_color);/********************************************************************
SA55583 - Ceiba/jjmonsal - 21-09-2016 FunctionName: of_OrganizarDatos_SIS
<DESC> Description: Obtener parametro para recuperar informacion en SIS </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Recuperar Informacion en SIS </USAGE>
********************************************************************/
Try
	as_refer = String(al_refer) + INDICADOR_REF_SIS	
	as_talla = String(al_talla, '00')
	as_color = String(al_color, '000000')	
Catch(Exception ex1)
	Throw ex1
End Try
end subroutine

public function boolean of_ordenesprevfabsinprogsis_pooltejido (readonly integer ai_estado);/********************************************************************
SA55583 - Ceiba/jjmonsal - 21-09-2016 FunctionName: of_OrdenesPrevFabSinProgSIS_PoolTejido
<DESC> Description: Validar Ordenes previsionales o de fabricaci$$HEX1$$f300$$ENDHEX$$n sin programar en SIS (en Pool de Tejido)</DESC> 
<RETURN> No Aplica </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Consultar si existen $$HEX1$$f300$$ENDHEX$$rdenes previsionales o de fabricaci$$HEX1$$f300$$ENDHEX$$n sin programar en SIS (en Pool de Tejido).
Para esto se debe ir a TB_ORDENPREVFAB con referencia - talla - color y verificar estados
-> 1: Orden Previsional pediente por programar
-> 4: Orden de Fabricaci$$HEX1$$f300$$ENDHEX$$n pediente por programar </USAGE>
********************************************************************/
IF ai_estado = 1 OR ai_estado = 4 THEN 
	RETURN TRUE 
END IF
RETURN FALSE 
end function

public function boolean of_ordenesprevfabprogsis_gantttejido (readonly integer ai_estado);/********************************************************************
SA55583 - Ceiba/jjmonsal - 21-09-2016 FunctionName: of_OrdenesPrevFabProgSIS_GanttTejido
<DESC> Description: Validar  Ordenes previsionales o de fabricaci$$HEX1$$f300$$ENDHEX$$n programadas en SIS (en Gantt de Tejido)</DESC> 
<RETURN> No Aplica </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Consultar si existen $$HEX1$$f300$$ENDHEX$$rdenes previsionales o de fabricaci$$HEX1$$f300$$ENDHEX$$n programadas en SIS (en Gantt de Tejido).
Para esto se debe ir a TB_ORDENPREVFAB con referencia - talla - color y verificar estados
- 2: Orden Previsional programada
- 3: Orden de Fabricaci$$HEX1$$f300$$ENDHEX$$n programada
- 5: Orden previsional y de fabricaci$$HEX1$$f300$$ENDHEX$$n programada </USAGE>
********************************************************************/
IF ai_estado = 2 OR ai_estado = 3 OR ai_estado = 5 THEN 
	RETURN TRUE 
END IF
RETURN FALSE 
end function

public function boolean of_cargavalorcampoenpdn ();/********************************************************************
SA55583 - Ceiba/jjmonsal - 21-09-2016 FunctionName: of_CargaValorCampoEnPdn
<DESC> Description:  </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Obtener conexion a la BD OrdenesDB2 </USAGE>
********************************************************************/
Long			ll_estado
Exception 	ex
Try
	ex = Create Exception
	IF THIS.of_OrdenesPrevFabSinFijarSIS() THEN //Ir a SAP : Validar si hay Necesidad en Produccion 
		RETURN TRUE
	END IF 
	
	IF THIS.Rowcount( ) <= 0 THEN RETURN FALSE 
	ll_estado = THIS.getItemNumber(1,'tb_ordenprevfab_co_estado')
	
	//Validar si tiene alguna necesidad en producci$$HEX1$$f300$$ENDHEX$$n para el pool de tejido o el gantt
	IF THIS.of_OrdenesPrevFabSinProgSIS_PoolTejido(ll_estado) OR THIS.of_OrdenesPrevFabProgSIS_GanttTejido(ll_estado) THEN 
		RETURN TRUE 
	END IF 
	RETURN FALSE 
Catch(Exception ex1)
	Throw ex1
End Try

end function

public function long of_getnumfilasds ();/********************************************************************
SA55583 - Ceiba/jjmonsal - 21-09-2016 FunctionName: of_getNumFilasDs
<DESC> Description: obtener el numero de filas del DS </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Filas del DS </USAGE>
********************************************************************/
Try
	return THIS.RowCount()
Catch(Exception ex1)
	Throw ex1
End Try
end function

public subroutine of_preparaambrecuperarinformacionds ();/********************************************************************
SA55583 - Ceiba/jjmonsal - 21-09-2016 FunctionName: of_PreparaAmbRecuperarInformacionDS
<DESC> Description:Prepara el ambiente para la recuperacion de la infomacion del DS </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE>Prepara el ambiente DS </USAGE>
********************************************************************/
Try
	THIS.dataobject='d_sq_gr_db2_tb_ordenprevfab'
	THIS.settransobject(itr_transOrdenesdb2.of_getTransacciondb2( ))
	
Catch(Exception ex1)
	Throw ex1
End Try
end subroutine

public subroutine of_replicarcambiosfmp (readonly long al_valor, readonly long al_fabrica, readonly long al_linea, readonly long al_muestra, readonly long al_talla, readonly long al_color);/********************************************************************
SA55583 - Ceiba/jjmonsal - 26-09-2016 FunctionName: of_ReplicarCambiosFmp
<DESC> Description:Replicar la informaci$$HEX1$$f300$$ENDHEX$$n a las fichas de materia por cada recurso, en el campo "En Producci$$HEX1$$f300$$ENDHEX$$n" en la informaci$$HEX1$$f300$$ENDHEX$$n de "Colores" </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Replicar Cambios Fmp </USAGE>
********************************************************************/
Long			ll_fila, ll_filas
Exception 	ex
Try
	ex = Create Exception
	uo_dsbase lds_fmp_color
	lds_fmp_color = create uo_dsbase
	lds_fmp_color.dataobject='d_sq_gr_h_fmp_muestras_color'
	lds_fmp_color.settransobject(n_cst_application.itr_appl)
	ll_filas = lds_fmp_color.of_Retrieve(al_fabrica,al_linea,al_muestra,al_talla,al_color)
	IF ll_filas < 0 THEN 
		ex.setmessage("Ocurrio una inconsistencia al recuperar la informaci$$HEX1$$f300$$ENDHEX$$n de la Ficha de materia prima por color.") 
		Throw ex
	END IF 
	FOR ll_fila = 1 TO ll_filas
		lds_fmp_color.SetItem(ll_fila,'sw_enPdn',al_valor)
	NEXT
	
	IF lds_fmp_color.of_Update( ) < 0 THEN 
		ex.setmessage("Ocurrio una inconsistencia al actualizar la informaci$$HEX1$$f300$$ENDHEX$$n de la Ficha de materia prima por color.") 
		Throw ex
	END IF 
Catch(Exception ex1)
	Throw ex1
End Try

end subroutine

public subroutine of_setnombredataobject ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName :of_setNombreDataObject 
<DESC> Description: setear el nombre del dataobject actual </DESC> 
<RETURN> None </RETURN> 
<ACCESS> Public
<ARGS> </ARGS> 
<USAGE> Invocarlo para cambiarle el nombre del dataobject actual </USAGE>
********************************************************************/	
Try
	THIS.dataobject='d_sq_gr_db2_tb_ordenprevfab_color_mae'
	THIS.settransobject(itr_transOrdenesdb2.of_getTransacciondb2( ))
	
Catch(Exception ex1)
	Throw ex1
End Try
end subroutine

public subroutine of_replicarcambiosmuestrabasica (readonly long al_valor, readonly long al_fabrica, readonly long al_linea, readonly long al_muestra, readonly long al_talla, readonly long al_color);/********************************************************************
SA55583 - Ceiba/jjmonsal - 26-09-2016 FunctionName: of_ReplicarCambiosMuestraBasica
<DESC> Description:Replicar la informaci$$HEX1$$f300$$ENDHEX$$n Muestra basica, en el campo "En Producci$$HEX1$$f300$$ENDHEX$$n" en la informaci$$HEX1$$f300$$ENDHEX$$n de "Colores" </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Replicar Cambios Muestra basica </USAGE>
********************************************************************/
Long			ll_fila, ll_filas
Exception 	ex
Try
	ex = Create Exception
	uo_dsbase lds_MuestraBasic_color
	lds_MuestraBasic_color = create uo_dsbase
	lds_MuestraBasic_color.dataobject='d_dt_muestras_col'
	lds_MuestraBasic_color.settransobject(n_cst_application.itr_appl)
	ll_filas = lds_MuestraBasic_color.of_Retrieve(al_fabrica,al_linea,al_muestra,al_talla,al_color)
	IF ll_filas < 0 THEN 
		ex.setmessage("Ocurrio una inconsistencia al recuperar la informaci$$HEX1$$f300$$ENDHEX$$n de la Ficha de materia prima por color.") 
		Throw ex
	END IF
	FOR ll_fila = 1 TO ll_filas
		lds_MuestraBasic_color.SetItem(ll_fila,'sw_enPdn',al_valor)
	NEXT
	
	IF lds_MuestraBasic_color.of_Update( ) < 0 THEN 
		ex.setmessage("Ocurrio una inconsistencia al actualizar la informaci$$HEX1$$f300$$ENDHEX$$n de la Ficha de materia prima por color.") 
		Throw ex
	END IF 
Catch(Exception ex1)
	Throw ex1
End Try

end subroutine

public function uo_dsbase of_getds ();/********************************************************************
SA55583 - Ceiba/jjmonsal - 3-11-2016 FunctionName: of_getDS
<DESC> Description: obtener el numero de filas del DS </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Filas del DS </USAGE>
********************************************************************/
Try
	RETURN THIS
Catch(Exception ex1)
	Throw ex1
End Try
end function

public function boolean of_ordenesprevfabsinfijarsis ();/********************************************************************
SA55583 - Ceiba/jjmonsal - 21-09-2016 FunctionName: of_OrdenesPrevFabSinFijarSIS
<DESC> Description: Ordenes previsionales sin fijar a SIS</DESC> 
<RETURN> No Aplica </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Consultar si existen $$HEX1$$f300$$ENDHEX$$rdenes previsionales sin fijar a SIS para referencia - talla - color y verificar estados
consulte en SAP mediante una funci$$HEX1$$f300$$ENDHEX$$n la informaci$$HEX1$$f300$$ENDHEX$$n  y guarde los siguientes 
datos: Referencia (semielaborado TP), Talla TP, Color TP, Orden Previsional, Solicitud de Pedido </USAGE>
********************************************************************/
Long					ll_return
n_cst_llamado_sap lnvo_llamado_sap
Try
	lnvo_llamado_sap = Create n_cst_llamado_sap
	
	ll_return = lnvo_llamado_sap.of_Ejecutar_RFC_SAP(is_refer, is_talla, is_color) 
	IF ll_return <= 0 Then
		Destroy lnvo_llamado_sap
		Return FALSE
	Else
		THIS.of_setDsDatosSap(lnvo_llamado_sap.of_getDSdatosSAP()) 
		Destroy lnvo_llamado_sap
		Return TRUE
	End IF
	
CATCH(Exception ex)
	Messagebox("A ocurrido una excepci$$HEX1$$f300$$ENDHEX$$n", "Fallo:" + ex.getmessage(), StopSign!)
	Destroy lnvo_llamado_sap
	Return FALSE
CATCH( Throwable th)
	Messagebox("A ocurrido una excepci$$HEX1$$f300$$ENDHEX$$n", "Fallo:" + th.getmessage(), StopSign!)
	Destroy lnvo_llamado_sap
	Return FALSE
End try
end function

public subroutine of_setdsdatossap (uo_dsbase ads_datos);/********************************************************************
SA55583 Ceiba/jjmonsal - 06-12-2016 - E00572 - Muestra b$$HEX1$$e100$$ENDHEX$$sica - FunctionName: of_setDsDatosSap
<DESC> Description: procesar enviado a sap </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
Exception ex
TRY
	ex = create Exception
	IF ads_datos.RowCount() > 0 THEN 
		IF ads_datos.RowsCopy(1,ads_datos.RowCount(), Primary!, ids_DatosSAP, 1, Primary!) < 0 THEN 
			ex.setmessage('Fallo copiado de datos para la posterior fusion con SIS')
			THROW ex
		END IF 
	END IF 
CATCH(Exception exc)
	Throw exc
CATCH( Throwable th)
	Throw (th)
End try
end subroutine

public function uo_dsbase of_getdatossap ();/********************************************************************
SA55583 - Ceiba/jjmonsal - 3-11-2016 FunctionName: of_getDatosSap
<DESC> Description: obtener el numero de filas del DS </DESC> 
<RETURN> El dato requerido: </RETURN> 
<ACCESS> Public/Protected/Private 
<USAGE> Filas del DS </USAGE>
********************************************************************/
Try
	RETURN ids_DatosSAP
Catch(Exception ex1)
	Throw ex1
End Try
end function

on n_cst_tb_ordenprevfab_bk.create
call super::create
end on

on n_cst_tb_ordenprevfab_bk.destroy
call super::destroy
end on

event constructor;call super::constructor;/***********************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016
Comentario: REPORTE POR MODIFICACI$$HEX1$$d300$$ENDHEX$$N EN FICHAS DE MATERIA PRIM
***********************************************************/
itr_transOrdenesdb2 = Create n_cst_conexiondb2

ids_DatosSAP = create uo_dsbase
ids_DatosSAP.Dataobject= 'd_ex_gr_validarnecesidadenpdn'
ids_DatosSAP.SetTransobject(n_cst_application.itr_appl)



end event

event destructor;call super::destructor;IF ISVALID(ids_DatosSAP)THEN 
	DESTROY(ids_DatosSAP)
END IF 
end event

