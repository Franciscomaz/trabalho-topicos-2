<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<layout:extends name="/WEB-INF/views/common/template.jsp">
    <layout:put block="body">
        <div class="is-flex is-content-centered">
            <div class="card">

                <div class="card-header">
                    <p class="card-header-title">Produtos</p>
                    <div class="card-header-icon">
                        <button class="button is-text" onclick="sendTo('produtos/details')">
                            <span class="icon has-text-link">
                              <i class="fas fa-plus"></i>
                            </span>
                        </button>
                    </div>
                </div>

                <div class="card-content">

                    <c:choose>
                        <c:when test="${!produtos.isEmpty()}">
                            <table class="table is-bordered">

                                <thead>
                                <tr>
                                    <th>Descri��o</th>
                                    <th>Valor</th>
                                    <th>Dimens�es</th>
                                    <th>Refer�ncia</th>
                                    <th>A��es</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach var="produto" items="${produtos}">

                                    <tr>
                                        <td class="has-ellipsis"><c:out value="${produto.descricao}"/></td>
                                        <td class="has-ellipsis" align="right"><fmt:formatNumber
                                                value="${produto.valor}" type="currency" currencySymbol="R$"/></td>
                                        <td class="has-ellipsis"><c:out value="${produto.dimensoes}"/></td>
                                        <td class="has-ellipsis"><c:out value="${produto.referencia}"/></td>
                                        <td>
                                            <a class="button is-small is-text"
                                               onclick="sendTo('/produtos/' + ${produto.id} + '/details')">
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

                                    <!-- Modal de confirma��o da remo��o do produto -->
                                    <div id="modal-confirmar-remover" class="modal">
                                        <div class="modal-background"></div>
                                        <div class="modal-card animation-content">

                                            <header class="modal-card-head">
                                                <p class="modal-card-title">Removendo produto</p></header>

                                            <section class="modal-card-body">
                                                <p>Voc� tem certeza que deseja <b>remover</b> o produto
                                                    <b>${produto.descricao}</b> ?</p>
                                                <p class="is-muted">Essa a��o n�o pode ser desfeita.</p>
                                            </section>

                                            <footer class="modal-card-foot">

                                                <button class="button">
                                                    Cancelar
                                                </button>

                                                <button class="button is-danger"
                                                        onclick="deletarProduto(${produto.id})">
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
                            <p class="has-no-content">Nenhum produto encontrado.</p>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
        </div>
    </layout:put>
</layout:extends>