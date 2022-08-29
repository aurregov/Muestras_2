HA$PBExportHeader$w_opc_proceso_muestras.srw
$PBExportComments$Ventana de b$$HEX1$$fa00$$ENDHEX$$squeda para las actividades de la muestra en la programaci$$HEX1$$f300$$ENDHEX$$n
forward
global type w_opc_proceso_muestras from w_response
end type
type cb_cancelar from u_cb_application within w_opc_proceso_muestras
end type
type cb_aceptar from u_cb_application within w_opc_proceso_muestras
end type
type dw_consulta from u_dw_application within w_opc_proceso_muestras
end type
type cb_buscar from u_cb_application within w_opc_proceso_muestras
end type
type dw_operacion from u_dw_application within w_opc_proceso_muestras
end type
type gb_datos_operacion from u_gb_base within w_opc_proceso_muestras
end type
type gb_operaciones from u_gb_base within w_opc_proceso_muestras
end type
end forward

global type w_opc_proceso_muestras from w_response
string tag = "B$$HEX1$$fa00$$ENDHEX$$squeda de Operaciones"
integer width = 3488
integer height = 1276
string title = "B$$HEX1$$fa00$$ENDHEX$$squeda de Operaciones"
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
dw_consulta dw_consulta
cb_buscar cb_buscar
dw_operacion dw_operacion
gb_datos_operacion gb_datos_operacion
gb_operaciones gb_operaciones
end type
global w_opc_proceso_muestras w_opc_proceso_muestras

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:09:23
---------------------------------------------------
---------------------------------------------------*/
Public:

	String is_where
	Long il_fila=0

end variables

forward prototypes
public function integer of_filasel (long al_fila)
public function integer of_recuperar (string as_where)
end prototypes

public function integer of_filasel (long al_fila);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:16:04
---------------------------------------------------
Seleccion de la fila se$$HEX1$$f100$$ENDHEX$$alada
Parametros: al_fila (fila actual)
Invoked By: w_opc_proceso_muestra.dw_consulta.doubleClicked()
				w_opc_proceso_muestra.dw_consulta.ItemFocusChanged()
---------------------------------------------------*/
il_fila=al_fila
dw_consulta.SelectRow(0,False)
dw_consulta.SelectRow(il_fila,True)
Return 1










end function

public function integer of_recuperar (string as_where);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:16:04
---------------------------------------------------
Obtiene los resultados de busqueda de la operaci$$HEX1$$f300$$ENDHEX$$n
Parametros: as_where (clausula where de la consulta)
Invoked By: w_opc_proceso_muestra.cb_buscar.Clicked()
				w_opc_proceso_muestra.open()
---------------------------------------------------*/
String ls_sel_ini,ls_modString,ls_origen
Long ll_pos
//---------------------------------------------------
// Modificacion de la clausula where para la consulta del
// dw_consulta
ls_sel_ini=dw_consulta.Describe("DataWindow.Table.Select")
ls_origen=ls_sel_ini
If Right(as_where,1)=")" Then	
	ll_pos=Pos(ls_sel_ini,"where")
	If ll_pos>0 Then
		ls_sel_ini=Left(ls_sel_ini, ll_pos -1)
	End If
	ls_modString="DataWindow.Table.Select='" &
		+ ls_sel_ini + as_where + "'"
	dw_consulta.Modify(ls_modString)
End If
il_fila=0
Choose Case dw_consulta.Retrieve()
	case -1 // Error
		MessageBox('Problema con DB','Error en Solicitud!.',StopSign!)
	case 0 // No hubieron datos devueltos
		MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','No hay datos para la solicitud!.')
	case 1 //1 fila
		of_filaSel(1)
End Choose
dw_consulta.Modify("DataWindow.Table.Select='"+ls_origen+"'")
dw_consulta.SetFocus()

Return 1
end function

on w_opc_proceso_muestras.create
int iCurrent
call super::create
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.dw_consulta=create dw_consulta
this.cb_buscar=create cb_buscar
this.dw_operacion=create dw_operacion
this.gb_datos_operacion=create gb_datos_operacion
this.gb_operaciones=create gb_operaciones
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancelar
this.Control[iCurrent+2]=this.cb_aceptar
this.Control[iCurrent+3]=this.dw_consulta
this.Control[iCurrent+4]=this.cb_buscar
this.Control[iCurrent+5]=this.dw_operacion
this.Control[iCurrent+6]=this.gb_datos_operacion
this.Control[iCurrent+7]=this.gb_operaciones
end on

