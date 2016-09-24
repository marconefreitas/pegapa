<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div class="modal fade" id="modal-cadastro-fornecedor" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content" style="padding:15px">
					<div class="modal-header" style="padding-left:0"> 
						Cadastro de Fornecedores
					</div> 
					<div class="modal-body">
						<form role="form" name="cadFornecedor" id="formFornecedor" enctype="multipart/form-data" accept-charset="utf-8">
							<input type="hidden" name="cadastra" value="cadastra"/>
							<div class="row">
        						<div class="radio radio-default">
            						<label for="fis">
          							<input type="radio" name="tipo" id="fis" value="Loja Fisica">
               		 					Loja Física
            						</label>
        						</div>
        					</div>
        					<div class="row">
        						<div class="radio radio-default">
            						<label for="vir">
        							<input type="radio" name="tipo" id="vir" value="Loja Virtual">
               							Loja Virtual
            						</label>
      							</div>
      						</div>
      						<section name="lojaFisica" style="display:none;">
								<div class="row">
									<fieldset class="form-group">
										<div class="input-group">
											<span class="input-group-addon">Nome Fantasia</span>
											<input type="text" class="form-control" id="nomeFantasia" name="nomeFantasia" placeholder="Informe o nome fantasia do seu estabelecimento"/>
										</div>
									</fieldset>
								</div>
								<div class="row">
									<fieldset class="form-group">
										<div class="input-group">
											<span class="input-group-addon">CNPJ</span>
											<input type="text" class="form-control" data-masc="cnpj" maxlength="18" id="cnpjForn" name="cnpj" placeholder=""/>
										</div>
									</fieldset>
								</div>
								
								
								<div class="row">
									<fieldset class="form-group">
										<select class="selectpicker" id="ramoAtuacaoFisico"  name="ramoAtuacaoFisico" data-width="100%" >
											<option data-hidden="true" val="None">Ramo de Atuação</option>
											<option value="Telhadista">Telhadista</option>
											<option value="Madeireira">Madeireira</option>
											<option value="Pintura">Pintura</option>
											<option value="Vidraçaria">Vidraçaria</option>
											<option value="Construções em Geral">Construções em Geral</option>
										</select>
									</fieldset>
								</div>
								
								<div class="row">
									<fieldset class="form-group">
										<div class="input-group">
											<span class="input-group-addon">Web Site</span>
											<input type="text" class="form-control" name="url" placeholder="Informe a URL do site "/>
										</div>
									</fieldset>
								</div>
								
								<div class="row">
									<fieldset class="form-group">
										<div class="input-group">
											<span class="input-group-addon">Nome do Responsável</span>
											<input type="text" class="form-control" id="" name="nomeResponsavel" placeholder=""/>
										</div>
									</fieldset>
								</div>
								
								<div class="row">
									 <div class="input-group image-preview">
	                					<input type="text" class="form-control image-preview-filename" disabled="disabled">
					                	<span class="input-group-btn">
						                    <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
						                        <span class="glyphicon glyphicon-remove"></span> Limpar
						                    </button>
						                    <div class="btn btn-default image-preview-input">
						                        <span class="glyphicon glyphicon-folder-open"></span>
						                        <span class="image-preview-input-title">Selecionar</span>
						                        <input type="file" accept="image/png, image/jpeg" name="imagemFornFisico" id="imagemFornFisico"/> 
						                    </div>
	              						</span>
	            					</div>
								</div>
								
								<div class="row">
									<fieldset class="form-group">
										<select class="selectpicker" id="estado-forn" data-live-search="true"  name="estado-forn" data-width="100%" >
											<option data-hidden="true">Escolha um Estado</option>
										</select>
									</fieldset>
								</div>
									
								<div class="row">
									<fieldset class="form-group">
										<select class="selectpicker" id="cidade-forn" data-live-search="true" name="cidade-forn" data-width="100%" >
											<option data-hidden="true">Escolha uma Cidade</option>
										</select>
									</fieldset>
								</div>	
								
								<div class="row">
									<fieldset class="form-group">
										<select class="selectpicker" id="bairros-forn" data-live-search="true" name="bairros-forn" data-width="100%" >
											<option data-hidden="true">Selecione um Bairro</option>
										</select>
									</fieldset>
								</div>
								
								
								<div class="row">
									<div class="form-group col-md-8" style="padding: 0px 15px 0px 0px; background-color: #fff; border:none;">
										<div class="input-group">
											<span class="input-group-addon">CEP</span>
											<input type="text" class="form-control" data-masc="cep" id="cepFornecedor" name="cepFornecedor" placeholder="CEP"/>
										</div>
									</div>
								
									<div class="form-group col-md-4" style="padding: 0px 0px 0px 15px; background-color: #fff; border:none;">
										<div class="input-group">
											<span class="input-group-addon">Nº</span>
											<input type="text" class="form-control" id="numeroFornecedor" name="numFornecedor" placeholder=""/>
										</div>
									</div>
								</div>
								
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Logradouro</span>
										<input type="text" class="form-control" disabled id="ruaFornecedor" name="ruaFornecedor" />
									</div>
								</fieldset>
							</div>
								
								<div class="row">
									<fieldset class="form-group">
										<div class="input-group">
											<span class="input-group-addon">Telefone (1)</span>
											<input type="text" class="form-control" data-masc="telefone" name="tel1" id="telefoneFornecedor" placeholder=""/>
										</div>
									</fieldset>
								</div>
								<div class="row">
									<fieldset class="form-group">
										<div class="input-group">
											<span class="input-group-addon">Telefone (2)</span>
											<input type="text" class="form-control" data-masc="celular" name="tel2" id="celularFornecedor" placeholder=""/>
										</div>
									</fieldset>
								</div>
								<div class="row">
									<fieldset class="form-group">
										<div class="input-group">
											<span class="input-group-addon">Email</span>
											<input type="email" class="form-control" name="emailF" id="emailFornecedor" placeholder="Informe seu E-mail"/>
										</div>
									</fieldset>
								</div>
								<div class="row">
									<fieldset class="form-group">
										<div class="input-group">
											<span class="input-group-addon">Senha</span>
											<input type="password" class="form-control" name="senhaF" id="senhaFornecedorFisico" placeholder="Informe sua senha"/>
										</div>
									</fieldset>
								</div>
								<div class="row">
									<fieldset class="form-group">
										<div class="input-group">
											<span class="input-group-addon">Confirmação</span>
											<input type="password" class="form-control" id="confirmSenhaFornecedorFisico" placeholder="Informe a senha novamente"/>
										</div>
									</fieldset>
								</div>
								
								<div class="row" style="text-align: right;">
									<button type="button" onclick="cancelaTudo('modal-cadastro-fornecedor')"class="btn btn-warning">Cancelar</button>
									<button type="button" id="cadastrarFornecedorFisico" class="btn orange">Cadastrar</button>
								</div>
							</section>
							
							<section name="lojaVirtual" style="display:none;">
								<div class="row">
									<fieldset class="form-group">
										<div class="input-group">
											<span class="input-group-addon">Nome Fantasia</span>
											<input type="text" class="form-control" id="nomeFantasiaVirt" name="nomeFantasiaVirt" placeholder="Informe o nome fantasia do seu estabelecimento"/>
										</div>
									</fieldset>
								</div>
								<div class="row">
									<fieldset class="form-group">
										<div class="input-group">
											<span class="input-group-addon">URL</span>
											<input type="text" class="form-control" id="urlVirt" name="urlVirt" placeholder=""/>
										</div>
									</fieldset>
								</div>
								
								<div class="row">
									<fieldset class="form-group">
										<select class="selectpicker" id="ramoAtuacaoVirt"  name="ramoAtuacaoVirtual" data-width="100%" >
											<option data-hidden="true" val="None">Ramo de Atuação</option>
											<option value="Telhadista">Telhadista</option>
											<option value="Madeireira">Madeireira</option>
											<option value="Pintura">Pintura</option>
											<option value="Vidraçaria">Vidraçaria</option>
											<option value="Construções em Geral">Construções em Geral</option>
										</select>
									</fieldset>
								</div>
								
								<div class="row">
									 <div class="input-group image-preview">
	                					<input type="text" class="form-control image-preview-filename" disabled="disabled">
					                	<span class="input-group-btn">
						                    <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
						                        <span class="glyphicon glyphicon-remove"></span> Limpar
						                    </button>
						                    <div class="btn btn-default image-preview-input">
						                        <span class="glyphicon glyphicon-folder-open"></span>
						                        <span class="image-preview-input-title">Selecionar</span>
						                        <input type="file" accept="image/png, image/jpeg" name="imagemFornVirtual" id="imagemFornVirtual"/> 
						                    </div>
	              						</span>
	            					</div>
								</div>
								<div class="row">
									<fieldset class="form-group">
										<div class="input-group">
											<span class="input-group-addon">Email</span>
											<input type="email" class="form-control" id="emailFornecedorVirt" name="emailFornVirt" placeholder="Informe seu E-mail"/>
										</div>
									</fieldset>
								</div>
								<div class="row">
									<fieldset class="form-group">
										<div class="input-group">
											<span class="input-group-addon">Senha</span>
											<input type="password" class="form-control" id="senhaFornecedorVirt" name="senhaFornVirt" placeholder="Informe sua senha"/>
										</div>
									</fieldset>
								</div>
								<div class="row">
									<fieldset class="form-group">
										<div class="input-group">
											<span class="input-group-addon">Confirmação</span>
											<input type="password" class="form-control" id="confirmSenhaFornVirt" placeholder="Informe a senha novamente"/>
										</div>
									</fieldset>
								</div>
								<div class="row" style="text-align: right;">
									<button type="button" onclick="cancelaTudo('modal-cadastro-fornecedor')"class="btn btn-warning">Cancelar</button>
									<button type="button" id="cadastrarFornecedorVirtual" class="btn orange">Cadastrar</button>
								</div>
							</section>
							<div class="alert" style="display:none"></div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$(document).ready(function(){
// 				$('section[name="lojaVirtual"]').hide();
// 				$('section[name="lojaFisica"]').hide();
			});
		</script>
</body>
</html>