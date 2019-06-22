<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<layout:extends name="/WEB-INF/views/common/template.jsp">
    <layout:put block="body">
        <div class="is-flex is-content-centered">
            <div class="card">

                <div class="card-header">
                    <div class="card-header-title">Solicitações</div>

                    <div class="card-header-icon">
                        <form class="control has-icons-left">
                            <input id="input-search-solicitacao"
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
                        <button class="button is-text" onclick="sendTo('solicitacoes/details')">
                            <span class="icon has-text-link">
                              <i class="fas fa-plus"></i>
                            </span>
                        </button>
                    </div>
                </div>

                <div class="card-content">

                    <c:choose>
                        <c:when test="${!solicitacoes.isEmpty()}">
                            <table class="table is-bordered">

                                <thead>
                                <tr>
                                    <th>Revenda</th>
                                    <th>Status</th>
                                    <th>Data de início</th>
                                    <th></th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach var="solicitacao" items="${solicitacoes}">

                                    <tr>
                                        <td class="has-ellipsis"><c:out value="${solicitacao.revenda.nome}"/></td>
                                        <td class="has-ellipsis"><c:out value="${solicitacao.status}"/></td>
                                        <td class="has-ellipsis"><c:out value="${solicitacao.dataHoraInicio}"/></td>
                                        <td>
                                            <a class="button is-small is-text"
                                               onclick="sendTo('/solicitacoes/' + ${solicitacao.id} + '/details')">
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

                                    <!-- Modal de confirmação da remoção do solicitacao -->
                                    <div id="modal-confirmar-remover" class="modal">
                                        <div class="modal-background"></div>
                                        <div class="modal-card animation-content">

                                            <header class="modal-card-head">
                                                <p class="modal-card-title">Removendo solicitação</p></header>

                                            <section class="modal-card-body">
                                                <p>Você tem certeza que deseja <b>remover</b> a solicitação ?</p>
                                                <p class="is-muted">Essa ação não pode ser desfeita.</p>
                                            </section>

                                            <footer class="modal-card-foot">

                                                <button class="button">
                                                    Cancelar
                                                </button>

                                                <button class="button is-danger"
                                                        onclick="removeTableRow(0)">
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
                            <p class="has-no-content has-text-centered">Nenhuma solicitação encontrada.</p>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
        </div>
    </layout:put>
</layout:extends>