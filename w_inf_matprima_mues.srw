HA$PBExportHeader$w_inf_matprima_mues.srw
$PBExportComments$Informe de materia prima para muestras
forward
global type w_inf_matprima_mues from w_report
end type
type dw_1 from u_dw_application within w_inf_matprima_mues
end type
type dw_mp from u_dw_mp_muestra within w_inf_matprima_mues
end type
type gb_1 from groupbox within w_inf_matprima_mues
end type
end forward

global type w_inf_matprima_mues from w_report
integer x = 0
integer y = 0
integer width = 3602
integer height = 1988
string title = "Ficha de materia prima"
windowstate windowstate = maximized!
dw_1 dw_1
dw_mp dw_mp
gb_1 gb_1
end type
global w_inf_matprima_mues w_inf_matprima_mues

type variables
n_cst_param io_param

n_ds_application ids_observacion

long il_fabrica,il_linea,il_muestra,il_talla,il_color,il_opcion,il_centro, il_muestrario, il_diseno
	  
end variables

forward prototypes
public function integer of_reset1 (string a_columna)
public function integer of_datosadicionales (ref string a_peso, ref string a_recurso, ref string a_creacion, ref string a_modificacion)
public function integer of_recuperar ()
end prototypes

public function integer of_reset1 (string a_columna);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 05 de Abril de 2003 HORA 09:56:14:781
// 
// Resetea los valores de las col cuando se cambia un item
//////////////////////////////////////////////////////////////////////////


string 	ls_null
long  	ll_null

SetNull(ls_null)
SetNull(ll_null)

dw_report.Reset()

CHOOSE CASE a_columna
	CASE "co_fabrica"
		dw_1.SetItem(1,"co_linea",ll_null)
		dw_1.SetItem(1,"co_muestra",ll_null)
		dw_1.SetItem(1,"de_muestra",ls_null)
		dw_1.SetItem(1,"co_talla",ll_null)
		dw_1.SetItem(1,"de_talla",ls_null)
		il_linea=-1
		il_muestra=-1
		il_talla=-1
		
	CASE "co_linea"
		//dw_1.SetItem(1,"co_linea",ll_null)
		dw_1.SetItem(1,"co_muestra",ll_null)
		dw_1.SetItem(1,"de_muestra",ls_null)
		dw_1.SetItem(1,"co_talla",ll_null)
		dw_1.SetItem(1,"de_talla",ls_null)
		//il_linea=-1
		il_muestra=-1
		il_talla=-1
		
	CASE "co_muestra"
		//dw_1.SetItem(1,"co_linea",ll_null)
		//dw_1.SetItem(1,"co_referencia",ll_null)
		//dw_1.SetItem(1,"de_referencia",ls_null)
		dw_1.SetItem(1,"co_talla",ll_null)
		dw_1.SetItem(1,"de_talla",ls_null)
		//il_linea=-1
		//il_referencia=-1
		il_talla=-1
		
		
END CHOOSE


Return 1
end function

public function integer of_datosadicionales (ref string a_peso, ref string a_recurso, ref string a_creacion, ref string a_modificacion);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 05 de Abril de 2003 HORA 16:33:37:671
// 
// 
//////////////////////////////////////////////////////////////////////////
long 			ll_recurso,ll_res
string		ls_peso
DateTime 	ldt_creacion,ldt_actualizacion
n_cst_comun	lo_comun


  SELECT h_fmp_muestras.co_recurso,   
         h_fmp_muestras.id_peso,   
         h_fmp_muestras.fe_creacion,   
         h_fmp_muestras.fe_actualizacion  
    INTO :ll_recurso,   
         :ls_peso,   
         :ldt_creacion,   
         :ldt_actualizacion  
    FROM h_fmp_muestras  
   WHERE ( h_fmp_muestras.co_fabrica = :il_fabrica ) AND  
         ( h_fmp_muestras.co_linea = :il_linea ) AND  
         ( h_fmp_muestras.co_muestra = :il_muestra ) AND  
         ( h_fmp_muestras.co_talla = :il_talla ) AND  
         ( h_fmp_muestras.co_color||'x'||h_fmp_muestras.cnt_opcion in (  SELECT min(h_fmp_muestras.co_color||'x'||h_fmp_muestras.cnt_opcion)  
														 FROM h_fmp_muestras  
														WHERE ( h_fmp_muestras.co_fabrica = :il_fabrica ) AND  
																( h_fmp_muestras.co_linea = :il_linea ) AND  
																( h_fmp_muestras.co_muestra = :il_muestra ) AND  
																( h_fmp_muestras.co_talla = :il_talla )															   
																 ))   
