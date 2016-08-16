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
import br.com.pegapa.entity.Profissional;
import br.com.pegapa.repository.OutrosRepositorios;
import br.com.pegapa.repository.ProfissionalRepositorio;

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
    	if(request.getParameter("cod") != null){
			selecionarProfissional(request, response);
		} else if(request.getParameter("coment") != null){
			recuperarComentario(request, response);
		}
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
		if(req.getParameter("localizar") != null){
			localizarProfissional(req, resp);
		} else if(req.getParameter("img")!= null ){
			recuperaFoto(req, resp);
		}
	}
	
	public void localizarProfissional(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String estado = request.getParameter("localiza-estado") == "Selecione um estado" ? "" : request.getParameter("localiza-estado");
		String cidade = request.getParameter("localiza-cidade") == "Selecione uma cidade"? "" : request.getParameter("localiza-cidade");
		String bairro = request.getParameter("localiza-bairros");
		String categoria =  request.getParameter("categoria-buscada");
		
		List<Profissional> profissionais = new ArrayList<Profissional>();
		Bairro bairroFromBD = repo.buscaBairroPorPk(Integer.valueOf(bairro));
		Estado estadoFromBD = repo.buscaPorPK(Short.valueOf(estado));
		Cidade cidadeFromBD = repo.buscaCidadePorPK(Integer.valueOf(cidade));
		
		if(categoria.equals("t")){
			//SELECIONA PROFISSIONAIS E FORNECEDORES
			repo.localizarPessoas(estadoFromBD.getNome(), cidadeFromBD.getNome());
		} else if(categoria.equals("p")){
			//SELECT APENAS EM PROFISSIONAIS
			profissionais  = repo.localizarProfissionais(estadoFromBD.getNome(), cidadeFromBD.getNome(), bairroFromBD.getNome());

		} else if(categoria.equals("f")){
			//SELECT APENAS EM FORNECEDORES
			repo.localizarFornecedores(estado, cidade);
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
