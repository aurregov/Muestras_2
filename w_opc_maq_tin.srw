HA$PBExportHeader$w_opc_maq_tin.srw
$PBExportComments$Ventana de b$$HEX1$$fa00$$ENDHEX$$squeda para las maquinas de tintorer$$HEX1$$ed00$$ENDHEX$$a de la muestra en la programaci$$HEX1$$f300$$ENDHEX$$n
forward
global type w_opc_maq_tin from w_response
end type
type cb_cancelar from u_cb_application within w_opc_maq_tin
end type
type cb_aceptar from u_cb_application within w_opc_maq_tin
end type
type dw_consulta from u_dw_application within w_opc_maq_tin
end type
type cb_buscar from u_cb_application within w_opc_maq_tin
end type
type dw_maquina from u_dw_application within w_opc_maq_tin
end type
type gb_datos_maq from u_gb_base within w_opc_maq_tin
end type
type gb_actividades from u_gb_base within w_opc_maq_tin
end type
end forward

global type w_opc_maq_tin from w_response
string tag = "B$$HEX1$$fa00$$ENDHEX$$squeda de M$$HEX1$$e100$$ENDHEX$$quinas de Tintorer$$HEX1$$ed00$$ENDHEX$$a"
integer width = 3479
integer height = 1432
string title = "B$$HEX1$$fa00$$ENDHEX$$squeda de M$$HEX1$$e100$$ENDHEX$$quinas de Tintorer$$HEX1$$ed00$$ENDHEX$$a"
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
dw_consulta dw_consulta
cb_buscar cb_buscar
dw_maquina dw_maquina
gb_datos_maq gb_datos_maq
gb_actividades gb_actividades
end type
global w_opc_maq_tin w_opc_maq_tin

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
Invoked By: w_opc_maq_tin.dw_consulta.doubleClicked()
				w_opc_maq_tin.dw_consulta.ItemFocusChanged()
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
Obtiene los resultados de busqueda de la m$$HEX1$$e100$$ENDHEX$$quina
Parametros: as_where (clausula where de la consulta)
Invoked By: w_opc_maq_tin.cb_buscar.Clicked()
				w_opc_maq_tin.open()
---------------------------------------------------*/
String ls_sel_ini,ls_modString,ls_original
Long ll_pos
//---------------------------------------------------
// Modificacion de la clausula where para la consulta del
// dw_consulta
ls_sel_ini=dw_consulta.Describe("DataWindow.Table.Select")
ls_original=ls_sel_ini
If Right(as_where,1)=")" Then	
//	ll_pos=Pos(ls_sel_ini,"where")
//	If ll_pos>0 Then
//		ls_sel_ini=Left(ls_sel_ini, ll_pos -1)
//	End If
	ls_modString="DataWindow.Table.Select='"+ ls_sel_ini + as_where + "'"
	dw_consulta.Modify(ls_modString)
End If
//MessageBox('SELECT * FROM ','< '+is_where+'>~n Table.Select:~n'+dw_consulta.Describe("DataWindow.Table.Select"),Exclamation!,OK!)
il_fila=0
Choose Case dw_consulta.Retrieve()
	case -1 // Error
		MessageBox('Problema con DB','Error en solicitud de las m$$HEX1$$e100$$ENDHEX$$quinas de tintorer$$HEX1$$ed00$$ENDHEX$$a.',StopSign!)
	case 0 // No hubieron datos devueltos
		MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','No hay datos relacionados con las m$$HEX1$$e100$$ENDHEX$$quinas para la anterior solicitud.')		
	case 1 //1 fila
		of_filaSel(1)
End Choose
dw_consulta.Modify("DataWindow.Table.Select='"+ls_original+"'")
dw_consulta.SetFocus()

Return 1
end function

on w_opc_maq_tin.create
int iCurrent
call super::create
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.dw_consulta=create dw_consulta
this.cb_buscar=create cb_buscar
this.dw_maquina=create dw_maquina
this.gb_datos_maq=create gb_datos_maq
this.gb_actividades=create gb_actividades
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancelar
this.Control[iCurrent+2]=this.cb_aceptar
this.Control[iCurrent+3]=this.dw_consulta
this.Control[iCurrent+4]=this.cb_buscar
this.Control[iCurrent+5]=this.dw_maquina
this.Control[iCurrent+6]=this.gb_datos_maq
this.Control[iCurrent+7]=this.gb_actividades
end on

on w_opc_maq_tin.destroy
call super::destroy
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.dw_consulta)
destroy(this.cb_buscar)
destroy(this.dw_maquina)
destroy(this.gb_datos_maq)
destroy(this.gb_actividades)
end on

event open;call super::open;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 17 de Noviembre de 2004.H:11:29
---------------------------------------------------
---------------------------------------------------*/
dw_maquina.InsertRow(0)
dw_consulta.SetTransObject(n_cst_application.itr_appl)
dw_maquina.SetFocus()
dw_maquina.SetColumn('co_fabrica')
//-------------------------------------------------
end event

