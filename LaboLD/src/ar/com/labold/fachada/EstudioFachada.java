package ar.com.labold.fachada;

import java.util.ArrayList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import ar.com.labold.dao.EstudioDAO;
import ar.com.labold.dao.PacienteDAO;
import ar.com.labold.dao.PracticaDAO;
import ar.com.labold.dto.EstudioDTO;
import ar.com.labold.dto.PracticaDTO;
import ar.com.labold.dto.ValorPracticaDTO;
import ar.com.labold.negocio.Estudio;
import ar.com.labold.negocio.Paciente;
import ar.com.labold.negocio.Practica;
import ar.com.labold.negocio.ValorPractica;
import ar.com.labold.negocio.ValorSubItemPractica;
import ar.com.labold.negocio.ValorUnidadFacturacion;
import ar.com.labold.negocio.ValoresEstudio;
import ar.com.labold.providers.ProviderDominio;

@Transactional(rollbackFor = { Throwable.class })
public class EstudioFachada {

	private EstudioDAO estudioDAO;
	private PacienteDAO pacienteDAO;
	private PracticaDAO practicaDAO;
	
	public EstudioFachada(){}
	
	public EstudioFachada(EstudioDAO pEstudioDAO, PacienteDAO pPacienteDAO, PracticaDAO pPracticaDAO){
		
		this.estudioDAO = pEstudioDAO;
		this.pacienteDAO = pPacienteDAO;
		this.practicaDAO = pPracticaDAO;
	}
	
	public double altaEstudio(EstudioDTO estudioDTO, List<PracticaDTO> listaPracticasDTO){
		
		List<Practica> listaPracticas = new ArrayList<Practica>(); 
		for (PracticaDTO practicaDTO : listaPracticasDTO) {
			listaPracticas
			.add(practicaDAO.getPractica(practicaDTO.getId()));
		}
		
		Paciente paciente = pacienteDAO.getPaciente(estudioDTO.getPaciente().getId());
		Estudio estudio = ProviderDominio.getEstudio(estudioDTO, paciente,listaPracticas);
		
		estudioDAO.altaEstudio(estudio);
		
		return estudio.getUnidadesFacturacionTotal();
	}
	
	public List<Estudio> getEstudios(){
		
		return estudioDAO.getEstudios();
	}

	public List<Estudio> getEstudios(Long idPaciente){
		
		return estudioDAO.getEstudios(idPaciente);
	}	
	
	public Estudio getEstudio(Long idEstudio){
		
		return estudioDAO.getEstudio(idEstudio);
	}	

	public Estudio getEstudioPorNroProtocolo(Long nroProtocolo){
		
		return estudioDAO.getEstudioPorNroProtocolo(nroProtocolo);
	}		
	
	public void modificacionEstudio(EstudioDTO estudioDTO){
		
		Estudio estudio = estudioDAO.getEstudio(estudioDTO.getId());				
		
		estudioDAO.altaEstudio(ProviderDominio.getEstudio(estudio,estudioDTO));
	}	
	
	public long getProximoNroEstudio(){
		
		return estudioDAO.getProximoNroEstudio();
	}
		
	public void completarEstudio(EstudioDTO estudio, List<ValorPractica> listaValorPractias){
		
		for (ValorPractica valorPractica : listaValorPractias) {
			ValorPractica valPractica = estudioDAO.getValorPractica(valorPractica.getId());
			valPractica.setValor(valorPractica.getValor());			
		}
	}
	
	public void eliminarPracticasParaFacturacion(EstudioDTO estudioDTO, List<ValorPracticaDTO> listaValoresPracticaDTO){
		
		Estudio estudio = estudioDAO.getEstudio(estudioDTO.getId());
		double unidadesFacturacion = estudio.getUnidadesFacturacionTotal();
		
		for (ValorPracticaDTO valorPracticaDTO : listaValoresPracticaDTO) {

			ValorPractica valorPractica = estudioDAO.getValorPractica(valorPracticaDTO.getId());
			unidadesFacturacion = unidadesFacturacion - valorPractica.getUnidadBioquimica(); 
			//valorPractica.setUnidadBioquimica(0.0);
			valorPractica.setCubreOS(false);
		}
		estudio.setUnidadesFacturacionTotal(unidadesFacturacion);//Ver bien si esto cierra//
	}

