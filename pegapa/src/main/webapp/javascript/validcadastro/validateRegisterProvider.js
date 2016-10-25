$('#nomeFantasia, #nomeFantasiaVirt, #urlVirt, #respName, #ruaFornecedor').blur(function(){
	var pop = $(this).closest('.input-group').find('i');

	if($(this).val().length == 0){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
})

$('#descriptionProv, #descriptionProvVirt').on( 'blur', function(){
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

$('#cnpjForn').on( 'blur', function(){
	var pop = $(this).closest('.input-group').find('i');
	var tiraTudoQueNaoForDigito = /[^\d]+/g;
	var cnpj = $(this).val().replace(tiraTudoQueNaoForDigito, "");
	if(cnpj.length < 14 ){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
});


$('#fState-prov').on('blur', 'button[data-id="estado-forn"]', function(){
	var error = $(this).closest('.form-group').find('.red');

	if($('#estado-forn option:selected').text() == 'Escolha um Estado'){
		$(error).attr('hidden', false);
		$(this).attr('validated',false);
		return;
	} else{
		$(error).attr('hidden', true);
	}
	$(this).attr('validated',true);
})

$('#fCity-prov').on('blur', 'button[data-id="cidade-forn"]', function(){
	var error = $(this).closest('.form-group').find('.red');

	if($('#cidade-forn option:selected').text() == 'Escolha uma Cidade'){
		$(error).attr('hidden', false);
		$(this).attr('validated',false);
		return;
	} else{
		$(error).attr('hidden', true);
	}
	$(this).attr('validated',true);
})

$('#fNeighb-prov').on('blur', 'button[data-id="bairros-forn"]', function(){
	var error = $(this).closest('.form-group').find('.red');

	if($('#bairros-forn option:selected').text() == 'Selecione um Bairro'){
		$(error).attr('hidden', false);
		$(this).attr('validated',false);
		return;
	} else{
		$(error).attr('hidden', true);
	}
	$(this).attr('validated',true);
});



$('#cepFornecedor').on('blur', function(){
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

$('#fBusinessLine').on('blur', 'button[data-id="ramoAtuacaoFisico"]', function(){
	var error = $(this).closest('.form-group').find('.red');

	if($('#ramoAtuacaoFisico option:selected').val() == 'N'){
		$(error).attr('hidden', false);
		$(this).attr('validated',false);
		return;
	} else{
		$(error).attr('hidden', true);
	}
	$(this).attr('validated',true);
});

$('#fBusinessLineVirt').on('blur', 'button[data-id="ramoAtuacaoVirt"]', function(){
	var error = $(this).closest('.form-group').find('.red');

	if($('#ramoAtuacaoVirt option:selected').val() == 'N'){
		$(error).attr('hidden', false);
		$(this).attr('validated',false);
		return;
	} else{
		$(error).attr('hidden', true);
	}
	$(this).attr('validated',true);
})


$('#telefoneFornecedor').on('blur', function(){
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

$('#celularFornecedor').on('blur',function(){
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

$('#emailFornecedor, #emailFornecedorVirt').blur(function(){
var pop = $(this).closest('.input-group').find('i');

	if($(this).val().length == 0){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	}

	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
})

$('#senhaFornecedorFisico, #senhaFornecedorVirt').on('blur', function(){
	var pop = $(this).closest('.input-group').find('i');
	if($(this).val().length == 0 ){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
});

$('#confirmSenhaFornecedorFisico').blur( function(){
	var pop = $(this).closest('.input-group').find('i');
	if($(this).val() != $('#senhaFornecedorFisico').val() || $(this).val() == ''){
		criaPopoverDeErroComMsg(pop, 'Este campo é Obrigatório e deve ser igual a senha informada acima.');
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
});

$('#confirmSenhaFornVirt').blur( function(){
	var pop = $(this).closest('.input-group').find('i');
	if($(this).val() != $('#senhaFornecedorVirt').val() || $(this).val() == ''){
		criaPopoverDeErroComMsg(pop, 'Este campo é Obrigatório e deve ser igual a senha informada acima.');
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
});
$("#ativa-cadastrar-fornecedor").click(function(){
	$('#modal-cadastro-fornecedor').modal();
});


