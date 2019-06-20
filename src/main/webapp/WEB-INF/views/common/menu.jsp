<%@page  pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<p class="menu-label is-hidden-touch">Navegação</p>
<ul class="menu-list">
    <li>
        <a href="${pageContext.request.contextPath}/"
           class="${requestScope['javax.servlet.forward.request_uri'].equals("/") ? 'is-active' : ''}">
            <span class="icon is-small"><i class="fa fa-home"></i></span>
            <span style="padding-left: 5px">Home</span>
        </a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/revendas"
           class="${requestScope['javax.servlet.forward.request_uri'].contains("revendas") ? 'is-active' : ''}">
            <span class="icon is-small"><i class="fas fa-store-alt"></i></span>
            <span style="padding-left: 5px">Revendas</span>
        </a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/produtos"
           class="${requestScope['javax.servlet.forward.request_uri'].contains("produtos") ? 'is-active' : ''}">
            <span class="icon is-small"><i class="fas fa-boxes"></i></span>
            <span style="padding-left: 5px">Produtos</span>
        </a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/solicitacoes"
           class="${requestScope['javax.servlet.forward.request_uri'].contains("/solicitacoes") ? 'is-active' : ''}">
            <span class="icon is-small"><i class="fas fa-dolly-flatbed"></i></span>
            <span style="padding-left: 5px">Solicitações</span>
        </a>
    </li>
</ul>