<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Bootstrap select -->
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />

</head>
<body>
	<div class="sub-section container-fluid" style="background-color: #ffa500;">
					
						
						<div class="row" >
							<span style="font-family: Tahoma; font-size:1.875em; color:white; ">Encontre o profissional ou fornecedor adequado para você:</span>
						</div>
						<div class="row">
								
							<label for="tipo" class="control-label input-group" style="margin-left:15px;">Estou Buscando</label>
				
							<div class="col-md-12">
								<div class="btn-group" data-toggle="buttons" style="width:100%">
									<label class="btn btn-default" style="width:50%" id="prof">
										<input name="pesq" type="radio" value="p" checked="s">Profissional / Fornecedor(com endereço físico)
									</label>
									<label class="btn btn-default" style="width:50%">
										<input name="pesq" type="radio" value="f">Fornecedor(com endereço virtual)
									</label>
								</div>
							</div>
						</div>

						
						<div class="row search-box-professional" id="pesquisa-normal">
							<form name="localizar-profissional" method="get" action="/pegapa/LocalizarServlet">
							<input type="hidden" name="localizar" value="localizar">
							<div class="col-md-1" style="height:64px; padding-right:0"><span style="font-size: 1.3em; line-height: 40px;text-align: right">Pesquisar</span></div>
							<div class="col-md-3" style="border: none">
								<select class="selectpicker" id="localiza-estado" data-live-search="true" name="localiza-estado" data-width="100%" >
									<option data-hidden="true">Selecione um Estado</option>
								</select>
							</div>
							<div class="col-md-3" style="border: none">
								<select class="selectpicker" id="localiza-cidade" data-live-search="true" name="localiza-cidade" data-width="100%" >
									<option data-hidden="true">Selecione uma Cidade</option>
								</select>
							</div>
							<div class="col-md-2" style=" border: none">
								<select class="selectpicker" id="localiza-bairros" data-live-search="true" name="localiza-bairros" data-width="100%" >
									<option data-hidden="true">Selecione um Bairro</option>
								</select>
							</div>
							
							<div class="col-md-2" style="border: none">
								<select class="selectpicker" id="categoria-buscada" name="categoria-buscada" data-width="100%" >
									<option value="p">Profissional</option>
									<option value="f">Fornecedor</option>
								</select>
							</div>
							<div class="col-md-1" style=" border: none">
								<button type="submit" id="buscar"  onclick="buscar();" class="btn orange"><i class="fa fa-search" aria-hidden="true"></i></button>
							</div>
							</form>
						</div>
						
						<div class="row search-box-professional" hidden id="pesquisa-forn-virtual">
							<form  name="localizar-fornecedor-virtual" method="get" action="/pegapa/LocalizarServlet">
							<input type="hidden" name="localizarFornecVirt" value="localizarFornecVirt">
							<div class="col-md-1 col-md-offset-1" style="height:64px; padding-right:0"><span style="font-size: 1.3em; line-height: 40px;text-align: right">Pesquisar</span></div>
							<div class="col-md-7" style="border: none">
								<select class="selectpicker" id="ramoAtuacao"  name="ramoAtuacao" data-width="100%" >
									<option value="">Ramo de Atuação</option>
									<option value="Telhadista">Telhadista</option>
									<option value="Madeireira">Madeireira</option>
									<option value="Pintura">Pintura</option>
									<option value="Vidraçaria">Vidraçaria</option>
									<option value="Construções em Geral">Construções em Geral</option>
								</select>
							</div>
							<div class="col-md-1" style=" border: none">
								<button type="submit" id="buscar" class="btn orange"><i class="fa fa-search" aria-hidden="true"></i></button>
							</div>
							</form>
						</div>
						
					
				</div>

<script type="text/javascript" src="/pegapa/javascript/jquery-2.2.3.js"></script>
<script type="text/javascript" src="/pegapa/javascript/inputMask.js"></script>
<script src="/pegapa/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/pegapa/javascript/jquery.bxslider.js"></script>

<!-- bootstrap select js -->
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/jquery.validate.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/additional-methods.js"></script>


<!-- Javascripts da aplicação -->
<script type="text/javascript" src="/pegapa/javascript/usuario.js" charset="utf-8"></script>
<!-- <script type="text/javascript" src="/pegapa/javascript/recursos.js" charset="utf-8"></script> -->
<script type="text/javascript" src="/pegapa/javascript/busca.js" charset="utf-8"></script>
<!-- <script type="text/javascript" src="javascript/profissional.js" charset="utf-8"></script> -->

<script type="text/javascript">
$(document).ready(function(){
	$('input[value="p"]').prop("checked", true);
	$('input[name="pesq"]').change(function(){
		$('#pesquisa-forn-virtual').toggle();
		$('#pesquisa-normal').toggle();
	})
	
	$('#prof').addClass("active");
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
			$("#estado-user, #estado-prof ,#localiza-estado, #estado-forn").append(options);
			$(".selectpicker").selectpicker('refresh');
		}
	
	});
	
});

</script>


</body>
</html>