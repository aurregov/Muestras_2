HA$PBExportHeader$w_generar_muestra.srw
forward
global type w_generar_muestra from w_simple
end type
type cb_aceptar from commandbutton within w_generar_muestra
end type
type cb_cancelar from commandbutton within w_generar_muestra
end type
end forward

global type w_generar_muestra from w_simple
integer width = 2231
integer height = 572
string title = "Asignar muestra a FMP"
string menuname = ""
boolean maxbox = true
cb_aceptar cb_aceptar
cb_cancelar cb_cancelar
end type
global w_generar_muestra w_generar_muestra

on w_generar_muestra.create
int iCurrent
call super::create
this.cb_aceptar=create cb_aceptar
this.cb_cancelar=create cb_cancelar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_aceptar
this.Control[iCurrent+2]=this.cb_cancelar
end on

on w_generar_muestra.destroy
call super::destroy
destroy(this.cb_aceptar)
destroy(this.cb_cancelar)
end on

event open;//open(w_seleccion_fabrica)

//If Message.stringParm<>"OK" Then
//	CLOSE(THIS)
//	RETURN
//End If
DataWindowChild 	ldwc_tipoprod

dw_general.GetChild( 'co_tipoprod', ldwc_tipoprod)

ldwc_tipoprod.SetTransObject(n_cst_application.itr_appl) 
ldwc_tipoprod.Retrieve( n_cst_application.is_user)

dw_general.InsertRow(0)
end event

event closequery;//Override
end event

type dw_general from w_simple`dw_general within w_generar_muestra
integer x = 101
integer y = 100
integer width = 2057
integer height = 152
string dataobject = "d_generar_muestra"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_general::itemchanged;call super::itemchanged;Long				ll_referencia, 	ll_res
Integer 			li_fabrica, li_linea
String  			ls_de_referencia 
n_cst_comun 	lo_comun


Accepttext()

li_fabrica    = GetItemNumber( 1, 'co_fabrica') 
li_linea      = GetItemNumber( 1, 'co_linea') 
ll_referencia = GetItemNumber( 1, 'co_referencia') 

// Si ya tienen valor los par$$HEX1$$e100$$ENDHEX$$metros Fabrica, Linea y Referencia se recupera
// la descripcion de la ref
IF NOT IsNull(ll_referencia) AND NOT IsNull(li_fabrica) AND NOT IsNull(li_linea) THEN
	ll_res =  lo_comun.of_nombrereferencia( li_fabrica, li_linea, ll_referencia, n_cst_application.itr_appl )

	If ll_res = 1 Then
		ls_de_referencia = lo_comun.of_getstring(1)
		SetItem(1, 'de_referencia', ls_de_referencia)
	ElseIf ll_res = 0 Then
		MessageBox("$$HEX1$$a100$$ENDHEX$$Atenci$$HEX1$$f300$$ENDHEX$$n!", "La referencia no existe. Por favor verifique.", Exclamation!)
		SetNull(ll_referencia)
		SetNull(ls_de_referencia)
		
		SetItem(1, 'co_referencia', ll_referencia)
		SetItem(1, 'de_referencia', ls_de_referencia)
		RETURN 1
	End If
END IF
end event

type gb_general from w_simple`gb_general within w_generar_muestra
integer width = 2135
integer height = 256
end type

type cb_aceptar from commandbutton within w_generar_muestra
integer x = 722
integer y = 340
integer width = 343
integer height = 100
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;LONG 		ll_fabrica,ll_linea,ll_referencia,&
			ll_talla,ll_calidad,ll_muestra, ll_result
INTEGER	li_exito, li_fabrica_conex, li_tipoprod	
STRING	ls_mensaje
String ls_dbms,ls_database,ls_servername,ls_lock, ls_dbparm

ll_result = 0
s_base_parametros ls_parametro
ls_parametro.cadena[1] = 'Asignar Muestra'
ls_parametro.cadena[2] = 'Generando c$$HEX1$$f300$$ENDHEX$$digo de muestra... por favor espere.'
ls_parametro.cadena[3] = 'reloj'

OpenWithParm(w_retroalimentacion, ls_parametro)

ll_fabrica 	  = dw_general.GetitemNumber(1,"co_fabrica")
ll_linea		  = dw_general.GetitemNumber(1,"co_linea")
ll_referencia = dw_general.GetitemNumber(1,"co_referencia")
ll_talla		  = dw_general.GetitemNumber(1,"co_talla")
ll_calidad    = dw_general.GetitemNumber(1,"co_calidad") 
li_tipoprod	  = dw_general.GetitemNumber(1,"co_tipoprod") 

