HA$PBExportHeader$w_h_composicion.srw
forward
global type w_h_composicion from w_sheet
end type
type dw_compo from u_dw_application within w_h_composicion
end type
type dw_det_ref_pdn from u_dw_application within w_h_composicion
end type
type dw_colores_vta from u_dw_application within w_h_composicion
end type
type dw_encabezado from u_dw_application within w_h_composicion
end type
type gb_1 from u_gb_base within w_h_composicion
end type
type gb_2 from u_gb_base within w_h_composicion
end type
type gb_3 from u_gb_base within w_h_composicion
end type
end forward

global type w_h_composicion from w_sheet
integer width = 3822
integer height = 2068
string title = "Relaci$$HEX1$$f300$$ENDHEX$$n de Surtidos"
dw_compo dw_compo
dw_det_ref_pdn dw_det_ref_pdn
dw_colores_vta dw_colores_vta
dw_encabezado dw_encabezado
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_h_composicion w_h_composicion

type variables
String 				is_where, is_abrev
n_cst_comun  		iuo_comun
n_tr_application 	itr_produrif
Boolean          	ib_down, ib_dawn_m , ib_leave = FALSE	
Long              il_fila_clicked
 
end variables

forward prototypes
public function integer of_recuperar_refs_pdn ()
public function integer of_verificar_doble_ref_pdn (long al_fila)
public function integer of_conectar_bd ()
public function integer of_verificar_doble_talla_vta (long al_fila)
public function integer of_validar_tiene_detalle (integer ai_talla, integer ai_color)
end prototypes

public function integer of_recuperar_refs_pdn ();  
Integer  li_talla   
Long ll_color, li_res


li_talla      = dw_colores_vta.GetItemNumber(dw_colores_vta.GetRow(), 'co_tallas')
ll_color      = dw_colores_vta.GetItemNumber(dw_colores_vta.GetRow(), 'co_colors')

IF IsNull(li_talla) THEN li_talla = -1
IF	IsNull(ll_color) THEN ll_color = -1 


dw_det_ref_pdn.SetRedraw(FALSE)
dw_det_ref_pdn.SetFilter("")
dw_det_ref_pdn.Filter()
li_res = dw_det_ref_pdn.RowCount()

li_res = dw_det_ref_pdn.SetFilter("co_tallas = "+ String( li_talla) + " AND co_colors = "+String(ll_color) )
dw_det_ref_pdn.Filter()

li_res = dw_det_ref_pdn.RowCount()
dw_det_ref_pdn.SetRedraw(TRUE)

RETURN 1
end function

public function integer of_verificar_doble_ref_pdn (long al_fila);  
Integer 	li_talla, &
			li_talla_pdn, &
			li_fabrica_pdn, &
			li_linea_pdn, &
			li_calidad_pdn
String ls_find			
Long 		ll_ref_pdn , ll_find, ll_color, ll_color_pdn
 
li_fabrica_pdn = dw_det_ref_pdn.GetItemNumber(al_fila, 'co_fabrica')
li_linea_pdn   = dw_det_ref_pdn.GetItemNumber(al_fila, 'co_linea')
ll_ref_pdn     = dw_det_ref_pdn.GetItemNumber(al_fila, 'co_referencia')
li_talla_pdn   = dw_det_ref_pdn.GetItemNumber(al_fila, 'co_talla')
li_calidad_pdn = dw_det_ref_pdn.GetItemNumber(al_fila, 'co_calidad')
ll_color_pdn   = dw_det_ref_pdn.GetItemNumber(al_fila, 'co_color')

ls_find =  'co_fabrica = '+String(li_fabrica_pdn)+' AND co_linea = '+String(li_linea_pdn)+&
          ' AND co_referencia = '+String(ll_ref_pdn) + ' AND co_talla = '+String(li_talla_pdn) + &
          ' AND co_calidad = '+String(li_calidad_pdn)+ ' AND co_color = '+String(ll_color_pdn)

// Busco el registro en la dw 
ll_find = dw_det_ref_pdn.Find(ls_find, 1, dw_det_ref_pdn.RowCount())
// Si lo encuentro verifico si es la $$HEX1$$fa00$$ENDHEX$$ltima fila y si es asi, no pasa nada
IF ll_find > 0 THEN
	IF ll_find = dw_det_ref_pdn.RowCount() THEN
		RETURN 1
	ELSEIF ll_find < al_fila THEN 
		MessageBox('Atenci$$HEX1$$f300$$ENDHEX$$n', ' La referencia '+String(li_fabrica_pdn)+'-'+String(li_linea_pdn)+'-'+&
					  String(ll_ref_pdn) + '-'+String(li_talla_pdn) + '-'+String(li_calidad_pdn)+ '-'+&
					  String(ll_color_pdn)+" ya se encuentra digitada.")			
		RETURN -1
	ELSEIF ll_find = al_fila THEN 
	   // Si encuentro que es la fila en la que se esta validando, verifico si de ahi
		// en adelante est$$HEX2$$e1002000$$ENDHEX$$
		ll_find = dw_det_ref_pdn.Find(ls_find, ll_find + 1, dw_det_ref_pdn.RowCount())
		// y si es asi esta doble...
		IF ll_find > 0 THEN
			MessageBox('Atenci$$HEX1$$f300$$ENDHEX$$n', ' La referencia '+String(li_fabrica_pdn)+'-'+String(li_linea_pdn)+'-'+&
						  String(ll_ref_pdn) + '-'+String(li_talla_pdn) + '-'+String(li_calidad_pdn)+ '-'+&
						  String(ll_color_pdn)+" ya se encuentra digitada.")			
			RETURN -1
		ELSE
			// Sino no pasa nada
			RETURN 1
		END IF
	END IF
END IF
RETURN 1

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

public function integer of_verificar_doble_talla_vta (long al_fila);  
Integer 	li_talla_vta
			 
String 	ls_find			
Long 		ll_find, ll_color_vta
 
li_talla_vta   = dw_colores_vta.GetItemNumber(al_fila, 'co_tallas')
ll_color_vta   = dw_colores_vta.GetItemNumber(al_fila, 'co_colors')

ls_find =  'co_tallas = '+String(li_talla_vta)  + ' AND co_colors = '+String(ll_color_vta)

// Busco el registro en la dw 
ll_find = dw_colores_vta.Find(ls_find, 1, dw_colores_vta.RowCount())
// Si lo encuentro verifico si es la $$HEX1$$fa00$$ENDHEX$$ltima fila y si es asi, no pasa nada
IF ll_find > 0 THEN
	IF ll_find = dw_colores_vta.RowCount() THEN
		RETURN 1
	ELSEIF ll_find < al_fila THEN 
		MessageBox('Atenci$$HEX1$$f300$$ENDHEX$$n', ' La talla-color '+String(li_talla_vta) + '-'+&
					  String(ll_color_vta)+" ya se encuentra digitada.")			
		RETURN -1
	ELSEIF ll_find = al_fila THEN 
	   // Si encuentro que es la fila en la que se esta validando, verifico si de ahi
		// en adelante est$$HEX2$$e1002000$$ENDHEX$$
		ll_find = dw_colores_vta.Find(ls_find, ll_find + 1, dw_colores_vta.RowCount())
		// y si es asi esta doble...
		IF ll_find > 0 THEN
			MessageBox('Atenci$$HEX1$$f300$$ENDHEX$$n', ' La talla-color '+String(li_talla_vta) + '-'+&
					  String(ll_color_vta)+" ya se encuentra digitada.")			
				RETURN -1
		ELSE
			// Sino no pasa nada
			RETURN 1
		END IF
	END IF
END IF
RETURN 1

end function

public function integer of_validar_tiene_detalle (integer ai_talla, integer ai_color);  
Integer  li_talla
Long    ll_color , li_res


li_talla      = ai_talla
ll_color      = ai_color

IF IsNull(li_talla) THEN li_talla = -1
IF	IsNull(ll_color) THEN ll_color = -1 


dw_det_ref_pdn.SetRedraw(FALSE)
dw_det_ref_pdn.SetFilter("")
dw_det_ref_pdn.Filter()
li_res = dw_det_ref_pdn.RowCount()

li_res = dw_det_ref_pdn.SetFilter("co_tallas = "+ String( li_talla) + " AND co_colors = "+String(ll_color) )
dw_det_ref_pdn.Filter()

li_res = dw_det_ref_pdn.RowCount()
dw_det_ref_pdn.SetRedraw(TRUE)

RETURN 1
end function

on w_h_composicion.create
int iCurrent
call super::create
this.dw_compo=create dw_compo
this.dw_det_ref_pdn=create dw_det_ref_pdn
this.dw_colores_vta=create dw_colores_vta
this.dw_encabezado=create dw_encabezado
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_compo
this.Control[iCurrent+2]=this.dw_det_ref_pdn
this.Control[iCurrent+3]=this.dw_colores_vta
this.Control[iCurrent+4]=this.dw_encabezado
this.Control[iCurrent+5]=this.gb_1
this.Control[iCurrent+6]=this.gb_2
this.Control[iCurrent+7]=this.gb_3
end on

