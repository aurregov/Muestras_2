HA$PBExportHeader$n_cst_c_repmodmanobra.sru
$PBExportComments$/***********************************************************~r~nSA53977 - Ceiba/jjmonsal - 06-12-2016~r~nComentario: GENERAR ALERTA POR MODIFICACIONES EN FICHAS DE MANO OBRA~r~n***********************************************************/
forward
global type n_cst_c_repmodmanobra from nonvisualobject
end type
end forward

global type n_cst_c_repmodmanobra from nonvisualobject
end type
global n_cst_c_repmodmanobra n_cst_c_repmodmanobra

type variables
PRIVATE CONSTANT INTEGER FAB_OMITIDA = 5

LONG			il_referencia, il_talla, il_tipo_prod
STRING		is_De_Talla
uo_dsbase	ids_Operacion_Inicial

n_cst_tr_modmanoobra		ids_RepModManoObra

Public:
CONSTANT STRING ADICION = 'ADICIONADO'
CONSTANT STRING ELIMINA = 'ELIMINADO'
CONSTANT STRING CAMBIOS = 'CAMBIO'
CONSTANT INTEGER CENTROTEJIDO = 12
end variables

forward prototypes
public subroutine of_poblardsiniciales (datawindow adw_operacionesini)
public subroutine of_genrepmodsobreoperaciones (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra, uo_dsbase ads_operaciones, readonly datawindow adw_operacionesini)
public subroutine of_generarinformacionsobrecambios (uo_dsbase ads_operaciones)
public subroutine of_setreferencia (readonly long al_referencia)
public subroutine of_settalla (readonly long al_talla)
public function long of_getreferencia ()
public function long of_gettalla ()
public subroutine of_setdetalla (readonly string as_de_talla)
public function string of_getdetalla ()
public subroutine of_setil_tipo_prod (readonly long al_tipo_prod)
public function string of_nombrecentro (readonly long al_centro)
public function string of_nombreoperacion (readonly long al_oper)
public function string of_nombrerecurso (readonly long al_centro, readonly long al_subcentro, readonly long al_recurso)
public function string of_setvaloresiniciales (uo_dsbase ads_operaciones, readonly long al_filaact, readonly long al_filasoperini, readonly long al_filasopermod, ref long al_centroini, ref long al_subcentroini, ref long al_operini, ref long al_recursoini)
public subroutine of_analizarcambios (ref boolean ab_haymodifi, readonly long al_filamp, readonly uo_dsbase ads_operaciones, ref long al_centroini, ref long al_subcentroini, ref long al_operini, ref long al_recursoini, ref long al_centromod, ref long al_subcentromod, ref long al_opermod, ref long al_recursomod)
public subroutine of_cargardatosdsreporte (readonly long al_centroini, readonly long al_centromod, readonly long al_operini, readonly long al_opermod, readonly long al_recursoini, readonly long al_recursomod, readonly string as_observacion, readonly boolean ab_haycambios, readonly long al_subcentroini, readonly long al_subcentromod)
public subroutine of_limpiardatos (ref long al_centroini, ref long al_operini, ref long al_recursoini, ref long al_centromod, ref long al_opermod, ref long al_recursomod, ref long al_subcentroini, ref long al_subcentromod)
public function boolean of_enviacorreo ()
public subroutine of_enviarcorreo ()
public subroutine of_guardarinformaciondelreporte ()
end prototypes

public subroutine of_poblardsiniciales (datawindow adw_operacionesini);Exception ex
ex	= Create Exception
Try
	ids_Operacion_Inicial.dataobject = adw_operacionesIni.dataobject
	
	IF adw_operacionesIni.RowCount() <= 0 THEN RETURN 
	
	IF adw_operacionesIni.RowsCopy(1, adw_operacionesIni.RowCount(), Primary!, &
											ids_Operacion_Inicial, 1, Primary!) < 0 THEN 
		ex.setmessage('Inconsistencia al realizar el copiado de informacion sobre las Operaciones originales')
		Throw ex
	END IF 
	
CATCH( Exception ex1)
	Throw ex1
End try

end subroutine

