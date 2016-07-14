package br.com.pegapa.servlet;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import br.com.pegapa.entity.Profissional;
import br.com.pegapa.repository.OutrosRepositorios;
import br.com.pegapa.repository.ProfissionalRepositorio;


@WebServlet("/cadastrarProfissional")
public class ProfissionalServlet  extends HttpServlet { 
	
	private static final long serialVersionUID = -4663872199856610186L;

	@Inject
	ProfissionalRepositorio repo;
	
	@Inject
	OutrosRepositorios outros;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		if(req.getParameter("cadastra")!= null ){
			cadastrarProfissional(req, resp);
		} else if(req.getParameter("login")!= null){
			login(req, resp);
		}
    	
	}
	
	public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		HttpSession session = req.getSession();
		Profissional prof = new Profissional();
		String login = req.getParameter("username-prof");
		
		String password = req.getParameter("password-prof"); 
		
		prof = repo.selectProfissional(login, password);
		session.setAttribute("prof", prof);
		session.setAttribute("usuarioLogado", "sim");
		resp.sendRedirect("profissional/paginaInicial.jsp");

	}
	
	public void cadastrarProfissional(HttpServletRequest req, HttpServletResponse resp){
		Profissional profissional = new Profissional();
		JSONObject json = new JSONObject();
		try{
				
			profissional.setNome(req.getParameter("nome"));
			profissional.setCpf(req.getParameter("cpf"));
			profissional.setLogradouro(req.getParameter("logradouro"));
			profissional.setNumero(req.getParameter("numero"));
			profissional.setCidade(req.getParameter("cidade"));
			profissional.setEstado(req.getParameter("estado"));
			profissional.setCep(req.getParameter("cep"));
			profissional.setTelefone(req.getParameter("telefone"));
			profissional.setCelular(req.getParameter("celular"));
			profissional.setOcupacao(req.getParameter("ocupacao"));
			profissional.setExperiencia(req.getParameter("experiencia"));
			profissional.setEmail(req.getParameter("email"));
			profissional.setSenha(req.getParameter("senhaProfissional"));
			System.out.println(profissional.toString());
			repo.inserirProfissional(profissional);
			
			json.put("sucesso", "Cadastro Realizado com Sucesso");
		}
		catch(Exception e){
			System.out.println(e);
			json.put("erro", "Nos desculpe, não foi possível realizar seu cadastro por problemas internos. Tente novamente mais tarde.");
		}
		finally{
			try {
				resp.setCharacterEncoding("UTF-8");
				resp.getWriter().write(json.toString());
			} catch (IOException e) {
				System.out.println(e.getMessage());
			};
		}
		
	}
}
