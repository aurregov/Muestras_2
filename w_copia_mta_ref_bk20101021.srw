HA$PBExportHeader$w_copia_mta_ref_bk20101021.srw
$PBExportComments$Para hacer la copia de muestras a referencias
forward
global type w_copia_mta_ref_bk20101021 from w_sheet
end type
type dw_s_muestrario_color from u_dw_application within w_copia_mta_ref_bk20101021
end type
type dw_s_precio_vta from u_dw_application within w_copia_mta_ref_bk20101021
end type
type dw_dt_ref_vta from u_dw_application within w_copia_mta_ref_bk20101021
end type
type tab_1 from tab within w_copia_mta_ref_bk20101021
end type
type tabpage_2 from userobject within tab_1
end type
type sle_observacion from singlelineedit within tabpage_2
end type
type dw_ref_pdn from u_dw_application within tabpage_2
end type
type gb_5 from groupbox within tabpage_2
end type
type tabpage_2 from userobject within tab_1
sle_observacion sle_observacion
dw_ref_pdn dw_ref_pdn
gb_5 gb_5
end type
type tabpage_1 from userobject within tab_1
end type
type dw_adicional from u_dw_application within tabpage_1
end type
type dw_ref_vta from u_dw_application within tabpage_1
end type
type gb_3 from groupbox within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_adicional dw_adicional
dw_ref_vta dw_ref_vta
gb_3 gb_3
end type
type tabpage_5 from userobject within tab_1
end type
type dw_dt_vta_pdn from u_dw_application within tabpage_5
end type
type tabpage_5 from userobject within tab_1
dw_dt_vta_pdn dw_dt_vta_pdn
end type
type tabpage_3 from userobject within tab_1
end type
type dw_colores from u_dw_application within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_colores dw_colores
end type
type tabpage_4 from userobject within tab_1
end type
type dw_recurso from u_dw_application within tabpage_4
end type
type gb_4 from groupbox within tabpage_4
end type
type tabpage_4 from userobject within tab_1
dw_recurso dw_recurso
gb_4 gb_4
end type
type tab_1 from tab within w_copia_mta_ref_bk20101021
tabpage_2 tabpage_2
tabpage_1 tabpage_1
tabpage_5 tabpage_5
tabpage_3 tabpage_3
tabpage_4 tabpage_4
end type
type dw_head from u_dw_application within w_copia_mta_ref_bk20101021
end type
type cbx_ft from checkbox within w_copia_mta_ref_bk20101021
end type
type cbx_mo from checkbox within w_copia_mta_ref_bk20101021
end type
type cbx_mp from checkbox within w_copia_mta_ref_bk20101021
end type
type gb_2 from u_gb_base within w_copia_mta_ref_bk20101021
end type
type gb_1 from u_gb_base within w_copia_mta_ref_bk20101021
end type
end forward

global type w_copia_mta_ref_bk20101021 from w_sheet
integer x = 0
integer width = 3598
integer height = 2576
string title = "Copiar muestra a referencia"
boolean maxbox = true
windowstate windowstate = maximized!
dw_s_muestrario_color dw_s_muestrario_color
dw_s_precio_vta dw_s_precio_vta
dw_dt_ref_vta dw_dt_ref_vta
tab_1 tab_1
dw_head dw_head
cbx_ft cbx_ft
cbx_mo cbx_mo
cbx_mp cbx_mp
gb_2 gb_2
gb_1 gb_1
end type
global w_copia_mta_ref_bk20101021 w_copia_mta_ref_bk20101021

type variables
long il_fila_sel

String is_where_bus, is_ruta_ini

boolean ib_cambios

n_cst_muestra_a_referencia io_copiar
String is_ean

long il_muestrarioActual

n_ds_application ids_ref_vta,ids_ref_pdn

end variables

forward prototypes
public function integer of_desrefvta ()
public function integer of_disable ()
public function integer of_enable ()
public function integer of_colormuesref ()
public function integer of_coloresrefvta ()
public function integer of_resetmuestrario ()
public function integer of_muestrariocolores (long a_muestrario, string a_demuestrario)
public function integer of_desrefpdn ()
public function integer of_nombrecoloresmuestra ()
public function integer of_recuperar (string a_where)
public function integer of_memoriacargar ()
public function integer of_memoriapdn ()
public function integer of_memoriavta ()
public function integer of_reset ()
public function integer of_copiarmuestra ()
public function integer of_nombrereferenciav (long a_fabricav, long a_lineav, long a_referenciav, long a_tallav, long a_calidadv)
public function integer of_copiapdnvta ()
public function integer of_grabar ()
public function integer of_validar ()
public function integer of_nombrereferenciapdn (long a_fabrica, long a_linea, long a_referencia, long a_talla, long a_calidad)
public function integer of_copiadatosmuestraref (long a_pdn_vta)
public function integer of_asignarmuestrarioactual (long a_fabrica, long a_linea)
public function integer of_cargardatoscopia ()
public function integer of_verifica_medida_reposada (long a_fabrica, long a_linea, long a_muestra, long a_talla)
public function integer of_verifcateorica (long a_recurso, long a_fabrica, long a_linea, long a_muestra, long a_talla)
public function integer of_validar_grupo_talla (long a_fabrica, long a_linea, long a_referencia, long a_talla, long a_grupo_talla)
public function integer of_verificar_medidas_estiradas (long a_fabrica, long a_linea, long a_muestra, long a_talla)
public function integer of_verificar_muestra_ref (long a_fabrica, long a_linea, long a_muestra, long a_talla)
public function integer of_connect_trans (integer ai_fabrica_conexion)
public subroutine of_reconectar_dw ()
public function integer of_verificar_unica_referencia (long al_referencia)
public function integer of_verificar_unica_referencia (long al_referencia, integer ai_fabrica, integer ai_linea, integer ai_talla)
end prototypes

public function integer of_desrefvta ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 07 de Febrero de 2003 HORA 18:35:33:906
// 
// Descripcion de los campos de ref_vta
//////////////////////////////////////////////////////////////////////////

long ll_fabricav,ll_lineav,ll_referenciav,ll_tallav,ll_csTalla,ll_res
n_cst_comun lo_comun


ll_fabricav=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_fabricav")
ll_lineav=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_lineav")
ll_referenciav=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_referenciav")
ll_tallav=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_tallav")

ll_csTalla=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"cs_tallav")

ll_res=lo_comun.of_nombremtallas(ll_fabricav /*long a_fabrica*/,&
                                 ll_lineav/*long a_linea*/,&
											ll_tallav/*long a_talla*/,&
											ll_csTalla/*long a_cstalla*/,&
											n_cst_application.itr_appl/*transaction a_transaction */)
If ll_res=1 Then
	tab_1.tabpage_1.dw_ref_vta.SetItem(1,"de_talla",lo_comun.of_getString(1))
End If

long ll_calidadv

ll_calidadv=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_calidadv")

ll_res=lo_comun.of_nombreCalidad(ll_calidadv,n_cst_application.itr_appl)

If ll_res=1 Then
	tab_1.tabpage_1.dw_ref_vta.SetItem(1,"de_calidad",lo_comun.of_getString(1))
End If

String ls_unidadv
                                                      
ls_unidadv=tab_1.tabpage_1.dw_ref_vta.GetItemString(1,"co_unidadv")

ll_res=lo_comun.of_nombreUnidad(ls_unidadv,n_cst_application.itr_appl)

If ll_res=1 Then
	tab_1.tabpage_1.dw_ref_vta.SetItem(1,"de_unidadv",lo_comun.of_getString(1))
End If

long ll_co_grupo_vta

ll_co_grupo_vta=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_grupo_vta")

ll_res=lo_comun.of_nombreGrupoVta(ll_fabricav /*long a_fabrica*/,&
                                  ll_co_grupo_vta/*long a_grupo*/,&
											 n_cst_application.itr_appl/*transaction a_transaction */)

If ll_res=1 Then
	tab_1.tabpage_1.dw_ref_vta.SetItem(1,"de_grupo_vta",lo_comun.of_getString(1))
End If

long ll_co_sgrupo_vta

ll_co_sgrupo_vta=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_sgrupo_vta")

ll_res=lo_comun.of_nombreSGrupoVta(ll_fabricav,ll_co_sgrupo_vta,n_cst_application.itr_appl)

If ll_res=1 Then
	tab_1.tabpage_1.dw_ref_vta.SetItem(1,"de_sgrupo_vta",lo_comun.of_getString(1))
End If

long ll_co_carac_vta

ll_co_carac_vta=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_carac_vta")

ll_res=lo_comun.of_nombreCaracVta(ll_fabricav,ll_co_carac_vta,n_cst_application.itr_appl)

If ll_res=1 Then
	tab_1.tabpage_1.dw_ref_vta.SetItem(1,"de_carac_vta",lo_comun.of_getString(1))
End If

long ll_co_licencia

ll_co_licencia=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_licencia")

ll_res=lo_comun.of_nombreLicencia(ll_co_licencia,n_cst_application.itr_appl)

If ll_res=1 Then
	tab_1.tabpage_1.dw_ref_vta.SetItem(1,"de_licencia",lo_comun.of_getString(1))
End If

long ll_co_composicion

ll_co_composicion=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_composicion")

ll_res=lo_comun.of_nombreComposicion(ll_co_composicion,n_cst_application.itr_appl)

If ll_res=1 Then
	tab_1.tabpage_1.dw_ref_vta.SetItem(1,"de_composicion",lo_comun.of_getString(1))
End If

long ll_co_empq_cnsm

ll_co_empq_cnsm=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_empq_cnsm")

ll_res=lo_comun.of_nombreEmpqCnsm(ll_co_empq_cnsm,n_cst_application.itr_appl)

If ll_res=1 Then
	tab_1.tabpage_1.dw_ref_vta.SetItem(1,"de_empq_cnsm",lo_comun.of_getString(1))
End If

long ll_co_grupo_tlla

ll_co_grupo_tlla=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_grupo_tlla")

ll_res=lo_comun.of_nombregrupotalla(ll_co_grupo_tlla /*long a_co_grupo_tlla*/,&
                                    n_cst_application.itr_appl/*transaction a_transaction */)

If ll_res=1 Then
	tab_1.tabpage_1.dw_ref_vta.SetItem(1,"de_grupo_tlla",lo_comun.of_getString(1))
End If



return 1
end function

public function integer of_disable ();tab_1.tabpage_1.dw_ref_vta.Enabled=False
tab_1.tabpage_1.dw_adicional.enabled=False

int i

For i=1 To 23 
	tab_1.tabpage_1.dw_ref_vta.Of_color(i,0)
Next
tab_1.tabpage_1.dw_adicional.of_color(1,0)
tab_1.tabpage_1.dw_adicional.of_color(3,0)
tab_1.tabpage_1.dw_adicional.of_color(4,0)

Return 1
end function

public function integer of_enable ();tab_1.tabpage_1.dw_ref_vta.Enabled=True
tab_1.tabpage_1.dw_adicional.enabled=True

long i

For i=1 To 23 
	tab_1.tabpage_1.dw_ref_vta.Of_color(i,1)
Next
tab_1.tabpage_1.dw_adicional.of_color(1,1)
tab_1.tabpage_1.dw_adicional.of_color(3,1)
tab_1.tabpage_1.dw_adicional.of_color(4,1)
Return 1
end function

public function integer of_colormuesref ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 17 de Febrero de 2003 HORA 18:16:28:078
// 
// colores de la muestra a la referencia
//////////////////////////////////////////////////////////////////////////

long ll_tot,i,ll_pos,ll_cambio,ll_puesto
long ll_fabricaVta,ll_lineaVta,ll_refVta,ll_tallaVta,ll_calidadVta,ll_color
long ll_fila,ll_opcion

long ll_muestra,ll_diseno,ll_muestrario,ll_muestrario_ficha

ll_muestra = dw_head.getitemNumber(1, "co_muestra")

tab_1.tabpage_3.dw_colores.accepttext()

ll_tot=tab_1.tabpage_3.dw_colores.RowCount()

ll_fabricaVta=tab_1.tabpage_1.dw_ref_vta.GetItemNUmber(1,"co_fabricav")
ll_lineaVta=tab_1.tabpage_1.dw_ref_vta.GetItemNUmber(1,"co_lineav")
ll_refVta=tab_1.tabpage_1.dw_ref_vta.GetItemNUmber(1,"co_referenciav")
ll_tallaVta=tab_1.tabpage_1.dw_ref_vta.GetItemNUmber(1,"co_tallav")
ll_calidadVta=tab_1.tabpage_1.dw_ref_vta.GetItemNUmber(1,"co_calidadv")

For i=1 To ll_tot
	ll_cambio=tab_1.tabpage_3.dw_colores.GetItemNumber(i,"cambio")
	ll_puesto=tab_1.tabpage_3.dw_colores.GetItemNumber(i,"dato_puesto")
	ll_diseno = tab_1.tabpage_3.dw_colores.GetItemNumber(i,"co_diseno")
	ll_opcion = tab_1.tabpage_3.dw_colores.GetItemNumber(i,"co_opcion")
	ll_muestrario = tab_1.tabpage_3.dw_colores.GetItemNumber(i,"co_muestrario")
	
	If ll_cambio=1 and ll_puesto=0 Then
		ll_color=tab_1.tabpage_3.dw_colores.GetItemNumber(i,"co_color")
		ll_pos=dw_dt_ref_vta.Find("co_colorv="+String(ll_color),1,dw_dt_ref_vta.RowCount())
		If ll_pos=0 Then
			ll_pos=dw_dt_ref_vta.InsertRow(0)
			dw_dt_ref_vta.SetItem(ll_pos,"co_fabricav",ll_fabricaVta)
			dw_dt_ref_vta.SetItem(ll_pos,"co_lineav",ll_lineaVta)
			dw_dt_ref_vta.SetItem(ll_pos,"co_referenciav",ll_refVta)
			dw_dt_ref_vta.SetItem(ll_pos,"co_tallav",ll_tallaVta)
			dw_dt_ref_vta.SetItem(ll_pos,"co_calidadv",ll_calidadVta)
			dw_dt_ref_vta.SetItem(ll_pos,"co_colorv",ll_color)
		End If
		If ll_cambio=1 Then
			
			IF ll_opcion > 0 THEN
				SELECT co_muestrario 
				INTO :ll_muestrario_ficha
				FROM h_fmp_muestras 
				WHERE co_fabrica = :ll_fabricaVta  AND
					co_linea = :ll_lineaVta AND
					co_muestra = :ll_muestra AND
					co_talla = :ll_tallaVta AND
					co_color = :ll_color AND
					cnt_opcion = :ll_diseno 
				USING n_cst_application.itr_appl;
				
				IF ll_muestrario_ficha <> ll_muestrario THEN
					MessageBox("Advertencia","El muestrario del color " + String(ll_color) + " es diferente al muestrario al que se va a convertir")
					Return -1
				END IF	
				
				ll_fila = dw_s_muestrario_color.insertrow(0)
				dw_s_muestrario_color.setitem(ll_fila,"co_fabrica",ll_fabricaVta)
				dw_s_muestrario_color.setitem(ll_fila,"co_linea",ll_lineaVta)
				dw_s_muestrario_color.setitem(ll_fila,"co_muestra",ll_muestra)	
	
				dw_s_muestrario_color.setitem(ll_fila,"co_talla",ll_tallaVta)	
				dw_s_muestrario_color.setitem(ll_fila,"co_color",ll_color)	
				dw_s_muestrario_color.setitem(ll_fila,"co_diseno",ll_diseno)				
				dw_s_muestrario_color.setitem(ll_fila,"co_muestrario",ll_muestrario)							
			END IF				
		End if	
		
		dw_dt_ref_vta.SetItem(ll_pos,"co_muestrario",&
		tab_1.tabpage_3.dw_colores.GetItemNumber(i,"co_muestrario"))
		
		dw_dt_ref_vta.SetItem(ll_pos,"ean",&
		tab_1.tabpage_3.dw_colores.GetItemString(i,"ean"))
		
		dw_dt_ref_vta.SetItem(ll_pos,"sw_lista",&
		tab_1.tabpage_3.dw_colores.GetItemNumber(i,"sw_lista"))
		
		dw_dt_ref_vta.SetItem(ll_pos,"id_linea",&
		tab_1.tabpage_3.dw_colores.GetItemString(i,"id_linea"))
		
		dw_dt_ref_vta.SetItem(ll_pos,"co_coleccion",&
		tab_1.tabpage_3.dw_colores.GetItemNumber(i,"co_coleccion"))
		
		dw_dt_ref_vta.SetItem(ll_pos,"pares_x_uempq",&
		tab_1.tabpage_3.dw_colores.GetItemNumber(i,"pares_x_uempq"))
		
	End If
Next

Return 1
end function

public function integer of_coloresrefvta ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 20 de Febrero de 2003 HORA 17:26:15:203
// 
// Pasa los datos de co_muestrario y otros de la referencia de venta, para que
// el usuario los vea, no se permite modificarlos
//////////////////////////////////////////////////////////////////////////
long    			i,ll_tot,ll_color,ll_pos,ll_tot1, ll_muestrario,ll_fabricaV,&
					ll_lineaV,ll_res,ll_coleccion
String  			ls_muestrariom
n_cst_comun  	lo_comun

ll_tot1=tab_1.tabpage_3.dw_colores.RowCount()
ll_tot=dw_dt_ref_vta.RowCount()

