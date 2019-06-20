package com.edu.expedicao.infrastructure.repositories;

import com.edu.expedicao.domain.revenda.Revenda;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RevendaRepostory extends JpaRepository<Revenda, Long> {
}