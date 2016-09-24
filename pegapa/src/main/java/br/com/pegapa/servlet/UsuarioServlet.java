
package br.com.pegapa.servlet;

import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.google.gson.Gson;

import br.com.pegapa.entity.Comentario;
import br.com.pegapa.entity.Endereco;
import br.com.pegapa.entity.Fornecedor;
import br.com.pegapa.entity.Perfil;
import br.com.pegapa.entity.Profissional;
import br.com.pegapa.entity.SituacaoSolicitacao;
import br.com.pegapa.entity.Solicitacao;
import br.com.pegapa.entity.Usuario;
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
		} else if(request.getParameter("visualiz") != null){
			visualizarSolicitacoes(request, response);
		} else if(request.getParameter("visualizForn") != null){
			visualizarSolicitacoesFornecedores(request, response);
		}
	}
	
	private void enviarSolicitacao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		JSONObject json;
		try{
			Usuario usr = (Usuario) request.getSession().getAttribute("user");
			Integer cod = Integer.valueOf(request.getParameter("id"));
			Solicitacao solic = new Solicitacao();
			String nomeServico = request.getParameter("nomeServico");
			if(nomeServico.equals("VAZIO")){
				Fornecedor f = new Fornecedor();
				f.setCodFornecedor(cod);
				solic.setFornecedor(f);
			} else{
				Profissional p = new Profissional();
				p.setId(cod);
				solic.setProfissional(p);
			}
			
			Calendar dt = Calendar.getInstance();
			dt.setTime(new Date());
			solic.setDtSolicitacao(dt);
			solic.setNomeServico(nomeServico);
			solic.setUsuario(usr);
			solic.setSituacao(SituacaoSolicitacao.ENVIADO);
			solic.setDescricaoSolicitacao(request.getParameter("desc"));
			solic.setDtModificacao(dt);
			solicRepo.enviarSolicitacao(solic);
			json = new JSONObject();
			json.put("sucesso", "Mensagem Enviada com Sucesso");
		} catch(Exception e){
			e.printStackTrace();
			json = new JSONObject();
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
		} else if(request.getParameter("avaliar") != null){
			avaliarFinalizarSolicitacao(request, response);
		} else if(request.getParameter("cancelar") != null){
			cancelarSolicitacao(request, response);
		}
	}
	
	private void cancelarSolicitacao(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String idSolicitacao = request.getParameter("id");
		
		Solicitacao s = solicRepo.findByPk(Integer.valueOf(idSolicitacao));
		
		Calendar dt = Calendar.getInstance();
		dt.setTime(new Date());
		response.setContentType("application/json");
		s.setSituacao(SituacaoSolicitacao.CANCELADO);
		s.setDtModificacao(dt);
		solicRepo.merge(s);
		//Usuario user = (Usuario) request.getSession().getAttribute("user");
		//List<Solicitacao> porUsuario = solicRepo.buscaSolicitacoesPorUsuario(user);
		//request.getSession().setAttribute("lista", porUsuario);
		//response.sendRedirect("usuario/visualizarSolicitacoes.jsp");
		Gson gson = new Gson();
		String retorno = gson.toJson(s.getDtModificacaoFormatada());
		response.getWriter().write(retorno);
	}

	private void avaliarFinalizarSolicitacao(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String codigoSolicitacao = request.getParameter("codigo");
		String notaAvaliacao = request.getParameter("notaServ");
		String comentario = request.getParameter("comentario");
		Solicitacao s = solicRepo.findByPk(Integer.valueOf(codigoSolicitacao));
		
		Calendar dt = Calendar.getInstance();
		dt.setTime(new Date());
		
		Comentario paraInserir = new Comentario();
		paraInserir.setNomeSolicitante(s.getUsuario().getNome());
		paraInserir.setProfissionalFk(s.getProfissional());
		paraInserir.setFornecedorFk(s.getFornecedor());
		paraInserir.setUsuarioFk(s.getUsuario());
		paraInserir.setDescricao(comentario);
		solicRepo.inserirComentario(paraInserir);
		
		
		s.setSituacao(SituacaoSolicitacao.FINALIZADO);
		s.setAvaliacao(Byte.valueOf(notaAvaliacao));
		s.setDtModificacao(dt);
		solicRepo.merge(s);
		
		JSONObject json = new JSONObject();
		
		json.put("sucesso", "Cadastro Realizado com Sucesso");
		json.put("data", s.getDtModificacaoFormatada());
		response.getWriter().write(json.toString());
		
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
		
		//request.getRequestDispatcher("usuario/editarDados.jsp").forward(request, response);
		response.sendRedirect("usuario/editarDados.jsp");
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
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		Usuario user = new Usuario();
		String login = request.getParameter("username_user");
		
		String password = request.getParameter("password_user"); 
		
		user = repo.selectUsuario(login, password);
		
		if(user == null){
			response.getWriter().write("false");
		} else{
			session.setAttribute("user", user);
			session.setAttribute("usuarioLogado", "sim");
			response.getWriter().write("true");
		}
		
	}
	
	public void sair(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession session = request.getSession();
		if(session != null){
			session.invalidate();
		}
		response.sendRedirect("/pegapa/index.jsp");
	}
	
	private void visualizarSolicitacoes(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.getSession().removeAttribute("cancelar");
		request.getSession().removeAttribute("finalizar");
		Integer codUser = Integer.valueOf(request.getParameter("codUser"));
		Usuario user = new Usuario(codUser);
		if(request.getParameter("cancelar") != null){
			request.getSession().setAttribute("cancelar", "s");
		} else if(request.getParameter("finalizar") != null){
			request.getSession().setAttribute("finalizar", "s");
		} 
		List<Solicitacao> porUsuario = solicRepo.buscaSolicitacoesPorUsuario(user);
		request.getSession().setAttribute("lista", porUsuario);
		response.sendRedirect("usuario/visualizarSolicitacoes.jsp");
	}
	private void visualizarSolicitacoesFornecedores(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.getSession().removeAttribute("cancelar");
		request.getSession().removeAttribute("finalizar");
		Integer codUser = Integer.valueOf(request.getParameter("codUser"));
		Usuario user = new Usuario(codUser);
		if(request.getParameter("cancelar") != null){
			request.getSession().setAttribute("cancelar", "s");
		} else if(request.getParameter("finalizar") != null){
			request.getSession().setAttribute("finalizar", "s");
		} 
		List<Solicitacao> porUsuario = solicRepo.buscaSolicitacoesFornecedoresPorUsuario(user);
		for(Solicitacao s: porUsuario){
			Fornecedor f = s.getFornecedor();
			if(f.getFoto() != null){
				InputStream baos = new ByteArrayInputStream(f.getFoto());
				BufferedImage img = ImageIO.read(baos);
				baos.close();
				OutputStream out = new BufferedOutputStream(new FileOutputStream(getServletContext().getRealPath("") + "\\images\\filename"  + f.getCodFornecedor() + ".jpg"));
				out.write(f.getFoto());
				out.flush();
				out.close();
			}
		}
		request.getSession().setAttribute("lista", porUsuario);
		response.sendRedirect("usuario/visualizarSolicitacoesFornecedores.jsp");
	}
	
}
