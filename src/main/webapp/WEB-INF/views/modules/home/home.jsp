<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<layout:extends name="/WEB-INF/views/common/template.jsp">
    <layout:put block="body">
        <div class="container">
            <div class="columns is-multiline">
                <div class="column is-4">
                    <div class="box">
                        <div class="heading">Total de revendas</div>
                        <div class="title">${totalRevendas}</div>
                    </div>
                </div>
                <div class="column is-4">
                    <div class="box">
                        <div class="heading">Total de produtos</div>
                        <div class="title">${totalProdutos}</div>
                    </div>
                </div>
                <div class="column is-4">
                    <div class="box">
                        <div class="heading">Quantidade de solicitações em aberto</div>
                        <div class="title">${quantidadeSolicitacoesEmAberto}</div>
                    </div>
                </div>
                <div class="column is-half">
                    <div class="card">

                        <div class="card-header">
                            <div class="card-header-title">Últimas solicitações</div>
                        </div>

                        <div class="card-content">
                            <c:set var="solicitacoes" value="${ultimasSolicitacoes}" scope="request"/>
                            <jsp:include page="../solicitacao/solicitacao-table.jsp"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </layout:put>
</layout:extends>