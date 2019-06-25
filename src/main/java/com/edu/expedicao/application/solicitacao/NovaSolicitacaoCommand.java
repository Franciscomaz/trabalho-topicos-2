package com.edu.expedicao.application.solicitacao;

import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

public class NovaSolicitacaoCommand implements Serializable {

    @NotNull(message = "É necessário informar a revenda")
    private Long revendaId;
    private NovoPedido pedido;

    @Length(max = 255, message = "A observação não pode ultrapassar 255 caracteres")
    private String observacao;

    public NovaSolicitacaoCommand() {
        pedido = new NovoPedido();
    }

    public NovoPedido getPedido() {
        return pedido;
    }

    public Long getRevendaId() {
        return revendaId;
    }

    public void setRevendaId(Long revendaId) {
        this.revendaId = revendaId;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }
}