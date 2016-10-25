$('#nomeUsuario, #emailUsuario, #ruaUsuario').blur(function(){
	var pop = $(this).closest('.input-group').find('i');

	if($(this).val().length == 0){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
})


$('#cpfUsuario').on( 'blur', function(){
	var pop = $(this).closest('.input-group').find('i');
	var tiraTudoQueNaoForDigito = /[^\d]+/g;
	var cpf = $(this).val().replace(tiraTudoQueNaoForDigito, "");
	if(cpf.length < 11 ){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
});

$('#cepUsuario').on('blur', function(e){
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
			$('#ruaUsuario').val(data.logradouro);
		}
	});
});

$('#cepUsuario').on('blur', function(e){

	var pop = $(this).closest('.input-group').find('i');
	var tiraTudoQueNaoForDigito = /[^\d]+/g;
	var cep = $(this).val().replace(tiraTudoQueNaoForDigito, "");
	if(cep.length < 8 ){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
	
});



$('#fState-user').on('blur', 'button[data-id="estado-user"]', function(){
	var error = $(this).closest('.form-group').find('.red');

	if($('#estado-user option:selected').text() == 'Escolha um Estado'){
		$(error).attr('hidden', false);
		$(this).attr('validated',false);
		return;
	} else{
		$(error).attr('hidden', true);
	}
	$(this).attr('validated',true);
})

$('#fState-edit').on('blur', 'button[data-id="editar-estado-user"]', function(){
	var error = $(this).closest('.form-group').find('.red');

	if($('#editar-estado-user option:selected').text() == 'Selecione um Estado'){
		$(error).attr('hidden', false);
		$(this).attr('validated',false);
		return;
	} else{
		$(error).attr('hidden', true);
	}
	$(this).attr('validated',true);
})

$('#fCity-user').on('blur', 'button[data-id="cidade"]', function(){
	var error = $(this).closest('.form-group').find('.red');

	if($('#cidade option:selected').text() == 'Selecione uma Cidade'){
		$(error).attr('hidden', false);
		$(this).attr('validated',false);
		return;
	} else{
		$(error).attr('hidden', true);
	}
	$(this).attr('validated',true);
})

$('#fCity-edit').on('blur', 'button[data-id="editar-cidade-user"]', function(){
	var error = $(this).closest('.form-group').find('.red');

	if($('#editar-cidade-user option:selected').text() == 'Selecione uma Cidade'){
		$(error).attr('hidden', false);
		$(this).attr('validated',false);
		return;
	} else{
		$(error).attr('hidden', true);
	}
	$(this).attr('validated',true);
})


$('#telefoneUsuario').on('blur', function(){
	var pop = $(this).closest('.input-group').find('i');
	var tiraTudoQueNaoForDigito = /[^\d]+/g;
	var tel = $(this).val().replace(tiraTudoQueNaoForDigito, "");
	if(tel.length < 10 ){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
});

$('#celularUsuario').on('blur',function(){
	var pop = $(this).closest('.input-group').find('i');
	var tiraTudoQueNaoForDigito = /[^\d]+/g;
	var tel = $(this).val().replace(tiraTudoQueNaoForDigito, "");
	if(tel.length < 11 ){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
});

$('#senhaUsuario').on('blur', function(){
	var pop = $(this).closest('.input-group').find('i');
	if($(this).val().length == 0 ){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
});

$('#confirmSenhaUsuario').blur( function(){
	var pop = $(this).closest('.input-group').find('i');
	if($(this).val() != $('#senhaUsuario').val() || $(this).val() == ''){
		criaPopoverDeErroComMsg(pop, 'Este campo é Obrigatório e deve ser igual a senha informada acima.');
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
});


$("#ativa-cadastrar-usuario").click(function(){
	$('#modal-cadastro-usuario').modal();
});

$('#cadastrarUsuario').on("click", function(event){

	var validate = true;
	$('#nomeUsuario, #emailUsuario, #ruaUsuario, #cpfUsuario, #cepUsuario, #telefoneUsuario, #celularUsuario, #senhaUsuario, #confirmSenhaUsuario ').each(function(){
		$(this).blur();
		if($(this).attr('validated') == "false"){
			 validate = false;
		 }
	});

	var estadoPValidar = $('button[data-id="estado-user"]').blur();
	if($(estadoPValidar).attr('validated') == "false"){
		validate = false;
	}
	
	var cidadePValidar = $('button[data-id="cidade"]').blur();
	if($(cidadePValidar).attr('validated') == "false"){
		validate = false;
	}
	if(!validate){
		$('#nomeUsuario').focus();
		return;
	}
	
	$.ajax({
		url: "ServletUsuario",
		data:  {
			cadastra: "cadastra",
			nome : $("#nomeUsuario").val(),
			cpf	: $("#cpfUsuario").val(),
			logradouro: $("#ruaUsuario").val(),
			numero: $('#numeroUsuario').val(),
			cidade: $('#cidade  option:selected').text(),
			estado: $("#estado-user  option:selected").text(),
			cep: $("#cepUsuario").val(),
			telefone: $('#telefoneUsuario').val(),
			celular: $('#celularUsuario').val(),
			email: $("#emailUsuario").val(),
			senhaUsuario: $('#senhaUsuario').val()
		},
		method: 'POST',
		success :  function (data){
			var result = $.parseJSON(data);
			if(result.sucesso){
				console.log("sucesso");
				$("#modal-cadastro-usuario .alert").addClass("alert-success").text(result.sucesso).css("display", "block");
				setTimeout(function(){
					$("#modal-cadastro-usuario").modal('hide');
				}, 2000)
			} else if(result.erro){
				console.log("erro");
				$("#modal-cadastro-usuario .alert").addClass("alert-danger").text(result.erro).css("display", "block");
			}
		}
	});

});

/*
$("#ativa-cadastrar-profissional").click(function(){
	$('#modal-cadastro-profissional').modal();
});

$('#modal-cadastro-profissional').on('hidden.bs.modal', function () {
	$(this).find('form')[0].reset();
	$(this).find('i').removeClass('glyphicon glyphicon-thumbs-up')
			  		 .removeClass('glyphicon glyphicon-thumbs-down');
})
*/