For i=1 to ll_tot
	ll_color=dw_dt_ref_vta.GetItemNumber(i,"co_colorv")
	ll_pos=tab_1.tabpage_3.dw_colores.find("co_color="+String(ll_color),1,ll_tot1)
	If ll_pos>0 Then
		tab_1.tabpage_3.dw_colores.SetItem(ll_pos,"dato_puesto",1)
		
		ll_muestrario=dw_dt_ref_vta.GetItemNumber(i,"co_muestrario")
		ll_fabricaV=dw_dt_ref_vta.GetItemNumber(i,"co_fabricaV")
		ll_lineaV=dw_dt_ref_vta.GetItemNumber(i,"co_lineaV")
		
		tab_1.tabpage_3.dw_colores.SetItem(ll_pos,"co_muestrario",ll_muestrario)
		
		ll_res=lo_comun.of_nombremuestrario(ll_fabricaV,ll_lineaV,&
		                             ll_muestrario,n_cst_application.itr_appl)
		If ll_res=1 Then
			tab_1.tabpage_3.dw_colores.SetItem(ll_pos,"de_muestrario",lo_comun.of_getString(1))
		End If
		
		tab_1.tabpage_3.dw_colores.SetItem(ll_pos,"ean",&
		dw_dt_ref_vta.GetItemString(i,"ean"))
		
		tab_1.tabpage_3.dw_colores.SetItem(ll_pos,"ean",&
		dw_dt_ref_vta.GetItemString(i,"ean"))

		tab_1.tabpage_3.dw_colores.SetItem(ll_pos,"sw_lista",&
		dw_dt_ref_vta.GetItemNumber(i,"sw_lista"))

		tab_1.tabpage_3.dw_colores.SetItem(ll_pos,"id_linea",&
		dw_dt_ref_vta.GetItemString(i,"id_linea"))
		
		ll_coleccion=dw_dt_ref_vta.GetItemNumber(i,"co_coleccion")

		tab_1.tabpage_3.dw_colores.SetItem(ll_pos,"co_coleccion",ll_coleccion)
		
		ll_res=lo_comun.of_nombrecoleccion( ll_coleccion,n_cst_application.itr_appl)
		
		If ll_res=1 Then
			tab_1.tabpage_3.dw_colores.SetItem(ll_pos,"de_coleccion",lo_comun.of_getString(1))
		End If
		
		tab_1.tabpage_3.dw_colores.SetItem(ll_pos,"pares_x_uempq",&
		dw_dt_ref_vta.GetItemNumber(i,"pares_x_uempq"))
	End If
Next

Return 1
end function

public function integer of_resetmuestrario ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 24 de Febrero de 2003 HORA 14:39:56:625
// 
// quita el muestrario que se digite
//////////////////////////////////////////////////////////////////////////
long ll_null,i,ll_tot

SetNull(ll_null)

tab_1.tabpage_1.dw_adicional.SetItem(1,"co_muestrario",ll_null)
tab_1.tabpage_1.dw_adicional.SetItem(1,"de_muestrario","")


ll_tot=tab_1.tabpage_3.dw_colores.RowCount()

For i=1 To ll_tot
	tab_1.tabpage_3.dw_colores.SetItem(i,"co_muestrario",ll_null)
	tab_1.tabpage_3.dw_colores.SetItem(i,"de_muestrario","")
Next

Return 1












end function

public function integer of_muestrariocolores (long a_muestrario, string a_demuestrario);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 24 de Febrero de 2003 HORA 16:27:52:234
// 
// Actualiza el dato de los muestrarios de los colores con el muestrario
// de la referencia de venta, por defecto y se puede modificar
//////////////////////////////////////////////////////////////////////////


long   	i,ll_tot

ll_tot=tab_1.tabpage_3.dw_colores.RowCount()



For i=1 To ll_tot
	tab_1.tabpage_3.dw_colores.SetItem(i,"co_muestrario",a_muestrario)
	tab_1.tabpage_3.dw_colores.SetItem(i,"de_muestrario",a_deMuestrario)
Next

Return 1
end function

public function integer of_desrefpdn ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 11 de Febrero de 2003 HORA 14:42:43:500
// 
// Descripcion de la referencia de produccion
//////////////////////////////////////////////////////////////////////////



long ll_fabrica,ll_linea,ll_referencia,ll_talla,ll_csTalla,ll_res,ll_calidad
n_cst_comun lo_comun


ll_fabrica=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_fabrica")
ll_linea=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_linea")
ll_referencia=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_referencia")
ll_talla=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_talla")

ll_csTalla=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"cs_talla")

ll_res=lo_comun.of_nombremtallas(ll_fabrica,ll_linea,ll_talla,&
                                 ll_csTalla,n_cst_application.itr_appl/*transaction a_transaction */)
If ll_res=1 Then
	tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"de_talla",lo_comun.of_getString(1))
End If

ll_calidad=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_calidad")

ll_res=lo_comun.of_nombreCalidad(ll_calidad,n_cst_application.itr_appl)

If ll_res=1 Then
	tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"de_calidad",lo_comun.of_getString(1))
End If

String ls_unidadv
                                                      
ls_unidadv=tab_1.tabpage_2.dw_ref_pdn.GetItemString(1,"co_unidad")

ll_res=lo_comun.of_nombreUnidad(ls_unidadv,n_cst_application.itr_appl)

If ll_res=1 Then
	tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"de_unidad",lo_comun.of_getString(1))
End If

long ll_co_grupo_pdn

ll_co_grupo_pdn=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_grupo_pdn")

ll_res=lo_comun.of_nombreGrupoPdn(ll_fabrica,ll_co_grupo_pdn,n_cst_application.itr_appl)

If ll_res=1 Then
	tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"de_grupo_pdn",lo_comun.of_getString(1))
End If

long ll_co_sgrupo_pdn

ll_co_sgrupo_pdn=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_sgrupo_pdn")

ll_res=lo_comun.of_nombreSGrupoPdn(ll_fabrica,ll_co_sgrupo_pdn,n_cst_application.itr_appl)

If ll_res=1 Then
	tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"de_sgrupo_pdn",lo_comun.of_getString(1))
End If

long ll_co_tamano

ll_co_tamano=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_tamano")

ll_res=lo_comun.of_nombreTamano(ll_co_tamano,n_cst_application.itr_appl)

If ll_res=1 Then
	tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"de_tamano",String(lo_comun.of_getLong(1)))
End If

long ll_co_ttejido

ll_co_ttejido=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_ttejido")

ll_res=lo_comun.of_nombreTtejido(ll_co_ttejido,n_cst_application.itr_appl)

If ll_res=1 Then
	tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"de_ttejido",lo_comun.of_getString(1))
End If

String ls_bpl_co_tipoprod

ls_bpl_co_tipoprod=tab_1.tabpage_2.dw_ref_pdn.GetItemString(1,"bpl_co_tipoprod")

ll_res=lo_comun.of_nombrebpltipoprod(ls_bpl_co_tipoprod,n_cst_application.itr_appl)

If ll_res=1 Then
	tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"de_bpl_co_tipoprod",lo_comun.of_getString(1))
End If

String ls_bpl_co_planctl

ls_bpl_co_planctl=tab_1.tabpage_2.dw_ref_pdn.GetItemString(1,"bpl_co_planctl")

ll_res=lo_comun.of_nombreBplPlanCtl(ls_bpl_co_planctl,n_cst_application.itr_appl)

If ll_res=1 Then
	tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"de_bpl_co_planctl",lo_comun.of_getString(1))
End If

String ls_bpl_co_pabcode

ls_bpl_co_pabcode=tab_1.tabpage_2.dw_ref_pdn.GetItemString(1,"bpl_co_pabcode")

ll_res=lo_comun.of_nombreBplPabCode(ls_bpl_co_pabcode,n_cst_application.itr_appl)

If ll_res=1 Then
	tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"de_bpl_co_pabcode",lo_comun.of_getString(1))
End If

long ll_co_tipoprod

ll_co_tipoprod=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_tipoprod")

ll_res=lo_comun.of_nombreTipoProd( ll_co_tipoprod,n_cst_application.itr_appl)

If ll_res=1 Then
	tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"de_tipoProd",lo_comun.of_getString(1))
End If

long ll_nu_ruta

ll_nu_ruta=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"nu_ruta")

ll_res=lo_comun.of_nombrehrutas(ll_co_tipoProd,ll_nu_ruta,n_cst_application.itr_appl)

If ll_res=1 Then
	tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"de_nu_ruta",lo_comun.of_getString(1))
End If

long ll_co_grupo_tlla

ll_co_grupo_tlla=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_grupo_tlla")

ll_res=lo_comun.of_nombregrupotalla(ll_co_grupo_tlla /*long a_co_grupo_tlla*/,&
                                    n_cst_application.itr_appl/*transaction a_transaction */)

If ll_res=1 Then
	tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"de_grupo_tlla",lo_comun.of_getString(1))
End If


return 1
end function

public function integer of_nombrecoloresmuestra ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 15 de Febrero de 2003 HORA 08:45:14:406
// 
// Coloca los nombres de los colores de la muestra
//////////////////////////////////////////////////////////////////////////

long i,ll_tot,ll_color,ll_fabrica,ll_linea,ll_res
n_cst_comun lo_comun

string ls_diseno

ll_fabrica=dw_head.GetItemNUmber(1,"co_fabrica")
ll_linea=dw_head.GetItemNUmber(1,"co_linea")

ll_tot=tab_1.tabpage_3.dw_colores.RowCount()
ls_diseno=dw_head.GetItemString(1,"co_diseno_muestra")

For i=1 To ll_tot
	ll_color=tab_1.tabpage_3.dw_colores.GetItemNumber(i,"co_color")
	ll_res=lo_comun.of_nombrecolor(ll_fabrica,ll_linea,ll_color,n_cst_application.itr_appl)
	If ll_res<>1 Then
		MessageBox("Advertencia!","No se encontr$$HEX2$$f3002000$$ENDHEX$$el color "+String(ll_color)+".",StopSign!)
		Return -1
	End If
   tab_1.tabpage_3.dw_colores.SetItem(i,"de_color",lo_comun.of_getString(1))
	tab_1.tabpage_3.dw_colores.SetItem(i,"co_diseno",1)
	tab_1.tabpage_3.dw_colores.SetItem(i,"de_diseno",ls_diseno)
Next

Return 1
end function

public function integer of_recuperar (string a_where);return 1
end function

public function integer of_memoriacargar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 19 de Marzo de 2003 HORA 09:40:32:515
// 
// Carga la memoria de ref de pdn y de venta
//////////////////////////////////////////////////////////////////////////

ids_ref_vta.Reset()
ids_ref_pdn.reset()

tab_1.tabpage_2.dw_ref_pdn.RowsCopy(1,1,Primary!,ids_ref_pdn,1,Primary!)
tab_1.tabpage_1.dw_ref_vta.RowsCopy(1,1,Primary!,ids_ref_vta,1,Primary!)

Return 1

end function

public function integer of_memoriapdn ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 19 de Marzo de 2003 HORA 09:43:48:015
// 
// toma la memoria de la referencia de pdn y la coloca en la dw
//////////////////////////////////////////////////////////////////////////

long ll_f1,ll_l1,ll_r1,ll_f2,ll_l2,ll_r2

If tab_1.tabpage_2.dw_ref_pdn.RowCount()=0 or ids_ref_pdn.RowCount()=0 Then	
	 Return -1
End If


ll_f1=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_fabrica")
ll_l1=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_linea")
ll_r1=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_referencia")

ll_f2=ids_ref_pdn.GetItemNUmber(1,"co_fabrica")
ll_l2=ids_ref_pdn.GetItemNUmber(1,"co_linea")
ll_r2=ids_ref_pdn.GetItemNUmber(1,"co_referencia")

If ll_f1<>ll_f2 or ll_l1<>ll_l2 or ll_r1<>ll_r2 Then
	Return -1
End If

tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"de_referencia",&
Trim(ids_ref_pdn.GetItemString(1,"de_referencia")))

tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"co_unidad",&
ids_ref_pdn.GetItemString(1,"co_unidad"))

tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"co_tipoprod",&
ids_ref_pdn.GetItemNumber(1,"co_tipoprod"))

tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"co_ttejido",&
ids_ref_pdn.GetItemNumber(1,"co_ttejido"))

tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"co_grupo_pdn",&
ids_ref_pdn.GetItemNumber(1,"co_grupo_pdn"))

tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"co_sgrupo_pdn",&
ids_ref_pdn.GetItemNumber(1,"co_sgrupo_pdn"))

tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"co_tamano",&
ids_ref_pdn.GetItemNumber(1,"co_tamano"))

tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"bpl_co_tipoprod",&
ids_ref_pdn.GetItemString(1,"bpl_co_tipoprod"))

tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"bpl_co_planctl",&
ids_ref_pdn.GetItemString(1,"bpl_co_planctl"))

tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"bpl_co_pabcode",&
ids_ref_pdn.GetItemString(1,"bpl_co_pabcode"))

tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"prc_primeras",&
ids_ref_pdn.GetItemNumber(1,"prc_primeras"))

tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"cls_abc",&
ids_ref_pdn.GetItemString(1,"cls_abc"))

tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"estado",&
ids_ref_pdn.GetItemString(1,"estado"))

tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"nu_ruta",&
ids_ref_pdn.GetItemNumber(1,"nu_ruta"))

tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"co_grupo_tlla",&
ids_ref_pdn.GetItemNumber(1,"co_grupo_tlla"))

return 1
end function

public function integer of_memoriavta ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 19 de Marzo de 2003 HORA 10:06:33:843
// 
// Memoria para la referencia de venta
//////////////////////////////////////////////////////////////////////////


long ll_f1,ll_l1,ll_r1,ll_f2,ll_l2,ll_r2

If tab_1.tabpage_1.dw_ref_vta.RowCount()=0 or ids_ref_vta.RowCount()=0 Then	
	 Return -1
End If


ll_f1=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_fabricav")
ll_l1=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_lineav")
ll_r1=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_referenciav")

ll_f2=ids_ref_vta.GetItemNUmber(1,"co_fabricav")
ll_l2=ids_ref_vta.GetItemNUmber(1,"co_lineav")
ll_r2=ids_ref_vta.GetItemNUmber(1,"co_referenciav")

If ll_f1<>ll_f2 or ll_l1<>ll_l2 or ll_r1<>ll_r2 Then
	Return -1
End If

tab_1.tabpage_1.dw_ref_vta.SetItem(1,"de_referenciav",&
Trim(ids_ref_vta.GetItemString(1,"de_referenciav")))

tab_1.tabpage_1.dw_ref_vta.SetItem(1,"co_unidadv",&
ids_ref_vta.GetItemString(1,"co_unidadv"))

tab_1.tabpage_1.dw_ref_vta.SetItem(1,"ca_unidades_suger",&
ids_ref_vta.GetItemNumber(1,"ca_unidades_suger"))

tab_1.tabpage_1.dw_ref_vta.SetItem(1,"co_grupo_vta",&
ids_ref_vta.GetItemNumber(1,"co_grupo_vta"))

tab_1.tabpage_1.dw_ref_vta.SetItem(1,"co_sgrupo_vta",&
ids_ref_vta.GetItemNumber(1,"co_sgrupo_vta"))

tab_1.tabpage_1.dw_ref_vta.SetItem(1,"co_carac_vta",&
ids_ref_vta.GetItemNumber(1,"co_carac_vta"))

tab_1.tabpage_1.dw_ref_vta.SetItem(1,"co_licencia",&
ids_ref_vta.GetItemNumber(1,"co_licencia"))
                                      
tab_1.tabpage_1.dw_ref_vta.SetItem(1,"pares_x_uempq",&
ids_ref_vta.GetItemNumber(1,"pares_x_uempq"))
                                      
tab_1.tabpage_1.dw_ref_vta.SetItem(1,"uempq_x_caja_dsp",&
ids_ref_vta.GetItemNumber(1,"uempq_x_caja_dsp"))

tab_1.tabpage_1.dw_ref_vta.SetItem(1,"peso_dn",&
ids_ref_vta.GetItemDecimal(1,"peso_dn"))

tab_1.tabpage_1.dw_ref_vta.SetItem(1,"volumen",&
ids_ref_vta.GetItemDecimal(1,"volumen"))

tab_1.tabpage_1.dw_ref_vta.SetItem(1,"estado",&
ids_ref_vta.GetItemString(1,"estado"))

tab_1.tabpage_1.dw_ref_vta.SetItem(1,"co_grupo_vt",&
ids_ref_vta.GetItemNumber(1,"co_grupo_vt"))

tab_1.tabpage_1.dw_ref_vta.SetItem(1,"co_sgrupo_vt",&
ids_ref_vta.GetItemNumber(1,"co_sgrupo_vt"))
                                      
tab_1.tabpage_1.dw_ref_vta.SetItem(1,"co_composicion",&
ids_ref_vta.GetItemNumber(1,"co_composicion"))

tab_1.tabpage_1.dw_ref_vta.SetItem(1,"co_empq_cnsm",&
ids_ref_vta.GetItemNumber(1,"co_empq_cnsm"))

tab_1.tabpage_1.dw_ref_vta.SetItem(1,"co_grupo_tlla",&
ids_ref_vta.GetItemNumber(1,"co_grupo_tlla"))

Return 1
end function

public function integer of_reset ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 19 de Febrero de 2003 HORA 11:37:55:593
// 
// Borra los datos de los dw para proceder a colocar otra referencia
//////////////////////////////////////////////////////////////////////////

tab_1.tabpage_1.dw_ref_vta.Reset()
tab_1.tabpage_2.dw_ref_pdn.Reset()
tab_1.tabpage_3.dw_colores.Reset()
tab_1.tabpage_1.dw_adicional.Reset()

tab_1.tabpage_4.dw_recurso.Reset()
tab_1.tabpage_4.dw_recurso.InsertRow(0)

tab_1.tabpage_5.dw_dt_vta_pdn.Reset()

tab_1.tabpage_2.sle_observacion.Text=''

Return 1
end function

public function integer of_copiarmuestra ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 17 de Febrero de 2003 HORA 18:48:03:125
// 
// hace la copia de las tabla de la muestra a la referencia
//////////////////////////////////////////////////////////////////////////
long 		ll_Res,ll_recurso
String 	ls_deDiseno
long 		i,ll_tot,ll_color,ll_opcion

