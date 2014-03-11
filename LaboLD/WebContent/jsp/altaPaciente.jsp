<%@ taglib uri="http://struts.apache.org/tags-html"  prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript" src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/dwr/interface/RolFachada.js'/>"></script>

<script type="text/javascript">
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

	<table border="0" class="cuadrado" align="center" width="60%" cellpadding="2">
		<tr>
			<td colspan="2"  class="azulAjustado" >Alta de Paciente</td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>				
		<tr>
			<td class="botoneralNegritaRight" width="40%">Nombre</td>
			<td align="left">
				<html:text property="pacienteDTO.nombre" value="" />
			</td>
		</tr>	
		<tr>
			<td class="botoneralNegritaRight" width="40%">Apellido</td>
			<td  align="left">
				<html:text property="pacienteDTO.apellido" value="" />			
			</td>
		</tr>
		<tr>
			<td class="botoneralNegritaRight" width="40%">
				Dirección
			</td>
			<td  align="left">
				<html:text property="pacienteDTO.direccion" value="" />			
			</td>
		</tr>
		<tr>
			<td class="botoneralNegritaRight" width="40%">
				Telefono
			</td>
			<td  align="left">
				<html:text property="pacienteDTO.telefono" value="" />			
			</td>
		</tr>
		<tr>
			<td class="botoneralNegritaRight" width="40%">
				E-Mail
			</td>
			<td  align="left">
				<html:text property="pacienteDTO.email" value="" />			
			</td>
		</tr>
		<tr>
			<td class="botoneralNegritaRight" width="40%">
				DNI
			</td>
			<td  align="left">
				<html:text property="pacienteDTO.dni" value="" />			
			</td>
		</tr>
		<tr>
			<td class="botoneralNegritaRight" width="40%">
				Obra Social
			</td>
			<td  align="left">
				<select id="obraSocial" class="botonerab">
					<option value="ioma">
						-Seleccione una Obra Social-
					</option>				
					<option value="ioma">
						IOMA
					</option>
					<option value="ioma">
						OSDE
					</option>
					<option value="ioma">
						OSPE
					</option>										
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
