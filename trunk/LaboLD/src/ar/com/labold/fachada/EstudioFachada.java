package ar.com.labold.fachada;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import ar.com.labold.dao.EstudioDAO;
import ar.com.labold.dao.PacienteDAO;
import ar.com.labold.dto.EstudioDTO;
import ar.com.labold.dto.PacienteDTO;
import ar.com.labold.negocio.Estudio;
import ar.com.labold.negocio.ObraSocial;
import ar.com.labold.negocio.Paciente;
import ar.com.labold.providers.ProviderDominio;

@Transactional(rollbackFor = { Throwable.class })
public class EstudioFachada {

	private EstudioDAO estudioDAO;
	private PacienteDAO pacienteDAO;
	
	public EstudioFachada(){}
	
	public EstudioFachada(EstudioDAO pEstudioDAO, PacienteDAO pPacienteDAO){
		
		this.estudioDAO = pEstudioDAO;
		this.pacienteDAO = pPacienteDAO;
	}
	
	public void altaEstudio(EstudioDTO estudioDTO){
		
		Paciente paciente = pacienteDAO.getPaciente(estudioDTO.getPaciente().getId());
		Estudio estudio = ProviderDominio.getEstudio(estudioDTO, paciente);
		
		estudioDAO.altaEstudio(estudio);
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
}
