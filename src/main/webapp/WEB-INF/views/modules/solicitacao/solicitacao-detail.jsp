<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<layout:extends name="/WEB-INF/views/common/template.jsp">
    <layout:put block="body">

        <%--@elvariable id="solicitacao" type="com.edu.expedicao.application.solicitacao.NovaSolicitacaoCommand"--%>
        <div class="is-flex is-content-centered">
            <form:form class="card has-round-corners"
                       action="/solicitacoes"
                       modelAttribute="solicitacao"
                       method="post"
                       style="min-width: 600px">

                <div class="card-header">
                    <p class="card-header-title">Cadastrando solicitacão</p>
                </div>

                <div class="card-content">
                    <div class="field">
                        <label class="label" for="select-revendas">Revenda</label>
                        <div class="select is-fullwidth">
                            <form:select id="select-revendas" path="revendaId" itemValue="">
                                <form:options items="${revendas}" itemValue="id" itemLabel="nome"/>
                            </form:select>
                        </div>

                        <form:errors path="revendaId" cssClass="help is-danger"/>
                    </div>

                    <div class="field field-body">
                        <div class="field">
                            <label class="label">Produto</label>
                            <div class="select is-fullwidth">
                                <form:select id="select-produtos"
                                             path="pedido.produtos[0].produtoId"
                                             onchange="onChangeProduto()">
                                    <c:forEach var="produto" items="${produtos}">
                                        <option value="${produto.id}">${produto.descricao}</option>
                                    </c:forEach>
                                </form:select>
                            </div>

                            <form:errors path="pedido.produtos" cssClass="help is-danger"/>
                        </div>

                        <div class="field is-narrow">
                            <label class="label">Quantidade</label>
                            <div class="control">
                                <form:input cssClass="input" path="pedido.produtos[0].quantidade"
                                            type="number"/>
                            </div>

                            <form:errors path="pedido.produtos[0].quantidade" cssClass="help is-danger"/>
                        </div>

                    </div>

                    <div class="field">
                        <label class="label">Observação</label>
                        <div class="control">
                            <form:textarea class="textarea" path="observacao" placeholder="Cor azul"/>
                        </div>

                        <form:errors path="observacao" cssClass="help is-danger"/>
                    </div>

                </div>

                <footer class="card-footer">
                    <div class="card-footer-item">
                        <button class="button is-text has-text-link">Salvar</button>
                    </div>
                    <div class="card-footer-item">
                        <button class="button is-text" type="button" onclick="sendTo('/solicitacoes')">Voltar</button>
                    </div>
                </footer>

            </form:form>
        </div>
    </layout:put>
</layout:extends>