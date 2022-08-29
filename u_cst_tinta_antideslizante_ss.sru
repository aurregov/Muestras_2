HA$PBExportHeader$u_cst_tinta_antideslizante_ss.sru
$PBExportComments$Objeto visible personalizado~r~nSe requiere para que el registro de tintas antideslizantes en las solicitudes de servicio
forward
global type u_cst_tinta_antideslizante_ss from u_cst_tinta_antideslizante
end type
end forward

global type u_cst_tinta_antideslizante_ss from u_cst_tinta_antideslizante
integer height = 1788
end type
global u_cst_tinta_antideslizante_ss u_cst_tinta_antideslizante_ss

forward prototypes
public function integer of_buscar ()
end prototypes

public function integer of_buscar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:11:26
---------------------------------------------------
Description from Design Model:
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
ls_origen=dw_detalle.Describe("DataWindow.Table.Select")
is_where="where (Upper(activo) LIKE ~~'%S%~~')"
ls_cad_campo=String(dw_busqueda.GetItemString(1,"de_tinta"))
If Not IsNull(ls_cad_campo) Then
	is_where+="AND (Upper(de_tinta) LIKE ~~'%"+Upper(ls_cad_campo)+"%~~')"
End If
//-------------------------------------------------
If Right(is_where,1)=")" Then	
	ls_sel_ini=dw_detalle.Describe("DataWindow.Table.Select")
	ll_pos=Pos(ls_sel_ini,"where")
	If ll_pos>0 Then
		ls_sel_ini=Left(ls_sel_ini, ll_pos -1)
	End If
	ls_modString="DataWindow.Table.Select='"+ ls_sel_ini + is_where + "'"
	dw_detalle.Modify(ls_modString)
End If
//-------------------------------------------------------------------------------------------------
//messagebox('',ls_modString)
// Retrieve a los datos de la tabla de tintas antideslizantes 'mu_m_tinta'
ll_resultado = dw_detalle.Retrieve()
Choose Case ll_resultado
	Case Is < 0 
		MessageBox("Advertencia!","Error recuperando datos de las tintas antideslizantes.",StopSign!)
		Return -1
	Case 0
		MessageBox("Advertencia!","Criterio de b$$HEX1$$fa00$$ENDHEX$$squeda no encontr$$HEX2$$f3002000$$ENDHEX$$ning$$HEX1$$fa00$$ENDHEX$$n registro.",StopSign!)			
		//Return -1
	Case Else
		of_sel_fila (1)
		dw_detalle.SetFocus()
End Choose
dw_detalle.SetSort('activo D, de_tinta A')
dw_detalle.Modify("DataWindow.Table.Select='"+ls_origen+"'")
//-------------------------------------------------------------------------------------------------
of_redraw(True)
Return 1
end function

on u_cst_tinta_antideslizante_ss.create
call super::create
end on

on u_cst_tinta_antideslizante_ss.destroy
call super::destroy
end on

type cb_buscar from u_cst_tinta_antideslizante`cb_buscar within u_cst_tinta_antideslizante_ss
end type

event cb_buscar::clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:11:21
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
of_filtro("Match(activo,'S')")
end event

type dw_detalle from u_cst_tinta_antideslizante`dw_detalle within u_cst_tinta_antideslizante_ss
integer height = 1088
end type

event dw_detalle::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:11:18
---------------------------------------------------
---------------------------------------------------*/
gb_detalle.of_color(True)
end event

type dw_busqueda from u_cst_tinta_antideslizante`dw_busqueda within u_cst_tinta_antideslizante_ss
end type

event dw_busqueda::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:11:18
---------------------------------------------------
---------------------------------------------------*/
gb_busqueda.of_color(True)
end event

type gb_busqueda from u_cst_tinta_antideslizante`gb_busqueda within u_cst_tinta_antideslizante_ss
end type

type gb_detalle from u_cst_tinta_antideslizante`gb_detalle within u_cst_tinta_antideslizante_ss
integer height = 1216
end type

