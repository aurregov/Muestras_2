HA$PBExportHeader$n_cst_operacion.sru
forward
global type n_cst_operacion from nonvisualobject
end type
end forward

global type n_cst_operacion from nonvisualobject
end type
global n_cst_operacion n_cst_operacion

type variables
String   is_retorno[]
long     il_retorno[]
Decimal  ide_retorno[]
end variables

forward prototypes
public function long of_nombreoperacion (long a_tipoprod, long a_operacion, transaction a_transaction)
public function string of_getstring (long a_posicion)
public function integer of_nombreoperacioncentro (long a_tipoprod, long a_operacion, long a_centro, long a_subcentro, long a_centros_permiso[], transaction a_transaction)
end prototypes

public function long of_nombreoperacion (long a_tipoprod, long a_operacion, transaction a_transaction);String ls_dato

If IsNull(a_tipoprod) Or IsNull(a_operacion) Then
	Return -1
End If

  select m_operacio_ct.de_operacion  
    into :ls_dato  
    from m_operacio_ct  
   where ( m_operacio_ct.co_tipoprod = :a_tipoprod ) and  
         ( m_operacio_ct.co_operacion = :a_operacion )  
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

public function integer of_nombreoperacioncentro (long a_tipoprod, long a_operacion, long a_centro, long a_subcentro, long a_centros_permiso[], transaction a_transaction);String ls_dato
long ll_tot

If IsNull(a_tipoprod) Or IsNull(a_operacion) Then
	Return -1
End If

n_ds_application lds_1

lds_1=create n_ds_application

lds_1.Dataobject="d_operacion_centro_cons"

lds_1.SetTransObject(a_transaction)

ll_tot=lds_1.Retrieve(a_tipoprod,&
                      a_operacion,&
							 a_centro,&
							 a_subcentro,&
							 a_centros_permiso)
							 
If ll_tot<=0 Then
	Destroy lds_1
	Return -1
End If

ls_dato=trim(lds_1.GetItemString(1,"de_operacion"))

is_retorno[1]=ls_dato

Return 1
end function

on n_cst_operacion.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_operacion.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

