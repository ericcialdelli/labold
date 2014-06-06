package ar.com.labold.dto;

public class PracticaDTO {

	private Long id;
	
	private String nombre;
	
	private String unidad;
	
	private String metodo;
	
	private String valorNormalDesde;

	private String valorNormalHasta;
		
	private String valorReferencia;		
	
	private String mayorMenor;
	
	private int unidadFacturacion;
	
	private String codigoObraSocial;
	
	private GrupoPracticaDTO grupoPracticaDTO;
	
	private SubItemPracticaDTO subItemPracticaDTO;
	
	public PracticaDTO(){
		
		this.grupoPracticaDTO = new GrupoPracticaDTO();
		this.subItemPracticaDTO = new SubItemPracticaDTO();
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

	public GrupoPracticaDTO getGrupoPracticaDTO() {
		return grupoPracticaDTO;
	}

	public void setGrupoPracticaDTO(GrupoPracticaDTO grupoPracticaDTO) {
		this.grupoPracticaDTO = grupoPracticaDTO;
	}

	public SubItemPracticaDTO getSubItemPracticaDTO() {
		return subItemPracticaDTO;
	}

	public void setSubItemPracticaDTO(SubItemPracticaDTO subItemPracticaDTO) {
		this.subItemPracticaDTO = subItemPracticaDTO;
	}

	public String getUnidad() {
		return unidad;
	}

	public void setUnidad(String unidad) {
		this.unidad = unidad;
	}

	public String getValorNormalDesde() {
		return valorNormalDesde;
	}

	public void setValorNormalDesde(String valorNormalDesde) {
		this.valorNormalDesde = valorNormalDesde;
	}

	public String getValorNormalHasta() {
		return valorNormalHasta;
	}

	public void setValorNormalHasta(String valorNormalHasta) {
		this.valorNormalHasta = valorNormalHasta;
	}

	public String getValorReferencia() {
		return valorReferencia;
	}

	public void setValorReferencia(String valorReferencia) {
		this.valorReferencia = valorReferencia;
	}

	public String getMayorMenor() {
		return mayorMenor;
	}

	public void setMayorMenor(String mayorMenor) {
		this.mayorMenor = mayorMenor;
	}	
	
	public String getMetodo() {
		return metodo;
	}

	public void setMetodo(String metodo) {
		this.metodo = metodo;
	}

	public int getUnidadFacturacion() {
		return unidadFacturacion;
	}

	public void setUnidadFacturacion(int unidadFacturacion) {
		this.unidadFacturacion = unidadFacturacion;
	}

	public String getCodigoObraSocial() {
		return codigoObraSocial;
	}

	public void setCodigoObraSocial(String codigoObraSocial) {
		this.codigoObraSocial = codigoObraSocial;
	}

	public void normalizarValores(){
		
		this.setValorNormalDesde((this.valorNormalDesde.equals(""))?null:this.valorNormalDesde);
		this.setValorNormalHasta((this.valorNormalHasta.equals(""))?null:this.valorNormalHasta);
		this.setValorReferencia((this.valorReferencia.equals(""))?null:this.valorReferencia);
		this.setMayorMenor((this.valorReferencia==null)?null:this.mayorMenor);
	}	
}