of_cargarDatosCopia()

If cbx_mo.checked Then
	ll_res=io_copiar.of_copiaMo()
	If ll_res<>1 Then
		Return -1
	End If
end If

If cbx_mp.Checked Then
	
	If io_copiar.of_controlmo()<>1 Then
		RollBack using  n_cst_application.itr_appl;
		MessageBox("Advertencia!","La referencia no tiene recurso asignado en el centro de tejido o cerrado en mano de obra.",StopSign!)
		Return -1
	End If

//////////////////////////////////////////////////////////////////////////
// Se hace un ciclo para verificar los colores en caso de que se desee
// modificar la ficha de materia prima
//////////////////////////////////////////////////////////////////////////

	ll_tot=tab_1.tabpage_3.dw_colores.RowCount()

//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 10 de Abril de 2003 HORA 15:50:59:359
// 
// Se adiciona la opcion en la copia de materia prima
//////////////////////////////////////////////////////////////////////////
	
	For i=1 To ll_tot
		If tab_1.tabpage_3.dw_colores.GetItemNumber(i,"cambio")=1 Then
			ll_color=tab_1.tabpage_3.dw_colores.GetItemNumber(i,"co_color")
			ls_deDiseno=tab_1.tabpage_3.dw_colores.GetItemString(i,"de_diseno")
			ll_opcion=tab_1.tabpage_3.dw_colores.GetItemNumber(i,"co_opcion")
			If IsNull(ll_opcion) Then
				ll_opcion=0
			End If
			If ll_opcion>0 Then
				io_copiar.of_setDisenoRef(tab_1.tabpage_3.dw_colores.GetItemNumber(i,"co_diseno"))
				io_copiar.of_setMuestrarioRef(tab_1.tabpage_3.dw_colores.GetItemNumber(i,"co_muestrario"))
				io_copiar.of_setColorRef(ll_color)		
				io_copiar.of_setColorMue(ll_color)
				io_copiar.of_setDeDiseno(ls_deDiseno)
				io_copiar.of_setOpcionMpMues(ll_opcion)
				ll_res=io_copiar.of_copiamp()
				
				If ll_res<>1 Then
					Return -1
				End If			
			End If	
		end If
	Next
	
End If

If cbx_ft.checked Then
	ll_recurso=tab_1.tabpage_4.dw_recurso.GetItemNumber(1,"co_recurso")
	io_copiar.of_setRecursoRef( ll_Recurso)
	ll_res=io_copiar.of_copiaft()
	If ll_res<>1 Then
		Return -1
	End If	

End If

//////////////////////////////////////////////////////////////////////////
// Se actualiza la observacion y se registra un logcito de 
// copias de muestra a referencia
//////////////////////////////////////////////////////////////////////////

If cbx_mo.Checked Then
	io_copiar.of_setswcopiaMo(1)
Else
	io_copiar.of_setswcopiaMo(0)
End If

If cbx_ft.Checked Then
	io_copiar.of_setswcopiaFt(1)
Else
	io_copiar.of_setswcopiaFt(0)
End If

io_copiar.of_setObservacion(tab_1.tabpage_2.sle_observacion.Text)

If io_copiar.of_actualizarCambio()<>1 Then
	Return -1
End If

If cbx_mp.Checked Then
	For i=1 To ll_tot
		If tab_1.tabpage_3.dw_colores.GetItemNumber(i,"cambio")=1 Then
			ll_color=tab_1.tabpage_3.dw_colores.GetItemNumber(i,"co_color")
			ls_deDiseno=tab_1.tabpage_3.dw_colores.GetItemString(i,"de_diseno")
			io_copiar.of_setDisenoRef(tab_1.tabpage_3.dw_colores.GetItemNumber(i,"co_diseno"))
			io_copiar.of_setMuestrarioRef(tab_1.tabpage_3.dw_colores.GetItemNumber(i,"co_muestrario"))
			io_copiar.of_setColorRef(ll_color)
			io_copiar.of_setColorMue(ll_color)
			io_copiar.of_setDeDiseno(ls_deDiseno)
			
			If io_copiar.of_actualizarCambioColor()<>1 Then
				Return -1
			End If	
			
		end If
	Next
End If

Return 1
end function

public function integer of_nombrereferenciav (long a_fabricav, long a_lineav, long a_referenciav, long a_tallav, long a_calidadv);Long ll_res

If IsNull(a_fabricav) or IsNUll(a_lineav) or IsNull(a_referenciav) or &
   IsNull(a_tallav) or IsNull(a_calidadv) Then
	
	Return 1
End If
//////////////////////////////////////////////////////////////////////////
// Verifica si se han hecho cambios en los colores
// 
//////////////////////////////////////////////////////////////////////////

tab_1.tabpage_1.dw_ref_vta.SetRedraw(False)

ll_res=tab_1.tabpage_1.dw_ref_vta.Retrieve(a_fabricav,a_lineav,a_referenciav,a_tallav,a_calidadv)

If ll_res<0 Then
	MessageBox("Advertencia!","Error recuperando referencia de venta.",StopSign!)
	Return -1
ElseIf ll_res=0 then
	tab_1.tabpage_1.dw_ref_vta.InsertRow(0)
	tab_1.tabpage_1.dw_ref_vta.SetItem(1,"co_fabricav",a_fabricav)
	tab_1.tabpage_1.dw_ref_vta.SetItem(1,"co_lineav",a_lineav)
	tab_1.tabpage_1.dw_ref_vta.SetItem(1,"co_referenciav",a_referenciav)
	tab_1.tabpage_1.dw_ref_vta.SetItem(1,"co_tallav",a_tallav)
	tab_1.tabpage_1.dw_ref_vta.SetItem(1,"co_calidadv",1)
	If of_memoriaVta()<>1 Then
		of_copiaDatosMuestraRef(1)
		of_copiaPdnVta()
	End If
Else

End If

tab_1.tabpage_5.dw_dt_vta_pdn.Reset()
tab_1.tabpage_1.dw_adicional.Reset()
tab_1.tabpage_1.dw_adicional.InsertRow(0)


tab_1.tabpage_1.dw_ref_vta.SetColumn("co_tallav")

of_desRefVta()


dw_dt_ref_vta.Retrieve(a_fabricav,a_lineav,a_referenciav,a_tallav,a_calidadv)
//////////////////////////////////////////////////////////////////////////
// Si se recupera la referencia de venta, los datos de los colores, se
// muestran y no se dejan modificar.
//////////////////////////////////////////////////////////////////////////

tab_1.tabpage_1.dw_ref_vta.SetRedraw(True)

long ll_fab,ll_lin,ll_mues,ll_talla

ll_fab=dw_head.GetItemNumber(1,"co_fabrica")
ll_lin=dw_head.GetItemNumber(1,"co_linea")
ll_mues=dw_head.GetItemNumber(1,"co_muestra")
ll_talla=dw_head.GetItemNumber(1,"co_talla")

tab_1.tabpage_3.dw_colores.Retrieve(ll_fab,ll_lin,ll_mues,ll_talla)
of_nombreColoresMuestra()

of_coloresrefvta()

Return 1
end function

public function integer of_copiapdnvta ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 19 de Marzo de 2003 HORA 09:14:31:375
// 
// copia algunos datos de la referencia de pdn a la referencia de vta
//////////////////////////////////////////////////////////////////////////
long ll_fabrica,ll_linea
String ls_unidad

//ll_fabrica=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_fabrica")
//ll_linea=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_linea")
//ls_unidad=tab_1.tabpage_2.dw_ref_pdn.GetItemString(1,"co_unidad")
//
//tab_1.tabpage_1.dw_ref_vta.SetItem(1,"co_fabricav",ll_fabrica)
//tab_1.tabpage_1.dw_ref_vta.SetItem(1,"co_lineav",ll_linea)
//tab_1.tabpage_1.dw_ref_vta.SetItem(1,"co_unidadv",ls_unidad)
//


Return 1


end function

public function integer of_grabar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 15 de Febrero de 2003 HORA 15:25:27:640
// 
// Para almacenar los datos
//////////////////////////////////////////////////////////////////////////
DateTime ldt_fecha
String ls_usuario,ls_instancia

If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If



long ll_fabricaVta,ll_lineaVta,ll_refVta,ll_tallaVta,ll_calidadVta
long ll_fabricaPdn,ll_lineaPdn,ll_refPdn,ll_tallaPdn,ll_calidadPdn



ll_fabricaVta=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_fabricav")
ll_lineaVta=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_lineav")
ll_refVta=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_referenciav")
ll_tallaVta=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_tallav")
ll_calidadVta=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_calidadv")

ll_fabricaPdn=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_fabrica")
ll_lineaPdn=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_linea")
ll_refPdn=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_referencia")
ll_tallaPdn=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_talla")
ll_calidadPdn=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_calidad")
	
dw_s_muestrario_color.reset( )

If tab_1.tabpage_5.dw_dt_vta_pdn.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
	Return -1
End If

//////////////////////////////////////////////////////////////////////////
// Se actualizan los colores
// 
//////////////////////////////////////////////////////////////////////////
If of_colorMuesRef()<>1 Then
	Return -1
End If

If dw_dt_ref_vta.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
	Return -1
End If

If dw_s_muestrario_color.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
	Return -1
End If

//////////////////////////////////////////////////////////////////////////
// Se ingresa el resitro en s_precios_vta
// 
//////////////////////////////////////////////////////////////////////////
long ll_res
dw_s_precio_vta.Reset()
ll_res=dw_s_precio_vta.Retrieve(ll_fabricaVta,ll_lineaVta,ll_refVta,&
                       ll_tallaVta,ll_calidadVta)
							  
If ll_res=-1 Then
	MessageBox("Advertencia!","Error en s_precio_vta",StopSign!)
	Return -1
End If

If ll_res=0 Then
	dw_s_precio_vta.InsertRow(0)

//////////////////////////////////////////////////////////////////////////
// busco el a$$HEX1$$f100$$ENDHEX$$o mes en cf_user
// 
//////////////////////////////////////////////////////////////////////////
	Datetime ldt_ano_mes
	
	  SELECT cf_user.ano_mes  
		 INTO :ldt_ano_mes  
		 FROM cf_user  
		WHERE ( cf_user.usuario = :n_cst_application.is_user ) AND  
				( cf_user.co_fabrica = :ll_fabricaVta )   
		using n_cst_application.itr_appl;
	
	If n_cst_application.itr_appl.SQLcode=-1 Then 
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(n_cst_application.itr_appl)
		Return -1
	End If
	
	If n_cst_application.itr_appl.SQLcode=100 Then 
		MessageBox("Advertencia!","No se pudo determinar el a$$HEX1$$f100$$ENDHEX$$o mes del ususario, comuniquese con sistemas e indique problema con cf_user.",StopSign!)
		Return -1
	End If
	
	
	dw_s_precio_vta.SetItem(1,"co_fabricav",ll_fabricaVta)
	dw_s_precio_vta.SetItem(1,"co_lineav",ll_lineaVta)
	dw_s_precio_vta.SetItem(1,"co_referenciav",ll_refVta)
	dw_s_precio_vta.SetItem(1,"co_tallav",ll_tallaVta)
	dw_s_precio_vta.SetItem(1,"co_calidadv",ll_calidadVta)
	dw_s_precio_vta.SetItem(1,"ano_mes",ldt_ano_mes)
	dw_s_precio_vta.SetItem(1,"pr_venta",0)
	dw_s_precio_vta.SetItem(1,"pr_suger",0)
End If

If dw_s_precio_vta.of_DatosActualizacion(ldt_fecha,ls_usuario,ls_instancia)<>1 Then
	Return -1
End If

/*
* MODIFICADO: Agosto 25 de 2009 - gagudelo - ohlondon
* Se debe preguntar por el tipo de producto para saber si se
* guardan los datos en produrif (tipo 20) o en producto 
* (tipo 10)
*/


If tab_1.tabpage_2.dw_ref_pdn.Update(True,False)<>1 Then
	RollBack Using n_cst_application.itr_appl ;
	Return -1
End If

If tab_1.tabpage_1.dw_ref_vta.Update(True,False)<>1 Then
	RollBack Using n_cst_application.itr_appl ;
	Return -1
End If

If tab_1.tabpage_5.dw_dt_vta_pdn.Update(True,False)<>1 Then
	RollBack Using n_cst_application.itr_appl ;
	Return -1
End If

If dw_dt_ref_vta.Update(True,False)<>1 Then
	RollBack Using n_cst_application.itr_appl ;
	Return -1
End If

If dw_s_precio_vta.Update(True,False)<>1 Then
	RollBack Using n_cst_application.itr_appl ;
	Return -1
End If

If dw_s_muestrario_color.Update(True,False)<>1 Then
	RollBack Using n_cst_application.itr_appl ;
	Return -1
End If

//////////////////////////////////////////////////////////////////////////
// aca se termina la creaci$$HEX1$$f300$$ENDHEX$$n de los maestros y se procede a la copia de
// los datos entre muestra y referencia
//////////////////////////////////////////////////////////////////////////
of_memoriaCargar()

If of_copiarMuestra()<>1 Then
	RollBack Using n_cst_application.itr_appl ;
	Return -1
End If
	
tab_1.tabpage_2.dw_ref_pdn.ResetUpdate()
tab_1.tabpage_1.dw_ref_vta.ResetUpdate()
tab_1.tabpage_5.dw_dt_vta_pdn.ResetUpdate()
dw_dt_ref_vta.ResetUpdate()
Return 1
end function

public function integer of_validar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 12 de Febrero de 2003 HORA 13:14:13:234
// 
//////////////////////////////////////////////////////////////////////////
dw_head.accepttext( )

