/**
 * 
 */
function buscar(){
	var estado;
	var cidade;
	var categoria;
	estado = $( "#localiza-estado option:selected" ).val() == "Selecione um estado"? "" : $( "#localiza-estado option:selected" ).val();
	cidade = $( "#localiza-cidade option:selected" ).val() == "Selecione uma cidade"? "": $( "#localiza-cidade option:selected" ).val(); 
	categoria =  $( "#categoria-buscada option:selected" ).val();

	$("form[name='localizar-profissional']").submit();
}

function selecionaProfissional(codigo){
	$.ajax({
		url: "LocalizarServlet",
		dataType: 'json',
		data: {
			cod:'selecionar',
			id:codigo
		},
		method: 'POST',
		success :  function (data){
			montaModal(data);
		}
	});
}
function montaModal(data){
	var divConteudoModal =  $("<div>").addClass("conteudo-profissional")
										//.css('float', 'left')
										.css('width', '50%')
										.append(data.nome + "<br/>")
										.append("Ocupação : " + data.ocupacao + "<br/>")
										.append("Nivel de Experiência: " + data.experiencia + "<br/>")
										.append("Email: " + data.email + "<br/>")
										.append("Telefone : " + data.telefone + "<br/>")
										.append("Celular : " + data.celular + "<br/>")
										.append("Cidade : " + data.cidade + "<br/>")
										.append("Estado : " + data.estado + "<br/>")
										.append("<address>")
										.append("Endereço : " + data.logradouro + "<br/>")
										.append("CEP : " + data.cep + "<br/>")
										.append("</address>")
										.append("<hr/>")
										.append("Nome da Referência : " + data.nomeReferencia + "<br/>")
										.append("Telefone da Referência : " + data.telReferencia + "<br/>");
	
	
	var divModalBody = $("<div>").addClass("modal-body").append(divConteudoModal);
	
	var divBotaoEnviarSolicitacao = $("<div>").attr("id", "enviarSolicitacao")
												.addClass("btn-group btn-group-justified")
												.attr("role", "group")
												.append("<a href='#' class='btn btn-primary' role='button'>Enviar Solicitação</a>")
												.attr("onclick", "enviaSolicitacao()");
												
	

	
	var divModalHeader = $("<div>").addClass("modal-header");
	
	var divModalContent = $("<div>").addClass("modal-content")
									.append(divModalHeader)
									.append(divModalBody)
									.append(divBotaoEnviarSolicitacao);
	
	
	var divModalDialog = $("<div>").addClass("modal-dialog")
									.attr("id", "box-profissional")
									.attr("role", "dialog")
									.append(divModalContent);
	
	
	var divModalFade = $("<div>").addClass("modal fade")
								.attr("id", "box")
								.append(divModalDialog);
	console.log(divModalFade);
	divModalFade.modal("show");
}

