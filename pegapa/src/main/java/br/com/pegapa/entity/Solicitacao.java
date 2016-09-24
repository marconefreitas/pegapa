package br.com.pegapa.entity;

import java.text.SimpleDateFormat;
import java.util.Calendar;

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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity(name="solicitacao")
public class Solicitacao {

	@Transient
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer idSolicitacao;

	
	@Enumerated(EnumType.STRING)
	@Column(length=30, nullable=false, name="situacao" )
	private SituacaoSolicitacao situacao;
	
	@ManyToOne
	@JoinColumn(name="id_profissional", nullable=true, foreignKey=@ForeignKey(value=ConstraintMode.CONSTRAINT,name="PROFISSIONAL_FK"))
	private Profissional profissional;
	
	@ManyToOne
	@JoinColumn(name="id_fornecedor", nullable=true,foreignKey=@ForeignKey(value=ConstraintMode.CONSTRAINT, name="FORNECEDOR_FK"))
	private Fornecedor fornecedor;
	
	@Column(name="nomeServico")
	private String nomeServico;
	
	@ManyToOne
	@JoinColumn(name="id_usuario", nullable=false ,foreignKey=@ForeignKey(value=ConstraintMode.CONSTRAINT, name="USUARIO_FK"))
	private Usuario usuario;
	
	@Column(name="desc_solicitacao", length=250, nullable=false)
	private String descricaoSolicitacao;
	
	@Column(name="resp_solicitacao", length=250, nullable=true)
	private String respostaSolicitacao;
	
	@Column(name="dtSolicitacao")
	@Temporal(value=TemporalType.TIMESTAMP)
	private Calendar dtSolicitacao;
	
	@Column(name="dtModificacao")
	@Temporal(value=TemporalType.TIMESTAMP)
	private Calendar dtModificacao;
	
	@Column(name="avaliacao")
	private Byte avaliacao;
	
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


	public Fornecedor getFornecedor() {
		return fornecedor;
	}


	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
	}


	public Usuario getUsuario() {
		return usuario;
	}


	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}


	public String getDescricaoSolicitacao() {
		return descricaoSolicitacao;
	}


	public void setDescricaoSolicitacao(String descricaoSolicitacao) {
		this.descricaoSolicitacao = descricaoSolicitacao;
	}


	public String getRespostaSolicitacao() {
		return respostaSolicitacao;
	}


	public void setRespostaSolicitacao(String respostaSolicitacao) {
		this.respostaSolicitacao = respostaSolicitacao;
	}

	public Calendar getDtSolicitacao() {
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        sdf.format(this.dtSolicitacao.getTime());
		return dtSolicitacao;
	}


	public void setDtSolicitacao(Calendar dtSolicitacao) {
		this.dtSolicitacao = dtSolicitacao;
	}

	
	public String getDtFormatada(){
		
		return sdf.format(this.dtSolicitacao.getTime());
	}

	public String getDtModificacaoFormatada(){
		return sdf.format(this.dtModificacao.getTime());
	}
	
	public Calendar getDtModificacao() {
		return dtModificacao;
	}


	public void setDtModificacao(Calendar dtModificacao) {
		this.dtModificacao = dtModificacao;
	}
	
	public String getSituacaoEDataModificacaoFormatada(){
		StringBuilder prefixo = new StringBuilder();
		if(this.situacao.equals(SituacaoSolicitacao.CONFIRMADO)){
			prefixo.append("Confirmado em "); 
		} else if(this.situacao.equals(SituacaoSolicitacao.RECUSADO)){
			prefixo.append("Recusado em "); 
		} else if(this.situacao.equals(SituacaoSolicitacao.ENVIADO)){
			prefixo.append("Enviado em ");
		} else if(this.situacao.equals(SituacaoSolicitacao.FINALIZADO)){
			prefixo.append("Finalizado em ");
		} else if(this.situacao.equals(SituacaoSolicitacao.CANCELADO)){
			prefixo.append("Cancelado em ");
		}
		return prefixo.append(sdf.format(this.dtModificacao.getTime())).toString();
	}


	public Byte getAvaliacao() {
		return avaliacao;
	}


	public void setAvaliacao(Byte avaliacao) {
		this.avaliacao = avaliacao;
	}


	public String getNomeServico() {
		return nomeServico;
	}


	public void setNomeServico(String nomeServico) {
		this.nomeServico = nomeServico;
	}
	
}