If tab_1.tabpage_2.dw_ref_pdn.AcceptText()<>1 Then
	tab_1.selecttab(tab_1.tabpage_2)
	tab_1.tabpage_2.dw_ref_pdn.setfocus()		
	MessageBox("Advertencia!","Datos de la referencia de producci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If tab_1.tabpage_1.dw_ref_vta.AcceptText()<>1 Then
	tab_1.selecttab(tab_1.tabpage_1)
	tab_1.tabpage_1.dw_ref_vta.setfocus()		
	
	MessageBox("Advertencia!","Datos de la referencia de venta no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If

If tab_1.tabpage_4.dw_recurso.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos de recurso.",StopSign!)
	Return -1
End If

If tab_1.tabpage_1.dw_adicional.AcceptText()<>1 Then
	MessageBox("Advertencia!","Datos adicionales de la referencia de venta no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If	

If tab_1.tabpage_3.dw_colores.AcceptText()<>1 Then
	tab_1.selecttab(tab_1.tabpage_3)
	tab_1.tabpage_3.dw_colores.setfocus()
	MessageBox("Advertencia!","Datos de colores no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If	

If tab_1.tabpage_5.dw_dt_vta_pdn.RowCount()=0 Then
	MessageBox("Advertencia!","No se ha especificado la distribuci$$HEX1$$f300$$ENDHEX$$n, verifique el muestrario si no ha ingresado los datos.",StopSign!)
	Return -1
End If

If tab_1.tabpage_5.dw_dt_vta_pdn.AcceptText()<>1 Then
	tab_1.selecttab(tab_1.tabpage_5)
	tab_1.tabpage_5.dw_dt_vta_pdn.setfocus()	
	MessageBox("Advertencia!","Datos de distribuci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If	

//////////////////////////////////////////////////////////////////////////
//22/01/2009  
//////////////////////////////////////////////////////////////////////////

Long ll_co_fabrica, ll_co_linea, ll_co_muestra, ll_co_talla,ll_cont,ll_recurso_minimo, ll_co_talla_ref
string ls_dificultad

ll_co_fabrica = dw_head.getitemNumber(1,"co_fabrica")
ll_co_linea = dw_head.getitemNumber(1,"co_linea")
ll_co_muestra = dw_head.getitemNumber(1,"co_muestra")
ll_co_talla = dw_head.getitemNumber(1,"co_talla") 

ll_co_talla_ref = tab_1.tabpage_2.dw_ref_pdn.getitemNumber(1,"co_talla") 

IF ll_co_talla <> ll_co_talla_ref then
	MessageBox("Advertencia!","La talla de la muestra es diferente a la talla de la Referencia.",StopSign!)
	Return -1
End If

	

SELECT count (distinct id_peso)  
INTO :ll_cont
    FROM h_fmp_muestras
   WHERE ( h_fmp_muestras.co_fabrica = :ll_co_fabrica) AND  
         ( h_fmp_muestras.co_linea = :ll_co_linea  ) AND  
         ( h_fmp_muestras.co_muestra = :ll_co_muestra ) AND  
         ( h_fmp_muestras.co_talla = :ll_co_talla  ) AND  
         ( h_fmp_muestras.cnt_opcion = 1 ) 
		USING n_cst_application.itr_appl;	

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

If IsNull(ll_cont) Or ll_cont > 1  Then
	MessageBox("Advertencia!","El estado para todos los colores de la muestra debe ser el mismo .",StopSign!)
	Return -1
End If


//// GAC   Octubre 27 de 2009,  se valida que no se pueda convertir una muestra
///  a referencia sin definir el grado de dificulTAD
SELECT dificultad
  INTO :ls_dificultad 
  FROM m_muestras
 WHERE ( m_muestras.co_fabrica = :ll_co_fabrica) AND  
       ( m_muestras.co_linea = :ll_co_linea  ) AND  
       ( m_muestras.co_muestra = :ll_co_muestra )
 USING n_cst_application.itr_appl;	

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

If ls_dificultad = 'N' or ls_dificultad = 'A' Then
	////ok
Else
	MessageBox("Advertencia!","Debe definir el grado de dificultad de la muestra .",StopSign!)
	Return -1
End If


///// FIN gac
//////////////////////////////////////////////////////////////////////////
// En la distribuci$$HEX1$$f300$$ENDHEX$$n se verifica que sume 100, en caso contrario no es
// v$$HEX1$$e100$$ENDHEX$$lida
//////////////////////////////////////////////////////////////////////////
decimal lde_dist
long i,ll_tot

ll_tot=tab_1.tabpage_5.dw_dt_vta_pdn.RowCount()

If ll_tot=0 Then
	tab_1.selecttab(tab_1.tabpage_5)
	tab_1.tabpage_5.dw_dt_vta_pdn.setfocus()	
	MessageBox("Advertencia!","Datos de distribuci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lidos.",StopSign!)
	Return -1
End If	

For i=1 to ll_tot
	lde_dist=tab_1.tabpage_5.dw_dt_vta_pdn.GetItemDecimal(i,"ca_dstrbcion")
	If lde_dist<0 Then
		MessageBox("Advertencia!","distribuci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida en fila "+String(i)+".",StopSign!)
		Return -1
	End If
Next

lde_dist=tab_1.tabpage_5.dw_dt_vta_pdn.GetItemDecimal(1,"total_total")

If lde_dist<>100 Then
	tab_1.selecttab(tab_1.tabpage_5)
	tab_1.tabpage_5.dw_dt_vta_pdn.setfocus()
	
	MessageBox("Advertencia!","Los porcentajes de distribuci$$HEX1$$f300$$ENDHEX$$n deben sumar 100.",StopSign!)
	Return -1
End If


//////////////////////////////////////////////////////////////////////////
// Se verifica que el grupo de talla de ref vta y ref pdn sea el mismo
// 
//////////////////////////////////////////////////////////////////////////

long ll_grupo_tlla,ll_grupo_tlla1

ll_grupo_tlla=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_grupo_tlla")
ll_grupo_tlla1=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_grupo_tlla")

If ll_grupo_tlla<>ll_grupo_tlla1 Then
	MessageBox("Advertencia!","El grupo de talla de la referencia de venta debe ser el mismo de la referencia de producci$$HEX1$$f300$$ENDHEX$$n, por favor verifique.",StopSign!)
	Return -1
	
End If


//////////////////////////////////////////////////////////////////////////
// Se verifica el ingreso de los datos
// 
//////////////////////////////////////////////////////////////////////////

If Not tab_1.tabpage_2.dw_ref_pdn.of_completeData() Then
	tab_1.selecttab(tab_1.tabpage_2)
	tab_1.tabpage_2.dw_ref_pdn.setfocus()
	Return -1
End If

If Not tab_1.tabpage_1.dw_ref_vta.of_completeData() Then
	tab_1.selecttab(tab_1.tabpage_1)
	tab_1.tabpage_1.dw_ref_vta.setfocus()
	Return -1
End If

If Not tab_1.tabpage_1.dw_adicional.of_completeData() Then
	tab_1.selecttab(tab_1.tabpage_1)
	tab_1.tabpage_1.dw_adicional.setfocus()
	Return -1
End If

long ll_datoPuesto

//////////////////////////////////////////////////////////////////////////
// Verifico los colores que se van a copiar, y que tengan una opci$$HEX1$$f300$$ENDHEX$$n
// diferente a 0
//////////////////////////////////////////////////////////////////////////
long ll_opcion
ll_tot=tab_1.tabpage_3.dw_colores.RowCount()

For i=1 To ll_tot
	ll_datoPuesto=tab_1.tabpage_3.dw_colores.GetItemNumber(i,"dato_puesto")
	If tab_1.tabpage_3.dw_colores.GetItemNumber(i,"cambio")=1 And ll_datoPuesto=0 Then
		If Not tab_1.tabpage_3.dw_colores.of_completeData(i) Then
			tab_1.selecttab(tab_1.tabpage_3)
			tab_1.tabpage_3.dw_colores.SetFocus()
			Return -1
		End If
//		ll_opcion=tab_1.tabpage_3.dw_colores.GetItemNumber(i,"co_opcion")
//		
//		If ll_opcion=0 Then
//			MessageBox("Advertencia!","Opci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida, en fila"+String(i)+".",StopSign!)
//			tab_1.selecttab(tab_1.tabpage_3)
//			tab_1.tabpage_3.dw_colores.SetFocus()
//			Return -1
//		End If
	End If
Next

//////////////////////////////////////////////////////////////////////////
// si se copia ficha tecnica, verifica el recurso
// 
//////////////////////////////////////////////////////////////////////////

If cbx_ft.Checked Then
	If Not tab_1.tabpage_4.dw_recurso.of_completeData() Then
		tab_1.selecttab(tab_1.tabpage_4)
		tab_1.tabpage_4.dw_recurso.setfocus()
		Return -1
	End If	
end If

//////////////////////////////////////////////////////////////////////////
// Se verifican los datos que se copiaron, porque posiblemente hubo un 
// cambio de fabrica
// verifica grupo de pdn
//////////////////////////////////////////////////////////////////////////

long ll_dato
String ls_desc

ll_dato=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_grupo_pdn")

ls_desc=tab_1.tabpage_2.dw_ref_pdn.GetItemString(1,"de_grupo_pdn")

If IsNull(ls_desc) or Trim(ls_desc)="" or IsNull(ll_dato) Then
	tab_1.selecttab(tab_1.tabpage_2)
	tab_1.tabpage_2.dw_ref_pdn.setfocus()
	MessageBox("Advertencia!","Debe especificar el grupo de producci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
	Return -1
End If

ll_dato=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_sgrupo_pdn")

ls_desc=tab_1.tabpage_2.dw_ref_pdn.GetItemString(1,"de_sgrupo_pdn")

If IsNull(ls_desc) or Trim(ls_desc)="" or IsNull(ll_dato) Then
	tab_1.selecttab(tab_1.tabpage_2)
	tab_1.tabpage_2.dw_ref_pdn.setfocus()
	MessageBox("Advertencia!","Debe especificar el subgrupo de producci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
	Return -1
End If

ll_dato=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"nu_ruta")

ls_desc=tab_1.tabpage_2.dw_ref_pdn.GetItemString(1,"de_nu_ruta")

If IsNull(ls_desc) or Trim(ls_desc)="" or IsNull(ll_dato) Then
	tab_1.selecttab(tab_1.tabpage_2)
	tab_1.tabpage_2.dw_ref_pdn.setfocus()
	MessageBox("Advertencia!","Debe especificar la ruta.",StopSign!)
	Return -1
End If

ll_dato=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_grupo_vta")

ls_desc=tab_1.tabpage_1.dw_ref_vta.GetItemString(1,"de_grupo_vta")

If IsNull(ls_desc) or Trim(ls_desc)="" or IsNull(ll_dato) Then
	tab_1.selecttab(tab_1.tabpage_1)
	tab_1.tabpage_1.dw_ref_vta.setfocus()
	MessageBox("Advertencia!","Debe especificar el grupo de venta.",StopSign!)
	Return -1
End If

ll_dato=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_sgrupo_vta")

ls_desc=tab_1.tabpage_1.dw_ref_vta.GetItemString(1,"de_sgrupo_vta")

If IsNull(ls_desc) or Trim(ls_desc)="" or IsNull(ll_dato) Then
	tab_1.selecttab(tab_1.tabpage_1)
	tab_1.tabpage_1.dw_ref_vta.setfocus()
	MessageBox("Advertencia!","Debe especificar el subgrupo de venta.",StopSign!)
	Return -1
End If

ll_dato=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_carac_vta")

ls_desc=tab_1.tabpage_1.dw_ref_vta.GetItemString(1,"de_carac_vta")

If IsNull(ls_desc) or Trim(ls_desc)="" or IsNull(ll_dato) Then
	tab_1.selecttab(tab_1.tabpage_1)
	tab_1.tabpage_1.dw_ref_vta.setfocus()
	MessageBox("Advertencia!","Debe especificar la caracteristica de venta.",StopSign!)
	Return -1
End If
//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 05 de Febrero de 2004 HORA 08:16:13:027
// 
// Verificar que la referencia de venta este sujera a las condiciones de la
// tabla m_siglas_ln
//////////////////////////////////////////////////////////////////////////

long ll_fabricaVta,ll_lineaVta,ll_refVta,ll_tallaVta,ll_calidadVta
long ll_fabricaPdn,ll_lineaPdn,ll_refPdn,ll_tallaPdn,ll_calidadPdn



ll_fabricaVta=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_fabricav")
ll_lineaVta=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_lineav")
ll_refVta=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_referenciav")
ll_tallaVta=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_tallav")
ll_calidadVta=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_calidadv")

ll_fabricaPdn=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_fabrica")
ll_lineaPdn=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_linea")
ll_refPdn=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_referencia")
ll_tallaPdn=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_talla")
ll_calidadPdn=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_calidad")

If ll_tallaVta<>ll_tallaPdn Then
	MessageBox("Advertencia!","La talla de venta y de producci$$HEX1$$f300$$ENDHEX$$n deben ser igulaes.",StopSign!)
	Return -1
End If

If ll_calidadVta<>ll_calidadPdn Then
	MessageBox("Advertencia!","La calidad de venta y de producci$$HEX1$$f300$$ENDHEX$$n deben ser iguales.",StopSign!)
	Return -1
End If

Long ll_fabrica,ll_linea,ll_vtadif

  SELECT m_siglas_ln.co_fabricav,   
         m_siglas_ln.co_lineav,   
         m_siglas_ln.sw_vtadif  
    INTO :ll_fabrica,   
         :ll_linea,   
         :ll_vtadif  
    FROM m_siglas_ln  
   WHERE ( m_siglas_ln.co_fabrica = :ll_fabricaPdn ) AND  
         ( m_siglas_ln.co_linea = :ll_lineaPdn ) 
using n_cst_application.itr_appl;

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

If n_cst_application.itr_appl.SQLcode=100 Then
	MessageBox("Advertencia!","No existe registro en m_siglas_ln, comuniquese con sistemas.",StopSign!)
	Return -1
End If

If ll_fabricaVta<>ll_fabrica Then
	MessageBox("Advertencia!","La f$$HEX1$$e100$$ENDHEX$$brica de venta debe ser "+String(ll_fabrica)+".",StopSign!)
	Return -1
End If

If ll_lineaVta<>ll_linea Then
	MessageBox("Advertencia!","La l$$HEX1$$ed00$$ENDHEX$$nea de venta debe ser "+String(ll_linea)+".",StopSign!)
	Return -1
End If

If ll_vtadif=0 Then
	If ll_refVta<>ll_refPdn Then
		MessageBox("Advertencia!","La referenca de venta y de producci$$HEX1$$f300$$ENDHEX$$n deben ser iguales.",StopSign!)
		Return -1

	End If
End If


Return 1
end function

public function integer of_nombrereferenciapdn (long a_fabrica, long a_linea, long a_referencia, long a_talla, long a_calidad);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 11 de Febrero de 2003 HORA 14:36:38:343
// 
// Datos de la referencia de producci$$HEX1$$f300$$ENDHEX$$n
//////////////////////////////////////////////////////////////////////////

Long ll_resPdn,ll_res

If IsNull(a_fabrica) or IsNUll(a_linea) or IsNull(a_referencia) or &
   IsNull(a_talla) or IsNull(a_calidad) Then
	
	Return 1
End If

tab_1.tabpage_2.dw_ref_pdn.SetRedraw(False)

ll_resPdn=tab_1.tabpage_2.dw_ref_pdn.Retrieve(a_fabrica,a_linea,a_referencia,a_talla,a_calidad)

If ll_resPdn<0 Then
	tab_1.tabpage_2.dw_ref_pdn.SetRedraw(True)
	MessageBox("Advertencia!","Error recuperando referencia de producci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
	Return -1
End If

If ll_resPdn=1 Then
	tab_1.tabpage_2.dw_ref_pdn.Reset()
	tab_1.tabpage_2.dw_ref_pdn.InsertRow(0)
	tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"co_fabrica",a_fabrica)
	tab_1.tabpage_2.dw_ref_pdn.SetColumn("co_fabrica")
	tab_1.tabpage_2.dw_ref_pdn.SetRedraw(True)
	MessageBox("Advertencia!","La referencia ya existe, debe utilizar una nueva.",StopSign!)
	Return -1
End If

If ll_resPdn=0 then
	tab_1.tabpage_2.dw_ref_pdn.InsertRow(0)
	tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"co_fabrica",a_fabrica)
	tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"co_linea",a_linea)
	tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"co_referencia",a_referencia)
	tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"co_talla",a_talla)
	tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"co_calidad",1)
	If of_memoriaPdn()<>1 Then
		of_copiaDatosMuestraRef(2)
	End If
End If

tab_1.tabpage_5.dw_dt_vta_pdn.Reset()
tab_1.tabpage_1.dw_adicional.Reset()
tab_1.tabpage_1.dw_adicional.InsertRow(0)

tab_1.tabpage_2.dw_ref_pdn.SetColumn("co_talla")


of_desRefPdn()

tab_1.tabpage_2.dw_ref_pdn.SetRedraw(True)

long ll_fab,ll_lin,ll_mues,ll_talla

ll_fab=dw_head.GetItemNumber(1,"co_fabrica")
ll_lin=dw_head.GetItemNumber(1,"co_linea")
ll_mues=dw_head.GetItemNumber(1,"co_muestra")
ll_talla=dw_head.GetItemNumber(1,"co_talla")

tab_1.tabpage_3.dw_colores.Retrieve(ll_fab,ll_lin,ll_mues,ll_talla)
of_nombreColoresMuestra()

//////////////////////////////////////////////////////////////////////////
// Si existe la ref de pdn, verifico si tiene una ref de vta asociada
// 
//////////////////////////////////////////////////////////////////////////

//If ll_resPdn>0 Then
//	ll_res=of_refPdnVta(a_fabrica,a_linea,a_referencia,a_talla,a_calidad)
//
////////////////////////////////////////////////////////////////////////////
//// Se copian los datos de los colores
//// 
////////////////////////////////////////////////////////////////////////////
//	If ll_res=1 Then
//		of_datosColRef(a_fabrica,a_linea,a_referencia,a_talla,a_calidad)
//	End If
//End If
//

Return 1
end function

public function integer of_copiadatosmuestraref (long a_pdn_vta);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 22 de Febrero de 2003 HORA 08:40:55:859
// 
// Copio algunos datos de la muestra en las referencias
// - de referencia
// - tipo producto
// - bpl co_tipo prod --> forma tejer
// - co grupo talla
// - grupo venta
// - subgrupo venta
// --> co_Recurso el de tejido de mat prima
//
// Argumento 1 --> venta
//           2 --> produccion              
//////////////////////////////////////////////////////////////////////////
String ls_de_referencia

ls_de_referencia=Trim(dw_head.GetItemString(1,"de_muestra"))
long ll_tipoprod

ll_tipoprod=dw_head.GetItemNumber(1,"co_tipoprod")


String ls_bpl_co_tipo_prod

ls_bpl_co_tipo_prod=dw_head.GetItemString(1,"bpl_co_tipoprod")

//long ll_grupoTlla
//
//ll_grupoTlla=dw_head.GetItemNUmber(1,"co_grupo_tlla")
//

long ll_grpVta

ll_grpVta=dw_head.GetItemNUmber(1,"co_grupo_vta")



long ll_subGrpVta

ll_subGrpVta=dw_head.GetItemNUmber(1,"co_sgrupo_vta")

long ll_tipo_tejido,ll_res
n_cst_comun lo_comun
////////////
If a_pdn_vta=2 Then
	tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"co_tipoprod",ll_tipoprod)
	
	tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"de_referencia",ls_de_Referencia)
	tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"bpl_co_tipoprod",ls_bpl_co_tipo_prod)
	
//	tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"co_grupo_tlla",ll_grupoTlla)
	
	ll_tipo_tejido=dw_head.GetItemNUmber(1,"co_tipo_tejido")
	
	tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"co_ttejido",ll_tipo_tejido)
	
	ll_res=lo_comun.of_nombreTTejido(ll_tipo_tejido,n_cst_application.itr_appl)
												
	If ll_res=1 Then
		tab_1.tabpage_2.dw_ref_pdn.SetItem(1,"de_ttejido",lo_comun.of_getstring(1))
	Else
		MessageBox("Advertencia!","Por favor verifique el tipo de tejido.",StopSign!)
	End If
	
	
Else
	tab_1.tabpage_1.dw_ref_vta.SetItem(1,"co_grupo_vta",ll_grpVta)
	tab_1.tabpage_1.dw_ref_vta.SetItem(1,"co_sgrupo_vta",ll_subGrpVta)

	tab_1.tabpage_1.dw_ref_vta.SetItem(1,"de_referenciav",ls_de_referencia)
//	tab_1.tabpage_1.dw_ref_vta.SetItem(1,"co_grupo_tlla",ll_grupoTlla)	
End If

Return 1
end function

public function integer of_asignarmuestrarioactual (long a_fabrica, long a_linea);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 24 de Febrero de 2003 HORA 12:09:01:343
// 
// Se asigna el muestrario actual
//////////////////////////////////////////////////////////////////////////

Long ll_res
n_cst_comun lo_comun

ll_res=lo_comun.of_muestrarioactual( a_fabrica, a_linea, n_cst_application.itr_appl)

If ll_res=1 Then
	il_muestrarioActual=lo_comun.of_getLong(1)
End If

Return 1
			

end function

public function integer of_cargardatoscopia ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 12 de Febrero de 2003 HORA 13:19:05:125
// 
// Carga de los datos de la copia
//////////////////////////////////////////////////////////////////////////


long ll_fabrica,ll_linea,ll_referencia,ll_talla,ll_calidad,ll_res

