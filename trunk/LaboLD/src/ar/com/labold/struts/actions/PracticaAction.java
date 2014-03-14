package ar.com.labold.struts.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.labold.fachada.ObraSocialFachada;
import ar.com.labold.fachada.PracticaFachada;
import ar.com.labold.negocio.ObraSocial;
import ar.com.labold.negocio.Practica;
import ar.com.labold.struts.actions.forms.ObraSocialForm;
import ar.com.labold.struts.actions.forms.PracticaForm;
import ar.com.labold.struts.utils.Validator;
import ar.com.labold.utils.Constantes;
import ar.com.labold.utils.MyLogger;

public class PracticaAction extends ValidadorAction {

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
	
	@SuppressWarnings("unchecked")
	public ActionForward recuperarPracticas(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarPracticas";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			PracticaFachada practicaFachada = (PracticaFachada) 
										ctx.getBean("practicaFachada");	
						
			List<Practica> listaPracticass = practicaFachada.getPracticas();
			
			request.setAttribute("practicas", listaPracticass);
			
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
	
	public boolean validarPracticaForm(StringBuffer error, ActionForm form) {
		try {
			PracticaForm pacticaForm = (PracticaForm)form;
			WebApplicationContext ctx = getWebApplicationContext();
			PracticaFachada practicaFachada = (PracticaFachada) 
									ctx.getBean("practicaFachada");
			
			boolean b1 = Validator.requerido(pacticaForm.getPracticaDTO().getNombre(),
																		"Nombre", error);			
			boolean existe = practicaFachada.existeObraSocial(pacticaForm.getPracticaDTO());
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
}
