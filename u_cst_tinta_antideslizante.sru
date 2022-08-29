HA$PBExportHeader$u_cst_tinta_antideslizante.sru
$PBExportComments$Objeto visible personalizado~r~nSe requiere para que el registro de tintas antideslizantes
forward
global type u_cst_tinta_antideslizante from u_cst_reg_mant_base
end type
end forward

global type u_cst_tinta_antideslizante from u_cst_reg_mant_base
integer width = 2601
integer height = 1440
end type
global u_cst_tinta_antideslizante u_cst_tinta_antideslizante

type variables
/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:10:29
---------------------------------------------------
---------------------------------------------------*/
PROTECTED:
	Long il_tinta
	String is_where

end variables

forward prototypes
public function integer of_activar ()
public function integer of_asignar_consecutivo ()
public function integer of_buscar ()
public function integer of_verificar ()
public function integer of_newid ()
public function long of_getid ()
public function integer of_guardar ()
end prototypes

public function integer of_activar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:11:03
---------------------------------------------------
---------------------------------------------------*/
is_msj='La tinta antideslizante seleccionada ya se encuentra activa.'
Return Super::Function of_activar()

end function

public function integer of_asignar_consecutivo ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:11:19
---------------------------------------------------
Asigna el consecutivo para las tintas antideslizantes
id_documento 	= 35
ob_documento 	= Tinta Antideslizante-Programaci$$HEX1$$f300$$ENDHEX$$n
---------------------------------------------------*/
//---------------------------------------------------
is_nro_item='nro_tinta'
is_d_nro_item='d_nro_tinta'
ii_id_documento=35
Return Super::Function of_asignar_consecutivo()

end function

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
is_where="where ("
ls_cad_campo=String(dw_busqueda.GetItemString(1,"de_tinta"))
If Not IsNull(ls_cad_campo) Then
	is_where+="Upper(de_tinta) LIKE ~~'%"+Upper(ls_cad_campo)+"%~~' )"
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
dw_detalle.Modify("DataWindow.Table.Select='"+ls_origen+"'")
//-------------------------------------------------------------------------------------------------
of_redraw(True)
Return 1
end function

public function integer of_verificar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:12:03
---------------------------------------------------
---------------------------------------------------*/
is_msj="Los datos de las tintas no son v$$HEX1$$e100$$ENDHEX$$lidos."
Return Super::Function of_verificar()

end function

public function integer of_newid ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:12:08
---------------------------------------------------
---------------------------------------------------*/
is_id_item='id_tinta'
is_filtro=is_id_item+'=0'
//--------------------------------------------------
Return Super::Function of_newid()
end function

public function long of_getid ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:11:57
---------------------------------------------------
Obtiene el Id de la tinta actual en el registro
---------------------------------------------------*/
is_id_item='id_tinta'
Super::Function of_getid()
il_tinta=il_item

Return il_tinta
end function

public function integer of_guardar ();/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:11:59	
-------------------------------------------------------------------------------
Description from Design Model:
Almacena los cambios en DB
------------------------------------------------------------------------------*/
Long ll_i
DateTime ldt_fecha
String ls_usuario,ls_instancia
////-------------------------------------------------------------------------------
If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If
//-------------------------------------------------------------------------------
//of_newid() // Asignaci$$HEX1$$f300$$ENDHEX$$n de los consecutivos
dw_detalle.of_datosactualizacion(ldt_fecha,ls_usuario,ls_instancia)
//-------------------------------------------------------------------------------
If dw_detalle.Update(True,False)<>1 Then 
	of_error_registro()
	Return -1
End If
//---------------------------------------------------------------------------------
dw_detalle.ResetUpdate()
Return 1
end function

on u_cst_tinta_antideslizante.create
call super::create
end on

on u_cst_tinta_antideslizante.destroy
call super::destroy
end on

event constructor;call super::constructor;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:10:37
---------------------------------------------------
--------------------------------------------------*/
//-------------------------------------------------
is_item='Tinta(s) Antideslizante(s)'
is_id_item='id_tinta'
end event

type cb_buscar from u_cst_reg_mant_base`cb_buscar within u_cst_tinta_antideslizante
integer x = 1614
integer y = 56
end type

event cb_buscar::clicked;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 12 de Noviembre de 2004.H:15:23
---------------------------------------------------
---------------------------------------------------*/
If dw_busqueda.RowCount()<=0 Then
	Return
End If

If dw_busqueda.AcceptText()<>1 Then
	//MessageBox("Advertencia!","La descripci$$HEX1$$f300$$ENDHEX$$n en la b$$HEX1$$fa00$$ENDHEX$$squeda de tinta antideslizante no es v$$HEX1$$e100$$ENDHEX$$lida.Verifique.",StopSign!)
	cb_buscar.Event LoseFocus()
	dw_busqueda.SetFocus()
	Return -1
End If

of_redraw(False)
of_buscar()
of_redraw(True)
//-------------------------------------------------------

end event

type dw_detalle from u_cst_reg_mant_base`dw_detalle within u_cst_tinta_antideslizante
integer y = 256
integer width = 2409
integer height = 1080
string dataobject = "d_mu_m_tinta"
end type