ll_fabrica=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_fabrica")
ll_linea=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_linea")
ll_referencia=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_referencia")
ll_talla=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_talla")
ll_calidad=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_calidad")


io_copiar.of_setFabricaRef(ll_fabrica)
io_copiar.of_setLineaRef(ll_linea)
io_copiar.of_setReferencia(ll_referencia)
io_copiar.of_setTallaRef(ll_talla)
io_copiar.of_setCalidadRef(ll_calidad)

long ll_fabricaMue,ll_lineaMue,ll_muestra,ll_tallaMue

ll_fabricaMue=dw_head.GetItemNumber(1,"co_fabrica")
ll_lineaMue=dw_head.GetItemNumber(1,"co_linea")
ll_muestra=dw_head.GetItemNumber(1,"co_muestra")
ll_tallaMue=dw_head.GetItemNumber(1,"co_talla")

io_copiar.of_setFabricaMue(ll_fabricaMue)
io_copiar.of_setLineaMue(ll_lineaMue)
io_copiar.of_setMuestra(ll_muestra)
io_copiar.of_setTallaMue(ll_tallaMue) //talla de la muestra
io_copiar.of_setCalidadMue(1) //calidad 1

io_copiar.of_SetTransaction(n_cst_application.itr_appl)

//////////////////////////////////////////////////////////////////////////
// Se asigna el tipo de producto
// 
//////////////////////////////////////////////////////////////////////////
long ll_tipoProd

ll_tipoProd=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_tipoprod")

io_copiar.of_setTipoProd(ll_tipoProd)

Return 1


end function

public function integer of_verifica_medida_reposada (long a_fabrica, long a_linea, long a_muestra, long a_talla);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 18 de Agosto de 2004 HORA 10:37:52:328
// 
// Cuando se pasa una muestra referencia se verifica que 
// tenga 6 medidas reposadas, mayores a 0
//////////////////////////////////////////////////////////////////////////
Long ll_cantidad


  SELECT count(*)  
    INTO :ll_cantidad  
    FROM dt_med_mue_rep  , dt_muestras
   WHERE ( dt_med_mue_rep.co_fabrica = :a_fabrica ) AND  
         ( dt_med_mue_rep.co_linea = :a_linea ) AND  
         ( dt_med_mue_rep.co_muestra = :a_muestra ) AND  
         ( dt_med_mue_rep.co_talla = :a_talla ) AND  
         ( dt_med_mue_rep.ca_cm > 0 ) AND
  		   ( dt_med_mue_rep.co_recurso = dt_muestras.co_recurso)  AND
		   ( dt_med_mue_rep.co_fabrica = dt_muestras.co_fabrica ) AND  
         ( dt_med_mue_rep.co_linea = dt_muestras.co_linea ) AND  
         ( dt_med_mue_rep.co_muestra = dt_muestras.co_muestra ) AND  
         ( dt_med_mue_rep.co_talla = dt_muestras.co_talla )
			
  using n_cst_application.itr_appl    ;


If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

If IsNull(ll_cantidad) Then 
	ll_cantidad=0
End If

//If ll_cantidad <> 6 Then
If ll_cantidad < 1 Then
	Return -1
End If

Return 1
end function

public function integer of_verifcateorica (long a_recurso, long a_fabrica, long a_linea, long a_muestra, long a_talla);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Lunes 28 de Marzo de 2005 HORA 10:14:25:140
// 
// Se verifica que tenga la cantidad teorica registrada
//////////////////////////////////////////////////////////////////////////
decimal lde_teorica


  SELECT m_producc_teo_mues.produccion_teo  
    INTO :lde_teorica  
    FROM m_producc_teo_mues  
   WHERE ( m_producc_teo_mues.co_recurso = :a_recurso ) AND  
         ( m_producc_teo_mues.co_fabrica = :a_fabrica ) AND  
         ( m_producc_teo_mues.co_linea = :a_linea ) AND  
         ( m_producc_teo_mues.co_muestra = :a_muestra ) AND  
         ( m_producc_teo_mues.co_talla = :a_talla )  
			using n_cst_application.itr_appl;

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

If IsNull(lde_teorica) Then
	lde_teorica=-1
End If

If lde_teorica<=0 Then
	MessageBox("Advertencia!",&
	"No se ha ingresado la producci$$HEX1$$f300$$ENDHEX$$n te$$HEX1$$f300$$ENDHEX$$rica de la muestra, por favor verifique.",StopSign!)
	Return -1
End If

Return 1
end function

public function integer of_validar_grupo_talla (long a_fabrica, long a_linea, long a_referencia, long a_talla, long a_grupo_talla);/*

Se verifica que si existe el gurpo de talla, en otra talla
este no se pueda cambiar

*/

long ll_grupo_existente

  SELECT min(m_ref_pdn.co_grupo_tlla)  
    INTO :ll_grupo_existente  
    FROM m_ref_pdn  
   WHERE ( m_ref_pdn.co_fabrica = :a_fabrica ) AND  
         ( m_ref_pdn.co_linea = :a_linea ) AND  
         ( m_ref_pdn.co_referencia = :a_referencia ) AND  
         ( m_ref_pdn.co_talla <> :a_talla )   
			
using n_cst_application.itr_appl;

If n_cst_application.itr_appl.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If
//En caso de que sea nulo es porque no hay una anterior
//entonces puede ser cualquier grupo
If IsNull(ll_grupo_existente) Then
	Return 1
End If

If ll_grupo_existente<>a_grupo_talla Then
	MessageBox("Advertencia!","La referencia ya existe con tallas en el grupo "+&
	String(ll_grupo_existente)+".",StopSign!)
	Return -1
End If


Return 1
end function

public function integer of_verificar_medidas_estiradas (long a_fabrica, long a_linea, long a_muestra, long a_talla);//////////////////////////////////////////////////////////////////////////
// 
//////////////////////////////////////////////////////////////////////////
Long ll_cantidad


 	SELECT count(*)  
    INTO :ll_cantidad  
    FROM dt_med_mue  , dt_muestras
   WHERE ( dt_med_mue.co_fabrica = :a_fabrica ) AND  
         ( dt_med_mue.co_linea = :a_linea ) AND  
         ( dt_med_mue.co_muestra = :a_muestra ) AND  
         ( dt_med_mue.co_talla = :a_talla ) AND  
         ( dt_med_mue.co_recurso = dt_muestras.co_recurso)  AND
		   ( dt_med_mue.co_fabrica = dt_muestras.co_fabrica ) AND  
         ( dt_med_mue.co_linea = dt_muestras.co_linea ) AND  
         ( dt_med_mue.co_muestra = dt_muestras.co_muestra ) AND  
         ( dt_med_mue.co_talla = dt_muestras.co_talla )
			
  using n_cst_application.itr_appl    ;


If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

If IsNull(ll_cantidad) or ll_cantidad = 0 Then 
	Return -1
End If

Return 1
end function

public function integer of_verificar_muestra_ref (long a_fabrica, long a_linea, long a_muestra, long a_talla);//////////////////////////////////////////////////////////////////////////
// 
//////////////////////////////////////////////////////////////////////////
Long ll_cantidad

SELECT count(*)
INTO :ll_cantidad
FROM dt_muestras_ref
WHERE co_fabrica = :a_fabrica AND  
      co_linea = :a_linea AND  
      co_muestra = :a_muestra AND  
      co_talla = :a_talla 
  using n_cst_application.itr_appl    ;


If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

If IsNull(ll_cantidad) or ll_cantidad = 0 Then 
	Return 1
Elseif ll_cantidad > 0 Then  
	Return -1	
End If

end function

public function integer of_connect_trans (integer ai_fabrica_conexion);
//IF al_tipoprod = 10 THEN
//	li_fabrica_conex = 2
//ELSEIF li_tipoprod = 20 THEN
//	li_fabrica_conex = 5
//END IF

String ls_dbms,ls_database,ls_servername,ls_lock, ls_dbparm
	
//S$$HEX2$$ed002000$$ENDHEX$$todo ha estado bien conectar ahora a la base de datos de la aplicaci$$HEX1$$f300$$ENDHEX$$n
ls_dbms       = n_cst_application.Of_GetProFile(n_cst_application.is_pathfileconf,'fabrica'+String(ai_fabrica_conexion),'DBMS')
ls_database   = n_cst_application.Of_GetProFile(n_cst_application.is_pathfileconf,'fabrica'+String(ai_fabrica_conexion),'DATABASE')
ls_servername = n_cst_application.Of_GetProFile(n_cst_application.is_pathfileconf,'fabrica'+String(ai_fabrica_conexion),'SERVERNAME')
ls_lock       = n_cst_application.Of_GetProFile(n_cst_application.is_pathfileconf,'fabrica'+String(ai_fabrica_conexion),'LOCK')
ls_dbparm     = n_cst_application.Of_GetProFile(n_cst_application.is_pathfileconf,'fabrica'+String(ai_fabrica_conexion),'DBPARM')

DISCONNECT USING n_cst_application.itr_appl;

// Profile producto@marrs01
n_cst_application.itr_appl.DBMS       = ls_dbms
n_cst_application.itr_appl.Database   = ls_database
n_cst_application.itr_appl.UserId     = n_cst_application.is_user
n_cst_application.itr_appl.DBPass     = n_cst_application.is_passwd
n_cst_application.itr_appl.ServerName = ls_servername
n_cst_application.itr_appl.AutoCommit = False
n_cst_application.itr_appl.DBParm     = ls_dbparm

CONNECT USING n_cst_application.itr_appl;
If n_cst_application.itr_appl.SqlCode < 0 THEN
	MessageBox("Advertencia","No se pudo conectar con la BD para ejecutar el procedimiento sp_asignar_muestra.~n~n"+n_cst_application.itr_appl.SqlErrText)
	RETURN -1
END IF
Return 1
end function

public subroutine of_reconectar_dw ();/*
Se deben reconcectar los objetos con la BD

*/
dw_head.SetTransObject(n_cst_application.itr_appl)

tab_1.tabpage_1.dw_ref_vta.SetTransObject(n_cst_application.itr_appl)
tab_1.tabpage_2.dw_ref_pdn.SetTransObject(n_cst_application.itr_appl)
tab_1.tabpage_3.dw_colores.SetTransObject(n_cst_application.itr_appl)
tab_1.tabpage_5.dw_dt_vta_pdn.SetTransObject(n_cst_application.itr_appl)
dw_dt_ref_vta.SetTransObject(n_cst_application.itr_appl)
dw_s_precio_vta.SetTransObject(n_cst_application.itr_appl)

ids_ref_vta=create n_ds_application

ids_ref_vta.DataObject=tab_1.tabpage_1.dw_ref_vta.dataobject

ids_ref_vta.SetTransObject(n_cst_application.itr_appl)


ids_ref_pdn=create n_ds_application

ids_ref_pdn.DataObject=tab_1.tabpage_2.dw_ref_pdn.dataobject

ids_ref_pdn.SetTransObject(n_cst_application.itr_appl)

dw_s_muestrario_color.SetTransObject(n_cst_application.itr_appl)

dw_s_precio_vta.SetTransObject(n_cst_application.itr_appl)
end subroutine

public function integer of_verificar_unica_referencia (long al_referencia);//////////////////////////////////////////////////////////////////////////
// 
//////////////////////////////////////////////////////////////////////////
Long ll_cantidad

SELECT count(*)
INTO :ll_cantidad
FROM m_ref_pdn
WHERE co_referencia = :al_referencia  
  using n_cst_application.itr_appl    ;


If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

If IsNull(ll_cantidad) or ll_cantidad = 0 Then 
	Return 0
Elseif ll_cantidad > 0 Then  
	Return 1	
End If

end function

public function integer of_verificar_unica_referencia (long al_referencia, integer ai_fabrica, integer ai_linea, integer ai_talla);//////////////////////////////////////////////////////////////////////////
// 
//////////////////////////////////////////////////////////////////////////
Long ll_cantidad

ll_cantidad = 0

SELECT Count(*)
  INTO :ll_cantidad
  FROM m_ref_pdn
 WHERE co_referencia = :al_referencia
   AND ( co_fabrica <> :ai_fabrica
    OR   co_linea   <> :ai_linea )
  using n_cst_application.itr_appl    ;
  
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

// Si existe la referencia para otra fabrica-linea, no se deja
// continuar
If ll_cantidad > 0 Then  
	Return 1
ElseIf IsNull(ll_cantidad) or ll_cantidad = 0 Then 
	// Si NO existe la referencia para otra fabrica-linea, se
	// busca la talla en la misma fabrica-linea  
   ll_cantidad = 0
	
	SELECT Count(*)
	  INTO :ll_cantidad
	  FROM m_ref_pdn
	 WHERE co_referencia = :al_referencia
   	AND co_fabrica    = :ai_fabrica
	   AND co_linea      = :ai_linea 
  	   AND co_talla      = :ai_talla
	 USING n_cst_application.itr_appl ;
  
	If n_cst_application.itr_appl.SQLcode=-1 Then 
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(n_cst_application.itr_appl)
		Return -1
	End If
   
   // Si existe, no se deja continuar; 
	If ll_cantidad > 0 Then  
		Return 1
	ElseIf IsNull(ll_cantidad) or ll_cantidad = 0 Then 
		// si NO existe, se permite su creacion
      RETURN 0
	END IF
End If 
end function

on w_copia_mta_ref_bk20101021.create
int iCurrent
call super::create
this.dw_s_muestrario_color=create dw_s_muestrario_color
this.dw_s_precio_vta=create dw_s_precio_vta
this.dw_dt_ref_vta=create dw_dt_ref_vta
this.tab_1=create tab_1
this.dw_head=create dw_head
this.cbx_ft=create cbx_ft
this.cbx_mo=create cbx_mo
this.cbx_mp=create cbx_mp
this.gb_2=create gb_2
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_s_muestrario_color
this.Control[iCurrent+2]=this.dw_s_precio_vta
this.Control[iCurrent+3]=this.dw_dt_ref_vta
this.Control[iCurrent+4]=this.tab_1
this.Control[iCurrent+5]=this.dw_head
this.Control[iCurrent+6]=this.cbx_ft
this.Control[iCurrent+7]=this.cbx_mo
this.Control[iCurrent+8]=this.cbx_mp
this.Control[iCurrent+9]=this.gb_2
this.Control[iCurrent+10]=this.gb_1
end on

on w_copia_mta_ref_bk20101021.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_s_muestrario_color)
destroy(this.dw_s_precio_vta)
destroy(this.dw_dt_ref_vta)
destroy(this.tab_1)
destroy(this.dw_head)
destroy(this.cbx_ft)
destroy(this.cbx_mo)
destroy(this.cbx_mp)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 24 de Febrero de 2003 HORA 12:07:46:515
// 
// Se asigna la transaccion a los diferentes dw
//////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 16 de Marzo de 2005 HORA 08:08:15:156
// 
// Solicitud de Servicio 7918
// Solos e pueden pasar muestras a referencias si se est$$HEX2$$e1002000$$ENDHEX$$conectado a 
// Crypro01, se coloca este dato como parametro en el .ini
//////////////////////////////////////////////////////////////////////////

String ls_instancia

//ls_instancia=n_cst_application.Of_GetProFile(n_cst_application.is_pathfileconf,&
//					n_cst_application.is_sessionapp,"SERVERNAME_CONVERTIR")
//If ls_instancia="" Then
//	ls_instancia="sabdbs01@crypro01"
//End If
//
//If n_cst_application.itr_appl.ServerName<>ls_instancia Then
//	MessageBox("Advertencia!","No puede crear referencias porque no est$$HEX2$$e1002000$$ENDHEX$$conectado a "+&
//	"la f$$HEX1$$e100$$ENDHEX$$brica 2 (Crystal), por favor verifique.",StopSign!)
//	close(This)
//	Return
//End If
//
is_ruta_ini = GetCurrentDirectory()

dw_head.SetTransObject(n_cst_application.itr_appl)

tab_1.tabpage_1.dw_ref_vta.SetTransObject(n_cst_application.itr_appl)
tab_1.tabpage_2.dw_ref_pdn.SetTransObject(n_cst_application.itr_appl)
tab_1.tabpage_3.dw_colores.SetTransObject(n_cst_application.itr_appl)
tab_1.tabpage_5.dw_dt_vta_pdn.SetTransObject(n_cst_application.itr_appl)
dw_dt_ref_vta.SetTransObject(n_cst_application.itr_appl)
dw_s_precio_vta.SetTransObject(n_cst_application.itr_appl)

tab_1.tabpage_4.dw_recurso.InsertRow(0)
//tab_1.tabpage_1.dw_ref_vta.InsertRow(0)
//tab_1.tabpage_2.dw_ref_pdn.InsertRow(0)

//////////////////////////////////////////////////////////////////////////
// Creo datastore para el manejo de la memoria de ref, cuando se hace
// cambio de talla
//////////////////////////////////////////////////////////////////////////


ids_ref_vta=create n_ds_application

ids_ref_vta.DataObject=tab_1.tabpage_1.dw_ref_vta.dataobject

ids_ref_vta.SetTransObject(n_cst_application.itr_appl)


ids_ref_pdn=create n_ds_application

ids_ref_pdn.DataObject=tab_1.tabpage_2.dw_ref_pdn.dataobject

ids_ref_pdn.SetTransObject(n_cst_application.itr_appl)

dw_s_muestrario_color.SetTransObject(n_cst_application.itr_appl)

end event

event ue_find;call super::ue_find;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 14 de Febrero de 2003 HORA 16:46:32:953
// 
// 
//////////////////////////////////////////////////////////////////////////

long    ll_res,ll_tot, ll_recurso_minimo
long    ll_cliente,ll_sucursal,ll_cant ,ll_recurso_mues_bas,ll_recurso_mat_prima
String  ls_tipoMuestra

n_cst_param lo_param
n_cst_comun lo_comun