on w_opc_proceso_muestras.destroy
call super::destroy
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.dw_consulta)
destroy(this.cb_buscar)
destroy(this.dw_operacion)
destroy(this.gb_datos_operacion)
destroy(this.gb_operaciones)
end on

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:17:30
---------------------------------------------------
---------------------------------------------------*/
DatawindowChild ldwc_tipo
dw_operacion.InsertRow(0)
dw_consulta.SetTransObject(n_cst_application.itr_appl)

dw_operacion.GetChild('co_tipoprod', ldwc_tipo)
ldwc_tipo.SetTransObject(n_cst_application.itr_appl)
ldwc_tipo.retrieve()

dw_operacion.SetFocus()
dw_operacion.SetColumn('co_operacion')
//-------------------------------------------------
end event

type cb_cancelar from u_cb_application within w_opc_proceso_muestras
integer x = 1792
integer y = 1056
integer taborder = 50
string text = "&Cancelar"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:18:08
---------------------------------------------------
---------------------------------------------------*/
Close(Parent)
end event

type cb_aceptar from u_cb_application within w_opc_proceso_muestras
integer x = 1463
integer y = 1056
integer taborder = 40
string text = "&Aceptar"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:18:08
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lou_param

If dw_operacion.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos de la b$$HEX1$$fa00$$ENDHEX$$squeda no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If

