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

	function cargarEstudios(){

		var idPaciente = $("#selectPacientes").val();		
		$('#bloqueEstudios').html("");

		if(idPaciente != "" && idPaciente != "-1"){
			$('#bloqueEstudios').load("../../estudio.do?metodo=recuperarEstudios&idPaciente="+idPaciente);
			$('#bloqueEstudios').hide();
			$('#bloqueEstudios').fadeIn(600);
				
		}else{
			$('#bloqueEstudios').hide(600);
			$('#bloqueEstudios').html("");			
		}		
	}

	function recuperarEstudio(id){
		//var urlSeleccionGuia = $('#paramUrlSeleccionGuia').val();
		//parent.location=contextRoot() + "/guia.do?metodo="+urlSeleccionGuia+"&id="+id;
		
		var forward = $("#forward").val();
		parent.location=contextRoot() + "/estudio.do?metodo="+forward+"&id="+id;
	}
	
</script>

<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>
<input type="hidden" value="${forward}" id="forward">
<table border="0" class="cuadrado" align="center" width="60%"
	cellpadding="2">
	<tr>
		<td class="azulAjustado">${titulo}</td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
	
	<tr>
		<td>	
			<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2">
				<tr>
					<td height="20"></td>
				</tr>
				<tr>
					<td width="30%" class="botoneralNegritaRight">
						Paciente
					</td>
					<td width="10%">
						
					</td>						
					<td align="left">
						<select id="selectPacientes" class="botonerab" onchange="cargarEstudios()">
							<option value="-1">Seleccione un Paciente...</option>
							<c:forEach items="${listaPacientes}" var="paciente" varStatus="i">
								<option value="${paciente.id}">
									${paciente.apellido}, ${paciente.nombre}
								</option>									
							</c:forEach>
						</select>
					</td>	
								
				</tr>				
				<tr>
					<td height="20"></td>
				</tr>				
			</table>		
		</td>
	</tr>	
	
	<tr>
		<td height="10"></td>
	</tr>	
	
	<tr>
		<td>
			<div id="bloqueEstudios"></div>
		</td>
	</tr>
	<tr>
		<td height="10"></td>
	</tr>	
</table>