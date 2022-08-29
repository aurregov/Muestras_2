HA$PBExportHeader$n_cst_parm_dw.sru
$PBExportComments$Parametros mas un vector de dw
forward
global type n_cst_parm_dw from nonvisualobject
end type
end forward

global type n_cst_parm_dw from nonvisualobject autoinstantiate
end type

type variables
datawindow idw_vector[]
long il_vector[]
end variables

on n_cst_parm_dw.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_parm_dw.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

