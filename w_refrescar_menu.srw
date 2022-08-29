HA$PBExportHeader$w_refrescar_menu.srw
$PBExportComments$Esta ventana refresca las opciones de men$$HEX2$$fa002000$$ENDHEX$$en la base de datos
forward
global type w_refrescar_menu from Window
end type
type cb_3 from commandbutton within w_refrescar_menu
end type
type cb_2 from commandbutton within w_refrescar_menu
end type
type cb_recuperar from commandbutton within w_refrescar_menu
end type
type dw_1 from datawindow within w_refrescar_menu
end type
end forward

global type w_refrescar_menu from Window
int X=0
int Y=0
int Width=3547
int Height=1668
boolean TitleBar=true
string Title="Untitled"
long BackColor=79017397
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
cb_3 cb_3
cb_2 cb_2
cb_recuperar cb_recuperar
dw_1 dw_1
end type
global w_refrescar_menu w_refrescar_menu

type variables
s_menu ist_menu
end variables

forward prototypes
public function integer of_scanmenu (menu a_menu, string a_nombre)
end prototypes

public function integer of_scanmenu (menu a_menu, string a_nombre);//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 28 de Julio de 2003 HORA 15:40:26:483
// 
// Se recorre el men$$HEX2$$fa002000$$ENDHEX$$y verifica si las opciones existen o no
//////////////////////////////////////////////////////////////////////////

String ls_Tag,ls_nombre
long i,ll_tam, ll_tag,ll_pos,j

ll_tam= UpperBound( a_menu.item )

For i=1 To ll_tam
	ls_tag=a_menu.item[i].tag
	ll_tag=long(ls_tag)
	ls_nombre=a_menu.item[i].text

	If ls_nombre="-" Then
		If i>1 Then
			ls_nombre="(Separador)"+mid(a_menu.item[i -1].text,1,8)
		End If
	End If	
	
	If a_nombre<>"" Then
		ls_nombre=a_nombre+"_"+ls_nombre
	End If
	
	ll_pos=1
   DO WHILE ll_pos>0
		ll_pos=pos(ls_nombre,"&")
		If ll_pos>0 Then
			ls_nombre=replace(ls_nombre,ll_pos,1,"")
		End If
	LOOP
	
	If ls_tag<>"" and UpperBound(a_menu.item[i].item)=0 Then
		ll_pos=dw_1.find("co_opcion="+ls_tag,1,dw_1.RowCount())
		If ll_pos=0 Then
			ll_pos=dw_1.InsertRow(0)
		End If
		dw_1.setItem(ll_pos,"co_aplicacion",ist_menu.aplicacion)
		dw_1.setItem(ll_pos,"co_ventana",ist_menu.ventana_obj.ClassName())
		dw_1.setItem(ll_pos,"co_opcion",ll_tag)
		dw_1.setItem(ll_pos,"de_opcion",ls_nombre)
		dw_1.setItem(ll_pos,"obs_opcion",a_menu.item[i].MicroHelp)		
	End If
	
   If UpperBound(a_menu.item[i].item) > 0 Then
		of_scanMenu(a_menu.item[i],ls_nombre)
	End If
	
Next

Return 1
end function

on w_refrescar_menu.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_recuperar=create cb_recuperar
this.dw_1=create dw_1
this.Control[]={this.cb_3,&
this.cb_2,&
this.cb_recuperar,&
this.dw_1}
end on

on w_refrescar_menu.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_recuperar)
destroy(this.dw_1)
end on

event open;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Lunes 28 de Julio de 2003 HORA 15:16:37:112
// 
// Se recibe un objeto indicando el men$$HEX2$$fa002000$$ENDHEX$$como par$$HEX1$$e100$$ENDHEX$$mtero
//////////////////////////////////////////////////////////////////////////


ist_menu=message.powerobjectparm

dw_1.setTransObject(n_cst_application.itr_appl)

cb_recuperar.triggerEvent("clicked")


end event

type cb_3 from commandbutton within w_refrescar_menu
int X=1061
int Y=1316
int Width=357
int Height=108
int TabOrder=40
string Text="Actualizar"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;//////////////////////////////////////////////////////////////////////////
// JUAN FERNANDO VASQUEZ DUQE 
// Martes 29 de Julio de 2003 HORA 10:52:17:890
// 
// Se almacenan los datos
//
// Se debe tener en cuenta que para este proceso el sistema debe utilizar la bd de
// seguridad, en caso contrario se debe crear un sinonimo de la tabla dt_opcxaplj
//////////////////////////////////////////////////////////////////////////


If dw_1.AcceptText()<>1 Then
	Return
End If

If dw_1.Update()<>1 Then
	Rollback using n_cst_application.itr_appl;
End If

commit using n_cst_application.itr_appl;
end event

type cb_2 from commandbutton within w_refrescar_menu
int X=581
int Y=1316
int Width=434
int Height=108
int TabOrder=30
string Text="Refrescar"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;of_scanmenu(ist_menu.ventana_obj.menuid,"")
end event

type cb_recuperar from commandbutton within w_refrescar_menu
int X=73
int Y=1316
int Width=453
int Height=108
int TabOrder=20
string Text="Recuperar"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_1.retrieve(ist_menu.aplicacion,ist_menu.ventana_obj.ClassName())
end event

type dw_1 from datawindow within w_refrescar_menu
int X=50
int Y=112
int Width=3419
int Height=1140
int TabOrder=10
string DataObject="d_dt_opc_x_apl"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean LiveScroll=true
end type

