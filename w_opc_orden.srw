HA$PBExportHeader$w_opc_orden.srw
$PBExportComments$W para la busqueda de las ordenes de producci$$HEX1$$f300$$ENDHEX$$n
forward
global type w_opc_orden from w_response
end type
type cb_cancelar from u_cb_base within w_opc_orden
end type
type cb_aceptar from u_cb_base within w_opc_orden
end type
type cb_buscar from u_cb_base within w_opc_orden
end type
type dw_datos from u_dw_application within w_opc_orden
end type
type gb_datos_orden from u_gb_base within w_opc_orden
end type
type dw_consulta from u_dw_application within w_opc_orden
end type
type gb_ordenes from u_gb_base within w_opc_orden
end type
end forward

global type w_opc_orden from w_response
integer x = 101
integer y = 52
integer width = 3625
integer height = 1524
string title = "Consulta - Ordenes"
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
cb_buscar cb_buscar
dw_datos dw_datos
gb_datos_orden gb_datos_orden
dw_consulta dw_consulta
gb_ordenes gb_ordenes
end type
global w_opc_orden w_opc_orden

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 23 de Septiembre de 2004.H:1004
---------------------------------------------------
---------------------------------------------------*/
Long il_fila=0
String is_where
Long il_fabrica,il_linea,il_muestra,il_tipoProd
DataWindowChild idc_condicion
end variables

forward prototypes
public function integer of_filasel (long al_fila)
public function integer of_recuperar (string as_where)
end prototypes

public function integer of_filasel (long al_fila);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 23 de Septiembre de 2004.H:1001
---------------------------------------------------
Seleccion de la fila se$$HEX1$$f100$$ENDHEX$$alada
Parametros: al_fila (fila actual)
Invoked By: w_opc_orden.dw_consulta.doubleClicked()
				w_opc_orden.dw_consulta.ItemFocusChanged()
---------------------------------------------------*/
il_fila=al_fila
dw_consulta.SelectRow(0,False)
dw_consulta.SelectRow(il_fila,True)
Return 1










end function

public function integer of_recuperar (string as_where);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 24 de Septiembre de 2004.H:12:06
---------------------------------------------------
Obtiene los resultados de busqueda de la orden
Parametros: as_where (clausula where de la consulta)
Invoked By: w_opc_orden.cb_buscar.Clicked()
				w_opc_orden.open()
---------------------------------------------------*/
String ls_sel_ini,ls_modString,ls_origen
Long ll_pos
//---------------------------------------------------
ls_sel_ini = dw_consulta.Describe("DataWindow.Table.Select")
ls_origen  = ls_sel_ini

/*If Right(as_where,1)=")" Then		
	ll_pos=Pos(ls_sel_ini,"where")
	If ll_pos>0 Then
		ls_sel_ini=Left(ls_sel_ini, ll_pos -1)
	End If
	ls_modString="DataWindow.Table.Select='" &
		+ ls_sel_ini + as_where + "'"
	dw_consulta.Modify(ls_modString)
End If*/
If Right(as_where,1)=")" Then		
	ls_modString="DataWindow.Table.Select='" + ls_sel_ini + as_where + "'"
ELSE
	ls_modString="DataWindow.Table.Select='" + ls_sel_ini + "'"
END IF
dw_consulta.Modify(ls_modString)



il_fila=0
Choose Case dw_consulta.Retrieve(n_cst_application.is_user)
	case -1 // Error
		MessageBox('Problema con DB','Error en Solicitud!.',StopSign!)
	case 0 // No hubieron datos devueltos
		MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','No hay datos para la solicitud!.')
	case Is > 0 //1 fila
		of_filaSel(1)
End Choose
dw_consulta.Modify("DataWindow.Table.Select='"+ls_origen+"'")
dw_consulta.SetFocus()

Return 1

end function

on w_opc_orden.create
int iCurrent
call super::create
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.cb_buscar=create cb_buscar
this.dw_datos=create dw_datos
this.gb_datos_orden=create gb_datos_orden
this.dw_consulta=create dw_consulta
this.gb_ordenes=create gb_ordenes
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancelar
this.Control[iCurrent+2]=this.cb_aceptar
this.Control[iCurrent+3]=this.cb_buscar
this.Control[iCurrent+4]=this.dw_datos
this.Control[iCurrent+5]=this.gb_datos_orden
this.Control[iCurrent+6]=this.dw_consulta
this.Control[iCurrent+7]=this.gb_ordenes
end on