public subroutine of_genrepmodsobreoperaciones (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra, uo_dsbase ads_operaciones, readonly datawindow adw_operacionesini);Exception 					ex
n_cst_c_log_reccotizado	lnv_c_log_reccotizado
Try 
	ex								= CREATE Exception
	lnv_c_log_reccotizado	= CREATE n_cst_c_log_reccotizado	
	
	lnv_c_log_reccotizado.of_setFabrica(al_fabrica)
	lnv_c_log_reccotizado.of_setLinea(al_linea)
	lnv_c_log_reccotizado.of_setMuestra(al_muestra)
	
	IF al_fabrica = FAB_OMITIDA THEN RETURN 
	
	//Validar Si fue convertida a ref, en caso de serlo generar el reporte 
	IF lnv_c_log_reccotizado.Of_ValidarGenerarInformacionRep() THEN
		THIS.of_poblarDsIniciales(adw_operacionesIni)
		THIS.of_GenerarInformacionSobreCambios(ads_operaciones)
		IF THIS.of_EnviaCorreo() THEN //valida que si exista algun cambio 
			THIS.of_GuardarInformacionDelReporte()
//			// FACL - 2017/09/11 - SA56883 - Se quita envio de correo por cada cambio
//			//SA56883 - Ceiba reariase - 31/05/2017
//			THIS.of_EnviarCorreo()
//			//Fin SA56883
		END IF 
	END IF 
CATCH(Exception exc)
	Throw exc
CATCH( Throwable th)
	Throw (th)
End try

end subroutine

public subroutine of_generarinformacionsobrecambios (uo_dsbase ads_operaciones);Long		ll_fila, ll_filas, ll_filasOperIni, ll_filasOperMod
Boolean	lb_hayModifi
Long		ll_CentroIni, ll_subCentroIni, ll_operIni , ll_recursoIni, ll_centroMod, ll_SubcentroMod, ll_operMod, ll_recursoMod
String	ls_Observacion
Try
	ll_filasOperIni	= ids_Operacion_Inicial.RowCount()
	ll_filasOperMod	= ads_operaciones.RowCount()
	IF ll_filasOperIni > ll_filasOperMod THEN //Elimino registro
		ll_filas = ll_filasOperIni
	ELSEIF ll_filasOperMod >= ll_filasOperIni THEN //Agrega registro 
		ll_filas = ll_filasOperMod
	END IF
	
	FOR ll_fila = 1 TO ll_filas
		lb_hayModifi = FALSE
		THIS.of_LimpiarDatos(ll_CentroIni,ll_operIni,ll_recursoIni,ll_centroMod,ll_operMod,ll_recursoMod,ll_subCentroIni,ll_subCentroMod)
		ls_Observacion = THIS.of_setValoresIniciales(ads_operaciones,ll_fila,ll_filasOperIni,ll_filasOperMod,&
											ll_CentroIni, ll_subCentroIni, ll_operIni , ll_recursoIni)
		CHOOSE CASE ls_Observacion
			CASE ADICION, ELIMINA
				lb_hayModifi = TRUE
			CASE CAMBIOS
				THIS.of_AnalizarCambios(lb_hayModifi,ll_fila,ads_operaciones,ll_CentroIni, ll_subCentroIni, ll_operIni , ll_recursoIni, &
												ll_centroMod, ll_subCentroMod, ll_operMod, ll_recursoMod)
		END CHOOSE
		
		//Cargar los Datos al DS
		THIS.of_CargarDatosDSReporte(ll_CentroIni,ll_CentroMod,ll_operIni,ll_operMod,ll_recursoIni, ll_recursoMod,&
												ls_Observacion,lb_hayModifi,ll_subCentroIni,ll_subCentroMod)
		
	NEXT 

CATCH(Exception exc)
	Throw exc
CATCH( Throwable th)
	Throw (th)
End try
end subroutine

public subroutine of_setreferencia (readonly long al_referencia);THIS.il_referencia = al_referencia
end subroutine

public subroutine of_settalla (readonly long al_talla);THIS.il_talla = al_talla
end subroutine

public function long of_getreferencia ();RETURN THIS.il_referencia
end function

