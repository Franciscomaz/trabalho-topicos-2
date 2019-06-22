package com.edu.expedicao.domain.pedido;

import com.edu.expedicao.domain.produto.Produto;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
public class PedidoProduto {

    @Id
    @GeneratedValue
    private Long id;

    private BigDecimal valorUnitario;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "pedido_id")
    private Pedido pedido;

    @ManyToOne
    @JoinColumn(name = "produto_id")
    private Produto produto;

    private Integer quantidade;

    public PedidoProduto() {
    }

    public PedidoProduto(final BigDecimal valorUnitario,
                         final Pedido pedido,
                         final Produto produto,
                         final Integer quantidade) {
        this.valorUnitario = valorUnitario;
        this.pedido = pedido;
        this.produto = produto;
        this.quantidade = quantidade;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public BigDecimal valorUnitario() {
        return valorUnitario;
    }

    public void setValorUnitario(BigDecimal valorUnitario) {
        this.valorUnitario = valorUnitario;
    }

    public BigDecimal getValorTotal() {
        return valorUnitario.multiply(BigDecimal.valueOf(quantidade));
    }

    public BigDecimal valorReferencia() {
        return produto.getValor();
    }

    public Pedido getPedido() {
        return pedido;
    }

    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }
}
