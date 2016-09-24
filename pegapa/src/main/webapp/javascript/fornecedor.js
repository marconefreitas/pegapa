function isFornVirtual(){
	return $('input[name="pesq"][value="v"]').prop('checked');
}

function criaPopoverDeErro(pop){
	$(pop).popover({
		trigger : 'click',
		placement: 'left',
		content: 'Este campo é Obrigatório',
	})
	$(pop).popover('enable');
	pop
	  .removeClass('green')
	  .removeClass('glyphicon glyphicon-thumbs-up')
	  .addClass('glyphicon glyphicon-thumbs-down')
	  .addClass('red');
}


function removePopoverDeErro(pop, elemento){
	pop.removeClass('red')
	   .removeClass('glyphicon glyphicon-thumbs-down')
	   .addClass('glyphicon glyphicon-thumbs-up')
	   .addClass('green');

	$(elemento).next().find('.popover').popover('disable');
	$(elemento).next().find('.popover').remove();
}
$('#nomeFantasia').blur(function(){
	var pop = $(this).closest('.input-group').find('i');

	if($(this).val().length == 0){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
})

$('#nomeResp, #email, #rua, #numero ').blur(function(){
	var pop = $(this).closest('.input-group').find('i');

	if($(this).val().length == 0 & !isFornVirtual()){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
})

$('#cnpjFornec').blur(function(){
	var pop = $(this).closest('.input-group').find('i');
	var tiraTudoQueNaoForDigito = /[^\d]+/g;
	var cnpj = $(this).val().replace(tiraTudoQueNaoForDigito, "");
	if(cnpj.length < 14 && !isFornVirtual()){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
});

$('#cep').blur(function(){
	var pop = $(this).closest('.input-group').find('i');
	var tiraTudoQueNaoForDigito = /[^\d]+/g;
	var cep = $(this).val().replace(tiraTudoQueNaoForDigito, "");
	if(cep.length < 8 && !isFornVirtual()){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
});


$('#urlForn').blur(function(){
	var pop = $(this).closest('.input-group').find('i');

	if($(this).val().length == 0 && isFornVirtual()){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
})

$('#divRamo').on('blur', 'button[data-id="ramoAtuacaoFisico"]', function(){
	var error = $(this).closest('.form-group').find('.red');

	if($('#ramoAtuacaoFisico option:selected').text() == 'Ramo de Atuação'){
		$(error).attr('hidden', false);
		$(this).attr('validated',false);
		return;
	} else{
		$(error).attr('hidden', true);
	}
	$(this).attr('validated',true);
})

$('#divEstado').on('blur', 'button[data-id="editar-estado-forn"]', function(){
	var error = $(this).closest('.form-group').find('.red');

	if($('#editar-estado-forn option:selected').text() == 'Selecione um Estado' && !isFornVirtual()){
		$(error).attr('hidden', false);
		$(this).attr('validated',false);
		return;
	} else{
		$(error).attr('hidden', true);
	}
	$(this).attr('validated',true);
})

$('#divCidade').on('blur', 'button[data-id="editar-cidade-forn"]', function(){
	var error = $(this).closest('.form-group').find('.red');

	if($('#editar-cidade-forn option:selected').text() == 'Selecione uma Cidade' && !isFornVirtual()){
		$(error).attr('hidden', false);
		$(this).attr('validated',false);
		return;
	} else{
		$(error).attr('hidden', true);
	}
	$(this).attr('validated',true);
})

$('#divBairro').on('blur', 'button[data-id="editar-bairros-forn"]', function(){
	var error = $(this).closest('.form-group').find('.red');

	if($('#editar-bairros-forn option:selected').text() == 'Selecione um Bairro' && !isFornVirtual()){
		$(error).attr('hidden', false);
		$(this).attr('validated',false);
		return;
	} else{
		$(error).attr('hidden', true);
	}
	$(this).attr('validated',true);
});

$('#telForn, #celForn').blur(function(){
	var pop = $(this).closest('.input-group').find('i');
	var tiraTudoQueNaoForDigito = /[^\d]+/g;
	var tel = $(this).val().replace(tiraTudoQueNaoForDigito, "");
	if(tel.length < 10  && !isFornVirtual()){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
});


$("#ativa-cadastrar-fornecedor").click(function(){
	$('#modal-cadastro-fornecedor').modal('toggle');
	
});

$('input[name="tipo"]').change(function(){
	$("#modal-cadastro-fornecedor .alert").hide();
	if($(this).val() == "Loja Fisica"){
		$('section[name="lojaVirtual"]').hide();
		$('section[name="lojaFisica"]').show();
	} else{
		$('section[name="lojaVirtual"]').show();
		$('section[name="lojaFisica"]').hide();
	}
});

$('#estado-forn').on("change", function(){
	executaPesquisaCidade('codigoEstadoForn');
});

$('#cidade-forn').on("change", function(){
	executaPesquisaBairro('codigoCidadeForn');
});

$('#cepFornecedor').blur(function(e){
	e.preventDefault();
	var url = 'http://cep.republicavirtual.com.br/web_cep.php?cep=';
	var cep = $(this).val();
	var formato = 'json';
	
	url = url + cep + '&formato=' + formato;
	
	$.ajax({
		url: url,
		method: 'POST',
		success :  function (data){
			console.log(data.resultado);
			$('#ruaFornecedor').removeAttr('disabled').val(data.logradouro);
			$('#numeroFornecedor').focus();
		}
	});
});


$('#cadastrarFornecedorFisico').click(function(e){
	$("#modal-cadastro-fornecedor .alert").hide();
	e.preventDefault();
	//fazer as validações de fornecedor de loja fisica aqui
	
	var senha  = $("#senhaFornecedorFisico").val();
	var confirmaSenha = $("#confirmSenhaFornecedorFisico").val();
	if(senha != confirmaSenha){
		alert("As senhas informadas não conferem.")
		return;
	} else{
		
		if($('#nomeFantasia').val() == ""){
			alert("Nome Fantasia não pode ser vazio");
			return;
		}
		if($('#cnpjForn').val() == ""){
			alert("Cnpj nao pode ser vazio");
			return;
		}
		
		if($('#ramoAtuacao option:selected').val() == "None"){
			alert('Escolha um ramo de atuação');
			return;
		}
		
		var tiraTudoQueNaoForDigito = /[^\d]+/g;
		
		var telForn = $("#telefoneFornecedor").val().replace(tiraTudoQueNaoForDigito, "");
		var celForn = $("#celularFornecedor").val().replace(tiraTudoQueNaoForDigito, "");
		var cep = $('#cepFornecedor').val().replace(tiraTudoQueNaoForDigito, "");
		
		var cnpj = $('#cnpjForn').val().replace(tiraTudoQueNaoForDigito, "");
		
		$('#cnpjForn').val(cnpj);
		$("#telefoneFornecedor").val(telForn);
		$("#celularFornecedor").val(celForn);
		$("#cepFornecedor").val(cep);

		if($("#estado-forn option:selected").text() == "Escolha um Estado"){
			alert("Escolha um Estado");
			return;
		}
		
		//TODO Acrescentar obrigatoriedade aqui embaixo
		if($("#cidade-forn option:selected").text() == "Escolha uma Cidade"){
			alert("Escolha uma Cidade");
			return;
		}
		
		
		if($("#bairros-forn option:selected").text() == "Selecione um Bairro"){
			alert("Selecione um Bairro");
			return;
		}
		$('#ramoAtuacaoFisico').val($('#ramoAtuacaoFisico option:selected').val())
		
		var image;
		$('#imagemFornFisico').change(function(e){
			image = new FormData();
			image.append('imagemFornFisico', e.target.files[0]);
		})
		
		var form = new FormData($('#formFornecedor')[0]);
		form.append('estadoForn', $("#estado-forn option:selected").text());
		form.append('cidadeForn', $("#cidade-forn option:selected").text());
		form.append('bairrosForn', $("#bairros-forn option:selected").text());
		submeterCadastroFornecedor(form);
	}
});

$('#cadastrarFornecedorVirtual').click(function(e){
	$("#modal-cadastro-fornecedor .alert").hide();
	e.preventDefault();
	//fazer as validações de fornecedor de loja fisica aqui
	
	var senha  = $("#senhaFornecedorVirt").val();
	var confirmaSenha = $("#confirmSenhaFornVirt").val();
	if(senha != confirmaSenha){
		alert("As senhas informadas não conferem.")
		return;
	} else{
		
		if($('#nomeFantasiaVirt').val() == ""){
			alert("Nome Fantasia não pode ser vazio");
			return;
		}
		
		if($('#urlVirt').val() == ""){
			alert('URL não pode ser vazia');
			return;
		}
		if($('#ramoAtuacaoVirt option:selected').val() == "None"){
			alert('Escolha um ramo de atuação');
			return;
		}
		
		//var tiraTudoQueNaoForDigito = /[^\d]+/g;
		
		$('#ramoAtuacaoVirtual').val($('#ramoAtuacaoVirtual option:selected').val())
		
		var image;
		$('#imagemFornVirtual').change(function(e){
			image = new FormData();
			image.append('imagemFornVirtual', e.target.files[0]);
		})
		var form = new FormData($('#formFornecedor')[0]);
		submeterCadastroFornecedor(form);
	}
});


function submeterCadastroFornecedor(form){
	
	$.ajax({

		url: "/pegapa/ServletFornecedor",
		data: form,
		processData : false,
		contentType: false,
		method: 'POST',
		success :  function (data){
			var result = $.parseJSON(data);
			if(result.sucesso){
				console.log("sucesso");
				$("#modal-cadastro-fornecedor .alert").removeClass('alert-danger');
				$("#modal-cadastro-fornecedor .alert").addClass("alert-success").text(result.sucesso).css("display", "block");
				//cancelaTudo('modal-cadastro-profissional');
			} else if(result.erro){
				console.log("erro");
				$("#modal-cadastro-fornecedor .alert").removeClass('alert-success');
				$("#modal-cadastro-fornecedor .alert").addClass("alert-danger").text(result.erro).css("display", "block");
			}
		}
	});
}
$('#modal-cadastro-fornecedor').on('hidden.bs.modal', function(){
	 $(this).find('form')[0].reset();
	 $('section[name="lojaVirtual"]').hide();
	$('section[name="lojaFisica"]').hide();
});


$("#login-fornecedor").on("click", function(event){

	var email = $('input[name="usernameFornecedor"]').val();
	
	var senha = $('input[name="passwordFornecedor"]').val();
	
	if(email == ""){
		alert('Email nao pode ser vazio');
		return; 
	}
	if(senha == ""){
		alert('Senha nao pode ser vazio');
		return;
	}
	$.ajax({
		url: "/pegapa/ServletFornecedor",
		dataType: 'json',
		data: {
			login:'s',
			usernameFornecedor: email,
			passwordFornecedor: senha
		},
		method: 'POST',
		success :  function (data){
			console.log(data);
			if(data){
				$(location).attr('href','/pegapa/fornecedor/paginaInicial.jsp');
			} else{
				$('#divErroForn').toggle();
			}
		}
	});
})

//A PARTIR DAQUI SERÃO FUNCIONALIDADES APÓS FAZER O LOGIN
function editarFornecedor(){
	$('form[name="editForn"]').submit();
}

function alterarDadosFornecedor(){

	var validate = true;
	$('#nomeFantasia, #cnpjFornec, #nomeResp, #cep, #rua, #numero, #url, #telForn, #celForn, #email').each(function(){
		$(this).blur();
		if($(this).attr('validated') == "false"){
			 validate = false;
		 }
	});
	
	var ramoAtuacaoPValidar = $('button[data-id="ramoAtuacaoFisico"]').blur();
	if($(ramoAtuacaoPValidar).attr('validated') == "false"){
		validate = false;
	}
	
	var estadoPValidar = $('button[data-id="editar-estado-forn"]').blur();
	if($(estadoPValidar).attr('validated') == "false"){
		validate = false;
	}
	
	var cidadePValidar = $('button[data-id="editar-cidade-forn"]').blur();
	if($(cidadePValidar).attr('validated') == "false"){
		validate = false;
	}
	
	var bairroPValidar = $('button[data-id="editar-bairros-forn"]').blur();
	if($(bairroPValidar).attr('validated') == "false"){
		validate = false;
	}
	
	if(!validate){
		return;
	}
	
	var image;
	$('#imagemFornecedor').change(function(e){
		if( $('#imagemFornecedor').val() != ""){
			image = new FormData();
			image.append('imagemFornFisico', e.target.files[0]);
		}
	})
	
	var ramoAtuacao = $('#ramoAtuacaoFisico option:selected').text();
	var estado = $("#editar-estado-forn option:selected").text();
	var cidade =  $("#editar-cidade-forn option:selected").text();
	var bairro =  $("#editar-bairros-forn option:selected").text();
	$("#editar-estado-forn option:selected").val(estado);
	$("#editar-cidade-forn option:selected").val(cidade);
	$("#editar-bairros-forn option:selected").val(bairro);
	$('#ramoAtuacaoFisico option:selected').val(ramoAtuacao);
	
	if( $('#imagemFornecedor').val() == ""){
		 $('#imagemFornecedor').remove();
	}
	alert('submit Ok');
	$('#form-edit-user').submit();
}


$('#imagemFornecedor, #imagemFornecedorVirtual').change(function(){
	var file = this.files[0];
	var reader = new FileReader();
	reader.onload = function(e){
		$('.img-responsive').find('img').attr('src', e.target.result);
		$(".image-preview-filename").val(file.name); 
	}
	reader.readAsDataURL(file);
  
})

function alterarDadosFornecedorVirtual(){
	if($("#nomeFantasia_v").val() == ""){
		alert("Informe um nome");
		return;
	}
	
	if($("#url_v").val() == ""){
		alert("Informe uma URL");
		return;
	}
	
	if($("#ramoAtuacao_v option:selected").text() == "Ramo de Atuação"){
		alert("Informe um ramo de atuação");
		return;
	}
	
	if($("#email_v").val() == ""){
		alert("O campo e-mail não pode ser vazio.");
		return;
	}
	
	if( $('#imagemFornecedorVirtual').val() == ""){
		 $('#imagemFornecedorVirtual').remove();
	}
//	var form = new FormData($('#form-edit-user-virtual')[0]);
	$('#form-edit-user-virtual').submit();
}

function recuperaFornecedorLojaFisica(fornecedorFoto, id){
	if($('#logged').val() == "sim"){
		var photo = $(fornecedorFoto).attr('src');
		$.ajax({
			url: "LocalizarServlet",
			dataType: 'json',
			data: {
				allFornec:'s',
				id: $(fornecedorFoto).attr('id')
			},
			method: 'POST',
			success :  function (data){
				data.photo = photo;
				console.log(data);
				montaModalFornecedorFisico(data);
			}
		});
	} else{
		$('#not-logged').modal();
	}
	
}

function montaModalFornecedorFisico(data){
	limpaModaisAntigas();
	var figure = $('<figure>').addClass('figure-prof')
	  .append($('<img>').attr('src', data.photo));

	var textArea = $('<textarea>').addClass('form-control')
		  .addClass('commentText')
		  .addClass('pull-right')
		  .attr('id', data.codFornecedor + 'txArea')
		  .attr('placeholder' , 'Insira aqui uma pequena descrição da sua solicitação. Max : 200 caracteres')
		  .attr('maxlength', '200');
	
	if(data.url == undefined){
		data.url = "Não informado";
	}
	var divConteudoModal =  $("<div>").addClass("conteudo-profissional")
	  .append("<b>Email: </b>" + data.email + "<br/>")
	  .append("<b>Bairro : </b>" + data.bairro + "<br/>")
	  .append("<b>CEP :</b> " + data.endereco.cep + "<br/>")
	  .append("<b>Endereço Web :</b> " + data.url + "<br/>")
	  .append("<hr/>")
	  .append('<b>Descrição :</b>')
	  .append(textArea);
	
	
	var divAntesComments;
	if(data.comentarios){
		
		var divAntesComments = $("<div>").addClass("clear")
		.html('Comentários');
		
		$.each(data.comentarios, function(i, item){
			var div = $('<div>').css( {"padding-top": "5px", "overflow": 'hidden'});
			var span = $("<span>").addClass('span-right')
			.html(item.nomeSolicitante);
			
			var textArea = $('<textarea>').addClass('form-control')
			.addClass('commentText')
			.attr('disabled', 'disabled')
			.html(item.descricao);
			
			divAntesComments.append(div.append(textArea).append(span));
		});
		
	}
	
	
	var fieldset = $('<fieldset>').addClass('form-group')
	 .css("width", "68%")
	 .css("float", "right")
	 .append(divConteudoModal);
	
	
	var divModalBody = $("<div>").addClass("modal-body").append(fieldset)
	.append(figure)
	.append(divAntesComments);
	
	var divBotaoEnviarSolicitacao = $("<div>").attr("id", "enviarSolicitacao")
	.addClass("btn-group btn-group-justified")
	.attr("role", "group")
	.append("<a href='#' class='btn orange' role='button'>Enviar Solicitação</a>")
	.attr("onclick", "enviaSolicitacaoFornecedorFisico(" + data.codFornecedor + ")");


	var divModalHeader = $("<div>").addClass("modal-header").css('background-color', '#C0C0C0').html('<span style="text-align:center"><b>' + data.nomeFantasia + '</span>');

	var divModalContent = $("<div>").addClass("modal-content")
	.append(divModalHeader)
	.append(divModalBody)
	.append(divBotaoEnviarSolicitacao);


	var divModalDialog = $("<div>").addClass("modal-dialog")
	.attr("id", "box-profissional")
	.attr("role", "dialog")
//	.on('hidden', function(){$(this).remove();})
	.append(divModalContent);


	var divModalFade = $("<div>").addClass("modal fade")
	.attr("id", "box")
	.attr("name", "box")
	.append(divModalDialog);
	divModalFade.modal("show");
}
function montaModalFornecedorVirtual(data){
	limpaModaisAntigas();
	var figure = $('<figure>').addClass('figure-prof')
	  .append($('<img>').attr('src', data.photo));

	var textArea = $('<textarea>').addClass('form-control')
		  .addClass('commentText')
		  .addClass('pull-right')
		  .attr('id', data.codFornecedor + 'txArea')
		  .attr('placeholder' , 'Insira aqui uma pequena descrição da sua solicitação. Max : 200 caracteres')
		  .attr('maxlength', '200');
	
	
	var divConteudoModal =  $("<div>").addClass("conteudo-profissional")
	  .append("<b>Email: </b>" + data.email + "<br/>")
	  .append("<b>Endereço Web :</b> " + data.url + "<br/>")
	  .append("<hr/>")
	  .append('<b>Descrição :</b>')
	  .append(textArea);
	
	var divAntesComments;
	if(data.comentarios){
		
		var divAntesComments = $("<div>").addClass("clear")
		.html('Comentários');
		
		$.each(data.comentarios, function(i, item){
			var div = $('<div>').css( {"padding-top": "5px", "overflow": 'hidden'});
			var span = $("<span>").addClass('span-right')
			.html(item.nomeSolicitante);
			
			var textArea = $('<textarea>').addClass('form-control')
			.addClass('commentText')
			.attr('disabled', 'disabled')
			.html(item.descricao);
			
			divAntesComments.append(div.append(textArea).append(span));
		});
		
	}
	
	var fieldset = $('<fieldset>').addClass('form-group')
	 .css("width", "68%")
	 .css("float", "right")
	 .append(divConteudoModal);
	
	
	var divModalBody = $("<div>").addClass("modal-body").append(fieldset)
	.append(figure)
	.append(divAntesComments);
	
	var divBotaoEnviarSolicitacao = $("<div>").attr("id", "enviarSolicitacao")
	.addClass("btn-group btn-group-justified")
	.attr("role", "group")
	.append("<a href='#' class='btn orange' role='button'>Enviar Solicitação</a>")
	.attr("onclick", "enviaSolicitacaoFornecedorFisico(" + data.codFornecedor + ")");


	var divModalHeader = $("<div>").addClass("modal-header").css('background-color', '#C0C0C0').html('<span style="text-align:center"><b>' + data.nomeFantasia + '</span>');

	var divModalContent = $("<div>").addClass("modal-content")
	.append(divModalHeader)
	.append(divModalBody)
	.append(divBotaoEnviarSolicitacao);


	var divModalDialog = $("<div>").addClass("modal-dialog")
	.attr("id", "box-profissional")
	.attr("role", "dialog")
//	.on('hidden', function(){$(this).remove();})
	.append(divModalContent);


	var divModalFade = $("<div>").addClass("modal fade")
	.attr("id", "box")
	.attr("name", "box")
	.append(divModalDialog);
	divModalFade.modal("show");
}

function enviaSolicitacaoFornecedorFisico(cod){
	
	var descricaoSolic;
	descricaoSolic = $('#' + cod + 'txArea').val();

	
	if(descricaoSolic == ""){
		alert('Descrição da solicitação não pode estar vazio.');
		return;
	}
	
	$.ajax({
		
		url: "/pegapa/ServletUsuario",
		data: {
			solicitar : 'S',
			id : cod,
			desc : descricaoSolic,
			nomeServico: 'VAZIO'
		},
		method: 'POST',
		success :  function (data){
			var json = $.parseJSON(data);
			$('#box').modal('hide');
			$('#msgSucesso').show();
			$('.modal-header').html(json.sucesso);
			//var result = $.parseJSON
		}
	});
}

function visualizarSolicitacoesPerfilFornecedor(){
	$("form[name='visuSolicFornecedor']").submit();
}

function recuperaFornecedorLojaVirtual(fornecedorFoto){
	if($('#logged').val() == "sim"){
		var photo = $(fornecedorFoto).attr('src');
		$.ajax({
			url: "LocalizarServlet",
			dataType: 'json',
			data: {
				allFornec:'s',
				id: $(fornecedorFoto).attr('id')
			},
			method: 'POST',
			success :  function (data){
				data.photo = photo;
				console.log(data);
				montaModalFornecedorVirtual(data);
			}
		});
	} else{
		$('#not-logged').modal();
	}
}
function historicoSolicitacaoFornecedor(){
	$("form[name='visuHistoricoForn']").submit();
}

