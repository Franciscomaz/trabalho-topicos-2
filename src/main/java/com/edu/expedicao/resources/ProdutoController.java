package com.edu.expedicao.resources;

import com.edu.expedicao.application.produto.ProdutoService;
import com.edu.expedicao.domain.pedido.Produto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/produtos")
public class ProdutoController {

    private final ProdutoService produtoService;

    public ProdutoController(final ProdutoService produtoService) {
        this.produtoService = produtoService;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String buscarPeloId(@PathVariable Long id, final Model model) {
        return "modules/produto/produtos";
    }

    @RequestMapping(method = RequestMethod.GET)
    public String buscarComPaginacao(final Model model) {
        final Page<Produto> page = produtoService.buscarComPaginacao(Pageable.unpaged());
        model.addAttribute("produtos", page);
        return "modules/produto/produtos";
    }

    @RequestMapping(method = RequestMethod.POST)
    public Produto criar(@RequestBody final Produto produto) {
        return produtoService.criar(produto);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public Produto atualizar(@PathVariable Long id, @RequestBody final Produto produto) {
        final Produto old = produtoService.buscarPeloId(id);

        produto.setId(old.getId());
        produto.setDescricao(old.getDescricao());
        produto.setValor(old.getValor());
        produto.setDimensoes(old.getDimensoes());
        produto.setReferencia(old.getReferencia());

        return produtoService.atualizar(produto);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public Produto remover(@PathVariable("id") Long id) {
        return produtoService.remover(produtoService.buscarPeloId(id));
    }

}
