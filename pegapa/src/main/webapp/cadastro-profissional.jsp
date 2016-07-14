<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>

<!-- MODAL PROFISSIONAL -->
		<div class="modal fade" id="modal-cadastro-profissional" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content" style="padding:15px">
					<div class="modal-header" style="padding-left:0"> 
						Cadastro de Profissional
					</div> 
					<div class="modal-body">
						<form role="form"  id="formProfissional">
							
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Nome Completo</span>
										<input type="text" class="form-control" id="nomeProfissional" name="nome" placeholder="Informe seu nome" />
									</div>
								</fieldset>
							</div>
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">CPF</span>
										<input type="text" class="form-control" data-masc="cpf" name="cpf" id="cpfProfissional" placeholder="999.999.999-99"/>
									</div>
								</fieldset>
							</div>
							
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Endereco</span>
										<input type="text" class="form-control" id="ruaProfissional" name="endereco" placeholder="Rua|Avenida|Alameda etc"/>
									</div>
								</fieldset>
							</div>
							
							<div class="row">
								<div class="form-group col-md-4" style="padding: 0px 15px 0px 0px; background-color: #fff; border:none;">
									<div class="input-group">
										<span class="input-group-addon">Nº</span>
										<input type="text" class="form-control" id="numeroProfissional" placeholder=""/>
									</div>
								</div>
								
								<div class="form-group col-md-8" style="padding: 0px 0px 0px 15px; background-color: #fff; border:none;">
									<div class="input-group">
										<span class="input-group-addon">CEP</span>
										<input type="text" class="form-control" data-masc="cep" name="cep" id="cepProfissional" placeholder="CEP"/>
									</div>
								</div>
							
							</div>
							
							
							<div class="row">
								<fieldset class="form-group">
									<select class="selectpicker" id="estado-prof" data-live-search="true" name="estado" data-width="100%" >
										<option data-hidden="true">Escolha um Estado</option>
									</select>
								</fieldset>
							</div>
							<div class="row">
								<fieldset class="form-group">
									<select class="selectpicker" id="cidade-prof" data-live-search="true" name="cidade" data-width="100%" >
										<option data-hidden="true">Escolha uma cidade</option>
									</select>
								</fieldset>
							</div>
							
							
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Telefone (1)</span>
										<input type="text" class="form-control" data-masc="telefone" name="telefone" id="telefoneProfissional" placeholder=""/>
									</div>
								</fieldset>
							</div>
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Telefone (2)</span>
										<input type="text" class="form-control" data-masc="celular" data-masc="celular" id="celularProfissional" placeholder=""/>
									</div>
								</fieldset>
							</div>
							
							<div class="row">
								<fieldset class="form-group">
									<select class="selectpicker" id="ocupacao" data-live-search="true" name="ocupacao" data-width="100%" >
										<option data-hidden="true">Escolha uma Ocupação</option>
										<option value="pintor">Pintor</option>
										<option value="pedreiro">Pedreiro</option>
										<option value="marceneiro">Marceneiro</option>
										<option value="serralheiro">Serralheiro</option>
										<option value="vidraceiro">Vidraceiro</option>
										<option value="outro">Outro</option>
									</select>
								</fieldset>
							</div>
							
							<div class="row" id="informar-ocupacao" style="display: none">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Ocupação</span>
										<input type="text" class="form-control" id="ocupacaoInformada" name="informar-ocupacao" placeholder="Informe a ocupação"/>
									</div>
								</fieldset>
							</div>
							
							
							<div class="row">
								<fieldset class="form-group">
									<select class="selectpicker" id="experiencia" data-live-search="true" name="experiencia" data-width="100%">
										<option data-hidden="true">Sua Experiência na área</option>
										<option value="junior">Menos de 1 ano</option>
										<option value="pleno">Entre 1 ano e 2 anos</option>
										<option value="senior">Entre 2 anos e 3 anos</option>
										<option value="especialista">Mais de 3 anos</option>
									</select>
								</fieldset>
							</div>
							
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Email</span>
										<input type="email" class="form-control" id="emailProfissional" name="email" placeholder="Informe seu E-mail"/>
									</div>
								</fieldset>
							</div>
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Senha</span>
										<input type="password" class="form-control" id="senhaProfissional" name="senha" placeholder="Informe sua senha"/>
									</div>
								</fieldset>
							</div>
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Confirmação</span>
										<input type="password" class="form-control" id="confirmSenhaProfissional" name="confirmSenha" placeholder="Informa a senha novamente"/>
									</div>
								</fieldset>
							</div>
							<div class="row" style="text-align: right;">
								<button type="button" onclick="cancelaTudo('modal-cadastro-profissional')" class="btn btn-warning">Cancelar</button>
								<button type="submit" id="cadastrarProfissional" class="btn btn-primary">Cadastrar</button>
							</div>
							<div class="alert" style="display:none"></div>
						</form>
					</div>
				</div>
			</div>
		</div>


</body>
</html>