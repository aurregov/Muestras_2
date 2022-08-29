HA$PBExportHeader$w_procesar_muestras.srw
forward
global type w_procesar_muestras from window
end type
type st_10 from statictext within w_procesar_muestras
end type
type cb_5 from commandbutton within w_procesar_muestras
end type
type cb_3 from commandbutton within w_procesar_muestras
end type
type sle_2 from singlelineedit within w_procesar_muestras
end type
type sle_1 from singlelineedit within w_procesar_muestras
end type
type dw_dutil from datawindow within w_procesar_muestras
end type
type cb_4 from commandbutton within w_procesar_muestras
end type
type cb_2 from commandbutton within w_procesar_muestras
end type
type st_9 from statictext within w_procesar_muestras
end type
type dw_disenosrecursos from datawindow within w_procesar_muestras
end type
type st_8 from statictext within w_procesar_muestras
end type
type st_7 from statictext within w_procesar_muestras
end type
type lds_diseno_original from datawindow within w_procesar_muestras
end type
type lds_muestras from datawindow within w_procesar_muestras
end type
type lds_disenos from datawindow within w_procesar_muestras
end type
type linea from singlelineedit within w_procesar_muestras
end type
type fabrica from singlelineedit within w_procesar_muestras
end type
type st_6 from statictext within w_procesar_muestras
end type
type st_5 from statictext within w_procesar_muestras
end type
type st_4 from statictext within w_procesar_muestras
end type
type st_3 from statictext within w_procesar_muestras
end type
type st_2 from statictext within w_procesar_muestras
end type
type st_1 from statictext within w_procesar_muestras
end type
type taprox from singlelineedit within w_procesar_muestras
end type
type proceso from singlelineedit within w_procesar_muestras
end type
type cb_1 from commandbutton within w_procesar_muestras
end type
type muestraini from singlelineedit within w_procesar_muestras
end type
type muestrafin from singlelineedit within w_procesar_muestras
end type
end forward

global type w_procesar_muestras from window
integer width = 2533
integer height = 932
boolean titlebar = true
string title = "Migrar Muestra "
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_10 st_10
cb_5 cb_5
cb_3 cb_3
sle_2 sle_2
sle_1 sle_1
dw_dutil dw_dutil
cb_4 cb_4
cb_2 cb_2
st_9 st_9
dw_disenosrecursos dw_disenosrecursos
st_8 st_8
st_7 st_7
lds_diseno_original lds_diseno_original
lds_muestras lds_muestras
lds_disenos lds_disenos
linea linea
fabrica fabrica
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
taprox taprox
proceso proceso
cb_1 cb_1
muestraini muestraini
muestrafin muestrafin
end type
global w_procesar_muestras w_procesar_muestras

type variables
//n_cst_application.itr_appl
Long il_fabrica, il_linea, il_muestraini, il_muestrafin
end variables

forward prototypes
public function integer wf_procesar ()
public function integer wf_actualizar_mt (long al_fabrica, long al_linea, long al_muestra)
public function long wf_crear_diseno (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra, readonly long al_talla, string as_diseno_muestra)
public function integer wf_prosdos ()
public function integer wf_prostres ()
public function integer wf_act_mt_simple (long al_fabrica, long al_linea, long al_muestra)
end prototypes

public function integer wf_procesar ();//n_cst_application.itr_appl
Long ll_filas_muestras, ll_filas_disenos, ll_fila_muestra , ll_disenoscambiar, ll_filacambio, ll_diseno, ll_llenardis, ll_llenadisini
long 	ll_comprobardisenoexiste, ll_diseno_mt
//DataStore	lds_muestras, lds_disenos
//lds_muestras	= CREATE DataStore
//lds_disenos		= CREATE DataStore

DataStore	lds_actualizarmedmue, lds_obsmedidas, lds_repmedidas, lds_mtcolor, lds_mtprima
lds_actualizarmedmue = CREATE DataStore
lds_obsmedidas = CREATE DataStore
lds_repmedidas = CREATE DataStore
lds_mtcolor = CREATE DataStore
lds_mtprima = CREATE DataStore

//recuperar todas las muestras que se tienen en el rango que se ingreso.
lds_actualizarmedmue.dataobject = 'd_actualizar_dt_med_mue'
lds_obsmedidas.dataobject = 'd_ob_dt_med_mue_actualizar'
lds_repmedidas.dataobject = 'd_dt_med_mue_rep_actualizar'
lds_mtcolor.dataobject = 'd_h_fmp_muestras_actualizar'
lds_mtprima.dataobject = 'd_dt_fmp_muestras_actualizar'
lds_mtprima.settransobject(n_cst_application.itr_appl)
lds_mtcolor.settransobject(n_cst_application.itr_appl)

lds_repmedidas.settransobject(n_cst_application.itr_appl)
lds_obsmedidas.settransobject(n_cst_application.itr_appl)
lds_muestras.dataobject = 'd_m_muestras_migracion'
lds_muestras.SettransObject(n_cst_application.itr_appl)
lds_muestras.retrieve(il_fabrica, il_linea, il_muestraini, il_muestrafin)


//son los disenos que contiene cada muestra
//lds_disenos.dataobject = 'd_m_muestras'
lds_disenos.SettransObject(n_cst_application.itr_appl)
dw_disenosrecursos.settransobject(n_cst_application.itr_appl)

lds_diseno_original.settransobject(n_cst_application.itr_appl)
lds_actualizarmedmue.settransobject(n_cst_application.itr_appl)

ll_filas_muestras = lds_muestras.rowcount( )


