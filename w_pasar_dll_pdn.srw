HA$PBExportHeader$w_pasar_dll_pdn.srw
forward
global type w_pasar_dll_pdn from window
end type
type cb_2 from commandbutton within w_pasar_dll_pdn
end type
type sle_1 from singlelineedit within w_pasar_dll_pdn
end type
type cb_1 from commandbutton within w_pasar_dll_pdn
end type
end forward

global type w_pasar_dll_pdn from window
integer width = 882
integer height = 604
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
sle_1 sle_1
cb_1 cb_1
end type
global w_pasar_dll_pdn w_pasar_dll_pdn

on w_pasar_dll_pdn.create
this.cb_2=create cb_2
this.sle_1=create sle_1
this.cb_1=create cb_1
this.Control[]={this.cb_2,&
this.sle_1,&
this.cb_1}
end on

on w_pasar_dll_pdn.destroy
destroy(this.cb_2)
destroy(this.sle_1)
destroy(this.cb_1)
end on

type cb_2 from commandbutton within w_pasar_dll_pdn
integer x = 91
integer y = 36
integer width = 613
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ingresar Muestra a Migrar"
end type

type sle_1 from singlelineedit within w_pasar_dll_pdn
integer x = 96
integer y = 140
integer width = 567
integer height = 100
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_pasar_dll_pdn
integer x = 82
integer y = 312
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Procesar"
end type

event clicked;Long ll_fila, ll_filas, ll_confirmacion, ll_actenc, ll_actdet, ll_muestra


transaction sqlprod
transaction sqldes

// Profile produccion
sqldes = create transaction 
sqlprod = create transaction 
//68322

sqlprod.DBMS = "IN9 INFORMIX-9"
sqlprod.Database = "producto"
sqlprod.UserId = "admpd"
sqlprod.DBPass = "nuevo1"
sqlprod.ServerName = "sabdbs01@crypro01"
sqlprod.AutoCommit = False
sqlprod.DBParm = ""

// Profile Producto
sqldes.DBMS = "IN9 INFORMIX-9"
sqldes.Database = "producto"
sqldes.UserId = "admpd"
sqldes.DBPass = "nuevo1"
sqldes.ServerName = "10.10.20.4@crypro01tcp"
sqldes.AutoCommit = False
sqldes.DBParm = ""



CONNECT USING sqlprod;
If sqlprod.SqlCode < 0 THEN
	MessageBox("Advertencia","No se pudo conectar con la BD para ejecutar el procedimiento sp_asignar_muestra.~n~n"+SQLCA.SqlErrText)
	RETURN -1
END IF
messageBox('4','')
CONNECT USING sqldes;
If sqldes.SqlCode < 0 THEN
	MessageBox("Advertencia","No se pudo conectar con la BD para ejecutar el procedimiento sp_asignar_muestra.~n~n"+SQLCA.SqlErrText)
	RETURN -1
END IF

ll_muestra = Long(sle_1.text)


IF ll_muestra = 0 THEN return

datastore	lds_encabezadodes, lds_encabezadodprod
datastore	lds_detalleprod, lds_detalledes


lds_encabezadodes	= CREATE datastore
lds_encabezadodprod	= CREATE datastore
lds_detalleprod	= CREATE datastore
lds_detalledes	= CREATE datastore


//recuperacion de la informacion de desarrollo
lds_encabezadodes.dataobject = 'd_copia_h_fmp_muestras'
lds_encabezadodes.settransobject(sqldes)

lds_detalledes.dataobject = 'd_copia_dt_fmp_muestras'
lds_detalledes.settransobject(sqldes)

lds_encabezadodes.retrieve(ll_muestra)
lds_detalledes.retrieve(ll_muestra)

//recuperacion de la informacion de producccion

lds_encabezadodprod.dataobject = 'd_copia_h_fmp_muestras'
lds_encabezadodprod.settransobject(sqlprod)

lds_detalleprod.dataobject = 'd_copia_dt_fmp_muestras'
lds_detalleprod.settransobject(sqlprod)

lds_encabezadodprod.retrieve(ll_muestra)
lds_detalleprod.retrieve(ll_muestra)


//confirmacion de la actualizacion de los datos.

ll_confirmacion = MessageBox('Confirmacion','Desea Actualizar los datos que se pasaran desde Desarrollo.',Question!,YesNo!)

IF ll_confirmacion = 1 THEN
	
	ll_filas = lds_encabezadodprod.rowcount( )
	FOR ll_fila = 1  TO ll_filas
		lds_encabezadodprod.deleterow(1)
	NEXT
	
	lds_encabezadodprod.update( )
	
	ll_filas = lds_detalleprod.rowcount( )
	FOR ll_fila = 1  TO ll_filas
		lds_detalleprod.deleterow(1)
	NEXT
	
	lds_detalleprod.update( )	
	
	lds_encabezadodes.rowscopy( 1, lds_encabezadodes.RowCount(), Primary!, lds_encabezadodprod, 1, Primary!)
	lds_detalledes.rowscopy( 1, lds_detalledes.RowCount(), Primary!, lds_detalleprod, 1, Primary!)
	
	
	ll_actenc = lds_encabezadodprod.update( )
	ll_actdet = lds_detalleprod.update( )
	
	
END IF	

commit using sqlprod;
MessageBox('','Exito')


DISCONNECT USING sqldes;
DISCONNECT USING sqlprod;


open(w_procesar_muestras)

end event

