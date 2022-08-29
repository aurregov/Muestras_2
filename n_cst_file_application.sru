HA$PBExportHeader$n_cst_file_application.sru
$PBExportComments$objeto de la aplicaci$$HEX1$$f300$$ENDHEX$$n para el manejo de los archivos del sistema
forward
global type n_cst_file_application from n_cst_file_base
end type
end forward

global type n_cst_file_application from n_cst_file_base
end type

on n_cst_file_application.create
TriggerEvent( this, "constructor" )
end on

on n_cst_file_application.destroy
TriggerEvent( this, "destructor" )
end on