FOR ll_fila_muestra = 1 TO ll_filas_muestras	
	yield()
	
	proceso.text = String(ll_fila_muestra)+' de '+String(ll_filas_muestras) 
	lds_disenos.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra])
	ll_filas_disenos = lds_disenos.rowcount( )
	
	lds_diseno_original.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra])	
	
	dw_disenosrecursos.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra])
	
	ll_disenoscambiar = dw_disenosrecursos.rowcount( )
	
	For ll_filacambio = 1 TO  ll_disenoscambiar
		yield()
		IF dw_disenosrecursos.Object.co_diseno[ll_filacambio] = 1 THEN
			IF dw_disenosrecursos.object.co_recurso[ll_filacambio] = lds_diseno_original.object.co_recurso[1] THEN
				
			ELSE 				
				ll_diseno  = this.wf_crear_diseno( il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra], dw_disenosrecursos.object.co_talla[ll_filacambio], dw_disenosrecursos.object.de_diseno[ll_filacambio])
				
				lds_actualizarmedmue.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio], dw_disenosrecursos.Object.co_diseno[ll_filacambio])
				ll_llenardis = lds_actualizarmedmue.Rowcount( )
				
				FOR ll_llenadisini  = 1 TO ll_llenardis
					lds_actualizarmedmue.object.co_diseno[ll_llenadisini] = ll_diseno
				NEXT 
				
				lds_actualizarmedmue.update( )	
				
				
				lds_obsmedidas.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio])
				lds_repmedidas.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio])
				IF lds_obsmedidas.rowcount( ) > 0 THEN
					for ll_llenadisini = 1 To lds_obsmedidas.rowcount( )
						lds_obsmedidas.object.co_diseno[ll_llenadisini] = ll_diseno
					next
					lds_obsmedidas.update( )
				END IF
				
				IF lds_repmedidas.rowcount( ) > 0 THEN
					for ll_llenadisini = 1 To lds_repmedidas.rowcount( )	
						lds_repmedidas.object.co_diseno[ll_llenadisini] = ll_diseno
					next
					lds_repmedidas.update( )
				END IF
				
				
				lds_mtcolor.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio])
				ll_llenardis = lds_mtcolor.Rowcount( )
				
				IF ll_llenardis  > 0 THEN			
					ll_diseno_mt = lds_mtcolor.object.co_diseno[1]
				end if
									
				FOR ll_llenadisini  = 1 TO ll_llenardis
					lds_mtcolor.object.co_diseno[ll_llenadisini] = ll_diseno
					lds_mtcolor.object.cnt_opcion[ll_llenadisini] = ll_diseno
				NEXT 
				lds_mtcolor.update( )	
				
				lds_mtprima.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra], ll_diseno_mt)
				
				ll_llenardis = lds_mtprima.rowcount( )
				
				FOR ll_llenadisini  = 1 TO ll_llenardis
					lds_mtprima.object.co_diseno[ll_llenadisini] = ll_diseno
					lds_mtprima.object.cnt_opcion[ll_llenadisini] = ll_diseno
				NEXT 
				lds_mtprima.update( )
				
					
			END IF
		ELSE
			FOR ll_comprobardisenoexiste = 1 To ll_filacambio
				yield()
				IF dw_disenosrecursos.Object.co_diseno[ll_filacambio] = dw_disenosrecursos.Object.co_diseno[ll_comprobardisenoexiste] AND ll_comprobardisenoexiste <>  ll_filacambio THEN
					ll_diseno  = this.wf_crear_diseno( il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra], dw_disenosrecursos.object.co_talla[ll_filacambio], dw_disenosrecursos.object.de_diseno[ll_filacambio])
					///////////////////////////////
//					lds_actualizarmedmue.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio], dw_disenosrecursos.Object.co_diseno[ll_filacambio])
//					ll_llenardis = lds_actualizarmedmue.Rowcount( )
//					
//					FOR ll_llenadisini  = 1 TO ll_llenardis
//						lds_actualizarmedmue.object.co_diseno[ll_llenadisini] = ll_diseno											
//					NEXT 
//					lds_actualizarmedmue.update( )
//					
//					lds_obsmedidas.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio])
//					IF lds_obsmedidas.rowcount( ) > 0 THEN
//						for ll_llenadisini = 1 TO lds_obsmedidas.rowcount( )
//							lds_obsmedidas.object.co_diseno[ll_llenadisini] = ll_diseno
//						next
//						lds_obsmedidas.update( )
//					END IF
//					
//					lds_repmedidas.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio])
//					
//					
//					IF lds_repmedidas.rowcount( ) > 0 THEN
//						for ll_llenadisini = 1 TO lds_repmedidas.rowcount( )
//							lds_repmedidas.object.co_diseno[ll_llenadisini] = ll_diseno
//						next
//							
//						lds_repmedidas.update( )
//					END IF
//					
//					lds_mtcolor.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio])
//					ll_llenardis = lds_mtcolor.Rowcount( )
//					
//					IF ll_llenardis  > 0 THEN			
//						ll_diseno_mt = lds_mtcolor.object.co_diseno[1]
//					end if					
//					
//					FOR ll_llenadisini  = 1 TO ll_llenardis
//						lds_mtcolor.object.co_diseno[ll_llenadisini] = ll_diseno
//						lds_mtcolor.object.cnt_opcion[ll_llenadisini] = ll_diseno
//					NEXT 
//					lds_mtcolor.update( )
//					
//					
//					lds_mtprima.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra], ll_diseno_mt)
//					
//					ll_llenardis = lds_mtprima.rowcount( )
//					
//					FOR ll_llenadisini  = 1 TO ll_llenardis
//						lds_mtprima.object.co_diseno[ll_llenadisini] = ll_diseno
//						lds_mtprima.object.cnt_opcion[ll_llenadisini] = ll_diseno
//					NEXT 
//					lds_mtprima.update( )				
	
						lds_actualizarmedmue.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio], dw_disenosrecursos.Object.co_diseno[ll_filacambio])
					ll_llenardis = lds_actualizarmedmue.Rowcount( )
					
					FOR ll_llenadisini  = 1 TO ll_llenardis
						lds_actualizarmedmue.object.co_diseno[ll_llenadisini] = ll_diseno
					NEXT 
					
					lds_actualizarmedmue.update( )	
					
					
					lds_obsmedidas.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio])
					lds_repmedidas.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio])
					IF lds_obsmedidas.rowcount( ) > 0 THEN
						for ll_llenadisini = 1 To lds_obsmedidas.rowcount( )
							lds_obsmedidas.object.co_diseno[ll_llenadisini] = ll_diseno
						next
						lds_obsmedidas.update( )
					END IF
					
					IF lds_repmedidas.rowcount( ) > 0 THEN
						for ll_llenadisini = 1 To lds_repmedidas.rowcount( )	
							lds_repmedidas.object.co_diseno[ll_llenadisini] = ll_diseno
						next
						lds_repmedidas.update( )
					END IF
					
					
					lds_mtcolor.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio])
					ll_llenardis = lds_mtcolor.Rowcount( )
					
					IF ll_llenardis  > 0 THEN			
						ll_diseno_mt = lds_mtcolor.object.co_diseno[1]
					end if
										
					FOR ll_llenadisini  = 1 TO ll_llenardis
						lds_mtcolor.object.co_diseno[ll_llenadisini] = ll_diseno
						lds_mtcolor.object.cnt_opcion[ll_llenadisini] = ll_diseno
					NEXT 
					lds_mtcolor.update( )	
					
					lds_mtprima.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra], ll_diseno_mt)
					
					ll_llenardis = lds_mtprima.rowcount( )
					
					FOR ll_llenadisini  = 1 TO ll_llenardis
						lds_mtprima.object.co_diseno[ll_llenadisini] = ll_diseno
						lds_mtprima.object.cnt_opcion[ll_llenadisini] = ll_diseno
					NEXT 
					lds_mtprima.update( )
						
				end if
			
			NEXT
			
		END IF
	
		
	NEXT
	COMMIT USING n_cst_application.itr_appl;		
	wf_actualizar_mt(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra])	
