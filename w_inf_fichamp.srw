HA$PBExportHeader$w_inf_fichamp.srw
$PBExportComments$Faca la ficha de materia prima
forward
global type w_inf_fichamp from w_report
end type
type dw_1 from u_dw_application within w_inf_fichamp
end type
type gb_1 from groupbox within w_inf_fichamp
end type
end forward

global type w_inf_fichamp from w_report
integer x = 0
integer y = 0
integer width = 3685
integer height = 2680
string title = "Ficha de materia prima"
windowstate windowstate = maximized!
dw_1 dw_1
gb_1 gb_1
end type
global w_inf_fichamp w_inf_fichamp

type variables
n_cst_param io_param

n_ds_application ids_observacion

long il_fabrica,il_linea,il_referencia,il_talla,il_calidad,&
     il_diseno,il_color,il_muestrario,il_centro, il_muestra,&
	  il_tipoprod , il_fabrica_ref, il_linea_ref
	  
Long il_co_tela
String is_de_tela
	  
end variables

forward prototypes
public function integer of_diseno ()
public function integer of_reset1 (string a_columna)
public function string of_observacion ()
public function integer of_recuperar ()
public function long of_muestrario ()
public function integer of_datosadicionales (ref string a_peso, ref string a_recurso, ref string a_creacion, ref string a_modificacion)
public function integer of_datosadicionalesmues (ref string a_recurso, ref string a_creacion, ref string a_modificacion, ref string a_de_muestra, ref string a_cliente, ref string a_tipo_tejido, ref string a_desarrollador, ref string a_recurso_rest)
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

lds_1.DataObject="d_listains_m_disenos_muestras"

lds_1.SetTransObject(n_cst_application.itr_appl)

ll_tot=lds_1.Retrieve(il_fabrica,il_linea,il_muestra,il_talla)

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
		dw_1.SetItem(1,"co_muestra",ll_null)
		dw_1.SetItem(1,"co_referencia",ll_null)
		dw_1.SetItem(1,"de_referencia",ls_null)
		dw_1.SetItem(1,"co_talla",ll_null)
		dw_1.SetItem(1,"de_talla",ls_null)
		dw_1.SetItem(1,"co_muestrario",ll_null)
		dw_1.SetItem(1,"de_muestrario",ls_null)
		dw_1.SetItem(1,"co_diseno",ll_null)
		dw_1.SetItem(1,"de_diseno",ls_null)
		il_linea=-1
		il_muestra=-1
		il_talla=-1
		il_diseno=-1
		il_muestrario=-1
		il_referencia=-1
		
	CASE "co_linea"
		//dw_1.SetItem(1,"co_linea",ll_null)
		dw_1.SetItem(1,"co_muestra",ll_null)
		dw_1.SetItem(1,"co_referencia",ll_null)
		dw_1.SetItem(1,"de_referencia",ls_null)
		dw_1.SetItem(1,"co_talla",ll_null)
		dw_1.SetItem(1,"de_talla",ls_null)
		dw_1.SetItem(1,"co_muestrario",ll_null)
		dw_1.SetItem(1,"de_muestrario",ls_null)
		dw_1.SetItem(1,"co_diseno",ll_null)
		dw_1.SetItem(1,"de_diseno",ls_null)		
		//il_linea=-1
		il_muestra=-1
		il_talla=-1
		il_diseno=-1
		il_muestrario=-1	
		il_referencia=1
		
	CASE "co_muestra"
//		dw_1.SetItem(1,"co_talla",ll_null)
//		dw_1.SetItem(1,"co_referencia",ll_null)
//		dw_1.SetItem(1,"de_talla",ls_null)
//		dw_1.SetItem(1,"co_muestrario",ll_null)
//		dw_1.SetItem(1,"de_muestrario",ls_null)
//		dw_1.SetItem(1,"co_diseno",ll_null)
//		dw_1.SetItem(1,"de_diseno",ls_null)
//		il_talla=-1
//		il_diseno=-1
//		il_muestrario=-1	
//		il_referencia=-1
		
