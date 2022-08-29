HA$PBExportHeader$w_m_partebas1.srw
forward
global type w_m_partebas1 from w_simple
end type
type cb_1 from commandbutton within w_m_partebas1
end type
end forward

global type w_m_partebas1 from w_simple
integer width = 2487
integer height = 1332
string title = "Partes B$$HEX1$$e100$$ENDHEX$$sicas para medidas"
cb_1 cb_1
end type
global w_m_partebas1 w_m_partebas1

on w_m_partebas1.create
int iCurrent
call super::create
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
end on

on w_m_partebas1.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
end on

event open;call super::open;this.x = 1
this.y = 1
end event

type dw_general from w_simple`dw_general within w_m_partebas1
integer y = 108
integer width = 2345
integer height = 860
string dataobject = "d_m_partebas1"
end type

type gb_general from w_simple`gb_general within w_m_partebas1
integer width = 2409
end type

type cb_1 from commandbutton within w_m_partebas1
integer x = 2075
integer y = 1024
integer width = 343
integer height = 100
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ordenar"
end type

event clicked;long i,ll_tot

ll_tot=dw_general.RowCount()

dw_general.Sort()

For i=1 to ll_tot
	dw_general.SetItem(i,"orden_partebas",10*i)
Next

end event

