package br.com.pegapa.repository;

import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.Expression;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import br.com.pegapa.entity.Cidade;
import br.com.pegapa.entity.Estado;
import br.com.pegapa.entity.Profissional;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class OutrosRepositorios {


	@PersistenceContext
	private EntityManager manager;

	
	
	@SuppressWarnings("unchecked")
	public List<Estado> listaEstados(){
		String select = "select e from estado e";
		List<Estado> estados = (List<Estado>) this.manager.createQuery(select).getResultList();
		return estados;
	}

	
	@SuppressWarnings("unchecked")
	public List<Cidade> listaCidadesPorCodigoEstado(Short codigo){
		String select = "select c from cidade c where c.estadoFk.codigo = :cod_estado";
		List<Cidade> cidades = (List<Cidade>) this.manager.createQuery(select)
				.setParameter("cod_estado", codigo)
				.getResultList();
		
		return cidades;
	}

	
	@SuppressWarnings("unchecked")
	public List<Cidade> listaCidades(Estado uf){
		String select = "select c from cidade c where c.estadoFk = :cod_estado";
		List<Cidade> cidades = (List<Cidade>) this.manager.createQuery(select)
				.setParameter("cod_estado", uf)
				.getResultList();
		return cidades;
	}
	
	public Estado buscaPorPK(Short id){
		return this.manager.find(Estado.class, id);
	}
	public Cidade buscaCidadePorPK(Integer id){
		return this.manager.find(Cidade.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Profissional> localizarPessoas(String estado, String cidade){
		Session session = (Session) this.manager.getDelegate();
		Criteria consulta = session.createCriteria(Profissional.class);
		if(! "".equals(estado)){
			consulta.add(Restrictions.eq("estado", estado));
		}
		if(! "".equals(cidade)){
			consulta.add(Restrictions.eq("cidade", cidade));
		}
		
		
		
		return (List<Profissional>)consulta.list();
	}


	public List<Profissional> localizarProfissionais(String estado, String cidade) {
		Session session = (Session) this.manager.getDelegate();
		Criteria consulta = session.createCriteria(Profissional.class);
		if(! "".equals(estado)){
			consulta.add(Restrictions.eq("estado", estado));
		}
		if(! "".equals(cidade)){
			consulta.add(Restrictions.eq("cidade", cidade));
		}
		
		
		
		return (List<Profissional>)consulta.list();
		
	}


	public List<Object> localizarFornecedores(String estado, String cidade) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
