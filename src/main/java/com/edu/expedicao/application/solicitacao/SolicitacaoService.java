package com.edu.expedicao.application.solicitacao;

import com.edu.expedicao.domain.solicitacao.Solicitacao;
import com.edu.expedicao.infrastructure.repositories.SolicitacaoRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SolicitacaoService {

    private SolicitacaoRepository solicitacaoRepository;

    public SolicitacaoService(SolicitacaoRepository solicitacaoRepository) {
        this.solicitacaoRepository = solicitacaoRepository;
    }

    public Solicitacao buscarPeloId(final Long id) {
        return this.solicitacaoRepository.getOne(id);
    }

    public List<Solicitacao> buscarTodos() {
        return this.solicitacaoRepository.findAll();
    }

    public Page<Solicitacao> buscarComPaginacao(final Pageable pageable) {
        return this.solicitacaoRepository.findAll(pageable);
    }

    public Solicitacao criar(final Solicitacao solicitacao) {
        return this.solicitacaoRepository.save(solicitacao);
    }

    public Solicitacao atualizar(final Solicitacao solicitacao) {
        return this.solicitacaoRepository.save(solicitacao);
    }

    public Solicitacao remover(final Solicitacao solicitacao) {
        this.solicitacaoRepository.delete(solicitacao);
        return solicitacao;
    }
}