on w_opc_orden.destroy
call super::destroy
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.cb_buscar)
destroy(this.dw_datos)
destroy(this.gb_datos_orden)
destroy(this.dw_consulta)
destroy(this.gb_ordenes)
end on

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 23 de Septiembre de 2004.H:
---------------------------------------------------
Asignaci$$HEX1$$f300$$ENDHEX$$n por defecto la fabrica de la aplicaci$$HEX1$$f300$$ENDHEX$$n
---------------------------------------------------*/
n_cst_comun_orden  lo_comun
//---------------------------------------------------
il_fabrica=n_cst_application.ii_fabrica
dw_datos.InsertRow(0)
dw_consulta.SetTransObject(n_cst_application.itr_appl)
//
dw_datos.getChild("condicion",idc_condicion)
lo_comun.of_loaddddw(idc_condicion,n_cst_application.itr_appl)
idc_condicion.InsertRow(1)
//
is_where=Message.StringParm
If IsNull(is_where) then is_where=""

If len(is_where)>0 Then
	of_recuperar(is_where)
Else
	//dw_datos.SetItem(1,"co_fabrica",il_fabrica)
End If
dw_datos.SetFocus()
If n_cst_application.il_fabMue<>0 then
//	dw_datos.SetItem(1,"co_fabrica",n_cst_application.il_fabMue)
//	dw_datos.SetItem(1,"co_linea",n_cst_application.il_lineaMue)
//	dw_datos.SetItem(1,"co_muestra",n_cst_application.il_muestra)
End If
end event

type cb_cancelar from u_cb_base within w_opc_orden
integer x = 1861
integer y = 1300
integer width = 343
integer height = 100
integer taborder = 50
string text = "&Cancelar"
end type

event clicked;call super::clicked;Close(Parent)
end event

type cb_aceptar from u_cb_base within w_opc_orden
integer x = 1495
integer y = 1300
integer width = 343
integer height = 100
integer taborder = 40
string text = "&Aceptar"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 24 de Septiembre de 2004.H:10:56
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n Aceptar
Invoked By : dw_consulta.DoubleClicked()
---------------------------------------------------*/
n_cst_param lou_param

If dw_datos.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If

If il_fila<=0 then
	MessageBox("Advertencia!","Debe seleccionar una orden en la lista.",StopSign!)
	Return
End If

//Se llena el los vectores de parametros para el objeto devuelto
lou_param.il_vector[1] = dw_consulta.GetItemNumber(il_fila,"co_fabrica")
lou_param.il_vector[2] = dw_consulta.GetItemNumber(il_fila,"co_linea")
lou_param.il_vector[3] = dw_consulta.GetItemNumber(il_fila,"co_muestra")
lou_param.il_vector[4] = dw_consulta.GetItemNumber(il_fila,"nu_orden")

lou_param.is_vector[1]=is_where

n_cst_application.il_fabMue	= dw_consulta.GetItemNumber(il_fila,"co_fabrica")
n_cst_application.il_lineaMue	= dw_consulta.GetItemNumber(il_fila,"co_linea")
n_cst_application.il_muestra	= dw_consulta.GetItemNumber(il_fila,"co_muestra")


//Envio de parametros de vuelta
CloseWithReturn(Parent,lou_param)
end event

type cb_buscar from u_cb_base within w_opc_orden
integer x = 466
integer y = 1144
integer taborder = 20
integer weight = 700
string text = "&Buscar"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 23 de Septiembre de 2004.H:16:51
---------------------------------------------------
Construcci$$HEX1$$f300$$ENDHEX$$n de la sentencia para la busqueda...
---------------------------------------------------*/

If dw_datos.AcceptText()<>1 Then
	//MessageBox("Advertencia!","Datos no son totalmente v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	This.Event Losefocus()
	dw_datos.SetFocus()
	Return
End If
//----------------------------------------------------------------------
is_where=" and ("
String ls_cad_campo

//Field:co_fabrica
ls_cad_campo=String(dw_datos.GetItemNumber(1,"co_fabrica"))
If Not IsNull(ls_cad_campo) Then
	is_where+="dt_mu_ord.co_fabrica="+ls_cad_campo+" and "
End If

