HA$PBExportHeader$n_cst_estado_muestra.sru
$PBExportComments$Este objeto mueve las muestras y verfica que la operaci$$HEX1$$f300$$ENDHEX$$n sea exitosa
forward
global type n_cst_estado_muestra from nonvisualobject
end type
end forward

global type n_cst_estado_muestra from nonvisualobject autoinstantiate
end type

type variables
n_ds_application ids_1
end variables

forward prototypes
public function integer of_mover (long a_fabrica, long a_linea, long a_muestra, long a_talla, long a_color, long a_estado, string a_ctecnico, string a_observacion)
end prototypes

public function integer of_mover (long a_fabrica, long a_linea, long a_muestra, long a_talla, long a_color, long a_estado, string a_ctecnico, string a_observacion);//////////////////////////////////////////////////////////////////////////
// Utiliza el procedimiento para el movimiento de las muestras
// 
//////////////////////////////////////////////////////////////////////////

long ll_tot




ll_tot=ids_1.Retrieve(a_fabrica,&
                      a_linea,&
							 a_muestra,&
							 a_talla,&
							 a_color,&
							 a_estado,&
							 a_ctecnico,&
							 a_observacion)

If ll_tot<=0 Then
	//MessageBox("Advertencia!","Error moviendo la muestra.",StopSign!)
	Return -3
End If
ll_tot=ids_1.GetItemNumber(1,"res")

Return ll_tot
end function

event constructor;ids_1=create n_ds_application

ids_1.DataObject="d_estado_muestra"

ids_1.SetTransObject(n_cst_application.itr_appl)
end event

on n_cst_estado_muestra.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_estado_muestra.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

