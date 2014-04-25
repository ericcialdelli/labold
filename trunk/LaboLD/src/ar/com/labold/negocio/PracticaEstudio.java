package ar.com.labold.negocio;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
public class PracticaEstudio {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "grupoPractica_fk")
	private GrupoPractica grupoPractica;

	@OneToMany(mappedBy = "practicaEstudio")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN })
	private List<ValorPractica> valoresPracticas = new ArrayList<ValorPractica>();	
	
	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "estudio_fk")
	private Estudio estudio;	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public GrupoPractica getGrupoPractica() {
		return grupoPractica;
	}

	public void setGrupoPractica(GrupoPractica grupoPractica) {
		this.grupoPractica = grupoPractica;
	}

	public List<ValorPractica> getValoresPracticas() {
		return valoresPracticas;
	}

	public void setValoresPracticas(List<ValorPractica> valoresPracticas) {
		this.valoresPracticas = valoresPracticas;
	}

	public Estudio getEstudio() {
		return estudio;
	}

	public void setEstudio(Estudio estudio) {
		this.estudio = estudio;
	}
	
	
}
