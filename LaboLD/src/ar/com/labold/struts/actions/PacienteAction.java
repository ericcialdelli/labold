package ar.com.labold.struts.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.labold.utils.MyLogger;
import ar.com.labold.struts.utils.Validator;

public class PacienteAction extends ValidadorAction {

	@SuppressWarnings("unchecked")
	public ActionForward cargarAltaPaciente(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargaAltaPaciente";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			//EntidadFachada entidadFachada = (EntidadFachada) ctx.getBean("entidadFachada");
			

			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	public boolean validarPacienteForm(StringBuffer error, ActionForm form) {
		
		try{
			
			return true;
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado");
			return false;
		}
	}
}
