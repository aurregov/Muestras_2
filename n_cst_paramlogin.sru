HA$PBExportHeader$n_cst_paramlogin.sru
$PBExportComments$Objeto para parametrizar el login de la aplicaci$$HEX1$$f300$$ENDHEX$$n
forward
global type n_cst_paramlogin from nonvisualobject
end type
end forward

global type n_cst_paramlogin from nonvisualobject autoinstantiate
end type

type variables
Public:
            String         is_pathfile
            String         is_sessiondb
            String         is_user
            String         is_password
            String         is_dbms
            String         is_database
            String         is_servername
            String         is_lock
            Integer        ii_perfil
            Integer        ii_application
            n_tr_base      itr_conexion
            Boolean        ib_sucessful
            
end variables

on n_cst_paramlogin.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_paramlogin.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

