HA$PBExportHeader$n_cst_c_log_reccotizado.sru
$PBExportComments$/***********************************************************~r~nSA52045 - Ceiba/jjmonsal - 30-11-2015~r~nComentario:Modificacion Correo automatico desde Muestras~r~n***********************************************************/
forward
global type n_cst_c_log_reccotizado from nonvisualobject
end type
end forward

global type n_cst_c_log_reccotizado from nonvisualobject
end type
global n_cst_c_log_reccotizado n_cst_c_log_reccotizado

type variables
PUBLIC Boolean	ib_converRef

Long		il_fabrica,il_linea,il_muestra, il_recurso
Long		il_ref, il_talla							//SA55169 - Ceiba/jjmonsal - 03-10-2016

n_cst_log_reccotizado	inv_log_reccotizado	//SA52045 - Ceiba/jjmonsal - 30-11-2015: Se adiciona Entidad para la tabla que tendra la informacion de los cambios realizados a los recursos cotizados
end variables

forward prototypes
public function boolean of_validargenerarinformacionrep ()
public function string of_recurso_mod (readonly long co_rmuestra, readonly long co_linea, readonly long co_fabrica, readonly long co_recurso)
public subroutine of_getdatosparalogreccot (ref integer ai_talla, ref long al_ref)
public subroutine of_setinforeccotizado (readonly string as_recurso, readonly long al_recurso)
public function integer of_cargarinforeportereccotizado (readonly string as_recurso, readonly long al_muestrario)
public function string of_leerconstantestring (readonly string as_nombrevar)
public function long of_getrecurso ()
public function long of_getfabrica ()
public function long of_getlinea ()
public function long of_getmuestra ()
public subroutine of_setfabrica (readonly long al_valor)
public subroutine of_setlinea (readonly long al_valor)
public subroutine of_setmuestra (readonly long al_valor)
public subroutine of_setrecurso (readonly long al_valor)
public function n_cst_c_log_reccotizado of_getobject ()
public function boolean of_getconverref ()
public subroutine of_setref (readonly long al_valor)
public subroutine of_settalla (readonly long al_valor)
public subroutine of_setconverref (readonly boolean ab_valor, readonly long al_ref, readonly long al_talla)
public subroutine of_setconverref (readonly boolean ab_valor)
end prototypes

public function boolean of_validargenerarinformacionrep ();/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName : Of_ValidarGenerarInformacionRep
<DESC> Description: Esta funcion permite Validar si se produjo un cambio en los recursos cotizados 
y se debe almacenar en la nueva tabla log_RecCotizado para generar el reporte y enviarlo al correo 
a los recursos cotizados cierra o no cierra </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Para retornar TRUE la muestra debe estar convertida a referencia y que no haya convertido a referencia en
ese mismo momento (Evitar informacion inconsistente en SAP), y por ultimo algun recurso cotizado se haya modificado </USAGE>
Notas: Se debe cambiar que solo se genere la notificacion cuando fue convertida a ref y no siempre
********************************************************************/
n_cst_dt_muestras_ref	lds_dt_muestras_ref
lds_dt_muestras_ref		= CREATE n_cst_dt_muestras_ref

lds_dt_muestras_ref.of_validarMuestraConvertidaAReferencia(il_fabrica,il_linea,il_muestra)
lds_dt_muestras_ref.of_filtrar(' fe_actualizacion < datetime(today()) ') //Verificar que ya existe y no se haya convertido a referencia en el momento 
IF lds_dt_muestras_ref.of_getRowCount() > 0 AND (il_fabrica <> 5) THEN 
	THIS.of_setConverRef(TRUE,lds_dt_muestras_ref.GetItemNumber(1,'co_referencia_ref'),&
								lds_dt_muestras_ref.GetItemNumber(1,'co_talla_ref')) //SA55169 - Ceiba/jjmonsal - 03-10-2016
	Destroy(lds_dt_muestras_ref)								
	RETURN TRUE
ELSE 
	Destroy(lds_dt_muestras_ref)
	THIS.of_setConverRef(FALSE) //SA55169 - Ceiba/jjmonsal - 03-10-2016
	RETURN FALSE 
END IF 
end function

public function string of_recurso_mod (readonly long co_rmuestra, readonly long co_linea, readonly long co_fabrica, readonly long co_recurso);String ls_rec_mod

SELECT TRIM(rec.rec_mod)
INTO	:ls_rec_mod
FROM	(SELECT 'NO CIERRA' rec_mod
		FROM	 DT_MUESTRAS 
		WHERE CO_MUESTRA=:co_rmuestra
		AND CO_LINEA =:co_linea
		AND CO_FABRICA =:co_fabrica
		AND CO_RECCOTNOCIERRA = :co_recurso
	UNION ALL
		SELECT 'CIERRA' rec_mod
		FROM	 DT_MUESTRAS 
		WHERE CO_MUESTRA=:co_rmuestra
		AND CO_LINEA =:co_linea
		AND CO_FABRICA =:co_fabrica
		AND CO_RECCOTCIERRA = :co_recurso) rec
