package br.com.pegapa.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.pegapa.entity.Cidade;
import br.com.pegapa.entity.Estado;
import br.com.pegapa.entity.Profissional;
import br.com.pegapa.repository.OutrosRepositorios;
import br.com.pegapa.repository.ProfissionalRepositorio;

import com.google.gson.Gson;

/**
 * Servlet implementation class LocalizarServlet
 */
@WebServlet("/LocalizarServlet")
public class LocalizarServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Inject
	OutrosRepositorios repo;
	
	@Inject
	ProfissionalRepositorio profRepo;
	
    public LocalizarServlet() {
        super();
        
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
    	if(req.getParameter("cod") != null){
			selecionarProfissional(req, resp);
		}
    }

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		if(req.getParameter("localizar") != null){
			localizarProfissional(req, resp);
		}
	}
	
	public void localizarProfissional(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String estado = request.getParameter("localiza-estado") == "Selecione um estado" ? "" : request.getParameter("localiza-estado");
		String cidade = request.getParameter("localiza-cidade") == "Selecione uma cidade"? "" : request.getParameter("localiza-cidade");
		String categoria =  request.getParameter("categoria-buscada");
		
		List<Profissional> profissionais = new ArrayList<Profissional>();
		Estado estadoFromBD = repo.buscaPorPK(Short.valueOf(estado));
		Cidade cidadeFromBD = repo.buscaCidadePorPK(Integer.valueOf(cidade));
		
		if(categoria.equals("t")){
			//SELECIONA PROFISSIONAIS E FORNECEDORES
			repo.localizarPessoas(estadoFromBD.getNome(), cidadeFromBD.getNome());
		} else if(categoria.equals("p")){
			//SELECT APENAS EM PROFISSIONAIS
			profissionais  = repo.localizarProfissionais(estadoFromBD.getNome(), cidadeFromBD.getNome());
		} else if(categoria.equals("f")){
			//SELECT APENAS EM FORNECEDORES
			repo.localizarFornecedores(estado, cidade);
		}

		if(!profissionais.isEmpty()){
			request.setAttribute("lista", profissionais);
			request.getRequestDispatcher("resultado-pesquisa.jsp").forward(request, response);

		}else{
			//TODO LISTA VAZIA, MANDAR MENSAGEM DE QUE NAO HA RESULTADO PARA A PESQUISA
		}
	}
	
	
	public void selecionarProfissional(HttpServletRequest request, HttpServletResponse response) throws IOException{
		Integer codigo = Integer.valueOf(request.getParameter("id"));
		Gson gson = new Gson();
		
		Profissional prof = profRepo.selectPorId(codigo);
		String retorno = gson.toJson(prof);
		//response.setContentType("application/json");
		response.getWriter().write(retorno);
	}
	
	private List<Profissional> populaProfissionais(){
		Profissional p1 = new Profissional();
		p1.setNome("Marcone");
		p1.setCidade("Sao Paulo");
		Profissional p2 = new Profissional();
		p2.setNome("Jose");
		p2.setCidade("Guarulhos");
		
		List<Profissional> lista = new ArrayList<Profissional>();
		lista.add(p1);
		lista.add(p2);
		return lista;
	}

}
