HA$PBExportHeader$w_m_familias.srw
forward
global type w_m_familias from w_simple
end type
end forward

global type w_m_familias from w_simple
integer width = 2971
integer height = 2156
string title = "Mantenimiento de Familias"
boolean minbox = false
end type
global w_m_familias w_m_familias

type variables
n_tr_application	itr_produrif
end variables

forward prototypes
public function integer of_conectar_bd ()
end prototypes

public function integer of_conectar_bd ();/*
* ============================================================================
* MODIFICADO: Julio 29 de 2011 - ohlondon
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

event open;call super::open;/*
* ============================================================================
* MODIFICADO: Julio 29 de 2011 - ohlondon
* ----------------------------------------------------------------------------
* Mantenimiento de familias m_familias en produrif@crypro01 de sabdbs01
* ============================================================================
*/
m_base lm_menu

lm_menu = This.MenuId

lm_menu.m_archivo.m_guardarcomo.visible = TRUE
lm_menu.m_archivo.m_guardarcomo.toolbaritemvisible = TRUE
//lm_menu.m_edicion.m_insertar.visible = FALSE
//lm_menu.m_edicion.m_insertar.toolbaritemvisible = FALSE
//lm_menu.m_edicion.m_clear.visible = FALSE
//lm_menu.m_edicion.m_clear.toolbaritemvisible = FALSE

this.x = 1
this.y = 1
itr_produrif = CREATE n_tr_application
	
IF of_conectar_bd( ) < 0 THEN CLOSE(THIS)

dw_general.of_conexion( itr_produrif, true)
end event

on w_m_familias.create
call super::create
end on

on w_m_familias.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event closequery;call super::closequery;itr_produrif.of_disconnect( )
end event

type dw_general from w_simple`dw_general within w_m_familias
integer y = 60
integer width = 2816
integer height = 1876
string dataobject = "dgr_m_familias"
end type

event dw_general::ue_update;Long         ll_i,ll_n
dwItemStatus l_status

If This.of_CompleteData() Then
	//Tambien actualizar fecha,usuario,instancia
	If Not n_cst_application.of_SelectServer(itr_produrif,&
													 idt_fecha,is_usuario,is_instancia) Then
		Return
	End If
	ll_n = This.RowCount()
	For ll_i = 1 To ll_n
		l_status = This.GetItemStatus(ll_i,0,Primary!)
		If l_status <> NotModified! Then
			//si el DataWindow tiene fe_actualizacion,usuario,instancia
			//entonces actualizarlas
			If This.of_ExistColumn('fe_actualizacion') Then
				This.SetItem(ll_i,'fe_actualizacion',idt_fecha)
			End If
			If This.of_ExistColumn('usuario') Then
				This.SetItem(ll_i,'usuario',is_usuario)
			End If	
			If This.of_ExistColumn('instancia') Then
				This.SetItem(ll_i,'instancia',is_instancia)
			End If	
		End If
	Next
	If This.Update(True) = 1 Then
		Commit Using itr_produrif;
		MessageBox("$$HEX1$$a100$$ENDHEX$$Grabaci$$HEX1$$f300$$ENDHEX$$n Existosa!","Los datos se han registrado satisfactoriamente.")
	Else
		RollBack Using itr_produrif;
		MessageBox("Error","$$HEX1$$a100$$ENDHEX$$Se ha producido un error actualizando los datos!",StopSign!)
	End If
End If	
This.SetFocus()
end event

type gb_general from w_simple`gb_general within w_m_familias
integer x = 27
integer y = 4
integer width = 2898
integer height = 1956
end type

