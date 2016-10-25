/**
 * 
 */


$("#login-usuario").on("click", function(event){
	var email = $('input[name="username-user"]').val();
	var senha = $('input[name="password-user"]').val();

	if(email == ""){
		alert('Email nao pode ser vazio');
		return; 
	}
	if(senha == ""){
		alert('Senha nao pode ser vazio');
		return;
	}
	$.ajax({
		url: "/pegapa/ServletUsuario",
		dataType: 'json',
		data: {
			login:'s',
			username_user: email,
			password_user: senha
		},
		method: 'POST',
		success :  function (data){
			console.log(data);
			if(data){
				$(location).attr('href','/pegapa/usuario/paginaInicial.jsp');
			} else{
				$('#divErroUser').toggle();
			}
		}
	});
	
});


function retornarDadosParaEdicao(){
	$('form[name="edit"]').submit();
}

function alterarDados(){
	
	var validate = true;
	$('#nomeUsuario, #emailUsuario, #ruaUsuario, #cpfUsuario, #cepUsuario, #telefoneUsuario, #celularUsuario').each(function(){
		$(this).blur();
		if($(this).attr('validated') == "false"){
			 validate = false;
		 }
	});

	var estadoPValidar = $('button[data-id="editar-estado-user"]').blur();
	if($(estadoPValidar).attr('validated') == "false"){
		validate = false;
	}
	
	var cidadePValidar = $('button[data-id="editar-cidade-user"]').blur();
	if($(cidadePValidar).attr('validated') == "false"){
		validate = false;
	}
	if(!validate){
		$('#nomeUsuario').focus();
		return;
	}
	
	var estado = $('#editar-estado-user option:selected').text();
	var cidade = $('#editar-cidade-user option:selected').text();
	

	
	$('input[name="estado-user"]').val(estado);
	$('input[name="cidade-user"]').val(cidade);
	
	$('#form-edit-user').submit();
}

function logoutUser(){
	$('form[name="logout-user"]').submit();
}

function visualizarSolicitacoesUsuario(acao){
	var input = $('<input>').attr('type', 'hidden').attr('name', acao);
	$('form[name="visualizarSolicUser"]').append(input);
	$('form[name="visualizarSolicUser"]').submit();
}

function visualizarSolicitacoesDeFornecedores(acao){
	var input = $('<input>').attr('type', 'hidden').attr('name', acao);
	$('form[name="visualizarSolicForn"]').append(input);
	$('form[name="visualizarSolicForn"]').submit();
}

$('#finalizacao-solicitacao').on('hidden.bs.modal', function(e){
	$(this).find('input[name="solic"]').remove();
})

$('[name="finalizar-servico"]').on('click', function(e){
	$('#msgSucesso').hide();
	$('#finalizacao-solicitacao').modal();
	var id = $(this).prev("[name='idSolic']").attr('id');
	id = $(this).closest('.media').children('input[name="idSolic"]').attr('id');
	console.log(id);
	var inputId = $('<input>').attr({
		type: 'hidden',
		id: id,
		name: 'solic'
	})
	$('#finalizacao-solicitacao').find('.modal-body').append(inputId);
});

$('#nota').on("input", function(e) {
    $(this).val($(this).val().replace(/[^\d]/g, ''));
});

function avaliarFinalizarSolicitacao(retorno){
	
	var nota = $('#nota').val().replace(/[^\d]/g, '');  
	
	if(nota== "" || nota > 10 || nota < 0){
		alert('Informe uma nota entre 0 e 10');
		return;
	}
	var numero = Number(nota);
	if(isNaN(numero)){
		alert('Informe um número válido');
		return;
	}
	var codigoSolicitacao = $('input[name="solic"]').attr('id');
	
	var comentario = $('#comentarioAvaliacao').val();
	if(comentario == ""){
		alert('Por favor, informe um comentário sobre o serviço realizado.');
		return;
	}
	
	$.ajax({
		url: "/pegapa/ServletUsuario",
		data:  {
			avaliar: 's',
			notaServ: nota,
			comentario: comentario,
			codigo: codigoSolicitacao
		},
		method: 'GET',
		success :  function (data){
			var result = $.parseJSON(data);
			if(result.sucesso){
				$('#finalizacao-solicitacao').modal('hide');
				if(retorno){
					visualizarSolicitacoesDeFornecedores('finalizar');
				}else {
					visualizarSolicitacoesUsuario('finalizar');
				}
			} 
		}
	})
	
}

function cancelarSolicitacao(id){
	$.ajax({
		url: "/pegapa/ServletUsuario",
		data:  {
			cancelar: 's',
			id: id
		},
		method: 'GET',
		success :  function() {
			visualizarSolicitacoesUsuario('cancelar');
			$('#msgCancelar').show();
		}
	}).done(function(){
		$('#msgSucesso').show();
	});
	
}
function cancelarSolicitacaoForn(id){
	$.ajax({
		url: "/pegapa/ServletUsuario",
		data:  {
			cancelar: 's',
			id: id
		},
		method: 'GET',
		success :  function() {
			visualizarSolicitacoesDeFornecedores('cancelar');
			$('#msgCancelar').show();
		}
	}).done(function(){
		$('#msgSucesso').show();
	});
	
}


function filtraPorStatus(){
	var selecionado = $('select option:selected').val();
	
	$('i[data-name="statusSolic"]').each(function(key, value){
		
		if( $(value).text().indexOf(selecionado) <= 0){
			$(value).closest('.row').hide();
		} else{
			$(value).closest('.row').show();
		}
		if(selecionado == 'Todos'){
			$(value).closest('.row').show();
		}
	});
}

$('#help').popover({
	trigger: 'hover',
	content: 'Ajuda vai aqui',
	placement: 'left'
})