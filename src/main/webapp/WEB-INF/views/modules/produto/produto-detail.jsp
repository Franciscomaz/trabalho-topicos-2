<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<layout:extends name="/WEB-INF/views/common/template.jsp">
    <layout:put block="body">
        <%--@elvariable id="produto" type="com.edu.expedicao.domain.produto.Produto"--%>

        <div class="is-flex is-content-centered">
            <form:form class="card has-round-corners"
                       action="${produto.id == null ? '/produtos' : '/produtos/'.concat(produto.id)}"
                       modelAttribute="produto"
                       method="post"
                       style="min-width: 600px">
                <div class="card-header">
                    <p class="card-header-title">${produto.id == null ? 'Cadastrando produto' : 'Editando produto'}</p>
                </div>
                <div class="card-content">
                    <div class="collumns">
                        <div class="field">
                            <label class="label">Descrição</label>
                            <div class="control">
                                <form:input class="input" path="descricao" type="text" placeholder="Caixa"/>
                            </div>

                            <form:errors path="descricao" cssClass="help is-danger"/>
                        </div>

                        <div class="field">
                            <label class="label">Valor</label>

                            <div class="field has-addons">

                                <p class="control">
                                    <a class="button is-static">
                                        R$
                                    </a>
                                </p>

                                <div class="control has-icons-right is-expanded">
                                    <form:input class="input" path="valor" type="number" placeholder="R$ 20.00"/>

                                    <span class="icon is-small is-right">
                                        <i class="fa fa-money"></i>
                                    </span>
                                </div>

                            </div>

                            <form:errors path="valor" cssClass="help is-danger"/>
                        </div>

                        <div class="field">
                            <label class="label">Dimensões</label>
                            <div class="control">
                                <form:input class="input" path="dimensoes" type="text" placeholder="10x10 metros"/>
                            </div>

                            <form:errors path="dimensoes" cssClass="help is-danger"/>
                        </div>

                        <div class="field">
                            <label class="label">Referência</label>
                            <div class="control">
                                <form:textarea class="textarea" path="referencia" placeholder="Cor azul"/>
                            </div>

                            <form:errors path="referencia" cssClass="help is-danger"/>
                        </div>
                    </div>
                </div>
                <footer class="card-footer">
                    <div class="card-footer-item">
                        <button class="button is-text has-text-link">Salvar</button>
                    </div>
                    <div class="card-footer-item">
                        <button class="button is-text" type="button" onclick="sendTo('/produtos')">Voltar</button>
                    </div>
                </footer>
            </form:form>

        </div>
    </layout:put>
</layout:extends>