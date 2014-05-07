package ar.com.labold.struts.actions.forms;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;
import org.apache.struts.action.ActionForm;

import ar.com.labold.dto.EstudioDTO;
import ar.com.labold.dto.PracticaDTO;
import ar.com.labold.negocio.ValorPractica;

public class EstudioForm extends ActionForm {

	private EstudioDTO estudioDTO;
	private List<PracticaDTO> listaPracticas;
	private List<ValorPractica> listaValoresPractica; 
	
	public EstudioForm(){
		
		estudioDTO = new EstudioDTO();
		listaPracticas = (List<PracticaDTO>) LazyList.decorate(new ArrayList(),
				FactoryUtils.instantiateFactory(PracticaDTO.class));
		listaValoresPractica = (List<ValorPractica>) LazyList.decorate(new ArrayList(),
				FactoryUtils.instantiateFactory(ValorPractica.class));		
	}

	public EstudioDTO getEstudioDTO() {
		return estudioDTO;
	}

	public void setEstudioDTO(EstudioDTO estudioDTO) {
		this.estudioDTO = estudioDTO;
	}

	public List<PracticaDTO> getListaPracticas() {
		return listaPracticas;
	}

	public void setListaPracticas(List<PracticaDTO> listaPracticas) {
		this.listaPracticas = listaPracticas;
	}
	
	public List<ValorPractica> getListaValoresPractica() {
		return listaValoresPractica;
	}

	public void setListaValoresPractica(List<ValorPractica> listaValoresPractica) {
		this.listaValoresPractica = listaValoresPractica;
	}

	public void normalizarListaPracticas() {

		List<PracticaDTO> listaEliminar = new ArrayList<PracticaDTO>();
		for (PracticaDTO practica : listaPracticas) {
			if (practica != null && practica.getId() == 0) {
				listaEliminar.add(practica);
			}
		}
		listaPracticas.removeAll(listaEliminar);
	}	
}
