package com.edu.expedicao.domain.solicitacao;

import com.edu.expedicao.domain.pedido.Pedido;
import com.edu.expedicao.domain.revenda.Revenda;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

@Entity
public class Solicitacao {

    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne
    @JoinColumn(name = "pedido_id")
    @NotNull(message = "É necessário informar o pedido")
    private Pedido pedido;

    @ManyToOne
    @JoinColumn(name = "Revenda_id")
    @NotNull(message = "É necessário informar a revenda")
    private Revenda revenda;

    private SolicitacaoStatus status;
    private LocalDateTime dataHoraInicio;
    private LocalDateTime dataHoraConclusao;

    public Solicitacao() {
    }

    public Solicitacao(final Long id,
                       final Pedido pedido,
                       final Revenda revenda,
                       final SolicitacaoStatus status,
                       final LocalDateTime dataHoraInicio,
                       final LocalDateTime dataHoraConclusao) {
        this.id = id;
        this.pedido = pedido;
        this.revenda = revenda;
        this.status = status;
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
}
