HA$PBExportHeader$w_inf_matprima.srw
$PBExportComments$Faca la ficha de materia prima
forward
global type w_inf_matprima from w_report
end type
type dw_1 from u_dw_application within w_inf_matprima
end type
type gb_1 from groupbox within w_inf_matprima
end type
end forward

global type w_inf_matprima from w_report
integer x = 0
integer y = 0
integer width = 3707
integer height = 1780
string title = "Ficha de materia prima"
windowstate windowstate = maximized!
dw_1 dw_1
gb_1 gb_1
end type
global w_inf_matprima w_inf_matprima

type variables
n_cst_param io_param

n_ds_application ids_observacion

long il_fabrica,il_linea,il_referencia,il_talla,il_calidad,&
     il_diseno,il_color,il_muestrario,il_centro
	  
end variables

forward prototypes
public function integer of_diseno ()
public function integer of_reset1 (string a_columna)
public function string of_observacion ()
public function integer of_datosadicionales (ref string a_peso, ref string a_recurso, ref string a_creacion, ref string a_modificacion)
public function integer of_recuperar ()
public function long of_muestrario ()
end prototypes

public function integer of_diseno ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 09 de Abril de 2003 HORA 09:33:07:843
// 
// Verifica si existe un solo dise$$HEX1$$f100$$ENDHEX$$o y lo coloca por defecto
//////////////////////////////////////////////////////////////////////////


long ll_tot,ll_res

n_ds_application lds_1

lds_1=create n_ds_application

lds_1.DataObject="d_listains_m_disenos"

lds_1.SetTransObject(n_cst_application.itr_appl)

ll_tot=lds_1.Retrieve(il_fabrica,il_linea,il_referencia,il_talla,il_calidad)

If ll_tot=1 Then
	ll_res=lds_1.GetItemNumber(1,"co_diseno")
Else
	ll_res=-1
End If

Destroy lds_1

Return ll_res
end function

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
		dw_1.SetItem(1,"co_referencia",ll_null)
		dw_1.SetItem(1,"de_referencia",ls_null)
		dw_1.SetItem(1,"co_talla",ll_null)
		dw_1.SetItem(1,"de_talla",ls_null)
		dw_1.SetItem(1,"co_calidad",1)
		dw_1.SetItem(1,"co_muestrario",ll_null)
		dw_1.SetItem(1,"de_muestrario",ls_null)
		dw_1.SetItem(1,"co_diseno",ll_null)
		dw_1.SetItem(1,"de_diseno",ls_null)
		il_linea=-1
		il_referencia=-1
		il_talla=-1
		il_diseno=-1
		il_muestrario=-1
		
	CASE "co_linea"
		//dw_1.SetItem(1,"co_linea",ll_null)
		dw_1.SetItem(1,"co_referencia",ll_null)
		dw_1.SetItem(1,"de_referencia",ls_null)
		dw_1.SetItem(1,"co_talla",ll_null)
		dw_1.SetItem(1,"de_talla",ls_null)
		dw_1.SetItem(1,"co_calidad",1)
		dw_1.SetItem(1,"co_muestrario",ll_null)
		dw_1.SetItem(1,"de_muestrario",ls_null)
		dw_1.SetItem(1,"co_diseno",ll_null)
		dw_1.SetItem(1,"de_diseno",ls_null)		
		//il_linea=-1
		il_referencia=-1
		il_talla=-1
		il_diseno=-1
		il_muestrario=-1		
		
	CASE "co_referencia"
		//dw_1.SetItem(1,"co_linea",ll_null)
		//dw_1.SetItem(1,"co_referencia",ll_null)
		//dw_1.SetItem(1,"de_referencia",ls_null)
		dw_1.SetItem(1,"co_talla",ll_null)
		dw_1.SetItem(1,"de_talla",ls_null)
		dw_1.SetItem(1,"co_calidad",1)
		dw_1.SetItem(1,"co_muestrario",ll_null)
		dw_1.SetItem(1,"de_muestrario",ls_null)
		dw_1.SetItem(1,"co_diseno",ll_null)
		dw_1.SetItem(1,"de_diseno",ls_null)
		//il_linea=-1
		//il_referencia=-1
		il_talla=-1
		il_diseno=-1
		il_muestrario=-1		
	CASE "co_talla"
//		dw_1.SetItem(1,"co_linea",ll_null)
//		dw_1.SetItem(1,"co_referencia",ll_null)
//		dw_1.SetItem(1,"de_referencia",ls_null)
//		dw_1.SetItem(1,"co_talla",ll_null)
//		dw_1.SetItem(1,"de_talla",ls_null)
		dw_1.SetItem(1,"co_calidad",1)
