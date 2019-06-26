package com.edu.expedicao.application.solicitacao;

import javax.validation.constraints.Min;

public class PedidoProdutoDto {

    private Long produtoId;

    @Min(value = 1, message = "É necessário possuir pelo menos um produto")
    private Integer quantidade;

    public PedidoProdutoDto() {
        quantidade = 0;
    }

    public Long getProdutoId() {
        return produtoId;
    }

    public void setProdutoId(Long produtoId) {
        this.produtoId = produtoId;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }
}
