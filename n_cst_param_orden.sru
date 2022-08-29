HA$PBExportHeader$n_cst_param_orden.sru
forward
global type n_cst_param_orden from n_cst_param
end type
end forward

global type n_cst_param_orden from n_cst_param
end type

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 1 de Diciembre de 2004.H:09:03
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
PUBLIC:
	n_ds_application 		ids_vector[]
	n_cst_estima_tiempo	iou_estima_vector[]
	Boolean					ib_vector[]
	u_dw_application     idw_vector[]
end variables

on n_cst_param_orden.create
call super::create
end on

on n_cst_param_orden.destroy
call super::destroy
end on

