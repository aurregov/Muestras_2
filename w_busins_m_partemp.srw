HA$PBExportHeader$w_busins_m_partemp.srw
$PBExportComments$Permite buscar e insertar partes de materia prima
forward
global type w_busins_m_partemp from w_base_busqueda_mod
end type
end forward

global type w_busins_m_partemp from w_base_busqueda_mod
integer width = 1801
integer height = 1788
string title = "Pate de materia prima"
end type
global w_busins_m_partemp w_busins_m_partemp

forward prototypes
public function integer of_retorno ()
public function integer of_verifica ()
end prototypes

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_partemp")
io_retorno.is_vector[1]=dw_1.GetItemString(il_fila,"estado")

Return 1
end function

public function integer of_verifica ();long ll_tot,i, ll_c,ll_c1
String ls_de_parte


of_filtro("")
dw_1.SetSort("co_partemp a")
dw_1.Sort()

ll_tot=dw_1.RowCount()

For i=1 to ll_tot
	ll_c=dw_1.GetItemNumber(i,"co_partemp")


	If IsNull(ll_c) Then
		MessageBox("Advertencia!","Codigo de parte no v$$HEX1$$e100$$ENDHEX$$lido, fila "+&
		String(i)+".",StopSign!)
		Return -1
	End If

	If i<ll_tot Then
		ll_c1=dw_1.GetItemNUmber(i+1,"co_partemp")
		If ll_c=ll_c1 Then
			MessageBox("Advertencia!","Codigo de parte repetido, fila "+&
			String(i)+".",StopSign!)
			Return -1
		End If
	End If

	ls_de_parte=dw_1.GetItemString(i,"de_partemp")

	If IsNull(ls_de_parte) Then
		MessageBox("Advertencia!","Descripci$$HEX1$$f300$$ENDHEX$$n de parte no v$$HEX1$$e100$$ENDHEX$$lida, fila "+&
		String(i)+".",StopSign!)
		Return -1
	End If


Next

Return 1
end function

on w_busins_m_partemp.create
call super::create
end on

on w_busins_m_partemp.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve(io_param.il_vector[1])
end event

type st_1 from w_base_busqueda_mod`st_1 within w_busins_m_partemp
string text = "Digite parte:"
end type

type sle_1 from w_base_busqueda_mod`sle_1 within w_busins_m_partemp
end type

event sle_1::modified;call super::modified;
String ls_texto

If Isnull(text) or Trim(text) = '' Then 
	ls_texto = ''
Else
	ls_texto = "de_partemp like '%"+text+"%'"
End if

of_filtro(ls_texto)

dw_1.Sort()
end event

type cb_adicionar from w_base_busqueda_mod`cb_adicionar within w_busins_m_partemp
boolean visible = false
boolean enabled = false
end type

type cb_eliminar from w_base_busqueda_mod`cb_eliminar within w_busins_m_partemp
boolean visible = false
boolean enabled = false
end type

type cb_aceptar from w_base_busqueda_mod`cb_aceptar within w_busins_m_partemp
end type

event cb_aceptar::clicked;
If dw_1.RowCount()>0 Then
	If il_fila<=0 Then
		MessageBox("Advertencia!","Debe seleccionar un registro.",StopSign!)
		Return
	End If

	If dw_1.AcceptText()<>1 Then
		MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
		Return
	End If

	of_retorno()
	
	If of_verifica()<>1 then
		Return
	End If
	
	DateTime ldt_fecha
	String ls_usuario,ls_instancia
	
	If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
													 ldt_fecha,ls_usuario,ls_instancia) Then
		Return -1
	End If
	


	If dw_1.of_datosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
		Return
	End If
End If

If dw_1.RowCount()>0 Then
	CloseWithReturn(Parent,io_retorno)
Else
	Close(Parent)
End If
end event

type cb_cancelar from w_base_busqueda_mod`cb_cancelar within w_busins_m_partemp
integer x = 1015
end type

type dw_1 from w_base_busqueda_mod`dw_1 within w_busins_m_partemp
integer width = 1650
integer height = 1220
string dataobject = "d_listains_m_partemp"
end type

event dw_1::ue_insertrow;
Return 

end event

event dw_1::ue_dwnprocessenter;call super::ue_dwnprocessenter;if this.AcceptText() < 0 then
  Return 1
end if

if this.GetColumn() = 3 then
 if this.GetRow() = this.RowCount() then
	//postEvent("ue_insertRow")
   Return 1
 end if
end if

Send(Handle(this),256,9,Long(0,0))
return 1


end event

event dw_1::ue_deleterow;//
end event

type gb_1 from w_base_busqueda_mod`gb_1 within w_busins_m_partemp
integer width = 1696
integer height = 1308
string text = "Partes"
end type

type gb_2 from w_base_busqueda_mod`gb_2 within w_busins_m_partemp
end type

