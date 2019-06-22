<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<layout:extends name="/WEB-INF/views/common/template.jsp">
    <layout:put block="body">
        <div class="is-flex is-content-centered">
            <div class="card">

                <div class="card-header">
                    <p class="card-header-title">Revendas</p>

                    <div class="card-header-icon">
                        <form class="control has-icons-left">
                            <input id="input-search-revenda"
                                   class="input is-small"
                                   name="filter"
                                   type="text"
                                   placeholder="search">

                            <span class="icon is-small is-left">
                                <i class="fas fa-search" aria-hidden="true"></i>
                            </span>
                        </form>
                    </div>

                    <div class="card-header-icon">
                        <button class="button is-text" onclick="sendTo('revendas/details')">
                            <span class="icon has-text-link">
                              <i class="fas fa-plus"></i>
                            </span>
                        </button>
                    </div>
                </div>

                <div class="card-content">

                    <c:choose>
                        <c:when test="${!revendas.isEmpty()}">
                            <table class="table is-bordered">

                                <thead>
                                <tr>
                                    <th>Nome</th>
                                    <th>CNPJ</th>
                                    <th>Endereco</th>
                                    <th></th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach var="revenda" items="${revendas}">

                                    <tr>
                                        <td class="has-ellipsis"><c:out value="${revenda.nome}"/></td>
                                        <td class="has-ellipsis" align="right">
                                            <c:out value="${revenda.cnpj}"/>
                                        </td>
                                        <td class="has-ellipsis"><c:out value="${revenda.endereco}"/></td>
                                        <td>
                                            <a class="button is-small is-text"
                                               onclick="sendTo('/revendas/' + ${revenda.id} + '/details')">
                                                <span class="icon is-small">
                                                    <i class="fa fa-edit"></i>
                                                </span>
                                            </a>

                                            <a class="button modal-button is-small is-text"
                                               data-target="modal-confirmar-remover"
                                               aria-haspopup="true">
                                                <span class="icon is-small">
                                                  <i class="fa fa-trash"></i>
                                                </span>
                                            </a>
                                        </td>
                                    </tr>

                                    <!-- Modal de confirmação da remoção de revenda -->
                                    <div id="modal-confirmar-remover" class="modal">
                                        <div class="modal-background"></div>
                                        <div class="modal-card animation-content">

                                            <header class="modal-card-head">
                                                <p class="modal-card-title">Removendo revenda</p></header>

                                            <section class="modal-card-body">
                                                <p>Você tem certeza que deseja <b>remover</b> a revenda
                                                    <b>${revenda.nome}</b> ?</p>
                                                <p class="is-muted">Essa ação não pode ser desfeita.</p>
                                            </section>

                                            <footer class="modal-card-foot">

                                                <button class="button">
                                                    Cancelar
                                                </button>

                                                <button class="button is-danger"
                                                        onclick="deletarRevenda(${revenda.id})">
                                                    Remover
                                                </button>

                                            </footer>
                                        </div>
                                    </div>

                                </c:forEach>
                                </tbody>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <p class="has-no-content has-text-centered">Nenhuma revenda encontrada.</p>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
        </div>
    </layout:put>
</layout:extends>