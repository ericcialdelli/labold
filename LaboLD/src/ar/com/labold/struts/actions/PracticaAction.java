package ar.com.labold.struts.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.labold.fachada.PracticaFachada;
import ar.com.labold.negocio.GrupoPractica;
import ar.com.labold.negocio.Practica;
import ar.com.labold.struts.actions.forms.GrupoPracticaForm;
import ar.com.labold.struts.actions.forms.PracticaForm;
import ar.com.labold.struts.utils.Validator;
import ar.com.labold.utils.Constantes;
import ar.com.labold.utils.MyLogger;

public class PracticaAction extends ValidadorAction {

	public ActionForward cargarAltaPractica(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String strForward = "exitoCargarAltaPractica";
		try {
						
			WebApplicationContext ctx = getWebApplicationContext();
			PracticaFachada practicaFachada = (PracticaFachada) 
												ctx.getBean("practicaFachada");			
			
			List<GrupoPractica> listaGrupos = practicaFachada.getGruposPractica(); 
			request.setAttribute("listaGrupos", listaGrupos);			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}	
	
	public ActionForward altaPractica(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String strForward = "exitoAltaPractica";
		try {
			
			PracticaForm pacticaForm = (PracticaForm)form;
			WebApplicationContext ctx = getWebApplicationContext();
			PracticaFachada practicaFachada = (PracticaFachada) 
												ctx.getBean("practicaFachada");			
			
			// valido nuevamente por seguridad.  
			if (!validarPracticaForm(new StringBuffer(), pacticaForm)) {
				throw new Exception("Error de Seguridad");
			}			
			
			practicaFachada.altaPractica(pacticaForm.getPracticaDTO());
			request.setAttribute("exitoGrabado", Constantes.EXITO_ALTA_PRACTICA);			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}	
	
	public ActionForward cargarModificacionPractica(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String strForward = "exitoCargarModificacionPractica";
		try {
						
			WebApplicationContext ctx = getWebApplicationContext();
			PracticaFachada practicaFachada = (PracticaFachada) 
												ctx.getBean("practicaFachada");			
			
			List<GrupoPractica> listaGrupos = practicaFachada.getGruposPractica(); 
			request.setAttribute("listaGrupos", listaGrupos);			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}	
	
	@SuppressWarnings("unchecked")
	public ActionForward recuperarPracticasPorGrupo(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarPracticasPorGrupo";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			PracticaFachada practicaFachada = (PracticaFachada) 
										ctx.getBean("practicaFachada");	
			
			String idGrupo = request.getParameter("idGrupo");
			
			List<Practica> listaPracticas = practicaFachada.getPracticasPorGrupo(Long.valueOf(idGrupo));
			
			request.setAttribute("practicas", listaPracticas);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	@SuppressWarnings("unchecked")
	public ActionForward recuperarPractica(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarPractica";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			PracticaFachada practicaFachada = (PracticaFachada) 
											ctx.getBean("practicaFachada");	
			
			String idPractica = request.getParameter("id");			
			Practica practica = practicaFachada.getPractica(Long.valueOf(idPractica));
			
			request.setAttribute("practica", practica);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}		
	
	public ActionForward modificacionPractica(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String strForward = "exitoModificacionPractica";
		try {
			
			PracticaForm pacticaForm = (PracticaForm)form;
			WebApplicationContext ctx = getWebApplicationContext();
			PracticaFachada practicaFachada = (PracticaFachada) 
												ctx.getBean("practicaFachada");			
			
			// valido nuevamente por seguridad.  
			if (!validarPracticaForm(new StringBuffer(), pacticaForm)) {
				throw new Exception("Error de Seguridad");
			}			
			
			practicaFachada.modificacionPractica(pacticaForm.getPracticaDTO());
			request.setAttribute("exitoGrabado", Constantes.EXITO_MODIFICACION_PRACTICA);						
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}	
	
	public ActionForward cargarModificacionGrupoPractica(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String strForward = "exitoCargarModificacionGrupoPractica";
		try {
			
			WebApplicationContext ctx = getWebApplicationContext();
			PracticaFachada practicaFachada = (PracticaFachada) 
												ctx.getBean("practicaFachada");						
			
			List<GrupoPractica> listaGrupos = practicaFachada.getGruposPractica();
			request.setAttribute("listaGrupos", listaGrupos);			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}			
	
	@SuppressWarnings("unchecked")
	public ActionForward recuperarGrupoPractica(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarGrupoPractica";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			PracticaFachada practicaFachada = (PracticaFachada) 
											ctx.getBean("practicaFachada");	
			
			String idGrupo = request.getParameter("id");			
			GrupoPractica grupoPractica = practicaFachada.getGrupoPractica(Long.valueOf(idGrupo));
			
			request.setAttribute("grupoPractica", grupoPractica);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}		
	
	public ActionForward modificacionGrupoPractica(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String strForward = "exitoModificacionGrupoPractica";
		try {
			
			GrupoPracticaForm grupoPracticaForm = (GrupoPracticaForm)form;
			WebApplicationContext ctx = getWebApplicationContext();
			PracticaFachada practicaFachada = (PracticaFachada) 
												ctx.getBean("practicaFachada");			
			
			// valido nuevamente por seguridad.  
			if (!validarGrupoPracticaForm(new StringBuffer(), grupoPracticaForm)) {
				throw new Exception("Error de Seguridad");
			}			
			
			practicaFachada.modificacionGrupoPractica(grupoPracticaForm.getGrupoPracticaDTO());
			request.setAttribute("exitoGrabado", Constantes.EXITO_MODIFICACION_GRUPO_PRACTICA);						
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}		
	
	public ActionForward altaGrupoPractica(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String strForward = "exitoAltaGrupoPractica";
		try {
			
			GrupoPracticaForm grupoPracticaForm = (GrupoPracticaForm)form;
			WebApplicationContext ctx = getWebApplicationContext();
			PracticaFachada practicaFachada = (PracticaFachada) 
												ctx.getBean("practicaFachada");			
			
			// valido nuevamente por seguridad.  
			if (!validarGrupoPracticaForm(new StringBuffer(), grupoPracticaForm)) {
				throw new Exception("Error de Seguridad");
			}			
			
			practicaFachada.altaGrupoPractica(grupoPracticaForm.getGrupoPracticaDTO());
			request.setAttribute("exitoGrabado", Constantes.EXITO_ALTA_GRUPO_PRACTICA);			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}	

	public ActionForward cargarAltaSubItemPractica(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String strForward = "exitoCargarAltaSubItemPractica";
		try {
						
			WebApplicationContext ctx = getWebApplicationContext();
			PracticaFachada practicaFachada = (PracticaFachada) 
												ctx.getBean("practicaFachada");			
			
			List<GrupoPractica> listaGrupos = practicaFachada.getGruposPractica(); 
			request.setAttribute("listaGrupos", listaGrupos);			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}	
	
	public ActionForward altaSubItemPractica(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String strForward = "exitoAltaSubItemPractica";
		try {
			
			GrupoPracticaForm grupoPracticaForm = (GrupoPracticaForm)form;
			WebApplicationContext ctx = getWebApplicationContext();
			PracticaFachada practicaFachada = (PracticaFachada) 
												ctx.getBean("practicaFachada");			
			
			// valido nuevamente por seguridad.  
			if (!validarSubItemPracticaForm(new StringBuffer(), grupoPracticaForm)) {
				throw new Exception("Error de Seguridad");
			}			
			
			practicaFachada.altaSubItemPractica(grupoPracticaForm.getSubItemPracticaDTO());
			request.setAttribute("exitoGrabado", Constantes.EXITO_ALTA_SUBITEM_PRACTICA);			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}		
	
	public boolean validarPracticaForm(StringBuffer error, ActionForm form) {
		try {
			PracticaForm pacticaForm = (PracticaForm)form;
			pacticaForm.getPracticaDTO().normalizarValores();
			WebApplicationContext ctx = getWebApplicationContext();
			PracticaFachada practicaFachada = (PracticaFachada) 
									ctx.getBean("practicaFachada");
			
			boolean b1 = Validator.requerido(pacticaForm.getPracticaDTO().getNombre(),
																		"Nombre", error);			
			boolean existe = practicaFachada.existePractica(pacticaForm.getPracticaDTO());
			if (existe) {
				Validator.addErrorXML(error, Constantes.EXISTE_PRACTICA);
			}
			
			boolean b2 = Validator.validarComboRequeridoSinNull("-1",Long.toString(
					pacticaForm.getPracticaDTO().getGrupoPracticaDTO().getId()),
					"Grupo Practica",error);
			
			boolean b3 = Validator.requerido(pacticaForm.getPracticaDTO().getSubItemPracticaDTO().getId(),
											 "SubItem", error);
			if (b3) {			
			
				b3 = Validator.validarComboRequeridoSinNull("-1",Long.toString(
					pacticaForm.getPracticaDTO().getSubItemPracticaDTO().getId()),
					"SubItem",error);
			}	
			
			boolean b4 = true;
			boolean b5 = true;
			
			if(pacticaForm.getCheckValor().equals("DH")){
				
				b4 = Validator.requerido(pacticaForm.getPracticaDTO().getValorNormalDesde(), "Valor Desde", error);
				b5 = Validator.requerido(pacticaForm.getPracticaDTO().getValorNormalHasta(), "Valor Hasta", error);
			}
			if(pacticaForm.getCheckValor().equals("Ref")){
				
				b4 = Validator.requerido(pacticaForm.getPracticaDTO().getValorReferencia(), "Valor Referencia", error);
			}
			if(pacticaForm.getCheckValor().equals("Libre")){
				
				b4 = Validator.requerido(pacticaForm.getPracticaDTO().getValorRefLibre(), "Valor Referencia Libre", error);
			}						
			
			return !existe && b1 && b2 && b3 && b4 && b5;

		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado");
			return false;
		}
	}	
	
	public boolean validarGrupoPracticaForm(StringBuffer error, ActionForm form) {
		try {
			GrupoPracticaForm grupoPracticaForm = (GrupoPracticaForm)form;
			WebApplicationContext ctx = getWebApplicationContext();
			PracticaFachada practicaFachada = (PracticaFachada) 
									ctx.getBean("practicaFachada");
			
			boolean b1 = Validator.requerido(grupoPracticaForm.getGrupoPracticaDTO().getNombre(),
																		"Nombre", error);			
			boolean existe = practicaFachada.existeGrupoPractica(grupoPracticaForm.getGrupoPracticaDTO());
			if (existe) {
				Validator.addErrorXML(error, Constantes.EXISTE_PRACTICA);
			}
			return !existe && b1;

		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado");
			return false;
		}
	}	

	public boolean validarSubItemPracticaForm(StringBuffer error, ActionForm form) {
		try {
			GrupoPracticaForm grupoPracticaForm = (GrupoPracticaForm)form;
			
			boolean b1 = Validator.requerido(grupoPracticaForm.getSubItemPracticaDTO().getNombre(),
																		"Nombre SubItem", error);			

			boolean b2 = Validator.validarComboRequeridoSinNull("-1",Long.toString(
								grupoPracticaForm.getSubItemPracticaDTO().getGrupoPractica().getId()),
								"Grupo Practica",error);

			return  b1 && b2;

		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado");
			return false;
		}
	}		
}
