HA$PBExportHeader$n_cst_comun.sru
$PBExportComments$Para colocar funciones comunes
forward
global type n_cst_comun from nonvisualobject
end type
end forward

global type n_cst_comun from nonvisualobject autoinstantiate
end type

type variables
String   is_retorno[]
long     il_retorno[]
Decimal  ide_retorno[]

end variables
forward prototypes
public function string of_mmtopulg (decimal a_mm)
public function integer of_loaddddw (datawindowchild a_dwc, string a_str1, transaction a_transaction)
public function integer of_loaddddw (datawindowchild a_dw, long a_num1, transaction a_transaction)
public function integer of_loaddddw (datawindowchild a_dwc, long a_num1, long a_num2, long a_num3, long a_num4, long a_num5, transaction a_transaction)
public function integer of_loaddddw (datawindowchild a_dwc, long a_num1, long a_num2, long a_num3, long a_num4, transaction a_transaction)
public function integer of_loaddddw (datawindowchild a_dwc, long a_num1, long a_num2, long a_num3, string a_str1, transaction a_transaction)
public function integer of_loaddddw (datawindowchild a_dwc, long a_num1, long a_num2, long a_num3, transaction a_transaction)
public function integer of_loaddddw (datawindowchild a_dwc, long a_num1, long a_num2, string a_str1, transaction a_transaction)
public function integer of_loaddddw (datawindowchild a_dwc, long a_num1, long a_num2, transaction a_transaction)
public function string of_getstring (long a_posicion)
public function string of_espacios (string a_cad, integer a_tam)
public function integer of_factorconversion (string a_origen, string a_destino, transaction a_transaction)
public function integer of_get_fecha_habil (date a_fecha_inicial, ref date a_fecha_final, long a_dias, long a_sabado, long a_domingo)
public function decimal of_getdecimal (integer a_posicion)
public function integer of_nombrebplpabcode (string a_co_pabcode, transaction a_transaction)
public function integer of_nombrebplplanctl (string a_co_planctl, transaction a_transaction)
public function integer of_nombrecalidad (long a_calidad, transaction a_transaction)
public function integer of_nombrecaracvta (long a_fabrica, long a_carac_vta, transaction a_transaction)
public function long of_nombrecliente (long a_cliente, long a_sucursal, string a_tipocliente, transaction a_transaction)
public function long of_nombreclientenal (long a_cliente, long a_sucursal, transaction a_transaction)
public function integer of_nombrecoleccion (long a_coleccion, transaction a_transaction)
public function long of_nombrecolor (long a_fabrica, long a_linea, long a_color, transaction a_transaction)
public function long of_nombrecombinacion (long a_fabrica, long a_linea, long a_referencia, long a_talla, long a_calidad, long a_combinacion, transaction a_transaction)
public function integer of_nombrecombinamuestra (long a_fabrica, long a_linea, long a_muestra, long a_talla, long a_combinacion, transaction a_transaction)
public function integer of_nombrecomposicion (long a_composicion, transaction a_transaction)
public function long of_nombrediseno (long a_fabrica, long a_linea, long a_referencia, long a_talla, long a_calidad, long a_diseno, transaction a_transaction)
public function integer of_nombreempqcnsm (long a_co_empq_cnsm, transaction a_transaction)
public function integer of_nombregrupopdn (long a_fabrica, long a_grupo_pdn, transaction a_transaction)
public function integer of_nombregrupotalla (long a_co_grupo_tlla, transaction a_transaction)
public function integer of_nombregrupovta (long a_fabrica, long a_grupo, transaction a_transaction)
public function integer of_nombrehrutas (long a_tipo_prod, long a_nu_ruta, transaction a_transaction)
public function integer of_nombrelicencia (long a_licencia, transaction a_transaction)
public function integer of_nombrematprima (long al_co_producto, transaction a_transaction)
public function integer of_nombremtallas (long a_fabrica, long a_linea, long a_talla, long a_cstalla, transaction a_transaction)
public function long of_nombremuestrario (long a_fabrica, long a_linea, long a_muestrario, transaction a_transaction)
public function long of_nombreoperacion (long a_tipoprod, long a_operacion, transaction a_transaction)
public function long of_nombrepartemp (long a_tipoprod, long a_partemp, transaction a_transaction)
public function long of_nombreprocesoad (long a_tipo_proceso, long a_proceso_ad, transaction a_transaction)
public function long of_nombrerecurso (long a_recurso, long a_tipoprod, long a_centro, long a_subcentro, transaction a_transaction)
public function long of_nombrerecursotj (long a_recurso, transaction a_transaction)
public function integer of_nombresgrupopdn (long a_fabrica, long a_sgrupo, transaction a_transaction)
public function integer of_nombresgrupovta (long a_fabrica, long a_sgrupo_vta, transaction a_transaction)
public function long of_nombresubcentro (long a_tipoprod, long a_centro, long a_subcentro, transaction a_transaction)
public function long of_nombretalla (long a_grp_tlla, long a_tlla, transaction a_transaction)
public function integer of_nombretipoprod (long a_tipoprod, transaction a_transaction)
public function integer of_nombretipotejido (long a_tipoprod, long a_tipo_tejido, transaction a_transaction)
public function integer of_nombrettejido (long a_co_tejido, transaction a_transaction)
public function integer of_nombreunidad (string a_unidad, transaction a_transaction)
public function decimal of_pulgtomm (string a_pulg)
public function long of_valorconstante (string a_var_nombre, transaction a_transaction)
public function integer of_nombretamano (long a_tamano, transaction a_transaction)
public function long of_nombrecentro (long a_tipoprod, long a_centro, transaction a_transaction)
public function long of_nombrebpltipoprod (string a_bpl_tipprod, transaction a_transaction)
public function long of_muestrarioactual (long a_fabrica, long a_linea, transaction a_transaction)
public function integer of_loaddddw (datawindowchild a_dw, transaction a_transaction)
public function integer of_nombreproveedor (long a_coproveedor, transaction a_transaction)
public function integer of_nombredisenomuestra (long a_fabrica, long a_linea, long a_muestra, long a_talla, long a_diseno, transaction a_transaction)
public function integer of_nombrereferencia (long a_fabrica, long a_linea, long a_referencia, transaction a_transaction)
public function integer of_nombremuestra (long a_fabrica, long a_linea, long a_muestra, transaction a_transaction)
public function integer of_nombremuestratalla (long a_fabrica, long a_linea, long a_muestra, long a_talla, transaction a_transaction)
public function integer of_nombremuestracolor (long a_fabrica, long a_linea, long a_muestra, long a_talla, long a_color, transaction a_transaction)
public function integer of_nombrecolorprocesoad (long a_tipo_proceso, long a_color_ad, transaction a_transaction)
public function integer of_nombrereferenciatalla (long a_fabrica, long a_linea, long a_referencia, long a_talla, long a_calidad, transaction a_transaction)
public function integer of_nombreopcionmpmuestra (long a_fabrica, long a_linea, long a_muestra, long a_talla, long a_color, long a_opcion, transaction a_transaction)
public function integer of_nombrereferenciacolor (long a_fabrica, long a_linea, long a_referencia, long a_talla, long a_calidad, long a_color, transaction a_transaction)
public function integer of_nombregrupo (long a_grupo, transaction a_transaction)
public function integer of_nombrerecursorestrictivo (long a_recurso, transaction a_transaction)
public function integer of_nombrefabrica (long a_fabrica, transaction a_transaction)
public function integer of_nombretipomedida (long a_tipo_medida, transaction a_transaction)
public function integer of_nombreejecutiva (string a_tipo, long a_codigo, transaction a_transaction)
public function long of_nombreclienteexp (long a_cliente, long a_sucursal, transaction a_transaction)
public function integer of_getdiashabiles (date a_fecha1, date a_fecha2, integer a_sabado, integer a_domingo)
public function integer of_nombrecolor_mp (long a_fabrica, long a_producto, long a_color, transaction a_transaction)
public function integer of_nombredesarrollador (string a_desarrollador, transaction a_transaction)
public function integer of_correodb (string a_de, string a_para, string a_asunto, string a_cuerpo)
public function integer of_nombreestadomuestra (long a_estado, transaction a_transaction)
public function integer of_tipo_muestra (long al_fabrica, long al_linea, long al_muestra, transaction atr_transaction)
public function integer of_nombrerecursomues (long a_recurso, transaction a_transaction)
public function integer of_nombreoperacioncentro (long a_tipoprod, long a_operacion, long a_centro, long a_subcentro, long a_centros_permiso[], transaction a_transaction)
public function integer of_nombrerecursopdn (long a_tipo_prod, long a_centro, long a_subcentro, long a_recurso, transaction a_transaction)
public function integer of_nombregrupotipoprod (long a_grupoprod, long a_tipoprod, transaction a_transaction)
public function integer of_basepesomuestra (long al_fabrica, long al_linea, long al_muestra, transaction atr_transaction)
public function integer of_nombresilueta (long al_fabrica, long al_linea, long al_muestra, transaction atr_transaction)
public function integer of_tipoprodmuestra (long al_fabrica, long al_linea, long al_muestra, transaction atr_transaction)
public function integer of_traergrupotipoprod (long al_fabrica, long al_linea, long al_muestra, transaction atr_transaction)
public function integer of_nombremuestra (long a_fabrica, long a_linea, long a_muestra, string a_usuario, transaction a_transaction)
public function integer of_nombretinta (long al_id_tinta, transaction a_transaction)
public function integer of_validardiseno (long a_muestra, string a_diseno, transaction a_transaction)
public function integer of_traer_recurso_muestra (long a_fabrica, long a_linea, long a_muestra, long a_talla, transaction a_transaction)
public function integer of_traer_recurso (long a_fabrica, long a_linea, long a_muestra, long a_talla, long a_diseno, transaction a_transaction)
public function integer of_obtener_caracteristica (integer ai_fabrica, integer ai_linea, transaction a_transaction)
public function integer of_verificar_talla_vta (integer ai_fabrica, integer ai_linea, long al_referencia, integer ai_talla, integer ai_calidad, string as_tipo, transaction atr_transaction)
public function integer of_verificar_ref_vta (integer ai_fabrica, integer ai_linea, long al_referencia, integer ai_calidad, transaction atr_transaction)
public function integer of_verificar_muestrario (integer ai_fabrica, integer ai_linea, integer ai_muestrario, transaction atr_transaction)
public function integer of_verificar_ref_pdn (integer ai_fabrica, integer ai_linea, long al_referencia, transaction atr_transaction)
public function integer of_verificar_talla (integer ai_fabrica, integer ai_linea, long al_referencia, integer ai_talla, integer ai_calidad, string as_tipo, transaction atr_transaction)
public function integer of_calcular_digitochequeo (string as_cadena)
public function integer of_obtener_consecutivo_ean (integer ai_fabrica, integer ai_id_documento, transaction atr_transaction)
public function integer of_generar_ean (integer ai_fabrica, integer ai_linea, transaction atr_transaction)
public function long of_getlong (long a_posicion)
public function integer of_validarcodigodiseno (string a_diseno, long a_muestra, transaction a_transaction)
public function integer of_obtener_fabrica_diseno (string as_diseno, transaction a_transaction)
public function integer of_verificar_borra_ref_pdn (integer ai_fabrica, integer ai_linea, long al_referencia, integer ai_talla, integer ai_calidad, long al_color, transaction atr_transaction)
public function integer of_verificar_color_pdn (integer ai_fabrica, integer ai_linea, long al_referencia, integer ai_talla, integer ai_calidad, long al_color, transaction atr_transaction)
public function integer of_verificar_color_vta (integer ai_fabrica, integer ai_linea, long al_referencia, integer ai_talla, integer ai_calidad, long al_color, transaction atr_transaction)
end prototypes

public function string of_mmtopulg (decimal a_mm);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 11 de Octubre de 2002 HORA 14:53:18:812
// 
// Retorna las pulgadas de una cantidad en mm
//////////////////////////////////////////////////////////////////////////

long    ll_e,ll_n,ll_d,ll_x
String  ls_res

ll_n=a_mm*16/2.54
ll_d=16

ll_e=ll_n/ll_d

ll_n=ll_n - (ll_e * 16)

If ll_n>0 Then
	ll_x=1
	
	Do while (mod(ll_n,ll_x)=0 and mod(ll_n,ll_x)=0)
		ll_x=ll_x*2
	Loop
	ll_x=ll_x/2
	
	ll_n=ll_n/ll_x
	ll_d=ll_d/ll_x
	
	If ll_e>0 Then
		ls_res=String(ll_e)+" "+String(ll_n)+"/"+String(ll_d)
	Else
		ls_res=String(ll_n)+"/"+String(ll_d)
	End If
Else
	ls_res=String(ll_e)
End If

Return ls_res
end function

