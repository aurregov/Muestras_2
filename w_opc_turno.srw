HA$PBExportHeader$w_opc_turno.srw
$PBExportComments$Ventana de b$$HEX1$$fa00$$ENDHEX$$squeda para los turnos registrados.
forward
global type w_opc_turno from w_response
end type
type cb_cancelar from u_cb_application within w_opc_turno
end type
type cb_aceptar from u_cb_application within w_opc_turno
end type
type dw_consulta from u_dw_application within w_opc_turno
end type
type cb_buscar from u_cb_application within w_opc_turno
end type
type dw_turno from u_dw_application within w_opc_turno
end type
type gb_datos_turno from u_gb_base within w_opc_turno
end type
type gb_turnos from u_gb_base within w_opc_turno
end type
end forward

global type w_opc_turno from w_response
string tag = "B$$HEX1$$fa00$$ENDHEX$$squeda de Turnos/Horarios"
integer width = 3067
integer height = 1308
string title = "B$$HEX1$$fa00$$ENDHEX$$squeda de Turnos/Horarios"
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
dw_consulta dw_consulta
cb_buscar cb_buscar
dw_turno dw_turno
gb_datos_turno gb_datos_turno
gb_turnos gb_turnos
end type
global w_opc_turno w_opc_turno

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 22 de Octubre de 2004.H:10:30
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
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 17 de Noviembre de 2004.H:08:42
---------------------------------------------------
Seleccion de la fila se$$HEX1$$f100$$ENDHEX$$alada
Parametros: al_fila (fila actual)
Invoked By: w_opc_turno.dw_consulta.doubleClicked()
				w_opc_turno.dw_consulta.ItemFocusChanged()
---------------------------------------------------*/
il_fila=al_fila
dw_consulta.SelectRow(0,False)
dw_consulta.SelectRow(il_fila,True)
Return 1










end function

public function integer of_recuperar (string as_where);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 17 de Noviembre de 2004.H:11:31
---------------------------------------------------
Obtiene los resultados de busqueda del turno
Parametros: as_where (clausula where de la consulta)
Invoked By: w_opc_turno.cb_buscar.Clicked()
				w_opc_turno.open()
---------------------------------------------------*/
String ls_sel_ini,ls_modString,ls_original
Long ll_pos
//---------------------------------------------------
// Modificacion de la clausula where para la consulta del
// dw_consulta
ls_sel_ini=dw_consulta.Describe("DataWindow.Table.Select")
ls_original=ls_sel_ini
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
dw_consulta.Modify("DataWindow.Table.Select='"+ls_original+"'")
dw_consulta.SetFocus()

Return 1
end function

on w_opc_turno.create
int iCurrent
call super::create
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.dw_consulta=create dw_consulta
this.cb_buscar=create cb_buscar
this.dw_turno=create dw_turno
this.gb_datos_turno=create gb_datos_turno
this.gb_turnos=create gb_turnos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancelar
this.Control[iCurrent+2]=this.cb_aceptar
this.Control[iCurrent+3]=this.dw_consulta
this.Control[iCurrent+4]=this.cb_buscar
this.Control[iCurrent+5]=this.dw_turno
this.Control[iCurrent+6]=this.gb_datos_turno
this.Control[iCurrent+7]=this.gb_turnos
end on

on w_opc_turno.destroy
call super::destroy
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.dw_consulta)
destroy(this.cb_buscar)
destroy(this.dw_turno)
destroy(this.gb_datos_turno)
destroy(this.gb_turnos)
end on

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 17 de Noviembre de 2004.H:11:29
---------------------------------------------------
---------------------------------------------------*/
dw_turno.InsertRow(0)
dw_consulta.SetTransObject(n_cst_application.itr_appl)
dw_turno.SetFocus()
dw_turno.SetColumn('id_turno')
//-------------------------------------------------
end event

type cb_cancelar from u_cb_application within w_opc_turno
integer x = 1536
integer y = 1088
integer taborder = 50
string text = "&Cancelar"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 17 de Noviembre de 2004.H:11:33
---------------------------------------------------
---------------------------------------------------*/
Close(Parent)
end event

type cb_aceptar from u_cb_application within w_opc_turno
integer x = 1170
integer y = 1088
integer taborder = 40
string text = "&Aceptar"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 17 de Noviembre de 2004.H:11:33
---------------------------------------------------
---------------------------------------------------*/
n_cst_param lou_param
//---------------------------------------------------
If dw_turno.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos de la b$$HEX1$$fa00$$ENDHEX$$squeda no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If

