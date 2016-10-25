package br.com.pegapa.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import com.google.gson.annotations.Expose;

@Entity(name="profissional")
public class Profissional {
	
	
	@Expose
	private Integer id;
	
	@Expose
	private String cpf;
	
	@Expose
	private String nome;
	
	@Embedded
	@Expose
	private Endereco endereco;

	@Expose
	private String cidade;
	
	@Expose
	private String estado;
	
	@Expose
	private String bairro;

	@Expose
	private String telefone;
	
	@Expose
	private String celular;
	
	@Expose
	private String email;
	
	@Expose
	private String senha;

	@Expose
	private String ocupacao;
	
	@Expose
	private String experiencia;
	
	@Expose
	private Byte mesesExperiencia;
	
	@Expose
	private Short anosExperiencia;
	
	private byte[] imagem;
	
	@Expose
	private String descricaoProfissao;
	
	@Expose
	@Transient
	private Double nota;
	
	private Set<Solicitacao> solicitacoes;
	
	@Expose
	private Set<Comentario> comentarios;
	
	@Expose
	private Set<Servico> servicos;
	
	public Profissional() {
		
	}
	
	public Profissional(Integer id){
		this.id = id;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(length=60, nullable=true, name="nome")
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	@Column(length=14, nullable=true, name="cpf", unique=true)
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	@Column(name="cidade", length=90, nullable=false)
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	
	@Column(name="estado", length=40, nullable=false)
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	@Column(length=13, nullable=true, name="telefone")
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	
	@Column(length=13, nullable=true, name="celular")
	public String getCelular() {
		return celular;
	}
	public void setCelular(String celular) {
		this.celular = celular;
	}
	
	@Column(length=50, nullable=true, name="email", unique=true)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Column(length=15, nullable=true, name="senha")
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	@Column(length=40, nullable=true, name="ocupacao")
	public String getOcupacao() {
		return ocupacao;
	}
	public void setOcupacao(String ocupacao) {
		this.ocupacao = ocupacao;
	}
	
	@Column(length=10, nullable=true, name="experiencia")
	public String getExperiencia() {
		return experiencia;
	}
	public void setExperiencia(String experiencia) {
		this.experiencia = experiencia;
	}
	
	@Column(name="bairro", nullable=false, length=60)
	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	
	@Column(length=2, nullable=true, name="mesesExper")
	public Byte getMesesExperiencia() {
		return mesesExperiencia;
	}

	public void setMesesExperiencia(Byte mesesExperiencia) {
		this.mesesExperiencia = mesesExperiencia;
	}
	@Column(length=2, nullable=true, name="anosExper")
	public Short getAnosExperiencia() {
		return anosExperiencia;
	}

	public void setAnosExperiencia(Short anosExperiencia) {
		this.anosExperiencia = anosExperiencia;
	}

	@Lob
	public byte[] getImagem() {
		return imagem;
	}

	public void setImagem(byte[] imagem) {
		this.imagem = imagem;
	}
	
	@Column(length=300, nullable=true, name="descricaoProfissao")
	public String getDescricaoProfissao() {
		return descricaoProfissao;
	}

	public void setDescricaoProfissao(String descricaoProfissao) {
		this.descricaoProfissao = descricaoProfissao;
	}

	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, targetEntity=Solicitacao.class, mappedBy="profissional")
	public Set<Solicitacao> getSolicitacoes() {
		return solicitacoes;
	}

	public void setSolicitacoes(Set<Solicitacao> solicitacoes) {
		this.solicitacoes = solicitacoes;
	}
	
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="profissionalFk", targetEntity=Comentario.class)
	public Set<Comentario> getComentarios() {
		return comentarios;
	}

	public void setComentarios(Set<Comentario> comentarios) {
		this.comentarios = comentarios;
	}
	
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="profissional", targetEntity=Servico.class)
	public Set<Servico> getServicos() {
		return servicos;
	}

	public void setServicos(Set<Servico> servicos) {
		this.servicos = servicos;
	}

	public Double getNota() {
		return nota;
	}

	public void setNota(Double nota) {
		this.nota = nota;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	@Override
	public String toString() {
		return "Profissional [id=" + id + ", cpf=" + cpf + ", nome=" + nome
				+ ", cidade=" + cidade + ", estado=" + estado 
				+ ", telefone=" + telefone + ", celular=" + celular
				+ ", email=" + email + ", senha=" + senha + ", nomeReferencia="
				+ ", ocupacao=" + ocupacao + ", experiencia=" + experiencia
				+ "]";
	}
	
}