NEXT

Commit using n_cst_application.itr_appl;	

return 1 
end function

public function integer wf_actualizar_mt (long al_fabrica, long al_linea, long al_muestra);Long 	ll_filas, ll_fila, ll_recurso, ll_diseno

DataStore 		lds_actmateriaprima

lds_actmateriaprima = CREATE DataStore
lds_actmateriaprima.dataobject = 'd_disenospormuestra'
lds_actmateriaprima.SettransObject(n_cst_application.itr_appl)


lds_actmateriaprima.retrieve(al_fabrica,al_linea,al_muestra)

ll_filas = lds_actmateriaprima.rowcount( )
FOR ll_fila = 1 TO ll_filas
	ll_diseno = lds_actmateriaprima.object.co_diseno[ll_fila]
	
	ll_recurso = lds_actmateriaprima.object.co_recurso[ll_fila]
	
	update h_fmp_muestras 
	set co_recurso = :ll_recurso
	WHERE ( h_fmp_muestras.co_fabrica = :al_fabrica ) 
	AND  	( h_fmp_muestras.co_linea = :al_linea ) 
	AND  	( h_fmp_muestras.co_muestra = :al_muestra ) 
	AND  	( h_fmp_muestras.co_diseno = :ll_diseno)
	USING n_cst_application.itr_appl;
	
	
	
	
NEXT

			





















return 1 
end function

public function long wf_crear_diseno (readonly long al_fabrica, readonly long al_linea, readonly long al_muestra, readonly long al_talla, string as_diseno_muestra);String ls_diseno_muestra
Long	ll_fabrica, ll_linea, ll_muestra, ll_cons, ll_insert, ll_null, ll_numdiseno
DateTime ldt_hoy
n_cst_param lo_param

SetNull(ll_null)

DataStore		lds_datos, lds_disenomuestra
lds_datos		= CREATE DataStore
lds_disenomuestra = CREATE DataStore

ll_fabrica  = al_fabrica
ll_linea = al_linea
ll_muestra = al_muestra

lds_datos.Dataobject = 'd_m_muestras'
lds_datos.Settransobject( n_cst_application.itr_appl)
lds_datos.Retrieve(ll_fabrica, ll_linea, ll_muestra)

lds_disenomuestra.Dataobject = 'd_listains_m_disenos_muestras'
lds_disenomuestra.Settransobject( n_cst_application.itr_appl)
lds_disenomuestra.Retrieve(ll_fabrica,ll_linea,ll_muestra, al_talla)

	lo_param.is_vector[1] = Trim(lds_datos.GetItemString(1,'de_muestra'))
	OpenWithParm(w_m_codigos_disenos,lo_param)
	
	lo_param = Message.PowerObjectParm
	If (IsValid(lo_param) ) THEN 
		ls_diseno_muestra=lo_param.is_vector[1]

//		ll_cons = Long(lds_disenomuestra.Describe("Evaluate('max(co_diseno for all)', 0)"))
		
		lds_disenomuestra.setsort( "co_diseno desc")
		lds_disenomuestra.sort( )
		
		IF lds_disenomuestra.Rowcount( ) > 0 THEN ll_cons = lds_disenomuestra.object.co_diseno[1]
		
		If IsNull(ll_cons) Then ll_cons=0		
		ll_cons++
		ll_insert = lds_disenomuestra.Insertrow( 0)
		
		lds_disenomuestra.SetItem(ll_insert,"co_fabrica",ll_fabrica)
		lds_disenomuestra.SetItem(ll_insert,"co_linea",ll_linea)
		lds_disenomuestra.SetItem(ll_insert,"co_muestra",ll_muestra)
		lds_disenomuestra.SetItem(ll_insert,"co_talla",al_talla)
		lds_disenomuestra.SetItem(ll_insert,"co_diseno",ll_cons)
		lds_disenomuestra.SetItem(ll_insert,"de_diseno",as_diseno_muestra)
		lds_disenomuestra.SetItem(ll_insert,"fe_creacion",DateTime(Date(today()),Time(now())))
		lds_disenomuestra.SetItem(ll_insert,"fe_actualizacion",DateTime(Date(today()),Time(now())))
		lds_disenomuestra.SetItem(ll_insert,"usuario",gs_usuario)
		lds_disenomuestra.SetItem(ll_insert,"instancia",gs_instancia)		
		ldt_hoy = DateTime(Date(today()),Time(now()))
		
		as_diseno_muestra = trim(as_diseno_muestra)
		
		SELECT COUNT(de_diseno) 
		INTO :ll_numdiseno
		FROM m_codigos_disenos
		WHERE TRIM(de_diseno) = :as_diseno_muestra
		USING n_cst_application.itr_appl;
		
		IF ll_numdiseno = 0 THEN
			INSERT INTO m_codigos_disenos (de_diseno, descripcion,sw_usado, fe_actualizacion, usuario, instancia)
			VALUES (:as_diseno_muestra,:as_diseno_muestra,1, :ldt_hoy, :gs_usuario, :gs_instancia)
			USING n_cst_application.itr_appl;
		ELSE 
			UPDATE m_codigos_disenos
			SET 	(sw_usado, fe_actualizacion, usuario, instancia) = (1, :ldt_hoy, :gs_usuario, :gs_instancia)    
			WHERE m_codigos_disenos.de_diseno = :ls_diseno_muestra
			USING n_cst_application.itr_appl;
		END IF

		
		lds_disenomuestra.update( )
		
		COMMIT using n_cst_application.itr_appl;
	End If

