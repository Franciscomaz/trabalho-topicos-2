package com.edu.expedicao.application.produto;

import com.edu.expedicao.domain.pedido.Produto;
import com.edu.expedicao.infrastructure.repositories.ProdutoRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProdutoService {

    private ProdutoRepository produtoRepository;

    public ProdutoService(ProdutoRepository produtoRepository) {
        this.produtoRepository = produtoRepository;
    }

    public Produto buscarPeloId(final Long id) {
        return this.produtoRepository.getOne(id);
    }

    public List<Produto> buscarTodos() {
        return this.produtoRepository.findAll();
    }

    public Page<Produto> buscarComPaginacao(final Pageable pageable) {
        return this.produtoRepository.findAll(pageable);
    }

    public Produto criar(final Produto produto) {
        return this.produtoRepository.save(produto);
    }

    public Produto atualizar(final Produto produto) {
        return this.produtoRepository.save(produto);
    }

    public Produto remover(final Produto produto) {
        this.produtoRepository.delete(produto);
        return produto;
    }
}
