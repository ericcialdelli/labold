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

	$(function() {
		$( "#datepicker" ).datepicker({ dateFormat: 'dd/mm/yy'});		
	});

	function submitir(){
		validarForm("estudioFormId","../estudio","validarEstudioForm","EstudioForm");
	}
	
</script>

<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>
<div id="errores" class="rojoAdvertencia">${error}</div>

<html:form action="estudio" styleId="estudioFormId">
	<html:hidden property="metodo" value="altaEstudio"/>

	<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2" cellspacing="0">
		<tr>
			<td colspan="4"  class="azulAjustado" >Alta de Estudio</td>
		</tr>
		<tr>
			<td height="20" colspan="4"></td>
		</tr>				
		<tr>
			<td class="botoneralNegritaRight" width="12%" >Número</td>
			<td align="left" width="30%">			
				<html:text property="estudioDTO.numero" value="${nroEstudio}" styleClass="botonerab" size="10"  
					onkeypress="javascript:esNumerico(event);" readonly="readonly"/>
			</td>
			
			<td class="botoneralNegritaRight" width="30%" >Paciente</td>
			<td align="left">			
				<select id="obraSocial" class="botonerab" name="estudioDTO.paciente.id">
					<option value="-1">
						Seleccione un paciente...
					</option>		
					<c:forEach items="${pacientes}" var="p">
						<option value="${p.id}">
							<c:out value="${p.apellido}"></c:out>, <c:out value="${p.nombre}"></c:out>
						</option>
					</c:forEach>										
				</select>
			</td>			
		</tr>	
		
		<tr>
			<td class="botoneralNegritaRight" width="12%" >Solicitado Por</td>
			<td align="left" width="30%">			
				<html:text property="estudioDTO.solicitadoPor" value="" styleClass="botonerab" size="40"/>
			</td>
			
			<td class="botoneralNegritaRight" width="30%" >Fecha</td>
			<td align="left">			
				<input id="datepicker" type="text" name="estudioDTO.fecha" readonly="readonly" class="botonerab">
				<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>				
			</td>					
		</tr>
					
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
	</table>
	
	<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2" cellspacing="0">
		<tr>
			<td height="20" colspan="4"></td>
		</tr>
		<c:forEach items="${gruposPracticas}" var="grupo">
			<tr>
				<td>
					${grupo.nombre}
				</td>
				<td colspan="3"></td>				
			</tr>
			<c:forEach items="${grupo.practicas}" var="practica">
				<tr>
					<td></td>
					<td>
						${practica.nombre}
					</td>
					<td colspan="2"></td>				
				</tr>						
			</c:forEach>
			<c:forEach items="${grupo.subItemsPractica}" var="subItem">
				<tr>
					<td></td>
					<td></td>
					<td>
						${subItem.nombre}				
					</td>
					<td></td>				
				</tr>
				<c:forEach items="${subItem.practicas}" var="prac">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td>
							${prac.nombre}
						</td>				
					</tr>						
				</c:forEach>									
			</c:forEach>							
		</c:forEach>		
		<tr>
			<td height="20" colspan="4"></td>
		</tr>		
	</table>		
	
	<table border="0" class="cuadradoSinBorde" align="center" width="70%" cellpadding="2" cellspacing="0">
		<tr>
			<td height="10"></td>
		</tr>			
		<tr>
			<td align="center">				
				<input type="button" class="botonerab" value="Aceptar" id="enviar" onclick="javascript:submitir();">
			</td>
		</tr>
		<tr>
			<td height="10"></td>
		</tr>									
	</table>

</html:form>
<script type="text/javascript">

	//$('#nombre').focus();

</script>