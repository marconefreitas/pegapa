<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="shortcut icon" href="icopegapa.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	<link href="estilos/estilos.css" rel="stylesheet">
	<link href="estilos/estilo-form.css" rel="stylesheet">
	<link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />
	<title>Resultado da Busca</title>
</head>
<body>
	<div class="container-fluid">
	<input type="hidden" id="logged" value="${usuarioLogado}"/>
		<header class="row header-page" >
			<!-- GAMBIARRA NA TAG FIGURE, RETIRAR DEPOIS -->
			<figure style="float:left; padding-right:15px; top:1px; position:absolute;">
 				<a href="usuario/paginaInicial.jsp"><img src="/pegapa/estilos/images/backlogo.jpg" class="img-logo" /></a>
			</figure>
			<c:if test="${not empty usuarioLogado}">
				<div class="welcome" style="width: 90%; order:2">
					<span class="glyphicon glyphicon-user" style="float: right; line-height: 33px;"></span>
					<span style="float:right; height:100%; padding-right: 10px; line-height: 40px;">${user.nome}</span>
				</div>
			</c:if>
		</header>
		<div role="main" style="min-height:500px;">
			<div id="msgSucesso" class="alert alert-success container-main alert-dismissable fade in" role="alert" style="display:none;">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
    				<span aria-hidden="true">&times;</span>
  				</button>
				Solicitação Enviada com Sucesso
			</div>
			<div class="alert alert-success" role="alert" id="ordenation-success" hidden>
  				<strong>Ordenadação Concluída</strong>
			</div>
			<div class="row well well-sm" >
				<div class="col-md-12" style="text-align:left;">Filtros</div>    
	        	<div class="col-md-3" style="text-align:left;">
		        	<select class="selectpicker" id="filtros-select"> 
						<option value="n" selected="true">Nenhum</option> 
						<option value="o">Ocupação</option> 
						<option value="e">Experiência</option> 
					</select> 
				</div>
	        	
	        	<div class="col-md-3" id="filtros-ocupacao" style="display:none; text-align:left;">
					<select id="ocup-select" class="selectpicker"  >
						<option value="n" selected="true">Todas</option>
						<c:forEach items="${lista}" var="item" varStatus="status">
							<option name="ocupacoes" value="${item.ocupacao}">${item.ocupacao}</option>
						</c:forEach>
					</select>
				</div>
				
						
				<div class="col-md-3" id="filtros-experiencia" style="display:none; text-align:left;">
					<select id="exp-select" class="selectpicker"  >
						<option value="n" selected="true">Todos</option>
						<option value="1">Entre 0 e 3 anos</option>
						<option value="2">Entre 3 e 5 anos</option>
						<option value="3">Mais de 5 anos</option>
					</select>
				
				</div>
				<div class="col-md-1 col-xs-12">
					<button id="ordenation-professional" title="Ordenar por Nota"><i class="ion-podium" style="font-size: 26px; color:blue"></i></button>
				</div>
			</div>

			<div id="section-professionals">
			<c:forEach items="${lista}" var="item" varStatus="status">
				<div class="row profissional-box col-md-4 col-sm-6" >
					<div class="professional-box-intern">
					<input type="hidden" value="${item.anosExperiencia}" id="ano"/>
					<input type="hidden" value="${item.nota}" id="notaProf"/>
					<div style="float:left;">
						<img src="LocalizarServlet?img=${item.id}" id="${item.id}" onclick="recuperaProfissionalCompleto(this, ${item.id})" style="height:175px;width:156px;cursor:pointer;" class="img-rounded">
					</div>
					
					<div style="text-align:left; float:left; padding-left:9px;">
						<blockquote>
							<p class="name">${item.nome}</p>
							<small><cite>${item.bairro}, ${item.estado} <i class="icon-map-marker"></i></cite></small>
						</blockquote>
						<p>
	        				<i class="glyphicon glyphicon-envelope"></i><span class="mail" style="padding-left:10px;">${item.email}</span><br>
	        				<i class="glyphicon glyphicon-wrench"></i><span class="work" style="padding-left:10px;">${item.ocupacao}</span>
	      				</p>
					</div>
							
				</div>
				</div>
			</c:forEach>
			</div>
		</div>
		<div style="clear:both;"></div>
		<footer class="row footer-page">
		</footer>
	</div>
	<div class="modal fade" id="not-logged" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					PARA VERIFICAR MAIS DETALHES SOBRE O PROFISSIONAL, É NECESSÁRIO ESTAR LOGADO NO NOSSO SISTEMA
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript" src="javascript/jquery-2.2.3.js"></script>
<script type="text/javascript" src="javascript/inputMask.js"></script>

<script src="js/bootstrap.min.js"></script>

<script type="text/javascript" src="javascript/profissional.js" charset="utf-8"></script>
<script type="text/javascript" src="javascript/busca.js" charset="utf-8"></script>


<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/jquery.validate.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/additional-methods.js"></script>
<script type="text/javascript">
	$('.selectpicker').selectpicker({
	  size: 4
	});
	
	$('[name="ocupacoes"]').each(function(){
		  $(this).siblings("[value='"+ this.value+"']").remove();
	});
	$('.selectpicker').selectpicker('refresh');
</script>

</body>
</html>