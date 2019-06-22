<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<c:choose>
    <c:when test="${!requestScope.produtos.isEmpty()}">
        <table class="table is-bordered">

            <thead>
            <tr>
                <th>Descrição</th>
                <th>Valor</th>
                <th>Dimensões</th>
                <th>Referência</th>
                <th></th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="produto" items="${requestScope.produtos}">
                <tr>
                    <td class="has-ellipsis">${produto.descricao}</td>
                    <td class="has-ellipsis" align="right">
                        <fmt:formatNumber value="${produto.valor}" type="currency" currencySymbol="R$"/>
                    </td>
                    <td class="has-ellipsis">${produto.dimensoes}</td>
                    <td class="has-ellipsis"><${produto.referencia}</td>
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

                <!-- Modal de confirmação da remoção do produto -->
                <div id="modal-confirmar-remover" class="modal">
                    <div class="modal-background"></div>
                    <div class="modal-card animation-content">

                        <header class="modal-card-head">
                            <p class="modal-card-title">Removendo produto</p></header>

                        <section class="modal-card-body">
                            <p>Você tem certeza que deseja <b>remover</b> o produto
                                <b>${produto.descricao}</b> ?</p>
                            <p class="is-muted">Essa ação não pode ser desfeita.</p>
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
        <p class="has-no-content has-text-centered">Nenhum produto encontrado.</p>
    </c:otherwise>
</c:choose>