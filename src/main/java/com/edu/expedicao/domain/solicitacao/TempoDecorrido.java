package com.edu.expedicao.domain.solicitacao;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

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

    public static TempoDecorrido between(final LocalDateTime from, LocalDateTime to) {
        return new TempoDecorrido(ChronoUnit.DAYS.between(from, to),
                ChronoUnit.MONTHS.between(from, to),
                ChronoUnit.YEARS.between(from, to));
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
