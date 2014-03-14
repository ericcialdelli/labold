package ar.com.labold.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.labold.negocio.Practica;
import ar.com.labold.negocio.exception.NegocioException;
import ar.com.labold.utils.Constantes;

public class PracticaDAO extends HibernateDaoSupport {

	public boolean existeObraSocial(String nombre, Long id){
		
		Criteria criteria = getSession().createCriteria(Practica.class);
		Conjunction conj = Restrictions.conjunction();
		conj.add(Restrictions.eq("nombre", nombre));
		if (id != null) {
			conj.add(Restrictions.ne("id", id));
		}
		criteria.add(conj);

		List<Practica> practicas = criteria.list();
		return (practicas.size() > 0);			
	}
	
	public void altaPractica(Practica practica) throws NegocioException{
		
		if (existeObraSocial(practica.getNombre(), practica.getId())) {
			throw new NegocioException(Constantes.EXISTE_PRACTICA);
		}
		this.getHibernateTemplate().saveOrUpdate(practica);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();	
	}
	
	public Practica getPractica(Long id){
		
		return (Practica)getHibernateTemplate().get(Practica.class,id);
	}
	
	public List<Practica> getPracticas(){
		
		Criteria criteria = getSession().createCriteria(Practica.class);
		criteria.addOrder(Order.asc("nombre"));

		return (List<Practica>) criteria.list();		
	}	
}
