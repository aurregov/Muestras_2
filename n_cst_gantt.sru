HA$PBExportHeader$n_cst_gantt.sru
$PBExportComments$Custom Class que procesa las funciones particulares en la generaci$$HEX1$$f300$$ENDHEX$$n del archivo del gantt
forward
global type n_cst_gantt from nonvisualobject
end type
end forward

global type n_cst_gantt from nonvisualobject autoinstantiate
end type

forward prototypes
public function string of_caracter_especial (string as_cadena)
end prototypes

public function string of_caracter_especial (string as_cadena);/*******************************************************************************************************
* PROC./FUNC.: of_caracter especial
* ARG.		 : as_cadena	:	Cadena con caract$$HEX1$$e900$$ENDHEX$$res Especiales < , >  %, /,vocales+tildes
* RETURN		 : String : La cadena con el equivalente para interpretar en XML.					
* SCOPE		 : Public
* PURPOSE	 :	Funci$$HEX1$$f300$$ENDHEX$$n que cambia los car$$HEX1$$e100$$ENDHEX$$cteres especiales que se incluiran en un archivo XML
* PRECOND.	 : None
* POSTCOND.	 : Si la cadena que se envia como par$$HEX1$$e100$$ENDHEX$$metro es solo espacios en blanco retorna cadena vac$$HEX1$$ed00$$ENDHEX$$a,
					o si es nula se retorna un NULL
* DEVELOPER	 : Carlos Andr$$HEX1$$e900$$ENDHEX$$s Rico
* DATE		 :	Lunes 31 de Enero de 2005. Hora: 11:25:09
********************************************************************************************************/
//VARIABLE DECLARATION

String	ls_cadena , ls_substring, ls_newcad
Long 		ll_posiciones , ll_i
//BEGIN SCRIPT------------------------------------------------------------------------------------------------------
//If IsNull(as_cadena) Then
//	Return as_cadena
//End If
//------------------------------------------------------------------------------------------------------

If IsNull(as_cadena) Then
	Return " "
End If

ls_cadena = Trim(as_cadena)
If ls_cadena='' Then 
	Return ''
End If
ll_posiciones = Len(ls_cadena)
//------------------------------------------------------------------------------------------------------
For ll_i = 1 To ll_posiciones
		ls_substring = Mid(ls_cadena,ll_i,1)
		Choose Case ls_substring
//			Case '>' 
//						ls_newcad += '&gt;'
//			Case '<' 	
//						ls_newcad += '&lt;'
			Case '&' 
						ls_newcad += '&#38;'				
//			Case '$$HEX1$$e100$$ENDHEX$$'//,'$$HEX1$$c100$$ENDHEX$$'
//						ls_newcad += '$$HEX2$$c300a100$$ENDHEX$$'
//			Case '$$HEX1$$e900$$ENDHEX$$'//,'$$HEX1$$c900$$ENDHEX$$'
//						ls_newcad += '$$HEX2$$c300a900$$ENDHEX$$'
//			Case '$$HEX1$$ed00$$ENDHEX$$'//,'$$HEX1$$cd00$$ENDHEX$$'
//						ls_newcad += '$$HEX2$$c300ad00$$ENDHEX$$'
//			Case '$$HEX1$$f300$$ENDHEX$$'//,'$$HEX1$$d300$$ENDHEX$$'
//						ls_newcad += '$$HEX2$$c300b300$$ENDHEX$$'
//			Case '$$HEX1$$fa00$$ENDHEX$$'//,'$$HEX1$$da00$$ENDHEX$$'
//						ls_newcad += '$$HEX2$$c300ba00$$ENDHEX$$'
//			Case '$$HEX1$$c100$$ENDHEX$$'
//						ls_newcad += '$$HEX2$$c3008100$$ENDHEX$$'
//			Case '$$HEX1$$c900$$ENDHEX$$'
//						ls_newcad += '$$HEX2$$c3003020$$ENDHEX$$'
//			Case '$$HEX1$$cd00$$ENDHEX$$'
//						ls_newcad += '$$HEX2$$c3008d00$$ENDHEX$$'
//			Case '$$HEX1$$d300$$ENDHEX$$'
//						ls_newcad += '$$HEX2$$c3001c20$$ENDHEX$$'
//			Case '$$HEX1$$da00$$ENDHEX$$'
//						ls_newcad += '$$HEX2$$c3006101$$ENDHEX$$'
//			//$$HEX10$$c3008100c3003020c3008d00c3001c20c3006101$$ENDHEX$$
//			Case "'"
//						ls_newcad += '&apos'
//			Case '"'
//						ls_newcad += '&quot'
//			Case '%' 	
//						ls_newcad += ';'
//			Case '$$HEX1$$d100$$ENDHEX$$'
//						ls_newcad += '$$HEX2$$c3001820$$ENDHEX$$'
//			Case '$$HEX1$$f100$$ENDHEX$$'
//						ls_newcad += '$$HEX2$$c300b100$$ENDHEX$$'
			Case Else
						ls_newcad += ls_substring
		End Choose
Next
//$$HEX10$$c300a100c300a900c300ad00c300b300c300ba00$$ENDHEX$$,$$HEX5$$e100e900ed00f300fa00$$ENDHEX$$
//------------------------------------------------------------------------------------------------------
Return ls_newcad
//END SCRIPT------------------------------------------------------------------------------------------------------
end function

on n_cst_gantt.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_gantt.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