//Field:co_linea
ls_cad_campo=String(dw_datos.GetItemNumber(1,"co_linea"))
If Not IsNull(ls_cad_campo) Then
	is_where+="dt_mu_ord.co_linea="+ls_cad_campo+" and "
End If

//Field:co_muestra
ls_cad_campo=String(dw_datos.GetItemNumber(1,"co_muestra"))
If Not IsNull(ls_cad_campo) Then
	is_where+="dt_mu_ord.co_muestra="+ls_cad_campo+" and "
End If

//Field:nu_orden
ls_cad_campo=String(dw_datos.GetItemNumber(1,"nu_orden"))
If Not IsNull(ls_cad_campo) Then
	is_where+="dt_mu_ord.nu_orden="+ls_cad_campo+" and "
End If       

//Field:co_ejecutiva
ls_cad_campo=String(dw_datos.GetItemNumber(1,"co_ejecutiva"))
If Not IsNull(ls_cad_campo) Then
	is_where+="dt_mu_ord.co_ejecutiva="+ls_cad_campo+" and "
End If

//Field:co_ctecnico
ls_cad_campo=String(dw_datos.GetItemString(1,"co_ctecnico"))
If Not IsNull(ls_cad_campo) Then
		is_where+="Upper(dt_mu_ord.co_ctecnico) like ~~'%"+Upper(ls_cad_campo)+"%~~' and "
End If

//Field:condicion
ls_cad_campo=String(dw_datos.GetItemNumber(1,"condicion"))
If Not IsNull(ls_cad_campo) Then
	is_where+="dt_mu_ord.condicion="+ls_cad_campo+" and "
End If

//Field:prioridad
ls_cad_campo=String(dw_datos.GetItemNumber(1,"prioridad"))
If Not IsNull(ls_cad_campo) Then
	is_where+="dt_mu_ord.prioridad="+ls_cad_campo+" and "
End If

//Field:tipo
ls_cad_campo=String(dw_datos.GetItemString(1,"tipo"))
If Not IsNull(ls_cad_campo) Then
		is_where+="Upper(dt_mu_ord.tipo) like ~~'%"+Upper(ls_cad_campo)+"%~~' and "
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

type dw_datos from u_dw_application within w_opc_orden
integer x = 73
integer y = 64
integer width = 1134
integer height = 1056
string dataobject = "d_ext_datos_orden"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 23 de Septiembre de 2004.H:1026
---------------------------------------------------
Overwrite
---------------------------------------------------*/
gb_datos_orden.Text='Datos de la Orden*'



end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 24 de Septiembre de 2004.H:1702
---------------------------------------------------
---------------------------------------------------*/
/*	Se crea el Objeto del Negocio y se invocan funciones de
	este para realizar diversas consultas que devuelven 
	los valores de descripciones
  	Librer$$HEX1$$ed00$$ENDHEX$$a: n_cst_comun --> Modifiable.pbl*/
//--------------------------------------------------
n_cst_comun lo_comun
Long ll_dato,ll_resultado
String ls_dato,ls_coltype
Boolean lb_m=False
//----------------------------------------------------------------------
Choose Case dwo.name
	Case "co_fabrica" 
		il_fabrica = Long(Data)
		il_linea = Getitemnumber(1,'co_linea')
		il_muestra = Getitemnumber(1,'co_muestra')
		lb_m=True
	Case "co_linea"
		il_linea = Long(Data)	
		il_fabrica = Getitemnumber(1,'co_fabrica')
		il_muestra = Getitemnumber(1,'co_muestra')
		lb_m=True
	Case "co_muestra"		
		il_muestra	= Long(Data)
		il_fabrica = Getitemnumber(1,'co_fabrica')
		il_linea = Getitemnumber(1,'co_linea')
		lb_m=True
