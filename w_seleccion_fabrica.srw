HA$PBExportHeader$w_seleccion_fabrica.srw
forward
global type w_seleccion_fabrica from w_response
end type
type cb_2 from commandbutton within w_seleccion_fabrica
end type
type cb_1 from commandbutton within w_seleccion_fabrica
end type
type mle_1 from multilineedit within w_seleccion_fabrica
end type
type dw_1 from u_dw_application within w_seleccion_fabrica
end type
type gb_1 from groupbox within w_seleccion_fabrica
end type
end forward

global type w_seleccion_fabrica from w_response
integer width = 1705
integer height = 852
string title = "Selecci$$HEX1$$f300$$ENDHEX$$n de f$$HEX1$$e100$$ENDHEX$$brica"
cb_2 cb_2
cb_1 cb_1
mle_1 mle_1
dw_1 dw_1
gb_1 gb_1
end type
global w_seleccion_fabrica w_seleccion_fabrica

type variables
datawindowChild idc_fabricas
end variables

on w_seleccion_fabrica.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.mle_1=create mle_1
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.mle_1
this.Control[iCurrent+4]=this.dw_1
this.Control[iCurrent+5]=this.gb_1
end on

on w_seleccion_fabrica.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.mle_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 12 de Marzo de 2003 HORA 10:12:16:609
// 
// se muestran las fabricas que tiene autorizado el usuario
//////////////////////////////////////////////////////////////////////////
long ll_tot

dw_1.SetTransObject(n_cst_application.itr_appl)


dw_1.GetChild("co_fabrica",idc_fabricas)

idc_fabricas.SetTransObject(n_cst_application.itr_appl)

ll_tot=idc_fabricas.Retrieve(n_cst_application.is_user)

If ll_tot<=0 Then
	MessageBox("Advertencia!","El ususario no tiene fabricas asignadas.",StopSign!)
	Halt Close
	Return
End If
dw_1.InsertRow(0)
dw_1.SetItem(1,"co_fabrica",idc_fabricas.GetItemNumber(1,"co_fabrica"))



end event

type cb_2 from commandbutton within w_seleccion_fabrica
integer x = 832
integer y = 592
integer width = 361
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_seleccion_fabrica
integer x = 457
integer y = 592
integer width = 361
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;Int    li_fila
String ls_remoto
long ll_fabrica,ll_res


ll_fabrica 	  = dw_1.GetItemNumber(1,"co_fabrica")

ls_remoto = ProfileString(n_cst_application.is_pathfileconf,"remoto",'fabrica'+String(ll_fabrica), "N")

If Trim(ls_remoto) = 'S' Then
	String ls_dbms,ls_database,ls_servername,ls_lock
	
	n_cst_application.ii_fabrica=ll_Fabrica
	
	n_cst_application.is_sessiondbapp="fabrica"+String(ll_fabrica)
	
		//S$$HEX2$$ed002000$$ENDHEX$$todo ha estado bien conectar ahora a la base de datos de la aplicaci$$HEX1$$f300$$ENDHEX$$n
		ls_dbms        = n_cst_application.Of_GetProFile(n_cst_application.is_pathfileconf,n_cst_application.is_sessiondbapp,'DBMS')
		ls_database    = n_cst_application.Of_GetProFile(n_cst_application.is_pathfileconf,n_cst_application.is_sessiondbapp,'DATABASE')
		ls_servername  = n_cst_application.Of_GetProFile(n_cst_application.is_pathfileconf,n_cst_application.is_sessiondbapp,'SERVERNAME')
		ls_lock        = n_cst_application.Of_GetProFile(n_cst_application.is_pathfileconf,n_cst_application.is_sessiondbapp,'LOCK')
		
		
		n_cst_application.itr_appl.of_disconnect()
		
		If n_cst_application.itr_appl.of_ConnectDb(ls_dbms,&
											   ls_database,&
											   n_cst_application.is_user,&
												n_cst_application.is_passwd,&
											   ls_servername,&
											   ls_lock) = 0 Then
			ll_res=1
		Else
			ll_res=-1
		End If		
Else
	MessageBox("Advertencia!","La fabrica seleccionada no esta permitida en estos momentos.",StopSign!)
	Halt Close
	Return
End If

If ll_res = -1 Then 
	MessageBox("Advertencia!","No se pudo conectar a la base de datos.",StopSign!)
	Halt Close
	Return
End If

ClosewithReturn(Parent,"OK")
end event

event getfocus;This.Default=True
end event

event losefocus;This.Default=False
end event

type mle_1 from multilineedit within w_seleccion_fabrica
integer x = 197
integer y = 340
integer width = 1211
integer height = 152
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79017397
string text = "Seleccione la f$$HEX1$$e100$$ENDHEX$$brica con la que va a trabajar en esta sesi$$HEX1$$f300$$ENDHEX$$n"
boolean border = false
boolean displayonly = true
end type

type dw_1 from u_dw_application within w_seleccion_fabrica
integer x = 187
integer y = 156
integer width = 1230
integer height = 124
string dataobject = "d_fabricas_usuario"
boolean vscrollbar = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 12 de Marzo de 2003 HORA 10:39:19:140
// 
// overwrite!
//////////////////////////////////////////////////////////////////////////

end event

type gb_1 from groupbox within w_seleccion_fabrica
integer x = 151
integer y = 60
integer width = 1349
integer height = 492
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "F$$HEX1$$e100$$ENDHEX$$brica"
end type

