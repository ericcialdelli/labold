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
				Constantes.REPORTE_ESTUDIOS_A_REALIZAR_ENTRE_FECHAS, parameters);
	}	
}
