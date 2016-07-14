<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	<link href="estilos/estilos.css" rel="stylesheet">
	<link href="estilos/estilo-form.css" rel="stylesheet">
	<title>Resultado da Busca</title>
</head>
<body>
	<div class="container-fluid" >
		<header class="row" >
			Header
		</header>
		<div class="row" >
			<div role="main">
				<ul class="list-group">
					<c:forEach items="${lista}" var="item">
						<li>
							<div class="panel panel-default">
								<div class="panel-body" style="text-align:left; cursor: pointer;" onclick="selecionaProfissional(${item.id})">
									<div class="panel-info" style="float: left;">
<%-- 										<input type="hidden" value="${item.id}"> --%>
										<p><strong><c:out value="${item.nome}"/></strong></p>
										<adress>
											Cidade: <c:out value="${item.cidade}"/><br/>
											Estado: <c:out value="${item.estado}"/><br/>
										</adress>
										Nivel de Experiência :<c:out value="${item.experiencia}"/><br/>
										Ocupação : <c:out value="${item.ocupacao}"/><br/>
									</div>
									<figure class="panel-image" style="float:left; margin:0 10px">
										<img src="imagemteste.jpg" style="min-width: 80px;">
									</figure>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<footer class="row">
			footer
		</footer>
	</div>


<script type="text/javascript" src="javascript/jquery-2.2.3.js"></script>
<script type="text/javascript" src="javascript/inputMask.js"></script>

<script src="js/bootstrap.min.js"></script>

<script type="text/javascript" src="javascript/profissional.js" charset="utf-8"></script>
<script type="text/javascript" src="javascript/busca.js" charset="utf-8"></script>
</body>
</html>