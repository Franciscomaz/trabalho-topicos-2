package com.edu.expedicao.application.solicitacao;

import com.edu.expedicao.application.produto.ProdutoService;
import com.edu.expedicao.application.revenda.RevendaService;
import com.edu.expedicao.domain.pedido.Pedido;
import com.edu.expedicao.domain.pedido.PedidoProduto;
import com.edu.expedicao.domain.produto.Produto;
import com.edu.expedicao.domain.solicitacao.Solicitacao;
import com.edu.expedicao.domain.solicitacao.SolicitacaoStatus;
import com.edu.expedicao.infrastructure.repositories.SolicitacaoRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class SolicitacaoService {

    private final RevendaService revendaService;
    private final ProdutoService produtoService;
    private final SolicitacaoRepository solicitacaoRepository;

    public SolicitacaoService(final RevendaService revendaService,
                              final ProdutoService produtoService,
                              final SolicitacaoRepository solicitacaoRepository) {
        this.revendaService = revendaService;
        this.produtoService = produtoService;
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

    public Solicitacao criar(final NovaSolicitacao novaSolicitacao) {
        final Pedido novoPedido = new Pedido();

        novaSolicitacao
                .getPedido()
                .getProdutos()
                .forEach(produtoDto -> {
                            final Produto produto = produtoService.buscarPeloId(produtoDto.getProdutoId());
                            final PedidoProduto novoProduto = new PedidoProduto(
                                    produto.getValor(),
                                    novoPedido,
                                    produto,
                                    produtoDto.getQuantidade()
                            );

                            novoPedido.addProduto(novoProduto);
                        }
                );

        final Solicitacao solicitacao = new Solicitacao();

        solicitacao.setRevenda(revendaService.buscarPeloId(novaSolicitacao.getRevendaId()));
        solicitacao.setPedido(novoPedido);
        solicitacao.setDataHoraInicio(LocalDateTime.now());
        solicitacao.setStatus(SolicitacaoStatus.EM_ESPERA);

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
