<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<layout:extends name="/WEB-INF/views/common/template.jsp">
    <layout:put block="body">

        <%--@elvariable id="solicitacao" type="com.edu.expedicao.domain.solicitacao.Solicitacao"--%>
        <div class="container">
            <div class="columns is-multiline">
                <div class="column is-4">
                    <div class="box">
                        <div class="heading">Valor total (R$)</div>
                        <div class="title">${solicitacao.valorTotal}</div>
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
                <div class="column is-6">
                    <div class="card">
                        <div class="card-header">
                            <div class="card-header-title">
                                Revenda
                            </div>
                        </div>
                        <div class="card-content">
                            <div class="level">
                                <div class="level-item-left">
                                    <div>
                                        <div class="heading is-6">Nome</div>
                                        <div class="title is-6">${solicitacao.revenda.nome}</div>
                                    </div>
                                </div>
                                <div class="level-item">
                                    <div>
                                        <div class="heading is-6">CNPJ</div>
                                        <div class="title is-6">${solicitacao.revenda.cnpjFormatado}</div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="column is-6">
                    <form:form class="card" method="post" modelAttribute="solicitacao">
                        <div class="card-header">
                            <div class="card-header-title">
                                Solicitação
                            </div>
                        </div>
                        <div class="card-content">
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
                                                <div class="title is-6">${solicitacao.status.descricao}</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="column is-12">
                                    <div class="field">
                                        <div class="heading is-6">Observação</div>
                                        <div class="control">
                                            <form:textarea class="textarea" path="observacao" placeholder="Cor azul"/>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </form:form>
                </div>
            </div>
        </div>

    </layout:put>
</layout:extends>