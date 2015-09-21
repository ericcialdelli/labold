package ar.com.labold.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.labold.negocio.Estudio;
import ar.com.labold.negocio.ValorPractica;
import ar.com.labold.negocio.ValorSubItemPractica;
import ar.com.labold.negocio.ValorUnidadFacturacion;
import ar.com.labold.negocio.ValoresEstudio;

public class EstudioDAO extends HibernateDaoSupport {

	public void altaEstudio(Estudio estudio){
		
		this.getHibernateTemplate().saveOrUpdate(estudio);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();		
	}
	
	public List<Estudio> getEstudios(){
		
		Criteria criteria = getSession().createCriteria(Estudio.class);
		criteria.addOrder(Order.asc("numero"));
		List<Estudio> estudios = criteria.list(); 
		
		return estudios;		
	}	
	
	public List<Estudio> getEstudios(Long idPaciente){
		
		Criteria criteria = getSession().createCriteria(Estudio.class);
		criteria.add(Restrictions.eq("paciente.id", idPaciente));
		criteria.addOrder(Order.asc("numero"));
		List<Estudio> estudios = criteria.list(); 
		
		return estudios;		
	}	
	
	public Estudio getEstudio(Long idEstudio){
		
		return (Estudio)getHibernateTemplate().get(Estudio.class,idEstudio);
	}
	
	public Estudio getEstudioPorNroProtocolo(Long nroProtocolo){
		
		Criteria criteria = getSession().createCriteria(Estudio.class);
		criteria.add(Restrictions.eq("numero", nroProtocolo));
		
		return (Estudio)criteria.uniqueResult();
	}
	
	public long getProximoNroEstudio(){
		
		Criteria criteria = getSession().createCriteria(Estudio.class);
		criteria.addOrder(Order.desc("numero"));
		List<Estudio> estudios = criteria.list(); 
		
		if(estudios.size() > 0){
			return estudios.get(0).getNumero()+1;
		}
		else{
			
			return 1;
		}
	}
	
	public ValorPractica getValorPractica(Long idValorPractica){
		
		return (ValorPractica)getHibernateTemplate().get(ValorPractica.class,idValorPractica);
	}

	public ValorSubItemPractica getValorSubItemPractica(Long idValorSubItemPractica){
		
		return (ValorSubItemPractica)getHibernateTemplate().get(ValorSubItemPractica.class,idValorSubItemPractica);
	}		
	
	public ValoresEstudio getValorEstudio(Long idValorEstudio){
		
		return (ValoresEstudio)getHibernateTemplate().get(ValoresEstudio.class,idValorEstudio);
	}
	
	public ValorUnidadFacturacion recuperarValorUnidadFacturacion(){
		
		return (ValorUnidadFacturacion)getHibernateTemplate().get(ValorUnidadFacturacion.class,1L);		
	}	
	
	public void eliminarValorPractica(ValorPractica valorPractica){
				
		this.getHibernateTemplate().delete(valorPractica);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();
	}
	
	public void eliminarValorSubItemPractica(ValorSubItemPractica vsip){
		
		this.getHibernateTemplate().delete(vsip);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();
	}
	
	public void eliminarValoresEstudio(ValoresEstudio ve){
		
		this.getHibernateTemplate().delete(ve);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();
	}
	
	public boolean existeEstudio(long numero, long id) {

		Criteria criteria = getSession().createCriteria(Estudio.class);
		criteria.add(Restrictions.eq("numero", numero));
		criteria.add(Restrictions.ne("id", id));
		
		List<Estudio> estudios = criteria.list();

		return (estudios.size() > 0);
	}

	public boolean existeEstudio(long numero) {

		Criteria criteria = getSession().createCriteria(Estudio.class);
		criteria.add(Restrictions.eq("numero", numero));
 
		List<Estudio> estudios = criteria.list();

		return (estudios.size() > 0);
	}	
	
	public void eliminarEstudio(Estudio estudio){
		
		this.getHibernateTemplate().delete(estudio);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();		
	}
	
	public List<Estudio> recuperarUltimosEstudios(){
		
		Criteria criteria = getSession().createCriteria(Estudio.class);
		criteria.addOrder(Order.desc("numero"));
		criteria.setMaxResults(10);
		List<Estudio> estudios = criteria.list(); 
		
		return estudios;		
	}	
}
