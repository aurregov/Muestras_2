HA$PBExportHeader$n_cst_c_materiales_sap.sru
forward
global type n_cst_c_materiales_sap from nonvisualobject
end type
end forward

global type n_cst_c_materiales_sap from nonvisualobject
end type
global n_cst_c_materiales_sap n_cst_c_materiales_sap

type variables
u_ds_base	ids_datos
Long 			il_fabrica, il_linea, il_muestrario
end variables

forward prototypes
public function datastore of_talla_referencia (readonly long al_referencia)
public function long of_existe_referencia (readonly long al_referencia)
public function long of_get_co_fabrica ()
public function long of_get_co_linea ()
public function long of_get_muestrario ()
public function datastore of_colores_sintalla (readonly long al_referencia, integer al_muestrario)
public function datastore of_colores_referencia (readonly long al_referencia, readonly long al_talla, readonly long al_muestrario, readonly long al_color)
public function u_ds_base of_tallas_muestrario_vigente (readonly long al_referencia, readonly long al_muestrario)
public function integer of_muestrario_muestra (readonly long al_referencia, readonly long al_talla, readonly long al_color)
public function u_ds_base of_muestrarios (readonly long al_referencia, readonly long al_talla, readonly long al_color)
public function integer of_lista_materiales (readonly long al_referencia, readonly long al_talla, readonly long al_color, readonly long al_muestrario)
public function u_ds_base of_get_ids_datos ()
end prototypes

public function datastore of_talla_referencia (readonly long al_referencia);//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_talla_referencia (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	recupera las tallas que posee las referencias
//-------------------------------------------------------------------------
// ARGUMENTO:	readonly long al_referencia 
// RETORNO	:	
//=========================================================================

String ls_select 

ids_datos.reset( )

ls_select = "	SELECT distinct co_fabrica, co_linea, co_talla_ref ~r~n"+&
				"	FROM dt_muestras_ref   ~r~n"+&
				"	WHERE co_referencia_ref = "+String(al_referencia)
				
ids_datos.DataObject = 'ddw_talla_ref'		
ids_datos.setsqlselect(ls_select)
ids_datos.settransobject(n_cst_application.itr_appl)

ids_datos.retrieve( )

IF ids_datos.Rowcount( ) > 0 THEN 
	il_fabrica = ids_datos.Object.co_fabrica[1]
	il_linea = ids_datos.Object.co_linea[1]
END IF

RETURN ids_datos 
end function

public function long of_existe_referencia (readonly long al_referencia);//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_existe_referencia (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	verificacion si la referencia existe y pueda ser consultada.
//-------------------------------------------------------------------------
// ARGUMENTO:	readonly long al_referencia 
// RETORNO	:	
//=========================================================================

Long ll_existe

SELECT count(*)
INTO :ll_existe
FROM dt_muestras_ref  
WHERE co_referencia_ref = :al_referencia
Using n_cst_application.itr_appl;

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

RETURN ll_existe
end function

public function long of_get_co_fabrica ();//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_get_co_fabrica (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	retornar el co_fabrica
//-------------------------------------------------------------------------
// ARGUMENTO:	(none)
// RETORNO	:	
//=========================================================================

RETURN il_fabrica
end function

public function long of_get_co_linea ();//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_get_co_linea (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	retornar el co_linea
//-------------------------------------------------------------------------
// ARGUMENTO:	(none)
// RETORNO	:	
//=========================================================================

RETURN il_linea
end function

public function long of_get_muestrario ();//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_get_muestrario (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	retornar el muestrario 
//-------------------------------------------------------------------------
// ARGUMENTO:	(none)
// RETORNO	:	
//=========================================================================

RETURN il_muestrario
end function

public function datastore of_colores_sintalla (readonly long al_referencia, integer al_muestrario);//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_colores_sintalla (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	
//-------------------------------------------------------------------------
// ARGUMENTO:	readonly long al_referencia, integer al_muestrario 
// RETORNO	:	
//=========================================================================

String ls_select 

ids_datos.reset( )

