HA$PBExportHeader$w_busins_m_disenos_muestras_disenos.srw
$PBExportComments$Permite buscar e insertar partes de materia prima
forward
global type w_busins_m_disenos_muestras_disenos from w_base_busqueda_mod
end type
end forward

global type w_busins_m_disenos_muestras_disenos from w_base_busqueda_mod
integer width = 1650
string title = "Dise$$HEX1$$f100$$ENDHEX$$os de muestras"
end type
global w_busins_m_disenos_muestras_disenos w_busins_m_disenos_muestras_disenos

forward prototypes
public function integer of_retorno ()
public function integer of_verifica ()
end prototypes

public function integer of_retorno ();io_retorno.il_vector[1]=dw_1.GetItemNumber(il_fila,"co_diseno")
Return 1
end function

public function integer of_verifica ();long ll_tot,i, ll_c,ll_c1
String ls_de_combi

long ll_res
string ls_diseno_muestra
n_cst_comun lo_comun


of_filtro("")
dw_1.SetSort("co_diseno a")
dw_1.Sort()

ll_tot=dw_1.RowCount()

For i=1 to ll_tot
	ll_c=dw_1.GetItemNumber(i,"co_diseno")


	If IsNull(ll_c) Then
		MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo de dise$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido, fila "+&
		String(i)+".",StopSign!)
		Return -1
	End If

	If i<ll_tot Then
		ll_c1=dw_1.GetItemNUmber(i+1,"co_diseno")
		If ll_c=ll_c1 Then
			MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo de dise$$HEX1$$f100$$ENDHEX$$o repetido, fila "+&
			String(i)+".",StopSign!)
			Return -1
		End If
	End If

	// Nov 24 de 2010,  
	ls_diseno_muestra = dw_1.GetItemString(i,"de_diseno")
	IF NOT IsNull(ls_diseno_muestra ) AND Trim(ls_diseno_muestra) <> '' THEN 
		ll_res=lo_comun.of_validardiseno(io_param.il_vector[3], ls_diseno_muestra,n_cst_application.itr_appl)	
		
		If ll_res = -1 Then
			//HUbo un error y ya lo mostro en of_validardiseno
			SetNUll(ll_res)
			 
			dw_1.SetItem(i,'de_diseno',ll_res)
			dw_1.SetFocus()
			dw_1.SetColumn('de_diseno')
			Return -1
		ElseIf ll_res = 1 Then
			SetNUll(ll_res)
			MessageBox("Advertencia!","El Dise$$HEX1$$f100$$ENDHEX$$o ya est$$HEX2$$e1002000$$ENDHEX$$asignado en otra muestra. Por favor verifique.",StopSign!)
			dw_1.SetItem(1,'co_diseno_muestra',ll_res)
			dw_1.SetFocus()
			dw_1.SetColumn('co_diseno_muestra')
			Return -1
		End If
	END IF

	// ---------------------------------------------------------------------------


	ls_de_combi=dw_1.GetItemString(i,"de_diseno")

	If IsNull(ls_de_combi) Then
		MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo de dise$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido, fila "+&
		String(i)+".",StopSign!)
		Return -1
	End If


Next

Return 1

end function

on w_busins_m_disenos_muestras_disenos.create
call super::create
end on

on w_busins_m_disenos_muestras_disenos.destroy
call super::destroy
end on

event open;call super::open;long ll_tot

ll_tot=dw_1.Retrieve(io_param.il_vector[1]/*fabrica*/,&
              io_param.il_vector[2]/*linea*/,&
				  io_param.il_vector[3]/*muestra*/,&
				  io_param.il_vector[4]/*talla*/)

If ll_tot=0 Then
	dw_1.triggerEvent("ue_insertrow")
End If
end event

type st_1 from w_base_busqueda_mod`st_1 within w_busins_m_disenos_muestras_disenos
string text = "Digite el Dise$$HEX1$$f100$$ENDHEX$$o:"
end type

type sle_1 from w_base_busqueda_mod`sle_1 within w_busins_m_disenos_muestras_disenos
end type

event sle_1::modified;call super::modified;String ls_filtro

ls_filtro = "de_diseno like '%"+text+"%'"
IF Trim(text) = '' OR IsNull(text) THEN ls_filtro = ''
	
of_filtro(ls_filtro)

end event

type cb_adicionar from w_base_busqueda_mod`cb_adicionar within w_busins_m_disenos_muestras_disenos
integer x = 82
integer y = 1604
integer height = 100
integer taborder = 30
end type

type cb_eliminar from w_base_busqueda_mod`cb_eliminar within w_busins_m_disenos_muestras_disenos
integer x = 430
integer y = 1604
integer height = 100
integer taborder = 40
end type