on w_h_composicion.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_compo)
destroy(this.dw_det_ref_pdn)
destroy(this.dw_colores_vta)
destroy(this.dw_encabezado)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event ue_find;call super::ue_find;n_cst_param lo_param
Long ll_filas
OpenWithParm(w_opc_surtidos, is_where)

lo_param = Message.PowerObjectParm

If Not IsValid(lo_param) Then
	Return 
End If

SetPointer(HourGlass!)

dw_encabezado.SetItem(1, "co_fabricas"   , lo_param.il_vector[1])
dw_encabezado.SetItem(1, "co_lineas"     , lo_param.il_vector[2])
dw_encabezado.SetItem(1, "co_referencias", lo_param.il_vector[3])
dw_encabezado.SetItem(1, "co_muestrario" , lo_param.il_vector[4])
dw_encabezado.SetItem(1, "co_calidads"   , lo_param.il_vector[5])
dw_encabezado.SetItem(1, "de_referencia" , lo_param.is_vector[2])

is_where = lo_param.is_vector[1]

dw_colores_vta.SetRedraw(False)
dw_det_ref_pdn.SetRedraw(False)

GarbageCollect()

dw_colores_vta.Retrieve( lo_param.il_vector[1], lo_param.il_vector[2], lo_param.il_vector[3], &
                         lo_param.il_vector[4], lo_param.il_vector[5] )
								
ll_filas = dw_colores_vta.RowCount()
IF ll_filas = 0 THEN
	
	dw_colores_vta.SelectRow(0, False)
	dw_colores_vta.SelectRow(1, True)
	
	
END IF
ll_filas = dw_det_ref_pdn.Retrieve( lo_param.il_vector[1], lo_param.il_vector[2], lo_param.il_vector[3], &
                         lo_param.il_vector[5], lo_param.il_vector[4]  )
of_recuperar_refs_pdn( )
dw_det_ref_pdn.SetRedraw(True)
dw_colores_vta.SetRedraw(True)

GarbageCollect()
end event

event open;call super::open;// itr_produrif
this.x = 1
this.y = 1
 
dw_encabezado.InsertRow(0)

itr_produrif = CREATE n_tr_application
	
IF of_conectar_bd( ) < 0 THEN CLOSE(THIS)

dw_colores_vta.of_conexion( itr_produrif, true)
//dw_det_ref_pdn.of_conexion( itr_produrif, true)

dw_colores_vta.Retrieve()
end event

event ue_save; 
Integer 	li_talla, &
			li_talla_pdn, &
			li_fabrica_pdn, &
			li_linea_pdn, &
			li_calidad_pdn, &
			li_talla_vta, &
			li_fabrica_vta, &
			li_linea_vta, &
			li_calidad_vta 
String 	ls_cadena, ls_mensaje
Long 		ll_ref_pdn, ll_filap, ll_filav, ll_ref_vta, ll_color, ll_color_pdn, ll_color_vta 
 
dw_colores_vta.AcceptText()
dw_det_ref_pdn.AcceptText( )

IF dw_colores_vta.RowCount() = 0 THEN
	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Antes debe ingresar todos los datos de la talla-color de venta." )
	dw_colores_vta.SetFocus()
	RETURN
END IF 

/*
* Se recorren todos los colores de venta para verificar que su detalle este 
* ingresado y tenga su composicion distribuida en un total del 100 %
*/	
FOR ll_filav = 1 TO dw_colores_vta.RowCount()
	li_fabrica_vta = dw_colores_vta.GetItemNumber(ll_filav, 'co_fabricas')
	li_linea_vta   = dw_colores_vta.GetItemNumber(ll_filav, 'co_lineas')
	ll_ref_vta     = dw_colores_vta.GetItemNumber(ll_filav, 'co_referencias')
	li_talla_vta   = dw_colores_vta.GetItemNumber(ll_filav, 'co_tallas')
	li_calidad_vta = dw_colores_vta.GetItemNumber(ll_filav, 'co_calidads') 
   ll_color_vta   = dw_colores_vta.GetItemNumber(ll_filav, 'co_colors') 
	
	IF IsNull(li_talla_vta) OR IsNull(ll_color_vta)  THEN
		MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Antes debe ingresar todos los datos de la talla-color de venta." )
		dw_colores_vta.SetColumn('co_tallas')
		dw_colores_vta.SetFocus()
		RETURN
	END IF
	
	ls_cadena =  'co_fabricas = '+String(li_fabrica_vta)+' AND co_lineas = '+String(li_linea_vta) +&
          ' AND co_referencias = '+String(ll_ref_vta) + ' AND co_tallas = '+String(li_talla_vta) +&
	       ' AND co_calidads = '+String(li_calidad_vta)+ ' AND co_colors = '+String(ll_color_vta)

	//dw_det_ref_pdn.SetRedraw( FALSE)
	
	dw_det_ref_pdn.SetFilter("")
	dw_det_ref_pdn.Filter()
	
	dw_det_ref_pdn.SetFilter(ls_cadena)
	dw_det_ref_pdn.Filter()

	dw_colores_vta.SelectRow(0, False)
	dw_colores_vta.SelectRow(ll_filav, True)
	
	IF dw_det_ref_pdn.RowCount() = 0 THEN 
		ls_mensaje = 'Para la talla y color de venta '+String(li_talla_vta) +&
	                '-'+String(ll_color_vta)+' no se ha insertado detalle.'
		MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_mensaje)
		dw_colores_vta.SetRow(ll_filav)
		dw_colores_vta.ScrollToRow(ll_filav)
		//dw_det_ref_pdn.SetRedraw(TRUE)
		dw_det_ref_pdn.SetFocus()		
		RETURN
	END IF	
	
	FOR ll_filap = 1 TO dw_det_ref_pdn.RowCount()
		li_fabrica_pdn = dw_det_ref_pdn.GetItemNumber(ll_filap, 'co_fabrica')
		li_linea_pdn   = dw_det_ref_pdn.GetItemNumber(ll_filap, 'co_linea')
		ll_ref_pdn     = dw_det_ref_pdn.GetItemNumber(ll_filap, 'co_referencia')
		li_talla_pdn   = dw_det_ref_pdn.GetItemNumber(ll_filap, 'co_talla')
		li_calidad_pdn = dw_det_ref_pdn.GetItemNumber(ll_filap, 'co_calidad')
		ll_color_pdn   = dw_det_ref_pdn.GetItemNumber(ll_filap, 'co_color')
		
		IF IsNull(li_fabrica_pdn) OR IsNull(li_linea_pdn) OR IsNull(ll_ref_pdn) OR &
			IsNull(li_talla_pdn) OR IsNull(li_calidad_pdn) OR IsNull(ll_color_pdn) THEN 
			ls_mensaje = 'Para la talla y color de venta '+String(li_talla_vta)+'-'+String(ll_color_vta)+&
		                ' no se ha ingresado completamente la informaci$$HEX1$$f300$$ENDHEX$$n de producci$$HEX1$$f300$$ENDHEX$$n.'
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_mensaje)
			dw_colores_vta.SetRow(ll_filav)
			dw_colores_vta.ScrollToRow(ll_filav)
			dw_det_ref_pdn.SetColumn(ll_filap)			
			//dw_det_ref_pdn.SetRedraw(TRUE)
			dw_det_ref_pdn.SetFocus()
			RETURN
		END IF
	NEXT
	IF dw_det_ref_pdn.GetItemNumber(1, 'tot_prc') <> 100 THEN
		MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La suma de porcentaje de composici$$HEX1$$f300$$ENDHEX$$n debe ser igual a 100")
		RETURN
	END IF
NEXT

IF dw_det_ref_pdn.update() <> 1 THEN
	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Error al grabar la relaci$$HEX1$$f300$$ENDHEX$$n de referencias")
	Rollback Using itr_produrif;
	RETURN
ELSE
	Commit Using itr_produrif;
	
	If itr_produrif.SQLcode = -1 Then 
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(itr_produrif)
		Return 
	End If
END IF
end event

type dw_compo from u_dw_application within w_h_composicion
event ue_lbuttondown pbm_lbuttondown
event ue_lbuttonup pbm_lbuttonup
event ue_mousemove pbm_mousemove
integer x = 1262
integer y = 476
integer width = 2318
integer height = 1316
integer taborder = 30
string dataobject = "d_compo"
boolean hscrollbar = true
boolean livescroll = false
end type

event ue_lbuttondown;
ib_dawn_m = True
end event

event ue_lbuttonup;Long ll_find



This.SelectRow(0,False)
ib_dawn_m = False
	This.Drag(End!)
end event

event ue_mousemove;String ls_object

ls_object = GetObjectAtPointer()
If Len(ls_object) > 0 Then 
	If ib_dawn_m Then
		is_abrev = This.GetItemString(This.GetRow(), 'mezcla')
		This.Drag(Begin!)
	ELSE
		ib_dawn_m  = FALSE
	End If	
End If	
end event

