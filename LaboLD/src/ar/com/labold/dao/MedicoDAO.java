package ar.com.labold.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.labold.negocio.Medico;
import ar.com.labold.negocio.ObraSocial;
import ar.com.labold.negocio.exception.NegocioException;
import ar.com.labold.utils.Constantes;

public class MedicoDAO extends HibernateDaoSupport {

	public boolean existeMedico(String matricula, Long id){
		
		Criteria criteria = getSession().createCriteria(Medico.class);
		Conjunction conj = Restrictions.conjunction();
		conj.add(Restrictions.eq("matricula", matricula));
		if (id != null) {
			conj.add(Restrictions.ne("id", id));
		}
		criteria.add(conj);

		List<Medico> medicos = criteria.list();
		return (medicos.size() > 0);		
	}	
	
	public void altaMedico(Medico medico) throws NegocioException {
		
		if (existeMedico(medico.getNombre(), medico.getId())) {
			throw new NegocioException(Constantes.EXISTE_MEDICO);
		}
		this.getHibernateTemplate().saveOrUpdate(medico);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();	
	}
	
	public List<Medico> getMedicos(){
		
		Criteria criteria = getSession().createCriteria(Medico.class);
		criteria.addOrder(Order.asc("apellido"));

		return (List<Medico>) criteria.list();		
	}
	
	public Medico getMedico(Long idMedico){
		
		return (Medico)getHibernateTemplate().get(Medico.class,idMedico);	
	}	
}
