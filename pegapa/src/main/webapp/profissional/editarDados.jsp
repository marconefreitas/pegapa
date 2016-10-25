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
 				<a href="/pegapa/profissional/paginaInicial.jsp"><img src="/pegapa/estilos/images/backlogo.jpg" class="img-logo" /></a>
			</figure>
			<div class="welcome" style="width: 82%; order:2">
				<span class="glyphicon glyphicon-user" style="float: right; line-height: 33px;"></span>
				<span style="float:right; height:100%; padding-right: 10px; line-height: 40px;">${prof.nome}</span>
			</div>
			
		</header>
	
			<div role="main" style="min-width:600px;">
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
						<a class="breadcrumb-item" href="/pegapa/profissional/paginaInicial.jsp">Página Inicial</a> /
  						<span class="breadcrumb-item active">Edição de Dados</span>
					</nav>
					<div class="col-md-8 col-md-offset-2" >
						<form id="form-edit-prof" action="/pegapa/cadastrarProfissional" method="post" enctype="multipart/form-data" accept-charset="utf-8">
							<input type="hidden" name="confEdicao" value="S">
								<figure class="img-responsive pull-left" style="width:30%; margin-right:15px">
									<img src="/pegapa/images/filename${prof.id}.jpg" width="100%;" height="227px" id="imgAlteracaoProf" style="margin-bottom:21px;"/>
									
									<div class="input-group image-preview" style="margin-top:8px;">
	                					<input type="text" class="form-control image-preview-filename" disabled="disabled" >
					                	<span class="input-group-btn">
						                    <div class="btn btn-default image-preview-input">
						                        <span class="glyphicon glyphicon-folder-open"></span>
						                        <span class="image-preview-input-title">Selecionar</span>
						                        <input type="file" accept="image/png, image/jpeg" name="imagemProfissional" id="imagemProfissional"/> 
						                    </div>
	              						</span>
	            					</div>
								</figure>
								<div class="input-group">
									<span class="input-group-addon">Nome Completo</span>
									<input type="hidden" name="codProf" value="${prof.id}"/>
									<input type="text" style="min-width: 50%; border-right: 0px;" class="form-control" name="nome" id="nameProfessional" value="${prof.nome}"/>
									<span class="input-group-addon" style="background-color:white" ><i></i></span>
								</div>
								<br/><br/>
								<div class="input-group">
									<span class="input-group-addon">CPF</span>
									<input type="text" class="form-control" data-masc="cpf" name="cpf" data-masc="cpf" id="cpfProf" style="border-right: 0px" value="${prof.cpf}"/>
									<span class="input-group-addon" style="background-color:white" ><i></i></span>
								</div>
								<br/><br/>
								<div class="input-group" style=" width:67.9%;">
									<div class="label-textarea">Informações sobre Você:</div>
									<textarea class="form-control" rows="5" style="border-radius: 0px 0px" name="descricao" id="descriptionProf" >${prof.descricaoProfissao}</textarea>
									<label class="red select-error" hidden>Informe uma breve descrição sobre o(s) seu(s) trabalhos</label>	
								</div>
								<br/><br/>
								<div class="input-group">
									<span class="input-group-addon">Logradouro</span>
									<input type="text" class="form-control" name="rua" id="streetProf" style="border-right: 0px" value="${prof.endereco.rua}" />
									<span class="input-group-addon" style="background-color:white" ><i></i></span>
								</div>
								<br/><br/>
								<div class="input-group">
									<span class="input-group-addon">Nº</span>
									<input type="text" class="form-control" name="numero" style="border-right: 0px" id="numberProf" value="${prof.endereco.numero}"  />
									<span class="input-group-addon" style="background-color:white" ><i></i></span>
								</div>
								<br/><br/>
								<div class="input-group">
									<span class="input-group-addon">CEP</span>
									<input type="text" class="form-control" name="cep" style="border-right: 0px" data-masc="cep" id="cepProf" value="${prof.endereco.cep}" />
									<span class="input-group-addon" style="background-color:white" ><i></i></span>
								</div>
								<br/><br/>
								<div class="input-group">
									<span class="input-group-addon">Anos de Experiência</span>
									<input type="text" class="form-control" id="aExp" style="border-right: 0px" name="aExp" value="${prof.anosExperiencia}"  />
									<span class="input-group-addon" style="background-color:white;" ><i></i></span>
								</div>
								<br/><br/>
								<div class="input-group">
									<span class="input-group-addon">Meses de Experiência</span>
									<input type="text" class="form-control" id="mExp" style="border-right: 0px" name="mExp"  value="${prof.mesesExperiencia}" />
									<span class="input-group-addon" style="background-color:white" ><i></i></span>
								</div>
								<br/><br/>
								<fieldset class="form-group" id="fProfession">
									<label class="pull-left">Escolhido anteriormente:</label><span class="pull-right" id="estadoAnteriorProf">${prof.ocupacao}</span>
									<select class="selectpicker" id="ocupacao" data-live-search="true" name="ocupacao" data-width="100%" >
										<option value="N">Escolha uma Ocupação</option>
										<option value="Pintor">Pintor</option>
										<option value="Pedreiro">Pedreiro</option>
										<option value="Marceneiro">Marceneiro</option>
										<option value="Serralheiro">Serralheiro</option>
										<option value="Vidraceiro">Vidraceiro</option>
										<option value="Outro">Outro</option>
									</select>
									<label class="red select-error" hidden>Selecione uma Ocupação</label>
								</fieldset>
								<fieldset class="form-group" id="fState">
									<label class="pull-left">Escolhido anteriormente:</label><span class="pull-right" id="estadoAnteriorProf">${prof.estado}</span>
									<select class="selectpicker" id="editar-estado-prof" data-live-search="true" onchange="carregarCidades('prof');"  name="estado-prof" data-width="100%" >
										<option data-hidden="true">Selecione um Estado</option>
									</select>
									<label class="red select-error" hidden>Selecione um Estado</label>
								</fieldset>
								
								<fieldset class="form-group" id="fCity">
									<label class="pull-left">Escolhido anteriormente:</label> <span class="pull-right" id="cidadeAnteriorProf">${prof.cidade}</span>
									<select class="selectpicker" id="editar-cidade-prof" data-live-search="true" onchange="carregarBairros('prof');" name="cidade-prof" data-width="100%" >
										<option data-hidden="true">Selecione uma Cidade</option>
									</select>
									<label class="red select-error" hidden>Selecione uma Cidade</label>
								</fieldset>
								
								<fieldset class="form-group" id="fNeighborhood">
									<label class="pull-left">Escolhido anteriormente:</label><span class="pull-right" id="bairroAnteriorProf">${prof.bairro}</span>
									<select class="selectpicker" id="editar-bairros-prof" data-live-search="true" name="bairros-prof" data-width="100%" >
										<option data-hidden="true">Selecione um Bairro</option>
									</select>
									<label class="red select-error" hidden>Selecione um Bairro</label>
								</fieldset>
								<div class="input-group">
									<span class="input-group-addon">Telefone(1)</span>
									<input type="text" class="form-control" name="tel" style="border-right: 0px" data-masc="telefone" id="phone1"  value="${prof.telefone}" />
									<span class="input-group-addon" style="background-color:white" ><i></i></span>
								</div>
								<br/>
								<div class="input-group">
									<span class="input-group-addon">Telefone(2)</span>
									<input type="text" class="form-control" name="cel" style="border-right: 0px" data-masc="celular" id="phone2"   value="${prof.celular}" />
									<span class="input-group-addon" style="background-color:white" ><i></i></span>
								</div>
								<br/>

								<div class="input-group" >
									<span class="input-group-addon">Email</span>
									<input type="text" class="form-control" name="email" id="mailProf" value="${prof.email}" />
									<span class="input-group-addon" style="background-color:white" ><i></i></span>
								</div>
								
							
							<div class="col-md-12" style="padding:15px 0px 15px 0px">
								<button id="" type="button" style="float:right; margin-left:10px;" onclick="confirmarAlteracaoDadosProfissional();" class="btn btn-primary">Alterar</button>
								<button type="button" onclick="" style="float:right;" class="btn btn-warning">Cancelar</button>
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
	<script type="text/javascript" src="/pegapa/javascript/profissional.js" charset="utf-8"></script>
	<script type="text/javascript" src="/pegapa/javascript/carregarCidades.js" charset="utf-8"></script>
	<script type="text/javascript" src="/pegapa/javascript/validarProfissional.js" charset="utf-8"></script>
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/jquery.validate.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/additional-methods.js"></script>
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
				$("#editar-estado-prof").append(options);
				$("#editar-estado-prof").selectpicker('refresh');
			}
		})
	</script>
</body>
</html>