public function long of_gettalla ();RETURN THIS.il_talla
end function

public subroutine of_setdetalla (readonly string as_de_talla);//of_setDeTalla
THIS.is_De_Talla = as_de_talla
	
end subroutine

public function string of_getdetalla ();RETURN THIS.is_De_Talla
end function

public subroutine of_setil_tipo_prod (readonly long al_tipo_prod);THIS.il_tipo_prod = al_tipo_prod
end subroutine

public function string of_nombrecentro (readonly long al_centro);//of_ObtenerNombreCentro
String			ls_desc
Long				ll_res
n_cst_comun		lonv_comun
TRY	
	ll_res = lonv_comun.of_NombreCentro(THIS.il_tipo_prod,al_centro,n_cst_application.itr_appl) 
	IF ll_res = 1 THEN 
		ls_desc=lonv_comun.of_getString(1)
		RETURN ls_desc
	ELSE
		RETURN ''
	END IF 

CATCH(Exception exc)
	Throw exc
CATCH( Throwable th)
	Throw (th)
End try
end function

public function string of_nombreoperacion (readonly long al_oper);//of_NombreOperacion
String			ls_desc
Long				ll_res
n_cst_comun		lonv_comun
TRY	
	ll_res = lonv_comun.of_NombreOperacion(THIS.il_tipo_prod,al_oper,n_cst_application.itr_appl) 
	IF ll_res = 1 THEN 
		ls_desc=lonv_comun.of_getString(1)
		RETURN ls_desc
	ELSE
		RETURN ''
	END IF 

CATCH(Exception exc)
	Throw exc
CATCH( Throwable th)
	Throw (th)
End try
end function

public function string of_nombrerecurso (readonly long al_centro, readonly long al_subcentro, readonly long al_recurso);//of_NombreRecurso
String			ls_desc
Long				ll_res
n_cst_comun		lonv_comun
TRY	
	ll_res = lonv_comun.of_NombreRecurso(al_recurso,THIS.il_tipo_prod,al_centro,al_subcentro,n_cst_application.itr_appl) 
	IF ll_res = 1 THEN 
		ls_desc=lonv_comun.of_getString(1)
		RETURN ls_desc
	ELSE
		RETURN ''
	END IF 

CATCH(Exception exc)
	Throw exc
CATCH( Throwable th)
	Throw (th)
End try
end function

public function string of_setvaloresiniciales (uo_dsbase ads_operaciones, readonly long al_filaact, readonly long al_filasoperini, readonly long al_filasopermod, ref long al_centroini, ref long al_subcentroini, ref long al_operini, ref long al_recursoini);String			ls_Observacion
dwItemStatus	l_statusMod, l_statusIni
Exception		ex
ex = Create	Exception

Try	
	l_statusIni	= ids_Operacion_Inicial.GetItemStatus(al_filaAct, 'co_centro', Primary!)
	l_statusMod	= ads_Operaciones.GetItemStatus(al_filaAct, 'co_centro', Primary!)
	IF al_filasOperMod > al_filasOperini AND IsNull(l_statusIni) THEN //Agregue Nuevo Registro 
		al_CentroIni	= ads_operaciones.getItemNumber(al_filaact,'co_centro') 
		al_operIni		= ads_operaciones.getItemNumber(al_filaact,'co_operacion') 
		al_recursoIni	= ads_operaciones.getItemNumber(al_filaact,'co_recurso')
		al_subcentroini= ads_operaciones.getItemNumber(al_filaact,'co_subcentro')
		ls_Observacion = ADICION
	ELSEIF al_filasOperini > al_filasOperMod AND IsNull(l_statusMod) THEN //Elimino registro
		al_CentroIni	= ids_Operacion_Inicial.getItemNumber(al_filaact,'co_centro') 
		al_operIni		= ids_Operacion_Inicial.getItemNumber(al_filaact,'co_operacion') 
		al_recursoIni	= ids_Operacion_Inicial.getItemNumber(al_filaact,'co_recurso') 		
		al_subcentroini= ids_Operacion_Inicial.getItemNumber(al_filaact,'co_subcentro')
		ls_Observacion = ELIMINA
	ELSE 
		ls_Observacion = CAMBIOS
	END IF
	RETURN ls_Observacion