return ll_cons
end function

public function integer wf_prosdos ();//n_cst_application.itr_appl
Long ll_filas_muestras, ll_filas_disenos, ll_fila_muestra , ll_disenoscambiar, ll_filacambio, ll_diseno, ll_llenardis, ll_llenadisini
long 	ll_comprobardisenoexiste, ll_diseno_mt, ll_insert, ll_find
Boolean lb_materiaprima
//DataStore	lds_muestras, lds_disenos
//lds_muestras	= CREATE DataStore
//lds_disenos		= CREATE DataStore

DataStore	lds_actualizarmedmue, lds_obsmedidas, lds_repmedidas, lds_mtcolor, lds_dt_fmp_muestras
lds_actualizarmedmue = CREATE DataStore
lds_obsmedidas = CREATE DataStore
lds_repmedidas = CREATE DataStore
lds_mtcolor = CREATE DataStore
lds_dt_fmp_muestras = CREATE DataStore

//recuperar todas las muestras que se tienen en el rango que se ingreso.
lds_actualizarmedmue.dataobject = 'd_actualizar_dt_med_mue'
lds_obsmedidas.dataobject = 'd_ob_dt_med_mue_actualizar'
lds_repmedidas.dataobject = 'd_dt_med_mue_rep_actualizar'
lds_mtcolor.dataobject = 'd_h_fmp_muestras_actualizar'
lds_dt_fmp_muestras.dataobject = 'd_dt_fmp_muestras_actualizar'
lds_dt_fmp_muestras.settransobject(n_cst_application.itr_appl)
lds_mtcolor.settransobject(n_cst_application.itr_appl)

lds_repmedidas.settransobject(n_cst_application.itr_appl)
lds_obsmedidas.settransobject(n_cst_application.itr_appl)
lds_muestras.dataobject = 'd_m_muestras_migracion'
lds_muestras.SettransObject(n_cst_application.itr_appl)
lds_muestras.retrieve(il_fabrica, il_linea, il_muestraini, il_muestrafin)

dw_dutil.reset( )
//son los disenos que contiene cada muestra
//lds_disenos.dataobject = 'd_m_muestras'
lds_disenos.SettransObject(n_cst_application.itr_appl)
dw_disenosrecursos.settransobject(n_cst_application.itr_appl)

lds_diseno_original.settransobject(n_cst_application.itr_appl)
lds_actualizarmedmue.settransobject(n_cst_application.itr_appl)

ll_filas_muestras = lds_muestras.rowcount( )