public function integer of_loaddddw (datawindowchild a_dwc, string a_str1, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 15 de Enero de 2003 HORA 10:24:22:562
// 
// 
//////////////////////////////////////////////////////////////////////////
If IsNull(a_str1) or Trim(a_str1)="" Then
	a_dwc.Reset()
	a_dwc.InsertRow(0)
	Return -1
	
End If

a_dwc.SetTransObject(a_transaction)
If a_dwc.Retrieve(a_str1)<=0 Then
	a_dwc.InsertRow(0)
End If

Return 1
end function

public function integer of_loaddddw (datawindowchild a_dw, long a_num1, transaction a_transaction);If IsNull(a_num1) or   &
   a_num1=-1   Then
	
	a_dw.Reset()
	a_dw.InsertRow(0)
	Return -1
	
End If

a_dw.SetTransObject(a_transaction)
If a_dw.Retrieve(a_num1)<=0 Then
	a_dw.InsertRow(0)
	Return -1
End If	

Return 1
end function

public function integer of_loaddddw (datawindowchild a_dwc, long a_num1, long a_num2, long a_num3, long a_num4, long a_num5, transaction a_transaction);If IsNull(a_num1) or IsNull(a_num2) or IsNull(a_num3) or &
   a_num1=-1 or a_num2=-1 or a_num3=-1 or a_num4=-1 or a_num5=-1 Then
	
	a_dwc.Reset()
	a_dwc.InsertRow(0)
	Return -1
	
End If

a_dwc.SetTransObject(a_transaction)
If a_dwc.Retrieve(a_num1,a_num2,a_num3,a_num4,a_num5)<=0 Then
	a_dwc.InsertRow(0)
End If

Return 1
end function

public function integer of_loaddddw (datawindowchild a_dwc, long a_num1, long a_num2, long a_num3, long a_num4, transaction a_transaction);If IsNull(a_num1) or IsNull(a_num2) or IsNull(a_num3) or &
   a_num1=-1 or a_num2=-1 or a_num3=-1 or a_num4=-1 Then
	
	a_dwc.Reset()
	a_dwc.InsertRow(0)
	Return -1
	
End If

a_dwc.SetTransObject(a_transaction)
If a_dwc.Retrieve(a_num1,a_num2,a_num3,a_num4)<=0 Then
	a_dwc.InsertRow(0)
End If

Return 1
end function

public function integer of_loaddddw (datawindowchild a_dwc, long a_num1, long a_num2, long a_num3, string a_str1, transaction a_transaction);If IsNull(a_num1) or IsNull(a_num2) or IsNUll(a_str1) or IsNull(a_num3) or&
   a_num1=-1 or a_num2=-1 or len(a_Str1)=0 or a_num3=-1 Then
	
	a_dwc.Reset()
	a_dwc.InsertRow(0)
	Return -1
	
End If

a_dwc.SetTransObject(a_transaction)
If a_dwc.Retrieve(a_num1,a_num2,a_num3,a_str1)<=0 Then
	a_dwc.InsertRow(0)
End If

Return 1
end function

public function integer of_loaddddw (datawindowchild a_dwc, long a_num1, long a_num2, long a_num3, transaction a_transaction);If IsNull(a_num1) or IsNull(a_num2) or IsNull(a_num3) or &
   a_num1=-1 or a_num2=-1 or a_num3=-1 Then
	
	a_dwc.Reset()
	a_dwc.InsertRow(0)
	Return -1
	
End If

a_dwc.SetTransObject(a_transaction)
If a_dwc.Retrieve(a_num1,a_num2,a_num3)<=0 Then
	a_dwc.InsertRow(0)
End If

Return 1
end function

public function integer of_loaddddw (datawindowchild a_dwc, long a_num1, long a_num2, string a_str1, transaction a_transaction);If IsNull(a_num1) or IsNull(a_num2) or IsNUll(a_str1) or &
   a_num1=-1 or a_num2=-1 or len(a_Str1)=0 Then
	
	a_dwc.Reset()
	a_dwc.InsertRow(0)
	Return -1
	
End If

a_dwc.SetTransObject(a_transaction)
If a_dwc.Retrieve(a_num1,a_num2,a_str1)<=0 Then
	a_dwc.InsertRow(0)
End If

Return 1
end function

public function integer of_loaddddw (datawindowchild a_dwc, long a_num1, long a_num2, transaction a_transaction);If IsNull(a_num1) or IsNull(a_num2) or  &
   a_num1=-1 or a_num2=-1  Then
	
	a_dwc.Reset()
	a_dwc.InsertRow(0)
	Return -1
	
End If

a_dwc.SetTransObject(a_transaction)
If a_dwc.Retrieve(a_num1,a_num2)<=0 Then
	a_dwc.InsertRow(0)
End If

Return 1
end function

public function string of_getstring (long a_posicion);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 05 de Diciembre de 2002 HORA 14:43:38:671
// 
// Retorna el dato de una posicion especifica
//////////////////////////////////////////////////////////////////////////

String 	ls_retorno

If UpperBound(is_retorno)>=a_posicion Then
	ls_retorno=is_retorno[a_posicion]
End If

Return ls_retorno
end function

public function string of_espacios (string a_cad, integer a_tam);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 18 de Diciembre de 2002 HORA 09:26:13:640
// 
// Para colocar espacions a la derecha de uan cadena
//////////////////////////////////////////////////////////////////////////


String ls_cad


ls_cad=a_cad

If IsNull(ls_cad) then ls_cad=""

//////////////////////////////////////////////////////////////////////////
// Si la cadena es mas grande, la recorta
// 
//////////////////////////////////////////////////////////////////////////

If Len(ls_cad)>a_tam Then ls_cad=Left(ls_cad,a_tam)

Do While (Len(ls_cad)<a_tam)
	ls_cad=ls_cad+" "	
Loop

Return ls_cad
end function

public function integer of_factorconversion (string a_origen, string a_destino, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 18 de Diciembre de 2002 HORA 14:30:43:484
// 
// Para efectuar la conversion entre las diferentes unidades
//////////////////////////////////////////////////////////////////////////
Decimal lde_dato


  select m_conversiones.factor_cnvrsion  
    into :lde_dato  
    from m_conversiones  
   where ( m_conversiones.unidad_origen = :a_origen ) and  
         ( m_conversiones.unidad_destino = :a_destino )  
	using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If

ide_retorno[1]=lde_dato

Return 1			



Return 1
end function

public function integer of_get_fecha_habil (date a_fecha_inicial, ref date a_fecha_final, long a_dias, long a_sabado, long a_domingo);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 20 de Noviembre de 2002 HORA 16:52:10:906
// 
// Obtiene una fecha habil a partir de una fecha y una
// cantidad de dias positiva o negativa
//
// verifica todos los dias y permite especificar si se cuenta
// sabados y domingos
//
// sabado  = 1 se considera habil
// domingo = 1 se considera habil
//////////////////////////////////////////////////////////////////////////

date ld_fecha,ld_f3,ld_tmp
long ll_cant,ll_inc,ll_cont,ll_day,ll_pos


ld_fecha=a_fecha_inicial
ll_cant=abs(a_dias)

If a_dias>0 Then
	ll_inc=1
Else
	ll_inc=-1
End If
//////////////////////////////////////////////////////////////////////////
// Recupero los dias del triple del rango que me especifican
// En un datastore
//////////////////////////////////////////////////////////////////////////


ld_f3=RelativeDate(ld_fecha,a_dias*3)

If ld_fecha>ld_f3 Then
	ld_tmp=ld_fecha
	ld_fecha=ld_f3
	ld_f3=ld_tmp
End If

n_ds_application lds_1

lds_1=create n_ds_application

lds_1.DataObject="d_festivo"

lds_1.SetTransObject(n_cst_application.itr_appl)

If lds_1.Retrieve(ld_fecha,ld_f3)=-1 Then
	Return -1
End If


ld_fecha=a_fecha_inicial
ll_cont=0

Do While(ll_cont<ll_cant)
	ld_fecha=RelativeDate(ld_fecha,ll_inc)
	ll_day=DayNumber(ld_fecha)
	ll_pos=lds_1.find("#1=Date('"+String(ld_fecha)+"')",1,lds_1.RowCount())
	If ll_pos>0 then
		Continue
	Else
		If (ll_day=1 and a_domingo=0) or (ll_day=7 and a_sabado=0) Then
			Continue
		End If
		ll_cont++
	End If
		
Loop

a_fecha_final=ld_fecha

Return 1



Return 1
end function

public function decimal of_getdecimal (integer a_posicion);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 18 de Diciembre de 2002 HORA 14:35:04:375
// 
// Retorna los datos de tipo decimal
//////////////////////////////////////////////////////////////////////////



decimal lde_dato

If UpperBound(ide_retorno)>=a_posicion Then
	lde_dato=ide_retorno[a_posicion]
End If

Return lde_dato
end function

public function integer of_nombrebplpabcode (string a_co_pabcode, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 12 de Febrero de 2003 HORA 14:35:59:875
// 
// Nombre del bpl pab code
//////////////////////////////////////////////////////////////////////////
string ls_dato

If IsNull(a_co_pabcode) Then
	Return -1
End If

  select m_bpl_pabcode.bpl_de_pabcode  
    into :ls_dato  
    from m_bpl_pabcode  
   where m_bpl_pabcode.bpl_co_pabcode = :a_co_pabcode   
         using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombrebplplanctl (string a_co_planctl, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 12 de Febrero de 2003 HORA 14:11:10:218
// 
// Nombre de planctl
//////////////////////////////////////////////////////////////////////////

string ls_dato


If IsNull(a_co_planctl) Then
	Return -1
End If

  select m_bpl_planctl.bpl_de_planctl  
    into :ls_dato  
    from m_bpl_planctl  
   where m_bpl_planctl.bpl_co_planctl = :a_co_planctl   
         using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombrecalidad (long a_calidad, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 07 de Febrero de 2003 HORA 18:51:49:156
// 
// 
//////////////////////////////////////////////////////////////////////////

String ls_Dato

If IsNUll(a_calidad) Then
	Return -1
End If

  select m_calidades.de_calidad  
    into :ls_dato  
    from m_calidades  
   where m_calidades.co_calidad = :a_calidad 
	         using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombrecaracvta (long a_fabrica, long a_carac_vta, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 08 de Febrero de 2003 HORA 08:46:10:906
// 
// Nombre de la caracteristica de venta
//////////////////////////////////////////////////////////////////////////


string ls_dato

If IsNull(a_fabrica) Or IsNull(a_carac_vta) Then
	Return -1
End If

  select m_carac_vta.de_carac_vta  
    into :ls_dato  
    from m_carac_vta  
   where ( m_carac_vta.co_fabrica = :a_fabrica ) and  
         ( m_carac_vta.co_carac_vta = :a_carac_vta )   
         using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function long of_nombrecliente (long a_cliente, long a_sucursal, string a_tipocliente, transaction a_transaction);long ll_res
If a_tipoCliente="NA" Then
	ll_res=of_nombreClienteNal(a_cliente,a_sucursal,a_transaction)	
Else
	ll_res=of_nombreClienteExp(a_cliente,a_sucursal,a_transaction)
End If

Return ll_res
end function

public function long of_nombreclientenal (long a_cliente, long a_sucursal, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 04 de Diciembre de 2002 HORA 12:27:04:328
// 
// 
//////////////////////////////////////////////////////////////////////////

String ls_dato

If IsNull(a_cliente) Or IsNull(a_sucursal) Then
	Return -1
End If

  select m_clientes.de_cliente  
    into :ls_dato  
    from m_clientes  
   where ( m_clientes.co_cliente = :a_cliente ) and  
         ( m_clientes.co_sucursal = :a_sucursal ) 
         using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombrecoleccion (long a_coleccion, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 17 de Febrero de 2003 HORA 16:42:24:453
// 
// Nombre de la colecci$$HEX1$$f300$$ENDHEX$$n
//////////////////////////////////////////////////////////////////////////
string ls_dato

If IsNull(a_coleccion)  Then
	Return -1
End If

  select m_colecciones.de_coleccion  
    into :ls_dato  
    from m_colecciones  
   where m_colecciones.co_coleccion = :a_coleccion   
  using a_transaction;

If a_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function long of_nombrecolor (long a_fabrica, long a_linea, long a_color, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 11 de Febrero de 2003 HORA 15:20:20:859
// 
// 
//////////////////////////////////////////////////////////////////////////


String ls_dato

If IsNull(a_fabrica) Or IsNull(a_linea) Or IsNull(a_color) Then
	Return -1
End If

  select m_colores.de_color  
    into :ls_dato  
    from m_colores  
   where ( m_colores.co_fabrica = :a_fabrica ) and  
         ( m_colores.co_linea = :a_linea ) and
         ( m_colores.co_color = :a_color )
         using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function long of_nombrecombinacion (long a_fabrica, long a_linea, long a_referencia, long a_talla, long a_calidad, long a_combinacion, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 11 de Diciembre de 2002 HORA 15:50:16:937
// 
// Determina el nombre de la combinacion
//////////////////////////////////////////////////////////////////////////

String ls_dato

If IsNull(a_fabrica) Or IsNull(a_linea) Or IsNull(a_referencia) Or &
   IsNUll(a_talla) Or IsNull(a_combinacion) Then
	
	Return -1
	
End If

  select m_combinaciones.de_combinacion  
    into :ls_dato  
    from m_combinaciones  
   where ( m_combinaciones.co_fabrica = :a_fabrica ) and  
         ( m_combinaciones.co_linea = :a_linea ) and  
         ( m_combinaciones.co_referencia = :a_referencia ) and  
         ( m_combinaciones.co_calidad = :a_calidad ) and  
         ( m_combinaciones.co_talla = :a_talla ) and
         ( m_combinaciones.co_combinacion = :a_combinacion )  
         using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombrecombinamuestra (long a_fabrica, long a_linea, long a_muestra, long a_talla, long a_combinacion, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 08 de Enero de 2003 HORA 11:21:38:625
// 
// Nombre de combinacion para muestras
//////////////////////////////////////////////////////////////////////////

String ls_dato

If IsNull(a_fabrica) Or IsNull(a_linea) Or IsNull(a_muestra) Or &
   IsNull(a_talla) Or IsNull(a_combinacion) Then
	Return -1
End If

  select m_combina_muestras.de_combinacion  
    into :ls_dato  
    from m_combina_muestras  
   where ( m_combina_muestras.co_fabrica = :a_fabrica ) and  
         ( m_combina_muestras.co_linea = :a_linea ) and  
         ( m_combina_muestras.co_muestra = :a_muestra ) and  
         ( m_combina_muestras.co_talla = :a_talla ) and  
         ( m_combina_muestras.co_combinacion = :a_combinacion )  
         using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombrecomposicion (long a_composicion, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 08 de Febrero de 2003 HORA 08:59:48:468
// 
// composicion en h_composiciones
//////////////////////////////////////////////////////////////////////////
string ls_dato

If IsNull(a_composicion) Then
	Return -1
End If

  select h_composiciones.de_composicion  
    into :ls_dato  
    from h_composiciones  
   where h_composiciones.co_composicion = :a_composicion  
   using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1

Return 1
end function

public function long of_nombrediseno (long a_fabrica, long a_linea, long a_referencia, long a_talla, long a_calidad, long a_diseno, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 04 de Diciembre de 2002 HORA 16:33:07:343
// 
// Retorna el nombre dise$$HEX1$$f100$$ENDHEX$$o
//////////////////////////////////////////////////////////////////////////
String ls_dato

If IsNull(a_fabrica) Or IsNull(a_linea) Or IsNull(a_referencia) Or &
   IsNull(a_talla) Or IsNull(a_calidad) Or IsNull(a_diseno) Then
	Return -1
End If
  
  select m_disenos.de_diseno  
    into :ls_dato  
    from m_disenos  
   where ( m_disenos.co_fabrica = :a_fabrica ) and  
         ( m_disenos.co_linea = :a_linea ) and  
         ( m_disenos.co_referencia = :a_referencia ) and
         ( m_disenos.co_talla = :a_talla ) and  
         ( m_disenos.co_calidad = :a_calidad ) and  
         ( m_disenos.co_diseno = :a_diseno ) 
         using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombreempqcnsm (long a_co_empq_cnsm, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 08 de Febrero de 2003 HORA 09:24:51:796
// 
// nombre de empaque de consumo
//////////////////////////////////////////////////////////////////////////
string ls_dato

If IsNull(a_co_empq_cnsm) Then
	Return -1
End If

  select m_empq_cnsm.de_empq_cnsm  
    into :ls_dato  
    from m_empq_cnsm  
   where m_empq_cnsm.co_empq_cnsm = :a_co_empq_cnsm   
			using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombregrupopdn (long a_fabrica, long a_grupo_pdn, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 11 de Febrero de 2003 HORA 14:56:43:359
// 
// Nombre del grupo de produccion
//////////////////////////////////////////////////////////////////////////
string ls_dato

If IsNull(a_fabrica) Or IsNull(a_grupo_pdn) Then
	Return -1
End If

  select m_grupos_pdn.de_grupo_pdn  
    into :ls_dato  
    from m_grupos_pdn  
   where ( m_grupos_pdn.co_fabrica = :a_fabrica ) and  
         ( m_grupos_pdn.co_grupo_pdn = :a_grupo_pdn ) 
			using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1			
end function

public function integer of_nombregrupotalla (long a_co_grupo_tlla, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 30 de Enero de 2003 HORA 09:59:42:093
// 
// 
//////////////////////////////////////////////////////////////////////////


String ls_dato

If IsNull(a_co_grupo_tlla) Then
	Return -1
End If
  
  select m_grupos_tlla.de_grupo_tlla  
    into :ls_dato  
    from m_grupos_tlla  
   where m_grupos_tlla.co_grupo_tlla = :a_co_grupo_tlla   
			using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombregrupovta (long a_fabrica, long a_grupo, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 11 de Febrero de 2003 HORA 15:29:33:171
// 
// 
//////////////////////////////////////////////////////////////////////////


String ls_dato
long ll_tipo_prod

If IsNull(a_fabrica) Or IsNull(a_grupo) Then
	Return -1
End If

  select m_grupos_vta.de_grupo_vta  
    into :ls_dato  
    from m_grupos_vta  
   where ( m_grupos_vta.co_fabrica = :a_fabrica ) and  
         ( m_grupos_vta.co_grupo_vta = :a_grupo ) 
			using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombrehrutas (long a_tipo_prod, long a_nu_ruta, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 12 de Febrero de 2003 HORA 15:11:58:796
// 
// Nombre de la ruta
//////////////////////////////////////////////////////////////////////////
string ls_dato

If IsNull(a_tipo_prod) or IsNull(a_nu_ruta) Then
	Return -1
End If

  select h_rutas.de_ruta  
    into :ls_dato  
    from h_rutas  
   where ( h_rutas.co_tipoprod = :a_tipo_prod ) and  
         ( h_rutas.nu_ruta = :a_nu_ruta )   
   using a_transaction;
	
If a_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombrelicencia (long a_licencia, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 08 de Febrero de 2003 HORA 08:53:18:062
// 
// Nombre de la licencia
//////////////////////////////////////////////////////////////////////////

string ls_dato

If IsNull(a_licencia)  Then
	Return -1
End If

  select m_licencias.de_licencia  
    into :ls_dato  
    from m_licencias  
   where m_licencias.co_licencia = :a_licencia   
  using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombrematprima (long al_co_producto, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 12 de Diciembre de 2002 HORA 17:19:03:140
// 
// Para colocar el nombre de la materia prima
//////////////////////////////////////////////////////////////////////////
String ls_dato

If IsNull(al_co_producto)  Then
	Return -1
End If

  select m_matprimas.de_producto  
    into :ls_dato  
    from m_matprimas  
   where m_matprimas.co_producto = :al_co_producto
  using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode = 100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombremtallas (long a_fabrica, long a_linea, long a_talla, long a_cstalla, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// tabla m_tallas
// 
//////////////////////////////////////////////////////////////////////////

string ls_dato

If IsNull(a_fabrica) Or IsNull(a_linea) Or &
   IsNull(a_talla) Or IsNull(a_csTalla) Then
	
	Return -1
End If

  select m_tallas.de_talla  
    into :ls_dato  
    from m_tallas  
   where ( m_tallas.co_fabrica = :a_fabrica ) and  
         ( m_tallas.co_linea = :a_linea ) and
         ( m_tallas.co_talla = :a_talla ) and  
         ( m_tallas.cs_talla = :a_cstalla )  
  using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1			
end function

public function long of_nombremuestrario (long a_fabrica, long a_linea, long a_muestrario, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 04 de Diciembre de 2002 HORA 16:38:04:046
// 
// Retorna el nombre del muestrario
//////////////////////////////////////////////////////////////////////////
String ls_dato

If IsNull(a_fabrica) Or IsNull(a_linea) Or IsNull(a_muestrario) Then
	Return -1
End If

  select m_muestrarios.de_muestrario  
    into :ls_dato  
    from m_muestrarios  
   where ( m_muestrarios.co_fabrica = :a_fabrica ) and  
         ( m_muestrarios.co_linea = :a_linea ) and  
         ( m_muestrarios.co_muestrario = :a_muestrario )  
         using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function long of_nombreoperacion (long a_tipoprod, long a_operacion, transaction a_transaction);long   ll_res

n_cst_operacion lo_1

lo_1=create n_cst_operacion

ll_res=lo_1.of_nombreOperacion(a_tipoprod,&
                               a_operacion,&
										 a_transaction)


If ll_res<>1 Then
	Destroy lo_1
	Return -1
End If

is_retorno[1]=lo_1.of_getstring(1)

Destroy lo_1

Return 1
end function

public function long of_nombrepartemp (long a_tipoprod, long a_partemp, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 09 de Diciembre de 2002 HORA 09:27:02:375
// 
// Retorna el nombre de la parte de materia prima
//////////////////////////////////////////////////////////////////////////
String ls_dato, ls_estado

If IsNull(a_tipoprod) Or IsNull(a_partemp) Then
	Return -1
End If

  select m_partemp.de_partemp, nvl(estado,'I')
    into :ls_dato , :ls_estado
    from m_partemp  
   where ( m_partemp.co_tipoprod = :a_tipoprod ) and  
         ( m_partemp.co_partemp = :a_partemp )   
         using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato
is_retorno[2]=ls_estado

Return 1
end function

public function long of_nombreprocesoad (long a_tipo_proceso, long a_proceso_ad, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 04 de Diciembre de 2002 HORA 13:49:47:937
// 
// Nombre del proceso adicional
//////////////////////////////////////////////////////////////////////////


string ls_dato

If IsNull(a_tipo_proceso) Or IsNull(a_proceso_ad) Then
	Return -1
End If

  select m_procesos_ad.de_proceso_ad  
    into :ls_dato  
    from m_procesos_ad  
   where ( m_procesos_ad.co_tipo_proceso = :a_tipo_proceso ) and  
         ( m_procesos_ad.co_proceso_ad = :a_proceso_ad ) 
         using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function long of_nombrerecurso (long a_recurso, long a_tipoprod, long a_centro, long a_subcentro, transaction a_transaction);String ls_dato

If IsNull(a_recurso) Or IsNull(a_tipoprod) Or &
   IsNull(a_centro) Or IsNull(a_subcentro) Then
	
	Return -1
End If


  select m_recursos_pdn.de_recurso  
    into :ls_dato  
    from m_recursos_pdn  
   where ( m_recursos_pdn.co_recurso = :a_recurso ) and  
         ( m_recursos_pdn.co_tipoprod = :a_tipoprod ) and  
         ( m_recursos_pdn.co_centro = :a_centro ) and  
         ( m_recursos_pdn.co_subcentro = :a_subcentro )
         using a_transaction  ;
			
If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function long of_nombrerecursotj (long a_recurso, transaction a_transaction);long   ll_res

n_cst_recurso lo_1

lo_1=create n_cst_recurso

ll_res=lo_1.of_nombreRecursotj(a_recurso /*long a_recurso*/,&
                               a_transaction/*transaction a_transaction */)

If ll_res<>1 Then
	Destroy lo_1
	Return -1
End If

is_retorno[1]=lo_1.of_getstring(1)

Destroy lo_1

Return 1

end function

public function integer of_nombresgrupopdn (long a_fabrica, long a_sgrupo, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 11 de Febrero de 2003 HORA 14:52:26:578
// 
// Nombre del subgrupo de produccion
//////////////////////////////////////////////////////////////////////////
String ls_dato

If IsNull(a_fabrica) Or IsNull(a_sgrupo) Then
	Return -1
End If


  select m_sgrupos_pdn.de_sgrupo_pdn  
    into :ls_dato  
    from m_sgrupos_pdn  
   where ( m_sgrupos_pdn.co_fabrica = :a_fabrica ) and  
         ( m_sgrupos_pdn.co_sgrupo_pdn = :a_sgrupo ) 
          using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1			
end function

public function integer of_nombresgrupovta (long a_fabrica, long a_sgrupo_vta, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 08 de Febrero de 2003 HORA 08:33:55:890
// 
// Nombre del subgrupo de venta
//////////////////////////////////////////////////////////////////////////
string ls_dato

If IsNull(a_fabrica) Or IsNull(a_sgrupo_vta) Then
	Return -1
End If


  select m_sgrupos_vta.de_sgrupo_vta  
    into :ls_dato  
    from m_sgrupos_vta  
   where ( m_sgrupos_vta.co_fabrica = :a_fabrica ) and  
         ( m_sgrupos_vta.co_sgrupo_vta = :a_sgrupo_vta )   
          using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function long of_nombresubcentro (long a_tipoprod, long a_centro, long a_subcentro, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 04 de Diciembre de 2002 HORA 10:50:00:843
// 
// Para determinar el nombre del subcentro
//////////////////////////////////////////////////////////////////////////


String ls_dato

If IsNull(a_tipoprod) Or IsNull(a_Centro) Or IsNull(a_subcentro) Then
	Return -1
End If


  select m_subcentros_pdn.de_subcentro  
    into :ls_dato  
    from m_subcentros_pdn  
   where ( m_subcentros_pdn.co_tipoprod = :a_tipoprod) and  
         ( m_subcentros_pdn.co_centro = :a_centro ) and  
         ( m_subcentros_pdn.co_subcentro = :a_subcentro )   
         using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function long of_nombretalla (long a_grp_tlla, long a_tlla, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 28 de Octubre de 2002 HORA 08:58:34:781
// 
// Retorna el nombre de la talla
//////////////////////////////////////////////////////////////////////////
String ls_dato

If IsNull(a_grp_tlla) Or IsNull(a_tlla) Then
	Return -1
End If

  
  select m_tallas_x_grupo.de_talla  
    into :ls_dato  
    from m_tallas_x_grupo  
   where ( m_tallas_x_grupo.co_grupo_tlla = :a_grp_tlla ) and  
         ( m_tallas_x_grupo.co_talla = :a_tlla )  
         using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombretipoprod (long a_tipoprod, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 30 de Enero de 2003 HORA 09:51:45:531
// 
// 
//////////////////////////////////////////////////////////////////////////
// MODIFICADO: Julio 29 de 2009 - ohlondon
// -----------------------------------------------------------------------
// Se deben recuperar solo los tipos que el usuario pueda consultar 
// 
//////////////////////////////////////////////////////////////////////////
String ls_dato

If IsNull(a_tipoprod) Then
	Return -1
End If


select m.de_tipoprod  
  into :ls_dato  
  from m_tipoprod m,  m_usuario_tipoprod u
 where m.co_tipoprod = :a_tipoprod  
   AND u.co_usuario  = :n_cst_application.is_user 
   AND u.co_tipoprod = m.co_tipoprod
 using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1	
end function

public function integer of_nombretipotejido (long a_tipoprod, long a_tipo_tejido, transaction a_transaction);
String ls_dato

If IsNull(a_tipoprod) Or IsNull(a_tipo_tejido) Then
	Return -1
End If


  SELECT m_ttejidos.de_ttejido  
    INTO :ls_dato 
    FROM m_ttejidos  
   WHERE m_ttejidos.co_ttejido = :a_tipo_tejido  
         using a_transaction  ;  
//  select m_tipo_tejido.de_tipo_tejido  
//    into :ls_dato  
//    from m_tipo_tejido  
//   where ( m_tipo_tejido.co_tipoprod = :a_tipoprod ) and
//         ( m_tipo_tejido.co_tipo_tejido = :a_tipo_tejido )   
//         using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1	
end function

public function integer of_nombrettejido (long a_co_tejido, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 12 de Febrero de 2003 HORA 15:32:07:265
// 
// 
//////////////////////////////////////////////////////////////////////////
string ls_dato

If IsNull(a_co_tejido)  Then
	Return -1
End If

  select m_ttejidos.de_ttejido  
    into :ls_dato  
    from m_ttejidos  
   where m_ttejidos.co_ttejido = :a_co_tejido   
using a_transaction;

If a_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombreunidad (string a_unidad, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 07 de Febrero de 2003 HORA 18:56:14:093
// 
// 
//////////////////////////////////////////////////////////////////////////
String ls_dato

If IsNull(a_unidad) Then
	Return -1
End If



  select m_unidades.de_unidad  
    into :ls_dato  
    from m_unidades  
   where m_unidades.co_unidad = :a_unidad   
         using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1	          
end function

public function decimal of_pulgtomm (string a_pulg);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 11 de Octubre de 2002 HORA 15:28:03:234
// 
// Para pasar pulgadas a mm
//////////////////////////////////////////////////////////////////////////
Decimal ld_res

long ll_u=0,ll_n,ll_d,ll_pos,ll_pn

ll_pos=pos(a_pulg," ")

ll_pn=1
If ll_pos>0 Then
	ll_u=Long(mid(a_pulg,1,ll_pos -1))
	ll_pn=ll_pos+1
End If

ll_pos=pos(a_pulg,"/")
If ll_pos>0 Then
	ll_n=Long(mid(a_pulg,ll_pn, ll_pos - ll_pn))

	ll_d=long(mid(a_pulg,ll_pos+1))
Else
	ll_n=Long(a_pulg)
	ll_d=1
End If

ld_res=(ll_u*2.54)+(ll_n/ll_d*2.54)

Return ld_res
end function

public function long of_valorconstante (string a_var_nombre, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 09 de Diciembre de 2002 HORA 09:58:33:750
// 
// Para hacer consultas en la tabla m_constantes
//////////////////////////////////////////////////////////////////////////
long ll_tipo
String ls_texto

Decimal lde_numero
  
  select m_constantes.tipo,   
         m_constantes.numerico,   
         m_constantes.texto  
    into :ll_tipo,   
         :lde_numero,   
         :ls_texto
    from m_constantes  
   where m_constantes.var_nombre = :a_var_nombre           
	
	using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

If ll_tipo=1 Then
	ide_retorno[1]=lde_numero
Else
	is_retorno[1]=Trim(ls_texto)
End If

Return 1
end function

public function integer of_nombretamano (long a_tamano, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 12 de Febrero de 2003 HORA 13:39:16:000
// 
// 
//////////////////////////////////////////////////////////////////////////
long ll_dato

If IsNull(a_tamano) Then
	Return -1
End If


  select m_tamanos.nu_docenas  
    into :ll_dato  
    from m_tamanos  
   where m_tamanos.co_tamano = :a_tamano   
         using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If



il_retorno[1]=ll_dato

Return 1
end function

public function long of_nombrecentro (long a_tipoprod, long a_centro, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 11 de Febrero de 2003 HORA 15:23:50:781
// 
// 
//////////////////////////////////////////////////////////////////////////


String ls_dato

If IsNull(a_tipoprod) Or IsNull(a_centro) Then
	Return -1
End If

  select m_centros_pdn.de_centro  
    into :ls_dato  
    from m_centros_pdn  
   where ( m_centros_pdn.co_tipoprod = :a_tipoprod ) and  
         ( m_centros_pdn.co_centro = :a_centro )   
         using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function long of_nombrebpltipoprod (string a_bpl_tipprod, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 04 de Diciembre de 2002 HORA 12:19:23:062
// 
// 
//////////////////////////////////////////////////////////////////////////

String ls_dato

If IsNull(a_bpl_tipprod) Then
	Return -1
End If

  select m_bpl_tipoprod.bpl_de_tipoprod  
    into :ls_dato  
    from m_bpl_tipoprod  
   where m_bpl_tipoprod.bpl_co_tipoprod = :a_bpl_tipprod   
         using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function long of_muestrarioactual (long a_fabrica, long a_linea, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 14 de Marzo de 2003 HORA 11:32:45:890
// 
// Retorna el valor del muestrario actual
//////////////////////////////////////////////////////////////////////////


Long ll_muestrario

If IsNull(a_fabrica) or IsNull(a_linea) Then
	Return -1
End If

  SELECT m_muestrarios.co_muestrario  
    INTO :ll_muestrario  
    FROM m_muestrarios  
   WHERE ( m_muestrarios.co_fabrica = :a_fabrica ) AND  
         ( m_muestrarios.co_linea = :a_linea ) AND  
         ( m_muestrarios.fe_inicio <= current ) AND  
         ( m_muestrarios.fe_fin >= current )  
			using a_transaction;
			
If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If

If a_transaction.SQLcode=100 Then 
	MessageBox("Advertencia!","No se pudo determinar el muestrario actual para la f$$HEX1$$e100$$ENDHEX$$brica "+&
	String(a_fabrica)+", l$$HEX1$$ed00$$ENDHEX$$nea "+String(a_linea)+"." ,StopSign!)
	Return -1
End If


il_retorno[1]=ll_muestrario

Return 1
			

end function

public function integer of_loaddddw (datawindowchild a_dw, transaction a_transaction);a_dw.SetTransObject(a_transaction)
If a_dw.Retrieve()<=0 Then
	Return -1
End If	

Return 1
end function

public function integer of_nombreproveedor (long a_coproveedor, transaction a_transaction);
string ls_dato

If IsNull(a_coproveedor)  Then
	Return -1
End If

  SELECT m_proveedores.de_proveedor  
    INTO :ls_dato  
    FROM m_proveedores  
   WHERE m_proveedores.co_proveedor = :a_coproveedor   
using a_transaction;

If a_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombredisenomuestra (long a_fabrica, long a_linea, long a_muestra, long a_talla, long a_diseno, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 04 de Diciembre de 2002 HORA 16:33:07:343
// 
// Retorna el nombre dise$$HEX1$$f100$$ENDHEX$$o
//////////////////////////////////////////////////////////////////////////
String ls_dato

If IsNull(a_fabrica) Or IsNull(a_linea) Or IsNull(a_muestra) Or &
   IsNull(a_talla) Or IsNull(a_diseno) Then
	Return -1
End If

  SELECT m_disenos_muestras.de_diseno  
    INTO :ls_dato  
    FROM m_disenos_muestras  
   WHERE ( m_disenos_muestras.co_fabrica = :a_fabrica ) AND  
         ( m_disenos_muestras.co_linea   = :a_linea ) AND  
         ( m_disenos_muestras.co_muestra = :a_muestra ) AND  
         ( m_disenos_muestras.co_talla   = :a_talla ) AND  
         ( m_disenos_muestras.co_diseno  = :a_diseno )  
         using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombrereferencia (long a_fabrica, long a_linea, long a_referencia, transaction a_transaction);String ls_dato
long   ll_tipoprod,ll_grupo_tlla


If IsNull(a_fabrica) Or IsNull(a_linea) Or IsNull(a_referencia) Then
	Return -1
End If


  select h_preref.de_referencia,co_tipoprod,co_grupo_tlla  
    into :ls_dato, :ll_tipoprod, :ll_grupo_tlla 
    from h_preref  
   where ( h_preref.co_fabrica = :a_fabrica ) and  
         ( h_preref.co_linea = :a_linea ) and
         ( h_preref.co_referencia = :a_referencia )         
		using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return 0
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

il_retorno[1]=ll_tipoprod
il_retorno[2]=ll_grupo_tlla

Return 1
end function

public function integer of_nombremuestra (long a_fabrica, long a_linea, long a_muestra, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 08 de Enero de 2003 HORA 09:27:13:000
// 
// Para el nombre de la muestra que se encuentra en m_muestras
//////////////////////////////////////////////////////////////////////////
String ls_dato
long ll_tipo_prod,ll_grupo_tlla

If IsNull(a_fabrica) Or IsNull(a_linea) Or IsNull(a_muestra) Then
	Return -1
End If

  select m_muestras.de_muestra,m_muestras.co_tipoprod  , co_grupo_tlla
    into :ls_dato ,:ll_tipo_prod , :ll_grupo_tlla
    from m_muestras  
   where ( m_muestras.co_fabrica = :a_fabrica ) and  
         ( m_muestras.co_linea = :a_linea ) and  
         ( m_muestras.co_muestra = :a_muestra )          
	using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato
il_retorno[1]=ll_tipo_prod
il_retorno[2]=ll_grupo_tlla

Return 1
end function

public function integer of_nombremuestratalla (long a_fabrica, long a_linea, long a_muestra, long a_talla, transaction a_transaction);String ls_dato

If IsNull(a_fabrica) Or IsNull(a_linea) Or IsNull(a_muestra) or IsNull(a_talla) Then
	Return -1
End If

  SELECT m_tallas_x_grupo.de_talla  
    INTO :ls_dato  
    FROM m_muestras,   
         dt_muestras,   
         m_tallas_x_grupo  
   WHERE ( dt_muestras.co_fabrica = m_muestras.co_fabrica ) and  
         ( dt_muestras.co_linea = m_muestras.co_linea ) and  
         ( dt_muestras.co_muestra = m_muestras.co_muestra ) and  
         ( dt_muestras.co_talla = m_tallas_x_grupo.co_talla ) and  
         ( m_muestras.co_grupo_tlla = m_tallas_x_grupo.co_grupo_tlla ) and  
         ( ( m_muestras.co_fabrica = :a_fabrica ) AND  
         ( m_muestras.co_linea = :a_linea ) AND  
         ( m_muestras.co_muestra = :a_muestra ) AND  
         ( dt_muestras.co_talla = :a_talla ) )  
	using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombremuestracolor (long a_fabrica, long a_linea, long a_muestra, long a_talla, long a_color, transaction a_transaction);String ls_dato

If IsNull(a_fabrica) Or IsNull(a_linea) Or IsNull(a_muestra) or IsNull(a_talla) or &
   IsNull(a_color) Then
	Return -1
End If

  SELECT m_colores.de_color  
    INTO :ls_dato  
    FROM dt_muestras_col,   
         m_colores  
   WHERE ( dt_muestras_col.co_fabrica = m_colores.co_fabrica ) and  
         ( dt_muestras_col.co_linea = m_colores.co_linea ) and  
         ( dt_muestras_col.co_color = m_colores.co_color ) and  
         ( ( dt_muestras_col.co_fabrica = :a_fabrica ) AND  
         ( dt_muestras_col.co_linea = :a_linea ) AND  
         ( dt_muestras_col.co_muestra = :a_muestra ) AND  
         ( dt_muestras_col.co_talla = :a_talla ) AND  
         ( dt_muestras_col.co_color = :a_color ) )   
	using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombrecolorprocesoad (long a_tipo_proceso, long a_color_ad, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 04 de Abril de 2003 HORA 11:36:18:390
// 
// Nombre de colores de procesos adicionales
//////////////////////////////////////////////////////////////////////////


string ls_dato

If IsNull(a_tipo_proceso) Or IsNull(a_color_ad) Then
	Return -1
End If

  SELECT m_colores_procad.de_color
    INTO :ls_dato  
    FROM m_colores_procad  
   WHERE ( m_colores_procad.co_tipo_proceso = :a_tipo_proceso ) AND  
         ( m_colores_procad.co_color_ad = :a_color_ad )  
using a_transaction;

If a_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1

end function

public function integer of_nombrereferenciatalla (long a_fabrica, long a_linea, long a_referencia, long a_talla, long a_calidad, transaction a_transaction);String ls_dato

If IsNull(a_fabrica) Or IsNull(a_linea) Or IsNull(a_referencia) or IsNull(a_talla) Then
	Return -1
End If
  SELECT m_tallas_x_grupo.de_talla  
    INTO :ls_dato  
    FROM dt_preref,   
         m_tallas_x_grupo,   
         h_preref  
   WHERE ( dt_preref.co_talla = m_tallas_x_grupo.co_talla ) and  
         ( h_preref.co_fabrica = dt_preref.co_fabrica ) and  
         ( h_preref.co_linea = dt_preref.co_linea ) and  
         ( h_preref.co_referencia = dt_preref.co_referencia ) and  
         ( h_preref.co_grupo_tlla = m_tallas_x_grupo.co_grupo_tlla ) and  
         ( ( dt_preref.co_fabrica = :a_fabrica ) AND  
         ( dt_preref.co_linea = :a_linea ) AND  
         ( dt_preref.co_referencia = :a_referencia ) AND  
         ( dt_preref.co_talla = :a_talla ) AND  
         ( dt_preref.co_calidad = :a_calidad ) )  
	using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombreopcionmpmuestra (long a_fabrica, long a_linea, long a_muestra, long a_talla, long a_color, long a_opcion, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Martes 17 de Mayo de 2005 HORA 08:29:44:500
// 
// Se van a tener algunos colores y opciones sin materia prima, es estos casos
// el sistema no debe permitir seleccionar la opci$$HEX1$$f300$$ENDHEX$$n para hacer el paso a
// Referencia
// *** Solocitud 8474 ***
// Retorna -1 si no existe
//         -2 si no tiene materia prima
//////////////////////////////////////////////////////////////////////////

long ll_cant
string ls_dato

If IsNull(a_fabrica) Or IsNull(a_linea) or Isnull(a_muestra) or &
   IsNull(a_talla)  or IsNUll(a_color) or IsNull(a_opcion) Then
	Return -1
End If

//////////////////////////////////////////////////////////////////////////
// Se verifica que el color y la opcion tengan materia prima 
// 
//////////////////////////////////////////////////////////////////////////

  SELECT count(*)  
    INTO :ll_cant  
    FROM dt_fmp_muestras  
   WHERE ( dt_fmp_muestras.co_fabrica =:a_fabrica ) AND  
         ( dt_fmp_muestras.co_linea = :a_linea ) AND  
         ( dt_fmp_muestras.co_muestra = :a_muestra ) AND  
         ( dt_fmp_muestras.co_talla = :a_talla ) AND  
         ( dt_fmp_muestras.co_color = :a_color ) AND  
         ( dt_fmp_muestras.cnt_opcion = :a_opcion )  
using a_transaction;

If a_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If

If IsNull(ll_cant) Then
	ll_cant=0
End If

//////////////////////////////////////////////////////////////////////////
// En la siguiente condicion no se tiene materia prima y no se debe 
// perimitir seleccionar para convertir en referencia
//////////////////////////////////////////////////////////////////////////

If ll_cant=0 Then
	Return -2
End If

  SELECT h_fmp_muestras.de_cnt_opcion  
    INTO :ls_dato  
    FROM h_fmp_muestras  
   WHERE ( h_fmp_muestras.co_fabrica = :a_fabrica ) AND  
         ( h_fmp_muestras.co_linea = :a_linea ) AND  
         ( h_fmp_muestras.co_muestra = :a_muestra ) AND  
         ( h_fmp_muestras.co_talla = :a_talla ) AND  
         ( h_fmp_muestras.co_color = :a_color ) AND  
         ( h_fmp_muestras.cnt_opcion = :a_opcion )  
using a_transaction;

If a_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1

end function

public function integer of_nombrereferenciacolor (long a_fabrica, long a_linea, long a_referencia, long a_talla, long a_calidad, long a_color, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 24 de Mayo de 2003 HORA 13:55:10:125
// 
// para colocar el nombre del color de la referenca
//////////////////////////////////////////////////////////////////////////


string ls_dato

If IsNull(a_fabrica) or IsNull(a_linea) or IsNull(a_referencia) or &
   IsNull(a_talla) or IsNull(a_calidad) or IsNull(a_color) Then
	Return -1
End If

  SELECT m_colores.co_color  
    INTO :ls_dato  
    FROM dt_ref_x_col,   
         m_colores  
   WHERE ( dt_ref_x_col.co_fabrica = m_colores.co_fabrica ) and  
         ( dt_ref_x_col.co_linea = m_colores.co_linea ) and  
         ( dt_ref_x_col.co_color = m_colores.co_color ) and  
         ( ( dt_ref_x_col.co_fabrica = :a_fabrica ) AND  
         ( dt_ref_x_col.co_linea = :a_linea ) AND  
         ( dt_ref_x_col.co_referencia = :a_referencia ) AND  
         ( dt_ref_x_col.co_talla = :a_talla ) AND  
         ( dt_ref_x_col.co_calidad = :a_calidad ) AND  
         ( dt_ref_x_col.co_color = :a_color )   
         )  
using a_transaction;

If a_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombregrupo (long a_grupo, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 12 de Agosto de 2003 HORA 08:26:54:367
// 
// Nombre del grupo de materia prima 
// se emplea inicialmente para la composici$$HEX1$$f300$$ENDHEX$$n por destrucci$$HEX1$$f300$$ENDHEX$$n en las muestras
//////////////////////////////////////////////////////////////////////////


string ls_dato

If IsNull(a_grupo)  Then
	Return -1
End If

  SELECT m_grupos.de_grupo  
    INTO :ls_dato  
    FROM m_grupos  
   WHERE m_grupos.co_grupo = :a_grupo 
using a_transaction;

If a_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1

end function

public function integer of_nombrerecursorestrictivo (long a_recurso, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Sabado 23 de Agosto de 2003 HORA 14:37:13:943
// 
// Para colocar el nombre del recurso restrictivo
//////////////////////////////////////////////////////////////////////////


string ls_dato,ls_dato1

If IsNull(a_recurso)  Then
	Return -1
End If

  SELECT m_rec_restri.rec_rest,   
         m_rec_restri.cil_agu_gal  
    INTO :ls_dato,   
         :ls_dato1  
    FROM m_rec_restri  
   WHERE m_rec_restri.id = :a_recurso 
using a_transaction;

If a_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)+" "+Trim(ls_dato1)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombrefabrica (long a_fabrica, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 27 de Agosto de 2003 HORA 10:59:28:742
// 
// Para especificar el nombre de la fabrica
//////////////////////////////////////////////////////////////////////////


string ls_dato

If IsNull(a_fabrica)  Then
	Return -1
End If

  SELECT m_fabricas.razon_social  
    INTO :ls_dato  
    FROM m_fabricas  
   WHERE m_fabricas.co_fabrica = :a_fabrica   
using a_transaction;

If a_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1

end function

public function integer of_nombretipomedida (long a_tipo_medida, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 27 de Agosto de 2003 HORA 20:08:01:024
// 
// para los nombres de los tipos de medidas
//////////////////////////////////////////////////////////////////////////

string ls_dato

If IsNull(a_tipo_medida)  Then
	Return -1
End If

  SELECT m_tipo_medida.desc_tipo_med  
    INTO :ls_dato  
    FROM m_tipo_medida  
   WHERE m_tipo_medida.id_tipo_med = :a_tipo_medida   
 using a_transaction;

If a_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombreejecutiva (string a_tipo, long a_codigo, transaction a_transaction);string ls_dato

If IsNull(a_tipo) or IsNull(a_codigo)  Then
	Return -1
End If

If a_tipo="EX" Then
	
	select de_ejecutiva  
	  into :ls_dato  
	  from m_ejecutivas_exp  
	 where co_ejecutiva = :a_codigo  using a_transaction ;
	 
	If a_transaction.SQLcode=-1 Then
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(a_transaction)
		Return -1
	End If
Else

	select m_vendedor.de_vendedor  
	  into :ls_dato
	 FROM m_vendedor  
	WHERE ( m_vendedor.co_vendedor = :a_codigo )  using a_transaction;		
			
	If a_transaction.SQLcode=-1 Then
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(a_transaction)
		Return -1
	End If			
End If

If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1

end function

public function long of_nombreclienteexp (long a_cliente, long a_sucursal, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 04 de Diciembre de 2002 HORA 12:27:04:328
// 
// 
//////////////////////////////////////////////////////////////////////////

String ls_dato

If IsNull(a_cliente) Or IsNull(a_sucursal) Then
	Return -1
End If

	  select m_clientes_exp.de_cliente  
		 into :ls_dato 
		 from m_clientes_exp  
		where ( m_clientes_exp.co_cliente = :a_cliente ) and  
				( m_clientes_exp.co_sucursal = :a_sucursal ) 
         using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_getdiashabiles (date a_fecha1, date a_fecha2, integer a_sabado, integer a_domingo);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 24 de Septiembre de 2003 HORA 11:34:40:470
// 
// Retorna el numero de dias habiles entre dos fechas
// a_sabado y a_domingo seben estar en 1 si se consideran habiles
// en caso contrario en 0,
// el metodo controla los festivos
//////////////////////////////////////////////////////////////////////////



date ld_fecha,ld_f3,ld_tmp
long ll_cant,ll_inc,ll_cont,ll_day,ll_pos



If IsNull(a_fecha1) or IsNull(a_fecha2) Then
	Return -1
End If

n_ds_application lds_1

lds_1=create n_ds_application

lds_1.DataObject="d_festivo"

lds_1.SetTransObject(n_cst_application.itr_appl)

If lds_1.Retrieve(a_fecha1,a_fecha2)=-1 Then
	Return -1
End If


ld_fecha=a_fecha1
ll_cont=0

Do While(ld_fecha<=a_fecha2)	
	
	ll_day=DayNumber(ld_fecha)
	ll_pos=lds_1.find("#1=Date('"+String(ld_fecha)+"')",1,lds_1.RowCount())
	If not(ll_pos>0) then
		If not ((ll_day=1 and a_domingo=0) or (ll_day=7 and a_sabado=0)) Then
			ll_cont++
		End If		
	End If
	ld_fecha=RelativeDate(ld_fecha,1)		
Loop

il_retorno[1]=ll_cont
//Messagebox('Var','afecha1='+String(a_fecha1)+'~n'+&
//'afecha2='+String(a_fecha2)+'~n'+&
//'ll_cont='+String(ll_cont)+'~n')


Return 1
end function

public function integer of_nombrecolor_mp (long a_fabrica, long a_producto, long a_color, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// Descripcion del color de materia prima
// 
//////////////////////////////////////////////////////////////////////////


string ls_dato
long   ll_dato

If IsNull(a_fabrica) Or IsNull(a_producto) Or IsNull(a_color)  Then
	Return -1
End If

  SELECT max(m_colores_mp.de_color),
         max(m_colores_mp.co_tono)
    INTO :ls_dato,
	      :ll_dato
    FROM m_prod_proveedor,   
         m_colores_mp  
   WHERE ( m_prod_proveedor.co_color = m_colores_mp.co_color ) and  
         ( ( m_prod_proveedor.co_fabrica = :a_fabrica ) AND  
         ( m_prod_proveedor.co_producto = :a_producto ) AND  
         ( m_prod_proveedor.co_color = :a_color ) )  
			using a_transaction;


If a_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

If IsNull(ls_dato) or len(ls_dato)=0 Then
	Return -1
End If

is_retorno[1]=ls_dato

il_retorno[1]=ll_dato

Return 1
end function

public function integer of_nombredesarrollador (string a_desarrollador, transaction a_transaction);string ls_dato

If IsNull(a_desarrollador)  Then
	Return -1
End If

  SELECT m_ctecnico.de_ctecnico  
    INTO :ls_dato  
    FROM m_ctecnico  
   WHERE m_ctecnico.co_ctecnico = :a_desarrollador
using a_transaction;

If a_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1

end function

public function integer of_correodb (string a_de, string a_para, string a_asunto, string a_cuerpo);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 21 de Noviembre de 2002 HORA 10:01:51:093
// 
// Para el envio de correos al interior de la aplicaci$$HEX1$$f300$$ENDHEX$$n
//////////////////////////////////////////////////////////////////////////
DateTime ldt_fecha
String ls_usuario,ls_instancia
Date   ld_fecha
If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
		 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If

ld_fecha=Date(ldt_fecha)

  insert into m_correos  
         ( usuario_de,   
           asunto,   
           cuerpo,
			  fe_creacion)  
  values ( :a_de,   
           :a_asunto,   
           :a_cuerpo,
			  :ld_fecha) using n_cst_application.itr_appl ;

If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If


Long ll_consecutivo

ll_consecutivo =Long(n_cst_application.itr_appl.SQLReturnData)

If IsNull(ll_consecutivo) then ll_consecutivo=0

If ll_consecutivo<=0 Then
	Return -1
End If
//////////////////////////////////////////////////////////////////////////
// Ahora se guarda el detalle de los correos
// 
//////////////////////////////////////////////////////////////////////////
long ll_pos=0,ll_pos1
String ls_tmp
DO
	ll_pos1=pos(a_para,",",ll_pos+1)
	If ll_pos1>0 Then
		ls_tmp=mid(a_para,ll_pos+1,ll_pos1 -ll_pos -1)
		
	Else
		ls_tmp=mid(a_para,ll_pos+1)
	End If
		
	  insert into dt_correos  
					( cs_correo,   
					  usuario_de,   
					  usuario_para)  
		  values ( :ll_consecutivo,   
					  :a_de,   
					  :ls_tmp)  using n_cst_application.itr_appl ;

		If n_cst_application.itr_appl.SQLcode=-1 Then 
			PopulateError(20,"SQL Error")
			n_cst_application.of_sql_error(n_cst_application.itr_appl)
			Return -1
		End If
					  
		ll_pos=ll_pos1					  

LOOP WHILE ll_pos<>0


Return 1
end function

public function integer of_nombreestadomuestra (long a_estado, transaction a_transaction);string ls_dato
long    ll_orden_estado

If IsNull(a_estado)  Then
	Return -1
End If

  SELECT m_estado_muestra.de_estado,
         m_estado_muestra.orden_estado
    INTO :ls_dato,
	      :ll_orden_estado
    FROM m_estado_muestra  
   WHERE m_estado_muestra.co_estado = :a_estado 
using a_transaction;

If a_transaction.SQLcode=-1 Then
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato
il_retorno[1]=ll_orden_estado

Return 1

end function

public function integer of_tipo_muestra (long al_fabrica, long al_linea, long al_muestra, transaction atr_transaction);/*-------------------------------------------------
	Develr.	: Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
	Date		: Viernes 24 de Septiembre de 2004.H::
---------------------------------------------------
Encuentra y retorna el tipo de la muestra que se
encuentra en m_muestras
---------------------------------------------------*/

String ls_dato
long ll_tipo_prod,ll_grupo_tlla

If IsNull(al_fabrica) Or IsNull(al_linea) Or IsNull(al_muestra) Then
	Return -1
End If

  SELECT m_muestras.tipo_muestra
    INTO :ls_dato
    FROM m_muestras  
   WHERE ( m_muestras.co_fabrica	= :al_fabrica )	and  
         ( m_muestras.co_linea 	= :al_linea )		and  
         ( m_muestras.co_muestra = :al_muestra )          
	USING atr_transaction;

If atr_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
End If


If atr_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombrerecursomues (long a_recurso, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQUE 
// Miercoles 23 de Febrero de 2005 HORA 17:01:27:187
// 
// Nombre del recurso de muestras
//////////////////////////////////////////////////////////////////////////


String ls_dato

If IsNull(a_recurso) Then
	Return -1
End If

  select trim(de_modelo[1,21])||" ("||diam_cilindro||"x"||ca_aguja||"-"||nu_galga||")" as descripcion  
    into :ls_dato  
    from m_recursos_tj,    
         mu_recurso_ct  
   where ( m_recursos_tj.co_recurso = :a_recurso ) and
         ( m_recursos_tj.co_recurso = mu_recurso_ct.co_recurso )
         using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombreoperacioncentro (long a_tipoprod, long a_operacion, long a_centro, long a_subcentro, long a_centros_permiso[], transaction a_transaction);long   ll_res

n_cst_operacion lo_1

lo_1=create n_cst_operacion

ll_res=lo_1.of_nombreOperacionCentro(a_tipoprod,&
                               a_operacion,&
										 a_centro,&
										 a_subcentro,&
										 a_centros_permiso,&
										 a_transaction)


If ll_res<>1 Then
	Destroy lo_1
	Return -1
End If

is_retorno[1]=lo_1.of_getstring(1)

Destroy lo_1

Return 1


end function

public function integer of_nombrerecursopdn (long a_tipo_prod, long a_centro, long a_subcentro, long a_recurso, transaction a_transaction);long   ll_res

n_cst_recurso lo_1

lo_1=create n_cst_recurso

ll_res=lo_1.of_nombreRecursopdn(a_tipo_prod/*long a_tipo_prod*/,&
                                a_centro/*long a_centro*/,&
										  a_subcentro/*long a_subcentro*/,&
										  a_recurso/*long a_recurso*/, &
										  a_transaction/*transaction a_transaction */)


If ll_res<>1 Then
	Destroy lo_1
	Return -1
End If

is_retorno[1]=lo_1.of_getstring(1)

Destroy lo_1

Return 1
end function

public function integer of_nombregrupotipoprod (long a_grupoprod, long a_tipoprod, transaction a_transaction);/*
* =======================================================================
* MODIFICADO: Julio 29 de 2009 - ohlondon
* -----------------------------------------------------------------------
* of_nombregrupotipoprod
* Se verifica que el grupo exista para el tipo si se envia, o si no se
* envio, se hace join con  m_usuario_tipoprod para que traiga solo los
* tipo del usuario
* =======================================================================
*/
String ls_dato

If IsNull(a_tipoprod) OR IsNull(a_grupoprod) Then
	Return -1
End If

Select g.de_grupoprod
  INTO :ls_dato
  From m_grupoprod g,  m_usuario_tipoprod u
 Where ( g.co_grupoprod = :a_grupoprod  )
   AND ( g.co_tipoprod  = :a_tipoprod  OR :a_tipoprod  = -1 )
   AND ( u.co_usuario   = :n_cst_application.is_user )
   AND ( u.co_tipoprod  = g.co_tipoprod )
 using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If

If a_transaction.SQLcode=100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1	
end function

public function integer of_basepesomuestra (long al_fabrica, long al_linea, long al_muestra, transaction atr_transaction);/*---------------------------------------------------
* MODIFICADO: Julio 31 de 2009 - ohlondon
* ---------------------------------------------------
* Trae el campo base_peso
* ---------------------------------------------------*/
String ls_dato
String ls_base_peso 
Long 	 ll_dato

If IsNull(al_fabrica) Or IsNull(al_linea) Or IsNull(al_muestra) Then
	Return -1
End If

  SELECT m_muestras.base_peso
    INTO :ll_dato
    FROM m_muestras  
   WHERE ( m_muestras.co_fabrica	= :al_fabrica )	and  
         ( m_muestras.co_linea 	= :al_linea )		and  
         ( m_muestras.co_muestra = :al_muestra )          
	USING atr_transaction;

If atr_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
End If


If atr_transaction.SQLcode=100 Then
	Return 0
End If

ls_dato=String(ll_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_nombresilueta (long al_fabrica, long al_linea, long al_muestra, transaction atr_transaction);/*
* ---------------------------------------------------
* MODIFICADO: Agosto 04 de 2009 - ohlondon
* ---------------------------------------------------
* Trae el nombre de la of_nombreSilueta
* ---------------------------------------------------
*/
String ls_dato
String ls_base_peso 
Long 	 ll_dato

If IsNull(al_fabrica) Or IsNull(al_linea) Or IsNull(al_muestra) Then
	Return -1
End If

  SELECT 'med_tip'||
         m_muestras.id_tipo_graf||
			'_med'||
			m_muestras.id_tipo_med ||
			".bmp" 
    INTO :ls_dato
    FROM m_muestras  
   WHERE ( m_muestras.co_fabrica	= :al_fabrica )	and  
         ( m_muestras.co_linea 	= :al_linea )		and  
         ( m_muestras.co_muestra = :al_muestra )          
	USING atr_transaction;

If atr_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
End If


If atr_transaction.SQLcode=100 Then
	Return 0
End If

//ls_dato=String(ll_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_tipoprodmuestra (long al_fabrica, long al_linea, long al_muestra, transaction atr_transaction);/*
* ---------------------------------------------------
* MODIFICADO: Agosto 04 de 2009 - ohlondon
* ---------------------------------------------------
* Trae el campo co_tipoprod
* ---------------------------------------------------
*/
String ls_dato
String ls_base_peso 
Long 	 ll_dato

If IsNull(al_fabrica) Or IsNull(al_linea) Or IsNull(al_muestra) Then
	Return -1
End If

  SELECT m_muestras.co_tipoprod
    INTO :ll_dato
    FROM m_muestras  
   WHERE ( m_muestras.co_fabrica	= :al_fabrica )	and  
         ( m_muestras.co_linea 	= :al_linea )		and  
         ( m_muestras.co_muestra = :al_muestra )          
	USING atr_transaction;

If atr_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
End If


If atr_transaction.SQLcode=100 Then
	Return 0
End If

ls_dato=String(ll_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_traergrupotipoprod (long al_fabrica, long al_linea, long al_muestra, transaction atr_transaction);/*
* ---------------------------------------------------
* MODIFICADO: Agosto 04 de 2009 - ohlondon
* ---------------------------------------------------
* Trae el campo co_grupoprod
* ---------------------------------------------------
*/
String ls_dato
String ls_base_peso 
Long 	 ll_dato

If IsNull(al_fabrica) Or IsNull(al_linea) Or IsNull(al_muestra) Then
	Return -1
End If

  SELECT m_muestras.co_grupoprod
    INTO :ll_dato
    FROM m_muestras  
   WHERE ( m_muestras.co_fabrica	= :al_fabrica )	and  
         ( m_muestras.co_linea 	= :al_linea )		and  
         ( m_muestras.co_muestra = :al_muestra )          
	USING atr_transaction;

If atr_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
End If


If atr_transaction.SQLcode=100 Then
	Return 0
End If

il_retorno[1]=ll_dato

Return 1
end function

public function integer of_nombremuestra (long a_fabrica, long a_linea, long a_muestra, string a_usuario, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 08 de Enero de 2003 HORA 09:27:13:000
// 
// Para el nombre de la muestra que se encuentra en m_muestras
//////////////////////////////////////////////////////////////////////////
String ls_dato
long ll_tipo_prod,ll_grupo_tlla

If IsNull(a_fabrica) Or IsNull(a_linea) Or IsNull(a_muestra) Then
	Return -1
End If

  select m_muestras.de_muestra,m_muestras.co_tipoprod  , co_grupo_tlla
    into :ls_dato ,:ll_tipo_prod , :ll_grupo_tlla
    from m_muestras, m_usuario_tipoprod  
   where ( m_muestras.co_fabrica  = :a_fabrica ) and  
         ( m_muestras.co_linea    = :a_linea ) and  
         ( m_muestras.co_muestra  = :a_muestra )   and
			( m_usuario_tipoprod.co_usuario = :a_usuario ) and 
			( m_muestras.co_tipoprod = m_usuario_tipoprod.co_tipoprod)
	using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return 0
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato
il_retorno[1]=ll_tipo_prod
il_retorno[2]=ll_grupo_tlla

Return 1
end function

public function integer of_nombretinta (long al_id_tinta, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 12 de Diciembre de 2002 HORA 17:19:03:140
// 
// Para colocar el nombre de la materia prima
//////////////////////////////////////////////////////////////////////////
String ls_dato

If IsNull(al_id_tinta)  Then
	Return -1
End If

  select mu_m_tinta.de_tinta
    into :ls_dato  
    from mu_m_tinta 
   where mu_m_tinta.id_tinta = :al_id_tinta
  using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode = 100 Then
	Return -1
End If

ls_dato=trim(ls_dato)

is_retorno[1]=ls_dato

Return 1
end function

public function integer of_validardiseno (long a_muestra, string a_diseno, transaction a_transaction);// Se debae validar que el diseno no este asignado a otra muestra


long  ll_contador  

If IsNull(a_diseno) Then
	Return -1
End If

SELECT count(*)   
  INTO :ll_contador
  FROM m_disenos_muestras  
 WHERE m_disenos_muestras.de_diseno = :a_diseno  
   AND m_disenos_muestras.co_muestra <> :a_muestra
 using a_transaction;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If

If ll_contador > 0  Then
	Return 1
End If


Return 0
end function

public function integer of_traer_recurso_muestra (long a_fabrica, long a_linea, long a_muestra, long a_talla, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// ohlondon, gagudelo
// Noviembre 30 de 2010
// 
// Retorna el recurso de la muestra 
//////////////////////////////////////////////////////////////////////////
Long ll_dato

If IsNull(a_fabrica) Or IsNull(a_linea) Or IsNull(a_muestra) Or &
   IsNull(a_talla)  Then
	Return -1
End If

  SELECT dt_muestras.co_recurso 
    INTO :ll_dato  
    FROM dt_muestras 
   WHERE ( dt_muestras.co_fabrica = :a_fabrica ) AND  
         ( dt_muestras.co_linea = :a_linea ) AND  
         ( dt_muestras.co_muestra = :a_muestra ) AND  
         ( dt_muestras.co_talla = :a_talla )   
         using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return 0
End If

il_retorno[1]=ll_dato

Return 1
end function

public function integer of_traer_recurso (long a_fabrica, long a_linea, long a_muestra, long a_talla, long a_diseno, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// ohlondon, gagudelo
// Noviembre 30 de 2010
// 
// Retorna el recurso de la muestra en un dise$$HEX1$$f100$$ENDHEX$$o espec$$HEX1$$ed00$$ENDHEX$$fico
//////////////////////////////////////////////////////////////////////////
Long ll_dato

If IsNull(a_fabrica) Or IsNull(a_linea) Or IsNull(a_muestra) Or &
   IsNull(a_talla) OR IsNull(a_diseno) Then
	Return -1
End If

  SELECT UNIQUE co_recurso 
    INTO :ll_dato  
    FROM dt_med_mue 
   WHERE ( co_fabrica = :a_fabrica ) AND  
         ( co_linea   = :a_linea )   AND  
         ( co_muestra = :a_muestra ) AND  
         ( co_talla   = :a_talla )   AND
			( co_diseno  = :a_diseno )
	using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return 0
End If

il_retorno[1]=ll_dato

Return 1
end function

public function integer of_obtener_caracteristica (integer ai_fabrica, integer ai_linea, transaction a_transaction);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 11 de Febrero de 2003 HORA 15:23:50:781
// 
// 
//////////////////////////////////////////////////////////////////////////


String ls_dato_talla, ls_dato_color  

If IsNull(ai_fabrica) Or IsNull(ai_linea) Then
	is_retorno[1]="Es necesario especificar tanto la f$$HEX1$$e100$$ENDHEX$$brica como la l$$HEX1$$ed00$$ENDHEX$$nea para traer la caracter$$HEX1$$ed00$$ENDHEX$$stica en la Relaci$$HEX1$$f300$$ENDHEX$$n Fert."
	Return -1
End If

select cxl.co_carac_talla, cxl.co_carac_color
 into :ls_dato_talla, :ls_dato_color  
 from TB_CARACTERISTICAXLINEA cxl 
where ( cxl.co_fabrica = :ai_fabrica) and  
		( cxl.co_linea   = :ai_linea )   
using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If

If a_transaction.SQLcode = 100 Then
	is_retorno[1]="No existe la caracter$$HEX1$$ed00$$ENDHEX$$stica para la f$$HEX1$$e100$$ENDHEX$$brica "+String(ai_fabrica)+" y l$$HEX1$$ed00$$ENDHEX$$nea "+String(ai_linea)+" y es necesaria para la Relaci$$HEX1$$f300$$ENDHEX$$n Fert."
	Return -1
End If

ls_dato_talla=trim(ls_dato_talla)
ls_dato_color=trim(ls_dato_color)

is_retorno[1]=ls_dato_talla
is_retorno[2]=ls_dato_color

Return 1
end function

public function integer of_verificar_talla_vta (integer ai_fabrica, integer ai_linea, long al_referencia, integer ai_talla, integer ai_calidad, string as_tipo, transaction atr_transaction);// Se debae validar que la referencia exista

String		ls_de_referencia, ls_de_talla, ls_co_unidad
long  		ll_contador  

// Si es de Produccion
IF ( as_tipo = 'P' ) THEN	
	
//	  SELECT UNIQUE dt_preref.co_talla,   
//         m_tallas_x_grupo.de_talla  
//    FROM dt_preref,   
//         h_preref,   
//         m_tallas_x_grupo  
//   WHERE ( dt_preref.co_fabrica    = :an_fabrica ) AND 
//         ( dt_preref.co_linea      = :an_linea ) AND 
//         ( dt_preref.co_referencia = :an_referencia ) AND 
//         ( h_preref.co_fabrica     = dt_preref.co_fabrica ) AND  
//         ( h_preref.co_linea       = dt_preref.co_linea ) AND  
//         ( h_preref.co_referencia  = dt_preref.co_referencia ) AND  
//         ( h_preref.co_grupo_tlla  = m_tallas_x_grupo.co_grupo_tlla ) AND  
//         ( dt_preref.co_talla      = m_tallas_x_grupo.co_talla )   
 
	
	
	SELECT de_referencia, de_talla, r.co_unidad 
	  INTO :ls_de_referencia, :ls_de_talla, :ls_co_unidad
  	  FROM m_ref_pdn r, OUTER m_tallas t, OUTER m_unidades u 
 	 WHERE r.co_fabrica    = :ai_fabrica
	   AND r.co_linea      = :ai_linea
	   AND r.co_referencia = :al_referencia
	   AND r.co_talla      = :ai_talla
	   AND r.co_calidad    = :ai_calidad
	   AND t.co_fabrica    = r.co_fabrica 
	   AND t.co_linea      = r.co_linea 
	   AND t.co_talla      = r.co_talla 
	   AND t.cs_talla      = r.cs_talla 
	   AND u.co_unidad     = r.co_unidad 
	 USING atr_transaction  ;
ELSE
	// Sino, es de venta
	SELECT de_referenciav, de_talla, co_unidadv
	  INTO :ls_de_referencia, :ls_de_talla, :ls_co_unidad
	  FROM m_ref_vta r, OUTER m_tallas t, OUTER m_unidades u 
	 WHERE r.co_fabricav    = :ai_fabrica
	   AND r.co_lineav      = :ai_linea
	   AND r.co_referenciav = :al_referencia
	   AND r.co_tallav      = :ai_talla
	   AND r.co_calidadv    = :ai_calidad
	   AND t.co_fabrica     = r.co_fabricav 
	   AND t.co_linea       = r.co_lineav 
	   AND t.co_talla       = r.co_tallav 
	   AND t.cs_talla       = r.cs_tallav 
	   AND u.co_unidad      = r.co_unidadv
	 USING atr_transaction  ;
END IF

If atr_transaction.SqlCode = -1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
ELSEIf atr_transaction.SqlCode = 100 Then 
	is_retorno[1] = 'La Referencia de Ventas '+String(ai_fabrica)+'-'+String(ai_linea)+'-'+&
	                String(al_referencia)+'-'+String(ai_talla)+'-'+String(ai_calidad)+', no existe.'
	IF ( as_tipo = 'P' ) THEN
		is_retorno[1] = 'La Referencia de Producci$$HEX1$$f300$$ENDHEX$$n '+String(ai_fabrica)+'-'+&
                      String(ai_linea)+'-'+String(al_referencia)+'-'+String(ai_talla)+'-'+&
							 String(ai_calidad)+', no existe.'
	END IF						 
	Return 0
End If

is_retorno[1] = ls_de_referencia
is_retorno[2] = ls_de_talla
is_retorno[3] = ls_co_unidad

Return 1



end function

public function integer of_verificar_ref_vta (integer ai_fabrica, integer ai_linea, long al_referencia, integer ai_calidad, transaction atr_transaction);// Se debae validar que la referencia exista

String		ls_de_referencia

SELECT FIRST 1 Trim(de_referenciav)
  INTO :ls_de_referencia 
  FROM m_ref_vta r 
 WHERE r.co_fabricav    = :ai_fabrica
	AND r.co_lineav      = :ai_linea
	AND r.co_referenciav = :al_referencia
	AND r.co_calidadv    = :ai_calidad 
 USING atr_transaction  ;

If atr_transaction.SqlCode = -1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
ELSEIf atr_transaction.SqlCode = 100 Then 
	is_retorno[1] = 'La Referencia de Ventas '+String(ai_fabrica)+'-'+String(ai_linea)+'-'+&
	                String(al_referencia)+'-'+String(ai_calidad)+', no existe.'
	Return 0
End If

is_retorno[1] = ls_de_referencia 

Return 1



end function

public function integer of_verificar_muestrario (integer ai_fabrica, integer ai_linea, integer ai_muestrario, transaction atr_transaction);// Se debae validar que la referencia exista
Date			ld_fe_ini, ld_fe_fin
Decimal 		ldc_dias_tejido
Integer 		li_muestrario
 
SELECT k.numerico
  INTO :ldc_dias_tejido
  FROM m_constantes k
 WHERE k.var_nombre = "DIAS_TEJIDO" and
		 k.tipo       = 1
 USING atr_transaction  ;

IF atr_transaction.SqlCode = -1 THEN
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
ELSEIf atr_transaction.SqlCode = 100 THEN
	is_retorno[1] = 'La constante DIAS_TEJIDO no est$$HEX2$$e1002000$$ENDHEX$$configurada.'
	Return 0
END IF

SELECT co_muestrario
  INTO :li_muestrario
  FROM m_muestrarios m
 WHERE m.co_fabrica = :ai_fabrica
   AND m.co_linea   = :ai_linea
   AND TODAY BETWEEN m.fe_inicio - :ldc_dias_tejido
	              AND m.fe_fin    - :ldc_dias_tejido  
 USING atr_transaction;

IF atr_transaction.SqlCode = -1 THEN
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
ELSEIf atr_transaction.SqlCode = 100 THEN
	is_retorno[1] = 'El_muestrario '+String(ai_fabrica)+'-'+String(ai_linea)+'-'+&
	                String(ai_muestrario)+', no existe o no est$$HEX2$$e1002000$$ENDHEX$$vigente.'
	Return 0
ELSE
	IF li_muestrario <> ai_muestrario THEN 
		is_retorno[1] = 'El_muestrario '+String(ai_fabrica)+'-'+String(ai_linea)+'-'+&
	                   String(ai_muestrario)+', no es el vigente.'
		Return 0
	END IF
END IF

//IF ( Today() > ld_fe_fin ) THEN
//	is_retorno[1] = 'Las fechas para el Muestrario '+String(ai_fabrica)+'-'+String(ai_linea)+'-'+&
//	                String(ai_muestrario)+', ya se vencieron.'
//	Return 0
//END IF
il_retorno[1] = li_muestrario
is_retorno[1] = ''

Return 1
end function

public function integer of_verificar_ref_pdn (integer ai_fabrica, integer ai_linea, long al_referencia, transaction atr_transaction);// Se debae validar que la referencia exista

String		ls_de_referencia

SELECT Trim(de_referencia)
  INTO :ls_de_referencia 
  FROM h_preref r 
 WHERE r.co_fabrica    = :ai_fabrica
	AND r.co_linea      = :ai_linea
	AND r.co_referencia = :al_referencia
 USING atr_transaction  ;

If atr_transaction.SqlCode = -1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
ELSEIf atr_transaction.SqlCode = 100 Then 
	is_retorno[1] = 'La Referencia de Producci$$HEX1$$f300$$ENDHEX$$n '+String(ai_fabrica)+'-'+String(ai_linea)+'-'+&
	                String(al_referencia)+', no existe.'
	Return 0
End If

is_retorno[1] = ls_de_referencia 

Return 1



end function

public function integer of_verificar_talla (integer ai_fabrica, integer ai_linea, long al_referencia, integer ai_talla, integer ai_calidad, string as_tipo, transaction atr_transaction);// Se debae validar que la referencia exista

String		ls_de_talla

SELECT UNIQUE Trim(m_tallas_x_grupo.de_talla)
  INTO :ls_de_talla 
  FROM dt_preref,   
		 h_preref,   
		 m_tallas_x_grupo  
 WHERE ( dt_preref.co_fabrica    = :ai_fabrica ) AND 
		 ( dt_preref.co_linea      = :ai_linea ) AND 
		 ( dt_preref.co_referencia = :al_referencia ) AND 
		 ( dt_preref.co_talla      = :ai_talla) AND 
//     ( dt_preref.co_referencia = :an_calidad) AND 
		 ( h_preref.co_fabrica     = dt_preref.co_fabrica ) AND  
		 ( h_preref.co_linea       = dt_preref.co_linea ) AND  
		 ( h_preref.co_referencia  = dt_preref.co_referencia ) AND  
		 ( h_preref.co_grupo_tlla  = m_tallas_x_grupo.co_grupo_tlla ) AND  
		 ( dt_preref.co_talla      = m_tallas_x_grupo.co_talla )   
 USING atr_transaction  ;

If atr_transaction.SqlCode = -1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
ELSEIf atr_transaction.SqlCode = 100 Then 
	is_retorno[1] = 'La talla de Ventas '+String(ai_fabrica)+'-'+String(ai_linea)+'-'+&
	                String(al_referencia)+'-'+String(ai_talla)+', no existe.'
						 //+'-'+String(ai_calidad)+', no existe.'
	IF ( as_tipo = 'P' ) THEN
		is_retorno[1] = 'La talla de Producci$$HEX1$$f300$$ENDHEX$$n '+String(ai_fabrica)+'-'+&
                      String(ai_linea)+'-'+String(al_referencia)+'-'+String(ai_talla)+&
							 ', no existe.'
							 //+'-'String(ai_calidad)+', no existe.'
	END IF						 
	Return 0
End If

is_retorno[1] = ls_de_talla 

Return 1



end function

public function integer of_calcular_digitochequeo (string as_cadena);/*
* ----------------------------------------------------------------------------
* MODIFICADO: Enero 20 de 2012 - ohlondon
* ----------------------------------------------------------------------------
* of_calcular_digitochequeo se encarga de Calcular el digito de chequeo para
* una cadena de numeros usando el Metodo de Modulo-10 para codigos UPCA y EAN 
* 
* Recibe la Cadena de Numeros a la que se requiere generar digito de chequeo
* Retorna el Digito de Chequeo          
* ----------------------------------------------------------------------------
*/

String 	ls_cadena       
Long 		ll_longitud, ll_item, ll_suma1, ll_suma2, ll_suma3
Integer 	li_digito, li_residuo_pos, li_residuo 
Decimal 	ldc_valor1,	ldc_valor2

ll_suma1 = 0 
ll_suma2 = 0 
ll_suma3 = 0 
 
ls_cadena   = as_cadena
ll_longitud = Len(ls_cadena)

// averigua si longitud cadena par o impar
li_residuo_pos = Mod( ll_longitud, 2) 
IF ( li_residuo_pos = 0 ) THEN
	// ok cadena par
ELSE
	ls_cadena   = "0"+ls_cadena
	ll_longitud = ll_longitud + 1 
END IF
 
FOR ll_item = 1 TO ll_longitud 
	ldc_valor1 = Mod( ll_item , 2) 
	 
	// Posicion Impar
	IF ( ldc_valor1 <> 0 )   THEN     
		ll_suma1 = ll_suma1 + Integer(Mid(ls_cadena, ll_item, 1))
	ELSE                                
		// Posicion Par
		ll_suma2 = ll_suma2 + Integer(Mid(ls_cadena, ll_item, 1))
	END IF 
NEXT
 
ll_suma3   = ll_suma1 + (ll_suma2 * 3)
li_residuo = Mod(ll_suma3, 10)
li_digito  = 10 - li_residuo

IF ( li_digito = 10 )   THEN	li_digito = 0

il_retorno[1] = li_digito

Return 1
end function

public function integer of_obtener_consecutivo_ean (integer ai_fabrica, integer ai_id_documento, transaction atr_transaction);/*
* ----------------------------------------------------------------------------
* MODIFICADO: Enero 20 de 2012 - ohlondon
* ----------------------------------------------------------------------------
* Se trae el Consecutivo segun la fabrica y el tipo de documento. 
* ----------------------------------------------------------------------------
*/
Long 		ll_cs_docu

SELECT cr.cs_documento
  INTO :ll_cs_docu
  FROM cf_consecutivos cr
 WHERE cr.co_fabrica   = :ai_fabrica  
	AND cr.id_documento = :ai_id_documento
 USING atr_transaction  ;
  
If atr_transaction.SqlCode = -1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
ELSEIf atr_transaction.SqlCode = 100 Then 
	is_retorno[1] = 'No se encuentra consecutivo para la F$$HEX1$$e100$$ENDHEX$$brica-Tipo Documento '+String(ai_fabrica)+'-'+String(ai_id_documento)+'.'
	Return 0
End If

ll_cs_docu = ll_cs_docu + 1

UPDATE cf_consecutivos
	SET cs_documento = :ll_cs_docu,
		 instancia    = SITENAME 
 WHERE co_fabrica   = :ai_fabrica  
   AND id_documento = :ai_id_documento
 USING atr_transaction  ;

If atr_transaction.SqlCode <> 0 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
//SA56753 - Ceiba/reariase - 24-05-2017 
Else
	COMMIT USING atr_transaction;
//Fin SA56753
End If	

il_retorno[1] = ll_cs_docu

Return 1

/*IF ( ai_fabrica <> 5 ) THEN 
	SELECT cr.cs_documento
	  INTO :ll_cs_docu
	  FROM cf_consecutivos_rif cr
  	 WHERE cr.co_fabrica   = :ai_fabrica  
    	AND cr.id_documento = :ai_id_documento
    USING atr_transaction  ;
ELSE
	SELECT c.cs_documento
	  INTO :ll_cs_docu
	  FROM cf_consecutivos c
	 WHERE c.co_fabrica   = :ai_fabrica 
	   AND c.id_documento = :ai_id_documento
    USING atr_transaction  ;
END IF  

If atr_transaction.SqlCode = -1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
ELSEIf atr_transaction.SqlCode = 100 Then 
	is_retorno[1] = 'No se encuentra consecutivo para la F$$HEX1$$e100$$ENDHEX$$brica-Tipo Documento '+String(ai_fabrica)+'-'+String(ai_id_documento)+'.'
	Return 0
End If

ll_cs_docu = ll_cs_docu + 1

IF ( ai_fabrica = 5 ) THEN 
	UPDATE cf_consecutivos_rif
   	SET cs_documento = :ll_cs_docu,
		    instancia    = SITENAME 
    USING atr_transaction;
ELSE
	UPDATE cf_consecutivos
   	SET cs_documento = :ll_cs_docu,
		    instancia    = SITENAME 
    USING atr_transaction;
END IF 

If atr_transaction.SqlCode <> -1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
End If

il_retorno[1] = ll_cs_docu

Return 1
*/
end function

public function integer of_generar_ean (integer ai_fabrica, integer ai_linea, transaction atr_transaction);/*
* ----------------------------------------------------------------------------
* MODIFICADO: Enero 20 de 2012 - ohlondon
* ----------------------------------------------------------------------------
* of_generar_ean se encarga de establecer el siguiente consecutivo para el ean
* de una referencia.
* ----------------------------------------------------------------------------
*/
String 			ls_ean, &
					ls_pais_ean, &
					ls_fabrica_ean,&
					ls_consecutivo_ean, &
					ls_sw_ean
Integer			li_return, &
					li_id_docu
long 				ll_digito

ls_ean = ''
/*
* ----------------------------------------------------------------------------
* Se consultan los prefijos para el ean segun la linea
* ----------------------------------------------------------------------------
*/
SELECT pais_ean, fabrica_ean, sw_ean
  INTO :ls_pais_ean, :ls_fabrica_ean, :ls_sw_ean
  FROM m_lineas  
 WHERE co_fabrica    = :ai_fabrica
	AND co_linea      = :ai_linea
 USING atr_transaction  ;

If atr_transaction.SqlCode = -1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
ELSEIf atr_transaction.SqlCode = 100 Then 
	is_retorno[1] = 'No existe la l$$HEX1$$ed00$$ENDHEX$$nea '+String(ai_fabrica)+'-'+String(ai_linea)+'.'
	Return 0
End If

IF Trim(ls_sw_ean)  = '1' THEN
	ls_ean = Trim(ls_pais_ean) + Trim(ls_fabrica_ean) 

	/*
	* ---------------------------------------------------------------------------
	* Consecutivo para el ean
	* ---------------------------------------------------------------------------
	*/
	li_return = of_valorconstante( "ID_EAN", atr_transaction)
	If li_return = 1 Then
		li_id_docu = Long(of_getDecimal(1))
	Else	 
		is_retorno[1] = "No se ha configurado la constante ID_EAN."
		Return 0
	End If
	 
	li_return = of_obtener_consecutivo_ean( ai_fabrica, li_id_docu, atr_transaction)
	If li_return = 1 Then
		ls_consecutivo_ean = String(of_getLong(1))
	ELSEIf li_return = -1 Then
		Return -1
	ELSE
		Return 0
	End If
 
 	ls_ean = ls_ean + ls_consecutivo_ean
	/*
	* ---------------------------------------------------------------------------
	* Calculo del digito de chequeo para el ean
	* ---------------------------------------------------------------------------
	*/
	of_calcular_digitochequeo( ls_ean )
	ll_digito = of_getLong(1)

	ls_ean = ls_ean + String(ll_digito)
ELSE
	is_retorno[1] = 'La F$$HEX1$$e100$$ENDHEX$$brica-L$$HEX1$$ed00$$ENDHEX$$nea no est$$HEX2$$e1002000$$ENDHEX$$configurada para generar Eanes.'
	RETURN 0
END IF
is_retorno[1] = ls_ean
Return 1
end function

public function long of_getlong (long a_posicion);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Jueves 05 de Diciembre de 2002 HORA 14:45:19:296
// 
// retorna long
//////////////////////////////////////////////////////////////////////////


long ll_dato

If UpperBound(il_retorno)>=a_posicion Then
	ll_dato=il_retorno[a_posicion]
End If

Return ll_dato
end function

public function integer of_validarcodigodiseno (string a_diseno, long a_muestra, transaction a_transaction);String ls_diseno, ls_usado
Long ll_contador
If IsNull(a_diseno) Then
	Return -1
End If

/*
SELECT count(*)   
  INTO :ll_contador
  FROM m_disenos_muestras  
 WHERE m_disenos_muestras.de_diseno = :a_diseno  
   AND m_disenos_muestras.co_muestra <> :a_muestra
 using a_transaction;
*/

SELECT Trim(de_diseno), sw_usado
  INTO :ls_diseno, :ls_usado
  FROM m_codigos_disenos   
 WHERE de_diseno = :a_diseno 
 using a_transaction;

IF a_transaction.SQLcode=-1 THEN
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
ELSEIF a_transaction.SQLcode = 100 THEN
	// Busco por descripcion, porque puede que hallan digitado la
	// descripcion en vez del codigo
	SELECT Trim(de_diseno), sw_usado
     INTO :ls_diseno, :ls_usado
	  FROM m_codigos_disenos   
	 WHERE descripcion = :a_diseno 
	 using a_transaction;
	
	IF a_transaction.SQLcode=-1 THEN
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(a_transaction)
		Return -1
	ELSEIF a_transaction.SQLcode = 100 THEN
		// Definitivamente no lo encontro, porque no existe o por que 
		// sw_usado = 1 que indica que ya se esta usando en otra muestra
		RETURN 2
	END IF
END IF

IF ls_usado = '1' THEN
	SELECT count(*)   
	  INTO :ll_contador
	  FROM m_disenos_muestras  
	 WHERE m_disenos_muestras.de_diseno = :a_diseno  
		AND m_disenos_muestras.co_muestra <> :a_muestra
	 using a_transaction;

	If a_transaction.SQLcode=-1 Then 
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(a_transaction)
		Return -1
	End If
	IF ll_contador <> 0 THEN  RETURN 1
		
END IF
is_retorno[1] = ls_diseno
Return 0
end function

public function integer of_obtener_fabrica_diseno (string as_diseno, transaction a_transaction);
// Retorna el codigo de fabrica asociada al dise$$HEX1$$f100$$ENDHEX$$o
Long ll_dato

If IsNull(as_diseno) Then
	Return -1
End If

  SELECT Max(m_disenos_muestras.co_fabrica) 
    INTO :ll_dato
    FROM m_disenos_muestras  
   WHERE ( m_disenos_muestras.de_diseno  = :as_diseno )  
   using a_transaction  ;

If a_transaction.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(a_transaction)
	Return -1
End If


If a_transaction.SQLcode=100 Then
	Return -1
End If

il_retorno[1]=ll_dato

Return 1
end function

public function integer of_verificar_borra_ref_pdn (integer ai_fabrica, integer ai_linea, long al_referencia, integer ai_talla, integer ai_calidad, long al_color, transaction atr_transaction);// Primero: Se debae validar que el color, para la referencia exista
String		ls_ean   , ls_de_surtido
Integer		li_fabrica, li_sw_surtido
Long 			ll_count


 SELECT UNIQUE dt.co_fabrica
  INTO :li_fabrica
  FROM dt_lotes_ref dt, m_lotes m
 WHERE dt.co_fabrica    = :ai_fabrica
	AND dt.co_linea      = :ai_linea
	AND dt.co_referencia = :al_referencia
	AND dt.co_talla      = :ai_talla
	AND dt.co_calidad    = :ai_calidad
	AND dt.co_color      = :al_color
	AND dt.sw_surtido    = 1
	AND m.nu_lote        = dt.nu_lote
	AND m.estado         = 0 // En proceso
   AND m.nu_surtido    IS NULL
 USING atr_transaction;

If atr_transaction.SqlCode = -1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
ELSEIf atr_transaction.SqlCode = 0 Then 
	/*-- Hay lotes marcados para surtir sin surtir si esta es la 
	-- unica equivalencia no la puede borrar, pero si hay otras 
	-- equivalencias si la puede borrar
	*/
	SELECT Count(*)
	  INTO :ll_count
	  FROM dt_surt_pdn dt
	 WHERE dt.co_fabrica    = :ai_fabrica
		AND dt.co_linea      = :ai_linea
		AND dt.co_referencia = :al_referencia
		AND dt.co_talla      = :ai_talla
		AND dt.co_calidad    = :ai_calidad
		AND dt.co_color      = :al_color
    USING atr_transaction;
	
	If atr_transaction.SqlCode = -1 Then 
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(atr_transaction)
		Return -1
	ELSEIf atr_transaction.SqlCode = 0  THEN
		IF ll_count > 1 Then 
         //ok, puede borrar esta equivalencia
			RETURN 1
		ELSE
			is_retorno[1] = 'Hay lotes marcados para surtir sin surtir de '+String(ai_fabrica)+'-'+String(ai_linea)+'-'+&
       	                String(al_referencia)+'-'+String(ai_talla)+'-'+String(ai_calidad)+'-'+String(al_color)+&
			       			 ', no se permite borrar la equivalencia.'
			Return 0
		END IF
	END IF
END IF

RETURN  1

end function

public function integer of_verificar_color_pdn (integer ai_fabrica, integer ai_linea, long al_referencia, integer ai_talla, integer ai_calidad, long al_color, transaction atr_transaction);// Primero: Se debae validar que el color, para la referencia exista
String		ls_de_surtido
Integer		li_fabrica, li_muestrario, li_sw_surtido

 
SELECT FIRST 1 r.co_muestrario
  INTO :li_muestrario
  FROM dt_vta_pdn p, dt_ref_vta r
 WHERE p.co_fabrica     = :ai_fabrica
	AND p.co_linea       = :ai_linea
	AND p.co_referencia  = :al_referencia
	AND p.co_talla       = :ai_talla
	AND p.co_calidad     = :ai_calidad
	AND r.co_fabricav    = p.co_fabricav
	AND r.co_lineav      = p.co_lineav
	AND r.co_referenciav = p.co_referenciav
	AND r.co_tallav      = p.co_tallav
	AND r.co_calidadv    = p.co_calidadv
  	AND r.co_colorv      = :al_color
USING atr_transaction;

If atr_transaction.SqlCode = -1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
ELSEIf atr_transaction.SqlCode = 100 Then 
	is_retorno[1] = 'El color '+String(ai_fabrica)+'-'+String(ai_linea)+'-'+&
	                String(al_referencia)+'-'+String(ai_talla)+'-'+String(ai_calidad)+'-'+String(al_color)+', no existe.'
	Return 0
End If
 
/*
* Se recupera la descripcion del color 
*/ 
SELECT m.de_color, m.co_color
  INTO :ls_de_surtido, :li_sw_surtido
  FROM m_colores m
 WHERE m.co_fabrica = :ai_fabrica
	AND m.co_linea   = :ai_linea
	AND m.co_color   = :al_color
 USING atr_transaction;


If atr_transaction.SqlCode = -1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
ELSEIf atr_transaction.SqlCode = 100 Then 
		is_retorno[1] = 'El color '+String(ai_fabrica)+'-'+String(ai_linea)+'-'+String(al_color) +', no existe en el maestro.'
		Return 0
END IF

is_retorno[1] = ls_de_surtido
il_retorno[1] = li_sw_surtido
Return 1



end function

public function integer of_verificar_color_vta (integer ai_fabrica, integer ai_linea, long al_referencia, integer ai_talla, integer ai_calidad, long al_color, transaction atr_transaction);// Primero: Se debae validar que el color, para la referencia exista
String		ls_ean   , ls_de_surtido
Integer		li_fabrica, li_sw_surtido

SELECT Trim(ean)
  INTO :ls_ean 
  FROM dt_ref_vta r
 WHERE r.co_fabricav    = :ai_fabrica
	AND r.co_lineav      = :ai_linea
	AND r.co_referenciav = :al_referencia
	AND r.co_tallav      = :ai_talla
	AND r.co_calidadv    = :ai_calidad
	AND r.co_colorv      = :al_color
USING atr_transaction;

If atr_transaction.SqlCode = -1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
ELSEIf atr_transaction.SqlCode = 100 Then 
	is_retorno[1] = 'La referencia '+String(ai_fabrica)+'-'+String(ai_linea)+'-'+&
	                String(al_referencia)+'-'+String(ai_talla)+'-'+String(ai_calidad)+'-'+String(al_color)+', no existe.'
	Return 0
End If
/*SE QUITA TEMPORALMENTE 20120702
SE DEBE HABILITAR 20120703


If IsNull(ls_ean) OR ls_ean = '0' THEN 
	is_retorno[1] = 'El color ' +String(al_color) +' para la referencia '+String(ai_fabrica)+'-'+String(ai_linea)+'-'+&
	                String(al_referencia)+'-'+String(ai_talla)+'-'+String(ai_calidad)+', no tiene Ean.'
	Return 0
END IF
 */
/*
* Segundo: debe verificarse que se pueda usar en surtidos
*/
SELECT FIRST 1 co_fabricav
  INTO :li_fabrica 
  FROM dt_vta_pdn_col d
 WHERE d.co_fabricav    = :ai_fabrica
   AND d.co_lineav      = :ai_linea
   AND d.co_referenciav = :al_referencia
   AND d.co_tallav      = :ai_talla
   AND d.co_calidadv    = :ai_calidad
   AND d.co_colorv      = :al_color
 USING atr_transaction;

If atr_transaction.SqlCode = -1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
ELSEIf atr_transaction.SqlCode = 0 Then 
	is_retorno[1] = 'La referencia '+String(ai_fabrica)+'-'+String(ai_linea)+'-'+&
	                String(al_referencia)+'-'+String(ai_talla)+'-'+String(ai_calidad)+'-'+String(al_color)+','+&
						 ' ya tiene relaci$$HEX1$$f300$$ENDHEX$$n por color y no se permite como surtido.'
	Return 0
End If

/*
* Se recupera la descripcion del color 
*/ 
SELECT m.de_color, m.co_color
  INTO :ls_de_surtido, :li_sw_surtido
  FROM m_colores m
 WHERE m.co_fabrica = :ai_fabrica
	AND m.co_linea   = :ai_linea
	AND m.co_color   = :al_color
 USING atr_transaction;


If atr_transaction.SqlCode = -1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(atr_transaction)
	Return -1
ELSEIf atr_transaction.SqlCode = 100 Then 
		is_retorno[1] = 'El color '+String(ai_fabrica)+'-'+String(ai_linea)+'-'+String(al_color) +', no existe en el maestro.'
		Return 0
ELSEIf atr_transaction.SqlCode = 0 Then 
	is_retorno[1] = ls_ean
	is_retorno[2] = ls_de_surtido
	il_retorno[1] = li_sw_surtido

	// busco si ya esta en en el maestro de colores surtidos
	SELECT m.de_surtido, m.sw_surtido 
	  INTO :ls_de_surtido, :li_sw_surtido
	  FROM m_colores_surt m
	 WHERE m.co_color = :al_color
	 USING atr_transaction;
			
	If atr_transaction.SqlCode = -1 Then 
		PopulateError(20,"SQL Error")
		n_cst_application.of_sql_error(atr_transaction)
		Return -1
	ELSEIF atr_transaction.SqlCode = 100 THEN
		ls_de_surtido = is_retorno[2]
		li_sw_surtido = il_retorno[1]
		/*
		* Si no se encuentra pues de una vez se inserta en el maestro de colores surtidos
		*/
		INSERT INTO m_colores_surt
		  ( sw_surtido, de_surtido, co_color)
      VALUES 
		  ( :li_sw_surtido, :ls_de_surtido, :li_sw_surtido)
		USING  atr_transaction;
		
		If atr_transaction.SqlCode <> 0 Then 
			PopulateError(20,"SQL Error")
			n_cst_application.of_sql_error(atr_transaction)
			Return -1
		END IF
	END IF
END IF
 


Return 1



end function

on n_cst_comun.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_comun.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

