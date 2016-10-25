/**
 * 
 */

$("#cancelarProfissional").click(function(){
	cancelaProfissional();
});

$("#ativa-cadastrar-profissional").click(function(){
	$('#modal-cadastro-profissional').modal();
});

$('#estado-prof').on("change", function(){
	executaPesquisaCidade('codigoEstadoProf');
});

$('#estado-user').on("change", function(){
	executaPesquisaCidade('codigoEstadoUser');
});
$('#localiza-estado').on("change", function(){
	limpaBairros();
	executaPesquisaCidade('codigoLocaliza');
});
$('#cidade-prof').on("change", function(){
	executaPesquisaBairro('codigoCidadeProf');
});

$('#localiza-cidade').on("change", function(){
	executaPesquisaBairro('codigoCidadeLocaliza');
})

function executaPesquisaCidade(tipo){
	var codigo;
	if(tipo == 'codigoEstadoProf'){
		var codigoEstadoProf =  $( "#estado-prof option:selected" ).val();	
		if(codigoEstadoProf != "Selecione um Estado"){
			codigo = codigoEstadoProf;
		}
	} else if(tipo == 'codigoEstadoUser'){
		var codigoEstadoUser =  $( "#estado-user option:selected" ).val();
		if(codigoEstadoUser != "Selecione um Estado"){
			codigo = codigoEstadoUser;
		}
	} else if(tipo == 'codigoLocaliza'){
		var codigoLocaliza = $( "#localiza-estado option:selected" ).val();
		if(codigoLocaliza != "Selecione um Estado"){
			codigo = codigoLocaliza;
		}
	}else if(tipo == 'codigoEstadoForn'){
		var codigoLocaliza = $( "#estado-forn option:selected" ).val();
		if(codigoLocaliza != "Selecione um Estado"){
			codigo = codigoLocaliza;
		}
	}  else{
		return;
	}
	$('#cidade, #cidade-prof, #cidade-forn').empty().append("<option data-hidden='true'>Selecione uma Cidade</option>");
	$('#localiza-cidade').empty().append("<option data-hidden='true'>Selecione uma Cidade</option>");
	$.ajax({
		url: '/pegapa/SelectServlet',
		method: 'POST',
		contentType: "application/x-www-form-urlencoded;charset=UTF-8",
		data: {carregaCidade:'carregaCidade', codigo:codigo},
		success: function(data){
			data = jQuery.parseJSON(data);
			var options = ""
				$.each(data, function(key, value){
					options += "<option value='" + value.cod + "'>" + value.nome + "</option>";
				});
			$("#cidade, #localiza-cidade, #cidade-prof, #cidade-forn").append(options);
			$(".selectpicker").selectpicker('refresh');
		}
	});

	
}

function executaPesquisaBairro(tipo){
	var codigoCidade;
	if(tipo == 'codigoCidadeLocaliza'){
		codigoCidade = $( "#localiza-cidade option:selected" ).val();	
	} else if(tipo == 'codigoCidadeProf'){
		codigoCidade = $( "#cidade-prof option:selected" ).val();
	} else if(tipo == 'codigoCidadeUser'){
		codigoCidade = $( "#cidade-user option:selected" ).val();
	} else if(tipo == 'codigoCidadeForn'){
		codigoCidade = $( "#cidade-forn option:selected" ).val();
	}
	
	
	var codigo;
	if(codigoCidade != "Selecione uma Cidade"){
		codigo = codigoCidade;
	} else{
		return;
	}
	$("#bairros-user, #bairros-prof ,#localiza-bairros, #bairros-forn").empty().append("<option data-hidden='true'>Selecione um Bairro</option>");
	
	$.ajax({
		url: '/pegapa/SelectServlet',
		method: 'POST',
		data: {
				carregaBairros:'carregaBairros', 
				localizaCidade : codigo
			},
		success: function(data){
			data = jQuery.parseJSON(data);
			var options;
			$.each(data, function(key, value){
				options += '<option value="' + value.cod + '">' + value.nome + '</option>'
				
			});
			$("#bairros-user, #bairros-prof ,#localiza-bairros, #bairros-forn").append(options);
			$('.selectpicker').selectpicker('refresh');
			
		}
	});
}