ls_select = "	SELECT distinct h_fmp_muestras.co_color, ~r~n"+&
				"	( SELECT m_colores.de_color from m_colores ~r~n"+&
				"	 WHERE m_colores.co_fabrica = h_fmp_muestras.co_fabrica ~r~n"+&
				"	 AND m_colores.co_linea = h_fmp_muestras.co_linea  ~r~n"+&
				"	 AND m_colores.co_color = h_fmp_muestras.co_color ) nombrecolor ~r~n"+&
				"	FROM h_fmp_muestras, dt_muestras_ref ~r~n"+&
				"	WHERE h_fmp_muestras.co_fabrica = dt_muestras_ref.co_fabrica   ~r~n"+&
				"	AND h_fmp_muestras.co_linea = dt_muestras_ref.co_linea    ~r~n"+&
				"	AND h_fmp_muestras.co_muestra = dt_muestras_ref.co_muestra   ~r~n"+&
				"	AND h_fmp_muestras.co_talla = dt_muestras_ref.co_talla   ~r~n"+&				
				"	AND cnt_opcion = 1 ~r~n"+&
				"	AND CO_DISENO = 1 ~r~n" +&
				"	AND co_referencia_ref = "+String(al_referencia)+'~r~n'
	
IF Not IsNull(al_muestrario) OR al_muestrario <> 0 THEN
	ls_select += "	AND h_fmp_muestras.co_muestrario = "+String(al_muestrario)+'~r~n'
END IF

ids_datos.DataObject = 'ddw_color_ref'
ids_datos.setsqlselect(ls_select)
ids_datos.settransobject(n_cst_application.itr_appl)
ids_datos.retrieve( )

RETURN ids_datos
end function

public function datastore of_colores_referencia (readonly long al_referencia, readonly long al_talla, readonly long al_muestrario, readonly long al_color);//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_colores_referencia (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	creacion del select para la recuperacion de los colores que se 
//					tienen para la referencia.
//-------------------------------------------------------------------------
// ARGUMENTO:	readonly long al_referencia, readonly long al_talla, readonly long al_muestrario, readonly long al_color 
// RETORNO	:	
//=========================================================================

String ls_select 

ids_datos.reset( )

ls_select = "	SELECT distinct h_fmp_muestras.co_color, ~r~n"+&
				"	( SELECT trim(m_colores.de_color) from m_colores ~r~n"+&
				"	 WHERE m_colores.co_fabrica = h_fmp_muestras.co_fabrica ~r~n"+&
				"	 AND m_colores.co_linea = h_fmp_muestras.co_linea  ~r~n"+&
				"	 AND m_colores.co_color = h_fmp_muestras.co_color ) ||' ('||h_fmp_muestras.co_color||')' nombrecolor ~r~n"+&
				"	FROM h_fmp_muestras, dt_muestras_ref ~r~n"+&
				"	WHERE h_fmp_muestras.co_fabrica = dt_muestras_ref.co_fabrica   ~r~n"+&
				"	AND h_fmp_muestras.co_linea = dt_muestras_ref.co_linea    ~r~n"+&
				"	AND h_fmp_muestras.co_muestra = dt_muestras_ref.co_muestra   ~r~n"+&
				"	AND h_fmp_muestras.co_talla = dt_muestras_ref.co_talla   ~r~n"+&				
				"	AND cnt_opcion = 1 ~r~n"+&
				"	AND CO_DISENO = 1 ~r~n" +&
				"	AND co_referencia_ref = "+String(al_referencia)+'~r~n'
				
IF Not IsNull(al_talla) OR al_talla <> 0 THEN	
	ls_select += "	AND dt_muestras_ref.co_talla = "+String(al_talla)+'~r~n'
END IF
	
IF Not IsNull(al_muestrario) OR al_muestrario <> 0 THEN	
	ls_select += "	AND h_fmp_muestras.co_muestrario = "+String(al_muestrario)+'~r~n'
END IF

IF Not IsNull(al_color) OR al_color <> 0 THEN	
	ls_select += "	AND h_fmp_muestras.co_color = "+String(al_color)+'~r~n'
END IF


				
ids_datos.DataObject = 'ddw_color_ref'		
ids_datos.setsqlselect(ls_select)
ids_datos.settransobject(n_cst_application.itr_appl)

ids_datos.retrieve( )

RETURN ids_datos


end function

public function u_ds_base of_tallas_muestrario_vigente (readonly long al_referencia, readonly long al_muestrario);//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_tallas_muestrario_vigente (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	trae las tallas para el muestrario vigente de la fabrica linea
//-------------------------------------------------------------------------
// ARGUMENTO:	readonly long al_referencia, readonly long al_muestrario 
// RETORNO	:	
//=========================================================================


String ls_select

ids_datos.reset( )

ls_select = "	SELECT distinct ref.co_fabrica, ref.co_linea, ref.co_talla_ref, ref.co_talla_ref co_talla_ref2  ~r~n"+&
				"	FROM dt_muestras_ref ref, h_fmp_muestras mue ~r~n"+&
				" WHERE ref.co_referencia_ref = "+String(al_referencia)+" ~r~n "+&
				" AND ref.co_fabrica = mue.co_fabrica ~r~n "+&
				" AND ref.co_linea = mue.co_linea ~r~n "+&
				" AND ref.co_muestra = mue.co_muestra ~r~n "
				
