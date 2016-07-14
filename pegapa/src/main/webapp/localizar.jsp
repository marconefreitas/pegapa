<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<!-- Bootstrap select -->
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />

</head>
<body>
	<div class="sub-section">
					<form name="localizar-profissional" method="get" action="LocalizarServlet">
						<input type="hidden" name="localizar" value="localizar">
						<div class="row"><span style="font-family: Tahoma; font-size:1.875em">Encontre o profissional ou serviço adequado para você:</span></div>
						<div class="col-md-4" style="background-color: #fff; border: none">
							<select class="selectpicker" id="localiza-estado" data-live-search="true" name="localiza-estado" data-width="100%" >
								<option data-hidden="true">Selecione um estado</option>
							</select>
						</div>
						<div class="col-md-4" style="background-color: #fff; border: none">
							<select class="selectpicker" id="localiza-cidade" data-live-search="true" name="localiza-cidade" data-width="100%" >
								<option data-hidden="true">Selecione uma cidade</option>
							</select>
						</div>
						<div class="col-md-2" style="background-color: #fff; border: none">
							<select class="selectpicker" id="categoria-buscada" name="categoria-buscada" data-width="100%" >
								<option value="t">Todos</option>
								<option value="p">Profissional</option>
								<option value="f">Fornecedor</option>
							</select>
						</div>
						<div class="col-md-2" style="background-color: #fff; border: none">
							<button type="submit" id="buscar"  onclick="buscar();" class="btn btn-primary">Buscar</button>
						</div>
					</form>
<!-- 					<button onclick="testaCoisa();">teste</button> -->
				</div>

<script type="text/javascript" src="javascript/jquery-2.2.3.js"></script>
<script type="text/javascript" src="javascript/inputMask.js"></script>
<script src="js/bootstrap.min.js"></script>

<script type="text/javascript" src="javascript/jquery.bxslider.js"></script>

<!-- bootstrap select js -->
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/jquery.validate.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/additional-methods.js"></script>


<!-- Javascripts da aplicação -->
<script type="text/javascript" src="javascript/usuario.js" charset="utf-8"></script>
<script type="text/javascript" src="javascript/recursos.js" charset="utf-8"></script>
<script type="text/javascript" src="javascript/busca.js" charset="utf-8"></script>
<script type="text/javascript" src="javascript/profissional.js" charset="utf-8"></script>

<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url: 'SelectServlet',
		method: 'POST',
		data: {carregaEstado:'carregaEstado'},
		success: function(data){
			data = jQuery.parseJSON(data);
			var options = "";
			$.each(data, function(key, value){
				options += "<option value='" + value.cod + "'>" + value.nome + "</option>";
			});
			$("#estado-user, #estado-prof ,#localiza-estado").append(options);
			$(".selectpicker").selectpicker('refresh');
		}
	
	});
	
});

</script>


</body>
</html>