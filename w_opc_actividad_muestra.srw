HA$PBExportHeader$w_opc_actividad_muestra.srw
$PBExportComments$Ventana de b$$HEX1$$fa00$$ENDHEX$$squeda para las actividades de la muestra en la programaci$$HEX1$$f300$$ENDHEX$$n
forward
global type w_opc_actividad_muestra from w_response
end type
type cb_cancelar from u_cb_application within w_opc_actividad_muestra
end type
type cb_aceptar from u_cb_application within w_opc_actividad_muestra
end type
type dw_consulta from u_dw_application within w_opc_actividad_muestra
end type
type cb_buscar from u_cb_application within w_opc_actividad_muestra
end type
type dw_actividad from u_dw_application within w_opc_actividad_muestra
end type
type gb_datos_actividad from u_gb_base within w_opc_actividad_muestra
end type
type gb_actividades from u_gb_base within w_opc_actividad_muestra
end type
end forward

global type w_opc_actividad_muestra from w_response
string tag = "B$$HEX1$$fa00$$ENDHEX$$squeda de Actividades"
integer width = 3634
integer height = 1216
string title = "B$$HEX1$$fa00$$ENDHEX$$squeda de Actividades"
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
dw_consulta dw_consulta
cb_buscar cb_buscar
dw_actividad dw_actividad
gb_datos_actividad gb_datos_actividad
gb_actividades gb_actividades
end type
global w_opc_actividad_muestra w_opc_actividad_muestra

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:11:24
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
Invoked By: w_opc_actividad_muestra.dw_consulta.doubleClicked()
				w_opc_actividad_muestra.dw_consulta.ItemFocusChanged()
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
Obtiene los resultados de busqueda de la actividad
Parametros: as_where (clausula where de la consulta)
Invoked By: w_opc_actividad_muestra.cb_buscar.Clicked()
				w_opc_actividad_muestra.open()
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

on w_opc_actividad_muestra.create
int iCurrent
call super::create
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.dw_consulta=create dw_consulta
this.cb_buscar=create cb_buscar
this.dw_actividad=create dw_actividad
this.gb_datos_actividad=create gb_datos_actividad
this.gb_actividades=create gb_actividades
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancelar
this.Control[iCurrent+2]=this.cb_aceptar
this.Control[iCurrent+3]=this.dw_consulta
this.Control[iCurrent+4]=this.cb_buscar
this.Control[iCurrent+5]=this.dw_actividad
this.Control[iCurrent+6]=this.gb_datos_actividad
this.Control[iCurrent+7]=this.gb_actividades
end on

on w_opc_actividad_muestra.destroy
call super::destroy
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.dw_consulta)
destroy(this.cb_buscar)
destroy(this.dw_actividad)
destroy(this.gb_datos_actividad)
destroy(this.gb_actividades)
end on

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:17:30
---------------------------------------------------

---------------------------------------------------*/
DataWindowChild ldwc_tipo

dw_actividad.InsertRow(0)
dw_consulta.SetTransObject(n_cst_application.itr_appl)
dw_actividad.SetFocus()
dw_actividad.SetColumn('id_actividad')

dw_actividad.GetChild('co_tipoprod', ldwc_tipo)
ldwc_tipo.SetTransObject(n_cst_application.itr_appl)
ldwc_tipo.Retrieve()
//-------------------------------------------------
end event

type cb_cancelar from u_cb_application within w_opc_actividad_muestra
integer x = 1938
integer y = 992
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

type cb_aceptar from u_cb_application within w_opc_actividad_muestra
integer x = 1609
integer y = 992
integer taborder = 40
string text = "&Aceptar"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:18:08
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lou_param

If dw_actividad.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos de la b$$HEX1$$fa00$$ENDHEX$$squeda no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If

If il_fila<=0 then
	MessageBox("Advertencia!","Debe seleccionar una actividad.",StopSign!)
	Return
End If

//Se llena el los vectores de parametros para el objeto devuelto
lou_param.il_vector[1] = dw_consulta.GetItemNumber(il_fila,"id_actividad")
lou_param.is_vector[1] = is_where

