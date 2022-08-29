HA$PBExportHeader$w_m_muestrarios_rif.srw
forward
global type w_m_muestrarios_rif from w_simple
end type
end forward

global type w_m_muestrarios_rif from w_simple
integer width = 2437
integer height = 1544
string title = "Maestro Muestrarios"
end type
global w_m_muestrarios_rif w_m_muestrarios_rif

on w_m_muestrarios_rif.create
call super::create
end on

on w_m_muestrarios_rif.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;
dw_general.Retrieve()
end event

event ue_save;
Long ll_reg, ll_find, ll_fabrica, ll_linea, ll_muestrario, ll_row
Datastore lds_lineas, lds_muestrarios
dwItemStatus l_status

lds_lineas = Create Datastore
lds_lineas.DataObject = dw_general.DataObject

lds_muestrarios = Create Datastore
lds_muestrarios.DataObject = dw_general.DataObject

If dw_general.AcceptText() <= 0 Then Return 

//recorre los datos para tomar las diferentes lineas y muestrarios
For ll_reg = 1 to dw_general.RowCount()
	//toma la fabrica linea muestrario
	ll_fabrica = dw_general.GetItemNumber(ll_reg,'co_fabrica')
	ll_linea = dw_general.GetItemNumber(ll_reg,'co_linea')
	ll_muestrario = dw_general.GetItemNumber(ll_reg,'co_muestrario')
	
	l_status = dw_general.GetItemStatus(ll_reg,0,Primary!)

	//mira si ya existe la linea
	ll_find = lds_lineas.Find('co_fabrica = ' + String(ll_fabrica) + &
					' and co_linea = ' + String(ll_linea),1,lds_lineas.RowCount() +1)
	//si no existe
	If ll_find = 0 Then
		ll_find = lds_lineas.InsertRow(0)
		lds_lineas.SetItem(ll_find,'co_fabrica',ll_fabrica)
		lds_lineas.SetItem(ll_find,'co_linea',ll_linea)
	End if
	
	If l_status <> NotModified! Then
		//mira si ya existe el muestrario
		ll_find = lds_muestrarios.Find('co_muestrario = ' + String(ll_muestrario),1,lds_muestrarios.RowCount() +1)
		//si no existe
		If ll_find = 0 Then
			ll_find = lds_muestrarios.InsertRow(0)
			lds_muestrarios.SetItem(ll_find,'co_muestrario',ll_muestrario)
			lds_muestrarios.SetItem(ll_find,'de_muestrario',dw_general.GetItemString(ll_reg,'de_muestrario'))
			lds_muestrarios.SetItem(ll_find,'fe_inicio',dw_general.GetItemDate(ll_reg,'fe_inicio'))
			lds_muestrarios.SetItem(ll_find,'fe_fin',dw_general.GetItemDate(ll_reg,'fe_fin'))
		End if
	End if
Next


//recorre los datos para crear el muestrario en las demas linea que tiene la fabrica
For ll_reg = 1 to lds_muestrarios.RowCount()
	//toma el muestrario
	ll_muestrario = lds_muestrarios.GetItemNumber(ll_reg,'co_muestrario')
	
	//se recorre las linea para mira si el muestrario existe en esa linea
	For ll_row = 1 to lds_lineas.RowCount()
		//toma la fabrica linea muestrario
		ll_fabrica = lds_lineas.GetItemNumber(ll_row,'co_fabrica')
		ll_linea = lds_lineas.GetItemNumber(ll_row,'co_linea')
	
		//mira si ya existe el muestrario en la linea
		ll_find = dw_general.Find('co_fabrica = ' + String(ll_fabrica) + ' and co_linea = ' + String(ll_linea) + &
					' and co_muestrario = ' + String(ll_muestrario) ,1,dw_general.RowCount() +1)
		//si no existe
		If ll_find = 0 Then
			ll_find = dw_general.InsertRow(0)
			dw_general.SetItem(ll_find,'co_fabrica',ll_fabrica)
			dw_general.SetItem(ll_find,'co_linea',ll_linea)
			dw_general.SetItem(ll_find,'co_muestrario',ll_muestrario)
			dw_general.SetItem(ll_find,'de_muestrario',lds_muestrarios.GetItemString(ll_reg,'de_muestrario'))
			dw_general.SetItem(ll_find,'fe_inicio',lds_muestrarios.GetItemDate(ll_reg,'fe_inicio'))
			dw_general.SetItem(ll_find,'fe_fin',lds_muestrarios.GetItemDate(ll_reg,'fe_fin'))
			
		End if
	Next
Next

//actualiza los datos
idw_data.Event ue_update()

end event

type dw_general from w_simple`dw_general within w_m_muestrarios_rif
integer x = 73
integer y = 120
integer width = 2277
integer height = 1184
string dataobject = "d_gr_m_muestrarios_rif"
boolean hscrollbar = true
end type

type gb_general from w_simple`gb_general within w_m_muestrarios_rif
integer x = 50
integer y = 52
integer width = 2327
integer height = 1296
end type

