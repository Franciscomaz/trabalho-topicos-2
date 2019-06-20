package com.edu.expedicao.resources;

import com.edu.expedicao.application.revenda.RevendaService;
import com.edu.expedicao.domain.revenda.Revenda;
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
@RequestMapping("/revendas")
public class RevendaController {


    private final RevendaService revendaService;

    public RevendaController(final RevendaService revendaService) {
        this.revendaService = revendaService;
    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView getPaginaDeListagem(final Model model) {
        final Page<Revenda> page = revendaService.buscarComPaginacao(Pageable.unpaged());
        model.addAttribute("revendas", page.getContent());
        return new ModelAndView("/modules/revenda/revenda", model.asMap());
    }

    @RequestMapping(value = "/details", method = RequestMethod.GET)
    public ModelAndView getPaginaDeCadastro(final Model model) {
        model.addAttribute("revenda", new Revenda());
        return new ModelAndView("/modules/revenda/revenda-detail", model.asMap());
    }

    @RequestMapping(value = "/{id}/details", method = RequestMethod.GET)
    public ModelAndView getPaginaDeEdicao(@PathVariable Long id, final Model model) {
        model.addAttribute("revenda", revendaService.buscarPeloId(id));
        return new ModelAndView("/modules/revenda/revenda-detail", model.asMap());
    }

    @RequestMapping(method = RequestMethod.POST)
    public String criar(@Valid @ModelAttribute("revenda") final Revenda revenda,
                        final BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "/modules/revenda/revenda-detail";
        }

        revendaService.criar(revenda);

        return "redirect:/revendas/details";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.POST)
    public String atualizar(@PathVariable final Long id,
                            @Valid @ModelAttribute("revenda") final Revenda revenda,
                            final BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "/modules/revenda/revenda-detail";
        }

        final Revenda old = revendaService.buscarPeloId(id);

        old.setCnpj(revenda.getCnpj());
        old.setNome(revenda.getNome());
        old.setEndereco(revenda.getEndereco());


        revendaService.atualizar(revenda);

        return "redirect:/revenda/" + id + "/details";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    Revenda remover(@PathVariable("id") Long id) {
        return revendaService.remover(revendaService.buscarPeloId(id));
    }
}
