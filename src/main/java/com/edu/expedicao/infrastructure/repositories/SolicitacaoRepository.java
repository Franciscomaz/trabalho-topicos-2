package com.edu.expedicao.infrastructure.repositories;

import com.edu.expedicao.domain.solicitacao.Solicitacao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface SolicitacaoRepository extends JpaRepository<Solicitacao, Long> {

    @Query(value = "select count(id) from Solicitacao where status not in (3)")
    Integer quantidadeEmAberto();

}
