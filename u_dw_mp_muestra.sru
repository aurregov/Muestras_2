HA$PBExportHeader$u_dw_mp_muestra.sru
$PBExportComments$Para la mano de obra de muestras
forward
global type u_dw_mp_muestra from u_dw_application
end type
end forward

global type u_dw_mp_muestra from u_dw_application
end type
global u_dw_mp_muestra u_dw_mp_muestra

type variables
long il_fabrica,il_linea,il_muestra,il_talla,il_color,il_opcion,il_centro, il_muestrario , il_diseno
end variables

forward prototypes
public function string of_observacion ()
public function integer of_datosadicionales (ref string a_peso, ref string a_recurso, ref string a_creacion, ref string a_modificacion)
public subroutine of_setfabrica (long a_fabrica)
public subroutine of_setlinea (long a_linea)
public subroutine of_setmuestra (long a_muestra)
public subroutine of_settalla (long a_talla)
public subroutine of_setcolor (long a_color)
public subroutine of_setopcion (long a_opcion)
public subroutine of_setcentro (long a_centro)
public function integer of_recuperar ()
public function integer of_selecciondw ()
public subroutine of_setmuestrario (long a_muestrario)
public subroutine of_setdiseno (long a_diseno)
end prototypes

public function string of_observacion ();


long ll_tot

n_ds_application lds_1

lds_1=create n_ds_application

lds_1.DataObject="d_dt_fmp_obs_muestras_ref"

lds_1.SetTransObject(n_cst_application.itr_appl)



ll_tot=lds_1.Retrieve(il_fabrica,&
      	             il_linea,&
      					 il_muestra,&
							 il_talla,il_muestrario,il_diseno)

String ls_observacion,ls_tmp
long i
If ll_tot>0 Then
	ls_observacion=lds_1.GetItemString(1,"obs_fmp")
End If

For i=1 to 4
	ls_tmp+=Trim(mid(ls_observacion,70 * (i -1)+1,70))+"~n"
Next

Destroy lds_1

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

public subroutine of_setfabrica (long a_fabrica);il_fabrica=a_fabrica
end subroutine

public subroutine of_setlinea (long a_linea);il_linea=a_linea
end subroutine

public subroutine of_setmuestra (long a_muestra);il_muestra=a_muestra
end subroutine

public subroutine of_settalla (long a_talla);il_talla=a_talla
end subroutine

public subroutine of_setcolor (long a_color);il_color=a_color
end subroutine

public subroutine of_setopcion (long a_opcion);il_opcion=a_opcion
end subroutine

public subroutine of_setcentro (long a_centro);il_centro=a_centro
end subroutine

public function integer of_recuperar ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 04 de Agosto de 2003 HORA 15:55:03:583
// 
//////////////////////////////////////////////////////////////////////////

long ll_tot,i,ll_parte,ll_grupo,ll_parte1,ll_grupo1,ll_comb,ll_comb1



ll_tot=Retrieve(il_fabrica,&
              il_linea,&
				  il_muestra,&
				  il_talla,&
				  il_color,&
				  il_opcion,&
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
	ll_parte=GetItemNUmber(i,"co_partemp")
	If ll_parte=999 Then
		If i>1 Then
			ll_comb=GetItemNUmber(i,"co_combinacion")
			ll_comb1=GetItemNUmber(i -1,"co_combinacion")
			ll_grupo=GetItemNUmber(i,"grupo")
			ll_grupo1=GetItemNUmber(i -1,"grupo")
			
			If ll_grupo=ll_grupo1 and ll_comb=ll_comb1 Then
				SetItem(i,"vis",0)
			Else
				SetItem(i,"vis",1)
			End If
		Else
			SetItem(i,"vis",1)
		End If
	Else
		If i>1 Then
			ll_parte1=GetItemNUmber(i -1,"co_partemp")
			ll_grupo=GetItemNUmber(i,"grupo")
			ll_grupo1=GetItemNUmber(i -1,"grupo")
			
			If ll_grupo=ll_grupo1 and ll_parte=ll_parte1 Then
				SetItem(i,"vis",0)
			Else
				SetItem(i,"vis",1)
			End If
		Else
			SetItem(i,"vis",1)
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

Modify("fecha.text='"+String(ldt_fecha,"YYYY/MM/DD hh:mm")+"'")
Modify("usuario.text='"+ls_usuario+"'")

long ll_res

n_cst_comun lo_comun

ll_res=lo_comun.of_nombremuestraTalla(il_fabrica,il_linea,il_muestra,&
       il_talla,n_cst_application.itr_appl)

If ll_res=1 Then
	Modify("talla.text='("+String(il_talla)+") "+&
   lo_comun.of_getString(1)+"'")
End If

ll_res=lo_comun.of_nombremuestra(il_fabrica,il_linea,il_muestra,&
       n_cst_application.itr_appl)

If ll_res=1 Then
	Modify("de_muestra.text='"+&
                lo_comun.of_GetString(1)+"'")
End If					  

//////////////////////////////////////////////////////////////////////////
// Selecciono datos adicionales para el informe
// peso, recurso, fecha creacion y modificacion
//////////////////////////////////////////////////////////////////////////
String ls_peso,ls_recurso,ls_modificacion,ls_creacion

If of_datosAdicionales(ls_peso,ls_recurso,ls_creacion,ls_modificacion)=1 Then
	Modify("peso.text='"+ls_peso+"'")
	Modify("recurso.text='"+ls_recurso+"'")
	Modify("creacion.text='"+ls_creacion+"'")
	Modify("modificacion.text='"+ls_modificacion+"'")
Else
	Modify("peso.text=''")
	Modify("recurso.text=''")
	Modify("creacion.text=''")
	Modify("modificacion.text=''")
	
End If
//////////////////////////////////////////////////////////////////////////
// Se colocan las observaciones
// 
//////////////////////////////////////////////////////////////////////////

Modify("observaciones.text='"+of_observacion()+"'")

Return 1
end function

public function integer of_selecciondw ();//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 04 de Agosto de 2003 HORA 17:28:38:447
// 
// Para especificar cual es el dw adecuado
// si es provisional con lineas
// si es definitivo con los datos
//////////////////////////////////////////////////////////////////////////


n_ds_application lds_1

lds_1=create n_ds_application

lds_1.DataObject="d_detalle_fmp_mues"

lds_1.SetTransObject(n_cst_application.itr_appl)

lds_1.retrieve(il_fabrica,il_linea,il_muestra,il_talla)

If lds_1.RowCount()=0 Then
	MessageBox("Advertencia!","No se encontr$$HEX2$$f3002000$$ENDHEX$$la materia prima.",StopSign!)
	Return -1
End If

String ls_tipo_peso

ls_tipo_peso=lds_1.GetItemString(1,"id_peso")

If ls_tipo_peso="D" Then
	dataobject="d_rep_matmp_mues"
Else
	dataobject="d_rep_matmp_mues_digita"
End If

SetTransObject(n_cst_application.itr_appl)


Modify("DataWindow.Print.Preview=Yes")

destroy lds_1

Return 1
end function

public subroutine of_setmuestrario (long a_muestrario);il_muestrario =a_muestrario
end subroutine

public subroutine of_setdiseno (long a_diseno);il_diseno =a_diseno
end subroutine

on u_dw_mp_muestra.create
call super::create
end on

on u_dw_mp_muestra.destroy
call super::destroy
end on