IF Not IsNull(al_muestrario) AND al_muestrario <> 0 THEN
	ls_select += " AND mue.co_muestrario = " +String(al_muestrario)+" ~r~n"
END IF

ls_select += " GROUP BY ref.co_fabrica, ref.co_linea, ref.co_talla_ref ~r~n " 
				
				
ids_datos.DataObject = 'ddw_talla_ref'		
ids_datos.setsqlselect(ls_select)
ids_datos.settransobject(n_cst_application.itr_appl)

ids_datos.retrieve( )

IF ids_datos.Rowcount( ) > 0 THEN 
	il_fabrica = ids_datos.Object.co_fabrica[1]
	il_linea = ids_datos.Object.co_linea[1]
END IF

RETURN ids_datos 
end function

public function integer of_muestrario_muestra (readonly long al_referencia, readonly long al_talla, readonly long al_color);//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_muestrario_muestra (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	
//-------------------------------------------------------------------------
// ARGUMENTO:	readonly long al_referencia, readonly long al_talla, readonly long al_color 
// RETORNO	:	
//=========================================================================

String ls_select
u_ds_base		lds_datos
lds_datos		= CREATE u_ds_base

lds_datos.dataobject = 'd_cons_muestrario'
ls_select = lds_datos.getsqlselect( )

IF Not IsNull(al_referencia) THEN
	ls_select += ' AND dt_muestras_ref.co_referencia_ref = '+String(al_referencia)+'~r~n '
END IF

IF Not IsNull(al_talla) THEN
	ls_select += ' AND dt_muestras_ref.co_talla_ref = '+String(al_talla)+'~r~n '
END IF

IF Not IsNull(al_color) THEN
	ls_select += ' AND dt_muestras_ref.co_referencia_ref = '+String(al_color)+'~r~n '
END IF

ls_select += 'ORDER BY h_fmp_muestras.co_muestrario'

IF Not IsNull(ls_select) THEN
	lds_datos.SetSqlselect( ls_select)
ELSE
//	MessageBox
end if


RETURN 1
end function

public function u_ds_base of_muestrarios (readonly long al_referencia, readonly long al_talla, readonly long al_color);//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_muestrarios (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	
//-------------------------------------------------------------------------
// ARGUMENTO:	readonly long al_referencia, readonly long al_talla, readonly long al_color 
// RETORNO	:	
//=========================================================================

String ls_condicion, ls_select

IF Not IsNull(al_referencia) THEN
	ls_condicion += ' AND dt_muestras_ref.co_referencia_ref = '+String(al_referencia)+'~r~n '
END IF

IF Not IsNull(al_talla) THEN
	ls_condicion += ' AND dt_muestras_ref.co_talla_ref = '+String(al_talla)+'~r~n '
END IF

IF Not IsNull(al_color) THEN
	ls_condicion += ' AND h_fmp_muestras.co_color = '+String(al_color)+'~r~n '
END IF

ls_condicion += 'ORDER BY h_fmp_muestras.co_muestrario'

IF Not IsNull(ls_select) THEN
	ids_datos.SetSqlselect( ls_select)
END IF

ids_datos.dataobject = 'ddw_muestrario_matsap'
ls_select = ids_datos.getsqlselect( )
ls_select = ls_select + ls_condicion
ids_datos.SetSqlselect( ls_select)
ids_datos.setTransobject(n_cst_application.itr_appl)
ids_datos.Retrieve( )

RETURN ids_datos
end function

public function integer of_lista_materiales (readonly long al_referencia, readonly long al_talla, readonly long al_color, readonly long al_muestrario);//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_lista_materiales (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	select de la lista de los materiales
//-------------------------------------------------------------------------
// ARGUMENTO:	readonly long al_referencia, readonly long al_talla, readonly long al_color, readonly long al_muestrario 
// RETORNO	:	
//=========================================================================

String ls_select1, ls_select2, ls_selectTotal
	
