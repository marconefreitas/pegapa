/**Este documento deverá ter apenas funções javascripts relacionadas a
 * aceitação ou recusa de uma solicitação por parte de um fornecedor, bem como, se necessário
 * deverá ter também funções relativas ao histórico de solicitações de um fornecedor.
 * 
 */

function aceitarSolicitacaoForn(id){
	$('#modal-solicitacao').find('#button').text("Aceitar Solicitação");
	var inp = $('<input>').attr('type', 'hidden').val(id);
	$('#modal-solicitacao').append(inp);
	$('#modal-solicitacao').find('.modal-header').html('<b>Aceitar Solicitação</b>').css('background-color', '#C0C0C0');
	$('#modal-solicitacao').modal();
}

function recusarSolicitacaoForn(id){
	$('#modal-solicitacao').find('#button').text("Recusar Solicitação");
	var inp = $('<input>').attr('type', 'hidden').val(id);
	$('#modal-solicitacao').append(inp);
	$('#modal-solicitacao').find('.modal-header').html('<b>Recusar Solicitação</b>').css('background-color', '#C0C0C0');
	$('#modal-solicitacao').modal();
}
function submeterSolicitacaoForn(){
	if($('#respSolicitacao').val() == ""){
		alert('Informe o motivo do aceite ou da recusa desta solicitação');
		return;
	}
	
	var aceitar;
	if( $('#button').text() == "Aceitar Solicitação"){
		aceitar = 'S';
	} else{
		aceitar = 'N';
	}
	var id = $('#modal-solicitacao input[type="hidden"]').val();
	
	$.ajax({
		
		url: "/pegapa/cadastrarProfissional",
		data: {
			accSolic : aceitar,
			idSolicitacao : id,
			respSolicitacao : $('#respSolicitacao').val()
		},
		method: 'POST',
		success :  function (data){
			$('input[id="' + id + '"]').closest('.row').fadeOut("slow");
			
			$('#modal-solicitacao').modal('hide');
			if(aceitar == 'S'){
				$('#modal-sucesso').modal('show');
			} else if(aceitar == 'N'){
				$('#modal-recusa').modal('show');
			}
		}
	}).done(function(){
		 setTimeout(function() {
			 $('form[name="listarSolic"]').submit();
		 },1400);
	});
}


