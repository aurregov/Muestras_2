HA$PBExportHeader$w_procesando_programacion.srw
$PBExportComments$Window Object para la interfaz de procesamiento que el usuario tiene mientras se ejecuta el proceso de programaci$$HEX1$$f300$$ENDHEX$$n
forward
global type w_procesando_programacion from w_procesando
end type
type cb_cancelar from u_cb_application within w_procesando_programacion
end type
type hpb_conteo from u_hpb_base_prog within w_procesando_programacion
end type
end forward

global type w_procesando_programacion from w_procesando
integer height = 492
cb_cancelar cb_cancelar
hpb_conteo hpb_conteo
end type
global w_procesando_programacion w_procesando_programacion

type variables
PRIVATE:
		Boolean 		ib_cancelar
		n_cst_param iuo_param
end variables

forward prototypes
public function integer of_settitle (string as_title)
public function boolean of_get_estado ()
public function integer of_set_hpb (long al_max)
public function integer of_stepit ()
end prototypes

public function integer of_settitle (string as_title);//------------
//SetPointer(HourGlass!)
Title=as_title
//------------
Return 1
end function

public function boolean of_get_estado ();/*******************************************************************************************************
* PROC./FUNC.: of_get_estado
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	Retorna el estado de la variable de instancia ib_cancelar
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Martes 18 de Enero de 2005. Hora: 08:12:32
********************************************************************************************************/

//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
Return ib_cancelar
//END SCRIPT------------------------------------------------------------------------------------------------------

end function

public function integer of_set_hpb (long al_max);/*******************************************************************************************************
* PROC./FUNC.: of_set_hpb
* ARG.		 : None
* RETURN		 : Integer
* SCOPE		 : Public
* PURPOSE	 :	Asigna los valores enviados como parametro al HProgressBar
* PRECOND.	 : None
* POSTCOND.	 : None
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Martes 18 de Enero de 2005. Hora: 08:12:32
********************************************************************************************************/
//VARIABLE DECLARATION
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
hpb_conteo.MaxPosition=al_max
//------------------------------------------------------------------------------------------------------
Return 1
//END SCRIPT------------------------------------------------------------------------------------------------------

end function

public function integer of_stepit ();hpb_conteo.StepIt()
Return 1
end function

on w_procesando_programacion.create
int iCurrent
call super::create
this.cb_cancelar=create cb_cancelar
this.hpb_conteo=create hpb_conteo
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancelar
this.Control[iCurrent+2]=this.hpb_conteo
end on

on w_procesando_programacion.destroy
call super::destroy
destroy(this.cb_cancelar)
destroy(this.hpb_conteo)
end on

event open;/*******************************************************************************************************
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	14 de Enero de 2005
********************************************************************************************************/
//VARIABLE DECLARATION
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
This.x = 800
This.y = 1000
If Not IsNull(Message.StringParm) Then
	of_settitle(Message.StringParm)
	Return
End If

If Not IsNull(Message.PowerObjectParm) Then
	iuo_param=Message.PowerObjectParm
	of_settitle(iuo_param.is_vector[1])
	of_set_hpb (iuo_param.il_vector[1])
End If

//END SCRIPT------------------------------------------------------------------------------------------------------




end event

type st_1 from w_procesando`st_1 within w_procesando_programacion
integer x = 763
string text = "Espere por favor..."
end type

type gb_1 from w_procesando`gb_1 within w_procesando_programacion
end type

type cb_cancelar from u_cb_application within w_procesando_programacion
integer x = 795
integer y = 276
integer taborder = 20
boolean bringtotop = true
string pointer = "Arrow!"
string text = "&Cancelar"
end type

event clicked;call super::clicked;/*******************************************************************************************************
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	14 de Enero de 2005
********************************************************************************************************/
//VARIABLE DECLARATION
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
ib_cancelar=TRUE
//END SCRIPT------------------------------------------------------------------------------------------------------




end event

type hpb_conteo from u_hpb_base_prog within w_procesando_programacion
boolean visible = false
integer x = 69
integer y = 20
boolean bringtotop = true
end type