ls_select1 = 	' SELECT DISTINCT "cierra" tiporecurso, mue.co_muestra, ref.co_referencia_ref, mmue.de_muestra,  ref.co_talla, ~r~n'+&
					'			mue.co_reccotcierra,(SELECT trim(de_modelo[1,21])||" ("||diam_cilindro||"x"||ca_aguja||"-"||nu_galga||")" as descripcion   ~r~n'+&
					'								 FROM m_recursos_tj   ~r~n'+&
					'								 WHERE m_recursos_tj.co_recurso = mue.co_reccotcierra) descrecurso, "1" Reccierra, "2" listaMaterial, co_estreccierra, mue.co_fabrica, mue.co_linea, " " est, ( select Max(co_muestrario) ~r~n'+&
					'																																																													FROM h_fmp_muestras interno	 ~r~n'+&
					'																																																													WHERE interno.co_linea = encmue.co_linea  ~r~n'+&
					'																																																													AND interno.co_fabrica = encmue.co_fabrica  ~r~n'+&
					'																																																													AND interno.co_muestra = encmue.co_muestra  ~r~n'+&
					'																																																													AND interno.co_recurso = encmue.co_recurso ~r~n'+&
					'																																																										         AND interno.co_color   = encmue.co_color ) co_muestrario ~r~n'+&
					' FROM 	dt_muestras_ref ref, dt_muestras mue, h_fmp_muestras encmue, m_muestras mmue ~r~n'+&
					' WHERE 	mmue.co_linea = mue.co_linea ~r~n'+&
					' AND mmue.co_fabrica = mue.co_fabrica ~r~n'+&
					' AND mmue.co_muestra = mue.co_muestra ~r~n'+&
					' AND encmue.co_muestrario IN (	SELECT h_fmp_muestras.co_muestrario ~r~n'+&
					'										 FROM h_fmp_muestras,  ~r~n'+&
					'												dt_muestras_ref  ~r~n'+&
					'										WHERE h_fmp_muestras.co_fabrica = dt_muestras_ref.co_fabrica ~r~n'+&
					'										AND 	dt_muestras_ref.co_linea = h_fmp_muestras.co_linea ~r~n'+&
					'										AND 	dt_muestras_ref.co_muestra = h_fmp_muestras.co_muestra ~r~n'+&
					'										AND 	dt_muestras_ref.co_talla = h_fmp_muestras.co_talla ~r~n'+&
					'										AND 	h_fmp_muestras.co_fabrica = h_fmp_muestras.co_fabrica ~r~n'+&
					'										AND 	h_fmp_muestras.co_diseno = 1 ~r~n'+&
					'										AND dt_muestras_ref.co_referencia_ref = ref.co_referencia_ref ~r~n'+&
					'										AND dt_muestras_ref.co_talla_ref = encmue.co_talla ~r~n'+&
					'										AND h_fmp_muestras.co_color = encmue.co_color) ~r~n'+&
					' AND encmue.co_talla = mue.co_talla ~r~n'+&
					' AND encmue.co_linea = mue.co_linea ~r~n'+&
					' AND encmue.co_fabrica = mue.co_fabrica ~r~n'+&
					' AND encmue.co_muestra = mue.co_muestra ~r~n'+&
					' AND encmue.co_recurso = mue.co_reccotcierra ~r~n'+&
					' AND mue.co_reccotcierra IS NOT NULL ~r~n'+&
					' AND mue.co_linea = ref.co_linea ~r~n'+&
					' AND mue.co_fabrica = ref.co_fabrica ~r~n'+&
					' AND mue.co_muestra = ref.co_muestra ~r~n'+&
					' AND ref.co_referencia_ref = '+String(al_referencia)+' ~r~n'
					

