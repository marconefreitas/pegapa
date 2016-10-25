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

	pop.popover('hide');
	pop.remove();
	var i = $('<i>').addClass('glyphicon glyphicon-thumbs-up')
	   		.addClass('green');
	$(elemento).next().append(i);
}
$('#nomeFantasia, #email').blur(function(){
	var pop = $(this).closest('.input-group').find('i');

	if($(this).val().length == 0){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
})

$('#nomeResp, #rua, #numero ').blur(function(){
	var pop = $(this).closest('.input-group').find('i');

	if($(this).val().length == 0 & !isFornVirtual()){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
})

$('#descriptionForn').on( 'blur', function(){
	var error = $(this).closest('.input-group').find('.red');

	if($(this).val() == ''){
		$(error).attr('hidden', false);
		$(this).attr('validated',false);
		return;
	} else{
		$(error).attr('hidden', true);
	}
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

$('input[name="tipo"]').click(function(){
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

	var validate = true;
	$('#nomeFantasia, #cnpjForn, #descriptionProv, #respName, #cepFornecedor, #ruaFornecedor, #telefoneFornecedor, #celularFornecedor, #senhaFornecedorFisico, #confirmSenhaFornecedorFisico').each(function(){
		$(this).blur();
		if($(this).attr('validated') == "false"){
			 validate = false;
		 }
	});
	
	$.ajax({
		url: "/pegapa/ServletFornecedor",
		async: false,
		data:{
			email: $('#emailFornecedor').val(),
			validaEmail : 'S'
		},
		method: 'POST',
		success :  function (data){
			var pop = $('#emailFornecedor').closest('.input-group').find('i');
			if(data == "true"){
				$('#emailFornecedor').on('blur');
				$('#emailFornecedor').attr('validated', true);
				removePopoverDeErro(pop, $('#emailFornecedor'));
			}
			else{
				validate = false;
				criaPopoverDeErroComMsg(pop, 'Este e-mail já existe. Por favor, informe outro.');
				$('#emailFornecedor').attr('validated', false);
				$('#emailFornecedor').off('blur');
			}
			
		}
	});
	
	
	var atuacaoPValidar = $('button[data-id="ramoAtuacaoFisico"]').blur();
	if($(atuacaoPValidar).attr('validated') == "false"){
		validate = false;
	}
	
	var estadoPValidar = $('button[data-id="estado-forn"]').blur();
	if($(estadoPValidar).attr('validated') == "false"){
		validate = false;
	}
	
	var cidadePValidar = $('button[data-id="cidade-forn"]').blur();
	if($(cidadePValidar).attr('validated') == "false"){
		validate = false;
	}
	
	var bairroPValidar = $('button[data-id="bairros-forn"]').blur();
	if($(bairroPValidar).attr('validated') == "false"){
		validate = false;
	}
	
	if($('.image-preview-filename').val() == ""){
		$('#label-erro-foto-prov-f').show();
		return;
	}
	if(!validate){
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

});

$('#cadastrarFornecedorVirtual').click(function(e){
	$("#modal-cadastro-fornecedor .alert").hide();
	e.preventDefault();
	//fazer as validações de fornecedor de loja VIRTUAL aqui
	
	var validate = true;
	$('#nomeFantasiaVirt, #urlVirt, #descriptionProvVirt, #emailFornecedorVirt, #senhaFornecedorVirt, #confirmSenhaFornVirt').each(function(){
		$(this).blur();
		if($(this).attr('validated') == "false"){
			 validate = false;
		 }
	});
	
	var atuacaoPValidar = $('button[data-id="ramoAtuacaoVirt"]').blur();
	if($(atuacaoPValidar).attr('validated') == "false"){
		validate = false;
	}
	
	if($('#provVirt').val() == ""){
		$('#label-erro-foto-virt').show();
		return;
	}else{
		$('#label-erro-foto-virt').hide();
	}
	
	$.ajax({
		url: "/pegapa/ServletFornecedor",
		async: false,
		data:{
			email: $('#emailFornecedorVirt').val(),
			validaEmail : 'S'
		},
		method: 'POST',
		success :  function (data){
			var pop = $('#emailFornecedorVirt').closest('.input-group').find('i');
			if(data == "true"){
				$('#emailFornecedorVirt').on('blur');
				$('#emailFornecedorVirt').attr('validated', true);
				removePopoverDeErro(pop, $('#emailFornecedor'));
			}
			else{
				validate = false;
				criaPopoverDeErroComMsg(pop, 'Este e-mail já existe. Por favor, informe outro.');
				$('#emailFornecedorVirt').attr('validated', false);
				$('#emailFornecedorVirt').off('blur');
			}
			
		}
	});
	if(!validate){
		return;
	}

	$('#ramoAtuacaoVirtual').val($('#ramoAtuacaoVirtual option:selected').val())

	var image;
	$('#imagemFornVirtual').change(function(e){
		image = new FormData();
		image.append('imagemFornVirtual', e.target.files[0]);
	})
	var form = new FormData($('#formFornecedor')[0]);
	submeterCadastroFornecedor(form);

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
	$('#nomeFantasia, #cnpjFornec, #nomeResp, #cep, #rua, #numero, #url, #telForn, #celForn, #email, #descriptionForn').each(function(){
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
		var photo = $(fornecedorFoto).find('img[name="photo"]');
		$.ajax({
			url: "LocalizarServlet",
			dataType: 'json',
			data: {
				allFornec:'s',
				id: $(photo).attr('id')
			},
			method: 'POST',
			success :  function (data){
				data.photo = $(photo).attr('src');
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
	  .append($('<img>').attr('src', data.photo).css('height', '215px'));

	
	var cabecalhoTextArea = $('<div>').addClass('label-textarea')
	  .html("Descrição da sua solicitação:");

	
	
	
	var textArea = $('<textarea>').addClass('form-control')
		  .addClass('commentText')
		  .addClass('pull-right')
		  .attr('id', data.codFornecedor + 'txArea')
		  .attr('placeholder' , 'Insira aqui uma pequena descrição da sua solicitação. Max : 200 caracteres')
		  .attr('maxlength', '200');
	
	var descricaoProfissional = $('<div>').addClass('input-group')
	  .addClass('input-custom-group')
	  .append(cabecalhoTextArea)
	  .append(textArea);
	
	if(data.url == undefined){
		data.url = "Não informado";
	}
	
	var abreTagLabel = "<label style='font-weight:normal;'>";
	var fechaTagLabel = "</label>";

	var notaProfissional  = "Não Definida";
	if(data.avaliacao){
		notaProfissional = data.avaliacao;
	}
	
	var divConteudoModal =  $("<div>").addClass("conteudo-profissional")
									  .css('float', 'left')
									  .append("<label for='mail'>Email:</label> <br/>")
									  .append("<label>Bairro:</label><br/>")
									  .append("<label>CEP: </label><br/>")
									  .append("<label>Endereço WEB: </label> <br/>")
									  .append("<label>Avaliação no Sistema: </label> <br/>")
									  .append("<hr/>");
	
	var divConteudoModal1 = $("<div>").css('float', 'left')
				.append('<label id="mail" style="font-weight:normal;">' + data.email + fechaTagLabel)
				.append('</br>')
				.append(abreTagLabel + data.bairro + fechaTagLabel)
				.append('</br>')
				.append(abreTagLabel + data.endereco.cep + fechaTagLabel)
				.append('</br>')
				.append(abreTagLabel + data.url + fechaTagLabel)
				.append('</br>')
				.append(abreTagLabel + notaProfissional + fechaTagLabel);
	
	
	
	var divAntesComments = "";
	if(data.comentarios.length > 0){
		
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
	
	
	/* ------------------------ INICIO BLOCKQUOTE ------------------------ */
	var blockquote = $('<pre>').css("white-space", "normal")
							   .css('min-height', '175px')
							   .html(data.descricaoServicosPrestados);
	
	
	
	
	
	/* ------------------------ FIM BLOCKQUOTE ------------------------ */
	
	var fieldset = $('<fieldset>').addClass('form-group')
	 .css("width", "68%")
	 .css("float", "right")
	 .append(blockquote)
	 .append(divConteudoModal)
	 .append(divConteudoModal1);
	
	
	var divModalBody = $("<div>").addClass("modal-body").append(fieldset)
	.append(fieldset)
	.append(figure)
	.append(descricaoProfissional)
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
	.css("width", "60%")
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
	  .append($('<img>').attr('src', data.photo).css('height', '215px'));

	var textArea = $('<textarea>').addClass('form-control')
		  .addClass('commentText')
		  .addClass('pull-right')
		  .attr('id', data.codFornecedor + 'txArea')
		  .attr('placeholder' , 'Insira aqui uma pequena descrição da sua solicitação. Max : 200 caracteres')
		  .attr('maxlength', '200');
	var cabecalhoTextArea = $('<div>').addClass('label-textarea')
	  .html("Descrição da sua solicitação:");
	
	var descricaoProfissional = $('<div>').addClass('input-group')
												.addClass('input-custom-group')
												.append(cabecalhoTextArea)
												.append(textArea);
	
	
	/* ------------   MONTA AS DUAS DIVS QUE MOSTRAM AS INFORMAÇÕES DOS PROFISSIONAIS -------------*/
	var notaProfissional  = "Não Definida";
	if(data.avaliacao != undefined){
		notaProfissional = data.avaliacao;
	}
	
	var abreTagLabel = "<label style='font-weight:normal;'>";
	var fechaTagLabel = "</label>";
	
	var divConteudoModal =  $("<div>").addClass("conteudo-profissional")
										.css('float', 'left')  
										.append("<label for='mail'>Email: </label><br/>")
										.append("<label>Endereço Web :</label> <br/>")
										.append("<label>Avaliação no Sistema :</label>")
										.append("<hr/>")
										
	
	var divConteudoModal1 = $("<div>").css('float', 'left')
	.append('<label id="mail" style="font-weight:normal;" >' + data.email + fechaTagLabel)
	.append('</br>')
	.append(abreTagLabel + data.url + fechaTagLabel)
	.append('</br>')
	.append(abreTagLabel + notaProfissional + fechaTagLabel)
	.append('</br>')
	

	/* ---------------------------------------------------   FIM  ---------------------------------------------------------*/
	var divAntesComments;
	if(data.comentarios.length > 0){
		
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
	
	
	
	
	/* ------------------------ INICIO BLOCKQUOTE ------------------------ */
	var blockquote = $('<pre>').css("white-space", "normal")
							   .css('min-height', '175px')
							   .html(data.descricaoServicosPrestados);
	
	
	
	
	
	/* ------------------------ FIM BLOCKQUOTE ------------------------ */
	
	
	var fieldset = $('<fieldset>').addClass('form-group')
	 								.css("width", "68%")
	 								.css("float", "right")
	 								.append(blockquote)
	 								.append(divConteudoModal)
									.append(divConteudoModal1);
	
	var divModalBody = $("<div>").addClass("modal-body")
									.append(fieldset)
									.append(figure)
									.append(descricaoProfissional)
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
	.css("width", "60%")
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
		alert('Descrição da solicitação é obrigatorio.');
		return;
	}
	
	$.ajax({
		
		url: "/pegapa/ServletUsuario",
		data: {
			solicitar : 'S',
			id : cod,
			desc : descricaoSolic,
			nomeServico: 'VAZIO',
			email: $('#mail').text()
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
		var photo = $(fornecedorFoto).find('img[name="photo"]');
		$.ajax({
			url: "LocalizarServlet",
			dataType: 'json',
			data: {
				allFornec:'s',
				id: $(photo).attr('id')
			},
			method: 'POST',
			success :  function (data){
				data.photo = $(photo).attr('src');
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

