HA$PBExportHeader$u_cst_reg_bordado.sru
$PBExportComments$Objeto visible personalizado~r~nSe requiere para que el registro de bordados.
forward
global type u_cst_reg_bordado from userobject
end type
type cb_buscar from u_cb_application within u_cst_reg_bordado
end type
type dw_bordado from u_dw_application within u_cst_reg_bordado
end type
type dw_busqueda from u_dw_application within u_cst_reg_bordado
end type
type gb_busqueda from u_gb_base within u_cst_reg_bordado
end type
type gb_bordado from u_gb_base within u_cst_reg_bordado
end type
end forward

global type u_cst_reg_bordado from userobject
integer width = 2277
integer height = 1852
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event type integer ue_save ( )
cb_buscar cb_buscar
dw_bordado dw_bordado
dw_busqueda dw_busqueda
gb_busqueda gb_busqueda
gb_bordado gb_bordado
end type
global u_cst_reg_bordado u_cst_reg_bordado

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Jueves 11 de Noviembre de 2004.H:15:37
---------------------------------------------------
---------------------------------------------------*/
PROTECTED:
	Long il_bordado,il_fila	
	Boolean ib_cambios,ib_activo=False
	String is_where
end variables

forward prototypes
public function integer of_asignar_consecutivo ()
public function integer of_buscar ()
public function integer of_guardar ()
public function integer of_activar ()
public function integer of_redraw (boolean ab_redrawing)
public function integer of_reset ()
public function integer of_carga_objtr ()
public function integer of_verificar ()
public function integer of_ok_bordado ()
public function integer of_error_bordado ()
public function integer of_newid_bordado ()
public function integer of_sel_fila (long al_fila)
public function long of_getid ()
public function integer of_set_activo (boolean ab_activo)
public function integer of_filtro (string as_filtro)
public function boolean of_get_cambios ()
end prototypes

event type integer ue_save();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:11:05
---------------------------------------------------
---------------------------------------------------*/
If of_verificar()<>1 Then
	Return -1
End If

of_Redraw(False)
If of_guardar()<>1 Then
	of_Redraw(True)
	Return -1
End If
// Acepta los cambios en la BD. si todo sale bien
of_ok_bordado()
//***********************************************
MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Registro de Bordado(s) satisfactorio.")
of_Redraw(True)
ib_cambios=False
Return 1
//of_buscar()
//---------------------------------------------------------------------------

end event

public function integer of_asignar_consecutivo ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:15:27
---------------------------------------------------
Description from Design Model:
Toma el max id de la tabla y le suma uno
----------------------------------------------------
Consulta del consecutivo
El codigo para los bordados ser$$HEX2$$e1002000$$ENDHEX$$para el 
ID '34'<--- creada en tiempo de dise$$HEX1$$f100$$ENDHEX$$o
Log del registro :
Table  : cf_consecutivos@crydes
Fields : co_fabrica 		= 2
			id_documento 	= 34
			cs_documento 	= *(ini)
			ob_documento 	= Bordados-Programaci$$HEX1$$f300$$ENDHEX$$n
			sw_replica		= 0
			instancia		= crydes01/nicdes01
---------------------------------------------------*/
Boolean lb_continuar
Long ll_cantidad
n_ds_application lds_cant_bordado
//--------------------------------------------------
lds_cant_bordado = CREATE n_ds_application
lds_cant_bordado.of_load('d_nro_bordado')
lds_cant_bordado.of_conexion(n_cst_application.itr_appl,True)
	
lb_continuar=True
DO WHILE lb_continuar //*
	il_bordado = n_cst_application.of_consecutive(n_cst_application.ii_fabrica,34,n_cst_application.itr_appl)
   If il_bordado<=0 Then
		il_bordado=0
		MessageBox("Advertencia!","No se pudo determinar el consecutivo del bordado para el registro.",StopSign!)
		Return -1
	End If
	
	ll_cantidad = lds_cant_bordado.Retrieve(il_bordado)
	If ll_cantidad<= 0 Then
			MessageBox("Advertencia!","Error recuperando la cuenta del c$$HEX1$$f300$$ENDHEX$$digo de bordado(ds).",StopSign!)		
			Return -1						
	End If
	ll_cantidad = lds_cant_bordado.GetItemNumber(1,'nro_bordado')
	If ll_cantidad=0 Then
		lb_continuar=False
	End If
LOOP //*
DESTROY lds_cant_bordado
//<------
//MessageBox('INFO','# consecutivo de actividad:'+String(il_bordado),Information!)
If il_bordado>0 Then
	Return 1
