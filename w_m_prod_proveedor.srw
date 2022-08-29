HA$PBExportHeader$w_m_prod_proveedor.srw
$PBExportComments$Ventana para el mantenimiento que relaciona en m_prod_proveedor el producto con el Material SAP.~r~nHace uso de la dw d_m_prod_proveedor de muestrasdw.pbl
forward
global type w_m_prod_proveedor from w_simple
end type
end forward

global type w_m_prod_proveedor from w_simple
integer width = 3520
integer height = 1904
string title = "Equivalencia Material SAP"
end type
global w_m_prod_proveedor w_m_prod_proveedor

type variables
n_tr_application	itr_transdb2
end variables

forward prototypes
public function integer of_conectar_db2 ()
public function integer of_validar_material (string as_co_material)
end prototypes

public function integer of_conectar_db2 ();/*
* ============================================================================
* MODIFICADO: Mayos 05 de 2010 - ohlondon
* ----------------------------------------------------------------------------
* Se conecta a la base de datos ordenes de DB2 con los datos tomados del
* .ini del aplicativo. Seccion [bd ordensdb2].
* ============================================================================
*/

String       ls_passwd, ls_user, ls_dbms, ls_database, ls_servername, &
             ls_lock, ls_DBParm, ls_dsn, ls_path

ls_path = n_cst_application.is_pathfileconf

ls_dbms        = n_cst_application.of_GetProFile(ls_path, 'bd ordenesdb2', 'DBMS')
ls_database    = n_cst_application.of_GetProFile(ls_path, 'bd ordenesdb2', 'DATABASE')
ls_servername  = n_cst_application.of_GetProFile(ls_path, 'bd ordenesdb2', 'SERVERNAME')
ls_lock        = n_cst_application.of_GetProFile(ls_path, 'bd ordenesdb2', 'LOCK')
ls_DBParm      = n_cst_application.of_GetProFile(ls_path, 'bd ordenesdb2', 'DBPARM')		
ls_dsn		     = n_cst_application.of_GetProFile(ls_path, 'bd ordenesdb2', 'DSN')		

ls_passwd = n_cst_application.is_passwd 
ls_user   = n_cst_application.is_user	
ls_DBParm = "ConnectString='DSN=" + TRIM(ls_dsn) + ";UID=" + ls_user + ";PWD="+ ls_passwd + "'," + ls_DBParm

If itr_transdb2.of_connect_db2(ls_dbms, ls_database, ls_user, ls_passwd, &
										 ls_servername, ls_lock, ls_DBParm) <> 0 Then
	RETURN -1
END IF
RETURN 1

end function

public function integer of_validar_material (string as_co_material);/*
* ============================================================================
* MODIFICADO: Mayos 04 de 2010 - ohlondon
* ----------------------------------------------------------------------------
* Se busca el codigo de materia conectado a la base de datos ordenes de DB2
* ============================================================================
*/
String ls_exite

select co_material
  into :ls_exite
  from m_material  
 where co_material = :as_co_material
 using itr_transdb2 ;

If itr_transdb2.SqlCode <= -1 Then
	MessageBox("Advertencia!","Hubo un error al consultar el material.~n~nNota: " + itr_transdb2.SqlErrText )
	Return -1
ElseIf itr_transdb2.SqlCode = 100 Then
	MessageBox("Advertencia!","El material " + as_co_material + " no existe. Por favor verifique.")
	Return 0
End If

RETURN 1

end function

on w_m_prod_proveedor.create
call super::create
end on

on w_m_prod_proveedor.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;/*
* ============================================================================
* MODIFICADO: Mayos 06 de 2010 - ohlondon
* ----------------------------------------------------------------------------
* Mantenimiento de equivalencias de producto con material SAP, y Matriz 
* ============================================================================
*/
m_base lm_menu

lm_menu = This.MenuId

lm_menu.m_archivo.m_guardarcomo.visible = TRUE
lm_menu.m_archivo.m_guardarcomo.toolbaritemvisible = TRUE
lm_menu.m_edicion.m_insertar.visible = FALSE
lm_menu.m_edicion.m_insertar.toolbaritemvisible = FALSE
lm_menu.m_edicion.m_clear.visible = FALSE
lm_menu.m_edicion.m_clear.toolbaritemvisible = FALSE

this.x = 1
this.y = 1
itr_transdb2 = CREATE n_tr_application

IF of_conectar_db2( ) < 0 THEN CLOSE(THIS)
end event

event closequery;call super::closequery;itr_transdb2.of_disconnect( )
end event

