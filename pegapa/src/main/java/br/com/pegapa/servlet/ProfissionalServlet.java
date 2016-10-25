package br.com.pegapa.servlet;

import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.JSONObject;

import br.com.pegapa.entity.Endereco;
import br.com.pegapa.entity.Profissional;
import br.com.pegapa.entity.Servico;
import br.com.pegapa.entity.SituacaoSolicitacao;
import br.com.pegapa.entity.Solicitacao;
import br.com.pegapa.repository.OutrosRepositorios;
import br.com.pegapa.repository.ProfissionalRepositorio;
import br.com.pegapa.repository.SolicitacaoRepository;
import br.com.pegapa.util.JavaMailUtil;


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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("deletarServ") != null){
			deletarServico(request, response);
		} else if(request.getParameter("editarProf") != null){
			editar(request, response);
		} 
	}
	private void editar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String codigo = request.getParameter("codProfissional");
		Profissional prof = new Profissional();
		prof = repo.selectPorId(Integer.valueOf(codigo));
		
		if(prof.getImagem() != null){
			InputStream baos = new ByteArrayInputStream(prof.getImagem());
			ImageIO.read(baos);
			baos.close();
			OutputStream f = new BufferedOutputStream(new FileOutputStream(getServletContext().getRealPath("") + "\\images\\filename"  + prof.getId() + ".jpg"));
			f.write(prof.getImagem());
			f.flush();
			f.close();
		}
		
		request.getSession().setAttribute("prof", prof);
		
		response.sendRedirect("profissional/editarDados.jsp");
	}

	private void deletarServico(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Integer codigoServi = Integer.valueOf(request.getParameter("idServicoDeleta"));
		
		Servico s = outros.findByPk(codigoServi);
		outros.deletar(s);
		
		Profissional p = (Profissional) request.getSession().getAttribute("prof");
		List<Servico> resultado = outros.findAllServicosPorUsuario(p);
		request.getSession().setAttribute("lista", resultado);
		response.sendRedirect("profissional/manterServicos.jsp");
		
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		if(req.getParameter("cadastra")!= null ){
			cadastrarProfissional(req, resp);
		} else if(req.getParameter("login")!= null){
			login(req, resp);
		} else if(req.getParameter("listarSolic") != null){
			listarSolicitacoes(req, resp);
		} else if(req.getParameter("historicoSolic") != null){
			listarHistorico(req, resp);
		} else if(req.getParameter("accSolic")!= null){
			if(req.getParameter("accSolic").equals("S")){
				aceitarSolicitacao(req, resp);
			} else if(req.getParameter("accSolic").equals("N")){
				rejeitarSolicitacao(req, resp);
			}
		} else if(req.getParameter("listarServicos")!= null){
			listarServicosProfissional(req, resp);
		} else if(req.getParameter("cadastraServ") != null){
			cadastrarServico(req,resp);
		} else if(req.getParameter("editarServ") != null){
			editarServico(req, resp);
		} else if(req.getParameter("confEdicao") != null){
			confirmarEdicao(req, resp);
		}
    	
	}
	

	private void editarServico(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Integer id = Integer.valueOf(req.getParameter("idServico"));
		String nome = req.getParameter("_edit_nome");
		String desc = req.getParameter("_edit_text");
		String stringPreco = req.getParameter("_edit_preco");
		Double preco = null;
		if(!"R$ 0,00".equals(stringPreco) && !stringPreco.isEmpty()){
			//TODO se colocarem um preço muito alto, vai dar erro no replace abaixo Ex: "1.000.000,00 -> 1.000.000.00"
			stringPreco = stringPreco.replace(',', '.').replace("R$ ", "");
			preco = Double.valueOf(stringPreco);
		}
		Servico buscado = outros.findByPk(id);
		buscado.setNome(nome);
		buscado.setDescricao(desc);
		buscado.setPreco(preco);
		outros.alterar(buscado);
		Profissional p = (Profissional) req.getSession().getAttribute("prof");
		List<Servico> resultado = outros.findAllServicosPorUsuario(p);
		req.getSession().setAttribute("lista", resultado);
		resp.sendRedirect("profissional/manterServicos.jsp");
	}


	private void cadastrarServico(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String nome = req.getParameter("nomeServ");
		String desc = req.getParameter("descricaoServ");
		String stringPreco = req.getParameter("precoServ");
		Double preco = null;
		if(!"0,00".equals(stringPreco) && !stringPreco.isEmpty()){
			stringPreco = stringPreco.replaceAll("[.,]", "");
			StringBuilder sb = new StringBuilder(stringPreco);
			sb.insert(sb.length() - 2, '.');
			preco = Double.valueOf(sb.toString());
		}
		
		Profissional p = (Profissional) req.getSession().getAttribute("prof");
		Servico s = new Servico(nome, desc, p, preco);
		
		outros.inserirServico(s);
		List<Servico> resultado = outros.findAllServicosPorUsuario(p);
		req.getSession().setAttribute("lista", resultado);
		resp.sendRedirect("profissional/manterServicos.jsp");
	}


	private void listarServicosProfissional(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String codProf = req.getParameter("id");
		if(codProf.equals("")){
			//throw new Exception
		}
		Profissional p = new Profissional(Integer.valueOf(codProf));
		List<Servico> resultado = outros.findAllServicosPorUsuario(p);
		req.getSession().setAttribute("lista", resultado);
		resp.sendRedirect("profissional/manterServicos.jsp");
		
	}


	private void listarSolicitacoes(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		Integer codProf = Integer.valueOf(req.getParameter("id"));
		if(codProf.equals("")){
			//TODO DEU EXCEÇÃO, COLOCAR NA TELA MENSAGEM DE QUE A SESSAO DO USUARIO EXPIROU
		}
		
		Profissional p = new Profissional(codProf);
		List<Solicitacao> list = solicRepository.buscaSolicitacoesPorIdProfissional(p);
		req.getSession().setAttribute("lista", list);
		resp.sendRedirect("profissional/visualizarSolicitacoes.jsp");
	}

	public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		resp.setContentType("text/html;charset=UTF-8");
		HttpSession session = req.getSession();
		Profissional prof = new Profissional();
		String login = req.getParameter("username_prof");
		
		String password = req.getParameter("password_prof"); 
		
		prof = repo.selectProfissional(login, password);
		
		if(prof == null){
			resp.getWriter().write("false");
		} else{
			session.setAttribute("prof", prof);
			session.setAttribute("usuarioLogado", "sim");
			resp.getWriter().write("true");
		}
		
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
			profissional.setCpf(req.getParameter("cpf").replaceAll("[.-]", ""));
			
			Endereco end = new Endereco();
			end.setRua(req.getParameter("endereco"));
			end.setNumero(req.getParameter("numero"));
			end.setCep(req.getParameter("cep").replaceAll("[-]", ""));
			profissional.setEndereco(end);
			profissional.setDescricaoProfissao(req.getParameter("descricao"));
			profissional.setCidade(req.getParameter("cidade-prof"));
			profissional.setEstado(req.getParameter("estado-prof"));
			profissional.setMesesExperiencia(Byte.valueOf(req.getParameter("mes")));
			profissional.setAnosExperiencia(Short.valueOf(req.getParameter("anos")));
			profissional.setBairro(req.getParameter("bairros-prof"));
			profissional.setTelefone(req.getParameter("telefone").replaceAll("[-)( ]", ""));
			profissional.setCelular(req.getParameter("celular").replaceAll("[-)( ]", ""));
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
	
	private void aceitarSolicitacao(HttpServletRequest request, HttpServletResponse response) {
		Integer idSolicitacao = Integer.valueOf(request.getParameter("idSolicitacao"));
		String resposta = request.getParameter("respSolicitacao");
		Solicitacao aConfirmar = solicRepository.findByPk(idSolicitacao);
		aConfirmar.setRespostaSolicitacao(resposta);
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		
		aConfirmar.setDtModificacao(cal);
		aConfirmar.setSituacao(SituacaoSolicitacao.CONFIRMADO);
		solicRepository.merge(aConfirmar);
		
		JSONObject json = new JSONObject();
		json.put("sucesso", "Solicitação Confirmada.");
		
		//Enviar email pro usuario que o Profissional/fornecedor aceitou sua solicitacao
		String nomeSolicitador = "";
		if(aConfirmar.getFornecedor() != null){
			nomeSolicitador = aConfirmar.getFornecedor().getNomeFantasia();
		} else if(aConfirmar.getProfissional() != null){
			nomeSolicitador = aConfirmar.getProfissional().getNome();
		}
		
		String assunto = "Mudança de Status na sua Solicitação - PegaPá";
		String texto = "Sua solicitação feita ao(a) " +  nomeSolicitador + " foi respondida. Entre no Pegapá e dê uma conferida.";
		
		/*
		try {
			JavaMailUtil.enviarEmail(aConfirmar.getUsuario().getEmail(), assunto, texto);
		} catch (MessagingException e) {
			e.printStackTrace();
		}*/
		
	}
	
	private void rejeitarSolicitacao(HttpServletRequest request, HttpServletResponse response) {
		Integer idSolicitacao = Integer.valueOf(request.getParameter("idSolicitacao"));
		String resposta = request.getParameter("respSolicitacao");
		Solicitacao aConfirmar = solicRepository.findByPk(idSolicitacao);
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		aConfirmar.setDtModificacao(cal);
		aConfirmar.setRespostaSolicitacao(resposta);
		aConfirmar.setSituacao(SituacaoSolicitacao.RECUSADO);
		solicRepository.merge(aConfirmar);
	}
	
	private void listarHistorico(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Integer codProf = Integer.valueOf(req.getParameter("id"));
		if(codProf.equals("")){
			//TODO DEU EXCEÇÃO, COLOCAR NA TELA MENSAGEM DE QUE A SESSAO DO USUARIO EXPIROU
		}
		
		Profissional p = new Profissional(codProf);
		List<Solicitacao> historico = solicRepository.buscaSolicitacoesRecusadasOuAceitas(p);
		
		List<Solicitacao> acc = new ArrayList<>();
		List<Solicitacao> notAcc = new ArrayList<>();
		
		
		for(Solicitacao sol : historico){
			if(sol.getSituacao().equals(SituacaoSolicitacao.CONFIRMADO)){
				acc.add(sol);
			} else if( sol.getSituacao().equals(SituacaoSolicitacao.RECUSADO)){
				notAcc.add(sol);
			}
		}
		historico.clear();
		
		req.getSession().setAttribute("listaA", acc);
		req.getSession().setAttribute("listaR", notAcc);
		resp.sendRedirect("profissional/historicoVisualizacoes.jsp");
		
	}
	public void sair(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession session = request.getSession();
		if(session != null){
			session.invalidate();
		}
		response.sendRedirect("/pegapa/index.jsp");
		//request.getRequestDispatcher("/index.jsp").forward(request, response);
	}
	
	private void confirmarEdicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String codigo = request.getParameter("codProf");
		Profissional prof = repo.selectPorId(Integer.valueOf(codigo));
		
		prof.setNome(request.getParameter("nome"));
		prof.setCpf(request.getParameter("cpf").replaceAll("[./-]", ""));
		prof.setEstado(request.getParameter("estado-prof"));
		prof.setCidade(request.getParameter("cidade-prof"));
		prof.setBairro(request.getParameter("bairros-prof"));
		prof.setTelefone(request.getParameter("tel").replaceAll("[-)( ]", ""));
		prof.setCelular(request.getParameter("cel").replaceAll("[-)( ]", ""));		
		prof.setDescricaoProfissao(request.getParameter("descricao"));
		prof.setOcupacao(request.getParameter("ocupacao"));
		prof.getEndereco().setCep(request.getParameter("cep").replaceAll("[-]", ""));
		prof.getEndereco().setNumero(request.getParameter("numero"));
		prof.getEndereco().setRua(request.getParameter("rua"));

		Part part = request.getPart("imagemProfissional");
		if(part != null){
		
			try(ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
					InputStream is = part.getInputStream()){
				int leitorDeBytes;
				byte [] arrayByte = new byte[1024];
				while((leitorDeBytes = is.read(arrayByte, 0, arrayByte.length)) != -1){
					byteOut.write(arrayByte, 0, leitorDeBytes);
				}
				byte [] dadosImagem = byteOut.toByteArray();
				prof.setImagem(dadosImagem);
				byteOut.flush();
			} catch(Exception e){
				System.out.println("ERRO AO RECUPERAR IMAGEM APÓS ALTERAÇÃO");
			}
		}
		
		/**
		 * EXIBINDO FOTO EM TELA
		 */
		if(prof.getImagem() != null){
			InputStream baos = new ByteArrayInputStream(prof.getImagem());
			ImageIO.read(baos);
			baos.close();
			OutputStream out = new BufferedOutputStream(new FileOutputStream(getServletContext().getRealPath("") + "\\images\\filename"  + prof.getId() + ".jpg"));
			out.write(prof.getImagem());
			out.flush();
			out.close();
		}
		prof = repo.merge(prof);
		request.setAttribute("prof", prof);
		request.setAttribute("sucesso", "Usuário Alterado com Sucesso");
		request.getRequestDispatcher("profissional/editarDados.jsp").forward(request, response);
		
	}

}
