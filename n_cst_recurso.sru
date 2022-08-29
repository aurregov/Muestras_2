HA$PBExportHeader$n_cst_recurso.sru
forward
global type n_cst_recurso from nonvisualobject
end type
end forward

global type n_cst_recurso from nonvisualobject
end type
global n_cst_recurso n_cst_recurso

type variables
String   is_retorno[]
long     il_retorno[]
Decimal  ide_retorno[]
Boolean	ib_cierra
end variables

forward prototypes
public function string of_getstring (long a_posicion)
public function long of_nombrerecursotj (long a_recurso, transaction a_transaction)
public function integer of_nombrerecursopdn (long a_tipo_prod, long a_centro, long a_subcentro, long a_recurso, transaction a_transaction)
public function integer of_validar_cierra_nocierra (readonly long al_recurso)
public function boolean of_get_cierra ()
end prototypes

public function string of_getstring (long a_posicion);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 05 de Diciembre de 2002 HORA 14:43:38:671
// 
// Retorna el dato de una posicion especifica
//////////////////////////////////////////////////////////////////////////

String 	ls_retorno

If UpperBound(is_retorno)>=a_posicion Then
	ls_retorno=is_retorno[a_posicion]
End If

Return ls_retorno
end function

public function long of_nombrerecursotj (long a_recurso, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 04 de Diciembre de 2002 HORA 11:50:13:687
// 
// 
//////////////////////////////////////////////////////////////////////////


String ls_dato

If IsNull(a_recurso) Then
	Return -1
End If


  select trim(de_modelo[1,21])||" ("||diam_cilindro||"x"||ca_aguja||"-"||nu_galga||")" as descripcion  
    into :ls_dato  
    from m_recursos_tj  
   where ( m_recursos_tj.co_recurso = :a_recurso ) 
         using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombrerecursopdn (long a_tipo_prod, long a_centro, long a_subcentro, long a_recurso, transaction a_transaction);

String ls_dato

If IsNull(a_tipo_prod) or IsNull(a_centro) or &
   IsNull(a_subcentro) or IsNull(a_recurso)Then
	Return -1
End If

  SELECT m_recursos_pdn.de_recurso  
	 into :ls_dato 		
    FROM m_recursos_pdn  
   WHERE ( m_recursos_pdn.co_tipoprod = :a_tipo_prod ) AND  
         ( m_recursos_pdn.co_centro = :a_centro ) AND  
         ( m_recursos_pdn.co_subcentro = :a_subcentro ) and
			( m_recursos_pdn.co_recurso = :a_recurso )
         using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_validar_cierra_nocierra (readonly long al_recurso);//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	of_validar_cierra_nocierra (function)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Diciembre 3 de 2013 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	validar si el recurso que se esta enviando por parametro 
//					cierra o no cierra el calcetin.
//-------------------------------------------------------------------------
// ARGUMENTO:	readonly long al_recurso 
// RETORNO	:	integer
//=========================================================================
Long ll_filas 


n_ds_base		lds_datos
lds_datos			= CREATE n_ds_base


lds_datos.dataobject = 'd_nv_recursos_tj'
lds_datos.settransobject( n_cst_application.itr_appl)
lds_datos.Retrieve(al_recurso)

ll_filas = lds_datos.Rowcount( )

IF ll_filas > 0 THEN	
	IF TRIM(String(lds_datos.Object.sw_cierra[1],'')) = '1' THEN
		ib_cierra = TRUE
	ELSE
		ib_cierra = FALSE
	END IF
END IF 

RETURN ll_filas
end function

public function boolean of_get_cierra ();RETURN ib_cierra
end function

on n_cst_recurso.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_recurso.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