$("#login-profissional").on("click", function(event){

	var email = $('input[name="username-prof"]').val();
	
	var senha = $('input[name="password-prof"]').val();
	
	if(email == ""){
		alert('Email nao pode ser vazio');
		return; 
	}
	if(senha == ""){
		alert('Senha nao pode ser vazio');
		return;
	}
	$.ajax({
		url: "/pegapa/cadastrarProfissional",
		dataType: 'json',
		data: {
			login:'s',
			username_prof: email,
			password_prof: senha
		},
		method: 'POST',
		success :  function (data){
			console.log(data);
			if(data){
				$(location).attr('href','/pegapa/profissional/paginaInicial.jsp');
			} else{
				$('#divErroProf').toggle();
			}
		}
	});
})

function autenticaProfissional(){
	
}
function enviaSolicitacao(idProf){
	
	var descricaoSolic;
	descricaoSolic = $('#' + idProf + 'txArea').val();
	
	var nomeServico;
	nomeServico = $('#select' + idProf + ' option:selected').text();
	if(nomeServico == "Escolha um Serviço"){
		alert('É necessário escolher um serviço para continuar.');
		return;
	}
	
	if(descricaoSolic == ""){
		alert('Descrição da solicitação não pode estar vazio.');
		return;
	}
	
	if(nomeServico == "Nenhum Serviço Cadastrado"){
		nomeServico = "";
	}
	
	$.ajax({
		
		url: "/pegapa/ServletUsuario",
		data: {
			solicitar : 'S',
			id : idProf,
			desc : descricaoSolic,
			email : $('#mail').text(),
			nomeServico: nomeServico
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


function visualizarSolicitacoes(){
	$("form[name='visuSolic']").submit();
}

function historicoSolicitacao(){
	$("form[name='historicoSolic']").submit();
}


function aceitarSolicitacao(id){
	$('#modal-solicitacao').find('#button').text("Aceitar Solicitação");
	var inp = $('<input>').attr('type', 'hidden').val(id);
	$('#modal-solicitacao').append(inp);
	$('#modal-solicitacao').find('.modal-header').html('<b>Aceitar Solicitação</b>').css('background-color', '#C0C0C0');
	$('#modal-solicitacao').modal();
}

function recusarSolicitacao(id){
	$('#modal-solicitacao').find('#button').text("Recusar Solicitação");
	var inp = $('<input>').attr('type', 'hidden').val(id);
	$('#modal-solicitacao').append(inp);
	$('#modal-solicitacao').find('.modal-header').html('<b>Recusar Solicitação</b>').css('background-color', '#C0C0C0');
	$('#modal-solicitacao').modal();
}

function submeterSolicitacao(){
	if($('#respSolicitacao').val() == ""){
		alert('Informe o motivo do aceite ou da recusa desta solicitação');
		return;
	}
	
	var aceitar;
	if( $('#button').text() == "Aceitar Solicitação"){
		aceitar = 'S';
	} else{
		aceitar = 'N';
	}
	var id = $('#modal-solicitacao input[type="hidden"]').val();
	
	$.ajax({
		
		url: "/pegapa/cadastrarProfissional",
		data: {
			accSolic : aceitar,
			idSolicitacao : id,
			respSolicitacao : $('#respSolicitacao').val()
		},
		method: 'POST',
		success :  function (data){
			$('input[id="' + id + '"]').closest('.row').fadeOut("slow");
			
			$('#modal-solicitacao').modal('hide');
			if(aceitar == 'S'){
				$('#modal-sucesso').modal('show');
			} else if(aceitar == 'N'){
				$('#modal-recusa').modal('show');
			}
		}
	}).done(function(){
		 setTimeout(function() {
			 $('form[name="visuSolic"]').submit();
		 },1400);
	});
	
	
	
	
}

$('#modal-solicitacao').on('hidden.bs.modal', function (e) {
	$(this).find('input[type="hidden"]').remove();
	$('#respSolicitacao').val("");
})

function limpaBairros(){
	$("#bairros-user, #bairros-prof ,#localiza-bairros").empty().append("<option data-hidden='true'>Selecione um Bairro</option>");
}

function listarServicos(){
	$('form[name="lServicos"]').submit();
}

function submeterCadastroServico(){
	if($('#nomeServ').val() == ""){
		alert('Nome nao pode ser vazio');
		return;
	}
	if($('#textarea').val() == ""){
		alert('Descrição nao pode ser vazia')
		return;
	}
	
	var preco = $('#preco').val().trim().substring(3);
	$('#preco').val(preco); 
	$('form[name="cadastrarServico"]').submit();
}


function editarServico(codigoServ){
	$("#idServico").val(codigoServ);
	var linha = $('#' + codigoServ).children();
	$(linha).each(function(index, value){
		var input = $('[name^="_edit"]').get(index);
		$(input).val($(value).html());
	});
	
	$('#editar-servico').modal();
}

function submeterEditarServico(){
	if($('#nomeServ_edit').val() == ""){
		alert('Nome nao pode ser vazio');
		return;
	}
	if($('#textarea_edit').val() == ""){
		alert('Descrição nao pode ser vazia')
		return;
	}
	var preco = $('#preco_edit').val().trim().substring(3);
	$('#_edit_preco').val(preco); 
	
	$('form[name="formEditarServico"]').submit();
}


function deletarServico(id){
	var url = "/pegapa/cadastrarProfissional?";
	$('#idServicoDeleta').val(id);
	$('form[name="formDeletarServico"]').attr('action', url);
	$('#deletar-servico').modal();
}

function submeterDeletarServico(){
	$('form[name="formDeletarServico"]').submit();
}

function editarDadosProfissional(){
	$('form[name="formEditProf"]').submit();
}

function confirmarAlteracaoDadosProfissional(){
	
	var validate = true;
	$('#nameProfessional, #descriptionProf, #streetProf, #numberProf,' +
	  '#mailProf, #cpfProf, #cepProf, #aExp, #mExp, #phone1, #phone2').each(function(){
		$(this).blur();
		if($(this).attr('validated') == "false"){
			 validate = false;
		 }
	});
	
	var professionToValidate = $('button[data-id="ocupacao"]').blur();
	if($(professionToValidate).attr('validated') == "false"){
		validate = false;
	}
	
	var stateToValidate = $('button[data-id="editar-estado-prof"]').blur();
	if($(stateToValidate).attr('validated') == "false"){
		validate = false;
	}
	
	var cityToValidate = $('button[data-id="editar-cidade-prof"]').blur();
	if($(cityToValidate).attr('validated') == "false"){
		validate = false;
	}
	
	var neighToValidate = $('button[data-id="editar-bairros-prof"]').blur();
	if($(neighToValidate).attr('validated') == "false"){
		validate = false;
	}
	
	if(!validate){
		return;
	}
	
	var estado = $('#editar-estado-prof option:selected').text();
	var cidade = $('#editar-cidade-prof option:selected').text();
	var bairro = $('#editar-bairros-prof option:selected').text();
	
	$('#editar-estado-prof option:selected').val(estado);
	$('#editar-cidade-prof option:selected').val(cidade);
	$('#editar-bairros-prof option:selected').val(bairro);
	 
	$('#editar-estado-prof').val()
	var image;
	$('#imagemProfissional').change(function(e){
		if( $('#imagemProfissional').val() != ""){
			image = new FormData();
			image.append('imagemProfissional', e.target.files[0]);
		}
	})
	if( $('#imagemProfissional').val() == ""){
		 $('#imagemProfissional').remove();
	}
	$('#form-edit-prof').submit();
}

$('#imagemProfissional').change(function(){
	var file = this.files[0];
	var reader = new FileReader();
	reader.onload = function(e){
		$('#imgAlteracaoProf').attr('src', e.target.result);
		$(".image-preview-filename").val(file.name); 
	}
	reader.readAsDataURL(file);
  
})
