package br.com.pegapa.repository;

import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import br.com.pegapa.entity.Bairro;
import br.com.pegapa.entity.Cidade;
import br.com.pegapa.entity.Comentario;
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

	
	public List<Cidade> listaCidades(Estado uf){
		String select = "select c from cidade c where c.estadoFk = :cod_estado";
		List<Cidade> cidades =  this.manager.createQuery(select, Cidade.class)
				.setParameter("cod_estado", uf)
				.getResultList();
		return cidades;
	}
	
	public List<Bairro> listaBairros(Cidade city){
		String select = "select b from bairro b where b.cidadeFk = :cod_bairro";
		List<Bairro> bairros =  this.manager.createQuery(select, Bairro.class)
				.setParameter("cod_bairro", city)
				.getResultList();
		return bairros;
	}
	
	public Estado buscaPorPK(Short id){
		return this.manager.find(Estado.class, id);
	}
	public Cidade buscaCidadePorPK(Integer id){
		return this.manager.find(Cidade.class, id);
	}
	
	public Bairro buscaBairroPorPk(Integer id){
		return this.manager.find(Bairro.class, id);
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


	public List<Profissional> localizarProfissionais(String estado, String cidade, String bairro) {
		Session session = (Session) this.manager.getDelegate();
		Criteria consulta = session.createCriteria(Profissional.class);
		if(! "".equals(estado)){
			consulta.add(Restrictions.eq("estado", estado));
		}
		if(! "".equals(cidade)){
			consulta.add(Restrictions.eq("cidade", cidade));
		}
		if(!"".equals(bairro)){
			consulta.add(Restrictions.eq("bairro", bairro));
		}
		
		
		return (List<Profissional>)consulta.list();
		
	}

	public List<Comentario> trazComentariosPorProfissional(Profissional prof){
		return this.manager.createQuery("select c from comentario c where c.profissionalFk.id = :id", Comentario.class)
				.setParameter("id", prof.getId())
				.getResultList();
	}

	public List<Object> localizarFornecedores(String estado, String cidade) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
