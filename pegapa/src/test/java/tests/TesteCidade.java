package tests;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import br.com.pegapa.entity.Profissional;
import br.com.pegapa.repository.OutrosRepositorios;

public class TesteCidade {
	
	@Inject
	OutrosRepositorios outros;
	
	
	public List<Profissional> listaSP(){
		return outros.localizarProfissionais("Sao Paulo", "Sao Paulo", "");
	}
	
	public static void main(String[] args) throws IOException {
//		Path path = Paths.get("C:\\img\\789.555.555-55.jpg");
//		byte[] data = Files.readAllBytes(path);
//		System.out.println(data.length);
		
		Calendar dt = Calendar.getInstance();
		dt.setTime(new Date());
		System.out.println(dt.getTime());
		
	}
	
}