//		dw_1.SetItem(1,"co_muestrario",ll_null)
//		dw_1.SetItem(1,"de_muestrario",ls_null)
		dw_1.SetItem(1,"co_diseno",ll_null)
		dw_1.SetItem(1,"de_diseno",ls_null)		
		//il_linea=-1
		//il_referencia=-1
		//il_talla=-1
		il_diseno=-1
		//il_muestrario=-1
	CASE "co_calidad"
//		dw_1.SetItem(1,"co_linea",ll_null)
//		dw_1.SetItem(1,"co_referencia",ll_null)
//		dw_1.SetItem(1,"de_referencia",ls_null)
//		dw_1.SetItem(1,"co_talla",ll_null)
//		dw_1.SetItem(1,"de_talla",ls_null)
//		dw_1.SetItem(1,"co_calidad",1)
//		dw_1.SetItem(1,"co_muestrario",ll_null)
//		dw_1.SetItem(1,"de_muestrario",ls_null)
		dw_1.SetItem(1,"co_diseno",ll_null)
		dw_1.SetItem(1,"de_diseno",ls_null)		
		
		
END CHOOSE


Return 1
end function

public function string of_observacion ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 03 de Abril de 2003 HORA 14:13:56:359
// 
// Funcion para armar es string de las observaciones
//////////////////////////////////////////////////////////////////////////

long ll_tot
ll_tot=ids_observacion.Retrieve(il_fabrica,&
                                il_linea,&
										  il_referencia,&
										  il_talla,&
										  il_calidad,&
										  il_diseno,&
										  il_muestrario)

String ls_observacion,ls_tmp
long i
If ll_tot>0 Then
	ls_observacion=ids_observacion.GetItemString(1,"obs_fmp")
End If

For i=1 to 4
	ls_tmp+=Trim(mid(ls_observacion,70 * (i -1)+1,70))+"~n"
Next


