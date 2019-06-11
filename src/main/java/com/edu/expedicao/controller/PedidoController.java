package com.edu.expedicao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pedidos")
public class PedidoController {

    @GetMapping
    public String getView(final Model model) {
        model.addAttribute("msg", "Hello there, This message has been injected from the controller method");
        return "modules/home/home";
    }

}