End If
//
Return -1
end function

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
of_redraw(True)
Return 1
end function

public function integer of_guardar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:16:00
---------------------------------------------------
-------------------------------------------------------------------------------*/
Long ll_i
DateTime ldt_fecha
String ls_usuario,ls_instancia
////-------------------------------------------------------------------------------
If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If
//-------------------------------------------------------------------------------
of_newid_bordado() // Asignaci$$HEX1$$f300$$ENDHEX$$n de los consecutivos
dw_bordado.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)
//-------------------------------------------------------------------------------
If dw_bordado.Update(True,False)<>1 Then 
	of_error_bordado()
	Return -1
End If
//---------------------------------------------------------------------------------
dw_bordado.ResetUpdate()
Return 1
end function

public function integer of_activar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:15:27
---------------------------------------------------
Description from Design Model:
Cuando se aprueba la operacion,el sistema cambia el campo
activo de N a S
---------------------------------------------------*/
Long ll_pos
//-------------------------------------------------
If dw_bordado.RowCount()<=0 then
	Return -1
End If
//--------------------------------------------------
If il_fila>0 Then
	If dw_bordado.GetItemString(il_fila,'activo')='N' Then
		dw_bordado.SetItem(il_fila,'activo','S')
	Else
		MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','El bordado seleccionado ya se encuentra activo.',Information!)
	End If
Else
	Return -1
End If
//--------------------------------------------------
Return 1


end function

public function integer of_redraw (boolean ab_redrawing);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:12:12
---------------------------------------------------
---------------------------------------------------*/
dw_busqueda.SetRedraw(ab_redrawing)
dw_bordado.SetRedraw(ab_redrawing)
//-------------------------------------------------
Return 1
end function

public function integer of_reset ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:12:21
---------------------------------------------------
---------------------------------------------------*/
dw_busqueda.Reset()
dw_bordado.Reset()
//-------------------------------------------------
Return 1

end function

public function integer of_carga_objtr ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:15:57
---------------------------------------------------
Carga los obj. de transacci$$HEX1$$f300$$ENDHEX$$n
---------------------------------------------------*/
dw_busqueda.of_conexion(n_cst_application.itr_appl,True)
dw_bordado.of_conexion(n_cst_application.itr_appl,True)

Return 1

end function

public function integer of_verificar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 09 de Noviembre de 2004.H:10:56
---------------------------------------------------
Verificaci$$HEX1$$f300$$ENDHEX$$n de los datos antes de grabar
---------------------------------------------------*/
Long ll_pos
//---------------------------------------------------------------------------------------------
If dw_busqueda.RowCount()<=0 Then
	Return -1
End If
If dw_bordado.RowCount()<=0 Then
	Return -1
End If
//--------------------------------------------------------
If dw_bordado.AcceptText()<>1 Then
	//MessageBox("Advertencia!","Los datos de los bordados no son v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	dw_bordado.SetFocus()
	Return -1
End If
//----------------------------------------------------------------------------------------
If Not dw_bordado.of_completedata() Then
	dw_bordado.SetFocus()
	Return -1
End If
//----------------------------------------------------------------------------------------
Return 1
end function

public function integer of_ok_bordado ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:13:58
---------------------------------------------------
Acepta los cambios hechos a la bd.
---------------------------------------------------*/
//*****************************************
COMMIT USING n_cst_application.itr_appl ;
//*****************************************
Return 1
end function

public function integer of_error_bordado ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:15:59
---------------------------------------------------
Acepta los cambios hechos a la bd.
---------------------------------------------------*/
//*****************************************
ROLLBACK USING n_cst_application.itr_appl ;
//*****************************************
Return 1
end function

public function integer of_newid_bordado ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Lunes 08 de Noviembre de 2004.H:14:32
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n que asigna los nuevos consecutivos al(os) nuevo(s)
bordados(es) que aparezcan en el registro
---------------------------------------------------*/
Long ll_i
//--------------------------------------------------
dw_bordado.SetFilter("id_bordado=0")
dw_bordado.Filter()
If dw_bordado.RowCount()>0 Then
	For ll_i=1 To dw_bordado.RowCount()
		If of_asignar_consecutivo()<>1 Then
			Return -1
		End If
		dw_bordado.SetItem(ll_i,"id_bordado",il_bordado)		
	Next
End If
dw_bordado.SetFilter("")
dw_bordado.Filter()
dw_bordado.Sort()
//---------------------------------------------------
Return 1


end function

