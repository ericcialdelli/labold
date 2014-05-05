package ar.com.labold.struts.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;
import ar.com.labold.dto.EstudioDTO;
import ar.com.labold.fachada.EstudioFachada;
import ar.com.labold.fachada.ObraSocialFachada;
import ar.com.labold.fachada.PacienteFachada;
import ar.com.labold.fachada.PracticaFachada;
import ar.com.labold.negocio.Estudio;
import ar.com.labold.negocio.GrupoPractica;
import ar.com.labold.negocio.Paciente;
import ar.com.labold.struts.actions.forms.EstudioForm;
import ar.com.labold.struts.actions.forms.PacienteForm;
import ar.com.labold.struts.utils.Validator;
import ar.com.labold.utils.Constantes;
import ar.com.labold.utils.MyLogger;

public class EstudioAction extends ValidadorAction {

	@SuppressWarnings("unchecked")
	public ActionForward cargarAltaEstudio(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargaAltaEstudio";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			PacienteFachada pacienteFachada = (PacienteFachada) ctx.getBean("pacienteFachada");
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			PracticaFachada practicaFachada = (PracticaFachada) ctx.getBean("practicaFachada");
			
			request.setAttribute("nroEstudio", estudioFachada.getProximoNroEstudio());
			request.setAttribute("pacientes", pacienteFachada.getPacientes());
			List<GrupoPractica> gruposPracticas = practicaFachada.getGruposPractica();
			request.setAttribute("gruposPracticas", gruposPracticas);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}
	
	@SuppressWarnings("unchecked")
	public ActionForward altaEstudio(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoAltaEstudio";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			
			EstudioForm estudioForm = (EstudioForm)form;
			estudioForm.normalizarListaPracticas();
			
			// valido nuevamente por seguridad.  
			if (!validarEstudioForm(new StringBuffer(), estudioForm)) {
				throw new Exception("Error de Seguridad");
			}						
			estudioFachada.altaEstudio(estudioForm.getEstudioDTO(),estudioForm.getListaPracticas());
			
			request.setAttribute("exitoGrabado", Constantes.EXITO_ALTA_ESTUDIO);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}		

	@SuppressWarnings("unchecked")
	public ActionForward cargarRecuperarEstudios(ActionMapping mapping,
											ActionForm form, HttpServletRequest request,
											HttpServletResponse response) throws Exception {

		String strForward = "exitoCargarRecuperarEstudios";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			PacienteFachada pacienteFachada = (PacienteFachada) ctx.getBean("pacienteFachada");
			
			request.setAttribute("listaPacientes", pacienteFachada.getPacientes());			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	@SuppressWarnings("unchecked")
	public ActionForward recuperarEstudios(ActionMapping mapping,
											ActionForm form, HttpServletRequest request,
											HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarEstudios";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			
			String idPaciente = request.getParameter("idPaciente"); 
			
			List<Estudio> listaEstudios = estudioFachada.getEstudios(Long.valueOf(idPaciente));
			
			request.setAttribute("listaEstudios", listaEstudios);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	@SuppressWarnings("unchecked")
	public ActionForward recuperarEstudio(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarEstudio";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			PacienteFachada pacienteFachada = (PacienteFachada) ctx.getBean("pacienteFachada");
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			
			String idEstudio = request.getParameter("id");			
			Estudio estudio = estudioFachada.getEstudio(Long.valueOf(idEstudio));
			
			request.setAttribute("pacientes", pacienteFachada.getPacientes());			
			request.setAttribute("estudio", estudio);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	@SuppressWarnings("unchecked")
	public ActionForward modificacionEstudio(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoModificacionEstudio";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			
			EstudioForm estudioForm = (EstudioForm)form;
			
			// valido nuevamente por seguridad.  
			if (!validarEstudioForm(new StringBuffer(), estudioForm)) {
				throw new Exception("Error de Seguridad");
			}
			
			estudioFachada.modificacionEstudio(estudioForm.getEstudioDTO());
			
			request.setAttribute("exitoGrabado", Constantes.EXITO_MODIFICACION_ESTUDIO);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	public boolean validarEstudioForm(StringBuffer error, ActionForm form) {
		
		try{	
			EstudioForm estudioForm = (EstudioForm)form;
			EstudioDTO estudio = estudioForm.getEstudioDTO();
			
			boolean ok1 = true;
			boolean ok2 = true;
			boolean ok3 = true;
			boolean ok4 = true;
			
			ok1 = Validator.validarEnteroMayorQue(0, String.valueOf(estudio.getNumero()), "Numero", error);			

			ok2 = Validator.validarComboRequeridoSinNull("-1",Long.toString(estudio.getPaciente().getId()),
																			"Paciente",error);			
			
			ok3 = Validator.requerido(estudio.getSolicitadoPor(),"Solicitado Por", error);
			
			ok4 = Validator.requerido(estudio.getFecha(),"Fecha", error);

			return ok1 && ok2 && ok3 && ok4;
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado");
			return false;
		}
	}		
}
