package br.com.pegapa.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.google.gson.annotations.Expose;


@Entity(name="estado")
public class Estado {
	

	private Short codigo;
	

	private String uf;

	private String nome;
	
	private List<Cidade> cidades;
	
	public Estado() {
	}
	
	public Estado(String nome) {
		this.nome = nome;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Short getCodigo() {
		return codigo;
	}

	public void setCodigo(Short codigo) {
		this.codigo = codigo;
	}

	@Column(name="uf", length=2, nullable=false)
	public String getUf() {
		return uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	@Column(name="nome", nullable=false, length=20)
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}


	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, targetEntity=Cidade.class, mappedBy="estadoFk")
	public List<Cidade> getCidades() {
		return cidades;
	}

	public void setCidades(List<Cidade> cidades) {
		this.cidades = cidades;
	}
	
	
	
}
