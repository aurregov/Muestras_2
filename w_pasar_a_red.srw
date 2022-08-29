HA$PBExportHeader$w_pasar_a_red.srw
forward
global type w_pasar_a_red from w_simple
end type
type lb_tmp from listbox within w_pasar_a_red
end type
type dw_tmp from u_dw_application within w_pasar_a_red
end type
type cb_pasar from commandbutton within w_pasar_a_red
end type
type lb_archivo from listbox within w_pasar_a_red
end type
type st_1 from statictext within w_pasar_a_red
end type
type st_2 from statictext within w_pasar_a_red
end type
type cb_1 from commandbutton within w_pasar_a_red
end type
end forward

global type w_pasar_a_red from w_simple
integer width = 2185
integer height = 840
string title = "Pasar dise$$HEX1$$f100$$ENDHEX$$o a la Red"
string menuname = ""
lb_tmp lb_tmp
dw_tmp dw_tmp
cb_pasar cb_pasar
lb_archivo lb_archivo
st_1 st_1
st_2 st_2
cb_1 cb_1
end type
global w_pasar_a_red w_pasar_a_red

forward prototypes
public subroutine of_armar_ruta_red (string as_ruta, ref string as_ruta_red)
public subroutine of_explorar_subdirectorio (string as_ruta, ref string as_directorio[])
end prototypes

public subroutine of_armar_ruta_red (string as_ruta, ref string as_ruta_red);Long 			ll_pos, &
 				ll_pos_sig, &
 				ll_longitud, &
 				ll_nuevo_dir, &
 				ll_nueva_fila
String 		ls_ruta, &
				ls_directorio, &
				ls_dirini 

// Reservo el directorio actual para devolverlo al final
ls_dirini = GetCurrentDirectory()

// Cambio de directorio 
ChangeDirectory(as_ruta_red)

