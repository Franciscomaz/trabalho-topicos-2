package com.edu.expedicao.resources;

import com.edu.expedicao.application.produto.ProdutoService;
import com.edu.expedicao.domain.pedido.Produto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
@RequestMapping("/produtos")
public class ProdutoController {

    private final ProdutoService produtoService;

    public ProdutoController(final ProdutoService produtoService) {
        this.produtoService = produtoService;
    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView getPaginaDeListagem(final Model model) {
        final Page<Produto> page = produtoService.buscarComPaginacao(Pageable.unpaged());
        model.addAttribute("produtos", page.getContent());
        return new ModelAndView("/modules/produto/produtos", model.asMap());
    }

    @RequestMapping(value = "/details", method = RequestMethod.GET)
    public ModelAndView getPaginaDeCadastro(final Model model) {
        model.addAttribute("produto", new Produto());
        return new ModelAndView("/modules/produto/produto-detail", model.asMap());
    }

    @RequestMapping(value = "/{id}/details", method = RequestMethod.GET)
    public ModelAndView getPaginaDeEdicao(@PathVariable Long id, final Model model) {
        model.addAttribute("produto", produtoService.buscarPeloId(id));
        return new ModelAndView("/modules/produto/produto-detail", model.asMap());
    }

    @RequestMapping(method = RequestMethod.POST)
    public String criar(@Valid @ModelAttribute("produto") final Produto produto,
                        final BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "/modules/produto/produto-detail";
        }

        produtoService.criar(produto);

        return "redirect:/produtos/details";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.POST)
    public String atualizar(@PathVariable final Long id,
                            @Valid @ModelAttribute("produto") final Produto produto,
                            final BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "/modules/produto/produto-detail";
        }

        final Produto old = produtoService.buscarPeloId(id);

        old.setDescricao(produto.getDescricao());
        old.setValor(produto.getValor());
        old.setDimensoes(produto.getDimensoes());
        old.setReferencia(produto.getReferencia());

        produtoService.atualizar(produto);

        return "redirect:/produtos/" + id + "/details";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    Produto remover(@PathVariable("id") Long id) {
        return produtoService.remover(produtoService.buscarPeloId(id));
    }

}
