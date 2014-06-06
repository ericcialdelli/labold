<%@ taglib uri="http://struts.apache.org/tags-html"  prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript" src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarLetras.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarNum.js'/>"></script>

<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>	

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	type="text/css">

<script type="text/javascript">

function generarReporte(){

	var idEstudio = $("#idEstudio").val();
	
	var especificaciones = 'top=0,left=0,toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable';
	if(type == "IE"){
		window.open("./reporte.do?metodo=generarReporteEstudio&idEstudio="+idEstudio,"",especificaciones);		
	}else{
		window.open("../../reporte.do?metodo=generarReporteEstudio&idEstudio="+idEstudio,"",especificaciones);				
	}	
}

	function volver(){

		parent.location=contextRoot() + "/estudio.do?metodo=cargarRecuperarEstudios&forward=recuperarEstudioParaConsulta";
	}	

	function expandirGrupo(idGrupo){
		
		$("#trGrupo"+idGrupo).toggle();
	}
	
	function pintarFila(tag,id){
		
		$('#'+tag+id).attr("class", "verdeSubtitulo");	
	}

	function despintarFila(tag,id){

		$('#'+tag+id).attr("class", "grisSubtitulo");
			
	}
	
</script>

	<input type="hidden" value="${estudio.id}" id="idEstudio"/>
	<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2" cellspacing="0">
		<tr>
			<td colspan="4"  class="azulAjustado" >Consulta de Estudio</td>
		</tr>
		<tr>
			<td height="20" colspan="4"></td>
		</tr>				
		<tr>
			<td class="botoneralNegritaRight" width="12%" >N�mero</td>
			<td align="left" width="30%">			
				<input type="text" value="${estudio.numero}" class="botonerab" size="10" readonly="readonly"/>
			</td>
			
			<td class="botoneralNegritaRight" width="30%" >Paciente</td>
			<td align="left">			
				<input type="text" value="${estudio.paciente.apellido}, ${estudio.paciente.nombre}" class="botonerab" size="30" readonly="readonly"/>
			</td>			
		</tr>	
		
		<tr>
			<td class="botoneralNegritaRight" width="12%" >Solicitado Por</td>
			<td align="left" width="30%">			
				<input type="text" value="${estudio.solicitadoPor}" class="botonerab" size="30" readonly="readonly"/>
			</td>	
			
			<td class="botoneralNegritaRight" width="30%" >Fecha</td>
			<td align="left">			
				<input id="datepicker" type="text" readonly="readonly" class="botonerab" 
					value="<fmt:formatDate	value='${estudio.fecha}' pattern='dd/MM/yyyy' />">
				<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>				
			</td>				
		</tr>
		
		<tr>
			<td colspan="2"></td>
			<td class="botoneralNegritaRight" width="30%" >Unidades de Facturaci�n</td>
			<td align="left">			
				<input type="text" value="${estudio.unidadesFacturacionTotal}" class="botonerab" size="10" readonly="readonly"/>
			</td>		
		</tr>
					
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
	</table>
	
	<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2" cellspacing="2">
		<tr>
			<td height="20"></td>
		</tr>
		<%int i=0; %>
		
		<c:forEach items="${estudio.valoresEstudio}" var="grupo" varStatus="iGrupo">
			<tr>
				<td align="left" onclick="expandirGrupo(<c:out value='${iGrupo.index}'></c:out>)" class="grisSubtitulo"
					id="grupo<c:out value='${iGrupo.index}'></c:out>" 									
					onmouseover="javascript:pintarFila('grupo',<c:out value='${iGrupo.index}'></c:out>);"
					onmouseout="javascript:despintarFila('grupo',<c:out value='${iGrupo.index}'></c:out>);">
					
					${grupo.nombre}														
				</td>							
			</tr>
			
			<tr style="display: none" id="trGrupo<c:out value='${iGrupo.index}'></c:out>">
				<td>
					<table border="0" class="cuadrado" align="left" width="100%" cellpadding="2" >
			
						<c:forEach items="${grupo.valoresPracticas}" var="valorPractica" varStatus="iPractica">
							
								<tr id="trPractica<%=i%>"
									class="trG<c:out value='${iGrupo.index}'></c:out>">
									<td width="5%">
									</td>
									<td align="left" width="20%">
										${valorPractica.practica.nombre}
									</td>		
									<td width="20%" align="left">
										<b>${valorPractica.valor}</b>
										${valorPractica.practica.unidad}
									</td>
									<td width="55%" align="left">
										<c:choose>
											<c:when test="${valorPractica.practica.valorReferencia != null}">
												Valor de Referencia: ${valorPractica.practica.mayorMenor} ${valorPractica.practica.valorReferencia} ${valorPractica.practica.unidad}
											</c:when>
											<c:when test="${valorPractica.practica.valorNormalDesde != null}">
												Valor de Referencia: ${valorPractica.practica.valorNormalDesde} a ${valorPractica.practica.valorNormalHasta} ${valorPractica.practica.unidad}		 	
											</c:when>											
										</c:choose>																				
									</td>																				
								</tr>	
								<%i++; %>	
																		
						</c:forEach>

						<c:forEach items="${grupo.valorSubItemPractica}" var="valorSubItem" varStatus="iSubItem">
							<tr>
								<td width="5%">
								</td>
								<td colspan="3" class="negritaLeft">
									${valorSubItem.nombre}								
								</td>							
							</tr>
							<tr>
								<td width="5%">
								</td>
								<td colspan="3">
									<table border="0" class="cuadrado" align="left" width="100%" cellpadding="2" >
										<tr>
											<td height="5" colspan="4"></td>
										</tr>															
										<c:forEach items="${valorSubItem.valoresPracticas}" var="prac" varStatus="iPrac">											
											<tr id="trPractica<%=i%>"
												class="trG<c:out value='${iGrupo.index}'></c:out>">											
												<td width="5%">																					
													
												</td>														
												<td align="left" width="15%">
													${prac.practica.nombre}
												</td>
												<td width="15%" align="left">
													<b>${prac.valor}</b>
													${prac.practica.unidad}													
												</td>
												<td width="65%" align="left">
													<c:choose>
														<c:when test="${prac.practica.valorReferencia != null}">
															Valor de Referencia: ${prac.practica.mayorMenor} ${prac.practica.valorReferencia} ${prac.practica.unidad}
														</c:when>
														<c:when test="${prac.practica.valorNormalDesde != null}">
															Valor de Referencia: ${prac.practica.valorNormalDesde} a ${prac.practica.valorNormalHasta} ${prac.practica.unidad}		 	
														</c:when>											
													</c:choose>																					
												</td>																												
											</tr>
											<%i++; %>						
										</c:forEach>																		
									</table>							
								</td>							
							</tr>							
						</c:forEach>
						
					</table>	
				</td>
			</tr>			
			
		</c:forEach>			
		<tr>
			<td height="20" ></td>
		</tr>		
	</table>		
	
	<table border="0" class="cuadradoSinBorde" align="center" width="70%" cellpadding="2" cellspacing="0">
		<tr>
			<td height="10"></td>
		</tr>			
		<tr>
			<td align="center">
				<input type="button" value="Generar Reporte" class="botonerab" onclick="generarReporte();">				
				<input type="button" class="botonerab" value="Volver" id="enviar" onclick="javascript:volver();">
			</td>
		</tr>
		<tr>
			<td height="10"></td>
		</tr>									
	</table>