public function integer of_sel_fila (long al_fila);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:11:21
---------------------------------------------------
--------------------------------------------------*/
il_fila=al_fila
dw_bordado.SelectRow(0,False)
dw_bordado.SelectRow(il_fila,True)
//---------------------------------------------------
Return 1
end function

public function long of_getid ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:15:59
---------------------------------------------------
Description from Design Model:
Retorna el valor seleccionado en caso de haber varios en pantalla
---------------------------------------------------*/
Long ll_pos
//-------------------------------------------------
If dw_bordado.RowCount()<=0 then
	Return -1
End If
//---------------------------------------------------
//ll_pos=dw_bordado.GetRow()
If il_fila>0 Then
	il_bordado=dw_bordado.GetItemNumber(il_fila,'id_bordado')
Else
	Return -1
End If
//-------------------------------------------------------------------------
Return il_bordado
end function

public function integer of_set_activo (boolean ab_activo);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:11:21
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
If ab_activo Then
	dw_bordado.Modify("activo.TabSequence=0")
Else
	dw_bordado.Modify('activo.TabSequence=40')
End If
//----------------------------------------
Return 1
end function

public function integer of_filtro (string as_filtro);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:11:21
---------------------------------------------------
Funci$$HEX1$$f300$$ENDHEX$$n para el filtro del dw de bordados segun el criterio
---------------------------------------------------*/
//---------------------------------------------------
dw_bordado.SetFilter(as_filtro)
dw_bordado.Filter()
//---------------------------------------------------
Return 1
end function

public function boolean of_get_cambios ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 05 de Noviembre de 2004.H:11:40
---------------------------------------------------
---------------------------------------------------*/
//-------------------------------------------------
Return ib_cambios
end function

on u_cst_reg_bordado.create
this.cb_buscar=create cb_buscar
this.dw_bordado=create dw_bordado
this.dw_busqueda=create dw_busqueda
this.gb_busqueda=create gb_busqueda
this.gb_bordado=create gb_bordado
this.Control[]={this.cb_buscar,&
this.dw_bordado,&
this.dw_busqueda,&
this.gb_busqueda,&
this.gb_bordado}
end on

on u_cst_reg_bordado.destroy
destroy(this.cb_buscar)
destroy(this.dw_bordado)
destroy(this.dw_busqueda)
destroy(this.gb_busqueda)
destroy(this.gb_bordado)
end on

event constructor;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:16:19
---------------------------------------------------
---------------------------------------------------*/
of_carga_objtr()
//--------------------------------------------------
dw_busqueda.InsertRow(0)
end event

type cb_buscar from u_cb_application within u_cst_reg_bordado
integer x = 1646
integer y = 320
integer taborder = 20
string text = "&Buscar"
end type

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:15:23
---------------------------------------------------
---------------------------------------------------*/
If dw_busqueda.RowCount()<=0 Then
	Return
End If
If dw_busqueda.AcceptText()<>1 Then
	//MessageBox("Advertencia!","Los datos de la b$$HEX1$$fa00$$ENDHEX$$squeda del bordado no son v$$HEX1$$e100$$ENDHEX$$lidos.Verifique.",StopSign!)
	cb_buscar.Event LoseFocus()
	dw_busqueda.SetFocus()
	Return -1
End If
of_redraw(False)
of_buscar()
of_redraw(True)
//-------------------------------------------------------

end event

type dw_bordado from u_dw_application within u_cst_reg_bordado
integer x = 110
integer y = 576
integer width = 2011
integer height = 1184
integer taborder = 30
string dataobject = "d_mu_m_bordado"
boolean hscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:15:27
---------------------------------------------------
---------------------------------------------------*/
String ls_coltype
Long ll_pos
n_cst_comun_orden lou_desc
//-------------------------------------------------
ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	If Trim(Data)='' AND NOt IsNull(Data) Then
		MessageBox('Advertencia','Texto del campo descripci$$HEX1$$f300$$ENDHEX$$n no es v$$HEX1$$e100$$ENDHEX$$lido.S$$HEX1$$f300$$ENDHEX$$lo hay espacios en blanco',StopSign!)
		Return 1
	End If
	If This.of_validarcadena(Data)<>1 Then 
		Return 1
	End If
