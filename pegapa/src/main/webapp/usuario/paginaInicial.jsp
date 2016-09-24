<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Bootstrap -->
	<link href="/pegapa/css/bootstrap.min.css" rel="stylesheet">
	<link href="/pegapa/css/style.css" rel="stylesheet">
	<link href="/pegapa/estilos/estilos.css" rel="stylesheet">
	<link href="/pegapa/estilos/jquery.bxslider.css" rel="stylesheet">
	<link href="/pegapa/estilos/estilo-form.css" rel="stylesheet">

	

	<!-- Bootstrap select -->
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />

	<title>Página Inicial</title>
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
				<span style="float:right; height:100%; padding-right: 10px; line-height: 40px;">${user.nome}</span>
			</div>
		</header>
	
		<div class="row" style="margin-bottom: 0">
			<div role="main">
				<input type="hidden" value="${user.cod_user}" id="cod">
				
				<div class="container dynamicTile">
					<div class="row" style="background-color: 000000;">
						<a onclick="retornarDadosParaEdicao();" style="cursor:pointer;">
							<form action="/pegapa/ServletUsuario" method="get" name="edit">
								<input type="hidden" value="S" name="editarUsuario"/>
								<input type="hidden" value="${user.cod_user}" id="cod" name="codUser">
								<div class="col-sm-4 col-xs-4" >
									<div id="tile1" class="tile">
										<span >Editar Dados</span>
										<div class="main-icon"><i class="glyphicon glyphicon-cog"></i> </div>
									</div>
								</div>
							</form>
						</a>
						<a href="#" onclick="visualizarSolicitacoesUsuario();">
							<form action="/pegapa/ServletUsuario" method="post" name="visualizarSolicUser">
							<input type="hidden" value="${user.cod_user}" name="codUser">
							<input type="hidden" value="S" name="visualiz"/>
								<div class="col-sm-4 col-xs-4">
									<div id="tile2" class="tile">
										<span>Visualizar Solicitações de Profissionais</span>
									</div>
								</div>
							</form>
						</a>
						<a href="#" onclick="visualizarSolicitacoesDeFornecedores();">
							<form action="/pegapa/ServletUsuario" method="post" name="visualizarSolicForn">
							<input type="hidden" value="${user.cod_user}" name="codUser">
							<input type="hidden" value="S" name="visualizForn"/>
								<div class="col-sm-4 col-xs-4">
									<div id="tile2" class="tile">
										<span>Visualizar Solicitações de Fornecedores</span>
									</div>
								</div>
							</form>
						</a>
						<a href="#" onclick="logoutUser();">
							<div class="col-sm-4 col-xs-4">
								<div id="tile3" class="tile">
									<form action="/pegapa/ServletUsuario?sair=S" style="height: 100%;" name="logout-user" method="post">
										<span>Sair</span>
										<div class="main-icon"><i class="glyphicon glyphicon-off"></i></div>
									</form>
								</div>
							</div>
						</a>
						
					</div>
				</div>
			
			</div>
			<section class="row" role="application" style="background-color: #ffa500; margin-bottom:0; padding-bottom:0;">
				<jsp:include page="../localizar.jsp" flush="true"></jsp:include>
			</section>
		</div>
		<footer class="row footer-page">
		</footer>
	</div>
	

	<script type="text/javascript" src="/pegapa/javascript/inputMask.js"></script>

	<script type="text/javascript" src="/pegapa/javascript/jquery.bxslider.js"></script>
	

	
	<!-- Javascripts da aplicação -->
	<script type="text/javascript" src="/pegapa/javascript/usuario.js" charset="utf-8"></script>
	<script type="text/javascript" src="/pegapa/javascript/recursos.js" charset="utf-8"></script>
	<script type="text/javascript" src="/pegapa/javascript/busca.js" charset="utf-8"></script>
	<script type="text/javascript" src="/pegapa/javascript/profissional.js" charset="utf-8"></script>
<!-- 	<script src="https://use.fontawesome.com/b773fb98b0.js"></script> -->
</body>
</html>