FOR ll_fila_muestra = 1 TO ll_filas_muestras	
	yield()
	dw_dutil.reset( )
	proceso.text = String(ll_fila_muestra)+' de '+String(ll_filas_muestras) 
	lds_disenos.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra])
	ll_filas_disenos = lds_disenos.rowcount( )
	
	lds_diseno_original.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra])	
	
	dw_disenosrecursos.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra])
	
	ll_disenoscambiar = dw_disenosrecursos.rowcount( )
	
	For ll_filacambio = 1 TO  ll_disenoscambiar
		yield()
		IF dw_disenosrecursos.Object.co_diseno[ll_filacambio] = 1 THEN
			IF dw_disenosrecursos.object.co_recurso[ll_filacambio] = lds_diseno_original.object.co_recurso[1] THEN
				
			ELSE 				
				ll_diseno  = this.wf_crear_diseno( il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra], dw_disenosrecursos.object.co_talla[ll_filacambio], dw_disenosrecursos.object.de_diseno[ll_filacambio])
				ll_insert = dw_dutil.insertrow( 0)
				dw_dutil.object.diseno[ll_insert] = ll_diseno
				lds_actualizarmedmue.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio], dw_disenosrecursos.Object.co_diseno[ll_filacambio])
				ll_llenardis = lds_actualizarmedmue.Rowcount( )
				
				FOR ll_llenadisini  = 1 TO ll_llenardis
					yield()
					lds_actualizarmedmue.object.co_diseno[ll_llenadisini] = ll_diseno
				NEXT 
				
				lds_actualizarmedmue.update( )	
				
				
				lds_obsmedidas.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio])
				lds_repmedidas.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio])
				IF lds_obsmedidas.rowcount( ) > 0 THEN
					for ll_llenadisini = 1 To lds_obsmedidas.rowcount( )
						lds_obsmedidas.object.co_diseno[ll_llenadisini] = ll_diseno
					next
					lds_obsmedidas.update( )
				END IF
				
				IF lds_repmedidas.rowcount( ) > 0 THEN
					for ll_llenadisini = 1 To lds_repmedidas.rowcount( )	
						lds_repmedidas.object.co_diseno[ll_llenadisini] = ll_diseno
					next
					lds_repmedidas.update( )
				END IF
				
				
				lds_mtcolor.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio])
				ll_llenardis = lds_mtcolor.Rowcount( )
				
				IF ll_llenardis  > 0 THEN			
					ll_diseno_mt = lds_mtcolor.object.co_diseno[1]
					lb_materiaprima = true
				end if
				
				IF lb_materiaprima THEN	
					yield()
					lb_materiaprima = false
					FOR ll_llenadisini  = 1 TO ll_llenardis
						yield()
						lds_mtcolor.object.co_diseno[ll_llenadisini] = ll_diseno
						lds_mtcolor.object.cnt_opcion[ll_llenadisini] = ll_diseno
					NEXT 
					lds_mtcolor.update( )	
					
					lds_dt_fmp_muestras.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra], ll_diseno_mt)
					
					ll_llenardis = lds_dt_fmp_muestras.rowcount( )
					
					FOR ll_llenadisini  = 1 TO ll_llenardis
						yield()
						lds_dt_fmp_muestras.object.co_diseno[ll_llenadisini] = ll_diseno
						lds_dt_fmp_muestras.object.cnt_opcion[ll_llenadisini] = ll_diseno
					NEXT 
					lds_dt_fmp_muestras.update( )
				END IF
			END IF
		ELSE
				IF dw_disenosrecursos.object.co_recurso[ll_filacambio] = lds_diseno_original.object.co_recurso[1] THEN
					
				ELSE 				
					ll_find = dw_dutil.find( " diseno = "+String(dw_disenosrecursos.object.co_diseno[ll_filacambio] ), 1, dw_dutil.rowcount( ) )
					
					IF ll_find > 0 THEN
						ll_diseno  = this.wf_crear_diseno( il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra], dw_disenosrecursos.object.co_talla[ll_filacambio], dw_disenosrecursos.object.de_diseno[ll_filacambio])
					ELSE 
						ll_diseno  = dw_disenosrecursos.object.co_diseno[ll_filacambio]
					END IF
					
					
					ll_insert = dw_dutil.insertrow( 0)
					dw_dutil.object.diseno[ll_insert] = ll_diseno
				
				
					lds_actualizarmedmue.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio], dw_disenosrecursos.Object.co_diseno[ll_filacambio])
					ll_llenardis = lds_actualizarmedmue.Rowcount( )
					
					FOR ll_llenadisini  = 1 TO ll_llenardis
						lds_actualizarmedmue.object.co_diseno[ll_llenadisini] = ll_diseno
					NEXT 
					
					lds_actualizarmedmue.update( )	
					yield()
					
					lds_obsmedidas.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio])
					lds_repmedidas.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio])
					IF lds_obsmedidas.rowcount( ) > 0 THEN
						for ll_llenadisini = 1 To lds_obsmedidas.rowcount( )
							lds_obsmedidas.object.co_diseno[ll_llenadisini] = ll_diseno
						next
						lds_obsmedidas.update( )
					END IF
					yield()
					IF lds_repmedidas.rowcount( ) > 0 THEN
						for ll_llenadisini = 1 To lds_repmedidas.rowcount( )	
							lds_repmedidas.object.co_diseno[ll_llenadisini] = ll_diseno
						next
						lds_repmedidas.update( )
					END IF
					
					
					lds_mtcolor.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio])
					ll_llenardis = lds_mtcolor.Rowcount( )
					
					IF ll_llenardis  > 0 THEN	
						lb_materiaprima = true
						ll_diseno_mt = lds_mtcolor.object.co_diseno[1]
					end if
					IF lb_materiaprima THEN					
						FOR ll_llenadisini  = 1 TO ll_llenardis
							yield()
							lds_mtcolor.object.co_diseno[ll_llenadisini] = ll_diseno
							lds_mtcolor.object.cnt_opcion[ll_llenadisini] = ll_diseno
						NEXT 
						lds_mtcolor.update( )	
						
						lds_dt_fmp_muestras.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra], ll_diseno_mt)
						
						ll_llenardis = lds_dt_fmp_muestras.rowcount( )
						
						FOR ll_llenadisini  = 1 TO ll_llenardis
							yield()
							lds_dt_fmp_muestras.object.co_diseno[ll_llenadisini] = ll_diseno
							lds_dt_fmp_muestras.object.cnt_opcion[ll_llenadisini] = ll_diseno
						NEXT 
						lds_dt_fmp_muestras.update( )
						lb_materiaprima = FALSE
					END IF
			END IF					
		END IF		
	NEXT
	COMMIT USING n_cst_application.itr_appl;		
	wf_actualizar_mt(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra])	
NEXT

Commit using n_cst_application.itr_appl;	

return 1 
end function

public function integer wf_prostres ();//n_cst_application.itr_appl
Long ll_filas_muestras, ll_filas_disenos, ll_fila_muestra , ll_disenoscambiar, ll_filacambio, ll_diseno, ll_llenardis, ll_llenadisini
long 	ll_comprobardisenoexiste, ll_diseno_mt, ll_insert, ll_find
Boolean lb_materiaprima
//DataStore	lds_muestras, lds_disenos
//lds_muestras	= CREATE DataStore
//lds_disenos		= CREATE DataStore

DataStore	lds_actualizarmedmue, lds_obsmedidas, lds_repmedidas
lds_actualizarmedmue = CREATE DataStore
lds_obsmedidas = CREATE DataStore
lds_repmedidas = CREATE DataStore


//recuperar todas las muestras que se tienen en el rango que se ingreso.
lds_actualizarmedmue.dataobject = 'd_actualizar_dt_med_mue'
lds_obsmedidas.dataobject = 'd_ob_dt_med_mue_actualizar'
lds_repmedidas.dataobject = 'd_dt_med_mue_rep_actualizar'

lds_repmedidas.settransobject(n_cst_application.itr_appl)
lds_obsmedidas.settransobject(n_cst_application.itr_appl)
lds_muestras.dataobject = 'd_m_muestras_migracion'
lds_muestras.SettransObject(n_cst_application.itr_appl)
lds_muestras.retrieve(il_fabrica, il_linea, il_muestraini, il_muestrafin)

dw_dutil.reset( )
//son los disenos que contiene cada muestra
//lds_disenos.dataobject = 'd_m_muestras'
lds_disenos.SettransObject(n_cst_application.itr_appl)
dw_disenosrecursos.settransobject(n_cst_application.itr_appl)

lds_diseno_original.settransobject(n_cst_application.itr_appl)
lds_actualizarmedmue.settransobject(n_cst_application.itr_appl)

ll_filas_muestras = lds_muestras.rowcount( )


