HA$PBExportHeader$w_maestro_partemp.srw
$PBExportComments$Permite buscar e insertar partes de materia prima
forward
global type w_maestro_partemp from w_base_busqueda_mod
end type
end forward

global type w_maestro_partemp from w_base_busqueda_mod
integer width = 2350
string title = "Parte de materia prima"
event ue_preopen ( )
end type
global w_maestro_partemp w_maestro_partemp

type variables

Long il_tipoprod[]
String as_tipoprod
n_cst_seg_muestras				invo_seg_muestras 
CONSTANT LONG COD_PROG = 301512


end variables

forward prototypes
public function integer of_retorno ()
public function integer of_verifica ()
public function string wf_getusuariosconpermisosadmin ()
public function boolean wf_getusuariosconpermisosparam ()
public function boolean wf_validarpermisos ()
end prototypes

event ue_preopen();
Long ll_reg
n_cst_param lo_param


Open(w_seleccionar_m_tipoprod)

lo_param=Message.PowerObjectParm

If IsValid(lo_param) Then
	If  UpperBound(lo_param.il_vector) = 0 Then
		il_tipoprod[1] = 0
	End if
	
	For ll_reg = 1 to UpperBound(lo_param.il_vector)
		il_tipoprod[ll_reg] = lo_param.il_vector[ll_reg]
		If ll_reg = 1 Then
			as_tipoprod = String( lo_param.il_vector[ll_reg])
		Else
			as_tipoprod = as_tipoprod + ', ' +String( lo_param.il_vector[ll_reg])
		End if
	Next
Else
	il_tipoprod[1] = 0
End If	

end event

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_partemp")
Return 1
end function

public function integer of_verifica ();long ll_tot,i, ll_c,ll_c1
String ls_de_parte, ls_estado


of_filtro("")
dw_1.SetSort("co_tipoprod a, co_partemp a")
dw_1.Sort()

ll_tot=dw_1.RowCount()

For i=1 to ll_tot
	
	If IsNull(dw_1.GetItemNumber(i,"co_tipoprod")) Then
		MessageBox("Advertencia!","Tipo Producto no v$$HEX1$$e100$$ENDHEX$$lido, fila "+&
		String(i)+".",StopSign!)
		Return -1
	End If

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

	If IsNull(ls_de_parte) or trim(ls_de_parte) = '' Then
		MessageBox("Advertencia!","Descripci$$HEX1$$f300$$ENDHEX$$n de parte no v$$HEX1$$e100$$ENDHEX$$lida, fila "+&
		String(i)+".",StopSign!)
		Return -1
	End If
	
	//valida estado
	ls_estado=dw_1.GetItemString(i,"estado")

	If IsNull(ls_estado) or trim(ls_estado) = '' Then
		MessageBox("Advertencia!","Estado de parte no v$$HEX1$$e100$$ENDHEX$$lida, fila "+&
		String(i)+".",StopSign!)
		Return -1
	End If

Next

Return 1
end function

public function string wf_getusuariosconpermisosadmin ();
String			ls_UsersPermisos
Long 				ll_cont

Exception		ex
n_cst_comun		lo_comun

Try
	ex = Create Exception
	IF lo_comun.of_valorconstante("USER_MAESTRO_PARTES", n_cst_application.itr_appl) = -1 THEN 
		ex.setmessage('Fallo lectura de la constante USER_MAESTRO_PARTES')
		THROW ex
	ELSE 
		ls_UsersPermisos = lo_comun.of_getstring(1)
	END IF 

	RETURN ls_UsersPermisos
	
CATCH(Exception le_error)
	THROW ex
End Try
end function

public function boolean wf_getusuariosconpermisosparam ();
String			ls_null
Long 				ll_cont

Exception		ex
n_cst_comun		lo_comun

Try
	ex = Create Exception
	invo_seg_muestras.of_setOpcionGenerica(COD_PROG)
	invo_seg_muestras.of_setProgramaGenerico(COD_PROG)
	invo_seg_muestras.of_setArrayUsers()
	
	invo_seg_muestras.of_setnombredataobject('d_sq_gr_validaruser_perespxapli')
	invo_seg_muestras.of_recInfPermisosParaValidarIngreso()

	IF invo_seg_muestras.of_tieneparameaccesoalprograma() THEN 
		RETURN true
	ELSE 
		RETURN false
	END IF 
	
CATCH(Exception le_error)
	THROW ex
End Try
end function

public function boolean wf_validarpermisos ();String			ls_UsersPermisos,ls_array[]
Long 				ll_cont

Exception		ex
n_cst_string 	lnv_string