event doubleclicked;call super::doubleclicked;//If Row=0 Then Return
//
//n_cst_param lo_param
//Long  li_talla_pdn, &
//			li_fabrica_pdn, &
//			li_linea_pdn, &
//			li_calidad_pdn, &
//			ll_color_pdn, & 
//			li_res, li_fabrica_vta, li_linea_vta, ll_ref_vta, li_talla_vta, li_calidad_vta, li_muestrario
//Long 		ll_ref_pdn
//String	ls_de_talla, &
//			ls_de_color
//
//li_fabrica_pdn = This.GetItemNumber(row, 'co_fabrica')
//li_linea_pdn   = This.GetItemNumber(row, 'co_linea')
//ll_ref_pdn     = This.GetItemNumber(row, 'co_referencia')
//li_calidad_pdn = This.GetItemNumber(row, 'co_calidad')
//li_talla_pdn   = This.GetItemNumber(row, 'co_talla')
//
//If dwo.name = "co_talla" Then
//	lo_param.il_vector[1] = li_fabrica_pdn
//	lo_param.il_vector[2] = li_linea_pdn
//	lo_param.il_vector[3] = ll_ref_pdn 
//	
//	OpenWithParm(w_bus_talla_pdn, lo_param )
//	
//	lo_param = Message.PowerObjectParm
//	
//	If IsValid(lo_param) Then
//		SetItem(row, 'co_talla', lo_param.il_vector[1])
//		SetItem(row, 'de_talla', lo_param.is_vector[1])
//	End If
//	
//ELSEIf dwo.name="co_color" Then
//	lo_param.il_vector[1] = li_fabrica_pdn
//	lo_param.il_vector[2] = li_linea_pdn
//	lo_param.il_vector[3] = ll_ref_pdn
//	lo_param.il_vector[4] = li_talla_pdn
//	lo_param.il_vector[5] = li_calidad_pdn
//	
//   OpenWithParm(w_bus_color_pdn, lo_param)
//	
//	lo_param=Message.PowerObjectParm
//	
//	If IsValid(lo_param) Then
//		
//		SetItem(row, 'co_color', lo_param.il_vector[1])
//		SetItem(row, 'de_color', lo_param.is_vector[1])
//		this.event itemchanged(row , This.Object.co_color, String(lo_param.il_vector[1]))
//					
//	End If
//End If
end event

event dragdrop;call super::dragdrop;/////////////////////////////////////////////////////////////////////
// If an employee from the dw_emp datawindow is dropped, retrieve
// the employee.
/////////////////////////////////////////////////////////////////////

DragObject	ldo_control
Long			li_row, &
				li_newrow
Long  		ll_find
String  		ls_abrev

// Get the dragged object.
ldo_control = DraggedObject()

// Determine if the dragged object is the employee datawindow
if ldo_control = dw_colores_vta then
	// Retrieve the employee detail information according to the selected 
	// row on the employee datawindow
	li_row = dw_colores_vta.GetRow()
	if li_row > 0 then
		ls_abrev = Trim(dw_colores_vta.object.abrv_grupo[li_row])
		ll_find   = dw_compo.Find("mezcla = '"+ls_abrev+"'", 1, dw_compo.RowCount())
		IF ll_find > 0 THEN RETURN

		ls_abrev  = dw_det_ref_pdn.GetItemString(1, 'mezcla')

		IF IsNull(ls_abrev)  OR  Trim(ls_abrev) = '' THEN
			ls_abrev = Trim(dw_colores_vta.object.abrv_grupo[li_row])
		ELSE
			ls_abrev += "/"+Trim(dw_colores_vta.object.abrv_grupo[li_row])
		END IF
		dw_det_ref_pdn.SetItem(1,  'mezcla', ls_abrev)
		li_newrow = dw_compo.InsertRow(0)
		ls_abrev = Trim(dw_colores_vta.object.abrv_grupo[li_row])
		dw_compo.SetItem(li_newrow, 'mezcla', ls_abrev) 
	END IF
END IF


	

end event

event getfocus;call super::getfocus;gb_1.Textcolor = RGB(0,0,0)
gb_2.Textcolor = RGB(0,0,0)
gb_3.Textcolor = RGB(0,0,255)
end event

