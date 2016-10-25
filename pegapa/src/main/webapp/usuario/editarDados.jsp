<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<link rel="shortcut icon" href="/pegapa/icopegapa.png" >
	<!-- Bootstrap select -->
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />

	<title>Alteração de Informações</title>
</head>
<body>

	<div class="container-fluid" >
		<header class="row header-page">
			<!-- GAMBIARRA NA TAG FIGURE, RETIRAR DEPOIS -->
			<figure style="float:left; padding-right:15px; top:1px; position:absolute;">
 				<a href="/pegapa/usuario/paginaInicial.jsp"><img src="/pegapa/estilos/images/backlogo.jpg" class="img-logo" /></a>
			</figure>
			<div class="welcome" style="width: 82%; order:2">
				<span class="glyphicon glyphicon-user" style="float: right; line-height: 33px; padding-right: 10px;" title="${user.nome}"></span>
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
					<nav class="breadcrumb">
						<a class="breadcrumb-item" href="/pegapa/usuario/paginaInicial.jsp">Página Inicial</a> /
  						<span class="breadcrumb-item active">Edição de Dados</span>
					</nav>
					<div class="col-md-8 col-md-offset-2" >
						<form id="form-edit-user" action="/pegapa/ServletUsuario" method="get">
							<input type="hidden" name="confEdicao" value="S">
							
								<div class="input-group">
									<span class="input-group-addon">Nome Completo</span>
									<input type="hidden" name="codUser" value="${user.cod_user}"/>
									<input type="text" style="min-width: 50%; border-right: 0px;" class="form-control" name="nome" id="nomeUsuario" value="${user.nome}"/>
									<span class="input-group-addon" style="background-color:white" ><i></i></span>
								</div>
								<br/><br/>
								<div class="input-group">
									<span class="input-group-addon">CPF</span>
									<input type="text" class="form-control" style="border-right: 0px;" data-masc="cpf" name="cpf" id="cpfUsuario" value="${user.cpf}"/>
									<span class="input-group-addon" style="background-color:white" ><i></i></span>
								</div>
								<br/><br/>
								<div class="input-group">
									<span class="input-group-addon">CEP</span>
									<input type="text" class="form-control" data-masc="cep" style="border-right: 0px;" id="cepUsuario"  name="cep" value="${user.endereco.cep}" />
									<span class="input-group-addon" style="background-color:white" ><i></i></span>
								</div>
								<br/><br/>
								<div class="input-group">
									<span class="input-group-addon">Nº</span>
									<input type="text" class="form-control" name="numero" value="${user.endereco.numero}"  />
								</div>
								<br/><br/>
								<div class="input-group">
									<span class="input-group-addon">Logradouro</span>
									<input type="text" class="form-control" style="border-right: 0px;" id="ruaUsuario" name="rua" value="${user.endereco.rua}" />
									<span class="input-group-addon" style="background-color:white" ><i></i></span>
								</div>
								<br/><br/>
								<fieldset class="form-group" id="fState-edit">
									<label class="pull-left">Escolhido anteriormente:</label><span class="pull-right" id="estadoAnteriorUser">${user.estado}</span>
									<select class="selectpicker" id="editar-estado-user" data-live-search="true" onchange="carregarCidades('user');"  data-width="100%" >
										<option data-hidden="true">Selecione um Estado</option>
									</select>
									<label class="red select-error" hidden>Selecione um Estado</label>
									<input type="hidden" name="estado-user" value="">;
								</fieldset>
								
								<fieldset class="form-group" id="fCity-edit">
									<label class="pull-left">Escolhido anteriormente:</label> <span class="pull-right" id="cidadeAnteriorUser">${user.cidade}</span>
									<select class="selectpicker" id="editar-cidade-user" data-live-search="true" data-width="100%" >
										<option data-hidden="true">Selecione uma Cidade</option>
									</select>
									<label class="red select-error" hidden>Selecione uma Cidade</label>
									<input type="hidden" name="cidade-user" value="">;
								</fieldset>
								
								<br/>
								<div class="input-group">
									<span class="input-group-addon">Telefone(1)</span>
									<input type="text" class="form-control" name="tel" id="telefoneUsuario" data-masc="telefone" style="border-right: 0px;"  value="${user.telefone}" />
									<span class="input-group-addon" style="background-color:white" ><i></i></span>
								</div>
								<br/><br/>
								<div class="input-group">
									<span class="input-group-addon">Telefone(2)</span>
									<input type="text" class="form-control" name="cel" id="celularUsuario" data-masc="celular" style="border-right: 0px;"  value="${user.celular}" />
									<span class="input-group-addon" style="background-color:white" ><i></i></span>
								</div>
								<br/><br/>
								<div class="input-group" >
									<span class="input-group-addon">Email</span>
									<input type="text" class="form-control" name="email" id="emailUsuario" value="${user.email}" style="border-right: 0px;"/>
									<span class="input-group-addon" style="background-color:white" ><i></i></span>
								</div>
							
							<div class="col-md-12" style="padding:15px 0px 15px 0px">
								<button type="button" onclick="" style="float:left;" class="btn btn-warning">Cancelar</button>
								<button id="" type="button" style="float:right;" onclick="alterarDados();" class="btn btn-primary">Alterar</button>
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
	

	<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/jquery.validate.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/additional-methods.js"></script>
	
	<!-- Javascripts da aplicação -->
	<script type="text/javascript" src="/pegapa/javascript/usuario.js" charset="utf-8"></script>
	<script type="text/javascript" src="/pegapa/javascript/recursos.js" charset="utf-8"></script>
	<script type="text/javascript" src="/pegapa/javascript/busca.js" charset="utf-8"></script>
	<script type="text/javascript" src="/pegapa/javascript/carregarCidades.js" charset="utf-8"></script>
	<script type="text/javascript" src="/pegapa/javascript/fornecedor.js" charset="utf-8"></script>
	<script type="text/javascript" src="/pegapa/javascript/validcadastro/validateRegisterProfessional.js" charset="utf-8"></script>
	<script type="text/javascript" src="/pegapa/javascript/validcadastro/validateRegisterProvider.js" charset="utf-8"></script>
	<script type="text/javascript" src="/pegapa/javascript/validcadastro/validateRegisterUser.js" charset="utf-8"></script>
	<script>
		$(document).ready(function(){
			$('input[data-masc="cep"]').mask("99999-999", {autoclear: false});
			$('input[data-masc="telefone"]').mask("(99) 9999-9999", {autoclear: false});
			$('input[data-masc="celular"]').mask("(99) 99999-9999", {autoclear: false});
			$('input[data-masc="cpf"]').mask("999.999.999-99", {autoclear: false});
		});
		
		
		$.ajax({
			url: '/pegapa/SelectServlet',
			method: 'POST',
			data: {carregaEstado:'carregaEstado'},
			success: function(data){
				data = jQuery.parseJSON(data);
				var options = "";
				$.each(data, function(key, value){
					options += "<option value='" + value.cod + "'>" + value.nome + "</option>";
				});
				$("#editar-estado-user").append(options);
				$("#editar-estado-user").selectpicker('refresh');
			}
		})
	</script>
</body>
</html>