FOR ll_fila_muestra = 1 TO ll_filas_muestras	
	yield()
	dw_dutil.reset( )
	proceso.text = String(ll_fila_muestra)+' de '+String(ll_filas_muestras) 
	lds_disenos.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra])
	ll_filas_disenos = lds_disenos.rowcount( )
	
	lds_diseno_original.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra])	
	
	dw_disenosrecursos.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra])
	
	ll_disenoscambiar = dw_disenosrecursos.rowcount( )
	
	For ll_filacambio = 1 TO  ll_disenoscambiar
		yield()
		IF dw_disenosrecursos.Object.co_diseno[ll_filacambio] = 1 THEN
			IF dw_disenosrecursos.object.co_recurso[ll_filacambio] = lds_diseno_original.object.co_recurso[1] THEN
				
			ELSE 				
				ll_diseno  = this.wf_crear_diseno( il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra], dw_disenosrecursos.object.co_talla[ll_filacambio], dw_disenosrecursos.object.de_diseno[ll_filacambio])
				ll_insert = dw_dutil.insertrow( 0)
				dw_dutil.object.diseno[ll_insert] = ll_diseno
				lds_actualizarmedmue.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio], dw_disenosrecursos.Object.co_diseno[ll_filacambio])
				ll_llenardis = lds_actualizarmedmue.Rowcount( )
				
				FOR ll_llenadisini  = 1 TO ll_llenardis
					yield()
					lds_actualizarmedmue.object.co_diseno[ll_llenadisini] = ll_diseno
				NEXT 
				
				lds_actualizarmedmue.update( )	
				
				
				lds_obsmedidas.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio])
				lds_repmedidas.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio])
				IF lds_obsmedidas.rowcount( ) > 0 THEN
					for ll_llenadisini = 1 To lds_obsmedidas.rowcount( )
						lds_obsmedidas.object.co_diseno[ll_llenadisini] = ll_diseno
					next
					lds_obsmedidas.update( )
				END IF
				
				IF lds_repmedidas.rowcount( ) > 0 THEN
					for ll_llenadisini = 1 To lds_repmedidas.rowcount( )	
						lds_repmedidas.object.co_diseno[ll_llenadisini] = ll_diseno
					next
					lds_repmedidas.update( )
				END IF				
			END IF
		ELSE
				IF dw_disenosrecursos.object.co_recurso[ll_filacambio] = lds_diseno_original.object.co_recurso[1] THEN
					
				ELSE 				
					ll_find = dw_dutil.find( " diseno = "+String(dw_disenosrecursos.object.co_diseno[ll_filacambio] ), 1, dw_dutil.rowcount( ) )
					
					IF ll_find > 0 THEN
						ll_diseno  = this.wf_crear_diseno( il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra], dw_disenosrecursos.object.co_talla[ll_filacambio], dw_disenosrecursos.object.de_diseno[ll_filacambio])
					ELSE 
						ll_diseno  = dw_disenosrecursos.object.co_diseno[ll_filacambio]
					END IF
					
					
					ll_insert = dw_dutil.insertrow( 0)
					dw_dutil.object.diseno[ll_insert] = ll_diseno
				
				
					lds_actualizarmedmue.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio], dw_disenosrecursos.Object.co_diseno[ll_filacambio])
					ll_llenardis = lds_actualizarmedmue.Rowcount( )
					
					FOR ll_llenadisini  = 1 TO ll_llenardis
						lds_actualizarmedmue.object.co_diseno[ll_llenadisini] = ll_diseno
					NEXT 
					
					lds_actualizarmedmue.update( )	
					yield()
					
					lds_obsmedidas.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio])
					lds_repmedidas.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio])
					IF lds_obsmedidas.rowcount( ) > 0 THEN
						for ll_llenadisini = 1 To lds_obsmedidas.rowcount( )
							lds_obsmedidas.object.co_diseno[ll_llenadisini] = ll_diseno
						next
						lds_obsmedidas.update( )
					END IF
					yield()
					IF lds_repmedidas.rowcount( ) > 0 THEN
						for ll_llenadisini = 1 To lds_repmedidas.rowcount( )	
							lds_repmedidas.object.co_diseno[ll_llenadisini] = ll_diseno
						next
						lds_repmedidas.update( )
					END IF
			END IF					
		END IF		
	NEXT
	wf_act_mt_simple(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra])
	
	COMMIT USING n_cst_application.itr_appl;		
		
NEXT

Commit using n_cst_application.itr_appl;	

return 1 
end function

public function integer wf_act_mt_simple (long al_fabrica, long al_linea, long al_muestra);Long 	ll_filas, ll_fila, ll_recurso, ll_diseno

DataStore 		lds_actmateriaprima

lds_actmateriaprima = CREATE DataStore
lds_actmateriaprima.dataobject = 'd_disenospormuestra'
lds_actmateriaprima.SettransObject(n_cst_application.itr_appl)


lds_actmateriaprima.retrieve(al_fabrica,al_linea,al_muestra)

ll_filas = lds_actmateriaprima.rowcount( )
FOR ll_fila = 1 TO ll_filas
	ll_diseno = lds_actmateriaprima.object.co_diseno[ll_fila]
	
	ll_recurso = lds_actmateriaprima.object.co_recurso[ll_fila]
	
	update h_fmp_muestras 
	set co_recurso = :ll_recurso
	WHERE ( h_fmp_muestras.co_fabrica = :al_fabrica ) 
	AND  	( h_fmp_muestras.co_linea = :al_linea ) 
	AND  	( h_fmp_muestras.co_muestra = :al_muestra ) 
	AND  	( h_fmp_muestras.co_diseno = :ll_diseno)
	USING n_cst_application.itr_appl;
	
	
	
	
NEXT

			





















return 1 
end function

on w_procesar_muestras.create
this.st_10=create st_10
this.cb_5=create cb_5
this.cb_3=create cb_3
this.sle_2=create sle_2
this.sle_1=create sle_1
this.dw_dutil=create dw_dutil
this.cb_4=create cb_4
this.cb_2=create cb_2
this.st_9=create st_9
this.dw_disenosrecursos=create dw_disenosrecursos
this.st_8=create st_8
this.st_7=create st_7
this.lds_diseno_original=create lds_diseno_original
this.lds_muestras=create lds_muestras
this.lds_disenos=create lds_disenos
this.linea=create linea
this.fabrica=create fabrica
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.taprox=create taprox
this.proceso=create proceso
this.cb_1=create cb_1
this.muestraini=create muestraini
this.muestrafin=create muestrafin
this.Control[]={this.st_10,&
this.cb_5,&
this.cb_3,&
this.sle_2,&
this.sle_1,&
this.dw_dutil,&
this.cb_4,&
this.cb_2,&
this.st_9,&
this.dw_disenosrecursos,&
this.st_8,&
this.st_7,&
this.lds_diseno_original,&
this.lds_muestras,&
this.lds_disenos,&
this.linea,&
this.fabrica,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.taprox,&
this.proceso,&
this.cb_1,&
this.muestraini,&
this.muestrafin}
end on

