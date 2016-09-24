package br.com.pegapa.repository;

import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import br.com.pegapa.entity.Comentario;
import br.com.pegapa.entity.Fornecedor;
import br.com.pegapa.entity.Profissional;
import br.com.pegapa.entity.SituacaoSolicitacao;
import br.com.pegapa.entity.Solicitacao;
import br.com.pegapa.entity.Usuario;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class SolicitacaoRepository {

	@PersistenceContext
	private EntityManager manager;
	
	
	public void enviarSolicitacao(Solicitacao solic){
		this.manager.persist(solic);
	}
	
	public List<Solicitacao> buscaSolicitacoesPorIdProfissional(Profissional prof){
		TypedQuery<Solicitacao> query = this.manager
				.createQuery("select s from solicitacao s where s.profissional.id =:id and s.situacao = :env", Solicitacao.class);
		query.setParameter("id", prof.getId());
		query.setParameter("env", SituacaoSolicitacao.ENVIADO);
		return query.getResultList();
	}
	public List<Solicitacao> buscaSolicitacoesPorIdForneccedor(Fornecedor forn){
		TypedQuery<Solicitacao> query = this.manager
				.createQuery("select s from solicitacao s where s.fornecedor.codFornecedor =:id and s.situacao = :env", Solicitacao.class);
		query.setParameter("id", forn.getCodFornecedor());
		query.setParameter("env", SituacaoSolicitacao.ENVIADO);
		return query.getResultList();
	}
	
	public List<Solicitacao> buscaSolicitacoesRecusadasOuAceitas(Profissional prof){
		TypedQuery<Solicitacao> query = this.manager
				.createQuery("select s from solicitacao s where s.profissional.id =:id and s.situacao = :conf or s.situacao = :neg", Solicitacao.class);
		query.setParameter("id", prof.getId());
		query.setParameter("conf", SituacaoSolicitacao.CONFIRMADO);
		query.setParameter("neg", SituacaoSolicitacao.RECUSADO);
		return query.getResultList();
	}
	
	public List<Solicitacao> buscaSolicitacoesRecusadasOuAceitasDeFornecedor(Fornecedor f){
		TypedQuery<Solicitacao> query = this.manager
				.createQuery("select s from solicitacao s where s.fornecedor.codFornecedor =:id and s.situacao = :conf or s.situacao = :neg", Solicitacao.class);
		query.setParameter("id", f.getCodFornecedor());
		query.setParameter("conf", SituacaoSolicitacao.CONFIRMADO);
		query.setParameter("neg", SituacaoSolicitacao.RECUSADO);
		return query.getResultList();
	}
	
	public Solicitacao findByPk(Integer id){
		return this.manager.find(Solicitacao.class, id);
	}
	
	public void persistir(Solicitacao solic){
		this.manager.persist(solic);
	}
	
	public void merge(Solicitacao solic){
		this.manager.merge(solic);
	}
	
	public List<Solicitacao> buscaSolicitacoesPorUsuario(Usuario usr){
		String nomeServico = "VAZIO";
		TypedQuery<Solicitacao> query = this.manager
				.createQuery("select s from solicitacao s where s.usuario.cod_user =:user and s.nomeServico != :nome", Solicitacao.class);
		query.setParameter("user", usr.getCod_user());
		query.setParameter("nome", nomeServico);
		return query.getResultList();
	}
	
	public List<Solicitacao> buscaSolicitacoesFornecedoresPorUsuario(Usuario usr){
		String nomeServico = "VAZIO";
		TypedQuery<Solicitacao> query = this.manager
				.createQuery("select s from solicitacao s where s.usuario.cod_user =:user and s.nomeServico = :nome", Solicitacao.class);
		query.setParameter("user", usr.getCod_user());
		query.setParameter("nome", nomeServico);
		return query.getResultList();
	}
	
	public void inserirComentario(Comentario c){
		this.manager.persist(c);
	}
}