If ib_cambios Then
	ll_res=MessageBox("Advertencia!","$$HEX2$$bf002000$$ENDHEX$$Desea descartar los cambios ?",Question!,YesNo!,2)
	If ll_res=2 Then
		Return
	End If
	ib_cambios=False
End If

OpenWithParm(w_opc_muestra_talla,is_where_bus)

lo_param=message.powerobjectparm

If Not IsValid(lo_param) Then
	Return
End If
of_reset()

is_where_bus=lo_param.is_vector[1]

//////////////////////////////////////////////////////////////////////////
// Se verifica que las medidas reposadas sean 6 y todas mayores a 0
// 
//////////////////////////////////////////////////////////////////////////

ll_res=of_verifica_medida_reposada(lo_param.il_vector[1] /*long a_fabrica*/,&
                               lo_param.il_vector[2]/*long a_linea*/,&
										 lo_param.il_vector[3]/*long a_muestra*/,&
										 lo_param.il_vector[4]/*long a_talla */)


If ll_res<>1 Then
	MessageBox("Advertencia!","No se han especificado las medidas reposadas para la muestra, por favor verifique.",StopSign!)
	Return
End If

//////////////////////////////////////////////////////////////////////////
// Se las medidas estiradas
// 
//////////////////////////////////////////////////////////////////////////

ll_res=of_verificar_medidas_estiradas(lo_param.il_vector[1] /*long a_fabrica*/,&
                               lo_param.il_vector[2]/*long a_linea*/,&
										 lo_param.il_vector[3]/*long a_muestra*/,&
										 lo_param.il_vector[4]/*long a_talla */)


If ll_res<>1 Then
	MessageBox("Advertencia!","No se han especificado las medidas estiradas para la muestra, por favor verifique.",StopSign!)
	Return
End If

//////////////////////////////////////////////////////////////////////////
  SELECT dt_muestras.id_rec_rest
  INTO :ll_recurso_minimo
    FROM dt_muestras  
   WHERE ( dt_muestras.co_fabrica = :lo_param.il_vector[1] ) AND  
         ( dt_muestras.co_linea = :lo_param.il_vector[2] ) AND  
         ( dt_muestras.co_muestra = :lo_param.il_vector[3] )  AND
			( dt_muestras.co_talla = :lo_param.il_vector[4]  ) 
	USING n_cst_application.itr_appl;	

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return 
End If
			
If isnull(ll_recurso_minimo) or ll_recurso_minimo = 0 Then
	MessageBox("Advertencia!","La Muestra debe tener asignado un recurso m$$HEX1$$ed00$$ENDHEX$$nimo.",StopSign!)
	Return 
End If
		
//////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////
// Se valida que no tenga referencias creadas
// 
//////////////////////////////////////////////////////////////////////////

ll_res=of_verificar_muestra_ref(lo_param.il_vector[1] /*long a_fabrica*/,&
                               lo_param.il_vector[2]/*long a_linea*/,&
										 lo_param.il_vector[3]/*long a_muestra*/,&
										 lo_param.il_vector[4]/*long a_talla */)


If ll_res<>1 Then
	MessageBox("Advertencia!","La muestra ya tiene una referencia asociada",StopSign!)
	Return
End If

//////////////////////////////////////////////////////////////////////////
// Se verifica que tengan materia prima para todas las opciones, posteriormente se hace por color
//////////////////////////////////////////////////////////////////////////

  SELECT count(*)  
    INTO :ll_cant  
    FROM dt_fmp_muestras  
   WHERE ( dt_fmp_muestras.co_fabrica = :lo_param.il_vector[1] /*long a_fabrica*/) AND  
         ( dt_fmp_muestras.co_linea =: lo_param.il_vector[2]/*long a_linea*/) AND  
         ( dt_fmp_muestras.co_muestra = :lo_param.il_vector[3]/*long a_muestra*/ ) AND  
         ( dt_fmp_muestras.co_talla = :lo_param.il_vector[4]/*long a_talla */ )
	using n_cst_application.itr_appl;
			  
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If

If IsNull(ll_cant) Or ll_cant = 0 Then
	MessageBox("Advertencia!","Esta opci$$HEX1$$f300$$ENDHEX$$n NO tiene materia prima, por lo tanto no se puede pasar a referencia, por favor verifique.",StopSign!)
	Return
End If

//////////////////////////////////////////////////////////////////////////
// recupero el recurso de tejido de mano de obra de la muestra
// 
//////////////////////////////////////////////////////////////////////////

long ll_recurso

  SELECT max(m_proref_muestras.co_recurso)  
    INTO :ll_recurso  
    FROM m_proref_muestras  
   WHERE ( m_proref_muestras.co_fabrica = :lo_param.il_vector[1] ) AND  
         ( m_proref_muestras.co_linea = :lo_param.il_vector[2] ) AND  
         ( m_proref_muestras.co_muestra = :lo_param.il_vector[3] ) AND  
         ( m_proref_muestras.co_talla = :lo_param.il_vector[4] ) AND  
         ( m_proref_muestras.co_centro = 12 )   
   using n_cst_application.itr_appl;
			  
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If
			  
If n_cst_application.itr_appl.SQLcode=100 Then 
	MessageBox("Advertencia!","No fue posible determinar el recurso de tejido en la mano de obra.",StopSign!)
	Return
End If

If IsNUll(ll_recurso) Then
	ll_recurso=-1
End If

If ll_recurso<=0 Then
	MessageBox("Advertencia!","No fue posible determinar el recurso de tejido en la mano de obra.",StopSign!)
	Return 
End If

//////////////////////////////////////////////////////////////////////////
// Para comparar los recursos
//////////////////////////////////////////////////////////////////////////

SELECT co_recurso
INTO :ll_recurso_mues_bas
FROM dt_muestras 
WHERE co_fabrica = :lo_param.il_vector[1] AND  
      co_linea = :lo_param.il_vector[2]   AND  
      co_muestra = :lo_param.il_vector[3] AND  
      co_talla = :lo_param.il_vector[4] 
   using n_cst_application.itr_appl;		
		
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If		
		
SELECT min(co_recurso)
INTO :ll_recurso_mat_prima
FROM h_fmp_muestras 
WHERE co_fabrica = :lo_param.il_vector[1] AND  
      co_linea = :lo_param.il_vector[2]   AND  
      co_muestra = :lo_param.il_vector[3] AND  
      co_talla = :lo_param.il_vector[4]  AND
      cnt_opcion = 1
   using n_cst_application.itr_appl;		
		
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return
End If	

IF ll_recurso = ll_recurso_mues_bas AND ll_recurso = ll_recurso_mat_prima THEN
ELSE
	MessageBox("Advertencia!","Los recursos de la muestra b$$HEX1$$e100$$ENDHEX$$sica, materia prima y mano de obra son diferentes.",StopSign!)
	Return 
END IF	
//////////////////////////////////////////////////////////////////////////
// Verifico que la muestra tenga registrada la teorica.
// 
//////////////////////////////////////////////////////////////////////////
ll_res=of_verifcaTeorica(ll_recurso /*long a_recurso*/,&
                     lo_param.il_vector[1]/*long a_fabrica*/,&
							lo_param.il_vector[2]/*long a_linea*/,&
							lo_param.il_vector[3]/*long a_muestra*/,&
							lo_param.il_vector[4]/*long a_talla */)

If ll_res<>1 Then
	Return
End If

ll_tot=dw_head.Retrieve(lo_param.il_vector[1],& 
					  lo_param.il_vector[2],&
					  lo_param.il_vector[3],&
					  lo_param.il_vector[4])

If ll_tot<=0 Then
	MessageBox("Advertencia!","No se pudo recuperar informaci$$HEX1$$f300$$ENDHEX$$n.",StopSign!)
	Return
End If
ll_cliente=dw_head.GetItemNUmber(1,"co_cliente")
ll_sucursal=dw_head.GetItemNUmber(1,"co_sucursal")
ls_tipoMuestra=dw_head.GetItemString(1,"tipo_muestra")
ll_res=lo_comun.of_nombrecliente( ll_cliente,ll_sucursal,ls_tipoMuestra,&
											 n_cst_application.itr_appl)
If ll_res=1 Then
	dw_head.SetItem(1,"de_cliente",lo_comun.of_getString(1))
End If

//////////////////////////////////////////////////////////////////////////
// Se recuperan los colores
// 
//////////////////////////////////////////////////////////////////////////

ll_tot=tab_1.tabpage_3.dw_colores.Retrieve(lo_param.il_vector[1],&
   	              lo_param.il_vector[2],&
						  lo_param.il_vector[3],&
						  lo_param.il_vector[4])
						  
//////////////////////////////////////////////////////////////////////////
// Secoloca la descripci$$HEX1$$f300$$ENDHEX$$n de los colores
// 
//////////////////////////////////////////////////////////////////////////
of_nombreColoresMuestra()
						  
tab_1.tabpage_1.dw_ref_vta.InsertRow(0)
tab_1.tabpage_2.dw_ref_pdn.InsertRow(0)
tab_1.tabpage_1.dw_adicional.InsertRow(0)

DWObject dwo_column
If ll_recurso>0 Then
	dwo_column = tab_1.tabpage_4.dw_recurso.Object.co_recurso
	tab_1.tabpage_4.dw_recurso.SetItem(1,"co_recurso",ll_recurso)
	tab_1.tabpage_4.dw_recurso.Trigger Event ItemChanged(1,dwo_column,String(ll_recurso))
End If



end event

event ue_save;call super::ue_save;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 15 de Febrero de 2003 HORA 16:11:40:359
// 
// 
//////////////////////////////////////////////////////////////////////////

Long li_tipoprod
String ls_ruta_ini

If of_validar()<>1 Then
	Return
End If

li_tipoprod = tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1, 'co_tipoprod')
		
IF li_tipoprod = 20 THEN
	IF of_connect_trans(5) = -1 THEN
		Messagebox("Error", "Ocurri$$HEX2$$f3002000$$ENDHEX$$un error al tratar de conectarse con Printex Ropa.")
		of_connect_trans(2)		
		of_reconectar_dw()
		
		RETURN
	END IF
	of_reconectar_dw( )
END IF

If of_grabar()<>1 Then
	ChangeDirectory(is_ruta_ini)
	IF li_tipoprod = 20 THEN
		of_connect_trans(2)
		of_reconectar_dw( )		
	END IF
	
	Return
End If

Commit Using n_cst_application.itr_appl ;

MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","Datos guardados.")

IF li_tipoprod = 20 THEN
	of_connect_trans(2)
	of_reconectar_dw( )
END IF

ib_cambios=False

of_reset()

end event

event closequery;call super::closequery;Destroy ids_ref_vta
Destroy ids_ref_pdn
end event

type dw_s_muestrario_color from u_dw_application within w_copia_mta_ref_bk20101021
boolean visible = false
integer x = 713
integer y = 1940
integer width = 530
integer height = 176
integer taborder = 70
string dataobject = "dgr_s_muestrario_color"
end type

type dw_s_precio_vta from u_dw_application within w_copia_mta_ref_bk20101021
boolean visible = false
integer x = 18
integer y = 1744
integer width = 530
integer height = 176
integer taborder = 70
string dataobject = "d_s_precio_vta"
end type

type dw_dt_ref_vta from u_dw_application within w_copia_mta_ref_bk20101021
boolean visible = false
integer x = 1189
integer y = 1720
integer width = 859
integer height = 176
integer taborder = 60
string dataobject = "d_dt_ref_vta"
end type

type tab_1 from tab within w_copia_mta_ref_bk20101021
integer x = 23
integer y = 412
integer width = 3397
integer height = 1272
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_2 tabpage_2
tabpage_1 tabpage_1
tabpage_5 tabpage_5
tabpage_3 tabpage_3
tabpage_4 tabpage_4
end type

on tab_1.create
this.tabpage_2=create tabpage_2
this.tabpage_1=create tabpage_1
this.tabpage_5=create tabpage_5
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.Control[]={this.tabpage_2,&
this.tabpage_1,&
this.tabpage_5,&
this.tabpage_3,&
this.tabpage_4}
end on

on tab_1.destroy
destroy(this.tabpage_2)
destroy(this.tabpage_1)
destroy(this.tabpage_5)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
end on

event selectionchanged;If newindex=2 Then
	tab_1.tabpage_1.dw_ref_vta.SetColumn("co_fabricav")
	tab_1.tabpage_1.dw_ref_vta.SetFocus()
ElseIf newindex=3 Then
	tab_1.tabpage_3.dw_colores.SetFocus()
ElseIf newindex=4 Then	
	tab_1.tabpage_4.dw_recurso.SetFocus()
End If
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 3360
integer height = 1152
long backcolor = 80269524
string text = "Referencia de producci$$HEX1$$f300$$ENDHEX$$n"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
sle_observacion sle_observacion
dw_ref_pdn dw_ref_pdn
gb_5 gb_5
end type

on tabpage_2.create
this.sle_observacion=create sle_observacion
this.dw_ref_pdn=create dw_ref_pdn
this.gb_5=create gb_5
this.Control[]={this.sle_observacion,&
this.dw_ref_pdn,&
this.gb_5}
end on

on tabpage_2.destroy
destroy(this.sle_observacion)
destroy(this.dw_ref_pdn)
destroy(this.gb_5)
end on

type sle_observacion from singlelineedit within tabpage_2
integer x = 119
integer y = 984
integer width = 2843
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 255
borderstyle borderstyle = stylelowered!
end type

type dw_ref_pdn from u_dw_application within tabpage_2
integer x = 55
integer y = 80
integer width = 3259
integer height = 820
string dataobject = "d_m_ref_pdn"
boolean vscrollbar = false
boolean livescroll = false
end type

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 11 de Febrero de 2003 HORA 14:31:01:734
// 
// 
//////////////////////////////////////////////////////////////////////////


long ll_fabrica,ll_linea, ll_referencia, ll_talla,ll_calidad,ll_dato,ll_res,&
     ll_tipoprod
n_cst_param lo_param
n_cst_comun lo_comun

ll_fabrica=GetItemNumber(1,"co_fabrica")
ll_linea=GetItemNumber(1,"co_linea")
ll_referencia=GetItemNumber(1,"co_referencia")
ll_talla=GetItemNumber(1,"co_talla")
ll_calidad=1 //GetItemNumber(1,"co_calidad")

// Validar si No existe el registro.
IF (NOT IsNull(ll_fabrica) and ll_fabrica > 0 ) AND &
   (NOT IsNull(ll_linea) and ll_linea > 0 ) AND &
	(NOT IsNull(ll_referencia) and ll_referencia > 0 ) AND &
	(NOT IsNull(ll_talla) and ll_talla >= 0 )THEN
	 
	ll_res = of_verificar_unica_referencia(ll_referencia, ll_fabrica, ll_linea, ll_talla)
	IF ll_res = -1 THEN
		RETURN 1
	ELSEIF ll_res = 1 THEN
		MessageBox("Advertencia!","La referencia ya existe para otra f$$HEX1$$e100$$ENDHEX$$brica-l$$HEX1$$ed00$$ENDHEX$$nea-talla.",Exclamation!)
		Return 1
	END IF
END IF


If dwo.name="co_fabrica" Then
	ll_fabrica=Long(Data)
	of_nombreReferenciaPdn(ll_fabrica,ll_linea,ll_referencia,ll_talla,ll_calidad)
	of_resetMuestrario()
ElseIf dwo.name="co_linea" Then
	ll_linea=Long(Data)
	of_nombreReferenciaPdn(ll_fabrica,ll_linea,ll_referencia,ll_talla,ll_calidad)
	of_resetMuestrario()
ElseIf dwo.name="co_referencia" Then
	ll_referencia=Long(Data)

	of_nombreReferenciaPdn(ll_fabrica,ll_linea,ll_referencia,ll_talla,ll_calidad)
	of_resetMuestrario()
ElseIf dwo.name="co_talla" Then
	ll_talla=Long(Data)
	of_nombreReferenciaPdn(ll_fabrica,ll_linea,ll_referencia,ll_talla,ll_calidad)
end If

If dwo.name="cs_talla" Then
	ll_dato=Long(Data)
	ll_res=lo_comun.of_nombreMTallas(ll_fabrica,ll_linea,ll_talla,ll_dato,&
	                                 n_cst_application.itr_appl)
												
	If ll_res<>1 Then
		MessageBox("Advertencia!","Consecutivo de talla no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_talla",lo_comun.of_getstring(1))
End If

If dwo.name="co_unidad" Then

	ll_res=lo_comun.of_nombreUnidad(data,n_cst_application.itr_appl)
												
	If ll_res<>1 Then
		MessageBox("Advertencia!","Unidad no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_unidad",lo_comun.of_getstring(1))
End If
	
If dwo.name="co_calidad" Then
   ll_dato=long(data)
	ll_res=lo_comun.of_nombreCalidad(ll_dato,n_cst_application.itr_appl)
												
	If ll_res<>1 Then
		MessageBox("Advertencia!","Calidad no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_calidad",lo_comun.of_getstring(1))
End If	

If dwo.name="co_grupo_pdn" Then
   ll_dato=long(data)
	ll_res=lo_comun.of_nombreGrupoPdn( ll_fabrica, ll_dato,n_cst_application.itr_appl)
												
	If ll_res<>1 Then
		MessageBox("Advertencia!","Grupo de venta no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_grupo_pdn",lo_comun.of_getstring(1))
End If	

If dwo.name="co_sgrupo_pdn" Then
   ll_dato=long(data)
	ll_res=lo_comun.of_nombreSGrupoPdn( ll_fabrica, ll_dato,n_cst_application.itr_appl)
												
	If ll_res<>1 Then
		MessageBox("Advertencia!","Subgrupo de venta no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_sgrupo_pdn",lo_comun.of_getstring(1))
End If	

