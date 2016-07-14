/**
 * 
 */

/*
$("#formProfissional").validate({
		rules:{
			nome 	: 	{	required: true},
			cpf		: 	{	required: true},
			endereco:	{	required: true},
			cidade	:	{	required: true},
			estado	:	{	required: true},
			cep		:	{	required: true},
			telefone:	{	required: true},
			ocupacao:	{	required: true},
			experiencia:{	required: true},
			email	:	{	required: true},
			senha	:	{	required: true},
			confirmSenha:{	required: true, equalTo: '#senha'}
		},
		
		showErrors: function(mapaErro, listaErro){
			$.each(this.successList, function(indice, valor){
				return $(valor).popover("hide");
			});
						
			$.each(listaErro, function(indice, valor){
				var popover;
				console.log(valor);
				popover = $(valor.element).popover({
					trigger: "manual",
					content: valor.message,
					placement: "top",
					template: '<div class=\"popover\">' +
							  '   <div class=\"arrow\"></div>' +
							  '   <div class=\"popover-inner\">' +
							  '      <div class=\"popover-content\">'+
							  '          <p></p> ' + 
							  '      </div>' + 
							  '   </div>' + 
							  '</div>'
				});
				popover.data("bs.popover").options.content = valor.message;
				//popover.data("popover").options.content = valor.message;
				return $(valor.element).popover("show");
			});
		},
		messages:{
			nome	: "O campo nome é obrigatório.",
			cpf		: "O campo cpf é obrigatório",	
			endereco:"O campo endereço é obrigatório.", 	
			cidade	:"O campo cidade é obrigatório",	 	
			estado	:"O campo estado é obrigatório.", 	
			cep		:"O campo cep é obrigatório",	 	
			telefone:	"O campo telefone é obrigatório.", 
			ocupacao:	"O campo ocupação é obrigatório.",	 
			experiencia:   "O campo experiência é obrigatório.",  
			email	:	      "O campo Email é obrigatório",	 
			senha	:	      "O campo Senha é obrigatório.", 
			confirmSenha:     "O campo Confirmação de Senha é obrigatório." 
		},
		onfocusout: function(el, evt){
			$(el).popover("hide");
		}
			
});*/
$("#cadastrarProfissional").click(function(event){
	event.preventDefault();
	submeterCadastroProfissional();
});



$("#cancelarProfissional").click(function(){
	cancelaProfissional();
});

$("#ativa-cadastrar-profissional").click(function(){
	$('#modal-cadastro-profissional').modal();
});

$("#ocupacao").on("change", function(){
	if($( "#ocupacao option:selected" ).text() == "Outro"){
		$("#informar-ocupacao").css("display", "block");
	} else{
		$("#informar-ocupacao").css("display", "none");
	}
});

$('#estado-prof').on("change", function(){
	executaPesquisaCidade('codigoEstadoProf');
});
$('#estado-user').on("change", function(){
	executaPesquisaCidade('codigoEstadoUser');
});
$('#localiza-estado').on("change", function(){
	executaPesquisaCidade('codigoLocaliza');
});

function executaPesquisaCidade(tipo){
	var codigo;
	if(tipo == 'codigoEstadoProf'){
		var codigoEstadoProf =  $( "#estado-prof option:selected" ).val();	
		if(codigoEstadoProf != "Selecione um estado"){
			codigo = codigoEstadoProf;
		}
	} else if(tipo == 'codigoEstadoUser'){
		var codigoEstadoUser =  $( "#estado-user option:selected" ).val();
		if(codigoEstadoUser != "Selecione um estado"){
			codigo = codigoEstadoUser;
		}
	} else if(tipo == 'codigoLocaliza'){
		var codigoLocaliza = $( "#localiza-estado option:selected" ).val();
		if(codigoLocaliza != "Selecione um estado"){
			codigo = codigoLocaliza;
		}
	} else{
		return;
	}
	$('#cidade, #cidade-prof').empty().append("<option data-hidden='true'>Selecione uma cidade</option>");
	$('#localiza-cidade').empty().append("<option data-hidden='true'>Selecione uma cidade</option>");
	$.ajax({
		url: 'SelectServlet',
		method: 'POST',
		data: {carregaCidade:'carregaCidade', codigo:codigo},
		success: function(data){
			data = jQuery.parseJSON(data);
			var options = ""
				$.each(data, function(key, value){
					options += "<option value='" + value.cod + "'>" + value.nome + "</option>";
				});
			$("#cidade, #localiza-cidade, #cidade-prof").append(options);
			$(".selectpicker").selectpicker('refresh');
		}
	});

	
}


function submeterCadastroProfissional(){
	var senha  = $("#senhaProfissional").val();
	var confirmaSenha = $("#confirmSenhaProfissional").val();
	if(senha != confirmaSenha){
		alert("As senhas informadas não conferem.")
		return;
	} else{
		var tiraTudoQueNaoForDigito = /[^\d]+/g;
		
		var telProf = $("#telefoneProfissional").val().replace(tiraTudoQueNaoForDigito, "");
		var celProf = $("#celularProfissional").val().replace(tiraTudoQueNaoForDigito, "");
		
		if($("#ocupacao option:selected").text() == "Escolha uma Ocupação"){
			$("#ocupacao").val("");
		}
		
		if($("#experiencia option:selected").text() == "Sua Experiência na área"){
			$("#experiencia").val("");
		}
		
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
			
			
			url: "cadastrarProfissional",
			data:  {
				cadastra: "cadastra",
				nome : $("#nomeProfissional").val(),
				cpf	: $("#cpfProfissional").val(),
				logradouro: $("#ruaProfissional").val(),
				numero: $('#numeroProfissional').val(),
				cidade: $('#cidade-prof  option:selected').text(),
				estado: $("#estado-prof  option:selected").text(),
				cep: $("#cepProfissional").val(),
				telefone: telProf,
				celular: celProf,
				ocupacao: $("#ocupacao").val(),
				experiencia: $("#experiencia").val(),
				email: $("#emailProfissional").val(),
				senhaProfissional: $("#senhaProfissional").val()
			},
			method: 'POST',
			success :  function (data){
				var result = $.parseJSON(data);
				if(result.sucesso){
					console.log("sucesso");
					$("#modal-cadastro-profissional .alert").addClass("alert-success").text(result.sucesso).css("display", "block");
					//cancelaTudo('modal-cadastro-profissional');
				} else if(result.erro){
					console.log("erro");
					$("#modal-cadastro-profissional .alert").addClass("alert-danger").text(result.erro).css("display", "block");
				}
			}
		});
	}
}


$("#login-profissional").on("click", function(event){

	
	var email = $('input[name="username-prof"]').val();
	
	
	var senha = $('input[name="password-prof"]').val();
	
	if(email == ""){
		return; 
	}
	if(senha == ""){
		return;
	}
	
})

function autenticaProfissional(){
	
}
function enviaSolicitacao(){
	alert('teste');
}
