package com.edu.expedicao.infrastructure.repositories;

import com.edu.expedicao.domain.pedido.Produto;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProdutoRepository extends JpaRepository<Produto, Long> {
}
