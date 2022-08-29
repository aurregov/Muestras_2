HA$PBExportHeader$u_cst_chablon_ss.sru
$PBExportComments$Objeto visible personalizado~r~nSe requiere para que el mantenimiento de chablones en las solicitudes de servicio
forward
global type u_cst_chablon_ss from u_cst_chablon
end type
end forward

global type u_cst_chablon_ss from u_cst_chablon
integer width = 2395
integer height = 1748
end type
global u_cst_chablon_ss u_cst_chablon_ss

forward prototypes
public function integer of_buscar ()
end prototypes

public function integer of_buscar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:12:22
---------------------------------------------------
Description from Design Model:
Permite que el usuario busque con un criterio, debe modificar el where en el dw.
*Para el graficador buscar por descripci$$HEX1$$f300$$ENDHEX$$n.
*Para el desarrollo de chablon, buscar por descripci$$HEX1$$f300$$ENDHEX$$n, cantidad chab, calibre.
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
ls_origen=dw_chablon.Describe("DataWindow.Table.Select")
is_where="where (Upper(activo) LIKE ~~'%S%~~' and "
Choose Case ii_operario
	Case 1 // Desallador Graficador
		//If dw_busqueda.DataObject='d_ext_chab_graf' Then
			ls_cad_campo=String(dw_busqueda.GetItemString(1,"de_grafico"))
			If Not IsNull(ls_cad_campo) Then
				is_where+="Upper(de_chablon) LIKE ~~'%"+Upper(ls_cad_campo)+"%~~' )"
			End If
//		Else
//			MessageBox('Advertencia','Error en la asignaci$$HEX1$$f300$$ENDHEX$$n del objeto de b$$HEX1$$fa00$$ENDHEX$$squeda para el '+is_operario)
//		End If
	Case 2 // Desarrollador Chablones
//		If dw_busqueda.DataObject='d_ext_chab_chab' Then
			ls_cad_campo=String(dw_busqueda.GetItemString(1,"de_chablon"))
			If Not IsNull(ls_cad_campo) Then
				is_where+="Upper(de_chablon) LIKE ~~'%"+Upper(ls_cad_campo)+"%~~' and "
			End If
			ls_cad_campo=String(dw_busqueda.GetItemNumber(1,"cantidad"))
			If Not IsNull(ls_cad_campo) Then
				is_where+="cantidad="+ls_cad_campo+" and "
			End If
			ls_cad_campo=String(dw_busqueda.GetItemNumber(1,"calibre"))
			If Not IsNull(ls_cad_campo) Then
				is_where+="id_calibre="+ls_cad_campo+" and "
			End If
			If Right(is_where,4)="and " Then
				is_where=left(is_where, len(is_where) - 4)+")"
			End If
//		Else
//			MessageBox('Advertencia','Error en la asignaci$$HEX1$$f300$$ENDHEX$$n del objeto de b$$HEX1$$fa00$$ENDHEX$$squeda para el '+is_operario)
//		End If
End Choose

//-------------------------------------------------
If Right(is_where,1)=")" Then	
	ls_sel_ini=dw_chablon.Describe("DataWindow.Table.Select")
	ll_pos=Pos(ls_sel_ini,"where")
	If ll_pos>0 Then
		ls_sel_ini=Left(ls_sel_ini, ll_pos -1)
	End If
	ls_modString="DataWindow.Table.Select='"+ ls_sel_ini + is_where + "'"
	dw_chablon.Modify(ls_modString)
End If
//-------------------------------------------------------------------------------------------------
// Retrieve a los datos de la tabla de chablones 'mu_m_chablon'
ll_resultado = dw_chablon.Retrieve()
Choose Case ll_resultado
	Case Is < 0 
			Choose Case ii_operario
				Case 1 // Desarrollador Graficos
					MessageBox("Advertencia!","Error recuperando datos de los gr$$HEX1$$e100$$ENDHEX$$ficos.",StopSign!)
				Case 2 // Desarrollador Chablones
					MessageBox("Advertencia!","Error recuperando datos de los chablones.",StopSign!)
			End Choose		
			Return -1
	Case 0
			Choose Case ii_operario
					Case 1 // Desarrollador Graficos
						MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Criterio de b$$HEX1$$fa00$$ENDHEX$$squeda no encontr$$HEX2$$f3002000$$ENDHEX$$ning$$HEX1$$fa00$$ENDHEX$$n registro de gr$$HEX1$$e100$$ENDHEX$$ficos.",Information!)			
					Case 2 // Desarrollador Chablones
						MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n","Criterio de b$$HEX1$$fa00$$ENDHEX$$squeda no encontr$$HEX2$$f3002000$$ENDHEX$$ning$$HEX1$$fa00$$ENDHEX$$n registro de chablones.",Information!)			
			End Choose		
			//Return -1
	Case Else
		of_sel_fila (1)
		dw_chablon.SetFocus()
End Choose
//-------------------------------------------------------------------------------------------------
dw_chablon.Modify("DataWindow.Table.Select='"+ls_origen+"'")
dw_chablon.SetSort('activo D, de_chablon A')
of_redraw(True)
Return 1
end function

on u_cst_chablon_ss.create
call super::create
end on

on u_cst_chablon_ss.destroy
call super::destroy
end on

type cb_buscar from u_cst_chablon`cb_buscar within u_cst_chablon_ss
integer x = 1938
end type

event cb_buscar::clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:11:21
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
of_filtro("Match(activo,'S')")
end event

type dw_chablon from u_cst_chablon`dw_chablon within u_cst_chablon_ss
integer width = 2158
integer height = 992
end type

event dw_chablon::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:11:18
---------------------------------------------------
---------------------------------------------------*/
gb_chablon.of_color(True)
end event

type dw_busqueda from u_cst_chablon`dw_busqueda within u_cst_chablon_ss
end type

event dw_busqueda::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:11:18
---------------------------------------------------
---------------------------------------------------*/
gb_busqueda.of_color(True)
end event

type gb_busqueda from u_cst_chablon`gb_busqueda within u_cst_chablon_ss
integer width = 2304
end type

type gb_chablon from u_cst_chablon`gb_chablon within u_cst_chablon_ss
integer width = 2304
integer height = 1152
end type