//	CASE "co_talla"
//		dw_1.SetItem(1,"co_diseno",ll_null)
//		dw_1.SetItem(1,"de_diseno",ls_null)		
//		il_diseno=-1
//
		
	CASE "co_referencia"
		dw_1.SetItem(1,"co_talla",ll_null)
		dw_1.SetItem(1,"de_talla",ls_null)
		dw_1.SetItem(1,"co_muestrario",ll_null)
		dw_1.SetItem(1,"de_muestrario",ls_null)
		dw_1.SetItem(1,"co_diseno",ll_null)
		dw_1.SetItem(1,"de_diseno",ls_null)
		il_talla=-1
		il_diseno=-1
		il_referencia=-1
		
		
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
										  il_muestra,&
										  il_talla,&
										  il_muestrario,&
										  il_diseno)

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

public function integer of_recuperar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 25 de Febrero de 2003 HORA 14:37:29:578
// 
// se recupera la informaci$$HEX1$$f300$$ENDHEX$$n
//////////////////////////////////////////////////////////////////////////

long ll_color=-1,ll_tot,i,ll_parte,ll_grupo,ll_parte1,ll_grupo1,ll_comb,ll_comb1
Long ll_return

n_cst_comun  lo_comun
String ls_tipoprod, ls_nombresilueta, ls_ruta, ls_nombrefoto , ls_obs

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
				  il_muestra,&
				  il_talla,&
				  il_diseno,&
				  ll_color,&
				  il_muestrario,&
				  il_centro,&
				  il_tipoprod)

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
/*
* Se quita esta parte que no se debe hacer.
*/
//for i=1 To ll_tot
//	ll_parte=dw_report.GetItemNUmber(i,"co_partemp")
//	If ll_parte=999 Then
//		If i>1 Then
//			ll_comb=dw_report.GetItemNUmber(i ,"co_combinacion")
//			ll_comb1=dw_report.GetItemNUmber(i -1,"co_combinacion")
//			ll_grupo=dw_report.GetItemNUmber(i,"grupo")
//			ll_grupo1=dw_report.GetItemNUmber(i -1,"grupo")
//			
//			If ll_grupo=ll_grupo1 and ll_comb=ll_comb1 Then
//				dw_report.SetItem(i,"vis",0)
//			Else
//				dw_report.SetItem(i,"vis",1)
//			End If
//		Else
//			dw_report.SetItem(i,"vis",1)
//	   End If
//		
//	Else
//		If i>1 Then
//			ll_parte1=dw_report.GetItemNUmber(i -1,"co_partemp")
//			ll_grupo=dw_report.GetItemNUmber(i,"grupo")
//			ll_grupo1=dw_report.GetItemNUmber(i -1,"grupo")
//			
//			If ll_grupo=ll_grupo1 and ll_parte=ll_parte1 Then
//				dw_report.SetItem(i,"vis",0)
//			Else
//				dw_report.SetItem(i,"vis",1)
//			End If
//		Else
//			dw_report.SetItem(i,"vis",1)
//	   End If
//		
//	End If
//Next
//

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
                 Trim(dw_1.GetItemString(1,"de_talla"))+"'")

dw_report.Modify("de_referencia.text='"+&
                 dw_1.GetItemString(1,"de_referencia")+"'")
					  
// FACL - 2019/01/22 - SA59582  - Se agrega el codigo de la Tela
IF il_co_tela > 0 Then
	dw_report.Modify("tela.text='"+ String( il_co_tela ) +"'")
	dw_report.Modify("t_tela.visible='1'")
Else
	dw_report.Modify("tela.text=''")
	dw_report.Modify("t_tela.visible='0'")
End If	

//////////////////////////////////////////////////////////////////////////
// Selecciono datos adicionales para el informe
// peso, recurso, fecha creacion y modificacion
//////////////////////////////////////////////////////////////////////////
String ls_peso,ls_recurso,ls_modificacion,ls_creacion
String ls_de_muestra,ls_cliente, ls_de_tejido, ls_desarrollador
String ls_recurso_mues, ls_recurso_rest

If of_datosAdicionalesMues(ls_recurso, ls_creacion,ls_modificacion, ls_de_muestra, ls_cliente, ls_de_tejido,&
                           ls_desarrollador, ls_recurso_rest)=1 Then
	dw_report.Modify("recurso.text='"+ls_recurso+"'")
	dw_report.Modify("creacion.text='"+ls_creacion+"'")
	dw_report.Modify("modificacion.text='"+ls_modificacion+"'")
	dw_report.Modify("de_muestra.text='"+ls_de_muestra+"'")
	dw_report.Modify("cliente.text='"+ls_cliente+"'")
	dw_report.Modify("de_tejido.text='"+ls_de_tejido+"'")
	dw_report.Modify("desarrollador.text='"+ls_desarrollador+"'")
	dw_report.Modify("recurso_rest.text='"+ls_recurso_rest+"'")
	dw_report.Modify("co_referencia.Expression='"+String(il_referencia)+"'")	
	
