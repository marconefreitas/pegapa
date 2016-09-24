package br.com.pegapa.entity;

import java.text.DecimalFormat;

import javax.persistence.Column;
import javax.persistence.ConstraintMode;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;

@Table
@Entity(name="servico")
public class Servico {

	@Expose
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@Expose
	@Column(name="nome", length=45, nullable=false)
	private String nome;
	
	@Expose
	@Column(name="descricao", length=200, nullable=false)
	private String descricao;
	
	@Expose
	@Column(name="preco")
	private Double preco;
	
	@ManyToOne
	@JoinColumn(name="cod_profissional", nullable=false, foreignKey= @ForeignKey(value=ConstraintMode.CONSTRAINT, name="COD_PROFISSIONAL_FK") )
	private Profissional profissional;
	
	public Servico() {
		// TODO Auto-generated constructor stub
	}
	
	public Servico(String nome, String descricao, Profissional profissional, Double preco) {
		super();
		this.nome = nome;
		this.descricao = descricao;
		this.profissional = profissional;
		this.preco = preco;
	}

	public Servico(String nome, String descricao, Integer idProf) {
		super();
		this.nome = nome;
		this.descricao = descricao;
		this.profissional = new Profissional();
		this.profissional.setId(idProf); 
	}
	
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Double getPreco() {
		return preco;
	}
	public String getPrecoFormatado() {
		DecimalFormat df = new DecimalFormat("#,##0.00");
		if(preco == null){
			return "";
		}
		return df.format(preco);
	}
	
	public void setPreco(Double preco) {
		this.preco = preco;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public Profissional getProfissional() {
		return profissional;
	}
	public void setProfissional(Profissional profissional) {
		this.profissional = profissional;
	}
	
	
	
}