ll_longitud = Len (Trim(as_ruta))
ls_ruta     = Mid(as_ruta, 3,  ll_longitud )
ll_pos      = Pos(Trim(ls_ruta), "\")
ls_ruta     = Mid(ls_ruta, ll_pos,  ll_longitud )

//ll_longitud = Len (Trim(as_ruta))
//ll_pos      = Pos(Trim(as_ruta), "\\") 
//ll_longitud = (ll_longitud - ll_pos) + 2
//// Se toma la ruta sin la direccion IP
//ls_ruta     = Mid(as_ruta, ll_pos,  ll_longitud ) 
//ll_pos      = Pos(as_ruta, "\") 
//ll_longitud = (ll_longitud - ll_pos) + 1

// Se toma la ruta sin la unidad
//ls_ruta     = Mid(as_ruta, ll_pos,  ll_longitud ) 
//ll_pos      = Pos(ls_ruta, "\") 

IF ll_pos = ll_longitud THEN
	as_ruta_red = as_ruta_red + ls_ruta	
	ChangeDirectory(ls_dirini)
	RETURN 
ELSE
	ll_pos ++
END IF

ls_ruta = as_ruta_red + ls_ruta
// Verifica cada directorio 
DO WHILE ll_pos > 0			
	ll_pos_sig = Pos(ls_ruta, "\", ll_pos) 
	
	IF ll_pos_sig = 0 THEN 
		ll_pos_sig = ll_longitud
	ELSE
	 	ll_pos_sig = ll_pos_sig - 1
	END IF
	
	ls_directorio = Mid(ls_ruta, ll_pos, (ll_pos_sig - ll_pos) + 1)
	
	IF NOT DirectoryExists(ls_directorio) THEN CreateDirectory(ls_directorio)

	ChangeDirectory(ls_directorio)

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

on w_pasar_a_red.create
int iCurrent
call super::create
this.lb_tmp=create lb_tmp
this.dw_tmp=create dw_tmp
this.cb_pasar=create cb_pasar
this.lb_archivo=create lb_archivo
this.st_1=create st_1
this.st_2=create st_2
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lb_tmp
this.Control[iCurrent+2]=this.dw_tmp
this.Control[iCurrent+3]=this.cb_pasar
this.Control[iCurrent+4]=this.lb_archivo
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.cb_1
end on

on w_pasar_a_red.destroy
call super::destroy
destroy(this.lb_tmp)
destroy(this.dw_tmp)
destroy(this.cb_pasar)
destroy(this.lb_archivo)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.cb_1)
end on

event open;this.x = 1
this.y = 1


end event

type dw_general from w_simple`dw_general within w_pasar_a_red
boolean visible = false
integer x = 73
integer y = 1028
integer width = 366
integer height = 160
end type

type gb_general from w_simple`gb_general within w_pasar_a_red
boolean visible = false
integer x = 50
integer y = 976
integer width = 457
integer height = 280
end type

type lb_tmp from listbox within w_pasar_a_red
integer x = 18
integer y = 256
integer width = 411
integer height = 352
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type dw_tmp from u_dw_application within w_pasar_a_red
integer x = 914
integer y = 240
integer width = 750
integer height = 404
integer taborder = 20
boolean bringtotop = true
boolean titlebar = true
string title = "Directorios"
string dataobject = "d_directorio"
boolean hscrollbar = true
boolean resizable = true
end type

event itemerror;RETURN 1
end event

type cb_pasar from commandbutton within w_pasar_a_red
integer x = 1093
integer y = 120
integer width = 343
integer height = 100
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Pasar"
end type

event clicked;setpointer(hourglass!)

 
Boolean 	lb_lista
Long		ll_archivos, &
			ll_archivo, &
			ll_total_files, &
			ll_filas, &
			ll_fila, &
			ll_fila_nueva, &
			li_retorna
 
String  	ls_diseno, & 
			ls_direccion_ip, &
			ls_dis, &
			ls_disover, &
			ls_subdir, &
			ls_directorio[], &
			ls_archivo, &
			ls_ruta_red
 



ls_direccion_ip    = "C:\graph5"

ls_directorio[1] = ls_dis
 

of_explorar_subdirectorio( ls_direccion_ip,     ls_directorio[] ) 
 
ls_diseno 		 = "*1256*"
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

      ls_ruta_red = "D:\desarrollo"
      of_armar_ruta_red( ls_directorio[ll_fila], ls_ruta_red )

		li_retorna = FileCopy(ls_directorio[ll_fila] +"\"+ls_archivo, ls_ruta_red+"\"+ls_archivo, True)
		
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
end event

type lb_archivo from listbox within w_pasar_a_red
integer x = 453
integer y = 252
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

type st_1 from statictext within w_pasar_a_red
integer x = 18
integer y = 168
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

type st_2 from statictext within w_pasar_a_red
integer x = 485
integer y = 156
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

type cb_1 from commandbutton within w_pasar_a_red
integer x = 1646
integer y = 112
integer width = 343
integer height = 100
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Pasar IP"
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
			ll_n
 
String  	ls_diseno, & 
			ls_direccion_ip, &
			ls_dis, &
			ls_disover, &
			ls_subdir, &
			ls_directorio[], &
			ls_archivo, &
			ls_ruta_red
			
n_ds_application lds_ip_x_usuario

ls_direccion_ip = ''

//DataStore usado para recuperar las direcciones IP
lds_ip_x_usuario = CREATE n_ds_application
lds_ip_x_usuario.of_load('d_m_ip_x_usuario')
lds_ip_x_usuario.of_conexion(n_cst_application.itr_appl,True)

IF lds_ip_x_usuario.Retrieve() > 0 THEN
	
	FOR ll_n = 1 TO lds_ip_x_usuario.RowCount()

	   ls_direccion_ip = "\\" + trim(lds_ip_x_usuario.GetItemString(ll_n,"direccion_ip"))
		
		//graph5
		ls_directorio[1] = ls_direccion_ip + "\graph5"
		 
		of_explorar_subdirectorio( ls_directorio[1],     ls_directorio[] ) 
		
		//graph6		
		ls_directorio[2] = ls_direccion_ip + "\graph6"
		 
		of_explorar_subdirectorio( ls_directorio[2],     ls_directorio[] ) 		
		 
		ls_diseno 		 = "*1011*"
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
		
				ls_ruta_red = "D:\desarrollo"
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
	NEXT
ELSE
	MessageBox("Error","Ocurri$$HEX2$$f3002000$$ENDHEX$$un error consultando las IP por usuario")
	RETURN -1
END IF
end event