	public void restablecerPracticasParaFacturacion(EstudioDTO estudioDTO, List<ValorPracticaDTO> listaValoresPracticaDTO){
		
		Estudio estudio = estudioDAO.getEstudio(estudioDTO.getId());
		double unidadesFacturacion = estudio.getUnidadesFacturacionTotal();
		
		for (ValorPracticaDTO valorPracticaDTO : listaValoresPracticaDTO) {

			ValorPractica valorPractica = estudioDAO.getValorPractica(valorPracticaDTO.getId());
			unidadesFacturacion = unidadesFacturacion + valorPractica.getUnidadBioquimica(); 
			valorPractica.setCubreOS(true);
		}
		estudio.setUnidadesFacturacionTotal(unidadesFacturacion);//Ver bien si esto cierra//
	}
	
	public double recuperarValorUnidadFacturacion(){
		
		ValorUnidadFacturacion valor = estudioDAO.recuperarValorUnidadFacturacion();
		return valor.getValorEnPesos();
	}
	
	public void modificarValorUnidadFacturacion(double valor){
		
		ValorUnidadFacturacion valorUnidadFacturacion = estudioDAO.recuperarValorUnidadFacturacion();
		valorUnidadFacturacion.setValorEnPesos(valor);
	}
	
	public double agregarPracticasAEstudio(EstudioDTO estudioDTO, List<PracticaDTO> listaPracticasDTO){
		
		List<Practica> listaPracticas = new ArrayList<Practica>(); 
		for (PracticaDTO practicaDTO : listaPracticasDTO) {
			if(practicaDTO != null){
				listaPracticas.add(practicaDAO.getPractica(practicaDTO.getId()));
			}	
		}		
		Estudio estudio = estudioDAO.getEstudio(estudioDTO.getId());		
		ProviderDominio.getEstudio(estudio,listaPracticas);
		
		//estudioDAO.altaEstudio(estudio);
		
		return estudio.getUnidadesFacturacionTotal();
	}
	
	public void eliminarPracticasDeEstudio(EstudioDTO estudioDTO, List<ValorPracticaDTO> listaValoresPracticaDTO){
		
		Estudio estudio = estudioDAO.getEstudio(estudioDTO.getId());
		double unidadesFacturacion = estudio.getUnidadesFacturacionTotal();
		ValoresEstudio ve = null;
		
		for (ValorPracticaDTO valorPracticaDTO : listaValoresPracticaDTO) {		
			
			ValorPractica valorPractica = estudioDAO.getValorPractica(valorPracticaDTO.getId());			
			estudioDAO.eliminarValorPractica(valorPractica);					
									
			if(valorPractica.getValorSubItemPractica() != null ){				
				ValorSubItemPractica vsip = estudioDAO.getValorSubItemPractica(valorPractica.getValorSubItemPractica().getId());				
				if(vsip.getValoresPracticas().size()==0){
					estudioDAO.eliminarValorSubItemPractica(vsip);
				}	
				ve = estudioDAO.getValorEstudio(vsip.getValoresEstudio().getId());
			}
			else{				
				ve = estudioDAO.getValorEstudio(valorPractica.getValoresEstudio().getId());	
			}
			if(ve.getValoresPracticas().size()==0){
				estudioDAO.eliminarValoresEstudio(ve);
			}			
			
			//unidadesFacturacion = unidadesFacturacion - valorPractica.getUnidadBioquimica(); 

		}
		
		//estudio.setUnidadesFacturacionTotal(unidadesFacturacion);//Ver bien si esto cierra//		
	}
}
