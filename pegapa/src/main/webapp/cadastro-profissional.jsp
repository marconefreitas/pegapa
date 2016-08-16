<%@ page language="java" contentType="text/html; charset=utf-8"
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
						<form role="form"  id="formProfissional" enctype="multipart/form-data" accept-charset="utf-8">
							<input type="hidden" name="cadastra" value="cadastra"/>
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
										<input type="text" class="form-control" id="numeroProfissional" name="numero" placeholder=""/>
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
									<select class="selectpicker" id="bairros-prof" data-live-search="true" name="bairro" data-width="100%" >
										<option data-hidden="true">Escolha um bairro</option>
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
										<input type="text" class="form-control" data-masc="celular" data-masc="celular" name="celular" id="celularProfissional" placeholder=""/>
									</div>
								</fieldset>
							</div>
							
							<div class="row">
								<fieldset class="form-group">
									<select class="selectpicker" id="ocupacao" data-live-search="true" name="ocupacao" data-width="100%" >
										<option data-hidden="true">Escolha uma Ocupação (Dentre as abaixo, qual você tem mais experiência?)</option>
										<option value="pintor">Pintor</option>
										<option value="pedreiro">Pedreiro</option>
										<option value="marceneiro">Marceneiro</option>
										<option value="serralheiro">Serralheiro</option>
										<option value="vidraceiro">Vidraceiro</option>
										<option value="outro">Outro</option>
									</select>
								</fieldset>
							</div>
												
							<!-- MODIFICAR PARA UM NUMERO REPRESENTANDO O ANO, E UM NUMERO REPRESENTANDO O MES DE EXPERIENCIA -->
							<div class="row">
								<fieldset id="exp" class="border-fieldset" style="padding:0px;"><legend>Experiência</legend>
									<div class="form-group col-md-6" style="">
										<div class="input-group">
											<span class="input-group-addon">Meses</span>
											<input type="text"  class="form-control" id="mes" name="mes" placeholder="de 0 a 12"/>
										</div>
									</div>
									
									<div class="form-group col-md-6" style="">
										<div class="input-group">
											<span class="input-group-addon">Anos</span>
											<input type="text" class="form-control" name="anos" id="anos" placeholder="de 0 a 99"/>
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
					                        <span class="image-preview-input-title">Selecionar</span>
					                        <input type="file" accept="image/png, image/jpeg" id="imagem" name="imagem"/> <!-- rename it -->
					                    </div>
              						</span>
            					</div>
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
<script type="text/javascript" src="/pegapa/javascript/jquery-2.2.3.js"></script>
<script type="text/javascript" src="javascript/imagem.js" charset="utf-8"></script>
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
</body>
</html>