type cb_cancelar from u_cb_application within w_opc_maq_tin
integer x = 1787
integer y = 1176
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

type cb_aceptar from u_cb_application within w_opc_maq_tin
integer x = 1458
integer y = 1176
integer taborder = 40
string text = "&Aceptar"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Mi$$HEX1$$e900$$ENDHEX$$rcoles 17 de Noviembre de 2004.H:11:33
---------------------------------------------------
---------------------------------------------------*/
String ls_des_maq
n_cst_param lou_param
//---------------------------------------------------
If dw_maquina.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos de la b$$HEX1$$fa00$$ENDHEX$$squeda no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If

If il_fila<=0 then
	MessageBox("Advertencia!","Debe seleccionar una m$$HEX1$$e100$$ENDHEX$$quina.",StopSign!)
	Return
End If

//Se llena el los vectores de parametros para el objeto devuelto
lou_param.il_vector[1] = dw_consulta.GetItemNumber(il_fila,"co_fabrica")
lou_param.il_vector[2] = dw_consulta.GetItemNumber(il_fila,"cs_maquina")
ls_des_maq = dw_consulta.GetItemString(il_fila,"de_marca") + '(' + &
             dw_consulta.GetItemString(il_fila,"de_tipo") + ')x[Pmax:' + &
				 String(dw_consulta.GetItemNumber(il_fila,"peso_max")) + '-PMed:' + &
				 String(dw_consulta.GetItemNumber(il_fila,"peso_med")) + '-PMin:' + &
				 String(dw_consulta.GetItemNumber(il_fila,"peso_min")) + ']'
				 
lou_param.is_vector[1] = ls_des_maq

////Envio de parametros de vuelta
CloseWithReturn(Parent,lou_param)
end event

type dw_consulta from u_dw_application within w_opc_maq_tin
integer x = 1170
integer y = 96
integer width = 2231
integer height = 1028
integer taborder = 30
string dataobject = "d_cons_maquina"
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

type cb_buscar from u_cb_application within w_opc_maq_tin
integer x = 411
integer y = 1040
integer taborder = 20
string text = "&Buscar"
end type

event clicked;call super::clicked;/*******************************************************************************************************
* PROC./FUNC.: clicked
* ARG.		 : None
* RETURN		 : Long
* SCOPE		 : Public
* PURPOSE	 :	Construcci$$HEX1$$f300$$ENDHEX$$n de la sentencia para la busqueda...
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	17 de Noviembre de 2004. Hora: 08:12:32:369
* NOTE		 : Actualizaci$$HEX1$$f300$$ENDHEX$$n en 18 de Enero de 2005 Hora: 16:39:25:003
					Cambio de los campo clave para la b$$HEX1$$fa00$$ENDHEX$$squeda de las m$$HEX1$$e100$$ENDHEX$$quinas de tintorer$$HEX1$$ed00$$ENDHEX$$a
					registradas.
********************************************************************************************************/
//VARIABLE DECLARATION
	String ls_cad_campo
	Long ll_pos
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
If dw_maquina.AcceptText()<>1 Then	
	This.Event LoseFocus()
	dw_maquina.SetFocus()
	Return
End If
//----------------------------------------------------------------------
//is_where="where ("
is_where=" and ("
//-Table mu_maq_tin-//
//Field:co_fabrica
ls_cad_campo=String(dw_maquina.GetItemNumber(1,"co_fabrica"))
If Not IsNull(ls_cad_campo) Then
	is_where+="mu_maq_tin.co_fabrica="+ls_cad_campo+" and "
End If

//Field:cs_maquina
ls_cad_campo=String(dw_maquina.GetItemNumber(1,"cs_maquina"))
If Not IsNull(ls_cad_campo) Then
	is_where+="mu_maq_tin.cs_maquina="+ls_cad_campo+" and "
End If

//Field:disponible
ls_cad_campo=String(dw_maquina.GetItemString(1,"disponible"))
If Not IsNull(ls_cad_campo) Then
	is_where+="Upper(mu_maq_tin.disponible) LIKE ~~'%"+Upper(ls_cad_campo)+"%~~' and "
End If

//Field:nu_horas
ls_cad_campo=String(dw_maquina.GetItemNumber(1,"nu_horas"))
If Not IsNull(ls_cad_campo) Then
	is_where+="mu_maq_tin.nu_horas="+ls_cad_campo+" and "
End If

//Field:cantidad_colas
ls_cad_campo=String(dw_maquina.GetItemNumber(1,"cantidad_colas"))
If Not IsNull(ls_cad_campo) Then
	is_where+="mu_maq_tin.cantidad_colas="+ls_cad_campo+" and "
End If

//-Table m_maq_tin-//
//Field:co_maquina
ls_cad_campo=String(dw_maquina.GetItemNumber(1,"co_maquina"))
If Not IsNull(ls_cad_campo) Then
	is_where+="m_maq_tin.co_maquina="+ls_cad_campo+" and "
