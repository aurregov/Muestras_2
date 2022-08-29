HA$PBExportHeader$n_cst_config.sru
$PBExportComments$Para colocar funciones comunes
forward
global type n_cst_config from nonvisualobject
end type
end forward

global type n_cst_config from nonvisualobject autoinstantiate
end type

type variables
String is_usuario
end variables

forward prototypes
public function integer of_guardar (datawindow a_dw)
public function integer of_recuperar (datawindow a_dw)
end prototypes

public function integer of_guardar (datawindow a_dw);String ls_dato,ls_ventana,ls_dw



Window lw_1

lw_1=a_dw.GetParent()

ls_ventana=lw_1.className()

ls_dw=a_dw.className()


  DELETE FROM dt_mues_config  
   WHERE ( dt_mues_config.usuario = :is_usuario ) AND  
         ( dt_mues_config.ventana = :ls_ventana ) AND  
         ( dt_mues_config.dw = :ls_dw )   
          using n_cst_application.itr_appl ;
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

ls_dato= a_dw.Object.Datawindow.data

String ls_remp=char(251)+char(252)
String ls_old=char(13)+char(10)

n_cst_string lo_string

ls_dato=lo_string.of_globalreplace(ls_dato /*string as_source*/,&
                                   ls_old/*string as_old*/,&
											  ls_remp/*string as_new */)

int i

//for i=1 to len(ls_dato) 
//	messagebox(mid(ls_dato,i,1),asc(mid(ls_dato,i,1)))
//next

  INSERT INTO dt_mues_config  
         ( usuario,   
           ventana,   
           dw,   
           datos )  
  VALUES ( :is_usuario,   
           :ls_ventana,   
           :ls_dw,   
           :ls_dato )  
          using n_cst_application.itr_appl ;
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

commit using n_cst_application.itr_appl ;

Return 1
end function

public function integer of_recuperar (datawindow a_dw);String ls_dato,ls_ventana,ls_dw



Window lw_1

lw_1=a_dw.GetParent()

ls_ventana=lw_1.className()

ls_dw=a_dw.className()

  SELECT dt_mues_config.datos  
    INTO :ls_dato  
    FROM dt_mues_config  
   WHERE ( dt_mues_config.usuario = :is_usuario ) AND  
         ( dt_mues_config.ventana = :ls_ventana ) AND  
         ( dt_mues_config.dw = :ls_dw ) using n_cst_application.itr_appl  ;
			
If n_cst_application.itr_appl.SQLcode=-1 Then 
	PopulateError(20,"SQL Error")
	n_cst_application.of_sql_error(n_cst_application.itr_appl)
	Return -1
End If

If n_cst_application.itr_appl.SQLcode=100 Then
	Return 1
End If

ls_dato=Trim(ls_dato)
String ls_remp=char(251)+char(252)
String ls_old=char(13)+char(10)

n_cst_string lo_string

ls_dato=lo_string.of_globalreplace(ls_dato /*string as_source*/,&
                                   ls_remp/*string as_old*/,&
											  ls_old/*string as_new */)


a_dw.Reset()
a_dw.ImportString(ls_dato)


Return 1
end function

on n_cst_config.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_config.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;DateTime ldt_fecha
String ls_usuario,ls_instancia

If Not n_cst_application.of_SelectServer(n_cst_application.itr_appl,&
												 ldt_fecha,ls_usuario,ls_instancia) Then
	Return -1
End If

is_usuario=ls_usuario
end event

