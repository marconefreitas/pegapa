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
										<input type="text" class="form-control" id="nomeUsuario" placeholder="Informe seu nome" style="border-right:0px;"/>
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
								</fieldset>
							</div>
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">CPF</span>
										<input type="text" class="form-control" data-masc="cpf" id="cpfUsuario" style="border-right:0px;"/>
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
								</fieldset>
							</div>
							
							<div class="row">
								<div class="form-group col-md-8" style="padding: 0px 15px 0px 0px ; background-color: #fff; border:none;">
									<div class="input-group">
										<span class="input-group-addon">CEP</span>
										<input type="text" class="form-control" data-masc="cep" id="cepUsuario" style="border-right:0px;"/>
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
								</div>
								<div class="form-group col-md-4 " style="padding:0px 0px 0px 15px; background-color: #fff; border:none;">
									<div class="input-group">
										<span class="input-group-addon">Nº</span>
										<input type="text" class="form-control" id="numeroUsuario" placeholder=""/>
									</div>
								</div>
							</div>
							
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Logradouro</span>
										<input type="text" class="form-control" id="ruaUsuario" style="border-right:0px;" />
										<span class="input-group-addon" style="background-color:white;" id="addon-log-user"><i></i></span>
									</div>
								</fieldset>
							</div>
							
							<div class="row">
								<fieldset class="form-group" id="fState-user">
									<select class="selectpicker" id="estado-user" data-live-search="true" name="estado" data-width="100%" >
										<option data-hidden="true">Escolha um Estado</option>
									</select>
									<label class="red select-error" hidden>Escolha um Estado</label>
								</fieldset>
							</div>
								
							<div class="row">
								<fieldset class="form-group" id="fCity-user">
									<select class="selectpicker" id="cidade" data-live-search="true" id="cidade" name="cidade" data-width="100%" >
										<option data-hidden="true">Selecione uma Cidade</option>
									</select>
									<label class="red select-error" hidden>Escolha uma Cidade</label>
								</fieldset>
							</div>	
			
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Telefone (1)</span>
										<input type="text" class="form-control" data-masc="telefone" id="telefoneUsuario" placeholder="" style="border-right:0px;"/>
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
								</fieldset>
							</div>
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Telefone (2)</span>
										<input type="text" class="form-control" data-masc="celular" id="celularUsuario" placeholder="" style="border-right:0px;"/>
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
								</fieldset>
							</div>
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Email</span>
										<input type="email" class="form-control" id="emailUsuario" placeholder="Informe seu E-mail" style="border-right:0px;"/>
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
								</fieldset>
							</div>
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Senha</span>
										<input type="password" class="form-control" id="senhaUsuario" placeholder="Informe sua senha" style="border-right:0px;"/>
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
								</fieldset>
							</div>
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Confirmação</span>
										<input type="password" class="form-control" id="confirmSenhaUsuario" placeholder="Informe a senha novamente" style="border-right:0px;"/>
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
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
	

