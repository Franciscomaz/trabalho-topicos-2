<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<layout:extends name="/WEB-INF/views/common/template.jsp">
    <layout:put block="body">

        <%--@elvariable id="solicitacao" type="com.edu.expedicao.domain.solicitacao.Produto"--%>
        <div class="is-flex is-content-centered">
            <form:form class="card has-round-corners"
                       action="${solicitacao.id == null ? '/solicitacoes' : '/solicitacoes/'.concat(solicitacao.id)}"
                       modelAttribute="solicitacao"
                       method="post"
                       style="min-width: 600px">
                <div class="card-header">
                    <p class="card-header-title">${solicitacao.id == null ? 'Cadastrando solicitacão' : 'Editando solicitacão'}</p>
                </div>
                <div class="card-content">
                    <div class="collumns">
                        <div class="field">
                            <label class="label">Descrição</label>
                            <div class="control">
                                <form:input class="input" path="revenda" type="text" placeholder="Caixa"/>
                            </div>

                            <form:errors path="revenda" cssClass="help is-danger"/>
                        </div>

                        <div class="field">
                            <label class="label">Pedido</label>
                            <div class="control">
                                <form:input class="input" path="pedido" type="text" placeholder="10x10 metros"/>
                            </div>

                            <form:errors path="pedido" cssClass="help is-danger"/>
                        </div>

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