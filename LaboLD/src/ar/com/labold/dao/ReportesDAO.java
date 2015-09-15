package ar.com.labold.dao;

import java.io.InputStream;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.labold.negocio.Reporte;

public class ReportesDAO extends HibernateDaoSupport {

	private InputStream obtenerReporte(String nombreReporte) throws SQLException {

		Criteria criteria = getSession().createCriteria(Reporte.class);
		criteria.add(Restrictions.eq("nombreReporte", nombreReporte));
		
		List<Reporte> lista = criteria.list();
		Reporte r = lista.get(0);
		
		return r.getArchivoReporte().getBinaryStream();
	}
	
	private void cargarSubReportes(String nombrePadre,
			Map<String, Object> parameters) throws SQLException {

		Criteria criteria = getSession().createCriteria(Reporte.class);
		criteria.add(Restrictions.eq("nombreReportePadre", nombrePadre));

		List<Reporte> lista = criteria.list();
		for (Reporte reporte : lista) {

			parameters.put(reporte.getNombreReporte(), reporte
					.getArchivoReporte().getBinaryStream());
		}
	}	
	
	public byte[] generarReporte(String nombreReporte,
			Map<String, Object> parameters) throws Exception {
		InputStream input = obtenerReporte(nombreReporte);
		this.cargarSubReportes(nombreReporte, parameters);
		JasperReport jasperReport = (JasperReport) JRLoader.loadObject(input);

		return JasperRunManager.runReportToPdf(jasperReport, parameters,
				getSession().connection());

	}
	
	public byte[] generarReporteColeccion(String nombreReporte,
			Map<String, Object> parameters, Collection lista) throws Exception {
		
		InputStream input = obtenerReporte(nombreReporte);
		this.cargarSubReportes(nombreReporte, parameters);
		JasperReport jasperReport = (JasperReport) JRLoader.loadObject(input);

		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(lista);
		
		return JasperRunManager.runReportToPdf(jasperReport, parameters,dataSource);

	}	
}