USING n_cst_application.itr_appl;

Return ls_rec_mod 
end function

public subroutine of_getdatosparalogreccot (ref integer ai_talla, ref long al_ref);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName : of_getdatosparalogRecCot
<DESC> Description: Esta funcion permite almacenar la informacion sobre las modificaciones realizada
a los recursos cotizados cierra o no cierra </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> obtener los datos como se obtenian con el of_mail_cambio</USAGE>
********************************************************************/
Exception ex
ex 						= CREATE Exception
u_ds_base				lds_datos
lds_datos				= CREATE u_ds_base
Try
	lds_datos.DataObject = 'd_datos_correo'
	lds_datos.SetTransobject(n_cst_application.itr_appl)
	lds_datos.retrieve(il_muestra,il_fabrica,il_linea)
	IF lds_datos.rowcount( ) <= 0 THEN RETURN 

	ai_talla 		= lds_datos.Object.co_talla[1]//Talla
	al_ref 			= lds_datos.Object.co_referencia[1]//El material 
//	ai_muestrario	= lds_datos.Object.co_muestrario[1]//Muestrario - 16-12-2015
	THIS.of_setRef(al_ref)			//SA55169 - Ceiba/jjmonsal - 03-10-2016
	THIS.of_setTalla(ai_talla)		//SA55169 - Ceiba/jjmonsal - 03-10-2016
CATCH( Throwable ex1 )
	Throw ex1
End try


end subroutine

public subroutine of_setinforeccotizado (readonly string as_recurso, readonly long al_recurso);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName : of_SetInfoRecCotizadoCierra
<DESC> Description:Esta funcion permite almacenar la informacion sobre las modificaciones realizada
a los recursos cotizados cierra o no cierra </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Cuando se modifica un recurso cotizado cierra o no cierra se debe invocar </USAGE>
********************************************************************/
Long ll_null

SetNull(ll_null)

IF as_recurso = 'CIERRA' THEN 
	//Se carga la informacion del cambio realizado Sobre el recurso cotizado Cierra, solo se envia el old 
	inv_log_recCotizado.of_setRecCotCierraOld(al_recurso)
	inv_log_recCotizado.of_setRecCotCierraNew(ll_null)
END IF 

IF as_recurso = 'NO CIERRA' THEN 
	//Se carga la informacion del cambio realizado Sobre el recurso cotizado no Cierra 
	inv_log_recCotizado.of_setRecCotNoCierraOld(al_recurso)
	inv_log_recCotizado.of_setRecCotNoCierraNew(ll_null)//Los new no se tocan, no se cambio el recurso se toca es la ficha.
END IF 
end subroutine

public function integer of_cargarinforeportereccotizado (readonly string as_recurso, readonly long al_muestrario);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName : of_cargarInfoReporteRecCotizado
<DESC> Description:Esta funcion permite almacenar la informacion sobre las modificaciones realizada
a los recursos cotizados cierra o no cierra </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Cuando se modifica un recurso cotizado cierra o no cierra se debe invocar esta funcion, ya esta validara si se debe almacenar o no</USAGE>
********************************************************************/
//Se crea la Tabla log_RecCotizado: tabla que almacena la informacion sobre los cambios realizados a los recursos cotizados 
Long			ll_ref
Integer 		li_talla
String		ls_entrada 

Exception ex
ex = create Exception
Try
	ls_entrada = of_LeerConstanteString('ORIGENCAMBIORECCOTFICHAPRIMA')
	IF Of_ValidarGenerarInformacionRep() THEN //Validar si se deben cargan los datos a la tabla log_RecCotizado; solo si fue convertida a ref
		//Se inserta o actualiza el registro
		inv_log_reccotizado.of_validarregexiste(il_fabrica,il_linea,il_muestra,al_muestrario)
		CHOOSE CASE inv_log_reccotizado.of_getOperacion()
			CASE 'INSERT'
				THIS.of_getDatosParaLogRecCot(li_talla,ll_ref)
				inv_log_reccotizado.of_SetDatosInserccion(il_fabrica,il_linea,il_muestra,li_talla,ll_ref,al_muestrario,ls_entrada)
			CASE 'UPDATE'	
				inv_log_reccotizado.of_setdatosupdate(ls_entrada)
		END CHOOSE 
		
		THIS.of_SetInfoRecCotizado(as_recurso,of_getRecurso())//Cargar los datos Old y New de los recursos cotizados
		IF inv_log_recCotizado.OF_Update( ) < 0 THEN RETURN -1 
	END IF 

	RETURN 1 
