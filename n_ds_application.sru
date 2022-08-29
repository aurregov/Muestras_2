HA$PBExportHeader$n_ds_application.sru
$PBExportComments$DataStore espec$$HEX1$$ed00$$ENDHEX$$fico para la aplicaci$$HEX1$$f300$$ENDHEX$$n que contiene las opciones de men$$HEX2$$fa002000$$ENDHEX$$no permitidas para el perfil
forward
global type n_ds_application from n_ds_base
end type
end forward

global type n_ds_application from n_ds_base
end type
global n_ds_application n_ds_application

type variables
String is_SQLSyntax, is_SQLErrText
Long il_SQLDBCode

Boolean ib_dberror = False
Boolean ib_mostrar_dberror = True
end variables
forward prototypes
public function boolean of_existcolumn (string as_columna)
public function integer of_datosactualizacion (datetime a_fecha, string a_usuario, string a_instancia)
end prototypes

public function boolean of_existcolumn (string as_columna);//Este m$$HEX1$$e900$$ENDHEX$$todo determina si el DataWindow Object tiene o no 
//una determinada columna

String  ls_name
Integer li_i,li_n

li_n = Integer(This.Describe("DataWindow.Column.Count"))
For li_i = 1 To li_n 
	ls_name = This.Describe("#"+String(li_i)+".Name")
	If ls_name = as_columna Then
		Return True
	End If	
Next	

Return False
end function

public function integer of_datosactualizacion (datetime a_fecha, string a_usuario, string a_instancia);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Miercoles 18 de Diciembre de 2002 HORA 09:53:24:421
// 
// 
//////////////////////////////////////////////////////////////////////////
DateTime ldt_crea
long i,ll_tot

DwItemStatus l_status

	ll_tot = This.RowCount()
	For i = 1 To ll_tot
		l_status = This.GetItemStatus(i,0,Primary!)
		If l_status <> NotModified! Then
			//si el DataWindow tiene fe_actualizacion,usuario,instancia
			//entonces actualizarlas
			If of_existColumn("fe_actualizacion") Then
				This.SetItem(i,'fe_actualizacion',a_fecha)
			End If
			
			If of_existColumn("usuario") Then
				This.SetItem(i,'usuario',a_usuario)
			End If
			
			If of_existColumn("instancia") Then
				This.SetItem(i,'instancia',a_instancia)
			End If
//////////////////////////////////////////////////////////////////////////
// Actualizo tambien la fecha de creacion si es null
// 
//////////////////////////////////////////////////////////////////////////
			
			If of_existColumn("fe_creacion") Then
				ldt_crea=GetItemDateTime(i,"fe_creacion")
				If IsNull(ldt_crea) Then
					This.SetItem(i,'fe_creacion',a_fecha)
				End If
			End If
			
		End If
	Next
	
Return 1
end function

on n_ds_application.create
call super::create
end on

on n_ds_application.destroy
call super::destroy
end on

event sqlpreview;call super::sqlpreview;//MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n!",ClassName()+"~n"+dataobject+"~n"+sqlsyntax)
//
end event

event dberror;call super::dberror;String ls_error

ib_dberror = True

is_SQLSyntax	= SQLSyntax
is_SQLErrText	= SQLErrText
il_SQLDBCode	= SQLDBCode

Choose Case sqldbcode
	Case -268
		ls_error = "Se est$$HEX2$$e1002000$$ENDHEX$$tratando de ingresar un que registro que ya existe !."+Char(13)+"Detalles: "+SQLErrText
	
	Case -692
		ls_error = "Est$$HEX2$$e1002000$$ENDHEX$$tratando de eliminar un registro que ya es referenciado por otro archivo !."+Char(13)&
										+"Detalles: "+SQLErrText

	Case Else
		ls_error = "Se ha producido un error !."+Char(13) + "Detalles: "+SQLErrText
	
End Choose 

ROLLBACK Using n_cst_application.itr_appl;

If ib_mostrar_dberror Then MessageBox("Validaci$$HEX1$$f300$$ENDHEX$$n", ls_error, Exclamation!) 

Return 1



end event

