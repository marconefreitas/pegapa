package br.com.pegapa.repository;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import br.com.pegapa.entity.Profissional;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class ProfissionalRepositorio {
	
	@PersistenceContext
	private EntityManager manager;

	
	
	public ProfissionalRepositorio(EntityManager manager){
		this.manager = manager;
	}
	
	
	
	public ProfissionalRepositorio() {
		// TODO Auto-generated constructor stub
	}
	
	public void inserirProfissional(Profissional prof){
		this.manager.persist(prof);
		System.out.println("Profissional Persistido");
	}



	public Profissional selectProfissional(String login, String password) {
		String select = "select p from profissional p where p.email = :login and p.senha = :password";
		Profissional prof;
	
		try{
			prof = (Profissional)this.manager.createQuery(select)
					.setParameter("login", login)
					.setParameter("password", password)
					.getSingleResult();
		} catch(NoResultException nre){
			prof = null;
		}
		return prof;
	}
	
	public Profissional selectPorId(Integer id){
		return this.manager.find(Profissional.class, id);
	}
	
	public Profissional recuperaProfissionalCompleto(Integer id){
		return this.manager.createQuery("select p from profissional p "
											   + "left join fetch p.servicos "
											   + "left join fetch p.comentarios "
											   + "where p.id =:id", Profissional.class)
				.setParameter("id", id)
				.getSingleResult();
	}
	
	public Double recuperNotaDoProfisisonal(Integer id){
		return this.manager.createQuery("select avg(s.avaliacao) from solicitacao s where s.profissional.id =:id", Double.class)
				.setParameter("id", id)
				.getSingleResult();
	}
	public Profissional merge(Profissional p){
		return this.manager.merge(p);
	}
	
}
