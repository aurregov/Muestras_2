HA$PBExportHeader$w_m_mues_cargo.srw
forward
global type w_m_mues_cargo from w_simple
end type
type dw_estados from u_dw_base within w_m_mues_cargo
end type
type dw_estados_salida from u_dw_base within w_m_mues_cargo
end type
type gb_1 from groupbox within w_m_mues_cargo
end type
type gb_2 from groupbox within w_m_mues_cargo
end type
end forward

global type w_m_mues_cargo from w_simple
integer width = 3525
integer height = 1836
string title = "Cargos y estados que pueden manejar"
dw_estados dw_estados
dw_estados_salida dw_estados_salida
gb_1 gb_1
gb_2 gb_2
end type
global w_m_mues_cargo w_m_mues_cargo

forward prototypes
public function integer of_update ()
end prototypes

public function integer of_update ();Long         ll_i,ll_n
dwItemStatus l_status

If dw_general.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos en cargos.",StopSign!)
	Return -1
End If

If dw_estados.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos en estados.",StopSign!)
	Return -1
End If

If dw_estados_salida.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos en estados.",StopSign!)
	Return -1
End If



If Not dw_general.of_CompleteData() Then
	Return -1
End If

If Not dw_estados.of_CompleteData() Then
	Return -1
End If

If Not dw_estados_salida.of_CompleteData() Then
	Return -1
End If


//Tambien actualizar fecha,usuario,instancia
If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 idt_fecha,is_usuario,is_instancia) Then
	Return -1
End If

ll_n = dw_general.RowCount()
For ll_i = 1 To ll_n
	l_status = dw_general.GetItemStatus(ll_i,0,Primary!)
	If l_status <> NotModified! Then
		//si el DataWindow tiene fe_actualizacion,usuario,instancia
		//entonces actualizarlas
		If dw_general.of_ExistColumn('fe_actualizacion') Then
			dw_general.SetItem(ll_i,'fe_actualizacion',idt_fecha)
		End If
		If dw_general.of_ExistColumn('usuario') Then
			dw_general.SetItem(ll_i,'usuario',is_usuario)
		End If	
		If dw_general.of_ExistColumn('instancia') Then
			dw_general.SetItem(ll_i,'instancia',is_instancia)
		End If	
	End If
Next

ll_n = dw_estados.RowCount()
For ll_i = 1 To ll_n
	l_status = dw_estados.GetItemStatus(ll_i,0,Primary!)
	If l_status <> NotModified! Then
		//si el DataWindow tiene fe_actualizacion,usuario,instancia
		//entonces actualizarlas
		If dw_estados.of_ExistColumn('fe_actualizacion') Then
			dw_estados.SetItem(ll_i,'fe_actualizacion',idt_fecha)
		End If
		If dw_estados.of_ExistColumn('usuario') Then
			dw_estados.SetItem(ll_i,'usuario',is_usuario)
		End If	
		If dw_estados.of_ExistColumn('instancia') Then
			dw_estados.SetItem(ll_i,'instancia',is_instancia)
		End If	
	End If
Next


ll_n = dw_estados_salida.RowCount()
For ll_i = 1 To ll_n
	l_status = dw_estados_salida.GetItemStatus(ll_i,0,Primary!)
	If l_status <> NotModified! Then
		//si el DataWindow tiene fe_actualizacion,usuario,instancia
		//entonces actualizarlas
		If dw_estados_salida.of_ExistColumn('fe_actualizacion') Then
			dw_estados_salida.SetItem(ll_i,'fe_actualizacion',idt_fecha)
		End If
		If dw_estados_salida.of_ExistColumn('usuario') Then
			dw_estados_salida.SetItem(ll_i,'usuario',is_usuario)
		End If	
		If dw_estados_salida.of_ExistColumn('instancia') Then
			dw_estados_salida.SetItem(ll_i,'instancia',is_instancia)
		End If	
	End If
Next

If dw_general.Update(True) <> 1 Then
	RollBack Using n_cst_application.itr_appl;
	MessageBox("Error","Se ha producido un error actualizando los datos !",StopSign!)
End If

If dw_estados.Update(True) <> 1 Then
	RollBack Using n_cst_application.itr_appl;
	MessageBox("Error","Se ha producido un error actualizando los datos !",StopSign!)
End If

If dw_estados_salida.Update(True) <> 1 Then
	RollBack Using n_cst_application.itr_appl;
	MessageBox("Error","Se ha producido un error actualizando los datos !",StopSign!)
End If

Commit Using n_cst_application.itr_appl;

dw_general.SetFocus()


Return 1
end function

on w_m_mues_cargo.create
int iCurrent
call super::create
this.dw_estados=create dw_estados
this.dw_estados_salida=create dw_estados_salida
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_estados
this.Control[iCurrent+2]=this.dw_estados_salida
this.Control[iCurrent+3]=this.gb_1
this.Control[iCurrent+4]=this.gb_2
end on

on w_m_mues_cargo.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_estados)
destroy(this.dw_estados_salida)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;x=1
y=1

If dw_estados.of_Conexion(n_cst_application.itr_appl,True) <> 1 Then
	MessageBox("Error","No se ha podido establecer conexi$$HEX1$$f300$$ENDHEX$$n con la base de datos !. ",StopSign!)
	Close(This)