Else
	dw_report.Modify("recurso.text=''")
	dw_report.Modify("creacion.text=''")
	dw_report.Modify("modificacion.text=''")
	dw_report.Modify("de_muestra.text=''")
	dw_report.Modify("cliente.text=''")
	dw_report.Modify("de_tejido.text=''")
	dw_report.Modify("desarrollador.text=''")
	dw_report.Modify("recurso_rest.text=''")
	dw_report.Modify("co_referencia.text=''")

End If

IF il_referencia = 0 THEN
	dw_report.Modify("referencia.text='No Asignada'")
ELSE
	dw_report.Modify("referencia.text='"+String(il_fabrica_ref )+"-"&
													+String(il_linea_ref )+"-"+&
                 								+String(il_referencia)+"'")
END IF
//////////////////////////////////////////////////////////////////////////
// Se colocan las observaciones
// 
//////////////////////////////////////////////////////////////////////////
DataWindowChild ldwc_child
dw_report.GetChild('dw_enc', ldwc_child)
ls_obs = of_observacion()
String ls1
ls1 = ldwc_child.Modify("observaciones.text='"+ls_obs+"'")

// Esta funcion trae el nombre de la silueta que se arma asi:
// "med_tip"+tipo_grafico+"_med"+tipo_medida+".bmp"
// No se pone ruta pues se asume que est$$HEX1$$e100$$ENDHEX$$n en la raiz de la aplicacion
ll_return = lo_comun.of_nombresilueta( il_fabrica, il_linea, il_muestra, n_cst_application.itr_appl)
IF (ll_return = -1) THEN
	RETURN -1
ELSEIF (ll_return = 1) THEN
	ls_nombresilueta = Trim(lo_comun.of_getstring(1))
END IF

// Esta duncion devuelve el tipo de producto de la muestra
ll_return = lo_comun.of_tipoprodmuestra( il_fabrica, il_linea, il_muestra, n_cst_application.itr_appl)
IF (ll_return = -1) THEN
	RETURN -1
ELSEIF (ll_return = 1) THEN
	ls_tipoprod = Trim(lo_comun.of_getstring(1))
END IF

IF il_fabrica = 4 THEN
	ll_return=lo_comun.of_nombrefabrica(2 /*long a_fabrica*/,&
                                 n_cst_application.itr_appl/*transaction a_transaction */)
ELSE
	ll_return=lo_comun.of_nombrefabrica(il_fabrica /*long a_fabrica*/,&
                                 n_cst_application.itr_appl/*transaction a_transaction */)
END IF

If ll_return=1 Then
	dw_report.Modify("fabrica.text='"+lo_comun.of_getString(1)+"'")
End If



// Esta funcion devuelve el valor de la constante FOTOS+<tipoprod> 
// en ella est$$HEX2$$e1002000$$ENDHEX$$contenida la ruta de donde se toma las fotos de 
// las muestras
ll_return = lo_comun.of_valorconstante( 'FOTOS'+ls_tipoprod , n_cst_application.itr_appl)
	
IF (ll_return = -1) THEN
	RETURN -1
ELSEIF (ll_return = 1) THEN
	ls_ruta = Trim(lo_comun.of_getstring(1))
	ls_nombrefoto = 'm_'+String(il_muestra)+'.jpg'
   IF Right(ls_ruta, 1) <> '\' THEN ls_ruta  = ls_ruta+"\"
END IF
// PARA PRUEBAS ls_ruta = ''
IF FileExists(ls_ruta+ls_nombrefoto) THEN
	// Si NO existe la silueta se configura la foto como la imagen de la muestra
	ldwc_child.Modify("p_foto.Filename='"+ls_ruta+ls_nombrefoto+"'")
ELSEIF FileExists(ls_nombresilueta) THEN
 	// Si existe la silueta se configura como la imagen de la muestra
	ldwc_child.Modify("p_foto.Filename='"+ls_nombresilueta+"'")
ELSE
	// Si no existe ni la foto ni la silueta entonces no se configura la imagen.
	ldwc_child.Modify("p_foto.Filename=''")
END IF
string ls
ls = ldwc_child.Modify("p_foto.originalsize='1'")
ls = ldwc_child.Modify("p_foto.Resizeable='1'")

