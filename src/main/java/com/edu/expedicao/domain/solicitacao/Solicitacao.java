package com.edu.expedicao.domain.solicitacao;

import com.edu.expedicao.domain.pedido.Pedido;
import com.edu.expedicao.domain.revenda.Revenda;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Objects;

@Entity
public class Solicitacao {

    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "pedido_id")
    @NotNull(message = "É necessário informar o pedido")
    private Pedido pedido;

    @ManyToOne
    @JoinColumn(name = "Revenda_id")
    @NotNull(message = "É necessário informar a revenda")
    private Revenda revenda;

    @NotNull(message = "É necessário que a solicitação possua um status")
    private SolicitacaoStatus status;

    @Length(max = 255, message = "A observação não pode ultrapassar 255 caracteres")
    private String observacao;
    private LocalDateTime dataHoraInicio;
    private LocalDateTime dataHoraConclusao;

    public Solicitacao() {
        pedido = new Pedido();
    }

    public Solicitacao(final Long id,
                       final Pedido pedido,
                       final Revenda revenda,
                       final SolicitacaoStatus status,
                       final String observacao,
                       final LocalDateTime dataHoraInicio,
                       final LocalDateTime dataHoraConclusao) {
        super();
        this.id = id;
        this.pedido = pedido;
        this.revenda = revenda;
        this.status = status;
        this.observacao = observacao;
        this.dataHoraInicio = dataHoraInicio;
        this.dataHoraConclusao = dataHoraConclusao;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Pedido getPedido() {
        return pedido;
    }

    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }

    public BigDecimal getValorTotal() {
        return getPedido().getValorTotal();
    }

    public Revenda getRevenda() {
        return revenda;
    }

    public void setRevenda(Revenda revenda) {
        this.revenda = revenda;
    }

    public SolicitacaoStatus getStatus() {
        return status;
    }

    public void setStatus(SolicitacaoStatus status) {
        this.status = status;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public LocalDateTime getDataHoraInicio() {
        return dataHoraInicio;
    }

    public void setDataHoraInicio(LocalDateTime dataHoraInicio) {
        this.dataHoraInicio = dataHoraInicio;
    }

    public LocalDateTime getDataHoraConclusao() {
        return dataHoraConclusao;
    }

    public void setDataHoraConclusao(LocalDateTime dataHoraConclusao) {
        this.dataHoraConclusao = dataHoraConclusao;
    }

    public String getDataHoraInicioFormatado() {
        return getDataHoraInicio().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    public TempoDecorrido tempoDecorrido() {
        if (!isConcluida()) {
            final LocalDateTime now = LocalDateTime.now();
            return new TempoDecorrido(ChronoUnit.DAYS.between(getDataHoraInicio(), now),
                    ChronoUnit.MONTHS.between(getDataHoraInicio(), now),
                    ChronoUnit.YEARS.between(getDataHoraInicio(), now));
        }

        return new TempoDecorrido(ChronoUnit.DAYS.between(getDataHoraInicio(), getDataHoraConclusao()),
                ChronoUnit.MONTHS.between(getDataHoraInicio(), getDataHoraConclusao()),
                ChronoUnit.YEARS.between(getDataHoraInicio(), getDataHoraConclusao()));
    }

    public Boolean isConcluida() {
        return Objects.nonNull(dataHoraConclusao);
    }
}
