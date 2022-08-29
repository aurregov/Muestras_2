HA$PBExportHeader$u_ds_base.sru
forward
global type u_ds_base from datastore
end type
end forward

global type u_ds_base from datastore
end type
global u_ds_base u_ds_base

on u_ds_base.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_ds_base.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event sqlpreview;//=========================================================================
// M$$HEX1$$c900$$ENDHEX$$TODO	:	sqlpreview (event)
// ESTADO	:	[X]Origen	[]Extend	[]Override
//-------------------------------------------------------------------------
// FECHA		:	Abril 22 de 2014 - Iv$$HEX1$$e100$$ENDHEX$$n Andr$$HEX1$$e900$$ENDHEX$$s Escobar
// OBJETIVO	:	muestra el SQL que se va a ejecutar en el datastore.
//-------------------------------------------------------------------------
// ARGUMENTO:	sqlpreviewfunction request, sqlpreviewtype sqltype, string sqlsyntax, dwbuffer buffer, long row 
// RETORNO	:	long [pbm_dwnsql]
//=========================================================================

String sqlpreview 
sqlpreview = sqlSyntax
end event

event dberror;String ls_error 

ls_error = String(sqldbcode)
ls_error +='   '+String(sqlerrtext)
ls_error +='   '+String(sqlSyntax)
end event

