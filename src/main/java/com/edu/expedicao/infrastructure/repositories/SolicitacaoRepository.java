package com.edu.expedicao.infrastructure.repositories;

import com.edu.expedicao.domain.solicitacao.Solicitacao;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SolicitacaoRepository extends JpaRepository<Solicitacao, Long> {
}
