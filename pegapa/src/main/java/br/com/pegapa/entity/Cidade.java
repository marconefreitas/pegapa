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


@Entity(name="cidade")
public class Cidade {
	
	
	private Integer codigo;

	private String nome;
	
	private Estado estadoFk;
	
	public Cidade() {
		// TODO Auto-generated constructor stub
	}
	public Cidade(String nome) {
		this.nome = nome;
	}
	

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	
	@Column(name="nome", nullable=false, length=100)
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	@ManyToOne
	@JoinColumn(name="cod_estado", nullable=false, foreignKey= @ForeignKey(value=ConstraintMode.CONSTRAINT, name="COD_ESTADO_FK") )
	public Estado getEstadoFk() {
		return estadoFk;
	}

	public void setEstadoFk(Estado estadoFk) {
		this.estadoFk = estadoFk;
	}
	
	
	
	
	
}
