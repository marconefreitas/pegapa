<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8" />
	<script type="text/javascript" src="javascript/jquery-2.2.3.js"></script>
	<script type="text/javascript" src="javascript/recursos.js" charset="utf-8"></script>
	<script type="text/javascript" src="javascript/jquery.bxslider.js"></script>
	<style type="text/css">
		@import url("estilos/estilos.css");
		@import url("estilos/jquery.bxslider.css");
		@import url("estilos/estilo-form.css");
	</style>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		var slider =  $('.carr').bxSlider({
	  	startSlide: 0
	
	});
	  
	$("a[rel=modal]").click( function(ev){
        ev.preventDefault();
 
        var id = $(this).attr("href");
 
        var alturaTela = $(document).height();
        var larguraTela = $(window).width();
     
        //colocando o fundo preto
        $('#mascara').css({'width':larguraTela,'height':alturaTela});
        $('#mascara').fadeIn(1000); 
        $('#mascara').fadeTo("slow",0.8);
 
        var left = ($(window).width() /2) - ( $(id).width() / 2 );
        var top = ($(window).height() / 2) - ( $(id).height() / 2 );
     
        $(id).css({'top':top,'left':left});
        $(id).show();   
    });
 
    $("#mascara").click( function(){
        $(this).hide();
        $(".janela-modal").hide();
    });
 
    $('.fechar').click(function(ev){
        ev.preventDefault();
        $("#mascara").hide();
        $(".janela-modal").hide();
    });
		
	});
</script>
<ul class="carr">
	<li>
			
		<div class="login" id="1">
		<p class="titulo-form">Cadastro De Fornecedores</p>
		    <input type="text" placeholder="Username" id="username">  
		  	<input type="password" placeholder="password" id="password">  
		  	<a href="#" class="forgot">Esqueceu a Senha?</a>
		  	<input type="submit" value="Entrar" onclick="autenticaUsuario('1');">
		</div>
	</li>
	<li>

		<div class="login" id="2" >
			<p class="titulo-form">Cadastro De Usuários</p>
		    <input type="text" placeholder="Username" id="username">  
		  	<input type="password" placeholder="password" id="password">  
		  	<a href="#" class="forgot">Esqueceu a Senha?</a>
		  	<input type="submit" value="Entrar" onclick="autenticaUsuario('2');">
		</div>
	</li>
	
</ul>
<div class="cadastro"> Não é cadastrado ainda ? Faça seu cadastro Aqui!!</div>
<a href="#cadastroModal" rel="modal">Cadastro</a>

<div class="janela-modal" id="cadastroModal">
	<a href="#" class="fechar">X Fechar</a>
	<div class="form">
		<form>
			<fieldset>
				<p class="contact" style="margin:0px;"><label for="perfil">Perfil:</label></p>
				<select class="select-style" name="perfil" id="perfil_select" onchange="mudaLabel();">
					<option value="1">Fornecedor</option>
					<option value="2">Usuário</option>
					<option value="3">Micro-Empresa</option>
				</select><br/>
				<p class="contact"><label for="nome" id="nome_label">Razão Social:</label></p><input type="text" id="nome" >
				
				<p class="contact"><label for="CPF" id="cpf_label">CNPJ:</label></p><input type="text" id="CPF" >
				
				<p class="contact"><label for="telefone" id="tel_label">Telefone:</label></p><input type="text" id="telefone" >
				
				<p class="contact"><label for="email" id="email_label">Email:</label></p><input type="text" id="email" >
				
				<p class="contact"><label for="senha" id="senha_label">Senha:</label></p><input type="password" id="senha" maxlength="15">

				<p class="contact"><label for="confirm_senha" id="senha_label">Confirme a sua senha:</label></p><input type="password" maxlength="15" id="confirm_senha" >
			
			</fieldset>
		</form>
	</div>
</div>

<div id="mascara"></div>

</body>
</html>