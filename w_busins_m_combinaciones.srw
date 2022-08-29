HA$PBExportHeader$w_busins_m_combinaciones.srw
forward
global type w_busins_m_combinaciones from w_base_busqueda_mod
end type
end forward

global type w_busins_m_combinaciones from w_base_busqueda_mod
string title = "Combinaciones referencia"
end type
global w_busins_m_combinaciones w_busins_m_combinaciones

forward prototypes
public function integer of_retorno ()
end prototypes

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_combinacion")
Return 1
end function

on w_busins_m_combinaciones.create
call super::create
end on

on w_busins_m_combinaciones.destroy
call super::destroy
end on

event open;call super::open;dw_1.Retrieve(io_param.il_vector[1],&
              io_param.il_vector[2],&
				  io_param.il_vector[3],&
				  io_param.il_vector[4],&
				  io_param.il_vector[5])
end event

type st_1 from w_base_busqueda_mod`st_1 within w_busins_m_combinaciones
end type

type sle_1 from w_base_busqueda_mod`sle_1 within w_busins_m_combinaciones
end type

event sle_1::modified;call super::modified;of_filtro("de_color like '%"+text+"%'")
dw_1.SetFocus()
end event

type cb_adicionar from w_base_busqueda_mod`cb_adicionar within w_busins_m_combinaciones
end type

type cb_eliminar from w_base_busqueda_mod`cb_eliminar within w_busins_m_combinaciones
end type

type cb_aceptar from w_base_busqueda_mod`cb_aceptar within w_busins_m_combinaciones
end type

type cb_cancelar from w_base_busqueda_mod`cb_cancelar within w_busins_m_combinaciones
end type

type dw_1 from w_base_busqueda_mod`dw_1 within w_busins_m_combinaciones
string dataobject = "d_listains_m_combinaciones"
end type

event dw_1::ue_insertrow;call super::ue_insertrow;
long ll_f

ll_f=GetRow()

SetItem(ll_f,"co_fabrica",io_param.il_vector[1])
SetItem(ll_f,"co_linea",io_param.il_vector[2])
SetItem(ll_f,"co_referencia",io_param.il_vector[3])
SetItem(ll_f,"co_talla",io_param.il_vector[4])
SetItem(ll_f,"co_calidad",io_param.il_vector[5])

Long ll_cons

ll_cons = Long(This.Describe("Evaluate('max(co_combinacion for all)', 0)"))

If IsNull(ll_cons) Then ll_cons=0

ll_cons++

SetItem(ll_f,"co_combinacion",ll_cons)

SetColumn("de_combinacion")

end event

event dw_1::ue_dwnprocessenter;if this.AcceptText() < 0 then
  Return 1
end if

if this.GetColumn() = 7 then
 if this.GetRow() = this.RowCount() then
	postEvent("ue_insertRow")
   Return 1
 end if
end if

Send(Handle(this),256,9,Long(0,0))
return 1

end event

type gb_1 from w_base_busqueda_mod`gb_1 within w_busins_m_combinaciones
string text = "Combinaciones referencia"
end type

type gb_2 from w_base_busqueda_mod`gb_2 within w_busins_m_combinaciones
end type

