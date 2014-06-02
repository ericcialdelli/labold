package ar.com.labold.dto;

public class EstudioDTO {

	private Long id;
	
	private Long numero;

	private String solicitadoPor;
	
	private String fecha;
	
	private Double unidadesFacturacionTotal;
	
	private PacienteDTO paciente;
	
	public EstudioDTO(){
		paciente = new PacienteDTO();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getNumero() {
		return numero;
	}

	public void setNumero(Long numero) {
		this.numero = numero;
	}

	public String getSolicitadoPor() {
		return solicitadoPor;
	}

	public void setSolicitadoPor(String solicitadoPor) {
		this.solicitadoPor = solicitadoPor;
	}

	public PacienteDTO getPaciente() {
		return paciente;
	}

	public void setPaciente(PacienteDTO paciente) {
		this.paciente = paciente;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public Double getUnidadesFacturacionTotal() {
		return unidadesFacturacionTotal;
	}

	public void setUnidadesFacturacionTotal(Double unidadesFacturacionTotal) {
		this.unidadesFacturacionTotal = unidadesFacturacionTotal;
	}

}
