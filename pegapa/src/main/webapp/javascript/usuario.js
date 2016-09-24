/**
 * 
 */
$("#ativa-cadastrar-usuario").click(function(){
	$('#modal-cadastro-usuario').modal();
});

$('#cadastrarUsuario').on("click", function(event){
	var senha  = $("#senhaUsuario").val();
	var confirmaSenha = $("#confirmSenhaUsuario").val();
	if(senha != confirmaSenha){
		alert("As senhas informadas não conferem.")
		return;
	} else{
		var tiraTudoQueNaoForDigito = /[^\d]+/g;
		
		var telUsuario = $("#telefoneUsuario").val().replace(tiraTudoQueNaoForDigito, "");
		var celUsuario = $("#celularUsuario").val().replace(tiraTudoQueNaoForDigito, "");

		
		//TODO Acrescentar obrigatoriedade aqui embaixo
		if($("#cidade option:selected").text() == "Escolha uma cidade"){
			alert("Escolha uma cidade");
			return;
		}
		if($("#estado option:selected").text() == "Escolha um Estado"){
			alert("Escolha um estado");
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
				estado: $("#estado  option:selected").text(),
				cep: $("#cepUsuario").val(),
				telefone: telUsuario,
				celular: celUsuario,
				email: $("#emailUsuario").val(),
				senhaUsuario: senha
			},
			method: 'POST',
			success :  function (data){
				var result = $.parseJSON(data);
				if(result.sucesso){
					console.log("sucesso");
					$("#modal-cadastro-usuario .alert").addClass("alert-success").text(result.sucesso).css("display", "block");
					//cancelaTudo('modal-cadastro-profissional');
				} else if(result.erro){
					console.log("erro");
					$("#modal-cadastro-usuario .alert").addClass("alert-danger").text(result.erro).css("display", "block");
				}
			}
		});
	}
});

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
function avaliarFinalizarSolicitacao(retorno){
	
	var nota = $('#nota').val().replace(/[^\d]/g, '');  
	
	if(nota > 10 || nota < 0){
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
//function eliminaDivCancelada(id){
//	$('a[data-id="' + id + '"]').closest('.media').hide();
//}

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