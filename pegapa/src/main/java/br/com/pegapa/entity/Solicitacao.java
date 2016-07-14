package br.com.pegapa.entity;

import javax.persistence.Column;
import javax.persistence.ConstraintMode;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Solicitacao {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer idSolicitacao;

	
	@Enumerated(EnumType.STRING)
	@Column(length=30, nullable=false, name="situacao" )
	private SituacaoSolicitacao situacao;
	
	@ManyToOne
	@JoinColumn(name="id_profissional", foreignKey=@ForeignKey(value=ConstraintMode.CONSTRAINT, name="PROFISSIONAL_FK"))
	private Profissional profissional;
	
	
	@ManyToOne
	@JoinColumn(name="id_usuario", foreignKey=@ForeignKey(value=ConstraintMode.CONSTRAINT, name="USUARIO_FK"))
	private Usuario usuario;
	
	
	public Solicitacao() {
		// TODO Auto-generated constructor stub
	}


	public Integer getIdSolicitacao() {
		return idSolicitacao;
	}


	public void setIdSolicitacao(Integer idSolicitacao) {
		this.idSolicitacao = idSolicitacao;
	}


	public SituacaoSolicitacao getSituacao() {
		return situacao;
	}


	public void setSituacao(SituacaoSolicitacao situacao) {
		this.situacao = situacao;
	}


	public Profissional getProfissional() {
		return profissional;
	}


	public void setProfissional(Profissional profissional) {
		this.profissional = profissional;
	}


	public Usuario getUsuario() {
		return usuario;
	}


	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	
	
	
	
	
}
