package com.edu.expedicao.domain.pedido;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Pedido {

    @Id
    @GeneratedValue
    private Long id;

    @OneToMany
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

    public List<PedidoProduto> getProdutos() {
        return produtos;
    }

    public void setProdutos(List<PedidoProduto> produtos) {
        this.produtos = produtos;
    }

    public LocalDateTime getDataPedido() {
        return dataPedido;
    }

    public void setDataPedido(LocalDateTime dataPedido) {
        this.dataPedido = dataPedido;
    }
}
