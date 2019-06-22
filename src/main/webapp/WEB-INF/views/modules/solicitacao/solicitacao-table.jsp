<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<c:choose>
    <c:when test="${!requestScope.solicitacoes.isEmpty()}">
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
            <c:forEach var="solicitacao" items="${requestScope.solicitacoes}">

                <tr>
                    <td class="has-ellipsis">${solicitacao.revenda.nome}</td>
                    <td class="has-ellipsis">${solicitacao.status.descricao}</td>
                    <td class="has-ellipsis">${solicitacao.dataHoraInicioFormatado}</td>
                    <td>
                        <a class="button is-small is-text"
                           onclick="sendTo('/solicitacoes/' + ${solicitacao.id} + '/details')">
                            <span class="icon is-small">
                                <i class="fas fa-eye"></i>
                            </span>
                        </a>
                    </td>
                </tr>

            </c:forEach>
            </tbody>
        </table>
    </c:when>
    <c:otherwise>
        <p class="has-no-content has-text-centered">Nenhuma solicitação encontrada.</p>
    </c:otherwise>
</c:choose>