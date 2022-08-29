HA$PBExportHeader$w_pasar_diseno_red.srw
forward
global type w_pasar_diseno_red from w_base_busqueda
end type
type lb_tmp from listbox within w_pasar_diseno_red
end type
type dw_tmp from u_dw_application within w_pasar_diseno_red
end type
type lb_archivo from listbox within w_pasar_diseno_red
end type
type st_2 from statictext within w_pasar_diseno_red
end type
type st_3 from statictext within w_pasar_diseno_red
end type
type cb_1 from commandbutton within w_pasar_diseno_red
end type
end forward

global type w_pasar_diseno_red from w_base_busqueda
integer width = 1083
integer height = 472
string title = "Pasar dise$$HEX1$$f100$$ENDHEX$$o a la red"
boolean controlmenu = false
boolean center = true
lb_tmp lb_tmp
dw_tmp dw_tmp
lb_archivo lb_archivo
st_2 st_2
st_3 st_3
cb_1 cb_1
end type
global w_pasar_diseno_red w_pasar_diseno_red

forward prototypes
public function integer of_retorno ()
public subroutine of_explorar_subdirectorio (string as_ruta, ref string as_directorio[])
public subroutine of_armar_ruta_red (string as_ruta, ref string as_ruta_red)
end prototypes

public function integer of_retorno ();
//

Return 1
end function

public subroutine of_explorar_subdirectorio (string as_ruta, ref string as_directorio[]);Boolean 		lb_lista
Long 			ll_fila, &
				ll_filas, &
				ll_nuevo_dir, &
				ll_nueva_fila
String 		ls_ruta

n_ds_base	lds_temporal
lds_temporal = CREATE n_ds_base  
lds_temporal.DataObject = 'd_directorio'

lb_tmp.Reset()
/*
* Busca la lista de directorios (32768) y subdirectorios (16)
*/
lb_lista     = lb_tmp.DirList(as_ruta, 32768+16) 
ll_filas 	 = lb_tmp.totalitems( )
ll_nuevo_dir = UpperBound(as_directorio[]) 

/*
* Como ya se envio en la primera posicion el directorio raiz, 
* se empieza a capturar desde la segunda posicion.
*/
FOR ll_fila = 2 TO ll_filas
	lb_tmp.SelectItem( ll_fila )

	ls_ruta = MID(Trim(lb_tmp.SelectedItem()), 2, len(Trim(lb_tmp.SelectedItem( ))) - 2)
	ls_ruta = as_ruta+"\"+ls_ruta
	
	ll_nuevo_dir += 1
	as_directorio[ll_nuevo_dir] = ls_ruta+"\"
   
	ll_nueva_fila = lds_temporal.InsertRow(0)
	lds_temporal.SetItem(ll_nueva_fila, 1, ls_ruta)
	
NEXT

ll_filas = lds_temporal.RowCount()

FOR ll_fila = 1 TO ll_filas
	ls_ruta  = lds_temporal.GetItemString( ll_fila, 1 )
	of_explorar_subdirectorio(ls_ruta, as_directorio[] )
NEXT
end subroutine

public subroutine of_armar_ruta_red (string as_ruta, ref string as_ruta_red);Long 			ll_pos, &
 				ll_pos_sig, &
 				ll_longitud, &
 				ll_nuevo_dir, &
 				ll_nueva_fila, &
				ll_longitud_total
String 		ls_ruta, &
				ls_directorio, &
				ls_dirini, &
				ls_directorio_new

// Reservo el directorio actual para devolverlo al final
ls_dirini = GetCurrentDirectory()

// Cambio de directorio 
ChangeDirectory(as_ruta_red)

