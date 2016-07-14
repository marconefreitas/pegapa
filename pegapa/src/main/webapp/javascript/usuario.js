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
			url: "cadastrarUsuario",
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
		return; 
	}
	if(senha == ""){
		return;
	}
	
})