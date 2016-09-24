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
	<link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

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
	
		<div role="main">
			<form action="/pegapa/cadastrarProfissional?listarSolic=S" name="visuSolic" method="post" >
				<input type="hidden" name="id" value="${prof.id}"/>
			</form>
			<div class="row" style="margin: 0 auto 15px; width:80%; padding:0; text-align:left">
				<h4 style="text-align:center">Solicitações Recebidas</h4>
				<p>Aqui você poderá entrar em contato com seus solicitantes, aceitar e/ou recusar os pedidos feitos por eles. <br>Lembramos que o ato de
				   aceitar uma solicitação é simbólico e apenas para registro no sistema. Para confirmar realmente esta solicitação você deverá entrar
				   em contato com o usuário pelo telefone (<i class="glyphicon glyphicon-earphone"></i>) fornecido.</p>
				<p>Ao confirmar uma solicitação, será enviado um e-mail para o solicitante juntamente com seu telefone para contato, mas se preferir, você
				   já pode entrar em contato com o solicitante diretamente.</p>
			</div>
			
			<c:if test="${empty lista }">
				<div class="alert alert-warning">
					<span class="glyphicon glyphicon-record"></span> <strong>Atenção</strong>
                	<hr class="message-inner-separator">
					Você não possui solicitações pendentes 
				</div>
			</c:if>
			<c:forEach items="${lista}" var="item" >
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
							<p style="width:50%; float:left;"><i class="glyphicon glyphicon-earphone"> ${item.usuario.telefone}</i>
						</div>
						
					</div>
					<div class="botoes" style="float:right; width:10%;">
						<button type="button" class="btn btn-primary aceitar" onclick="aceitarSolicitacao(${item.idSolicitacao});"><i class="glyphicon glyphicon-ok"></i></button>
						<button type="button" class="btn btn-danger recusar" onclick="recusarSolicitacao(${item.idSolicitacao});"><i class="glyphicon glyphicon-remove"></i></button>
						
					</div>
				</div>
			</c:forEach>
			<div class="modal fade" id="modal-sucesso" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header green-success" style="text-align:center">
							<h2>Solicitação Confirmada<br/>
								<i class="ion-ios-checkmark-outline" aria-hidden="true" style="font-size:75px;"></i>
							</h2>
						</div>
					</div>
				</div>
			</div>
	
			<div class="modal fade" id="modal-recusa" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header red-success" style="text-align:center">
							<h2>Solicitação Recusada<br/>
								<i class="ion-ios-close-outline" aria-hidden="true" style="font-size:75px;"></i>
							</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<footer class="row footer-page">
			
		</footer>
	</div>
	<div class="modal" id="modal-solicitacao" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					
				</div>
				<div class="modal-body">
					<textarea style="resize:none" rows="3" cols="75" id="respSolicitacao" placeholder="Insira aqui alguma descrição ou texto que você ache relevante. O seu solicitante receberá esta mensagem por e-mail e na página dele."></textarea>
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
<!-- 	<script src="https://use.fontawesome.com/b773fb98b0.js"></script>  -->
</body>
</html>