If il_fila<=0 then
	MessageBox("Advertencia!","Debe seleccionar un turno.",StopSign!)
	Return
End If

//Se llena el los vectores de parametros para el objeto devuelto
lou_param.il_vector[1] = dw_consulta.GetItemNumber(il_fila,"id_turno")
lou_param.is_vector[1] = is_where

////Envio de parametros de vuelta
CloseWithReturn(Parent,lou_param)
end event

type dw_consulta from u_dw_application within w_opc_turno
integer x = 1280
integer y = 96
integer width = 1682
integer height = 928
integer taborder = 30
string dataobject = "d_cons_turno"
boolean hscrollbar = true
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 17 de Noviembre de 2004.H:11:34
---------------------------------------------------
---------------------------------------------------*/
If Row=0 Then Return

of_filaSel(Row)

end event

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 17 de Noviembre de 2004.H:11:32
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
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 17 de Noviembre de 2004.H:11:33
---------------------------------------------------
Overwrite!
---------------------------------------------------*/
end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 17 de Noviembre de 2004.H:11:35
---------------------------------------------------
---------------------------------------------------*/
Return 2
end event

event itemfocuschanged;call super::itemfocuschanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 17 de Noviembre de 2004.H:11:35
---------------------------------------------------
---------------------------------------------------*/
If Row=0 Then Return

of_filaSel(Row)
end event

type cb_buscar from u_cb_application within w_opc_turno
integer x = 475
integer y = 896
integer taborder = 20
string text = "&Buscar"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 17 de Noviembre de 2004.H:11:33
---------------------------------------------------
Construcci$$HEX1$$f300$$ENDHEX$$n de la sentencia para la busqueda...
---------------------------------------------------*/
String ls_cad_campo
//-------------------------------------------------

If dw_turno.AcceptText()<>1 Then
	//MessageBox("Advertencia!","No se encontraron registros que cumplan con el criterio digitado.",StopSign!)
	This.Event LoseFocus()
	dw_turno.SetFocus()
	Return
End If
//----------------------------------------------------------------------
is_where="where ("

//Field:id_turno
ls_cad_campo=String(dw_turno.GetItemNumber(1,"id_turno"))
If Not IsNull(ls_cad_campo) Then
	is_where+="id_turno="+ls_cad_campo+" and "
End If

//Field:de_turno
ls_cad_campo=String(dw_turno.GetItemString(1,"de_turno"))
If Not IsNull(ls_cad_campo) Then
	is_where+="Upper(de_turno) LIKE ~~'%"+Upper(ls_cad_campo)+"%~~' and "
End If
//ls_cad_campo=dw_consulta.Describe("DataWindow.Table.Select")
//MessageBox('SELECT * FROM ~'dt_mu_ord~'','< '+is_where+'>~n Table.Select:'+ls_cad_campo,Exclamation!,OK!)
//*******************************************************************************
If Right(is_where,4)="and " Then
	is_where=Left(is_where, len(is_where) - 4)+")"
	
End If
//-------------------------------------------------
of_recuperar(is_where)
end event

type dw_turno from u_dw_application within w_opc_turno
integer x = 73
integer y = 160
integer width = 1061
integer height = 256
string dataobject = "d_ext_datos_turno"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 17 de Noviembre de 2004.H:11:36
---------------------------------------------------
Overwrite!
---------------------------------------------------*/
end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 17 de Noviembre de 2004.H:11:34
---------------------------------------------------
--------------------------------------------------*/
String ls_coltype
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
//-------------------------------------------------
ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	Return 1
End If

If dwo.name='id_turno' Then
	If Long(Data)=0 Then
		SetNull(li_null)		
		This.SetItem(row,String(dwo.name),li_null)
		Return 3
	End If	
End If
end event

type gb_datos_turno from u_gb_base within w_opc_turno
integer x = 37
integer y = 32
integer width = 1134
integer height = 1024
integer taborder = 0
long textcolor = 33554432
string text = "Datos del Turno"
end type

type gb_turnos from u_gb_base within w_opc_turno
integer x = 1207
integer y = 32
integer width = 1792
integer height = 1024
integer taborder = 0
string text = "Turnos"
end type