End Choose
If lb_m Then
	lb_m=False
	ll_dato=il_muestra*il_linea*il_fabrica
	If IsNull(ll_dato) OR ll_dato=0 Then Return 0
	ll_resultado = lo_comun.of_nombreMuestra(il_fabrica,il_linea, &
								il_muestra,n_cst_application.itr_appl)
	If ll_resultado<>1 then 
		MessageBox("Advertencia!","Muestra no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		//SetItem(1,"de_muestra","")
		Return 2
	End If	
	SetItem(1,"de_muestra",Trim(lo_comun.of_getString(1)))
End If
//----------------------------------------------------------------------
If dwo.name="co_ejecutiva" Then
	ll_dato=Long(Data)	
	Int li_d=0
	ls_dato=""
	ll_resultado=lo_comun.of_NombreEjecutiva('EX',ll_dato,n_cst_application.itr_appl)
	If ll_resultado=1 then 
		ls_dato = lo_comun.of_getString(1)+'(EX) '
		li_d=1
	End If	
	ll_resultado=lo_comun.of_NombreEjecutiva('NA',ll_dato,n_cst_application.itr_appl)
	If ll_resultado=1 then
		If li_d=1 Then 
			ls_dato+= ', '+lo_comun.of_getString(1)+'(NA)'
		Else
			ls_dato = lo_comun.of_getString(1)+'(NA)'
		End If
	End If
	
	If ls_dato="" then 
				MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo de Ejecutiva no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
//				If IsNullGetItemNumber(row,String(dwo.name))
//				SetItem(1,"de_ejecutiva",'')
				Return 2
	End If
	
	SetItem(1,"de_ejecutiva",Trim(ls_dato))
End If
//----------------------------------------------------------------------
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
//----------------------------------------------------------------------
//Debe ir aqu$$HEX1$$ed00$$ENDHEX$$
//Tipo caracter
If dwo.name="co_ctecnico" Then
	ls_dato = Data
	If IsNull(Data)Then 
		SetItem(1,"de_ctecnico",'')
		Return 0
	End If	
	ll_resultado=lo_comun.of_nombredesarrollador(ls_dato,n_cst_application.itr_appl)
	If ll_resultado<>1 then
		MessageBox("Advertencia!","C$$HEX1$$f300$$ENDHEX$$digo de T$$HEX1$$e900$$ENDHEX$$cnico(Desarrollador) no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_ctecnico",Trim(lo_comun.of_getString(1)))
End If
//----------------------------------------------------------------------

end event

event itemerror;call super::itemerror;Integer li_null
String ls_col,ls_coltype

ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	Return 1
End If

If Long(Data)=0 Then
		SetNull(li_null)
		ls_col=dwo.name
		This.SetItem(row,ls_col,li_null)
		If dwo.name='co_fabrica' OR dwo.name='co_linea' OR dwo.name='co_muestra' Then 
			SetItem(row,'de_muestra','')
		ElseIf dwo.name='co_ejecutiva' Then 
			SetItem(row,'de_ejecutiva','')
		ElseIf dwo.name='co_ctecnico' Then 
			SetItem(row,'de_ctecnico','')
		End If
		Return 3
End If	
end event

type gb_datos_orden from u_gb_base within w_opc_orden
integer x = 37
integer width = 1207
integer height = 1256
integer taborder = 0
long textcolor = 33554432
string text = "Datos de la Orden"
end type

type dw_consulta from u_dw_application within w_opc_orden
integer x = 1280
integer y = 64
integer width = 2267
integer height = 1168
integer taborder = 30
string dataobject = "d_cons_orden"
boolean hscrollbar = true
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 23 de Septiembre de 2004.H:1006
---------------------------------------------------
---------------------------------------------------*/
If Row=0 Then Return

of_filaSel(Row)

end event

event doubleclicked;call super::doubleclicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 23 de Septiembre de 2004.H:1015
---------------------------------------------------
---------------------------------------------------*/
If Row=0 Then Return
// Selecciona la columna ...
of_filaSel(Row)
// Realiza el proceso de aceptaci$$HEX1$$f300$$ENDHEX$$n...
cb_aceptar.Trigger event Clicked()
end event

event getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 23 de Septiembre de 2004.H:1020
---------------------------------------------------
Overwrite
---------------------------------------------------*/
gb_ordenes.Text = "Ordenes*"
Return 0
end event

event itemchanged;call super::itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 23 de Septiembre de 2004.H:1022
---------------------------------------------------
---------------------------------------------------*/
//Reject the data value but allow the focus to change
Return 2
end event

event itemfocuschanged;call super::itemfocuschanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 23 de Septiembre de 2004.H:10:23
---------------------------------------------------
---------------------------------------------------*/
If Row=0 Then Return

of_filaSel(Row)
end event

type gb_ordenes from u_gb_base within w_opc_orden
integer x = 1243
integer width = 2341
integer height = 1256
integer taborder = 0
string text = "$$HEX1$$d300$$ENDHEX$$rdenes"
end type