Return ls_tmp

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


  SELECT h_fmp.co_recurso,   
         h_fmp.id_peso,   
         h_fmp.fe_creacion,   
         h_fmp.fe_actualizacion  
    INTO :ll_recurso,   
         :ls_peso,   
         :ldt_creacion,   
         :ldt_actualizacion  
    FROM h_fmp  
   WHERE ( h_fmp.co_fabrica = :il_fabrica ) AND  
         ( h_fmp.co_linea = :il_linea ) AND  
         ( h_fmp.co_referencia = :il_referencia ) AND  
         ( h_fmp.co_talla = :il_talla ) AND  
         ( h_fmp.co_calidad = :il_calidad ) AND  
			( h_fmp.co_diseno = :il_diseno ) AND  
         ( h_fmp.co_muestrario = :il_muestrario ) AND  
         ( h_fmp.co_color in (  SELECT min(h_fmp.co_color)  
                                  FROM h_fmp  
                                 WHERE ( h_fmp.co_fabrica = :il_fabrica ) AND  
                                       ( h_fmp.co_linea = :il_linea ) AND  
                                       ( h_fmp.co_referencia = :il_referencia ) AND  
                                       ( h_fmp.co_talla = :il_talla ) AND  
                                       ( h_fmp.co_calidad = :il_calidad ) AND  
                                       ( h_fmp.co_diseno = :il_diseno ) AND  
                                       ( h_fmp.co_muestrario = :il_muestrario )   
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

long ll_color=-1,ll_tot,i,ll_parte,ll_grupo,ll_parte1,ll_grupo1,ll_comb,ll_comb1

If dw_1.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

ll_color=dw_1.GetItemNUmber(1,"co_color")

If IsNull(ll_color) Then
	ll_color=-1
End If

ll_tot=dw_report.Retrieve(il_fabrica,&
              il_linea,&
				  il_referencia,&
				  il_talla,&
				  il_calidad,&
				  il_diseno,&
				  ll_color,&
				  il_muestrario,&
				  il_centro)

//////////////////////////////////////////////////////////////////////////
// Libero la transaccion
// 
//////////////////////////////////////////////////////////////////////////
RollBack using n_cst_application.itr_appl;

If ll_tot<0 Then
	Return -1
End If
//////////////////////////////////////////////////////////////////////////
// Coloco si es o no visible el campo inicialmente todos son visibles
// y si es parte no respite, si es combinacion si
//////////////////////////////////////////////////////////////////////////
for i=1 To ll_tot
	ll_parte=dw_report.GetItemNUmber(i,"co_partemp")
	If ll_parte=999 Then
		If i>1 Then
			ll_comb=dw_report.GetItemNUmber(i ,"co_combinacion")
			ll_comb1=dw_report.GetItemNUmber(i -1,"co_combinacion")
			ll_grupo=dw_report.GetItemNUmber(i,"grupo")
			ll_grupo1=dw_report.GetItemNUmber(i -1,"grupo")
			
			If ll_grupo=ll_grupo1 and ll_comb=ll_comb1 Then
				dw_report.SetItem(i,"vis",0)
			Else
				dw_report.SetItem(i,"vis",1)
			End If
		Else
			dw_report.SetItem(i,"vis",1)
	   End If
		
	Else
		If i>1 Then
			ll_parte1=dw_report.GetItemNUmber(i -1,"co_partemp")
			ll_grupo=dw_report.GetItemNUmber(i,"grupo")
			ll_grupo1=dw_report.GetItemNUmber(i -1,"grupo")
			
			If ll_grupo=ll_grupo1 and ll_parte=ll_parte1 Then
				dw_report.SetItem(i,"vis",0)
			Else
				dw_report.SetItem(i,"vis",1)
			End If
		Else
			dw_report.SetItem(i,"vis",1)
	   End If
		
	End If
Next


//////////////////////////////////////////////////////////////////////////
// Coloco la descripci$$HEX1$$f300$$ENDHEX$$n de la referencia y la fecha del sistema
// 
//////////////////////////////////////////////////////////////////////////
datetime ldt_fecha
string ls_usuario,ls_instancia
//Tambien actualizar fecha,usuario,instancia
If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If

dw_report.Modify("fecha.text='"+String(ldt_fecha,"YYYY/MM/DD hh:mm")+"'")
dw_report.Modify("usuario.text='"+ls_usuario+"'")
dw_report.Modify("muestrario.text='("+String(il_muestrario)+") "+&
                 dw_1.GetItemString(1,"de_muestrario")+"'")
dw_report.Modify("diseno.text='("+String(il_diseno)+") "+&
                 dw_1.GetItemString(1,"de_diseno")+"'")

dw_report.Modify("talla.text='("+String(il_talla)+") "+&
                 dw_1.GetItemString(1,"de_talla")+"'")

dw_report.Modify("de_referencia.text='"+&
                 dw_1.GetItemString(1,"de_referencia")+"'")
					  

//////////////////////////////////////////////////////////////////////////
// Selecciono datos adicionales para el informe
// peso, recurso, fecha creacion y modificacion
//////////////////////////////////////////////////////////////////////////
String ls_peso,ls_recurso,ls_modificacion,ls_creacion

If of_datosAdicionales(ls_peso,ls_recurso,ls_creacion,ls_modificacion)=1 Then
	dw_report.Modify("peso.text='"+ls_peso+"'")
	dw_report.Modify("recurso.text='"+ls_recurso+"'")
	dw_report.Modify("creacion.text='"+ls_creacion+"'")
	dw_report.Modify("modificacion.text='"+ls_modificacion+"'")
Else
	dw_report.Modify("peso.text=''")
	dw_report.Modify("recurso.text=''")
	dw_report.Modify("creacion.text=''")
	dw_report.Modify("modificacion.text=''")
	
End If
//////////////////////////////////////////////////////////////////////////
// Se colocan las observaciones
// 
//////////////////////////////////////////////////////////////////////////

dw_report.Modify("observaciones.text='"+of_observacion()+"'")

Return 1
end function

public function long of_muestrario ();long ll_muestrario

  SELECT max(dt_fmp.co_muestrario)  
    INTO :ll_muestrario  
    FROM dt_fmp  
   WHERE ( dt_fmp.co_fabrica = :il_fabrica ) AND  
         ( dt_fmp.co_linea = :il_linea ) AND  
         ( dt_fmp.co_referencia = :il_referencia ) AND  
         ( dt_fmp.co_talla = :il_talla ) AND  
         ( dt_fmp.co_calidad = :il_calidad ) and
			( dt_fmp.co_diseno = :il_diseno )
		using	n_cst_application.itr_appl;
			
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If
			
If n_cst_application.itr_appl.SQLcode=100 Then 
	Return -1
End If

dw_1.SetItem(1,"co_muestrario",ll_muestrario)

n_cst_comun lo_comun
long ll_res

ll_res=lo_comun.of_nombreMuestrario(il_fabrica,il_linea,ll_muestrario,&
       n_cst_application.itr_appl)
		 
If ll_res=1 Then
	dw_1.SetItem(1,"de_muestrario",lo_comun.of_getString(1))
End If

Return ll_muestrario
			
			
Return 1			


end function

on w_inf_matprima.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.gb_1
end on

on w_inf_matprima.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Domingo 23 de Febrero de 2003 HORA 14:24:54:000
// 
// Se recuperan los datos con los parametros enviados
//////////////////////////////////////////////////////////////////////////
x=1
y=1
long 					ll_res
n_cst_comun    	lo_comun


il_calidad=1
dw_1.InsertRow(0)

io_param=Message.PowerObjectParm
il_centro=12

If IsValid(io_param) Then
	If UpperBound(io_param.il_vector)>=8 Then
		il_fabrica=io_param.il_vector[1]
		il_linea=io_param.il_vector[2]
		il_referencia=io_param.il_vector[3]
		il_talla=io_param.il_vector[4]
		il_calidad=io_param.il_vector[5]
		il_diseno=io_param.il_vector[6]
		il_muestrario=io_param.il_vector[7]
		il_centro=io_param.il_vector[8]
		
		dw_1.SetItem(1,"co_fabrica",il_fabrica)
		dw_1.SetItem(1,"co_linea",il_linea)
		dw_1.SetItem(1,"co_referencia",il_referencia)
		dw_1.SetItem(1,"co_talla",il_talla)
		dw_1.SetItem(1,"co_calidad",il_calidad)
		dw_1.SetItem(1,"co_diseno",il_diseno)
		dw_1.SetItem(1,"co_muestrario",il_muestrario)
		
		ll_res=lo_comun.of_nombrereferencia( il_fabrica,il_linea,il_referencia,&
							 n_cst_application.itr_appl)
		If ll_res<>1 Then
			il_referencia=-1
			MessageBox("Advertencia!","La referencia no existe.",StopSign!)
			Return 2
		End If
		dw_1.SetItem(1,"de_referencia",lo_comun.of_getString(1))
			
		ll_res=lo_comun.of_nombrereferenciatalla(il_fabrica,il_linea,il_referencia,il_talla,&
				 il_calidad,n_cst_application.itr_appl)
				 
		If ll_res<>1 Then
			il_talla=-1
			MessageBox("Advertencia!","Talla no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
			Return 2
		End If
		dw_1.SetItem(1,"de_talla",lo_comun.of_getString(1))	
		
		
		ll_res=lo_comun.of_nombrediseno( il_fabrica,il_linea,il_referencia,il_talla,&
		il_calidad,il_diseno,n_cst_application.itr_appl)
				 
		If ll_res<>1 Then
			il_diseno=-1
			MessageBox("Advertencia!","Disen$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
			Return 2
		End If
		dw_1.SetItem(1,"de_diseno",lo_comun.of_getString(1))
			
		ll_res=lo_comun.of_nombremuestrario( il_fabrica,il_linea,&
				 il_muestrario,n_cst_application.itr_appl)
		If ll_res<>1 Then
			il_diseno=-1
			MessageBox("Advertencia!","Muestrario no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
			Return 2
		End If
		dw_1.SetItem(1,"de_muestrario",lo_comun.of_getString(1))
		Post Event ue_find()
	End If
End If

dw_report.SetTransObject(n_cst_application.itr_appl)
dw_report.Modify("DataWindow.Print.Preview=Yes")

//rb_col1.text="Color "+String(io_param.il_vector[7])

of_setDatawindow(dw_report)



ids_observacion=create n_ds_application

ids_observacion.DataObject="d_dt_fmp_observacion"

ids_observacion.SetTransObject(n_cst_application.itr_appl)

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

event closequery;call super::closequery;Destroy ids_observacion
end event

type dw_report from w_report`dw_report within w_inf_matprima
integer x = 37
integer y = 364
integer width = 3584
integer height = 1196
integer taborder = 30
string dataobject = "d_rep_matmp_ref"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from u_dw_application within w_inf_matprima
integer x = 64
integer y = 88
integer width = 3543
integer height = 212
boolean bringtotop = true
string dataobject = "d_ext_mp_rep"
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

If dwo.name="co_referencia" Then
	il_referencia=Long(Data)
	ll_res=lo_comun.of_nombrereferencia( il_fabrica,il_linea,il_referencia,&
	                n_cst_application.itr_appl)
	If ll_res<>1 Then
		il_referencia=-1
		MessageBox("Advertencia!","La referencia no existe.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_referencia",lo_comun.of_getString(1))

	of_reset1(dwo.name)
End If

If dwo.name="co_talla" Then
	il_talla=long(data)
	ll_res=lo_comun.of_nombrereferenciatalla(il_fabrica,il_linea,il_referencia,il_talla,&
	       il_calidad,n_cst_application.itr_appl)
			 
	If ll_res<>1 Then
		il_talla=-1
		MessageBox("Advertencia!","Talla no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_talla",lo_comun.of_getString(1))

	of_reset1(dwo.name)

//////////////////////////////////////////////////////////////////////////
// Verifico si la ref tiene un solo dise$$HEX1$$f100$$ENDHEX$$o y lo coloco, que es lo usual
// 
//////////////////////////////////////////////////////////////////////////
	ll_res=of_diseno()
	If ll_res<>-1 Then
		il_diseno=ll_res
		ll_res=lo_comun.of_nombrediseno( il_fabrica,il_linea,il_referencia,il_talla,&
			il_calidad,il_diseno,n_cst_application.itr_appl)
				 
		If ll_res=1 Then
			SetItem(row,"co_diseno",il_diseno)
			SetItem(row,"de_diseno",lo_comun.of_getString(1))
		End If
	End If
//////////////////////////////////////////////////////////////////////////
// Cuando se digita esto, se determina el muestrario como el maximo
// en dt_ref_x_col, claro que se puede cambiar
//////////////////////////////////////////////////////////////////////////
	ll_res=of_muestrario()
	If ll_res<>-1 Then
		il_muestrario=ll_res
	End If


End If

If dwo.name="co_calidad" Then
	il_calidad=Long(Data)
//////////////////////////////////////////////////////////////////////////
// Verifico si la ref tiene un solo dise$$HEX1$$f100$$ENDHEX$$o y lo coloco, que es lo usual
// 
//////////////////////////////////////////////////////////////////////////
	ll_res=of_diseno()
	If ll_res<>-1 Then
		il_diseno=ll_res
		ll_res=lo_comun.of_nombrediseno( il_fabrica,il_linea,il_referencia,il_talla,&
			il_calidad,il_diseno,n_cst_application.itr_appl)
				 
		If ll_res=1 Then
			SetItem(row,"co_diseno",il_diseno)
			SetItem(row,"de_diseno",lo_comun.of_getString(1))
		End If
	End If
	
//////////////////////////////////////////////////////////////////////////
// Cuando se digita esto, se determina el muestrario como el maximo
// en dt_ref_x_col, claro que se puede cambiar
//////////////////////////////////////////////////////////////////////////
	ll_res=of_muestrario()
	If ll_res<>-1 Then
		il_muestrario=ll_res
	End If
	
	
End If

If dwo.name="co_diseno" Then
	il_diseno=long(data)
	ll_res=lo_comun.of_nombrediseno( il_fabrica,il_linea,il_referencia,il_talla,&
	il_calidad,il_diseno,n_cst_application.itr_appl)
			 
	If ll_res<>1 Then
		il_diseno=-1
		MessageBox("Advertencia!","Disen$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_diseno",lo_comun.of_getString(1))

	of_reset1(dwo.name)
	
	ll_res=of_muestrario()
	If ll_res<>-1 Then
		il_muestrario=ll_res
	End If
		
		
End If

If dwo.name="co_muestrario" Then
	il_muestrario=Long(Data)
	ll_res=lo_comun.of_nombremuestrario( il_fabrica,il_linea,&
	       il_muestrario,n_cst_application.itr_appl)
	If ll_res<>1 Then
		il_diseno=-1
		MessageBox("Advertencia!","Muestrario no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_muestrario",lo_comun.of_getString(1))

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
	lo_param.il_vector[3]=il_referencia
	lo_param.il_vector[4]=il_calidad

	OpenWithParm(w_bus_tallas_referencia,lo_param)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If
End If


If dwo.name="co_diseno" Then
	
	lo_param.il_vector[1]=il_fabrica
	lo_param.il_vector[2]=il_linea
	lo_param.il_vector[3]=il_referencia
	lo_param.il_vector[4]=il_talla
	lo_param.il_vector[5]=il_calidad
	
	OpenWithParm(w_diseno,lo_param)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If
End If

If dwo.name="co_muestrario" Then
	
	lo_param.il_vector[1]=il_fabrica
	lo_param.il_vector[2]=il_linea
	lo_param.il_vector[3]=0
	
	OpenWithParm(w_bus_m_muestrarios,lo_param)
	
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

type gb_1 from groupbox within w_inf_matprima
integer x = 27
integer y = 32
integer width = 3593
integer height = 284
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Referencia"
end type

