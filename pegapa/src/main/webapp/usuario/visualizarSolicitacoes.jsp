<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Bootstrap -->
	<link href="/pegapa/css/bootstrap.min.css" rel="stylesheet">
	<link href="/pegapa/css/style.css" rel="stylesheet">
	<link href="/pegapa/estilos/estilos.css" rel="stylesheet">
	<link href="/pegapa/estilos/jquery.bxslider.css" rel="stylesheet">
	<link href="/pegapa/estilos/estilo-form.css" rel="stylesheet">

	<!-- Bootstrap select -->
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />

	<title>Solicitações</title>
</head>
</head>
<body>
	<div class="container-fluid" >
		<header class="row header-page" style="display:flex;" >
			<!-- GAMBIARRA NA TAG FIGURE, RETIRAR DEPOIS -->
			<figure style="float:left; padding-right:15px; order:1; position: relative; top: -17px;">
 				<a href="paginaInicial.jsp"><img src="/pegapa/estilos/images/logo_pegapa.png" width="130px;" /></a>
			</figure>
			<div class="welcome" style="width: 82%; order:2">
				<span class="glyphicon glyphicon-user" style="float: right; line-height: 33px;"></span>
				<span style="float:right; height:100%; padding-right: 10px; line-height: 40px;">${user.nome}</span>
			</div>
		</header>
	
		<div role="main">
		<form action="/pegapa/ServletUsuario" method="post" name="visualizarSolicUser">
			<input type="hidden" value="${user.cod_user}" name="codUser">
			<input type="hidden" value="S" name="visualiz"/>
		</form>
			<i id="help" class="glyphicon glyphicon-question-sign" style="float:right"></i>
			<div class="row" style="margin: 0 auto 15px; width:80%; padding:0">
			<h4>Solicitações Enviadas</h4>
			<p>Aqui você visualizará todas as solicitações feitas por você.</p>
			</div>
			
			<c:if test="${not empty finalizar }">
				<div id="msgSucesso" class="alert alert-success container-main alert-dismissable fade in" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
	    				<span aria-hidden="true">&times;</span>
	  				</button>
					Obrigado, sua avaliação foi registrada com Sucesso
				</div>
			</c:if>
			<c:if test="${not empty cancelar }">
				<div id="msgCancelar" class="alert alert-success container-main alert-dismissable fade in" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
	    				<span aria-hidden="true">&times;</span>
	  				</button>
					Sua Solicitação foi Cancelada
				</div>
			</c:if>
			
			<c:if test="${empty lista }">
				<div class="alert alert-warning container-main">
					<span class="glyphicon glyphicon-record"></span> <strong>Atenção</strong>
                	<hr class="message-inner-separator">
					Você não possui solicitações pendentes 
				</div>
			</c:if>
			
			<select class="selectpicker" data-width="80%" onchange="filtraPorStatus();" >
				<option value="Todos" selected>Todos</option>
				<option value="Fin">Finalizado</option>
				<option value="Can">Cancelado</option>
				<option value="Env">Enviado</option>
				<option value="Con">Confirmado</option>
			</select>
			<div style="margin-top:25px;"></div>
			<c:forEach items="${lista}" var="item" >
				<div class="row well" style="margin: 0 auto 15px; width:80%; padding:0">
					
					<div class="media" style="padding:19px;" >
						<input type="hidden" name="idSolic" id="${item.idSolicitacao}"/>
						<div class="pull-left">
							<img src="/pegapa/LocalizarServlet?img=${item.profissional.id}" class="media-object media-icons" height="75px;" width="75px;">
						</div>
						
						<div class="media-body" style="text-align:left; height:75px">
							<div style="width:60%; overflow: hidden; float:left; margin-bottom:15px ">
								<h4 class="media-heading">${item.profissional.nome } - ${item.profissional.ocupacao} </h4>
								<small>${item.nomeServico}</small>
							</div>
							<small style="float:right;"><i style="font-style:italic; color: gray;">Solicitado em: ${item.dtFormatada }</i></small><br/>
							<small style="float:right;" ><i style="font-style:italic; color: gray;" data-name="statusSolic"> ${item.situacaoEDataModificacaoFormatada }</i></small>
							<span style="clear: both; float: left; display: block;">Seu pedido</span>
							<textarea style="clear:both; font-style:italic; width:100%" disabled>${item.descricaoSolicitacao }</textarea>
							<span style="clear: both; float: left; display: block; margin-top:10px;">Resposta do Profissional:</span>
							<textarea style="clear:both; font-style:italic; width:100%" disabled>${item.respostaSolicitacao}</textarea>
<%-- 							<address class="ender">Endereço: ${item.usuario.endereco.rua }, ${item.usuario.endereco.numero }, ${item.usuario.cidade}</address> --%>
<%-- 							<p style="width:50%; float:left;"><i class="glyphicon glyphicon-earphone"> ${item.usuario.telefone}</i> --%>
						</div>
						<c:if test="${item.situacao eq 'ENVIADO'}">
							<a class="btn btn-sm btn-warning pull-right" data-id="${item.idSolicitacao}" onclick="cancelarSolicitacao(${item.idSolicitacao});" style="margin-top:5px;" href="#"><span class="glyphicon glyphicon-ban-circle"></span> Cancelar</a>
						</c:if>

						<c:if test="${item.situacao eq 'CONFIRMADO'}">
							<a class="btn btn-sm btn-primary pull-right" name="finalizar-servico" data-type-profile="prof" data-id="${item.idSolicitacao}" style="margin-top:5px;" href="#"><span class="glyphicon glyphicon-ok"></span>Finalizar</a>
						</c:if>
					</div>
		
				</div>
			</c:forEach>
		</div>
	
		<footer class="row footer-page">
			
		</footer>
	</div>

	<div class="modal fade" id="finalizacao-solicitacao" data-backdrop="static">
		<div class="modal-dialog">
        	<div class="modal-content">
            	<div class="modal-header">
            		<h4 class="modal-title">Confirmação</h4>
            	</div>
            	<div class="modal-body">
            		<p class="text-warning">Confirme se você deseja nos informar que sua solicitação foi atendida, e finalizada.<br/><small>Em seguida será solicitada
            		 uma breve avaliação sua sobre o profissional que o atendeu.</small></p>
            		 <form class="form-inline">
    					<div class="form-group">
        					<label>Informe-nos, de 0 a 10 a sua avaliação sobre o serviço prestado pelo profissional</label>
        					<input class="form-control" placeholder="Nota" maxlength="2" id="nota" type="text">
    					</div>
    					<div class="form-group" style="margin-top:10px; width:95%">
    						<textarea class="form-control" style="width:100%" id="comentarioAvaliacao"
    						placeholder="Insira um comentário sobre o serviço prestado pelo profissional"></textarea>
    					</div>
    				</form>
            	</div>
            	<div class="modal-footer" style="clear:both">
            		<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                	<button type="button" class="btn orange" onclick="avaliarFinalizarSolicitacao();">Confirmar</button>
            	</div>
            </div>
        </div>
	</div>
	<script type="text/javascript" src="/pegapa/javascript/jquery-2.2.3.js"></script>
	<script src="/pegapa/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/pegapa/javascript/profissional.js" async="true" charset="utf-8"></script>
	<script type="text/javascript" src="/pegapa/javascript/usuario.js" async="true" charset="utf-8"></script>
	<!-- bootstrap select js -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/jquery.validate.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/additional-methods.js"></script>
	<script type="text/javascript">
	$('.selectpicker').val(1);
	$('.selectpicker').selectpicker('refresh');
	</script>
</body>
</html>