ls_select2 = 	' SELECT DISTINCT "no cierra" tiporecurso, mue.co_muestra, ref.co_referencia_ref, mmue.de_muestra, ref.co_talla, ~r~n'+&
					' mue.co_reccotnocierra,(SELECT trim(de_modelo[1,21])||" ("||diam_cilindro||"x"||ca_aguja||"-"||nu_galga||")" as descripcion   ~r~n'+&
					'     							   FROM m_recursos_tj   ~r~n'+&
					'    								   WHERE m_recursos_tj.co_recurso = mue.co_reccotnocierra) descrecurso, ~r~n'+&
					'  			"0" Reccierra, DECODE((SELECT Count(co_fabrica) ~r~n'+&
					' 									FROM h_fmp_muestras intmuestra ~r~n'+&
					' 									WHERE intmuestra.co_muestra 	= mue.co_muestra ~r~n'+&
					' 									AND intmuestra.co_fabrica 		= mue.co_fabrica ~r~n'+&
					' 									AND intmuestra.co_linea 		= mue.co_linea ~r~n'+&
					' 									AND intmuestra.co_recurso 		= mue.co_reccotnocierra ~r~n'+&
					' 									GROUP BY intmuestra.co_fabrica),null,"2","1") listaMaterial, co_estrecnocierra, mue.co_fabrica, mue.co_linea, " " est, ( select Max(co_muestrario) ~r~n'+&
					'																																																	FROM h_fmp_muestras interno	 ~r~n'+&
					'																																																	WHERE interno.co_linea = encmue.co_linea  ~r~n'+&
					'																																																	AND interno.co_fabrica = encmue.co_fabrica  ~r~n'+&
					'																																																	AND interno.co_muestra = encmue.co_muestra  ~r~n'+&
					'																																																	AND interno.co_recurso = encmue.co_recurso ~r~n'+&
					'																																																	AND interno.co_color   = encmue.co_color) co_muestrario ~r~n'+&
					' FROM 	dt_muestras_ref ref, dt_muestras mue, h_fmp_muestras encmue, m_muestras mmue ~r~n'+&
					' WHERE 	mmue.co_linea = mue.co_linea ~r~n'+&
					' AND mmue.co_fabrica = mue.co_fabrica ~r~n'+&
					' AND mmue.co_muestra = mue.co_muestra ~r~n'+&
					' AND encmue.co_muestrario IN (	SELECT h_fmp_muestras.co_muestrario ~r~n'+&
					'										 FROM h_fmp_muestras,  ~r~n'+&
					'												dt_muestras_ref  ~r~n'+&
					'										WHERE h_fmp_muestras.co_fabrica = dt_muestras_ref.co_fabrica ~r~n'+&
					'										AND 	dt_muestras_ref.co_linea = h_fmp_muestras.co_linea ~r~n'+&
					'										AND 	dt_muestras_ref.co_muestra = h_fmp_muestras.co_muestra ~r~n'+&
					'										AND 	dt_muestras_ref.co_talla = h_fmp_muestras.co_talla ~r~n'+&
					'										AND 	h_fmp_muestras.co_fabrica = h_fmp_muestras.co_fabrica ~r~n'+&
					'										AND 	h_fmp_muestras.co_diseno = 1 ~r~n'+&
					'										AND dt_muestras_ref.co_referencia_ref = ref.co_referencia_ref ~r~n'+&
					'										AND dt_muestras_ref.co_talla_ref = encmue.co_talla ~r~n'+&
					'										AND h_fmp_muestras.co_color = encmue.co_color) ~r~n'+&
					' AND encmue.co_talla = mue.co_talla ~r~n'+&
					' AND encmue.co_linea = mue.co_linea ~r~n'+&
					' AND encmue.co_fabrica = mue.co_fabrica ~r~n'+&
					' AND encmue.co_muestra = mue.co_muestra ~r~n'+&
					' AND encmue.co_recurso = mue.co_reccotnocierra ~r~n'+&
					' AND mue.co_reccotnocierra IS NOT NULL ~r~n'+&
					' AND mue.co_linea = ref.co_linea ~r~n'+&
					' AND mue.co_fabrica = ref.co_fabrica ~r~n'+&
					' AND mue.co_muestra = ref.co_muestra ~r~n'+&
					' AND ref.co_referencia_ref = '+String(al_referencia)+' ~r~n'

				  
IF Not IsNull(al_muestrario) AND String(al_muestrario,'') <> '' AND al_muestrario <> 0 THEN
	ls_select1 += ' AND encmue.co_muestrario = '+String(al_muestrario)+'~r~n'
	ls_select2 += ' AND encmue.co_muestrario = '+String(al_muestrario)+'~r~n'
END IF

IF Not IsNull(al_talla) AND String(al_talla,'') <> '' THEN
	ls_select1 += ' AND ref.co_talla = '+String(al_talla)+'~r~n'
	ls_select2 += ' AND ref.co_talla = '+String(al_talla)+'~r~n'
END IF

IF Not IsNull(al_color) AND String(al_color,'') <> '' THEN
	ls_select1 += ' AND encmue.co_color = '+String(al_color)+'~r~n'
	ls_select2 += ' AND encmue.co_color = '+String(al_color)+'~r~n'
END IF

ls_selectTotal = ls_select1 +' UNION ALL ~r~n'+ ls_select2+' ORDER BY ref.co_talla ~r~n'

ids_datos.dataobject = 'd_lista_materiales_sap'
ids_datos.SetSqlSelect(ls_selectTotal)
ids_datos.settransobject( n_cst_application.itr_appl)
ids_datos.retrieve( )

RETURN 1
end function

public function u_ds_base of_get_ids_datos ();//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_get_ids_datos (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	retornar todos los datos que se tienen en el datastore
//-------------------------------------------------------------------------
// ARGUMENTO:	(none)
// RETORNO	:	
//=========================================================================

RETURN ids_datos
end function

on n_cst_c_materiales_sap.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_c_materiales_sap.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;ids_datos		= CREATE u_ds_base

end event

