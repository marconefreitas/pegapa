<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	<link href="estilos/estilos.css" rel="stylesheet">
	<link href="estilos/jquery.bxslider.css" rel="stylesheet">
	<link href="estilos/estilo-form.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<input type="button" value="ativa-modal" onclick="javascript:$('#modal-teste').modal('show');">

<div class="modal fade" id="modal-teste" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content" style="padding:15px">
					<div class="row">
						<div class="modal-body">
							<div class="conteudo-profissional" style="float: left; width:50%;"> 
								Marcone Freitas<br/>
								Ocupação: Serralheiro<br/>
								Nivel de Experiência: Junior<br/>
								Email: marcfreitas@gmail.com<br/>
								Telefone: (11) 5932-5454<br/>
								Celular: (11) 9 5656-7480<br/>
								Cidade: Guarulhos<br/>
								Estado: São Paulo<br/>
								Bairro: Grajaú<br/>
								<address>
									Endereço: Rua Teresa Farias Isassi, 20<br/>
									CEP: 04852-223<br/>
								</address>
								<hr>
								Nome da Referência: Teresa<br/>
								Telefone da Referência : (11) 4545-5151<br/> 
							</div>
							<figure style="float:left; width:90%;">
								<img src="teste.jpg">
							</figure>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="javascript/jquery-2.2.3.js"></script>
		<script type="text/javascript" src="javascript/inputMask.js"></script>
		<script src="js/bootstrap.min.js"></script>
</body>
</html>