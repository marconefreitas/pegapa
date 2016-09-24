package br.com.pegapa.servlet;

import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import br.com.pegapa.entity.Bairro;
import br.com.pegapa.entity.Cidade;
import br.com.pegapa.entity.Comentario;
import br.com.pegapa.entity.Estado;
import br.com.pegapa.entity.Fornecedor;
import br.com.pegapa.entity.Profissional;
import br.com.pegapa.entity.Servico;
import br.com.pegapa.repository.FornecedorRepository;
import br.com.pegapa.repository.OutrosRepositorios;
import br.com.pegapa.repository.ProfissionalRepositorio;


@WebServlet("/LocalizarServlet")
public class LocalizarServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Inject
	OutrosRepositorios repo;
	
	@Inject
	ProfissionalRepositorio profRepo;
	
	@Inject
	FornecedorRepository fornRepo;
	
    public LocalizarServlet() {
        super();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	if(request.getParameter("cod") != null){
			selecionarProfissional(request, response);
		} else if(request.getParameter("coment") != null){
			recuperarComentario(request, response);
		} else if(request.getParameter("servicos") != null){
			recuperarServicos(request, response);
		} else if(request.getParameter("all") != null){
			recuperaProfissionalCompleto(request, response);
		} else if(request.getParameter("allFornec") != null){
			recuperaFornecedorCompleto(request, response);
		}
    }

    private void recuperaFornecedorCompleto(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	Integer codigo = Integer.valueOf(request.getParameter("id"));
		Fornecedor f = fornRepo.recuperaFornecedorCompleto(codigo);
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String fornecedor = gson.toJson(f);
		response.setContentType("application/json");
		response.getWriter().write(fornecedor);		
	}

	private void recuperaProfissionalCompleto(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	Integer codigo = Integer.valueOf(request.getParameter("id"));
    	Double nota = profRepo.recuperNotaDoProfisisonal(codigo);
		Profissional p = profRepo.recuperaProfissionalCompleto(codigo);
		p.setNota(nota);
		System.out.println(p);
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String profissional = gson.toJson(p);
		response.setContentType("application/json");
		response.getWriter().write(profissional);
	}

	private void recuperarServicos(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	Integer codigo = Integer.valueOf(request.getParameter("id"));
    	Profissional p = new Profissional();
		p.setId(codigo);
    	List<Servico> servicos = repo.findAllServicosPorUsuario(p);
    	//Json
    	Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
    	String lista = gson.toJson(servicos);
    	System.out.println(lista);
    	response.setContentType("application/json");
    	response.getWriter().write(lista);
		
	}

	private void recuperarComentario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Integer codigo = Integer.valueOf(request.getParameter("id"));
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		Profissional p = new Profissional();
		p.setId(codigo);
		List<Comentario> comentarios = repo.trazComentariosPorProfissional(p);
		
		if(comentarios.isEmpty()){
			Comentario c = new Comentario();
			c.setProfissionalFk(profRepo.selectPorId(p.getId()));
			comentarios.add(c);
		}

		String retorno = gson.toJson(comentarios);
		System.out.println(comentarios);
		response.setContentType("application/json");
		response.getWriter().write(retorno);
		
	}

	private void recuperaFoto(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	Path path = Paths.get("C:\\img\\" + req.getParameter("img") + ".jpg");
		byte[] data = Files.readAllBytes(path);
		ServletOutputStream out =  resp.getOutputStream();
		resp.setContentLength(data.length);
		resp.setContentType("img/jpg");
		out.write(data);
		out.flush();
		out.close();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		//req.setCharacterEncoding("UTF-8");
		if(req.getParameter("localizar") != null){
			localizarProfissional(req, resp);
		} else if(req.getParameter("img")!= null ){
			recuperaFoto(req, resp);
		} else if(req.getParameter("localizarFornecVirt")!= null ){
			localizarFornecedorVirtual(req, resp);
		}
	}
	
	private void localizarFornecedorVirtual(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String ramoAtuacao = request.getParameter("ramoAtuacao").equals("Ramo de Atuação")  ? "" : request.getParameter("ramoAtuacao");	
		List<Fornecedor> fornecedores = fornRepo.listarFornecedoresVirtuais(ramoAtuacao);
		if(!fornecedores.isEmpty()){
			for(Fornecedor f : fornecedores){
				if(f.getFoto() != null){
					InputStream baos = new ByteArrayInputStream(f.getFoto());
					ImageIO.read(baos);
					baos.close();
					OutputStream o = new BufferedOutputStream(new FileOutputStream(getServletContext().getRealPath("") + "\\images\\filename"  + f.getCodFornecedor() + ".jpg"));
					o.write(f.getFoto());
					o.flush();
					o.close();
				}
			}
		}
		request.getSession().setAttribute("lista", fornecedores);
		response.sendRedirect("resultado-pesquisa-fornecedor-v.jsp");
	}

	public void localizarProfissional(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		Bairro bairroFromBD = new Bairro("");
		Estado estadoFromBD = new Estado("");
		Cidade cidadeFromBD = new Cidade("");
		
		String estado = request.getParameter("localiza-estado").equals("Selecione um Estado")  ? "" : request.getParameter("localiza-estado");
		String cidade = request.getParameter("localiza-cidade").equals("Selecione uma Cidade") ? "" : request.getParameter("localiza-cidade");
		String bairro = request.getParameter("localiza-bairros").equals("Selecione um Bairro") ? "" : request.getParameter("localiza-bairros");;
		String categoria =  request.getParameter("categoria-buscada");
		
		List<Profissional> profissionais = new ArrayList<Profissional>();
		if(!estado.equals("")){
			estadoFromBD = repo.buscaPorPK(Short.valueOf(estado));
		}
		if(!cidade.equals("")){
			cidadeFromBD = repo.buscaCidadePorPK(Integer.valueOf(cidade));
		}
		
		if(!bairro.equals("")){
			bairroFromBD = repo.buscaBairroPorPk(Integer.valueOf(bairro));	
		}
			
		
		if(categoria.equals("p")){
			profissionais  = repo.localizarProfissionais(estadoFromBD.getNome(), cidadeFromBD.getNome(), bairroFromBD.getNome());

		} else if(categoria.equals("f")){
			List<Fornecedor> fornecedores = new ArrayList<>();
			//SELECT APENAS EM FORNECEDORES
			fornecedores = repo.localizarFornecedores(estadoFromBD.getNome(), cidadeFromBD.getNome(), bairroFromBD.getNome());
			if(!fornecedores.isEmpty()){
				for(Fornecedor f : fornecedores){
					if(f.getFoto() != null){
						InputStream baos = new ByteArrayInputStream(f.getFoto());
						ImageIO.read(baos);
						baos.close();
						OutputStream o = new BufferedOutputStream(new FileOutputStream(getServletContext().getRealPath("") + "\\images\\filename"  + f.getCodFornecedor() + ".jpg"));
						o.write(f.getFoto());
						o.flush();
						o.close();
					}
				}
				request.getSession().setAttribute("lista", fornecedores);
				response.sendRedirect("resultado-pesquisa-fornecedor-f.jsp");
				return;
			}
		}

		if(!profissionais.isEmpty()){
			request.getSession().setAttribute("lista", profissionais);
			for(Profissional p : profissionais){
				if(p.getImagem() != null){
					InputStream baos = new ByteArrayInputStream(p.getImagem());
					BufferedImage img = ImageIO.read(baos);
					baos.close();
					OutputStream f = new BufferedOutputStream(new FileOutputStream("C:\\img\\" + p.getId() + ".jpg"));
					f.write(p.getImagem());
					f.flush();
					f.close();
				}
			}
			response.sendRedirect("resultado-pesquisa.jsp");

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
