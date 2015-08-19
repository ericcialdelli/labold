package ar.com.labold.fachada;

import java.util.HashMap;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import ar.com.labold.dao.ReportesDAO;
import ar.com.labold.utils.Constantes;
import ar.com.labold.utils.Fecha;



@Transactional(rollbackFor = { Throwable.class })
public class ReportesFachada {

	private ReportesDAO reportesDAO;
	
	public ReportesFachada(){}
	
	public ReportesFachada(ReportesDAO pReportesDAO){
		
		this.reportesDAO = pReportesDAO;
	}
	
	public byte[] generarReporteEstudiosARealizarEntreFechas(String path,
			String fechaDesde, String fechaHasta) throws Exception {

		Map parameters = new HashMap();
		parameters.put("PATH_SUB_REPORTES", path);
		parameters.put("fechaDesde", Fecha.stringDDMMAAAAToUtilDate(fechaDesde));
		parameters.put("fechaHasta", Fecha.stringDDMMAAAAToUtilDate(fechaHasta));

		return reportesDAO.generarReporte(
				Constantes.PLANILLA_PRACTICAS_EN_ESTUDIOS_POR_GRUPOS, parameters);
	}	
	
	public byte[] generarReporteEstudio(String path, Long idEstudio) throws Exception {

		Map parameters = new HashMap();
		parameters.put("PATH_SUB_REPORTES", path);
		parameters.put("idEstudio", idEstudio);

		return reportesDAO.generarReporte(
				Constantes.REPORTE_ESTUDIO, parameters);
	}
	
	public byte[] generarReportesEstudios(String path, Long desde, Long hasta) throws Exception {

		Map parameters = new HashMap();
		parameters.put("PATH_SUB_REPORTES", path);
		parameters.put("numeroDesde", desde);
		parameters.put("numeroHasta", hasta);

		return reportesDAO.generarReporte(
				Constantes.REPORTES_ESTUDIOS, parameters);
	}	
	
	public byte[] generarReporteFacturacionEntreFechas(String path,
			String fechaDesde, String fechaHasta) throws Exception {

		Map parameters = new HashMap();
		parameters.put("PATH_SUB_REPORTES", path);
		parameters.put("fechaDesde", Fecha.stringDDMMAAAAToUtilDate(fechaDesde));
		parameters.put("fechaHasta", Fecha.stringDDMMAAAAToUtilDate(fechaHasta));

		return reportesDAO.generarReporte(
				Constantes.REPORTE_FACTURACION_ENTRE_FECHAS, parameters);
	}
	
	public byte[] generarReporteFacturacionEntreFechasPorObraSocial(String path,
			String fechaDesde, String fechaHasta) throws Exception {

		Map parameters = new HashMap();
		parameters.put("PATH_SUB_REPORTES", path);
		parameters.put("fechaDesde", Fecha.stringDDMMAAAAToUtilDate(fechaDesde));
		parameters.put("fechaHasta", Fecha.stringDDMMAAAAToUtilDate(fechaHasta));

		return reportesDAO.generarReporte(
				Constantes.REPORTE_FACTURACION_ENTRE_FECHAS_POR_OBRA_SOCIAL, parameters);
	}	
}
