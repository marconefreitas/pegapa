package br.com.pegapa.servlet;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import br.com.pegapa.entity.Bairro;
import br.com.pegapa.entity.Cidade;
import br.com.pegapa.entity.Estado;
import br.com.pegapa.repository.OutrosRepositorios;

/**
 * Servlet implementation class SelectServlet
 */
@WebServlet("/SelectServlet")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Inject
	OutrosRepositorios outros;
	
	public SelectServlet() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("carregaEstado") != null){
			carregaEstado(request, response);
		}
		if(request.getParameter("carregaCidade") != null){
			carregaCidade(request, response);
		}
		
	}


	private void carregaBairros(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String codCidade = request.getParameter("localiza-cidade");
		
		if(codCidade == null){
			codCidade = request.getParameter("localizaCidade");
		}
		
		Cidade c = new Cidade();
		c.setCodigo(Integer.valueOf(codCidade));
		List<Bairro> bairros = outros.listaBairros(c);
		if(! bairros.isEmpty()){
			response.setCharacterEncoding("UTF-8");
			JSONArray arrayJson = new JSONArray();
			for(Bairro b : bairros){
				JSONObject obj = new JSONObject();
				obj.put("nome", b.getNome());
				obj.put("cod", b.getCodigo());
				
				arrayJson.put(obj);
			}
			
			response.getWriter().write(arrayJson.toString());
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("carregaEstado") != null){
			carregaEstado(request, response);
		} else if(request.getParameter("carregaCidade") != null){
			carregaCidade(request, response);
		} else if(request.getParameter("carregaBairros") != null){
			carregaBairros(request, response);
		}
	}



	public void carregaEstado(HttpServletRequest request, HttpServletResponse response){
		List<Estado> estados = outros.listaEstados();
	
		JSONArray array = new JSONArray();
		
		
		for(Estado est : estados){
			JSONObject obj = new JSONObject();
			
			obj.put("nome", est.getNome());
			obj.put("cod", est.getCodigo());
			array.put(obj);
		}
		
		try {
			
			response.getWriter().write(array.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	private void carregaCidade(HttpServletRequest request, HttpServletResponse response) {
		String codEstado = request.getParameter("codigo");
		List<Cidade> cidades = outros.listaCidadesPorCodigoEstado(Short.valueOf(codEstado));
		JSONArray array = new JSONArray();
		for(Cidade city : cidades){
			JSONObject obj = new JSONObject();
			
			obj.put("nome", city.getNome());
			obj.put("cod", city.getCodigo());
			array.put(obj);
		}
		try {
			response.getWriter().write(array.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
