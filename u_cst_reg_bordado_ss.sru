HA$PBExportHeader$u_cst_reg_bordado_ss.sru
$PBExportComments$Objeto visible personalizado~r~nSe requiere para que el registro de bordados en las solicitudes de servicio.
forward
global type u_cst_reg_bordado_ss from u_cst_reg_bordado
end type
end forward

global type u_cst_reg_bordado_ss from u_cst_reg_bordado
integer height = 1864
end type
global u_cst_reg_bordado_ss u_cst_reg_bordado_ss

forward prototypes
public function integer of_buscar ()
end prototypes

public function integer of_buscar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:15:37
---------------------------------------------------
Permite que el usuario busque con un criterio, debe modificar el where en el dw.
---------------------------------------------------*/
Long ll_resultado, ll_i,ll_pos
String ls_msj='',ls_cad_campo,ls_sel_ini,ls_modString,ls_origen
n_cst_comun_orden lo_comun
//-------------------------------------------------------------------------------------------------
If ib_cambios Then
	ll_resultado=MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
	If ll_resultado=2 Then
		Return -2
	End If
End If
ib_cambios=False
//-------------------------------------------------------------------------------------------------
If dw_busqueda.RowCount()<=0 Then
			of_Reset()
			Return -1
End If
//-------------------------------------------------------------------------------------------------
/*****************************************-------------------------------------
Construcci$$HEX1$$f300$$ENDHEX$$n del where de la consulta del detalle
*****************************************-----------------------------------*/
ls_origen=dw_bordado.Describe("DataWindow.Table.Select")
is_where="where ("
ls_cad_campo=String(dw_busqueda.GetItemString(1,"de_bordado"))
If Not IsNull(ls_cad_campo) Then
	is_where+="Upper(de_bordado) LIKE ~~'%"+Upper(ls_cad_campo)+"%~~' and "
End If
ls_cad_campo=String(dw_busqueda.GetItemNumber(1,"puntadas"))
If Not IsNull(ls_cad_campo) Then
	is_where+="puntadas="+ls_cad_campo+" and "
End If
ls_cad_campo=String(dw_busqueda.GetItemNumber(1,"partes"))
If Not IsNull(ls_cad_campo) Then
	is_where+="partes="+ls_cad_campo+" and "
End If

is_where+="Upper(activo) LIKE ~~'%S%~~' and "

If Right(is_where,4)="and " Then
	is_where=left(is_where, len(is_where) - 4)+")"
End If

//-------------------------------------------------
If Right(is_where,1)=")" Then	
	ls_sel_ini=dw_bordado.Describe("DataWindow.Table.Select")
	ll_pos=Pos(ls_sel_ini,"where")
	If ll_pos>0 Then
		ls_sel_ini=Left(ls_sel_ini, ll_pos -1)
	End If
	ls_modString="DataWindow.Table.Select='"+ ls_sel_ini + is_where + "'"
	dw_bordado.Modify(ls_modString)
End If
//-------------------------------------------------------------------------------------------------
// Retrieve a los datos de la tabla de bordados 'mu_m_bordados'
ll_resultado = dw_bordado.Retrieve()
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de los bordados.",StopSign!)
		Return -1
	Case 0
		MessageBox("Advertencia!","Criterio de b$$HEX1$$fa00$$ENDHEX$$squeda no encontr$$HEX2$$f3002000$$ENDHEX$$ning$$HEX1$$fa00$$ENDHEX$$n registro.",StopSign!)			
		//Return -1
	Case Else
		of_sel_fila (1)
		dw_bordado.SetFocus()
End Choose
dw_bordado.Modify("DataWindow.Table.Select='"+ls_origen+"'")
//-------------------------------------------------------------------------------------------------
dw_bordado.SetSort('activo D, de_bordado A')
dw_bordado.Sort()
of_redraw(True)
Return 1
end function

on u_cst_reg_bordado_ss.create
call super::create
end on

on u_cst_reg_bordado_ss.destroy
call super::destroy
end on

event ue_save;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:11:05
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
If of_verificar()<>1 Then
	Return -1
End If

//of_Redraw(False)
If of_guardar()<>1 Then
	//of_Redraw(True)
	Return -1
End If
// Acepta los cambios en la BD. si todo sale bien
of_ok_bordado()
//***********************************************
MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Registro de Bordado(s) satisfactorio.")
//of_Redraw(True)
ib_cambios=False
Return 1
//of_buscar()
//---------------------------------------------------------------------------

end event

type cb_buscar from u_cst_reg_bordado`cb_buscar within u_cst_reg_bordado_ss
end type

event cb_buscar::clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:11:21
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
of_filtro("Match(activo,'S')")
end event

type dw_bordado from u_cst_reg_bordado`dw_bordado within u_cst_reg_bordado_ss
integer height = 1120
end type

event dw_bordado::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:15:27
---------------------------------------------------
---------------------------------------------------*/
gb_bordado.of_color(True)
end event

type dw_busqueda from u_cst_reg_bordado`dw_busqueda within u_cst_reg_bordado_ss
end type

event dw_busqueda::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:15:27
---------------------------------------------------
---------------------------------------------------*/
gb_busqueda.of_color(True)
end event

type gb_busqueda from u_cst_reg_bordado`gb_busqueda within u_cst_reg_bordado_ss
end type

type gb_bordado from u_cst_reg_bordado`gb_bordado within u_cst_reg_bordado_ss
integer height = 1312
end type

