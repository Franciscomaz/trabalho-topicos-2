<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<div class="container">
    <ul>
        <li class="${pageContext.request.servletPath.contains("home.jsp") ? 'is-active' : ''}">
            <a href="/">Home</a>
        </li>
        <li class="${pageContext.request.servletPath.contains("pedidos.jsp") ? 'is-active' : ''}">
            <a href="/pedidos">Pedidos</a>
        </li>
        <li class="${pageContext.request.servletPath.contains("solicitacoes.jsp") ? 'is-active' : ''}">
            <a href="/solicitacoes">Solicitações</a>
        </li>
        <li class="${pageContext.request.servletPath.contains("produtos.jsp") ? 'is-active' : ''}">
            <a href="/produtos">Produtos</a>
        </li>
        <li class="${pageContext.request.servletPath.contains("revendas.jsp") ? 'is-active' : ''}">
            <a href="/revendas">Revendas</a>
        </li>
    </ul>
</div>