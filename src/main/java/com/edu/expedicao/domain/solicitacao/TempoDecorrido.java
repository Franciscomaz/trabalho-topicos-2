package com.edu.expedicao.domain.solicitacao;

public class TempoDecorrido {

    private final Long dias;
    private final Long meses;
    private final Long anos;

    public TempoDecorrido(final Long dias,
                          final Long meses,
                          final Long anos) {
        this.dias = dias;
        this.meses = meses;
        this.anos = anos;
    }

    public Long getDias() {
        return dias;
    }

    public Long getMeses() {
        return meses;
    }

    public Long getAnos() {
        return anos;
    }
}
