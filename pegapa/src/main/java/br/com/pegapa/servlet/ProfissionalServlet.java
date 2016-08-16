package br.com.pegapa.servlet;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.JSONObject;

import br.com.pegapa.entity.Profissional;
import br.com.pegapa.entity.Solicitacao;
import br.com.pegapa.repository.OutrosRepositorios;
import br.com.pegapa.repository.ProfissionalRepositorio;
import br.com.pegapa.repository.SolicitacaoRepository;


@WebServlet("/cadastrarProfissional")
@MultipartConfig
public class ProfissionalServlet  extends HttpServlet { 
	
	private static final long serialVersionUID = -4663872199856610186L;

	@Inject
	ProfissionalRepositorio repo;
	
	@Inject
	OutrosRepositorios outros;
	
	@Inject
	SolicitacaoRepository solicRepository;

	
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		if(req.getParameter("cadastra")!= null ){
			cadastrarProfissional(req, resp);
		} else if(req.getParameter("login")!= null){
			login(req, resp);
		} else if(req.getParameter("listarSolic") != null){
			listarSolicitacoes(req, resp);
		}
    	
	}
	
	private void listarSolicitacoes(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		Integer codProf = Integer.valueOf(req.getParameter("id"));
		Profissional p = new Profissional(codProf);
		List<Solicitacao> list = solicRepository.buscaSolicitacoesPorIdProfissional(p);
		req.getSession().setAttribute("lista", list);
		resp.sendRedirect("profissional/visualizarSolicitacoes.jsp");
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
			Part part = req.getPart("imagem");
			InputStream is = part.getInputStream();
		
			ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
			int leitorDeBytes;
			byte [] arrayByte = new byte[1024];
			while((leitorDeBytes = is.read(arrayByte, 0, arrayByte.length)) != -1){
				byteOut.write(arrayByte, 0, leitorDeBytes);
			}
			
			byteOut.flush();
			byteOut.close();
			is.close();
			byte [] dadosImagem = byteOut.toByteArray();
			profissional.setImagem(dadosImagem);
			profissional.setNome(req.getParameter("nome"));
			profissional.setCpf(req.getParameter("cpf"));
			profissional.setLogradouro(req.getParameter("endereco"));
			profissional.setNumero(req.getParameter("numero"));
			profissional.setCidade(req.getParameter("cidade-prof"));
			profissional.setEstado(req.getParameter("estado-prof"));
			profissional.setMesesExperiencia(Byte.valueOf(req.getParameter("mes")));
			profissional.setAnosExperiencia(Short.valueOf(req.getParameter("anos")));
			profissional.setBairro(new String(req.getParameter("bairros-prof").getBytes("ISO-8859-1"), "UTF-8"));
			profissional.setCep(req.getParameter("cep"));
			profissional.setTelefone(req.getParameter("telefone"));
			profissional.setCelular(req.getParameter("celular"));
			profissional.setOcupacao(req.getParameter("ocupacao"));
			profissional.setExperiencia(req.getParameter("experiencia"));
			profissional.setEmail(req.getParameter("email"));
			profissional.setSenha(req.getParameter("senha"));
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
