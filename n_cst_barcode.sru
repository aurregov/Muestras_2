HA$PBExportHeader$n_cst_barcode.sru
$PBExportComments$Clase para los codigos de barra, es necesario hacer una transformaci$$HEX1$$f300$$ENDHEX$$n del dato para que se pueda leer adecuadamente
forward
global type n_cst_barcode from nonvisualobject
end type
end forward

global type n_cst_barcode from nonvisualobject autoinstantiate
end type

forward prototypes
public function string of_code128 (string as_cadena)
public function string of_code128jk (string a_parametro)
end prototypes

public function string of_code128 (string as_cadena);//////////////////////////////////////////////////////////////////////////
// Funci$$HEX1$$f300$$ENDHEX$$n para adecuar una cadena para code128
// 
//////////////////////////////////////////////////////////////////////////


	String  ls_result
	Long    ll_check
	Integer li_i,li_subint
		
	ls_result = Char(168)
	ll_check  = 103
	ls_result = ls_result + as_cadena
	
	For li_i = 1 To Len(Trim(as_cadena))
	 li_subint = Asc(Mid(as_cadena,li_i,1)) -32
	 ll_check  = ll_check + li_subint * li_i
	Next
	
	If Mod(ll_check, 103) >= 96 Then
	 ll_check = Mod(ll_check,103) + 65
	Else
	 ll_check = Mod(ll_check,103) + 32
	End If
	
	Return ls_result + Char(ll_check) + Char(171)
end function

public function string of_code128jk (string a_parametro);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Viernes 22 de Agosto de 2003 HORA 10:44:01:381
// 
// Nuevo c$$HEX1$$f300$$ENDHEX$$digo de barras
//////////////////////////////////////////////////////////////////////////
long l,i,ll_start,ll_mode,ll_ind,j,n,ll_check, ll_vec[],ll_m
String ls_chrs
boolean sw,digit
//redim chrs(l+1)
//temp = chars
ll_start = 104
ll_mode = 0
ll_m=1

l=len(a_parametro)

for i = 1 to l + 1
  sw = true
  if i < l + 1 then
		digit = asc(mid(a_parametro,i,1)) > 47 and asc(mid(a_parametro,i,1)) < 58
		
		if (ll_mode = 0 and not digit) or (ll_mode = 1 and digit) then sw = false
  end if
  if ll_mode = 0 then
		if sw then
			 ll_ind = i
			 ll_mode = 1
		else
			ll_vec[ll_m]=asc(mid(a_parametro,i,1)) - 32
			ll_m=ll_m+1
			// ls_chrs=ls_chrs+char(asc(mid(a_parametro,i,1)) - 32)
		end if
  elseif sw then
		if i - ll_ind < 4 then
			 for j = 0 to i - ll_ind - 1
				  ll_vec[ll_m+j] = asc(mid(a_parametro,ll_ind+j,1)) - 32
				  
				  //ls_chrs =ls_chrs+char( asc(mid(a_parametro,ll_ind+j,1)) - 32)
			 next		
			 
			 ll_m = ll_m + i - ll_ind
			 
			 if i < l + 1 then
				  ll_vec[ll_m]=asc(mid(a_parametro,i,1)) - 32
				  
				  ll_m=ll_m+1
				  //ls_chrs= ls_chrs+char(asc(mid(a_parametro,i,1)) - 32)
			 end if
		else
			 if ll_ind = 1 then
				  ll_start = 105
			 else
				  ll_vec[ll_m]=99
				  ll_m=ll_m+1
				  //ls_chrs=ls_chrs+char(99)
			 end if
			 n = int((i - ll_ind)/2)
			 
			 for j = 0 to n - 1
				  //ls_chrs=ls_chrs+char(10*asc(mid(a_parametro,ll_ind+2*j,1)) + asc(mid(a_parametro,ll_ind+2*j+1,1)))
				  //chrs(m+j) = 10*temp(ind+2*j) + temp(ind+2*j+1)
				  ll_vec[ll_m+j]=long(mid(a_parametro,ll_ind+2*j,1) + mid(a_parametro,ll_ind+2*j+1,1))
				  //MESSAGEBOX("A",LL_VEC[ll_m+j])
			 next
          ll_m=ll_m+n
			 if i < l + 1 then
				  //ls_chrs=ls_chrs+char(100)
				  //chrs(m) = 100
				  //m = m + 1
				  ll_vec[ll_m]=100
				  ll_m=ll_m+1 

			 end if
			 if mod((i - ll_ind),2) = 1 then
				  ll_vec[ll_m]=asc(mid(a_parametro,i -1,1)) - 32
				  ll_m=ll_m+1
 				  //ls_chrs=ls_chrs+char(asc(mid(a_parametro,i -1,1)) - 32)
//				  chrs(m) = asc(temp(i-1)) - 32
//				  m = m + 1
			 end if
			 if i < l + 1 then
				  ll_vec[ll_m]=asc(mid(a_parametro,i,1)) - 32
				  ll_m=ll_m+1				
//				  ls_chrs=ls_chrs+char(asc(mid(a_parametro,i,1)) - 32)
//				  chrs(m) = asc(temp(i)) - 32
//				  m = m + 1
			 end if
		end if
		ll_mode = 0
  end if
next
ll_check = ll_start
for i = 1 to ll_m - 1
  ll_check = ll_check + ll_vec[i]*i
next
//ch = chr((check mod 103) + 32)
ll_vec[ll_m]=mod(ll_check,103) 

//ls_chrs=ls_chrs+char(mod(ll_check,103))

//chrs(m) = check mod 103
ls_chrs=""
String ls_tmp
for i = 1 to ll_m
	
  	if ll_vec[i] < 96 then
	   ls_tmp=char(ll_vec[i] + 32)
	   //replace(ls_chrs,i,1,char(asc(mid(ls_chrs,i,1))+32))
		//chrs(i) = chr(chrs(i) + 32)
  	else
	   ls_tmp=char(ll_vec[i] + 97)
	   //replace(ls_chrs,i,1,char(asc(mid(ls_chrs,i,1))+97))
		//chrs(i) = chr(chrs(i) + 97)
  	end if
  
	If ls_tmp="'" Then 
		ls_tmp="~~'"
	End If
  	If ls_tmp='"' Then 
		ls_tmp='~~"'
	End If
  
  ls_chrs+=ls_tmp
  //messagebox("chrs",ls_chrs)
next
ls_chrs=char(ll_start+97)+ls_chrs+char(203)

//messagebox("a",ls_chrs)

//convert = chr(start+97) & join(chrs, "") & chr(203)
//end function
Return ls_chrs
end function

on n_cst_barcode.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_barcode.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

