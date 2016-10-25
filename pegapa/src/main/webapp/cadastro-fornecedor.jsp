<div class="modal fade" id="modal-cadastro-fornecedor" data-backdrop="static" role="dialog">
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
											<input type="text" class="form-control" id="nomeFantasia" name="nomeFantasia" style="border-right:0px;"
											placeholder="Informe o nome fantasia do seu estabelecimento"/>
											<span class="input-group-addon" style="background-color:white" ><i></i></span>
										</div>
									</fieldset>
								</div>
								<div class="row">
									<fieldset class="form-group">
										<div class="input-group">
											<span class="input-group-addon">CNPJ</span>
											<input type="text" class="form-control" data-masc="cnpj" style="border-right:0px;"
											maxlength="18" id="cnpjForn" name="cnpj" placeholder=""/>
											<span class="input-group-addon" style="background-color:white" ><i></i></span>
										</div>
									</fieldset>
								</div>
								
								
								<div class="row">
									<fieldset class="form-group" id="fBusinessLine">
										<select class="selectpicker" id="ramoAtuacaoFisico"  name="ramoAtuacaoFisico" data-width="100%" >
											<option value="N">Ramo de Atuação</option>
											<option value="Telhadista">Telhadista</option>
											<option value="Madeireira">Madeireira</option>
											<option value="Pintura">Pintura</option>
											<option value="Vidraçaria">Vidraçaria</option>
											<option value="Construções em Geral">Construções em Geral</option>
										</select>
										<label class="red select-error" hidden>Escolha um Ramo de Atuação</label>
									</fieldset>
								</div>
								<div class="row">
									<div class="input-group"  style="width:100%">
										<div class="label-textarea">Informações sobre seu estabelecimento</div>
										<textarea class="form-control" rows="5" style="border-radius: 0px 0px" 
										placeholder="Insira aqui uma breve descrição sobre seus produtos e sobre seu estabelecimento."
										name="descricao" maxlength="300" id="descriptionProv" ></textarea>
										<label class="red select-error" hidden>Informe uma breve descrição sobre o(s) seu(s) produtos</label>
									</div>
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
											<input type="text" class="form-control" id="respName" name="nomeResponsavel"  style="border-right:0px;"/>
											<span class="input-group-addon" style="background-color:white" ><i></i></span>
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
	              					<label class="red select-error" hidden id="label-erro-foto-prov-f">Por favor, nos informe que foto usaremos no seu perfil</label>
								</div>
								
								<div class="row">
									<fieldset class="form-group" id="fState-prov">
										<select class="selectpicker" id="estado-forn" data-live-search="true"  name="estado-forn" data-width="100%" >
											<option data-hidden="true">Escolha um Estado</option>
										</select>
										<label class="red select-error" hidden>Escolha um Estado</label>
									</fieldset>
								</div>
									
								<div class="row">
									<fieldset class="form-group" id="fCity-prov">
										<select class="selectpicker" id="cidade-forn" data-live-search="true" name="cidade-forn" data-width="100%" >
											<option data-hidden="true">Escolha uma Cidade</option>
										</select>
										<label class="red select-error" hidden>Escolha uma Cidade</label>
									</fieldset>
								</div>	
								
								<div class="row">
									<fieldset class="form-group" id="fNeighb-prov">
										<select class="selectpicker" id="bairros-forn" data-live-search="true" name="bairros-forn" data-width="100%" >
											<option data-hidden="true">Selecione um Bairro</option>
										</select>
										<label class="red select-error" hidden>Selecione um Bairro</label>
									</fieldset>
								</div>
								
								
								<div class="row">
									<div class="form-group col-md-8" style="padding: 0px 15px 0px 0px; background-color: #fff; border:none;">
										<div class="input-group">
											<span class="input-group-addon">CEP</span>
											<input type="text" class="form-control" data-masc="cep" id="cepFornecedor" 
											name="cepFornecedor" style="border-right:0px;"/>
											<span class="input-group-addon" style="background-color:white" ><i></i></span>
										</div>
									</div>
								
									<div class="form-group col-md-4" style="padding: 0px 0px 0px 15px; background-color: #fff; border:none;">
										<div class="input-group">
											<span class="input-group-addon">Nº</span>
											<input type="text" class="form-control" id="numeroFornecedor" name="numFornecedor" />
										</div>
									</div>
								</div>
								
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Logradouro</span>
										<input type="text" class="form-control" id="ruaFornecedor" name="ruaFornecedor"  style="border-right:0px;"/>
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
								</fieldset>
							</div>
								
								<div class="row">
									<fieldset class="form-group">
										<div class="input-group">
											<span class="input-group-addon">Telefone (1)</span>
											<input type="text" class="form-control" data-masc="telefone" name="tel1" id="telefoneFornecedor" style="border-right:0px;"/>
											<span class="input-group-addon" style="background-color:white" ><i></i></span>
										</div>
									</fieldset>
								</div>
								<div class="row">
									<fieldset class="form-group">
										<div class="input-group">
											<span class="input-group-addon">Telefone (2)</span>
											<input type="text" class="form-control" data-masc="celular" name="tel2"  style="border-right:0px;" id="celularFornecedor"/>
											<span class="input-group-addon" style="background-color:white" ><i></i></span>
										</div>
									</fieldset>
								</div>
								<div class="row">
									<fieldset class="form-group">
										<div class="input-group">
											<span class="input-group-addon">Email</span>
											<input type="email" class="form-control" name="emailF" style="border-right:0px;"
											id="emailFornecedor" placeholder="Informe seu E-mail"/>
											<span class="input-group-addon" style="background-color:white" ><i></i></span>
										</div>
									</fieldset>
								</div>
								<div class="row">
									<fieldset class="form-group">
										<div class="input-group">
											<span class="input-group-addon">Senha</span>
											<input type="password" class="form-control" name="senhaF" style="border-right:0px;"
											 id="senhaFornecedorFisico" placeholder="Informe sua senha"/>
											<span class="input-group-addon" style="background-color:white" ><i></i></span>
										</div>
									</fieldset>
								</div>
								<div class="row">
									<fieldset class="form-group">
										<div class="input-group">
											<span class="input-group-addon">Confirmação</span>
											<input type="password" class="form-control" id="confirmSenhaFornecedorFisico" 
											placeholder="Informe a senha novamente" style="border-right:0px;"/>
											<span class="input-group-addon" style="background-color:white" ><i></i></span>
										</div>
									</fieldset>
								</div>
								
								<div class="row" style="text-align: right;">
									<button type="button" onclick="cancelaTudo('modal-cadastro-fornecedor')"class="btn btn-warning">Fechar</button>
									<button type="button" id="cadastrarFornecedorFisico" class="btn orange">Cadastrar</button>
								</div>
							</section>
							
							<section name="lojaVirtual" style="display:none;">
								<div class="row">
									<fieldset class="form-group">
										<div class="input-group">
											<span class="input-group-addon">Nome Fantasia</span>
											<input type="text" class="form-control" id="nomeFantasiaVirt"  style="border-right:0px;" name="nomeFantasiaVirt" placeholder="Informe o nome fantasia do seu estabelecimento"/>
											<span class="input-group-addon" style="background-color:white" ><i></i></span>
										</div>
									</fieldset>
								</div>
								<div class="row">
									<fieldset class="form-group">
										<div class="input-group">
											<span class="input-group-addon">URL</span>
											<input type="text" class="form-control" id="urlVirt" name="urlVirt"   style="border-right:0px;"/>
											<span class="input-group-addon" style="background-color:white" ><i></i></span>
										</div>
									</fieldset>
								</div>
								
								<div class="row">
									<fieldset class="form-group" id="fBusinessLineVirt">
										<select class="selectpicker" id="ramoAtuacaoVirt"  name="ramoAtuacaoVirtual" data-width="100%" >
											<option value="N">Ramo de Atuação</option>
											<option value="Telhadista">Telhadista</option>
											<option value="Madeireira">Madeireira</option>
											<option value="Pintura">Pintura</option>
											<option value="Vidraçaria">Vidraçaria</option>
											<option value="Construções em Geral">Construções em Geral</option>
										</select>
										<label class="red select-error" hidden>Escolha um Ramo de Atuação</label>
									</fieldset>
								</div>
								
								<div class="row">
									<div class="input-group"  style="width:100%">
										<div class="label-textarea">Informações sobre seu estabelecimento</div>
										<textarea class="form-control" rows="5" style="border-radius: 0px 0px" 
										placeholder="Insira aqui uma breve descrição sobre seus produtos e sobre seu estabelecimento."
										name="descricaoVirt" maxlength="300" id="descriptionProvVirt" ></textarea>
										<label class="red select-error" hidden>Informe uma breve descrição sobre o(s) seu(s) produtos</label>
									</div>
								</div>	
								
								<div class="row">
									 <div class="input-group image-preview">
	                					<input type="text" class="form-control image-preview-filename" id="provVirt" disabled="disabled">
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
	              					<label class="red select-error" hidden id="label-erro-foto-virt">Por favor, nos informe que foto usaremos no seu perfil</label>
								</div>
								<div class="row">
									<fieldset class="form-group">
										<div class="input-group">
											<span class="input-group-addon">Email</span>
											<input type="email" class="form-control" id="emailFornecedorVirt" name="emailFornVirt"  style="border-right:0px;" placeholder="Informe seu E-mail"/>
											<span class="input-group-addon" style="background-color:white" ><i></i></span>
										</div>
									</fieldset>
								</div>
								<div class="row">
									<fieldset class="form-group">
										<div class="input-group">
											<span class="input-group-addon">Senha</span>
											<input type="password" class="form-control" id="senhaFornecedorVirt"  style="border-right:0px;" name="senhaFornVirt" placeholder="Informe sua senha"/>
											<span class="input-group-addon" style="background-color:white" ><i></i></span>
										</div>
									</fieldset>
								</div>
								<div class="row">
									<fieldset class="form-group">
										<div class="input-group">
											<span class="input-group-addon">Confirmação</span>
											<input type="password" class="form-control" id="confirmSenhaFornVirt"  style="border-right:0px;" placeholder="Informe a senha novamente"/>
											<span class="input-group-addon" style="background-color:white" ><i></i></span>
										</div>
									</fieldset>
								</div>
								<div class="row" style="text-align: right;">
									<button type="button" onclick="cancelaTudo('modal-cadastro-fornecedor')"class="btn btn-warning">Fechar</button>
									<button type="button" id="cadastrarFornecedorVirtual" class="btn orange">Cadastrar</button>
								</div>
							</section>
							<div class="alert" style="display:none"></div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<script>
			$('#modal-cadastro-fornecedor').on('hidden.bs.modal', function () {
				$(this).find('form')[0].reset();
				$(this).find('i').removeClass('glyphicon glyphicon-thumbs-up')
						  		 .removeClass('glyphicon glyphicon-thumbs-down');
				$('.alert').hide();
			})
			$(document).ready(function(){
				cancelaTudo('modal-cadastro-fornecedor');
				$('input#fis').prop("checked", true);
				$('section[name="lojaFisica"]').show();
			});
		</script>
