HA$PBExportHeader$uo_dtwndow.sru
$PBExportComments$Control Datawindow Inteligente
forward
global type uo_dtwndow from datawindow
end type
end forward

global type uo_dtwndow from datawindow
int Width=946
int Height=364
int TabOrder=1
boolean VScrollBar=true
event adcnar_fla pbm_custom20
event brrar_fla pbm_custom19
event brrar_tdo_flas pbm_custom18
event on_brrar pbm_custom17
event on_insrtar pbm_custom16
event on_actlzar pbm_custom15
event ue_nvo pbm_custom01
event ue_abrir pbm_custom02
event ue_asgnar_dtos pbm_custom03
event ue_presionar_tecla pbm_dwnkey
end type
global uo_dtwndow uo_dtwndow

type variables
long il_fla_slccnda
Boolean ib_insercion_automatica = False
end variables

event ue_presionar_tecla;Integer li_columnas, li_num_col, li_sigte_col
Long ll_filas, ll_fila_actual

IF Key = KeyEnter! THEN
	li_columnas = Integer(This.Object.DataWindow.Column.Count)
	li_num_col = This.GetColumn()
	IF li_columnas = li_num_col THEN
		IF ib_insercion_automatica THEN
			ll_filas = This.RowCount()
			ll_fila_actual = This.GetRow()
			IF ll_filas = ll_fila_actual THEN
				Parent.TriggerEvent("ue_insertar_detalle")
			ELSE
				This.SetRow(ll_fila_actual + 1)
			END IF
			li_sigte_col = 1
			DO WHILE This.SetColumn(li_sigte_col) = -1 AND li_sigte_col <= li_columnas
				li_sigte_col = li_sigte_col + 1
			LOOP
		END IF
	ELSE
		li_sigte_col = This.GetColumn() + 1
		DO WHILE This.SetColumn(li_sigte_col) = -1 AND li_sigte_col <= li_columnas
			li_sigte_col = li_sigte_col + 1
		LOOP
	END IF
	Return(1)
END IF
end event

event rowfocuschanged;This.SelectRow(0,FALSE)
This.SelectRow(CurrentRow,TRUE)
IF This.RowCount() = 1 THEN
This.SelectRow(0,FALSE)
END IF

end event

event dberror;s_base_parametros lstr_parametros_error
Transaction ltr_transaccion
String	ls_mensaje

ltr_transaccion = Create Transaction

This.GetTrans(ltr_transaccion)

CHOOSE CASE SQLDBCode
	CASE -391
		ls_mensaje	=	'No se pudo grabar la informaci$$HEX1$$f300$$ENDHEX$$n porque '+&
							'Hay alguna columna sin valor, revise por favor'
	CASE -268
		ls_mensaje	=	'No se pudo grabar la informaci$$HEX1$$f300$$ENDHEX$$n porque '+&
							'Ya existen datos de las mismas caracter$$HEX1$$ed00$$ENDHEX$$sticas en la base de datos '
	CASE -692
		ls_mensaje	=	'No se pudo borrar la informaci$$HEX1$$f300$$ENDHEX$$n porque '+&
							'es utilizada esta relacionada con otros datos de la base de datos'
	CASE ELSE
		ls_mensaje	=	'Error no conocido, por favor intente de nuevo o comuniquese con sistemas,'+&
							'Comunicandole el siguente mensaje, y explicandoles lo que estaba haciendo '+&
							' No. de Error : '+string (SQLDBCode)+' Clase: '+	this.classname()+' Padre: '+&
							 Parent.Classname()
END CHOOSE

//ltr_transaccion.dbms
//SQLDBCode
//this.classname()
//Parent.Classname()
//ls_mensaje
MessageBox(	"Error", ls_mensaje , Exclamation!, OK!)
RETURN(1)
end event

event itemerror;Return(1)
end event

event updatestart;//String 	ls_numerocolumnas
//Long		ll_numerocolumnas, ll_columna
//
//ls_numerocolumnas = 	This.Object.DataWindow.Column.Count
//ll_numerocolumnas	=	Long(Trim(ls_numerocolumnas))
//
//ll_columna	=	1
//DO WHILE ll_columna <= ll_numerocolumnas
//	IF This.Object. THEN
//	END IF
//	
//	
//	ll_columna++
//LOOP
//
//
//
//
//
//
//
//
end event

