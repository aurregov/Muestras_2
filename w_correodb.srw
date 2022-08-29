HA$PBExportHeader$w_correodb.srw
$PBExportComments$Para el manejo de los correos en la base de datos
forward
global type w_correodb from w_sheet
end type
type st_1 from statictext within w_correodb
end type
type dw_2 from u_dw_application within w_correodb
end type
type dw_1 from u_dw_application within w_correodb
end type
type gb_1 from groupbox within w_correodb
end type
type gb_2 from groupbox within w_correodb
end type
end forward

global type w_correodb from w_sheet
integer x = 0
integer y = 300
integer width = 3008
integer height = 1772
string title = "Correos"
st_1 st_1
dw_2 dw_2
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_correodb w_correodb

type variables

end variables

forward prototypes
public function integer of_actualizalectura (long a_cs_correo, string a_usuario_de)
end prototypes

public function integer of_actualizalectura (long a_cs_correo, string a_usuario_de);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 23 de Noviembre de 2002 HORA 15:05:24:218
// 
// Esta funcion actualiza la fecha de lectura de un correo
//////////////////////////////////////////////////////////////////////////

Datetime ldt_fecha
String ls_usuario,ls_instancia

	//Tambien actualizar fecha,usuario,instancia
	If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
													 ldt_fecha,ls_usuario,ls_instancia) Then
		Return -1
	End If

  UPDATE dt_correos  
     SET fe_lectura = :ldt_fecha  
   WHERE ( dt_correos.cs_correo = :a_cs_correo ) AND  
         ( dt_correos.usuario_de = :a_usuario_de )   
          using n_cst_application.itr_appl ;


If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

Commit using n_cst_application.itr_appl ;

Return 1


end function

on w_correodb.create
int iCurrent
call super::create
this.st_1=create st_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.dw_2
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.gb_1
this.Control[iCurrent+5]=this.gb_2
end on

on w_correodb.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_1)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;dw_1.SetTransObject(n_cst_application.itr_appl)
dw_2.SetTransObject(n_cst_application.itr_appl)

dw_1.Retrieve(n_cst_application.is_user)
end event

type st_1 from statictext within w_correodb
integer x = 114
integer y = 864
integer width = 1029
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Haga doble click en el correo para ver detalles"
boolean focusrectangle = false
end type

type dw_2 from u_dw_application within w_correodb
integer x = 55
integer y = 1068
integer width = 2766
integer height = 436
integer taborder = 30
string dataobject = "d_dt_correo"
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_1 from u_dw_application within w_correodb
integer x = 55
integer y = 108
integer width = 2766
integer height = 732
integer taborder = 20
string dataobject = "d_h_correo"
boolean livescroll = false
end type

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 23 de Noviembre de 2002 HORA 15:29:28:484
// 
// Se actualiza la fecha del correo y se muestra ne la parte inferior de la
// ventana
//////////////////////////////////////////////////////////////////////////

long ll_cs_correo,ll_res
string ls_usuario_de
datetime ldt_fe_lectura

If row=0 Then Return

SelectRow(0,false)
SelectRow(row,true)

ll_cs_correo=GetItemNumber(row,"cs_correo")
ls_usuario_de=GetItemString(row,"usuario_de")
ll_res=1

ldt_fe_lectura=GetItemDateTime(1,"fe_lectura")
If IsNull(ldt_fe_lectura) Then
	ll_res=of_actualizaLectura(ll_cs_correo,ls_usuario_De)
End If

If ll_res<>1 Then Return

dw_1.Retrieve(n_cst_application.is_user)

dw_2.Retrieve(ll_cs_correo,ls_usuario_de)


end event

type gb_1 from groupbox within w_correodb
integer x = 27
integer y = 32
integer width = 2843
integer height = 912
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Correos"
borderstyle borderstyle = stylelowered!
end type

type gb_2 from groupbox within w_correodb
integer x = 27
integer y = 976
integer width = 2843
integer height = 540
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle del corro seleccionado"
borderstyle borderstyle = stylelowered!
end type