CATCH( Exception ex1)
	Throw ex1
End try
end function

public subroutine of_analizarcambios (ref boolean ab_haymodifi, readonly long al_filamp, readonly uo_dsbase ads_operaciones, ref long al_centroini, ref long al_subcentroini, ref long al_operini, ref long al_recursoini, ref long al_centromod, ref long al_subcentromod, ref long al_opermod, ref long al_recursomod);
Try
	al_CentroIni	= ids_Operacion_Inicial.getItemNumber(al_filamp,'co_centro')	
	al_operIni		= ids_Operacion_Inicial.getItemNumber(al_filamp,'co_operacion')
	al_recursoIni	= ids_Operacion_Inicial.getItemNumber(al_filamp,'co_recurso')
	al_subcentroini= ids_Operacion_Inicial.getItemNumber(al_filamp,'co_subcentro')
	
	al_CentroMod	= ads_operaciones.getItemNumber(al_filamp,'co_centro')	
	al_operMod		= ads_operaciones.getItemNumber(al_filamp,'co_operacion')
	al_recursoMod	= ads_operaciones.getItemNumber(al_filamp,'co_recurso')
	al_subcentromod= ads_operaciones.getItemNumber(al_filamp,'co_subcentro')
	
	IF al_CentroIni <> al_CentroMod THEN 
		al_CentroMod 	= ads_operaciones.getItemNumber(al_filamp,'co_centro')
		ab_hayModifi	= TRUE
	END IF
	
	IF al_operIni <> al_operMod THEN 
		al_operMod 		= ads_operaciones.getItemNumber(al_filamp,'co_operacion') 
		ab_hayModifi	= TRUE
	END IF
	
	IF al_recursoIni <> al_recursoMod THEN 
		al_recursoMod	= ads_operaciones.getItemNumber(al_filamp,'co_recurso') 
		ab_hayModifi	= TRUE
	END IF
	
CATCH(Exception exc)
	Throw exc
CATCH( Throwable th)
	Throw (th)
End try
end subroutine

public subroutine of_cargardatosdsreporte (readonly long al_centroini, readonly long al_centromod, readonly long al_operini, readonly long al_opermod, readonly long al_recursoini, readonly long al_recursomod, readonly string as_observacion, readonly boolean ab_haycambios, readonly long al_subcentroini, readonly long al_subcentromod);//of_CargarDatosDSReporte
Long		ll_fila
Try
	ids_RepModManoObra.of_insertarreg( )
	ll_fila = ids_RepModManoObra.of_GetFilaActual()
	ids_RepModManoObra.of_setNumRegistro(ll_fila)
	ids_RepModManoObra.of_setReferencia(il_referencia)
	ids_RepModManoObra.of_SetTalla(String(is_De_Talla))
	ids_RepModManoObra.of_SetCentroIni(THIS.of_nombrecentro(al_centroini))
	ids_RepModManoObra.of_setOperacionInicial(al_operini)
	ids_RepModManoObra.of_SetDeOperacionIni(THIS.of_nombreoperacion(al_operini))
	ids_RepModManoObra.of_setRecursoInicial(al_recursoini)
	ids_RepModManoObra.of_SetDeRecursoIni(THIS.of_NombreRecurso(al_centroini,al_subcentroini,al_recursoini))
	
	IF ab_hayCambios THEN 	
		ids_RepModManoObra.of_setObservacion(String(as_observacion))
		ids_RepModManoObra.of_DeCentroMod(THIS.of_nombrecentro(al_centroMod))
		ids_RepModManoObra.of_setOperacionMod(al_opermod)
		ids_RepModManoObra.of_SetDeOperacionMod(THIS.of_nombreoperacion(al_opermod))
		ids_RepModManoObra.of_setRecursoMod(al_recursomod)
		ids_RepModManoObra.of_setDeRecursoMod(THIS.of_NombreRecurso(al_centroMod,al_subcentroMod,al_recursoMod))
	ELSE
		ids_RepModManoObra.of_setObservacion('')
		ids_RepModManoObra.of_DeCentroMod('')
		ids_RepModManoObra.of_setOperacionMod(0)
		ids_RepModManoObra.of_SetDeOperacionMod('')
		ids_RepModManoObra.of_setRecursoMod(0)
		ids_RepModManoObra.of_setDeRecursoMod('')
	END IF 
	
	//Solo se notifica si se modifica la mano de obra para un Centro y Subcentro diferente a 12: TEJIDO
	//Si es Tejido se debe omitir 
	IF al_centroini = CENTROTEJIDO OR al_centroMod = CENTROTEJIDO THEN  
		ids_RepModManoObra.of_setObservacion('')
	END IF

