HA$PBExportHeader$w_m_prioridad_cliente.srw
forward
global type w_m_prioridad_cliente from w_simple
end type
end forward

global type w_m_prioridad_cliente from w_simple
integer width = 2327
integer height = 1244
string title = "Tipos de Procesos"
end type
global w_m_prioridad_cliente w_m_prioridad_cliente

forward prototypes
public function integer of_datos_cliente (string as_tpped, long an_cliente, long an_sucursal)
end prototypes

public function integer of_datos_cliente (string as_tpped, long an_cliente, long an_sucursal);string ls_descliente

//Buscamos la descripci$$HEX1$$f300$$ENDHEX$$n del cliente como el pa$$HEX1$$ed00$$ENDHEX$$s y la ejecutiva de cuenta.
If as_tpped = "EX" Then
	select de_cliente
	  into :ls_descliente
	  from m_clientes_exp  
	 where co_cliente = :an_cliente and
			 co_sucursal = :an_sucursal using n_cst_application.itr_appl ;
Else
	select de_cliente
     into :ls_descliente
     from m_clientes  
    where co_cliente = :an_cliente and
			 co_sucursal = :an_sucursal using n_cst_application.itr_appl ;
	
End If


If n_cst_application.itr_appl.SqlCode = -1 Then
	MessageBox("Advertencia!","Hubo un error al consultar el cliente.~n~nNota: " + n_cst_application.itr_appl.SqlErrText )
	Return 2
ElseIf n_cst_application.itr_appl.SqlCode = 100 Then
	MessageBox("Advertencia!","El cliente no existe. Por favor revisar.")
	Return 2
End If

dw_general.SetItem(dw_general.GetRow(),"de_cliente",ls_descliente)

RETURN 1
end function

on w_m_prioridad_cliente.create
call super::create
end on

on w_m_prioridad_cliente.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;this.x = 1
this.y = 1
end event

type dw_general from w_simple`dw_general within w_m_prioridad_cliente
integer width = 2144
string dataobject = "d_proridad_cliente"
end type

event dw_general::doubleclicked;call super::doubleclicked;String ls_tipo_cli

n_cst_param lo_param

If dwo.name="co_cliente" or dwo.name="co_sucursal" Then
		
	ls_tipo_cli=GetItemString(1,"tipo_cliente")
	
	If IsNull(ls_tipo_cli) Then
		MessageBox("Advertencia!","Debe especificar el tipo de solicitud.",StopSign!)
		Return
	End If
	lo_param.is_vector[1]=""
	lo_param.is_vector[2]=ls_tipo_cli
	OpenWithParm(w_opc_cliente,lo_param)
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetItem(row,"co_cliente",lo_param.il_vector[1])
		SetItem(row,"co_sucursal",lo_param.il_vector[2])

		DWObject dwo_1
		dwo_1 = This.Object.co_sucursal
		trigger event itemchanged(row,dwo_1,String(lo_param.il_vector[2]))
	End If
End If

end event

event dw_general::itemchanged;call super::itemchanged;long ll_cliente,ll_dato
string ls_tipocliente

If dwo.name="co_sucursal" Then
	ll_cliente=GetItemNumber(Row,"co_cliente")
	ls_tipocliente=GetItemString(Row,"tipo_cliente")	
	ll_dato=Long(data)
	
	of_datos_cliente(ls_tipocliente,ll_cliente,ll_dato)

End If

end event

type gb_general from w_simple`gb_general within w_m_prioridad_cliente
integer width = 2203
end type

