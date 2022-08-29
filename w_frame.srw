HA$PBExportHeader$w_frame.srw
$PBExportComments$ventana que se hereda para el marco de las aplicaciones
forward
global type w_frame from w_base
end type
type mdi_1 from mdiclient within w_frame
end type
end forward

global type w_frame from w_base
string menuname = "m_frame"
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
mdi_1 mdi_1
end type
global w_frame w_frame

on w_frame.create
int iCurrent
call super::create
if this.MenuName = "m_frame" then this.MenuID = create m_frame
this.mdi_1=create mdi_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mdi_1
end on

on w_frame.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

event open;m_base lm_menu

lm_menu = This.MenuId

//Deshabilitar opciones deacuerdo al perfil del usuario  
n_cst_application.inv_seguridad.of_seguridad(lm_menu,"w_application")
end event

event ue_close;
Close(This)
end event

type mdi_1 from mdiclient within w_frame
long BackColor=276856960
end type

