package ar.com.labold.struts.actions;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.labold.fachada.ReportesFachada;
import ar.com.labold.utils.MyLogger;

public class ReportesAction extends ValidadorAction {

	public ActionForward generarReporteEstudiosARealizarEntreFechas(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		try {
			String path = request.getSession().getServletContext()
					.getRealPath("jasper");

			WebApplicationContext ctx = getWebApplicationContext();
			ReportesFachada reportesFachada = (ReportesFachada) ctx.getBean("reportesFachada");
			
			String fechaDesde = request.getParameter("fechaDesde");
			String fechaHasta = request.getParameter("fechaHasta");
			
			byte[] bytes = reportesFachada
					.generarReporteEstudiosARealizarEntreFechas(path,fechaDesde,fechaHasta);

			// Lo muestro en la salida del response
			response.setContentType("application/pdf");
			ServletOutputStream out = response.getOutputStream();
			out.write(bytes, 0, bytes.length);
			out.flush();

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			return mapping.findForward("errorSinMenu");
		}

		return null;
	}		
}
