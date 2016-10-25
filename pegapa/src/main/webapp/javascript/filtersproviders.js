/**
 * 
 */

$('#ordenation').on('click', function(){
	var fornecedoresOrdenados = $('#section-providers-physical .profissional-box')
											.get()
											.sort(function (a, b){
													var nota1 = $(a).find('#notaFornF').val();
													var nota2 = $(b).find('#notaFornF').val();
													nota1 =  (nota1 == ""? 0 : nota1);
													nota2 = (nota2 == ""? 0:nota2);
													return nota2 > nota1;
											})
											.map(function(el){
												return $(el).clone(true)[0];
											});
		$('#section-providers-physical').html(fornecedoresOrdenados);
		$('#ordenation-success').show();
		setTimeout(function(){
	        $("#ordenation-success").css("display","none");
	    }, 2000);  
});

$('#virtual-providers-ordenation').on('click', function(){
	var fornecedoresOrdenados = $('#section-providers-virtual .profissional-box')
											.get()
											.sort(function (a, b){
													var nota1 = $(a).find('#notaFornV').val();
													var nota2 = $(b).find('#notaFornV').val();
													nota1 =  (nota1 == ""? 0 : nota1);
													nota2 = (nota2 == ""? 0:nota2);
													return nota2 > nota1;
											})
											.map(function(el){
												return $(el).clone(true)[0];
											});
		$('#section-providers-virtual').html(fornecedoresOrdenados);
		$('#ordenation-success').show();
		setTimeout(function(){
	        $("#ordenation-success").css("display","none");
	    }, 2000);  
});

$('#ramoAtuacao').on('change', function(){
	var filtroEscolhido = $('#ramoAtuacao option:selected').val();
	
	$('.profissional-box').each(function(index){
		$(this).show();
	});
	if(filtroEscolhido == "None"){
		return;
	}
	
	$('.profissional-box').each(function(i){
		if($(this).find("#ramo").text() != filtroEscolhido){
			$(this).hide();
		}
	});
});

$('#ramoAtuacaoVirtual').on('change', function(){
	var filtroEscolhido = $('#ramoAtuacaoVirtual option:selected').val();
	
	$('.profissional-box').each(function(index){
		$(this).show();
	});
	if(filtroEscolhido == "None"){
		return;
	}
	
	$('.profissional-box').each(function(i){
		if($(this).find("#ramo").text() != filtroEscolhido){
			$(this).hide();
		}
	});
});