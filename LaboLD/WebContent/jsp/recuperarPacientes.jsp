<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/jquery-1.3.2.min.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/Concurrent.Thread-full-20090713.js'/>"></script>

<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>

<script>

	function recuperarPaciente(id){
		//var urlSeleccionGuia = $('#paramUrlSeleccionGuia').val();
		//parent.location=contextRoot() + "/guia.do?metodo="+urlSeleccionGuia+"&id="+id;
		parent.location=contextRoot() + "/paciente.do?metodo=recuperarPaciente&id="+id;
	}

	var clase;
	function pintarFila(idTr){
		
		clase = $('#'+idTr).attr("class");
		$('#'+idTr).removeClass(clase);
		$('#'+idTr).addClass("verdeSeleccionFila");		
	}

	function despintarFila(idTr){
		
		$('#'+idTr).addClass(clase);
		$('#'+idTr).removeClass("verdeSeleccionFila");
	}
	
</script>

<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>
<table border="0" class="cuadrado" align="center" width="80%"
	cellpadding="2">
	<tr>
		<td class="azulAjustado">Modificaci�n de Pacientes</td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
	<tr>
		<td>
			<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2">
				<tr>
					<td class="azulAjustado">Nombre y Apellido</td>
					<td class="azulAjustado">DNI</td>
					<td class="azulAjustado">Fecha Nacimiento</td>
					<td class="azulAjustado"></td>
				</tr>
				<%String clase=""; %>
				<c:forEach items="${pacientes}" var="paciente" varStatus="i">
					<%clase=(clase.equals("")?"par":""); %>
					
					<tr class="<%=clase%>" onmouseover="javascript:pintarFila('idTr<c:out value='${i.index}'></c:out>');"
						onmouseout="javascript:despintarFila('idTr<c:out value='${i.index}'></c:out>');"
						id="idTr<c:out value='${i.index}'></c:out>">					
					
						<td>${paciente.apellido}, ${paciente.nombre}</td>
						<td>${paciente.dni}</td>
						<td><fmt:formatDate	value='${paciente.fechaNacimiento}' pattern='dd/MM/yyyy' /></td>
						<td>
							<a href="javascript:recuperarPaciente(${paciente.id});">
								Seleccionar
							</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</td>
	</tr>
	<tr>
		<td height="10"></td>
	</tr>	
</table>