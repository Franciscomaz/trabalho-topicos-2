package com.edu.expedicao.application.solicitacao;

import javax.validation.Valid;
import javax.validation.constraints.NotEmpty;
import java.util.ArrayList;
import java.util.List;

public class NovoPedido {
    private Long id;

    @Valid
    @NotEmpty(message = "É necessário informar pelo menos um produto")
    private List<PedidoProdutoDto> produtos;

    public NovoPedido() {
        produtos = new ArrayList<>();
    }

    public NovoPedido(Long id, List<PedidoProdutoDto> produtos) {
        super();
        this.id = id;
        this.produtos = produtos;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void addProduto() {
        produtos.add(new PedidoProdutoDto());
    }

    public List<PedidoProdutoDto> getProdutos() {
        return produtos;
    }

    public void setProdutos(List<PedidoProdutoDto> produtos) {
        this.produtos = produtos;
    }
}
