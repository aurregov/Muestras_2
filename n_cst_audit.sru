HA$PBExportHeader$n_cst_audit.sru
$PBExportComments$Objeto que se pasa con argumentos entre otros objetos
forward
global type n_cst_audit from nonvisualobject
end type
end forward

global type n_cst_audit from nonvisualobject autoinstantiate
event type long of_audit ( datawindow ad_dw,  long an_row,  dwbuffer an_buffer )
end type

type variables
Private :  
           String is_column[]
			  String is_table
			  String is_tipo
			  Int    ii_numcol 
end variables

forward prototypes
public function integer Of_column (datawindow adw_dw)
public function string of_tipo (SQLPreviewType asqlpt_tipo)
public subroutine of_getdata (datawindow adw_dw, long an_row, dwbuffer adwbf_buffer, string as_column, ref string as_valuenew, ref string as_valueold)
public function integer of_audit (datawindow adw_dw, dwbuffer adwbf_buffer, long an_row, n_tr_base atr_transaction, sqlpreviewtype asqlpt_tipo)
public function integer of_logaudit (datawindow adw_dw, long an_row, dwbuffer adwbf_buffer, n_tr_base atr_transaction)
end prototypes

public function integer Of_column (datawindow adw_dw);Int    li_n,li_i
String ls_tag


ii_numcol = 0

li_n = Integer(adw_dw.Describe("DataWindow.Column.Count"))

For li_i = 1 To li_n 
	//Obtengo el tag del campo, y busca si tiene la propiedad de auditoria
	ls_tag = adw_dw.Describe("#"+String(li_i)+".Tag")
		
	If ls_tag <> '?' And ls_tag <> '!' And Pos(ls_tag,"&A") > 0 Then
		ii_numcol ++
		is_column[ii_numcol] = adw_dw.Describe("#"+String(li_i)+".Name")
	End If	
Next	

Return ii_numcol
end function

public function string of_tipo (SQLPreviewType asqlpt_tipo);
CHOOSE CASE asqlpt_tipo
	CASE PreviewInsert!
		Return 'I'
	CASE PreviewDelete!
		Return 'D'
	CASE PreviewUpdate!
		Return 'U'
END CHOOSE

	
end function

public subroutine of_getdata (datawindow adw_dw, long an_row, dwbuffer adwbf_buffer, string as_column, ref string as_valuenew, ref string as_valueold);
String ls_type


ls_type = lower(adw_dw.Describe(as_column + ".coltype"))

Choose Case ls_type
	Case "number"
		as_valuenew = String(adw_dw.GetItemNumber(an_row,as_column,adwbf_buffer,False))
		as_valueold = String(adw_dw.GetItemNumber(an_row,as_column,adwbf_buffer,True))
	Case "long"
		as_valuenew = String(adw_dw.GetItemNumber(an_row,as_column,adwbf_buffer,False))
		as_valueold = String(adw_dw.GetItemNumber(an_row,as_column,adwbf_buffer,True))
	Case "date"
		as_valuenew = String(adw_dw.GetItemDate(an_row,as_column,adwbf_buffer,False))
		as_valueold = String(adw_dw.GetItemDate(an_row,as_column,adwbf_buffer,True))
	Case "datetime"
		as_valuenew = String(adw_dw.GetItemdatetime(an_row,as_column,adwbf_buffer,False))
		as_valueold = String(adw_dw.GetItemdatetime(an_row,as_column,adwbf_buffer,True))
	Case Else
		If left(ls_type, 4) = "char" Then
			as_valuenew = Trim(adw_dw.GetItemString(an_row,as_column,adwbf_buffer,False))
			as_valueold = Trim(adw_dw.GetItemString(an_row,as_column,adwbf_buffer,True))
		elseif left(ls_type,3)="dec" Then
			as_valuenew = String(adw_dw.GetItemDecimal(an_row,as_column,adwbf_buffer,False))
			as_valueold = String(adw_dw.GetItemDecimal(an_row,as_column,adwbf_buffer,True))
		End If
End Choose


end subroutine

public function integer of_audit (datawindow adw_dw, dwbuffer adwbf_buffer, long an_row, n_tr_base atr_transaction, sqlpreviewtype asqlpt_tipo);
If asqlpt_tipo = PreviewSelect! Then Return 0

is_table = adw_dw.Describe("DataWindow.Table.UpdateTable")

is_tipo  = Of_tipo(asqlpt_tipo)

If This.of_Column(adw_dw) = 0 Then Return 0

Return Of_LogAudit(adw_dw,an_row,adwbf_buffer,atr_transaction) 

end function

public function integer of_logaudit (datawindow adw_dw, long an_row, dwbuffer adwbf_buffer, n_tr_base atr_transaction);String ls_valuenew,ls_valueold
Int    li_i



For li_i = 1 To ii_numcol
	
	Of_getData(adw_dw,an_row,adwbf_buffer,is_column[li_i],ls_valuenew,ls_valueold)

	If ls_valuenew = ls_valueold And is_tipo = 'U' Then Continue
		
	insert into dt_logs  
			 ( de_aplicacion,de_tabla,de_campo,co_tipo_operacion,dato_old,   
				dato_new,estacion_w,fe_actualizacion,usuario,instancia )  
	values ( :n_cst_application.is_application,:is_table,:is_column[li_i],:is_tipo,   
				:ls_valueold,:ls_valuenew,:n_cst_application.is_workstation,current,user,sitename ) using atr_transaction ;
				
	If atr_transaction.SqlCode = -1 Then Return -1
	//MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!","aaa")

Next

Return 0
end function

event constructor;//
end event

on n_cst_audit.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_audit.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

