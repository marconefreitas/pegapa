package br.com.pegapa.entity;

import javax.persistence.Embeddable;

@Embeddable
public class Endereco {
	
	
	private String rua;
	
	private String numero;
	
	private String cep;
	
	
	public String getRua() {
		return rua;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public void setRua(String rua) {
		this.rua = rua;
	}
	
}
