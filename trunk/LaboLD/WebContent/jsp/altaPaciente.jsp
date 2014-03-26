<%@ taglib uri="http://struts.apache.org/tags-html"  prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript" src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarLetras.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarNum.js'/>"></script>

<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>	

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	type="text/css">

<script type="text/javascript">

	/*$(function() {
		$( "#datepicker" ).datepicker({ dateFormat: 'dd/mm/yy'});		
	});*/

	function submitir(){
		validarForm("pacienteFormId","../paciente","validarPacienteForm","PacienteForm");
	}

	/*function cargarRolesSegunEntidad(){
		dwr.util.removeAllOptions("idRol");
		var data = [ { nombre:"Cargando...", id:-1 }];
		dwr.util.addOptions("idRol", data, "id", "rol");

		var idEntidad = $("select[name='usuarioDTO.entidad.id'] ").val();
		idEntidad = (idEntidad == null)? $('#idSelectEntidad').val():idEntidad;
		RolFachada.cargarRolesSegunEntidad(idEntidad,'${usuario.id}', cargarRolesSegunEntidadCallback);
	}

	function cargarRolesSegunEntidadCallback(roles){
		dwr.util.removeAllOptions("idRol");
		dwr.util.addOptions("idRol", roles,"id","rol");
		if(''!='${usu.rol.id}'){
			dwr.util.setValue("idRol",'${usu.rol.id}');
		}
	}

	$(document).ready(function() {
		cargarRolesSegunEntidad()
		});*/
</script>

<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>
<div id="errores" class="rojoAdvertencia">${error}</div>

<html:form action="paciente" styleId="pacienteFormId">
	<html:hidden property="metodo" value="altaPaciente"/>

	<table border="0" class="cuadrado" align="center" width="60%" cellpadding="2" cellspacing="0">
		<tr>
			<td colspan="2"  class="azulAjustado" >Alta de Paciente</td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>				
		<tr>
			<td class="botoneralNegritaRight" width="40%" style="background-color: #f4f9fd">Nombre</td>
			<td align="left" style="background-color: #f4f9fd">
				<html:text property="pacienteDTO.nombre" value="" styleClass="botonerab" styleId="nombre"/>
			</td>
		</tr>	
		<tr>
			<td class="botoneralNegritaRight" width="40%" style="background-color: #f4f9fd">Apellido</td>
			<td  align="left" style="background-color: #f4f9fd">
				<html:text property="pacienteDTO.apellido" value="" styleClass="botonerab"/>			
			</td>
		</tr>
		<tr>
			<td class="botoneralNegritaRight" width="40%">Fecha de Nacimiento</td>
			<td  align="left">
				<input id="datepicker" class="botonerab" type="text" size="15" name="pacienteDTO.fechaNacimiento">						
				<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>							
			</td>
		</tr>
		<tr>
			<td class="botoneralNegritaRight" width="40%">
				DNI
			</td>
			<td  align="left">
				<html:text property="pacienteDTO.dni" value="" onkeypress="javascript:esNumerico(event);" styleClass="botonerab"/>			
			</td>
		</tr>				
		<tr>
			<td class="botoneralNegritaRight" width="40%">
				Dirección
			</td>
			<td  align="left">
				<html:text property="pacienteDTO.direccion" value="" styleClass="botonerab"/>			
			</td>
		</tr>
		<tr>
			<td class="botoneralNegritaRight" width="40%">
				Telefono
			</td>
			<td  align="left">
				<html:text property="pacienteDTO.telefono" value="" styleClass="botonerab"/>			
			</td>
		</tr>
		<tr>
			<td class="botoneralNegritaRight" width="40%">
				E-Mail
			</td>
			<td  align="left">
				<html:text property="pacienteDTO.email" value="" styleClass="botonerab"/>			
			</td>
		</tr>
		<tr>
			<td class="botoneralNegritaRight" width="40%">
				Obra Social
			</td>
			<td  align="left">
				<select id="obraSocial" class="botonerab" name="pacienteDTO.obraSocial.id">
					<option value="-1">
						-Seleccione una Obra Social-
					</option>		
					<c:forEach items="${obrasSociales}" var="os">
						<option value="${os.id}">
							<c:out value="${os.nombre}"></c:out>
						</option>
					</c:forEach>										
				</select>			
			</td>
		</tr>				
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr>
			<td height="20" colspan="2">				
				<input type="button" class="botonerab" value="Aceptar" id="enviar" onclick="javascript:submitir();">
			</td>
		</tr>
		<tr>
			<td height="10" colspan="2"></td>
		</tr>									
	</table>

</html:form>
<script type="text/javascript">

	$('#nombre').focus();

</script>