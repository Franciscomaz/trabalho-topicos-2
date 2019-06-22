package com.edu.expedicao.application.produto;

import com.edu.expedicao.domain.produto.Produto;
import com.edu.expedicao.infrastructure.repositories.ProdutoRepository;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
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

    public Page<Produto> buscarComPaginacao(final String filter, final Pageable pageable) {
        final Produto produtoFilter = new Produto();
        produtoFilter.setDescricao(filter);

        final ExampleMatcher matcher = ExampleMatcher.matching()
                .withStringMatcher(ExampleMatcher.StringMatcher.CONTAINING);

        return this.produtoRepository.findAll(Example.of(produtoFilter, matcher), pageable);
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

    public Long totalDeProdutos() {
        return produtoRepository.count();
    }
}
