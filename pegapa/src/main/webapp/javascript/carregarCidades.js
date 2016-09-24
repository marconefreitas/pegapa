/**
 * 
 */
function carregarCidades(type){
	
	var codigo = $('#editar-estado-' + type + ' option:selected').val();
	if(codigo == 'Selecione um Estado'){
		alert('Selecione um Estado');
		return;
	}
	$('#editar-cidade-' + type).empty().append("<option data-hidden='true'>Selecione uma Cidade</option>");
	$('#editar-bairros-' + type).empty().append("<option data-hidden='true'>Selecione um Bairro</option>");
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
			$("#editar-cidade-" + type).append(options);
			$(".selectpicker").selectpicker('refresh');
		}
	});
	
}

function carregarBairros(type){
	var codigo = $('#editar-cidade-' + type + ' option:selected').val();
	if(codigo == 'Selecione uma Cidade'){
		alert('Selecione uma Cidade');
		return;
	}
	
	$("#editar-bairros-" + type).empty().append("<option data-hidden='true'>Selecione um Bairro</option>");
	$.ajax({
		url: '/pegapa/SelectServlet',
		method: 'POST',
		data: {
				carregaBairros:'carregaBairros', 
				localizaCidade : codigo
			},
		success: function(data){
			if(data){
				data = jQuery.parseJSON(data);
				var options;
				$.each(data, function(key, value){
					options += '<option value="' + value.cod + '">' + value.nome + '</option>'
					
				});
				$("#editar-bairros-" + type).append(options);
			}else{
				$("#editar-bairros-" + type).empty().append("<option data-hidden='true'>Nenhum Bairro Cadastrado Ainda</option>");
			}
			$('.selectpicker').selectpicker('refresh');
			
		}
	});
}