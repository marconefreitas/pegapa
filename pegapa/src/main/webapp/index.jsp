<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
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
	
	
	
</head>
<body>
	<div class="container-fluid" >
		<header class="row" >Header</header>
		
		<div class="row" >
			<div role="main">
				<ul class="carr">
					<li>	
						<div class="login" id="login-fornecedor-box">
						<p class="titulo-form">Cadastro De Fornecedores</p>
						    <input type="text" placeholder="Username" name="usernameFornecedor" id="usernameFornecedor" class="user-login">  
						  	<input type="password" placeholder="password" name="passwordFornecedor" id="passwordFornecedor" class="user-pass">  
						  	<a href="#" class="forgot">Esqueceu a Senha?</a>
						  	<input type="submit" value="Login" onclick="autenticaUsuario('1');" id="login-fornecedor">
						  						<br/>ou
						  	<input type="submit" value="Cadastro" style="margin-top:5px;" id="ativa-cadastrar-fornecedor">
						</div>
					</li>
					<li>
						<div class="login" id="login-usuario-box" >
							<form name="login-usuario-box" method="post" action="cadastrarUsuario?login=S">
								<p class="titulo-form">Cadastro De Usuários</p>
							    <input type="text" placeholder="Username" id="usernameUsuario" class="user-login" name="username-user">  
							  	<input type="password" placeholder="password" id="passwordUsuario" class="user-pass"  name="password-user">  
							  	<a href="#" class="forgot">Esqueceu a Senha?</a>
							  	<input type="submit" value="Login" onclick="" id="login-usuario">
							  						<br/>ou
							  	<input type="button" value="Cadastro" style="margin-top:5px;" id="ativa-cadastrar-usuario">
						  	</form>
						</div>
					</li>
					
					<li>
						<div class="login">
						<form  name="login-profissional-box" method="post" action="cadastrarProfissional?login=S" >
							<p class="titulo-form">Cadastro De Profissionais</p>
						    <input type="text" placeholder="Username" name="username-prof" id="username-prof" class="user-login">  
						  	<input type="password" placeholder="password" name="password-prof" id="password-prof" class="user-pass">  
						  	<a href="#" class="forgot">Esqueceu a Senha?</a>
						  	<input type="submit" value="Login" onclick="" id="login-profissional">
						  						<br/>ou
						  	<input type="button" value="Cadastro" style="margin-top:5px;" id="ativa-cadastrar-profissional">
						</form>
						</div>
					</li>
				</ul>
			</div>
			<!-- Modal de cadastro de usuario -->
			<jsp:include page="cadastro-usuario.jsp" ></jsp:include>
			<!-- Modal de cadastro de profissional -->
			<jsp:include page="cadastro-profissional.jsp"></jsp:include>
			
			<section role="application" class="row" style="background-color: #fff;">
				<jsp:include page="localizar.jsp"></jsp:include>
			</section>
			
<!-- 			<aside role="complementary" class="col-md-2 col-md-push-2"> -->
<!-- 				ASIDE 1 -->
<!-- 			</aside> -->
			
<!-- 			<nav class="col-md-2 col-md-pull-10"> -->
<!-- 				NAVIGATOR -->
<!-- 			</nav> -->
		</div>
		<footer class="row">
			footer
		</footer>
		
		
	</div>
<!-- jQuery (necessario para os plugins Javascript Bootstrap) -->
<!-- <script src="js/jquery.js"></script> -->

<script type="text/javascript" src="javascript/inputMask.js"></script>
<!-- <script src="js/bootstrap.min.js"></script> -->

<script type="text/javascript" src="javascript/jquery.bxslider.js"></script>

<!-- Javascripts da aplicação -->
<script type="text/javascript" src="javascript/usuario.js" charset="utf-8"></script>
<!-- <script type="text/javascript" src="javascript/profissional.js" charset="utf-8"></script> -->
<script type="text/javascript" src="javascript/recursos.js" charset="utf-8"></script>
<script type="text/javascript" src="javascript/busca.js" charset="utf-8"></script>

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
	$('input[data-masc="telreferencia"]').mask("(99) 999999999", {placeholder: " "});
	
	//CADASTRA 	


	$("#ativa-cadastrar-fornecedor").click(function(){
		$('#modal-cadastro-fornecedor').modal();
	});
	
});
</script>
</body>
</html>