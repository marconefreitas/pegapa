package br.com.pegapa.entity;

public enum Perfil {

	FORNECEDOR((short) 1, "Fornecedor"),
	PROFISSIONAL((short) 2, "Profissional"),
	SOLICITANTE((short)3, "Usuario");
	
	private Short codigo;
	private String descricao;
	
	Perfil(Short codigo, String descricao){
		this.setCodigo(codigo);
		this.descricao = descricao;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Short getCodigo() {
		return codigo;
	}

	public void setCodigo(Short codigo) {
		this.codigo = codigo;
	}
}