event cb_eliminar::clicked;call super::clicked;IF dw_1.RowCount() > 0 THEN il_fila = dw_1.GetRow()
	
end event

type cb_aceptar from w_base_busqueda_mod`cb_aceptar within w_busins_m_disenos_muestras_disenos
integer x = 864
integer y = 1604
integer taborder = 50
end type

event cb_aceptar::clicked;//////////////////////////////////////////////////////////////////////////
// Nov 24 de 2010
// 
//////////////////////////////////////////////////////////////////////////
String 	ls_diseno
Long 		ll_totfilas, ll_fila 
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

// Nov 24 de 2010,  
ll_totfilas = dw_1.RowCount()

For ll_fila=1 to ll_totfilas
	ls_diseno = dw_1.GetItemString(ll_fila,"de_diseno")

	UPDATE m_codigos_disenos
      SET (sw_usado, fe_actualizacion, usuario, instancia) = 
	       (1, current, user, sitename)    
    WHERE m_codigos_disenos.de_diseno = :ls_diseno 
    USING n_cst_application.itr_appl;
	
	If n_cst_application.itr_appl.SQLcode=-1 Then 
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(n_cst_application.itr_appl)
		Return -1
	End If
NEXT
 
If dw_1.Update()<>1 then
	RollBack Using n_cst_application.itr_appl ;
	Return
End If

Commit Using n_cst_application.itr_appl ;

If dw_1.RowCount()>0 Then
	CloseWithReturn(Parent,io_retorno)
Else
	Close(Parent)
End If



end event

type cb_cancelar from w_base_busqueda_mod`cb_cancelar within w_busins_m_disenos_muestras_disenos
integer x = 1216
integer y = 1604
integer taborder = 60
end type

type dw_1 from w_base_busqueda_mod`dw_1 within w_busins_m_disenos_muestras_disenos
integer x = 50
integer width = 1541
integer height = 1240
integer taborder = 20
string dataobject = "d_listains_m_disenos_muestras"
end type

event dw_1::ue_insertrow;call super::ue_insertrow;
long ll_res
string ls_diseno_muestra
n_cst_param lo_param
n_cst_comun lo_comun
long ll_f

ll_f=GetRow()

SetItem(ll_f,"co_fabrica",io_param.il_vector[1])
SetItem(ll_f,"co_linea",io_param.il_vector[2])
SetItem(ll_f,"co_muestra",io_param.il_vector[3])
SetItem(ll_f,"co_talla",io_param.il_vector[4])

Long ll_cons

ll_cons = Long(This.Describe("Evaluate('max(co_diseno for all)', 0)"))

If IsNull(ll_cons) Then ll_cons=0

ll_cons++

SetItem(ll_f,"co_diseno",ll_cons)

// Nov 24 de 2010,  
/* PARA LO DE DISE$$HEX1$$d100$$ENDHEX$$O POR MUESTRA

lo_param.is_vector[1] = ''
lo_param.il_vector[1] = 0
OpenWithParm(w_m_codigos_disenos,lo_param)

lo_param = Message.PowerObjectParm
If (IsValid(lo_param) ) THEN 
	IF UpperBound(lo_param.is_vector) > 0 THEN
		ls_diseno_muestra=lo_param.is_vector[1]
		This.SetItem(ll_f,'de_diseno',ls_diseno_muestra)
	END IF
Else
	This.SetFocus()
	This.SetColumn('de_diseno')
	Return 
End If
*/

SetColumn("de_diseno")


end event

event dw_1::ue_dwnprocessenter;if this.AcceptText() < 0 then
  Return 1
end if
//de_diseno
if this.GetColumn() = 6 then
 if this.GetRow() = this.RowCount() then
	postEvent("ue_insertRow")
   Return 1
 end if
end if

Send(Handle(this),256,9,Long(0,0))
return 1

end event

type gb_1 from w_base_busqueda_mod`gb_1 within w_busins_m_disenos_muestras_disenos
integer width = 1586
integer taborder = 0
string text = "Dise$$HEX1$$f100$$ENDHEX$$os de muestra"
end type

type gb_2 from w_base_busqueda_mod`gb_2 within w_busins_m_disenos_muestras_disenos
integer width = 1586
integer taborder = 0
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda de dise$$HEX1$$f100$$ENDHEX$$o"
end type

