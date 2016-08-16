package br.com.pegapa.repository;

import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import br.com.pegapa.entity.Profissional;
import br.com.pegapa.entity.SituacaoSolicitacao;
import br.com.pegapa.entity.Solicitacao;

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
}
