package ar.com.labold.dto;

import java.util.ArrayList;
import java.util.List;


public class GrupoPracticaDTO {

	private Long id;
	
	private String nombre;
	
	private List<SubItemPracticaDTO> subItemsPractica;
	
	public GrupoPracticaDTO(){
		
		this.subItemsPractica = new ArrayList<SubItemPracticaDTO>();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public List<SubItemPracticaDTO> getSubItemsPractica() {
		return subItemsPractica;
	}

	public void setSubItemsPractica(List<SubItemPracticaDTO> subItemsPractica) {
		this.subItemsPractica = subItemsPractica;
	}
	
}
