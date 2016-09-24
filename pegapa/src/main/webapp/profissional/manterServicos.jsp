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
				<span style="float:right; height:100%; padding-right: 10px; line-height: 40px;">${prof.nome}</span>
			</div>
		</header>
	
		<div role="main">
			
			<div class="row" style="margin: 0 auto 15px; width:100%; padding:0; float:right;">
				<h4 class="col-md-8" style="text-align: left;">Portfólio de Serviços</h4>
				<div class="col-md-4"><button class="btn btn-info btn-lg btn-block" style="float:left;" onclick="$('#novo-servico').modal();">Novo Serviço</button></div>
			</div>
			<div class="clearfix"></div>
			<c:if test="${empty lista }">
				<div class="alert alert-warning">
					<span class="glyphicon glyphicon-record"></span> <strong>Atenção</strong>
                	<hr class="message-inner-separator">
					Você não possui nenhum serviço cadastrado ainda!
				</div>
			</c:if>
			<c:if test="${not empty lista }">
			<table id="mytable" class="table table-bordred table-striped">
				<thead>
					<th>Nome do Serviço</th>
					<th>Descrição</th>
					<th>Preço</th>
					<th>Editar</th>
					<th>Excluir</th>
				</thead>
				
			
				<tbody style="text-align:left">
					<c:forEach items="${lista}" var="item" >
						<tr name="itemServico" id="${item.id}">
							<td name="nomeServ">${item.nome}</td>
							<td name="descServ">${item.descricao}</td>
							<td name="precoServ">${item.precoFormatado}</td>
							<td name="edit"><a onclick="editarServico(${item.id});">Editar</a></td>
							<td name="delete"><a onclick="deletarServico(${item.id});">Excluir</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
		</div>
	
		<footer class="row footer-page">
			
		</footer>
	</div>
	<div class="modal fade" id="novo-servico" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					Novo Serviço
				</div>
				<div class="modal-body">
					<form name="cadastrarServico" method="post" action="/pegapa/cadastrarProfissional?cadastraServ=S">
						<fieldset class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Nome do Serviço</span> 
								<input type="text" class="form-control" id="nomeServ" name="nomeServ" placeholder="Ex: Pintura de Fachada, Reforma de armários...etc" />
							</div>
							<div style="margin-top:20px;">
	  							<label class="control-label" for="textarea">Descrição do serviço</label>
	  							<div>                     
	    							<textarea class="form-control" maxlength="200" id="textarea"
	    							 name="descricaoServ" placeholder="Insira aqui uma breve descrição sobre este serviço."></textarea>
	  							</div>
							</div>
							<div class="input-group" style="margin-top:20px;">
								<span class="input-group-addon">Preço Base</span> 
								<input type="text" class="form-control" id="preco" name="precoServ"/>
							</div>
							<div style="margin-top:20px" class="pull-right">
								<button id="sucesso" type="button" onclick="submeterCadastroServico();" class="btn btn-success">Salvar</button>
	    						<button id="cancelar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
							</div>
						</fieldset>
					</form>
				</div>
				<div class="btn-group-justified">
					<a href='#' id="button" class='btn btn-primary' role='button'></a>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<div class="modal fade" id="editar-servico" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					Editar Serviço
				</div>
				<div class="modal-body">
					<form name="formEditarServico" method="post" action="/pegapa/cadastrarProfissional?editarServ=S">
						<fieldset class="form-group" id="fieldset_editar">
							<input type="hidden" id="idServico" name="idServico" value=""/>
							<div class="input-group">
								<span class="input-group-addon">Nome do Serviço</span> 
								<input type="text" class="form-control" name="_edit_nome" id="nomeServ_edit" />
							</div>
							<div style="margin-top:20px;">
	  							<label class="control-label" for="textarea">Descrição do serviço</label>
	  							<div>                     
	    							<textarea class="form-control" maxlength="200" id="textarea_edit" name="_edit_text"></textarea>
	  							</div>
							</div>
							<div class="input-group" style="margin-top:20px;">
								<span class="input-group-addon">Preço Base</span> 
								<input type="text" class="form-control" id="preco_edit" name="_edit_preco"/>
							</div>
							<div style="margin-top:20px" class="pull-right">
								<button id="sucesso" type="button" onclick="submeterEditarServico();" class="btn btn-success">Confirmar</button>
	    						<button id="cancelar" class="btn btn-danger" data-dismiss="modal">Desfazer</button>
							</div>
						</fieldset>
					</form>
				</div>
				<div class="btn-group-justified">
					<a href='#' id="button" class='btn btn-primary' role='button'></a>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="deletar-servico" role="dialog">
		<form name="formDeletarServico" method="get">
		<input type="hidden" name="deletarServ" value="S">
		<input type="hidden" name="idServicoDeleta" id="idServicoDeleta" value="S">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					Deletar Serviço
				</div>
				<div class="modal-body">
					<p>Tem certeza que deseja deletar este serviço?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="deletarServico" onclick="submeterDeletarServico();">Sim</button>
    				<button type="button" data-dismiss="modal" class="btn">Não</button>
				</div>
			</div>
		</div>
		</form>
	</div>
	
	<script type="text/javascript" src="/pegapa/javascript/jquery-2.2.3.js"></script>
	<script type="text/javascript" src="/pegapa/javascript/jquery.price_format.2.0.min.js"></script>
	<script src="/pegapa/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/pegapa/javascript/profissional.js" async="true" charset="utf-8"></script>
	<script>
		$(document).ready(function(){
			$('#preco, #preco_edit').priceFormat({
				prefix: 'R$ ',
				centsSeparator: ',',
				thousandsSeparator: '.'
			});
		})
	</script>
</body>
</html>