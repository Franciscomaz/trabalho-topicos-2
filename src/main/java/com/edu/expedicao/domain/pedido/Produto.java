package com.edu.expedicao.domain.pedido;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

@Entity
public class Produto {

    @Id
    @GeneratedValue
    private Long id;

    @NotNull(message = "É necessário informar uma descrição")
    private String descricao;

    @NotNull(message = "É necessário informar o valor")
    private BigDecimal valor;

    private String dimensoes;

    private String referencia;

    @ManyToOne
    @JoinColumn(name = "pedido_id")
    private Pedido pedido;

    public Produto() {
    }

    public Produto(Long id,
                   String descricao,
                   BigDecimal valor,
                   String dimensoes,
                   Pedido pedido,
                   String referencia) {
        this.id = id;
        this.descricao = descricao;
        this.valor = valor;
        this.dimensoes = dimensoes;
        this.pedido = pedido;
        this.referencia = referencia;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public BigDecimal getValor() {
        return valor;
    }

    public void setValor(BigDecimal valor) {
        this.valor = valor;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getDimensoes() {
        return dimensoes;
    }

    public void setDimensoes(String dimensoes) {
        this.dimensoes = dimensoes;
    }

    public Pedido getPedido() {
        return pedido;
    }

    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }

    public String getReferencia() {
        return referencia;
    }

    public void setReferencia(String referencia) {
        this.referencia = referencia;
    }
}
