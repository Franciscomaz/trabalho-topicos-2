package com.edu.expedicao.resources;

import com.edu.expedicao.application.produto.ProdutoService;
import com.edu.expedicao.application.revenda.RevendaService;
import com.edu.expedicao.application.solicitacao.AlterarSolicitacaoCommand;
import com.edu.expedicao.application.solicitacao.NovaSolicitacaoCommand;
import com.edu.expedicao.application.solicitacao.SolicitacaoService;
import com.edu.expedicao.domain.solicitacao.Solicitacao;
import com.edu.expedicao.domain.solicitacao.SolicitacaoStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.EnumSet;

@Controller
@RequestMapping("/solicitacoes")
public class SolicitacaoController {

    private final RevendaService revendaService;
    private final ProdutoService produtoService;
    private final SolicitacaoService solicitacaoService;

    public SolicitacaoController(final RevendaService revendaService,
                                 final ProdutoService produtoService,
                                 final SolicitacaoService solicitacaoService) {
        this.revendaService = revendaService;
        this.produtoService = produtoService;
        this.solicitacaoService = solicitacaoService;
    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView getPaginaDeListagem(final Model model, @RequestParam(defaultValue = "") final String filter) {
        final Page<Solicitacao> page = solicitacaoService.buscarComPaginacao(filter, Pageable.unpaged());
        model.addAttribute("solicitacoes", page.getContent());
        return new ModelAndView("/modules/solicitacao/solicitacoes", model.asMap());
    }

    @RequestMapping(value = "/details", method = RequestMethod.GET)
    public ModelAndView getPaginaDeCadastro(final Model model) {
        model.addAttribute("solicitacao", new NovaSolicitacaoCommand());
        model.addAttribute("revendas", revendaService.buscarTodos());
        model.addAttribute("produtos", produtoService.buscarTodos());
        return new ModelAndView("/modules/solicitacao/solicitacao-detail", model.asMap());
    }

    @RequestMapping(value = "/{id}/visualizar", method = RequestMethod.GET)
    public ModelAndView getPaginaDeVisualizacao(@PathVariable Long id, final Model model) {
        final Solicitacao solicitacao = solicitacaoService.buscarPeloId(id);

        model.addAttribute("solicitacao", solicitacao);
        model.addAttribute("statuses", EnumSet.allOf(SolicitacaoStatus.class));
        model.addAttribute("alteracaoSolicitacao", new AlterarSolicitacaoCommand(solicitacao.getStatus().getCodigo(),
                solicitacao.getObservacao()));

        return new ModelAndView("/modules/solicitacao/solicitacao-visualizacao", model.asMap());
    }

    @ResponseBody
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Solicitacao findById(@PathVariable final Long id) {
        return solicitacaoService.buscarPeloId(id);
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView criar(@Valid @ModelAttribute("solicitacao") final NovaSolicitacaoCommand novaSolicitacao,
                              final BindingResult bindingResult,
                              final Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("revendas", revendaService.buscarTodos());
            model.addAttribute("produtos", produtoService.buscarTodos());
            return new ModelAndView("/modules/solicitacao/solicitacao-detail", model.asMap());
        }

        solicitacaoService.criar(novaSolicitacao);

        return new ModelAndView("redirect:/solicitacoes/details");
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.POST)
    public ModelAndView atualizar(@PathVariable final Long id,
                                  @Valid @ModelAttribute("alteracaoSolicitacao") final AlterarSolicitacaoCommand alterarSolicitacaoCommand,
                                  final BindingResult bindingResult,
                                  final Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("solicitacao", solicitacaoService.buscarPeloId(id));
            model.addAttribute("statuses", EnumSet.allOf(SolicitacaoStatus.class));
            return new ModelAndView("/modules/solicitacao/solicitacao-visualizacao", model.asMap());
        }

        solicitacaoService.alterarSolicitacao(solicitacaoService.buscarPeloId(id), alterarSolicitacaoCommand);

        return new ModelAndView("redirect:/solicitacoes/" + id + "/visualizar");
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    Solicitacao remover(@PathVariable("id") Long id) {
        return solicitacaoService.remover(solicitacaoService.buscarPeloId(id));
    }

}
