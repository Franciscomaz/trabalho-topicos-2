package com.edu.expedicao.application.solicitacao;

import java.math.BigDecimal;

public class PedidoProdutoDto {

    private Long produtoId;
    private BigDecimal valor;
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

    public BigDecimal getValor() {
        return valor;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }
}
