<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                        <div class="heading">Solicitações em aberto</div>
                        <div class="title">${quantidadeSolicitacoesEmAberto}</div>
                    </div>
                </div>
                <div class="column is-one-third">
                    <div class="box">
                        <div class="title is-6">Últimas solicitações</div>

                        <c:forEach var="solicitacao" items="${ultimasSolicitacoes}">
                            <div class="level">
                                <div class="level-item-left">
                                    <a class="title is-6 is-info is-marginless has-text-link"
                                       href="/solicitacoes/${solicitacao.id}/visualizar">
                                            ${solicitacao.revenda.nome}
                                    </a>
                                    <div class="heading">${solicitacao.dataHoraInicioFormatado}</div>
                                </div>
                                <div class="level-item-left">
                                    <div class="title is-6 is-info is-marginless">
                                        <fmt:formatNumber value="${solicitacao.valorTotal}" type="currency"
                                                          currencySymbol="R$"/>
                                    </div>
                                    <div class="tag ${solicitacao.status.cor} has-small-font is-pulled-right has-text-white"
                                         style="margin-top: 5px">${solicitacao.status.descricao}</div>
                                </div>
                            </div>
                        </c:forEach>
                        <a class="button is-info is-small is-outlined" href="/solicitacoes">Visualizar todas</a>
                    </div>
                </div>
            </div>
        </div>
    </layout:put>
</layout:extends>