package com.edu.expedicao.model.solicitacao;

public enum SolicitacaoStatus {

    EM_ESPERA(1, "Em espera"),
    EM_ANDAMENTO(1, "Em andamento"),
    CONCLUIDA(1, "Concluída");

    private Integer codigo;
    private String descricao;

    SolicitacaoStatus(Integer codigo, String descricao) {
        this.codigo = codigo;
        this.descricao = descricao;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public String getDescricao() {
        return descricao;
    }

}