End If

//Field:de_marca
ls_cad_campo=dw_maquina.GetItemString(1,"de_marca")
If Not IsNull(ls_cad_campo) Then
	is_where+="Upper(m_maq_tin.de_marca) LIKE ~~'%"+Upper(ls_cad_campo)+"%~~' and "
End If        

//Field:de_tipo
ls_cad_campo=dw_maquina.GetItemString(1,"de_tipo")
If Not IsNull(ls_cad_campo) Then
	is_where+="Upper(m_maq_tin.de_tipo) like ~~'%"+Upper(ls_cad_campo)+"%~~' and "
End If        
//*********************************************************************************************************************
//Field:peso_max
ls_cad_campo=String(dw_maquina.GetItemDecimal(1,"peso_max"))
If Not IsNull(ls_cad_campo) Then
		ll_pos=Pos(ls_cad_campo,',')
		If ll_pos<=0 Then 	
			ll_pos=Pos(ls_cad_campo,'.')		
		End If
		ls_cad_campo=Replace(ls_cad_campo,ll_pos,1,'.')
	//	ls_cad_campo =	Left(ls_cad_campo,(Pos(ls_cad_campo,ls_char) - 1))+'.'+&
	//						Mid(ls_cad_campo,Pos(ls_cad_campo,ls_char)+1)
		is_where+="m_maq_tin.peso_max="+ls_cad_campo+" and "
End If

//Field:peso_med
ls_cad_campo=String(dw_maquina.GetItemDecimal(1,"peso_med"))
If Not IsNull(ls_cad_campo) Then
		ll_pos=Pos(ls_cad_campo,',')
		If ll_pos<=0 Then 	
			ll_pos=Pos(ls_cad_campo,'.')		
		End If
		ls_cad_campo=Replace(ls_cad_campo,ll_pos,1,'.')
		//ls_cad_campo =	Left(ls_cad_campo,(Pos(ls_cad_campo,',') - 1))+'.'+&
		//					Mid(ls_cad_campo,Pos(ls_cad_campo,',')+1)
		is_where+="m_maq_tin.peso_med="+ls_cad_campo+" and "
End If

//Field:peso_min
ls_cad_campo=String(dw_maquina.GetItemDecimal(1,"peso_min"))
If Not IsNull(ls_cad_campo) Then
		ll_pos=Pos(ls_cad_campo,',')
		If ll_pos<=0 Then 	
			ll_pos=Pos(ls_cad_campo,'.')		
		End If
		ls_cad_campo=Replace(ls_cad_campo,ll_pos,1,'.')
		//ls_cad_campo =	Left(ls_cad_campo,(Pos(ls_cad_campo,',') - 1))+'.'+&
		//					Mid(ls_cad_campo,Pos(ls_cad_campo,',')+1)
		is_where+="m_maq_tin.peso_min="+ls_cad_campo+" and "
End If
//*********************************************************************************************************************
//***********Descripci$$HEX1$$f300$$ENDHEX$$n de la m$$HEX1$$e100$$ENDHEX$$quina***************************************
////Field:hora_inicio
//ls_cad_campo=String(dw_maquina.GetItemTime(1,"hora_inicio"))
//If Not IsNull(ls_cad_campo) Then
//	is_where+="hora_inicio = DATETIME ("+ls_cad_campo+".00000) HOUR TO FRACTION(5) and "	
//End If
//
//*******************************************************************************
If Right(is_where,4)="and " Then
	is_where=Left(is_where, len(is_where) - 4)+")"
	
End If
//Messagebox('W.H.E.R.E',is_where)
//-------------------------------------------------
of_recuperar(is_where)
//END SCRIPT------------------------------------------------------------------------------------------------------
end event

type dw_maquina from u_dw_application within w_opc_maq_tin
integer x = 105
integer y = 108
integer width = 905
integer height = 900
string dataobject = "d_ext_datos_maquina"
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
---------------------------------------------------*/
String ls_coltype
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

Choose Case dwo.name
	Case 	'co_fabrica','cs_maquina','nu_horas','cantidad_colas','peso_max',&
			'peso_med','peso_min','co_maquina'
			If Long(Data)=0 Then
					SetNull(li_null)		
					This.SetItem(row,String(dwo.name),li_null)
					Return 3
			End If	
End Choose
end event

type gb_datos_maq from u_gb_base within w_opc_maq_tin
integer x = 37
integer y = 32
integer width = 1097
integer height = 1124
integer taborder = 0
long textcolor = 33554432
string text = "Datos de la M$$HEX1$$e100$$ENDHEX$$quina de Tintorer$$HEX1$$ed00$$ENDHEX$$a"
end type

type gb_actividades from u_gb_base within w_opc_maq_tin
integer x = 1134
integer y = 32
integer width = 2304
integer height = 1124
integer taborder = 0
string text = "M$$HEX1$$e100$$ENDHEX$$quinas de Tintorer$$HEX1$$ed00$$ENDHEX$$a"
end type

