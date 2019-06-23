package com.edu.expedicao.domain.solicitacao;

public enum SolicitacaoStatus {

    EM_ESPERA(1, "Em espera", "is-warning", false),
    EM_ANDAMENTO(2, "Em andamento", "is-info", false),
    CONCLUIDA(3, "Concluída", "is-success", true),
    CANCELADA(4, "Cancelada", "is-danger", true);

    private final Integer codigo;
    private final String descricao;
    private final String cor;
    private final Boolean isFinalizador;

    SolicitacaoStatus(final Integer codigo,
                      final String descricao,
                      final String cor,
                      final Boolean isFinalizado) {
        this.codigo = codigo;
        this.descricao = descricao;
        this.cor = cor;
        this.isFinalizador = isFinalizado;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public String getDescricao() {
        return descricao;
    }

    public String getCor() {
        return cor;
    }

    public Boolean isFinalizador() {
        return isFinalizador;
    }
}
