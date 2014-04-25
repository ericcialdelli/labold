package ar.com.labold.negocio;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
public class Practica {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(nullable = false)
	private String nombre;

	
	//-----------------------------//
	@Column(nullable = false)	
	private String unidad;
	
	@Column(nullable = false)
	private String valorNormalDesde;

	@Column(nullable = false)
	private String valorNormalHasta;
	
	@Column(nullable = false)
	private String valorReferencia;	
	
	@ManyToOne()
	@JoinColumn(name = "practica_fk")
	private Practica padre;

	@OneToMany(mappedBy = "padre")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Practica> hijos;	
	
	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "grupoPractica_fk")
	private GrupoPractica grupoPractica;	
	
	//-----------------------------//
	
	
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

	public Practica getPadre() {
		return padre;
	}

	public void setPadre(Practica padre) {
		this.padre = padre;
	}

	public List<Practica> getHijos() {
		return hijos;
	}

	public void setHijos(List<Practica> hijos) {
		this.hijos = hijos;
	}

	public GrupoPractica getGrupoPractica() {
		return grupoPractica;
	}

	public void setGrupoPractica(GrupoPractica grupoPractica) {
		this.grupoPractica = grupoPractica;
	}	
	
}
