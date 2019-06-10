package com.edu.expedicao.model.pedido;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Pedido {

    @Id
    @GeneratedValue
    private Long id;

    @OneToMany
    @JoinColumn(name = "pedido_id")
    private List<Produto> produtos;

    public Pedido() {
        this.produtos = new ArrayList<>();
    }

    public Pedido(Long id, List<Produto> produtos) {
        super();
        this.id = id;
        this.produtos = produtos;
    }

    public List<Produto> getProdutos() {
        return produtos;
    }

    public void setProdutos(List<Produto> produtos) {
        this.produtos = produtos;
    }
}