ll_longitud = Len (Trim(as_ruta))
ls_ruta     = Mid(as_ruta, 3,  ll_longitud )
ll_pos      = Pos(Trim(ls_ruta), "\")
ls_ruta     = Mid(ls_ruta, ll_pos,  ll_longitud )

IF ll_pos = ll_longitud THEN
	as_ruta_red = as_ruta_red + ls_ruta	
	ChangeDirectory(ls_dirini)
	RETURN 
ELSE
//	ll_pos ++ 
END IF

ls_ruta = as_ruta_red + ls_ruta
ll_longitud_total = Len (Trim(ls_ruta))

// Verifica cada directorio 
DO WHILE ll_pos > 0			
	ll_pos_sig = Pos(ls_ruta, "\", ll_pos) 
	
	IF ll_pos_sig = 0 THEN 
		ll_pos_sig = ll_longitud
	ELSE
	 	ll_pos_sig = ll_pos_sig - 1 //Se quita el \
	END IF
	
	ls_directorio = Mid(ls_ruta, ll_pos, (ll_pos_sig - ll_pos) + 1)
	
	IF ls_directorio_new = ls_ruta OR ll_pos > ll_pos_sig THEN
		EXIT
	ELSE
		ls_directorio_new = Mid(ls_ruta,1,ll_pos_sig)
				
		IF NOT DirectoryExists(ls_directorio_new) THEN 
			IF CreateDirectory(ls_directorio_new) <> 1 THEN
				//Ocurri$$HEX2$$f3002000$$ENDHEX$$un error al crear el directorio
				//MessageBox("Error","No se cre$$HEX2$$f3002000$$ENDHEX$$la ruta " + ls_directorio_new)
			ELSE
				//Bien
			END IF
		END IF
	END IF

	ChangeDirectory(ls_directorio_new)

	ll_pos = Pos(ls_ruta, "\", ll_pos) 
	IF ll_pos = ll_longitud OR ll_pos  = 0 THEN 
		EXIT
	ELSE
		ll_pos ++
	END IF
	
LOOP

as_ruta_red = ls_ruta	
ChangeDirectory(ls_dirini)
end subroutine

on w_pasar_diseno_red.create
int iCurrent
call super::create
this.lb_tmp=create lb_tmp
this.dw_tmp=create dw_tmp
this.lb_archivo=create lb_archivo
this.st_2=create st_2
this.st_3=create st_3
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lb_tmp
this.Control[iCurrent+2]=this.dw_tmp
this.Control[iCurrent+3]=this.lb_archivo
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.cb_1
end on

on w_pasar_diseno_red.destroy
call super::destroy
destroy(this.lb_tmp)
destroy(this.dw_tmp)
destroy(this.lb_archivo)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.cb_1)
end on

event open;//dw_1.Retrieve(io_param.il_vector[1],/*favrica*/&
//              io_param.il_vector[2], /*linea*/&
//				  io_param.il_vector[3] /*talla*/)
 
s_base_parametros lo_param

lo_param = message.powerObjectparm

sle_1.Text = lo_param.cadena[1]

IF lo_param.cadena[1] <> '' THEN
	cb_aceptar.event clicked( ) 
	This.Visible = FALSE  
END IF

end event

type sle_1 from w_base_busqueda`sle_1 within w_pasar_diseno_red
integer x = 526
integer y = 76
integer width = 393
end type

event sle_1::modified;// OVER
end event

type st_1 from w_base_busqueda`st_1 within w_pasar_diseno_red
integer y = 88
string text = "Digite el Dise$$HEX1$$f100$$ENDHEX$$o:"
end type

type cb_aceptar from w_base_busqueda`cb_aceptar within w_pasar_diseno_red
integer x = 142
integer y = 224
end type

event cb_aceptar::clicked;setpointer(hourglass!)

 
Boolean 	lb_lista
Long		ll_archivos, &
			ll_archivo, &
			ll_total_files, &
			ll_filas, &
			ll_fila, &
			ll_fila_nueva, &
			li_retorna, &
			ll_n, &
			ll_nro_dir, &
			ll_res, &
			ll_fabrica
 
String  	ls_diseno, & 
			ls_direccion_ip, &
			ls_dis, &
			ls_disover, &
			ls_subdir, &
			ls_directorio[], &
			ls_archivo, &
			ls_ruta_red, &
			ls_origen, &
			ls_destino, &
			ls_ruta_red_new

n_cst_comun lo_comun

n_ds_application lds_ip_x_usuario			
n_ds_application lds_directorios
n_ds_application lds_mue_con_dis

ls_direccion_ip = ''

ll_res = lo_comun.of_obtener_fabrica_diseno(Trim(sle_1.Text), n_cst_application.itr_appl)
If ll_res=1 Then
	ll_fabrica = lo_comun.of_getLong(1)
Else
	ll_fabrica = 5
End If

ll_res=lo_comun.of_valorconstante( "SERVIDOR_RED",n_cst_application.itr_appl )
If ll_res=1 Then
	ls_ruta_red = Trim(lo_comun.of_getString(1))
Else
	ls_ruta_red = "\\sabfilesvr\Usuarios General\Crystal\Usuarios"
End If

IF (ll_fabrica = 5) THEN
	ll_res=lo_comun.of_valorconstante( "RUTA_RED_A",n_cst_application.itr_appl )
	If ll_res=1 Then
		ls_ruta_red = ls_ruta_red + Trim(lo_comun.of_getString(1))
	Else
		ls_ruta_red = ls_ruta_red + "\RIF\PROGRAMAS"
	End If
ELSE
	ll_res=lo_comun.of_valorconstante( "RUTA_RED_B",n_cst_application.itr_appl )
	If ll_res=1 Then
		ls_ruta_red = ls_ruta_red + Trim(lo_comun.of_getString(1))
	Else
		ls_ruta_red = ls_ruta_red + "\Tejido"
	End If
END IF

//ls_ruta_red = '\\sabdevsvr\desarrollo\Proceso'

ls_diseno = "*" + Trim(sle_1.Text) + "*"

//DataStore usado para recuperar las direcciones IP
lds_ip_x_usuario = CREATE n_ds_application
lds_ip_x_usuario.of_load('d_m_ip_x_usuario')
lds_ip_x_usuario.of_conexion(n_cst_application.itr_appl,True)

lds_directorios = CREATE n_ds_application
lds_directorios.of_load('d_m_directorios_red_ip')
lds_directorios.of_conexion(n_cst_application.itr_appl,True)
lds_directorios.Retrieve() 

lds_mue_con_dis = CREATE n_ds_application
lds_mue_con_dis.of_load('d_count_disenos_muestra')
lds_mue_con_dis.of_conexion(n_cst_application.itr_appl,True)
lds_mue_con_dis.Retrieve() 

IF lds_mue_con_dis.RowCount() > 1 THEN
	CLOSE(PARENT)
	RETURN
END IF
		
// graph5, //graph6		
FOR ll_nro_dir = 1 TO lds_directorios.RowCount()
	ls_directorio[ll_nro_dir] = lds_directorios.GetItemString(ll_nro_dir,"direccion_completa")
 
	of_explorar_subdirectorio( ls_directorio[ll_nro_dir],     ls_directorio[] ) 

NEXT
ll_filas           = UpperBound(ls_directorio[])

FOR ll_fila = 1 TO ll_filas
	ls_subdir    = ls_directorio[ll_fila] +"\"+ls_diseno
	lb_lista     = lb_archivo.DirList(ls_subdir,1)	
	ll_archivos = 0
	ll_archivos = lb_archivo.totalitems( )

	FOR ll_archivo = 1 TO ll_archivos
		lb_archivo.SelectItem( ll_archivo )
		ls_archivo    = lb_archivo.SelectedItem()
		ll_fila_nueva = dw_tmp.InsertRow(0)
		dw_tmp.SetItem(ll_fila_nueva, 1, ls_directorio[ll_fila]  )	
		dw_tmp.SetItem(ll_fila_nueva, 2, ls_archivo)	
		
		ls_ruta_red_new = ls_ruta_red
		of_armar_ruta_red( ls_directorio[ll_fila], ls_ruta_red_new )	
		ls_origen  = ls_directorio[ll_fila] + ls_archivo
		ls_destino = ls_ruta_red_new + ls_archivo

		//li_retorna = FileCopy(ls_directorio[ll_fila] + ls_archivo, ls_ruta_red + ls_archivo, True)
		li_retorna = FileCopy(ls_origen, ls_destino, True)
		/*
		*  1 Con exito 
		* -1 Error abriendo el origen
		* -2 Error escribiendo en el destino 
		*/
		
		IF li_retorna= -1 THEN
			//"No se pudo abrir el archivo que se va a copiar: "+as_ArchivoOrigen
			RETURN -1
		ELSEIF li_retorna= -2 THEN
			//as_mensaje = "No se pudo copiar en el archivo destino: "+ls_ArchivoDestino
			RETURN -1
		END IF

	NEXT
NEXT
ls_diseno = ''

IF NOT (PARENT.Visible) THEN
	CLOSE(PARENT)
END IF
end event

type cb_cancelar from w_base_busqueda`cb_cancelar within w_pasar_diseno_red
integer x = 567
integer y = 224
end type

type dw_1 from w_base_busqueda`dw_1 within w_pasar_diseno_red
boolean visible = false
integer x = 114
integer y = 1016
integer width = 581
integer height = 372
end type

type gb_1 from w_base_busqueda`gb_1 within w_pasar_diseno_red
boolean visible = false
integer x = 37
integer y = 956
integer width = 745
integer height = 476
end type

type gb_2 from w_base_busqueda`gb_2 within w_pasar_diseno_red
integer width = 960
integer height = 188
string text = "Pasar dise$$HEX1$$f100$$ENDHEX$$o a la red"
end type

type lb_tmp from listbox within w_pasar_diseno_red
integer x = 18
integer y = 580
integer width = 411
integer height = 352
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type dw_tmp from u_dw_application within w_pasar_diseno_red
integer x = 914
integer y = 564
integer width = 1906
integer height = 868
integer taborder = 30
boolean bringtotop = true
boolean titlebar = true
string title = "Directorios"
string dataobject = "d_directorio"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean resizable = true
end type

event itemerror;RETURN 1
end event

type lb_archivo from listbox within w_pasar_diseno_red
integer x = 453
integer y = 576
integer width = 411
integer height = 352
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type st_2 from statictext within w_pasar_diseno_red
integer x = 18
integer y = 488
integer width = 343
integer height = 88
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tmp"
boolean focusrectangle = false
end type

type st_3 from statictext within w_pasar_diseno_red
integer x = 485
integer y = 488
integer width = 343
integer height = 84
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Archivo"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_pasar_diseno_red
boolean visible = false
integer x = 709
integer y = 224
integer width = 343
integer height = 100
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;setpointer(hourglass!)

 
Boolean 	lb_lista
Long		ll_archivos, &
			ll_archivo, &
			ll_total_files, &
			ll_filas, &
			ll_fila, &
			ll_fila_nueva, &
			li_retorna, &
			ll_n, &
			ll_nro_dir, &
			ll_res, &
			ll_fabrica
 
String  	ls_diseno, & 
			ls_direccion_ip, &
			ls_dis, &
			ls_disover, &
			ls_subdir, &
			ls_directorio[], &
			ls_archivo, &
			ls_ruta_red

n_cst_comun lo_comun

n_ds_application lds_ip_x_usuario			
n_ds_application lds_directorios
n_ds_application lds_mue_con_dis

ls_direccion_ip = ''

ll_res = lo_comun.of_obtener_fabrica_diseno(Trim(sle_1.Text), n_cst_application.itr_appl)
If ll_res=1 Then
	ll_fabrica = lo_comun.of_getLong(1)
Else
	ll_fabrica = 5
End If

ll_res=lo_comun.of_valorconstante( "SERVIDOR_RED",n_cst_application.itr_appl )
If ll_res=1 Then
	ls_ruta_red = Trim(lo_comun.of_getString(1))
Else
	ls_ruta_red = "\\sabfilesvr\Usuarios General\Crystal\Usuarios"
End If

IF (ll_fabrica = 5) THEN
	ll_res=lo_comun.of_valorconstante( "RUTA_RED_A",n_cst_application.itr_appl )
	If ll_res=1 Then
		ls_ruta_red = ls_ruta_red + Trim(lo_comun.of_getString(1))
	Else
		ls_ruta_red = ls_ruta_red + "\RIF\PROGRAMAS"
	End If
ELSE
	ll_res=lo_comun.of_valorconstante( "RUTA_RED_B",n_cst_application.itr_appl )
	If ll_res=1 Then
		ls_ruta_red = ls_ruta_red + Trim(lo_comun.of_getString(1))
	Else
		ls_ruta_red = ls_ruta_red + "\Tejido"
	End If
END IF

ls_diseno = "*" + Trim(sle_1.Text) + "*"

//DataStore usado para recuperar las direcciones IP
lds_ip_x_usuario = CREATE n_ds_application
lds_ip_x_usuario.of_load('d_m_ip_x_usuario')
lds_ip_x_usuario.of_conexion(n_cst_application.itr_appl,True)

lds_directorios = CREATE n_ds_application
lds_directorios.of_load('d_m_directorios_red_ip')
lds_directorios.of_conexion(n_cst_application.itr_appl,True)
lds_directorios.Retrieve() 

lds_mue_con_dis = CREATE n_ds_application
lds_mue_con_dis.of_load('d_count_disenos_muestra')
lds_mue_con_dis.of_conexion(n_cst_application.itr_appl,True)
lds_mue_con_dis.Retrieve() 

IF lds_mue_con_dis.RowCount() > 1 THEN
	CLOSE(PARENT)
	RETURN
END IF

//IF lds_ip_x_usuario.Retrieve() > 0 THEN
	
//	FOR ll_n = 1 TO lds_ip_x_usuario.RowCount()

//	   ls_direccion_ip = "\\" + trim(lds_ip_x_usuario.GetItemString(ll_n,"direccion_ip"))
		
		// graph5, //graph6		
		FOR ll_nro_dir = 1 TO lds_directorios.RowCount()
//			ls_directorio[ll_nro_dir] = ls_direccion_ip + "\" + &
//			                            Trim(lds_directorios.GetItemString(ll_nro_dir, 'de_directorio'))
         ls_directorio[ll_nro_dir] = lds_directorios.GetItemString(ll_nro_dir,"direccion_completa")
		 
			of_explorar_subdirectorio( ls_directorio[ll_nro_dir],     ls_directorio[] ) 
		
			//ls_directorio[2] = ls_direccion_ip + "\graph6"
			//of_explorar_subdirectorio( ls_directorio[2],     ls_directorio[] ) 		
		NEXT
		ll_filas           = UpperBound(ls_directorio[])
		
		FOR ll_fila = 1 TO ll_filas
			ls_subdir    = ls_directorio[ll_fila] +"\"+ls_diseno
			lb_lista     = lb_archivo.DirList(ls_subdir,1)	
			ll_archivos = 0
			ll_archivos = lb_archivo.totalitems( )
		
			FOR ll_archivo = 1 TO ll_archivos
				lb_archivo.SelectItem( ll_archivo )
				ls_archivo    = lb_archivo.SelectedItem()
				ll_fila_nueva = dw_tmp.InsertRow(0)
				dw_tmp.SetItem(ll_fila_nueva, 1, ls_directorio[ll_fila]  )	
				dw_tmp.SetItem(ll_fila_nueva, 2, ls_archivo)	
				
		      // "\\sabfilesvr\Usuarios General\Crystal\Usuarios\Tejido"
				of_armar_ruta_red( ls_directorio[ll_fila], ls_ruta_red )		 

				li_retorna = FileCopy(ls_directorio[ll_fila] + ls_archivo, ls_ruta_red + ls_archivo, True)
				/*
				*  1 Con exito 
				* -1 Error abriendo el origen
				* -2 Error escribiendo en el destino 
				*/
				
				IF li_retorna= -1 THEN
					//"No se pudo abrir el archivo que se va a copiar: "+as_ArchivoOrigen
					RETURN -1
				ELSEIF li_retorna= -2 THEN
					//as_mensaje = "No se pudo copiar en el archivo destino: "+ls_ArchivoDestino
					RETURN -1
				END IF
		
				
				//dw_tmp.SetItem(ll_fila_nueva, "directorio", ls_directorio[ll_fila] )	
				//dw_tmp.SetItem(ll_fila_nueva, "archivo", ls_archivo)		
			NEXT
		NEXT
		ls_diseno = ''
//	NEXT
//ELSE
//	MessageBox("Error","Ocurri$$HEX2$$f3002000$$ENDHEX$$un error consultando las IP por usuario")
//	RETURN -1
//END IF

IF NOT (PARENT.Visible) THEN
	CLOSE(PARENT)
END IF


//Antes

//setpointer(hourglass!)
//
// 
//Boolean 	lb_lista
//Long		ll_archivos, &
//			ll_archivo, &
//			ll_total_files, &
//			ll_filas, &
//			ll_fila, &
//			ll_fila_nueva, &
//			li_retorna, &
//			ll_n, &
//			ll_nro_dir, &
//			ll_res, &
//			ll_fabrica
// 
//String  	ls_diseno, & 
//			ls_direccion_ip, &
//			ls_dis, &
//			ls_disover, &
//			ls_subdir, &
//			ls_directorio[], &
//			ls_archivo, &
//			ls_ruta_red
//
//n_cst_comun lo_comun
//
//n_ds_application lds_ip_x_usuario			
//n_ds_application lds_directorios
//n_ds_application lds_mue_con_dis
//
//ls_direccion_ip = ''
//
//ll_res = lo_comun.of_obtener_fabrica_diseno(Trim(sle_1.Text), n_cst_application.itr_appl)
//If ll_res=1 Then
//	ll_fabrica = lo_comun.of_getLong(1)
//Else
//	ll_fabrica = 5
//End If
//
//ll_res=lo_comun.of_valorconstante( "SERVIDOR_RED",n_cst_application.itr_appl )
//If ll_res=1 Then
//	ls_ruta_red = Trim(lo_comun.of_getString(1))
//Else
//	ls_ruta_red = "\\sabfilesvr\Usuarios General\Crystal\Usuarios"
//End If
//
//IF (ll_fabrica = 5) THEN
//	ll_res=lo_comun.of_valorconstante( "RUTA_RED_A",n_cst_application.itr_appl )
//	If ll_res=1 Then
//		ls_ruta_red = ls_ruta_red + Trim(lo_comun.of_getString(1))
//	Else
//		ls_ruta_red = ls_ruta_red + "\RIF\PROGRAMAS"
//	End If
//ELSE
//	ll_res=lo_comun.of_valorconstante( "RUTA_RED_B",n_cst_application.itr_appl )
//	If ll_res=1 Then
//		ls_ruta_red = ls_ruta_red + Trim(lo_comun.of_getString(1))
//	Else
//		ls_ruta_red = ls_ruta_red + "\Tejido"
//	End If
//END IF
//
//ls_diseno = "*" + Trim(sle_1.Text) + "*"
//
////DataStore usado para recuperar las direcciones IP
//lds_ip_x_usuario = CREATE n_ds_application
//lds_ip_x_usuario.of_load('d_m_ip_x_usuario')
//lds_ip_x_usuario.of_conexion(n_cst_application.itr_appl,True)
//
//lds_directorios = CREATE n_ds_application
//lds_directorios.of_load('d_m_directorios_red')
//lds_directorios.of_conexion(n_cst_application.itr_appl,True)
//lds_directorios.Retrieve() 
//
//lds_mue_con_dis = CREATE n_ds_application
//lds_mue_con_dis.of_load('d_count_disenos_muestra')
//lds_mue_con_dis.of_conexion(n_cst_application.itr_appl,True)
//lds_mue_con_dis.Retrieve() 
//
//IF lds_mue_con_dis.RowCount() > 1 THEN
//	CLOSE(PARENT)
//	RETURN
//END IF
//
//IF lds_ip_x_usuario.Retrieve() > 0 THEN
//	
//	FOR ll_n = 1 TO lds_ip_x_usuario.RowCount()
//
//	   ls_direccion_ip = "\\" + trim(lds_ip_x_usuario.GetItemString(ll_n,"direccion_ip"))
//		
//		// graph5, //graph6		
//		FOR ll_nro_dir = 1 TO lds_directorios.RowCount()
//			ls_directorio[ll_nro_dir] = ls_direccion_ip + "\" + &
//			                            Trim(lds_directorios.GetItemString(ll_nro_dir, 'de_directorio'))
//		 
//			of_explorar_subdirectorio( ls_directorio[ll_nro_dir],     ls_directorio[] ) 
//		
//			//ls_directorio[2] = ls_direccion_ip + "\graph6"
//			//of_explorar_subdirectorio( ls_directorio[2],     ls_directorio[] ) 		
//		NEXT
//		ll_filas           = UpperBound(ls_directorio[])
//		
//		FOR ll_fila = 1 TO ll_filas
//			ls_subdir    = ls_directorio[ll_fila] +"\"+ls_diseno
//			lb_lista     = lb_archivo.DirList(ls_subdir,1)	
//			ll_archivos = 0
//			ll_archivos = lb_archivo.totalitems( )
//		
//			FOR ll_archivo = 1 TO ll_archivos
//				lb_archivo.SelectItem( ll_archivo )
//				ls_archivo    = lb_archivo.SelectedItem()
//				ll_fila_nueva = dw_tmp.InsertRow(0)
//				dw_tmp.SetItem(ll_fila_nueva, 1, ls_directorio[ll_fila]  )	
//				dw_tmp.SetItem(ll_fila_nueva, 2, ls_archivo)	
//				
//		      // "\\sabfilesvr\Usuarios General\Crystal\Usuarios\Tejido"
//				of_armar_ruta_red( ls_directorio[ll_fila], ls_ruta_red )		 
//
//				li_retorna = FileCopy(ls_directorio[ll_fila] + ls_archivo, ls_ruta_red + ls_archivo, True)
//				/*
//				*  1 Con exito 
//				* -1 Error abriendo el origen
//				* -2 Error escribiendo en el destino 
//				*/
//				
//				IF li_retorna= -1 THEN
//					//"No se pudo abrir el archivo que se va a copiar: "+as_ArchivoOrigen
//					RETURN -1
//				ELSEIF li_retorna= -2 THEN
//					//as_mensaje = "No se pudo copiar en el archivo destino: "+ls_ArchivoDestino
//					RETURN -1
//				END IF
//		
//				
//				//dw_tmp.SetItem(ll_fila_nueva, "directorio", ls_directorio[ll_fila] )	
//				//dw_tmp.SetItem(ll_fila_nueva, "archivo", ls_archivo)		
//			NEXT
//		NEXT
//		ls_diseno = ''
//	NEXT
//ELSE
//	MessageBox("Error","Ocurri$$HEX2$$f3002000$$ENDHEX$$un error consultando las IP por usuario")
//	RETURN -1
//END IF
//
//IF NOT (PARENT.Visible) THEN
//	CLOSE(PARENT)
//END IF
end event

