/**
 * 
 */
$('#ordenation-professional').click(function(){
	var profissionaisOrdenados = $('#section-professionals .profissional-box')
	.get()
	.sort(function (a, b){
		var nota1 = $(a).find('#notaProf').val();
		var nota2 = $(b).find('#notaProf').val();
		nota1 =  (nota1 == ""? 0 : nota1);
		nota2 = (nota2 == ""? 0:nota2);
		return nota2 > nota1;
	})
	.map(function(el){
		return $(el).clone(true)[0];
	});
	$('#section-professionals').html(profissionaisOrdenados);
	$('#ordenation-success').show();
	setTimeout(function(){
		$("#ordenation-success").css("display","none");
	}, 2000);  
})

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
	}else{
	
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
	estado = $( "#localiza-estado option:selected" ).val() == "Selecione um Estado" ? "" : $( "#localiza-estado option:selected" ).val();
	cidade = $( "#localiza-cidade option:selected" ).val() == "Selecione uma Cidade"? "": $( "#localiza-cidade option:selected" ).val(); 
	bairro = $( "#localiza-bairros option:selected" ).val() == "Selecione um Bairro"? "": $( "#localiza-bairros option:selected" ).val(); 
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
	$('#msgSucesso').hide();
	
	var anosExp = data.anosExperiencia;
	var mesExp = data.mesesExperiencia
	
	var experiencia = anosExp +  ' ano(s) e ' + mesExp + ' mes(es)';
	var src = data.photo;
	var figure = $('<figure>').addClass('figure-prof')
							  .append($('<img>').attr('src', data.photo));
	
	/* ---------------------------------- MONTA O TEXTAREA COM A DESCRIÇÃO DO PROFISSIONAL -----------------------------------------*/
	var textArea = $('<textarea>').addClass('form-control')
								  .addClass('commentText')
								  .attr('id', data.id + 'txArea')
								  .attr('placeholder' , 'Insira aqui uma pequena descrição da sua solicitação. Max : 200 caracteres')
								  .attr('maxlength', '200');
	
	var cabecalhoTextArea = $('<div>').addClass('label-textarea')
									  .html("Descrição da Solicitação");
	
	var descricaoProfissional = $('<div>').addClass('input-group')
										  .addClass('input-custom-group')
										  .append(cabecalhoTextArea)
										  .append(textArea);
	/* ----------------------------------  ---------------- FIM ----------------- ---------------------------------- --------------*/
	
	
	/* ---------------------------------- MONTA A TAG SELECT COM OS SERVIÇOS DO PROFISSIONAL -----------------------------------------*/
	var servicosSelect = $('<select id="select' + data.id + '" style="float:left">');
	var servicosOptions = "<option selected value='0'>Escolha um Serviço</option>";
	
	if(data.servicos.length > 1){
		$.each(data.servicos, function(index, value){
			servicosOptions += '<option value="' + value.id + '">' + value.nome + '</option>'; 
		});
	} else if(data.servicos.length == 1){
		servicosOptions += '<option value="' + data.servicos[0].id + '">' + data.servicos[0].nome + '</option>'
	} else{
		servicosOptions = "<option selected value='0'>Nenhum Serviço Cadastrado</option>";
		$(servicosSelect).attr('disabled', 'disabled');
	}
	servicosSelect.append(servicosOptions);
	/* ---------------------------------- FIM ------------------------------------------------------------------------------------------*/
	
	var abreTagLabel = "<label style='font-weight:normal;'>";
	var fechaTagLabel = "</label>";
	
	var divConteudoModal =  $("<div>").addClass("conteudo-profissional")
									  .css('float', 'left')
									  .append("<label>Ocupação :</label> <br/>")
									  .append("<label>Nivel de Experiência: </label><br/>")
									  .append("<label for='mail'>Email: </label><br/>")
									  .append("<label>Bairro : </label> <br/>")
									  .append("<label>CEP :</label> <br/>")
									  .append("<label>Avaliação no Sistema :</label>")
									  .append("<label style='line-height:16px;'> Serviços Cadastrados:</label>" )
									  .append("<hr/>");
	
	var notaProfissional  = "Não Definida";
	if(data.nota){
		notaProfissional = data.nota;
	}
	
	var divConteudoModal1 = $("<div>").css('float', 'left')
				.append(abreTagLabel + data.ocupacao + fechaTagLabel)
				.append('</br>')
				.append(abreTagLabel +  "<span name='exp' data-year='" + anosExp + "'" + " data-month='" + mesExp +  "'>" + experiencia + "</span>" + fechaTagLabel)
				.append('</br>')
				.append('<label id="mail" style="font-weight:normal;">' + data.email + fechaTagLabel)
				.append('</br>')
				.append(abreTagLabel + data.bairro + fechaTagLabel)
				.append('</br>')
				.append(abreTagLabel + data.endereco.cep + fechaTagLabel)
				.append('</br>')
				.append(abreTagLabel + notaProfissional + fechaTagLabel)
				.append('</br>')
				.append(servicosSelect)
	
	/* ----------------------------------------------------------- MONTA A PARTE DOS COMENTÁRIOS DO PROFISSIONAL -----------------------------------------*/
	var divAntesComments;
	if(data.comentarios.length > 0){
		
		var divAntesComments = $("<div>").addClass("clear")
		.html('Comentários');
		
		$.each(data.comentarios, function(i, item){
			var div = $('<div>').css( {"padding-top": "5px", "overflow": 'hidden'});
			var span = $("<span>").addClass('span-right')
			.html(item.nomeSolicitante);
			
			var textArea = $('<textarea>').addClass('form-control')
			.addClass('commentText')
			.attr('disabled', 'disabled')
			.html(item.descricao);
			
			divAntesComments.append(div.append(textArea).append(span));
		});
		
	}
	
	/* ---------------------------------- FIM --------------------------------------------------------------------------------------*/
	
	/* ------------------------ INICIO BLOCKQUOTE ------------------------ */
	var blockquote = $('<pre>').css("white-space", "normal")
							   .css('min-height', '175px')
							   .html(data.descricaoProfissao);
	
	
	
	
	
	/* ------------------------ FIM BLOCKQUOTE ------------------------ */
	
	
	var fieldset = $('<fieldset>').addClass('form-group')
	 .css("width", "68%")
	 .css("float", "right")
	 .append(blockquote)
	 .append(divConteudoModal)
	 .append(divConteudoModal1);
	
	
	var divModalBody = $("<div>").addClass("modal-body")
								 .append(fieldset)
								 .append(figure)
								 .append(descricaoProfissional)
								 .append(divAntesComments);
	
	var divBotaoEnviarSolicitacao = $("<div>").attr("id", "enviarSolicitacao")
											  .addClass("btn-group btn-group-justified")
											  .attr("role", "group")
											  .append("<a href='#' class='btn orange' role='button'>Enviar Solicitação</a>")
											  .attr("onclick", "enviaSolicitacao(" + data.id + ")");
												
	

	
	var divModalHeader = $("<div>").addClass("modal-header").css('background-color', '#C0C0C0').html('<span style="text-align:center"><b>' + data.nome + '</span>');
	
	var divModalContent = $("<div>").addClass("modal-content")
									.append(divModalHeader)
									.append(divModalBody)
									.append(divBotaoEnviarSolicitacao);
	
	
	var divModalDialog = $("<div>").addClass("modal-dialog")
									.addClass("box-profissional")
									.attr("id", "box-profissional")
									.attr("role", "dialog")
									//.on('hidden', function(){$(this).remove();})
									.append(divModalContent);
	
	
	var divModalFade = $("<div>").addClass("modal fade")
								 .attr("id", "box")
								 .css('overflow', 'auto')
								 .attr("name", "box")
								 .append(divModalDialog);
	divModalFade.modal("show");
}

