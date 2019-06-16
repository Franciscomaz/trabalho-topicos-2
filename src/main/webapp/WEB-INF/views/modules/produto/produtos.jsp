<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<html>
<head>
    <title>Home Page</title>
    <%@ include file="../../common/header.jsp" %>
</head>
<body>
<section class="hero has-background-white-ter is-fullheight">
    <%@ include file="../../common/head.jsp" %>

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
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="produto" items="${produtos}">
                        <tr>
                            <td><c:out value="${produto.descricao}"/></td>
                            <td><c:out value="${produto.valor}"/></td>
                            <td><c:out value="${produto.dimensoes}"/></td>
                            <td><c:out value="${produto.referencia}"/></td>
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

    <%@ include file="../../common/footer.jsp" %>
</section>
</body>
</html>