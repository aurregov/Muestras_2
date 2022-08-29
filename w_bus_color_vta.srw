HA$PBExportHeader$w_bus_color_vta.srw
forward
global type w_bus_color_vta from w_base_busqueda
end type
end forward

global type w_bus_color_vta from w_base_busqueda
integer width = 1362
string title = "B$$HEX1$$fa00$$ENDHEX$$squeda de Colores vta"
end type
global w_bus_color_vta w_bus_color_vta

type variables
n_tr_application itr_produrif
end variables

forward prototypes
public function integer of_retorno ()
public function integer of_conectar_bd ()
end prototypes

public function integer of_retorno ();
io_retorno.il_vector[1] = dw_1.GetItemNumber(il_fila,"co_color")
io_retorno.is_vector[1] = Trim(dw_1.GetItemString(il_fila,"de_color"))
Return 1
end function

public function integer of_conectar_bd ();/*
* ============================================================================
* MODIFICADO: Enero 17 de 2012 - ohlondon
* ----------------------------------------------------------------------------
* Se conecta a la base de datos produrif de crypor01 con los datos tomados del
* .ini del aplicativo. Seccion [fabrica].
* ============================================================================
*/

String       ls_passwd, ls_user, ls_dbms, ls_database, ls_servername, &
             ls_lock, ls_DBParm, ls_dsn, ls_path

ls_path = n_cst_application.is_pathfileconf

ls_dbms        = n_cst_application.of_GetProFile(ls_path, 'fabrica5', 'DBMS')
ls_database    = n_cst_application.of_GetProFile(ls_path, 'fabrica5', 'DATABASE')
ls_servername  = n_cst_application.of_GetProFile(ls_path, 'fabrica5', 'SERVERNAME')
ls_lock        = n_cst_application.of_GetProFile(ls_path, 'fabrica5', 'LOCK')
ls_DBParm      = n_cst_application.of_GetProFile(ls_path, 'fabrica5', 'DBPARM')		
ls_dsn		   = n_cst_application.of_GetProFile(ls_path, 'fabrica5', 'DSN')		

ls_passwd = n_cst_application.is_passwd 
ls_user   = n_cst_application.is_user	
ls_DBParm = "ConnectString='DSN=" + TRIM(ls_dsn) + ";UID=" + ls_user + ";PWD="+ ls_passwd + "'," + ls_DBParm

If itr_produrif.of_connectdb( ls_dbms, ls_database, ls_user, ls_passwd, &
										 ls_servername, ls_lock) <> 0 Then
	RETURN -1
END IF
RETURN 1

end function

on w_bus_color_vta.create
call super::create
end on

on w_bus_color_vta.destroy
call super::destroy
end on

event open;call super::open;itr_produrif = CREATE n_tr_application
	
IF of_conectar_bd( ) < 0 THEN CLOSE(THIS)

dw_1.of_conexion( itr_produrif, true)
// recupera con fab-lin-ref-tal-cal
dw_1.Retrieve(io_param.il_vector[1], io_param.il_vector[2], io_param.il_vector[3], io_param.il_vector[4], io_param.il_vector[5])
end event

type sle_1 from w_base_busqueda`sle_1 within w_bus_color_vta
end type

event sle_1::modified; 

of_filtro("de_color like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_bus_color_vta
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_bus_color_vta
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_bus_color_vta
end type

type dw_1 from w_base_busqueda`dw_1 within w_bus_color_vta
integer width = 1161
string dataobject = "d_dddw_colores_vta"
end type

type gb_1 from w_base_busqueda`gb_1 within w_bus_color_vta
integer width = 1280
string text = "Lista de Colores Vta"
end type

type gb_2 from w_base_busqueda`gb_2 within w_bus_color_vta
integer width = 1280
string text = "Color"
end type

