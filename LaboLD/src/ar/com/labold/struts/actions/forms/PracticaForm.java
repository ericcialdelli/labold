package ar.com.labold.struts.actions.forms;

import org.apache.struts.action.ActionForm;

import ar.com.labold.dto.PracticaDTO;

public class PracticaForm extends ActionForm {

	private PracticaDTO practicaDTO;
	
	public PracticaForm(){
		
		this.practicaDTO = new PracticaDTO();
	}

	public PracticaDTO getPracticaDTO() {
		return practicaDTO;
	}

	public void setPracticaDTO(PracticaDTO practicaDTO) {
		this.practicaDTO = practicaDTO;
	}
}
