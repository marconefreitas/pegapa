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

	<title>Alteração de Informações</title>
</head>
<body>

	<div class="container-fluid" >
		<header class="row header-page">
			<!-- GAMBIARRA NA TAG FIGURE, RETIRAR DEPOIS -->
			<figure style="float:left; padding-right:15px; top:1px; position:absolute;">
 				<a href="paginaInicial.jsp"><img src="/pegapa/estilos/images/logo_pegapa.png" width="130px;" /></a>
			</figure>
			<div class="welcome" style="width: 82%; order:2">
				<span class="glyphicon glyphicon-user" style="float: right; line-height: 33px;"></span>
				<span style="float:right; height:100%; padding-right: 10px; line-height: 40px;">${user.nome}</span>
			</div>
			
		</header>
	
			<div role="main">
				<c:if test="${not empty sucesso}">
					<div class="alert alert-success alert-dismissible fade in" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
   							<span aria-hidden="true">&times;</span>
 						</button>
  							<strong>${sucesso}</strong>
					</div>
				</c:if>
				<div class="container">
					<div class="row" >
						<form id="form-edit-user" action="../ServletUsuario" method="get">
							<input type="hidden" name="confEdicao" value="S">
							<fieldset class="form-group" style="max-width: 65%;">
								<div class="input-group">
									<span class="input-group-addon">Nome Completo</span>
									<input type="hidden" name="codUser" value="${user.cod_user}"/>
									<input type="text" style="min-width: 50%;" class="form-control" name="nome" id="nomeUsuario" value="${user.nome}"/>
								</div>
								<br/><br/>
								<div class="input-group">
									<span class="input-group-addon">CPF</span>
									<input type="text" class="form-control" data-masc="cpf" name="cpf" id="cpfUsuario" value="${user.cpf}"/>
								</div>
								<br/><br/>
								<div class="input-group">
									<span class="input-group-addon">Rua</span>
									<input type="text" class="form-control" name="rua" value="${user.endereco.rua}" />
								</div>
								<br/><br/>
								<div class="input-group">
									<span class="input-group-addon">Nº</span>
									<input type="text" class="form-control" name="numero" value="${user.endereco.numero}"  />
								</div>
								<br/><br/>
								<div class="input-group">
									<span class="input-group-addon">CEP</span>
									<input type="text" class="form-control" name="cep" value="${user.endereco.cep}" />
								</div>
								<br/><br/>
								<div class="input-group">
									<span class="input-group-addon">Estado</span>
									<input type="text" class="form-control" name="estado" value="${user.estado}" />
								</div>
								<br/><br/>
								<div class="input-group">
									<span class="input-group-addon">Cidade</span>
									<input type="text" class="form-control" name="cidade" value="${user.cidade}" />
								</div>
								<br/><br/>
								<div class="input-group">
									<span class="input-group-addon">Telefone(1)</span>
									<input type="text" class="form-control" name="tel" value="${user.telefone}" />
								</div>
								<br/><br/>
								<div class="input-group">
									<span class="input-group-addon">Telefone(2)</span>
									<input type="text" class="form-control" name="cel" value="${user.celular}" />
								</div>
								
							</fieldset>
							<div class="row">
								<button type="button" onclick=""class="btn btn-warning">Cancelar</button>
								<button id="" type="submit" onclick="alterarDados();" class="btn btn-primary">Alterar</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		<footer class="row footer-page">
		</footer>
	</div>
	

	<script src="/pegapa/javascript/jquery-2.2.3.js"></script> 
	<script src="/pegapa/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/pegapa/javascript/inputMask.js"></script>
	

	
	<!-- Javascripts da aplicação -->
	<script type="text/javascript" src="/pegapa/javascript/usuario.js" charset="utf-8"></script>
	<script type="text/javascript" src="/pegapa/javascript/recursos.js" charset="utf-8"></script>
	<script type="text/javascript" src="/pegapa/javascript/busca.js" charset="utf-8"></script>
	
</body>
</html>