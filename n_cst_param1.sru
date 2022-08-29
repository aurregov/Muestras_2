HA$PBExportHeader$n_cst_param1.sru
$PBExportComments$Para mandar dos vectores de enteros
forward
global type n_cst_param1 from n_cst_param
end type
end forward

global type n_cst_param1 from n_cst_param
end type

type variables
Long          il_vector_centros[]
end variables

on n_cst_param1.create
call super::create
end on

on n_cst_param1.destroy
call super::destroy
end on

