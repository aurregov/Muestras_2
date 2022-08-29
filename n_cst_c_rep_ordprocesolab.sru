HA$PBExportHeader$n_cst_c_rep_ordprocesolab.sru
$PBExportComments$/***********************************************************~r~nSA54492 - Ceiba/jjmonsal - 17-03-2016~r~nComentario: Reporte de solicitudes de dllo calcetines~r~n***********************************************************/
forward
global type n_cst_c_rep_ordprocesolab from uo_dsbase
end type
end forward

global type n_cst_c_rep_ordprocesolab from uo_dsbase
end type
global n_cst_c_rep_ordprocesolab n_cst_c_rep_ordprocesolab

type variables
String is_NombreDataObject

CONSTANT STRING CALCETIN = '10', SEAMLESS = '20', COMA = ','
end variables

forward prototypes
public subroutine of_setnombredataobject (readonly string as_nombredataobject)
public subroutine of_validarcamposvaciosnulos (readonly datastore ads_arg, ref string as_where, ref string as_filtro)
end prototypes

public subroutine of_setnombredataobject (readonly string as_nombredataobject);/********************************************************************
SA54492 - Ceiba/jjmonsal - 17-03-2016 FunctionName of_setNombreDataObject 
<DESC> Description</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
TRY 
	THIS.DataObject 				= as_nombredataobject
	THIS.is_NombreDataObject	= as_nombredataobject
	
	THIS.SetTransObject(n_cst_application.itr_appl)
CATCH( Throwable ex )
	ex.setmessage("Error inicializando el controlador del reporte ordenes procesadas para el Laboratorio.")
	Throw ex
END TRY
end subroutine

public subroutine of_validarcamposvaciosnulos (readonly datastore ads_arg, ref string as_where, ref string as_filtro);/********************************************************************
SA54492 - Ceiba/jjmonsal - 17-03-2016 FunctionName of_validarCamposVaciosNulos 
<DESC> Description</DESC> 
<RETURN> Integer: <LI> 1, X ok <LI> -1, X failed</RETURN> 
<ACCESS> Public/Protected/Private 
<ARGS> as_Arg1: Description as_Arg2: Description</ARGS> 
<USAGE> How to use this function.</USAGE>
********************************************************************/
String		ls_cad_campo
Boolean		lb_seamless, lb_calcetin
TRY 
	//Field:tipo_muestra
	ls_cad_campo=ads_arg.GetItemString(1,"tipo_muestra")
	If Not IsNull(ls_cad_campo) Then
		As_where+=" AND (m_muestras.tipo_muestra=~~'"+ls_cad_campo+"~~')"
		As_filtro+="Tipo muestra= "+ls_cad_campo+", "
	End If
	
	//Field:co_cliente
	ls_cad_campo=String(ads_arg.GetItemNumber(1,"co_cliente"))
	If Not IsNull(ls_cad_campo) Then
		As_where+=" AND (m_muestras.co_cliente="+ls_cad_campo+")"
		As_filtro+="Cliente = "+ads_arg.GetItemString(1,"de_cliente")+", "
	End If

	//Field:co_sucursal
	ls_cad_campo=String(ads_arg.GetItemNumber(1,"co_sucursal"))
	If Not IsNull(ls_cad_campo) Then
		As_where+=" AND (m_muestras.co_sucursal="+ls_cad_campo+")"
		As_filtro+="Sucursal = "+ls_cad_campo+", "
	End If	
	
	//Field:desarrollador
	ls_cad_campo=ads_arg.GetItemString(1,"desarrollador")
	If Not IsNull(ls_cad_campo) Then
		As_where+=" AND (dt_mu_ord.co_ctecnico = ~~'"+ls_cad_campo+"~~')"
		As_filtro+="Desarrollador = "+ads_arg.GetItemString(1,"de_desarrollador")+", "
	End If	
	
	//Field:co_ejecutiva
	ls_cad_campo=String(ads_arg.GetItemNumber(1,"co_ejecutiva"))
	If Not IsNull(ls_cad_campo) Then
		As_where+=" AND (dt_mu_ord.co_ejecutiva="+ls_cad_campo+")"
		As_filtro+="Ejecutiva = "+ads_arg.GetItemString(1,"de_ejecutiva")+", "
	End If
	
	//Field:co_fabrica
	ls_cad_campo=String(ads_arg.GetItemNumber(1,"co_fabrica"))
	If Not IsNull(ls_cad_campo) Then
		As_where+=" AND (m_muestras.co_fabrica="+ls_cad_campo+")"
		As_filtro+="fabrica = "+ls_cad_campo+", "
	End If
	
	//Field:co_linea
	ls_cad_campo=String(ads_arg.GetItemNumber(1,"co_linea"))
	If Not IsNull(ls_cad_campo) Then
		As_where+=" AND (m_muestras.co_linea="+ls_cad_campo+")"
		As_filtro+="l$$HEX1$$ed00$$ENDHEX$$nea = "+ls_cad_campo+", "
	End If
	
	//Field:co_muestra
	ls_cad_campo=String(ads_arg.GetItemNumber(1,"co_muestra"))
	If Not IsNull(ls_cad_campo) Then
		As_where+=" AND (m_muestras.co_muestra="+ls_cad_campo+")"
		As_filtro+="Muestra = "+ls_cad_campo+", "
	End If
	
	//Field:nu_orden
	ls_cad_campo=String(ads_arg.GetItemNumber(1,"nu_orden"))
	If Not IsNull(ls_cad_campo) Then
		As_where+=" AND (dt_mu_ord.nu_orden="+ls_cad_campo+")"
		As_filtro+="Orden = "+ls_cad_campo+", "
	End If	
	
	//Field:co_grupo
	ls_cad_campo=String(ads_arg.GetItemNumber(1,"co_grupo"))
	If Not IsNull(ls_cad_campo) AND Len(Trim(ls_cad_campo)) <> 0 Then
		As_where+=" AND ( sp_mu_get_grupo_proce(dt_mu_ord.nu_orden) = "+ls_cad_campo+")"
		As_filtro+="Grupo = "+ls_cad_campo+", "
	End If	
	
	//Field:SeamLess(CRYSTAL ROPA) 
	ls_cad_campo=String(ads_arg.GetItemNumber(1,"seamless"))
	If (Not IsNull(ls_cad_campo)) AND ls_cad_campo <>"0" Then lb_seamless = true 
	
	//Field:Calcetines	
	ls_cad_campo=String(ads_arg.GetItemNumber(1,"calcetines"))
	If (Not IsNull(ls_cad_campo)) AND ls_cad_campo <>"0" Then lb_calcetin = true 
	
	IF lb_seamless AND lb_calcetin THEN 
		As_where+=" AND (m_muestras.co_tipoprod IN ("+CALCETIN+COMA+SEAMLESS+") )"
		As_filtro+="tipo de producto = "+CALCETIN+COMA+SEAMLESS+", "
	ELSEIF lb_seamless THEN
		As_where+=" AND (m_muestras.co_tipoprod IN ("+SEAMLESS+") )"
		As_filtro+="tipo de producto = "+SEAMLESS+", "
	ELSEIF lb_calcetin THEN 
		As_where+=" AND (m_muestras.co_tipoprod IN ("+CALCETIN+") )"
		As_filtro+="tipo de producto = "+CALCETIN+", "
	END IF 
			
CATCH( Throwable ex )
	ex.setmessage("Error inicializando el controlador del reporte ordenes procesadas para el Laboratorio.")
	Throw ex
END TRY
end subroutine

on n_cst_c_rep_ordprocesolab.create
call super::create
end on

on n_cst_c_rep_ordprocesolab.destroy
call super::destroy
end on

