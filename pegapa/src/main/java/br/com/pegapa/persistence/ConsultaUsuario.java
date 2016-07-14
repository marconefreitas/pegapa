package br.com.pegapa.persistence;

import br.com.pegapa.repository.UsuarioRepository;

public class ConsultaUsuario {
	public static void main(String[] args) {
		//Usuario user = new Usuario();
		//EntityManager em = JpaUtil.getEntityManager();
		
		//EntityTransaction trx = em.getTransaction();
		//trx.begin(); 
		
		
		new UsuarioRepository().retornaNomeUsuarios();
		//trx.commit();
		
		 
	}
}
