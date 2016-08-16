package br.com.pegapa.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/usuario/*")
public class Filtro implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest requisicao = (HttpServletRequest) request;
		HttpServletResponse resposta = (HttpServletResponse) response;
		
		HttpSession sessao = requisicao.getSession();
		//chain.doFilter(request, response);
		if(sessao.getAttribute("usuarioLogado") != null){
			chain.doFilter(request, response);
		} else{
			resposta.sendRedirect("/pegapa/index.jsp");
		}
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
