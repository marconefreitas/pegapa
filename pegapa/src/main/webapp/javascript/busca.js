/**
 * 
 */


$('#filtros-select').on('change', function(){
	$('.profissional-box').each(function(index){
		$(this).show();
	});
	
	if( $('#filtros-select option:selected').val() == 'o'){
		$('#filtros-experiencia').hide();
		$('#exp-select').val("n");
		$('#exp-select').selectpicker('refresh');
		$('#filtros-ocupacao').show();
	} else if($('#filtros-select option:selected').val() == 'e'){
		$('#filtros-ocupacao').hide();
		$('#ocup-select').val(1);
		$('#ocup-select').selectpicker('refresh');
		$('#filtros-experiencia').show();
	} else{
		
		$('#exp-select option[value="n"]').attr('selected', 'selected');
		$('#filtros-ocupacao').hide();
		$('#filtros-experiencia').hide();
		$('.profissional-box').each(function(index){
			$(this).show();
		});
	}
});

$('#filtros-experiencia').on("change", function(){
	if($('#filtros-experiencia option:selected').text() == "Todos"){
		$('.profissional-box').each(function(index){
			$(this).show();
		});
	} else{
		$('.profissional-box').each(function(index){
			var year = $(this).find('#ano').val();
			
			if( $('#filtros-experiencia option:selected').val() == 1){
				if(year < 3){
					$(this).show();
				} else{
					$(this).hide();
				}
			} else if($('#filtros-experiencia option:selected').val() == 2){
				if(year >= 3 && year < 5){
					$(this).show();
				} else{
					$(this).hide();
				}
			} else if($('#filtros-experiencia option:selected').val() == 3){
				if(year >= 5){
					$(this).show();
				} else {
					$(this).hide();
				}
			} else{
				$(this).hide();
			}
		});
	}
})

$('#filtros-ocupacao').on("change", function(){
	if($('#filtros-ocupacao option:selected').text() == "Todas"){
		$('.profissional-box').each(function(index){
			$(this).show();
		});
	} else{
	
		$('.profissional-box').each(function(index){
			if( ($(this).find('.work').text() == $('#filtros-ocupacao option:selected').text())){
				if($(this).is(':hidden')){
					$(this).show();
				}
			} else{
				$(this).hide();
			}
		});
	}
});



function buscar(){
	var estado;
	var cidade;
	var bairro;
	var categoria;
	estado = $( "#localiza-estado option:selected" ).val() == "Selecione um estado"? "" : $( "#localiza-estado option:selected" ).val();
	cidade = $( "#localiza-cidade option:selected" ).val() == "Selecione uma cidade"? "": $( "#localiza-cidade option:selected" ).val(); 
	bairro = $( "#localiza-bairros option:selected" ).val() == "Selecione um bairro"? "": $( "#localiza-bairros option:selected" ).val(); 
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
	limpaModaisAntigas();
	
	var anosExp = data[0].profissionalFk.anosExperiencia;
	var mesExp = data[0].profissionalFk.mesesExperiencia
	
	var experiencia = anosExp +  ' ano(s) e ' + mesExp + ' mês(es)';
	var src = data.photo;
	var figure = $('<figure>').addClass('figure-prof')
							  .append($('<img>').attr('src', data.photo));
	
	var textArea = $('<textarea>').addClass('form-control')
								  .addClass('commentText')
								  .addClass('pull-right')
								  .attr('id', data[0].profissionalFk.id + 'txArea')
								  .attr('placeholder' , 'Insira aqui uma pequena descrição da sua solicitação. Max : 200 caracteres')
								  .attr('maxlength', '200');
	
	var divConteudoModal =  $("<div>").addClass("conteudo-profissional")
									  .append("Ocupação : " + data[0].profissionalFk.ocupacao + "<br/>")
									  .append("Nivel de Experiência: <span name='exp' data-year='" + anosExp + "'" + " data-month='" + mesExp +  "'>" + experiencia + "</span><br/>")
									  .append("Email: " + data[0].profissionalFk.email + "<br/>")
									  .append("<address>")
									  .append("Endereço : " + data[0].profissionalFk.logradouro + "<br/>")
									  .append("CEP : " + data[0].profissionalFk.cep + "<br/>")
									  .append("</address>")
									  .append("<hr/>")
									  .append('Descrição :')
									  .append(textArea);
	var divAntesComments;
	if(data[0].descricao){
		
		var divAntesComments = $("<div>").addClass("clear")
		.html('Comentários');
		
		$.each(data, function(i, item){
			var div = $('<div>');
			var span = $("<span>").addClass('span-right')
			.html(item.nomeSolicitante);
			
			var textArea = $('<textarea>').addClass('form-control')
			.addClass('commentText')
			.attr('disabled', 'disabled')
			.css('height', '35px')
			.html(item.descricao);
			
			divAntesComments.append(div.append(textArea).append(span));
		});
		
	}
	var divModalBody = $("<div>").addClass("modal-body").append(divConteudoModal)
														.append(figure)
														.append(divAntesComments);
	
	var divBotaoEnviarSolicitacao = $("<div>").attr("id", "enviarSolicitacao")
											  .addClass("btn-group btn-group-justified")
											  .attr("role", "group")
											  .append("<a href='#' class='btn btn-primary' role='button'>Enviar Solicitação</a>")
											  .attr("onclick", "enviaSolicitacao(" + data[0].profissionalFk.id + ")");
												
	

	
	var divModalHeader = $("<div>").addClass("modal-header").css('background-color', '#8A2BE2').html('<span style="text-align:center"><b>' + data[0].profissionalFk.nome + '</span>');
	
	var divModalContent = $("<div>").addClass("modal-content")
									.append(divModalHeader)
									.append(divModalBody)
									.append(divBotaoEnviarSolicitacao);
	
	
	var divModalDialog = $("<div>").addClass("modal-dialog")
									.attr("id", "box-profissional")
									.attr("role", "dialog")
									.on('hidden', function(){$(this).remove();})
									.append(divModalContent);
	
	
	var divModalFade = $("<div>").addClass("modal fade")
								 .attr("id", "box")
								 .attr("name", "box")
								 .append(divModalDialog);
	divModalFade.modal("show");
}

function montaModalProfissional(profissional, id){
	var prof = $(profissional);

	
	var photo = $(profissional).find('#'+id).attr('src');
	
	
	$.ajax({
		url: "LocalizarServlet",
		dataType: 'json',
		data: {
			coment:'comentario',
			id: $(profissional).find('.img-rounded').attr('id')
		},
		method: 'POST',
		success :  function (data){
			console.log(data);

			data.photo = photo;
			montaModal(data);
//			console.log(data);
		}
	});
	
}

function limpaModaisAntigas(){
	$('#box').each(function(index){
		if($(this).css('display') == 'none'){
			$(this).remove();
		}
	})
}