event itemchanged;call super::itemchanged;//Long 	li_talla_pdn, &
//			ll_color_pdn, &
//			li_fabrica_pdn, &
//			li_linea_pdn, &
//			li_calidad_pdn, &
//			li_res, &
//			li_sw_surtido, &
//			li_fabrica_vta, &
//			li_linea_vta, &
//			li_talla_vta, &
//			li_calidad_vta, &
//			li_fabrica_ant, &
//			li_linea_ant, &
//			li_talla_ant, &
//			li_calidad_ant, &
//			ll_color_ant, &
//			li_muestrario 
//			
//Long 		ll_ref_pdn, ll_ref_ant, ll_ref_vta
//Decimal 	ldc_null, ldc_prc_ant
//String	ls_de_referencia, &
//			ls_de_talla, &
//			ls_de_color, & 
//			ls_de_refer_ant, &
//			ls_de_talla_ant, &
//			ls_de_color_ant 
//
//DateTime 			ldt_fecha
//String 				ls_usuario,ls_instancia 
//DatawindowChild	ldwc_talla, ldwc_colores
//
///*
//* Se obtienen los datos anteriores al cambio... por si hay error y se deba devolver 
//*/
//li_fabrica_ant  = This.GetItemNumber(row, 'co_fabrica')
//li_linea_ant    = This.GetItemNumber(row, 'co_linea')
//ll_ref_ant      = This.GetItemNumber(row, 'co_referencia')
//li_talla_ant    = This.GetItemNumber(row, 'co_talla')
//li_calidad_ant  = This.GetItemNumber(row, 'co_calidad')
//ll_color_ant    = This.GetItemNumber(row, 'co_color')
//ls_de_refer_ant = This.GetItemString(row, 'de_referencia')
//ls_de_talla_ant = This.GetItemString(row, 'de_talla')
//ls_de_color_ant = This.GetItemString(row, 'de_color')
//ldc_prc_ant     = This.GetItemDecimal(row, 'prc_composicion')
//AcceptText()
//GarbageCollect()
//
///*
//* aqui se obtiene el dato actual
//*/
//li_fabrica_pdn = This.GetItemNumber(row, 'co_fabrica')
//li_linea_pdn   = This.GetItemNumber(row, 'co_linea')
//ll_ref_pdn     = This.GetItemNumber(row, 'co_referencia')
//li_talla_pdn   = This.GetItemNumber(row, 'co_talla')
//li_calidad_pdn = This.GetItemNumber(row, 'co_calidad')
//ll_color_pdn   = This.GetItemNumber(row, 'co_color')
//li_muestrario  = This.GetItemNumber(row, 'co_muestrario')
//li_fabrica_vta = This.GetItemNumber(row, 'co_fabricas')
//li_linea_vta   = This.GetItemNumber(row, 'co_lineas')
//ll_ref_vta     = This.GetItemNumber(row, 'co_referencias')
//li_talla_vta   = This.GetItemNumber(row, 'co_tallas')
//li_calidad_vta = This.GetItemNumber(row, 'co_calidads')
// 
//
//CHOOSE CASE dwo.Name
//	/*
//	* Si se esta modificando alguna de estas columnas se procede a hacer las respectivas
//	* validaciones
//	*/
//	CASE 'co_talla', 'co_calidad', 'co_linea', 'co_referencia', 'co_fabrica', 'co_color'
//		IF IsNull(ll_ref_pdn) THEN 
//			SetNull(ls_de_referencia)
//			This.SetItem(row, 'de_referencia', ls_de_referencia)			
//		END IF
//		
//		IF IsNull(li_talla_pdn) THEN 
//			SetNull(ls_de_talla)
//			This.SetItem(row, 'de_talla', ls_de_talla)			
//		END IF
//		
//		IF IsNull(ll_color_pdn) THEN 
//			SetNull(ls_de_color)
//			This.SetItem(row, 'de_color', ls_de_color)			
//		END IF
//		
//		/*
//		* para validar la referencia de produccion y traer su descripcion es necesario que
//		* se hayan digitado la fabrica-linea-referencia de pdn
//		*/
//		IF Not IsNull(li_fabrica_pdn) AND Not IsNull(li_linea_pdn) AND Not IsNull(ll_ref_pdn) THEN			
//			
//			li_res = iuo_comun.of_verificar_ref_pdn(li_fabrica_pdn, li_linea_pdn, ll_ref_pdn, itr_produrif)
//			// si hubo error de bd (en el metodo se saca el mensaje de error) 
//			IF li_res = -1 THEN 
//				Return 1
//			ELSEIF li_res = 0 THEN
//				// si la ref no existe (en el metodo se ARMA el mensaje, pero aqui se muestra) 
//				MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", iuo_comun.of_getstring(1))
//				This.SetItem(row, 'co_referencia', ll_ref_ant)
//				This.SetItem(row, 'de_referencia', ls_de_refer_ant)
//				RETURN 1
//			ELSEIF li_res = 1 THEN 
//				// si la ref existe se muestra el codigo y la descripcion.
//				ls_de_referencia   = iuo_comun.of_getstring(1)
// 				This.SetItem(row, 'de_referencia', ls_de_referencia)
//			END IF
//			// Si se tiene ya el dato para talla y calidad...
//			IF Not IsNull(li_talla_pdn) THEN
//			// AND Not IsNull(li_calidad_pdn) THEN
//				/*
//				* ...y ademas se ha modificado el color (con valor que no sea nulo) se verifica
//				* que exista para traer su descripcion 
//				*/
//				IF  dwo.Name = 'co_color' AND NOT IsNull(ll_color_pdn)  THEN
//					li_res = iuo_comun.of_verificar_color_pdn(li_fabrica_pdn, li_linea_pdn, ll_ref_pdn, li_talla_pdn, li_calidad_pdn,  ll_color_pdn, itr_produrif)
//					// si hay error o no existe se muestra el mensaje y se devuelven los datos a
//					// su valor anterior
//					IF li_res = -1 OR li_res = 0 THEN
//						IF li_res = 0 THEN MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", iuo_comun.of_getstring(1))
//						This.SetItem(row, 'co_fabrica',    li_fabrica_ant)
//						This.SetItem(row, 'co_linea',      li_linea_ant)
//						This.SetItem(row, 'co_referencia', ll_ref_ant)
//						This.SetItem(row, 'de_referencia', ls_de_refer_ant)
//						This.SetItem(row, 'co_talla',      li_talla_ant)
//						This.SetItem(row, 'de_talla',      ls_de_talla_ant)
//						This.SetItem(row, 'co_calidad',    li_calidad_ant)
//						This.SetItem(row, 'co_color',      ll_color_ant)
//						This.SetItem(row, 'de_color',      ls_de_color_ant)
//						This.SetItem(row, 'prc_composicion', ldc_prc_ant)
//						Return 1
//					ELSEIF li_res = 1 THEN 
//						// si existe se configuran los datos descripcion e indicador de surtido...
//						ls_de_color   = iuo_comun.of_getstring(1)
//						li_sw_surtido = iuo_comun.of_getLong(1)
//						li_sw_surtido = dw_colores_vta.GetItemNumber(dw_colores_vta.GetRow(), 'sw_surtido')
//						This.SetItem(row, 'de_color',   ls_de_color)
//						This.SetItem(row, 'sw_surtido', li_sw_surtido)
//					END IF
//				ELSE
//					// Si no se digito color, sino una de las otras columnas se valida la talla
//					// enviando la 'P' como parametro, valida la de produccion.
//					li_res = iuo_comun.of_verificar_talla( li_fabrica_pdn, li_linea_pdn, ll_ref_pdn, li_talla_pdn, li_calidad_pdn, 'P',  itr_produrif) 
//					
//					// si hay error o no existe se muestra el mensaje y se devuelven los datos a
//					// su valor anterior
//					IF li_res = -1 OR li_res = 0 THEN
//						IF li_res = 0 THEN MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", iuo_comun.of_getstring(1))
//						
//						This.SetItem(row, 'co_fabrica',    li_fabrica_ant)
//						This.SetItem(row, 'co_linea',      li_linea_ant)
//						This.SetItem(row, 'co_referencia', ll_ref_ant)
//						This.SetItem(row, 'de_referencia', ls_de_refer_ant)
//						This.SetItem(row, 'co_talla',      li_talla_ant)
//						This.SetItem(row, 'de_talla',      ls_de_talla_ant)
//						This.SetItem(row, 'co_calidad',    li_calidad_ant)
//						This.SetItem(row, 'co_color',      ll_color_ant)
//						This.SetItem(row, 'de_color',      ls_de_color_ant)
//						This.SetItem(row, 'prc_composicion', ldc_prc_ant)
//						RETURN 1
//					ELSEIF li_res = 1 THEN
//						// Si existe se muestra la descripcion de la talla
//						ls_de_talla      = iuo_comun.of_getstring(1)
//						This.SetItem(row, 'de_talla', ls_de_talla)
//					END IF				
//				END IF
//				/*
//				* Valido que la referencia de venta-referencia de produccion, si esten en la relacion 
//				* referencia de venta-referencia de produccion y muestrario 
//				*/
//				IF Not IsNull(li_calidad_pdn) THEN
//					n_ds_base lds_ref_vtapdn
//					lds_ref_vtapdn = CREATE n_ds_base
//					lds_ref_vtapdn.DataObject = 'd_relacion_ref_vta_pdn'
//					lds_ref_vtapdn.of_conexion(itr_produrif, TRUE)
//					li_res = lds_ref_vtapdn.retrieve(li_fabrica_pdn, li_linea_pdn, ll_ref_pdn, li_talla_pdn, li_calidad_pdn, &
//																li_fabrica_vta, li_linea_vta, ll_ref_vta, li_talla_vta, li_calidad_vta, &
//																li_muestrario )
//					IF li_res = 0 THEN
//						MessageBox('Atenci$$HEX1$$f300$$ENDHEX$$n', 'La referencia de venta y referencia de producci$$HEX1$$f300$$ENDHEX$$n no est$$HEX1$$e100$$ENDHEX$$n relacionadas o no corresponden a este muestrario.')
//						This.SetItem(row, 'co_fabrica',    li_fabrica_ant)
//						This.SetItem(row, 'co_linea',      li_linea_ant)
//						This.SetItem(row, 'co_referencia', ll_ref_ant)
//						This.SetItem(row, 'de_referencia', ls_de_refer_ant)
//						This.SetItem(row, 'co_talla',      li_talla_ant)
//						This.SetItem(row, 'de_talla',      ls_de_talla_ant)
//						This.SetItem(row, 'co_calidad',    li_calidad_ant)
//						This.SetItem(row, 'co_color',      ll_color_ant)
//						This.SetItem(row, 'de_color',      ls_de_color_ant)
//						This.SetItem(row, 'prc_composicion', ldc_prc_ant)
//						RETURN 1
//					END IF				
//				END IF
//			END IF
//			
//			// Como ya se sabe, los demas datos estan digitados, entonces si ya se tiene
//			// tambien el color, se verifica que no se haya digitado doble
//			IF NOT IsNull(ll_color_pdn) THEN
//				li_res = of_verificar_doble_ref_pdn(row)
//				// si esta se devuelven los datos a su valor anterior
//				IF li_res = -1 THEN
//					This.SetItem(row, 'co_fabrica',    li_fabrica_ant)
//					This.SetItem(row, 'co_linea',      li_linea_ant)
//					This.SetItem(row, 'co_referencia', ll_ref_ant)
//					This.SetItem(row, 'de_referencia', ls_de_refer_ant)
//					This.SetItem(row, 'co_talla',      li_talla_ant)
//					This.SetItem(row, 'de_talla',      ls_de_talla_ant)
//					This.SetItem(row, 'co_calidad',    li_calidad_ant)
//					This.SetItem(row, 'co_color',      ll_color_ant)
//					This.SetItem(row, 'de_color',      ls_de_color_ant)
//					This.SetItem(row, 'prc_composicion', ldc_prc_ant)
//					RETURN 1
//				END IF
//			END IF			
//		END IF		
//END CHOOSE
//
//If Not n_cst_application.of_SelectServer(itr_produrif,&
//											 ldt_fecha,ls_usuario,ls_instancia) Then
//	Return -1
//End If		
//GarbageCollect()
//dw_det_ref_pdn.SetItem(row, 'fe_actualizacion', ldt_fecha)
//dw_det_ref_pdn.SetItem(row, 'usuario', ls_usuario)
//dw_det_ref_pdn.SetItem(row, 'instancia', ls_instancia)
end event

event itemerror;RETURN 1
end event

event ue_insertrow;RETURN 
end event

event ue_deleterow;RETURN 
end event

event ue_dwnprocessenter; 
RETURN 
end event

event dragleave;call super::dragleave;Long ll_row, ll_find, ll_pos, ll_separa
String ls_abrev, ls_mezcla
ll_row = This.GetRow()
 
This.DeleteRow(ll_row)

ll_find = dw_colores_vta.Find("abrv_grupo = '"+is_abrev+"'", 1, dw_colores_vta.RowCount())

IF ll_find > 0 THEN
	dw_colores_vta.SelectRow(ll_find, false)
END IF
ib_leave = TRUE
/*

ls_mezcla = Trim(dw_det_ref_pdn.GetItemString(1, 'mezcla'))
ll_pos    = Pos(ls_mezcla, is_abrev) 

IF ll_pos > 0 THEN
	ll_separa = Pos(ls_mezcla, '/', ll_pos + 1) 		
	IF ll_separa > 1 THEN
		ls_mezcla = Mid(ls_mezcla, 1, ll_pos - 1) + Mid(ls_mezcla, ll_separa + 1)
	ELSE
		ls_mezcla = Mid(ls_mezcla, 1, ll_pos - 1)
	END IF
	dw_det_ref_pdn.SetItem(1, 'mezcla',  ls_mezcla)
END IF

*/
end event

event dragenter;call super::dragenter;Long ll_row, ll_find, ll_newrow
String ls_abrev
ll_row = This.GetRow()


