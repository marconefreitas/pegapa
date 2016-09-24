<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>PegaPá</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Bootstrap -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	<link href="estilos/estilos.css" rel="stylesheet">
	<link href="estilos/jquery.bxslider.css" rel="stylesheet">
	<link href="estilos/estilo-form.css" rel="stylesheet">
	<!-- Bootstrap select -->
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />
	
	<link rel="shortcut icon" href="icopegapa.png" >
	
</head>
<body>
	<div class="container-fluid"  >
		<header class="row header-page principal" style="margin-bottom:0">
			<figure style="float:left; padding-right:15px; top:1px; position:absolute;">
 				<img src="estilos/images/logo_pegapa.png" width="130px;" />
			</figure>
		</header>
		
		<div class="row " style="margin-bottom: 0">
			<div role="main" class="main " style="background-image: url(/pegapa/estilos/images/background-ini.jpg); min-hieght:480px;">
				
				<div class="filho-da-main">
					<h2>Escolha uma Opção</h2>
					<ul>
						<li><a href="#" onclick="renderizaLoginUsuario();"><img src="estilos/images/tp_user/usuario.png" alt="Usuário" title="Usuário"></a></li>
						<li><a href="#" onclick="renderizaLoginFornecedor();"><img src="estilos/images/tp_user/fornecedores.png" alt="Fornecedor" title="Fornecedor"></a></li>
						<li><a href="#" onclick="renderizaLoginProfissional();"><img src="estilos/images/tp_user/engenheiro.png" alt="Profissional" title="Profissional"></a></li>

					</ul>
				</div>
			</div>
			<!-- Modal de cadastro de usuario -->
			<jsp:include page="cadastro-usuario.jsp" ></jsp:include>
			<!-- Modal de cadastro de profissional -->
			<jsp:include page="cadastro-profissional.jsp" ></jsp:include>
			
			<jsp:include page="cadastro-fornecedor.jsp" ></jsp:include>
			
			<section role="application" class="row" style="background-color: #ffa500; margin-bottom:0; padding-bottom:0;">
				<jsp:include page="localizar.jsp"></jsp:include>
			</section>
			
<!-- 			<aside role="complementary" class="col-md-2 col-md-push-2"> -->
<!-- 				ASIDE 1 -->
<!-- 			</aside> -->
			
<!-- 			<nav class="col-md-2 col-md-pull-10"> -->
<!-- 				NAVIGATOR -->
<!-- 			</nav> -->
				<div class="login" id="login-fornecedor-box" style="display: none;">
					<form name="login-fornecedo-box" method="post" action="/pegapa/ServletFornecedor?login=S" >
						<p class="titulo-form">Cadastro De Fornecedores</p>
					    <input type="text" placeholder="Email" name="usernameFornecedor" id="usernameFornecedor" class="user-login">  
					  	<input type="password" placeholder="password" name="passwordFornecedor" id="passwordFornecedor" class="user-pass">  
					  	<a href="#" class="forgot">Esqueceu a Senha?</a>
					  	<input type="button" value="Login" id="login-fornecedor">
					  						<br/>ou
					  	<input type="button" value="Cadastro" style="margin-top:5px;" id="ativa-cadastrar-fornecedor">
					</form>
				</div>
				<div class="login" id="login-usuario-box" style="display:none;" >
					<form name="login-usuario-box" method="post" action="ServletUsuario?login=S">
						<p class="titulo-form">Cadastro De Usuários</p>
					    <input type="text" placeholder="Username" id="usernameUsuario" class="user-login" name="username-user">  
					  	<input type="password" placeholder="password" id="passwordUsuario" class="user-pass"  name="password-user">  
					  	<a href="#" class="forgot">Esqueceu a Senha?</a>
					  	<input type="submit" value="Login" onclick="" id="login-usuario">
					  						<br/>ou
					  	<input type="button" value="Cadastro" style="margin-top:5px;" id="ativa-cadastrar-usuario">
				  	</form>
				</div>
				<div class="login" id="login-profissional-box" style="display:none;">
				
					<form name="login-profissional-box" method="post" action="cadastrarProfissional?login=S" >
						<p class="titulo-form">Cadastro De Profissionais</p>
					    <input type="text" placeholder="Username" name="username-prof" id="username-prof" class="user-login">  
					  	<input type="password" placeholder="password" name="password-prof" id="password-prof" class="user-pass">  
					  	<a href="#" class="forgot">Esqueceu a Senha?</a>
					  	<input type="submit" value="Login" onclick="" id="login-profissional">
					  						<br/>ou
					  	<input type="button" value="Cadastro" onclick=""  style="margin-top:5px;" id="ativa-cadastrar-profissional">
					</form>
				</div>
		</div>
		<footer class="row footer-page">
<!-- 		<div id="map" style="width: 400px; height: 300px"></div>  -->
		</footer>
		<div class="back" style="float:left; display:none; background-image:url(estilos/images/bground.png);"></div>
		
	</div>
<!-- jQuery (necessario para os plugins Javascript Bootstrap) -->
<!-- <script src="js/jquery.js"></script> -->

<script type="text/javascript" src="javascript/inputMask.js"></script>
<!-- <script src="js/bootstrap.min.js"></script> -->

<script type="text/javascript" src="javascript/jquery.bxslider.js"></script>

<!-- Javascripts da aplicação -->
<script type="text/javascript" src="javascript/usuario.js" charset="utf-8"></script>
<script type="text/javascript" src="javascript/fornecedor.js" charset="utf-8"></script>
<script type="text/javascript" src="javascript/profissional.js" charset="utf-8"></script>
<script type="text/javascript" src="javascript/recursos.js" charset="utf-8"></script>
<script type="text/javascript" src="javascript/busca.js" charset="utf-8"></script>
<!-- <script src="https://use.fontawesome.com/b773fb98b0.js"></script> -->
<script type="text/javascript">


$(document).ready(function(){
	var slider =  $('.carr').bxSlider({
  	startSlide: 0,
  	infiniteLoop: false
	
	});
	$('input[data-masc="cep"]').mask("99999-999");
	$('input[data-masc="telefone"]').mask("(99) 9999-9999");
	$('input[data-masc="celular"]').mask("(99) 99999-9999");
	$('input[data-masc="cpf"]').mask("999.999.999-99");
	$('input[data-masc="cnpj"]').mask("99.999.999/9999-99");	
	//CADASTRA 	


	$("#ativa-cadastrar-fornecedor").click(function(){
		$('#modal-cadastro-fornecedor').modal();
	});


	
	
});

function renderizaLoginFornecedor(){
	$('.filho-da-main').replaceWith($('#login-fornecedor-box').css('display', 'block'));
	//$('section[role="application"]').css('display', 'none');
	//$('.back').show();
	
}
function renderizaLoginUsuario(){
	$('.filho-da-main').replaceWith($('#login-usuario-box').css('display', 'block'));
}
function renderizaLoginProfissional(){
	$('.filho-da-main').replaceWith($('#login-profissional-box').css('display', 'block'));
}
function renderizarOFilhoDaMain(){
	//TODO - IMPLEMENTAR CODIGO AQUI QUANDO FOR NECESSARIO VOLTAR A MOSTRAR AS 3 IMAGENS INICIAIS
}

// var map;
// function initMap() {
//   map = new google.maps.Map(document.getElementById('map'), {
//     center: {lat: -23.6335749, lng: -46.6732745},
//     zoom: 25
//   });
// }
</script>
<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDmecxLqMgA1P4oGxQ9l4uVlqsZlMz1kH4&callback=initMap" type="text/javascript"></script> -->
</body>
</html>