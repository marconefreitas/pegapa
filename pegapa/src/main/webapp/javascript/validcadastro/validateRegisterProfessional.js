function criaPopoverDeErroComMsg(pop, msg){
	var conteudoMsg = 'Este campo é Obrigatório';
	if(msg){
		conteudoMsg = msg;
	}
	$(pop).popover({
		trigger : 'click',
		placement: 'left',
		content: conteudoMsg
	})
	$(pop).popover('enable');
	pop
	  .removeClass('green')
	  .removeClass('glyphicon glyphicon-thumbs-up')
	  .addClass('glyphicon glyphicon-thumbs-down')
	  .addClass('red');
}


$('#nomeProfissional, #ruaProfissional, #emailProfissional').blur(function(){
	var pop = $(this).closest('.input-group').find('i');

	if($(this).val().length == 0){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
})

$('#descriptionProf').on( 'blur', function(){
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

$('#cpfProfissional').on( 'blur', function(){
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

$('#cepProfissional').on('blur', function(){
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

$('#mes').on('blur', function(){
	var pop = $(this).closest('.input-group').find('i');

	if($(this).val().length == 0){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	} 
	if($(this).val() > 12 || $(this).val() < 1){
		criaPopoverDeErroComMsg(pop, 'Informação Inválida');
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, $(this));
	$(this).attr('validated',true);
})

$('#anos').on('blur', function(){
	var pop = $(this).closest('.input-group').find('i');

	if($(this).val().length == 0){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	} 
	if($(this).val() > 99 || $(this).val() < 0){
		criaPopoverDeErroComMsg(pop, 'Informação Inválida');
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, $(this));
	$(this).attr('validated',true);
})

$('#fProfession').on('blur', 'button[data-id="ocupacao"]', function(){
	var error = $(this).closest('.form-group').find('.red');

	if($('#ocupacao option:selected').val() == 'N'){
		$(error).attr('hidden', false);
		$(this).attr('validated',false);
		return;
	} else{
		$(error).attr('hidden', true);
	}
	$(this).attr('validated',true);
})

$('#fState').on('blur', 'button[data-id="estado-prof"]', function(){
	var error = $(this).closest('.form-group').find('.red');

	if($('#estado-prof option:selected').text() == 'Escolha um Estado'){
		$(error).attr('hidden', false);
		$(this).attr('validated',false);
		return;
	} else{
		$(error).attr('hidden', true);
	}
	$(this).attr('validated',true);
})


$('#fCity').on('blur', 'button[data-id="cidade-prof"]', function(){
	var error = $(this).closest('.form-group').find('.red');

	if($('#cidade-prof option:selected').text() == 'Escolha uma Cidade'){
		$(error).attr('hidden', false);
		$(this).attr('validated',false);
		return;
	} else{
		$(error).attr('hidden', true);
	}
	$(this).attr('validated',true);
})

$('#fNeighb').on('blur', 'button[data-id="bairros-prof"]', function(){
	var error = $(this).closest('.form-group').find('.red');

	if($('#bairros-prof option:selected').text() == 'Escolha um Bairro'){
		$(error).attr('hidden', false);
		$(this).attr('validated',false);
		return;
	} else{
		$(error).attr('hidden', true);
	}
	$(this).attr('validated',true);
});


$('#telefoneProfissional').on('blur', function(){
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

$('#celularProfissional').on('blur',function(){
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

$('#senhaProfissional').on('blur', function(){
	var pop = $(this).closest('.input-group').find('i');
	if($(this).val().length == 0 ){
		criaPopoverDeErro(pop);
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
});

$('#confirmSenhaProfissional').blur( function(){
	var pop = $(this).closest('.input-group').find('i');
	if($(this).val() != $('#senhaProfissional').val() || $(this).val() == ''){
		criaPopoverDeErroComMsg(pop, 'Este campo é Obrigatório e deve ser igual a senha informada acima.');
		$(this).attr('validated',false);
		return;
	} 
	removePopoverDeErro(pop, this);
	$(this).attr('validated',true);
});

$("#cadastrarProfissional").on('click', function(event){
	event.preventDefault();
	submeterCadastroProfissional();
});

function submeterCadastroProfissional(){

	var validate = true;
	$('#nomeProfissional, #cpfProfissional, #cepProfissional, #ruaProfissional, #telefoneProfissional, #celularProfissional, #descriptionProf, #mes, #anos, #emailProfissional, #senhaProfissional, #confirmSenhaProfissional').each(function(){
		$(this).blur();
		if($(this).attr('validated') == "false"){
			 validate = false;
		 }
	});
	
	var ocupacaoPValidar = $('button[data-id="ocupacao"]').blur();
	if($(ocupacaoPValidar).attr('validated') == "false"){
		validate = false;
	}
	
	var estadoPValidar = $('button[data-id="estado-prof"]').blur();
	if($(estadoPValidar).attr('validated') == "false"){
		validate = false;
	}
	
	var cidadePValidar = $('button[data-id="cidade-prof"]').blur();
	if($(cidadePValidar).attr('validated') == "false"){
		validate = false;
	}
	
	var bairroPValidar = $('button[data-id="bairros-prof"]').blur();
	if($(bairroPValidar).attr('validated') == "false"){
		validate = false;
	}
	if($('.image-preview-filename').val() == ""){
		alert('Por favor, informe uma foto para usar no seu perfil.');
		return;
	}
	if(!validate){
		return;
	}
	
	
	var tiraTudoQueNaoForDigito = /[^\d]+/g;

	var telProf = $("#telefoneProfissional").val().replace(tiraTudoQueNaoForDigito, "");
	var celProf = $("#celularProfissional").val().replace(tiraTudoQueNaoForDigito, "");


	var image;
	$('#imagem').change(function(e){
		image = new FormData();
		image.append('imagem', e.target.files[0]);
	})
	var form = new FormData($('#formProfissional')[0]);
	form.append('estado-prof', $("#estado-prof option:selected").text());
	form.append('cidade-prof', $("#cidade-prof option:selected").text());
	form.append('bairros-prof', $("#bairros-prof option:selected").text())
	$.ajax({

		url: "cadastrarProfissional",
		data: form,
		processData : false,
		contentType: false,
		method: 'POST',
		success :  function (data){
			var result = $.parseJSON(data);
			if(result.sucesso){
				console.log("sucesso");
				$("#modal-cadastro-profissional .alert").addClass("alert-success").text(result.sucesso).css("display", "block");
			} else if(result.erro){
				console.log("erro");
				$("#modal-cadastro-profissional .alert").addClass("alert-danger").text(result.erro).css("display", "block");
			}
		}
	});
}
$("#ativa-cadastrar-profissional").click(function(){
	$('#modal-cadastro-profissional').modal();
});

$('#modal-cadastro-profissional, #modal-cadastro-usuario').on('hidden.bs.modal', function () {
	$(this).find('form')[0].reset();
	$(this).find('i').removeClass('glyphicon glyphicon-thumbs-up')
			  		 .removeClass('glyphicon glyphicon-thumbs-down');
	$(this).find('.red').hide();
	$('#cadastrarUsuario').attr('disabled', true);
})



