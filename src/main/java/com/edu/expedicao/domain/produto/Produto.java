package com.edu.expedicao.domain.produto;

import org.hibernate.validator.constraints.Length;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

@Entity
public class Produto {

    @Id
    @GeneratedValue
    private Long id;

    @NotNull(message = "É necessário informar uma descrição")
    @NotEmpty(message = "É necessário informar uma descrição")
    @Length(max = 60, message = "Não é permitido produtos com descrição maior que 60 caracteres")
    private String descricao;

    @NotNull(message = "É necessário informar o valor")
    private BigDecimal valor;

    @Length(max = 60, message = "Não é permitido produtos com dimensões maiores que 60 caracteres")
    private String dimensoes;

    @Length(max = 255, message = "Não é permitido produtos com referências maiores que 255 caracteres")
    private String referencia;

    public Produto() {
    }

    public Produto(final Long id,
                   final String descricao,
                   final BigDecimal valor,
                   final String dimensoes,
                   final String referencia) {
        this.id = id;
        this.descricao = descricao;
        this.valor = valor;
        this.dimensoes = dimensoes;
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

    public String getReferencia() {
        return referencia;
    }

    public void setReferencia(String referencia) {
        this.referencia = referencia;
    }
}
