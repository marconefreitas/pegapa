function criaPopoverDeErro(pop){
	$(pop).popover({
		trigger : 'click',
		placement: 'left',
		content: 'Este campo é Obrigatório',
	})
	$(pop).popover('enable');
	pop.removeClass('green')
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


$('#nameProfessional, #streetProf, #numberProf, #mailProf').blur(function(){
	var pop = $(this).closest('.input-group').find('i');

	if($(this).val().length == 0){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
})

$('#descriptionProf').blur( function(){
	var error = $(this).closest('.input-group').find('.red');

	if($('#descriptionProf').val() == ''){
		$(error).attr('hidden', false);
		$(this).attr('validated',false);
		return;
	} else{
		$(error).attr('hidden', true);
	}
	$(this).attr('validated',true);
})

$('#cpfProf').blur(function(){
	var pop = $(this).closest('.input-group').find('i');
	var tiraTudoQueNaoForDigito = /[^\d]+/g;
	var cnpj = $(this).val().replace(tiraTudoQueNaoForDigito, "");
	if(cnpj.length < 11 ){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
});

$('#cepProf').blur(function(){
	var pop = $(this).closest('.input-group').find('i');
	var tiraTudoQueNaoForDigito = /[^\d]+/g;
	var cnpj = $(this).val().replace(tiraTudoQueNaoForDigito, "");
	if(cnpj.length < 8 ){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
});

$('#aExp, #mExp').blur(function(){
	var pop = $(this).closest('.input-group').find('i');

	if($(this).val().length == 0){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
})

$('#fProfession').on('blur', 'button[data-id="ocupacao"]', function(){
	var error = $(this).closest('.form-group').find('.red');

	if($('#ocupacao option:selected').text() == 'Escolha uma Ocupação'){
		$(error).attr('hidden', false);
		$(this).attr('validated',false);
		return;
	} else{
		$(error).attr('hidden', true);
	}
	$(this).attr('validated',true);
})

$('#fState').on('blur', 'button[data-id="editar-estado-prof"]', function(){
	var error = $(this).closest('.form-group').find('.red');

	if($('#editar-estado-prof option:selected').text() == 'Selecione um Estado'){
		$(error).attr('hidden', false);
		$(this).attr('validated',false);
		return;
	} else{
		$(error).attr('hidden', true);
	}
	$(this).attr('validated',true);
})


$('#fCity').on('blur', 'button[data-id="editar-cidade-prof"]', function(){
	var error = $(this).closest('.form-group').find('.red');

	if($('#editar-cidade-prof option:selected').text() == 'Selecione uma Cidade'){
		$(error).attr('hidden', false);
		$(this).attr('validated',false);
		return;
	} else{
		$(error).attr('hidden', true);
	}
	$(this).attr('validated',true);
})

$('#fNeighborhood').on('blur', 'button[data-id="editar-bairros-prof"]', function(){
	var error = $(this).closest('.form-group').find('.red');

	if($('#editar-bairros-prof option:selected').text() == 'Selecione um Bairro'){
		$(error).attr('hidden', false);
		$(this).attr('validated',false);
		return;
	} else{
		$(error).attr('hidden', true);
	}
	$(this).attr('validated',true);
});


$('#phone1').blur(function(){
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

$('#phone2').blur(function(){
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


