package com.edu.expedicao.domain.solicitacao;

public enum SolicitacaoStatus {

    EM_ESPERA(1, "Em espera"),
    EM_ANDAMENTO(2, "Em andamento"),
    CONCLUIDA(3, "Concluída");

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