If dwo.name="co_tamano" Then
   ll_dato=long(data)
	ll_res=lo_comun.of_nombreTamano(ll_dato,n_cst_application.itr_appl)
												
	If ll_res<>1 Then
		MessageBox("Advertencia!","Tama$$HEX1$$f100$$ENDHEX$$o no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_tamano",String(lo_comun.of_getLong(1)))
End If	

If dwo.name="bpl_co_tipoprod" Then
   
	ll_res=lo_comun.of_nombreBplTipoProd(data,n_cst_application.itr_appl)
												
	If ll_res<>1 Then
		MessageBox("Advertencia!","BPL tipo prod no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_bpl_co_tipoprod",lo_comun.of_getstring(1))
End If	

If dwo.name="co_tipoprod" Then
   ll_dato=long(data)
	ll_res=lo_comun.of_nombreTipoProd(ll_dato,n_cst_application.itr_appl)
												
	If ll_res<>1 Then
		MessageBox("Advertencia!","Tipo de producto no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_tipoprod",lo_comun.of_getstring(1))
End If	

If dwo.name="co_ttejido" Then
   ll_dato=long(Data)   
	ll_res=lo_comun.of_nombreTTejido(ll_dato,n_cst_application.itr_appl)
												
	If ll_res<>1 Then
		MessageBox("Advertencia!","Tipo de tejido no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_ttejido",lo_comun.of_getstring(1))
End If	

If dwo.name="nu_ruta" Then
	ll_tipoprod=GetItemNumber(1,"co_tipoprod")
   ll_dato=long(Data)   
	ll_res=lo_comun.of_nombreHRutas(ll_tipoProd,ll_dato,n_cst_application.itr_appl)
												
	If ll_res<>1 Then
		MessageBox("Advertencia!","Ruta no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_nu_ruta",lo_comun.of_getstring(1))
End If	

If dwo.name="co_grupo_tlla" Then
	ll_dato=Long(Data)
	
