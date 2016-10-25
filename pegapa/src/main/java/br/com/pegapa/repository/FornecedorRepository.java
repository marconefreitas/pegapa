package br.com.pegapa.repository;

import java.util.Collections;
import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import br.com.pegapa.entity.Fornecedor;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class FornecedorRepository {

	@PersistenceContext
	private EntityManager manager;
	
	public FornecedorRepository() {
		System.out.println("-------- INSTANCIANDO UM NOVO OBJETO FornecedorRepositoryr) --------");
	}
	
	public FornecedorRepository(EntityManager manager){
		System.out.println("-------- INSTANCIANDO UM NOVO OBJETO FornecedorRepository(Entity Manager manager) --------");
		this.manager = manager;
	}
	
	public List<Fornecedor> listarFornecedores(){
		String select = "select f from fornecedor f";
		return this.manager.createQuery(select, Fornecedor.class).getResultList();
	}
	
	public void inserirFornecedor(Fornecedor f){
		this.manager.persist(f);
	}
	
	public Fornecedor alterarFornecedor(Fornecedor f){
		return this.manager.merge(f);
	}
	
	public void deletarFornecedor(Fornecedor f){
		this.manager.remove(f);
	}
	
	public Fornecedor selectByPk(Integer cod){
		return this.manager.find(Fornecedor.class, cod);
	}

	public Fornecedor selectFornecedor(String login, String password) {
		String select = "select f from fornecedor f where f.email = :login and f.senha = :password";
		Fornecedor fornec;
	
		try{
			fornec = (Fornecedor)this.manager.createQuery(select)
					.setParameter("login", login)
					.setParameter("password", password)
					.getSingleResult();
		} catch(NoResultException nre){
			fornec = null;
		}
		return fornec;
	}
	
	public Fornecedor recuperaFornecedorCompleto(Integer id){
		return this.manager.createQuery("select f from fornecedor f "
											   + "left join fetch f.comentarios "
											   + "where f.codFornecedor =:id", Fornecedor.class)
				.setParameter("id", id)
				.getSingleResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Fornecedor> listarFornecedoresVirtuais(String ramoAtuacao){
		Session session = (Session) this.manager.getDelegate();
		Criteria consulta = session.createCriteria(Fornecedor.class);
		if(! "".equals(ramoAtuacao)){
			consulta.add(Restrictions.eq("ramoAtuacao", ramoAtuacao));
		}
		consulta.add(Restrictions.eq("tipoLoja", "Loja Virtual"));
		
		return (List<Fornecedor>)consulta.list();
	}
	
	public List<String> emailsCadastrados(String emailBuscado){
		return this.manager.createQuery("select f.email from fornecedor f where f.email =:email", String.class)
						.setParameter("email", emailBuscado)
						.getResultList();
	}

	public Double recuperarNotaFornecedor(Integer codigo) {
		return this.manager.createQuery("select avg(s.avaliacao) from solicitacao s where s.fornecedor.codFornecedor =:id", Double.class)
				.setParameter("id", codigo)
				.getSingleResult();
	}
}
