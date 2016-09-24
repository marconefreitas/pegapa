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
 				<a href="/pegapa/profissional/paginaInicial.jsp" title="Página Inicial"><img src="/pegapa/estilos/images/logo_pegapa.png" width="130px;" /></a>
			</figure>
			<div class="welcome" style="width: 82%; order:2">
				<span class="glyphicon glyphicon-user" style="float: right; line-height: 33px;"></span>
				<span style="float:right; height:100%; padding-right: 10px; line-height: 40px;">${prof.nome}</span>
			</div>
		</header>
	
		<div role="main">
			
			<div class="row" style="margin: 0 auto 15px; width:80%; padding:0">
			<h4>Solicitações Confirmadas</h4>
			<c:forEach items="${listaA}" var="item" >
					
				<div class="row well" style="margin: 0 auto 15px; width:80%; padding:0">
					
					<div class="media" style="padding:19px; width:88%; float:left;" >
						<input type="hidden" id="${item.idSolicitacao}"/>
						<div class="pull-left">
							<img src="/pegapa/estilos/images/emptyuser.png" class="media-object media-icons" height="75px;" width="75px;">
						</div>
						
						<div class="media-body" style="text-align:left; height:75px">
							<h4 class="media-heading" style="float:left;">${item.usuario.nome }</h4>
							<small style="float:right;"><i style="font-style:italic; color: gray;">Solicitado em: ${item.dtFormatada }</i></small>
							<p style="clear:both;">${item.descricaoSolicitacao }</p>
							<address class="ender">Endereço: ${item.usuario.endereco.rua }, ${item.usuario.endereco.numero }, ${item.usuario.cidade}</address>
						</div>
						<div>
							<label style="float:left; margin-top:28px">Seu comentário sobre esta solicitação:</label><textarea rows="" cols="" disabled="s" style="width:100%" >${item.respostaSolicitacao }</textarea>
						</div>
					</div>

				</div>
			</c:forEach>
			<c:forEach items="${listaR}" var="item" >
				<h4>Solicitações Recusadas</h4>
				<div class="row well" style="margin: 0 auto 15px; width:80%; padding:0">
				
					<div class="media" style="padding:19px; width:88%; float:left;" >
						<input type="hidden" id="${item.idSolicitacao}"/>
						<div class="pull-left">
							<img src="/pegapa/estilos/images/emptyuser.png" class="media-object media-icons" height="75px;" width="75px;">
						</div>
						
						<div class="media-body" style="text-align:left; height:75px">
							<h4 class="media-heading" style="float:left;">${item.usuario.nome }</h4>
							<small style="float:right;"><i style="font-style:italic; color: gray;">Solicitado em: ${item.dtFormatada }</i></small>
							<p style="clear:both;">${item.descricaoSolicitacao }</p>
							<address class="ender">Endereço: ${item.usuario.endereco.rua }, ${item.usuario.endereco.numero }, ${item.usuario.cidade}</address>
						</div>
						<div>
							<label style="float:left; margin-top:28px">Seu comentário sobre esta solicitação:</label><textarea rows="" cols="" disabled="s" style="width:100%">${item.respostaSolicitacao }</textarea>
						</div>
					</div>

				</div>
			</c:forEach>
			
		</div>
	
		<footer class="row footer-page">
			
		</footer>
	</div>
	<div class="modal fade" id="modal-solicitacao" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					
				</div>
				<div class="modal-body">
					<textarea style="resize:none" rows="3" cols="74" id="respSolicitacao" placeholder="Insira aqui alguma descrição ou texto que você ache relevante. O seu solicitante receberá esta mensagem por e-mail e na página dele."></textarea>
				</div>
				<div class="btn-group-justified">
					<a href='#' id="button" class='btn btn-primary' onclick="submeterSolicitacao();" role='button'></a>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="/pegapa/javascript/jquery-2.2.3.js"></script>
	<script src="/pegapa/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/pegapa/javascript/profissional.js" async="true" charset="utf-8"></script>
</body>
</html>