using n_cst_application.itr_appl;
													 
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

If n_cst_application.itr_appl.SQLcode=100 Then
	Return -1
End If
				
ll_res=lo_comun.of_nombrerecursotj( ll_recurso,n_cst_application.itr_appl)

If ll_res=1 Then
	a_recurso="("+String(ll_Recurso)+") "+lo_comun.of_getstring(1)
Else
	a_recurso="("+String(ll_Recurso)+") "
End If

a_peso=ls_peso

a_creacion=String(ldt_creacion,"YYYY/MM/DD hh:mm")

a_modificacion=String(ldt_actualizacion,"YYYY/MM/DD hh:mm")


Return 1
end function

public function integer of_recuperar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 25 de Febrero de 2003 HORA 14:37:29:578
// 
// se recupera la informaci$$HEX1$$f300$$ENDHEX$$n
//////////////////////////////////////////////////////////////////////////

long ll_tot,i,ll_parte,ll_grupo,ll_parte1,ll_grupo1,ll_comb,ll_comb1

If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

il_color=dw_1.GetItemNumber(1,"co_color")
il_opcion=dw_1.GetItemNumber(1,"co_opcion")

If IsNull(il_color) or IsNull(il_opcion) Then
	il_color=-1
	il_opcion=-1
End If

dw_mp.of_setFabrica(il_fabrica)
dw_mp.of_setLinea(il_linea)
dw_mp.of_setMuestra(il_muestra)
dw_mp.of_setTalla(il_talla)
dw_mp.of_setColor(il_color)
dw_mp.of_setOpcion(il_opcion)
dw_mp.of_setCentro(il_centro)
dw_mp.of_setdiseno(il_diseno)
dw_mp.of_setmuestrario(il_muestrario)


dw_mp.of_seleccionDw()

dw_mp.of_recuperar()


Return 1
end function

on w_inf_matprima_mues.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.dw_mp=create dw_mp
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.dw_mp
this.Control[iCurrent+3]=this.gb_1
end on

on w_inf_matprima_mues.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_1)
destroy(this.dw_mp)
destroy(this.gb_1)
end on

event open;call super::open;////////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 09 de Junio de 2003 HORA 09:40:29:515
// 
// Se recuperan los datos con los parametros enviados
//////////////////////////////////////////////////////////////////////////
x=1
y=1
long 					ll_res
n_cst_comun    	lo_comun



dw_1.InsertRow(0)

io_param=Message.PowerObjectParm

//////////////////////////////////////////////////////////////////////////
// Se colocan valores por defecto en -1 para que recupere todos los
// registros
//////////////////////////////////////////////////////////////////////////

il_centro=12
il_color=-1
il_opcion=-1