End If	
	
//dw_estados_salida	

If dw_estados_salida.of_Conexion(n_cst_application.itr_appl,True) <> 1 Then
	MessageBox("Error","No se ha podido establecer conexi$$HEX1$$f300$$ENDHEX$$n con la base de datos !. ",StopSign!)
	Close(This)
End If	

end event

event ue_find;call super::ue_find;dw_estados.Event ue_find()
dw_estados_salida.Event ue_find()
end event

event ue_save;//
of_update()
end event

type dw_general from w_simple`dw_general within w_m_mues_cargo
integer x = 55
integer width = 1230
integer height = 1280
string dataobject = "d_m_mues_cargo"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event dw_general::ue_update;//
end event

event dw_general::rowfocuschanged;call super::rowfocuschanged;//////////////////////////////////////////////////////////////////////////
// Cuando se cambia de fila, se filtran los estados permitidos para el
// cargo seleccionado
//////////////////////////////////////////////////////////////////////////
If RowCount()=0 Then
	Return
End If
If currentrow=0 Then
	Return
End IF
SelectRow(0,False)
SelectRow(currentrow,True)

Long ll_cargo

ll_cargo=This.GetItemNumber(currentrow,"co_cargo")

If IsNull(ll_cargo) Then ll_cargo=0

String ls_filtro

ls_filtro="co_cargo="+String(ll_cargo)

dw_estados.SetFilter(ls_filtro)
dw_estados.Filter()

dw_estados_salida.SetFilter(ls_filtro)
dw_estados_salida.Filter()


end event

event dw_general::ue_find;call super::ue_find;SetRow(1)
end event

type gb_general from w_simple`gb_general within w_m_mues_cargo
integer x = 37
integer y = 32
integer width = 1289
integer height = 1376
integer taborder = 0
string text = "Cargos"
end type

type dw_estados from u_dw_base within w_m_mues_cargo
integer x = 1385
integer y = 100
integer width = 946
integer height = 1280
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_dt_mues_car_es"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event ue_find;call super::ue_find;Retrieve()
end event

event ue_insertrow;Long ll_cargo,ll_fila

ll_fila=dw_general.GetRow()

If ll_fila<=0 Then
	MessageBox("Advertencia!","Deben existir cargos.",StopSign!)
	Return
End If

ll_cargo=dw_general.GetItemNumber(ll_fila,"co_cargo")

If IsNull(ll_cargo) Then ll_cargo=0

If ll_cargo=0 Then
	MessageBox("Advertencia!","Se debe especificar el cargo.",StopSign!)
	Return
End If
//////////////////////////////////////////////////////////////////////////
// Se inserta la fila con el ancestro
// 
//////////////////////////////////////////////////////////////////////////

Super::Event ue_insertRow()

ll_fila=GetRow()

If ll_fila<=0 Then
	Return
End If

SetItem(ll_fila,"co_cargo",ll_cargo)




end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 26 de Mayo de 2004 HORA 13:47:02:906
// 
// Se verifica que el estado no se hubiera ingresado
//////////////////////////////////////////////////////////////////////////
Long ll_estado,ll_pos
If dwo.name="co_estado" Then
	ll_estado=Long(data)
	ll_pos=This.Find("co_estado="+String(ll_estado),1,This.RowCount())
	If ll_pos>0 Then
		MessageBox("Advertencia!","El estado se encuentra registrado.",StopSign!)
		Return 2
	End If
End IF

end event

type dw_estados_salida from u_dw_base within w_m_mues_cargo
integer x = 2441
integer y = 100
integer width = 965
integer height = 1280
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_dt_mu_car_sal"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;call super::itemchanged;Long ll_estado,ll_pos
If dwo.name="co_estado" Then
	ll_estado=Long(data)
	ll_pos=This.Find("co_estado="+String(ll_estado),1,This.RowCount())
	If ll_pos>0 Then
		MessageBox("Advertencia!","El estado se encuentra registrado.",StopSign!)
		Return 2
	End If
End IF

end event

event ue_find;call super::ue_find;Retrieve()
end event

event ue_insertrow;Long ll_cargo,ll_fila

ll_fila=dw_general.GetRow()

If ll_fila<=0 Then
	MessageBox("Advertencia!","Deben existir cargos.",StopSign!)
	Return
End If

ll_cargo=dw_general.GetItemNumber(ll_fila,"co_cargo")

If IsNull(ll_cargo) Then ll_cargo=0

If ll_cargo=0 Then
	MessageBox("Advertencia!","Se debe especificar el cargo.",StopSign!)
	Return
End If
//////////////////////////////////////////////////////////////////////////
// Se inserta la fila con el ancestro
// 
//////////////////////////////////////////////////////////////////////////

Super::Event ue_insertRow()

ll_fila=GetRow()

If ll_fila<=0 Then
	Return
End If

SetItem(ll_fila,"co_cargo",ll_cargo)




end event

type gb_1 from groupbox within w_m_mues_cargo
integer x = 1362
integer y = 32
integer width = 1019
integer height = 1376
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Puede ingresar a estos estados"
end type

type gb_2 from groupbox within w_m_mues_cargo
integer x = 2400
integer y = 32
integer width = 1047
integer height = 1376
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Puede sacar de estos estados"
end type

