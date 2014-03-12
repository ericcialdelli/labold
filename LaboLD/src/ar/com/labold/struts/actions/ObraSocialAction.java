package ar.com.labold.struts.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.labold.fachada.ObraSocialFachada;
import ar.com.labold.struts.actions.forms.ObraSocialForm;
import ar.com.labold.utils.Constantes;
import ar.com.labold.utils.MyLogger;
import ar.com.labold.struts.utils.Validator;

public class ObraSocialAction extends ValidadorAction {

	public ActionForward altaObraSocial(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String strForward = "exitoAltaObraSocial";
		try {
			
			ObraSocialForm obraSocialForm = (ObraSocialForm)form;
			WebApplicationContext ctx = getWebApplicationContext();
			ObraSocialFachada obraSocialFachada = (ObraSocialFachada) 
									ctx.getBean("obraSocialFachada");			
			
			// valido nuevamente por seguridad.  
			if (!validarObraSocialForm(new StringBuffer(), obraSocialForm)) {
				throw new Exception("Error de Seguridad");
			}			
			
			obraSocialFachada.altaObraSocial(obraSocialForm.getObraSocialDTO());
			request.setAttribute("exitoGrabado", Constantes.EXITO_ALTA_OBRA_SOCIAL);			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}
	
	public boolean validarObraSocialForm(StringBuffer error, ActionForm form) {
		try {
			ObraSocialForm obraSocialForm = (ObraSocialForm)form;
			WebApplicationContext ctx = getWebApplicationContext();
			ObraSocialFachada obraSocialFachada = (ObraSocialFachada) 
									ctx.getBean("obraSocialFachada");
			
			boolean b1 = Validator.requerido(obraSocialForm.getObraSocialDTO().getNombre(),
																		"Nombre", error);			
			boolean existe = obraSocialFachada.existeObraSocial(obraSocialForm.getObraSocialDTO());
			if (existe) {
				Validator.addErrorXML(error, Constantes.EXISTE_OBRA_SOCIAL);
			}
			return !existe && b1;

		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado");
			return false;
		}

	}	
}
