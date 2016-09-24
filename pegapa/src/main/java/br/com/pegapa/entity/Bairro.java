package br.com.pegapa.entity;

import javax.persistence.Column;
import javax.persistence.ConstraintMode;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.google.gson.annotations.Expose;

@Entity(name="bairro")
public class Bairro {
	
	@Expose
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer codigo;
	
	@Expose
	@Column(length=100, nullable=false)
	private String nome;
	
	@Expose
	@ManyToOne
	@JoinColumn(name="cod_cidade", nullable=false, foreignKey= @ForeignKey(value=ConstraintMode.CONSTRAINT, name="COD_CIDADE_FK"))
	private Cidade cidadeFk;
	
	public Bairro() {
		// TODO Auto-generated constructor stub
	}
	
	public Bairro(String nome) {
		this.nome = nome;
	}
	
	public Integer getCodigo() {
		return codigo;
	}
	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public Cidade getBairroFk() {
		return cidadeFk;
	}
	public void setBairroFk(Cidade cidadeFk) {
		this.cidadeFk = cidadeFk;
	}
	
	
	
}
