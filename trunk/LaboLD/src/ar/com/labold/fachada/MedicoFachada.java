package ar.com.labold.fachada;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import ar.com.labold.dao.MedicoDAO;
import ar.com.labold.dto.MedicoDTO;
import ar.com.labold.dto.ObraSocialDTO;
import ar.com.labold.negocio.Medico;
import ar.com.labold.negocio.ObraSocial;
import ar.com.labold.negocio.exception.NegocioException;
import ar.com.labold.providers.ProviderDominio;

@Transactional(rollbackFor = { Throwable.class })
public class MedicoFachada {

	private MedicoDAO medicoDAO;
	
	public MedicoFachada(){}
	
	public MedicoFachada(MedicoDAO medicoDAO){
		this.setMedicoDAO(medicoDAO);
	}

	public MedicoDAO getMedicoDAO() {
		return medicoDAO;
	}

	public void setMedicoDAO(MedicoDAO medicoDAO) {
		this.medicoDAO = medicoDAO;
	}
	
	public boolean existeMedico(MedicoDTO medico){
		
		return medicoDAO.existeMedico(medico.getMatricula(),medico.getId());
	}
	
	public void altaMedico(MedicoDTO medico) throws NegocioException{
		
		medicoDAO.altaMedico(ProviderDominio.getMedico(medico));
	}
	
	public List<Medico> getMedicos(){
		
		return medicoDAO.getMedicos();
	}
	
	public Medico getMedico(Long idMedico){
		
		return medicoDAO.getMedico(idMedico);
	}
	
	public void modificacionMedico(MedicoDTO medicoDTO) throws NegocioException{
		
		Medico medico = medicoDAO.getMedico(medicoDTO.getId());
		
		medicoDAO.altaMedico(ProviderDominio.getMedico(medico,medicoDTO));
	}	
}
