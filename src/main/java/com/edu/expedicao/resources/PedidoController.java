package com.edu.expedicao.resources;

import com.edu.expedicao.application.pedido.PedidoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pedidos")
public class PedidoController {

    private final PedidoService pedidoService;

    public PedidoController(final PedidoService pedidoService) {
        this.pedidoService = pedidoService;
    }

    @GetMapping
    public String getPedidos(final Model model) {
        return "modules/pedido/pedidos";
    }

}
