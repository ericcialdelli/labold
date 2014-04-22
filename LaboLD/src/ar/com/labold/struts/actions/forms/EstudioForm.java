package ar.com.labold.struts.actions.forms;

import org.apache.struts.action.ActionForm;

import ar.com.labold.dto.EstudioDTO;

public class EstudioForm extends ActionForm {

	private EstudioDTO estudioDTO;
	
	public EstudioForm(){
		
		estudioDTO = new EstudioDTO();
	}

	public EstudioDTO getEstudioDTO() {
		return estudioDTO;
	}

	public void setEstudioDTO(EstudioDTO estudioDTO) {
		this.estudioDTO = estudioDTO;
	}
	
}
