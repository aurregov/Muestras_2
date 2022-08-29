HA$PBExportHeader$w_ctencico_cliente.srw
$PBExportComments$Funcionario de control tencnico en
forward
global type w_ctencico_cliente from w_simple
end type
end forward

global type w_ctencico_cliente from w_simple
integer width = 2656
string title = "Encargado por cliente"
end type
global w_ctencico_cliente w_ctencico_cliente

on w_ctencico_cliente.create
call super::create
end on

on w_ctencico_cliente.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_general from w_simple`dw_general within w_ctencico_cliente
integer width = 2459
string dataobject = "d_cliente_ctecnico"
end type

event dw_general::ue_find;call super::ue_find;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 05 de Septiembre de 2003 HORA 14:16:14:337
// 
// Luego de la recuperaci$$HEX1$$f300$$ENDHEX$$n se coloca el nombre del
// cliente
//////////////////////////////////////////////////////////////////////////
long ll_tot,i, ll_cliente,ll_sucursal,ll_res
String ls_tipo_cliente
n_cst_comun lo_comun


ll_tot=RowCount()

For i=1 to ll_tot
	ll_cliente=GetItemNumber(i,"co_cliente")
	ll_sucursal=GetItemNumber(i,"co_sucursal")
	ls_tipo_cliente=GetItemString(i,"tipo_cliente")
	
	ll_res=lo_comun.of_nombrecliente(ll_cliente /*long a_cliente*/,&
	                                 ll_sucursal/*long a_sucursal*/,&
												ls_tipo_cliente/*string a_tipocliente*/,&
												n_cst_application.itr_appl/*transaction a_transaction */)
												
	If ll_res=1 Then
		SetItem(i,"de_cliente",lo_comun.of_getString(1))	
	End IF
	
Next
end event

event dw_general::itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 10 de Septiembre de 2003 HORA 13:59:41:424
// 
// Cuando se coloca la sucursal, se coloca la descripcion del cliente
//////////////////////////////////////////////////////////////////////////
Long 				ll_cliente, ll_sucursal,ll_res,ll_null,ll_pos
String 			ls_tipo_cliente,ls_find
n_cst_comun 	lo_comun

If dwo.name="co_sucursal" Then

	ll_cliente=GetItemNumber(row,"co_cliente")
	ll_sucursal=Long(Data)
	ls_tipo_cliente=GetItemString(row,"tipo_cliente")
	
//////////////////////////////////////////////////////////////////////////
// Verifico que no exista tipo - cliente - sucursal
// 
//////////////////////////////////////////////////////////////////////////	
	ls_find="tipo_cliente='"+ls_tipo_cliente+"' and co_cliente="+&
	        String(ll_cliente)+" and  co_sucursal="+String(ll_sucursal)
			  
			  
	ll_pos=Find(ls_find,1,RowCount())
	
	If ll_pos>0 Then
		MessageBox("Advertencia!","Ya existe el cliente sucursal, por favor verifique.",StopSign!)
		Return 2
	End If

	
	ll_res=lo_comun.of_nombrecliente(ll_cliente /*long a_cliente*/,&
	                                 ll_sucursal/*long a_sucursal*/,&
												ls_tipo_cliente/*string a_tipocliente*/,&
												n_cst_application.itr_appl/*transaction a_transaction */)
												
	If ll_res=1 Then
		SetItem(row,"de_cliente",lo_comun.of_getString(1))	
	Else
		MessageBox("Advertencia!","Sucursal no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2

	End IF 	
	
ElseIf dwo.name="tipo_cliente" Then
	SetNull(ll_null)
	SetItem(row,"co_cliente",ll_null)
	SetItem(row,"co_sucursal",ll_null)
	SetItem(row,"de_cliente","")

ElseIf dwo.name="co_cliente" Then
	SetNull(ll_null)
	SetItem(row,"co_sucursal",ll_null)
	SetItem(row,"de_cliente","")

End If


end event

event dw_general::sqlpreview;call super::sqlpreview;string ls
ls = sqlsyntax
end event

type gb_general from w_simple`gb_general within w_ctencico_cliente
integer width = 2528
end type

