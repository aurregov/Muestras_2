HA$PBExportHeader$w_opc_grupo_muestras.srw
$PBExportComments$Objeto Ventana para la captura de datos para el registro de los grupos de trabajo para la muestra muestra en una busqueda
forward
global type w_opc_grupo_muestras from w_response
end type
type cb_cancelar from u_cb_application within w_opc_grupo_muestras
end type
type cb_aceptar from u_cb_application within w_opc_grupo_muestras
end type
type dw_consulta from u_dw_application within w_opc_grupo_muestras
end type
type cb_buscar from u_cb_application within w_opc_grupo_muestras
end type
type dw_grupo from u_dw_application within w_opc_grupo_muestras
end type
type gb_datos_grupo from u_gb_base within w_opc_grupo_muestras
end type
type gb_grupos from u_gb_base within w_opc_grupo_muestras
end type
end forward

global type w_opc_grupo_muestras from w_response
string tag = "B$$HEX1$$fa00$$ENDHEX$$squeda de Grupos de Trabajo"
integer width = 3365
integer height = 1216
string title = "B$$HEX1$$fa00$$ENDHEX$$squeda de Grupos de Trabajo"
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
dw_consulta dw_consulta
cb_buscar cb_buscar
dw_grupo dw_grupo
gb_datos_grupo gb_datos_grupo
gb_grupos gb_grupos
end type
global w_opc_grupo_muestras w_opc_grupo_muestras

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Noviembre de 2004.H:09:12
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
	Date		: Viernes 05 de Noviembre de 2004.H:16:04
---------------------------------------------------
Seleccion de la fila se$$HEX1$$f100$$ENDHEX$$alada
Parametros: al_fila (fila actual)
Invoked By: w_opc_grupo_muestra.dw_consulta.doubleClicked()
				w_opc_grupo_muestra.dw_consulta.ItemFocusChanged()
---------------------------------------------------*/
il_fila=al_fila
dw_consulta.SelectRow(0,False)
dw_consulta.SelectRow(il_fila,True)
Return 1










end function

public function integer of_recuperar (string as_where);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 05 de Noviembre de 2004.H:16:04
---------------------------------------------------
Obtiene los resultados de busqueda del grupo
Parametros: as_where (clausula where de la consulta)
Invoked By: w_opc_grupo_muestra.cb_buscar.Clicked()
				w_opc_grupo_muestra.open()
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
		MessageBox('Advertencia!','No hay datos para la solicitud de grupo!.')
	case 1 //1 fila
		of_filaSel(1)
End Choose
dw_consulta.Modify("DataWindow.Table.Select='"+ls_origen+"'")
dw_consulta.SetFocus()

Return 1
end function

on w_opc_grupo_muestras.create
int iCurrent
call super::create
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.dw_consulta=create dw_consulta
this.cb_buscar=create cb_buscar
this.dw_grupo=create dw_grupo
this.gb_datos_grupo=create gb_datos_grupo
this.gb_grupos=create gb_grupos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancelar
this.Control[iCurrent+2]=this.cb_aceptar
this.Control[iCurrent+3]=this.dw_consulta
this.Control[iCurrent+4]=this.cb_buscar
this.Control[iCurrent+5]=this.dw_grupo
this.Control[iCurrent+6]=this.gb_datos_grupo
this.Control[iCurrent+7]=this.gb_grupos
end on

on w_opc_grupo_muestras.destroy
call super::destroy
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.dw_consulta)
destroy(this.cb_buscar)
destroy(this.dw_grupo)
destroy(this.gb_datos_grupo)
destroy(this.gb_grupos)
end on

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Noviembre de 2004.H:17:30
---------------------------------------------------
---------------------------------------------------*/
DataWindowChild ldwc_child

dw_grupo.InsertRow(0)
dw_consulta.SetTransObject(n_cst_application.itr_appl)
dw_grupo.GetChild( 'co_tipoprod', ldwc_child)
ldwc_child.SetTransObject(n_cst_application.itr_appl)
ldwc_child.Retrieve()
dw_grupo.SetFocus()
dw_grupo.SetColumn('id_grupo')
//-------------------------------------------------
end event

type cb_cancelar from u_cb_application within w_opc_grupo_muestras
integer x = 1719
integer y = 992
integer taborder = 50
string text = "&Cancelar"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 05 de Noviembre de 2004.H:18:08
---------------------------------------------------
---------------------------------------------------*/
Close(Parent)
end event

type cb_aceptar from u_cb_application within w_opc_grupo_muestras
integer x = 1390
integer y = 992
integer taborder = 40
string text = "&Aceptar"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 05 de Noviembre de 2004.H:18:08
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lou_param

If dw_grupo.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos de la b$$HEX1$$fa00$$ENDHEX$$squeda no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If

If il_fila<=0 then
	MessageBox("Advertencia!","Debe seleccionar un grupo.",StopSign!)
	Return
End If