If IsValid(io_param) Then
	il_fabrica=io_param.il_vector[1]
	il_linea=io_param.il_vector[2]
	il_muestra=io_param.il_vector[3]
	il_talla=io_param.il_vector[4]
	il_centro=io_param.il_vector[5]
	il_diseno=io_param.il_vector[6]
	il_muestrario=io_param.il_vector[7]	
	
	dw_1.SetItem(1,"co_fabrica",il_fabrica)
	dw_1.SetItem(1,"co_linea",il_linea)
	dw_1.SetItem(1,"co_muestra",il_muestra)
	dw_1.SetItem(1,"co_talla",il_talla)

	ll_res=lo_comun.of_nombremuestra( il_fabrica,il_linea,il_muestra,&
	                n_cst_application.itr_appl)
	If ll_res<>1 Then
		il_muestra=-1
		MessageBox("Advertencia!","La Muestra no existe.",StopSign!)
		Return 2
	End If
	dw_1.SetItem(1,"de_muestra",lo_comun.of_getString(1))
		
	ll_res=lo_comun.of_nombreMuestraTalla(il_fabrica,il_linea,il_muestra,il_talla,&
	       n_cst_application.itr_appl)
			 
	If ll_res<>1 Then
		il_talla=-1
		MessageBox("Advertencia!","Talla no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
	dw_1.SetItem(1,"de_talla",lo_comun.of_getString(1))	
	
	Post Event ue_find()
End If

dw_report.SetTransObject(n_cst_application.itr_appl)
dw_report.Modify("DataWindow.Print.Preview=Yes")


end event

event resize;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 25 de Febrero de 2003 HORA 14:35:21:468
// 
// OverWrite
//////////////////////////////////////////////////////////////////////////

end event

event ue_find;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 25 de Febrero de 2003 HORA 15:00:09:500
// 
// Para recuperar los datos
//////////////////////////////////////////////////////////////////////////
of_recuperar()
end event

event ue_print;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 05 de Agosto de 2003 HORA 09:11:51:457
// 
// Se ajusta el proceso de impresi$$HEX1$$f300$$ENDHEX$$n
//////////////////////////////////////////////////////////////////////////


dw_mp.event ue_print()
end event

type dw_report from w_report`dw_report within w_inf_matprima_mues
boolean visible = false
integer x = 32
integer y = 364
integer width = 3506
integer height = 1196
integer taborder = 30
string dataobject = "d_rep_matmp_mues"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from u_dw_application within w_inf_matprima_mues
integer x = 64
integer y = 88
integer width = 3351
integer height = 212
boolean bringtotop = true
string dataobject = "d_ext_mp_mues"
boolean vscrollbar = false
boolean livescroll = false
end type

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 05 de Abril de 2003 HORA 10:46:11:687
// 
// 
//////////////////////////////////////////////////////////////////////////
n_cst_comun lo_comun
long ll_res
If dwo.name="co_fabrica" Then
	il_fabrica=long(Data)
	of_reset1(dwo.name)
End If

If dwo.name="co_linea" Then
	il_linea=Long(Data)
	of_reset1(dwo.name)
End If

If dwo.name="co_muestra" Then
	il_muestra=Long(Data)
	ll_res=lo_comun.of_nombreMuestra( il_fabrica,il_linea,il_muestra,&
	                n_cst_application.itr_appl)
	If ll_res<>1 Then
		il_muestra=-1
		MessageBox("Advertencia!","La Muestra no existe.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_muestra",lo_comun.of_getString(1))

	of_reset1(dwo.name)
End If

If dwo.name="co_talla" Then
	il_talla=long(data)
	ll_res=lo_comun.of_nombreMuestraTalla(il_fabrica,il_linea,il_muestra,il_talla,&
	       n_cst_application.itr_appl)
			 
	If ll_res<>1 Then
		il_talla=-1
		MessageBox("Advertencia!","Talla no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_talla",lo_comun.of_getString(1))

	of_reset1(dwo.name)

End If

		
			 


end event

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 05 de Abril de 2003 HORA 12:27:06:046
// 
// 
//////////////////////////////////////////////////////////////////////////

n_cst_param lo_param

If dwo.name="co_talla" Then
	lo_param.il_vector[1]=il_fabrica
	lo_param.il_vector[2]=il_linea
	lo_param.il_vector[3]=il_muestra

	OpenWithParm(w_bus_tallas_muestra,lo_param)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If
End If



end event

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 12 de Abril de 2003 HORA 09:26:43:906
// 
// 
//////////////////////////////////////////////////////////////////////////

end event

type dw_mp from u_dw_mp_muestra within w_inf_matprima_mues
integer x = 37
integer y = 372
integer width = 3401
integer height = 1348
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_rep_matmp_mues"
boolean hscrollbar = true
end type

type gb_1 from groupbox within w_inf_matprima_mues
integer x = 23
integer y = 32
integer width = 3429
integer height = 284
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Muestra"
end type

