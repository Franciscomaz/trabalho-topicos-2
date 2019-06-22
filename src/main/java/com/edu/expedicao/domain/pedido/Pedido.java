package com.edu.expedicao.domain.pedido;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Pedido {

    @Id
    @GeneratedValue
    private Long id;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "pedido_id")
    private List<PedidoProduto> produtos;

    private LocalDateTime dataPedido;

    public Pedido() {
        this.produtos = new ArrayList<>();
    }

    public Pedido(final Long id, final LocalDateTime dataPedido) {
        super();
        this.id = id;
        this.dataPedido = dataPedido;
    }

    public BigDecimal getValorTotal() {
        return getProdutos().stream()
                .map(PedidoProduto::getValorTotal)
                .reduce(BigDecimal::add)
                .orElse(BigDecimal.ZERO);
    }

    public List<PedidoProduto> getProdutos() {
        return produtos;
    }

    public void setProdutos(List<PedidoProduto> produtos) {
        this.produtos = produtos;
    }

    public void addProduto(final PedidoProduto produto) {
        produtos.add(produto);
    }

    public LocalDateTime getDataPedido() {
        return dataPedido;
    }

    public void setDataPedido(LocalDateTime dataPedido) {
        this.dataPedido = dataPedido;
    }
}
