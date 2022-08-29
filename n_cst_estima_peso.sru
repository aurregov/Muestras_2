HA$PBExportHeader$n_cst_estima_peso.sru
$PBExportComments$Objeto de Usuario para estimar el peso de los calcetines para los diferentes procesos
forward
global type n_cst_estima_peso from nonvisualobject
end type
end forward

global type n_cst_estima_peso from nonvisualobject
end type
global n_cst_estima_peso n_cst_estima_peso

forward prototypes
public function integer of_estimar_peso (long al_pares, long al_tamano, long al_mp, long al_talla)
end prototypes

public function integer of_estimar_peso (long al_pares, long al_tamano, long al_mp, long al_talla);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Miercoles 1 de Diciembre de 2004.H:17:06
---------------------------------------------------
Todavia no se tiene muy claro, podemos dejar una costante
luego utilizando algun sofisticado mecanismo en este metodo 
nos retorna el peso de los pares, y con este peso posteriormente
se determinan la maquina que se va a utilizar en tintorer$$HEX1$$ed00$$ENDHEX$$a
---------------------------------------------------*/
//-------------------------------------------------
Return 1
end function

on n_cst_estima_peso.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_estima_peso.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

