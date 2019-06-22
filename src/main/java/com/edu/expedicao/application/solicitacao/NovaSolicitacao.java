package com.edu.expedicao.application.solicitacao;

import java.io.Serializable;

public class NovaSolicitacao implements Serializable {
    private Long revendaId;
    private Long statusId;
    private NovoPedido pedido;
    private String observacao;

    public NovaSolicitacao() {
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

    public Long getStatusId() {
        return statusId;
    }

    public void setStatusId(Long statusId) {
        this.statusId = statusId;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }
}