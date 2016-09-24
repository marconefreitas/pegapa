package br.com.pegapa.entity;

import javax.persistence.Embeddable;

import com.google.gson.annotations.Expose;

@Embeddable
public class Endereco {
	
	
	@Expose
	private String rua;
	
	@Expose
	private String numero;
	
	@Expose
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
