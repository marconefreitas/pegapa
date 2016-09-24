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

@Entity(name="fornecedor")
public class Fornecedor {

	@Expose
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer codFornecedor;
	
	@Expose
	@Column(length=20, nullable=false)
	private String tipoLoja;
	
	@Expose
	@Column(length=80)
	private String nomeFantasia;
	
	@Expose
	@Column(length=14)
	private String cnpj;
	
	@Expose
	@Column(length=35)
	private String ramoAtuacao;
	
	@Expose
	@Column(length=50)
	private String url;
	
	@Expose
	@Column(length=30)
	private String nomeResponsavel;
	
	@Lob
	private byte[] foto;
	
	@Expose
	@Column(length=40)
	private String estado;
	
	@Expose
	@Column(length=40)
	private String cidade;
	
	@Expose
	@Column(length=40)
	private String bairro;
	
	@Expose
	@Embedded
	private Endereco endereco;
	
	@Expose
	@Column(length=14)
	private String tel1;
	
	@Expose
	@Column(length=14)
	private String tel2;
	
	@Expose
	@Column(length=40, nullable=false, unique=true)
	private String email;
	
	@Column(length=12, nullable=false)
	private String senha;
	
	@Expose
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="fornecedorFk", targetEntity=Comentario.class)
	private Set<Comentario> comentarios;
	

	@Transient
	private Double avaliacao;

	public Fornecedor(Integer cod) {
		this.codFornecedor = cod;
	}

	public Fornecedor() {
		// TODO Auto-generated constructor stub
	}
	
	public Integer getCodFornecedor() {
		return codFornecedor;
	}

	public void setCodFornecedor(Integer codFornecedor) {
		this.codFornecedor = codFornecedor;
	}

	public String getTipoLoja() {
		return tipoLoja;
	}

	public void setTipoLoja(String tipoLoja) {
		this.tipoLoja = tipoLoja;
	}

	public String getNomeFantasia() {
		return nomeFantasia;
	}

	public void setNomeFantasia(String nomeFantasia) {
		this.nomeFantasia = nomeFantasia;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getRamoAtuacao() {
		return ramoAtuacao;
	}

	public void setRamoAtuacao(String ramoAtuacao) {
		this.ramoAtuacao = ramoAtuacao;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getNomeResponsavel() {
		return nomeResponsavel;
	}

	public void setNomeResponsavel(String nomeResponsavel) {
		this.nomeResponsavel = nomeResponsavel;
	}

	public byte[] getFoto() {
		return foto;
	}

	public void setFoto(byte[] foto) {
		this.foto = foto;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public Double getAvaliacao() {
		return avaliacao;
	}

	public void setAvaliacao(Double avaliacao) {
		this.avaliacao = avaliacao;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}
	
	public Set<Comentario> getComentarios() {
		return comentarios;
	}

	public void setComentarios(Set<Comentario> comentarios) {
		this.comentarios = comentarios;
	}

	
}
