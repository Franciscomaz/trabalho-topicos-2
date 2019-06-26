<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="layout" uri="http://kwonnam.pe.kr/jsp/template-inheritance" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<layout:extends name="/WEB-INF/views/common/template.jsp">
    <layout:put block="body">

        <%--@elvariable id="solicitacao" type="com.edu.expedicao.domain.solicitacao.Solicitacao"--%>
        <div class="container">
            <div class="columns is-multiline">
                <div class="column is-4">
                    <div class="box">
                        <div class="heading">Valor total (R$)</div>
                        <div class="title">
                            <fmt:formatNumber value="${solicitacao.valorTotal}" type="currency" currencySymbol=""/>
                        </div>
                    </div>
                </div>
                <div class="column is-4">
                    <div class="box">
                        <div class="heading">Dias decorridos</div>
                        <div class="title">${solicitacao.tempoDecorrido().dias}</div>
                    </div>
                </div>
                <div class="column is-4">
                    <div class="box">
                        <div class="heading">Total de produtos</div>
                        <div class="title">${solicitacao.pedido.quantidadeDeProdutos()}</div>
                    </div>
                </div>
                <div class="column is-4">
                    <div class="box">
                        <div class="title is-6">Revenda</div>
                        <div class="columns is-multiline">
                            <div class="column is-12">
                                <div class="level">
                                    <div class="level-item-left">
                                        <div>
                                            <div class="heading is-6">Nome</div>
                                            <div class="title is-6">${solicitacao.revenda.nome}</div>
                                        </div>
                                    </div>
                                    <div class="level-item-right">
                                        <div>
                                            <div class="heading is-6">CNPJ</div>
                                            <div class="title is-6">${solicitacao.revenda.cnpjFormatado}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="column is-12">
                                <div class="level">
                                    <div>
                                        <div class="heading">Endereço</div>
                                        <div class="title is-7" title="${solicitacao.revenda.endereco.formatar()}">
                                                ${solicitacao.revenda.endereco.formatar()}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="column is-8">
                    <div class="box">
                        <div class="title is-6">Pedido</div>
                        <div class="level">
                            <div class="level-item-left">
                                <div>
                                    <div class="heading is-6">Produto</div>
                                    <div class="title is-6">${solicitacao.pedido.produtos[0].produto.descricao}</div>
                                </div>
                            </div>
                            <div class="level-item">
                                <div>
                                    <div class="heading is-6">Unitário (R$)</div>
                                    <div class="title is-6">
                                        <fmt:formatNumber value="${solicitacao.pedido.produtos[0].valorUnitario()}"
                                                          type="currency" currencySymbol=""/>
                                    </div>
                                </div>
                            </div>
                            <div class="level-item">
                                <div>
                                    <div class="heading is-6">Referência (R$)</div>
                                    <div class="title is-6">
                                        <fmt:formatNumber
                                                value="${solicitacao.pedido.produtos[0].valorReferencia()}"
                                                type="currency" currencySymbol=""/>
                                    </div>
                                </div>
                            </div>
                            <div class="level-item">
                                <div>
                                    <div class="heading is-6">Quantidade</div>
                                    <div class="title is-6">${solicitacao.pedido.produtos[0].quantidade}</div>
                                </div>
                            </div>
                            <div class="level-item">
                                <div>
                                    <div class="heading is-6">Total (R$)</div>
                                    <div class="title is-6">
                                        <fmt:formatNumber value="${solicitacao.pedido.produtos[0].valorTotal}"
                                                          type="currency" currencySymbol=""/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="column is-6">

                        <%--@elvariable id="alteracaoSolicitacao" type="com.edu.expedicao.application.solicitacao.AlterarSolicitacaoCommand"--%>
                    <form:form class="card"
                               action="${'/solicitacoes/'.concat(solicitacao.id)}"
                               method="post"
                               modelAttribute="alteracaoSolicitacao">

                        <div class="box">
                            <div class="title is-6">Solicitação</div>
                            <div class="columns is-multiline">
                                <div class="column is-12">
                                    <div class="level">
                                        <div class="level-item-left">
                                            <div>
                                                <div class="heading is-6">Data de início</div>
                                                <div class="title is-6">${solicitacao.dataHoraInicioFormatado}</div>
                                            </div>
                                        </div>
                                        <div class="level-item">
                                            <div>
                                                <div class="heading is-6">Status</div>
                                                <c:choose>
                                                    <c:when test="${solicitacao.status.isFinalizador()}">
                                                        <div class="tag has-text-white ${solicitacao.status.cor}">
                                                                ${solicitacao.status.descricao}
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="select ${solicitacao.status.cor}">
                                                            <form:select path="statusCodigo">
                                                                <form:options items="${statuses}"
                                                                              itemValue="codigo"
                                                                              itemLabel="descricao"/>
                                                            </form:select>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="column is-12">
                                    <div class="field">
                                        <div class="heading is-6">Observação</div>
                                        <div class="control">
                                            <form:textarea class="textarea" path="observacao"/>
                                        </div>

                                        <form:errors cssClass="help is-danger" path="observacao"/>
                                    </div>
                                </div>
                            </div>
                            <button class="button is-info is-outlined" type="submit">Salvar</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>

    </layout:put>
</layout:extends>