package br.com.pegapa.servlet;

import java.io.IOException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.json.JSONObject;

/**
 * Servlet implementation class TesteServlet
 */
@WebServlet("/TesteServlet")
public class TesteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public TesteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
    		throws ServletException, IOException {
    	if(req.getParameter("teste") != null) {
    		teste(req, resp);
    	}
    	if(req.getParameter("recuperaDados") != null){
    		autenticaUser(req, resp);
    	}
    	if(req.getParameter("cadastraUser") != null){
    		cadastrar(req, resp);
    	}
    	if(req.getParameter("testaCon") != null){
    		testaConexao();
    	}
    	
    }
    
    
    public void autenticaUser(HttpServletRequest req, HttpServletResponse resp) {
    	String usuario = req.getParameter("user");
    	String senha = req.getParameter("pass");
    	String perfil = req.getParameter("perfil");
	}


    public void cadastrar(HttpServletRequest req, HttpServletResponse resp){
    	//METODO QUE SALVA O USUARIO
    	
    	//PRIMEIRO DEVE-SE VERIFICR SE JA NAO EXISTE UM E-MAIL CADASTRADO NO BANCO
    	//EM CASO NEGATIVO, EFETUA-SE A OPERACAO DE SALVAR
    }
    
	public void teste(HttpServletRequest request, HttpServletResponse response) throws IOException{
    	if(request.getParameter("teste") != null) {
    		JSONObject json = new JSONObject();
    		json.put("msg", "SUCESSO");
    		
    		response.getWriter().write(json.toString());
    	}
    }
	
	public void testaConexao(){
		try{
			Context initContext = new InitialContext();
			DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/mysql");
			ds.getConnection();
		} catch(Exception e){
			
		}
	}


}