CATCH(Exception exc)
	Throw exc
CATCH( Throwable th)
	Throw (th)
End try
end subroutine

public subroutine of_limpiardatos (ref long al_centroini, ref long al_operini, ref long al_recursoini, ref long al_centromod, ref long al_opermod, ref long al_recursomod, ref long al_subcentroini, ref long al_subcentromod);LONG	ll_Nulo
Try
	SetNull(ll_Nulo)
	al_CentroIni	= ll_Nulo
	al_operIni		= ll_Nulo
	al_recursoIni	= ll_Nulo
	al_SubcentroIni= ll_Nulo
	
	al_CentroMod	= ll_Nulo
	al_operMod		= ll_Nulo
	al_recursoMod	= ll_Nulo
	al_Subcentromod= ll_Nulo
	
CATCH(Exception exc)
	Throw exc
CATCH( Throwable th)
	Throw (th)
End try
end subroutine

public function boolean of_enviacorreo ();//of_EnviaCorreo
Long			ll_fila, ll_filas
String		ls_observacion 
Exception	ex
Try 
	Ex = CREATE Exception
	ll_filas = ids_RepModManoObra.rowCount()
	FOR ll_fila = 1 TO ll_filas 
		ls_observacion = ids_RepModManoObra.getItemString(ll_fila,'observacion')
		IF Len(Trim(ls_observacion)) > 0 THEN 
			RETURN TRUE 
		END IF 
	NEXT 
	RETURN FALSE 
CATCH(Exception exc)
	Throw exc
CATCH( Throwable th)
	Throw (th)
End try

end function

public subroutine of_enviarcorreo ();//of_EnviarCorreo
Exception	ex
Try 
	Ex = CREATE Exception
	DECLARE pr_envia_email PROCEDURE FOR "admpd".pr_repModManoObraHtml() USING n_cst_application.itr_appl;
	
	EXECUTE pr_envia_email; 
	
	IF SQLCA.SQLCODE < 0 THEN
		CLOSE pr_envia_email;
		ex.setmessage('Inconsistencia al ejecutar el proceso de envio de correo sobre Modificacion Mano de Obra')
		THROW ex
	ELSE 
		CLOSE pr_envia_email;
	END IF 
CATCH(Exception exc)
	Throw exc
CATCH( Throwable th)
	Throw (th)
End try
end subroutine

public subroutine of_guardarinformaciondelreporte ();//of_GuardarInformacionDelReporte
Exception	ex
Try 
	Ex = CREATE Exception
	//ids_RepModManoObra.saveas("c:\zz1.xls", Excel!, true )
	IF ids_RepModManoObra.of_Update( ) < 0 THEN 
		ex.setmessage('Inconsistencia al cargar la informacion del reporte modificaciones Mano de Obra')
		Throw ex
	END IF 	

CATCH(Exception exc)
	Throw exc
CATCH( Throwable th)
	Throw (th)
End try
end subroutine

on n_cst_c_repmodmanobra.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_c_repmodmanobra.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;il_referencia	= 0
il_talla			= 0
il_tipo_prod	= 0 
SetNull(is_De_Talla)

ids_RepModManoObra		= CREATE n_cst_tr_modmanoobra
ids_RepModManoObra.of_setNombreDataObject('d_gr_sq_tr_modmanoobra')

//Crear ds cargar la informacion de las operaciones Inicialmente
ids_Operacion_Inicial	= CREATE uo_dsbase
end event