on w_procesar_muestras.destroy
destroy(this.st_10)
destroy(this.cb_5)
destroy(this.cb_3)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.dw_dutil)
destroy(this.cb_4)
destroy(this.cb_2)
destroy(this.st_9)
destroy(this.dw_disenosrecursos)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.lds_diseno_original)
destroy(this.lds_muestras)
destroy(this.lds_disenos)
destroy(this.linea)
destroy(this.fabrica)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.taprox)
destroy(this.proceso)
destroy(this.cb_1)
destroy(this.muestraini)
destroy(this.muestrafin)
end on

type st_10 from statictext within w_procesar_muestras
integer x = 983
integer y = 444
integer width = 1509
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Hora Inicial                       Fecha hora Final"
boolean focusrectangle = false
end type

type cb_5 from commandbutton within w_procesar_muestras
integer x = 105
integer y = 716
integer width = 379
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Generar"
end type

event clicked;String	ls_fecha
long 		ll_fabricas, ll_fabrica

ls_fecha = String(DateTime(Date(today()),Time(now())))

sle_1.text = String(DateTime(Date(today()),Time(now())))

il_muestraini = Long(muestraini.text)
il_muestrafin = Long(muestrafin.text )


il_fabrica = Long(fabrica.text)
il_linea = Long(linea.text)

IF il_muestraini = 0 OR il_muestrafin = 0 OR il_fabrica = 0 OR il_linea = 0 THEN
	MessageBox('Validacion', 'Faltan valores por ingresar')
	RETURN 
END IF

wf_prosTres()
sle_2.text = String(DateTime(Date(today()),Time(now())))
end event

type cb_3 from commandbutton within w_procesar_muestras
integer x = 2601
integer y = 792
integer width = 379
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "POR MUESTRA"
end type

event clicked;String ls_fecha
long ll_fabricas, ll_fabrica

ls_fecha = String(DateTime(Date(today()),Time(now())))

sle_1.text = String(DateTime(Date(today()),Time(now())))

	il_muestraini = Long(muestraini.text)
	il_muestrafin = Long(muestrafin.text )
	

	il_fabrica = Long(fabrica.text)
	il_linea = Long(linea.text)
	
	wf_prosdos()
sle_2.text = String(DateTime(Date(today()),Time(now())))
end event

type sle_2 from singlelineedit within w_procesar_muestras
integer x = 1687
integer y = 528
integer width = 805
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_procesar_muestras
integer x = 969
integer y = 528
integer width = 626
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type dw_dutil from datawindow within w_procesar_muestras
integer x = 3698
integer y = 52
integer width = 686
integer height = 916
string title = "none"
string dataobject = "d_disenos_utilizados"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within w_procesar_muestras
boolean visible = false
integer x = 3163
integer y = 792
integer width = 343
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;il_fabrica = Long(fabrica.text)
il_linea = Long(linea.text)
il_muestraini = Long(muestraini.text)
il_muestrafin = Long(muestrafin.text)


//n_cst_application.itr_appl
Long ll_filas_muestras, ll_filas_disenos, ll_fila_muestra , ll_disenoscambiar, ll_filacambio, ll_diseno, ll_llenardis, ll_llenadisini
long 	ll_comprobardisenoexiste, ll_diseno_mt
//DataStore	lds_muestras, lds_disenos
//lds_muestras	= CREATE DataStore
//lds_disenos		= CREATE DataStore

DataStore	lds_actualizarmedmue, lds_obsmedidas, lds_repmedidas, lds_mtcolor, lds_mtprima
lds_actualizarmedmue = CREATE DataStore
lds_obsmedidas = CREATE DataStore
lds_repmedidas = CREATE DataStore
lds_mtcolor = CREATE DataStore
lds_mtprima = CREATE DataStore

//recuperar todas las muestras que se tienen en el rango que se ingreso.
lds_actualizarmedmue.dataobject = 'd_actualizar_dt_med_mue'
lds_obsmedidas.dataobject = 'd_ob_dt_med_mue_actualizar'
lds_repmedidas.dataobject = 'd_dt_med_mue_rep_actualizar'
lds_mtcolor.dataobject = 'd_h_fmp_muestras_actualizar'
lds_mtprima.dataobject = 'd_dt_fmp_muestras_actualizar'
lds_mtprima.settransobject(n_cst_application.itr_appl)
lds_mtcolor.settransobject(n_cst_application.itr_appl)

lds_repmedidas.settransobject(n_cst_application.itr_appl)
lds_obsmedidas.settransobject(n_cst_application.itr_appl)
lds_muestras.dataobject = 'd_m_muestras_migracion'
lds_muestras.SettransObject(n_cst_application.itr_appl)
lds_muestras.retrieve(il_fabrica, il_linea, il_muestraini, il_muestrafin)


//son los disenos que contiene cada muestra
//lds_disenos.dataobject = 'd_m_muestras'
lds_disenos.SettransObject(n_cst_application.itr_appl)
dw_disenosrecursos.settransobject(n_cst_application.itr_appl)

lds_diseno_original.settransobject(n_cst_application.itr_appl)
lds_actualizarmedmue.settransobject(n_cst_application.itr_appl)

ll_filas_muestras = lds_muestras.rowcount( )


