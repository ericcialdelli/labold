package ar.com.labold.fachada;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import ar.com.labold.dao.PracticaDAO;
import ar.com.labold.dto.GrupoPracticaDTO;
import ar.com.labold.dto.PracticaDTO;
import ar.com.labold.dto.SubItemPracticaDTO;
import ar.com.labold.negocio.GrupoPractica;
import ar.com.labold.negocio.Practica;
import ar.com.labold.negocio.SubItemPractica;
import ar.com.labold.negocio.exception.NegocioException;
import ar.com.labold.providers.ProviderDominio;

@Transactional(rollbackFor = { Throwable.class })
public class PracticaFachada {

	private PracticaDAO practicaDAO;
	
	public PracticaFachada(){}
	
	public PracticaFachada(PracticaDAO pPracticaDAO){
		
		this.practicaDAO = pPracticaDAO;
	}
	
	public boolean existePractica(PracticaDTO practica){
		
		return practicaDAO.existePractica(practica.getNombre(),practica.getId(),practica.getGrupoPracticaDTO().getId());
	}	
	
	public boolean existeGrupoPractica(GrupoPracticaDTO grupoPractica){
		
		return practicaDAO.existeGrupoPractica(grupoPractica.getNombre(),grupoPractica.getId());
	}	
	
	public void altaPractica(PracticaDTO practicaDTO) throws NegocioException{
		
		GrupoPractica grupo = practicaDAO.getGrupoPractica(practicaDTO.getGrupoPracticaDTO().getId());
		SubItemPractica subItem = practicaDAO.getSubItemPractica(practicaDTO.getSubItemPracticaDTO().getId());
		
		practicaDAO.altaPractica(ProviderDominio.getPractica(practicaDTO,grupo,subItem));
	}
	
	public void altaGrupoPractica(GrupoPracticaDTO grupoPracticaDTO) throws NegocioException{
		
		practicaDAO.altaGrupoPractica(ProviderDominio.getGrupoPractica(grupoPracticaDTO));
	}	

	public void altaSubItemPractica(SubItemPracticaDTO subItemPracticaDTO) throws NegocioException{
		
		GrupoPractica grupoPractica = practicaDAO.getGrupoPractica(subItemPracticaDTO.getGrupoPractica().getId());
		practicaDAO.altaSubItemPractica(ProviderDominio.getSubItemPractica(subItemPracticaDTO,grupoPractica));
	}		
	
	public long modificacionPractica(PracticaDTO practicaDTO) throws NegocioException{
		
		Practica practica = practicaDAO.getPractica(practicaDTO.getId());
		
		practicaDAO.altaPractica(ProviderDominio.getPractica(practica,practicaDTO));
		
		return practica.getGrupoPractica().getId();
	}	

	public void modificacionGrupoPractica(GrupoPracticaDTO grupopracticaDTO) throws NegocioException{
		
		GrupoPractica grupoPractica = practicaDAO.getGrupoPractica(grupopracticaDTO.getId());
		
		practicaDAO.altaGrupoPractica(ProviderDominio.getGrupoPractica(grupoPractica,grupopracticaDTO));
	}		
	
	public List<Practica> getPracticas(){
		
		return practicaDAO.getPracticas();
	}
	
	public List<Practica> getPracticasPorGrupo(Long idGrupo){
		
		return practicaDAO.getPracticasPorGrupo(idGrupo);
	}
	
	public Practica getPractica(Long id){
		
		return practicaDAO.getPractica(id);
	}	
	
	public List<GrupoPractica> getGruposPractica(){
		
		return practicaDAO.getGruposPractica();
	}	

	public GrupoPractica getGrupoPractica(Long id){
		
		return practicaDAO.getGrupoPractica(id);
	}	
	
	public List<SubItemPractica> getSubItemsPorGrupoPractica(Long idGrupo){
		
		return practicaDAO.getSubItemsPorGrupoPractica(idGrupo);
	}
}