event dw_detalle::ue_insertrow;/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Martes 16 de Noviembre de 2004.H:12:01
---------------------------------------------------
---------------------------------------------------*/
//---------------------------------------------------
Super::Event ue_insertRow()
This.SetColumn('id_tinta')
end event

event dw_detalle::itemchanged;n_cst_comun_orden lou_desc
Long ll_pos
//---------------------------------------------------------------------
If dwo.name='de_tinta' Then
	If Trim(Data)='' AND NOt IsNull(Data) Then
		MessageBox('Advertencia','Texto del campo de descripci$$HEX1$$f300$$ENDHEX$$n no es v$$HEX1$$e100$$ENDHEX$$lido.S$$HEX1$$f300$$ENDHEX$$lo hay espacios en blanco',StopSign!)		
		Return 1
	End If
	If This.of_validarcadena(Data)<>1 Then 
		Return 1
	End If
	//---------------------------------------------------------------------
	ll_pos=Find('Upper(Trim(de_tinta))=Upper(Trim(~''+Data+'~'))',1,RowCount())
	If ll_pos>0 Then
		MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','La descripci$$HEX1$$f300$$ENDHEX$$n ~''+Data+'~' ya se encuentra ingresada en el registro nro. '+String(ll_pos),Information!)
		Return 1
	End If
	lou_desc.of_validardescripcion(Data,3/*para tintas*/,n_cst_application.itr_appl)
	ll_pos=lou_desc.of_getlong(1)
	If ll_pos<>0 AND GetItemNumber(row,'id_tinta')<>ll_pos Then		
		MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','La descripci$$HEX1$$f300$$ENDHEX$$n ~''+Data+'~' ya se encuentra registrada para la tinta de c$$HEX1$$f300$$ENDHEX$$d. ~''+String(ll_pos)+'~'.',Information!)
		Return 1
	End If	
End If

If dwo.name='id_tinta' Then
	If IsNull(Data) Then
		MessageBox('Advertencia','C$$HEX1$$f300$$ENDHEX$$digo de tinta no es v$$HEX1$$e100$$ENDHEX$$lido',StopSign!)		
		Return 1
	End If
	lou_desc.of_validarcodigo(long(Data),3/*para tintas*/,n_cst_application.itr_appl)
	ll_pos=lou_desc.of_getlong(1)
	If ll_pos<>0 AND GetItemNumber(row,'id_tinta')<>ll_pos Then		
		MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n','El c$$HEX1$$f300$$ENDHEX$$digo ~''+Data+'~' ya se encuentra registrado',Information!)
		SetFocus()
		SetColumn('id_tinta')
		Return 1
	End If	
End If

ib_cambios=True
end event

event dw_detalle::itemerror;If dwo.name='de_tinta' Then
	of_sel_fila(row)
	Return 1
End If

If dwo.name='id_tinta' Then
	of_sel_fila(row)
	Return 1
End If
end event

type dw_busqueda from u_cst_reg_mant_base`dw_busqueda within u_cst_tinta_antideslizante
integer x = 50
integer y = 52
integer width = 1527
integer height = 100
string dataobject = "d_ext_busca_tinta"
end type

event dw_busqueda::itemchanged;call super::itemchanged;
If dwo.name='de_tinta' Then
	If Trim(Data)='' AND NOt IsNull(Data) Then
		MessageBox('Advertencia','Texto del campo de descripci$$HEX1$$f300$$ENDHEX$$n no es v$$HEX1$$e100$$ENDHEX$$lido.S$$HEX1$$f300$$ENDHEX$$lo hay espacios en blanco',StopSign!)		
		Return 1
	End If
	If This.of_validarcadena(Data)<>1 Then 
		Return 1
	End If
End If
end event

event dw_busqueda::itemerror;call super::itemerror;
If dwo.name='de_tinta' Then
	Return 1
End If
end event

type gb_busqueda from u_cst_reg_mant_base`gb_busqueda within u_cst_tinta_antideslizante
integer y = 4
integer width = 2482
integer height = 172
string text = "B$$HEX1$$fa00$$ENDHEX$$squeda de Tinta Antideslizante (Ctrl+1)"
end type

type gb_detalle from u_cst_reg_mant_base`gb_detalle within u_cst_tinta_antideslizante
integer y = 192
integer width = 2482
integer height = 1208
string text = "Tintas Antideslizantes (Ctrl+2)"
end type

