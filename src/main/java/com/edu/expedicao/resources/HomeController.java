package com.edu.expedicao.resources;

import com.edu.expedicao.application.produto.ProdutoService;
import com.edu.expedicao.application.revenda.RevendaService;
import com.edu.expedicao.application.solicitacao.SolicitacaoService;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class HomeController {

    private RevendaService revendaService;
    private ProdutoService produtoService;
    private SolicitacaoService solicitacaoService;

    public HomeController(RevendaService revendaService, ProdutoService produtoService, SolicitacaoService solicitacaoService) {
        this.revendaService = revendaService;
        this.produtoService = produtoService;
        this.solicitacaoService = solicitacaoService;
    }

    @GetMapping
    public ModelAndView getPaginaInicial(final Model model) {
        model.addAttribute("totalRevendas", revendaService.totalDeRevendas());
        model.addAttribute("totalProdutos", produtoService.totalDeProdutos());
        model.addAttribute("quantidadeSolicitacoesEmAberto", solicitacaoService.quantidadeSolicitacoesEmAberto());

        final PageRequest pageRequest = PageRequest.of(0, 5, Sort.by(Sort.Order.desc("dataHoraInicio")));
        model.addAttribute("ultimasSolicitacoes", solicitacaoService.buscarComPaginacao("", pageRequest).getContent());

        return new ModelAndView("modules/home/home", model.asMap());
    }

}
