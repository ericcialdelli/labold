package ar.com.labold.struts.actions;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.labold.utils.Fecha;
import ar.com.labold.utils.MyLogger;
import ar.com.labold.dto.PacienteDTO;
import ar.com.labold.fachada.ObraSocialFachada;
import ar.com.labold.struts.actions.forms.PacienteForm;
import ar.com.labold.struts.utils.Validator;

public class PacienteAction extends ValidadorAction {

	@SuppressWarnings("unchecked")
	public ActionForward cargarAltaPaciente(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargaAltaPaciente";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			ObraSocialFachada obraSocialFachada = (ObraSocialFachada) ctx.getBean("obraSocialFachada");
			
			request.setAttribute("obrasSociales", obraSocialFachada.getObrasSociales());
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	public boolean validarPacienteForm(StringBuffer error, ActionForm form) {
		
		try{
			PacienteForm pacienteForm = (PacienteForm)form;
			PacienteDTO paciente = pacienteForm.getPacienteDTO();
			
			boolean ok = true;
			boolean ok1 = true;
			boolean ok2 = true;
			boolean ok3 = true;
			boolean ok4 = true;
			boolean ok5 = true;
			boolean ok6 = true;
			
			ok = Validator.requerido(paciente.getNombre(),"Nombre", error);
			ok1 = Validator.requerido(paciente.getApellido(),"Apellido", error);
			ok2 = Validator.requerido(paciente.getFechaNacimiento(),"Fecha de Nacimiento", error);
			if(ok2){
				ok2 = Validator.validarFechaValida(pacienteForm.getPacienteDTO().getFechaNacimiento(),"Fecha de Nacimiento",error);
			}	
			ok3 = Validator.validarEnteroMayorQue(0, String.valueOf(paciente.getDni()), "DNI", error);
			ok4 = Validator.requerido(paciente.getDireccion(),"Dirección", error);
			ok5 = Validator.requerido(paciente.getTelefono(),"Telefono", error);
			ok6 = Validator.validarComboRequeridoSinNull("-1",Long.toString(paciente.getObraSocial().getId()),
					 																		"Obra Social",error);
			
			return ok && ok1 && ok2 && ok3 && ok4 && ok5 && ok6;
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado");
			return false;
		}
	}
}
