<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<div class="container">
    <ul>
        <li class="${requestScope['javax.servlet.forward.request_uri'].equals("/") ? 'is-active' : ''}">
            <a href="${pageContext.request.contextPath}/">Home</a>
        </li>
        <li class="${requestScope['javax.servlet.forward.request_uri'].contains("pedidos") ? 'is-active' : ''}">
            <a href="${pageContext.request.contextPath}/pedidos">Pedidos</a>
        </li>
        <li class="${requestScope['javax.servlet.forward.request_uri'].contains("solicitacoes") ? 'is-active' : ''}">
            <a href="${pageContext.request.contextPath}/solicitacoes">Solicitações</a>
        </li>
        <li class="${requestScope['javax.servlet.forward.request_uri'].contains("produtos") ? 'is-active' : ''}">
            <a href="${pageContext.request.contextPath}/produtos">Produtos</a>
        </li>
        <li class="${requestScope['javax.servlet.forward.request_uri'].contains("revendas") ? 'is-active' : ''}">
            <a href="${pageContext.request.contextPath}/revendas">Revendas</a>
        </li>
    </ul>
</div>