type dw_general from w_simple`dw_general within w_m_prod_proveedor
integer y = 76
integer width = 3365
integer height = 1600
string dataobject = "d_gr_m_prod_proveedor"
end type

event dw_general::ue_find;/*
* ============================================================================
* MODIFICADO: Mayos 03 de 2010 - ohlondon
* ----------------------------------------------------------------------------
* 
* Los datos digitados estan en este orden
*   "co_producto_mp" 		lou_param.il_vector[1]
*   "calidad_mp"	  			lou_param.il_vector[2]
*   "co_matiz_mp" 			lou_param.il_vector[3]
*   "co_caracteristi_mp"	lou_param.il_vector[4]
*   "co_color_mp" 			lou_param.il_vector[5]
*   "de_producto"       	lou_param.is_vector[1]
* 
* ============================================================================
*/
n_cst_param lou_param

String ls_where
String ls_error
String ls_cad

ls_where = ' and '

// Se abre w_opc_prod_proveedor (de muestrasw.pbl) para pedir los
// parametros de filtro para la consulta
Open(w_opc_prod_proveedor)
lou_param = Message.PowerObjectParm
  	
IF IsValid(lou_param) THEN  
	ls_cad=String(lou_param.il_vector[1])
	
	IF Not IsNull(ls_cad) THEN
		ls_where+="m_prod_proveedor.co_producto = "+ls_cad+" and "
	End If
	
	ls_cad=String(lou_param.il_vector[2])
	
	IF Not IsNull(ls_cad) THEN
		ls_where+="m_prod_proveedor.calidad = "+ls_cad+" and "
	End If
	
	ls_cad=String(lou_param.il_vector[3])
	
	IF Not IsNull(ls_cad) THEN
		ls_where+="m_prod_proveedor.co_matiz="+ls_cad+" and "
	End If

	ls_cad=String(lou_param.il_vector[4])
	
	IF Not IsNull(ls_cad) THEN
		ls_where+="m_prod_proveedor.co_caracteristica="+ls_cad+" and "
	End If

	ls_cad=String(lou_param.il_vector[5])
	 
	IF Not IsNull(ls_cad) THEN
		ls_where+="m_prod_proveedor.co_color="+ls_cad+" and "
	End If   

	ls_cad=Trim(lou_param.is_vector[1])
	
	IF Not IsNull(ls_cad) THEN
		ls_where+="m_matprimas.de_producto like ~~'%"+ls_cad+"%~~' and "
	End If        	
	
	If Right(ls_where,4)="and " Then
		ls_where=left(ls_where, len(ls_where) - 4)
	END IF
	// Luego de concatenar todos los filtros se modifica el SQL de la dw
	If ls_where <> '' Then
		ls_error = This.Modify("DataWindow.Table.Select='"+is_select_original+ls_where+"'")
		If ls_error = "" Then
			This.Retrieve()
		Else
			MessageBox("Error","Se ha producido un error determinando el select. ~r~n"+ls_error,StopSign!)
			RETURN 
		End If
	END IF
End If	

This.SetFocus()

end event

event dw_general::itemchanged;call super::itemchanged;/*
* ============================================================================
* MODIFICADO: Mayos 03 de 2010 - ohlondon
* ----------------------------------------------------------------------------
* Se validan los datos ingresados
* ============================================================================
*/
Integer li_return
String ls_dato_ant 
Long ll_material

ls_dato_ant = This.GetItemString(row, GetColumnName())


// Se rechaza cualquie cambio en esta pantalla 25/06/2015
Return 2

CHOOSE CASE dwo.Name
	CASE 'm_prod_proveedor_co_material'
		// Si se cambia el material se valida que exista en la base de datos
		// de ordenes db2  
 		IF Not IsNull(Data) THEN
			IF Trim(data) = '0' THEN 
				// Se pone este codigo en caso de que se vuelva a activar esta ventana para permitir cambar el codigo de material SAP
				// Si el material digitado es un numero se convierte a un long y se actualiza el co_producto 25/06/2015				
				This.SetItem(row, 'm_prod_proveedor_co_producto', ll_material)
				RETURN 0
			ELSE					
				li_return = of_validar_material(Trim(data)) 
				IF li_return <= 0 THEN
					This.SetItem(row, GetColumnName(), ls_dato_ant)
					This.SetColumn(GetColumnName())
					This.SetFocus()
					RETURN 1
				ELSE
					// Se pone este codigo en caso de que se vuelva a activar esta ventana para permitir cambar el codigo de material SAP
					// Si el material digitado es un numero se convierte a un long y se actualiza el co_producto 25/06/2015
					If IsNumber(data) Then
						ll_material = Long(data)
						This.SetItem(row, 'm_prod_proveedor_co_producto', ll_material)
					Else
						MessageBox("Advertencia!","No es posible convertir el codigo del material digitado a un numero de producto", StopSign!)
						Return 1
					End If
					
				END IF
			END IF
		END IF	
END CHOOSE

 
end event

event dw_general::itemerror;// Override
RETURN 1
end event

event dw_general::ue_update;Long         ll_i,ll_n
dwItemStatus l_status

If This.of_CompleteData() Then
	//Tambien actualizar fecha,usuario,instancia
	If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
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
		Commit Using n_cst_application.itr_appl;
	MessageBox("$$HEX1$$a100$$ENDHEX$$Grabaci$$HEX1$$f300$$ENDHEX$$n Existosa!","Los datos se han registrado satisfactoriamente.")
	Else
		RollBack Using n_cst_application.itr_appl;
		MessageBox("Error","$$HEX1$$a100$$ENDHEX$$Se ha producido un error actualizando los datos!",StopSign!)
	End If
End If	
This.SetFocus()




end event

type gb_general from w_simple`gb_general within w_m_prod_proveedor
integer y = 24
integer width = 3424
integer height = 1684
end type

