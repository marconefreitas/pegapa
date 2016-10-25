<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Bootstrap -->
	<link href="/pegapa/css/normalize.css" rel="stylesheet">
	<link href="/pegapa/css/bootstrap.min.css" rel="stylesheet">
	<link href="/pegapa/css/style.css" rel="stylesheet">
	<link href="/pegapa/estilos/estilos.css" rel="stylesheet">
	<link href="/pegapa/estilos/jquery.bxslider.css" rel="stylesheet">
	<link href="/pegapa/estilos/estilo-form.css" rel="stylesheet">
	<link rel="shortcut icon" href="/pegapa/icopegapa.png" >
	<link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	<!-- Bootstrap select -->
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />

	<title>Página Inicial</title>
</head>
<body  >

	<div class="container-fluid" >
		<header class="row header-page" style="display:flex;" >
			<!-- GAMBIARRA NA TAG FIGURE, RETIRAR DEPOIS -->
			<figure style="float:left; padding-right:15px; order:1; position: relative; top: -17px;">
 				<a href="paginaInicial.jsp"><img src="/pegapa/estilos/images/backlogo.jpg" class="img-logo" /></a>
			</figure>
			<div class="welcome" style="width: 82%; order:2">
				<span class="glyphicon glyphicon-user" style="float: right; line-height: 33px;" title="${prof.nome}"></span>
				<span class="name-header">${prof.nome}</span>
			</div>
		</header>
	
		<div class="row" >
				<div role="main" style="min-height:505px;">
					<input type="hidden" value="${prof.id}" id="cod">
					
					<div class="container dynamicTile">
					<div class="row" style="background-color: 000000; ">
						<a href="#" onclick="editarDadosProfissional();">
							<form action="/pegapa/cadastrarProfissional" method="get" name="formEditProf">
								<input type="hidden" value="S" name="editarProf"/>
								<input type="hidden" value="${prof.id}" name="codProfissional">
								<div class="col-sm-3 col-xs-6">
									<div id="tile1" class="tile">
										<span class="title-span">Editar Dados</span>
										<figure class="view main-icon" title="Editar Dados">
											<i class="glyphicon glyphicon-cog"></i> 
										</figure>
									</div>
								</div>
							</form>
						</a>
						<a href="#" onclick="visualizarSolicitacoes();">
							<div class="col-sm-3 col-xs-6">
								<form action="/pegapa/cadastrarProfissional?listarSolic=S" name="visuSolic" method="post" >
									<div id="tile2" class="tile">
										<input type="hidden" name="id" value="${prof.id}"/>
										<span class="title-span">Visualizar Solicitações</span>
										<figure class="view" title="Visualizar Solicitações">
											<img src="/pegapa/estilos/images/tp_user/liste.png" class="img-lista-solicitacoes">
										 </figure>
									</div>
								</form>
							</div>
						</a>
						<a href="#" onclick="historicoSolicitacao();">
							<div class="col-sm-3 col-xs-6">
								<form action="/pegapa/cadastrarProfissional?historicoSolic=S" name="historicoSolic" method="post" >
									<div id="tile2" class="tile">
										<input type="hidden" name="id" value="${prof.id}"/>
										<span class="title-span">Histórico de Solicitações</span>
										<figure class="view" title="Histórico de Solicitações">
											<img src="/pegapa/estilos/images/tp_user/img3.png" class="historico-solicitacoes">
										 </figure>
									</div>
								</form>
							</div>
						</a>
						<a href="#" onclick="listarServicos();">
							<div class="col-sm-3 col-xs-6">
								<form action="/pegapa/cadastrarProfissional?listarServicos=S" name="lServicos" method="post" >
									<div id="tile2" class="tile">
										<input type="hidden" name="id" value="${prof.id}"/>
										<span class="title-span">Portfólio de Serviços</span>
										<figure class="main-icon view" style="padding-top:20px;" title="Portfólio de Serviços">
											<i class="ion-clipboard"></i>
										</figure> 
									</div>
								</form>
							</div>
						</a>
						<a href="#" onclick="logoutUser();">
							<div class="col-sm-3 col-xs-12">
								<div id="tile3" class="tile">
									<form action="/pegapa/ServletUsuario?sair=S" name="logout-user" style="height: 100%;" method="post">
										<span class="title-span">Sair</span>
										<figure class="main-icon view" title="Sair">
											<i class="glyphicon glyphicon-off" style="font-size:80px;"></i>
										</figure>
									</form>
								</div>
							</div>
						</a>
						
						
					</div>
				</div>
				</div>
		</div>
	
		<footer class="row footer-page" style="min-height: 75px;">
	
		</footer>
	</div>
	<script type="text/javascript" src="../javascript/jquery-2.2.3.js"></script>
	<script type="text/javascript" src="../javascript/inputMask.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	
		<!-- Javascripts da aplicação -->
	<script type="text/javascript" src="/pegapa/javascript/usuario.js" charset="utf-8"></script>
	<script type="text/javascript" src="/pegapa/javascript/recursos.js" charset="utf-8"></script>
	<script type="text/javascript" src="/pegapa/javascript/busca.js" charset="utf-8"></script>
	<script type="text/javascript" src="/pegapa/javascript/profissional.js" charset="utf-8"></script>
	
	<!-- bootstrap select js -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/jquery.validate.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/additional-methods.js"></script>
</body>
</html>