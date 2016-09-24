<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div class="modal fade" id="modal-cadastro-usuario" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content" style="padding:15px">
					<div class="modal-header" style="padding-left:0"> 
						Cadastro de Usuários
					</div> 
					<div class="modal-body">
						<form role="form">
							
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Nome Completo</span>
										<input type="text" class="form-control" id="nomeUsuario" placeholder="Informe seu nome"/>
									</div>
								</fieldset>
							</div>
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">CPF</span>
										<input type="text" class="form-control" data-masc="cpf" id="cpfUsuario" placeholder="999.999.999-99"/>
									</div>
								</fieldset>
							</div>
							
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Logradouro</span>
										<input type="text" class="form-control" disabled id="ruaUsuario" />
									</div>
								</fieldset>
							</div>
							
							<div class="row">
								<div class="form-group col-md-4" style="padding: 0px 15px 0px 0px; background-color: #fff; border:none;">
									<div class="input-group">
										<span class="input-group-addon">Nº</span>
										<input type="text" class="form-control" id="numeroUsuario" placeholder=""/>
									</div>
								</div>
								
								<div class="form-group col-md-8" style="padding: 0px 0px 0px 15px; background-color: #fff; border:none;">
									<div class="input-group">
										<span class="input-group-addon">CEP</span>
										<input type="text" class="form-control" data-masc="cep" id="cepUsuario" placeholder="CEP"/>
									</div>
								</div>
								
							</div>
							
							
							<div class="row">
								<fieldset class="form-group">
									<select class="selectpicker" id="estado-user" data-live-search="true" name="estado" data-width="100%" >
										<option data-hidden="true">Escolha um Estado</option>
									</select>
								</fieldset>
							</div>
								
							<div class="row">
								<fieldset class="form-group">
									<select class="selectpicker" id="cidade" data-live-search="true" id="cidade" name="cidade" data-width="100%" >
										<option data-hidden="true">Escolha uma cidade</option>
									</select>
								</fieldset>
							</div>	
			
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Telefone (1)</span>
										<input type="text" class="form-control" data-masc="telefone" id="telefoneUsuario" placeholder=""/>
									</div>
								</fieldset>
							</div>
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Telefone (2)</span>
										<input type="text" class="form-control" data-masc="celular" id="celularUsuario" placeholder=""/>
									</div>
								</fieldset>
							</div>
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Email</span>
										<input type="email" class="form-control" id="emailUsuario" placeholder="Informe seu E-mail"/>
									</div>
								</fieldset>
							</div>
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Senha</span>
										<input type="password" class="form-control" id="senhaUsuario" placeholder="Informe sua senha"/>
									</div>
								</fieldset>
							</div>
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Confirmação</span>
										<input type="password" class="form-control" id="confirmSenhaUsuario" placeholder="Informe a senha novamente"/>
									</div>
								</fieldset>
							</div>
							
							<div class="row" style="text-align: right;">
								<button type="button" onclick="cancelaTudo('modal-cadastro-usuario')"class="btn btn-warning">Cancelar</button>
								<button type="button" id="cadastrarUsuario" class="btn btn-primary">Cadastrar</button>
							</div>
							<div class="alert" style="display:none"></div>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>