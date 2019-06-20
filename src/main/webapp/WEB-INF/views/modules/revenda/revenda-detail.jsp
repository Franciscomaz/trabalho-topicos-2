<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<layout:extends name="/WEB-INF/views/common/template.jsp">
    <layout:put block="body">
        <%--@elvariable id="revenda" type="com.edu.expedicao.domain.revenda.Revenda"--%>

        <div class="is-flex is-content-centered">
            <form:form class="card has-round-corners"
                       action="${revenda.id == null ? '/revendas' : '/revendas/'.concat(revenda.id)}"
                       modelAttribute="revenda"
                       method="post"
                       style="min-width: 600px">
                <div class="card-header">
                    <p class="card-header-title">${revenda.id == null ? 'Cadastrando revenda' : 'Editando revenda'}</p>
                </div>
                <div class="card-content">
                    <div class="collumns">
                        <div class="field">
                            <label class="label">CNPJ</label>
                            <div class="control">
                                <form:input class="input" path="cnpj" type="text" placeholder="CNPJ"/>
                            </div>

                            <form:errors path="cnpj" cssClass="help is-danger"/>
                        </div>
                        <div class="field">
                            <label class="label">Nome</label>
                            <div class="control">
                                <form:input class="input" path="nome" type="text" placeholder="Nome"/>
                            </div>

                            <form:errors path="nome" cssClass="help is-danger"/>
                        </div>
                        <div class="field">
                            <label class="label">Endereço</label>
                            <div class="control">
                                <form:input class="input" path="endereco" type="text" placeholder="Endereço"/>
                            </div>

                            <form:errors path="nome" cssClass="help is-danger"/>
                        </div>


                </div>
                <footer class="card-footer">
                    <div class="card-footer-item">
                        <button class="button is-text has-text-link">Salvar</button>
                    </div>
                    <div class="card-footer-item">
                        <button class="button is-text" type="button" onclick="sendTo('/revendas')">Voltar</button>
                    </div>
                </footer>
            </form:form>

        </div>
    </layout:put>
</layout:extends>