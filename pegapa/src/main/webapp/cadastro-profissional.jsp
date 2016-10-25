

<!-- MODAL PROFISSIONAL -->
		<div class="modal fade" id="modal-cadastro-profissional" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content" style="padding:15px">
					<div class="modal-header" style="padding-left:0"> 
						Cadastro de Profissional
					</div> 
					<div class="modal-body">
						<form role="form"  id="formProfissional" enctype="multipart/form-data" accept-charset="iso-8859-1,utf-8">
							<input type="hidden" name="cadastra" value="cadastra"/>
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Nome Completo</span>
										<input type="text" class="form-control" style="border-right:0px;" id="nomeProfissional" name="nome" placeholder="Informe seu nome" />
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
								</fieldset>
							</div>
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">CPF</span>
										<input type="text" class="form-control" data-masc="cpf" style="border-right:0px;" name="cpf" id="cpfProfissional" placeholder="999.999.999-99"/>
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
								</fieldset>
							</div>
							
							
							
							<div class="row">
								<div class="form-group col-md-8" style="padding: 0px 15px 0px 0px; background-color: #fff; border:none;">
									<div class="input-group">
										<span class="input-group-addon">CEP</span>
										<input type="text" class="form-control" data-masc="cep" name="cep" id="cepProfissional" style="border-right:0px;"  placeholder="CEP"/>
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
								</div>
							
								<div class="form-group col-md-4" style="padding: 0px 0px 0px 15px; background-color: #fff; border:none;">
									<div class="input-group">
										<span class="input-group-addon">Nº</span>
										<input type="text" class="form-control" id="numeroProfissional" style="border-right:0px;" name="numero" placeholder=""/>
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
								</div>
							</div>
							
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Logradouro</span>
										<input type="text" class="form-control" id="ruaProfissional" name="endereco" style="border-right:0px;"  placeholder="Rua|Avenida|Alameda etc"/>
										<span class="input-group-addon" style="background-color:white" ><i></i></span>									
									</div>
								</fieldset>
							</div>
							
							<div class="row">
								<fieldset class="form-group" id="fState">
									<select class="selectpicker" id="estado-prof" data-live-search="true" name="estado" data-width="100%"  >
										<option data-hidden="true">Escolha um Estado</option>
									</select>
									<label class="red select-error" hidden>Escolha um Estado</label>
								</fieldset>
							</div>
							<div class="row">
								<fieldset class="form-group" id="fCity">
									<select class="selectpicker" id="cidade-prof" data-live-search="true" name="cidade" data-width="100%" >
										<option data-hidden="true">Escolha uma Cidade</option>
									</select>
									<label class="red select-error" hidden>Escolha uma Cidade</label>
								</fieldset>
							</div>
							
							<div class="row">
								<fieldset class="form-group" id="fNeighb">
									<select class="selectpicker" id="bairros-prof" data-live-search="true" name="bairro" data-width="100%" >
										<option data-hidden="true">Escolha um Bairro</option>
									</select>
									<label class="red select-error" hidden>Escolha um Bairro</label>
								</fieldset>
							</div>
							
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Telefone (1)</span>
										<input type="text" class="form-control" data-masc="telefone" name="telefone" style="border-right:0px;"  id="telefoneProfissional" />
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
								</fieldset>
							</div>
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Telefone (2)</span>
										<input type="text" class="form-control" data-masc="celular" data-masc="celular" style="border-right:0px;"  name="celular" id="celularProfissional"/>
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
								</fieldset>
							</div>
							
							<div class="row">
								<fieldset class="form-group" id="fProfession">
									<select class="selectpicker" id="ocupacao" data-live-search="true" name="ocupacao" data-width="100%" >
										<option value="N" >Escolha uma Ocupação (Dentre as abaixo, qual você tem mais experiência?)</option>
										<option value="Pintor">Pintor</option>
										<option value="Pedreiro">Pedreiro</option>
										<option value="Marceneiro">Marceneiro</option>
										<option value="Serralheiro">Serralheiro</option>
										<option value="Vidraceiro">Vidraceiro</option>
										<option value="Outro">Outro</option>
									</select>
									<label class="red select-error" hidden>Selecione uma Ocupação</label>
								</fieldset>
							</div>
							
							<div class="row">
								<div class="input-group"  style="width:100%">
									<div class="label-textarea">Informações sobre Você</div>
									<textarea class="form-control" rows="5" style="border-radius: 0px 0px" 
									placeholder="Insira aqui uma breve descrição sobre sua experiência na ocupação escolhida."
									name="descricao" maxlength="300" id="descriptionProf" ></textarea>
									<label class="red select-error" hidden>Informe uma breve descrição sobre o(s) seu(s) trabalhos</label>
								</div>
							</div>	
											
							<div class="row">
								<fieldset id="exp" class="border-fieldset" style="padding:0px;"><legend>Experiência</legend>
									<div class="form-group col-md-6" style="">
										<div class="input-group">
											<span class="input-group-addon">Meses</span>
											<input type="text"  class="form-control" id="mes" style="border-right:0px;"  name="mes" placeholder="de 0 a 12"/>
											<span class="input-group-addon" style="background-color:white" ><i></i></span>
										</div>
									</div>
									
									<div class="form-group col-md-6">
										<div class="input-group">
											<span class="input-group-addon">Anos</span>
											<input type="text" class="form-control" name="anos" id="anos" style="border-right:0px;"  placeholder="de 0 a 99"/>
											<span class="input-group-addon" style="background-color:white" ><i></i></span>
										</div>
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
					                        <span class="image-preview-input-title">Foto de Perfil</span>
					                        <input type="file" accept="image/png, image/jpeg" id="imagem" name="imagem"/> <!-- rename it -->
					                    </div>
              						</span>
            					</div>
							</div>
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Email</span>
										<input type="email" class="form-control" id="emailProfissional" style="border-right:0px;"  name="email" placeholder="Informe seu E-mail"/>
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
								</fieldset>
							</div>
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Senha</span>
										<input type="password" class="form-control" id="senhaProfissional" name="senha" style="border-right:0px;"  placeholder="Informe sua senha"/>
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
								</fieldset>
							</div>
							<div class="row">
								<fieldset class="form-group">
									<div class="input-group">
										<span class="input-group-addon">Confirmação</span>
										<input type="password" class="form-control" id="confirmSenhaProfissional" name="confirmSenha"  style="border-right:0px;"  placeholder="Informe a senha novamente"/>
										<span class="input-group-addon" style="background-color:white" ><i></i></span>
									</div>
								</fieldset>
							</div>
							<div class="row" style="text-align: right;">
								<button type="button" onclick="cancelaTudo('modal-cadastro-profissional')" class="btn btn-warning">Cancelar</button>
								<button type="button" id="cadastrarProfissional" class="btn btn-primary">Cadastrar</button>
							</div>
							<div class="alert" style="display:none"></div>
						</form>
					</div>
				</div>
			</div>
		</div>



<script type="text/javascript">
$(document).on('click', '#close-preview', function(){ 
    $('.image-preview').popover('hide');
    // Hover befor close the preview
    $('.image-preview').hover(
        function () {
           $('.image-preview').popover('show');
        }, 
         function () {
           $('.image-preview').popover('hide');
        }
    );    
});

</script>
