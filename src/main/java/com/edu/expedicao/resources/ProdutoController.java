package com.edu.expedicao.resources;

import com.edu.expedicao.application.produto.ProdutoService;
import com.edu.expedicao.domain.pedido.Produto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
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

    @RequestMapping(method = RequestMethod.GET)
    public String getProdutos(final Model model) {
        return "modules/produto/produtos";
    }

    @RequestMapping(method = RequestMethod.POST)
    public Produto criarProduto(@RequestBody final Produto produto) {
        return new Produto();
    }

}