If il_fila<=0 then
	MessageBox("Advertencia!","Debe seleccionar una operaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
	Return
End If

//Se llena el los vectores de parametros para el objeto devuelto
lou_param.il_vector[1] = dw_consulta.GetItemNumber(il_fila,"co_operacion")
lou_param.il_vector[2] = dw_consulta.GetItemNumber(il_fila,"co_tipoprod")
lou_param.is_vector[1] = is_where

////Envio de parametros de vuelta
CloseWithReturn(Parent,lou_param)
end event

type dw_consulta from u_dw_application within w_opc_proceso_muestras
integer x = 1280
integer y = 96
integer width = 2121
integer height = 896
integer taborder = 30
string dataobject = "d_cons_operacion"
boolean hscrollbar = true
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:18:05
---------------------------------------------------
---------------------------------------------------*/
If Row=0 Then Return

of_filaSel(Row)

end event

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:18:05
---------------------------------------------------
---------------------------------------------------*/

If Row=0 Then Return
// Selecciona la columna ...
of_filaSel(Row)
// Realiza el proceso de aceptaci$$HEX1$$f300$$ENDHEX$$n...
cb_aceptar.Trigger Event Clicked()
end event

event getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:18:05
---------------------------------------------------
Overwrite
---------------------------------------------------*/
end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:18:05
---------------------------------------------------
---------------------------------------------------*/

//Reject the data value but allow the focus to change
Return 2
end event

event itemfocuschanged;call super::itemfocuschanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:18:05
---------------------------------------------------
---------------------------------------------------*/
If Row=0 Then Return

of_filaSel(Row)
end event

type cb_buscar from u_cb_application within w_opc_proceso_muestras
integer x = 475
integer y = 864
integer taborder = 20
string text = "&Buscar"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:17:25
---------------------------------------------------
Construcci$$HEX1$$f300$$ENDHEX$$n de la sentencia para la busqueda...
---------------------------------------------------*/
String ls_cad_campo
//-------------------------------------------------

If dw_operacion.AcceptText()<>1 Then
	//MessageBox("Advertencia!","Datos no son v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	This.Event LoseFocus()
	dw_operacion.SetFocus()
	Return
End If
//----------------------------------------------------------------------
is_where="where ("

//Field:co_operacion
ls_cad_campo=String(dw_operacion.GetItemNumber(1,"co_operacion"))
If Not IsNull(ls_cad_campo) Then
	is_where+="co_operacion="+ls_cad_campo+" and "
End If

////Field:de_operacion
//ls_cad_campo=String(dw_operacion.GetItemString(1,"de_operacion"))
//If Not IsNull(ls_cad_campo) Then
//	is_where+="de_operacion like ~~'%"+ls_cad_campo+"%~~' and "
//End If

//Field:co_estado
ls_cad_campo=String(dw_operacion.GetItemNumber(1,"co_estado"))
If Not IsNull(ls_cad_campo) Then
	is_where+="co_estado="+ls_cad_campo+" and "
End If

//Field:co_tipoprod
ls_cad_campo=String(dw_operacion.GetItemNumber(1,"co_tipoprod"))
If Not IsNull(ls_cad_campo) Then
	is_where+="co_tipoprod="+ls_cad_campo+" and "
End If
//-------------------------------------------------
If Right(is_where,4)="and " Then
	is_where=left(is_where, len(is_where) - 4)+")"
	
End If
//-------------------------------------------------
//ls_cad_campo=dw_consulta.Describe("DataWindow.Table.Select")
//MessageBox('SELECT * FROM ~'dt_mu_ord~'','< '+is_where+'>~n Table.Select:'+ls_cad_campo,Exclamation!,OK!)
of_recuperar(is_where)
end event

type dw_operacion from u_dw_application within w_opc_proceso_muestras
integer x = 69
integer y = 128
integer width = 1111
integer height = 480
string dataobject = "d_ext_datos_operacion"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:16:35
---------------------------------------------------
Overwrite
---------------------------------------------------*/
end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:11:12
---------------------------------------------------
--------------------------------------------------*/
n_cst_comun_orden lo_comun
Long ll_resultado, ll_tipoprod
//----------------------------------------------------------------------
If dwo.name="co_operacion" Then
	If IsNull(Data) Then 
		SetItem(1,"de_operacion","")
		Return 0
	End If
	ll_tipoprod = GetItemNumber(row, 'co_tipoprod' )
	IF NOT IsNull(ll_tipoprod) THEN
		ll_resultado = lo_comun.of_nombre_operac_muestra(Long(Data),&
							ll_tipoprod,&
							n_cst_application.itr_appl)
			If ll_resultado<>1 then 
		//			ll_resultado = lo_comun.of_nombreoperacion(10,Long(Data),n_cst_application.itr_appl)			
		//			If ll_resultado<>1 then 
						MessageBox("Advertencia!","Operaci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)				
		//			Else
		//				MessageBox("Advertencia!","Operaci$$HEX1$$f300$$ENDHEX$$n v$$HEX1$$e100$$ENDHEX$$lida pero no est$$HEX2$$e1002000$$ENDHEX$$registrada para las muestras.",StopSign!)	
		//			End If
					SetItem(1,"de_operacion","")
					//Return 2
		Else
			SetItem(1,"de_operacion",Trim(lo_comun.of_getString(1)))
		End If
	END IF
End If
//-------------------------------
If dwo.name="co_estado" Then
	If IsNull(Data) Then 
		SetItem(1,"de_estado","")
		Return 0
	End If
	ll_resultado = lo_comun.of_nombreestadomuestra(Long(Data),n_cst_application.itr_appl)
	If ll_resultado<>1 then 
		MessageBox("Advertencia!","Estado no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		SetItem(1,"de_estado","")
		//Return 2
	Else
		SetItem(1,"de_estado",Trim(lo_comun.of_getString(1)))
	End If
End If
//-------------------------------------------------------------------
//If This.of_validarcadena(Data)<>1 Then Return 2
end event

event itemerror;call super::itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 06 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Integer li_null
String ls_col
//-------------------------------------------------
If dwo.name='co_operacion' OR dwo.name='co_estado' Then
	If Long(Data)=0 Then
		SetNull(li_null)
		ls_col=dwo.name
		This.SetItem(row,ls_col,li_null)
		If dwo.name='co_operacion' Then
			SetItem(row,'de_operacion','')
		ElseIf dwo.name='co_estado' Then
			SetItem(row,'de_estado','')
		End If
		Return 3
	End If	
End If
end event

type gb_datos_operacion from u_gb_base within w_opc_proceso_muestras
integer x = 37
integer y = 32
integer width = 1170
integer height = 992
integer taborder = 0
long textcolor = 33554432
string text = "Datos de la operaci$$HEX1$$f300$$ENDHEX$$n"
end type

type gb_operaciones from u_gb_base within w_opc_proceso_muestras
integer x = 1243
integer y = 32
integer width = 2194
integer height = 992
integer taborder = 0
string text = "Operaciones"
end type

