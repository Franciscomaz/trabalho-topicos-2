package com.edu.expedicao.infrastructure.repositories;

import com.edu.expedicao.domain.pedido.Pedido;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PedidoRepository extends JpaRepository<Pedido, Long> {
}
