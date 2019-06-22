package com.edu.expedicao.application.solicitacao;

public class PedidoProdutoDto {

    private Long produtoId;
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
