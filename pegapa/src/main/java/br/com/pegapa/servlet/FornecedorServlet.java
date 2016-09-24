package br.com.pegapa.servlet;

import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
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

import br.com.pegapa.entity.Endereco;
import br.com.pegapa.entity.Fornecedor;
import br.com.pegapa.entity.Profissional;
import br.com.pegapa.entity.Servico;
import br.com.pegapa.entity.SituacaoSolicitacao;
import br.com.pegapa.entity.Solicitacao;
import br.com.pegapa.entity.Usuario;
import br.com.pegapa.repository.FornecedorRepository;
import br.com.pegapa.repository.SolicitacaoRepository;


@WebServlet("/ServletFornecedor")
@MultipartConfig
public class FornecedorServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	private final String LOJA_FISICA = "Loja Fisica";
	private final String LOJA_VIRTUAL = "Loja Virtual";
	
	@Inject
	FornecedorRepository fornRepo;
	
	@Inject
	SolicitacaoRepository solicRepository;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if(request.getParameter("cadastra") != null){
			cadastrarForn(request, response);
		} else if(request.getParameter("login") != null){
			login(request, response);
		} else if(request.getParameter("edicaoForn") != null){
			confirmarEdicaoFornecedor(request, response);
		} else if(request.getParameter("listarSolicForn") != null){
			listarSolicitacoes(request, response);
		} else if(request.getParameter("historicoSolic") != null){
			listarHistorico(request, response);
		} else if(request.getParameter("accSolic")!= null){
			if(request.getParameter("accSolic").equals("S")){
				aceitarSolicitacao(request, response);
			} else if(request.getParameter("accSolic").equals("N")){
				rejeitarSolicitacao(request, response);
			}
		} else if(request.getParameter("validaEmail") != null){
			buscaEmailNoBanco(request, response);
		}
	}
	
	
	private void buscaEmailNoBanco(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = request.getParameter("email");
		
		List<String> emails = fornRepo.emailsCadastrados(email);
		JSONObject json = new JSONObject();
		if(emails.isEmpty()){
			json.put("sucesso", "Email válido");
		} else{
			json.put("erro", "Email já cadastrado");
		}
		response.getWriter().write(json.toString());
	}


	private void listarHistorico(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Integer codFornecedor = Integer.valueOf(request.getParameter("id"));
		if(codFornecedor.equals("")){
			//TODO DEU EXCEÇÃO, COLOCAR NA TELA MENSAGEM DE QUE A SESSAO DO USUARIO EXPIROU
		}
		
		Fornecedor f = new Fornecedor(codFornecedor);
		List<Solicitacao> historico = solicRepository.buscaSolicitacoesRecusadasOuAceitasDeFornecedor(f);
		
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
		
		request.getSession().setAttribute("listaA", acc);
		request.getSession().setAttribute("listaR", notAcc);
		response.sendRedirect("fornecedor/historicoVisualizacoes.jsp");
		
	}


	private void listarSolicitacoes(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Integer codProf = Integer.valueOf(request.getParameter("id"));
		if(codProf.equals("")){
			//TODO DEU EXCEÇÃO, COLOCAR NA TELA MENSAGEM DE QUE A SESSAO DO USUARIO EXPIROU
		}
		
		Fornecedor f = new Fornecedor(codProf);
		List<Solicitacao> list = solicRepository.buscaSolicitacoesPorIdForneccedor(f);
		
		request.getSession().setAttribute("lista", list);
		response.sendRedirect("fornecedor/visualizarSolicitacoes.jsp");
		
	}


	private void confirmarEdicaoFornecedorVirtual(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		System.out.println("INICIANDO ALTERAÇÃO DE DADOS - FORNECEDOR VIRTUAL");
		Integer codigoForn = Integer.valueOf(request.getParameter("codForn_v"));
		Fornecedor f = fornRepo.selectByPk(codigoForn);
		
		Part part = request.getPart("imagemFornVirtual");
		if(part != null){
		
			try(ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
					InputStream is = part.getInputStream()){
				int leitorDeBytes;
				byte [] arrayByte = new byte[1024];
				while((leitorDeBytes = is.read(arrayByte, 0, arrayByte.length)) != -1){
					byteOut.write(arrayByte, 0, leitorDeBytes);
				}
				byte [] dadosImagem = byteOut.toByteArray();
				f.setFoto(dadosImagem);
				byteOut.flush();
			} catch(Exception e){
				System.out.println("ERRO AO RECUPERAR IMAGEM APÓS ALTERAÇÃO");
			}
		}
		String nome = request.getParameter("nome_v");
		f.setNomeFantasia(nome);
		f.setTipoLoja(LOJA_VIRTUAL);
		String url = request.getParameter("url_v");
		f.setUrl(url);
		
		String email = request.getParameter("email_v");
		f.setEmail(email);
		
		
		f = fornRepo.alterarFornecedor(f);
		
		/**
		 * EXIBINDO FOTO EM TELA
		 */
		if(f.getFoto() != null){
			InputStream baos = new ByteArrayInputStream(f.getFoto());
			BufferedImage img = ImageIO.read(baos);
			baos.close();
			OutputStream out = new BufferedOutputStream(new FileOutputStream(getServletContext().getRealPath("") + "\\images\\filename"  + f.getCodFornecedor() + ".jpg"));
			out.write(f.getFoto());
			out.flush();
			out.close();
		}
		
		request.getSession().setAttribute("fornec", f);
		request.getSession().setAttribute("sucesso", "Fornecedor Alterado com Sucesso");
		response.sendRedirect("fornecedor/editarDados.jsp");
		System.out.println("FINALIZANDO ALTERAÇÃO DE DADOS - FORNECEDOR");
		
	}


	private void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		Fornecedor fornec = new Fornecedor();
		String login = request.getParameter("usernameFornecedor");
		
		String password = request.getParameter("passwordFornecedor"); 
		
		fornec = fornRepo.selectFornecedor(login, password);
		if(fornec == null){
			response.getWriter().write("false");
		} else{
			session.setAttribute("fornec", fornec);
			session.setAttribute("usuarioLogado", "sim");
			response.getWriter().write("true");
		}
	}

	

	private void cadastrarForn(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		System.out.println("INICIANDO CADASTRO FORNECEDOR");
		String tipoLoja = request.getParameter("tipo");
		if(tipoLoja.equals(LOJA_VIRTUAL)){
			cadastraFornVirtual(request, response);
		} else{
			Part part = request.getPart("imagemFornFisico");

			JSONObject json = new JSONObject();
			try(ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
					InputStream is = part.getInputStream()) {

				Fornecedor f = new Fornecedor();
				

				f.setTipoLoja(LOJA_FISICA);
				
				f.setNomeFantasia(request.getParameter("nomeFantasia"));
				f.setCnpj(request.getParameter("cnpj"));

				String ramoAtuacao =  request.getParameter("ramoAtuacaoFisico");
				
				f.setRamoAtuacao(ramoAtuacao);

				f.setUrl(request.getParameter("url"));
				f.setNomeResponsavel(request.getParameter("nomeResponsavel"));
				f.setEstado(request.getParameter("estadoForn"));
				f.setCidade(request.getParameter("cidadeForn"));
				f.setBairro(request.getParameter("bairrosForn"));

				int leitorDeBytes;
				byte [] arrayByte = new byte[1024];
				while((leitorDeBytes = is.read(arrayByte, 0, arrayByte.length)) != -1){
					byteOut.write(arrayByte, 0, leitorDeBytes);
				}
				byte [] dadosImagem = byteOut.toByteArray();
				f.setFoto(dadosImagem);
				byteOut.flush();

				Endereco e = new Endereco();
				e.setCep(request.getParameter("cepFornecedor"));
				e.setNumero(request.getParameter("numFornecedor"));
				e.setRua(request.getParameter("ruaFornecedor"));
				f.setEndereco(e);

				f.setTel1(request.getParameter("tel1"));
				f.setTel2(request.getParameter("tel2"));
				f.setEmail(request.getParameter("emailF"));
				f.setSenha(request.getParameter("senhaF"));
				fornRepo.inserirFornecedor(f);

				json.put("sucesso", "Cadastro Realizado com Sucesso");
			}catch(IOException e){
				System.out.println("ERRO AO RECUPERAR A IMAGEM DO BROWSER");
				e.printStackTrace();
				json.put("erro", "Nos desculpe, aconteceu um problema. Tente novamente mais tarde");
			}catch (Exception e1) {
				System.out.println("OCORREU UM OUTRO ERRO");
				json.put("erro", "Nos desculpe, aconteceu um problema. Tente novamente mais tarde");
				e1.printStackTrace();
			}finally{
				response.getWriter().write(json.toString());
			}
		}
	}


	private void cadastraFornVirtual(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Part part = request.getPart("imagemFornVirtual");
		JSONObject json = new JSONObject();
		try(ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
				InputStream is = part.getInputStream()) {

			Fornecedor f = new Fornecedor();

			f.setTipoLoja(LOJA_VIRTUAL);
			
			f.setNomeFantasia(request.getParameter("nomeFantasiaVirt"));

			String ramoAtuacao =  request.getParameter("ramoAtuacaoVirtual");
			
			f.setRamoAtuacao(ramoAtuacao);

			f.setUrl(request.getParameter("urlVirt"));


			int leitorDeBytes;
			byte [] arrayByte = new byte[1024];
			while((leitorDeBytes = is.read(arrayByte, 0, arrayByte.length)) != -1){
				byteOut.write(arrayByte, 0, leitorDeBytes);
			}
			byte [] dadosImagem = byteOut.toByteArray();
			f.setFoto(dadosImagem);
			byteOut.flush();

			f.setEmail(request.getParameter("emailFornVirt"));
			f.setSenha(request.getParameter("senhaFornVirt"));
			fornRepo.inserirFornecedor(f);

			json.put("sucesso", "Cadastro Realizado com Sucesso");
		}catch(IOException e){
			System.out.println("ERRO AO RECUPERAR A IMAGEM DO BROWSER");
			e.printStackTrace();
			json.put("erro", "Nos desculpe, aconteceu um problema. Tente novamente mais tarde");
		}catch (Exception e1) {
			System.out.println("OCORREU UM OUTRO ERRO");
			json.put("erro", "Nos desculpe, aconteceu um problema. Tente novamente mais tarde");
			e1.printStackTrace();
		}finally{
			response.getWriter().write(json.toString());
		}
		
	}



	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if(request.getParameter("editarFornec") != null){
			editar(request, response);
		} 
	}
	
	private void confirmarEdicaoFornecedor(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		System.out.println("INICIANDO ALTERAÇÃO DE DADOS - FORNECEDOR");
		Integer codigoForn = Integer.valueOf(request.getParameter("codForn"));
		Fornecedor f = fornRepo.selectByPk(codigoForn);
		
		Part part = request.getPart("imagemFornFisico");
		if(part != null){
		
			try(ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
					InputStream is = part.getInputStream()){
				int leitorDeBytes;
				byte [] arrayByte = new byte[1024];
				while((leitorDeBytes = is.read(arrayByte, 0, arrayByte.length)) != -1){
					byteOut.write(arrayByte, 0, leitorDeBytes);
				}
				byte [] dadosImagem = byteOut.toByteArray();
				f.setFoto(dadosImagem);
				byteOut.flush();
			} catch(Exception e){
				System.out.println("ERRO AO RECUPERAR IMAGEM APÓS ALTERAÇÃO");
			}
		}
		if(request.getParameter("pesq").equals("f")){
			f.setTipoLoja(LOJA_FISICA);
			String nome = request.getParameter("nome");
			f.setNomeFantasia(nome);
			
			String cnpj = request.getParameter("cnpj").replaceAll("[./-]", "");
			f.setCnpj(cnpj);
			
			String responsavel = request.getParameter("nomeResp");
			f.setNomeResponsavel(responsavel);
			
			//PARAMETROS DE ENDEREÇO
			Endereco e = new Endereco();
			String cep = request.getParameter("cep").replaceAll("[-]", "");
			String rua = request.getParameter("rua");
			String numero = request.getParameter("numero");
			e.setRua(rua);
			e.setNumero(numero);
			e.setCep(cep);
			f.setEndereco(e);
			
			//FIM
			String ramoAtuacao = request.getParameter("ramoAtuacaoFisico");
			f.setRamoAtuacao(ramoAtuacao);
			String estado = request.getParameter("estado_forn");
			String cidade = request.getParameter("cidade_forn");
			String bairro = request.getParameter("bairros_forn");
			f.setEstado(estado);
			f.setCidade(cidade);
			f.setBairro(bairro);
			
			String tel = request.getParameter("telForn").replaceAll("[-)( ]", "");
			String cel = request.getParameter("celForn").replaceAll("[-)( ]", "");
			f.setTel1(tel);
			f.setTel2(cel);
			f = fornRepo.alterarFornecedor(f);
		} else if(request.getParameter("pesq").equals("v")){
			f.setTipoLoja(LOJA_VIRTUAL);
			String nome = request.getParameter("nome");
			f.setNomeFantasia(nome);
			f.setCnpj("");
			f.setNomeResponsavel("");
			f.getEndereco().setCep("");
			f.getEndereco().setRua("");
			f.getEndereco().setNumero("");
			String url = request.getParameter("url");
			f.setUrl(url);
			f.setEstado("");
			f.setCidade("");
			f.setBairro("");
			String ramoAtuacao = request.getParameter("ramoAtuacaoFisico");
			f.setRamoAtuacao(ramoAtuacao);
			
			String email = request.getParameter("emailForn");
			f.setEmail(email);
			
			f = fornRepo.alterarFornecedor(f);
		}
		
		
		/**
		 * EXIBINDO FOTO EM TELA
		 */
		if(f.getFoto() != null){
			InputStream baos = new ByteArrayInputStream(f.getFoto());
			BufferedImage img = ImageIO.read(baos);
			baos.close();
			OutputStream out = new BufferedOutputStream(new FileOutputStream(getServletContext().getRealPath("") + "\\images\\filename"  + f.getCodFornecedor() + ".jpg"));
			out.write(f.getFoto());
			out.flush();
			out.close();
		}
		
		request.getSession().setAttribute("fornec", f);
		request.getSession().setAttribute("sucesso", "Fornecedor Alterado com Sucesso");
		response.sendRedirect("fornecedor/editarDados.jsp");
		System.out.println("FINALIZANDO ALTERAÇÃO DE DADOS - FORNECEDOR");
	}


	private void editar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String codigo = request.getParameter("codFornecedor");
		Fornecedor forn = new Fornecedor();
		forn = fornRepo.selectByPk(Integer.valueOf(codigo));
		
		if(forn.getFoto() != null){
			InputStream baos = new ByteArrayInputStream(forn.getFoto());
			BufferedImage img = ImageIO.read(baos);
			baos.close();
			OutputStream f = new BufferedOutputStream(new FileOutputStream(getServletContext().getRealPath("") + "\\images\\filename"  + forn.getCodFornecedor() + ".jpg"));
			f.write(forn.getFoto());
			f.flush();
			f.close();
		}
		
		request.getSession().setAttribute("fornec", forn);
		
		//request.getRequestDispatcher("usuario/editarDados.jsp").forward(request, response);
		response.sendRedirect("fornecedor/editarDados.jsp");
	}
	
	
	
	//TODO OS METODOS ACEITAR SOLICITACAO E REJEITAR SOLICITAÇAO PODERIAM ESTAR NUMA CLASSE CHAMADA SOLICITACAO SERVLET
	//POIS ASSIM TANTO ESTES MÉTODOS NESTA CLASSE, QUANTO OS METODOS PRESENTE NA CLASSE PROFISSIONALSERVLET PODERIAM DEIXAR DE
	//EXISTIR E TORNAR A ORIENTAÇAO A OBJETO MENOS REPETITIVA E MAIS COESA
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
	
	
}
