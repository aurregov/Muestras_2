HA$PBExportHeader$w_report.srw
$PBExportComments$Ventana para reportes base
forward
global type w_report from w_sheet
end type
type dw_report from u_dw_base within w_report
end type
end forward

global type w_report from w_sheet
string menuname = "m_report"
boolean maxbox = true
boolean resizable = true
event ue_firstpage ( )
event ue_priorpage ( )
event ue_nextpage ( )
event ue_lastpage ( )
event ue_rule ( readonly boolean ab_valor )
event ue_zoom ( )
dw_report dw_report
end type
global w_report w_report

type variables
Private:
            String is_select_original
end variables

forward prototypes
public subroutine of_load (n_tr_base atr_transaction, readonly string as_datawindow, readonly string as_title)
end prototypes

event ue_firstpage;Long	ll_row,ll_prev_row

dw_report.SetRedraw(False)
Do 
	ll_prev_row = ll_row
	ll_row 		= dw_report.ScrollPriorPage()
Loop Until ll_row = ll_prev_row Or ll_row <= 0
dw_report.SetRedraw(True)

end event

event ue_priorpage;
dw_report.ScrollPriorPage()
end event

event ue_nextpage;
dw_report.ScrollNextPage()
end event

event ue_lastpage;Long	ll_row,ll_prev_row

dw_report.SetRedraw(False)
Do 
	ll_prev_row = ll_row
	ll_row 		= dw_report.ScrollNextPage()
Loop Until ll_row = ll_prev_row Or ll_row <= 0
dw_report.SetRedraw(True)
end event

event ue_rule;
If ab_valor Then
	dw_report.Modify("DataWindow.Print.Preview.Rulers=Yes")
Else
	dw_report.Modify("DataWindow.Print.Preview.Rulers=No")
End If	
	
end event

event ue_zoom;

OpenWithParm(w_zoom,dw_report)
end event

public subroutine of_load (n_tr_base atr_transaction, readonly string as_datawindow, readonly string as_title);
dw_report.of_Load(as_datawindow)
If dw_report.of_Conexion(atr_transaction,True) = 1 Then
	
	dw_report.Object.DataWindow.Print.Preview = True
	
	This.Title = as_title
	
	is_select_original = dw_report.Describe('DataWindow.Table.Select')
	If is_select_original = '?' Or is_select_original = '!' Then
		MessageBox("Error","Se ha producido un error determinando el select !. ",StopSign!)
		Close(This)
	Else
		dw_report.Event ue_find()
	End If
	
End If

end subroutine

on w_report.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_report" then this.MenuID = create m_report
this.dw_report=create dw_report
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_report
end on

on w_report.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_report)
end on

event resize;
dw_report.SetRedraw(False)
dw_report.width  = newwidth
dw_report.height = newheight
dw_report.SetRedraw(True)

end event

type dw_report from u_dw_base within w_report
integer x = 5
boolean bringtotop = true
boolean hscrollbar = true
end type

event ue_find;String ls_where,ls_error

OpenWithParm(w_find,This)
ls_where = Message.StringParm
If ls_where <> '?' Then
	ls_error = This.Modify("DataWindow.Table.Select='"+is_select_original+ls_where+"'")
	If ls_error = "" Then
		This.Retrieve()
	Else
		MessageBox("Error","Se ha producido un error determinando el select !. "+ls_error,StopSign!)
	End If
End If	
This.SetFocus()
end event

event ue_preview;

If ib_preview Then
	//Object.DataWindow.Print.Preview = 'Yes'
	Modify("DataWindow.Print.Preview='Yes'")
Else
	//Object.DataWindow.Print.Preview = 'No'
	Modify("DataWindow.Print.Preview='No'")
End If
	
	


end event

