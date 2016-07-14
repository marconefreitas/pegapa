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

import br.com.pegapa.entity.Perfil;
import br.com.pegapa.entity.Profissional;
import br.com.pegapa.entity.Usuario;
import br.com.pegapa.repository.UsuarioRepository;


@WebServlet("/cadastrarUsuario")
public class UsuarioServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Inject
	private UsuarioRepository repo;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("cadastra") != null){
			cadastrar(request, response);
		} else if(request.getParameter("login") != null){
			login(request, response);
		}
	}
	
	
	public void cadastrar(HttpServletRequest request, HttpServletResponse response){
		Usuario usuario = new Usuario();
		JSONObject json = new JSONObject();
		
		try{
		
			usuario.setCpf(request.getParameter("cpf"));
			usuario.setEmail(request.getParameter("email"));
			usuario.setNome(request.getParameter("nome"));
			usuario.setPerfil(Perfil.SOLICITANTE);
			usuario.setSenha(request.getParameter("senhaUsuario"));
			usuario.setTelefone(request.getParameter("telefone"));
			usuario.setCelular(request.getParameter("celular"));
			
			repo.inserirUsuario(usuario);
			json.put("sucesso", "Cadastro Realizado com Sucesso");
		} catch(Exception e){
			System.out.println(e);
			json.put("erro", "Nos desculpe, não foi possível realizar seu cadastro por problemas internos. Tente novamente mais tarde.");
		} finally{
			try {
				
				response.getWriter().write(json.toString());
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
			
		
	}
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession session = request.getSession();
		Usuario user = new Usuario();
		String login = request.getParameter("username-user");
		
		String password = request.getParameter("password-user"); 
		
		user = repo.selectUsuario(login, password);
		
		session.setAttribute("user", user);
		session.setAttribute("usuarioLogado", "sim");
		request.getRequestDispatcher("usuario/paginaInicial.jsp").forward(request, response);
		//response.sendRedirect("usuario/paginaInicial.jsp");

	}
}