ls_mensaje = ' F$$HEX1$$e100$$ENDHEX$$brica '+String(ll_fabrica) +&
				 ' L$$HEX1$$ed00$$ENDHEX$$nea '+String(ll_linea) +&
				 ' Referencia '+String(ll_referencia) +&
				 ' Talla '+String(ll_talla) +&
				 ' Calidad'+String(ll_calidad) 

IF li_tipoprod = 10 OR li_tipoprod = 85 THEN
	li_fabrica_conex = 2
ELSEIF li_tipoprod = 20 THEN
	li_fabrica_conex = 5
END IF

GarbageCollect()
	
//S$$HEX2$$ed002000$$ENDHEX$$todo ha estado bien conectar ahora a la base de datos de la aplicaci$$HEX1$$f300$$ENDHEX$$n
ls_dbms       = n_cst_application.Of_GetProFile(n_cst_application.is_pathfileconf,'fabrica'+String(li_fabrica_conex),'DBMS')
ls_database   = n_cst_application.Of_GetProFile(n_cst_application.is_pathfileconf,'fabrica'+String(li_fabrica_conex),'DATABASE')
ls_servername = n_cst_application.Of_GetProFile(n_cst_application.is_pathfileconf,'fabrica'+String(li_fabrica_conex),'SERVERNAME')
ls_lock       = n_cst_application.Of_GetProFile(n_cst_application.is_pathfileconf,'fabrica'+String(li_fabrica_conex),'LOCK')
ls_dbparm     = n_cst_application.Of_GetProFile(n_cst_application.is_pathfileconf,'fabrica'+String(li_fabrica_conex),'DBPARM')

// Profile producto@marrs01
SQLCA.DBMS       = ls_dbms
SQLCA.Database   = ls_database
SQLCA.UserId     = n_cst_application.is_user
SQLCA.DBPass     = n_cst_application.is_passwd
SQLCA.ServerName = ls_servername
SQLCA.AutoCommit = False
SQLCA.DBParm     = ls_dbparm

CONNECT USING SQLCA;
If SQLCA.SqlCode < 0 THEN
	MessageBox("Advertencia","No se pudo conectar con la BD para ejecutar el procedimiento sp_asignar_muestra.~n~n"+SQLCA.SqlErrText)
	RETURN -1
END IF
	
// Invoca el procedure que asigna un c$$HEX1$$f300$$ENDHEX$$digo de muestra a una Referencia que est$$HEX2$$e1002000$$ENDHEX$$como referencia 
// y genera las Fichas a nivel de muestra.
Declare cc_generar_fmp  Procedure For sp_asignar_muestra(:ll_fabrica, :ll_linea,  :ll_referencia, :ll_talla, :ll_calidad) 
  using SQLCA;
Execute cc_generar_fmp;

If SQLCA.SqlCode < 0 Then
	MessageBox("Advertencia","No se pudo ejecutar el"+&
									 " procedimiento sp_asignar_muestra para "+ls_mensaje+".~n~n"+SQLCA.SqlErrText)
	ll_result=-1
Else
	FETCH cc_generar_fmp INTO :ll_muestra ;
	
	If SQLCA.SqlCode < 0 Then
		MessageBox("Error", "Ocurri$$HEX2$$f3002000$$ENDHEX$$un error al ejecutar el"+&
								  " procedimiento sp_asignar_muestra para "+ls_mensaje+".~n~n"+SQLCA.SqlErrText, StopSign!)
		ll_result=-1
	End If
End If

CLOSE cc_generar_fmp; 
		
close(w_retroalimentacion)

If ll_result = 0 Then
	commit;
	Messagebox("Exito","A la referencia "+String(ll_referencia)+ " se le genr$$HEX2$$f3002000$$ENDHEX$$el codigo de Muestra "+String(ll_muestra))
Else
	Rollback;
	MessageBox("Error","No se pudo generar c$$HEX1$$f300$$ENDHEX$$digo de Muestra")
	DISCONNECT USING SQLCA;
	return
End if	

DISCONNECT USING SQLCA;

dw_general.reset()
dw_general.InsertRow(0)
dw_general.SetColumn('co_fabrica')
dw_general.SetFocus()
end event

type cb_cancelar from commandbutton within w_generar_muestra
integer x = 1097
integer y = 340
integer width = 343
integer height = 100
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancelar"
end type

event clicked;CLOSE (PARENT)
end event