CATCH( Throwable ex1)
	Throw ex1
	RETURN -1 
End try
end function

public function string of_leerconstantestring (readonly string as_nombrevar);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName: of_LeerConstanteString
<DESC> Description: Inicializar constante </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> cargar constante </USAGE>
********************************************************************/
n_cst_comun		lnv_comun

IF lnv_comun.of_valorconstante(as_nombrevar,n_cst_application.itr_appl) = -1 THEN RETURN ''
RETURN lnv_comun.of_getString(1)
end function

public function long of_getrecurso ();/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName of_getRecurso
<DESC> Description: retornar recurso </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Modificacion Correo automatico desde Muestras </USAGE>
********************************************************************/
RETURN il_recurso
end function

public function long of_getfabrica ();/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName of_getFabrica
<DESC> Description: retornar fabrica </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Modificacion Correo automatico desde Muestras </USAGE>
********************************************************************/
RETURN il_fabrica 
end function

public function long of_getlinea ();/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName of_getLinea
<DESC> Description: retornar linea </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Modificacion Correo automatico desde Muestras </USAGE>
********************************************************************/
RETURN il_linea
end function

public function long of_getmuestra ();/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName of_getLinea
<DESC> Description: retornar linea </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Modificacion Correo automatico desde Muestras </USAGE>
********************************************************************/
RETURN il_muestra 
end function

public subroutine of_setfabrica (readonly long al_valor);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName of_setFabrica
<DESC> Description: retornar fabrica </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Modificacion Correo automatico desde Muestras </USAGE>
********************************************************************/
il_fabrica = al_valor
end subroutine

public subroutine of_setlinea (readonly long al_valor);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName of_setLinea
<DESC> Description: retornar fabrica </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Modificacion Correo automatico desde Muestras </USAGE>
********************************************************************/
il_linea = al_valor
end subroutine

public subroutine of_setmuestra (readonly long al_valor);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName of_setMuestra
<DESC> Description: retornar fabrica </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Modificacion Correo automatico desde Muestras </USAGE>
********************************************************************/
il_muestra = al_valor
end subroutine

public subroutine of_setrecurso (readonly long al_valor);/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName of_setRecurso
<DESC> Description: retornar fabrica </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Modificacion Correo automatico desde Muestras </USAGE>
********************************************************************/
il_recurso = al_valor
end subroutine

public function n_cst_c_log_reccotizado of_getobject ();/********************************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015 FunctionName of_getFabrica
<DESC> Description: retornar fabrica </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Modificacion Correo automatico desde Muestras </USAGE>
********************************************************************/
RETURN THIS 
end function

public function boolean of_getconverref ();/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName of_getConverRef
<DESC> Description: Obtener valor al campo </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> No Aplica </USAGE>
********************************************************************/
RETURN ib_converRef

end function

public subroutine of_setref (readonly long al_valor);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName of_setRef
<DESC> Description: setear el campo  </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Setter </USAGE>
********************************************************************/
il_ref = al_valor
end subroutine

public subroutine of_settalla (readonly long al_valor);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName of_setTalla
<DESC> Description: setear el campo  </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> Setter </USAGE>
********************************************************************/
il_talla = al_valor
end subroutine

public subroutine of_setconverref (readonly boolean ab_valor, readonly long al_ref, readonly long al_talla);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName of_setConverRef
<DESC> Description: setear valor al campo </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> No Aplica </USAGE>
********************************************************************/
ib_converRef = ab_valor
of_SetRef(al_ref)
of_SetTalla(al_talla)
end subroutine

public subroutine of_setconverref (readonly boolean ab_valor);/********************************************************************
SA55169 - Ceiba/jjmonsal - 03-10-2016 FunctionName of_setConverRef
<DESC> Description: setear valor al campo </DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> No Aplica </USAGE>
********************************************************************/
ib_converRef = ab_valor
end subroutine

on n_cst_c_log_reccotizado.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_c_log_reccotizado.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;/***********************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015
Comentario:Modificacion Correo automatico desde Muestras
***********************************************************/
inv_log_reccotizado	= CREATE n_cst_log_reccotizado
inv_log_reccotizado.of_SetNombreDataObject('d_sq_gr_log_reccotizado')
ib_converRef = FALSE 
end event

event destructor;/***********************************************************
SA52045 - Ceiba/jjmonsal - 30-11-2015
Comentario: Destruir entidad 
***********************************************************/
IF IsValid(inv_log_reccotizado) THEN 
	Destroy inv_log_reccotizado
END IF 

end event

