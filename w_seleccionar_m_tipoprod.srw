HA$PBExportHeader$w_seleccionar_m_tipoprod.srw
forward
global type w_seleccionar_m_tipoprod from w_base_busqueda
end type
end forward

global type w_seleccionar_m_tipoprod from w_base_busqueda
string title = "Tipo de producto"
end type
global w_seleccionar_m_tipoprod w_seleccionar_m_tipoprod

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();//co_tipoprod

Long ll_row, ll_sel, ll_cont

ll_row = dw_1.GetSelectedRow(0)
If ll_row > 0 Then
	
	ll_cont = 1
	ll_sel = dw_1.GetSelectedRow(0)
	Do While ll_sel > 0
		io_retorno.il_vector[ll_cont] = dw_1.GetItemNumber(ll_sel,'co_tipoprod')
		
		ll_cont += 1
		ll_sel = dw_1.GetSelectedRow(ll_sel)
	Loop

Else
	MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','Debe seleccionar al menos un tipoprod')
	Return -1
End If

Return 1
end function

on w_seleccionar_m_tipoprod.create
call super::create
end on

on w_seleccionar_m_tipoprod.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve()
end event

type sle_1 from w_base_busqueda`sle_1 within w_seleccionar_m_tipoprod
end type

event sle_1::modified;of_filtro("de_tipoprod like '%"+text+"%'")
dw_1.SetFocus()
end event

type st_1 from w_base_busqueda`st_1 within w_seleccionar_m_tipoprod
string text = "Digite tipo producto :"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_seleccionar_m_tipoprod
end type

type cb_cancelar from w_base_busqueda`cb_cancelar within w_seleccionar_m_tipoprod
end type

type dw_1 from w_base_busqueda`dw_1 within w_seleccionar_m_tipoprod
integer x = 64
integer width = 1152
string dataobject = "d_lista_m_tipoprod"
end type

event dw_1::clicked;
IF row <> 0 AND row <> -1 AND NOT IsNull(row) THEN
	IF This.IsSelected(Row) THEN
		this.selectrow(Row, False)
	ELSE
		This.SelectRow(Row, True)
		il_fila = row
	END IF
END IF

end event

type gb_1 from w_base_busqueda`gb_1 within w_seleccionar_m_tipoprod
string text = "Tipos producto"
end type

type gb_2 from w_base_busqueda`gb_2 within w_seleccionar_m_tipoprod
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda tipo producto"
end type

