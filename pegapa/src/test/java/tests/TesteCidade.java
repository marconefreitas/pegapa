package tests;

import java.util.List;

import javax.inject.Inject;

import br.com.pegapa.entity.Cidade;
import br.com.pegapa.repository.OutrosRepositorios;

public class TesteCidade {
	
	
	@Inject
	OutrosRepositorios outros;
	
	public static void main(String[] args) {
		//EntityManager manager = JpaUtil.getEntityManager();
		TesteCidade t = new TesteCidade();
		//t.outros = new OutrosRepositorios();
		
	//	List<Cidade> l = t.outros.lista(1);
		
//		for(Cidade c: l){
//			System.out.println(c.getNome());
//		}
		

	}
	
}
