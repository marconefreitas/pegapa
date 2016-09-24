package br.com.pegapa.entity;

import javax.persistence.Column;
import javax.persistence.ConstraintMode;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;

@Table
@Entity(name="comentario")
public class Comentario {
	

	@Expose
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	
	//@Expose
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_solicitante", nullable=false,foreignKey = @ForeignKey(value=ConstraintMode.CONSTRAINT, name="COD_SOLICITANTE_FK"))
	private Usuario usuarioFk;
	
	//@Expose
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_profissional", nullable=true, foreignKey = @ForeignKey(value=ConstraintMode.CONSTRAINT, name="COD_PROFISSIONAL_FK"))
	private Profissional profissionalFk;
	
	//@Expose
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_fornecedor", nullable=true, foreignKey = @ForeignKey(value=ConstraintMode.CONSTRAINT, name="COD_FORNECEDOR_FK"))
	private Fornecedor fornecedorFk;
	
	@Expose
	@Column(name="nome_solicitante", nullable=false, length=50)
	private String nomeSolicitante;
	
	@Expose
	@Column(name="descricao", length=250)
	private String descricao;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Usuario getUsuarioFk() {
		return usuarioFk;
	}
	public void setUsuarioFk(Usuario usuarioFk) {
		this.usuarioFk = usuarioFk;
	}
	public Profissional getProfissionalFk() {
		return profissionalFk;
	}
	public void setProfissionalFk(Profissional profissionalFk) {
		this.profissionalFk = profissionalFk;
	}
	public Fornecedor getFornecedorFk() {
		return fornecedorFk;
	}
	public void setFornecedorFk(Fornecedor fornecedorFk) {
		this.fornecedorFk = fornecedorFk;
	}
	public String getNomeSolicitante() {
		return nomeSolicitante;
	}
	public void setNomeSolicitante(String nomeSolicitante) {
		this.nomeSolicitante = nomeSolicitante;
	}

	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	
}
