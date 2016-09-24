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
				<span style="float:right; height:100%; padding-right: 10px; line-height: 40px;">${fornec.nomeFantasia}</span>
			</div>
		</header>
	
		<div class="row" >
				<div role="main">
					<input type="hidden" value="${fornec.codFornecedor}" id="cod">
					
					<div class="container dynamicTile">
					<div class="row" style="background-color: 000000;">
						<a href="#" onclick="editarFornecedor();" style="cursor:pointer;">
							<form action="/pegapa/ServletFornecedor" method="get" name="editForn">
								<input type="hidden" value="S" name="editarFornec"/>
								<input type="hidden" value="${fornec.codFornecedor}" id="cod" name="codFornecedor">
								<div class="col-sm-4 col-xs-4">
									<div id="tile1" class="tile">
										<span>Editar Dados</span>
										<div class="main-icon"><i class="glyphicon glyphicon-cog"></i> </div>
									</div>
								</div>
							</form>
						</a>
						<a href="#" onclick="visualizarSolicitacoesPerfilFornecedor();">
							<div class="col-sm-4 col-xs-4">
								<form action="/pegapa/ServletFornecedor?listarSolicForn=S" name="visuSolicFornecedor" method="post" >
									<div id="tile2" class="tile">
										<input type="hidden" name="id" value="${fornec.codFornecedor}"/>
										<span>Visualizar Solicitações</span>
									</div>
								</form>
							</div>
						</a>
						<a href="#" onclick="historicoSolicitacaoFornecedor();">
							<div class="col-sm-4 col-xs-4">
								<form action="/pegapa/ServletFornecedor?historicoSolic=S" name="visuHistoricoForn" method="post" >
									<div id="tile2" class="tile">
										<input type="hidden" name="id" value="${fornec.codFornecedor}"/>
										<span>Histórico de Solicitações</span>
									</div>
								</form>
							</div>
						</a>

						<a href="#" onclick="logoutUser();">
							<div class="col-sm-4 col-xs-4">
								<div id="tile3" class="tile">
									<form action="/pegapa/ServletUsuario?sair=S" name="logout-user" style="height: 100%;" method="post">
										<span>Sair</span>
										<div class="main-icon"><i class="glyphicon glyphicon-off"></i></div>
									</form>
								</div>
							</div>
						</a>
						
						
					</div>
				</div>
				</div>
		</div>
	
		<footer class="row footer-page">
	
		</footer>
	</div>
	<script type="text/javascript" src="../javascript/jquery-2.2.3.js"></script>
	<script type="text/javascript" src="../javascript/inputMask.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	
	<!-- bootstrap select js -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/jquery.validate.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/additional-methods.js"></script>
		<!-- Javascripts da aplicação -->
	<script type="text/javascript" src="/pegapa/javascript/usuario.js" charset="utf-8"></script>
	<script type="text/javascript" src="/pegapa/javascript/recursos.js" charset="utf-8"></script>
	<script type="text/javascript" src="/pegapa/javascript/busca.js" charset="utf-8"></script>
	<script type="text/javascript" src="/pegapa/javascript/fornecedor.js" charset="utf-8"></script>
	
</body>
</html>