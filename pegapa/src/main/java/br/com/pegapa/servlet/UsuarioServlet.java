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

import br.com.pegapa.entity.Endereco;
import br.com.pegapa.entity.Perfil;
import br.com.pegapa.entity.Profissional;
import br.com.pegapa.entity.SituacaoSolicitacao;
import br.com.pegapa.entity.Solicitacao;
import br.com.pegapa.entity.Usuario;
import br.com.pegapa.repository.ProfissionalRepositorio;
import br.com.pegapa.repository.SolicitacaoRepository;
import br.com.pegapa.repository.UsuarioRepository;


@WebServlet("/ServletUsuario")
public class UsuarioServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Inject
	private UsuarioRepository repo;
	
	@Inject
	private SolicitacaoRepository solicRepo;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("cadastra") != null){
			cadastrar(request, response);
		} else if(request.getParameter("login") != null){
			login(request, response);
		} else if(request.getParameter("sair") != null){
			sair(request, response);
		} else if(request.getParameter("solicitar") != null){
			enviarSolicitacao(request, response);
		}
	}
	
	private void enviarSolicitacao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		JSONObject json = new JSONObject();
		try{
			Usuario usr = (Usuario) request.getSession().getAttribute("user");
			Integer codProf = Integer.valueOf(request.getParameter("id"));
			Profissional p = new Profissional();
			p.setId(codProf);
			
			Solicitacao solic = new Solicitacao();
			
			solic.setProfissional(p);
			solic.setUsuario(usr);
			solic.setSituacao(SituacaoSolicitacao.ENVIADO);
			solic.setDescricaoSolicitacao(request.getParameter("desc"));
			solicRepo.enviarSolicitacao(solic);
			json.put("sucesso", "Mensagem Enviada com Sucesso");
		} catch(Exception e){
			e.printStackTrace();
			json.put("erro", "Erro");
		}
		//SituacaoSolicitacao.ENVIADO;
		response.getWriter().write(json.toString());
		
		
		
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("editarUsuario") != null){
			editar(request, response);
		} else if(request.getParameter("confEdicao") !=null ){
			confirmarEdicao(request, response);
		} else if(request.getParameter("logout") != null){
			sair(request, response);
		}
	}
	
	private void confirmarEdicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String codigo = request.getParameter("codUser");
		Usuario user = repo.consultaPorId(Integer.valueOf(codigo));
		
		user.setNome(request.getParameter("nome"));
		user.setCpf(request.getParameter("cpf"));
		user.setEstado(request.getParameter("estado"));
		user.setCidade(request.getParameter("cidade"));
		user.setTelefone(request.getParameter("tel"));
		user.setCelular(request.getParameter("cel"));		

		user.getEndereco().setCep(request.getParameter("cep"));
		user.getEndereco().setNumero(request.getParameter("numero"));
		user.getEndereco().setRua(request.getParameter("rua"));

		
		repo.merge(user);
		request.setAttribute("user", user);
		request.setAttribute("sucesso", "Usuário Alterado com Sucesso");
		request.getRequestDispatcher("usuario/editarDados.jsp").forward(request, response);
		
	}

	private void editar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String codigo = request.getParameter("codUser");
		Usuario user = new Usuario();
		user = repo.consultaPorId(Integer.valueOf(codigo));
		request.getSession().setAttribute("user", user);
		
		request.getRequestDispatcher("usuario/editarDados.jsp").forward(request, response);
	}

	public void cadastrar(HttpServletRequest request, HttpServletResponse response){
		Usuario usuario = new Usuario();
		Endereco endereco = new Endereco();
		JSONObject json = new JSONObject();
		try{
		
			usuario.setCpf(request.getParameter("cpf"));
			usuario.setEmail(request.getParameter("email"));
			usuario.setNome(request.getParameter("nome"));
			usuario.setPerfil(Perfil.SOLICITANTE);
			endereco.setCep(request.getParameter("cep"));
			endereco.setRua(request.getParameter("logradouro"));
			endereco.setNumero(request.getParameter("numero"));
			usuario.setEndereco(endereco);
			usuario.setCidade(request.getParameter("cidade"));
			usuario.setEstado(request.getParameter("estado"));
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
		response.sendRedirect("usuario/paginaInicial.jsp");
		//request.getRequestDispatcher("usuario/paginaInicial.jsp").forward(request, response);
		
	}
	
	public void sair(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession session = request.getSession();
		if(session != null){
			session.invalidate();
		}
		response.sendRedirect("/pegapa/index.jsp");
		//request.getRequestDispatcher("/index.jsp").forward(request, response);
	}
}
