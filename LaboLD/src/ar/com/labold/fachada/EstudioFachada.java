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
		
		for (ValorPracticaDTO valorPracticaDTO : listaValoresPracticaDTO) {

			ValorPractica valorPractica = estudioDAO.getValorPractica(valorPracticaDTO.getId());
			valorPractica.setUnidadBioquimica(0.0);	
		}
	}
}
