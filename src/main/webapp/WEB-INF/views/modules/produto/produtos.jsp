<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<layout:extends name="/WEB-INF/views/common/template.jsp">
    <layout:put block="body">
        <div class="hero-body is-content-centered">
            <div class="panel has-round-corners has-background-white-bis">
                <p class="panel-heading">
                    Produtos
                </p>
                <div class="panel-block">
                    <table class="table is-bordered pricing__table">
                        <thead>
                        <tr>
                            <th>Descrição</th>
                            <th>Valor</th>
                            <th>Dimensões</th>
                            <th>Referência</th>
                            <th>Ações</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="produto" items="${produtos}">
                            <tr>
                                <td class="has-ellipsis"><c:out value="${produto.descricao}"/></td>
                                <td class="has-ellipsis"><c:out value="${produto.valor}"/></td>
                                <td class="has-ellipsis"><c:out value="${produto.dimensoes}"/></td>
                                <td class="has-ellipsis"><c:out value="${produto.referencia}"/></td>
                                <td>
                                    <a class="button is-small is-text"
                                       onclick="sendTo('/produtos/' + ${produto.id} + '/details')">
                                    <span class="icon is-small">
                                        <i class="fa fa-pencil-square-o"></i>
                                    </span>
                                    </a>
                                    <a class="button is-small is-text" onclick="deletarProduto(${produto.id})">
                                    <span class="icon is-small">
                                      <i class="fa fa-trash"></i>
                                    </span>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="panel-block">
                    <button class="button" onclick="sendTo('produtos/details')">
                        Novo
                    </button>
                </div>
            </div>
        </div>
    </layout:put>
</layout:extends>