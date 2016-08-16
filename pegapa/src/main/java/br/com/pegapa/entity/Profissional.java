package br.com.pegapa.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.JsonAdapter;

@Entity(name="profissional")
public class Profissional {
	
	
	@Expose
	private Integer id;
	
	@Expose
	private String cpf;
	
	@Expose
	private String nome;
	
	@Expose
	private String logradouro;
	
	@Expose
	private String numero;
	
	@Expose
	private String cidade;
	
	@Expose
	private String estado;
	
	@Expose
	private String bairro;

	@Expose
	private String cep;
	
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
	
	
	private List<Solicitacao> solicitacoes;
	
	
	private List<Comentario> comentarios;
	
	
	public Profissional() {
		// TODO Auto-generated constructor stub
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
	
	@Column(length=60, nullable=true, name="logradouro")
	public String getLogradouro() {
		return logradouro;
	}
	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}
	
	@Column(length=8, nullable=true, name="numero")
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
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
	
	@Column(length=9, nullable=true, name="cep")
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
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
	
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, targetEntity=Solicitacao.class, mappedBy="profissional")
	public List<Solicitacao> getSolicitacoes() {
		return solicitacoes;
	}

	public void setSolicitacoes(List<Solicitacao> solicitacoes) {
		this.solicitacoes = solicitacoes;
	}
	
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="profissionalFk", targetEntity=Comentario.class)
	public List<Comentario> getComentarios() {
		return comentarios;
	}

	public void setComentarios(List<Comentario> comentarios) {
		this.comentarios = comentarios;
	}

	@Override
	public String toString() {
		return "Profissional [id=" + id + ", cpf=" + cpf + ", nome=" + nome
				+ ", logradouro=" + logradouro + ", numero=" + numero
				+ ", cidade=" + cidade + ", estado=" + estado + ", cep=" + cep
				+ ", telefone=" + telefone + ", celular=" + celular
				+ ", email=" + email + ", senha=" + senha + ", nomeReferencia="
				+ ", ocupacao=" + ocupacao + ", experiencia=" + experiencia
				+ "]";
	}
	
}
