package com.edu.expedicao.application.solicitacao;

import org.hibernate.validator.constraints.Length;

import java.util.Objects;

public class AlterarSolicitacaoCommand {

    private Integer statusCodigo;

    @Length(max = 255, message = "A observação não pode ultrapassar 255 caracteres")
    private String observacao;

    public AlterarSolicitacaoCommand(Integer statusCodigo, String observacao) {
        this.statusCodigo = statusCodigo;
        this.observacao = observacao;
    }

    public Integer getStatusCodigo() {
        return statusCodigo;
    }

    public String getObservacao() {
        return observacao;
    }

    public Boolean possuiStatus() {
        return Objects.nonNull(getStatusCodigo());
    }

}
