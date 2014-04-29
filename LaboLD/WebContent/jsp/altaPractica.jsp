<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
	
<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/PracticaFachada.js'/>"></script>	
	
<script type="text/javascript">

	function submitir(){
		$('#exitoGrabado').html("");
		validarForm("practicaFormId","../practica","validarPracticaForm","PracticaForm");
	}

	function cambioGrupo(){

		var idGrupo = $('#selectGrupoPractica').val();
		if (idGrupo != "-1") {
			$('#selectSubItemPractica').attr('disabled', false);
			
			PracticaFachada.getSubItemsPorGrupoPractica(idGrupo,
					cambioGrupoCallback);
		} else {
			dwr.util.removeAllOptions("selectSubItemPractica");
			var data = [ {
							nombre : "Seleccione un SubItem",
							id : -1
						 },
						 {
							nombre : "Sin SubItem",
							id : 0
						 }						  
			 		   ];
			dwr.util.addOptions("selectSubItemPractica", data, "id", "nombre");
			$('#selectSubItemPractica').attr('disabled', true);
		}
	}

	function cambioGrupoCallback(subItems){

		dwr.util.removeAllOptions("selectSubItemPractica");
		var data = [ {
			nombre : "Seleccione un SubItem",
			id : -1
		 },
		 {
			nombre : "Sin SubItem",
			id : 0
		 }						  
		   ];
		dwr.util.addOptions("selectSubItemPractica", data, "id", "nombre");
		dwr.util.addOptions("selectSubItemPractica", subItems, "id", "nombre");		
	}
</script>


<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>
<%-- errores de validaciones AJAX --%>
<div id="errores" class="rojoAdvertencia">${error}</div>

<html:form action="practica" styleId="practicaFormId" onsubmit="javascript:submitir();">

	<html:hidden property="metodo" value="altaPractica" />
	
	<table border="0" class="cuadrado" align="center" width="60%"
		cellpadding="2">
		<tr>
			<td colspan="2" class="azulAjustado">
				Alta de Práctica
			</td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr>
			<td width="40%" class="botoneralNegritaRight">Grupo Practica</td>
			<td align="left">
				<select id="selectGrupoPractica" class="botonerab" name="practicaDTO.grupoPracticaDTO.id" onchange="cambioGrupo();">
					<option value="-1">
						Seleccione un Grupo...
					</option>		
					<c:forEach items="${listaGrupos}" var="grupo">
						<option value="${grupo.id}">
							<c:out value="${grupo.nombre}"></c:out>
						</option>
					</c:forEach>										
				</select>
			</td>
		</tr>	
		<tr>
			<td width="40%" class="botoneralNegritaRight">SubItem Practica</td>
			<td align="left">
				<select id="selectSubItemPractica" class="botonerab" name="practicaDTO.subItemPracticaDTO.id" disabled="disabled">
					<option value="-1">
						Seleccione un SubItem...
					</option>
					<option value="0">
						Sin SubItem
					</option>																	
				</select>
			</td>
		</tr>			
		<tr>
			<td width="40%" class="botoneralNegritaRight">Nombre</td>
			<td align="left">
				<html:text styleClass="botonerab" property="practicaDTO.nombre" value="" 
						styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
			</td>
		</tr>
		<tr>
			<td width="40%" class="botoneralNegritaRight">Unidad</td>
			<td align="left">
				<html:text styleClass="botonerab" property="practicaDTO.unidad" value="" 
						styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
			</td>
		</tr>
		<tr>
			<td width="40%" class="botoneralNegritaRight">Valor Normal Desde</td>
			<td align="left">
				<html:text styleClass="botonerab" property="practicaDTO.valorNormalDesde" value="" 
						styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
			</td>
		</tr>
		<tr>
			<td width="40%" class="botoneralNegritaRight">Valor Normal Hasta</td>
			<td align="left">
				<html:text styleClass="botonerab" property="practicaDTO.valorNormalHasta" value="" 
						styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
			</td>
		</tr>		
		<tr>
			<td width="40%" class="botoneralNegritaRight">Valor de Referencia</td>
			<td align="left">
				<html:text styleClass="botonerab" property="practicaDTO.valorReferencia" value="" 
						styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
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
