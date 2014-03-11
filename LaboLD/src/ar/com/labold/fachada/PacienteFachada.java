package ar.com.labold.fachada;

import org.springframework.transaction.annotation.Transactional;

import ar.com.labold.dao.PacienteDAO;

@Transactional(rollbackFor = { Throwable.class })
public class PacienteFachada {

	private PacienteDAO pacienteDAO;
	
	public PacienteFachada(){}
	
	public PacienteFachada(PacienteDAO pPacienteDAO){
		
		this.pacienteDAO = pPacienteDAO;
	}
}