End If
//---------------------------------------------------
If dwo.name='de_bordado' Then
	ll_pos=Find('Upper(Trim(de_bordado))=Upper(Trim(~''+Data+'~'))',1,RowCount())
	If ll_pos>0 Then
		MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','La descripci$$HEX1$$f300$$ENDHEX$$n ~''+Data+'~' ya se encuentra ingresada en el registro nro. '+String(ll_pos),Information!)
		Return 1
	End If
	lou_desc.of_validardescripcion(Data,2/*para bordados*/,n_cst_application.itr_appl)
	ll_pos=lou_desc.of_getlong(1)
	If ll_pos<>0 AND GetItemNumber(row,'id_bordado')<>ll_pos Then
		MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','La descripci$$HEX1$$f300$$ENDHEX$$n ~''+Data+'~' ya se encuentra registrada para el bordado de c$$HEX1$$f300$$ENDHEX$$d. ~''+String(ll_pos)+'~'.',Information!)
		Return 1
	End If	
End If
ib_cambios=True
end event

event getfocus;call super::getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:15:27
---------------------------------------------------
---------------------------------------------------*/
gb_bordado.of_color(True)
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:15:27
---------------------------------------------------
---------------------------------------------------*/
gb_bordado.of_color(False)
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:15:26
---------------------------------------------------
---------------------------------------------------*/
Long ll_i
//-------------------------------------------------------------------------------------------
Super::Event ue_insertRow()
ll_i = This.GetRow()
This.SetItem(ll_i,"id_bordado",0)
This.SetColumn('de_bordado')
This.SetItemStatus(ll_i,0,Primary!,New!)

end event

event clicked;call super::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:11:21
---------------------------------------------------
---------------------------------------------------*/
If Row=0 Then Return
//---------------------------------------------------
of_Sel_fila(Row)
//---------------------------------------------------
end event

event itemfocuschanged;call super::itemfocuschanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:12:01
---------------------------------------------------
---------------------------------------------------*/
If Row=0 Then Return
//---------------------------------------------------
of_Sel_fila(Row)
//---------------------------------------------------
end event

event rowfocuschanged;call super::rowfocuschanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 30 de Noviembre de 2004.H:12:01
---------------------------------------------------
---------------------------------------------------*/
If CurrentRow=0 Then Return
//---------------------------------------------------
of_Sel_fila(CurrentRow)
//---------------------------------------------------
end event

event itemerror;call super::itemerror;String ls_coltype
Int li_null
//-------------------------------------------------
ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	of_sel_fila(row)
	Return 1
End If

If dwo.name='puntadas' OR dwo.name='partes' Then
	If Long(Data)=0 Then
		SetNull(li_null)		
		This.SetItem(row,String(dwo.name),li_null)
		Return 3
	End If	
End If
end event

type dw_busqueda from u_dw_application within u_cst_reg_bordado
integer x = 110
integer y = 128
integer width = 1902
integer height = 192
string dataobject = "d_ext_bus_bordado"
boolean vscrollbar = false
boolean livescroll = false
end type

event itemchanged;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:15:27
---------------------------------------------------
---------------------------------------------------*/
String ls_coltype
ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	If Trim(Data)='' AND NOt IsNull(Data) Then
		MessageBox('Advertencia','Texto del campo de descripci$$HEX1$$f300$$ENDHEX$$n no es v$$HEX1$$e100$$ENDHEX$$lido.S$$HEX1$$f300$$ENDHEX$$lo hay espacios en blanco',StopSign!)		
		Return 1
	End If
	If This.of_validarcadena(Data)<>1 Then 
		Return 1
	End If
End If
end event

event getfocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:15:27
---------------------------------------------------
---------------------------------------------------*/
gb_busqueda.of_color(True)
end event

event losefocus;call super::losefocus;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:15:27
---------------------------------------------------
---------------------------------------------------*/
gb_busqueda.of_color(False)
end event

event ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:15:27
---------------------------------------------------
Overwrite!
---------------------------------------------------*/

end event

event ue_deleterow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:15:27
---------------------------------------------------
Overwrite!
---------------------------------------------------*/
end event

event itemerror;call super::itemerror;String ls_coltype
Int li_null
//-------------------------------------------------
ls_coltype = This.Describe(dwo.name+".ColType")
If Match(ls_coltype,'char+') Then
	Return 1
End If

If dwo.name='puntadas' OR dwo.name='partes' Then
	If Long(Data)=0 Then
		SetNull(li_null)		
		This.SetItem(row,String(dwo.name),li_null)
		Return 3
	End If	
End If
end event

type gb_busqueda from u_gb_base within u_cst_reg_bordado
integer x = 37
integer y = 32
integer width = 2158
integer height = 416
integer taborder = 0
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda de Bordado (Ctrl+1)"
end type

type gb_bordado from u_gb_base within u_cst_reg_bordado
integer x = 37
integer y = 480
integer width = 2158
integer height = 1344
integer taborder = 0
string text = "Bordados (Ctrl+2)"
end type