IF ib_dawn_m THEN
	IF ib_leave THEN
		ls_abrev = dw_det_ref_pdn.GetItemString(1, 'mezcla')
		
		IF IsNull(ls_abrev)  OR  Trim(ls_abrev) = '' THEN
			ls_abrev = is_abrev
		ELSE
			ls_abrev += "/"+is_abrev
		END IF
		
		dw_det_ref_pdn.SetItem(1,  'mezcla', ls_abrev)
		ll_newrow = dw_compo.InsertRow(0)
		 
		dw_compo.SetItem(ll_newrow, 'mezcla', is_abrev)
			
		ll_find = dw_colores_vta.Find("abrv_grupo = '"+is_abrev+"'", 1, dw_colores_vta.RowCount())
		
		IF ll_find > 0 THEN
			dw_colores_vta.SelectRow(ll_find, false)
		END IF
		ib_leave = FALSE
	END IF
	
END IF
end event

type dw_det_ref_pdn from u_dw_application within w_h_composicion
integer x = 1266
integer y = 368
integer width = 2263
integer height = 104
integer taborder = 30
string dataobject = "d_mezcla"
boolean vscrollbar = false
boolean livescroll = false
end type

event ue_insertrow;RETURN 
end event

event itemchanged;call super::itemchanged;Integer 	li_talla_pdn, &
			li_fabrica_pdn, &
			li_linea_pdn, &
			li_calidad_pdn, &
			li_res, &
			li_sw_surtido, &
			li_fabrica_vta, &
			li_linea_vta, &
			li_talla_vta, &
			li_calidad_vta, &
			li_fabrica_ant, &
			li_linea_ant, &
			li_talla_ant, &
			li_calidad_ant, &
			li_muestrario 
			
Long 		ll_ref_pdn, ll_ref_ant, ll_ref_vta, ll_color_pdn, ll_color_ant
Decimal 	ldc_null, ldc_prc_ant
String	ls_de_referencia, &
			ls_de_talla, &
			ls_de_color, & 
			ls_de_refer_ant, &
			ls_de_talla_ant, &
			ls_de_color_ant 

DateTime 			ldt_fecha
String 				ls_usuario,ls_instancia 
DatawindowChild	ldwc_talla, ldwc_colores

/*
* Se obtienen los datos anteriores al cambio... por si hay error y se deba devolver 
*/
li_fabrica_ant  = This.GetItemNumber(row, 'co_fabrica')
li_linea_ant    = This.GetItemNumber(row, 'co_linea')
ll_ref_ant      = This.GetItemNumber(row, 'co_referencia')
li_talla_ant    = This.GetItemNumber(row, 'co_talla')
li_calidad_ant  = This.GetItemNumber(row, 'co_calidad')
ll_color_ant    = This.GetItemNumber(row, 'co_color')
ls_de_refer_ant = This.GetItemString(row, 'de_referencia')
ls_de_talla_ant = This.GetItemString(row, 'de_talla')
ls_de_color_ant = This.GetItemString(row, 'de_color')
ldc_prc_ant     = This.GetItemDecimal(row, 'prc_composicion')
AcceptText()
GarbageCollect()

/*
* aqui se obtiene el dato actual
*/
li_fabrica_pdn = This.GetItemNumber(row, 'co_fabrica')
li_linea_pdn   = This.GetItemNumber(row, 'co_linea')
ll_ref_pdn     = This.GetItemNumber(row, 'co_referencia')
li_talla_pdn   = This.GetItemNumber(row, 'co_talla')
li_calidad_pdn = This.GetItemNumber(row, 'co_calidad')
ll_color_pdn   = This.GetItemNumber(row, 'co_color')
li_muestrario  = This.GetItemNumber(row, 'co_muestrario')
li_fabrica_vta = This.GetItemNumber(row, 'co_fabricas')
li_linea_vta   = This.GetItemNumber(row, 'co_lineas')
ll_ref_vta     = This.GetItemNumber(row, 'co_referencias')
li_talla_vta   = This.GetItemNumber(row, 'co_tallas')
li_calidad_vta = This.GetItemNumber(row, 'co_calidads')
 

CHOOSE CASE dwo.Name
	/*
	* Si se esta modificando alguna de estas columnas se procede a hacer las respectivas
	* validaciones
	*/
	CASE 'co_talla', 'co_calidad', 'co_linea', 'co_referencia', 'co_fabrica', 'co_color'
		IF IsNull(ll_ref_pdn) THEN 
			SetNull(ls_de_referencia)
			This.SetItem(row, 'de_referencia', ls_de_referencia)			
		END IF
		
		IF IsNull(li_talla_pdn) THEN 
			SetNull(ls_de_talla)
			This.SetItem(row, 'de_talla', ls_de_talla)			
		END IF
		
		IF IsNull(ll_color_pdn) THEN 
			SetNull(ls_de_color)
			This.SetItem(row, 'de_color', ls_de_color)			
		END IF
		
		/*
		* para validar la referencia de produccion y traer su descripcion es necesario que
		* se hayan digitado la fabrica-linea-referencia de pdn
		*/
		IF Not IsNull(li_fabrica_pdn) AND Not IsNull(li_linea_pdn) AND Not IsNull(ll_ref_pdn) THEN			
			
			li_res = iuo_comun.of_verificar_ref_pdn(li_fabrica_pdn, li_linea_pdn, ll_ref_pdn, itr_produrif)
			// si hubo error de bd (en el metodo se saca el mensaje de error) 
			IF li_res = -1 THEN 
				Return 1
			ELSEIF li_res = 0 THEN
				// si la ref no existe (en el metodo se ARMA el mensaje, pero aqui se muestra) 
				MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", iuo_comun.of_getstring(1))
				This.SetItem(row, 'co_referencia', ll_ref_ant)
				This.SetItem(row, 'de_referencia', ls_de_refer_ant)
				RETURN 1
			ELSEIF li_res = 1 THEN 
				// si la ref existe se muestra el codigo y la descripcion.
				ls_de_referencia   = iuo_comun.of_getstring(1)
 				This.SetItem(row, 'de_referencia', ls_de_referencia)
			END IF
			// Si se tiene ya el dato para talla y calidad...
			IF Not IsNull(li_talla_pdn) THEN
			// AND Not IsNull(li_calidad_pdn) THEN
				/*
				* ...y ademas se ha modificado el color (con valor que no sea nulo) se verifica
				* que exista para traer su descripcion 
				*/
				IF  dwo.Name = 'co_color' AND NOT IsNull(ll_color_pdn)  THEN
					li_res = iuo_comun.of_verificar_color_pdn(li_fabrica_pdn, li_linea_pdn, ll_ref_pdn, li_talla_pdn, li_calidad_pdn,  ll_color_pdn, itr_produrif)
					// si hay error o no existe se muestra el mensaje y se devuelven los datos a
					// su valor anterior
					IF li_res = -1 OR li_res = 0 THEN
						IF li_res = 0 THEN MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", iuo_comun.of_getstring(1))
						This.SetItem(row, 'co_fabrica',    li_fabrica_ant)
						This.SetItem(row, 'co_linea',      li_linea_ant)
						This.SetItem(row, 'co_referencia', ll_ref_ant)
						This.SetItem(row, 'de_referencia', ls_de_refer_ant)
						This.SetItem(row, 'co_talla',      li_talla_ant)
						This.SetItem(row, 'de_talla',      ls_de_talla_ant)
						This.SetItem(row, 'co_calidad',    li_calidad_ant)
						This.SetItem(row, 'co_color',      ll_color_ant)
						This.SetItem(row, 'de_color',      ls_de_color_ant)
						This.SetItem(row, 'prc_composicion', ldc_prc_ant)
						Return 1
					ELSEIF li_res = 1 THEN 
						// si existe se configuran los datos descripcion e indicador de surtido...
						ls_de_color   = iuo_comun.of_getstring(1)
						li_sw_surtido = iuo_comun.of_getLong(1)
						li_sw_surtido = dw_colores_vta.GetItemNumber(dw_colores_vta.GetRow(), 'sw_surtido')
						This.SetItem(row, 'de_color',   ls_de_color)
						This.SetItem(row, 'sw_surtido', li_sw_surtido)
					END IF
				ELSE
					// Si no se digito color, sino una de las otras columnas se valida la talla
					// enviando la 'P' como parametro, valida la de produccion.
					li_res = iuo_comun.of_verificar_talla( li_fabrica_pdn, li_linea_pdn, ll_ref_pdn, li_talla_pdn, li_calidad_pdn, 'P',  itr_produrif) 
					
					// si hay error o no existe se muestra el mensaje y se devuelven los datos a
					// su valor anterior
					IF li_res = -1 OR li_res = 0 THEN
						IF li_res = 0 THEN MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", iuo_comun.of_getstring(1))
						
						This.SetItem(row, 'co_fabrica',    li_fabrica_ant)
						This.SetItem(row, 'co_linea',      li_linea_ant)
						This.SetItem(row, 'co_referencia', ll_ref_ant)
						This.SetItem(row, 'de_referencia', ls_de_refer_ant)
						This.SetItem(row, 'co_talla',      li_talla_ant)
						This.SetItem(row, 'de_talla',      ls_de_talla_ant)
						This.SetItem(row, 'co_calidad',    li_calidad_ant)
						This.SetItem(row, 'co_color',      ll_color_ant)
						This.SetItem(row, 'de_color',      ls_de_color_ant)
						This.SetItem(row, 'prc_composicion', ldc_prc_ant)
						RETURN 1
					ELSEIF li_res = 1 THEN
						// Si existe se muestra la descripcion de la talla
						ls_de_talla      = iuo_comun.of_getstring(1)
						This.SetItem(row, 'de_talla', ls_de_talla)
					END IF				
				END IF
				/*
				* Valido que la referencia de venta-referencia de produccion, si esten en la relacion 
				* referencia de venta-referencia de produccion y muestrario 
				*/
				IF Not IsNull(li_calidad_pdn) THEN
					n_ds_base lds_ref_vtapdn
					lds_ref_vtapdn = CREATE n_ds_base
					lds_ref_vtapdn.DataObject = 'd_relacion_ref_vta_pdn'
					lds_ref_vtapdn.of_conexion(itr_produrif, TRUE)
					li_res = lds_ref_vtapdn.retrieve(li_fabrica_pdn, li_linea_pdn, ll_ref_pdn, li_talla_pdn, li_calidad_pdn, &
																li_fabrica_vta, li_linea_vta, ll_ref_vta, li_talla_vta, li_calidad_vta, &
																li_muestrario )
					IF li_res = 0 THEN
						MessageBox('Atenci$$HEX1$$f300$$ENDHEX$$n', 'La referencia de venta y referencia de producci$$HEX1$$f300$$ENDHEX$$n no est$$HEX1$$e100$$ENDHEX$$n relacionadas o no corresponden a este muestrario.')
						This.SetItem(row, 'co_fabrica',    li_fabrica_ant)
						This.SetItem(row, 'co_linea',      li_linea_ant)
						This.SetItem(row, 'co_referencia', ll_ref_ant)
						This.SetItem(row, 'de_referencia', ls_de_refer_ant)
						This.SetItem(row, 'co_talla',      li_talla_ant)
						This.SetItem(row, 'de_talla',      ls_de_talla_ant)
						This.SetItem(row, 'co_calidad',    li_calidad_ant)
						This.SetItem(row, 'co_color',      ll_color_ant)
						This.SetItem(row, 'de_color',      ls_de_color_ant)
						This.SetItem(row, 'prc_composicion', ldc_prc_ant)
						RETURN 1
					END IF				
				END IF
			END IF
			
			// Como ya se sabe, los demas datos estan digitados, entonces si ya se tiene
			// tambien el color, se verifica que no se haya digitado doble
			IF NOT IsNull(ll_color_pdn) THEN
				li_res = of_verificar_doble_ref_pdn(row)
				// si esta se devuelven los datos a su valor anterior
				IF li_res = -1 THEN
					This.SetItem(row, 'co_fabrica',    li_fabrica_ant)
					This.SetItem(row, 'co_linea',      li_linea_ant)
					This.SetItem(row, 'co_referencia', ll_ref_ant)
					This.SetItem(row, 'de_referencia', ls_de_refer_ant)
					This.SetItem(row, 'co_talla',      li_talla_ant)
					This.SetItem(row, 'de_talla',      ls_de_talla_ant)
					This.SetItem(row, 'co_calidad',    li_calidad_ant)
					This.SetItem(row, 'co_color',      ll_color_ant)
					This.SetItem(row, 'de_color',      ls_de_color_ant)
					This.SetItem(row, 'prc_composicion', ldc_prc_ant)
					RETURN 1
				END IF
			END IF			
		END IF		
