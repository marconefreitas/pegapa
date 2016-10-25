<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 				<a href="/pegapa/fornecedor/paginaInicial.jsp"><img src="/pegapa/estilos/images/backlogo.jpg" class="img-logo" /></a>
			</figure>
			<div class="welcome" style="width: 82%; order:2">
				<span class="glyphicon glyphicon-user" style="float: right; line-height: 33px;"></span>
				<span style="float:right; height:100%; padding-right: 10px; line-height: 40px;">${fornec.nomeFantasia}</span>
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
						<a class="breadcrumb-item" href="/pegapa/fornecedor/paginaInicial.jsp">Página Inicial</a> /
  						<span class="breadcrumb-item active">Edição de Dados</span>
					</nav>
					<div class="col-md-9 col-md-offset-1" >
						<form id="form-edit-user" action="/pegapa/ServletFornecedor" method="post" enctype="multipart/form-data" accept-charset="utf-8">
							<input type="hidden" name="edicaoForn" value="S">
									<figure class="img-responsive pull-left" style="width:30%; margin-right:15px">
										<img src="/pegapa/images/filename${fornec.codFornecedor}.jpg" width="100%;" height="227px" id="imgAlteradaForn" style="margin-bottom:21px;"/>
										
										<div class="input-group image-preview">
		                					<input type="text" class="form-control image-preview-filename" disabled="disabled" >
						                	<span class="input-group-btn">
							                    <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
							                        <span class="glyphicon glyphicon-remove"></span> Limpar
							                    </button>
							                    <div class="btn btn-default image-preview-input">
							                        <span class="glyphicon glyphicon-folder-open"></span>
							                        <span class="image-preview-input-title">Selecionar</span>
							                        <input type="file" accept="image/png, image/jpeg" name="imagemFornFisico" id="imagemFornecedor"/> 
							                    </div>
		              						</span>
		            					</div>
									</figure>
									<input type="hidden" value="${fornec.tipoLoja}" id="tipo" />
									<c:if test="${fornec.tipoLoja eq 'Loja Fisica'}">
										<div style="overflow:hidden">
										<span style="float:left; line-height:40px;">
											Tipo de Loja
										</span>
										<div class="btn-group pull-right" data-toggle="buttons" >
											<label class="btn btn-default active" for="pesqF" style="width:50%" >
												<input name="pesq" type="radio" id="pesqF" value="f" >Loja Física
											</label>
											<label class="btn btn-default" for="pesqV" style="width:50%" >
												<input name="pesq" type="radio" id="pesqV" value="v">Loja Virtual
											</label>
										</div>
										</div>
									</c:if>
									
									<c:if test="${fornec.tipoLoja ne 'Loja Fisica'}">
										<div style="overflow:hidden">
											<span style="float:left; line-height:40px;">
												Tipo de Loja
											</span>
											<div class="btn-group pull-right" data-toggle="buttons">
												<label class="btn btn-default " for="pesqF" style="width:50%" >
													<input name="pesq" type="radio" id="pesqF" value="f" >Loja Física
												</label>
												<label class="btn btn-default active" for="pesqV" style="width:50%" >
													<input name="pesq" type="radio" for="pesqV" value="v">Loja Virtual
												</label>
											</div>
										</div>
									</c:if>
									<div class="input-group" style="padding-top:15px;">
										<span class="input-group-addon">Nome Fantasia</span>
										<input type="hidden" name="codForn" value="${fornec.codFornecedor}"/>
										<input type="text" style="min-width: 50%; border-right:0" class="form-control" name="nome" id="nomeFantasia" value="${fornec.nomeFantasia}"/>
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
									
									<br/><br/>
									<div class="input-group" style=" width:67.9%;">
										<div class="label-textarea">Informações sobre Você:</div>
										<textarea class="form-control" rows="5" style="border-radius: 0px 0px" maxlength="300"
										name="descricaoForn" id="descriptionForn" >${fornec.descricaoServicosPrestados}</textarea>
										<label class="red select-error" hidden>Informe uma breve descrição sobre o(s) seu(s) serviços</label>	
									</div>
									<br/><br/>
									<div class="input-group">
										<span class="input-group-addon">CNPJ</span>
										<input type="text" class="form-control" style="border-right:0" data-masc="cnpj" name="cnpj" id="cnpjFornec" value="${fornec.cnpj}"/>
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
									<br/><br/>
									<div class="input-group">
										<span class="input-group-addon">Nome do Responsável</span>
										<input type="text" class="form-control" style="border-right:0" name="nomeResp" id="nomeResp" value="${fornec.nomeResponsavel}" />
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
									<br/><br/>
									<div class="input-group">
										<span class="input-group-addon">CEP</span>
										<input type="text" class="form-control" data-masc="cep" style="border-right:0" name="cep" id="cep" value="${fornec.endereco.cep}" />
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
									<br/><br/>
									<div class="input-group">
										<span class="input-group-addon">Logradouro</span>
										<input type="text" class="form-control" name="rua" style="border-right:0" id="rua" value="${fornec.endereco.rua}" />
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
									<br/><br/>
									<div class="input-group">
										<span class="input-group-addon">Nº</span>
										<input type="text" class="form-control" name="numero" style="border-right:0" id="numero" value="${fornec.endereco.numero}"  />
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
								
									<br/><br/>
									<div class="input-group">
										<span class="input-group-addon">URL</span>
										<input type="text" class="form-control" style="border-right:0"  id="urlForn" name="url" value="${fornec.url}" />
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
									<br/><br/>
									<fieldset class="form-group" style="margin-bottom: 20px;" id="divRamo"> 
										<label class="pull-left">Escolhido anteriormente:</label><span class="pull-right">${fornec.ramoAtuacao}</span>
										<select class="selectpicker" id="ramoAtuacaoFisico"  name="ramoAtuacaoFisico" data-width="100%" >
											<option data-hidden="true" val="None">Ramo de Atuação</option>
											<option value="Telhadista">Telhadista</option>
											<option value="Madeireira">Madeireira</option>
											<option value="Pintura">Pintura</option>
											<option value="Vidraçaria">Vidraçaria</option>
											<option value="Construções em Geral">Construções em Geral</option>
										</select>
										<label class="red select-error" hidden>Escolha um Ramo de Atuação</label>			
									</fieldset>
									<fieldset class="form-group" style="margin-bottom:20px;" id="divEstado">
										<label class="pull-left">Escolhido anteriormente:</label><span class="pull-right">${fornec.estado}</span>
										<select class="selectpicker" id="editar-estado-forn" data-live-search="true" onchange="carregarCidades('forn');"  name="estado_forn" data-width="100%" >
											<option data-hidden="true">Selecione um Estado</option>
										</select>
										<label class="red select-error" hidden>Escolha um Estado</label>	
									</fieldset>
									
									<fieldset class="form-group" style="margin-bottom:20px;" id="divCidade">
										<label class="pull-left">Escolhido anteriormente:</label> <span class="pull-right">${fornec.cidade}</span>
										<select class="selectpicker" id="editar-cidade-forn" data-live-search="true" onchange="carregarBairros('forn');" name="cidade_forn" data-width="100%" >
											<option data-hidden="true">Selecione uma Cidade</option>
										</select>
										<label class="red select-error" hidden>Escolha uma Cidade</label>	
									</fieldset>
								
									<fieldset class="form-group" style="margin-bottom:25px;" id="divBairro">
										<label class="pull-left">Escolhido anteriormente:</label><span class="pull-right">${fornec.bairro}</span>
										<select class="selectpicker" id="editar-bairros-forn" data-live-search="true" name="bairros_forn" data-width="100%" >
											<option data-hidden="true">Selecione um Bairro</option>
										</select>
										<label class="red select-error" hidden>Escolha um Bairro</label>	
									</fieldset>
																		
									<div class="input-group">
										<span class="input-group-addon">Telefone(1)</span>
										<input type="text" class="form-control" name="telForn" id="telForn" data-masc="telefone" value="${fornec.tel1}" />
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
									<br/><br/>
									<div class="input-group">
										<span class="input-group-addon">Telefone(2)</span>
										<input type="text" class="form-control" name="celForn" id="celForn" data-masc="celular" value="${fornec.tel2}" />
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
									<br/><br/>
									<div class="input-group">
										<span class="input-group-addon">Email</span>
										<input type="text" class="form-control"  style="border-right:0" name="emailForn" id="email" value="${fornec.email}" />
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
									<div class="col-md-12" style="padding:15px 0px 15px 0px">
										<button id="" type="button" style="float:right; margin-left:10px;" onclick="alterarDadosFornecedor();" class="btn btn-primary">Alterar</button>
										<button type="button" onclick="" style="float:right;" class="btn btn-warning">Cancelar</button>
									</div>
								</form>

				</div>
			</div>
		<footer class="row footer-page">
		</footer>
	</div>
	

	<script src="/pegapa/javascript/jquery-2.2.3.js"></script> 
	<script src="/pegapa/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/pegapa/javascript/inputMask.js"></script>
	

	<!-- bootstrap select js -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/jquery.validate.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/additional-methods.js"></script>
	
	<!-- Javascripts da aplicação -->
	<script type="text/javascript" src="/pegapa/javascript/usuario.js" charset="utf-8"></script>
	<script type="text/javascript" src="/pegapa/javascript/recursos.js" charset="utf-8"></script>
	<script type="text/javascript" src="/pegapa/javascript/busca.js" charset="utf-8"></script>
	<script type="text/javascript" src="/pegapa/javascript/fornecedor.js" charset="utf-8"></script>
	<script type="text/javascript" src="/pegapa/javascript/validcadastro/validateRegisterProvider.js" charset="utf-8"></script>
	<script>	
	$(document).ready(function(){
		
		$('input[data-masc="cnpj"]').mask("99.999.999/9999-99", {autoclear: false});
		$('input[data-masc="cep"]').mask("99999-999", {autoclear: false});
		$('input[data-masc="telefone"]').mask("(99) 9999-9999", {autoclear: false});
		$('input[data-masc="celular"]').mask("(99) 99999-9999", {autoclear: false});
			
		if($('input#tipo').val() == 'Loja Fisica'){
			$('input[name="pesq"][value="f"]').prop('checked', true);
			desabilitaCampos();
		} else{
			$('input[name="pesq"][value="v"]').prop('checked', true);
			habilitaCampos();
		}
		
		$('label[for="pesqV"]').click(function(){
			$('input[name="pesq"][value="v"]').prop('checked', true);
			habilitaCampos();
		});
		$('label[for="pesqF"]').click(function(){
			$('input[name="pesq"][value="f"]').prop('checked', true);
			desabilitaCampos();
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
				$("#editar-estado-forn").append(options);
				$("#editar-estado-forn").selectpicker('refresh');
			}
		})
		

		
	});
	function habilitaCampos(){
		$('#editar-estado-forn').attr('disabled', true);
		$('#editar-cidade-forn').attr('disabled', true);
		$('#editar-bairros-forn').attr('disabled', true);
		$('#nomeResp').attr('disabled', true);
		$('#nomeResp').next().hide();
		$('#cnpjFornec').attr('disabled', true);
		$('#rua, #numero, #cep, #telForn, #celForn').attr('disabled', true);
		$('#rua, #numero, #cep, #telForn, #celForn').val('');
		$('#rua, #numero, #cep, #telForn, #celForn, #cnpjFornec').next().hide();
		$('#nomeResp, #cnpjFornec').val('');
		
		$('.selectpicker').selectpicker('refresh');
	}
	function desabilitaCampos(){
		$('#editar-estado-forn').attr('disabled', false);
		$('#editar-cidade-forn').attr('disabled', false);
		$('#editar-bairros-forn').attr('disabled', false);
		$('#nomeResp').attr('disabled', false);
		$('#cnpjFornec').attr('disabled', false);
		$('#rua, #numero, #cep, #telForn, #celForn').attr('disabled', false);
		$('#rua, #numero, #cep, #telForn, #celForn, #cnpjFornec, #nomeResp ').next().show();
		$('.selectpicker').selectpicker('refresh');
	}
	
	

	    
	</script>
	<script type="text/javascript" src="/pegapa/javascript/carregarCidades.js" charset="utf-8"></script>
</body>
</html>