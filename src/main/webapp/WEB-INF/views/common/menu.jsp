<%@page  pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<p class="menu-label is-hidden-touch">Navegação</p>
<ul class="menu-list">
    <li>
        <a href="${pageContext.request.contextPath}/"
           class="${requestScope['javax.servlet.forward.request_uri'].equals("/") ? 'is-active' : ''}">
            <span class="icon"><i class="fa fa-home"></i></span> Home
        </a>
    </li>
    <li>
        <a>
            <span class="icon"><i class="fa fa-box"></i></span> Produtos
        </a>

        <ul>
            <li>
                <a href="${pageContext.request.contextPath}/produtos"
                   class="${requestScope['javax.servlet.forward.request_uri'].equals("/produtos") ? 'is-active' : ''}">
                    <span class="icon is-small"><i class="fa fa-list"></i></span> Listagem
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/produtos/details"
                   class="${requestScope['javax.servlet.forward.request_uri'].equals("/produtos/details") ? 'is-active' : ''}">
                    <span class="icon is-small"><i class="fa fa-edit"></i></span> Cadastro
                </a>
            </li>
        </ul>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/solicitacoes"
           class="${requestScope['javax.servlet.forward.request_uri'].contains("/solicitacoes") ? 'is-active' : ''}">
            <span class="icon is-small"><i class="fa fa-list"></i></span> Solicitações
        </a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/revendas"
              class="${requestScope['javax.servlet.forward.request_uri'].equals("/revendas") ? 'is-active' : ''}">
            <span class="icon is-small"><i class="fa fa-edit"></i></span> Revenda
       </a>
    </li>
</ul>