////Envio de parametros de vuelta
CloseWithReturn(Parent,lou_param)
end event

type dw_consulta from u_dw_application within w_opc_actividad_muestra
integer x = 1170
integer y = 96
integer width = 2377
integer height = 800
integer taborder = 30
string dataobject = "d_cons_actividad"
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

type cb_buscar from u_cb_application within w_opc_actividad_muestra
integer x = 402
integer y = 800
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

If dw_actividad.AcceptText()<>1 Then
	//MessageBox("Advertencia!","Datos no son v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	This.Event LoseFocus()
	dw_actividad.SetFocus()	
	Return
End If
//----------------------------------------------------------------------
is_where="where ("

//Field:id_actividad
ls_cad_campo=String(dw_actividad.GetItemNumber(1,"id_actividad"))
If Not IsNull(ls_cad_campo) Then
	is_where+="id_actividad="+ls_cad_campo+" and "
End If

//Field:de_actividad
ls_cad_campo=String(dw_actividad.GetItemString(1,"de_actividad"))
If Not IsNull(ls_cad_campo) Then
	is_where+="Upper(de_actividad) like ~~'%"+Upper(ls_cad_campo)+"%~~' and "
End If

//Field:co_estado
ls_cad_campo=String(dw_actividad.GetItemNumber(1,"co_estado"))
If Not IsNull(ls_cad_campo) Then
	is_where+="co_estado="+ls_cad_campo+" and "
End If
// MODIFICADO: Agosto 14 de 2009 - ohlondon
//Field:co_tipoprod
ls_cad_campo=String(dw_actividad.GetItemNumber(1,"co_tipoprod"))
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

type dw_actividad from u_dw_application within w_opc_actividad_muestra
integer x = 73
integer y = 128
integer width = 1024
integer height = 412
string dataobject = "d_ext_datos_actividad"
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
	Date		: Viernes 22 de Octubre de 2004.H:10:32
---------------------------------------------------
--------------------------------------------------*/
n_cst_comun lo_comun
Long ll_resultado
//----------------------------------------------------------------------
If dwo.name="co_estado" Then
	If IsNull(Data) Then 
		SetItem(1,"de_estado","")
		Return 0
	End If
	ll_resultado = lo_comun.of_nombreestadomuestra(Long(Data),n_cst_application.itr_appl)
	If ll_resultado<>1 then 
		MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo del estado no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		SetItem(1,"de_estado","")
		//Return 2
	Else
		SetItem(1,"de_estado",Trim(lo_comun.of_getString(1)))	
	End If
End If
//-------------------------------------------------------------------
String ls_coltype//Validacion de los campos de texto
ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	If Trim(Data)='' AND Not IsNull(Data) Then
		MessageBox('Advertencia','Texto del campo no v$$HEX1$$e100$$ENDHEX$$lido.S$$HEX1$$f300$$ENDHEX$$lo hay espacios en blanco',StopSign!)
		Return 1
	End If
	If This.of_validarcadena(Data)<>1 Then 
		Return 1
	End If
End If
end event

event itemerror;call super::itemerror;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 06 de Diciembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
Integer li_null
String ls_coltype
//-------------------------------------------------
ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	Return 1
End If

If dwo.name='id_actividad' OR dwo.name='co_estado' Then
	If Long(Data)=0 Then
		SetNull(li_null)
		This.SetItem(row,String(dwo.name),li_null)
		If dwo.name='co_estado' Then
			SetItem(row,'de_estado','')
		End If
		Return 3
	End If	
End If
end event

type gb_datos_actividad from u_gb_base within w_opc_actividad_muestra
integer x = 37
integer y = 32
integer width = 1097
integer height = 896
integer taborder = 0
long textcolor = 33554432
string text = "Datos de la Actividad"
end type

type gb_actividades from u_gb_base within w_opc_actividad_muestra
integer x = 1134
integer y = 32
integer width = 2450
integer height = 896
integer taborder = 0
string text = "Actividades"
end type

