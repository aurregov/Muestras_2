HA$PBExportHeader$w_opc_surtidos.srw
$PBExportComments$Para la busqueda de la referencia que es de tipo surtido
forward
global type w_opc_surtidos from w_response
end type
type cb_buscar from commandbutton within w_opc_surtidos
end type
type dw_consulta from u_dw_application within w_opc_surtidos
end type
type cb_1 from commandbutton within w_opc_surtidos
end type
type cb_aceptar from commandbutton within w_opc_surtidos
end type
type dw_1 from u_dw_application within w_opc_surtidos
end type
type gb_1 from groupbox within w_opc_surtidos
end type
type gb_2 from u_gb_base within w_opc_surtidos
end type
end forward

global type w_opc_surtidos from w_response
integer width = 3406
integer height = 1308
string title = "Selecci$$HEX1$$f300$$ENDHEX$$n de Surtido"
cb_buscar cb_buscar
dw_consulta dw_consulta
cb_1 cb_1
cb_aceptar cb_aceptar
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_opc_surtidos w_opc_surtidos

type variables
String is_where, is_select

long il_fila, il_fabrica_ref, il_linea_ref

n_cst_param iou_param
n_tr_application itr_produrif
end variables

forward prototypes
public function integer of_filasel (long a_fila)
public function integer of_recuperar (string a_where)
public function integer of_retorno ()
public function integer of_conectar_bd ()
end prototypes

public function integer of_filasel (long a_fila);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 22 de Enero de 2003 HORA 08:45:17:687
// 
// 
//////////////////////////////////////////////////////////////////////////

il_fila=a_fila

dw_consulta.SelectRow(0,False)
dw_consulta.SelectRow(il_fila,True)



Return 1










end function

public function integer of_recuperar (string a_where);n_cst_comun 	lo_comun

Long 				ll_cant

String 			ls_select, ls_modString
	
ls_select    = is_select  
ls_modString = "DataWindow.Table.Select='" &
				 + ls_select + a_where + "'"

dw_consulta.Modify(ls_modString)

il_fila = 0	
ll_cant = dw_consulta.Retrieve(n_cst_application.is_user)

If ll_cant>0 Then
	If ll_cant=1 Then
		of_filaSel(1)
	End If
End If

dw_consulta.SetFocus()

Return 1
end function

public function integer of_retorno ();
If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If il_fila<=0 then
	MessageBox("Advertencia!","Debe seleccionar un registro.",StopSign!)
	Return -1
End If

iou_param.il_vector[1] = dw_consulta.GetItemNumber(il_fila,"co_fabricas")
iou_param.il_vector[2] = dw_consulta.GetItemNumber(il_fila,"co_lineas")
iou_param.il_vector[3] = dw_consulta.GetItemNumber(il_fila,"co_referencias")
iou_param.il_vector[4] = dw_consulta.GetItemNumber(il_fila,"co_muestrario")
iou_param.il_vector[5] = dw_consulta.GetItemNumber(il_fila,"co_calidads")
iou_param.il_vector[6] = dw_consulta.GetItemNumber(il_fila,"co_referencia")

iou_param.is_vector[1] = is_where
iou_param.is_vector[2] = dw_consulta.GetItemString(il_fila,"de_referencia")

n_cst_application.il_fabRef     = dw_consulta.GetItemNumber(il_fila,"co_fabricas")
n_cst_application.il_lineaRef   = dw_consulta.GetItemNumber(il_fila,"co_lineas")
n_cst_application.il_referencia = dw_consulta.GetItemNumber(il_fila,"co_referencias")

Return 1
end function

public function integer of_conectar_bd ();/*
* ============================================================================
* MODIFICADO: Enero 17 de 2012 - ohlondon
* ----------------------------------------------------------------------------
* Se conecta a la base de datos produrif de crypor01 con los datos tomados del
* .ini del aplicativo. Seccion [fabrica].
* ============================================================================
*/

String       ls_passwd, ls_user, ls_dbms, ls_database, ls_servername, &
             ls_lock, ls_DBParm, ls_dsn, ls_path

ls_path = n_cst_application.is_pathfileconf

ls_dbms        = n_cst_application.of_GetProFile(ls_path, 'fabrica5', 'DBMS')
ls_database    = n_cst_application.of_GetProFile(ls_path, 'fabrica5', 'DATABASE')
ls_servername  = n_cst_application.of_GetProFile(ls_path, 'fabrica5', 'SERVERNAME')
ls_lock        = n_cst_application.of_GetProFile(ls_path, 'fabrica5', 'LOCK')
ls_DBParm      = n_cst_application.of_GetProFile(ls_path, 'fabrica5', 'DBPARM')		
ls_dsn		   = n_cst_application.of_GetProFile(ls_path, 'fabrica5', 'DSN')		

ls_passwd = n_cst_application.is_passwd 
ls_user   = n_cst_application.is_user	
ls_DBParm = "ConnectString='DSN=" + TRIM(ls_dsn) + ";UID=" + ls_user + ";PWD="+ ls_passwd + "'," + ls_DBParm

If itr_produrif.of_connectdb( ls_dbms, ls_database, ls_user, ls_passwd, &
										 ls_servername, ls_lock) <> 0 Then
	RETURN -1
END IF
RETURN 1

end function