FOR ll_fila_muestra = 1 TO ll_filas_muestras	
	yield()
	
	proceso.text = String(ll_fila_muestra)+' de '+String(ll_filas_muestras) 
	lds_disenos.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra])
	ll_filas_disenos = lds_disenos.rowcount( )
	
	lds_diseno_original.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra])	
	
	dw_disenosrecursos.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra])
	
	ll_disenoscambiar = dw_disenosrecursos.rowcount( )
	
	For ll_filacambio = 1 TO  ll_disenoscambiar
		yield()
		IF dw_disenosrecursos.Object.co_diseno[ll_filacambio] = 1 THEN
	
		ELSE
			ll_diseno = lds_muestras.object.co_diseno[1]
			
			FOR ll_comprobardisenoexiste = 1 To ll_filacambio
					lds_obsmedidas.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio])
					IF lds_obsmedidas.rowcount( ) > 0 THEN
						for ll_llenadisini = 1 TO lds_obsmedidas.rowcount( )
							lds_obsmedidas.object.co_diseno[ll_llenadisini] = dw_disenosrecursos.object.co_diseno[ll_filacambio]
						next
						lds_obsmedidas.update( )
					END IF
					
					lds_repmedidas.retrieve(il_fabrica, il_linea, lds_muestras.object.co_muestra[ll_fila_muestra],dw_disenosrecursos.object.co_recurso[ll_filacambio])
					
					
					IF lds_repmedidas.rowcount( ) > 0 THEN
						for ll_llenadisini = 1 TO lds_repmedidas.rowcount( )
							lds_repmedidas.object.co_diseno[ll_llenadisini] = dw_disenosrecursos.object.co_diseno[ll_filacambio]
						next
							
						lds_repmedidas.update( )
					END IF
		
			NEXT
			
		END IF
		
		
//		<>
		
	NEXT
Commit using n_cst_application.itr_appl;		
	
//	select * from dt_med_mue
//where co_fabrica = 2
//and co_linea =2
//and co_muestra = 33706
//and co_recurso = 1455
//and co_diseno = 1;
//
//


//dt_med_mue , dt_med_mue_rep , ob_dt_med_mue 
//h_fmp_muestras, dt_fmp_muestras, dt_muestras_fert
//	
//	
	
//tablas a actualizar	
//	dt_med_mue, dt_med_mue_rep, ob_dt_med_mue
//
//h_fmp_muestras, dt_fmp_muestras, dt_muestras_fert
NEXT

Commit using n_cst_application.itr_appl;	

return 1 
end event

type cb_2 from commandbutton within w_procesar_muestras
integer x = 3168
integer y = 2056
integer width = 343
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;dw_disenosrecursos.update( )
end event

type st_9 from statictext within w_procesar_muestras
integer x = 64
integer y = 1804
integer width = 1353
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "recursos y disenos de medidas "
boolean focusrectangle = false
end type

type dw_disenosrecursos from datawindow within w_procesar_muestras
integer x = 50
integer y = 1908
integer width = 2720
integer height = 1440
string title = "none"
string dataobject = "d_disenospormuestra"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_8 from statictext within w_procesar_muestras
integer x = 91
integer y = 1468
integer width = 1353
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "datos del recurso de la muestra"
boolean focusrectangle = false
end type

type st_7 from statictext within w_procesar_muestras
integer x = 91
integer y = 876
integer width = 1353
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Disenos de las muestras"
boolean focusrectangle = false
end type

type lds_diseno_original from datawindow within w_procesar_muestras
integer x = 50
integer y = 1572
integer width = 5714
integer height = 188
integer taborder = 80
string title = "none"
string dataobject = "d_diseno_original"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type lds_muestras from datawindow within w_procesar_muestras
integer x = 2661
integer y = 28
integer width = 1006
integer height = 668
string title = "none"
string dataobject = "d_m_muestras_migracion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type lds_disenos from datawindow within w_procesar_muestras
boolean visible = false
integer x = 96
integer y = 976
integer width = 4055
integer height = 464
string title = "none"
string dataobject = "d_disenos_muestras"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type linea from singlelineedit within w_procesar_muestras
integer x = 567
integer y = 100
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type fabrica from singlelineedit within w_procesar_muestras
integer x = 114
integer y = 100
integer width = 343
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

type st_6 from statictext within w_procesar_muestras
integer x = 137
integer y = 8
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fabrica "
boolean focusrectangle = false
end type

type st_5 from statictext within w_procesar_muestras
integer x = 581
integer y = 12
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Linea"
boolean focusrectangle = false
end type

type st_4 from statictext within w_procesar_muestras
integer x = 105
integer y = 448
integer width = 809
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "proceso de actualizacion"
boolean focusrectangle = false
end type

type st_3 from statictext within w_procesar_muestras
boolean visible = false
integer x = 1006
integer y = 212
integer width = 809
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tiempo aproximado"
boolean focusrectangle = false
end type

type st_2 from statictext within w_procesar_muestras
integer x = 558
integer y = 208
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "muestra final"
boolean focusrectangle = false
end type

type st_1 from statictext within w_procesar_muestras
integer x = 114
integer y = 204
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "muestra inicial"
boolean focusrectangle = false
end type

type taprox from singlelineedit within w_procesar_muestras
boolean visible = false
integer x = 1001
integer y = 288
integer width = 818
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type proceso from singlelineedit within w_procesar_muestras
integer x = 91
integer y = 528
integer width = 818
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_procesar_muestras
boolean visible = false
integer x = 562
integer y = 716
integer width = 343
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Masivo"
end type

event clicked;String ls_fecha
long ll_fabricas, ll_fabrica
DataStore	lds_fabricaslineas
lds_fabricaslineas = CREATE DataStore

lds_fabricaslineas.dataobject = 'fabricaslineas'
lds_fabricaslineas.settransobject( n_cst_application.itr_appl)
lds_fabricaslineas.retrieve()

ll_fabricas = lds_fabricaslineas.rowcount( )

ls_fecha = String(DateTime(Date(today()),Time(now())))

sle_1.text = String(DateTime(Date(today()),Time(now())))

for ll_fabrica = 1 to ll_fabricas
	Yield ( )
	
	fabrica.text = String(lds_fabricaslineas.Object.co_fabrica[ll_fabrica])
	linea.text = String(lds_fabricaslineas.Object.co_linea[ll_fabrica])

	il_fabrica = Long(fabrica.text)
	il_linea = Long(linea.text)
	
	muestraini.text = '1'
	muestrafin.text = '99999'
	
	il_muestraini = Long(1)
	il_muestrafin = Long(99999)
	wf_prostres()
		
next

sle_2.text = String(DateTime(Date(today()),Time(now())))
	
	





//wf_procesar( )
end event

type muestraini from singlelineedit within w_procesar_muestras
integer x = 114
integer y = 296
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type muestrafin from singlelineedit within w_procesar_muestras
integer x = 567
integer y = 296
integer width = 343
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

