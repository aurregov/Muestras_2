HA$PBExportHeader$w_busins_m_colores_procad.srw
forward
global type w_busins_m_colores_procad from w_base_busqueda_mod
end type
end forward

global type w_busins_m_colores_procad from w_base_busqueda_mod
string title = "Colores procesos adicionales"
end type
global w_busins_m_colores_procad w_busins_m_colores_procad

forward prototypes
public function integer of_retorno ()
public function integer of_verifica ()
end prototypes

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_color_ad")
Return 1
end function

public function integer of_verifica ();long ll_tot,i, ll_c,ll_c1
String ls_de_color


of_filtro("")
dw_1.SetSort("co_color_ad a")
dw_1.Sort()

ll_tot=dw_1.RowCount()

For i=1 to ll_tot
	ll_c=dw_1.GetItemNumber(i,"co_color_ad")


	If IsNull(ll_c) Then
		MessageBox("Advertencia!","Codigo de color no v$$HEX1$$e100$$ENDHEX$$lido, fila "+&
		String(i)+".",StopSign!)
		Return -1
	End If

	If i<ll_tot Then
		ll_c1=dw_1.GetItemNUmber(i+1,"co_color_ad")
		If ll_c=ll_c1 Then
			MessageBox("Advertencia!","Codigo de color repetido, fila "+&
			String(i)+".",StopSign!)
			Return -1
		End If
	End If

	ls_de_color=dw_1.GetItemString(i,"de_color")

	If IsNull(ls_de_color) Then
		MessageBox("Advertencia!","Descripci$$HEX1$$f300$$ENDHEX$$n de color no v$$HEX1$$e100$$ENDHEX$$lida, fila "+&
		String(i)+".",StopSign!)
		Return -1
	End If


Next

Return 1


end function

on w_busins_m_colores_procad.create
call super::create
end on

on w_busins_m_colores_procad.destroy
call super::destroy
end on

event open;call super::open;long ll_tot

ll_tot=dw_1.Retrieve(io_param.il_vector[1])

If ll_tot=0 Then
	dw_1.triggerEvent("ue_insertrow")
End If
end event

type st_1 from w_base_busqueda_mod`st_1 within w_busins_m_colores_procad
string text = "Digite color:"
end type

type sle_1 from w_base_busqueda_mod`sle_1 within w_busins_m_colores_procad
end type

event sle_1::modified;call super::modified;of_filtro("de_color like '%"+text+"%'")
end event

type cb_adicionar from w_base_busqueda_mod`cb_adicionar within w_busins_m_colores_procad
end type

type cb_eliminar from w_base_busqueda_mod`cb_eliminar within w_busins_m_colores_procad
end type

type cb_aceptar from w_base_busqueda_mod`cb_aceptar within w_busins_m_colores_procad
end type

type cb_cancelar from w_base_busqueda_mod`cb_cancelar within w_busins_m_colores_procad
end type

type dw_1 from w_base_busqueda_mod`dw_1 within w_busins_m_colores_procad
string dataobject = "d_listains_m_colores_procad"
end type

event dw_1::ue_insertrow;call super::ue_insertrow;
long ll_f

ll_f=GetRow()

SetItem(ll_f,"co_tipo_proceso",io_param.il_vector[1])

Long ll_cons

ll_cons = Long(This.Describe("Evaluate('max(co_color_ad for all)', 0)"))

If IsNull(ll_cons) Then ll_cons=0

ll_cons++

SetItem(ll_f,"co_color_ad",ll_cons)

SetColumn("de_color")

end event

event dw_1::ue_dwnprocessenter;call super::ue_dwnprocessenter;if this.AcceptText() < 0 then
  Return 1
end if

if this.GetColumn() = 3 then
 if this.GetRow() = this.RowCount() then
	postEvent("ue_insertRow")
   Return 1
 end if
end if

Send(Handle(this),256,9,Long(0,0))
return 1
end event

type gb_1 from w_base_busqueda_mod`gb_1 within w_busins_m_colores_procad
string text = "Colores proceso adicional"
end type

type gb_2 from w_base_busqueda_mod`gb_2 within w_busins_m_colores_procad
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda colores"
end type

