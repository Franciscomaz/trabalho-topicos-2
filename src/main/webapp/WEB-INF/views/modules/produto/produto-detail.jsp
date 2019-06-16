<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

        <%--@elvariable id="produto" type="com.edu.expedicao.domain.pedido.Produto"--%>
        <form:form class="panel has-round-corners has-background-white-bis"
                   action="${produto.id == null ? '/produtos' : '/produtos/'.concat(produto.id)}"
                   modelAttribute="produto"
                   method="post">
            <div class="panel-heading">
                Cadastrando produto
            </div>
            <div class="panel-block">
                <div class="collumns" style="width: 500px">
                    <div class="field">
                        <label class="label">Descrição</label>
                        <div class="control">
                            <form:input class="input" path="descricao" type="text" placeholder="Caixa"/>
                        </div>
                    </div>

                    <div class="field">
                        <label class="label">Valor</label>
                        <div class="control has-icons-left">
                            <form:input class="input" path="valor" type="number" placeholder="R$ 20.00"/>

                            <span class="icon is-small is-left">
                                <i class="fa fa-money"></i>
                            </span>
                        </div>
                    </div>

                    <div class="field">
                        <label class="label">Dimensões</label>
                        <div class="control">
                            <form:input class="input" path="dimensoes" type="text" placeholder="10x10 metros"/>
                        </div>
                    </div>

                    <div class="field">
                        <label class="label">Referência</label>
                        <div class="control">
                            <form:textarea class="textarea" path="referencia" placeholder="Cor azul"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-block">
                <button class="button">
                    Salvar
                </button>
            </div>
        </form:form>
    </div>

    <%@ include file="../../common/footer.jsp" %>
</section>
</body>
</html>