$('#box').on("modal.bs.hidden", function(e){
	$('.commentText').val("");
});

function montaModalProfissional(profissional, id){
	
	if($('#logged').val() == "sim"){
		recuperaProfissionalCompleto(profissional);
		
		var servicos;
		$('#msgSucesso').hide();
		var photo = $(profissional).attr('src');
		
		$.ajax({
			url: "LocalizarServlet",
			dataType: 'json',
			data: {
				coment:'comentario',
				id: $(profissional).attr('id')
			},
			method: 'POST',
			beforeSend: function(){ 
				buscaServicosPorProfissional($(profissional).attr('id')).done(function(data){
					servicos = data;
					console.log(servicos);
				});
					
			},
			success :  function (data){
				console.log(data);
				data.photo = photo;
				data.servicos = servicos;
				montaModal(data);
			}
		});
		
	} else{
		$('#not-logged').modal();
	}
	
	
}

function limpaModaisAntigas(){
	$('#box').each(function(index){
		if($(this).css('display') == 'none'){
			$(this).remove();
		}
	})
}

function buscaServicosPorProfissional(id){
	var retorno;
	return $.ajax({
		url: "LocalizarServlet",
		dataType: 'json',
		data: {
			servicos:'s',
			id: id
		},
		method: 'POST',
//		success :  function (data){
//		}
	});
}


function recuperaProfissionalCompleto(profissional){
	var photo = $(profissional).attr('src');
	
	$.ajax({
		url: "LocalizarServlet",
		dataType: 'json',
		data: {
			all:'s',
			id: $(profissional).attr('id')
		},
		method: 'POST',
		success :  function (data){
			data.photo = photo;
			montaModal(data);
		}
	});
}


