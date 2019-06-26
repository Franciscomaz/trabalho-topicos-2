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
                        <div class="field field-body is-horizontal">
                            <div class="field">
                                <label class="label">Cidade</label>
                                <div class="control">
                                    <form:input class="input" path="endereco.cidade" type="text" placeholder="Cidade"/>
                                </div>

                                <form:errors path="endereco.cidade" cssClass="help is-danger"/>
                            </div>
                            <div class="field">
                                <label class="label">Estado</label>
                                <div class="control">
                                    <form:input class="input" path="endereco.estado" type="text" placeholder="Estado"/>
                                </div>

                                <form:errors path="endereco.estado" cssClass="help is-danger"/>
                            </div>
                        </div>
                        <div class="field field-body">
                            <div class="field">
                                <label class="label">Bairro</label>
                                <div class="control">
                                    <form:input class="input" path="endereco.bairro" type="text" placeholder="Bairro"/>
                                </div>

                                <form:errors path="endereco.bairro" cssClass="help is-danger"/>
                            </div>
                            <div class="field">
                                <label class="label">Cep</label>
                                <div class="control">
                                    <form:input class="input" path="endereco.cep" type="text" placeholder="CEP"/>
                                </div>

                                <form:errors path="endereco.cep" cssClass="help is-danger"/>
                            </div>
                        </div>
                        <div class="field field-body">
                            <div class="field">
                                <label class="label">Logradouro</label>
                                <div class="control">
                                    <form:input class="input" path="endereco.logradouro" type="text"
                                                placeholder="Logradouro"/>
                                </div>

                                <form:errors path="endereco.logradouro" cssClass="help is-danger"/>
                            </div>
                            <div class="field">
                                <label class="label">Complemento</label>
                                <div class="control">
                                    <form:input class="input" path="endereco.complemento" type="text"
                                                placeholder="Complemento"/>
                                </div>

                                <form:errors path="endereco.complemento" cssClass="help is-danger"/>
                            </div>
                        </div>
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