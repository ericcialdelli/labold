package ar.com.labold.fachada;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import ar.com.labold.dao.PracticaDAO;
import ar.com.labold.dto.PracticaDTO;
import ar.com.labold.negocio.Practica;
import ar.com.labold.negocio.exception.NegocioException;
import ar.com.labold.providers.ProviderDominio;

@Transactional(rollbackFor = { Throwable.class })
public class PracticaFachada {

	private PracticaDAO practicaDAO;
	
	public PracticaFachada(){}
	
	public PracticaFachada(PracticaDAO pPracticaDAO){
		
		this.practicaDAO = pPracticaDAO;
	}
	
	public boolean existeObraSocial(PracticaDTO practica){
		
		return practicaDAO.existeObraSocial(practica.getNombre(),practica.getId());
	}	
	
	public void altaPractica(PracticaDTO practicaDTO) throws NegocioException{
		
		practicaDAO.altaPractica(ProviderDominio.getPractica(practicaDTO));
	}
	
	public void modificacionPractica(PracticaDTO practicaDTO) throws NegocioException{
		
		Practica practica = practicaDAO.getPractica(practicaDTO.getId());
		
		practicaDAO.altaPractica(ProviderDominio.getPractica(practica,practicaDTO));
	}	
	
	public List<Practica> getPracticas(){
		
		return practicaDAO.getPracticas();
	}

	public Practica getPractica(Long id){
		
		return practicaDAO.getPractica(id);
	}	
}
