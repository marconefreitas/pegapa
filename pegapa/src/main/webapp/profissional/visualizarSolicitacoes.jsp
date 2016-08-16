<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Bootstrap -->
	<link href="/pegapa/css/bootstrap.min.css" rel="stylesheet">
	<link href="/pegapa/css/style.css" rel="stylesheet">
	<link href="/pegapa/estilos/estilos.css" rel="stylesheet">
	<link href="/pegapa/estilos/jquery.bxslider.css" rel="stylesheet">
	<link href="/pegapa/estilos/estilo-form.css" rel="stylesheet">

	<!-- Bootstrap select -->
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />

	<title>Solicitações</title>
</head>
</head>
<body>
	<div class="container-fluid" >
		<header class="row header-page" style="display:flex;" >
			<!-- GAMBIARRA NA TAG FIGURE, RETIRAR DEPOIS -->
			<figure style="float:left; padding-right:15px; order:1; position: relative; top: -17px;">
 				<a href="paginaInicial.jsp"><img src="/pegapa/estilos/images/logo_pegapa.png" width="130px;" /></a>
			</figure>
			<div class="welcome" style="width: 82%; order:2">
				<span class="glyphicon glyphicon-user" style="float: right; line-height: 33px;"></span>
				<span style="float:right; height:100%; padding-right: 10px; line-height: 40px;">${prof.nome}</span>
			</div>
		</header>
	
		<div class="row" >
			<c:forEach items="${lista}" var="item" >
				<div role="main" class="well">
					<div class="media">
						<div class="media-body">
							<p>${item.descricaoSolicitacao }</p>
						</div>
					</div>
				</div>
				</c:forEach>
		</div>
	
		<footer class="row footer-page">
	
		</footer>
	</div>
</body>
</html>