HA$PBExportHeader$n_cst_param.sru
$PBExportComments$Objeto que se pasa con argumentos entre otros objetos
forward
global type n_cst_param from nonvisualobject
end type
end forward

global type n_cst_param from nonvisualobject autoinstantiate
end type

type variables
Public:
             Long          il_vector[]
             String        is_vector[]
             Date          id_vector[]
             DateTime      idt_vector[]
             Dec           idec_vector[]

end variables

on n_cst_param.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_param.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

