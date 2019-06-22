package com.edu.expedicao.application.revenda;

import com.edu.expedicao.domain.revenda.Revenda;
import com.edu.expedicao.infrastructure.repositories.RevendaRepostory;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RevendaService {

    private RevendaRepostory revendaRepository;

    public RevendaService(RevendaRepostory revendaRepository) {
        this.revendaRepository = revendaRepository;
    }

    public Revenda buscarPeloId(final Long id) {
        return this.revendaRepository.getOne(id);
    }

    public List<Revenda> buscarTodos() {
        return this.revendaRepository.findAll();
    }

    public Page<Revenda> buscarComPaginacao(String filter, final Pageable pageable) {
        final Revenda revendaFilter = new Revenda();
        revendaFilter.setCnpj(filter);
        revendaFilter.setNome(filter);

        final ExampleMatcher matcher = ExampleMatcher.matchingAny()
                .withStringMatcher(ExampleMatcher.StringMatcher.CONTAINING);

        return this.revendaRepository.findAll(Example.of(revendaFilter, matcher), pageable);
    }

    public Revenda criar(final Revenda revenda) {
        return this.revendaRepository.save(revenda);
    }

    public Revenda atualizar(final Revenda revenda) {
        return this.revendaRepository.save(revenda);
    }

    public Revenda remover(final Revenda revenda) {
        this.revendaRepository.delete(revenda);
        return revenda;
    }
}