Return 1
end function

public function long of_muestrario ();long ll_muestrario

  SELECT max(h_fmp_muestras.co_muestrario)  
    INTO :ll_muestrario  
    FROM h_fmp_muestras  
   WHERE ( h_fmp_muestras.co_fabrica = :il_fabrica ) AND  
         ( h_fmp_muestras.co_linea = :il_linea ) AND  
         ( h_fmp_muestras.co_muestra = :il_muestra ) AND  
         ( h_fmp_muestras.co_talla = :il_talla ) AND  
			( h_fmp_muestras.cnt_opcion = :il_diseno )
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
			( h_fmp_muestras.co_diseno = :il_diseno ) AND  
			( h_fmp_muestras.co_muestrario = :il_muestrario ) AND 
         ( h_fmp_muestras.co_color in (  SELECT min(h_fmp_muestras.co_color)  
                                  FROM h_fmp_muestras  
                                 WHERE ( h_fmp_muestras.co_fabrica = :il_fabrica ) AND  
                                       ( h_fmp_muestras.co_linea = :il_linea ) AND  
                                       ( h_fmp_muestras.co_muestra = :il_muestra ) AND  
                                       ( h_fmp_muestras.co_talla = :il_talla ) AND  
                                       ( h_fmp_muestras.co_diseno= :il_diseno ) AND  
                                       ( h_fmp_muestras.co_muestrario = :il_muestrario )   
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

public function integer of_datosadicionalesmues (ref string a_recurso, ref string a_creacion, ref string a_modificacion, ref string a_de_muestra, ref string a_cliente, ref string a_tipo_tejido, ref string a_desarrollador, ref string a_recurso_rest);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 05 de Abril de 2003 HORA 16:33:37:671
// 
// 
//////////////////////////////////////////////////////////////////////////
long 			ll_recurso,ll_res, ll_recurso_rest, ll_co_tipo_tejido, ll_co_cliente, ll_co_sucursal
string		ls_peso,  ls_tipo_muestra
DateTime 	ldt_creacion,ldt_actualizacion
n_cst_comun	lo_comun


String ls_de_muestra, ls_de_tejido, ls_desarrollador
String ls_recurso_mues, ls_recurso_rest

  SELECT h_fmp_muestras.co_recurso,   

         h_fmp_muestras.fe_creacion,   
         h_fmp_muestras.fe_actualizacion  
    INTO :ll_recurso,   

         :ldt_creacion,   
         :ldt_actualizacion  
    FROM h_fmp_muestras  
   WHERE ( h_fmp_muestras.co_fabrica = :il_fabrica ) AND  
         ( h_fmp_muestras.co_linea = :il_linea ) AND  
         ( h_fmp_muestras.co_muestra = :il_muestra ) AND  
         ( h_fmp_muestras.co_talla = :il_talla ) AND  
			( h_fmp_muestras.co_diseno = :il_diseno ) AND  
			( h_fmp_muestras.co_muestrario = :il_muestrario ) AND 
         ( h_fmp_muestras.co_color in (  SELECT min(h_fmp_muestras.co_color)  
                                  FROM h_fmp_muestras  
                                 WHERE ( h_fmp_muestras.co_fabrica = :il_fabrica ) AND  
                                       ( h_fmp_muestras.co_linea = :il_linea ) AND  
                                       ( h_fmp_muestras.co_muestra = :il_muestra ) AND  
                                       ( h_fmp_muestras.co_talla = :il_talla ) AND  
                                       ( h_fmp_muestras.co_diseno= :il_diseno ) AND  
                                       ( h_fmp_muestras.co_muestrario = :il_muestrario )   
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

SELECT m.tipo_muestra, m.de_muestra, m.co_cliente,m.co_sucursal,
       m.co_tipo_tejido, d.id_rec_rest, m.desarrollador
  INTO :ls_tipo_muestra, :ls_de_muestra, :ll_co_cliente, :ll_co_sucursal,
       :ll_co_tipo_tejido, :ll_recurso_rest, :ls_desarrollador
  FROM m_muestras m, dt_muestras d
 WHERE m.co_fabrica = :il_fabrica   
   AND m.co_linea = :il_linea 
   AND m.co_muestra = :il_muestra
   AND d.co_talla = :il_talla 
	AND m.co_fabrica = d.co_fabrica
	AND m.co_linea = d.co_linea
	and m.co_muestra = d.co_muestra
	using n_cst_application.itr_appl;
	
ll_res=lo_comun.of_nombrerecursotj( ll_recurso_rest,n_cst_application.itr_appl)

If ll_res=1 Then
	a_recurso_rest="("+String(ll_Recurso_rest)+") "+lo_comun.of_getstring(1)
Else
	a_recurso_rest="("+String(ll_Recurso_rest)+") "
End If

ll_res=lo_comun.of_nombrecliente( ll_co_cliente, ll_co_sucursal, ls_tipo_muestra,n_cst_application.itr_appl)

If ll_res=1 Then
	a_cliente="("+String(ll_co_cliente)+"-"+String(ll_co_sucursal)+") "+lo_comun.of_getstring(1)
Else
	a_cliente="("+String(ll_co_cliente)+"-"+String(ll_co_sucursal)+") "
End If

ll_res=lo_comun.of_nombrettejido(ll_co_tipo_tejido,n_cst_application.itr_appl)


If ll_res=1 Then
	a_tipo_tejido="("+String(ll_co_tipo_tejido)+") "+lo_comun.of_getstring(1)
Else
	a_tipo_tejido="("+String(ll_co_tipo_tejido)+") "
End If

ll_res=lo_comun.of_nombredesarrollador(ls_desarrollador,n_cst_application.itr_appl)


If ll_res=1 Then
	a_desarrollador=lo_comun.of_getstring(1)
Else
	a_desarrollador=" "
End If


a_de_muestra = ls_de_muestra

//a_peso=ls_peso

a_creacion=String(ldt_creacion,"YYYY/MM/DD hh:mm")

a_modificacion=String(ldt_actualizacion,"YYYY/MM/DD hh:mm")


Return 1
end function

on w_inf_fichamp.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.gb_1
end on

on w_inf_fichamp.destroy
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
	If UpperBound(io_param.il_vector)>=8	Then
		il_fabrica=io_param.il_vector[1]
		il_linea=io_param.il_vector[2]
		il_muestra=io_param.il_vector[3]
		il_talla=io_param.il_vector[4]
		//il_calidad=io_param.il_vector[5]
		il_diseno=io_param.il_vector[6]
		il_muestrario=io_param.il_vector[7]
		il_centro=io_param.il_vector[5]	
		il_referencia=io_param.il_vector[8]
		il_tipoprod=io_param.il_vector[9]
		
		il_fabrica_ref = io_param.il_vector[10] 
		il_linea_ref   = io_param.il_vector[11]
		
		// FACL - 2019/01/22 - SA59582  - Se agrega el codigo de la Tela
		il_co_tela = io_param.il_vector[12]
		
		dw_1.SetItem(1,"co_fabrica",il_fabrica)
		dw_1.SetItem(1,"co_linea",il_linea)
		dw_1.SetItem(1,"co_muestra",il_muestra)
		dw_1.SetItem(1,"co_talla",il_talla)
		//dw_1.SetItem(1,"co_calidad",il_calidad)
		dw_1.SetItem(1,"co_diseno",il_diseno)
		dw_1.SetItem(1,"co_muestrario",il_muestrario)
		//dw_1.SetItem(1,"co_referencia",il_referencia)
		
		ll_res=lo_comun.of_nombrereferencia( il_fabrica,il_linea,il_referencia,&
							 n_cst_application.itr_appl)
//		If ll_res<>1 Then
//			il_referencia=-1
//			MessageBox("Advertencia!","La referencia no existe.",StopSign!)
//			Return 2
//		End If
		dw_1.SetItem(1,"de_referencia",lo_comun.of_getString(1))

		ll_res=lo_comun.of_nombremuestratalla( il_fabrica,il_linea,il_muestra, il_talla,&
				 n_cst_application.itr_appl)
		
		//ll_res=lo_comun.of_nombrereferenciatalla(il_fabrica_ref,il_linea_ref,il_referencia,il_talla,&
		//		 il_calidad,n_cst_application.itr_appl)
			 
//		If ll_res<>1 Then
//			il_talla=-1
//			MessageBox("Advertencia!","Talla no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
//			Return 2
//		End If
		dw_1.SetItem(1,"de_talla",lo_comun.of_getString(1))	
		
		
//		ll_res=lo_comun.of_nombrediseno( il_fabrica,il_linea,il_referencia,il_talla,&
//		il_calidad,il_diseno,n_cst_application.itr_appl)
//				 
//		If ll_res<>1 Then
//			il_diseno=-1
//			MessageBox("Advertencia!","Disen$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
//			Return 2
//		End If
//		dw_1.SetItem(1,"de_diseno",lo_comun.of_getString(1))
//			
		ll_res=lo_comun.of_nombredisenomuestra( il_fabrica,il_linea,il_muestra,il_talla,&
		il_diseno,n_cst_application.itr_appl)
				 
		If ll_res<>1 Then
			il_diseno=-1
			MessageBox("Advertencia!","Dise$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
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

ids_observacion.DataObject="d_dt_fmp_obs_muestras_ref"

ids_observacion.SetTransObject(n_cst_application.itr_appl)

end event

event resize;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 25 de Febrero de 2003 HORA 14:35:21:468
// 
// OverWrite
//////////////////////////////////////////////////////////////////////////

dw_report.SetRedraw(False)
dw_report.width  = newwidth - 50
dw_report.height = newheight - 400
gb_1.width       = newwidth - 50
dw_report.SetRedraw(True)

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

type dw_report from w_report`dw_report within w_inf_fichamp
integer x = 32
integer y = 364
integer width = 3561
integer height = 1196
integer taborder = 30
string dataobject = "dcp_rep_fichamp"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from u_dw_application within w_inf_fichamp
integer x = 46
integer y = 80
integer width = 3543
integer height = 212
boolean bringtotop = true
string dataobject = "d_ext_fichamp"
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
String ls_error

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
	
   IF isnull(il_muestra) THEN
		/// deje que pida la referencia, para definir si la busqueda es por referecia
   ELSE
		SELECT dt_muestras_ref.co_referencia_ref, dt_muestras_ref.co_talla_ref,
		       dt_muestras_ref.co_fabrica_ref, dt_muestras_ref.co_linea_ref 
		  INTO :il_referencia, :il_talla,
		       :il_fabrica_ref, :il_linea_ref
		  FROM dt_muestras_ref
		 WHERE dt_muestras_ref.co_muestra = :il_muestra
		 USING n_cst_application.itr_appl;
		 
		If n_cst_application.itr_appl.SQLcode = -1 Then 
			ls_error = n_cst_application.itr_appl.SQLErrText 
			Messagebox("Error","Error al buscar referencia:" + ls_error )
			Return 2
		End If

		If n_cst_application.itr_appl.SQLcode=100 Then
			SetNull(il_referencia) 
		End If
		 
		ll_res=lo_comun.of_nombremuestra( il_fabrica,il_linea,il_muestra,&
	                n_cst_application.itr_appl)
		If ll_res<>1 Then
			il_muestra =-1
			MessageBox("Advertencia!","La muestra no existe.",StopSign!)
			Return 2
		End If
		
		SetItem(row,"de_referencia",lo_comun.of_getString(1))
		SetItem(row,"co_referencia",il_referencia)
		SetItem(row,"co_talla",il_talla)
					
		ll_res=of_diseno()
		If ll_res<>-1 Then
			il_diseno=ll_res
			ll_res=lo_comun.of_nombredisenomuestra( il_fabrica,il_linea,il_muestra,il_talla,&
			il_diseno,n_cst_application.itr_appl)
				 
			If ll_res=1 Then
				SetItem(row,"co_diseno",il_diseno)
				SetItem(row,"de_diseno",lo_comun.of_getString(1))
			End If
		End If
		
		ll_res=of_muestrario()
		If ll_res<>-1 Then
			il_muestrario=ll_res
			SetItem(row,"co_muestrario",il_muestrario)
		End If
		
		of_reset1(dwo.name)
	End If
End If

If dwo.name="co_referencia" Then
	il_referencia=Long(Data)
End If

If dwo.name="co_talla" Then
	il_talla=long(data)
			
	IF isnull(il_referencia) THEN
//		---se entro por muestra
	Else
	
		SELECT dt_muestras_ref.co_muestra, dt_muestras_ref.co_talla,
		       dt_muestras_ref.co_fabrica_ref, dt_muestras_ref.co_linea_ref
		  INTO :il_muestra, :il_talla,
		       :il_fabrica_ref, :il_linea_ref
		  FROM dt_muestras_ref
		 WHERE dt_muestras_ref.co_referencia_ref = :il_referencia
		   AND dt_muestras_ref.co_talla_ref = :il_talla
		 USING  n_cst_application.itr_appl;
		 
		If n_cst_application.itr_appl.SQLcode = -1 Then 
			ls_error = n_cst_application.itr_appl.SQLErrText 
			Messagebox("Error","Error al buscar muestra:" + ls_error )
 			Return 2
		End If

		If n_cst_application.itr_appl.SQLcode=100 Then
			SetNull(il_muestra) 
		End If
	End If
	
	SetItem(row,"co_muestra",il_muestra	)	
	ll_res=lo_comun.of_nombremuestra( il_fabrica,il_linea,il_muestra,&
	               n_cst_application.itr_appl)
	If ll_res<>1 Then
		il_muestra =-1
		MessageBox("Advertencia!","La muestra no existe.",StopSign!)
		Return 2
	End If	
	SetItem(row,"de_referencia",lo_comun.of_getString(1))
	
	ll_res=lo_comun.of_nombremuestratalla(il_fabrica,il_linea,il_muestra,il_talla,&
	      n_cst_application.itr_appl)
			 
	If ll_res<>1 Then
		il_talla=-1
		MessageBox("Advertencia!","Talla no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
   SetItem(row,"de_talla",lo_comun.of_getString(1))
	SetItem(row,"co_referencia",il_referencia)
	SetItem(row,"co_talla",il_talla)

	ll_res=of_diseno()
	If ll_res<>-1 Then
		il_diseno=ll_res
		ll_res=lo_comun.of_nombredisenomuestra( il_fabrica,il_linea,il_muestra,il_talla,&
		il_diseno,n_cst_application.itr_appl)
				 
		If ll_res=1 Then
			SetItem(row,"co_diseno",il_diseno)
			SetItem(row,"de_diseno",lo_comun.of_getString(1))
		End If
	End If
		
	ll_res=of_muestrario()
	If ll_res<>-1 Then
		il_muestrario=ll_res
		SetItem(row,"co_muestrario",il_muestrario)
	End If
		
	of_reset1(dwo.name)

//////////////////////////////////////////////////////////////////////////
// Verifico si la ref tiene un solo dise$$HEX1$$f100$$ENDHEX$$o y lo coloco, que es lo usual
// 
//////////////////////////////////////////////////////////////////////////
	ll_res=of_diseno()
	If ll_res<>-1 Then
		il_diseno=ll_res
		ll_res=lo_comun.of_nombredisenomuestra( il_fabrica,il_linea,il_muestra,il_talla,&
			il_diseno,n_cst_application.itr_appl)
				 
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


	ll_res=of_diseno()
	If ll_res<>-1 Then
		il_diseno=ll_res
		ll_res=lo_comun.of_nombredisenomuestra( il_fabrica,il_linea,il_muestra,il_talla,&
			il_diseno,n_cst_application.itr_appl)
				 
		If ll_res=1 Then
			SetItem(row,"co_diseno",il_diseno)
			SetItem(row,"de_diseno",lo_comun.of_getString(1))
		End If
	End If
//	
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
	ll_res=lo_comun.of_nombredisenomuestra( il_fabrica,il_linea,il_muestra,il_talla,&
	il_diseno,n_cst_application.itr_appl)
			 
	If ll_res<>1 Then
		il_diseno=-1
		MessageBox("Advertencia!","Dise$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
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

//If dwo.name="co_talla" Then
//	lo_param.il_vector[1]=il_fabrica
//	lo_param.il_vector[2]=il_linea
//	lo_param.il_vector[3]=il_referencia
//	lo_param.il_vector[4]=il_calidad
//
//	OpenWithParm(w_bus_tallas_referencia,lo_param)
//	
//	lo_param=Message.PowerObjectParm
//	
//	If IsValid(lo_param) Then
//		SetText(String(lo_param.il_vector[1]))
//	End If
//End If
//
//
//If dwo.name="co_diseno" Then
//	
//	lo_param.il_vector[1]=il_fabrica
//	lo_param.il_vector[2]=il_linea
//	lo_param.il_vector[3]=il_referencia
//	lo_param.il_vector[4]=il_talla
//	lo_param.il_vector[5]=il_calidad
//	
//	OpenWithParm(w_diseno,lo_param)
//	
//	lo_param=Message.PowerObjectParm
//	
//	If IsValid(lo_param) Then
//		SetText(String(lo_param.il_vector[1]))
//	End If
//End If

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

type gb_1 from groupbox within w_inf_fichamp
integer x = 23
integer y = 32
integer width = 3579
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