/**
Verificar que el grupo de talla no exista en otra talla, si existe debe ser 
la misma
*/	
   ll_res=of_validar_grupo_talla(ll_fabrica,ll_linea,ll_referencia,ll_talla,&
	                              ll_dato)
											
	If ll_res<>1 Then
		MessageBox("Advertencia!","Grupo de talla no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
	   Return 2
	End If
	ll_res=lo_comun.of_nombregrupotalla( ll_dato, n_cst_application.itr_appl)

	If ll_res<>1 Then
		MessageBox("Advertencia!","Grupo de talla no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_grupo_tlla",lo_comun.of_getstring(1))
End If

If dwo.name="bpl_co_pabcode" Then
	ll_res=lo_comun.of_nombrebplpabcode(Data,n_cst_application.itr_appl)

	If ll_res<>1 Then
		MessageBox("Advertencia!","BPLAN PabCode no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_bpl_co_pabcode",lo_comun.of_getstring(1))	
End If

If dwo.name="bpl_co_planctl" Then
	ll_res=lo_comun.of_nombreBplPlanCtl(data,n_cst_application.itr_appl)

	If ll_res<>1 Then
		MessageBox("Advertencia!","BPLAN Planctl no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_bpl_co_planctl",lo_comun.of_getstring(1))	
End If	

If dwo.name="de_referencia" Then
	If of_validarcadena( data)<>1 Then
		Return 2
	End If
End If

end event

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 12 de Febrero de 2003 HORA 16:05:09:531
// 
// 
//////////////////////////////////////////////////////////////////////////
If row=0 Then Return

n_cst_param lo_param
DWObject ldwo_1

If dwo.name="cs_talla" Then
	lo_param.il_vector[1]=GetItemNumber(1,"co_fabrica")
	lo_param.il_vector[2]=GetItemNumber(1,"co_linea")
	lo_param.il_vector[3]=GetItemNumber(1,"co_talla")
	
	OpenWithParm(w_bus_cs_tallav,lo_param)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If
end If

If dwo.name="co_unidad" Then
	open(w_bus_m_unidades)

	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(lo_param.is_vector[1])
	End If	
end If

If dwo.name="co_calidad" Then
	open(w_bus_m_calidad)

	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If	
end If

If dwo.name="co_grupo_pdn" Then
	lo_param.il_vector[1]=GetItemNumber(1,"co_fabrica")
	OpenWithParm(w_bus_m_grupos_pdn,lo_param)

	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If	
end If

If dwo.name="co_sgrupo_pdn" Then
	lo_param.il_vector[1]=GetItemNumber(1,"co_fabrica")
	OpenWithParm(w_bus_sgrupo_pdn,lo_param)

	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If	
end If

If dwo.name="co_tamano" Then
//	lo_param.il_vector[1]=GetItemNumber(1,"co_fabricav")
	Open(w_bus_m_tamanos)

	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If	
end If

If dwo.name="co_tipoprod" Then
	
end If

If dwo.name="bpl_co_tipoprod" Then
	//lo_param.il_vector[1]=GetItemNumber(1,"co_fabricav")
	Open(w_bus_m_bpl_tipoprod)

	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If	
end If

If dwo.name="bpl_co_planctl" Then
	//lo_param.il_vector[1]=GetItemNumber(1,"co_fabricav")
	Open(w_bus_m_bpl_planctl)

	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(lo_param.is_vector[1])
	End If	
end If

If dwo.name="bpl_co_pabcode" Then
	//lo_param.il_vector[1]=GetItemNumber(1,"co_fabricav")
	Open(w_bus_m_bpl_pabcode)

	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(lo_param.is_vector[1])
	End If	
end If

If dwo.name="co_grupo_tlla" Then
	//lo_param.il_vector[1]=GetItemNumber(1,"co_fabricav")
	Open(w_bus_m_grupos_tlla)

	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If	
end If

If dwo.name="co_tipoprod" Then

	Open(w_bus_m_tipoprod)

	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If	
end If

If dwo.name="co_ttejido" Then

	Open(w_bus_m_ttejido)

	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If	
end If

If dwo.name="nu_ruta" Then
	lo_param.il_vector[1]=GetItemNumber(1,"co_tipoprod")
	OpenWithParm(w_bus_h_rutas,lo_param)

	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If	
end If

end event

event itemfocuschanged;call super::itemfocuschanged;SelectText(1,20)
end event

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 17 de Febrero de 2003 HORA 12:20:46:375
// 
// OverWrite!
//////////////////////////////////////////////////////////////////////////

end event

event ue_dwnprocessenter;if this.AcceptText() < 0 then
  Return 1
end if

if this.GetColumn() = 21 then
	tab_1.selectTab(tab_1.tabpage_1)
	Return 1
end if

Send(Handle(this),256,9,Long(0,0))
return 1

end event

type gb_5 from groupbox within tabpage_2
integer x = 55
integer y = 900
integer width = 3035
integer height = 236
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Observaciones de la copia de datos"
end type

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 3360
integer height = 1152
long backcolor = 80269524
string text = "Referencia de venta"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_adicional dw_adicional
dw_ref_vta dw_ref_vta
gb_3 gb_3
end type

on tabpage_1.create
this.dw_adicional=create dw_adicional
this.dw_ref_vta=create dw_ref_vta
this.gb_3=create gb_3
this.Control[]={this.dw_adicional,&
this.dw_ref_vta,&
this.gb_3}
end on

on tabpage_1.destroy
destroy(this.dw_adicional)
destroy(this.dw_ref_vta)
destroy(this.gb_3)
end on

type dw_adicional from u_dw_application within tabpage_1
integer x = 87
integer y = 936
integer width = 1038
integer height = 176
integer taborder = 20
string dataobject = "d_ext_datos_ref_vta"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 17 de Febrero de 2003 HORA 12:21:54:703
// 
// overwrite!
//////////////////////////////////////////////////////////////////////////

end event

event doubleclicked;call super::doubleclicked;long 				ll_dato_puesto,ll_fabricaV,ll_lineaV
n_cst_param 	lo_param
DWObject 		ldwo_1

If Row=0 Then Return

If dwo.name="co_muestrario" Then
	ll_fabricaV=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_fabricav")
	ll_lineaV=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_lineav")
	
	If IsNull(ll_fabricaV) Or IsNull(ll_lineaV) Then
		MessageBox("Advertencia!","Debe especificar la f$$HEX1$$e100$$ENDHEX$$brica y l$$HEX1$$ed00$$ENDHEX$$nea de venta.",StopSign!)
		Return 2
	End If

	lo_param.il_vector[1]=ll_fabricaV
	lo_param.il_vector[2]=ll_lineav
	lo_param.il_vector[3]=il_muestrarioActual

	OpenWithParm(w_bus_m_muestrarios,lo_param)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If
	
End If
end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 28 de Mayo de 2003 HORA 07:48:33:609
// 
//////////////////////////////////////////////////////////////////////////

n_cst_comun lo_comun
long ll_fabrica,ll_linea,ll_dato,ll_res,ll_f


If dwo.name="co_muestrario" Then
	ll_fabrica=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_fabricav")
	ll_linea=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_lineav")
   ll_dato=Long(Data)	
	If ll_dato<il_muestrarioActual Then
		MessageBox("Advertencia!","Muestrario no v$$HEX1$$e100$$ENDHEX$$lido, debe ser el muestrario actual o uno superior.",StopSign!)
		Return 2
	End If

	ll_res=lo_comun.of_nombreMuestrario(ll_fabrica,ll_linea,ll_dato,n_cst_application.itr_appl)
	If ll_res<>1 Then
		MessageBox("Advertencia!","muestrario no v$$HEX1$$e100$$ENDHEX$$lido, puede ser que no se tenga la referencia de producci$$HEX1$$f300$$ENDHEX$$n, por favor verifique.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_muestrario",lo_comun.of_GetString(1))
	of_muestrarioColores(ll_dato,lo_comun.of_GetString(1))
//////////////////////////////////////////////////////////////////////////
// Se recupera la distribuci$$HEX1$$f300$$ENDHEX$$n para la f$$HEX1$$e100$$ENDHEX$$brica y l$$HEX1$$ed00$$ENDHEX$$nea
// 
//////////////////////////////////////////////////////////////////////////
	long ll_muestrario,ll_fabricav,ll_lineav,ll_referenciav,ll_tallav,ll_calidadv,&
	     ll_fabricap,ll_lineap,ll_referenciap,ll_tallap,ll_calidadp
	
	ll_muestrario=ll_dato
	ll_fabricav=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_fabricav")
	ll_lineav=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_lineav")
	ll_referenciav=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_referenciav")
	ll_tallav=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_tallav")
	ll_calidadv=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_calidadv")
	
	ll_res=tab_1.tabpage_5.dw_dt_vta_pdn.Retrieve(ll_muestrario,&
	                       ll_fabricav,ll_lineav,ll_referenciav,ll_tallav,ll_calidadv)
								  
	If ll_res=-1 Then
		MessageBox("Advertencia!","Error serio, por favor cierre la ventana.",StopSign!)
		Return 2
	End If
	ll_fabricap=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_fabrica")
	ll_lineap=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_linea")
	ll_referenciap=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_referencia")
	ll_tallap=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_talla")
	ll_calidadp=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_calidad")
	
	
	ll_f=tab_1.tabpage_5.dw_dt_vta_pdn.InsertRow(0)
	tab_1.tabpage_5.dw_dt_vta_pdn.SetItem(ll_f,"co_muestrario",ll_muestrario)
   tab_1.tabpage_5.dw_dt_vta_pdn.SetItem(ll_f,"co_fabricav",ll_fabricaV)
	tab_1.tabpage_5.dw_dt_vta_pdn.SetItem(ll_f,"co_lineav",ll_lineaV)
	tab_1.tabpage_5.dw_dt_vta_pdn.SetItem(ll_f,"co_referenciav",ll_referenciaV)
	tab_1.tabpage_5.dw_dt_vta_pdn.SetItem(ll_f,"co_tallav",ll_tallaV)
	tab_1.tabpage_5.dw_dt_vta_pdn.SetItem(ll_f,"co_calidadv",ll_calidadV)
	
	tab_1.tabpage_5.dw_dt_vta_pdn.SetItem(ll_f,"co_fabrica",ll_fabricap)
	tab_1.tabpage_5.dw_dt_vta_pdn.SetItem(ll_f,"co_linea",ll_lineap)
	tab_1.tabpage_5.dw_dt_vta_pdn.SetItem(ll_f,"co_referencia",ll_referenciap)
	tab_1.tabpage_5.dw_dt_vta_pdn.SetItem(ll_f,"co_talla",ll_tallap)
	tab_1.tabpage_5.dw_dt_vta_pdn.SetItem(ll_f,"co_calidad",ll_calidadp)
	
	tab_1.tabpage_5.dw_dt_vta_pdn.SetItem(ll_f,"sw_costo",0)

End If
end event

event ue_dwnprocessenter;if this.AcceptText() < 0 then
  Return 1
end if
//col 4 sw_costo
if this.GetColumn() = 4 then
	tab_1.selectTab(tab_1.tabpage_3)
	Return 1
end if

Send(Handle(this),256,9,Long(0,0))
return 1

end event

type dw_ref_vta from u_dw_application within tabpage_1
integer x = 50
integer y = 80
integer width = 3022
integer height = 780
string dataobject = "d_m_m_ref_vta"
boolean vscrollbar = false
boolean livescroll = false
end type

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 08 de Febrero de 2003 HORA 11:36:13:703
// 
// 
//////////////////////////////////////////////////////////////////////////
 DWItemStatus ll_status

If row=0 Then Return

n_cst_param lo_param
DWObject ldwo_1


If dwo.name="cs_tallav" Then
	lo_param.il_vector[1]=GetItemNumber(1,"co_fabricav")
	lo_param.il_vector[2]=GetItemNumber(1,"co_lineav")
	lo_param.il_vector[3]=GetItemNumber(1,"co_tallav")
	
	OpenWithParm(w_bus_cs_tallav,lo_param)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If
end If

If dwo.name="co_unidadv" Then
	open(w_bus_m_unidades)

	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(lo_param.is_vector[1])
	End If	
end If

If dwo.name="co_calidadv" Then
	open(w_bus_m_calidad)

	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If	
end If

If dwo.name="co_grupo_vta" Then
	lo_param.il_vector[1]=GetItemNumber(1,"co_fabricav")
	OpenWithParm(w_bus_m_grupos_vta,lo_param)

	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If	
end If

If dwo.name="co_sgrupo_vta" Then
	lo_param.il_vector[1]=GetItemNumber(1,"co_fabricav")
	OpenWithParm(w_bus_sgrupo_venta,lo_param)

	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If	
end If

If dwo.name="co_carac_vta" Then
	lo_param.il_vector[1]=GetItemNumber(1,"co_fabricav")
	OpenWithParm(w_bus_m_carac_vta,lo_param)

	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If	
end If

If dwo.name="co_licencia" Then
	//lo_param.il_vector[1]=GetItemNumber(1,"co_fabricav")
	Open(w_bus_m_licencias)

	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If	
end If

If dwo.name="co_composicion" Then
	//lo_param.il_vector[1]=GetItemNumber(1,"co_fabricav")
	Open(w_bus_h_composiciones)

	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If	
end If

If dwo.name="co_empq_cnsm" Then
	//lo_param.il_vector[1]=GetItemNumber(1,"co_fabricav")
	Open(w_bus_m_empq_cnsm)

	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If	
end If

If dwo.name="co_grupo_tlla" Then
	ll_status=This.GetItemStatus(1,0,Primary!)
	If ll_status=NotModified!	or ll_status=DataModified!	Then
		MessageBox("Advertencia!","No se puede cambiar el grupo de talla.",StopSign!)
		Return
	End If

	//lo_param.il_vector[1]=GetItemNumber(1,"co_fabricav")
	Open(w_bus_m_grupos_tlla)

	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If	
end If


end event

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 17 de Febrero de 2003 HORA 12:21:03:546
// 
// OverWrite!
//////////////////////////////////////////////////////////////////////////

end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 07 de Febrero de 2003 HORA 17:47:37:234
// 
// Verifico si se han cambiado los valores para las var de ref venta
//////////////////////////////////////////////////////////////////////////

long ll_fabricav,ll_lineav, ll_referenciav, ll_tallav,ll_calidadv,ll_dato,ll_res,&
     ll_co_muestrario
	  
String ls_de_muestrario

n_cst_param lo_param
n_cst_comun lo_comun

DWItemStatus ll_status

DWObject dwo_column

ll_fabricav=GetItemNumber(1,"co_fabricav")
ll_lineav=GetItemNumber(1,"co_lineav")
ll_referenciav=GetItemNumber(1,"co_referenciav")
ll_tallav=GetItemNumber(1,"co_tallav")
ll_calidadv=1 //GetItemNumber(1,"co_calidadv")

If dwo.name="co_fabricav" Then
	ll_fabricav=Long(Data)
	If of_asignarMuestrarioActual(ll_fabricaV,GetItemNumber(1,"co_lineav"))<>1 Then
		Return 2
	End If	
	of_nombreReferenciaV(ll_fabricav,ll_lineav,ll_referenciav,ll_tallav,ll_calidadv)
	of_resetMuestrario()
end If

If dwo.name="co_lineav" Then
	ll_lineav=Long(Data)
	If of_asignarMuestrarioActual(GetItemNumber(1,"co_fabricav"),ll_lineav)<>1 Then
		Return 2
	End If	
	
	of_nombreReferenciaV(ll_fabricav,ll_lineav,ll_referenciav,ll_tallav,ll_calidadv)
	of_resetMuestrario()
end If

//ll_res=lo_comun.of_muestrarioactual( ll_fabricav,ll_lineav, n_cst_application.itr_appl)
//
//If ll_res=1 Then
//	ll_co_muestrario=lo_comun.of_GetLong(1)
//	ll_res=lo_comun.of_nombremuestrario( ll_fabricav,ll_lineav,ll_co_muestrario,n_cst_application.itr_appl)
//	If ll_res=1 Then
//		tab_1.tabpage_1.dw_adicional.SetItem(1,"co_muestrario",ll_co_muestrario)
//   	tab_1.tabpage_1.dw_adicional.SetItem(1,"de_muestrario",lo_comun.of_GetString(1))
//		of_muestrarioColores(ll_co_muestrario,lo_comun.of_GetString(1))
//	End If
//End If

If dwo.name="co_referenciav" Then
	ll_referenciav=Long(Data)

	of_nombreReferenciaV(ll_fabricav,ll_lineav,ll_referenciav,ll_tallav,ll_calidadv)
	of_resetMuestrario()
end If

If dwo.name="co_tallav" Then
	ll_tallav=Long(Data)
	of_nombreReferenciaV(ll_fabricav,ll_lineav,ll_referenciav,ll_tallav,ll_calidadv)
end If

If dwo.name="cs_tallav" Then
	ll_dato=Long(Data)
	ll_res=lo_comun.of_nombremtallas(ll_fabricav,ll_lineav,ll_tallav,ll_dato,&
	                                 n_cst_application.itr_appl)
												
	If ll_res<>1 Then
		MessageBox("Advertencia!","Consecutivo de talla no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_talla",lo_comun.of_getstring(1))
End If

If dwo.name="co_unidadv" Then

	ll_res=lo_comun.of_nombreUnidad(data,n_cst_application.itr_appl)
												
	If ll_res<>1 Then
		MessageBox("Advertencia!","Unidad no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_unidadv",lo_comun.of_getstring(1))
End If
	
If dwo.name="co_calidadv" Then
   ll_dato=long(data)
	ll_res=lo_comun.of_nombreCalidad(ll_dato,n_cst_application.itr_appl)
												
	If ll_res<>1 Then
		MessageBox("Advertencia!","Calidad no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_calidad",lo_comun.of_getstring(1))
End If	

If dwo.name="co_grupo_vta" Then
   ll_dato=long(data)
	ll_res=lo_comun.of_nombregrupovta( ll_fabricav, ll_dato,n_cst_application.itr_appl)
												
	If ll_res<>1 Then
		MessageBox("Advertencia!","Grupo de venta no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_grupo_vta",lo_comun.of_getstring(1))
End If	

If dwo.name="co_sgrupo_vta" Then
   ll_dato=long(data)
	ll_res=lo_comun.of_nombreSGrupovta( ll_fabricav, ll_dato,n_cst_application.itr_appl)
												
	If ll_res<>1 Then
		MessageBox("Advertencia!","Subgrupo de venta no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_sgrupo_vta",lo_comun.of_getstring(1))
End If	

If dwo.name="co_carac_vta" Then
   ll_dato=long(data)
	ll_res=lo_comun.of_nombreCaracVta( ll_fabricav, ll_dato,n_cst_application.itr_appl)
												
	If ll_res<>1 Then
		MessageBox("Advertencia!","caracteristica de venta no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_carac_vta",lo_comun.of_getstring(1))
End If	

If dwo.name="co_licencia" Then
   ll_dato=long(data)
	ll_res=lo_comun.of_nombreLicencia(ll_dato,n_cst_application.itr_appl)
												
	If ll_res<>1 Then
		MessageBox("Advertencia!","Licencia no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_licencia",lo_comun.of_getstring(1))
End If	

If dwo.name="co_composicion" Then
   ll_dato=long(data)
	ll_res=lo_comun.of_nombreComposicion(ll_dato,n_cst_application.itr_appl)
												
	If ll_res<>1 Then
		MessageBox("Advertencia!","composici$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_composicion",lo_comun.of_getstring(1))
End If	

If dwo.name="co_empq_cnsm" Then
   ll_dato=long(data)
	ll_res=lo_comun.of_nombreempqcnsm( ll_dato,n_cst_application.itr_appl)
												
	If ll_res<>1 Then
		MessageBox("Advertencia!","Empaque de consumo no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_empq_cnsm",lo_comun.of_getstring(1))
End If	


If dwo.name="co_grupo_tlla" Then
	ll_status=This.GetItemStatus(1,0,Primary!)
	If ll_status=NotModified!	or ll_status=DataModified!	Then
		MessageBox("Advertencia!","No se puede cambiar el grupo de talla.",StopSign!)
		Return 2
	End If
	
	
   ll_dato=long(data)
	ll_res=lo_comun.of_nombregrupoTalla( ll_dato,n_cst_application.itr_appl)
												
	If ll_res<>1 Then
		MessageBox("Advertencia!","Grupo de talla no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return 2
	End If
	SetItem(1,"de_grupo_tlla",lo_comun.of_getstring(1))
End If	

//////////////////////////////////////////////////////////////////////////
// Cuando se modifica la cantidad por unidad de empaque 
// de debe colocar esa misma en todos los colores
//////////////////////////////////////////////////////////////////////////
If dwo.name="pares_x_uempq" then
	long i,ll_tot
	ll_tot=tab_1.tabpage_3.dw_colores.RowCount()
	For i=1 To ll_tot
		tab_1.tabpage_3.dw_colores.SetItem(i,"pares_x_uempq",Long(Data))
	Next
End If

If dwo.name="de_referenciav" Then
	If of_validarcadena( data)<>1 Then
		Return 2
	End If
End If

end event

event itemfocuschanged;call super::itemfocuschanged;SelectText(1,20)
end event

type gb_3 from groupbox within tabpage_1
integer x = 59
integer y = 876
integer width = 2926
integer height = 252
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Datos adicionales de referencia de venta"
end type

type tabpage_5 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3360
integer height = 1152
long backcolor = 80269524
string text = "distribuci$$HEX1$$f300$$ENDHEX$$n"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_dt_vta_pdn dw_dt_vta_pdn
end type

on tabpage_5.create
this.dw_dt_vta_pdn=create dw_dt_vta_pdn
this.Control[]={this.dw_dt_vta_pdn}
end on

on tabpage_5.destroy
destroy(this.dw_dt_vta_pdn)
end on

type dw_dt_vta_pdn from u_dw_application within tabpage_5
integer x = 41
integer y = 56
integer width = 3264
integer height = 896
integer taborder = 60
string dataobject = "d_dt_vta_pdn"
end type

event sqlpreview;call super::sqlpreview;//MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!",sqlsyntax)

end event

event itemchanged;call super::itemchanged;Decimal lde_porcen

If dwo.name="ca_dstrbcion" Then
	lde_porcen=dec(Data)
	If lde_porcen=100 Then
		SetItem(row,"sw_costo",1)
	Else
		SetItem(row,"sw_costo",0)
	End If
End If
end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 3360
integer height = 1152
long backcolor = 80269524
string text = "Colores"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_colores dw_colores
end type

on tabpage_3.create
this.dw_colores=create dw_colores
this.Control[]={this.dw_colores}
end on

on tabpage_3.destroy
destroy(this.dw_colores)
end on

type dw_colores from u_dw_application within tabpage_3
integer x = 55
integer y = 80
integer width = 3259
integer height = 1024
boolean bringtotop = true
string dataobject = "d_dt_muestras_col_det"
boolean hscrollbar = true
end type

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 24 de Febrero de 2003 HORA 14:19:51:359
// 
// 
//////////////////////////////////////////////////////////////////////////

long 				ll_dato_puesto,ll_fabricaV,ll_lineaV
n_cst_param 	lo_param
DWObject 		ldwo_1


If Row=0 Then Return


ll_dato_puesto=GetItemNumber(Row,"dato_puesto")

If ll_dato_puesto=1 Then
	MessageBox("Advertencia!","Este dato se recupero de la referencia, no se puede cambiar.",StopSign!)
	Return 
End If

If dwo.name="co_muestrario" Then
	
	ll_fabricaV=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_fabricav")
	ll_lineaV=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_lineav")
	
	If IsNull(ll_fabricaV) Or IsNull(ll_lineaV) Then
		MessageBox("Advertencia!","Debe especificar la f$$HEX1$$e100$$ENDHEX$$brica y l$$HEX1$$ed00$$ENDHEX$$nea de venta.",StopSign!)
		Return 2
	End If
	
	lo_param.il_vector[1]=ll_fabricaV
	lo_param.il_vector[2]=ll_lineaV
	lo_param.il_vector[3]=il_muestrarioActual

	OpenWithParm(w_bus_m_muestrarios,lo_param)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
      settext(String(lo_param.il_vector[1]))
	End If
End If

If dwo.name="co_coleccion" Then
	Open(w_bus_m_colecciones)
	
	lo_param=Message.PowerObjectParm
	
	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If	
End If

dw_head.GetItemNumber(1,"co_fabrica")
If dwo.name="co_opcion" Then
	lo_param.il_vector[1]=dw_head.GetItemNumber(1,"co_fabrica")
	lo_param.il_vector[2]=dw_head.GetItemNumber(1,"co_linea")
	lo_param.il_vector[3]=dw_head.GetItemNumber(1,"co_muestra")
	lo_param.il_vector[4]=dw_head.GetItemNumber(1,"co_talla")
	lo_param.il_vector[5]=GetItemNumber(Row,"co_color")

	OpenWithParm(w_bus_opcion_mp_mues,lo_param)

	lo_param=Message.PowerObjectParm

	If IsValid(lo_param) Then
		SetText(String(lo_param.il_vector[1]))
	End If	
	
End If

	
end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 15 de Febrero de 2003 HORA 09:07:03:875
// 
// 
//////////////////////////////////////////////////////////////////////////
n_cst_comun lo_comun
long ll_res,ll_fabrica,ll_linea,ll_talla,ll_calidad,ll_dato,ll_referencia
long ll_dato_puesto


ll_dato_puesto=GetItemNumber(Row,"dato_puesto")

If ll_dato_puesto=1 and dwo.name<>"cambio" and dwo.name<>"co_opcion" Then
	MessageBox("Advertencia!","Este dato se recupero de la referencia, no se puede cambiar.",StopSign!)
	Return 2
End If


//If Not cbx_mp.Checked Then
//	MessageBox("Advertencia!","Estos datos se necesitan solo para copia de materia prima.",StopSign!)
//	Return 2
//End If

If row=0 Then Return

//If dwo.name="co_diseno" Then
//	ll_fabrica=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_fabrica")
//	ll_linea=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_linea")
//	ll_referencia=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_referencia")
//	ll_talla=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_talla")
//	ll_calidad=tab_1.tabpage_2.dw_ref_pdn.GetItemNumber(1,"co_calidad")
//	ll_dato=long(Data)
//	ll_res=lo_comun.of_nombreDiseno(ll_fabrica,ll_linea,ll_referencia,ll_talla,ll_calidad,&
//	                                ll_dato,n_cst_application.itr_appl)
//											  
//	If ll_res<>1 Then
//		MessageBox("Advertencia!","No se pudo determinar el dise$$HEX1$$f100$$ENDHEX$$o, puede ser que no se tenga la referencia de producci$$HEX1$$f300$$ENDHEX$$n, por favor verifique.",StopSign!)
//		Return 2
//	End If
//	SetItem(row,"de_diseno",lo_comun.of_GetString(1))
//	SetItem(row,"cambio",1)
//	
//End If

//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Lunes 23 de Mayo de 2005 HORA 12:06:26:296
// 
// Solicitud de Servicio 8937
// Cuando sean colores nuevos, se debe copiar la pares_x_uempq de la ref
// de venta
//////////////////////////////////////////////////////////////////////////

long ll_pares_x_uempq

If dwo.name="cambio" Then
	If long(data)=1 Then
		ll_pares_x_uempq=GetItemNumber(row,"pares_x_uempq")
		If ll_pares_x_uempq=0 Then
			ll_pares_x_uempq=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"pares_x_uempq")
			SetItem(row,"pares_x_uempq",ll_pares_x_uempq)
		End If			
	End If
	
end If

If dwo.name="co_muestrario" Then
	ll_fabrica=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_fabricav")
	ll_linea=tab_1.tabpage_1.dw_ref_vta.GetItemNumber(1,"co_lineav")
   ll_dato=Long(Data)	
   //Messagebox('Var','ll_dato='+String(ll_dato)+'~n')
	If ll_dato<il_muestrarioActual Then
		MessageBox("Advertencia!","Muestrario no v$$HEX1$$e100$$ENDHEX$$lido, debe ser el muestrario actual o uno superior.",StopSign!)
		Return 2
	End If
	
	ll_res=lo_comun.of_nombreMuestrario(ll_fabrica,ll_linea,ll_dato,n_cst_application.itr_appl)
	If ll_res<>1 Then
		MessageBox("Advertencia!","muestrario no v$$HEX1$$e100$$ENDHEX$$lido, puede ser que no se tenga la referencia de producci$$HEX1$$f300$$ENDHEX$$n, por favor verifique.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_muestrario",lo_comun.of_GetString(1))
	SetItem(row,"cambio",1)

End If

If dwo.name="co_coleccion" Then
   ll_dato=Long(Data)	
	ll_res=lo_comun.of_nombreColeccion(ll_dato,n_cst_application.itr_appl)
	If ll_res<>1 Then
		MessageBox("Advertencia!","Colecci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_coleccion",lo_comun.of_GetString(1))
	SetItem(row,"cambio",1)

End If
long ll_muestra,ll_color,ll_opcion

If dwo.name="co_opcion" Then
	ll_fabrica=dw_head.GetItemNumber(1,"co_fabrica")
	ll_linea=dw_head.GetItemNumber(1,"co_linea")
	ll_muestra=dw_head.GetItemNumber(1,"co_muestra")
	ll_talla=dw_head.GetItemNumber(1,"co_talla")
	ll_color=GetItemNumber(Row,"co_color")
	ll_opcion=Long(Data)
	ll_res=lo_comun.of_nombreopcionmpmuestra(ll_fabrica,ll_linea,ll_muestra,&
	       ll_talla,ll_color,ll_opcion,n_cst_application.itr_appl)
			 
	If ll_res=-1 Then
		MessageBox("Advertencia!","Opci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida, por favor verifique.",StopSign!)
		Return 2
	ElseIf ll_res=-2 Then
		MessageBox("Advertencia!",&
		"Esta opci$$HEX1$$f300$$ENDHEX$$n NO tiene materia prima, por lo tanto no se puede pasar a referencia, por favor verifique.",StopSign!)
		Return 2
	End If
	SetItem(row,"de_opcion",lo_comun.of_getString(1))
End If

ib_cambios=True
end event

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 17 de Febrero de 2003 HORA 12:21:22:875
// 
// OverWrite!
//////////////////////////////////////////////////////////////////////////

end event

event ue_dwnprocessenter;if this.AcceptText() < 0 then
  Return 1
end if
//col 6 pares x uempq
if this.GetColumn() = 12 and GetRow()=RowCount() then
	tab_1.selectTab(tab_1.tabpage_4)
	Return 1
end if

Send(Handle(this),256,9,Long(0,0))
return 1

end event

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 3360
integer height = 1152
long backcolor = 80269524
string text = "Datos adicionales copia FT"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_recurso dw_recurso
gb_4 gb_4
end type

on tabpage_4.create
this.dw_recurso=create dw_recurso
this.gb_4=create gb_4
this.Control[]={this.dw_recurso,&
this.gb_4}
end on

on tabpage_4.destroy
destroy(this.dw_recurso)
destroy(this.gb_4)
end on

type dw_recurso from u_dw_application within tabpage_4
integer x = 128
integer y = 160
integer width = 2199
integer height = 216
boolean enabled = false
string dataobject = "d_ext_recurso"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 17 de Febrero de 2003 HORA 18:42:07:078
// 
// 
//////////////////////////////////////////////////////////////////////////

end event

event itemchanged;call super::itemchanged;long ll_dato,ll_res
n_cst_comun lo_comun
If dwo.name="co_recurso" Then
	ll_dato=long(Data)
	ll_res=lo_comun.of_nombreRecursoTj(ll_dato,n_cst_application.itr_appl)
	If ll_res<>1 then
		MessageBox("Advertencia!","Recurso no v$$HEX1$$e100$$ENDHEX$$lido.",StopSign!)
		Return
	End If
	SetItem(1,"de_recurso",lo_comun.of_getString(1))

End If
end event

event constructor;call super::constructor;of_color("co_recurso",0)
end event

type gb_4 from groupbox within tabpage_4
integer x = 55
integer y = 76
integer width = 2318
integer height = 352
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Resurso en el que se monta"
end type

type dw_head from u_dw_application within w_copia_mta_ref_bk20101021
integer x = 69
integer y = 72
integer width = 3301
integer height = 176
integer taborder = 20
string dataobject = "d_muestra_h_talla"
boolean vscrollbar = false
boolean livescroll = false
end type

event getfocus;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 17 de Febrero de 2003 HORA 12:20:20:562
// 
// OverWrite!
//////////////////////////////////////////////////////////////////////////

end event

type cbx_ft from checkbox within w_copia_mta_ref_bk20101021
integer x = 1531
integer y = 316
integer width = 603
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Ficha t$$HEX1$$e900$$ENDHEX$$cnica"
boolean checked = true
end type

type cbx_mo from checkbox within w_copia_mta_ref_bk20101021
integer x = 896
integer y = 316
integer width = 603
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Ficha de Mano de obra"
boolean checked = true
end type

type cbx_mp from checkbox within w_copia_mta_ref_bk20101021
integer x = 288
integer y = 316
integer width = 603
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Ficha Materia prima"
boolean checked = true
end type

type gb_2 from u_gb_base within w_copia_mta_ref_bk20101021
integer x = 23
integer y = 20
integer width = 3401
integer height = 236
string text = "Muestras"
end type

type gb_1 from u_gb_base within w_copia_mta_ref_bk20101021
integer x = 23
integer y = 260
integer width = 3401
integer height = 140
integer taborder = 30
string text = "Datos a copiar"
end type