END CHOOSE

If Not n_cst_application.of_SelectServer(itr_produrif,&
											 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If		
GarbageCollect()
dw_det_ref_pdn.SetItem(row, 'fe_actualizacion', ldt_fecha)
dw_det_ref_pdn.SetItem(row, 'usuario', ls_usuario)
dw_det_ref_pdn.SetItem(row, 'instancia', ls_instancia)
end event

event itemerror;RETURN 1
end event

event ue_deleterow;RETURN 
end event

event doubleclicked;call super::doubleclicked;If Row=0 Then Return

n_cst_param lo_param
Integer  li_talla_pdn, &
			li_fabrica_pdn, &
			li_linea_pdn, &
			li_calidad_pdn, &
			li_res, li_fabrica_vta, li_linea_vta, ll_ref_vta, li_talla_vta, li_calidad_vta, li_muestrario
Long 		ll_ref_pdn, ll_color_pdn
String	ls_de_talla, &
			ls_de_color

li_fabrica_pdn = This.GetItemNumber(row, 'co_fabrica')
li_linea_pdn   = This.GetItemNumber(row, 'co_linea')
ll_ref_pdn     = This.GetItemNumber(row, 'co_referencia')
li_calidad_pdn = This.GetItemNumber(row, 'co_calidad')
li_talla_pdn   = This.GetItemNumber(row, 'co_talla')

If dwo.name = "co_talla" Then
	lo_param.il_vector[1] = li_fabrica_pdn
	lo_param.il_vector[2] = li_linea_pdn
	lo_param.il_vector[3] = ll_ref_pdn 
	
	OpenWithParm(w_bus_talla_pdn, lo_param )
	
	lo_param = Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetItem(row, 'co_talla', lo_param.il_vector[1])
		SetItem(row, 'de_talla', lo_param.is_vector[1])
	End If
	
ELSEIf dwo.name="co_color" Then
	lo_param.il_vector[1] = li_fabrica_pdn
	lo_param.il_vector[2] = li_linea_pdn
	lo_param.il_vector[3] = ll_ref_pdn
	lo_param.il_vector[4] = li_talla_pdn
	lo_param.il_vector[5] = li_calidad_pdn
	
   OpenWithParm(w_bus_color_pdn, lo_param)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		
		SetItem(row, 'co_color', lo_param.il_vector[1])
		SetItem(row, 'de_color', lo_param.is_vector[1])
		this.event itemchanged(row , This.Object.co_color, String(lo_param.il_vector[1]))
					
	End If
End If
end event

event ue_dwnprocessenter; 
RETURN 
end event

event getfocus;call super::getfocus;gb_1.Textcolor = RGB(0,0,0)
gb_2.Textcolor = RGB(0,0,0)
gb_3.Textcolor = RGB(0,0,255)
end event

event constructor;call super::constructor;insertRow(0)
end event

event dragdrop;call super::dragdrop;/////////////////////////////////////////////////////////////////////
// If an employee from the dw_emp datawindow is dropped, retrieve
// the employee.
/////////////////////////////////////////////////////////////////////

DragObject	ldo_control
Long			li_row, &
				li_emp_id
String  ls_abrev
// Get the dragged object.
ldo_control = DraggedObject()

// Determine if the dragged object is the employee datawindow
if ldo_control = dw_colores_vta then
	// Retrieve the employee detail information according to the selected 
	// row on the employee datawindow
	li_row = dw_colores_vta.GetRow()
	if li_row > 0 then
		ls_abrev  = dw_det_ref_pdn.GetItemString(1, 'mezcla')
		IF IsNull(ls_abrev)  OR  Trim(ls_abrev) = '' THEN
			ls_abrev = Trim(dw_colores_vta.object.abrv_grupo[li_row])
		ELSE
			ls_abrev += "/"+Trim(dw_colores_vta.object.abrv_grupo[li_row])
		END IF
		dw_det_ref_pdn.SetItem(1,  'mezcla', ls_abrev)
	END IF
END IF


	

end event

type dw_colores_vta from u_dw_application within w_h_composicion
event ue_mousemove pbm_mousemove
event ue_lbuttonup pbm_lbuttonup
event ue_lbuttondown pbm_lbuttondown
integer x = 46
integer y = 356
integer width = 1152
integer height = 1496
integer taborder = 20
string dataobject = "d_grupos"
boolean hscrollbar = true
boolean livescroll = false
end type

event ue_mousemove;String ls_object

ls_object = GetObjectAtPointer()
If Len(ls_object) > 0 Then 
	If ib_down Then
		This.Drag(Begin!)
	End If
End If	
end event

event ue_lbuttonup;
ib_down = False
end event

event ue_lbuttondown;
ib_down = True
end event

event ue_insertrow;//Long 		ll_fila, ll_referencia
//Integer 	li_fabrica, li_linea, li_calidad, li_muestrario
//
///*
//* Primero se verifica si el encabezado se ingreso correctamente
//* Si es asi, entonces no se puede insertar
//*/
//IF dw_encabezado.RowCount() = 0 THEN
//	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Antes debe insertar el encabezado para la referencia de venta." )
//	 
//	dw_encabezado.SetFocus()
//	dw_encabezado.SetColumn('co_fabricas')
//	RETURN
//ELSE
//	
//	li_fabrica    = dw_encabezado.GetItemNumber(1, 'co_fabricas')
//	li_linea      = dw_encabezado.GetItemNumber(1, 'co_lineas')
//	li_calidad    = dw_encabezado.GetItemNumber(1, 'co_calidads')
//	li_muestrario = dw_encabezado.GetItemNumber(1, 'co_muestrario')
//	ll_referencia = dw_encabezado.GetItemNumber(1, 'co_referencias')
//
//	IF IsNull(li_fabrica) OR IsNull(li_linea) OR IsNull(ll_referencia) OR &
//	   IsNull(li_calidad) OR IsNull(li_muestrario) THEN
//		MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Antes debe ingresar todos los datos del encabezado de la referencia de venta." )
//		dw_encabezado.SetFocus()
//		dw_encabezado.SetColumn('co_fabricas')
//		RETURN
//	END IF
//END IF
//
//
//ll_fila = This.InsertRow(0)
//This.ScrollToRow(ll_fila)
//This.SetItem(ll_fila, 'co_fabricas',    li_fabrica )
//This.SetItem(ll_fila, 'co_lineas',      li_linea)
//This.SetItem(ll_fila, 'co_referencias', ll_referencia)
//This.SetItem(ll_fila, 'co_calidads',    li_calidad)
//This.SetItem(ll_fila, 'co_muestrario',  li_muestrario)
// 
//of_recuperar_refs_pdn( )
//
//This.SetFocus()
//This.SetColumn('co_tallas')
///*
//If IsNull(li_fabrica) THEN
//	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Debe digitar la F$$HEX1$$e100$$ENDHEX$$brica de Venta")
//	dw_encabezado.SetFocus()
//	dw_encabezado.SetColumn('co_fabricas')
//	Return
//END IF
//If IsNull(li_linea) THEN
//	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Debe digitar la L$$HEX1$$ed00$$ENDHEX$$nea de Venta")
//	dw_encabezado.SetFocus()
//	dw_encabezado.SetColumn('co_lineas')
//	Return
//END IF
//
//If IsNull(ll_referencia) THEN
//	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Debe digitar la Referencia de Venta")
//	dw_encabezado.SetFocus()
//	dw_encabezado.SetColumn('co_referencias')
//	Return
//END IF
//If IsNull(li_calidad) THEN
//	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Debe digitar la Calidad de Venta")
//	dw_encabezado.SetFocus()
//	dw_encabezado.SetColumn('co_calidads')
//	Return
//END IF
//If IsNull(li_muestrario) THEN
//	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Debe digitar el Muestrario")
//	dw_encabezado.SetFocus()
//	dw_encabezado.SetColumn('co_muestrario')
//	Return
//END IF
//*/
//
end event

event clicked;call super::clicked;IF Row <= 0 THEN RETURN

//This.SelectRow(0, False)
//This.SelectRow(row , True)
//This.SetRow(row  )
//

//String ls_null
//
If row > 0 Then
//	This.SelectRow(row,True)
	il_fila_clicked = row
End If	

/*
of_recuperar_refs_pdn( )*/
end event

event rowfocuschanged;call super::rowfocuschanged;//IF currentrow <= 0 THEN RETURN 1
////This.SelectRow(0, False)
//This.SelectRow(currentrow, True)

//of_recuperar_refs_pdn( )
end event

event itemchanged;call super::itemchanged;Integer 	li_talla_ant , &
			li_talla_vta, &
			li_fabrica_vta, &
			li_linea_vta, &
			li_calidad_vta, &
			li_res, &
			li_sw_surtido
Long 		ll_ref_vta, ll_color_ant, ll_color_vta
String	ls_de_talla, &
			ls_de_color, &
			ls_de_talla_ant, &
			ls_de_color_ant

li_talla_ant    = This.GetItemNumber(row, 'co_tallas')
ll_color_ant    = This.GetItemNumber(row, 'co_colors')
ls_de_talla_ant = This.GetItemString(row, 'de_talla')
ls_de_color_ant = This.GetItemString(row, 'de_color')

AcceptText()
GarbageCollect()

li_res = of_validar_tiene_detalle( li_talla_ant, ll_color_ant )

IF dw_det_ref_pdn.RowCount() > 0 THEN
	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Para la talla "+String(li_talla_ant)+" y color "+String(ll_color_ant)+" existe una relaci$$HEX1$$f300$$ENDHEX$$n de referencias de producci$$HEX1$$f300$$ENDHEX$$n, por lo tanto no se puede modificar." )
	This.SetItem(row, 'co_tallas', li_talla_ant)
	This.SetItem(row, 'co_colors', ll_color_ant)
	This.SetItem(row, 'de_talla',  ls_de_talla_ant)
	This.SetItem(row, 'de_color',  ls_de_color_ant)
	RETURN 1
END IF

/*
* Primero se verifica si la talla-color tienen detalle de ref de pdn
* Si es asi, entonces no se puede modificar
*/
li_fabrica_vta = This.GetItemNumber(row, 'co_fabricas')
li_linea_vta   = This.GetItemNumber(row, 'co_lineas')
ll_ref_vta     = This.GetItemNumber(row, 'co_referencias')
li_calidad_vta = This.GetItemNumber(row, 'co_calidads')
li_talla_vta   = This.GetItemNumber(row, 'co_tallas')
ll_color_vta   = This.GetItemNumber(row, 'co_colors')


li_res = of_recuperar_refs_pdn( )

IF dw_det_ref_pdn.RowCount() > 0 THEN
	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Para la talla "+String(li_talla_vta)+" y color "+String(ll_color_vta)+" ya existe una relaci$$HEX1$$f300$$ENDHEX$$n de referencias de producci$$HEX1$$f300$$ENDHEX$$n." )
	This.SetItem(row, 'co_tallas', li_talla_ant)
	This.SetItem(row, 'co_colors', ll_color_ant)
	This.SetItem(row, 'de_talla',  ls_de_talla_ant)
	This.SetItem(row, 'de_color',  ls_de_color_ant)
	RETURN 1
END IF


CHOOSE CASE dwo.Name
	CASE 'co_tallas'
		// Si tiene dato, se valida que exista 
		IF Not IsNull(li_talla_vta) THEN
			li_res = iuo_comun.of_verificar_talla( li_fabrica_vta, li_linea_vta, ll_ref_vta, li_talla_vta, li_calidad_vta, 'V',  itr_produrif) 
         // Si ocurrio error o no existe se muestra el mensaje y se devuelve el dato a su valor al anterior
			IF li_res = -1 OR li_res = 0 THEN
				IF li_res = 0 THEN MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", iuo_comun.of_getstring(1))
				This.SetItem(row, 'co_tallas', li_talla_ant)
				This.SetItem(row, 'co_tallas', ls_de_talla_ant)
				RETURN 1
			ELSEIF li_res = 1 THEN
				// si esta bien, se configura la descripcion de la talla
				ls_de_talla      = iuo_comun.of_getstring(1)
				This.SetItem(row, 'de_talla', ls_de_talla)
			END IF
		END IF
	CASE 'co_colors'
		IF NOT IsNull(ll_color_vta) THEN
			li_res = iuo_comun.of_verificar_color_vta(li_fabrica_vta, li_linea_vta, ll_ref_vta, li_talla_vta, li_calidad_vta,  ll_color_vta, itr_produrif)
			
         // Si ocurrio error o no existe se muestra el mensaje y se devuelve el dato a su valor al anterior
			IF li_res = -1  OR li_res = 0 THEN
				IF li_res = 0 THEN MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", iuo_comun.of_getstring(1))
				This.SetItem(row, 'co_colors', ll_color_ant)
				This.SetItem(row, 'de_color', ls_de_color_ant)
				RETURN 1
			ELSEIF li_res = 1 THEN
				// si esta bien, se configura la descripcion del color y el indicador de surtido...
				ls_de_color   = iuo_comun.of_getstring(2)
				li_sw_surtido = iuo_comun.of_getLong (1)
				This.SetItem(row, 'de_color',   ls_de_color)
				This.SetItem(row, 'sw_surtido', li_sw_surtido)				
			END IF			
		END IF
		
END CHOOSE

li_res = of_verificar_doble_talla_vta(row)
// Si ocurrio error o no existe se muestra el mensaje y se devuelve el dato a su valor al anterior
IF li_res = -1  THEN
	SetNull(li_talla_vta)
	SetNull(ls_de_talla)
	SetNull(ll_color_vta)
	SetNull(ls_de_color)
	This.SetItem(row, 'co_tallas', li_talla_vta)
	This.SetItem(row, 'de_talla',  ls_de_talla)
	This.SetItem(row, 'co_colors', ll_color_vta)
	This.SetItem(row, 'de_color',  ls_de_color)
	RETURN 1
END IF			


end event

event itemerror;call super::itemerror;// RE
RETURN 1
end event

event ue_deleterow;AcceptText()
/*
* Primero se verifica si la talla-color tienen detalle de ref de pdn
* Si es asi, entonces no se puede borrar
*/
IF dw_det_ref_pdn.RowCount() > 0 THEN
	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se puede borrar la talla-color pues aun tiene refrencias de producci$$HEX1$$f300$$ENDHEX$$n asociadas")
	RETURN
END IF
	 
If MessageBox("Eliminar Fila","Esta seguro(a) de eliminar la fila ?.",Question!,YesNo!,2) = 1 Then
	This.DeleteRow(0)
End If
This.SetFocus()
end event

event doubleclicked;call super::doubleclicked;If Row=0 Then Return

n_cst_param lo_param
Integer  li_talla_vta, &
			li_fabrica_vta, &
			li_linea_vta, &
			li_calidad_vta
			 
Long 		ll_ref_vta, ll_color_vta
String	ls_de_talla, &
			ls_de_color

li_fabrica_vta = This.GetItemNumber(row, 'co_fabricas')
li_linea_vta   = This.GetItemNumber(row, 'co_lineas')
ll_ref_vta     = This.GetItemNumber(row, 'co_referencias')
li_calidad_vta = This.GetItemNumber(row, 'co_calidads')
li_talla_vta   = This.GetItemNumber(row, 'co_tallas')

If dwo.name="co_tallas" Then
	lo_param.il_vector[1] = li_fabrica_vta
	lo_param.il_vector[2] = li_linea_vta
	lo_param.il_vector[3] = ll_ref_vta
	lo_param.il_vector[4] = li_calidad_vta
	
	OpenWithParm(w_bus_talla_vta, lo_param )
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetItem(row, 'co_tallas', lo_param.il_vector[1])
		SetItem(row, 'de_talla', lo_param.is_vector[1])
	End If
ELSEIf dwo.name="co_colors" Then
	lo_param.il_vector[1] = li_fabrica_vta
	lo_param.il_vector[2] = li_linea_vta
	lo_param.il_vector[3] = ll_ref_vta
	lo_param.il_vector[4] = li_talla_vta
	lo_param.il_vector[5] = li_calidad_vta
	
 	OpenWithParm(w_bus_color_vta, lo_param )
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetItem(row, 'co_colors', lo_param.il_vector[1])
		SetItem(row, 'de_color', lo_param.is_vector[1])
	End If
End If
end event

event getfocus;call super::getfocus;gb_1.Textcolor = RGB(0,0,0)
gb_2.Textcolor = RGB(0,0,255)
gb_3.Textcolor = RGB(0,0,0)

end event

event dragdrop;call super::dragdrop; DataWindow	ldo_control
//
//If source.TypeOf() = DataWindow! Then
//	ldw_control = source
//	If Row > 0 Then
//		ldw_control.RowsMove(il_fila_clicked,il_fila_clicked,Primary!,This,row,Primary!)
//	Else
//		ldw_control.RowsMove(il_fila_clicked,il_fila_clicked,Primary!,This,This.RowCount()+1,Primary!)
//	End If
//End If
//


// Get the dragged object.
ldo_control = DraggedObject()
ib_leave = FALSE
end event

event dragleave;call super::dragleave;
This.SelectRow(This.GetRow(),True)


end event

type dw_encabezado from u_dw_application within w_h_composicion
integer x = 59
integer y = 60
integer width = 3675
integer height = 168
string dataobject = "d_encabezado_surtido"
boolean vscrollbar = false
boolean livescroll = false
end type

event ue_insertrow;// Over

This.Reset()
This.InsertRow(0)
dw_colores_vta.Reset()
dw_det_ref_pdn.Reset()
This.SetColumn(1)
This.SetFocus()


end event

event ue_deleterow;// Over
end event

event itemchanged;Integer 	li_muestrario, &
			li_fabrica_vta, &
			li_linea_vta, &
			li_calidad_vta, &
			li_fabrica_ant, &
			li_linea_ant, &
			li_calidad_ant, &
			li_muestrario_ant, &
			li_res, ls_res_mue
Long 		ll_ref_vta, ll_filas, ll_ref_ant
String	ls_de_referencia, ls_de_refer_ant 

// Obtengo los valores antes de la modificacion
li_fabrica_ant    = This.GetItemNumber(row, 'co_fabricas')
li_linea_ant      = This.GetItemNumber(row, 'co_lineas')
ll_ref_ant        = This.GetItemNumber(row, 'co_referencias')
li_calidad_ant    = This.GetItemNumber(row, 'co_calidads')
li_muestrario_ant = This.GetItemNumber(row, 'co_muestrario')
ls_de_refer_ant   = This.GetItemString(row, 'de_referencia')

AcceptText()
GarbageCollect()
dw_det_ref_pdn.Reset()
dw_colores_vta.Reset()

li_fabrica_vta = This.GetItemNumber(row, 'co_fabricas')
li_linea_vta   = This.GetItemNumber(row, 'co_lineas')
ll_ref_vta     = This.GetItemNumber(row, 'co_referencias')
li_calidad_vta = This.GetItemNumber(row, 'co_calidads')
li_muestrario  = This.GetItemNumber(row, 'co_muestrario')

CHOOSE CASE dwo.Name
	CASE 'co_fabricas', 'co_lineas', 'co_referencias', 'co_calidads'
		
		IF Not isNull(li_fabrica_vta) AND Not isNull(li_linea_vta) AND &
   		Not isNull(li_calidad_vta) AND Not isNull(ll_ref_vta) THEN
			
			li_res = iuo_comun.of_verificar_ref_vta( li_fabrica_vta, li_linea_vta, ll_ref_vta, li_calidad_vta, itr_produrif) 
			
			IF li_res = -1 OR li_res = 0 THEN
				IF li_res = 0 THEN MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", iuo_comun.of_getstring(1))

				This.SetItem(row, 'co_fabricas',    li_fabrica_ant)
				This.SetItem(row, 'co_lineas',      li_linea_ant)
				This.SetItem(row, 'co_referencias', ll_ref_ant)
				This.SetItem(row, 'co_calidads',    li_calidad_ant)
				This.SetItem(row, 'co_muestrario',  li_muestrario_ant)
				This.SetItem(row, 'de_referencia',  ls_de_refer_ant)
				RETURN 1
			ELSEIF li_res = 1 THEN
				ls_de_referencia = iuo_comun.of_getstring(1)
				This.SetItem(row, 'de_referencia', ls_de_referencia)
			END IF			
		END IF
		
	CASE 'co_muestrario'		
		ls_res_mue = iuo_comun.of_verificar_muestrario(li_fabrica_vta, li_linea_vta, li_muestrario, itr_produrif)
		
		IF ls_res_mue = -1 THEN
			This.SetItem(row, 'co_fabricas',    li_fabrica_ant)
			This.SetItem(row, 'co_lineas',      li_linea_ant)
			This.SetItem(row, 'co_referencias', ll_ref_ant)
			This.SetItem(row, 'co_calidads',    li_calidad_ant)
			This.SetItem(row, 'co_muestrario',  li_muestrario_ant)
			This.SetItem(row, 'de_referencia',  ls_de_refer_ant)
			Return 1
		ELSEIF ls_res_mue = 0 THEN
			ls_res_mue = -99
		END IF
END CHOOSE

/*
* Si tengo todos los datos recupero los detalles
*/
IF Not isNull(li_fabrica_vta) AND Not isNull(li_linea_vta) AND &
	Not isNull(li_calidad_vta) AND Not isNull(ll_ref_vta) AND &
	Not isNull(li_muestrario) THEN
	dw_colores_vta.SetRedraw(False)
	dw_det_ref_pdn.SetRedraw(False)
	
	GarbageCollect()
	
	ll_filas = dw_colores_vta.Retrieve(li_fabrica_vta, li_linea_vta, ll_ref_vta, li_muestrario,  li_calidad_vta)

	IF ll_filas = -1 THEN
		dw_det_ref_pdn.SetRedraw(True)
		dw_colores_vta.SetRedraw(True)
		RETURN -1
	ELSE
		ll_filas = dw_colores_vta.RowCount()
		IF ll_filas = 0 THEN		
			// Si no recupero filas, entonces se puede mostrar el mensaje de validacion 
			// del muestrario
			IF ls_res_mue = -99 THEN
				MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", iuo_comun.of_getstring(1))
				This.SetItem(row, 'co_muestrario',  li_muestrario_ant)
				dw_det_ref_pdn.SetRedraw(True)
				dw_colores_vta.SetRedraw(True)				
				RETURN 1
			END IF
			dw_colores_vta.SetFocus()
		ELSEIF ll_filas > 0 THEN
			// Si hay colores de vta recupero los detalles de pdn
			dw_colores_vta.SelectRow(0, False)
			dw_colores_vta.SelectRow(1, True)
			ll_filas = dw_det_ref_pdn.Retrieve( li_fabrica_vta, li_linea_vta, ll_ref_vta,  li_calidad_vta, li_muestrario )
			IF ll_filas = -1 THEN
				dw_det_ref_pdn.SetRedraw(True)
				dw_colores_vta.SetRedraw(True)
				RETURN -1
			ELSEIF ll_filas > 1 THEN
				of_recuperar_refs_pdn( )
				This.SetFocus()
			END IF
		END IF
	END IF
	dw_det_ref_pdn.SetRedraw(True)
	dw_colores_vta.SetRedraw(True)
END IF
				

GarbageCollect()
end event

event itemerror;RETURN 1
end event

event getfocus;call super::getfocus;gb_1.Textcolor = RGB(0,0,255)
gb_2.Textcolor = RGB(0,0,0)
gb_3.Textcolor = RGB(0,0,0)
end event

type gb_1 from u_gb_base within w_h_composicion
integer x = 18
integer width = 3753
integer height = 264
integer taborder = 0
string text = "Referencia de Venta"
end type

type gb_2 from u_gb_base within w_h_composicion
integer x = 18
integer y = 300
integer width = 1198
integer height = 1576
integer taborder = 0
string text = "Tallas y Colores de Venta"
end type

type gb_3 from u_gb_base within w_h_composicion
integer x = 1234
integer y = 300
integer width = 2405
integer height = 1576
integer taborder = 0
string text = "Referencias de Producci$$HEX1$$f300$$ENDHEX$$n"
end type

