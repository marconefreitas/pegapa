package br.com.pegapa.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity(name="profissional")
public class Profissional {
	
	
	
	private Integer id;
	
	private String cpf;
	
	private String nome;
	
	private String logradouro;
	
	private String numero;
	
	private String cidade;
	
	private String estado;
	
	private String cep;
	
	private String telefone;
	
	private String celular;
	
	private String email;
	private String senha;

	private String ocupacao;
	private String experiencia;
	
	@ManyToMany
	@JoinTable(name = "solicitacao")
	private List<Profissional> solicitacoes;
	

	public Profissional() {
		// TODO Auto-generated constructor stub
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