//Se llena el los vectores de parametros para el objeto devuelto
lou_param.il_vector[1] = dw_consulta.GetItemNumber(il_fila,"id_grupo")
lou_param.il_vector[2] = dw_consulta.GetItemNumber(il_fila,"co_tipoprod")
lou_param.is_vector[1] = is_where

////Envio de parametros de vuelta
CloseWithReturn(Parent,lou_param)
end event

type dw_consulta from u_dw_application within w_opc_grupo_muestras
integer x = 1207
integer y = 96
integer width = 2085
integer height = 800
integer taborder = 30
string dataobject = "d_cons_grupo"
boolean hscrollbar = true
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 05 de Noviembre de 2004.H:18:05
---------------------------------------------------
---------------------------------------------------*/
If Row=0 Then Return

of_filaSel(Row)

end event

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 05 de Noviembre de 2004.H:18:05
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
	Date		: Viernes 05 de Noviembre de 2004.H:18:05
---------------------------------------------------
Overwrite
---------------------------------------------------*/
end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 05 de Noviembre de 2004.H:18:05
---------------------------------------------------
---------------------------------------------------*/

//Reject the data value but allow the focus to change
Return 2
end event

event itemfocuschanged;call super::itemfocuschanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 05 de Noviembre de 2004.H:18:05
---------------------------------------------------
---------------------------------------------------*/
If Row=0 Then Return

of_filaSel(Row)
end event

type cb_buscar from u_cb_application within w_opc_grupo_muestras
integer x = 439
integer y = 768
integer taborder = 20
string text = "&Buscar"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 05 de Noviembre de 2004.H:17:25
---------------------------------------------------
Construcci$$HEX1$$f300$$ENDHEX$$n de la sentencia para la busqueda...
---------------------------------------------------*/
String ls_cad_campo
//-------------------------------------------------

If dw_grupo.AcceptText()<>1 Then
	//MessageBox("Advertencia!","Datos no son v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	This.Event Losefocus()
	dw_grupo.SetFocus()
	Return
End If
//----------------------------------------------------------------------
is_where="where ("

//Field:id_grupo
ls_cad_campo=String(dw_grupo.GetItemNumber(1,"id_grupo"))
If Not IsNull(ls_cad_campo) Then
	is_where+="id_grupo="+ls_cad_campo+" and "
End If

//Field:de_grupo
ls_cad_campo=String(dw_grupo.GetItemString(1,"de_grupo"))
If Not IsNull(ls_cad_campo) Then
	is_where+="Upper(de_grupo) like ~~'%"+Upper(ls_cad_campo)+"%~~' and "
End If


//Field:id_turno
ls_cad_campo=String(dw_grupo.GetItemNumber(1,"id_turno"))
If Not IsNull(ls_cad_campo) Then
	is_where+="id_turno="+ls_cad_campo+" and "
End If

//Field:cantidad_colas
ls_cad_campo=String(dw_grupo.GetItemNumber(1,"cantidad_colas"))
If Not IsNull(ls_cad_campo) Then
	is_where+="cantidad_colas="+ls_cad_campo+" and "
End If

//-------------------------------------------------

//Field:co_tipoprod
ls_cad_campo=String(dw_grupo.GetItemNumber(1,"co_tipoprod"))
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

type dw_grupo from u_dw_application within w_opc_grupo_muestras
integer x = 46
integer y = 128
integer width = 1074
integer height = 544
string dataobject = "d_ext_datos_grupos"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 03 de Noviembre de 2004.H:16:35
---------------------------------------------------
Overwrite
---------------------------------------------------*/
end event

event itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 05 de Noviembre de 2004.H:14:26
---------------------------------------------------
--------------------------------------------------*/
n_cst_comun_orden lo_comun
Long ll_resultado
String ls_coltype 
//----------------------------------------------------------------------
If dwo.name="id_turno" Then
	ll_resultado = lo_comun.of_nombreturno(Long(Data),n_cst_application.itr_appl)
	If ll_resultado<>1 then 
		MessageBox("Advertencia!","Turno no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		SetItem(1,"de_turno","")
		//Return 2
	Else
		SetItem(1,"de_turno",Trim(lo_comun.of_getString(1)))	
	End If
End If
//-------------------------------------------------------------------
ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	If Trim(Data)='' AND NOt IsNull(Data) Then
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
//------------------------------------------------
ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	Return 1
End If

If dwo.name='id_grupo' OR dwo.name='id_turno' OR dwo.name='cantidad_colas' Then
	If Long(Data)=0 Then
		SetNull(li_null)
		This.SetItem(row,String(dwo.name),li_null)
		If dwo.name='id_turno' Then
			This.SetItem(row,'de_turno','')
		End If
		Return 3
	End If	
End If
end event

type gb_datos_grupo from u_gb_base within w_opc_grupo_muestras
integer x = 37
integer y = 32
integer width = 1097
integer height = 896
integer taborder = 0
long textcolor = 33554432
string text = "Datos del Grupo de Trabajo"
end type

type gb_grupos from u_gb_base within w_opc_grupo_muestras
integer x = 1170
integer y = 32
integer width = 2158
integer height = 896
integer taborder = 0
string text = "Grupos de Trabajo"
end type