on w_opc_surtidos.create
int iCurrent
call super::create
this.cb_buscar=create cb_buscar
this.dw_consulta=create dw_consulta
this.cb_1=create cb_1
this.cb_aceptar=create cb_aceptar
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_buscar
this.Control[iCurrent+2]=this.dw_consulta
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.cb_aceptar
this.Control[iCurrent+5]=this.dw_1
this.Control[iCurrent+6]=this.gb_1
this.Control[iCurrent+7]=this.gb_2
end on

on w_opc_surtidos.destroy
call super::destroy
destroy(this.cb_buscar)
destroy(this.dw_consulta)
destroy(this.cb_1)
destroy(this.cb_aceptar)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;/*
* ----------------------------------------------------------------------------
* MODIFICADO: Diciembre 26 de 2011 - ohlondon
* ----------------------------------------------------------------------------
* Ventana de Busqueda para las referencias de tipo surtido
* ----------------------------------------------------------------------------
*/
itr_produrif = CREATE n_tr_application
	
IF of_conectar_bd( ) < 0 THEN CLOSE(THIS)

dw_1.of_conexion( itr_produrif, true)
dw_consulta.of_conexion( itr_produrif, true)

dw_1.InsertRow(0)

is_select = dw_consulta.Describe("DataWindow.Table.Select")
is_where=Message.StringParm

If IsNull(is_where) then is_where=""

If len(is_where)>0 Then
	of_recuperar(is_where)
End If

If n_cst_application.il_fabRef<>0 then
	dw_1.SetItem(1,"fabrica", n_cst_application.il_fabRef)
	dw_1.SetItem(1,"linea",   n_cst_application.il_lineaRef)
	dw_1.SetItem(1,"referencia", n_cst_application.il_referencia)
End If
end event

type cb_buscar from commandbutton within w_opc_surtidos
integer x = 315
integer y = 872
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar"
end type

event clicked;If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return
End If

String ls_select
String ls_cad 
is_where = ''	
ls_cad = String(dw_1.GetItemNumber(1,"fabrica"))

If Not IsNull(ls_cad) Then
	is_where += "dt_surt_pdn.co_fabricas = "+ls_cad+" and "
End If

ls_cad = String(dw_1.GetItemNumber(1,"linea"))

If Not IsNull(ls_cad) Then
	is_where += "dt_surt_pdn.co_lineas = "+ls_cad+" and "
End If

ls_cad = String(dw_1.GetItemNumber(1,"referencia"))

If Not IsNull(ls_cad) Then
	is_where += "dt_surt_pdn.co_referencias = "+ls_cad+" and "
End If

ls_cad = Trim(dw_1.GetItemString(1,"de_referencia"))

If Not IsNull(ls_cad) Then
	is_where += "h_preref.de_referencia like ~~'%"+ls_cad+"%~~' and "
End If        

ls_cad = String(dw_1.GetItemNumber(1,"referencia_pdn"))

If Not IsNull(ls_cad) Then
	is_where += "dt_surt_pdn.co_referencia = "+ls_cad+" and "
End If

ls_cad = String(dw_1.GetItemNumber(1,"muestrario"))

If Not IsNull(ls_cad) Then
	is_where += "dt_surt_pdn.co_muestrario = "+ls_cad+" and "
End If

ls_cad = String(dw_1.GetItemNumber(1,"calidad"))

If Not IsNull(ls_cad) Then
	is_where += "dt_surt_pdn.co_calidads = "+ls_cad+" and "
End If

If Right(is_where,4) = "and " Then
	is_where = " AND " + left(is_where, len(is_where) - 4)
Else
	Messagebox("Advertencia","Debe digitar como m$$HEX1$$ed00$$ENDHEX$$nimo un criterio de b$$HEX1$$fa00$$ENDHEX$$squeda")
	Return
End If

of_recuperar(is_where)
end event

type dw_consulta from u_dw_application within w_opc_surtidos
integer x = 997
integer y = 96
integer width = 2354
integer height = 956
integer taborder = 30
string dataobject = "d_busca_surtido"
boolean hscrollbar = true
end type

event clicked;call super::clicked;If Row=0 Then Return

of_filaSel(Row)

end event

event getfocus;  
// Override
 
end event

event itemchanged;call super::itemchanged;// Override
 
Return 2

end event

event itemfocuschanged;call super::itemfocuschanged;If Row=0 Then Return

of_filaSel(Row)

end event

event doubleclicked;call super::doubleclicked;If Row=0 Then Return

of_filaSel(Row)


cb_aceptar.Trigger event Clicked()
end event

type cb_1 from commandbutton within w_opc_surtidos
integer x = 1659
integer y = 1096
integer width = 343
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type cb_aceptar from commandbutton within w_opc_surtidos
integer x = 1312
integer y = 1096
integer width = 343
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked; 
If of_retorno()<>1 then
	Return
End If

CloseWithReturn(Parent,iou_param)
end event

type dw_1 from u_dw_application within w_opc_surtidos
integer x = 50
integer y = 116
integer width = 896
integer height = 688
string dataobject = "d_ext_ref_surtido"
boolean vscrollbar = false
end type

event getfocus; 
// Overrride!!
 
end event

type gb_1 from groupbox within w_opc_surtidos
integer x = 23
integer y = 24
integer width = 937
integer height = 1048
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Criterio de b$$HEX1$$fa00$$ENDHEX$$squeda"
end type

type gb_2 from u_gb_base within w_opc_surtidos
integer x = 965
integer y = 20
integer width = 2400
integer height = 1052
integer taborder = 0
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda"
end type

