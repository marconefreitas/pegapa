/**
 * 
 */



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
			$('#ruaUsuario').removeAttr('disabled').val(data.logradouro);
			$('#numeroUsuario').focus();
		}
	});
});

function testeJQuery(){
	$.ajax({
		url: "TesteServlet",
		data: {teste:'teste'},
		method: 'POST',
		success :  function (data){
			var result = jQuery.parseJSON(data);
			alert(result.msg);
		}
	});
}

function testaCoisa(){
	$.ajax({
		url: "SelectServlet",
		data: {testacoisa:'teste'},
		method: 'POST',
		success :  function (data){
			
		}
	});
}

function cancelaTudo(id){
	$(':text').each(function(){
		$(this).val("");
	});
	$(':password').each(function(){
		$(this).val("");
	});
	$(':input[type="email"]').each(function(){
		$(this).val("");
	});
	$("#" + id).modal('toggle');
}

/*
 * Método que faz o login
 * Perfil 1 = Fornecedor
 * Perfil 2 = Usuário
 * Perfil 3 = MicroEmpresa
 * 
 */
function autenticaUsuario(perfil){

	$.ajax({
		url: "cadastrarProfissional",
		data: {
			login:'testaDataSource',
			perfil: perfil
		},
		method: 'POST',
		success :  function (data){
			alert('Enviou');
		}
	});
	
}

function mudaLabel(){
	if($('#perfil_select').val() == '2'){
		$('#nome_label').html('Nome Completo:');
		$('#cpf_label').html('CPF:');
	} else{
		$('#nome_label').html('Razão Social:');
		$('#cpf_label').html('CNPJ:');
	} 
	
}



