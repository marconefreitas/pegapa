package br.com.pegapa.servlet;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

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


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("carregaEstado") != null){
			carregaEstado(request, response);
		} else if(request.getParameter("carregaCidade") != null){
			carregaCidade(request, response);
		} else if(request.getParameter("testacoisa") != null){
			teste(request, response);
		}
	}



	private void teste(HttpServletRequest request, HttpServletResponse response) {
		List<Cidade> l = outros.listaCidadesPorCodigoEstado((short)1);
		for(Cidade c : l){
			System.out.println(c.getNome());
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