Try
	ex = Create Exception
	SetNull(ls_UsersPermisos)
	ls_UsersPermisos = wf_getUsuariosConPermisosAdmin()

	lnv_string.of_convertirstring_array(ls_UsersPermisos,ls_array)
	
	FOR ll_cont=1 to upperbound(ls_array[]) //Limite array
		IF gs_usuario = ls_array[ll_cont] THEN
			RETURN TRUE
		END IF
	NEXT
	
	//IF wf_getUsuariosConPermisosParam() THEN RETURN TRUE
	ex.setmessage("El usuario: "+gs_usuario +" No tiene permisos para acceder a la siguiente opcion.")
	THROW ex
	
CATCH(Exception le_error)
	Messagebox("Error de Permisos", le_error.getmessage())
	CLose(THIS)
	RETURN FALSE 
End Try
end function

on w_maestro_partemp.create
call super::create
end on

on w_maestro_partemp.destroy
call super::destroy
end on

event open;call super::open;
DataWindowChild ldc_datos
Boolean	lb_TienePermisos

il_tipoprod[1] = 0
 
lb_TienePermisos = wf_ValidarPermisos()
IF NOT(lb_TienePermisos) THEN RETURN 

This.TriggerEvent("ue_preopen")
If il_tipoprod[1] > 0 Then
	dw_1.Retrieve(il_tipoprod)
	
	dw_1.getChild("co_tipoprod",ldc_datos)
	ldc_datos.SetFilter('co_tipoprod in ( ' + as_tipoprod + ' )')
	ldc_datos.Filter()
Else
	Close(This)
End if


end event

type st_1 from w_base_busqueda_mod`st_1 within w_maestro_partemp
string text = "Digite parte:"
end type

type sle_1 from w_base_busqueda_mod`sle_1 within w_maestro_partemp
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

type cb_adicionar from w_base_busqueda_mod`cb_adicionar within w_maestro_partemp
integer x = 50
integer y = 1592
end type

type cb_eliminar from w_base_busqueda_mod`cb_eliminar within w_maestro_partemp
integer x = 448
integer y = 1592
end type

type cb_aceptar from w_base_busqueda_mod`cb_aceptar within w_maestro_partemp
integer x = 1527
integer y = 1592
integer height = 92
string text = "&Guardar"
end type

event cb_aceptar::clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 08 de Enero de 2003 HORA 11:17:57:265
// 
// 
//////////////////////////////////////////////////////////////////////////

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

If dw_1.Update()<>1 then
	RollBack Using n_cst_application.itr_appl ;
	MessageBox("Advertencia!","Ocurrio un inconveniente al actualizzar los datos. Se volveran a cargar las partes.")
	dw_1.Retrieve()
	Return
End If

Commit Using n_cst_application.itr_appl ;

MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Datos actualizados.")


end event

type cb_cancelar from w_base_busqueda_mod`cb_cancelar within w_maestro_partemp
integer x = 1906
integer y = 1592
integer height = 92
string text = "&Salir"
end type

type dw_1 from w_base_busqueda_mod`dw_1 within w_maestro_partemp
integer width = 2217
string dataobject = "d_gr_m_partemp_x_tipoprod"
end type

event dw_1::ue_insertrow;

Super::Event ue_insertRow()
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

event dw_1::doubleclicked;//se comenta porque no se guarda con doble click
end event

event dw_1::itemchanged;call super::itemchanged;
Long ll_cons, ll_find

If dwo.name = 'co_tipoprod' Then
	//si el campo de codigo esta en blanco lo asigna con el maximo para este tipoprod
	If Isnull(This.GetitemNumber(row,'co_partemp')) Then
		//busca codigo maximo
		ll_cons = 0
		ll_find = This.Find('co_tipoprod = ' + Trim(data),1 , This.RowCount() +1)
		do while ll_find > 0
			//mra si es mayor el codigo
			If This.GetitemNumber(ll_find,'co_partemp') > ll_cons Then
				ll_cons = This.GetitemNumber(ll_find,'co_partemp')
			End if
			
			ll_find = This.Find('co_tipoprod = ' + Trim(data),ll_find + 1 , This.RowCount() +1)
		loop
		//se suma 1
		ll_cons ++
		//se actualiza codigo
		This.SetItem(row,'co_partemp',ll_cons)
	End if
ElseIf dwo.name = 'co_partemp' Then
	//si co_tipoprod esta en nulo, no se permite cambio
	If Isnull(This.GetitemNumber(row,'co_tipoprod')) Then
		Post MessageBox("Atencion","El campo Tipo Producto esta en blanco.")
		Return 2
	End if	
	
End if
end event

type gb_1 from w_base_busqueda_mod`gb_1 within w_maestro_partemp
integer width = 2277
string text = "Partes"
end type

type gb_2 from w_base_busqueda_mod`gb_2 within w_maestro_partemp
end type

