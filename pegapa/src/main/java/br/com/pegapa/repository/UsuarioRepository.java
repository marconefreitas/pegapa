package br.com.pegapa.repository;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import br.com.pegapa.dao.PegapaBaseDAO;
import br.com.pegapa.entity.Profissional;
import br.com.pegapa.entity.Usuario;


@Stateless
public class UsuarioRepository extends PegapaBaseDAO  {

	@PersistenceContext
	private EntityManager manager;
	
	
	//private HibernateUtil hibernate;
	
	public UsuarioRepository(EntityManager manager) {
		this.manager = manager;
	}
	public UsuarioRepository() {
		// TODO Auto-generated constructor stub
	}

	public Usuario consultaPorId(Integer id){
		return manager.find(Usuario.class, id);
	}
	
	public List<String> retornaEmailsCadastrados(){
		CriteriaBuilder criteria = manager.getCriteriaBuilder();
		CriteriaQuery<String> cq = criteria.createQuery(String.class);
		
		Root<Usuario> root = cq.from(Usuario.class);
		cq.select(root.<String>get("email"));
		
		TypedQuery<String> query = manager.createQuery(cq);
		List<String> emailsCadastrados = query.getResultList();
		return emailsCadastrados;
		
		
	}
	@SuppressWarnings("unchecked")
	public void retornaNomeUsuarios(){
		//Session session = HibernateUtil.getSessionFactory().openSession();
		String sql = "select nome from usuario";
		Query query = manager.createQuery(sql);
		
		List<String> nome = (List<String>) query.getResultList();
		for(String a: nome){
			System.out.println(a);
		}
	}
	//AQUI DEVERAO SER PERSISTIDOS TODOS OS USUARIOS, BEM COMO CONSULTADOS ETC
//	public static SessionFactory getSessionFactory{
//		return SessionFactory
//	}
	
	public void inserirUsuario(Usuario usr){
		this.manager.persist(usr);
	}
	
	public void merge(Usuario usr){
		this.manager.merge(usr);
	}
	
	public Usuario selectUsuario(String login, String password) {
		String select = "select u from usuario u where u.email = :login and u.senha = :password";
		Usuario user;
	
		try{
			user = (Usuario)this.manager.createQuery(select)
					.setParameter("login", login)
					.setParameter("password", password)
					.getSingleResult();
		} catch(NoResultException nre){
			user = null;
		}
		return user;
	}
	
}
